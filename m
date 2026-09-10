Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D1648E0F4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046818; cv=none; b=ugvcLVV6JfLGHG1S7whGrc0mSlGty7+JZFw2uGVFULmjandHmF0PQJ1SpnUdNEEKJTzGDzuPfGS7h4NcmX0pJ+B96zmo2TPTxu9Y8VvgUiC8mT0eYEwFPw0fruO28kLklDgQdmTsDRqOYmrJTtDRaz29nIoltTgtXO5dEQIkB1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046818; c=relaxed/simple;
	bh=paNGGPZ1uw4B5jdjVSomKJFoJ+yYw0I2G7m3Tm51ufE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXwf3xH6bq0B1IHleeyAH/o8vSNdT+IL7SyoHpJLwlnxCMu5aqTtFEeJFqP5SDkGds4v2Tk2NNstnwuOXEdE/9msXRh57Sg2kQjYndoMvUkXqdiPtzC79uUospYH22GESqm95VDpG06trOlGqLg6nIbypGXxbYm0tPtT8kj7X3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prCPmycF; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prCPmycF"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c262204cc80so858236866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789046815; x=1789651615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvtswLvPiQHbO1nAALeYzwdSCfuCoM47IC0JhG2+bnc=;
        b=prCPmycFvHrebUfIJFkIDMn11uHh2RAgvowahlArJhuRJp7/HSPaHwSylXR1oT5T8b
         lNgaU+anvgeGf2MeAudcf0MuRBhUNFqf7K86QqmgrNH1zXrlJzDlFG75bz9Lv42UZQhE
         /NijN0p75Qcd4QFP+6wVlKxDWgWo4Gvhk4wAcKYBfXAuXaPtf/HhNIKGmCx7Xwr2boKL
         muiJqv8xqs7sKODL+AblyxgelWhmIDAYd9zNalqwv7syLcT8vQ8O1P3hsKGsdNkZ0/QY
         avmvo59GD0S1u5RuxkTKgvAfxAkI8jJPFYEq+9mAdy22CQEslyWbO2LtQyrsbjvBuojP
         jpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046815; x=1789651615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvtswLvPiQHbO1nAALeYzwdSCfuCoM47IC0JhG2+bnc=;
        b=ifcaSEvVMWG1ei9Ysc0Sm7fbs3UBuvI4QrirkovNYAx3P21JGqWmgEHi8c6CZ8BJDO
         7Hlgd9oQGUHLg1zt5rwE8aHPmQ1dMq+45/H4OAhiKKsXbfs4o6Ju9u8306XD5fjllQEm
         FfGFu+2C0WmqAPr1ad+Kj7g4Yr2XXEpuX2x6vaFtLTVMb65BaVMVDdgTWz1ykz4X5mTC
         WksU27mZbh18s4dX6zcJVc4y8n7QI336aCCIxvPGRuGTN5fGEuiKT4Nj+Omn68yJs+x6
         /h+7kO791w0Io7qmfbspHGNTZnBu8GDJhIaFCS2RiI1N00ZkXb6MU1kaJ5b5nGdbdoNq
         S7wg==
X-Forwarded-Encrypted: i=1; AKwUvBzi78+vposfn9K6fYaAAtcVTS+VXq/2FtJ+XUqN2Z8LF4h+XAQ9mieDoeLoFBTJy/QCFOXHAzmWUnxKAZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kaTjq7rN0M5IabW/9FLNLTKUWpg1CCH+U2SZCQxRIzvRbSCC+K
	V8JOdKCfkzG2vJrf0C6ArNbIUqFtazJ7hPDcZy8QiSs9GQPH/Z1Uh1Tn
X-Gm-Gg: AYBFou3z6/+63yEQLnU50/bsf/ON/ON4mrFqySZ/5z2Q+7WiLqd20N96RdYOSHHiQjF
	fQHzqnhq9fe4m0eeCs9ss3eS0zXQ56rEAInB24fq6TvPRZDuinxNrv0kL42IbCC2XGE/lqijm5A
	poaIBe6qauppwIwnxkS7R3duToEIQJLMTic6qqxa1Pyg+/rpoTsp5EEvRxbfntdKlm2J8RGNq85
	LWZRRpHMG1iPGBwpYU3e9EJrCh9VGELAo71f7taqaEu2HAsyiQV9DOWGuL0GY5QhueXRwWyrbzC
	OlA65UOC01YE4nP5inRtIcV2VWcabQINibilhhIzhOzPQfNYAn6wSbmv1S22g4itB0d6w4lmGMy
	em0TiemG13hJIclSI1pY7U/vPXtYkllkV9ogOV6WnM/62vfdyYrm58V+zxeKcIL83S3xSv+tSu6
	/v6NSFubr1RRagS5MjSB8q6xP0U3zzzYd3PRmlERWKknpeCIpYMJFEFqRAJulVx5ZYEoGeOpsbR
	Ot5fa8=
X-Received: by 2002:a17:907:a893:b0:c29:286e:2e3e with SMTP id a640c23a62f3a-c29286e30e9mr574563466b.38.1789046815001;
        Thu, 10 Sep 2026 06:26:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm912526366b.63.2026.09.10.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:26:53 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:26:49 +0300
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
Subject: Re: [PATCH 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
Message-ID: <aqKwGQDkB_HruLyQ@stanley.mountain>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-12-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910125742.150902-12-phucduc.bui@gmail.com>

On Thu, Sep 10, 2026 at 07:57:40PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> mtk_dai_i2s_set_sysclk() accepts zero or negative frequencies.
                                           ^^^^^^^^^^^^^^^^^^^^
It's unsigned int so it can't be negative.

regards,
dan carpenter

> Reject invalid frequencies before configuring the I2S clock.
> 
> Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> index f20dbb410223..ca7d786cdeff 100644
> --- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> +++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
> @@ -1286,6 +1286,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
>  	    dir != SND_SOC_CLOCK_OUT)
>  		return -EINVAL;
>  
> +	if (freq <= 0)
> +		return -EINVAL;
> +
>  	i2s_priv = afe_priv->dai_priv[dai->id];
>  	if (!i2s_priv)
>  		return -EINVAL;
> -- 
> 2.43.0
