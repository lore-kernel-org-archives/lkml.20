Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768D8468C26
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393077; cv=none; b=ramsovF4IDOw7YiY34gNrBXp4uzAXNukK6cjtnZonbSqjTdYmoYiNvKYns2NJC9ofOhlQo1+NyiQDJjceLzkE7x09Wq93vDjbjzkoe9C//GWJkBmhrTSzVizmAgNDwMpyS2bm4Do5FX/sH9GMrAuV50siqC95Chtz6VlizUx/zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393077; c=relaxed/simple;
	bh=iUN7PS0couYMcfpfwhade+kiv7G0xPySdLn5zBMJxjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQHDJ36Q1URjKVaeuvxFLd2RgiB5P2jHD9+hmFtDAYpHWh4sQCSz6peB+2aRIYj5HGofbKQn4ceEPfF9CfVq47CwsMP7s07CT189bt4hQWeFALsd/t3HvCIn7W6M9YBcfrupDKNxIl9njs5pBHVKU/DodCuNtIVesoQpO+rrHkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Gla6Mmvp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Gla6Mmvp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso19401445e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792393075; x=1792997875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JxfSK5IZ5O0IFCRPnkbx2AQWRlFboHtFQ8aMJNkMXv0=;
        b=Gla6MmvpNAXYtrsQEwNChSPo3bsSA508kW9imXv7qSbLZRJZPu5xYkYDl7509P5En1
         j8yxDBnAjUKFcZstRhuTfOk16M36BDED2koQZROUGZmmrfaPDgnF7z3Mf9aAGP6tIOsO
         6IT9RniByFkcDVBxj/wTT1HO9Jj42OPVk3dEg1w23ODLk6hmK2l9tEM8qB8Hj1Of0OXC
         j6dde1bfDSl6rsLmegP/extpE6NPBtJmrNy/qhKWSAe/0YNNjvu39eH6O1q45Zbc8L98
         PvDUc/YR/8/KpE/xw2Qh4j0UPlKizof5dBNGb9dwEUNqXFmz8eXsY2p8h0VmCn4+sEPz
         KEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393075; x=1792997875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxfSK5IZ5O0IFCRPnkbx2AQWRlFboHtFQ8aMJNkMXv0=;
        b=BJMQuXWmOyrpEgX1UTPLYxNApmryi4xeo2mdwjVe9d957SvbOjH4dv0k7/kmfjzyly
         oSqv6uVZeyVcMx92LKR9h4OSJvkmb/urr13eWC1JJS/phR2YWqCX/BpWqulIWVXODLpS
         brqHQI2QC1maZEFXXAWdAK2bHPEblZ+icl4KFexm9ykUBLldkjx3KS2NOBlKC7fGjEuM
         QqXFK8EaF1/xanKXCNozbx6UEwDIgmevTqYS415sih8XbqIi3zeG9GWP2SVJllswISst
         JfgTqwWEqoX+ff3pVe6uXExICEul8uX3DLqhwYYauHotgLsU4/hHcDEZ8elP3m4fAtVL
         zcTA==
X-Forwarded-Encrypted: i=1; AKwUvBxxilI2Ju3hP6QYVUyzI/wle0Gvglg/R31pkoYmbdFxYFR99sEa3SV462VyQ8/0By7N3+h4KZ48zp2rfUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEZx+NU9OskNM8y5Yr04dQUFgrBjpK5aN73z1SIYtkk0AaBwN8
	p0Ahv3t6SR1wGbd0YpNW1SvylgK/K6Ab/5qUVdbSxKdMbX6lut/ljbwKYXd4L2tJquCwVVSqzik
	tHbYzJyQ=
X-Gm-Gg: AYBFou2wUII+Co5+AD2aBlXT/1H5Y+EIK5fko8Y/qz5FkcjXYoIL+jtcICpw0qrxXOL
	G8q1cJjkpOpxjeKLCv4qkqel151B+Z/RI70CgZz0OeEvcibsCEqQGTgqLIKtbcRfCO6Ln3DRLLv
	ALBLsj70UU5Hz8RvS8B/TQFo6lxkzBUIScFAr1vtu0zRfR8kYBY5VkmUAbSBXoR3weIfQTn5jUk
	sdngg4+2TvXfpnIINrWzlWIOZ4y5oa4VyjXJpCrrdtAzf4vCbMoKH+Nn21bELgsgkvnr7E87Fju
	NjhSQgnGOr92JBGkEwf69I88EuwGe2BYPTeIWJ1K1Km2ahbDp+NcG5ehHmZ80UVMw5GgnOAvmVZ
	CfkcVpF9AfJq2aCpOMfMXk/lG6c+t4bO0F9naYfiRbS3Xba/NGtCN+SKmjS+fXe2JB0CgPMbJSb
	ZmZKUJqhkoO//OpdV8jUv6POsFfqA3bArCNOL/D3uWaIXrvHz04F/Oo7Ow+RZmCEKHSmWR+gze8
	g2MAVXF2dLeYguZhnS2IXuHI2Yj2j9OS8SxneU/0fre0L2t3YJrA2kBD+rILA==
X-Received: by 2002:a05:600c:6992:b0:4a1:d7c3:d3d with SMTP id 5b1f17b1804b1-4a1d7c30dd2mr130711935e9.10.1792393074742;
        Sun, 18 Oct 2026 23:57:54 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1ce3302b5sm172374155e9.4.2026.10.18.23.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:57:53 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:57:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Luka Panio <lukapanio@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] Input: edt-ft5x06 - add SPI transport and FT8722
 support
Message-ID: <atW_DkB9H0oV6U8v@monoceros>
References: <20261017140827.290666-1-lukapanio@gmail.com>
 <20261017140827.290666-7-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6wnpoaklsckkwk77"
Content-Disposition: inline
In-Reply-To: <20261017140827.290666-7-lukapanio@gmail.com>


--6wnpoaklsckkwk77
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 6/7] Input: edt-ft5x06 - add SPI transport and FT8722
 support
MIME-Version: 1.0

Hello,

On Sat, Oct 17, 2026 at 04:07:54PM +0200, Luka Panio wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/spi/spi.h>

<linux/spi/spi.h> already provides both of_device_id and spi_device_id.
So please drop <linux/mod_devicetable.h> which pulls in a lot of
unneeded dependencies.

> [...]
> +static const struct spi_device_id edt_ft5x06_spi_ids[] = {
> +	{ "ft8722-ts", (kernel_ulong_t)&edt_ft8722_data },

Please use a named initializer here.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, edt_ft5x06_spi_ids);

Best regards
Uwe

--6wnpoaklsckkwk77
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVv2wACgkQj4D7WH0S
/k7AvAf7BT3eOJwLMHu3yGXN3CuhrApIng3UUqEXnJLyTpbAVT3F/gG90raumnhq
UGl7PXQ3EXG3LCgRIkwqNQfJTBdwdqDdWo3Lv66bmIy10YRgTHNn3eSn7k/D7lXO
xyJhy7u785DrUyBAk7c9VgnpQ6haEx90dQDrvf61edI7+BOKLs+oAkHXwEtgtmkd
NV1e9kIbW6JTHGAlsYSW7YIQKDy38zhlkXyu/L/A+oBVUHzUss5JOvOuekGxzdQb
R4iPyPcrOU1VRxmAckvzHVP8imXWy7kP1HTL+oPtjkyKR7w8eAY0Vow8hdLsbYvp
TyIOSLT9Njcket/gjkcISbC+l1pDkQ==
=k8s7
-----END PGP SIGNATURE-----

--6wnpoaklsckkwk77--
