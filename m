Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976916;
	b=E9mXBZy84e6UivSrf9Tf85lv0KbtH2iHEUcj5A/WVws+bU9YY4nypAQ4TxuJ8us24N9p
	 rYeSigDDKfJQSmAfakAdl/Ggs8Ft4fyZCdYsmivRkp97Kw/DYeXBu53lo2yzqG6d7mSrE
	 pwes3/TK3nTZRd3W/g/ah43mJpYvbzSP7N8RXDw38aF5TUuxos6qrxlRbqJ433KUUNxcB
	 cqU7zwkRC74JauUZP7LcJaArV2wCpHaAsSok9RmIBC54HgGp8l6oFF7yrBCTW5DO+ZK3u
	 x9k72rvSOdA8arjAkx7guYtkL46xtcmi61Mgn8pl11gTcu7BMMTWVP3D08+FzVfy2MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976916;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+nrK2YFm2tTLcI3fq5wsXDhJRtmhHdtZNvzuXe8Ht+U=;
	b=BA3F2+emVL1OgKtUuO04SCWTcgEahaOkpnf5TbMTpTuC1t9mZMjXvVvFhjPVnWWVHbbE
	 BiACKFN/U6k/k7gs+omF7KmpY6MLzmVVgA41APRv2r2U+9MHD/7LiPEmsoWFO3lkYCEEN
	 lBJb1JvajmDLuVG8Wtawce6AkuGbxceZwzz3zvk8sLl4+CRu3dqqUfY3qpmGdvVOdamuC
	 u0ZxNtnNrrrGdm7oYAeKlABR56HWBH4YMSt5rlhDJnAkWkv/quUvHDHh5GCTb0vshnqJ6
	 68E2h9xvxwYkBuJ1zENNwZwqjPlbLdl1+JDkhNiV71sgcE5lZu9SBtzg2jxJo9V8BQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NA2MeEcB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A1A606A329;
	Fri,  6 Nov 2026 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NA2MeEcB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2748D1F0089F;
	Fri,  6 Nov 2026 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793976915;
	bh=+nrK2YFm2tTLcI3fq5wsXDhJRtmhHdtZNvzuXe8Ht+U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NA2MeEcB05+GcKTGYnziqBEnacs2HijEyO0g5KLtQRWF8X0mSbdxki7/QgbQiS4Z4
	 CJ1rqUjrgeBBgbPvCNTeQ6pwmN6YWz3EioQTjRdxzIFrX4dOeddxcwJluTVqO7uNlo
	 8YmCetxpXj2Q5Ry6aUMhznTGbp1AV0IV9uuxDkmmgQE2C0HbaCvHg2JgEYRJzDbDup
	 h/NY8fU9fH46LjQ19/1v1ynworZ9WklbPuP1Ztg0vRHtCJbHrqKwop4kBdJDVAsitT
	 FLw6aZtDpPTcx6vGV/+l1VziMRUauy/qIAkoM6azbpOqCPOnqEB72D1GaU8dnrBOSB
	 VZx7fLJCjRk6w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9C8D2289C309;
	Fri, 06 Nov 2026 14:55:11 +0000 (GMT)
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
Subject: Re: [PATCH] ASoC: samsung: i2s: Fix runtime PM usage count leak on
 failed trigger
From: Mark Brown <broonie@kernel.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103013125.1067-1-laixiangwu@cmss.chinamobile.com>
References: <20261103013125.1067-1-laixiangwu@cmss.chinamobile.com>
Date: Fri, 06 Nov 2026 14:55:10 +0000
Message-Id: <179397691069.3231166.15159234758356297627.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=743; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tu5PRQfWNSpyDTM9czH1vzhTGHOj9DCZt/mYaemwVMY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLevvI/LM/preDEqncgP8/kx/Itn/97/zlVau3y9UjH3
 K0sUaYMHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhI2C2Gf5b1RwoeaD595mSk
 Zut35GHVN8F3C3R4JRsVppgudlJ6YcTwV+z8/E+f7k46k/LxnI/KFUkrEXu/b68uv4pX/6BW+o5
 TmBUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> i2s_trigger() calls pm_runtime_get_sync() when the stream is started,
> but if config_setup() fails it returns -EINVAL directly without
> dropping the reference.  The matching pm_runtime_put() only runs in
> the STOP path.

> @@ -936,7 +936,7 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
>  
>  		scoped_guard(spinlock_irqsave, &priv->lock) {
>  			if (config_setup(i2s))
> -				return -EINVAL;
> +				goto err_put;

This mixes scoped_guard and goto, that is prone to breakage.

> +err_put:
> +	pm_runtime_put(dai->dev);

If the subsream is not linked then the core will unwind th start which
does actually do the trigger() the commit message said won't happen...

-- 
Mark Brown <broonie@kernel.org>
