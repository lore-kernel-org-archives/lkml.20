Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B33C1D5E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175995; cv=none; b=ppLyHKi+JbLIRs1lsHWgBb2D84RrRpv2zqtsMQhVZdxOZgJaCTNd9fyNmHybfBA+jqUaBRP2e8GKug2jdR8vwBi/vr701WVHu76OcZndmLHz1zMHNMjvl5l962ljn5/UjI/ofMEnteChCHzeDQ9xxwaxzF1hJa395mHLpE79g6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175995; c=relaxed/simple;
	bh=JA8jrHKuhk0CJFLWQ126/WU45hXRi8573vPGNkgvooI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M+XmjLcS46GmfXtjPKGzoRW50cLJSo3lPMmoSW4Olsp+A8Zaks/Agc9W3ILxDccAZkPjW2XOaZx/UTwe0FKp+zPpTIn3ZLQIWM/79AykKd8MnoICQy9Afmge34wcq3yym2Pdy5GhL3bfS+BVtf9rGkSpAHzDkVveR8w0RgFzuLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSg8yqJx; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSg8yqJx"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc149372c14so2363071a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788175993; x=1788780793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YwoI9pJbspw0thPYgo5uRAdd6p/MMBJUTUU3yjoPKkw=;
        b=NSg8yqJxJ4EAbff8QwbkWOeABB/hKCm7iWHNpSI0oRFMRQvCbTkBX4A8DCHhkdSJI9
         f0h8bydV/1RqVaLqo2Mz/O/jcXAt8smYDAS5m/bljT9JVmoDYBhzIwLy0CxsZoD7bHKf
         7WFwZ3kkjZFcs5A/YiyyOChMxpkrGQIflXp5m/2ua4cxY45tdUbujQ/FP30mSqp8IB/V
         PXm4DS1+nnZfK88de5AXIq4+DZAQYMBA8vu//5IOBAqBn9qBXTGVKwDjBMduA3OH4KYb
         lOPGDUPuuk+74izWhy6CjsaICtUySBfBdA1D0nn/WMYuSKtEKJowIHyFOP24MLe6Fzn8
         1byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175993; x=1788780793;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YwoI9pJbspw0thPYgo5uRAdd6p/MMBJUTUU3yjoPKkw=;
        b=iC1DTkveX6s7hdgRtQquVnEHImDIzfdegcEFMoFp9y36B61XmCohhsp14qZKpDZyT0
         9geUTQ0SGnK6dLRy3P9IOSO0JLN3ffgbQuA7avzRkEk/UUW92zidSrd/v81dchjVnBx0
         9InlpgcKievP9GTtL0ZZuY+C0tVnGjdjOLrMgtAhBlpjIgq4eul5/sI36P6kdcziUiDJ
         Vx6PXwYiFiLtNwQdTBEYI9Aa0g2FdKaImgfqP6TMMzLytrRRVuEPTdOi2yiuoQeVUiLP
         T0ZrS1cT0AoNhGpWLlRH/4ZM1/pMuJzlXypF/4uQ1an8DJsSjM8rH10Pa5hK65Qaa79N
         +bmA==
X-Forwarded-Encrypted: i=1; AKwUvByflPrjEMQ97y8a7zr2W2WRgsD8h05cofhkQ8NR++ZeONX3uz5kzklYWkIQw++3sL0Mi7y7n3XSZJdxS4o=@vger.kernel.org
X-Gm-Message-State: AFuF++lvFi+Ohxb+VbO6aCNWr7hjZNr1emluoROc7Thv0DVbq94vEJof
	3FLZCONAYCqHGifu0U39CZx4umtyx6TUwKTc1nSEgHwGqo7UAGLF8Jh6K5G5EA==
