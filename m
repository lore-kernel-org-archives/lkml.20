Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595444;
	b=aEDMWUf1no0aVTDf0UcGrFjvODj/Lup1QYd0UTIxpYrepmOcu72SthlLi7PPhrE6zH8Y
	 wc+Jt8I0SO33eV8OkYdFxYz773SzvM5KznD5Ic4FId8OWU5gJfW6hQMIVj7Nal2lH2Qzl
	 LLVGk1RtdmbC6D0Wn+FxWd8nfgztToc0BerAdSojSW0xgxgknCEUWknyAOaMpoi9Yo1zd
	 p+A34dT/fieoKIrriFT8BfAz2S02KvBfVFIDc0H5KHhuj5hRPElbw+yNwcC4jn2wXZz3F
	 OqzaUVMvGVF3N8c8kU69E6uggn3Q+v0l0o6p0nXLf4AlSbW8lfhBivs+hNbWgoQfQ3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=W8mbMH/zd4LfA7Gj7RbbT0d7KvJilvfrispWtDi6taQ=;
	b=TlBYsxJWoZCwKqkKiM2zUdTpOYVnOjAB3t/f+jIP1znWcntVmh6b0rax8wbHXqVQ3DuV
	 tXi15O8ZKw0kaktlfG6epoMmEFDqyhF8i4BMIZKJ8dSsj8DI7kdwwR4E3vAK5mlEQ8/SZ
	 5ik/wUFf3BHA/f1Vl/eLMipuTnFpDP4GGsOxtsDNtl0EYPZqs9wx2wz+quhNgyJhrPGJg
	 dw6bCaVTo2tmuipmz8guDi80QnPglJnrKM4bfVIvgujYCACDBM52L+yFRCZjX8fzh64z3
	 VyqmUE/rign6JqLFvZByVQ6hAAARzlrXlkqvoNMeqg45hqKT6RUpA4dOnnN/EaiDUdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="jwTMR9D/";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F293D606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F293D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jwTMR9D/
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so9988395e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595442; x=1793200242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W8mbMH/zd4LfA7Gj7RbbT0d7KvJilvfrispWtDi6taQ=;
        b=jwTMR9D/gfasU3/o9bndwoGOsikOYd3KZcNt6YADXeFTnchLV78PDoLv4SYJX5BFBS
         Eyj/6G8mH/ehvkBe4+u+i6t3hOBWF/Gk0ulUTgVFTElVCxTQHSRoL3dJmUds5/ydNZvd
         HY/O5dHYG7C/mU1JtvWd9xt0qf1j4O52JM0M524yVle+uGYziWoz3TSSRHxFfmvTfib7
         7KrCKvDsq+XRqXoNXUMwa8nPzyXizBSazY7dcvkJ3DIJjlsTGSX+wJK4j3+TQlhptZPr
         PAYDXMR2Pe79rIPp0irRoaTfbkppt9XE01kSTtpMGfWYBZ5D/PT9j0jS87p5DWdigitm
         kWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595442; x=1793200242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8mbMH/zd4LfA7Gj7RbbT0d7KvJilvfrispWtDi6taQ=;
        b=whINr0YLo7umXUvDfuLwhTaaEnPMnFLV2nxCsGvO7cwzFZg9LEUhKQ0UUmIj6jG4hn
         a6mos7o4OCU7aJjdZCkj4RYisMSv0xK6ax5xUZx0KRipQ+8G7hqIE/8RDFNmM2T7Badc
         t4uM3hpwYsXHDsgw92N0TyNwummaMsJMBDLWTkkwkBF3Z8NXxGAJZW37QYE1jzz19Ian
         GcTCOH2y1F6dusGHOS6tvLij3YnHBnkFH4UuDhYh9Z3XZtOXSVjZIJYI93I15nrxibkW
         YI1yFj2CdfXP0AXVEoqo6t73kWxioUHQeYX/CFlvaI0HY1me0/sDWG1azUvke5Fh9FKS
         Dbpg==
X-Forwarded-Encrypted: i=1; AKwUvByFFLenLWD0UgeC5YmK8UZ+Yg+5dvBQwdwBMLX/8LhxxvCoDOCYwyF7gTNwKahnZXGwV4w08F9BG3TQF0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ6YtKGByAx2GGIgaU73R65ZFCgM3JWRLQAtPyhIcAdG77NqH9
	H85i9eHTad3RPgvbkTBGBg0FE7Bm0p5tLBUjU2ASWIpxxh8aii3ME558soOcgBq+r/M=
