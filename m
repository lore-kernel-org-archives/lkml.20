Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCAD39CCF9
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791759984; cv=none; b=ihO3NJ1537ORRME01Hz64SSJ21tEGuqT48KQxA9dkXzM9MWbxGLKnXTAs3CpKAIuUlP1OyIHEBnJpILmnF2bEm41+nxIjTi1TE3ibTd29cVSArHe57tc+ftPfmTJkRRXbf/eNOnSWhydH8Dt6191dROM04rr8wGRKJIQ6EWSwLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791759984; c=relaxed/simple;
	bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au0gcn+x7r3INrS6uP6VyWeZ4j+s/ipz1Y1DFj1dJubQAPOG/N9l0DE+MJbXQGpGhZNbhr53fl2IpJkHaSWIHkk+7KBSNtQXjQM9UR2Xl4UsAXVUkqrXnx3AX8rUcpZNdTD/FHqt/NhZ5OU7NPEchNwI16YzB7f0vX3gInYNgq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QXlcqlfG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QXlcqlfG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48870973bddso750103f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791759980; x=1792364780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=;
        b=QXlcqlfGq8qJflB8PXiVeVhLNEArs7zM+5eyofiXwFPfWETqNKQgEYbd0pTB6Xy4ft
         l4q2tJuxoOb9j8yBoXmk14mQLz0YQVoYNmeRJ1EjVXB75Udsm1j6oLS1cteb8+Ljq/Uk
         PwjU6Td64OjPURTdDizsrvAe1iqiP4B88WH+WbcmDKa1eTyfOZle2DoD3R1LBqFSKxKn
         MOc6ghgvBjDiyYdULGqrzQIcB9UFLxjOsbFlhAluW4KpfKPv9jUI6Ke8Xt+T1Bi+taJi
         FwVF0zcAApTf+6C82ep7AvBsNxi9OOPcVP+FZelgFDLlwDfG5LqIq399SipNvoFo35+J
         Zcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791759980; x=1792364780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GId+tRXTCvTzFm3HINSe/LmkKEkAakiciV2ix96r7+k=;
        b=WHWk0giU+2RW4uYaNcOR1f0G3Qmh7EmUo0eI0EC2bGCi9hEo5aYHWEoJT2b3iuwmo9
         bee271U5h9xY1lXE9p+bziwRO9jrH5+8wkRH4oNWnBVeQBVQtBnP6Ow+wwICzdZb10l8
         EPZD8tskmV1lqUof8ZqkgZ+ldX4hN+0XoGrAUJYZ4jRJbYWPhMzZNrlac6C4LelRIOYr
         O+qtHV7lJxKvLCvRI2CzRWLA3ylXo6uE4Et+j0aCP+5RWWexhk0kXuJy6P/qslumiM/d
         mZEfFofAsPBAHGy1HXKpxZouu3L7Ajy+MyFuyVoyr4LC06jkOo887YEdqVjt3k9qS36f
         +0Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwj7jOr72OtlHy2GS2VG/Ue5dWCDTy0AdvJeaAovSbH+IHsD1RDrLz8bH0stwpYMKGDOmzLZ2wWzg2iHDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQGwDdOCsJcYgKXzx5vshLlTFXNlQAA2mi451mecK853P949i1
	afRm7fWzklnGR6tH2yY2xXUoz/g3BO9mDGqlxAj3KZaxW9xtKGPKBLs7uBGFGJc/6zdsVmnr8Fn
	y8+6a
X-Gm-Gg: AYBFou1Add6PrteYEOaJe04Z/J5Ust1H5vJVQ/1L1lNOrRDv/oyC/wLyvKg9yp7HwQu
	NBoHu3rHuIH2QZ9LXBXoxrTRKsoj7DqL+FT5rkvK4iyC10/HJP/wb/O5zzvywINm5jhBAdPyXHY
	JFOoQuRDMAKzlBBrtcO+kNiwSGMZifDLL9F+dKHCFojEDMeYKJt5uGSCvm/m8Q3cfxlRd/imbSB
	XxYHckWbCRo+6xY41Lx/C5ObdZNCFufiwnIrVwlxsJ2WLtbKah1CKeiHAesEaTX0wxZHqqtPEBg
	PKpQxniNvH99UfyTfeM5OGS+LeO2qaVaFYY4aWoPKo+rLJVyctQg/IqT0Jh/LcX2gEd5P6JM/iW
	2cRUnF14MWiLlMRpmI7GXZGGCk9dcTnlRwvQZrmycPGL/j5/P4BNeMYE1MKnezuez4ksfJ/NQC8
	0RezqELqyxPEQKR7iri2eV8Vsd7IuksheH3CkTaCXC/c3zLIk6VQYh2l3GpLeJD1EW4LpB5oKj3
	co=
X-Received: by 2002:a05:6000:2306:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48dba9e6163mr13299157f8f.7.1791759979566;
        Sun, 11 Oct 2026 16:06:19 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dc1abcaecsm12488698f8f.18.2026.10.11.16.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:06:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:06:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jikos@kernel.org, bentiss@kernel.org, dmitry.torokhov@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, allencl_lin@hotmail.com, 
	tylor_yang@himax.corp-partner.google.com, felix@kaechele.ca, dianders@chromium.org
Subject: Re: [PATCH v6 2/3] HID: Add Himax HX83102J SPI touchscreen driver
Message-ID: <aswV0ATke05Aa-q5@monoceros>
References: <20261011181633.1778969-1-michal@nozomi.space>
 <20261011181633.1778969-3-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2zn2xrgow5dc2xy6"
Content-Disposition: inline
In-Reply-To: <20261011181633.1778969-3-michal@nozomi.space>


--2zn2xrgow5dc2xy6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/3] HID: Add Himax HX83102J SPI touchscreen driver
MIME-Version: 1.0

Hello,

On Sun, Oct 11, 2026 at 08:16:32PM +0200, Micha=C5=82 Kope=C4=87 wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. This file introduces a
big amount of unneeded dependencies. You can rely on <linux/spi/spi.h>
to provide of_device_id and spi_device_id (which are the ones you
actually use). Alternatively---if you want to go full iwyu---include
linux/device-id/of.h and linux/device-id/spi.h directly.

Best regards
Uwe

--2zn2xrgow5dc2xy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMFmMACgkQj4D7WH0S
/k4MXgf9EcZ3GfDdHxsy9EN8ExCwEfNg60ObLE8QD0gdVxF+YdCbdpGNF2XrpYvk
exy5MWNHx1evhGI8uT/bu9C/jyhN3agP3CnjN8IYUDxTDMIt6AnsMR8o/K87exej
Jwx8C3Y9Yo3SQpDDR4mJF9ftPo4LgbCWne5l9cEAMH4M2i2xBYSZrMNHdPsRZ8rh
91JD5Nl0fgYKcD290dVrM6Yyzy0jTpbUgTEm039g0ev8eEvvylQcfsP30oqEDaI9
sHPHaxeZY+jPpKiOqzfBMP1IzFSQNXt86mzcWDLKLVHalJWEh7O1dnfv1SqWhPEA
s2aLRmZvKqCLimKqBYM+vLnmUtqynA==
=yG/u
-----END PGP SIGNATURE-----

--2zn2xrgow5dc2xy6--
