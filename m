Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003854;
	b=r3XTqZaGewDdg1Qca0xDK+W5DZIFxCfa54YU0As6yhEORinJ7aAgHWWGG4sHlyBaHdWU
	 M8g1sCvfC258wRt2OnryovQc1BfPNigH2jdbhoQpMluOvqxOCQV5OVSBBXzNj5PRei+AK
	 UGMdqrNJQOlKYum5xHWOSllNuChAhbKWFCEtwdIMeX6D/ToNz/sZ9Ba4+LonLZIsmpytn
	 Dn7e3Z6XVJD9G5dIonkL/hkdJFcFI6CLMXKXuWl/OqmNTlmDcM1DPUdib0j3708Be7g4A
	 xstYwivU3yVFd1EfC4KMhQl7CX3mvFTffgPOU8PldkaIFmqcuwY6GN/bLeiF+b91z+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DUCKXpFhOMZBT2HnErNgc1GGFPbfPUwN4bKfvKKAN5I=;
	b=VJduNCqk6u+R/U9y1Yoy7PdRnHdNcxxvrjc9HSAQ49ZjxBxqHTQa6y6v1ZQVWzaWRhrM
	 yHw18CsiRAArNDOBvdhPr/mxP/6Aj9B4Qh+5hLHHLUXZfxiWATSI5qI7wccArSp2czvYv
	 jSm1rvwnhrjfP6N/7J5Rby1IB1yCTT5RHvbOdMmeDVAJHvViKmrx2G6nPHjC49pa4+Xpw
	 PIBzvoZRqdGNoCaBX8/Nft4+zyG+Fk3Bdhr3arl+CF5RDTAtYh3m5QEAnbExDv2xJwqlW
	 /uDZGJ94rywl+Pw0v3QrD1vXaZaw8mR29lH+pp/LRzPg49qqUxMZWr0nuQsVif/mXBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BsO8qC9F;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF00606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF00606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BsO8qC9F
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1499383f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793003852; x=1793608652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUCKXpFhOMZBT2HnErNgc1GGFPbfPUwN4bKfvKKAN5I=;
        b=BsO8qC9F2lOPtizlCkLobBeDKo4VQrsOUuJGH/4KWvKOlrPpYOCzISiIvipa8qmSzw
         l8Lfqk7a4UUWjyqof3zy2lF5xwhnjuOAKQd3zdKE0Bto3CmWD84GGOf0om3tquqAImA+
         +elsN2pWhKZjySDOJYoRmRAp9AGobzxKWeXfTItdztxUt7yD06bLS1VzyGwj1IfhHKnh
         i0KApEtUYN7KWz1sdIeDml7OdanoI2NIVx8ubkRoDv3bgHlj4mfYNV1i97fGdL9p6CEe
         J5UwZmveldODhXwblREBXLDqfIhHar2Ufm18GOc1Pnq3nRQQ0Q2fOSVr4+TTa939nBMO
         rMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003852; x=1793608652;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUCKXpFhOMZBT2HnErNgc1GGFPbfPUwN4bKfvKKAN5I=;
        b=qKdRO9hRNx0gZ+qVNOnWWl2ohqp2GywhdiLzy6LUgBu44EwesLuq9/r+3sINnNJA/u
         sgDgu1BpDeNxJ59tPuUHr7n0LwfnwQUn/LtdtwQFgDbyIsJ877appNtQkOUceulLIaIE
         WXnGj/OlEJuF8lgLAbEG1PFBUO9/foBMdbOYRhyDp+1RMvLGxaGokcWlS6b0oBaseASh
         4GcGjFMmMRditZKQaoWCaBvXIXGRIKJuCYUBaI3BdUl5urw6dGhwBo7zOVbaXJXJvJiR
         bQ2myFXRY9a9Xtpa//hmZ1Z/2YF6u1RlITNm1oszSfTsg8+FSAZDrLV0CgKF5f3ufKw7
         5EKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4+l2yyerXwi1xDhp/9L7tqidvEb47FOrK8a2HTCHS+2fMOAugyaXNrBLLnkhtO/SvWZ5qZLlb1IoBOIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxOxann7dwagSzi2vJzwo2lMn8np7NUm8/T9Xp0uDUmKe/9G+m
	BTEHwjEQL0ORvT5nkELjhCOs1+znvf8p8EvvsEJWK7B56mxtzmjFf1x7e7v7qW9B+hA=
