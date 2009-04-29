use inc::Module::Install 0.72;

if ( -e 'MANIFEST.SKIP' ) {
    system( 'pod2text lib/Catalyst/Action/RenderView.pm > README' );
}

name 'Catalyst-Action-RenderView';
all_from 'lib/Catalyst/Action/RenderView.pm';

requires 'Catalyst::Runtime' => '5.70';
requires 'Test::More';
requires 'Data::Visitor' => '0.24';
requires 'MRO::Compat';

test_requires 'HTTP::Request::AsCGI';

auto_install;
WriteAll;
