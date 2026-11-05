Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793875227;
	b=L2JB5Lg5td8n4bO6fV6WAWXZw8+Zcg5LM/Jndmo/ky+1Zyep6+7PTxPd6k+Z/rBIr/2p
	 qLrYPg0s0HIdGPl850PArM5zxJvV06r/ajegeF3UFTZyo/gXkZxWxsdR4fVgEpXDQEkmy
	 o2W1dJkCIuv8LE94qR/bNM9n9uGItW0nDvSm6byyuf7fV0KhlyKZLN34NJauC63F3qKkL
	 KuP8RY/tDUjIg1kwk/UZKRXZXn1vQ81FA4K8Y3L6RyQf1BupWPo4QBgOT8mDqkuW73rp6
	 nKEwGpQOOYdYXIXz2apZnQizKBByE+06cWADX5ZacS/D1HNO4M0QEZMFue5CFtYCfxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875227;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=i5fXZcdYmGYVP1P0uy/xvb5fF2zzOJ4Rwymf4gl4jJo=;
	b=0XKStbHoA/fL8pphfBC8iIhqaRlHrozSEsxkt7l50QQhvLPJg5GQBtVyCKXTTH0ZbeE3
	 lUu+sIZx6ncPXfHTsDY4bsUl+nxy62ceWfciRaQH0aM3K94p6gksyf4UGZHZCKQ1+LpcV
	 9ogU/3Y4LVH21Hg8n5DhOnQ6dSbALvjSk5+uAkNDebV6sBEff5J0Dhd7ZX0Yh2Y0tjb/3
	 RSSAC3kT1szkECXexAn96jv1y5muEJ2oJGcTxDmw+4KQRiwJIpi7BVs751iQMbQutH8IA
	 aKMY0/lASJM1ZtyMYhtOngDHp3eVp6zRPhwuRvVhZ16lwsNMzL7KJit+xbvMH24y1iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=INpu17mW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24878606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24878606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=INpu17mW
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D8E112006C0;
	Thu, 05 Nov 2026 11:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793875216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i5fXZcdYmGYVP1P0uy/xvb5fF2zzOJ4Rwymf4gl4jJo=;
	b=INpu17mWiT9vQ9cPCGcFRrilTCFTnnUCwtge5G263ucwrkH8lLYHz/cAUxGVmU9Y4z0Qhr
	aUgauW/No/V2wSw3dpAgzO//WNUK+ApeFnDX58uFjVOZxt/D104OB9Vgp8DbSL1NqSyC+Y
	sNAfgdqk0Vuz6z986cZWYeoRwkzy0DBH4RhK6d5uO8FoCLzzE1awiAKMozeepg5nOvC6Ht
	MioVL51mp80v8gNSdfy1ZPEPx53OGulOXXuG2tRmPPrOEOIHg9gir977kiHoly1cAR2K5w
	NDICcEQFYJW106LcxSC7L7FiO1lSVeDdtsTCaF/8heyeB4dWgdve6yObhD1s6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793875216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i5fXZcdYmGYVP1P0uy/xvb5fF2zzOJ4Rwymf4gl4jJo=;
	b=Vdi10IwON8VihvNyR2DERE4ZtyQEtZWVfU1JBtCaYbNJVkexNap7gCNEtG7/QSbw2qygMm
	gpauzsTyPrebxieGfHRnO66PIWV1SjVbZ4KTHylvwL2jAqXxjzToQzIh8dnSiVG656nphe
	ThJVXBvJmWTMN31k2bJzIBpf1QMr7geMc78P5TthP3iV5r0ny4yBe9U/btaRZJCDaTHYKS
	+AT2jdn7rg3yYGkSgE7k2wQ2V7WJrxGfZVxnc4iYw5l5u+xtcCsZ9oyIrVvvF6TEsZ0uTc
	do3ZoLZ3F41MG2NNnPEFr1xjLEdkAbByfa09RMxYcsa5E9O+g6rYWLdHWa3dcA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793875216; a=rsa-sha256;
	cv=none;
	b=eAZiNIIn1yAQmzqt0JEr6Ub829z6QTj/5bj6RCdPIycVKVC5w/ON2rVZNNbBgXzMgxAb3Q
	q1B27Y5su7jv8obNIjiNAjg0G9yWMjyxDUx4be41+Z+6IoserS4XswJj8qUYJa6Rk6Vpo1
	Vcm3d0xbUJloNYSx/J9JyD/DhJsxlaUQKAuTOSHMIwHT0ObAOSU5kdLRQIKv4+xhSHCDfH
	/yZ8zLUsD1pRo4icmAE7by+P2i7MCSR4R+vY2r5dy4W2Xd0S+19PZY0nXXLdzSqcZWYmkb
	NDA9dj4Ix+gtTcb5KMpNZWrwuqrnJt6JcJJPzdbxBsGzieQLtXf8PkIMvZnbKA==
Message-ID: <7fa397188daea5fcac036864534a4272cc2aef87.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] reset: Fix reset_control leak when put after
 controller unregister
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org
Date: Thu, 05 Nov 2026 11:40:16 +0100
In-Reply-To: <20261104162038.48622-2-tzungbi@kernel.org>
References: <20261104162038.48622-1-tzungbi@kernel.org>
	 <20261104162038.48622-2-tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-11-05 at 00:20 +0800, Tzung-Bi Shih wrote:
> After commit 8c91302a29bc ("reset: protect struct reset_control with its
> own mutex"), reset_control_put_internal() returns early if `rcdev` is
> NULL.
>=20
> When a reset controller is unregistered while consumers still hold
> reset_control handles, reset_controller_unregister() sets `rstc->rcdev`
> to NULL.  When consumers later release their handles via
> reset_control_put(), the early return skips kref_put(), resulting in
> leaking resources.
>=20
> Call kref_put() in reset_control_put_internal() even if `rcdev` is NULL.
>=20
> Fixes: 8c91302a29bc ("reset: protect struct reset_control with its own mu=
tex")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
