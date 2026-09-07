Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5019442135
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769983; cv=none; b=VSfFGJxL07i/yh4yupl8oKDwpH4CMd20zUFgvBLfJxkQvfeNLTMDKgxV6cIQQxhLZkKWGszP0Ae1K+sO8GHUItJ11M3SwjDbiIfk7vJ7l51iUFXQaXSRnJDqWajdQALS3olpoKjic0JEAsiVgGZFaP1eDTZAP6KOSdHYGuW8Aw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769983; c=relaxed/simple;
	bh=3vtIMbYe0dxXQg4HGTmjD4UpnxkAM1+Q1cUtKCU5Vq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLEywgJinwo3IigJlhpJDMmp2n6k3OHKihT1IY29Ta3KLeFFmWFxA6ivfAYcYpVjyiSupMh7AEasGiEbf36TkvygZ79Jwex8BiZr/7/oKoy8isqdEQGbE1IhZ0PqV+WRVR6sWPiGnNPSOkapDE3XGudDvxi6tnif8xBNI7dRUIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Y7vanpJo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Y7vanpJo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482dd6ee390so3718931f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788769980; x=1789374780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1zKmOTGIIL+pRRxcESuIVFMk8iKWFzVbSRpyStN3ws=;
        b=Y7vanpJoKLCZ2ObD8hOiHeZ5VQCevKzeRFA8RhpiIUm7vQ9eTfVo4mnI7LU1izMzEP
         5NhhTMhrD/GbVLWyCt+YZ9z1FGhmYU4v7BeOm8aMSwsENZMA3I76L24AxLNHmIgYWUsG
         Rf8APMP9kjnUDZar4v1EuGpEFIPZ3Q1YHMibgO3IYAKNgOXlYFTYdJznEn6oY1s/M4Pb
         wsjzWDu+4w3n2Zajej+qHIMDmD8V991ukPw40Ggl7uigwiypFhD4q+anb8XpcHOBd7n4
         6hxyNTxSQu1Rh0cBbPYw9yqlGwZLZKeJ93uOPc4Niefc52PGOfEmOOt8v198fiG21lxp
         4GTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769980; x=1789374780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1zKmOTGIIL+pRRxcESuIVFMk8iKWFzVbSRpyStN3ws=;
        b=F+l+bYPUinUc3DQDj/KE2JZ/wElTl4P2JJ2zOi/j7ob2Zw1bshMTDT2M55kZBPKs8E
         +8pL/utPcFEyV+Aa1etQ3yvd9BKJUh7AoIegUDtNs3mlRklWjWXIJcNq8dBaFPTSA+us
         rWgCxgsS7ElG5g48jOEgFvDhHjkB+4cNp/Nx0mmJ3jGseg+e3Yu/sHaBlSBYUOWYHD/U
         HOoxT3+w7k2bBepK3uJdHJfdtCRG1R2F68Rrf8JohIG4f5duHjT8YC+PVhY+bcgL9N8i
         YEADSVtXx2BSSqIcnLAX3KMo2RpeCKWbgTTCEvHDD4U17xul6X188Q//rq5Udnm8ffeS
         ewpA==
X-Forwarded-Encrypted: i=1; AKwUvBzpch6aFaU1vyNruw2dEItFvR+F0pr1ZTx9Oyeom95zjsF8fIchHkPCAt3zHir8clgnfszS4uUF/aCEfoI=@vger.kernel.org
X-Gm-Message-State: AFuF++m8paqwmnOgIHRIdlltDfE6vos7nRnpPomiRWnUu3NPCOw9VGcb
	LouXzmv/FFphRd7GmJjkcMdz43MgCwakC4MQScBDtr+hhhi0d8jA1oFaxrFYyYUN7Dk=
