Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436408;
	b=WZ2I50F7AhIUmQQ3w+3EGye2meCi6OWeS+Sxa9EDPPdcqt3FiAWx88qIStr7q5wg5RJW
	 BjFOgaHSSxLjWjjtoc1Q5V34USo9szEdn9ifGT1ur65/q8pvaKYqs5NISyFHx8mu2w7ES
	 tPmL9GBoasJhppJyFrE0eMrvWcLmc0ZC8QEovUEbnNxZmi8TD980flmjps0TRntXPsvux
	 kMadupsGWJoX+NK+wi8Phkb/uYUgXTW/1JLqmT8QRJaWO345ij/aouw26NI8DL3dSzb9c
	 Rccsx/crqkyMjBrBo6ptsBazMTbrH2GwmhUg6AgK4Wacp61OhqyhuK1UzFtacb2km1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	bh=+Bpag77kmspJPEOoTU0jcXIfdYDy3+L/uaEPHFY9Zf8=;
	b=f+qLRMUvTwp3FDuqDIsmWIf4MqJD9fafXBMzZRK9rlIJzsEgfBO1c30rMu8bq6BqbPEG
	 iN7OHpM0zDscQViqLb9n+QQMvegOCQB6VXit4etyRM0PSSHUIpH5dMCrU6XfWUTg4Ai69
	 gv7YE/1v0VAU6keDNvzSWvcMsy5wZw3ZeXuV8M8J6k8JsA6jfHHx8qmbov/YKwt2zZG0v
	 58AnUo1Dv01IDFBrrjprvLJGkfeMjDfQFxdqKtbsotVxJSn8kBWP881jbPpx/upDc/oS5
	 2NVUtHkBGo3EGXDn/Yj9S0ZjDOKqbC54JgGpHQcptCHTgEW58TRzdM70tTCm9psrPNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ghx3NeJg;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB1E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB1E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ghx3NeJg
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-487049569b6so1318848f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792436407; x=1793041207; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Bpag77kmspJPEOoTU0jcXIfdYDy3+L/uaEPHFY9Zf8=;
        b=Ghx3NeJgA0f9sK3SAealcFQayGTaGWIhTT5ukcVaMKNFnDexa6L+nD/FOj9DrfoorV
         YFuafn89/swpLSIJsHolc7jSvjYEH7s//AihEF1MfjtAsMg5ImnoPzN96su3SFJrXleC
         8kdBt4GxscCMBb8wgtPW/qwnOfRCtE3I8IusRUbCi22tAdpMYuJ6+0Pnl11JveZPzM1J
         bFbJ8lgWKgGFvVhYYPQzEYFfRYAqATwgyR9iJmaD3GV+lqSX2UgSx5ZVSaSKiJvKaXLJ
         WU/7+MMq/ZzOteAHGXwu+zvL/dfpI/TtcOi1kVGLJbsQdegvzuDj2BIU9I2al2g+LfC/
         Zvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436407; x=1793041207;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Bpag77kmspJPEOoTU0jcXIfdYDy3+L/uaEPHFY9Zf8=;
        b=wlFBNXYC+goXZaQxDTLhSj/PaejIKf34HS/AiBq6eVn6nptIPTDtjfDyi/tTNlJ8mI
         RJu8SceEnvxpQdrB5wNQY5ugOtPwmqhNnaMM5mjfaC6SBNUxFY1buiOtvQgtLYQHVgRT
         bTwl4keoUynaNjLzpPvTm2g3OaG1sH9kxll374yXNOWTwsZBsV55/iuW2oNNkvXfTYQz
         p1ZXneczXzDhcoF5Vl6a51HDsIz2PU+YqiI/UroEbG/QtAhLTwxxIVuOGpohbnxrrV5P
         KFlYy6nC6PYsjFypt2Lfu6JeyieAhsgy2J3AtLG3vVCY6dIzH1ZW9lg9byb+XwxZVNZ3
         PtWA==
X-Forwarded-Encrypted: i=1; AKwUvBzF0QJhC2leotw8e8xMsktkGUzLd0QTUtkLF/Qj+zOWwHq9zbEnmAGSOClzKbUQnavdnuPNMWanuJA6LR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmbT7DmcfLPW/a1N8m4hMmhC08fDm4K0GsJMKqvRW3XpDDWESo
	3LpWFX07XJftkU5prAKWzvo9h3yuh1o7ydwOzYrW3WePleHHZvKTaJFq
X-Gm-Gg: AYBFou0kYDNZKe1UX7OqCVDT6WCALMnQ3oxCHbXQb8Fe2I+YQOg3TfVwwRALBCg2ntk
	U34C5HSvAKpdn4IHWbB0OqHsnbc3z1knR2WOkBQndpDxtwepcNCO34b8CFYWuISkJABoHoxi9xc
	EWC4ddZrlaNM0KguvOS5LCdO1LjshY6dGsJsMfu1RQLgTuoorzqJCUuSq+IYIEaj9+gFkcm6q0W
	OD6NyRv8T7iqMhss3qXj1qoHl8eWT/cGITyQLklRvhLbhwU0G9klPsW4UA2bOFKLr/ICoeBHfne
	fOTAPDxRuinImJkNZXH2bR0xMwfBaQ/WNmcEGQIHrV8tLnY5nYeKGct8IJ2SXrlqmtW2mlc4GCE
	LQbgP74hQZcLv1/2pXdmOc+6DQe1oD/Z+e6iXMVyLd397cbygTQ/+D5FPSBeND+SFyrWra7GZn8
	01jNA4CAtcmSeffw9BF/DmGdNBvH6XxIBnpzRSdsgOyv2+cuj6uqMikvQTF6pu6M4Jr3l/ykAvH
	/f/u30NLD2zVSOuMiNa3z/DwQ==
