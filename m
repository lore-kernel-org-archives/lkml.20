Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEA23EBF14
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389958; cv=none; b=StwjrIq2/pSSAfr7yuX0OQHq3qwThzdCIgg0aU7nxv8zbJCa5zmil+luSK2jLi17SmcxVZ1iLb8IlYc1wJVq4H3IXdpZjqGwMyfof/qGtij+14nS5XcLUEtGf+C6gwHxhi2OMmZPNAs+vM6MGN+RHvm84qtozc7HXk5qicSwkCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389958; c=relaxed/simple;
	bh=1GDtDP3OFpq7NJLUmbj/0ID1kjfq8k4ENToZ3o0FA5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ntDhF5RU4ryTGpscARgAfFH8+g8fbx0SnrsInkkSHhsSbsHQjocKoIaeafjmiHowEo8/Gk5kg54nI23PtIRXcN3GY7ixVRcgv55a6U9Pxo0jaJFfr/oPnC+PrSrf0rCqMTO2ER5Qy4ixRZR2HzlNPJ10q7qtx+Ehjk2vdeas5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QnS9yUpa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tykx9q/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QnS9yUpa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tykx9q/g"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmB1p377916
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7KCTyCnAql3eBzhMGVF8+s6B/KLW2Pt7JD9jXvISpw=; b=QnS9yUpa1Xly6lWs
	vWv4Aq2Pc7H4GhHyTWrola0gT6Ig/Zy5N0hgLAkByd9aM3vaZTGlOySe1cYpQKb5
	YYNaxxnTAQxpSTmfMsf6gRpEYsofe/40XNP66Jxw59URBNc7lPz09fKJOax5y4Yf
	BWz1Hre73QPAXtOiBb+PccxtgD2pGSJY9OpaQn2WC2JmJMitek1Oy37A73IeVA9W
	IkANGydE4+PaQKi+M3s1KW3IFFplRcrnK9QdxQt2I9LO4gRFszMNd2r7wtdtQWCj
	c0/ZupjjIGFVX5efegYN0wMII8/Fk12rMxtWVfmhO7b+LZGBixC7Qg4TL6vD7UT0
	C+64JQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8q0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:45:53 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cb2f3c6f7so446438241.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789389952; x=1789994752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7KCTyCnAql3eBzhMGVF8+s6B/KLW2Pt7JD9jXvISpw=;
        b=Tykx9q/ghTBv6GMTp5XRD8w/YoJJtoZOFExofQT9aeJafJu1v8DhPBIlrvpnMpdfOl
         NIQCjeYHB5tGx81zV6p9iL8fgDDwQUVCWqlIhNEwFt7k3aqQ1Uoz777npKwThxPRjeIt
         EwKXyHbJ6AVznlI5rMNPSIsADDDMiKf5XCl8hcBbAtmSiD4kv+bIZy6r3sit5ijj/OzY
         uIahjVuJROCjM3D8VmhCeV1olfabd3tW4SRqLNL7gqAS/AnFBPSlx8vMaAEKvNAgYgCr
         pkPbdyIzNrxtyQ5I84xKby/9G8zvEOzw0jrO08nOUowC68RvQ9eqg4KND/jth57GXM8m
         KFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389952; x=1789994752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7KCTyCnAql3eBzhMGVF8+s6B/KLW2Pt7JD9jXvISpw=;
        b=UbjEJuaHNb/PbThYZgQvrWMa5qqvWEo0DGSEVgjcku/7SaFiCT9FA6KCyrIbv/vGfO
         M47Z7Or9xGCc4JWdvR9f9Ci8V4R0Bvp5e8S5yDIUScvb+23wT692dIl2/GhLjMYT8Gyl
         T24aoxHdNERisAU8T5xBdPBrVpLFSf7sfYc21/6Iv/kIs0ykU0lJZeQPWXoxNkdK0gQW
         URiK3YVIERk+haLtAC3hLWaZikdGYiJN7mIJUKX73jLJrCjhFaSy9w7kVfyon0iZRwWF
         /rFIYjycl3KYabzJHaBMi6JnflmSxP6Ij4s7CUbTrJv8iWZPgj8PqJ5u0ix16OtkxLP6
         7MFA==
