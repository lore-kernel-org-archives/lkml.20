Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793573126;
	b=q1WmnQbalTjHv6QjLOnPC0ypwSr5Y+b9g2BnNdKxZgTCKgIOpG1YRtYQ4eeAng9T5XWP
	 CnxhYQsxVkC8MWDEFLIFo22Kvs8QMKkz8nhVCipRSNCfYHw9VqRTbu1LgWAfqCVubDPRr
	 4d0203FN6Pxho06ejIeM799+Frbgkh4vyk20ibs5lZFJnI7gF7cTVU1Uw3PW+0AbNds9Y
	 KKN9d0xOt1sWbkPq3KYLUwl+npwmR4XIiDp8vzgRGoBTVfVquCbPh521lzalvf1ut5jHh
	 fr4uU3oFHyrVGVTgTbBP1DA3+hvJ7JfDLZwexLPvwRpttvTCcut4GGKk/wPAMSiBBdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793573126;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=BzRuFBupQjQiDyoa/qXLe1S7CqDSM/Br1lwbCFNkGzY=;
	b=yi2FWvTAtpIQFgLokQkG3fwIAyohQ3aBN3/g+OmZFOHsAv+uTV5UpiVs6tDfI8EJZGCV
	 GB0iN56yC3N9YS7efPoqHZILtsj01E1Ibh8pt/7tmzLI0GgDDYDerR0yh8HkpJ4CTefDw
	 3W0OYo9QXdGgY1jsw5nEbcHBaFC7xNdnU1KCWOT3GGv0iQtDKjlfUoz+2bAX8+/ppqyju
	 mu1h37kkw80Q4JBT0KfJwuhDMDiXQsvrL00YtgAMfQ9Q1KNnSVKGwImAnWWO9A/QFoRAp
	 PdRUeCYQHil+rAFyyrHyO1BH1QR79dQMH1ECPgK9kxKOiPPAxdALD8e6jMxWGWkL+lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wk+Rtdnl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8F2606A324;
	Sun,  1 Nov 2026 22:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wk+Rtdnl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF791F000C1;
	Sun,  1 Nov 2026 22:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793573126;
	bh=BzRuFBupQjQiDyoa/qXLe1S7CqDSM/Br1lwbCFNkGzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wk+RtdnlNfF0ZU1JG+cJnT6+Cm3sXxVjQsN6TARzsEQX378ayC2zgTKW6xx9AOEo5
	 SyEx/0OuPrv7HTVQpfufdTXQOFuXF9JtHJ+qcYjlnl2TYByspxnxJr62180NhiVJVM
	 LJ8JgSYfK85y4E8U6OCDDOmIgxlZuoKrVvo6gZ2vWv/WKihj2lOK/2EmYhYaiMzPU8
	 CcJHn9A6ENzI11QIP4qI6TYpaiw0F3cO2j0Un0qjp46PzoQVVHMDc4E1l+9VkL9gVN
	 7b1fB1JQBA+BnG5XpWcEWMPYuFlLm43xq1SAm3W4Tgzf/P+Ux3axqj7xkfrtmSAIJj
	 ZS93vYt2DBpMw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 50F102065139; Sun, 01 Nov 2026 22:45:23 +0000 (GMT)
Date: Sun, 1 Nov 2026 22:45:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: heiko@sntech.de, linux-sound@vger.kernel.org, luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com, lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: rk3308-codec: describe
 detection and ADC routing
Message-ID: <aufBA7-uC7udM0qa@sirena.org.uk>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-2-zhengxing@rock-chips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bSSLOBRclnUyzkCZ"
Content-Disposition: inline
In-Reply-To: <20261101044149.2018744-2-zhengxing@rock-chips.com>
X-Cookie: Whoever dies with the most toys wins.


--bSSLOBRclnUyzkCZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 01, 2026 at 12:41:47PM +0800, Xing Zheng wrote:
> Describe the optional detect-GRF phandle and named interrupt resources
> used by the B/C headphone detector. Retain the legacy interrupt order
> and index-based lookup when names are absent. Document the detector
> disable and reversed-jack properties and their resource dependencies.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--bSSLOBRclnUyzkCZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaufBAwAKCRAv73Ows9A4
iabwAP9Gmr6n9IX2ZB1GxaMa2+TbbQ+zn3trx0LRgC/h5052OgD9Gp6fMckCkXWu
OhGm7TPU0nV/e3bw6I0v2x60AncDWA0=
=ngH3
-----END PGP SIGNATURE-----

--bSSLOBRclnUyzkCZ--
