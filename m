Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A087D353EC0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770119; cv=none; b=VbxNCy29SW3qpCnY5iFBI0PydC/H4VL53WxPnLuBOt7Wgv5g7WkJ3zu7MyUUbfhJ0bi0ulvwncAulm/8liAkvr3mlBa9eAIazzqqCXBr8TLMqfPehbV9uF03lglUnkkKbieXSjHYif1+pmYrJNJWnU8UcwHjvwEOlwU8BKos0rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770119; c=relaxed/simple;
	bh=zNMtCRsUQspr7I5Yp/4mxHgCjGnZu22lUWt/I66qtMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6Ii4U8BTSZmMd0yK+e9HoRbycD03tiiqSYP33+z0JmlWNWNDhvh1WPVuwtC6dxd22DhADYlNq4rocSI34D2zIikKnZwSyQlKEOwQlBYKX8qAwp4r45/sNeNcchEfAEu4K2H/Qllk+JK7KZphVZmLTrc45ziZlBduke7uU+9p1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JRRCTVK7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JRRCTVK7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso30962525e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788770116; x=1789374916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNMtCRsUQspr7I5Yp/4mxHgCjGnZu22lUWt/I66qtMo=;
        b=JRRCTVK7h1DC57qMTcJxIx7iViDaB3G32uM+/ix4lR/+eIXKwhwbdGhQTIOXqN2mx5
         7gMRI+TnBWP3aTGrmCZunL6S191T1M71nnp6YPFi5+OH1BBko0cILTPgMv37KxrJ6bgX
         5PFgvm2qymbNMIGLsk+MiR0sCGkZUw5t6VsSKAVVYwqSXW6/gfSzMeRQXE/EjPeio6tw
         ZWdG/GBUB0sFG246bxhLeQ+CWl3mwn2HrUjNVnto/F5DcIJwgrXPq2AbPUByzO0NvNuk
         kqZ+UHfJ5pikHSvhZKgIAeQAJysgN+JN3KX6b0LwtkB1A33Ywpu19uVKU/eWCTOvXBXV
         Xxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770116; x=1789374916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNMtCRsUQspr7I5Yp/4mxHgCjGnZu22lUWt/I66qtMo=;
        b=kT4wWabP+/ZBOdUaNLcJVCzyMoY5lIfVAarjlX31ubis+pScW7bE+DjpycJWX9kBIU
         fdpXhpK+nIOvGg0mlX9DpbGI09psMS/Cipotj+Gf1LAmySmLKa84Rndq/REUsQZTXZqg
         nq8vz7xMrZXCL+nlmh5cWmkCRlw4n9OVhAy+HFhvNX4QPXeHncxPSzG7CGYOCVwoqp3k
         Ugb1EPF/6gjHzmdX/jK79qMvaxTbK0PCJ+6LIzFM6bbUK238Re87TgQNmk6/YY8Nr7Tq
         aqF+5fiBml7m9Ux0AdAS8XCxsIrSaBYPu3mw8c84VibF+0fDbDK0nuTMmdiDy47ZyAmI
         0bSA==
X-Forwarded-Encrypted: i=1; AKwUvBx1oMQCp4kok0+UmcDItDc4WcWCXP70HlfjUbh48UCYBpcC0I2WwXnhjd0Xs7qiV8Ap9UEpGWRdZYivJP0=@vger.kernel.org
X-Gm-Message-State: AFuF++nLr1pp/BTRnfGdnCYqDafL8SyQ9d4SzWwZV+SjElPbZ6yTKA/Z
	tM05ShuZ06GozpIbmsqveuFjfXp2VUlX5qa+8zIW4/wFb4KiRrw4+/WXoSrUrCRh/P0=
X-Gm-Gg: AYBFou3YpWhasIfdP9NySJLrqxH4deAw9wFgt5RI84hAj/QgCzbTQUICu/3BTx3/apY
	QkfgvqdUznapPRD4CZWNwHrqHl7gg6ng8UIdr4WPaQAfw6Cfq6TJi8hegmVC2ttoSjerIm87nB6
	XdAw5Jzm9pCSJtMvXmmno7MZpuQ9ptWOhaLGP262Ll3EcRCnNA6cT9+dPW/uSQfvDcLkvDq0AxJ
	NlQKCdEPmrUzah+tY3UEIvAL1TQhnt0QV5orHRTNPqAk1vuVRMv82s9knzs3gorJpLriJAJg6Lz
	EUWSEYpq4RGxMDH5LebtgalVFs91IIO/lPFVAOCi5X9+kDR76k9eFu02GjHnMMONSrxbSsBI3cD
	93f2b3KWATyz2mT4+qbI67oqYB1P0dx/PGFV99y5V1/lXhJPR5AHhQ7YBj6JZKjNt0XeWM0SBuy
	FsXiFCe485DlgEZuIJN9YAdsHZZLLVgLv36p8bZU7EaXasnJ31XFIzPFyqfk4+hsWW4214VaILZ
	eKgNAQqZsKiMTlfy557tCNAsJP9cxI+c5RTV0kvKSlqYCtkMK4=
X-Received: by 2002:a05:600c:3b9b:b0:49a:77c1:d246 with SMTP id 5b1f17b1804b1-49cf8286e30mr197654635e9.15.1788770115721;
        Mon, 07 Sep 2026 01:35:15 -0700 (PDT)
Received: from localhost (p200300f65f19a9047ae53bb37ada872a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7ae5:3bb3:7ada:872a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49ce4761dd1sm274503085e9.0.2026.09.07.01.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:35:13 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:35:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexey Minnekhanov <alexeymin@minlexx.ru>
Subject: Re: [PATCH RFC 2/2] drivers: gpu: drm: panel: Add BOE NT51021 driver
Message-ID: <ap52w_LsxykYh6T1@monoceros>
References: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
 <20260829-qcom-novatek-nt51021-panels-v1-2-cc1ca61bd261@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f7m35ekvx6ajsize"
Content-Disposition: inline
In-Reply-To: <20260829-qcom-novatek-nt51021-panels-v1-2-cc1ca61bd261@mainlining.org>


--f7m35ekvx6ajsize
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 2/2] drivers: gpu: drm: panel: Add BOE NT51021 driver
MIME-Version: 1.0

Hello,

On Sat, Aug 29, 2026 at 11:09:14PM +0300, Nickolay Goppen wrote:
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>

Please rely on <linux/of.h> to provide of_device_id and don't include
<linux/mod_devicetable.h>. If you want to stick to IWYU, include
<linux/device-id/of.h> instead.

Liebe Gr=FC=DFe
Uwe

--f7m35ekvx6ajsize
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqedz4ACgkQj4D7WH0S
/k6mCwf8DB+wWG1X5R1Barm6eVJNkn6T9iEtu6q952Rb44GVXBmsgNzH/8kPoPvx
MgqVTBvCjN5jnomwxeU4EPk1eRtFXqf4jwGytePENeFWAqwNGvBZHuYaowSbPCzb
r6NXPx7I9i9qrBNTAufIz8/sLutrkzoc5so8Z33c3eovQgHbRZXbNpsBSW7Et7d3
DEBJbSFNF4lYRM6ozD7Xk2CHDgfhaf1sznfIlFIXe1jA1/tAIyI21LSclKz58Dkt
JuDlvdCCSC+hoWswZFYnITu60LPBwbgo8JeIVPx07ZuHJr2v6yknqw1yefvB1TKC
r+3sOCPIgjR9hMDIjXlfEVZwDo/T+A==
=6K8E
-----END PGP SIGNATURE-----

--f7m35ekvx6ajsize--
