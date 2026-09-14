Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DCC3FC5B7;
	Mon, 14 Sep 2026 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392420; cv=none; b=LWHFJEle2QfJv+ePASvm+GjRsa2ZVbrdvGmnb8oJF4nunV9Wv25movk/so9V98OFZncQo4xQWN9M5+yFSOBSYK48UCsD6ZlyEM3Zh+S8TTCQYc1S4TV2qLc2pVW61qi82yVMy21WFNi28DU3e89gjjN2YTmY949e4JRw3GuTaNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392420; c=relaxed/simple;
	bh=3OQriGhrIrMIubXZFC8YrO8oerOhRvRRfIlDcpLUMAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJmMyTCsjDUWzxzGKAlFVUf5XN0jnt5tAuZFvthvYMCkaLOfzyFwJNUfYQb6a3gheQbPIYv4FAaX3EpJkwzVzp1v6orUvpp+jcHzmGPNTcgbcOZNtHlQqiHkpNwMOIrSpB7dWWFf1Dz11ifgQhZ3WfuLF2nyUpecjg0NYvKXSYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DAnx0NH2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DAnx0NH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392416;
	bh=3OQriGhrIrMIubXZFC8YrO8oerOhRvRRfIlDcpLUMAo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DAnx0NH2wBcsJnYGx9ntqPVkBwKJ6/xND0kERYftNf+EJvjhHTV+DjLWcuNeD2NRE
	 yB1492N1Tipj7TXjNWtxbQWHIXotq41UGujqsSQdp1peAhdUtslT+5O4cLVlKwTVg5
	 q+bkwXy27Q3OeRWVuah8ZYzTYHN8SOKDPcP7W3iJSyC1Np77uqGXX8Q8phUacHnezq
	 B6MD1P0DqJDCwqae2VlZ2N3GgsAzWmQXjpwScQdJh150bAe/T0QSTnNh6NXPOhF1TE
	 JFRt4L+RF5yvtxitnEDFK0m9WUYapJ4jRdTAe4URnH0DnXo7GcLyhTHjZzaR0lAR+m
	 5eVZUDDsQx/Lg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC56D17E01D1;
	Mon, 14 Sep 2026 15:26:55 +0200 (CEST)
Message-ID: <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
Date: Mon, 14 Sep 2026 15:26:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume
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
 <20260914072842.24420-8-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-8-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> mt8189_afe_runtime_resume() currently ignores errors from regmap
> operations and mt8189_afe_enable_main_clock().
> 
> Propagate these errors and clean up the state before returning the
> error.
> 
> Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v2:
>   - Update the names of the goto labels.
> 
>   sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 36 +++++++++++++++++-----
>   1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
> index 77cf2b604f6c..67fa40afdefa 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
> @@ -2328,24 +2328,46 @@ static int mt8189_afe_runtime_resume(struct device *dev)
>   
>   	if (!afe->regmap) {
>   		dev_warn(afe->dev, "skip regmap\n");

In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
correctly checked for error as in, if any, probe will fail.

So... during suspend or resume or anywhere else in this driver really, the regmap
pointer can't be NULL.
The right thing to do here would be to just remove the useless check.

Mind you, this comment applies to some other commits in this series as well.

Cheers,
Angelo

> -		return 0;
> +		ret = -EINVAL;
> +		goto err_disable_reg_rw_clk;
>   	}
>   
>   	regcache_cache_only(afe->regmap, false);
> -	regcache_sync(afe->regmap);
> +	ret = regcache_sync(afe->regmap);
> +	if (ret)
> +		goto err_set_cache_only;
>   
>   	/* set audio 26M request */
> -	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
> -	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
> +	ret = regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
> +	if (ret)
> +		goto err_set_cache_only;
> +
> +	ret = regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
> +	if (ret)
> +		goto err_clear_26m_req;
>   
>   	/* force cpu use 8_24 format when writing 32bit data */
> -	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
> -			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
> +	ret = regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
> +				 CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
> +	if (ret)
> +		goto err_clear_26m_req;
>   
>   	/* enable AFE */
> -	mt8189_afe_enable_main_clock(afe);
> +	ret = mt8189_afe_enable_main_clock(afe);
> +	if (ret)
> +		goto err_clear_26m_req;
>   
>   	return 0;
> +
> +err_clear_26m_req:
> +	regmap_update_bits(afe->regmap,
> +			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
> +err_set_cache_only:
> +	regcache_cache_only(afe->regmap, true);
> +err_disable_reg_rw_clk:
> +	mt8189_afe_disable_reg_rw_clk(afe);
> +
> +	return ret;
>   }
>   
>   static int mt8189_afe_component_probe(struct snd_soc_component *component)


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718
