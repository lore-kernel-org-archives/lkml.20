Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F25380FCF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670401; cv=none; b=ZDOahyIDMaCQebQeAage+AJpHjTVzTmywvgEjFGWpSZdbaW+punpM8mW76hHxy5EY8AeP4TvYqp3GPxSFl3WFC6ey7LC1e/OTDDeT5WFFFsQ0DaD6k6rDjLd9tcSEZrZ9mPhv3QevOZ3nMDX/njpQrd4747RCZyhvF4grgaflsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670401; c=relaxed/simple;
	bh=c/YAoCkqI5uJ0uIcLZRtRK48iXLk9E8C0EfmVs86n88=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cnMCyFtgLpmsh1c6riyTj1ivxAOKdZn6vWVUFpnQhqYiAmLqMWpUeFNh+zuy5iPACAdGBO5TJPQHxMglCvaouHpd4FAim6L3FM79b7zn7+IbuCNKwe9PJXaXQsJbFl/By5DKTYJtx5LvA5SPXWJ00nqvZ3LNwdW97YRLltsdOQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nylq4JSs; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nylq4JSs"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so2265691f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790670397; x=1791275197; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c/YAoCkqI5uJ0uIcLZRtRK48iXLk9E8C0EfmVs86n88=;
        b=nylq4JSsBfAiPYOof7ZeG3sf+BPLV4tsQstWSW4jbhGrgqxEUUuQmM7tpEANBu2huV
         Htc6WMEl/OFrEkSOe0nNrQWMu/UcsvvLGjeAAitIPm6d8PHf8OdPDbGiGVt6JVVdMX3W
         PgTbaQRZTcoSLih2MTkIoa+FnXLa3hTvXFQpmlHlX+8z3XzWxJxrqJG2jSQYVde6tT7k
         bPQk0KuTKarEFIA1fxtrDOVJCZnjHb9pnpP/3jR/PTp9QQn51dqQEaMb7IO8QUJ+u8Mc
         51TMnenJEahXtMD7SeachlW8w5RWSaddNEoZnitcYElbpzLeSBFchaGPOuYlpeY+P4f9
         1Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670397; x=1791275197;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/YAoCkqI5uJ0uIcLZRtRK48iXLk9E8C0EfmVs86n88=;
        b=xbwNT3ASt8L4LFPFTyxYqvZWZPFPR8N0aJMWFo1rEmnS7jyPtyohElIepZw43LuKn+
         MRRWr8rTHd2vLVxlVa957YDGQQ/62G1zWRg7L7WRI2ykw+IUV5kRbB5vI5q9824LEjBb
         qZhvoQsfeQP6Udh6iCujU2gkI8MLDH/00Ogn6UTAadipMk0m5+QV50UuJA/Al0TSf2tp
         xvyHMkkgJV2uaFwzMqbTyuYwDAW3uc+49pTWjy1L0XyBLSYACViIsWI+wj4x7uhqguuJ
         /R37pTCuuX8GMC5HirJxTD4PZdXG/TypCN4niZX2ZTwvKqPoWdJwYKptg+bXUiuCviA1
         SC3g==
X-Forwarded-Encrypted: i=1; AKwUvBzyeNUG4v50sVBXLYebrRuZyJslgvfMSmlaw3MYQmBumfYhY030UQHbPTs1eVaIpbded5bHJfoI6IVvonU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8SU5jcTxXyEyhY7AWh4nshFqbJmyaK8/neAVgahjVmP+BnIEZ
	fBpgRZqEKzi1ppWyJH8ZJn1puGH+gjV72uZ3wTzOAmQdX+ihgtSfMDhtuQYonRboVUE=
X-Gm-Gg: AYBFou3Fe7gaTJyAW8QvBIbi0CO7d6D0ZLXaUKCqr53HJ7sstKeZcAj79Tfi0jZf7bM
	7UuDIgDetp7Xpjw7DrZj1Gqj//xq8WYBNUkDRRUz/lWJuBjWAW4N6vEMdsxxn5Odbe4+SnRjW1L
	Ps+J4rZDCmLDoF+R8WOzqcInJErEdbqXBpu4MloU7riFf1tbN3CXGYe18oORUzXKGvvv9yyQ7nS
	BRCfG1ccVrdSle6/1r2ioyo2JhOYNuAz+QSQyqM0TDKZpwVDtP4gGmQCz04iXESMIDExsosO6xm
	6KynBRjdfnmmpMIVioqi6XvJJEWVStpVh2ehwc59nKE3evQc8JGf8tRyFN7DXjrbpvqCw5sflwQ
	sJ2AczkbMm3tf1LHuTiTUNY4nCKJEZpa83tV5nqyg6lE9u1uAMKPawfrqxCJBoJOB5HASv2wFLS
	wavXeuCExfHVRZFwgZIQ1JsVxBFdh6GLbi+rc57p4mo/zmfdDKvpTx5zYYHo9CrsZgQPLBal9ze
	wg=
X-Received: by 2002:a05:6000:288e:b0:488:80d4:754d with SMTP id ffacd0b85a97d-48880d47663mr22980780f8f.40.1790670395994;
        Tue, 29 Sep 2026 01:26:35 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:c4e6:4d28:61c:74bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4f88b37sm2458205f8f.5.2026.09.29.01.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:26:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b85174839f920e7485dc2924fcc56e243020d2d5778e725847992da712cb;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 29 Sep 2026 10:26:26 +0200
Message-Id: <DLRNOB4Q83KI.3U2QE8AP2P6JB@baylibre.com>
Cc: "Marc Kleine-Budde" <mkl@pengutronix.de>, "Vincent Mailhol"
 <mailhol@kernel.org>, "Sean Nyekjaer" <sean@geanix.com>,
 <linux-can@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] can: m_can: Fix suspend deinit() error path
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260918-v7-3-topic-mcan-suspend-fix-fix-v1-1-e24fa70c754e@baylibre.com> <20260918192125.yjbqjwivucj5wyuf@uda0506412>
In-Reply-To: <20260918192125.yjbqjwivucj5wyuf@uda0506412>

--b85174839f920e7485dc2924fcc56e243020d2d5778e725847992da712cb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 18, 2026 at 9:21 PM CEST, Kendall Willis wrote:
> On 10:29-20260918, Markus Schneider-Pargmann (TI) wrote:
>> When suspending mcan, deinit is called and its return value is returned,
>> but nothing is restored. Returning an error in the suspend function will
>> stop suspending and resume the system immediately. So on error the
>> device should be restored to its previous state.
>>=20
>> Fixes: ad1ddb3bfb0c ("can: m_can: call deinit/init callback when going i=
nto suspend/resume")
>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>> ---
>
> Separate from this commit, but does cdev->can.state in
> m_can_class_resume need to be moved to outside the cdev->pm_wake_source
> conditional since in the suspend path it is only in the
> netif_running(ndev) conditional?

Thanks for the review and pointing this out. But m_can_start() in the
else case sets cdev->can.state as well. So I think it should be fine.

Best
Markus

--b85174839f920e7485dc2924fcc56e243020d2d5778e725847992da712cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCart2MhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMx
UwD9GSqOWoi5O3M1pa2dRkPw2+hSeP8+zmA2nvPc3QxKri8BAKez0OtgPTAITNxR
mr4Ji+RS8Ij/Uw9heQuqW6t+g0gG
=rENn
-----END PGP SIGNATURE-----

--b85174839f920e7485dc2924fcc56e243020d2d5778e725847992da712cb--
