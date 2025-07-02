#!/usr/bin/env python3

import requests
import argparse
import json

def get_ton_price(tokens, currencies):
    try:
        url = 'https://tonapi.io/v2/rates'
        params = {
            'tokens': tokens,
            'currencies': currencies
        }
        
        response = requests.get(url, params=params, headers={'accept': 'application/json'})
        
        if response.status_code == 200:
            data = response.json()
            
            token_data = data['rates'].get(tokens.upper(), {})
            if not token_data:
                return json.dumps({
                    "tooltip": f"Error: Token '{tokens}' not found.",
                    "text": "Err"
                    })
            
            currency_price = token_data['prices'].get(currencies.upper(), None)
            
            if currency_price is None:
                return json.dumps({
                    "text": "Err",
                    "tooltip": f"Error: Currency '{currencies}' not found for token '{tokens}'."
                    })
            
            return json.dumps({
                    "text": f"{currency_price:.2f}",
                    "tooltip": f'{tokens.upper()} price in {currencies.upper()}',
                    "class": "normal"
            })
        else:
            return json.dumps({
                    "text": "Err",
                    "tooltip": f"Error: Failed to fetch data. Status code: {response.status_code}"
                    })
    
    except Exception as e:
        return json.dumps({
            "text": "Err",
            "tooltip": f"Error: {str(e)}"
            })

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Get token price from TON API.')
    parser.add_argument('--tokens', type=str, default='TON', help='Token symbol (e.g., TON)')
    parser.add_argument('--currencies', type=str, default='USD', help='Currency symbol (e.g., USD)')
    
    args = parser.parse_args()
    
    print(get_ton_price(args.tokens, args.currencies))

