sub asy {return system("asy -o '$_[0]' '$_[0]'");}
add_cus_dep("asy","eps",0,"asy");
add_cus_dep("asy","pdf",0,"asy");
add_cus_dep("asy","tex",0,"asy");
push @generated_exts, "pre", "%R-[0-9]*.pdf", "%R-[0-9]*.prc", "%R-[0-9]*.tex", "%R-[0-9]*.out", "%R-[0-9]*.pbsdat", "%R.pbsdat", "%R-[0-9]*.eps", "%R-*.asy";

$pdf_mode = 4;

$rc_report = 0;

$pdf_previewer = 'start zathura';

$do_cd = 1;

$aux_dir = "aux";
$bibtex = 1;
$silent = 1;
$cleanup_includes_cusdep_generated = 1;
@generated_exts = ( 'aux', 'bbl', 'bcf', 'fls', 'idx', 'ind', 'lof',
                    'lot', 'out', 'pre', 'toc', 'nav', 'snm',
                    'synctex.gz', 'pytxpyg', 'pytxmcr', 'pytxcode',);
