Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887206;
	b=dclVLZgOPFV7LGJB/4qjhOdc0ZdMYwN0GQ6pt1sbfdzCQ4uA9ZxJD6yzBCr1KUkVIQLH
	 rJytnIsvtO5ojIg+7tbzAs6UFzZhLcDfcYnTKMsn6MGazkRFnYJw4U4DGXOLnZflWKzER
	 u20Vl/Fem57iYgkBI2vVX64+hh1Udb4eBM/BXAFTXvLw1FEiASnBoKq2g2ow6kWbT9jba
	 rTpiuUDPhSGuvoyY14VmOYuIPlRSrXxf0WEr5ssfafLHX62DYcD5Sz8QQPUaBL5Qk7J2t
	 NoFAMEgaCnUYAlM4lEraacONZ7uX2WiBqY1dSNDVSv9Bc7IQYrVSQOJhH9rNasL6p4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=;
	b=XjKa6aAbYnKK7djpZd1Nv3Mx+U7skxqfMSd3cIjWWziOLHATij+6LIpNwaJp1beuMcoY
	 TWkf+VnnJf0W2A80EE169UbVIwPocXxQFmQ52/7Wp8aXYKQsAnKFuGXvrKp9oZZMcMN8Z
	 cOglODbbzs2fKa/3l8t8wcXURx4j4c72xpAuwEav5/AKTAovg2HGB2lIvGMl9b+v2MyoV
	 8YgMlFCgDlVr7bm9NjD6ep4KKoIrrNve3xQE5gLuRwvMoXofgCGfF0AzbNwEO6DHjIbxG
	 GhSo6jXKQp8grNjHf8gHGhMR9xqrxlUqXGuDCF7hqQN2pH01QL/GasYgWW1eriSpqLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF81606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF81606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso9237835e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887194; x=1794491994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=;
        b=SU8EB/5l1TjO4SR/ZHfVurcBTZbviwe8Nvokm+g3goN3ssYVBwEQd1KNYBghk+IBAn
         UPgYM/9MOmdy3MZFzi5hffeEWAoioYQmvG1eAggddRsJr8jpml5MMp1fiKg3poEuB4Op
         PsAUqk8Ee4I6Nq1jS4e9CNkIX9bRl8Ww3+m3TfE5LyxzdAXAFyzXytTwQnSixgCrZxtJ
         BbSj40LqKDs3RHuqIj6pJIEfXncRWmKOW8LujwPQd8dbB5OG/P5E/BzrM5xR0xfCrRm/
         m5eAxF4mvBYJy0ku96BAEmJJX4mGG/cr/w+eYHTpPCieMbwLOQknvWORhQKErWQOeQak
         aKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887194; x=1794491994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=;
        b=0Y5MkV8qEvTearWIpT8Vyo/tFlAYuv4CCmPUN5lJPAa79B0214ncILbSrcfAr8r7lM
         bhC5p60z0Wv1CT7C/ZzOdjw2XZ2nFfkyBqIdtGQHpDurKDsrHwjp8FXH0RSLufv0UPSW
         mEQ0Fm3mO+MHhsfJ8ZwwQ6MDDWjoDiBhCLNuoOFoaik7BbWt0u955IS7tNNyeSKHnB7w
         slqAkZUZDD9ZDNJDBY1BlvC6hvBJvpcCmq8bhd/4SUKFnjgh2nBcoe6brlyQpvcqq7yU
         RRCI6hJ41QHtNOeNzKWJqlMBNjlFT46XcbB/XKRe2V/ohhGeGR71EJtaC6GQthdngy9e
         PVag==
X-Forwarded-Encrypted: i=1; AKwUvByQBoWaXDI6qUjzKr6NoSlwqvXESc5+SLWs6StAV5qLSbc1thxE8Jso6QkiCsFQB/TrXqZRu2kCBHQVECQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r4vGY+bKadz2CX0of/dZkxVjtBCg0xs/s+EUaERF5qzc2kQcG
	IOkTeohQvFcGlMdUsG+SUzJUCdv2eugUHlUt48RXYpy9IoGd2OIOJBdIokAKLUnuacw=
