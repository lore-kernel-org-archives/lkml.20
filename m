Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C78C2DA74C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549217; cv=none; b=FU17zph/DPsOJptIw+6vPyzkkHkTubMMmJs7wEBQ7RQ/GhhFi76Kkv64hPMRHl8SsJb5mt0WwCYnmDG2U+/we6n7cewOgDOhYRhPhpvI2QL19uznj2CioN3lVV7mbsHcw0wpOyqWEZSMzCskzwWpRbPrWO6RN7rkWJP+V8wk9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549217; c=relaxed/simple;
	bh=X4BeImAQt6eN9tl48v+TVFR4KDVQ184LCIW9zdT04ks=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QWICX3GAdsYhnaVRnJm3PhFhFXQ6jIKJBiBTR6b8ll6VITylrIrpak3HcGRfNGDZ9OjCr12jUSyWKsfDfxBCRAIZvYnUdB+Rk3V+f1f4GUD8I96BT66t5GhlfnhL6GfzLx4hEgnGKJ1bYPwABV8SWVmj0crbGDLu5lFFIwUan6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EE0VL9ER; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EE0VL9ER"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so3144765e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789549203; x=1790154003; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X4BeImAQt6eN9tl48v+TVFR4KDVQ184LCIW9zdT04ks=;
        b=EE0VL9ER06xsgpoPGBoN1t7/lMpTdTsaQyIUthBhyuzf4tvd/x3YEFog7lHWlbcGfe
         Z5gaJhjfhK3j8KVbqGmFvnKyaIGHFldvg3wY7dswVNPmqe2n7EBMxOykRHjN+PLg7VAr
         KedmKxV8xxBUOffCjhPZnxZVbsikbWJaTwHpcW+JFEn+0SulGgTLNzgohf4Ofjo1rjS6
         fAiTRyDg4zVrTxewO6hLmB15j7C6w8pnEw94UO5n3P3lUkGVJD3NbuYgeMkuomr4e6uq
         sKz46WiepMTTg3Z2iZ3r8ulsrpBUGSVY2odHiArz8uL2+W46xhDVaoN/suVBviq3ajNt
         sNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549203; x=1790154003;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X4BeImAQt6eN9tl48v+TVFR4KDVQ184LCIW9zdT04ks=;
        b=s702Mn+pHynn9H2lDR3xd2EvCClD6Ov8AQoyXW3a2xVG0lyMcQeWBacnWjUAokcW70
         wgj1QrcolBbtrVJ3LSrHDogV5bWLDopgQGaFsLNtM2+uKP1C/NG7RYqE0WQrJawgTodF
         sw4QIiuz10ATBHz5P3X8eVjCUxL76o8gUyxZfsEKWFLHAQg+H30qk5lrL+8hQmiCP8io
         VS5WfhgTcpQZcRAN/HT1Ga5HHZb3/rqj3fL/8aklbxL7MmHfaFRE+npZ4E8xLKkCdfLS
         yLe28GR0r6+AEvpUAlKMo5GAtc+VvMG0q5PbpD1iUuNxrr6gQ5uoYANJHLK+loRD8SwP
         Tb8A==
X-Forwarded-Encrypted: i=1; AKwUvBxnqQsyz1E99PxLI6shiXZ3D2f8nrsKF1c1pZNEgwh0VAK9skRadtglZb5XqgAK6UZP/kY0ccRRdtYkhM0=@vger.kernel.org
X-Gm-Message-State: AFuF++kh5g3c6mHpfxxFfo1ZilWy+f1eMpmQytO7PmnmVClfYb8m1Nrt
	jJ0MVYBoGDZ50+WZ26nXwDXJc1S5F1/XJ2QqjmbGSaoq/IrCL2yozmTwSpFQ3/vt5iw=
X-Gm-Gg: AYBFou3p2Wj6FaHGdaJcoyMvIkFU9gq62y/OT0T13Va2nATq5RLDESxl20KtjhqpTfj
	uZI/3aDj3oWh239pyQL2Fs8okwF3IdglmG4shGM0Jt3415wy4sofI3sDXntvyUhbOIYy87g3Gwr
	54UDHQDm4OXFXhK3FxHk+h9+sY43jj3uWbppacSolTo+ZoESN8zR7E67IVeCsWqqR4+wUmX//re
	QtHB0YzH3OHTcUIWGrzt5GGNaliyO65yX0PdBRVu/kd2S0xfPEt+vtIEJdqu44vOphv68cT6t/B
	VCRlrVwvE/bcJ9r7KiQ7DKchZpicbO/gefIp2k9XsZrCSlzzDrFY7djJLXcj00chy90WJrnlrBE
	Ie36h+JyezGy3FeTHaZpXGS220Or84ZpO5wZidiYW7RinCri0VMrcPRlFHZf05RE+3Dj5zr5imW
	PrdqkvoyCYRWuVo76YEUC3yJcf8DcfkUyvZ6N1ldgMgcI7HK/zNeET3B410RcIUxrv4N+9afJaW
	17jCw==
X-Received: by 2002:a05:600d:4441:10b0:49f:bb8a:b4ce with SMTP id 5b1f17b1804b1-49fbb8ab4f2mr4857375e9.28.1789549202794;
        Wed, 16 Sep 2026 02:00:02 -0700 (PDT)
Received: from localhost ([2001:4091:a245:8029:665d:b7b:5fa4:7ad0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83addf36sm62963335e9.5.2026.09.16.02.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5f403bfe266842db9f121664ad883b790e1fcbb4c0a296a58194c880a16b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 16 Sep 2026 10:59:53 +0200
Message-Id: <DLGM8U9HBK19.16WN58TZY1HXE@baylibre.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, "Andreas Kemnade"
 <andreas@kemnade.info>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Register
 clocksource/event only for am654
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com>
In-Reply-To: <20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com>

--5f403bfe266842db9f121664ad883b790e1fcbb4c0a296a58194c880a16b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Daniel,

On Fri Aug 28, 2026 at 8:47 PM CEST, Markus Schneider-Pargmann (TI) wrote:
> Registering clocksource/clockevent for the older platforms breaks
> booting them. The older platforms have their own implementation in early
> boot that is used to register clocksource/clockevent in
> timer-ti-dm-systimer.c.
>
> With am654, the timer is much more complex with more dependencies so
> doing this in early boot with the other driver is very difficult and
> gets ugly. Instead it is implemented in the platform driver for am654.
> However the old platforms may not register clocksource/clockevent in
> this driver as that would break the boot.
>
> Add a system_timer_capable flag that is only set for am654-timer that
> gates the clocksource/clockevent registration.
>
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Closes: https://lore.kernel.org/r/2013A99A-0502-4128-ACFA-B04886224393@go=
ldelico.com
> Fixes: b8eeeca55456 ("clocksource/drivers/timer-ti-dm: Add clocksource su=
pport")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

Did you have time to take a look at this patch?

Thanks,
Markus

--5f403bfe266842db9f121664ad883b790e1fcbb4c0a296a58194c880a16b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaqpaihsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNf
9wEAzSGxiiJD7K5pMDPxka2vtj/zspBsngcNB7JR2NIWOLAA/0+Gdz+0zBzL/rFq
orzdHSAmnQDs8GiNnP7Z8IzZ35cA
=MsJn
-----END PGP SIGNATURE-----

--5f403bfe266842db9f121664ad883b790e1fcbb4c0a296a58194c880a16b--
