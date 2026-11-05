Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887006;
	b=j5QbE39ng/ZYD8CGd/XF6D/+BfTY5DkM1oOozjeRRIkfmjWxIqNjJaQgYepmkyr8NZBR
	 HfqVV/tRyj1kcK5x8Cy+jcvSYx108spnfrp9Nef4DsAm94e/NCUeNYoCBViC8u6hbK+1P
	 moX5xMDWpthaQULqZpOT5AuLZ+WtKRtchOl+8jMHVpBm7Gwqu5inSSJeFi/aW+g+3blsD
	 uviBxd8o7W9xz3OTv7roviJ3p9BQXnqr7RAdpLmbyfmjFh0jfX58rYHmTm7805njKC7AM
	 WkIkzcD70w+V4Jt0VwJw+UC64qpl8BHy2Mdelgk+0VpWhEkL5gT5zzILTWE89hPiYKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=;
	b=D9KoYcibEizoXcgsjulc7vDaXEg5lLxtBJwcWfUpBkVKe9PlLfwG2YCEKb48P0poXe97
	 jTUUCNi6HadVuy0qxAJm2y/uuVVzPHsSmWEKRzl+eEq6aw/JdgIwcWLPUAm84EFwQ5/L7
	 mtsydkOl3QsJQVgOE2WMFiaMxEYpriBwXcGVpWqHD67nco3g0ak+ku8SlvWytFB8tWAS6
	 3ohFLe+WwhtZ4uU6ZtU8dPEm1BlsYumcjxIx5D94XhI5CtGXY4liBhq9gaW7AHIGxP7Iv
	 zYm8051dUShglRtUl37CvPGXUDU4a4mhw+w0V/mkBi5t8CzgJNrPolAxAuRIyEzWl2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iNVA6ioi;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ACA606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61ACA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iNVA6ioi
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so1527434f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887004; x=1794491804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=;
        b=iNVA6ioiu8eO+9tzpQL3oNb86QKDrzMRHGj57cea2rDeLio/Y1s/ECZPeuA/uZ3iA+
         gLGKJgGVi1Yp5zVrLk2D43+m2iffO+kvPjNBtBP7sQ/WeIJma4EwdzZPyQk57IWfjwy+
         NIQjFQu2oxZXHZ1Irrq38vHb77m48IA2KvwA1f06AmeoI4Ax+hRkDVqKZ6Dx255K/2vf
         ZKsHj1aLBrYl87FR3WSLF/XnVFg5MJ1mJ0U5nOKafZ6eiglpNikiKms5JZMBjMjAX7zW
         ggX843EjJdH2OMcJQQ3KhZeAxGRz19kqjz/InMwpf/mW7rM1MdZblXXanMdFRKwnb59M
         YxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887004; x=1794491804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TiKAvJXB1NGH1N8fdTjOIOAtKyqlHUX1XLSobFGMdc=;
        b=ElMaS8ZKgOpf5n7X24bBnduAihmERyGGgxJpDHR04R+AVDfN7Fy6SUCPE99smoqyBl
         X1MJckB+2YzEeOdkXbE2oHXBuRwqDmtpUNNXnBy6vYDi9V71DUoU0v8C5qW7AZLHk95B
         T6aPsk50Kz0kGSPTC2OCNEQq1qiAlfHEZlAlEj5OobQKwmytBO8p5m1rlT5XQwLW2050
         qsAshqp/yDNUPolFoUuwd946MSn7zCUqELMrZWhqk2XmjdXOsCSH/TVQAo5qgpF0+ii4
         mLWD4yFhFlX72G7IlzLtDVRUDvXWrLvhtkFytOtXaqkmeY1NgQ/179gki5u7daDJBA79
         hJow==
X-Forwarded-Encrypted: i=1; AKwUvBw0h0T2mSV5GMtWP46eSQCZAKefCclLWT3Dm070iCjPhrXhqWAITuHDRSjwsKMWoj4+SyFAsbfXNKMlLzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ExIo+h2bAJoI67AkZlU87Tu5M4RT4+Xo2+xjVtQy7GMex+Azu
	1mrO64G9+N036GWAk335E+jS62uK4TsRlnrHBKNp5F9pjy9LXIhEw5lRs1ciCH1pPG4=
