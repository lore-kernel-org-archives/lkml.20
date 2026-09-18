Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F2746F4BE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789710276; cv=none; b=AbqXC3us/Utj4UQqhIFz4Wd3Sy7b0ojG3Mu15wY3xJaURdUZ03079+p5lnMO1Gath1fJHpUHbU7MoFsn717peBkcVux70cnp7tr8F6WhQdtCrcP9SVZlmQNFdDCF7/wtt8p/SWiKAQylhY+onciFIOgibbXsmszeA29Z6z+iHNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789710276; c=relaxed/simple;
	bh=rCv6s6H6j29TvkAkp/AsAzYsZj8a1EHgr/XGLtqd+eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwPH4K5ZWTukXA1IxtvOOk2+wryUDSEszb8WYc7XTNmIJw6y+M7+Gj2aQ9KFnwLCicBzzCJU00gz7S5jGFsRK/uM1OeDCwT1ZIcMNE8C+IeZAZEg/X5b9/8OVHys3kVUw2EA2HrLIuGZ8H6T2nM3cz80ucO3MTYY1Qij485gpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pADFO+VS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pADFO+VS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so159879f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789710273; x=1790315073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCv6s6H6j29TvkAkp/AsAzYsZj8a1EHgr/XGLtqd+eM=;
        b=pADFO+VSrDD+enyIw6/7dNub7l/OWodGCD9OrW4fyoVgUGVwh50ugGZ0oRlqdc7wu/
         zqY+/nmXZqJHo84Xpnq9tlM410llWSpQmw5ggceHRIJRXwkWxUsGlBHk/uBS5YTdJHKj
         i31Dz60o4VEXDBgFMclIcfUUi8bXbSDijxqxjwTH22qoYWJz5v/9yIyH/nwa5GmdJdkb
         zC7LyCMluqrJpkRY9CjgTtEbSmHthCDtThLguKqeZY4fLR95crrnWbs0qprAodqi8CuS
         DZhOkMGbJeeN6J7HuUHui10KeeEw8YkK/L6h5tsKjTvONLOV4fAbVklaF+RQBpWjjRev
         6h8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789710273; x=1790315073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCv6s6H6j29TvkAkp/AsAzYsZj8a1EHgr/XGLtqd+eM=;
        b=CLFP4YF/mXPZ2zWjeOQken/w/+Djo92mLkRrOeB8RHFXHliODacGNHFojzt8FZ4F1S
         IHYePI5gLSemteBj0xRKs8Wqji6zLjrSQtQZQ86CqKTaghQ5ARcWwW+CWz2bqetLXAEt
         cbLVl5FCCvjLrRbjGxtCXonjzW99pwSVXflWn/nVB3jOnELr/DIZUZ1ccypWJYxAudU4
         jwhIeo2tZ1BNcm7Lrzh9uL1YMK/JRU6f1OH7m5An5bnx6kOEU5x6MkiIvKH9SzMqvIaj
         VDay+a+H6P/VC7dDjdYk3Eev7p8MDPUO8dUQK16WxW0gygS42smRqzA7prWLaf7FFonC
         puRA==
X-Forwarded-Encrypted: i=1; AKwUvBw3Cupqxnee+d2Rp2YnWx4PQPwfKl8OfRECOQJ7omShHVpF48RvI9xPw5pWUuBNP7jbCch7whAiGGGDL1M=@vger.kernel.org
X-Gm-Message-State: AFuF++lKq+CuPZwdh5zs/9js4Ldg1CzyyxOah3CcckAIECN2L3yU5exD
	vUEn1tbl+pF2Pmh2ojFK8RbAinRxhQa2/K79YKU7/Crh1CjYgTTdtWk1Y0ZlchR+RSw=
