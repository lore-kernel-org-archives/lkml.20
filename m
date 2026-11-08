Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127059;
	b=d7XAj3XojalHl6uSgPS4euSWfHinkQFxeS9V8iuzlkN2NiXGRTNtF2UAdNbFtPfu7uci
	 2NaK2mQlfcIffooysclff2ty1ba0DZUxxp3xxZCzaMkIV4cnl0j4RMs9z10zZ5sXptDJl
	 jdif62l8NAqxTIaEmdcfb6mVqtjlf2mKQ1OxiJX3wmmZOsrgSmdIrE4qtdsTsFT+GjzY2
	 28EfKLzd34xsx2PxrqJG1XzwehabLOFhEBK8xGj/pmDDHNln9Co+PDBncyCPjuXK3Mep2
	 iIiCh9+tvMphd7CFnQCjwE1pEsZnJ+Qgf7NKFQyMKfcMIrCfPVm+P94wyKueI5pzoxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=W9Ut5Tx0R51AH+pmP3Heuh8Ql+5ThEQrrnH7J3z+HIk=;
	b=WrSyNWlm1Ul9XT4LAvwEe6gcgCa8MZ1Dl4PyMz7HT2X6/AZz7xVXMJhaaQcCn2P2WZvT
	 SeFhqUfkGpMWO/sWUtKnp3d9XRxDQgGdKT6nFOdsCtHp3mNe+bMgYdZQOZNM+cPIUXzpS
	 9dDLe1JbkyJaGD6o/9r0acBUwKzAv5BLs9RlA0zFrtq7jMAPh27YPw8ySxAWx+hz44kMg
	 O4wHMi9Kk0Zlz5oLmA1rR83EbA0piYY5d2v6AKGAMywahXomoapbqAxG8T0uVsol8hCUI
	 +hC8BZMFNDrjZz4bruiwqsIA47as7BCWMEvSiTWX37CzU8EPsCZ6Z2vlshUmqldStLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="KRl1/c0P";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF182606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF182606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KRl1/c0P
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a210470b49so1237225e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794127056; x=1794731856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9Ut5Tx0R51AH+pmP3Heuh8Ql+5ThEQrrnH7J3z+HIk=;
        b=KRl1/c0PPnSdSq1ZKNqLBa03Uz+GxGU61qJiBhlqoyYmXnNVvI8Q1SPnzFP7uLh/QL
         DktUd+TgERSpUddShdGXWLCdk1O1O/4zQ30BEZdaa5ruAIuRLY2wfhbK+Hp2OM0mvy1E
         6nPtXk75nCi6cL2NmqmzTnk+JkN7Ra2h5WHeLZ72VeEiTYKmKHaSPIKVOgtFk1Uo3oWn
         iv7eqDXDwDWRx2rJW62u58uT3IXmPKqoniLuxEHWgOXhVsZE4cOGaPXa23C5rp2RfgGz
         DNWBM/uFcC9Y3MwnKik9kqRh2KF+Dfr5/sxr7HLpkXoIwi+Ef+zt4h15kG/Og1JYVFxF
         taQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127056; x=1794731856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9Ut5Tx0R51AH+pmP3Heuh8Ql+5ThEQrrnH7J3z+HIk=;
        b=fNSFyoyeLwio5ALnjuOA04dkd6QvXmyfZjRWScai9vaLHRkn5UATi4z1N62X/a0aju
         Q0kjY1rQsTxy0yG87FtLA5pYSq3koXzV0DvwnXHiysRSEwrqApsDWNQFK+lyAk/CmP9/
         zhW1pABYWBo2U11yFCDsmzxWs+1DDfMdwPCnhZbUxEUDokGhIDlWuDUnqiou8VppkBZX
         5gTvDLYfzX6V7flbqsLjOeijcd6CIj9I4N9KdWCxAHpmTWhR6Db96EEiUXxLsqMpc22R
         umY6lqjdoyXZEl7L6NzIJHlM3VheMA4pbvzT4JIbyfhtyBYYpOD++kXaA2sM4gcWv2dC
         6dHg==
X-Forwarded-Encrypted: i=1; AL+hErEDT3Zp6F4CaD/O9L3Jm253ShdDQDvbiFMxMLuBM2zPhka0/ZQKIWfNoJ+MQn6WKecXSKKrx+8BbbiHlg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xcPbVZt+dERV4QxT2wOikzNbqHvimdhkcBH97M2GULh2EPzRp
	5uRVbaDO0Ys5XVqTM+HJvW48XJGGS8bxOXR87SffbCPEYPC+/l9A6WVjYXJvEnd1B3jSU0DJ951
	KCz4RgVw=
