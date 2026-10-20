Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792499885;
	b=abghHnniRJw6jtCxxOBOQe9+jYMZ2h2QfxbTlyfQZdmNvigL3LKFIeFDCP41LBgS2VTy
	 Y2/NS8jux/797OtLqG8z5xzSFAwe5vDzLykUnR5caQ6+lO/pI6PkKQY2KqyQL9uJtYDOp
	 WeSlAdEg+Zc1+zHpK5GMqf413lSuMzewHoaXyL/T4qazw1LJ4wuP7vEcCdQNeH7dQWd2m
	 9tnhcVw7jU+jdvkUhDY8ZijH7zbE3DWEygLT1TMsl2wUUWEOnqblz7+4YAvN1OV6VC/GY
	 VesJ7MUimpnNITg1Yo4VekELI3SL7xzu3c+7r0W13Wwu2WK+QZGxvS/ABvKUMYtPtnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
	b=KnKOpqVOd3jA73rh9OWnDN5TcG5+i5ohC1AIRTC8tuDUY2JGeTvWno13qpGJravvNKgc
	 1tEC/QOezBhuirujZZmn9xsQCuu3ApTnRX5pLINZZGEo5u6JaOZRsICRKrKfuk5XWXwvY
	 lWibpSiA1JyFBWuOc5/q4ZvgLY2+C9Rr/Yq/ayGOdhpDgRS+Usma1L/2qMREcGeD87cls
	 R4KZO2qwXZG6YVQDbx4hEGTpYaQqvBGM2krVTBw79V3R9krcHZ3Kz7NqjRkJ4nDbJ6GTo
	 oCx0SKHGQ5PjFmR81cZetsi2uqeJRXz3mJUGJJ3PHWJbXLusTHTmy3yujkpxkUYxEkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmwbXUqD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CC6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57CC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmwbXUqD
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so5995853eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792499884; cv=none;
        d=google.com; s=arc-20260327;
        b=grKEaFKPsj/xNafZlH3gVmevOGDz+V944DDLiLj9/sTHTSVuWC2gSlQSekeCTjuuqN
         W+ZTWiC9P1T8DcZRVhIbpiAzhlman9KHCJN6PMg3UBBaiuRUBBDzuidYBUvWL0b/kt1w
         iKG8jfC2UZezPS/gVXVb8SZConf2iwLw/8kFt5h44RiCpPyvLnl3wiDmI4l9lUiwVCnd
         IM+0c7tJQawK3yCg1W+cN8kY8nrTnUmUv8ycIPvPYAGxEZbNWZQbshl92lzD/lsg5K7P
         wPfEWQKmvkvoaP5/s58+F64Z8QVK/Uu4tIooifXzmaNJWwQ6zyEer8la+gebPGSCvXKg
         p/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        fh=s1UgywivQZyX+4LLfw9BmpetvJkGw0xFyeRZWyg+28o=;
        b=ehCB7kgGkSgtCgL78HwD7CyvhI65ftKcZ7TYzbj5L4tPE5e5MbE05wzOk9Jl0rE0LZ
         PncoSFpRTslPmWqKvbVJ8pb5pkSpJ3ulBDBqh2pV9JvBxbFkm/pK/+rm7Ld2P4wpsU29
         FfvUbhrFvZH+I8D7eLHNzAs5MGXc3rx2AjUSA8MhJBHEiDPKQR4YqZjxE1dhgjtSqSTL
         6ER3k7LhdLydfEX8+eDfo+vuGB129s8PwgSjoy56OrBCxU8Rm9exyUHmVZ4IUEGQUHLg
         X5B0rrxGaRxDZyuNraY6K5I1EGpHl5Di7bKMy7IbeLttyc0TGBf1Guu1MbMRr5Y5Rk6V
         yDRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499884; x=1793104684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        b=jmwbXUqDvmKk+mts4P8S4Qs0OykPCvL+ZlHj6qhWGIspF7//gQi87Ih8CsHjx/61yv
         wGlS2HpVAHZ3Lu2ZAPezB2Da+qfjRMgwpyxguCAQwdLYXpBwUdJpC53SL8i1C3AluBoz
         PqzIWp7iFtQ3nWEao5a48mvkJxBlgXCvnVIAufBOZw5diHqP7Uv+RTsrse9gVOp2u64n
         nYOWDbEr9XRZ0rVc7jU4+prj4inZNvasO8f+AIGIc9AouBH/JWrRm+lojVGH3yZn6mxl
         TAusewpHXJcE6mPh1y6HGwM6WdkqGXkCVqe0uVPsAZzpnXchYt+hz8SjLjcXT3/ExGSX
         1D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499884; x=1793104684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        b=x5IHq24c5LRcOnA1suhPJzw+tGg/hQ5/27Mpj+Ia/T1Ssj7z3OwUdktS5DiSc+Fizu
         G+DulnOleFPEAdAYsaLLhbXE0Unk1J1iObfdu2H/0Gb+t/BA2ksumkx96GYyzotU47wj
         YR6kazTA9yHjlzofo+DWiN8hswdnK+uTzaSojcgf8r0/LuxokVnoshcSDhUT8w1Yy/E1
         czEaMAo4uVwDkN0D9n4Av6SoLKTtwnr8UQm1VwUNSxT3ae/v2aZH2P5CKzYetOioTRXW
         Jvucb2X+W3ei779EnrwCCJ75ziIjiJzifC6VAyo89JISPPKEP0MBqmJxJRdOZCrX/tbf
         mReA==
