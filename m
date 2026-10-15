Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD583DEFFB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046066; cv=none; b=UtDS1Ntz8Gy/HhlQKvVaZG29/b6hTiI8gTuqZPo0ciKu6pGqk2/I8Q7KLfUNj0EF68n/WEZP0dthLBw2q2MQbp2RjHJ4LkoaSHC1V4cJzSBV5WLhcSiviK/ZOJ+nGAgk7LBAD4DPcRD3lQ2095JPk5+Mf8zKsUKm9df2YUfqQYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046066; c=relaxed/simple;
	bh=cvSiQGGX62zf8NU8cWeCMy6YNsVnDLRwwh4gVYYoJH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQSDRTS5lCyoikYU9ipJIf71OUctF2dOrgRxONEulx8WzBJ57b9IkQXpqZ1BO2w8p+1wM2MTDd9RgYB0mdXgbQ3jHr7SRDjzTkw4FrLlcv2RwNXbJr84LrPhD9YLgm0Fyx0t3x3MFVSySeIq2thXHJIS2mFI1rf5O5ErBglzn9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Zawu0aHa; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Zawu0aHa"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dee593f18so1417f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792046063; x=1792650863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cvSiQGGX62zf8NU8cWeCMy6YNsVnDLRwwh4gVYYoJH8=;
        b=Zawu0aHaRi+VsHwyuu4lm67b4LXenH0o/s/eN6Oij9OrkqJNDMpZ8tD/bl1PCazxuh
         W0NKxfC3OEEJfr5d5woVMaPfjpp5y7lecUzyr6tOV+KKkzFGNkd5pmctkSRghndeJ/hh
         8m2KPwTL8H1/AFmkBT5D+KRnTldVVP18zp2SyDJFlEJW3Szp50wjhCkida03ot721VY6
         njWl9QhqtKS6vs32CtFiR5ktJniTi3pPTxZoYYof5UmXqtXgGXf6OLJqE0zvbLhJqEl6
         hhHbRG+L8hmId2utKIzDxsioECGdzFNqKh/yp9yFtlchhj5JMs1QFOpbXfRddd6YxIeZ
         AwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046063; x=1792650863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvSiQGGX62zf8NU8cWeCMy6YNsVnDLRwwh4gVYYoJH8=;
        b=pVnWNy7Ha2eezFl82VAIHF5YjcHTdGeBug6eWEGBeOV5tN+ng7qmnnPh2Xnvc3W0fo
         vJSi1u0KW0YXJ0oMyanAHvmhpmDx/EAVw8S6Kd0IVv8wBAxV/rOaw7D4ppzd7FMJp1Zr
         Qo7BfkZNuUGyKiSfQkBNrpd8zyvO2BpS9VGOj3IfSHdp2K2WqekqLArPPEQA3/d31PEM
         4P6Fwrk6SxgA2cili3cAyPWBTpAJmJQvhseT7ty4+qGodwuqfZbOx69f6Iy+BtZsFoZz
         WP0XOBLqNQ8fLmGx9pQ+5x6jAObZGhLgClEWkswLy5BMqgt3qMCS2rczQcmoZ11ika1K
         exfQ==
X-Forwarded-Encrypted: i=1; AKwUvByG5+e0HeeozEKwPkih1e1HWzUa0Sw9uk9LD3Co7j4Yp8PMv8D1hzikuAlJHYrpvNMouBar5bubSR9f220=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9vmZcwIN+4jkeEAOC3lhHtJN0XJve2Ym59cxhyA/oGBrrUAJi
	djocwa+LuiRY8r6n+Pi5ZjwbJhYgzxrAyyfEzlhFdZ8ZxKHJLyFQ9UcVFnZNN5zKIH0bQxAnGIN
	AJgar
X-Gm-Gg: AYBFou22GkcJMvnMb0LVXZCTEewXNpq5p0DXjBhFC6F7S3q0SFyTJweiBh8oFRleY1s
	iseTmSvhtoqVBWFD3bOfQw9ZfLr5uNc1CGjzNgTXwNoOJPq7bVN6tzhW4f5hq/OTMsrc3o2x0TG
	K4FBA/VVkkIiJuPu3NcdLqBJL7te5sYRgNJYiwSDj7PvMrS/mt8RfPKpSeTdE0VaSZ3VkErJtFG
	7ywWstdHY2CHEGZ2v5L2yS2t8nlww0otD4lie5jwVR9GodCj1SzHtoZ0TUR4PCOglug8dau88yx
	Gms6sfLEdXh5ApVUXG2vlRfhFhClrZbhCqKDyjC6UwWDuSwQYMZ8bO3GKAKpJ3Ke7E67srPngM6
	SqjCUXdXcsUL0N4VFgLSIEMFuvFqJYHEKKvTAIEvsyGaSb/ZJTmhOv3bZ2XKiZhubCVSAKBt0b8
	apa58GOY5tNoz6/hkfyziKUqE01SQ9+GjKigfU6KFEeF5Ukp4nW7dkSCzA83wvux7X6BULXxA5U
	cMb
X-Received: by 2002:a05:6000:2503:b0:48c:7083:be67 with SMTP id ffacd0b85a97d-48dbace462emr31920383f8f.42.1792046062720;
        Wed, 14 Oct 2026 23:34:22 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48de0ac35dfsm16759684f8f.33.2026.10.14.23.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:34:21 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:34:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
Message-ID: <atBzoZhsanU90pxP@monoceros>
References: <20261013184755.530392-1-clamor95@gmail.com>
 <20261013184755.530392-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n456mm3uttnhyozn"
Content-Disposition: inline
In-Reply-To: <20261013184755.530392-3-clamor95@gmail.com>


--n456mm3uttnhyozn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 2/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
MIME-Version: 1.0

Hello,

On Tue, Oct 13, 2026 at 09:47:53PM +0300, Svyatoslav Ryhel wrote:
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

i2c_device_id is already provided by <linux/i2c.h> and
<linux/mod_devicetable.h> depends on a lot of subsystems that are not
used in this driver. So please drop the latter.

Best regards
Uwe

--n456mm3uttnhyozn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrQc+gACgkQj4D7WH0S
/k6eowf9FeN1rR9XFEXEXkO6XBBQk0WOuyh8rpiDgFgLModJzaMnq3+L77+bR03P
7kQ/hPAQmcLBFl3gj7KheEqf2NrMP2b5NeD/TKN9wsRO4CWI6Cqb0gduxosBVzcN
o8xymu2l2rVxGsVxU8WaPmQt7p9VFFcjz7lgOKh47nb0XOK1MDq0G4yQ+o4SBLk+
EZIyoNNEkCgV6ulJt9i1j/EnTm54ZoCX2wvesEYIZ/+Pgal6LdHoGZ7WbXu4yloM
uAks4AHXvdjoYzwsz3dCrpsIqKkp5gBkzYuNqOwirtCZEgWSSAZhfkIDu3OvVpMb
JKM2SN4EbEtaKswi9mCOPl92/x75jg==
=I1LM
-----END PGP SIGNATURE-----

--n456mm3uttnhyozn--