X-Forwarded-Encrypted: i=1; AKwUvByxNZHUNSfWVJ3EBgZHefuZr1QC1MM8GtMQQk4RaT4TEaB6PDqgO9MXH5TkHRAoSJR9aXFjSdsUbl4a2W0=@vger.kernel.org
X-Gm-Message-State: AFuF++mp0nednxDbq2YWqIrUNyidqPy2d2v9utikjI+cDD0xMRXdqb2m
	cVh57BvFvU6jRnx1awrk3dHFKufRwaCRnL4s64bnfzOlM08VeLZJy1Uvo+9f3FE3lq66BtB064g
	2MEIW76b+j1qVerHIaNA4kL6kzi8PgwCl2gzJXFm88U1sKxYlYb0mjFLKHQWTik9IOh8=
X-Gm-Gg: AYBFou1BvhTXXuacbpGvAZAAhpNM4oOM4Msng7QzqzUVIpyvxdlKTB7Bz35x9tJgwIc
	JeLOrBfLhbPzV+wTtNDXSz1wgSYHr91h8B9Sfh87EOpHpwbnSgT++aNuu7ZAUhK8Xr3VmKQ34cz
	BzJ5iGK/c5Q4MBcNGupPhZJRhMvVwTFfZXku5qQPcRkah0IEYk3ceSJZdfv9dUjO36mo5D+RsCw
	Iq54KZ9z9odAjkNXjxjHthSvxVw1xMPdL9qbRP8ENZrsyOZzJLAlvW33yKKPwUmXX6CByMXWpEf
	ro1GrRkZ+9sNek/dqtMb+Jc7+QWNefoz4473QjFLIWprC/2o5h826pB2BKanmX9VwtGtL39HNIw
	X2bsXGBzETeYp7iwLF9SSkBBkn1M=
X-Received: by 2002:a05:6122:3382:b0:5c7:a9ee:dcfb with SMTP id 71dfb90a1353d-5c9820c3842mr1704491e0c.5.1789389952071;
        Mon, 14 Sep 2026 05:45:52 -0700 (PDT)
X-Received: by 2002:a05:6122:3382:b0:5c7:a9ee:dcfb with SMTP id 71dfb90a1353d-5c9820c3842mr1704396e0c.5.1789389951547;
        Mon, 14 Sep 2026 05:45:51 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5b8a0471d5bsm2429218e87.61.2026.09.14.05.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:45:50 -0700 (PDT)
Message-ID: <3b22232c-7573-4f09-86d3-21984d5c3a1c@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:45:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone mux support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-6-fdd2129c696c@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-6-fdd2129c696c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX7fvCIByqL3AX
 OHN8pcAzE4XQYKZsf8VovXPIUYGFJAufBAgaGWXwaE3vceECHXW3AqIt2nlzd/MLraTvReLmmIk
 9N6b2N+6wN8nE1jxPJQM6gVuHgXmm8c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX/XOHqz4BBsZl
 T9D5Kno9tZe6BTEEQhm+CV9T5QTWEhGs84HNcGStga5eD5X7EyTuH9zQjWd6s0B3rXIi/FoCKLR
 Pvmt4xGIJlNKxaXGNi21YzX33QhnymoItbhNv3Djcv6UTt8ma41d6UCopWAqd9GbIiBz3vybb52
 z4vtVxs+Qy6svST3ymuwF4F0B5tqabSVKKdRsOJ4oVaumNo0FqJbQel1r3mfpiGYhXsVablMOz3
 qxJy6Zli/PisE4bhyFRRHuIMb4wyDdnQHOWhJWroywt+r8yiiSCQKO3iIO+5nrWzB5fZQ5QD3Q7
 XiETJI7JtNzr9ecy5fFy2n5vjugkRkniPOK4dvMYAcVv+q7JuOd3/Wc2/M5Q9f96Di0R4x4Vwq3
 59Rh5ziVlrXmLKR4rSvhD1wPGPAOfS2N+NtOcawe4wQi4Mc65urJMKLeFicIK87yeyQZapVdETj
 2odjgaGQekl8cukBIZw==
X-Proofpoint-GUID: 76OudB-NKcev7HupmZz4WHBGxlRuPJyL
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7ec81 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DNEr2gOle52aZHLQxwsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 76OudB-NKcev7HupmZz4WHBGxlRuPJyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

