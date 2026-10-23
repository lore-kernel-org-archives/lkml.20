Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747166;
	b=xxHkva96GqYzVbGuwuuz8ycc1S2r5uXnkLWg8e0zkxhnpJ+iRWC0JxG7+ynVFbHNKqQg
	 GeF6zzfyUsuv5XyEvsg5YuBUkG3INYKTdRHatT5isl0i60MYcfqpOWe797rA699hjPsxs
	 KO4KRnSaJ41CjP+0UiM3D4YcYXf3ELcsHW0SJPq555bVPSTkDiSg2QPR/rGAyl96mwTl7
	 CnB1t2RXJgqM+VUM5GY0/wGYD1qg2uHB6H1sKGk7DphZjD87kuYIjXG1mN24+yGV4v9Yp
	 C5USnKigF55VR5QQzUWYLnvGxdPYAgl6WS8UhKiCVXjjDFJ5HU29radgNQGnflMVLog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
	b=D5ow51L08sSA94DvKI9Tl/0KWw8dtOrDpCRsq3we0VJt5md7HUC7TJj/stOduotd4ym1
	 q0SU+37l1HVw3PSzF6Cuh/putK03rraRU/zqHkOwMA/JOfJe6RvDXVqFPkN9v5Ht+R2IE
	 09uMdrBEMgAj2HxAypIhssjiC2Q2372qWW6jb90d2LSq2FVsCu8vf2XNLrRCtiLcZkMBu
	 tA2LtSCw5QNZvHpxUc4EOh3VgQWI/3HX45m6VbUpo3ImPMccwpbIgkfpbo2+rHSxnLlnR
	 NIiRM1VmJ1SW3HSgRmXGzx0wibsL+CQZ5D9Yx6hriglB+EXZQl0V/jDBtYtqdXPa7Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Yj3rmPTo;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC3C606A326
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC3C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Yj3rmPTo
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso7251195e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792747164; x=1793351964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
        b=Yj3rmPToLOKN8xuppifugG2rIjCCPt9ft12dlqb/gnC+2YbHPl4kJWD/QMlA5FuHp+
         MCy7dgkx82hcuJNtw91QxXUPTatBrGhwH6fOgLSUjE7/wOTM/C/wOyTxUViIuzTKzDXX
         Bw0xLWj5M3XVDZLakNmHLSYOk5IoWG3bWWzUoMO1coQF83rpIQ/RrauH4mTJlfThXv8F
         mkLFyPJgmvpDB9Mkc99jHIvGUXif9cz+EPEyc164VkL7mSCbOqSiaoDRb7sJETfxpTF5
         fY+eb2DWGhRthXuwq6EB4ZCZbIXPjAfBVjjEiKjWfajFwoukhGTi/IOMQUlLshiUEPIN
         hoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747164; x=1793351964;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
        b=laDQz6RwjvIceqptFD0j45hhWBwEaSWDZztrwXZ1i2NXlTaW+5Xu0clv8u7za1kb9k
         35G9psQmAGOH1hSqzGPZ1kncbF2VgC4NtJwe9vyuAdasyjrDS5AJXGutkkYAQ6eS1tOl
         hV/GC0MPjhVfalToNLOqrR7FiHd7FwlvVnoa/ZQ1adz8lsgiqEcpVKXmvukczQb6sKmW
         /t8hNfzdsWcquM9g5uoTrzErDwyUAKX76POqA2Ft+ajeMwSHHA50e3oY+Cf8kMMbKuw7
         G5IXl/Pbl7h1nRdKNWblQ2PlT2MWfSIKP0I5J+sBXkj0XIGm6crxntt0Ng8doQlxs/wh
         tpeA==
X-Forwarded-Encrypted: i=1; AKwUvBzmJDqArF598TWMsDzxXtp08EjE+bCE84FjJ6X8Wv/bYRMnzXxKC406NSIOVH2V7+V3CrjGERCipm4UkME=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9xvgdMcsSJTmOtsygoZkTxy+1nMoU/MUtsfxGeeEkHsnkKnLY
	XC9KhxntxfHej3EJDCL8/YUMhK0tlE92jenhyy50o2CORQFbeirsFFUK7b+kVCCzjSs=
