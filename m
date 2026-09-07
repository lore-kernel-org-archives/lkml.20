Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319534CB8AA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787311; cv=pass; b=Jr1kIpTL5FUJg1JXwaZbK5SFINgKlk4dYr8GqkYm/taBlUecFdkkufT2c5rjxHGE8topdMWTNxuxe/TuLK9UrJrEmSdL4MxOV8xlUqSEijLkH2BOrk6hBPhOfSaeS1PONO7MU6Jpac4ppH4fcSsTYiCO7LPGRwnuOaEo2p4gTEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787311; c=relaxed/simple;
	bh=CHUkEQtNUff9f43STraSTOkBZzhBtKghb6R0F9+EaY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nN/Wh31dY3sHo3GzIaU5qzIGaVCWaT31bgf2Lsdk1l68/VFTWTebgHyOLZkhQgvENnD9AKMSK6I+MOTcGsST4zymMDtxpIdq6IyDUGfEycKa0wavRvECrDKiahqx4bhHUrcmG2bf6f+q/wyk5Uw1etpiw4iwBU39eslzTdakwkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jtbUGUUa; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jtbUGUUa"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-43b7e186a0cso1768877fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788787305; cv=none;
        d=google.com; s=arc-20260327;
        b=MRwiyvLEEJIflZGJl0a4A+DgyoLzbIiWhzinMJ9UpLeUNEQ+0FaFvKKQPc7yjvjnfO
         4lsP+NC2/0JgsNrLxcLGPbUO27l/QnzxyXbe7MmP0W+3Ip5N77JyfQmTItsg8BCKLYUv
         8tChc3RkFepbIoSTzyoe5dK9/FvxH+EpJ8SfB632ra/5woEwlWiUTeco+YT1pwwiROS/
         Na9aNUIuJgICfriqzgzLZfBut0gcLrmaH4XoR5Af9iys7x3ZUWbbWTAJsm0F1NPmoeYE
         1AB0uz/OU+3wEJCStJi8/L2jpT9ilfi/isxh/r90KdWhW5si2SJ4MCjIcbpbDnYo+0Z1
         9O9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sDVpkGpPT9f+QkSpaGU/N7GberUiTv3c8xueZiAFOlI=;
        fh=ZalwygbmG5veqVd8qJSPJbQp1lwc0p4oq5mSwz3GbLo=;
        b=Nqn3ykh8MQZZy0g3jyLd+WvBIwJmR1n5Y5lsRDdy/wU1SqO7aBmuE/kB1ZB9zOuVYb
         KuyQb+xVkARkdQlk0UUQAAacDsKRnJ8nGEhSBDvyC2J8/jYJIdS/5GmU7XBAH1jqovrS
         UFvs23h5453Df5Rj6I2HJFNdHztpxj68D8r4+3zILR8Qdsevi0/ROHOio5ULZhpht6iT
         pRvYj/SBNikyXE1YwpFBIgrVpaT6Nxja2gK7ENlHU9k04WK9iqT4Aj7/nAHV120fC09T
         THxRIxGXpOkU6ofls2+8s0qX73P21WXIP7rDqVv6Pm2si/lRu9HYchFp5G3oOOg9d6PP
         qjvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788787305; x=1789392105; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDVpkGpPT9f+QkSpaGU/N7GberUiTv3c8xueZiAFOlI=;
        b=jtbUGUUaZC5ow/po8qHVo8OL2XYXgT6i1+9BYK5eIdamcKvb+ugHpEXjo0KskF00T0
         g3VqNMpVs7sWAImV6+vQ+F2UfXUP52Z4wGBYdSOEujiNKDuZVXnfKzn9ytl6xOG3w7PE
         O9BHdnZCePbA0FQxgAVuIEHNGlEFtesyAAv7V2Ng1KYAUeq9MLUiWxIN8g+JOst6ffWZ
         jbh4ryFBiFGfILc4B6OThu3sIHv+mn/nWNb0PrLrxD5VfPNIq1j08kJMpItIIn83AJ4C
         TwPE83pX6eXr2WMs6h5nW3d8yID8qQsaqnq7+OwCcRyvRRLbLEyVVFmKTNXrSMJDCfQQ
         Oj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787305; x=1789392105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sDVpkGpPT9f+QkSpaGU/N7GberUiTv3c8xueZiAFOlI=;
        b=YLRvVcpGV/eFA2Azr8gpbl4+MwfrKlmPk6h3KvIs3rDUTVtmLhMbkXxFyx6WmB+kKe
         2TzSV3zbC7cwx48DRJsIyHuFII3GAssnD0u8tOtV92ksjkB0GzUcPcsHeLNE1G/9QrEt
         hARYA6Wgc8Oph9jIiiiNcPjFpvYOMA7DVOHzYbZVGDDFCCDeJxLxAPAg4DhY7bjrsDUk
         p4pVNEBQ7VxWhGmoNJKCj/kZIp0qr7hZ6cWYgUJGHvqaoRTMy1kdi+VXRp1aSeI6GMIS
         vbXtXUjwODKc1iqq+SHJCA9P7Vdmae2Tfc3WQBi561UaMilSmRdRm1tgOeAUY3G3dIe1
         66UA==
