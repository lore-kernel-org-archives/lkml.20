Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32A56510E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968269; cv=none; b=OzSiFr72fUMDqgrjByHg7wh/bkuSoBgOMX1YJZfBxiF0LlgX45e/mi5ENOOxCsTM36AxhpsvArtDTYIpnKNYTq+96TuT4kwixO9qsEm0nabBGgOlm/9rI9Tr11JzX8DSV4DFDwASVtzfFCbj2/cl064uYS5abOyc9/oXUli9HdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968269; c=relaxed/simple;
	bh=muQH5I6ChgHAB1kqWe7eklAj3bIkMv1c/zUd+2HZqUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rj/B19vpR6J5Y09WSQDCZTvBeAgxbuKI5dhOY+SZQ7l+EhmWN/b01DOLPYWMIV/pWDbAbE1KZC5IrZCgaHKUBQ5TI4KXB6HoNSnb8UHW4V8fL5O5iG8VatdWOh/VleTRttdJZfv5BGGhkJjtblGYjja4olxHb9WiUZFbk+66jbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njJ5iq+o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6qYkPmo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njJ5iq+o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6qYkPmo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU1n11809829
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 15:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w7vo1cn+V8k5TLUXvoRE1Wm5
	KpCTbnd+r56DBCfB5wk=; b=njJ5iq+o9y40wjVDL90c3YmEW3k5MD+N5GM2ag8w
	LPcP88sEKs3uQvGkWb7pGX0TC8pDKnQj/+oj7rTMZ3MT4EfQLD2lRcoxkGUDQsWN
	eJPQSvqROhp5fjpg43/C1UneAhDuNRCJbcdWkft+uH+NF5fma3f8rYGmITaHM3/H
	DDkg16nJEADVNCUzdNUGthsqM+YdCUJfvNacojkB2YnabQ9516N2xoTxG5DHnly/
	fMwhmF2ngoyz8AFjc2PJzYKe4RuVEiLi38u1tUw10AeQbu7Le73VvawGR2Ol5TU5
	Xet6gIgutT+LY4P0OJLtvJxzZ6RrXAbA82oYgHnh0hBpNg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj1fuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:37:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b8088203so6558547a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788968264; x=1789573064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w7vo1cn+V8k5TLUXvoRE1Wm5KpCTbnd+r56DBCfB5wk=;
        b=Y6qYkPmobI7q+kRX29wHg4jNXlmlutR92KLFKb7+hWs/Q3m4ADacKxTjvjRUtO2OBU
         V3eRWsEmfPcNGw7X3xTa4jv30+++LPdz7dXyVAEOVHuBrEZTMf4K4mwuZ7Zi2t2ruqo5
         1TnoWJq0FOfvWFVhTbuNGIzMd2/DUoztzBZo1SkYp9Op9yaEQE661z0V8faX3AGtZIaO
         3ytJvSW8ahP5nPWVH9JC+T+JJj/k6pqeQHE0U0wik63r4yLCadyTxjNlHVQuw9yIvC3O
         XYkkJ9VMdVwEaLMHjTHkUUSQ+2pHGfgjtzqUDGHKHFaP95VYQYhiEouY/Sw2ljBWomTz
         KETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968264; x=1789573064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7vo1cn+V8k5TLUXvoRE1Wm5KpCTbnd+r56DBCfB5wk=;
        b=WJzF4d7bAjkjNJN0mKbb25KSUBu14d8rRQRc9g5RcZv2Xy377WXqMTdwDQFDsRvJ5n
         0kVzrMonVHmynxdFeMvBUjKqyufSteEuWIj4KmRIZsjzKu/y9NiUTPBwXGkCkNIZVaF+
         OdqtRuqclW1L6j0ZkIuEdv5oNLKEUCuks4W5N0jUOYcIK65t2BFeH8Mt6HpPMO3HC6JB
         tDpdpzzHP3j3ANaQ6RJjnkYKlK6SrnSl8rkFtOaoBl+uzYVXncXHH55ZhWH86NaanSD4
         J5tEYDytlLZ2OT/pY8ImbjFqprZOPyDRT99XewIpIp1N1wJhDaBxEOd5gggYRHRiegj+
         nRew==
X-Forwarded-Encrypted: i=1; AKwUvBzdh3r2qW/zhWyO/Rn1O4y1WNR0TPMEk5RRwpf/GWcatjwORYf2iqhyZOk2JM2A803GRa0vH0TpRHa+fCg=@vger.kernel.org
X-Gm-Message-State: AFuF++nsvw7+6wgEmmOpO6fqP35MX3zsGFkS1vug1LSrGgT2j2gjjm/h
	/oYOlqeRfrfKtuVHX9SKFTJJisxtQ8BSlpiDKMcEchk40fHqDP/wmSCUpP7xxze3RR6/F22VyGo
	B98tNUTarhqRJhuwpWMLyBoF5IjwzyNFOaidCxV/X5goYoYYLukxnUxubjRnxeEFAIBs=
