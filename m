Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B23C39D3D0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894927; cv=none; b=BT+ivZsSThj8FARpYt+Z2uhtxgEiUU5OB7m12Xvz50JvfOzBRJqMeIwBhb6Fl6n/K9Db6tTxBqaANtGfAkQpQ6tGAJ7Qfuj1DGvOuDDfi+mhI5p3vHSxvth9/R+aZasLzEs3LYmSVP7e/5lnYYHUEVpRzyEaF7jS8m9YOpOicek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894927; c=relaxed/simple;
	bh=D5aocd7LzcUTTHKmUFRWoUuPVx4SWmW7g0SA54wCh78=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GqtiQSFsmfhzUWVUzIe0OJ2uxBf+VMLymj1y+uww6RcXDIU6MsVxo2Ccib7/yvqiLqxByuOx91SbgkHU3MtXxMhAXW/qcFOs59ZZ7DHdX8bNAh77xMowY/iE95rNlArM5c3hlxnHTooDVZ4dyIpktvtBniZtmUjDoAm2hd0Z0BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4ZZyqyJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4ZZyqyJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b060ec084so1845271f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791894925; x=1792499725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ah9kS2eOZPTjVhcN2vGZg1uNRYJuhJ0H56YtxNuvC+c=;
        b=l4ZZyqyJ87fx5f6T6jsGQlkaJSFAoZnipq7YyLo5Jb/ShuoboXcsvQuitMncNE1jTJ
         UJpxBoyIpXIXvTUSQs2lkvnKoo1hTf2YRCHb173eC+B1ksGGV8NKHrRelamqMGe0q8Af
         ncjDzMxuQnAqz8HKUUdJsqRU8pXJ3bENuw5f/k6/dsF0ANNKm0AI/+rfbE4WR1Z9crNk
         du7QaZDNSjsBO8JaaARiffOCu9AvwgNHaC2ceMa1lnTnBFmCKTNpk8nYESnyxcsy04X2
         qpqnrNbBDCOk2LGRxk3KLnLsw4sZoohw0TZXY3kgsIu7bp5hanDWh45ua8mzrNYbSf63
         FPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894925; x=1792499725;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ah9kS2eOZPTjVhcN2vGZg1uNRYJuhJ0H56YtxNuvC+c=;
        b=HaATRHrpqpXlpTHr7RPIMz3hKr7y8WT0Vyg5OsAeawK8rJ+DfJIVspe/cZBHeC8AiG
         88qLt+XX8M+qUWnMY5JIA9idkEGZMuZJ3svoMB5ZHXTvpprYJEk4w/tuwGvMa6Kn7Jep
         43mRpq2ukA5mnzzoAaRK+nWjdb3pM3l0nOoivai721Vgt0DV9q/orYnCtEMWkbpfGSo1
         392nA4DVM3JrJjstVL61e36dX8xK8GbgpxBCj7gvv1B+Ef41qwZDcsmzjLgKwplA4Iep
         VZiRt2opoBTly3kPv/wroy32hE174ZyiVXIM2zEPk/JvXB6kKc68omHEPkpx3b6uhl6m
         4Pvg==
X-Forwarded-Encrypted: i=1; AKwUvBzokcNNOf4tIoGfD2Hz/OM2AZJGnsL4wiO2eY3UqBnfKchadUaRfCr/H2xvCOqh3iskHFTRmwSovIDQgiY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJu2ancGJJT9NWKT9MSdD3Kk6/CQ184e5LIxEsBYwBLIujOcN0
	F3gT796GqI9AGtEqSLv5aK9EaAH6REb/gmwmJTe+qceqdpTiefS28DDoyfLyHA==
X-Gm-Gg: AYBFou06NcSumqzYfRe+mUeidoy4+CjwzpFeTLOs/2sfR3g5d/ujseysr+KNZMfin2R
	AHhOAsRmSHKdAUHuTz7ysh2kOwN1sRG/CMMR9074i17b2wh/Il8LRbzWsxE2TqTJZsSqYx4QRrA
	YE+S7LjZRjtoeUtD2sXHPOAyU0X6U70w9rDwKjLEUMXQOS752eC7WOM4Kx+lRX04w2L04WvXPQY
	UDzA1B9fG5QceUrR7OMRLTpWJy+ADsLhc7fkE4eDNppLmwPNIeb2DxymvRYcrRxb2bBQlwmr3wr
	/3R6+MMcP5rwtNZfrra6G950a/aqeP5zpYDWS891d45FVuMzL+rjbUvuIM65mruLfIl4WmTaWeC
	FXiiXwveKZreoHhUtGA3JAFm4rAdgoKRpL7Fc/Zvsmbh6UogQZ6KkhUdkISCE64O9Qwq840Nd0g
	CJQNfIEDSQqU53TGEJqL1498FhqDLiTB/biLMFHVy7gaOO5FR5vJpB2ojQCA3i5GZxlBM4EACEB
	tog+dPQvf40NdUFArQPz1gHXBgApgPFZbvXNGuBw6/zomv9mZ/QhdYShzE1/9pNiH8+sM4XBHj6
	wW03hGIk3DCw5Ll7hjL6WVEp580RgmOgkEn+xkfnoR9iuHY1cJXmYUCM0bGhnfWnxy1nQSrNWYm
	6lYrCHS4AJ8BG6R2reoA35h874u5MnW8tld4VZyTL96HorYV4HoLduIn/zHZW3oBk/s3wCU8JNE
	NjWSlQ
X-Received: by 2002:a05:6000:2212:b0:488:823d:5086 with SMTP id ffacd0b85a97d-48dba6f5688mr22978399f8f.0.1791894923407;
        Tue, 13 Oct 2026 05:35:23 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967affsm4477888f8f.1.2026.10.13.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:35:23 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:35:21 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shi Hao
 <i.shihao.999@gmail.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <20261013143521.00006de9@gmail.com>
In-Reply-To: <20261013115639.167433-3-marcus.yu.56@gmail.com>
References: <20261013115639.167433-1-marcus.yu.56@gmail.com>
	<20261013115639.167433-3-marcus.yu.56@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 19:56:39 +0800
Chang Yu <marcus.yu.56@gmail.com> wrote:

> Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
> 
> The AS7343 is a 14-channel spectral sensor featuring 11 visible
> channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
> flicker detection channel.
> 
> The driver exposes 12 spectral channels (11 visible light and 1
> near-infrared) via sysfs. Runtime PM is implemented to stop
> measurements when the device is suspended or torn down. Power is
> never cut (PON=1 always) to preserve register values.
> 
> Future patches will add configurable gain and integration time,
> interrupt support, buffered reads, VIS channel, and flicker
> detection.
> 
> Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> ---

I think this is ready to be applied.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