X-Forwarded-Encrypted: i=1; AKwUvByAZ0xiBZ9IyeEMEFWDQ32z/WbZqo/9AmCUUWpsXOD/t7infuGGGw/pSd5YhBVuxFFNa1MAfW/ZtIVxyQs=@vger.kernel.org
X-Gm-Message-State: AFuF++ko2GKtjbKprZQK0TgTHoIDlZ/sgAsVlQC8Dqf4v95M1zo1XmWO
	r7jtBjKlVT1vXip3G+zmjYy3YpLETJd/TFAsp5ze0fu1J/kj3NWi3sQ51vpSq8VoH2GzI3Bx6pc
	40d9EHE6dv2Oa+wN4qcB7Duo0WEWRjQhN3Kl8/mQcvknJyWU0h3+e0u8=
X-Gm-Gg: AYBFou1cbE0+tWvEWqehLpBt1ZbmGKt2aJn4qsG1WC64xxejlA3lTjdyqdY9FrWYsjs
	NvTv4VZOSBUJu/mamGJXB2L9XMhRPb2x4FrufKCAe/kBf5Cfpw6I5Hu2H38yRomS+UOi2HRiyWC
	Ja26ucsFnjw3GjE2hUn+KuG4jN/f4j3YsRNUVMYK3cS42BX3m7B5CAWLkfOp1RLSgi2Uok+eoQf
	yKUd1cLf5GVavLPmzCZ8EceN9pdXscxk1zn/a+MhYT12sMZcVrW6arsyIwTKSUWWmJu3bOTmK5U
	Vysy41jZC9GsvE75TDvjMp4hzRrbqPuECtuN4lukDrkr6yqVcreIZXj8DfVHSYLdQiZQi78gXB0
	FCCn39T6Sq8RGsCLHDBpxNwY5tX/b9ymag6uArBYQ05gNSbXyAXfkMctm8TYq
X-Received: by 2002:a05:687c:408e:b0:475:a112:1272 with SMTP id
 586e51a60fabf-475a1124b00mr10850018fac.31.1788787305186; Mon, 07 Sep 2026
 06:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com> <6c47f4e0-bcd3-4349-b8d6-a3889e08370d@mailbox.org>
In-Reply-To: <6c47f4e0-bcd3-4349-b8d6-a3889e08370d@mailbox.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 7 Sep 2026 14:21:29 +0100
X-Gm-Features: AcwNN1Vp8fXipQwCEjEj0y3FUJRvMgZ_G3DM3P8aQK-4PYEHw2tOLnsqDspjVww
Message-ID: <CAPY8ntCwUjFQcobRYbgo1G-nuO1Sug3i8Krjau1AnD4Nszvc+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Shashank Maurya <shashank.maurya@oss.qualcomm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Shashank and Marek

On Mon, 7 Sept 2026 at 07:12, Marek Vasut <marek.vasut@mailbox.org> wrote:
>
> On 9/7/26 7:46 AM, Shashank Maurya wrote:
> > The Raspberry Pi 7" touchscreen panel V2 MCU requires an external power
> > rail to be enabled before any I2C register access is attempted. Use
> > devm_regulator_get() to obtain the vcc supply and enable it at the
> > start of probe.
> Which power rail is this ?

It'll be the 3.3V rail on the FFC which is used for the MCU, touch
controller, and LCD controller.
The separate 5V supply on the V2 panels is only used for the backlight.

  Dave