X-Gm-Gg: AYBFou2ZbcN6Qffr9x3NQantDD49x/0+SHdbQfcHkiOqnBHemtDJCcWJXDyK8AgJAvG
	zAEP+qvo801pz+Apef0ChjSYzu4scZxNJDsgV/XQWLSYMjKD+L3au+Zj/6vpo4XNBWfmxDQm1RC
	JFxAiLgeAWlqjqH5vHP+E7mSmXIqq5V+5EvdV5/nSDH8pLPAgV2EiSMzemDHYaP0ALaZWoONsWE
	mH3KDddCaFZuKJdnDLF6Gu7xiNi+TeMMz3xxnGyy3wvXFPmq/WrXy4w0Hl6QsxZpOZhTp7Z90f4
	M5buaUYHFUYAglytul4ecg6LQpZ2WrmmHhxeJ2f1Vgjfo5G/Q5DXTMtDbdjHAb2JrW3J6c3rkYf
	ncbNj0nTgL5OoSCeFCpGTG8kNiu/ObxbLW5amCjj1fiVJiPM24zPmBb0UjhkA+W6+uzvVjTOPyW
	HAciTyyk2IVCOKbXeexfXKyaAWKtvo53lxT82VFM2ToblfrhLROGHnknzImtMhC0R3Oo3OeNONa
	gF1H97ZpZXSCHteuXBbM895mhEeUcVkbNnO+z7PXQjTQGfx0eLEjkNv9vbhwOUw+e8MwdD6l30R
	o/5plsUdvDYpSq1wm/3SfA==
X-Received: by 2002:a5d:64ed:0:b0:487:1575:ebe2 with SMTP id ffacd0b85a97d-48e3eb96fb0mr10894843f8f.44.1793003851960;
        Mon, 26 Oct 2026 01:37:31 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm73219f8f.13.2026.10.26.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:37:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 2/2] clk: meson: s4: propagate rate requests through the
 CEC 32k muxes
In-Reply-To: <20261025191852.208226-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025191852.208226-3-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:37:30 +0100
Message-ID: <1jmrs0kgc5.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 25 oct. 2026 at 20:18, christian.koever-draxl@student.uibk.ac.at wr=
ote:

> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The AO-CEC driver asks its core clock for 32768 Hz. On S4 that request
> stops at ceca_32k_sel / cecb_32k_sel: both are muxes without
> CLK_SET_RATE_PARENT, so it never reaches the dual divider that can
> produce the rate, and probe fails with
>
>   meson-ao-cec fe044000.cec: core clock set rate failed
>   meson-ao-cec fe044000.cec: CEC controller registration failed
>
> The equivalent G12A mux, ao_cec_sel, carries the flag, which is why CEC
> works there. Add it to both S4 selectors.
>
> The other parent of these muxes is the RTC clock, which must not be
> reprogrammed on behalf of CEC, so boards should pin the mux parent to
> the dual divider with assigned-clock-parents.

Again, the change is OK in itself but if you are going to assign the
mux parents through assigned rate why, why don't you assign the parent
rate too ?

You are doing half the job in DT, half in the driver, that is kind of
odd.

>
> Only the CECA path was tested; CECB is the same defect in the
> duplicated block.
>
> Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peri=
pheral clock controller")
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  drivers/clk/meson/s4-peripherals.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-pe=
ripherals.c
> index 329cd526749e..8e303db6154c 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -407,6 +407,7 @@ static struct clk_regmap s4_ceca_32k_sel =3D {
>  			&s4_rtc_clk.hw
>  		},
>  		.num_parents =3D 2,
> +		.flags =3D CLK_SET_RATE_PARENT,
>  	},
>  };
>=20=20
> @@ -514,6 +515,7 @@ static struct clk_regmap s4_cecb_32k_sel =3D {
>  			&s4_rtc_clk.hw
>  		},
>  		.num_parents =3D 2,
> +		.flags =3D CLK_SET_RATE_PARENT,
>  	},
>  };
>=20=20
> --=20
> 2.56.0
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--=20
Jerome
