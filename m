Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83CF34C140;
	Mon, 14 Sep 2026 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392145; cv=none; b=k8N3ivenY7CkQB2eY6iYMQbVMqfrYVC5/PpOtHWTlGmNha5BmMgh+B2boXEVr8Zu4Kz/kDcpdBQUSnjeGS9nUa4gjh2TzLTzMTFGiAo+i4wLQT0CC8rfI2ftivOZaMVZ3nQxWsyCNQJgWOAF097xGaEI6C9sTRd32QSTuWA0sG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392145; c=relaxed/simple;
	bh=g+NHV6fMPvMB7g7ePyJrULSs0z4hTzYaFjSbJMYyRe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gHQ+Zn8P8MCxKbhPOiR2UbLpFEsNJLHlTQlrFbSPhZXnKERjB+Hc4VGmkm7NG8BAHf7Z5X3bbajEpBcuyW0ElEkLtf3Ets2BD7wegUZy+/39XBMLQiBi0BuMcWdYc4gRfzUr/R+kMTLqjIJUM2AsI5NOzmk3jMiU+4ya5y3Xzzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VPD5O4Ip; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VPD5O4Ip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392142;
	bh=g+NHV6fMPvMB7g7ePyJrULSs0z4hTzYaFjSbJMYyRe8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VPD5O4Ipjn6V7JnsslWeosPZd2xLD6c8kLbVWbDVFLeG08VSS81NgTqRNi6R8cML5
	 XVOFUhrXVQUezVJZeSFZ62/24mhg411q2gc0GP+cXxrKQPxLUki1qOCYxrBhY0BeJG
	 XhcihTsgEU3bsl6iRXQT+lFvqrFoeTUZIykhkfNveVuwYxu59f9auZNZaKAQPniq/g
	 Q02tLWHFC7Ho58afsIZ+zs+oPF4UTr2Y+6LVyWE+Nh3W1J580b8BvItH5pwo8gkMxo
	 5iR4ACRQEZwtltaDD9aZsqQgZMGAdywaaFrj3cswe7N3WZS9WAbRRhai7zXAiUdD44
	 3uu2t4aLwxIfw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 762BA17E0074;
	Mon, 14 Sep 2026 15:22:21 +0200 (CEST)
Message-ID: <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com>
Date: Mon, 14 Sep 2026 15:22:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable
 errors
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-3-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> mt8189_apll1_enable() and mt8189_apll2_enable() currently ignore
> errors from regmap_update_bits() and do not clean up resources when
> clock enable operations fail.
> 
> Propagate these errors and roll back the clocks and tuner state on
> errors.
> 
> Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v2:
>   - Update the names of the goto labels.
> 
>   sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
>   1 file changed, 56 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> index 63e03a40dbbe..aaf4f7921363 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> @@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
>   
>   	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
>   	if (ret)
> -		return ret;
> +		goto err_clear_mux_setting;
>   
>   	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
>   	if (ret)
> -		return ret;
> +		goto err_disable_apll1_ck;
>   
>   	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
> -	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> -			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
> -			   UPPER_BOUND_MASK_SFT,
> -			   (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> -			   (3 << UPPER_BOUND_SFT));
> +	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> +				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
> +				 UPPER_BOUND_MASK_SFT,
> +				 (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> +				 (3 << UPPER_BOUND_SFT));
> +	if (ret)
> +		goto err_disable_apll_tuner1;
>   
>   	/* apll1 freq tuner enable */
> -	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> -			   FREQ_TUNER_EN_MASK_SFT,
> -			   0x1 << FREQ_TUNER_EN_SFT);
> +	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> +				 FREQ_TUNER_EN_MASK_SFT,
> +				 0x1 << FREQ_TUNER_EN_SFT);
> +	if (ret)
> +		goto err_disable_apll_tuner1;
>   
>   	/* audio apll1 on */
>   	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
>   	if (ret)
> -		return ret;
> +		goto err_clear_freq_tuner_en;
>   
>   	return 0;
> +
> +err_clear_freq_tuner_en:
> +	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> +			   FREQ_TUNER_EN_MASK_SFT,
> +			   0x0);
> +err_disable_apll_tuner1:
> +	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
> +err_disable_apll1_ck:
> +	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL1_CK);
> +err_clear_mux_setting:
> +	apll1_mux_setting(afe, false);
> +
> +	return ret;
>   }
>   
>   void mt8189_apll1_disable(struct mtk_base_afe *afe)
> @@ -506,30 +523,47 @@ int mt8189_apll2_enable(struct mtk_base_afe *afe)
>   
>   	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL2_CK);
>   	if (ret)
> -		return ret;
> +		goto err_clear_mux_setting;
>   
>   	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
>   	if (ret)
> -		return ret;
> +		goto err_disable_apll2_ck;
>   
>   	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
> -	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> -			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
> -			   UPPER_BOUND_MASK_SFT,
> -			   (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> -			   (3 << UPPER_BOUND_SFT));
> +	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,

Well, this is a bit of defensive programming here.

The regmap pointer is already checked by the previous function call, and this is
a regmap over MMIO... and MMIO writes can't fail.

> +				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
> +				 UPPER_BOUND_MASK_SFT,
> +				 (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> +				 (3 << UPPER_BOUND_SFT));
> +	if (ret)
> +		goto err_disable_apll_tuner2;
>   
>   	/* apll2 freq tuner enable */
> -	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> -			   FREQ_TUNER_EN_MASK_SFT,
> -			   0x1 << FREQ_TUNER_EN_SFT);
> +	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> +				 FREQ_TUNER_EN_MASK_SFT,
> +				 0x1 << FREQ_TUNER_EN_SFT);
> +	if (ret)
> +		goto err_disable_apll_tuner2;

Same here.
...and it's the same in some other commits of this series.

Though, good job about fixing the failure paths, that's good stuff.

Cheers,
Angelo

