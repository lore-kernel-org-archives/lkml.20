Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BDE3ACA75
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803277; cv=none; b=sLIjwWeQGsPDUaSzYuF5i7VRxIUokD2KpAP73s1tZqDwhUdJDsvYW+erhXsqHi38V7xYTAVTeuwexaFoqGcDUBr8rhguV5pms3za74ExoI6N4z2zs+lrkqXiUOi6kdYpp9BcldeNGkPNQGvkKB9TYU2JLmD4I9xNUhdO9Z9rZ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803277; c=relaxed/simple;
	bh=gCRdoiNYDO3HoZ+F+DE/NVCumhqnZCgJkbrzQXX3S2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJCs5NHBnpuujdKS3USkOkyauxFBZz3GXQIcoiYimKPan4nkkgQMmBvCYCrYdYsLNPl8N2DQg0lMCvw0g1xcYiGHIePe9SmYOuobLOdIwrQVUNI/wrjRdrdrMLFQW/ORhkXcUpQFhsEJUP4jzTxvC9RqguzTpqFMXoicDKkCjfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TfPBNzEK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TfPBNzEK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16c399641so18056285e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791803274; x=1792408074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7P/6e9/DIRLq+PtH8UCLLUQW4yirs+qPLm89lZGge2k=;
        b=TfPBNzEK5DiuXD12hFxOCHT50LgQKTdxX7RyAnutOsQhuQmXjFbMJXC9otwGIj5pTF
         /VHvBM2dMRzdHrb2gPiimpvuuA4KmGQqe4pMVwH0i/IkwXO9pUX4EwPhVIlh+rfg5FWi
         gXrP5SPjLJQBDTD8spXc/l85MTJHHxB349tjn8dpCPITfN7Gh4/WCvOAF+L0zzWdh04H
         Gb+YsusLm1S99JKoe8Ky818qQGWcI7PXvc68l+a5JEvTUhKUoZ7tdkqq5cU5CYlaO5VX
         GPgeNVPv7LQrvJfpSUsipuw8gIfWEIPwexbkg3GTmpIqQD1g2cinA+bKbx+JlIurnem+
         77ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803274; x=1792408074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7P/6e9/DIRLq+PtH8UCLLUQW4yirs+qPLm89lZGge2k=;
        b=Lph71qiFbbJgo8c/2lvafexIY4dKBy4hKyHxt5V3jFrqEyEHR00jCDg5LeSjZrqB9f
         vjfyBKtf52qzEAZaxXOie7oJmSX1C6fYRJe8Dpn/1E8ltkWJm5acT7aFRwQFfO3Ep/pB
         0/3YhGEQO5sZcDkS2QMh3wpjTWYdjeVhp1iGxvsMJTfwugD0xLfeCTmydL6d9kZqnoCQ
         AP9MqnTLMWDFBlYlR7MNuCEbRDIY8NXeHTVi4xn3ZnKs3ryDSMRbdBIMguCg6giXmlI4
         9ghwaZUJFMs+bFdSTl7In5PHF4sMMm3g2AvLutQsXjs5nN0XeQmtkAwxspMPT2NkXYg5
         i8uQ==
X-Forwarded-Encrypted: i=1; AKwUvByQcnTpLHmAGY9lS1OBX1YfODO5kq/1fYLDen6Qv6oqV6LkJjF977a3+ygEGYSkUIVJwWHEqF0I9iDqsR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIg6OKmkJZM4LEP2TCU89Syx3ePgWLNmFA8JxWtMlzQ/F2/ubhp
	JDsCDGYy624VMJ4exJ6qwmCkopviCtF3YbFE5qfy4At0AY7BQwCGSjgpPhYfNBmNOtc=
