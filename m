Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E53385BC
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428788; cv=none; b=ZkxSCkVc8iIXNKTRP8+spQKlyACvj07STZngsP4R4PVNei343vEAoM1RdzDsiHypMHksUvYNn7xkFHVDBPaT/j9ySO1AB7s6p8POis640KNGSedg28du4k+nx0nF6KdsHwpE+3rPb/1x0wgjlaD2tlIUQeb81Dc2ot36x5QLxe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428788; c=relaxed/simple;
	bh=RjoEqXLjxq93HwjNyWQIaPTDo0YhISB9Ja4xipmLNaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMBdyXSisR59WSikPFJ4G4qKiKzMlRkHo6apmhOP3pD0PmS2zdKntMGVbMzsPEiXTQDkbYptPgozm91MDsdACv9TllNd8gp+LeaMwU8zr0RJ/e+nRuVkbjCoOU9r89AnTTpaucf8YafcOfdsDDye2MZtrZWHLyB2dJ/fgo1msh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBwyk0vK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBwyk0vK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so9644265e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790428783; x=1791033583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KxBdd5YtiikdA2EB3RaEsDlyXLxZtzJpIW7hxYmjpy0=;
        b=UBwyk0vKD/u1DIN7x697Mg7qao8dMQwQGI3fzcaBcZgQh8lxba1zmWZSybXK8WLlZy
         pLKm2bKkOgtHU45GyyTTxBrZntS1L/ZHcFYFt59T8KiTGR98u5tXnUyLzOk7i9eO/SKI
         6kB8oOePCKWzC9kZEnZr5fhRRSIr2iBAuMmRJwBxnuUJFFAPxMyK9RdKmQ4w1vASAzdU
         tEC16IGKMpMcIkafYBN8t3tBHrqv6y88l8vF2c8cDxXtN8wLuGF6YGr8YIWMEvodzLDX
         we5yooJWX5eSm5mjFYEgQIwDxI7xFq4uhdSDMZ6tYTF8BI+cUuwvKsVZSATnFVmVYKXT
         bljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790428783; x=1791033583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxBdd5YtiikdA2EB3RaEsDlyXLxZtzJpIW7hxYmjpy0=;
        b=GjQ7UBxfVV1lrRNkxbZ5WSj8zKHYeHHFC4ASryNe5QL/f1AMqLrSBmy86DcoeytBcA
         r12NdIa07iHzVim1Y8fznBpGqgu1sbWCZNcIqHKOiplMmVUXElg5tAtI8IsOLMwKriT0
         KwoOJVjcNEGoSl5VYGIxXBnXpH/ZziHQr+XHNzq+n6WoQPaPU7nr5HCmkmELfrYlvfTy
         nuDjRCXuCVqJN18SHxda+tofccOJLlDtGVyiODyYCI9KYiH9se/RcKq/7pevufBzb3SZ
         C8uamY+GITGKv9uydz3W8/0JKwr2uvPsu08xKOZvtLLNXB2yAw358AGQxAngicx+RifV
         QoMA==
X-Forwarded-Encrypted: i=1; AKwUvBzx6euGcyWKyxQgPR5jWhzHb6okHca7OMKtTKNVUNpIOI6acqt0X0/o4yXI8/aDQ/Lft4ezbaJb/vj9yIU=@vger.kernel.org
X-Gm-Message-State: AFuF++kBCQUTyL5B8L3PpfU3M4102PvStRVkrZI0lRs39epu6RYMx8AB
	q/xZikMbZppIqrzP6JMAfMGpMjh9/SrEkSW1AKw+jEdtQZ++Tp4lFAJr
X-Gm-Gg: AYBFou3AdtO10RENF/gD2+/nB/kM9/49dlbLIb4nvygWl2s6J87qoi8ZXny61PodH7m
	xnGQcR5hdwZNUj2ptPaEC5zuwYZSJnQpOTd/AyHS2rI6Fn96H9hW+krcaIHNv5IfWJUfpe4/y3p
	XW1xmKO7IT7MpfCPPjriNLsYMASSVNsgOOc5gRjuvotBr9DUmCjXrjN6sNbtad946RdiwxCXem4
	yc2a+r0K82ihefdJCwbsQuGkaw5DlzPBNASt9mWvKgT6EhPjtJzXPvbNbhdsb3oCFu7RTr2Xigc
	aiGpI2cu63cca1Ed83e191I+67t3KyjqGr6aaT0sOE96if92+CDPH8bW/AAPPF7wmd1cIue6W/B
	GHcKTbetnOMzvVQsBS4y0JA5PeRpy9a53rgmqv239ES/DQ801bKfc6DDAcZpmhFLMjDJ+DT6Nk8
	toh+SioxSJngNkoCcKgJMu/gOIbICZ8bP6g7dmJtphypuXvE2k8CmqIaVcp0ZnRgDJFD0=
X-Received: by 2002:a05:600c:1391:b0:49f:ce73:5e96 with SMTP id 5b1f17b1804b1-49fe670af91mr159689215e9.34.1790428782920;
        Sat, 26 Sep 2026 06:19:42 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84205esm13861406f8f.37.2026.09.26.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:19:42 -0700 (PDT)
Date: Sat, 26 Sep 2026 16:19:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: shengjiu.wang@gmail.com, xiubo.lee@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	festevam@gmail.com, nicoleotsuka@gmail.com,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_asrc: check the second front-end DMA channel
Message-ID: <arfGajXmMUeew0fr@stanley.mountain>
References: <20260913125147.109920-1-bolin.liu@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913125147.109920-1-bolin.liu@seu.edu.cn>

On Sun, Sep 13, 2026 at 08:51:47PM +0800, Slavin Liu wrote:
> The temporary Front-End DMA request can fail independently of the
> persistent channel acquired earlier in fsl_asrc_dma_hw_params(). The
> returned NULL pointer is immediately used to read its private data.
> 
> Check the temporary channel and release the previously acquired
> persistent Front-End channel on failure. Clear its slot so a later
> hw_free cannot release it twice. ASoC marks a component's hw_params
> only after success and skips unmarked components during rollback, so
> returning an error alone would leak the earlier channel.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 3117bb3109dc ("ASoC: fsl_asrc: Add ASRC ASoC CPU DAI and platform drivers")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>  sound/soc/fsl/fsl_asrc_dma.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 2f662bdf14d0..64f2b0612274 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -248,6 +248,11 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>  
>  		/* Get DMA request of Front-End */
>  		tmp_chan = asrc->get_dma_channel(pair, dir);

The ->get_dma_channel() function pointer returns error pointers not
NULL.

    sound/soc/fsl/fsl_asrc_dma.c:254 fsl_asrc_dma_hw_params()
    warn: 'tmp_chan' is an error pointer or valid

sound/soc/fsl/fsl_easrc.c | (struct fsl_asrc)->get_dma_channel | fsl_easrc_get_dma_channel | 1
sound/soc/fsl/fsl_asrc.c | (struct fsl_asrc)->get_dma_channel | fsl_asrc_get_dma_channel | 1

regards,
dan carpenter

> +		if (!tmp_chan) {
> +			dma_release_channel(pair->dma_chan[!dir]);
> +			pair->dma_chan[!dir] = NULL;
> +			return -EINVAL;
> +		}
>  		tmp_data = tmp_chan->private;
>  		pair->dma_data.dma_request2 = tmp_data->dma_request;
>  		pair->dma_data.peripheral_type = tmp_data->peripheral_type;