X-Gm-Gg: AYBFou1Y6IMCsz9/Nq5s01zWtHAg4nGB8r9lJwvUHg9fxpviyXerPZk4rVICJfbwdUH
	l2wYqdj36pj5l2mNcJJ7oXkghvDIWVecuPDmHPZkmRaWi+lB4v9A5PRkUdO6mZzwmgeWNp/qV1i
	1f/2M/NHLS6LF6Jr/7qu03ykHoA+O/sk/4+OGWIH90NS3nZPiplkGYpvBSm88VeXb2QDgAOqkwQ
	xiQKC5eWUXv349PrtneRooosRlIItFqiHGpvH+mUXZUOQVEjn5RxfxwkyOpKtTIokYpZfLlLPBU
	p1GlVlUrNtZ/lD4eWIoAtVakjMUqOBQobCXdk6ce6Om99qRZCfpahHEwqF+Vc4iO+gMoebF2E0u
	EkiiSere10p6aHuO6VdIsEGqMnX0uCJ7C+fBAQzMFWqBcKSsv0f6tV3gdLxZy5VVkjP1Uk70NlJ
	1ViPItHJZs49fc1k2w/xck8zM3HsoHezpOJoHleUFtJfDRtMoZSKLMdGJNHJBNxn6eEgte3PgtN
	7mr92flg6SQyfMtK8m7+lmy83BgVtxt2yUK6xZOTRQyyKFYBwIly+xhgEcFSUE1BtQy6j9qQ/NT
	uERvBm4xUOFTtCSaMmD2oecswka7ZI9x
X-Received: by 2002:a05:600c:468d:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4b94d7634demr18663215e9.1.1794127056384;
        Sun, 08 Nov 2026 00:37:36 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b7e32ad610sm320858215e9.3.2026.11.08.00.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:37:35 -0800 (PST)
Date: Sun, 8 Nov 2026 09:37:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Owen O'Hehir <oo.hehir@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hal Feng <hal.feng@starfivetech.com>, "ziv.xu" <ziv.xu@starfivetech.com>, 
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 2/3] rtc: Add StarFive JH7110 RTC driver
Message-ID: <avA0OjTMLYrQtkzt@monoceros>
References: <20261106175600.3877614-1-oo.hehir@gmail.com>
 <20261106175600.3877614-3-oo.hehir@gmail.com>
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
	protocol="application/pgp-signature"; boundary="w6dqbkxjdqv4qjrl"
Content-Disposition: inline
In-Reply-To: <20261106175600.3877614-3-oo.hehir@gmail.com>


--w6dqbkxjdqv4qjrl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] rtc: Add StarFive JH7110 RTC driver
MIME-Version: 1.0

Hello,

On Fri, Nov 06, 2026 at 05:55:59PM +0000, Owen O'Hehir wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>. You can (and IMHO
should) assume that <linux/platform_device.h> does provide struct
of_device_id and just drop <linux/mod_devicetable.h>. If you insist on
IWYU, please use <linux/device-id/of.h> instead to not get a bunch of
unneeded dependencies.

Best regards
Uwe

--w6dqbkxjdqv4qjrl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrwNMoACgkQj4D7WH0S
/k562gf+NM6dtuk+VWVwvfDXf9+p3g0jKrADlgWKDDzFhosSn+83jWZrSSeCdQHN
atEMR3M+GFDakfjamoCsKhlrIcVely5FAoEsrgBRIKs669FxDnv1DsNATMVzwwg3
Eg7y2DbMRNDqwG3W1huzFANgVlJwJnxjNyAzkIwjXJ4ysfKo82m5VmiPfRGvzsWU
UiBFjyKSYAmyZcKKgFfWPIkhzz2TybMy3giCRfuzG25nzmdfTurBybDNOR7u1SJo
P7610P2PM85V5G1mowLZWnrdVsYYv0dj/eReQgJzlnvNrPQbypbe37ci9ygplOE8
GyU8LEPvbAlhS3+i4v73X+olcVCOKA==
=o5i2
-----END PGP SIGNATURE-----

--w6dqbkxjdqv4qjrl--