X-Gm-Gg: AYBFou0tvzTsZ1G8cooVHba3POZDg/CxY6yY4UxuXP9FFIKv1wt4PU5j0vckE3w7l6W
	Ew2w7tOXN4I/ZCNt0DPrGLqgy7TEhIEMJ+TOIjlXQw6/PUmS6aQokQgp8lfNo73c0av0MjHqBFW
	Cciwd75CYS8BnWADqRRF1t0mcS2P+z+VeOVwN3KUsC1n7NgG1Z9kXqYpWoG8F6WxVrxxTGRUfxQ
	czYwOdHoeMCVWH/N9LWI86w2zbxwkHnFtxBLt8uttKYQyzdEEf/0bQDXX0W6KypHgoUAgR3HiS8
	SE69vJ/rXfVxZ9QFdQNHPc7KpYLlaMMEcN8z0CpQ0L/+snf/kXEhKbLDbmJTzVkn+bn9aoLI3Vj
	603kHqPHpPOmqHcq9ZPpXE1Rq7xdmXhytEXzGZRffCrzljPM21+c/KBr2qBMMh0X9R9yr6YvZ71
	f6qI6s7+Ps2nwzTz1Yusrd7+glc5VVTnDyqE/va/yKXdFiutiIlQpwTuHgFwRrkJ6hWHAkhor6b
	ptwnq8eRHp+ZdeXB8uO05Ze6PIOKPJiYWc8eP/g+LUFWmRuPDKdQlV2prp2Yw==
X-Received: by 2002:a05:600c:3e1b:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4a18e487239mr186335915e9.14.1791803274028;
        Mon, 12 Oct 2026 04:07:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bead84esm279131425e9.13.2026.10.12.04.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:07:52 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:07:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jake Steinman <j@metarealtyinc.ca>
Cc: Ramshouriesh R <rshouriesh@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Bingbu Cao <bingbu.cao@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: hm1092: Add ACPI enumeration and the
 19.2 MHz configuration
Message-ID: <asy-3JrGjoZCseXU@monoceros>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
 <cover.1791608336.git.j@metarealtyinc.ca>
 <b0d32a3b82eca233652f878b7ca91e4dc2d8e863.1791608336.git.j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kqxvnpytatkx6bm3"
Content-Disposition: inline
In-Reply-To: <b0d32a3b82eca233652f878b7ca91e4dc2d8e863.1791608336.git.j@metarealtyinc.ca>


--kqxvnpytatkx6bm3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/2] media: i2c: hm1092: Add ACPI enumeration and the
 19.2 MHz configuration
MIME-Version: 1.0

Hello,

On Sat, Oct 10, 2026 at 12:59:21AM -0400, Jake Steinman wrote:
>  #include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

Please don't add new usages of <linux/mod_devicetable.h>. The subsystem
headers provide their respective *_device_id structures already. So
<linux/i2c.h> already provides i2c_device_id (and of_device_id). If you
still think you need a specific header for these structures, please use
<linux/device-id/$subsystem.h>.

Best regards
Uwe

--kqxvnpytatkx6bm3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMv4UACgkQj4D7WH0S
/k43Jwf9GrlIGDCBYKcBqQkWsgG0oiIQfvX7JHkUjt+RJwtNvuv6MTPBtuNY8dcB
Pigqb0PhlmTGfJaqgKSkc+tcny8ZN5928YFLO8q/KhLOq5fAkEksTgaGzWEw//CJ
GZKtUP/v5FIPb3hBLX7uNvKEDc1ZflbJd0Wxw+OSLIHwwsn2IbRcG2p9hRdxYc6b
6col15XvOq2Edshj3Rs+1f732N+aDBEYSvsdQmDkvZ6pSGGpDRUPCBbvfYg9vSo6
X4dffxXERL5epamRzrBNqZGl+BnzjdfZ1pU7Mi+jt8PAm5u4Q1fvPIgx6VN6TtYY
XUhHIk84okjCO1QVAMEyAnEaAtwRJw==
=RGI1
-----END PGP SIGNATURE-----

--kqxvnpytatkx6bm3--