X-Gm-Gg: AYBFou0fDt6yfhnCt3DknanWj3JUKAu5CowXR7GRYp9sw9wy/CwCM77G8y2CLPCw3od
	BJ39sath8kbqq7Du2hWpwzrOuRilmBNYaYtHOHY7Y9ayboAPLGonFvWYs9iAvfglLzYPnlaIQ7h
	+b0P5fI6sbh5JHO9ABUADZ3HLOKqQhOPNWKiDqwKq0URc+5mqrH0e0zua+AJhjGglesYbNt9Oc8
	MvselaqgTxQv0Im+hqqvRiGwAwD2NAQKFZL7PqKJODfAsi0pkoRPY6nRhb3G+t7VSJCy6GAE38X
	6mZplHv+1Gsa8BL0EnWSfyG8F9zHkpPxnIIbFSaPzYII0He2lohnnYdHIWdT8G/nIrLU78YijjR
	9JMxK7aWZWYgApoiyWVqaDupkNPozgRMXSNyu7fE2Rb25gFJeZtXJRW96/2mrwaSf1gIdbKoMfl
	1UCvSkPQfpAjokTGfyU+fFjgtEP2u6Us7tp1ZaEEpnFenBKnsw19wybPea2WpeviZK3iPZyIKsC
	07eCYNGdm6yMo7GeD993fzCloa2s3Az+T01CRrBzZgNGgBtAz1eZn/mqwIjO732VBrvK0I0L/9t
	+MaoxevM5+3HUoXy5Lj7Nvnhb/IPQQwrVwbt8PB95yg=
X-Received: by 2002:a05:600c:8712:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a211cd5eb3mr28983755e9.7.1792747162862;
        Fri, 23 Oct 2026 02:19:22 -0700 (PDT)
Received: from localhost (p200300f65f19a9045816c66224fa2d94.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5816:c662:24fa:2d94])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a211ba3e22sm53005535e9.8.2026.10.23.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:19:21 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:19:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Drew Fustini <fustini@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 09/18] pinctrl: zhihe: add A210 support
Message-ID: <atsmP_5sX5RFunft@monoceros>
References: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
 <20261022-a210-init-v1-9-09fb4d99da65@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="covttcbalrymohfa"
Content-Disposition: inline
In-Reply-To: <20261022-a210-init-v1-9-09fb4d99da65@iscas.ac.cn>


--covttcbalrymohfa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 09/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Thu, Oct 22, 2026 at 03:48:17AM +0800, Han Gao wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/mod_devicetable.h> pulls in many unneeded dependencies,
everything it provides that is relevant to your driver should already be
available via <linux/platform_device.h>. So please drop
<linux/mod_devicetable.h>.

Best regards
Uwe

--covttcbalrymohfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrbJpUACgkQj4D7WH0S
/k7J6Af/akzqmN8ibSwrfi12ffHOWdI7Our+3A4vhm7xG5fLhDxm5RVyO9IOnbZF
hEEqQasZCXUckEd3P8maCUNMZrumlljeFYUKxiiGeUptwiJNhDfD5gwgvKN+QznX
WUBMP16Z+bJ04qU+9Jvxwu2AZERVCQgTDx7HM49rEY2meQdARZ+74mmtm7x3AKyE
LAf4maK05HpWCQtSPGWBSz9ZRiv/TrfMYyA43n2Say17TUHYMVEZfRooCn3JlUBB
TybkgcHqyHLbqU2SVAqhlZIuIVWIEQWz1aD92G51OANqUqboJ0wTWbGxYyrQMMd/
VqEBROgHbira21nt4uuVoVmMDk84zQ==
=XQ/k
-----END PGP SIGNATURE-----

--covttcbalrymohfa--
