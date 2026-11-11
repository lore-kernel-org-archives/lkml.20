Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389420;
	b=e1X3XdetC1ppE9vzMD4msWJLXTigp5fyPa9pbET13NF3h++YLNL4cQwC6mP4UoJTiJ0V
	 qpAlk5xzvt+3BLsuy0QBmJ8u9ZQHf9FD+9wSoFB6OCYOWNkp/qNJlGObf12keaAAcDPUj
	 LE7zGooKIDrKUhe+CGGkGworayfCm97BHYZvE00ekWSc0E+D5bhp+kBWD0kaKZOx271uD
	 s6KtgONrIHgzcSeMl0c6x7II3xEu/bxCyaS0QCZYOzJu61+MOCdxCnXc+xr/PYTRY7sMc
	 Ve6pX9QF0Nkw436U/7+yy8DWrY3sb+aEBAq6YZrBsx+3GEqiMqJeRoRxHHVPLdmHZzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8+ptz4g6/LlfBCXyV/bHsOFX7dT+x2twzdeYM1zeVdE=;
	b=gWyCVH4dZRzM+5KbF0D2vn+Sdt7yMS8G0ZR9fULqz/IEwHvggVU4F7AM3TY8ZYTA1MXF
	 TeIafH+DfLspjvhEV80CbYhhH0MV6RY5x0SxdgMaWi1mnvDe9IoGiiiPTOT0Zc9KuZ2Ja
	 rTVgHrTev26gUlS6YfjhlunMBpW2nQV1+cF88dhGL2sX40BHFBVTe3m85ImkGN6iq/Rhh
	 Kw+12Ismz5I3hg6TiJL+43BODW+HwgL6rIA1LzguQXcFgOuKUCZ/hRbsa7m7E2tzgAwPp
	 3qu9xtyGy9fR2C8qeVFQ/y8Bo1KWuRE/xjQFB2w1HyEogqyNTdxFCENN663GEwZOHGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oILjL5r+;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE71B60A2606
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE71B60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oILjL5r+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so23175675e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794389418; x=1794994218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8+ptz4g6/LlfBCXyV/bHsOFX7dT+x2twzdeYM1zeVdE=;
        b=oILjL5r+wA6iXw75gkqUosGd3LYsi0KvguX/q6Oq0mPXdVVQsIQI0JSo8iyUgw1ukq
         lX9sUn/2gZ0ZCWlT94ES1CjEkwHK8n6qWGsfVnYgcIQvSmiy8buhuQ4Om/zXkZTw+y6x
         UH7aAqAut2ifugHURcUOMLrxJ9AE95E+sPZ8AkRiwfYmm4ApgVkSkMVAtITnFBTqUzrG
         PN9+3MGLmwDeIptEjGgM2kjZ1Yn6ni1DHX15YXkLUy9dAvKi+0IsPPjc4QfAwH3oGZgn
         2zLFM14Qp+e2iZP5iIS5ZW4pBDqkA6tqNFYA0bqzdqHA5pPEZtFNoKJu+CGZbTrDONb0
         u9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389418; x=1794994218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+ptz4g6/LlfBCXyV/bHsOFX7dT+x2twzdeYM1zeVdE=;
        b=K9wsv04+GQpXYfQsOEVjogtin80Gzl0t3aebQ6PVqq4CwBX9Lb/ofcRYbGvfA/WW07
         07m0wKCG/AkddLM6mpnTfO89u3j2VDjuZ52biI44z6GKtfpv5yGkmGO1Yri4s4wcYf2J
         xwIVKxHZZOdTOJnBWSME33sqHbgs6cepCN2SKCriVtlqAb11Th0xEGx+a/SYviK+Bl7y
         tF/5PFGX97FwWiykCNn15J6pxxgEEOMj6tvZ8MU8VSpnXfgkjIUCP5CJkzlkOONL2Bh2
         ZwF8HNhxfE4NVbqtziNI+QZjrCxOB2aH/yB9JZDZXiUMXgqIx1xFNE1IiPwY7KqKlw1i
         oJzQ==
X-Forwarded-Encrypted: i=1; AL+hErGT2T9kqzuxgmRQYzbWg+FsTFmXWz7OGp76ASqPkraJOz4PYi/bB7aNcKHXa5FO7bYo52DtUXjL+pKxlIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HaM2glnNp1uI13ZThHT65BYyHmH28L4wecJTDJHquW8oKGUt0
	nnQPVIaf1HnE/R0ztjVpFvXuX3bbsR3xn5Chy1tyLo4VNxmp4rWnc24GRia9k9qRIsY=
