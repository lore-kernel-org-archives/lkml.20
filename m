Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2493BE179;
	Mon, 14 Sep 2026 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392509; cv=none; b=McAc5GPpTzt/c+FBzv7OZMqVSi7enYqXO+1lj4fCLFDIr4LqXUIf4KhgKcG0Lxby22xUw/1ilMrCATX1ko5ytj4jinjdvI0v989do+3rbgDKRa3wjebM7DOUIdK8oEJynTYzTo2xvMDX5MGMpkTqf78tvLLOGf8uRb+Cdnh8584=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392509; c=relaxed/simple;
	bh=+j5uJ/paHPgKfTYlvJPjdKLR3qhSH1k8kbNnhD7XBTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upYd2Ns/rsp6hYFdSZQOZhc8aJ0t5JemvrnFc5UgPy7rlAkU3wYhv3h2IRjPZHbi7i6PdzD6gmMVkTFv1mqKLTMCy+V/thTpNNBtJYvtlYSp4wbUZaBApCVYmBMQ95okuQ8VMevcHqqTxAuw+V4wAGAUivP0yVrgBG++U/NNXeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YugA27sG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YugA27sG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392505;
	bh=+j5uJ/paHPgKfTYlvJPjdKLR3qhSH1k8kbNnhD7XBTk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YugA27sGvRUNH5aTiXpX2t9yIBHy651sJsM53vhworyOFppqlH0VeNtxu7TUYm8/p
	 iQ7FEhZUxn79GRC/6Tk2QTheXdfp7F9CIM/fNbEdpEkOo3w0C03RkqJc4KoazHEWha
	 L52KEKY6xh6IASeYSlsII0hRxOLdO6Wspkp+6HplXWOn2fvIDvm5DfcvchdHQS2LHn
	 Bn+FxdxGAske9sfDaSlU920Cw+8vtzibS+bd9fKQIAzKS8z9AB2zkz5gJBppx6+jYZ
	 EsOzb3fLPtbgTdD7F6qf53MxjGjPAnAYpz1kEoDGhpA0rgdcXmeVEDKEg23e3bxD6Y
	 guhZ9rkOheGNw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 594EA17E031C;
	Mon, 14 Sep 2026 15:28:25 +0200 (CEST)
Message-ID: <d6ef72b3-f928-42ad-9317-5fe1e44b9f31@collabora.com>
Date: Mon, 14 Sep 2026 15:28:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] ASoC: mediatek: mt8189: Propagate MCLK errors
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
 <20260914072842.24420-11-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> mtk_mclk_en_event() currently ignores errors returned by the MCK
> enable and disable functions.
> 
> Propagate these errors.
> 
> Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> index 4826ee250d70..f20dbb410223 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> @@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
>   	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
>   	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
>   	struct mtk_afe_i2s_priv *i2s_priv;
> +	int ret = 0;

int ret;

>   
>   	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
>   		__func__, w->name, event);
> @@ -529,17 +530,17 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
>   
>   	switch (event) {
>   	case SND_SOC_DAPM_PRE_PMU:
> -		mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
> +		ret = mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
>   		break;
>   	case SND_SOC_DAPM_POST_PMD:
>   		i2s_priv->mclk_rate = 0;
> -		mt8189_mck_disable(afe, i2s_priv->mclk_id);
> +		ret = mt8189_mck_disable(afe, i2s_priv->mclk_id);
>   		break;
>   	default:

ret = 0;

>   		break;
>   	}
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {

...after which:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo
