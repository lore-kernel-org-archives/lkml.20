Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551022;
	b=Eh1VMZ1US4yPFmB+MGgMNr3aYEAsx22XBHuQkzodWGJF+yHSpKyIknq9z1ZMqZcMI7Sl
	 tjfxrfFLVUkFzbmrjs0Eb48upKMp4QWSLHf6tI1zkNWxoPkWtUjxAMlVAdsUbo9/bGyNs
	 iqV6ueQX6CIR308KXfAESVOaGLwVl6uacUAb+ITCye1Uo0vbZ/BWCK2/inC3+X9iflXhj
	 LXh1SBQutagxh7ACO2Zgt/EwBTlH+BwwDohfGFHYXQ8vg4J8iXsBjMBsZgxTj1yoGENbr
	 Enpamo3lEW28fh9VPZzFnVSkOEbcHqiZDqU3uKFoJl8Ewd5eDv6zT9M22XY/9CTeixw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=scTX0bumEv05AQNebNSsHg/mOW7TqFZSq25FZEyaOcI=;
	b=EX8xk+uWP50HT54cp8h0TVsDYnp+ToFGmgoClMrnfLwf7/7MnMpZb84XTLxjmB0sm/QY
	 gJVVqjZDFY1FmNf4Z1yEhAegGcNqYKVblITnAL4FnBCQn2yTxVc+np+zwqU1/EiP7iZdk
	 VBbVvKSkw9qCfOirpZiH+Dvo33IjgvaGWIPMbMqp/+AVWOFo4qZ64TGn5ELfnvyILzGTb
	 iOdhV/kHRs1UCKnzDpIBPkapZ38MRtJwOaYoyItwikdxFFI/m+WHF8c70rxq/BIe0S2Vj
	 YOT/cWiJ1N217l8PMLLMVglhUFBFdUd2/oXss0rMe2DJ/nZwfKjDvsI3a+ZYkw3v9BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FPkWGBpk;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815B6606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 815B6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FPkWGBpk
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4918c2d727fso212858f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551020; x=1795155820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=scTX0bumEv05AQNebNSsHg/mOW7TqFZSq25FZEyaOcI=;
        b=FPkWGBpk/+uXvN7d8744zAwrLdMCouM1Hpl9aCBeyVo4Fs/0Pj1xsLJvubN9r3GJXc
         1gxiErW2ve2M3VfoTM3SoKFurchZBNdkD3dgwNrN3+8YrjE0FP+fjOZM7GlZ1bUqg/6k
         ioT+xge4GPeCMFg55Dg/XJVBqL4M2zBNdc6n1XO8p5HtIy1hp+PjvgeNjv69HGQjkkbJ
         /mHRayRZBQyoMk30pBOOm5OzWKwG0HoJNS20TBTz8P7M28axuxf96ZcFMxgCU2ljVX34
         L9xI/Ibuz4YIq8MYIJU7S57SIWQ6m18ACVwlUNoGUjKSRTxEKMtSz2feydcXhA+GIH6C
         3/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551020; x=1795155820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scTX0bumEv05AQNebNSsHg/mOW7TqFZSq25FZEyaOcI=;
        b=RUxWZzbFriMOW9XSJOkMWYBRNIV3I2OiTBKR5mpHUhYXf/6NxP78gEiHUMEup14Kzt
         hUbBSE0N3imwwrWhyf6bhXvEt+H9BvXLJ+KPf38CUEaKtpSkTeks9FvShZMmZ30VJGhV
         AE0ixAHFpokblkM2G2fbptnjjyc+ypfA0PXEtTXawSEIEfhjhWqpVk9TG3pP4zJ6ns0e
         /coKTLTyyHL0RMVt++C4G7l8sQMof2FfcMEQi/skvMhWFofREdMotLiRhjD7lyF83N10
         pYjhbzkafjNn/wq71aVtU4awX/wupdGkVSFe/1PuUNvqKUAiAZzTiptTMZWe4bNM1ZWP
         4S9A==
X-Forwarded-Encrypted: i=1; AL+hErH5A7TcsYLxCVR8eUJ5BxTF0RN5GIK3C3COrq8iwKLSxjxaOBb1MeI4RESgG6vkgdMnyNllszXc0IsWXJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CwgDkth30F0BEqsVorEBvPCbPreEvQKw+J/0bDzZ8fDHFW8lK
	zw6uNeElRK5ZUhY/KauRmd8NuBjMBI0frv5E29EPW3t35xRnEXdbjs3n1h0eb2leoEo=
