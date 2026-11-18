$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$sdk = Join-Path $root 'vendor\ffgl'
$template = Join-Path $sdk 'build\windows\Gradient.vcxproj'
if (!(Test-Path $template)) { throw "Projeto modelo do SDK não encontrado: $template" }
$project = Get-Content -Raw $template
$project = $project.Replace('..\..\..\source\common', '..\vendor\ffgl\source\common')
$project = $project.Replace('..\..\source', '..\vendor\ffgl\source')
$project = $project.Replace('..\..\deps', '..\vendor\ffgl\deps')
$project = $project.Replace('..\..\binaries\$(PlatformTarget)\$(Configuration)\', 'bin\$(Configuration)\')
$project = $project.Replace('$(PlatformTarget)\$(Configuration)\$(ProjectName)\', 'obj\$(Configuration)\')
$project = $project.Replace('..\vendor\ffgl\source\plugins\Gradients\FFGLGradients.cpp', '..\src\MascaraMultiPainel.cpp')
$project = $project.Replace('..\vendor\ffgl\source\plugins\Gradients\FFGLGradients.h', '..\src\MascaraMultiPainel.h')
$project = $project.Replace('ModuleDefinitionFile>FFGLPlugins.def', 'ModuleDefinitionFile>..\vendor\ffgl\build\windows\FFGLPlugins.def')
$project = $project.Replace('Gradient', 'Mascara-MultiPainel')
$project = $project.Replace('FFGLGradients', 'MascaraMultiPainel')
$project = $project.Replace('AVFFGLADDSUBTRACT_EXPORTS', 'MASCARAMULTIPAINEL_EXPORTS')
$project = $project.Replace('v142', 'v143')
$project = $project.Replace('<ConfigurationType>DynamicLibrary</ConfigurationType>', '<ConfigurationType>DynamicLibrary</ConfigurationType><TargetName>Mascara-MultiPainel-Resolume</TargetName>')
$project = $project.Replace('<PrecompiledHeader>', '<LanguageStandard>stdcpp17</LanguageStandard><PrecompiledHeader>')
$out = Join-Path $root 'build\Mascara-MultiPainel.vcxproj'
$project | Set-Content -Encoding utf8 $out