X-Received: by 2002:a05:6000:5c7:b0:48e:2ac:de30 with SMTP id ffacd0b85a97d-48e07fa6035mr18871744f8f.33.1792436406338;
        Mon, 19 Oct 2026 12:00:06 -0700 (PDT)
Received: from silicon.doe.home ([148.69.129.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818237sm702781f8f.27.2026.10.19.12.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:00:04 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject:
 Re: [PATCH v2 20/24] spi: zx: Add ZTE ZX family SPI flash controller driver
Date: Mon, 19 Oct 2026 14:15:30 +0200
Message-ID: <jjb8MyAPSXaXqHtedDkkwQ@gmail.com>
In-Reply-To: <20261014072109.1759502-21-ghahramani.navid@gmail.com>
References:
 <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-21-ghahramani.navid@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartw_T8zL-ZTluB82Us-2CIWw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartw_T8zL-ZTluB82Us-2CIWw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Mon, 19 Oct 2026 14:15:30 +0200
Message-ID: <jjb8MyAPSXaXqHtedDkkwQ@gmail.com>
In-Reply-To: <20261014072109.1759502-21-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi Navid,

I had some time to review the changes you made to my SPI driver.

I'll grab the code style changes, they seem in line with kernel guidelines.=
 Of=20
course it'll only live in my gitlab repo for the time being.

Am Mittwoch, 14. Oktober 2026, 09:21:00 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:
> +static int zx_qspi_set_speed(struct zx_qspi *qspi, unsigned int max_hz)
> +{
> +	unsigned long rate;
> +	long rounded;
> +	int ret;
> +
> +	if (!max_hz)
> +		return -EINVAL;
> +	if (qspi->speed_hz =3D=3D max_hz)
> +		return 0;
> +
> +	rounded =3D clk_round_rate(qspi->wclk, max_hz);
> +	if (rounded < 0)
> +		return rounded;
> +	if (!rounded || rounded > max_hz)
> +		return -EINVAL;
> +
> +	ret =3D clk_set_rate(qspi->wclk, rounded);
> +	if (ret)
> +		return ret;
> +	rate =3D clk_get_rate(qspi->wclk);
> +	if (!rate || rate > max_hz)
> +		return -EINVAL;
> +	qspi->speed_hz =3D rate;
> +
> +	return 0;
> +}

I think the idea of op->max_freq is that it is the SPI bus clock, not the=20
controller clock. Existing drivers aren't quite consistent on it though (or=
=20
there's HW without a divider register). spi-ma35d1-qspi.c for example sets =
the=20
controller's clock divider rather than the clock.

So IOW, this function should primarily configure ZX_QSPI_TIMING_REG. If the=
=20
target clock can't be achieved with the controller input clock (e.g. divide=
r=20
is larger than ZX_QSPI_TIMING_REG supports or clock rate is lower than=20
requested SPI speed), then a change to the wclk is in order.=20

> +	ctrl->min_speed_hz =3D clk_round_rate(qspi->wclk, 1);
> +	ctrl->max_speed_hz =3D 50000000;

This looks wrong - the max speed is probably the highest possible wclk rate=
,=20
the lowest speed the lowest possible wclk rate divided by the highest possi=
ble=20
divider.

> +	/* Ensure proper data sampling point */
> +	reg =3D readl_relaxed(qspi->io_base + ZX_QSPI_TIMING_REG);
> +	if (!FIELD_GET(GENMASK(17, 16), reg)) {
> +		reg |=3D FIELD_PREP(GENMASK(17, 16), 1);
> +		writel_relaxed(reg, qspi->io_base + ZX_QSPI_TIMING_REG);
> +	}

I don't know what this is doing. Can you elaborate?

Cheers,
Stefan

--nextPartw_T8zL-ZTluB82Us-2CIWw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrWCeIbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoijXkP/32Re4QchJqG2fSsDvgO
TLqGuFK4iM6eS1lxCZWBPQJSAk/bvub0FqnXzMPlGtcHj1wfg8BJCXs0yofwg+Lp
JFgYu/TU6QYBX+qtnwl90wAyPL4Hs22SrDuUbiPbFw7jkmXqxyDfucsgrlsHSrMr
wvny6/MopUMSNgCMwPjpRYaBmfR5FYtl43J1zxgxIcgGUlioEKdilb8FL0QEUvKe
5eQw+itIq9+SMiO6p04eFvwWeGcdO6FKti/XrUu6U0/pAJ2wYLFeGSOh5olR3i03
GgXIl+g+8RdxFF0hBuX31LhgTO6AriXSVXW39Jx8oKdRac28CxLhfQB3l0XURZ05
+c71wQBpYDUYUdPZzwYGaAyyaaKz8ldui8Jh7+wAK+J9ib4bvR762iAqgLXV+s0T
hl3A2d1NzNhT+lM6NdynCArkKiQNpOn3C6KHCDopiIaeUebmdWLFUb5bRJ75OMM4
BDT9iGbsflZ8PUhgZaIdyTqAFygRB4ABwdSV2p5IkBjilf5lH+hQ5w3Xc5eUmMev
jVvqVtKBW/4f9AVUoCPMyig5zqAtI7LZvlrgF+Ed4t98hWwYDcLtTRAh/R8I8sNh
sg5QwgVW6r3DxNEpksJiVtL0acXeXejWvVdF7jIvAOv6OCrsT0T0b2JhdJfesqW2
DLps6w2pKD7uEgXjorZZo5Xt
=eb9e
-----END PGP SIGNATURE-----

--nextPartw_T8zL-ZTluB82Us-2CIWw--