X-Forwarded-Encrypted: i=1; AKwUvBzQtvVWTcYVzYgk29r/uIcDpieKMgUFh8FcivuAlO4rp0YIiKDRvQzgmzCJ0p82RPpPoXIrgTSzp2k1Cpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW9M3q8o5nCjQlm6WDMpoVjKbtOFIhLKLIKsNB82xkoANBOFsq
	7AzUHr83Frg9fvxPiFqJN3TeemtaV7WI2hzMYvqUyOMMUtGxNNMVATYf3f6qGi5CoJCWzJB9fvp
	uzwgXV21Jenl8IGospc1PzP6nwtEXjJI=
X-Gm-Gg: AYBFou1GGSwLiZHxv3Z1ag2TieYKoXCU9Uu3by1NjXo5AomngAcqCubTdq6O7zR7e0A
	LOK1cISQkIRZ0ovMm5C0glaZV1R6ZkoBt5xnXWaTHbqgyDzV3PvUNq1F9YGMsaxodvm0mT6hLA4
	c4l3WEKhjFyaPXVkFR5YU7WEK3bHTegFVoBe+7lme1FKE+fmup3QhszblrUXjkcgNfI+pPv9ST9
	DRwUEwYyb8RpZuyNWS3C76Ot1j7SbOfmFOWskTtKy3x0jKsnhGW1DhcAN8nIzoYDclgMVtcX4/q
	zZBezK2hFcCIxEHPa0wdZ+t864LPS5j77ATeoomWk7x512qJtx+vxlVZ0gbAAvf5p3U/5ATwP6R
	MBMj4GN5MW3YQSYrlW8PEbgU=
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id
 5a478bee46e88-361a341c8e6mr20929064eec.37.1792499883433; Tue, 20 Oct 2026
 05:38:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-4-clamor95@gmail.com>
In-Reply-To: <20261019100406.103687-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 20 Oct 2026 15:37:50 +0300
X-Gm-Features: AclHuK-m87BDNsd06OZo9qyUn54gIAUFrBH_nvo3N4yUY0ynQqrl04tZBGoSFNc
Message-ID: <CAPVz0n2qqMzhbMt+dTaGv1gmrp1xmxJP8ZdQV1EcSpKkneFALA@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Florian Krischer <florian.krischer@fkr.dev>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
4 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Add input driver for ASUS Transformer dock keyboard and touchpad.
>
> Some keys in ASUS Dock report keycodes that don't make sense according to
> their position, this patch modifies the incoming data that is sent to
> serio to send proper scancodes.
>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/serio/Kconfig                   |  15 +
>  drivers/input/serio/Makefile                  |   1 +
>  drivers/input/serio/asus-transformer-ec-kbc.c | 264 ++++++++++++++++++
>  3 files changed, 280 insertions(+)
>  create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
>

Hello Dmitry!

Would you mind to add your ACK/Review to input patches so this
patchset could be finally picked.

Thank you!

Best regards,
Svyatoslav R.