X-Gm-Gg: AYBFou1+cVWHZrWFRbJEKtrTZQFOi0WZf6zLWjf2c5wTikwL/dqEvHCa0vHIMoaXz1V
	TMtqivmV1yMDJNwKpIzdsc+82NwYpcbTqDkIHmIjiCkjPT8SYM8xFZgWxcby1Q/qsygkvM0ayDm
	zXgGJ+IWefYY4TzNNoRSpIXl3yyM8sYydiC9Ckvsv2FgaK3ntug+9KGNM0jpMgXt4RdopVIxw/2
	UXjDzbP0lEBN5KBTn7flEsc6BO/7w4GwHyhqldDqC8I/YViFXXsSjY0fpf70n+Olb62esyO2sw6
	AMRC7CqYfcW7TTYXUiTgeAQrz3vvvL0etYDh31Ki1pavNBXv0z2Ju9SzZewh6UP1vgjjol6pNtk
	oF46137bZPxJ29nKq7dNXCmftSX74Ig/OkenwK2ntKPA=
X-Received: by 2002:a17:90a:6081:b0:39b:51cc:4586 with SMTP id 98e67ed59e1d1-39b51cc65admr21586942a91.19.1788968263792;
        Wed, 09 Sep 2026 08:37:43 -0700 (PDT)
X-Received: by 2002:a17:90a:6081:b0:39b:51cc:4586 with SMTP id 98e67ed59e1d1-39b51cc65admr21586884a91.19.1788968263083;
        Wed, 09 Sep 2026 08:37:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm44737096eec.12.2026.09.09.08.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:37:42 -0700 (PDT)
Date: Wed, 9 Sep 2026 23:37:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add Nord Ride sound card
 support
Message-ID: <aqF9Pp_U2tAM3xWf@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-5-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-5-997d3b20cf43@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE3NCBTYWx0ZWRfX1gmaau1NxMpP
 15paiLZi+r7odTPcfAU3oFHcgzCkQ16CvvlM3C4d/+8KbwBZIilp7y513zu6NL1VxEmMOtEdXhj
 Rf7KBlM0coHwx082/wAwm+lubWJSF0Y=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa17d49 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4H8KrXRR38DmKUzgn_EA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: wAmlLPAvYznqCvIT4afpUmEB0sAN88QJ
X-Proofpoint-GUID: wAmlLPAvYznqCvIT4afpUmEB0sAN88QJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE3NCBTYWx0ZWRfX5HVYTC5GP1Yl
 VFS+X5FVMxob2ry8sKQLXvy7Im8UdcQp5IYp55f02HM4rBOsiTrlMLwMFbTgO+27l946W85SIv7
 2DM7/qWgmBn/Z0vKskZksa/lnpKbHeseQpYIJcVfdH90AScQNam5TzQ++wZLugZVK4immPv7YsC
 3y60eFomRaftNbR5zsXs+nLP+EzXBpGikidjjUk3lxTS+KAFUj7IfKqvJae94Z6twvBeRdsIpCT
 hgX5XSddn3Mz9LRFqv5P+gUUwMkJ0w87fAaT466XDf7J82S8f3TBoMSb3hw6TigI9Q7WECeFxp5
 +BLgIckzzVv9CStkPKzO/wmONI8t1meNoT3vKSCXZ6pjkr7I93RpJRIOJ4oQ8ZUHtga3pxgRfnT
 VTvIv2dJXljwu+7XIX1bIaTEXSCSFbDeFLgblvF8oPgKIPUnBPC1o3mzfXWiNNT6OWKIa8f6baO
 rr5nwToicsFSfdOK/lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090174

On Mon, Sep 07, 2026 at 11:39:46PM +0530, Mohammad Rafi Shaik wrote:
> Add support for the Nord Ride sound card by introducing a new
> compatible string and associated platform private data.
> 
> Nord uses external audio codecs with interface requirements that
> differ from the generic SC8280XP platforms. Add a dedicated
> hw_params callback to configure the appropriate DAI format for
> playback and capture streams and to program the codec system clock
> configuration required by the board.
> 
> The callback configures the PCM1681 playback path to operate in I2S
> mode and the ADAU1979 capture path to operate in DSP_A mode. For
> capture, the ADAU1979 system clock is sourced from LRCLK as
> required by the hardware design.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 4d48e1012cd4..4d8eafca4b7f 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -18,6 +18,7 @@
>  #include "common.h"
>  #include "sdw.h"
>  
> +#define LRCLK_SYSCLK 1

Rather than open-coding the value, please move

  enum adau1977_clk_id;
  enum adau1977_sysclk_src;

out of sound/soc/codecs/adau1977.h into include/sound/adau1977.h so
machine drivers can include them, and write the call as

  snd_soc_component_set_sysclk(codec_dai->component,
                               ADAU1977_SYSCLK, ADAU1977_SYSCLK_SRC_LRCLK,
                               rate, SND_SOC_CLOCK_IN);

That documents both slots and turns a mix-up into a compile error.

