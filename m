Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CBC4F96B4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747340; cv=none; b=Y0S3xluQjFgLVs0cYOgUx7DP+flsTRTDvWX0qrq2B1R4e0SsYBwcUB2ZPQb1odj2D4GEM2QnYo9ppfn3sotU61dORZPl6luC1J/ZB13iudp8uTFLlmKpOVg2jB9F8G4XvAsMynWil8l8dNs1vj+acHeKDGrWk5stGSGeYak77sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747340; c=relaxed/simple;
	bh=dFhy4My3gTfz46T+pP1ejh2aEiiK+pEn+gpbRz8FajE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaJKdlwHrv9XqgeonbC40gltg454mfQqNR7N5hW0I4tiUdtWhtLD/V6zYLuYgRLPKH4vhybqpeqgFYzNBhF/3KFRvq16ojMv3Mu8vhR0SI1TcziAjGO56kZOBpz16sGOX1eDhqrbH+csbmURpdu8enSfRdMscqI0MCZfGCEDK3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DUHU9klz; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DUHU9klz"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso5664545e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789747337; x=1790352137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dFhy4My3gTfz46T+pP1ejh2aEiiK+pEn+gpbRz8FajE=;
        b=DUHU9klzHWINy+WMe9czFJ1ecYRgil11QqBt1yqu1/x0RxDoq10xKqKUpRwJjdw4Be
         AvWiI802dAY6BSjtgWj0+9OGjRx3avFPSHysNex2AwODac0is1eFYeOE4aiYL9RZ+X6Y
         JI95UNzqkF+vw3p9sA6PTaT7HD8wR4LGnZBZkq1HkGAxd8U9RqoZ0lNW/sf2POZdbDV2
         1TkXHF+LE05zecYKmP1IYhNVMjOioWfUXegRJzciqOtQNJ3wwDBmQu9V4ClaEbza4H2c
         vihECAr+JkdJ7itKbh82cOQZjcVMc4kK5ZV6Bj7pfq4f7DDcnsW3OhTkHsXnFf5AfsbU
         4wAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747337; x=1790352137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFhy4My3gTfz46T+pP1ejh2aEiiK+pEn+gpbRz8FajE=;
        b=s7SfVOCSLreh/UzHuZ/J9slQK9lcIZ64402QHslFqqL5LFrM5X9BqSGeQE5zYS1YNx
         MC19x9yAnEJv5jNiXqn4X0P0AhA3H84SbzZqaky6oyfNQJv8l0WrQVx8bhBoNKQj82Wv
         681cVICCXse+bEbbfS73Fa+PUTD7PLm9TlOUTYj3FPAfP7RYpytvnnu/tbhpiYvWcYaj
         4BO3OUd/KnNSS5RicIVhnUtstxYxd6nx77CG+luPtbRd+9ka36X/fYCAibHitVpNuNH3
         3TnV1+44MPBQgNJ2Uu+A5QbLsClJndZl7QfpkL/pTQj8NM7zrJOskPNA1ElldLGLKe/l
         Dt/g==
X-Forwarded-Encrypted: i=1; AKwUvBzlqFBJufcDiDuQeW0ct1GRIWFV12C0zt4wziLs6J1W3LgnBIDn0R/HYNd+UpnHcOMX68o/pVaL1iEfo80=@vger.kernel.org
X-Gm-Message-State: AFuF++mR264sbNYfIe6dFxkZ7g6zCq6Ingcf/EasjCdAvYg4BjwFlJMV
	MxZAXOOgw/fHy1XXFK3D6sdjDx5pX0VsK/yQtG8cfBV4qskBpwh3Tz6gMmrDD3VAR5o=
X-Gm-Gg: AYBFou144LsAHjx3/9S/5WbovXxE5mo8Ax5kNzfZH0TX4JgSRfQCBOw6GAWmVPTwbCE
	e0p1DRGTucbB9qz3KrTi335oJ6+J5JA9WLeWukIki9r/FMZNTtqO86KibSe0YhJ+uO7kQ3wjpn2
	HzCFbyTRE8D2JD0DcJU8QtJVSATP89fqyheaARvsDLBRQ5l0943FM2eGFbcHx+MwU+WyB1Qcpr7
	a+FH5nvicRHrZf0K2Tb2haNxRwT20feN9+chaJna0HNDX/5YZ4UBqC0+11Dd/2hvH0zEp9e/EeC
	ShM4IEM8t+2rNqUhHQoGiJIGMIDU5aTqrJdE5CwYnnqkqPeKSeNN0LIp2emrOhyp57xKjOADMN9
	mqFs7f/BXevymVUvaJY+ZfJKTbI7RO7d/MkLe8Y+iHwFCL4q85q/SU5Pu5gfyMXflzBa+x4JN9D
	IZxX/Nbxm3kNNLJSXwEv69Iw/PSHgSC9g9R0i55FP4Fqxc+tzonHMV6kJGDiRUkkRnUDefNJom/
	DkM8nDsFipY6hIxaKpoBE0ep4mafrULhPavs5WBcSbuHe6BasLI3vQK/Q9ndw==
X-Received: by 2002:a05:600c:6298:b0:49e:73e7:888c with SMTP id 5b1f17b1804b1-49fc5687acfmr41014655e9.4.1789747336842;
        Fri, 18 Sep 2026 09:02:16 -0700 (PDT)
Received: from localhost (p200300f65f19a90444c8989fe13f5be4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:44c8:989f:e13f:5be4])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fc59286b6sm53740535e9.4.2026.09.18.09.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:02:15 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:02:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Adam Azuddin <azuddinadam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, jesszhan0024@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	andersson@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/tiny: Add RAiO RA8875 display controller driver
Message-ID: <aq1f-jvrptlrgNO7@monoceros>
References: <20260916175942.3186804-1-azuddinadam@gmail.com>
 <20260916180410.3188922-1-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wmm5bprmcbrsaq7g"
Content-Disposition: inline
In-Reply-To: <20260916180410.3188922-1-azuddinadam@gmail.com>


--wmm5bprmcbrsaq7g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] drm/tiny: Add RAiO RA8875 display controller driver
MIME-Version: 1.0

On Thu, Sep 17, 2026 at 02:04:10AM +0800, Adam Azuddin wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. Both of_device_id and
spi_device_id are provided by <linux/spi/spi.h> already without pulling
in definitions for completely unrelated busses as dependency for your
driver.

Best regards
Uwe

--wmm5bprmcbrsaq7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqtYIMACgkQj4D7WH0S
/k6OKwgAo93p+YA+UUSlkto/NDiCvLUIcuiQ2j4Zy1SQo6yvwOwKtQhS0a9xRd70
PJkLsOWZjvAvH9/VGKVv4rF+q4G/xoItjAtduwtvOjP2KYbO18leBThT6nYH+Jty
dFY4f2Ojeh+KZ5S5RP1D1RNKDzDShLkMjyijFAAH1I8AT+ffQ+CWUSUKHuOQzj3V
o0JibztPyaqUaMKdBJlGWrKBjs1H2fb8MzjqJMDyFoebhG1Y5TAToybnB1NaqS/I
8oXtqsbZm4smXEbFtgSOGvjDxsnGIG9hsct26ZSFWIohO63PdRrRq1kmJ0YbyFbs
vRBd3aUl/paAmNz3GgpU69S9MTyy3g==
=yOZu
-----END PGP SIGNATURE-----

--wmm5bprmcbrsaq7g--