X-Gm-Gg: AYBFou0gIpBS4VptC1PvhxJPROkh4vOVwFGYdQwvSxfdLCofby8EHKeNuZW58EEwuB7
	RP+Fp4pg2pXk1u8fgLRUnQG9uf0WzZXNkyvicGxxAyVgQLr5vQPJLqm0ndCz+yqyZXFi9mKVVEb
	ATV/EHWUzeaVSkJseQJNDw0ZO7LO6/oey1xdcpOAgK70XTwbjwpUrjSQthqrwbJb+kDkpocFUwP
	shMbC1HxsXro83ElKdd5t71OSF6ZyYTRJmPpLUHrb0qstZjlm2w4SfSJPF5KBfb39szmAOqXB3R
	3J6OepAVbK6yP4brQx9d2ROuUo28UFsbTg7C8+OoYdyP7obVTBRSH7W1Xe5nVGrt6Rn/5NRxHlV
	hFe4R5b4+pSQ4uPrKBDk0eOgy1WYAOAeJLp2Bb+IfaT3c/v31DCuppzpoWlabDsYEG6ykTyhZFn
	c5NJPcFqqMjn0qrRaOij6V3Tisz8W0WrJlrpFg/c+Q5PeREkHcfwJTwG9/bibEPjCiP6q7DiPp2
	VrQKGwU4XhJ8w==
X-Received: by 2002:a05:600c:46c5:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49fc573e80fmr23829995e9.15.1789710272498;
        Thu, 17 Sep 2026 22:44:32 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fc7cebae2sm21277355e9.8.2026.09.17.22.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 22:44:31 -0700 (PDT)
Date: Fri, 18 Sep 2026 07:44:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Peter Huewe <peterhuewe@gmx.de>, 
	Li Jun <lijun01@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tpm: remove extraneous #ifdef
Message-ID: <aqzOnj9-35h3gAPD@monoceros>
References: <20260915201305.3529682-1-arnd@kernel.org>
 <aqyMnwklQX3ciUzf@kernel.org>
 <aqyNgA5NdSTdrP_6@kernel.org>
 <aqyOUgIa4lsUwO0I@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fx6n3tb2n2barde5"
Content-Disposition: inline
In-Reply-To: <aqyOUgIa4lsUwO0I@kernel.org>


--fx6n3tb2n2barde5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] tpm: remove extraneous #ifdef
MIME-Version: 1.0

Hello Jarkko,

On Fri, Sep 18, 2026 at 04:05:22AM +0300, Jarkko Sakkinen wrote:
> On Fri, Sep 18, 2026 at 04:01:57AM +0300, Jarkko Sakkinen wrote:
> > I pushed this to for-next-tpm, which mirrors to linux-next.

I don't spot it in

https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git for-=
next-tpm

, do I look at the wrong tree?

> > However, since this is -next only bug, I guess I should squash these to
> > the original commit?
> >=20
> > Just sanity checking before taking action :-)
>=20
> My suggestion would be to amend Co-authored-by to the original commit
> message as two bug fixes is significant amount of effort to make the
> change right.

I don't care much about my Tested-by: tag, so feel free to drop it.
Promoting that to a Tested-by: on the squashed commit is wrong for sure.

Best regards
Uwe

--fx6n3tb2n2barde5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqsz7sACgkQj4D7WH0S
/k6LYggAqj4Q4ZuiEmUBIkUhtlL31ErLVXbu4uyQVdW76MnLeYBtJPk1nZJvDeTg
onhM1jLxNxV0qwkOUtYAe3c1OiBt3WfZtyhM7rolIXanvUybk93QwFjHHqh5o9YU
f3AfFHu/AeqX8rNkfaYPDbKGz2cJdMZVIcy5o7m84yJf+kkJX6MBmIob0Iatv3wq
X3ezfmelhtHkTGamLnGqPgGe/lMjiRC5ypWE5NLzWWMu6G7+QLDZ2GUcrcE/Dh3X
sjZDQQwT30fmEew5EEu1LH4BjWueuO1vocKSVIltR8VBc6y20ztkLO6jOBU0m0aH
nOAJlOqZ00N/DHGkoDpy85lXtbitrQ==
=ikNW
-----END PGP SIGNATURE-----

--fx6n3tb2n2barde5--