X-Gm-Gg: AYBFou3OPJn5IuvihwJLNXMMFJBIZTitr3SM/YQj8a8WLoxneQoCyFsXRwYnBcTehIJ
	snTLUet128P0x/MatJrbmgosEUFER7as+yy6tAEewnPotiWBNBRz1qcWXFX+ZdRZe/h0yi+FN2J
	lN86u4dfmlma9CO3aG0aOC80QZ0AOvxWAeayP6i8IEuIryhqMkZtvJkI+U9UCzxXiivO4ZNS7WH
	WKIZyYGz6C7gOgrN9AWPO3aM879Zw2BVWUTiJ7SpvEZfoDy7/AEXnFAgmE0iXWwvFGIHxjVHkqW
	L8/6g3c2wHwqsMkKGevvUOJljLPrmcnQ3NtqxxIiAxNMZL4LJVtl6xMx1azgYuhvnbeZ+cnlTQ9
	XYdaoLIiIdczAqpqdi1BqZm1L+O3ktoWsYUaUzd+8pyAM4kYSGaseJdV/3JK+t9YFSXnuRrC0cm
	j3Of71tE3hTwbNr2x7qF8MeD+UAAVNSMWMdOiGdq6en4XFfnNqElQJKAGdUPcSKAYmrz3iRtQhG
	NsBoDRGKLGyCZwrptvF8A8BxBMUWfkoLKeRKB+YYbiN4+wt3l9y7JPeYEWrrz5MG04KSiZSBhH2
	jvxo+zgzyWSBV28Skn7Q7G7gxFUio9h6PxhZTI+90SRF4AY=
X-Received: by 2002:a17:90b:2f0f:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-396d0d92d15mr41287848a91.3.1788175992822;
        Mon, 31 Aug 2026 04:33:12 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:12 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/3] Enable shared GPIO for Apple Silicon audio support
Date: Mon, 31 Aug 2026 21:32:38 +1000
Message-Id: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTNJqVKBqxAXFX5gCIGmo8aEc
 HcrLr/FezspokCpyXaKeIvKtiYUeUbd5NcRLH0yWWOdqWzNPoQFrJOP6HkMsrEzQ+Vwu+JSekp
 diBjkcz7b+9/6eszonr8RHccXNvdv2HUAAAA=
X-Change-ID: 20260829-apple-shared-gpio-60f86e74e35a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JA8jrHKuhk0CJFLWQ126/WU45hXRi8573vPGNkgvooI=;
 b=kA0DAAoW1DYy0VH3eWAByyZiAGqVZm6gk8hq/DZpJ7Sxzc6aABaz6Amen7+KLPp8mgNqyZt2h
 IiRBAAWCgA5FiEEsIISSJsyBtmPFHm91DYy0VH3eWAFAmqVZm4bFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJENQ2MtFR93lgVXIA/jxuSb36HlgsJsBZYezGXmJU5VV9xJiVbYBpEWb7i9w
 ZAP94S1jJis0hOEMTV0nlB7uKc1AoDcePfnSn7FH6oi7sBw==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

On Apple Silicon Macs, every speaker codec's software shutdown pin
is connected to the same GPIO line. This line must be pulled high
whenever any codec asserts it so.

This makes power management impossible. When we goe through the list of
codecs and call each suspend/resume, the GPIO line is asserted low or high
by the first suspended/resumed codec. This causes issues for the subsequent
codecs; they are already shut off by the time we try to cache the register
state on suspend.

In the downstream Asahi Linux kernel[1], we were previously (ab)using the
regulator API to work around this safely. We replaced the shutdown-gpios
property in the codec Devicetree nodes with a virtual regulator which acts
as a proxy for the GPIO line. The regulator will not deassert the pin until
every consumer wants it off, and it will assert it as soon as any one
codec requires it.

Now that the kernel has shared GPIO support, this has become unnecessary.
The first commit in this series enables shared GPIO for ARCH_APPLE so
that we can take advantage of this new(ish) infrastructure.

The shared GPIO infrastructure considers the first state change of a
line to be the "default" state, which is the state that it will allow
to be asserted without all consumers agreeing. Currently the TAS2764 and
TAS2770 drivers initialise the shutdown GPIO high, which means the first
change is to low. This does not help us, as the line will not be reasserted
on resume until all codecs have tried to assert it. Since both drivers
explicitly pull the line high on codec probe, we can initialise it low,
causing the first state change to be from low to high. This makes the
shared GPIO proxy behave as we intend. The second and third commits in this
series implement this.

This has been enabled in the Asahi Linux kernel since 7.1.9, and addresses
the last obstacle to attempting to upstream the machine driver for this
platform.

We intend to take the Kconfig patch via our soc tree. The two codec driver
changes should be taken via asoc.

Regards,
James

[1] https://github.com/AsahiLinux/linux

---
James Calligeros (3):
      arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple Silicon
      ASoC: tas2764: Initialise SDZ GPIO low
      ASoC: tas2770: Initialise SDZ GPIO low

 arch/arm64/Kconfig.platforms | 1 +
 sound/soc/codecs/tas2764.c   | 2 +-
 sound/soc/codecs/tas2770.c   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
change-id: 20260829-apple-shared-gpio-60f86e74e35a

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