X-Gm-Gg: AYBFou1sK8P7uSSiBSkGjg4hdL1fo6C7LLPSoOZuNp3tYMMM8XqOnBHKIAglJx/ruHe
	5PfheBqpfnuVQzs7q5rLFtwg+g9jcGnT7oq4nk8jOwkYzuEYNiE2kgZvKZ0MJ09Au4sODYrUHKi
	6cuL74z7t4LNNNFQI+5sXxw0XRWUta3mKSO9FwetEcz40javPF63O+5IWc87XdDDRKXZGJs7YSm
	51mMXLpJPtDs7jJr1fGgMSCcPGi/L/k5yYUtY9MCeJ9jjmAGbL7jJ0kekFdabAO7FZb/6Paeohv
	S+uEs9ncS0wWPjiEhdO+2Szfa6i/nyw+VlgMFrNs0L9Ggm49WqO4iluie9MRJZ7Ov53bnHlkwsN
	8cVZJyiAZphWLsOQII+/RR89Qr1wVR5b+ENS9Py/cMXrrYYeW9P5gEdeRMFRWi1+dyjmiFdVxrd
	tBxhJralJelDLzRsGnDvNkGSu+qx7Rhv4myY9FHOZB7FxaxMwZrY1vFOjjjI4Ho32Lzq1LjgyJc
	orBJ0L+UUQg6ohIofMCjXkfhdYUkPsfJHxKLN5aFxPb/fXWkqlSTuW6adp8F/m2p/TMtLAZu1br
	5plXHcSn1QECNgmAD5ix9qiaej9Yofpy93mpH6kK1/qLsgWJ/l7o+aUGBwc27+4K3FFQbcROhfV
	QmSuBs6ati5QWyw==
X-Received: by 2002:a05:600c:34d0:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ba0938a143mr31163075e9.13.1794389417741;
        Wed, 11 Nov 2026 01:30:17 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0204e22csm118293045e9.12.2026.11.11.01.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:30:16 -0800 (PST)
Date: Wed, 11 Nov 2026 10:30:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, mfd@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH v4 01/20] mfd: bcm2835-pm: Remove member of struct
 bcm2835_pm that is only used locally
Message-ID: <avQzDfZ_p4zx6kzm@monoceros>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <6b2500112538be613480d472090e5ff6d86339bd.1794347059.git.u.kleine-koenig@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="u2nb6egeav4wcudh"
Content-Disposition: inline
In-Reply-To: <6b2500112538be613480d472090e5ff6d86339bd.1794347059.git.u.kleine-koenig@baylibre.com>


--u2nb6egeav4wcudh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 01/20] mfd: bcm2835-pm: Remove member of struct
 bcm2835_pm that is only used locally
MIME-Version: 1.0

[dropping Ray Jui and Scott Branden from Cc:; their addresses don't
exist any more, adding Stanimir instead]

Hello,

On Tue, Nov 10, 2026 at 10:54:26PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
> replaced by a local variable.
>=20
> With that change enum bcm2835_soc is only used in the mfd core driver and
> so the definition can move there.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

While going through my list of open patches I noticed that I got a
review comment about this patch in v2 by Stanimir Varbanov[1]. He said
in July:

> The original idea was to re-use bcm2835_pm::soc field in bcm2835-power.c
> pmdomain driver where we implicitly decide which DOMAIN_GRAFX_V3D
> register to use (see commit d4aa5960025a "pmdomain: bcm: bcm2835-power:
> Prepare to support BCM2712"). So, instead of !power->asb the intention
> is to use bcm2835_pm::soc =3D=3D BCM2835_PM_SOC_BCM2712.
>=20
> Please drop this patch from the series. I'll post a patch soon.

As of next-20261110 drivers/mfd/bcm2835-pm.c is still the only user of
enum bcm2835_soc and
https://lore.kernel.org/all/?q=3Ddfn%3Adrivers%2Fpmdomain%2Fbcm%2Fbcm2835-p=
ower.c+soc+d%3A2026-07-10..
suggests that "soon" didn't happen yet. I think it's ok to assume this
request has expired.

Best regards
Uwe

[1] https://lore.kernel.org/b3d228fd-6138-4195-b63c-65b28691e18b@suse.de

--u2nb6egeav4wcudh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0NaQACgkQj4D7WH0S
/k5zEAf+L6c0cqcA+uxO/ogoK7h3f6yigs9+UEtO1Ai54fBtuS/s+FLlwa7NwJ8K
g3g9rUTaGYGRPYFd/E24kwuUH+EL0qhh3KSyBBUIVd+9Pi4ReYtuYOXnHKC7GugT
oEmwQNUnxlHponzyxasPadyxdICI6hQp7IisvXeU2qYe4VYkjc/LUH+uyv8Qa+1T
pXv5ACDnKaGHmnHpvdu57iiYQHlWuEmaPdI/M4yCT2sydfsr/fje7ZLtfyk+OB/e
vxOa7DDoeqzYQ/Hgyw/6+Hzwyq/UW07mTh4KBRfe7k9XGdFTB1Zouh6/dLY3v/Dv
uD6Fv9YMwpZbKUrn3e8+CRvUwarNcw==
=qqdY
-----END PGP SIGNATURE-----

--u2nb6egeav4wcudh--
