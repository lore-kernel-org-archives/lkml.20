Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794191262;
	b=NCjcwDyMG10LArJ8pMu+jdJBmVqBYc520cHo2uo4lPC1puorKRf4uBT/PquUADtZOlWi
	 HoCBqEIx+jB1vrGjFuQ30+kAmfzzkjqhiv4+6bLXTdl2UZLxq6KC7YxX9xrm0hevMjZEw
	 NW1dPCQnDO9YUmr1inp6D482PQR21YWotg/Jeh3j5NAjqVkFZh0fVmFMkcdg3dYcDr72L
	 IbuieJhcyvG0HK2+6UWoUW/zvgL2abyHl6PJ8sXowS+wlZFA8N5joLrUIecWsFKFl+u+3
	 ODD2pX2e1jqg10KrnaLYE5u2P6E0GoAnbIOXkkEjecU/hpC90qAdiD0lxWBtrexqVjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yPQur+hqQu2q0njQUmv4lZWgo9lpsQ1I9fKlomCvuSc=;
	b=siy7Ol1lhbcPJLcXlAUq7YuDwdVdR6pMSyPJMtEyV9GxX4oldpaDSbJ5/yhzJ80xSAlJ
	 PH+lIVQSAjRwtwias75o8LaDvgjBIQ6rIsmpAiYyFb9EKv5v+XxNeKPts7T09armssnv7
	 ieXIYG5E+Rm+ns9xIhUf1LNkrHJNjgxRia5XzDdbN+lHGi5qZkFsHuZgWHbfP2EFGm31r
	 j8ZXoE3Tu3HaFzeLPPlHMvEno6IZjLtm/8ADSCTFU6RwNWSydHTtVA0+R4Rmv6+iIzDIW
	 sAza7QA08xbO/HVNxOMLJwFWuwuoyLtUoZ3GCqhjoNLhq+l1e20/gR6uFmMQBJGIyaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xww/IyCM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F9C606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F9C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xww/IyCM
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so107629a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:27:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794191261; cv=none;
        d=google.com; s=arc-20260327;
        b=odjU31O+f4Z4htlY0jRRlpfiYT5g8tbCu+IugdkHyh0l101A+HD4ESkgImqQJIdU3b
         VlFxblCJd59R690waGEgoMdsxCkGwfYN/EYVtJIXUOZlUMA8ctlA2p92ghiivdsmHFVM
         TDjunqkX365/VybNy0fIE/AGLA0NWK+UpgHDzcnNMkxFQJs3JguziYS1T9UnFC9pBBih
         f/RA9tdjdJPhKKxlQLAjr8IeUPQZs3mWSMBqNWR5Op4/L700lp853sueoosMnRb1WQie
         M+RoHUN+cdYvR9e7/S0JgvvRxiCsOBritcDN6+NSHzC+qLHu/AhyMSkj8JwrFU1FfTag
         XXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yPQur+hqQu2q0njQUmv4lZWgo9lpsQ1I9fKlomCvuSc=;
        fh=4RuOF5prrFKAtx3VJVsQIbLrDqZ0VntIkuM4/pe8DbY=;
        b=fjwd9hXf/JkVpA3k78Lc3gFXv8CQEptfeJk2e0Q9gkoGPIOS+zdRRkOB9jmPq5WYtS
         F5QwnPHpXgX2tf2qSTWE08+duuNE1Tp9PzEYBDFpOS7X7WM/noKqfl8DsvQYYTxeTol1
         /mTQlb58jnp9/hbZ49am0aqBc9AnHa7IREQwSfTKZu3e57JLexp7PQ3woD+2IfXnL1Fi
         DohVvOLFUolLMiHRKRY8HLcvdZGgaVX7aZnd6H1xJm7e5S8jdvKHpHlPVJH8aDCRNNlW
         zjq75Sj+0nDAhw5FMaI592VGskdMxzjD8b+kpEizSBZ994SndnsLNZ806KIY7O/wg6Aj
         ZkGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794191261; x=1794796061; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPQur+hqQu2q0njQUmv4lZWgo9lpsQ1I9fKlomCvuSc=;
        b=xww/IyCMrSODtfYtfP34ZKXzfPjx1KMa7MlTuLsdIn0CEJAJe+ZRLMcWzfU4O4LXky
         jwRaYH3/q7QzO+FfGIb/iOeL8K9uHf9JXfPw97NgQijoHheddTxQZRbZC9dFkwOv3Z7/
         qACqquLNS/7uUC5Q3e2xVU7bfaGquwd80IzSaXfBviEyo+vqfgaaiOVQjuwtQWmDNIas
         s1dcDTLURILHODKm3GzYQblmgNFhprbRZxoy3TRP55XNOREZMvaESalCxg7kaGhnxKaM
         ug5JBbD+9CHhcEugPZdlIEVNcRAKxO0hKZO3BKd4iGPqr/SVKBvnbYRGsCQP5ZizPiGn
         4mRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794191261; x=1794796061;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yPQur+hqQu2q0njQUmv4lZWgo9lpsQ1I9fKlomCvuSc=;
        b=pxIxI9zklTSi+PI/sxntwCmsTq/WCzwIZV4nmyWd9p/+S5zsPgwYUVcnrrhHJGJCfm
         D8wDjzX+x9Or7+7O5tvhY9H7Dj9HrcfXSXly52eNAXOkolwkSIWH3frlB9OInmhEpABG
         +frK6bq8ctIjObGdexipQqspDBbv6C7VfTkPrCp2KjonrXfw4djRsTRONiiaS5PMs+Ve
         DEmoty7m5jB0y9Q2DK2/EbDu/nC30uNVzKfFHtipZI4gb3CeLfOYlDV09NdMQwYxAxZR
         mM6YWmZ1KU2Dl2BDVGAWpLPfuZDjYP5IlxVvTwq0j1g1XjGHlQiJsYYPu2MvUeX99qt2
         SBpQ==
