Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793269799;
	b=zO5rRyexeSyVC6oIedJXOK6Sdm3Z1ip2pHLt/X1IBXtXZ/uiFYB79mdNLyq+acmHu+qz
	 3idGYalt7XbsJFaI3wOVMUtbKPmQBhEhUJ2PZHyangmwma5T0iSVh3fekZUjh3TITKx5k
	 L26jDWB9S6hQq11W2yBTtaZJCITwFF2X7n7qoqGLTfzsVqF0sxwaGkXI4ydja6CPWkf4G
	 O1RwhttfgfnviwvI0R4+0/FYM1ilZW07aDl30zGVV37SAROjkbqRKT86pT3jJ0UQgC39i
	 JtKC6wxIQICjNUNO3fWoBheZqAR/xXEWCZmDenSA7MIpP6jROxS/C+pg6uqbR+s/bBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269799;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=DNplS0zzpx7i/xZRFiwu1m1gWz/uU3B841QxYLsWDE8=;
	b=F4CzWQ2zhUkEODuUE4Ju+G1L3j0Sbdg9hmxPvAZVIQy0qvRz0bzvGeAvYzc3Fs7gf11u
	 YHD5de1HivexYDa1plcLlrbFxAY8QX4aLXrrsVegJJInKbKAP1eQGFN12gMfxCjuOqdeh
	 xgZayW9jvQfIAXsiUdE3+ckqjH3B7yeC0xK11fhHeaHedwcrB52p0sGtpn6rq0h4Dc98/
	 n/qh5T6At8dJRbucMUg5RIbJp4tFrBP3BEfGLyH2D2DKuvYJ3txy3hSbpd4uS72aMRlc8
	 prmh9HMLcaKKv86KIj17At5hMwO/4Y9C9OXxRO567eqvRcE4XLY3tJ2pgfadmRvxXeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ouu3AuL0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4533606A31A;
	Thu, 29 Oct 2026 10:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4533606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ouu3AuL0
Received: from [IPv6:::1] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: lst@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4DBAB200467;
	Thu, 29 Oct 2026 11:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793269795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DNplS0zzpx7i/xZRFiwu1m1gWz/uU3B841QxYLsWDE8=;
	b=Ouu3AuL0td/GA4CXCAjqkAnzYyeT5NMT8eTLTB/dP/g70gpRL2muYm+LHuykTlbc7pzZmX
	6FD0solH2WX/omdPMbWp4gj5e5PgcI7mOmj1pdSNARzNjb8GSxPNFkZOCst1+2jxoitcrH
	9rz4m555/XT0xz2e0J+yN9s/0yCiVkJIL7a0KRNwpYUb5l9gl0F//PVZBnHRTjUbMm4Fn1
	z6CJjulAGMOz888RDmKJ0gU2A9Mr2mCRWD36yUJHP44GLDMPVCN1utoTCoClbjqaJG7E6u
	qpilQFSuo29FPvslQNVLOzgdcnZVLqvM0clx8BE6Ka63yWbnNLbLTAB0XLAN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793269795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DNplS0zzpx7i/xZRFiwu1m1gWz/uU3B841QxYLsWDE8=;
	b=YQ16bMiv/93sxnl9JqbF24Sbj6pC0xgEZhW9f5RaWujz0EMIt5Dcs87Int1qAwHJ77GEV/
	Z/tju4N6Wgc9ElEvrgI/1mjkVK1twZD8knwuEB93hF+XnyLiijsFDgit0nvA72ElQWG5El
	iE8+NPfzcVxw0gZ9AUSQi0axsvLqNJM1miWNBZuLRLsJuT6JCvPxziJZvnmbGKXczqrBOC
	dbiTh8bAKFYrLsxyZwpH27weRWS/NqhtTBvCMevWJEEQNic8XUPWQTk+1nSkNlKzqe87Mw
	8sCnaQ74l+xLGzzEdf1lh7DMhJ41ZJLv0gvQo/Dv/Jy29hSuT+/JgCfAiaxaPg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=lst@pengutronix.de smtp.mailfrom=l.stach@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793269795; a=rsa-sha256;
	cv=none;
	b=fWBfDvbpU5d8hVbO1VhAWCs2Snz+MZ/iyDtvFGSV42bwV9cs0FSgeo27XWBUGshFI6KUlY
	yH7T4D8JP4FoNqIOcu+DpGB+XD2TT4ogF01tFarf2X2qyw7o8tUJl4rr76chynHPgYdJJm
	egKCyG9TmQNepL+yZehQKfnwW6wprc2xsbluqTmNvVlwJgbdCY+c2pvnamdoSQAqI7xK+Z
	5pej/vDshrujw9SUnTb64FyFXYU1D2lX20hnK+BMv97xwsYRGrhKb+Ec3uXLv/FTay0l41
	A/gT95DSGSG1E+qHW0+CpM9yp6W3/n+BqPgkeK5LOh0xMf5m+XdQG4ajv/nWXw==
Message-ID: <70665d4cee43685f603beb94f220848cd00e02ab.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/etnaviv: etnaviv_fence: Put base class first
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Stanner <phasta@kernel.org>, Russell King	
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 29 Oct 2026 11:29:55 +0100
In-Reply-To: <20261028103129.1036380-2-phasta@kernel.org>
References: <20261028103129.1036380-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Am Mittwoch, dem 28.10.2026 um 11:31 +0100 schrieb Philipp Stanner:
> struct etnaviv_fence contains a struct dma_fence, which is its base
> class. The base class should always be the first member of a class.
>=20
> This allows for removing a deprecated callback in a subsequent patch.
>=20
> Make struct dma_fence base the first member of struct etnaviv_fence.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 5c23182f4d33..e51a310c8d70 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1148,8 +1148,8 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, st=
ruct seq_file *m)
> =20
>  /* fence object management */
>  struct etnaviv_fence {
> -	struct etnaviv_gpu *gpu;
>  	struct dma_fence base;
> +	struct etnaviv_gpu *gpu;
>  };
> =20
>  static inline struct etnaviv_fence *to_etnaviv_fence(struct dma_fence *f=
ence)
>=20
> base-commit: 731ba09867520c047c7de53f92e384808e0b638e
