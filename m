Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171766;
	b=qn+KjsALCfh0On3WaTwS487oOddLrMdr9EDkypOXtRbivmzgySlF0khdpwzW2MK21Mx1
	 LAWez5sCN5lmGRGPFzLgjJVzLKvhft2krJIs9o8cRSIIH2AVd32ZkP9kYLRLac8CwjVF8
	 PS/lVr3U6B/Eh1px4S9OdMtxxPO48fopOfdDSKvitqFOIfLuSrc1hhBcxm0pQBXbU/ywX
	 xlXBYAb6a1NH2LgF3sXbRD6I0OjQqpsDCLZ0xFtjXqe0HtcpyruMglIpxVkcc0hejoU1W
	 scJJ/NlVXvL+AvULKc1299bz5xw6FSeYu4yTvTHGgoZjqmizUBZQ1U4yYLZBmEnXlog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=emtegajvD2PHGqYHH217zdcmL1omyniO8biT/+kuRok=;
	b=SBQzjmWAWOVItriFc7w8lvE6OIp9IxY5fktb7YVIj3Cfrd3+1iiobk/f4pDYdr12B28X
	 M2Xn0ZB+1rTHMf3wKq9dtG9t/AZW7hm3YC7catma1QCi5a5AkQckh0H5uykpDt9K06ytK
	 7Yt6Y9h/RLG1exjThRsW6j4/hvbNNa97v5aKEcWmriX7+StYSbGV/qZEtRHNJYM2cA5c8
	 LyitH31Gi5IuOeb/GkpDGcgmjUiXf2mrrSud+j6SBVmRvz4VvugtJyFQRjVjxdaEehvYk
	 C3TBTu/BavUTtsvfgMRaHk2/j05LTCQU4kpw3FO/xNe4S2bpDFJQ8P6l2YT0ZoWRYkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bj1RDHAt;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F3E606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F3E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bj1RDHAt
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so4352075e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171764; x=1793776564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=emtegajvD2PHGqYHH217zdcmL1omyniO8biT/+kuRok=;
        b=bj1RDHAtB7vjolh/24QUvBkjTKpiQ4fB+9unIykEiiFy4aRwpzNeawm3XLokJFOah2
         L7uL3NcV9qrvoRUqBUstYTl/vbX7YesKx4ZUfFicl7U0ZsfVEuiRMkTUPaMCfpZXAnxc
         /JjgXahGqqSkk9nnUASL9ilmPxeG/bwigyi1WtMUZTIUPREvuPQt1BM5hJSRONfAHWEf
         afYWiwnrkeiWB613fQ2NABYwf+OZPqsBHno58MpDGrmclIEV2sDw70ph5TLcdta7Hequ
         EyLnEWnEbaAVFzWmaI/hvzq6EOv2s3YJ3knhw/Y/8s2NJDbalyD+DZeCRZSLIiJqsPYN
         yC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171764; x=1793776564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emtegajvD2PHGqYHH217zdcmL1omyniO8biT/+kuRok=;
        b=Kr+3fvainYFkUAcXMGvFWeSrHtImljX67KHgsQGwqfd/+KSe201+XYzQF8A/I1rAmI
         K6l3oOI0mgjJFk2k+J/z8uD1qcDeHdcmzLfGO5S1pbv4DkzRg96n/oyBrryNiwPlPLr+
         Dz8B574Ezmz6fo5N5Zj//Zdnh9l+SAaVDq2ve5gCpfVHqxEvoQXHGM/PaD6oW6A8bMrs
         4qQT1mFQnZJyJLhjuFKQQ0yjTlWi9BOVI1ofMatdFS3QhhWskDs7Q6GAHzdesqbM1sMR
         dvXzSsl0F7tOpCLndcDSQor/q1QWrRrTzmy2QsnBVRIurF52Q133ln6kfDdg+DI1k4Hs
         ISsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+nq/anjmQ0sqQ1hBYARl5G1ii7gKaIVTVmMGt2L6lwFqRuhHns9dsKOhuNfsjnnQ9DYdxHeQfpGyajZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrNY3wiXeOsBbtktBZKeigp25vvqA49yFb6DzIe+7yACFEwGPk
	LMI68CZ0F7sNaeldRE06CT3XWAd2Bih+wPpefFzoSqowlpdFXyO9Y8QyJnP1skknITo=
