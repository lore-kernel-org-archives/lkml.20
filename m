Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237336;
	b=oZWWhJjqtT8LrZNoSgFhwqcayR1JAf0wH4ln+3GpWWq8irEP8HTa6Y/16ihbiN8n/euA
	 RApsrX6seRFSRQKRead8xBNvNBNXWcOENlMcA5pFsgp6vtCql0jMpafbtmQR/VZYm/+g+
	 YaLP+wEzFHJW8FCwVr9VYEEOf6AvNWNKB7KxfDvQW9tTRFVtKUYXc36Ke/XKBmWl1y9wb
	 8PNKkcrvFd1SyJ6OcLnBmYJjbSToyheoCt8fFYqicUjXAx561GSUeC+FfukPr1ieBFTWK
	 Dq502wZHCiZjJvYFo+89eLBEd8FKnz8GGY3hwZZkhD9dUCgm950B+Zns+LgoAK9wWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237336;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5XMjs81cwwebad2l/0/G1kSqG6DSPbx7k/K5ppMrACc=;
	b=d7WR9dEzUEbkAl8K5YiMD/khCJhx8Fo6NctdmjHiOyS0/GPHHzs49Oa2TLABDUCtwlnz
	 H5FJlLn7i43JblCCeRDMXhe6FFNPJf8kU3f9wiyh34dCQxSIHDlq6tRLHy6n1a5awrSwj
	 ha+ZoIwRBjojNQcD1Hzq84p2k+BTJXfIG9JgYVvAuJO8llDTNMaFKePhuWcneKmD9yxRM
	 x+5QVxtFUTB8kXZyyzs5OtUbqc1N68ZfSD5hFY1aQTdSaXnCKvH2pYmgkHLn1ep138wxA
	 apSw8fTHwMIEnWphh0coREw78T7Ce2a2aWyNMZJFEdrgTvc0e1Kxj20H02/5g3qkjiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B8f8wn6E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47F0606A31C;
	Mon,  9 Nov 2026 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B8f8wn6E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4A01F0089F;
	Mon,  9 Nov 2026 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794237335;
	bh=5XMjs81cwwebad2l/0/G1kSqG6DSPbx7k/K5ppMrACc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=B8f8wn6EGcaPgbFkwh6lbFDJmPHUcDGKBWQnE821H4mxH94kWWQ70wKTZrTQDy1EM
	 paputTixCpRd7qtDHlWeAcaPn0EkWecWXfsHiTED5ViYWDFQlXk+QlxQl1+icwUPAo
	 sOTL9PGG326CG+lkiUfH17LKqYwWye9h8Zp4NDtLwvy8mMRLWhohq5r9+5byIac618
	 qb+DixpKOCUonlAYkYJiiPk/qBLmPKGRanSYTELFgnAM2aTlW2lswvfDgwxtNiUtg6
	 XCZDvAXog24/rceQEG+pxJwhmdY0p3QehtwYiZUau0Pbyj2qOKGK7LyH/yzZ1vG6iu
	 ksK1vfdjB2JBg==
Message-ID: <c1dc47d0-676e-4b88-b904-34d193e61808@kernel.org>
Date: Mon, 9 Nov 2026 15:15:27 +0000
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
Subject: Re: [PATCH v6 v6 3/9] ASoC: qcom: lpass-rx-macro: Add shikra
 compatible
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-3-2cda302237cc@oss.qualcomm.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261106-add_shikra_support-v6-3-2cda302237cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/26 12:33 PM, Mohammad Rafi Shaik wrote:
> Add shikra RX macro compatible data and hook it into the LPASS codec
> v4.1 flow.
> 
> The RX macro register layout of LPASS codec v4.1 matches the v2.5+
> layout, so reuse the existing v2.5 register access helpers, controls
> and widgets for it.
> 
> v4.1 additionally requires the FS counter to be bypassed before it is
> enabled during MCLK enable. This is a property of the codec version and
> not of the board, so key it off the version detected by the VA macro
> rather than off match data.
> 
> Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/codecs/lpass-macro-common.h |  3 +++
>  sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index 573b2145e1c4..b52665b11e35 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -30,6 +30,7 @@ enum lpass_codec_version {
>  	LPASS_CODEC_VERSION_2_7,
>  	LPASS_CODEC_VERSION_2_8,
>  	LPASS_CODEC_VERSION_2_9,
> +	LPASS_CODEC_VERSION_4_1,
>  };
>  
>  struct lpass_macro {
> @@ -70,6 +71,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
>  		return "v2.8";
>  	case LPASS_CODEC_VERSION_2_9:
>  		return "v2.9";
> +	case LPASS_CODEC_VERSION_4_1:
> +		return "v4.1";
>  	default:
>  		break;
>  	}
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index c59c746fb638..5fe06ce6b960 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -60,6 +60,7 @@
>  #define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
>  #define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
>  #define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
> +#define CDC_RX_FS_CNT_BYPASS		BIT(7)
>  #define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
>  #define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
>  #define CDC_RX_SWR_RESET_MASK		BIT(1)
> @@ -652,6 +653,7 @@ struct rx_macro {
>  	bool is_ear_mode_on;
>  	bool hph_pwr_mode;
>  	bool hph_hd2_mode;
> +	bool fs_cnt_bypass;
>  	struct snd_soc_component *component;
>  	unsigned long active_ch_mask[RX_MACRO_MAX_DAIS];
>  	unsigned long active_ch_cnt[RX_MACRO_MAX_DAIS];
> @@ -1613,6 +1615,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>  	case LPASS_CODEC_VERSION_2_6:
>  	case LPASS_CODEC_VERSION_2_7:
>  	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>  		return rx_2_5_is_rw_register(dev, reg);
>  	default:
>  		break;
> @@ -2045,6 +2048,11 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
>  					   CDC_RX_CLK_MCLK2_ENABLE);
>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
> +
> +			if (rx->fs_cnt_bypass)
> +				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
> +						CDC_RX_FS_CNT_BYPASS);
> +
>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_EN_MASK,
>  					   CDC_RX_FS_MCLK_CNT_ENABLE);
> @@ -3652,6 +3660,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>  	case LPASS_CODEC_VERSION_2_6:
>  	case LPASS_CODEC_VERSION_2_7:
>  	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>  		controls = rx_macro_2_5_snd_controls;
>  		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
>  		widgets = rx_macro_2_5_dapm_widgets;
> @@ -3837,8 +3846,10 @@ static int rx_macro_probe(struct platform_device *pdev)
>  	case LPASS_CODEC_VERSION_2_6:
>  	case LPASS_CODEC_VERSION_2_7:
>  	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>  		rx->rxn_reg_stride = 0xc0;
>  		rx->rxn_reg_stride2 = 0x0;
> +		rx->fs_cnt_bypass = (rx->codec_version == LPASS_CODEC_VERSION_4_1);

This does not look great, can we move this to of data?

--srini

>  		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
>  		reg_defaults = kmalloc_objs(struct reg_default, def_count);
>  		if (!reg_defaults)
> @@ -3951,6 +3962,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
>  	}, {
>  		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>  		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> +	}, {
> +		.compatible = "qcom,shikra-lpass-rx-macro",
> +		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>  	},
>  	{ }
>  };
> 