>  #define I2S_MCLKFS 256
>  
>  #define I2S_MCLK_RATE(rate) \
> @@ -72,6 +73,8 @@ struct qcom_snd_soc_common {
>  	bool mi2s_bclk_enable;
>  	bool wcd_jack;
>  	int (*snd_prepare)(struct snd_pcm_substream *substream);
> +	int (*snd_hw_params)(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params);
>  };
>  
>  struct sc8280xp_snd_data {
> @@ -244,6 +247,47 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>  	return 0;
>  }
>  
> +static int nord_snd_hw_params(struct snd_pcm_substream *substream,
> +			      struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int rate = params_rate(params);
> +	int ret;
> +
> +	switch (cpu_dai->id) {
> +	case TERTIARY_MI2S_RX:
> +		ret = snd_soc_dai_set_fmt(codec_dai,
> +					  SND_SOC_DAIFMT_CBC_CFC |
> +					  SND_SOC_DAIFMT_NB_NF |
> +					  SND_SOC_DAIFMT_I2S);
> +		if (ret && ret != -ENOTSUPP)
> +			return ret;
> +
> +		break;
> +	case TERTIARY_TDM_TX_7:
> +		ret = snd_soc_dai_set_fmt(codec_dai,
> +					  SND_SOC_DAIFMT_CBC_CFC |
> +					  SND_SOC_DAIFMT_NB_NF |
> +					  SND_SOC_DAIFMT_DSP_A);
> +		if (ret && ret != -ENOTSUPP)
> +			return ret;
> +
> +		/* adau1979 MCLK sourced from LRCLK */

The comment says MCLK is sourced from LRCLK, but the adau1977_set_sysclk()
call selects the PLL input (ADAU1977_PLL_CLK_S) -- MCLK is the other choice.
Something like "PLL clocked from LRCLK, no external MCLK" would match
the register write?

> +		ret = snd_soc_component_set_sysclk(codec_dai->component,
> +						   0, LRCLK_SYSCLK,
> +						   rate, SND_SOC_CLOCK_IN);

There seems to be two problems, one functional and one cosmetic.

First, I guess this is called too late to have the intended effect. On
the ADAU1977 side, set_sysclk() doesn't only pick the clock source, it
also computes the rate constraint mask:

  } else if (source == ADAU1977_SYSCLK_SRC_LRCLK) {
          mask = ADAU1977_RATE_CONSTRAINT_MASK_LRCLK;
  }
  ...
  adau1977->constraints.mask = mask;

and that mask is consumed in adau1977_startup():

  snd_pcm_hw_constraint_list(substream->runtime, 0,
          SNDRV_PCM_HW_PARAM_RATE, &adau1977->constraints);

startup() runs before hw_params(), so on the first capture open after
boot the mask is still 0 from probe and the rate constraint is not what
the LRCLK-sourced configuration requires. Setting the source once from a
dai_link init (or from a startup callback) rather than per-hw_params
would get the ordering right and also avoid reprogramming the PLL source
on every stream open. Could you confirm what the first arecord after
ot negotiates? I suspect it only appears to work because the rate you
test with is permitted by the unconstrained list anyway.

Second, on the naming. The prototype is

  int snd_soc_component_set_sysclk(struct snd_soc_component *component,
                                   int clk_id, int source,
                                   unsigned int freq, int dir);

so in the call above the literal 0 is the clk_id (ADAU1977_SYSCLK) and
LRCLK_SYSCLK is the source (ADAU1977_SYSCLK_SRC_LRCLK). The macro name
reads like a clk_id, which is the slot it is *not* in, while the argument
that really is a clk_id is an unexplained 0.

> +		if (ret && ret != -ENOTSUPP)
> +			return ret;
> +		break;
> +	default:
> +		break;
> +	};

Stray semicolon

> +
> +	return 0;
> +}
> +
>  static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  				  struct snd_pcm_hw_params *params)
>  {
> @@ -255,6 +299,12 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  	int bclk_freq = sc8280xp_get_bclk_freq(params);
>  	int ret;
>  
> +	if (data->priv->snd_hw_params) {
> +		ret = data->priv->snd_hw_params(substream, params);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	switch (cpu_dai->id) {
>  	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> @@ -461,6 +511,12 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
>  	.wcd_jack = true,
>  };
>  
> +static const struct qcom_snd_soc_common nord_ride_priv_data = {

Again, can we drop "ride" to make it nord specific?

Shawn

> +	.driver_name = "nord",
> +	.mi2s_bclk_enable = true,
> +	.snd_hw_params = nord_snd_hw_params,
> +};
> +
>  static const struct qcom_snd_soc_common qcs9100_priv_data = {
>  	.driver_name = "sa8775p",
>  	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -564,6 +620,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
>  	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
>  	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
> +	{ .compatible = "qcom,nord-ride-sndcard", .data = &nord_ride_priv_data },
>  	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
>  	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
>  	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
> 
> -- 
> 2.34.1
> 
> 
