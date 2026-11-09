Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237824;
	b=biAI/oVLtOGEKFDhbVVr6mv0AtBS1NuDFAulmejqfaHH8VWJ7Nt1ap25c45qrL3TlCfq
	 jghclCK6JuoswQsXoTFu4eyrRKuOXuA0sBwWvyJEyW7ur/HyxsuZeDLz1XT08ZMW8krPs
	 Zb5ynrLSHgSzkMwNMhEzTMvp8EqoegHGXT03qS2kFuMACK3z61qQx08WwYU6E6/KPHhps
	 sh9JWeD8OZ264a8eqa4bUSpnNAvAeOWtQaNc0fx2aC+vxq9Be0C5T15aXr/CqnehK5jHu
	 nDh7AVEcPJiacAksR0D7gvlifGbHMOXMTZaMpGhbhovfo/GRa27DbXwmynPdOWpIwzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237824;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LYhCNgLdezCmiQtRdGUAuGXeiIAQRWnsak26kG4ikkU=;
	b=UubAT2Y5rN4Fzqu5O0DRfkaGNl7PLUOEPLe3hvF/Bhm2ATXIwZ6VRAlyMksvM5OtmLKp
	 h4EKa7wOEwiO6B4fkyy6E/h0svEqacQacu5pDGJ1dbIegXntbIWmBK4ssBjBH4oAxGxso
	 pfJM0UyIOuAt1Sw/xHjjQIMStbm3fKY0Kgof8WRe83CkNEsj6wbvd0+frs4NXXsD4KQ3k
	 Ay/gbFC4Pm9SgBI1B6yMV67ySUSpQ+tdxIiXR/yFa32+23mQwA/ByPCybAlWJmThtV4/T
	 0igzeu0e6bPbNAiplI5vTv5ltidd0YRA3t7YSl4mRDs+0DshZFowq5xEIjIFpI1ZJXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lANC8zXP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39189606A321;
	Mon,  9 Nov 2026 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lANC8zXP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DDF1F0089F;
	Mon,  9 Nov 2026 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794237824;
	bh=LYhCNgLdezCmiQtRdGUAuGXeiIAQRWnsak26kG4ikkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lANC8zXPYCmVKBXQleZvG9jyEfrO3e8M3ADEGPRb3CffxcjQuPTYmfP4Pbnn1LKTa
	 FHRShxovirrwAjLLRWG+KBuzLbXpiYzeHi+YoS2XhWazRUF+JulNDjY3ESamprKDGC
	 2AIIW4HZ9Usyo4nGg/stF/Q4Y+ZbbTqtzHrAlqdgfGm6CG8IrDCVzH3u6Q4/yweVMs
	 pVT0e0X8MWKw5tBKUdMK4zT3ufJNcsQFzspbHgyNYh+FlOG4qn+Ofc9lNb+BdUGskW
	 o4z5pfSjQtEg59N0C6ZDg3DhbwwFamLNyUhirrN32AHK+wtGXHxPllnNGRRp0on6pM
	 5sOFnRspNsV1w==
Message-ID: <f1fa6cd5-3e76-4033-80f3-0233975207ab@kernel.org>
Date: Mon, 9 Nov 2026 15:23:39 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 v6 5/9] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-5-2cda302237cc@oss.qualcomm.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261106-add_shikra_support-v6-5-2cda302237cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/26 12:33 PM, Mohammad Rafi Shaik wrote:
> The VA decimators can currently capture audio only from DMIC inputs.
> Add support for routing audio from SoundWire microphone (SMIC) inputs
> as well.
> 
> Update the decimator source selection logic to switch between DMIC and
> SMIC sources based on the active input path.
> 
> The ADC_DMIC_SEL bit of CDC_VA_TXn_TX_PATH_CFG0 is shared by the DMIC and
> the SoundWire mic mux, so a mixer write to the mux that is not part of the
> active path can leave it stale. Program it from the resolved mux state
> when the decimator is enabled, so capture does not depend on the order in
> which userspace restores the two controls.
> 
> Add a helper to detect whether a decimator is using a SoundWire microphone
> input. Use this information to skip DMIC-specific HPF programming sequences
> when the decimator is configured for an SMIC source.
> 
> This enables VA decimators to capture audio from either DMIC or SoundWire
> microphone inputs.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

