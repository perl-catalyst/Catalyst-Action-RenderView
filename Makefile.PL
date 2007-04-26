use inc::Module::Install 0.65;

name 'Catalyst-Action-RenderView';
all_from 'lib/Catalyst/Action/RenderView.pm';

requires 'Catalyst::Runtime' => '5.70';
requires 'Test::More';

auto_install;
WriteAll;
