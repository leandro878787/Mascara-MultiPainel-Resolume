#pragma once
#include <FFGLSDK.h>
#include <ffglex/FFGLShader.h>
#include <ffglex/FFGLScreenQuad.h>
#include <array>

class MascaraMultiPainel final : public CFFGLPlugin {
public:
    MascaraMultiPainel();
    FFResult InitGL(const FFGLViewportStruct* vp) override;
    FFResult ProcessOpenGL(ProcessOpenGLStruct* pGL) override;
    FFResult DeInitGL() override;
    FFResult SetFloatParameter(unsigned int index, float value) override;
    float GetFloatParameter(unsigned int index) override;
private:
    static constexpr unsigned int kPanels = 8;
    float count_ = 5.0f;
    float gap_ = 0.02f;
    float shape_ = 1.0f;
    std::array<float, kPanels> widths_{};
    std::array<float, kPanels> heights_{};
    std::array<float, kPanels> vertical_{};
    ffglex::FFGLShader shader_;
    ffglex::FFGLScreenQuad quad_;
};