X-Forwarded-Encrypted: i=1; AL+hErG5QkDQVnStJNrJd+wk96Cm5GVIVn/81JbgMCn+vqqo8z6uMa1PvwDsW2dft9CDxJyltPedrHQKjwSNZuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hZvUvW+N8ZvpenHfBQOOoUVMdKPJN049m3OWBcbkcGOXvuPLz
	aKYlF9+yJUo5I3jQaEURWTvaj/Gx+5tDbuYcDbgMncQajI6WxNNV4yv083iqRFR02bhAN2aNUVQ
	qj+1Ynz/RoJSB6fnAyKZnsW9wUO9OWyc=
X-Gm-Gg: AYBFou287yCnGdezZMsOHpNqyP/nizugy3XBK7kGwAcGE/J/v0MJMUTIo4LvBCzZhm+
	r0cjGy39DVRH5NxxFmc3H5YK1lDwI1Vrch9zeDfm2EKppw8hU9KVWhQWMiXkmJgdn1VvGg8LPUn
	cAyJK/OJUnXreN43dRHhcMyGbkie5WH9fH/M07XreeP5a2zxxF66HTraf9bZ8gzgpvgIMh0cLj3
	eAFCJpzHLf4v9R4CpXv1nbmbapXfRZluWeK0VAXujHInUQp6lCg8iOu+SNYTz9v+0MMBIqc6mBd
	HR51YNuP0tUG1u/HnwR689zbPD/qTZFZBC7EzmRi+wGpISIv+qV0KN9r8bGCt6xAA71yxG5DiVT
	hH+7rGDePmb46EQs3VJ79WOgnDf/bzACHI/FWwspxk1GVIJi7sk3O7B75NVZ/QPsiaR5hSMQmgb
	73NCTJoHU/CeUjgmmrQDoiQq0XxIJPSZ0ZEohJYYyPU1KfXbKYYsjx/K87rrWsgNhR7JX4Rys=
X-Received: by 2002:a17:90b:224e:b0:3b0:e2a9:3466 with SMTP id
 98e67ed59e1d1-3b12d2d9c58mr2213613a91.16.1794191261575; Sun, 08 Nov 2026
 18:27:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105104237.38542-1-phucduc.bui@gmail.com> <20261105104237.38542-7-phucduc.bui@gmail.com>
 <179397468198.3073895.13432289481715460817.b4-review@b4>
In-Reply-To: <179397468198.3073895.13432289481715460817.b4-review@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 9 Nov 2026 09:27:30 +0700
X-Gm-Features: AclHuK8qWYxsmthTljZlA9XrWRKIopm0BhFLBCTL3jBC3OtGTCQg-V_91oKsLvQ
Message-ID: <CAABR9nG9_aDfphSQ3LuYCjQxKe77woHM4Jp92MLsVx=PYDYmbg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] ASoC: fsl_sai: Warn if TE/RE does not clear on disable
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your reviews.

> > +     if (ret == -ETIMEDOUT)
> > +             dev_warn(&sai->pdev->dev, "%cx not disabled at frame end\n",
>
> There wasn't a warning before...
>
> > +     else if (ret)
> > +             dev_err(&sai->pdev->dev, "failed to read %cSCR : %d\n",
>

That's correct. Since this function returns void, previous failures and
abnormal hardware conditions were silently ignored. I added a warning
for timeouts and an error message for regmap read failures to make
these issues visible and easier to diagnose.

Best regards,
Phuc