lgtm,

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
>  sound/soc/codecs/lpass-va-macro.c | 154 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 147 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index db395674312c..a11347404058 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -754,6 +754,16 @@ static int va_macro_mclk_event(struct snd_soc_dapm_widget *w,
>  	return 0;
>  }
>  
> +static bool is_amic_enabled(struct snd_soc_component *comp, int decimator)
> +{
> +	u16 adc_mux_reg;
> +
> +	adc_mux_reg = CDC_VA_INP_MUX_ADC_MUX0_CFG1 +
> +		      VA_MACRO_ADC_MUX_CFG_OFFSET * decimator;
> +
> +	return snd_soc_component_read(comp, adc_mux_reg) & BIT(0);
> +}
> +
>  static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
>  				 struct snd_ctl_elem_value *ucontrol)
>  {
> @@ -763,20 +773,26 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
>  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
>  	unsigned int val;
>  	u16 mic_sel_reg;
> +	int decimator;
> +	bool smic_mux;
>  
>  	val = ucontrol->value.enumerated.item[0];
>  
>  	switch (e->reg) {
>  	case CDC_VA_INP_MUX_ADC_MUX0_CFG0:
> +		decimator = 0;
>  		mic_sel_reg = CDC_VA_TX0_TX_PATH_CFG0;
>  		break;
>  	case CDC_VA_INP_MUX_ADC_MUX1_CFG0:
> +		decimator = 1;
>  		mic_sel_reg = CDC_VA_TX1_TX_PATH_CFG0;
>  		break;
>  	case CDC_VA_INP_MUX_ADC_MUX2_CFG0:
> +		decimator = 2;
>  		mic_sel_reg = CDC_VA_TX2_TX_PATH_CFG0;
>  		break;
>  	case CDC_VA_INP_MUX_ADC_MUX3_CFG0:
> +		decimator = 3;
>  		mic_sel_reg = CDC_VA_TX3_TX_PATH_CFG0;
>  		break;
>  	default:
> @@ -785,10 +801,24 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
>  		return -EINVAL;
>  	}
>  
> -	if (val != 0)
> +	/*
> +	 * SMIC enums use shift 0 (lower nibble of CFG0), DMIC enums use
> +	 * shift 4 (upper nibble of CFG0). Use e->shift_l to distinguish them
> +	 * without relying on widget name comparisons.
> +	 */
> +	smic_mux = (e->shift_l == 0);
> +
> +	/*
> +	 * Both muxes feed the same decimator and share ADC_DMIC_SEL, so only
> +	 * the one the decimator is routed through may program it. A write to
> +	 * the mux that is not part of the active path would otherwise switch
> +	 * the input domain of a running capture.
> +	 */
> +	if (val != 0 && smic_mux == is_amic_enabled(component, decimator))
>  		snd_soc_component_update_bits(component, mic_sel_reg,
>  					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> -					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
> +					      smic_mux ? CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
> +							 CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
>  
>  	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
>  }
> @@ -978,7 +1008,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>  	u16 tx_gain_ctl_reg;
>  	u16 adpt_ctrl_reg;
>  	u8 hpf_cut_off_freq;
> -
>  	struct va_macro *va = snd_soc_component_get_drvdata(comp);
>  
>  	decimator = w->shift;
> @@ -995,6 +1024,18 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>  
>  	switch (event) {
>  	case SND_SOC_DAPM_PRE_PMU:
> +		/*
> +		 * ADC_DMIC_SEL is shared by the DMIC and the SoundWire mic
> +		 * mux, so its value depends on the order in which userspace
> +		 * restores the two controls. Program it from the resolved
> +		 * mux state of this decimator, which is what selects the
> +		 * input domain.
> +		 */
> +		snd_soc_component_update_bits(comp, dec_cfg_reg,
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> +					      is_amic_enabled(comp, decimator) ?
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
>  		snd_soc_component_update_bits(comp,
>  			dec_cfg_reg, CDC_VA_ADC_MODE_MASK,
>  			va->dec_mode[decimator] << CDC_VA_ADC_MODE_SHIFT);
> @@ -1009,9 +1050,15 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>  		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
>  					      CDC_VA_TX_PATH_CLK_EN_MASK,
>  					      CDC_VA_TX_PATH_CLK_EN);
> -		snd_soc_component_update_bits(comp, hpf_gate_reg,
> -					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
> -					      CDC_VA_TX_HPF_ZERO_GATE);
> +		/*
> +		 * Only the HPF zero gate assertion is specific to the DMIC
> +		 * path; the cutoff programming and the gate release below
> +		 * apply to both input domains.
> +		 */
> +		if (!is_amic_enabled(comp, decimator))
> +			snd_soc_component_update_bits(comp, hpf_gate_reg,
> +						      CDC_VA_TX_HPF_ZERO_GATE_MASK,
> +						      CDC_VA_TX_HPF_ZERO_GATE);
>  
>  		usleep_range(1000, 1010);
>  		hpf_cut_off_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
> @@ -1037,7 +1084,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>  				0x0);
>  		}
>  
> -
>  		usleep_range(1000, 1010);
>  		snd_soc_component_update_bits(comp, hpf_gate_reg,
>  					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
> @@ -1237,6 +1283,39 @@ static const char * const adc_mux_text[] = {
>  	"VA_DMIC", "SWR_MIC"
>  };
>  
> +static const char * const smic_mux_text[] = {
> +	"ZERO", "ADC0", "ADC1", "ADC2", "ADC3", "SWR_MIC0", "SWR_MIC1",
> +	"SWR_MIC2", "SWR_MIC3", "SWR_MIC4", "SWR_MIC5", "SWR_MIC6", "SWR_MIC7"
> +};
> +
> +static SOC_ENUM_SINGLE_DECL(va_smic0_enum, CDC_VA_INP_MUX_ADC_MUX0_CFG0,
> +			0, smic_mux_text);
> +
> +static SOC_ENUM_SINGLE_DECL(va_smic1_enum, CDC_VA_INP_MUX_ADC_MUX1_CFG0,
> +			0, smic_mux_text);
> +
> +static SOC_ENUM_SINGLE_DECL(va_smic2_enum, CDC_VA_INP_MUX_ADC_MUX2_CFG0,
> +			0, smic_mux_text);
> +
> +static SOC_ENUM_SINGLE_DECL(va_smic3_enum, CDC_VA_INP_MUX_ADC_MUX3_CFG0,
> +			0, smic_mux_text);
> +
> +static const struct snd_kcontrol_new va_smic0_mux = SOC_DAPM_ENUM_EXT("va_smic0",
> +			 va_smic0_enum, snd_soc_dapm_get_enum_double,
> +			 va_macro_put_dec_enum);
> +
> +static const struct snd_kcontrol_new va_smic1_mux = SOC_DAPM_ENUM_EXT("va_smic1",
> +			 va_smic1_enum, snd_soc_dapm_get_enum_double,
> +			 va_macro_put_dec_enum);
> +
> +static const struct snd_kcontrol_new va_smic2_mux = SOC_DAPM_ENUM_EXT("va_smic2",
> +			 va_smic2_enum, snd_soc_dapm_get_enum_double,
> +			 va_macro_put_dec_enum);
> +
> +static const struct snd_kcontrol_new va_smic3_mux = SOC_DAPM_ENUM_EXT("va_smic3",
> +			 va_smic3_enum, snd_soc_dapm_get_enum_double,
> +			 va_macro_put_dec_enum);
> +
>  static SOC_ENUM_SINGLE_DECL(va_dec0_enum, CDC_VA_INP_MUX_ADC_MUX0_CFG1,
>  		   0, adc_mux_text);
>  static SOC_ENUM_SINGLE_DECL(va_dec1_enum, CDC_VA_INP_MUX_ADC_MUX1_CFG1,
> @@ -1372,6 +1451,11 @@ static const struct snd_soc_dapm_widget va_macro_dapm_widgets[] = {
>  	SND_SOC_DAPM_MUX("VA DMIC MUX2", SND_SOC_NOPM, 0, 0, &va_dmic2_mux),
>  	SND_SOC_DAPM_MUX("VA DMIC MUX3", SND_SOC_NOPM, 0, 0, &va_dmic3_mux),
>  
> +	SND_SOC_DAPM_MUX("VA SMIC MUX0", SND_SOC_NOPM, 0, 0, &va_smic0_mux),
> +	SND_SOC_DAPM_MUX("VA SMIC MUX1", SND_SOC_NOPM, 0, 0, &va_smic1_mux),
> +	SND_SOC_DAPM_MUX("VA SMIC MUX2", SND_SOC_NOPM, 0, 0, &va_smic2_mux),
> +	SND_SOC_DAPM_MUX("VA SMIC MUX3", SND_SOC_NOPM, 0, 0, &va_smic3_mux),
> +
>  	SND_SOC_DAPM_REGULATOR_SUPPLY("vdd-micb", 0, 0),
>  	SND_SOC_DAPM_INPUT("DMIC0 Pin"),
>  	SND_SOC_DAPM_INPUT("DMIC1 Pin"),
> @@ -1516,6 +1600,62 @@ static const struct snd_soc_dapm_route va_audio_map[] = {
>  	{"VA DMIC MUX3", "DMIC6", "VA DMIC6"},
>  	{"VA DMIC MUX3", "DMIC7", "VA DMIC7"},
>  
> +	{"VA DEC0 MUX", "SWR_MIC", "VA SMIC MUX0"},
> +	{"VA SMIC MUX0", "ADC0", "VA SWR_ADC0"},
> +	{"VA SMIC MUX0", "ADC1", "VA SWR_ADC1"},
> +	{"VA SMIC MUX0", "ADC2", "VA SWR_ADC2"},
> +	{"VA SMIC MUX0", "ADC3", "VA SWR_ADC3"},
> +	{"VA SMIC MUX0", "SWR_MIC0", "VA SWR_MIC0"},
> +	{"VA SMIC MUX0", "SWR_MIC1", "VA SWR_MIC1"},
> +	{"VA SMIC MUX0", "SWR_MIC2", "VA SWR_MIC2"},
> +	{"VA SMIC MUX0", "SWR_MIC3", "VA SWR_MIC3"},
> +	{"VA SMIC MUX0", "SWR_MIC4", "VA SWR_MIC4"},
> +	{"VA SMIC MUX0", "SWR_MIC5", "VA SWR_MIC5"},
> +	{"VA SMIC MUX0", "SWR_MIC6", "VA SWR_MIC6"},
> +	{"VA SMIC MUX0", "SWR_MIC7", "VA SWR_MIC7"},
> +
> +	{"VA DEC1 MUX", "SWR_MIC", "VA SMIC MUX1"},
> +	{"VA SMIC MUX1", "ADC0", "VA SWR_ADC0"},
> +	{"VA SMIC MUX1", "ADC1", "VA SWR_ADC1"},
> +	{"VA SMIC MUX1", "ADC2", "VA SWR_ADC2"},
> +	{"VA SMIC MUX1", "ADC3", "VA SWR_ADC3"},
> +	{"VA SMIC MUX1", "SWR_MIC0", "VA SWR_MIC0"},
> +	{"VA SMIC MUX1", "SWR_MIC1", "VA SWR_MIC1"},
> +	{"VA SMIC MUX1", "SWR_MIC2", "VA SWR_MIC2"},
> +	{"VA SMIC MUX1", "SWR_MIC3", "VA SWR_MIC3"},
> +	{"VA SMIC MUX1", "SWR_MIC4", "VA SWR_MIC4"},
> +	{"VA SMIC MUX1", "SWR_MIC5", "VA SWR_MIC5"},
> +	{"VA SMIC MUX1", "SWR_MIC6", "VA SWR_MIC6"},
> +	{"VA SMIC MUX1", "SWR_MIC7", "VA SWR_MIC7"},
> +
> +	{"VA DEC2 MUX", "SWR_MIC", "VA SMIC MUX2"},
> +	{"VA SMIC MUX2", "ADC0", "VA SWR_ADC0"},
> +	{"VA SMIC MUX2", "ADC1", "VA SWR_ADC1"},
> +	{"VA SMIC MUX2", "ADC2", "VA SWR_ADC2"},
> +	{"VA SMIC MUX2", "ADC3", "VA SWR_ADC3"},
> +	{"VA SMIC MUX2", "SWR_MIC0", "VA SWR_MIC0"},
> +	{"VA SMIC MUX2", "SWR_MIC1", "VA SWR_MIC1"},
> +	{"VA SMIC MUX2", "SWR_MIC2", "VA SWR_MIC2"},
> +	{"VA SMIC MUX2", "SWR_MIC3", "VA SWR_MIC3"},
> +	{"VA SMIC MUX2", "SWR_MIC4", "VA SWR_MIC4"},
> +	{"VA SMIC MUX2", "SWR_MIC5", "VA SWR_MIC5"},
> +	{"VA SMIC MUX2", "SWR_MIC6", "VA SWR_MIC6"},
> +	{"VA SMIC MUX2", "SWR_MIC7", "VA SWR_MIC7"},
> +
> +	{"VA DEC3 MUX", "SWR_MIC", "VA SMIC MUX3"},
> +	{"VA SMIC MUX3", "ADC0", "VA SWR_ADC0"},
> +	{"VA SMIC MUX3", "ADC1", "VA SWR_ADC1"},
> +	{"VA SMIC MUX3", "ADC2", "VA SWR_ADC2"},
> +	{"VA SMIC MUX3", "ADC3", "VA SWR_ADC3"},
> +	{"VA SMIC MUX3", "SWR_MIC0", "VA SWR_MIC0"},
> +	{"VA SMIC MUX3", "SWR_MIC1", "VA SWR_MIC1"},
> +	{"VA SMIC MUX3", "SWR_MIC2", "VA SWR_MIC2"},
> +	{"VA SMIC MUX3", "SWR_MIC3", "VA SWR_MIC3"},
> +	{"VA SMIC MUX3", "SWR_MIC4", "VA SWR_MIC4"},
> +	{"VA SMIC MUX3", "SWR_MIC5", "VA SWR_MIC5"},
> +	{"VA SMIC MUX3", "SWR_MIC6", "VA SWR_MIC6"},
> +	{"VA SMIC MUX3", "SWR_MIC7", "VA SWR_MIC7"},
> +
>  	{ "VA DMIC0", NULL, "DMIC0 Pin" },
>  	{ "VA DMIC1", NULL, "DMIC1 Pin" },
>  	{ "VA DMIC2", NULL, "DMIC2 Pin" },
> 

