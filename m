Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974697;
	b=OYcO6TNUHqLTIMxDhbyFQ1KFzPIg4h+/cEWOs/xIvFnlds+taNKQHIKYQbcILkz3PMde
	 nqnV/jYdgbQdI0Hd+cJ1lBSqAiJPqlS7ZBMGDwnrHyiApzz4guBAfrd2hULR92xJPwfQN
	 t6K+hkp5m6jdcGWiTd3bY4j8HLLxFyG6lAwCcIZmp1mO242s2eIgPXeLYEinqmAluzGIH
	 JFC8Fi96DQPVzIGr+Vpe4s7TQzejw+KZKiu2Qma4lu5WNLdEs2b2kXOo9/o5An5FLq3/L
	 iXJuofwN4r2piSzzrlQ5SmG6y3+uoU7CY8mXKO2RbCw0yoH9vDtMWEXph2NFbZ4Oclg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974697;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IhULN3ktpaMu4YatjnUsQ9HCtFmBLfNxCrZootrxffo=;
	b=kbHMle98BgpO/58j6yin56etglQzPgy6gYhQ2VPtagzZeDHxFktawgDulNRVWvkXKPnh
	 PttZxaFdgBiSlVuk7Pyifo63fC7gKZyGKvB8vP0Fkk5wJcoqVxhdXmuVnOwbE8EX9ul/g
	 f+sLftvgdUCK6wMFFA4U7Iyj1pMA/wLo7Vr4g2kGM4a22t3UMPMxb6QgL1NBeU4MmpfXz
	 udY672lnKou1nfI5Octaa00ZZh9rVGYKi3Ai6sXSiiMMmiPBTIzFX1Ct6p4U7I9fuouqJ
	 fZr3f5WShjjXr1d980TTvZE1Ma6eWx+GZ/DBZjYkdDuBidCYo2OLU2z7o0clDSLcdMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QTDp2qmk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85028606D801;
	Fri,  6 Nov 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QTDp2qmk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2000C1F008A5;
	Fri,  6 Nov 2026 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974697;
	bh=IhULN3ktpaMu4YatjnUsQ9HCtFmBLfNxCrZootrxffo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=QTDp2qmkVvdQ02SbQ9L8Q5K0DOYMChy/MuiXBJehbjuYnAbu2Z7F4uzxaNCTYW76K
	 +Bhg33+LKLhb9PNW9mlJxBox8MzloibsMLDvZgHQurRkrBRDObDkT1gJI1MtqRSNDk
	 Y8khwZL5f4X/kLSlYVtbEZzyTqpmFdatcKwL260aIAP0PX3X2DMfdqCrYIMD5ndCMJ
	 vOvRFl/mgjEkOszakwROajPAEm63EiEE4B6WyfyyCwyor58xLUxvNaogZQK3JOvaoP
	 Wz+2fcrmLd5cp7WBbBNu6/+TLlOTZqHLiVbq3eCMiH8/YIVu6QxJurb/BAAxkNKUdv
	 Xpv7LZLaFfb3g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 12EA828090D0;
	Fri, 06 Nov 2026 14:18:03 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 06/10] ASoC: fsl_sai: Warn if TE/RE does not clear
 on disable
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105104237.38542-7-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
 <20261105104237.38542-7-phucduc.bui@gmail.com>
Date: Fri, 06 Nov 2026 14:18:01 +0000
Message-Id: <179397468198.3073895.13432289481715460817.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/cONIyCvIrg9WSjNsvebqxT2+yWptNc/Khax3J5dOII=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLePpyVLhObx+v7u31ztKiexbw9zIwZd3hnTdiuXehzQ
 2b59Oj2jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExkrg8jw/0jW34riQgb8zrq
 RO8xMNrer7J97a+J56d85RQMssua08vwm13r+t4foo8umJcvPDBvb+fb8PsRGwx2BSTW/eW62v+
 HkxUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> fsl_sai_config_disable() polls TE/RE with an open-coded loop and
> continues silently if the bit does not clear within 1ms. Also, if
> regmap_read() fails, the loop condition evaluates xcsr uninitialized.

>  	/* TERE will remain set till the end of current frame */
> -	do {
> -		udelay(10);
> -		regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
> -	} while (--count && xcsr & FSL_SAI_CSR_TERE);
> +	ret = regmap_read_poll_timeout_atomic(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> +					      xcsr, !(xcsr & FSL_SAI_CSR_TERE),
> +					      10, 1000);
> +	if (ret == -ETIMEDOUT)
> +		dev_warn(&sai->pdev->dev, "%cx not disabled at frame end\n",

There wasn't a warning before...

> +	else if (ret)
> +		dev_err(&sai->pdev->dev, "failed to read %cSCR : %d\n",

%cCSR.

-- 
Mark Brown <broonie@kernel.org>