On 9/10/26 10:46 AM, Mohammad Rafi Shaik wrote:
> The VA decimators can currently capture audio only from DMIC inputs.
> Add support for routing audio from SoundWire microphone (SMIC) inputs
> as well.
> 
> Update the decimator source selection logic to switch between DMIC and
> SMIC sources based on the active input path.
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
>  sound/soc/codecs/lpass-va-macro.c | 124 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 113 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 8353921f7..46f35a984 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -249,6 +249,7 @@ enum {
>  	VA_MACRO_CLK_DIV_16,
>  };
>  
> +
>  #define VA_NUM_CLKS_MAX		3
>  
>  struct va_macro {
> @@ -756,10 +757,16 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
>  		return -EINVAL;
>  	}
>  
> -	if (val != 0)
> -		snd_soc_component_update_bits(component, mic_sel_reg,
> +	if (val != 0) {
> +		if (strstr(widget->name, "SMIC"))
Where is this widget in this patch, it could be anything which has SMIC.
or either match the full Widget name.

> +			snd_soc_component_update_bits(component, mic_sel_reg,
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC);
> +		else
> +			snd_soc_component_update_bits(component, mic_sel_reg,
>  					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
>  					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
> +	}
>  
>  	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
>  }
> @@ -940,6 +947,16 @@ static int va_macro_enable_dmic(struct snd_soc_dapm_widget *w,
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
>  static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>  			       struct snd_kcontrol *kcontrol, int event)
>  {
> @@ -949,7 +966,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>  	u16 tx_gain_ctl_reg;
>  	u16 adpt_ctrl_reg;
>  	u8 hpf_cut_off_freq;
> -
>  	struct va_macro *va = snd_soc_component_get_drvdata(comp);
>  
>  	decimator = w->shift;
> @@ -980,7 +996,8 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>  		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
>  					      CDC_VA_TX_PATH_CLK_EN_MASK,
>  					      CDC_VA_TX_PATH_CLK_EN);
> -		snd_soc_component_update_bits(comp, hpf_gate_reg,
> +		if (!is_amic_enabled(comp, decimator))
> +			snd_soc_component_update_bits(comp, hpf_gate_reg,
>  					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
>  					      CDC_VA_TX_HPF_ZERO_GATE);
>  
> @@ -994,21 +1011,20 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>  						      CF_MIN_3DB_150HZ << 5);
>  
>  			snd_soc_component_update_bits(comp, hpf_gate_reg,
> -				      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
> -				      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_REQ);
> +					      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
> +					      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_REQ);
>  
>  			/*
>  			 * Minimum 1 clk cycle delay is required as per HW spec
>  			 */
>  			usleep_range(1000, 1010);
>  
> -			snd_soc_component_update_bits(comp,
> -				hpf_gate_reg,
> -				CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
> -				0x0);
> +			if (!is_amic_enabled(comp, decimator))
> +				snd_soc_component_update_bits(comp, hpf_gate_reg,
> +						      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
> +						      0x0);
>  		}
>  
> -
>  		usleep_range(1000, 1010);
>  		snd_soc_component_update_bits(comp, hpf_gate_reg,
>  					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
> @@ -1208,6 +1224,39 @@ static const char * const adc_mux_text[] = {
>  	"VA_DMIC", "SWR_MIC"
>  };
>  
> +static const char * const smic_mux_text[] = {
> +	"ZERO", "SWR_MIC0", "SWR_MIC1", "SWR_MIC2", "SWR_MIC3",
> +	"SWR_MIC4", "SWR_MIC5", "SWR_MIC6", "SWR_MIC7"
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
> @@ -1343,6 +1392,11 @@ static const struct snd_soc_dapm_widget va_macro_dapm_widgets[] = {
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
> @@ -1397,6 +1451,14 @@ static const struct snd_soc_dapm_widget va_macro_dapm_widgets[] = {
>  	SND_SOC_DAPM_INPUT("VA SWR_MIC5"),
>  	SND_SOC_DAPM_INPUT("VA SWR_MIC6"),
>  	SND_SOC_DAPM_INPUT("VA SWR_MIC7"),
> +	SND_SOC_DAPM_INPUT("VA SWR_INPUT0"),
> +	SND_SOC_DAPM_INPUT("VA SWR_INPUT1"),
> +	SND_SOC_DAPM_INPUT("VA SWR_INPUT2"),
> +	SND_SOC_DAPM_INPUT("VA SWR_INPUT3"),
> +	SND_SOC_DAPM_INPUT("VA SWR_INPUT4"),
> +	SND_SOC_DAPM_INPUT("VA SWR_INPUT5"),
> +	SND_SOC_DAPM_INPUT("VA SWR_INPUT6"),
> +	SND_SOC_DAPM_INPUT("VA SWR_INPUT7"),

Why not use exising SWR_MICx's ?


>  
>  	SND_SOC_DAPM_MUX_E("VA DEC0 MUX", SND_SOC_NOPM, VA_MACRO_DEC0, 0,
>  			   &va_dec0_mux, va_macro_enable_dec,
> @@ -1487,6 +1549,46 @@ static const struct snd_soc_dapm_route va_audio_map[] = {
>  	{"VA DMIC MUX3", "DMIC6", "VA DMIC6"},
>  	{"VA DMIC MUX3", "DMIC7", "VA DMIC7"},
>  
> +	{"VA DEC0 MUX", "SWR_MIC", "VA SMIC MUX0"},
> +	{"VA SMIC MUX0", "SWR_MIC0", "VA SWR_INPUT0"},
> +	{"VA SMIC MUX0", "SWR_MIC1", "VA SWR_INPUT1"},
> +	{"VA SMIC MUX0", "SWR_MIC2", "VA SWR_INPUT2"},
> +	{"VA SMIC MUX0", "SWR_MIC3", "VA SWR_INPUT3"},
> +	{"VA SMIC MUX0", "SWR_MIC4", "VA SWR_INPUT4"},
> +	{"VA SMIC MUX0", "SWR_MIC5", "VA SWR_INPUT5"},
> +	{"VA SMIC MUX0", "SWR_MIC6", "VA SWR_INPUT6"},
> +	{"VA SMIC MUX0", "SWR_MIC7", "VA SWR_INPUT7"},
> +
> +	{"VA DEC1 MUX", "SWR_MIC", "VA SMIC MUX1"},
> +	{"VA SMIC MUX1", "SWR_MIC0", "VA SWR_INPUT0"},
> +	{"VA SMIC MUX1", "SWR_MIC1", "VA SWR_INPUT1"},
> +	{"VA SMIC MUX1", "SWR_MIC2", "VA SWR_INPUT2"},
> +	{"VA SMIC MUX1", "SWR_MIC3", "VA SWR_INPUT3"},
> +	{"VA SMIC MUX1", "SWR_MIC4", "VA SWR_INPUT4"},
> +	{"VA SMIC MUX1", "SWR_MIC5", "VA SWR_INPUT5"},
> +	{"VA SMIC MUX1", "SWR_MIC6", "VA SWR_INPUT6"},
> +	{"VA SMIC MUX1", "SWR_MIC7", "VA SWR_INPUT7"},
> +
> +	{"VA DEC2 MUX", "SWR_MIC", "VA SMIC MUX2"},
> +	{"VA SMIC MUX2", "SWR_MIC0", "VA SWR_INPUT0"},
> +	{"VA SMIC MUX2", "SWR_MIC1", "VA SWR_INPUT1"},
> +	{"VA SMIC MUX2", "SWR_MIC2", "VA SWR_INPUT2"},
> +	{"VA SMIC MUX2", "SWR_MIC3", "VA SWR_INPUT3"},
> +	{"VA SMIC MUX2", "SWR_MIC4", "VA SWR_INPUT4"},
> +	{"VA SMIC MUX2", "SWR_MIC5", "VA SWR_INPUT5"},
> +	{"VA SMIC MUX2", "SWR_MIC6", "VA SWR_INPUT6"},
> +	{"VA SMIC MUX2", "SWR_MIC7", "VA SWR_INPUT7"},
> +
> +	{"VA DEC3 MUX", "SWR_MIC", "VA SMIC MUX3"},
> +	{"VA SMIC MUX3", "SWR_MIC0", "VA SWR_INPUT0"},
> +	{"VA SMIC MUX3", "SWR_MIC1", "VA SWR_INPUT1"},
> +	{"VA SMIC MUX3", "SWR_MIC2", "VA SWR_INPUT2"},
> +	{"VA SMIC MUX3", "SWR_MIC3", "VA SWR_INPUT3"},
> +	{"VA SMIC MUX3", "SWR_MIC4", "VA SWR_INPUT4"},
> +	{"VA SMIC MUX3", "SWR_MIC5", "VA SWR_INPUT5"},
> +	{"VA SMIC MUX3", "SWR_MIC6", "VA SWR_INPUT6"},
> +	{"VA SMIC MUX3", "SWR_MIC7", "VA SWR_INPUT7"},
> +
>  	{ "VA DMIC0", NULL, "DMIC0 Pin" },
>  	{ "VA DMIC1", NULL, "DMIC1 Pin" },
>  	{ "VA DMIC2", NULL, "DMIC2 Pin" },
> 

