Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816B349BD61
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047156; cv=none; b=hsoKuZBS3p18xBoAIQZ/hejmFypFcULi99zrnawiw4nA9Vo8D12XsF7VMVTAGeF2OF51mFsq4Hbxgop/8/xFewNi3I1sAJ/Uj+LIWHaKbAe/gd+rpaWEj+qjQlIM1lpIMZ+Xf5sWX9zIKY7cIrZy3NIfeLEQtS9TlEk1emkI54g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047156; c=relaxed/simple;
	bh=1ZAbLGJDahc9vWPqXs1jafCsPa7Y1HqblW4CXPxbgTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4Ot2eAX24ZvAVJrDcVqr4tNGb0IwZL4OTIGlXazZGs4yS33RO7J5ZqWMauwjaZrh8M7HHBTHIhNsQbD2LoJjirJdTNlICWtrvfQla2H79fE+IHyrYaHatkcyi1bt8kluAPTz1S4LKH0fBLh34ohffh62XcJFB8Tm8zCxc/PtIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTl+bHdu; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTl+bHdu"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so2135942a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789047150; x=1789651950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ndI1o0tF4rBbBQihF/KpyjTjK7B3nvas+X0LJj+FFg=;
        b=MTl+bHduE7Bru3C0NQVEW2Ea2lM+Xbbq8aNkviNnz/nhAlu0Y/iAv477jDrHMYvcfW
         kkZn7goqBBpR95S/Tv7bJO61oYRSBdJ+QrFgRVpqg0TNwceDEExrKpaWAFDMCoNEiqWr
         V6cbFbD/nMFEzTFukbFo6pk+ExCZxOmYObhKNVHUd7KIHh5c79Sq3hOY2RwTVu/B0LP/
         Z762AI9jjFyfNVrlIRRRnCxWi51TqyH61aQzXv1B4RpFNXXtP52EQYdgF7LGs0ZwKMjA
         mhXU9f/gnpK6UJkkXvXOXbgP4ABp7XV5GojbeehdCjcWkA534nFgUfp4WOf4lA1SKrx+
         BO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047150; x=1789651950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ndI1o0tF4rBbBQihF/KpyjTjK7B3nvas+X0LJj+FFg=;
        b=S3Fiz8L3cJMijzJu+0RL9rxayqp+mFmZ2iqZ2kIpZ33hti3VjHGZ1KrIq/m8T38rjp
         iQSM02NX0iKI6m3xd4tDKvWUNBqQklZaCJ0I4KOfDJ++2UYVjJHeSYK5EWTdMn9CjrdO
         BExjaH/acSdBIH/D6pIIfV7saGqlW72CCBK+vmymn2op7vSsRPoBD3zCsiGUDK63AE5m
         9hVchvvFNNtoYHs3XxDnHVm1VlTorXiLJPC8m2OJ4rPrxOQ9kNVJvH/fcKStL96zFIQ1
         0PTTbhl46RnqFnLxf7rU7Heg6HnT8iC59wNCyqvQsId2JmWD11kcm6fNcUfOCrPL1e5v
         ET/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzB6i57OSQPxxVCIAitYbCPEaEls9d6Ic+JILisBJeRPbg5GaSZC2Uo8bVDm6tGbql3s84rAbbOgmSjPWI=@vger.kernel.org
X-Gm-Message-State: AFuF++kJFeJj9DtsVeWh6LGVwex8aVk2eBICfX0zXu3d1pQgLiHOLqCD
	ODfwSHmiJ+A86Z4eFGyqIUpV6aUNzazINuJARKuzmqPKrDM4e3qiWHmv
X-Gm-Gg: AYBFou0z3rj2zYvPyqDRLzYD7g/nPudxmrja0uFSb/3w7o0XumRME9pQjfeNVPwbdM8
	WQMeUikBho/PhLn1JICREe4E7Mc7uepGb2j1F2Kb6pxPuFJc+LJ4+3FsCNgw2m2FVyakvRndjd+
	Jmhm2CLnqifxHK7pLLOg7/PPYm0+NFmrsrVafCMgYnUcLUUMP2opIZSk8ZR6i2dFtNq3Le1Zd9d
	dYeqaN79Pl7gZf33+o0ZZAZBEvPcA/lmfY5quFzgeY9L4+tEQJYycbJZ2jh0cEczds4aVF1nVEO
	Uuy7ujCpwYM9N5R57OWrQ94zYz5Gw3/szjsuV3dbrQU0ZKunX2aj2qsxjtquaHyH3R2axae3dSK
	scNmSq5sTtHdvEdxH8b+mGB6OvJxY+GB+P6KPWZ2G5f1rvS962QrL7CizC8CHEUz14K8rdJxApp
	bEtavlQfQZslZVi13y7s2td5AtqIsyc9+88CB/Zg7lpASMN/eLxT0c7AUV6fUpp+xTG4s=
X-Received: by 2002:a17:906:99cb:b0:c25:62db:772b with SMTP id a640c23a62f3a-c2941868ad6mr336284266b.7.1789047149946;
        Thu, 10 Sep 2026 06:32:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d581f51sm945616266b.42.2026.09.10.06.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:32:29 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:32:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] ASoC: mediatek: mt8189: Propagate APLL enable
 errors
Message-ID: <aqKxadkfX9Tqx8JR@stanley.mountain>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-3-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910125742.150902-3-phucduc.bui@gmail.com>

On Thu, Sep 10, 2026 at 07:57:31PM +0700, phucduc.bui@gmail.com wrote:
>  sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
>  1 file changed, 56 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> index 63e03a40dbbe..a901be97e75f 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
> @@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
>  
>  	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
>  	if (ret)
> -		return ret;
> +		goto err_apll1_ck;

I shouldn't complain about this, but I am going to...  I don't like
ComeFrom label names at all.  Imagine if we named functions that
way, there would be a thousand functions named called_from_probe().
We already are looking at the goto so we know where the goto is, but
what we want to know is what the goto does.

Better to name it err_clear_mux_setting or something.

>  
>  	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
>  	if (ret)
> -		return ret;
> +		goto err_apll_tuner1;
>  
>  	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
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

Since you can't test it, it's a bit risky to start caring about
errors.

regards,
dan carpener