X-Gm-Gg: AYBFou1YvvK4ue/6K/0VLTi0IlhtiGiDU56OLep59mQFV/srMvMSJpIf5gfCiqZBx/C
	i477Sxz5n5moH3KkjLF1aXfzGOXvfRopJP9Q3wx7c7EtBtQ7Y0MbFVYYDIx4yvFeE7G9ohu+Lpg
	lkeZryi3IBk9BQmV522xXFl3H5xxYbainQfG477F72nhUPcgGGHHJ9D3xHRz7Zd9SK4lgOoU5p0
	hy2LwUtwaOp6fS2N+EvodPhN29Crhr4U/HduQZJ00PBd/6X0cxtZfQmsjSFijRu+EfshePKVOph
	Vtqpy4hhsgL9UDwC4euLNo2grLLXZaYct6p3ULun5uSC/ScVt4YKZ3uvZEaWHkaM5muLl0KklHG
	AlvWVHV7J6eghhyD+6X8Islj8Tfkxk3U3mQc9K1DYo9s/bEj4ReAT8ifj4OBPMEJwSl00Lv/gwR
	xDHIE2vFQVXBfGZvhqoZ/lFWsfEU5CK39U+aeRkQF+ZLWajLNOfaAFr4uhFRHKuAUiKt0WgEYDA
	b+I4T+cUZqmDEZH3h6plC3BSDerTyykoCT9LRREK+vHpSn+IOXFUJ7K/izcRpcEd8KTqh+dI6BZ
	BGUSZSgv1pE+n1sbk2B6VOrKataQ8NmbmzvWin2Ooy3nrhEE2PrFanYQ+fhT2Uds
X-Received: by 2002:a05:600c:3d92:b0:4a1:dbb7:bb44 with SMTP id 5b1f17b1804b1-4a1fdb1d84fmr50055655e9.5.1792595442409;
        Wed, 21 Oct 2026 08:10:42 -0700 (PDT)
Received: from localhost (p200300f65f19a904634661a51962f5e0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6346:61a5:1962:f5e0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm58202855e9.0.2026.10.21.08.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:10:41 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:10:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 5/5] regulator: Add TI LM51772 support
Message-ID: <atjVWgpbnejKtblE@monoceros>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="5zdcowfgw4xunjqo"
Content-Disposition: inline
In-Reply-To: <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>


--5zdcowfgw4xunjqo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 5/5] regulator: Add TI LM51772 support
MIME-Version: 1.0

On Wed, Oct 21, 2026 at 12:27:46PM +0200, Paul Louvel wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

<linux/i2c.h> already provides both of_device_id and i2c_device_id.
<linux/mod_devicetable.h> provides a plethora of more device_id structs
and thus implies a lot more build dependencies. So please drop the
latter.

> +static const struct i2c_device_id lm51772_id[] = {
> +	{ "lm51772" },

Please use a named initializer.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, lm51772_id);
> +
> +static struct i2c_driver lm51772_driver = {
> +	.driver = {
> +		.name = "lm51772",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.of_match_table = lm51772_of_match,
> +	},
> +	.probe = lm51772_probe,
> +	.id_table = lm51772_id

missing trailing comma

Best regards
Uwe

--5zdcowfgw4xunjqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrY1ewACgkQj4D7WH0S
/k4kQQf/amz6cRsSwMfisVWMIoPvzfkvufe/wPOqr7qIAWWvAEtFhzMZsmkejVae
c9Q7/m+QGilqgpy6KS56ACE7J3TmBXUw5fMHjO5qhGj+8h8iMpA2RutXI1300yaQ
oyLuHPmmiz1x3lXxR+otWDhP3/3L/F9ZWR5w3cLvqByO7OW6csRVpGWAK6UfTwpk
XD1bMjsrYEgzyxgN+TL9DiF9ev/+UAWeJ/16y/dQnIbhcn0464hHA21F19xPn7v2
rFnOwgYj4rkW993Vdjn28rkprvLYa1/QQPln2ZbOlhCzWuimfccuL7xJPzm2riL8
i1ZX4Ou1mnRCuDoHqBSXeHwhtTRBlA==
=Omu0
-----END PGP SIGNATURE-----

--5zdcowfgw4xunjqo--