X-Gm-Gg: AYBFou0UjeFQ8XIm7SNRPemxJjTTnU2aYltBcnTcrFzwhGRGhuq9pRDTSEWdDpc/uhO
	DNt5+sVewgFHKMTc367TDOB30jGOhWMx1RP7tQ0b3qsDfdeFDE4ql6t9zTtToun9DlTpugTkk8y
	oEpVQf2YGCD629vCjF0/ynARQSqdoUlj87IMqkIYVGAupLlRrNVBhZvjPflrhJHK5XCXqVjFgVW
	0B0eoMGj8q4Xz2TjBs9ddF5uUutXpMC4XhAafDZcsaI5CMarImZvH0Wy/OO0atRngrP6qqpY2g7
	S+3bxFEKQrtGWunRLmfp17U1cqo16iD+fGOXgu4Vk1zDvxwmrnfdgRHtG74usKpRt+hZAGpY4zq
	yg/5ds+JvNr1/TQqh9jW/7ShCxaI5mPxu28RDVY7WVBezBu/ix6svfNyqc55Yj2Jsv3rG9SwOhZ
	B5Nukp/bpqZBHNX/odO9HsnZEWtLHKvK/V5I5E3QgPZcsA7vRr5syaV2aUxc7ec6bXp605URoHB
	9AmN4pzPHJoOAgz1l48cDIr9Ibo7jfQumB1dT3JoE/xVYSEfQ6KAvntuOdpTa+n7svbcymbokAn
	D1umNtvXQ1/QgxjqkhTZqTdul3M=
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr259029715e9.35.1793887194037;
        Thu, 05 Nov 2026 05:59:54 -0800 (PST)
Received: from localhost ([194.213.108.9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56e2ae73csm69855805e9.1.2026.11.05.05.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:59:53 -0800 (PST)
Date: Thu, 5 Nov 2026 14:59:49 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tim Michals <tcmichals@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] remoteproc: sunxi: Add Allwinner A523 XuanTie
 E906 driver
Message-ID: <auyLnRhPv0jz1roG@monoceros>
References: <20261101185735.762559-1-tcmichals@gmail.com>
 <20261101185735.762559-5-tcmichals@gmail.com>
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
	protocol="application/pgp-signature"; boundary="bvyb3kuhcvop66ue"
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-5-tcmichals@gmail.com>


--bvyb3kuhcvop66ue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 4/7] remoteproc: sunxi: Add Allwinner A523 XuanTie
 E906 driver
MIME-Version: 1.0

Hello,

On Sun, Nov 01, 2026 at 12:57:32PM -0600, Tim Michals wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

As for patch 2: Please don't use <linux/mod_devicetable.h> and rely on
<linux/platform_device.h> to provide of_device_id.

Best regards
Uwe

--bvyb3kuhcvop66ue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsi9IACgkQj4D7WH0S
/k5Wggf/YfIQ7WHmvvey+xjJQnqBBC6pD6WMGs1N8zOjBs47xKTlmoiTy704ncA/
SHYjg0IkCpwOICXXvfiXJZFK8h5M7+y5jrB6VR4gKwnHKcUzaD8baV2tzCTRxFzk
q7fKaeI3n7fNH1aRrXWMimidD77eQ9VgIocGQaE05rZOFLWYznwN1IejorHjVYp/
vlaPrjtYabWXJydNPSHUrC4QQNwhhpon6qjxkgmEXkcW4zWORnfjI58d7MJv7jNd
i46zZKPpVOXafx2kCKmbSiggE5i1cPr6O3e+3Muw64B0kJenSgxjkPD0kzt1TMDL
MrWyYaGIU8+0pgKPYFIeJQiOoD98Ww==
=7Net
-----END PGP SIGNATURE-----

--bvyb3kuhcvop66ue--