X-Gm-Gg: AYBFou1CC1WglUZZULZkOHQTHjBV/uCeWH+35/ppV2WxsC7cJ3X59lu3waYrcO/ETRy
	/u+bXa6EXrXa8kee6DyrbscMk5q5U5r6kdUJjDiXZBqCNVoirbSnCqCmptCsnO45lCnnfDvmPgP
	yFwsfL2ZVp/87INkWOjMJMGppLQcu7guqt1oN88vYhpa8FnN3+0YUCyt/y9LvkKcU9zXVbtUF8x
	A1I28S3kMVyXX9gLntcbJbxApq9njvBMq0W9i2AitpY3mN/HXnYf6zikAReFNlHhTafF1mG1vLe
	tie1i68ZL3ytoMShHM8xT1VrTCc/+gFnutqbD1TX3dFvyjHqzRkiqYwCRUSAILcGV1DKnW8J8ir
	AjO6QB/1gHPYBxhD3aF3cIAHo0l1y8lkKSptIsDZEQni2Xo3GDo6wBklaItU55SLbY0yY1qTSlw
	Tc7LdMeyNLP/a4LR2LVLnXTUI1vrd+7NF28qwWvHkxW3k70bkfjfG03iLpBvAMKPVaGgXSxAnQg
	uLuyO3TgxpUi9nJlh+QHV7q9i7QcsLu9gJv0dZbSRSgAXlL1EnjT3TlDq0UpuHv1zqY02d7ukNk
	tvYajGABY8W1QMj+JzK+MeeSDInUB426sTjQ1nVLNd+Gaex1CoYnV4dZNWvNwwIcoYXTSsrtlje
	l5KLfnvj7Y153Iw7QNj0=
X-Received: by 2002:a05:600c:1daa:b0:4ba:2bfc:c8ab with SMTP id 5b1f17b1804b1-4bb55a4801bmr29639465e9.15.1794551019876;
        Thu, 12 Nov 2026 22:23:39 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb56f8d054sm16744035e9.3.2026.11.12.22.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:23:37 -0800 (PST)
Date: Fri, 13 Nov 2026 07:23:36 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joseph Telaak <joseph@telaak.dev>
Cc: dri-devel@lists.freedesktop.org, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, imagination@lists.freedesktop.org, 
	Frank Binns <frank.binns@imgtec.com>, Gabriel Gama <operatingsystemsdepression@gmail.com>, 
	Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 12/13] drm/powervr_sgx: Add the DRM driver, power
 management and debugging
Message-ID: <avajebb1alBnAm8U@monoceros>
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
 <20261112-powervr-sgx-v1-12-c69b84bac011@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="q3fovxmny7pd3sxx"
Content-Disposition: inline
In-Reply-To: <20261112-powervr-sgx-v1-12-c69b84bac011@telaak.dev>


--q3fovxmny7pd3sxx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 12/13] drm/powervr_sgx: Add the DRM driver, power
 management and debugging
MIME-Version: 1.0

On Thu, Nov 12, 2026 at 05:59:02PM -0500, Joseph Telaak wrote:
> +static const struct pci_device_id pvrsgx_pci_ids[] =3D {
> +	{ PCI_VDEVICE(INTEL, 0x089b), 545 },	/* CE5300 family: SGX545 */

Please make this

	{ PCI_VDEVICE(INTEL, 0x089b), .driver_data =3D 545 },	/* CE5300 family: SG=
X545 */

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(pci, pvrsgx_pci_ids);
> [...]
> diff --git a/drivers/gpu/drm/powervr_sgx/pvrsgx_of.c b/drivers/gpu/drm/po=
wervr_sgx/pvrsgx_of.c
> new file mode 100644
> index 000000000..e347a3699
> --- /dev/null
> +++ b/drivers/gpu/drm/powervr_sgx/pvrsgx_of.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright =A9 2026 Joseph Telaak */
> +
> +/*
> + * An SGX on a device tree SoC (Documentation/devicetree/bindings/gpu/
> + * img,powervr-sgx.yaml). On TI parts the GPU node has no clocks or power
> + * domain of its own: its ti-sysc parent module enables both, and applie=
s the
> + * SGX interrupt quirk, when the GPU device is runtime-resumed. Every re=
gister
> + * access happens with the parent held awake.
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>

Don't include <linux/mod_devicetable.h>. of_device_id is already
provided by <linux/of.h> and also by <linux/platform_device.h> without
the useless dependencies that <linux/mod_devicetable.h> introduces.

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>

Best regards
Uwe

--q3fovxmny7pd3sxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2rOQACgkQj4D7WH0S
/k653gf/auhko2qaNS4BWJKPTZ0U6dpwzMZplMcZygr/SRNkqB4rtNEr7cniJb/w
6HZVwgsx6EXyuiQ3Fznzch9R+5VAoHbqY1QrjaycWAttOem37Sm+3FGHqoG0zW8R
XSea37dwrl441qCF8WonzOU9YK8dbo2CV5Bi6SGvtf/fnaj1F3smvAws5CmtB5yq
KEPdVWFNnVGqV95nEDkgb09I3EgkCZRkYmBn3bEN+VrJRvYJOfNdGX8AkBDjog3e
D6eh7mRm1yDdkHd8zrpKf9tAAaS784qhDz6YzqobHn/DSybseU7VEV+6gsajSEWE
tJ7bUnZyLTpFf7SLsE8ghAOQ8KSLmQ==
=uMBo
-----END PGP SIGNATURE-----

--q3fovxmny7pd3sxx--
