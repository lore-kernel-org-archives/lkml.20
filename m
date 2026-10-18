Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63363F107E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342976; cv=none; b=P8WLqB2l1+zyzdxauUmLANoW3Luy/xVT+RDKG7/CaRyNaoVqzgqo908LohvRoZ1zsSm7EqV4RO5nyFY/3erHD25K8INYQL4QZuY4oh/jkRZvIJF77s594whWNtkm87PUtDcMp2YzdTt/J6SxtRknibhLDzA9kn6H5yYmQ7CHWsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342976; c=relaxed/simple;
	bh=qRlGL9BgQNwsXr+HqA7nK9JJTvMCj6p8URwOiE7lOoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=scp4t4z634cL1qoTKW+xKYpDylm5cylVkkJgBza3Lh3m2P5DUW+cD6g9Qxn1oqyIT39LF4G7CurNyqMr6C5AdCSxKG+bn3NUM8e8AKQdsFAhlaTQ2Sb7Y5vSWq9VNRnRixJVeGJnklxdFjiYLbcri6nc0j0N2CvVEsdxDrln574=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dPf4sUtR; arc=none smtp.client-ip=91.218.175.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dPf4sUtR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qRlGL9BgQNwsXr+HqA7nK9JJTvMCj6p8URwOiE7lOoQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792342971; v=1; x=1792947771;
 b=dPf4sUtRZ+BLVBK8WkemP2gEOesnOQDRW2JZC5B20SlvwvV5UwsEGSOo7QMJ/ZTJ8HHKIDN3
 R8IaxsiiUZICro2pt0gwgd9Amsk3tqNAr4kQrV+LXS8Zgsa0sm6/tZ3zfmaGWN2SvjS7Syg5hxK
 g0uYTOcelrPGSAHcgLvjHqt4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bbd058d5ff1fdc28;
	Sun, 18 Oct 2026 17:02:51 +0000
X-Mizu-Trace-ID: bbd058d5ff1fdc28
X-Migadu-Flow: FLOW_OUT
Message-ID: <5fcf8148-5775-4043-920e-650b3bedf7c2@linux.dev>
Date: Sun, 18 Oct 2026 18:59:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] ASoC: amd: acp: move ignore_internal_dmic gate to
 DMIC enable condition
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261014101817.1240200-1-Vijendar.Mukunda@amd.com>
 <20261014101817.1240200-7-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261014101817.1240200-7-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 12:16, Vijendar Mukunda wrote:
> Move the ignore_internal_dmic check from inside the dmic_num > 0 block
> to the DMIC enable condition itself. This eliminates the dead if/else
> inside the dmic_num > 0 block - when dmic_num is set,
> create_dmic_dailinks() is always called. Demote the suppression message
> from dev_warn to dev_dbg since ignoring the ACP DMIC in favour of a
> SoundWire DMIC codec is expected behaviour, not a warning condition.
> 
> No functional change for platforms without a SoundWire DMIC codec.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/acp/acp-sdw-sof-mach.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> index ac4c9e852f671..1207e35ffb581 100644
> --- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> @@ -351,9 +351,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
>  	sdw_be_num = ret;
>  
>  	/* enable dmic */
> -	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num ||
> -	    amd_ctx->pdm_sel)
> +	if ((sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num ||
> +	     amd_ctx->pdm_sel) && !ctx->ignore_internal_dmic)
>  		dmic_num = 1;
> +	else if (ctx->ignore_internal_dmic &&
> +		 (sof_sdw_quirk & ASOC_SDW_ACP_DMIC ||
> +		  mach_params->dmic_num || amd_ctx->pdm_sel))
> +		dev_dbg(dev, "ACP DMIC suppressed by SoundWire DMIC\n");

this looks weird with the same boolean tested twice, can't this be made
simpler with

if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num ||	
	amd_ctx->pdm_sel)
	if (ctx->ignore_internal_dmic)
		dev_dbg(dev, "ACP DMIC suppressed by SoundWire DMIC\n");
	else
		dmic_num = 1;

>  
>  	dev_dbg(dev, "sdw %d, dmic %d", sdw_be_num, dmic_num);
>  
> @@ -384,13 +388,9 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
>  
>  	/* dmic */
>  	if (dmic_num > 0) {
> -		if (ctx->ignore_internal_dmic) {
> -			dev_warn(dev, "Ignoring ACP DMIC\n");
> -		} else {
> -			ret = create_dmic_dailinks(card, &dai_links, &be_id, 1);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = create_dmic_dailinks(card, &dai_links, &be_id, 1);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	WARN_ON(codec_conf != card->codec_conf + card->num_configs);