X-Gm-Gg: AYBFou2z7czv1jAZyah4veN4ONYbiAS1b6VA+6B0mo3Z3wWUHL9w8x86NMLRU8Qxztb
	NIoonOBqa6bUGKJm156hgXXazhLxWpdYUCrGaVYulGA/woOGUoDtTJObihDAUwB/ZjSpoPVvlc1
	LPR0XpMVNrXq7UzryjaJfvodRxju+p25WxlnRWIPsBbLQq8Fvjybe5Yr64GgQiB/kzAW9lrDzS8
	lMsfrMr4lPSfzCekuyY4pRyv6zTT4+lTypVYce+r3YYz2fRl69oqYM3r4FqO/D46zZlZabaqU9m
	IuAEy3a+sg13b8vG/CNiRgTIHUp/VE0oTQMcZRnkGSocTHhwICvSDM4V0FDPQ1DWcQdP6cBEzjz
	lEJWLcrZGoY85dUjie5shtjceR7GfvuBvhu4xEK9oEXDssvzQIx+mwG8qPVGaNBv9aTLTtUASBX
	QX6oR+d3kpU+dg0VXFcrlpxJjWbxVowI1ej/z6ArE4sZVZrwJinXbMxmPg4kni/z0I0YMP6yjg2
	rC9kRxPk8gJXEauZ9rfEJ4UuttRleihJF3Yt+3YjsW+P2vwd4/qsi2GvYNcsFgoN2QESqlZ/ior
	XoHCsGBeb91MRnwsvF/lxvyg8Yc+
X-Received: by 2002:a05:6000:25f0:b0:48e:4f1e:5e24 with SMTP id ffacd0b85a97d-48e6e2e75b0mr38836163f8f.14.1793887003590;
        Thu, 05 Nov 2026 05:56:43 -0800 (PST)
Received: from localhost ([194.213.108.7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48feda20567sm10969363f8f.51.2026.11.05.05.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:56:42 -0800 (PST)
Date: Thu, 5 Nov 2026 14:56:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhila Kavi <akavi@axiado.com>
Cc: Sammai Chakravarthy <schakravarthy@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next 2/2] net: mctp: Add Axiado AX3005 IRoT MCTP
 transport driver
Message-ID: <auyKnmpiL7ZSJkgs@monoceros>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
 <20261101-mctp-transport-irot-ax3005-v1-2-36ceb822f01e@axiado.com>
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
	protocol="application/pgp-signature"; boundary="2v5unmaqs7i3rrwd"
Content-Disposition: inline
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-2-36ceb822f01e@axiado.com>


--2v5unmaqs7i3rrwd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next 2/2] net: mctp: Add Axiado AX3005 IRoT MCTP
 transport driver
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 06:00:58AM -0800, Akhila Kavi wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as it pulls in a lot of
unneeded dependencies.
<linux/platform_device.h> already provides of_device_id so you can just
drop it. Alternatively if you want to go full iwyu, include
<linux/device-id/of.h> instead.

Best regards
Uwe

--2v5unmaqs7i3rrwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsixQACgkQj4D7WH0S
/k68lAf/S7Au5tx54BaHhFIyr9rnWPJhc+OMWG/KaFglaxrdG2WQeAImkDXsQr88
Akm6VVPKYQBh50KUi2muuoNafteiCwHcq9JtSo2+R9q/d75TDEKggJICOxF7DYzs
wTbn+hGwOmxGwHjpR0nNW8uQWUyIhk0irXV3NsQkMhikal9x5T8XOesQJnoZA3bT
UEzoa1NXgZD0o4T+sQSLjMueCbC8OkC7GrhuMqiNG6OzWo42mecP4cY4li4MxjqP
rFj3ymSSJzaGlEtZoe9+m0986qi8/JUOkyh26I1QR8xsjKpq194Y55T4uLnlklID
EsuWtThrtvbozh5Kxnz8O9aFUEb1xw==
=onVy
-----END PGP SIGNATURE-----

--2v5unmaqs7i3rrwd--