X-Gm-Gg: AYBFou1e5Up05etf3FzEQBrkSuJTYXoIklugKon++aZBN+jcYTr8+pbFeLBC06ILSgO
	+7z0CSyVBNoWfjfEEhgIN+ajT7n28oMDu24kgH+GxqKL/UFfybDcMiAlkKnsvGySyQq4tF0ft5X
	ZnlrWMxmajramJidAWB25mabNomO2DD36tJx8smkOFLxee1B3qpsmntaqTjCgooU2Bzfelyac43
	L/hlCn7vE6dz9yIGA7keqfceiCKWRWsFhXZ5XqL9ifWlnbye3XZXerUyOQxJYx424/hwwlsBLlN
	8hOhQKBzuc1Zc2/SF/qEIYQHmBWVAbNUl0VmtUnAFt7szRUkhW9NIn3Adfflq9VqoV6dylZ6GGr
	2igJSrf2SCtXZFtimjJS3bQeruf8WFNVPL6DgTUv4rO6FQb+gmn6zf1+UffaHa0NUY4rLpzVJ3n
	PWEhDUnVqoqdBKqiJwaFpdPdoKqsG4CLRE1l22CrU7nrcMbb9/0T+vtwAHOWTlCBXjMpQokfw0Z
	7jHHv/rN5tP+Y75phKFVcQVQoxHCWswkafMcigTUvPZwZzsClycT1S88shbY7DsBqCqA0oML0Z+
	A0NeSqw4SLl42mxTPxLlMujwU2mFhsgjIO8fpG43eOu/CTbFnV9r3TLqCVMBoddmawW06zkV5F6
	NpfAED5P6MmunfvM=
X-Received: by 2002:a05:600c:6098:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a9640f2328mr26189545e9.1.1793171763595;
        Wed, 28 Oct 2026 00:16:03 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a930a63eb3sm26054795e9.1.2026.10.28.00.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:16:02 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:16:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Message-ID: <auGg1AwlHMTKYAL8@monoceros>
References: <20261023204209.48556-1-olivier@mgcrea.io>
 <20261023204209.48556-2-olivier@mgcrea.io>
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
	protocol="application/pgp-signature"; boundary="7kzx4bd5q3rwseko"
Content-Disposition: inline
In-Reply-To: <20261023204209.48556-2-olivier@mgcrea.io>


--7kzx4bd5q3rwseko
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
MIME-Version: 1.0

Hello,

On Fri, Oct 23, 2026 at 10:42:09PM +0200, Olivier Louvignes wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>,
<linux/platform_device.h> already provides of_device_id without all the
added build dependencies of <linux/mod_devicetable.h>. If you insist on
full iwyu, use <linux/device-id/of.h> instead.

Best regards
Uwe

--7kzx4bd5q3rwseko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoS4ACgkQj4D7WH0S
/k4yYggApnKsIa+rCf3BFQJjly7WiAmxlAQR57PJQJaEPivBmt7SsrrspxVOOAum
ZSo8hfftL2LyDHfMgYIzt3la64M0m9Ka5MNheXRDG3NuIFW78hiJY1uyy1Sy+fcU
oPNpBjjLJWxzwjcGLUxIbM4kPqmIdsBamY7GrwDSB3BeNHFmOL2l6oLaF7QF22sC
3rDO8bwez9gW80BWN7CJCjpw4ynQK6LaxRX+7fBFbX4fRvqIL3Onp3Nufmp4TVo5
iXpJYlTPv3vt8tTP6rhxFh3R+9bmnzR2nc8MUCJJmAb7qRiaZSoQ3kz09LzpeVWt
eAau0gujuBeEzy26ASfKDcl86MpIng==
=0pQ9
-----END PGP SIGNATURE-----

--7kzx4bd5q3rwseko--