X-Gm-Gg: AYBFou0RlGYTHxXoOufmZWEDAvm6f+QA3n2fGxwxJLoBDcemSnsDU2mrlxTgT+yZTew
	KonbTz2LWLTf69YFkgR6DX27AOH5pZyvmThz0/eomNvigXIwT7cw3iWOzIw1gHKxN30DjRKg8Lx
	kABuuciciRobk5wfUTd6WVmLLe80egT18ZdXkURWKCxdVZe7pYsV2gZqelDjKHT7nWJ/pNWdyjI
	mc3kzyum5fJGHFrplb/Gk3oF9fL5NE7TNUUbeO1/INTLPemx9LhMHkLUNmJdRnQyVIbEBL8zTOG
	PnfjLV3QBc8H3D9vsp0kguCLbknYSgfSdy82EeKrk0E4CTEdMG9Uh8yBVicHxhtx8ZNmWWiQ5Lb
	o3iPtdhtWFNP303HyYickmrYR6YCoc3xdFeWPXGUHpMAY89lyYWsXWrThUTDIfrVOjM6NoApfcb
	9YiaNe0EJZKP2YM29S9jB4rkG7i1R4G4jzzABSSQtjkgD8NbFsCilr3g25tQSrhjXMnP+KEWABU
	td2y4rktm50NVYvvKr5fY6zt++GML7jfBD0U8YQLIOcrzGzPkk=
X-Received: by 2002:a05:6000:644:b0:485:847f:fd89 with SMTP id ffacd0b85a97d-485870506d0mr24554219f8f.9.1788769976952;
        Mon, 07 Sep 2026 01:32:56 -0700 (PDT)
Received: from localhost (p200300f65f19a9047ae53bb37ada872a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7ae5:3bb3:7ada:872a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-485883c6ba4sm30820390f8f.25.2026.09.07.01.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:32:56 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:32:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: Add onsemi FUSB15201 driver
Message-ID: <ap51p16bSY1Ru9C1@monoceros>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
 <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ho4liu3hrz2gwc46"
Content-Disposition: inline
In-Reply-To: <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>


--ho4liu3hrz2gwc46
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] usb: typec: Add onsemi FUSB15201 driver
MIME-Version: 1.0

Hello Shawn,

On Wed, Sep 02, 2026 at 12:59:38PM +0800, Shawn Guo wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Please rely on <linux/i2c.h> to provide of_device_id and (see below)
i2c_device_id. Alternatively include the needed files below
include/linux/device-id/ to not introduce unneeded dependencies.

> +static const struct of_device_id fusb15201_of_match[] = {
> +	{ .compatible = "onnn,fusb15201" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, fusb15201_of_match);
> +
> +static struct i2c_driver fusb15201_driver = {
> +	.driver = {
> +		.name = "fusb15201",
> +		.of_match_table = fusb15201_of_match,
> +	},
> +	.probe = fusb15201_probe,

Don't you need an i2c_device_id table, too?

> +};
> +module_i2c_driver(fusb15201_driver);

Best regards
Uwe

--ho4liu3hrz2gwc46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqedrMACgkQj4D7WH0S
/k7YgAgAs4m8lyJ4DHebmlSmZntV4mxfgROfhi7Uwq7HpI6Zvchr6fGHr2xXOV9F
nWYl8ZJ+ADjYZ7LaAHy3nSz8i8IeAQst2+FhnNS+USYuNKfo2uB7I6/I5eTWbwkq
4hYvG80vost649UpY9qeQ+V+Ya/rh7q4ipYctOqYGh/lsN3KxiWpQdX74vBbdWLF
pRygWfOFX/jY3/x1WbPTU3MaXqexQvnkTJbIH6iJI+oBMyQ/N4emnBf/RlTpB6Xr
EXY4Ctpi1sy7GcD3/MoYNESHR9+fR1GLsGNuNq4b+vS2zIY9KLAqrAIdjOZ/EqlQ
3aWssAJJQhcD2K7qbTLjoe/4CPX8QQ==
=hzRz
-----END PGP SIGNATURE-----

--ho4liu3hrz2gwc46--
