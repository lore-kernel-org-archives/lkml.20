Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02AE37F8C7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194790; cv=none; b=RZh4FC55ci85ToDa0Ay1xyTLj36rvyaZ01Nc1iG5Wo8fCjTmJ3HU4ngsRCmLyAgWLSPPuc3JVJQfkz7AS3QVFUl5n0exm/bqN9FoqCcS6nPgkjvGKY1Frw+dgCrV+VYMT6CTuLbSPilPe0jfPp8oKeZFtpv8M30fNWkuAXWHSM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194790; c=relaxed/simple;
	bh=tQRX/FLdNvERNHaTAed+MPY7J7geG2lCZiYEYToYdU4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IWjCROKfRVbkHULTYeNJNoLVDDWwzL0YnB7sURBivx0l0D1u+1ae9Vr3wXS3Imaca82Gk3swP607M1kEtXgsAGVx0S5w4U+YwtRCHHtaUM3adUiyNY+8rTefypeZKUrkDG8bfQw41edCG0prrANJCzfCRkffBrqaoarvKjwQ8gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kT31/pkW; arc=none smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kT31/pkW"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso1916460a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791194786; x=1791799586; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0tbK+LhZVoVA47l+6TUiqPvZnN/HfVJIxHV+cXh6bK0=;
        b=kT31/pkWmv0FWAqgQyuwU8CWsbfGF0CRkgJ85cYWacvtOEwxN8ZxZLQ+u4ZAwHzoKG
         qhnnFu1oMSjdROrTcbUNhANGc6lurY7ZKrzKXQ/ymSgz07/2KDtuv6T+AoBtXJB3tNle
         UNlPbS70aRI44RrbqEf/BrTaZf3qBwQ4wDWBfDafZDkPiDUnk2hlcREznpcrLKZCMfh+
         yErg5GYqQR/VK/TGjgxqV7sCdwKjWLhGSiGVThHCyNk/nxhdbmU95EHZLT+umUt/0DS6
         dUcspPMnzZvdxqX8rAoYW8umD2jV+ChukDStiKM6egsmEUG6jF3f+ZNwWkHtmm3GbHya
         OF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194786; x=1791799586;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0tbK+LhZVoVA47l+6TUiqPvZnN/HfVJIxHV+cXh6bK0=;
        b=h90kDzoUMn8PH2X7Hoc5qAxJm29YlKFltxoqfeWhkfQCVKtHvQYfEi7QiQ/xS8OPsr
         BtDIum8QDYBh4yMhnUTxHLA3iEkCyzQalmCv7C0uGxSJI6hIOvHAO0r35UtYiQQqLKRG
         djZCl+vs1KHcLJl5gHnPa2WiaksWihewCK5dZt5fCMu8Y6kpMI0LWUlyT/qEvPeCcU2V
         rCJCr82RpmiChgmZ5l8nYhoYXuktYzClysGdAX5MsdlANYyIQZ6Z48si4JJtBh/VfhJY
         3kWtB2P4sPEKXtEgmAT/Wy6cOlrXfnsJ+9YzDfRZCv2VcNtFV6VGyzTJLuEBdrQ6Ag25
         a/mA==
X-Forwarded-Encrypted: i=1; AKwUvBxMkLa81gZtXs0x7RUGrLBNp3/o/KhYbzLIRzQAQNV2FtuxV0zBrCEyYSaVLG9F1Z5Wp/9N8Rzxz6NgCiU=@vger.kernel.org
X-Gm-Message-State: AFuF++lqQ7hTpMiv+aXlPer+bW2dJgwqmHn02cOuVeilgE/NPLszQBiw
	kGMD3+KSdp9Qx9ytoe6mkkjvbBo3XASe4SS1NnBymT1Lq+fCt6VS1K/4pn7LYMRJ2uA=
X-Gm-Gg: AYBFou2Lljul6r9TXg972OnnTNHKf+ns/sbRGUkfkLHlT5Spfdj6tlh0Ee1Ce7x9kny
	Jyql0HpMkkI1weJg73PvV0eS22A25USFHDkmR9YwKGQJj519iCQtznGbgOgu0UKY8EjUikXUJmm
	RHyIaPrQb0DVfryjddLlGd1C8zR2y9JESldVFV1oaXxS5ScbEt89u51yOUgiSE2/RCqQi6vVXlB
	1+w5b3IPxFKP3/2pu2xUYSSL4wM+hgBrdJzi/5OYV38EfdDxjxSr5OD873zVsyhATRPQHCiVQZm
	sLrH5CEJop2sPqobo2I8bLN4Z4oDrzYNiJFf24X+Q27MsExS6cXNdxqHNJdrzU6NkQhRggs8GUN
	I9NRTLGsidRa1iCfGnHWeM1tuX98gjQ8H7Ax6KQe9MqO62s7D6MpAXkHjBKoKzTCiPe1LeLM0sv
	rbxJEdNl9jD2fD5Z2P4uAkN8zs2Vfzmtk9kRQdFw+2KEtKGz/jp8Gzx4ravFIRbf+AhZcmOFK3Y
	Ex4F5HtpiW5d82wdLn95/LbYHBIrMeRQhzarjsFVCMfKnqsig==
X-Received: by 2002:a17:907:3f1b:b0:c2d:fade:e089 with SMTP id a640c23a62f3a-c2e4a7d4789mr841351266b.0.1791194785779;
        Mon, 05 Oct 2026 03:06:25 -0700 (PDT)
Received: from [192.168.0.42] (host93-7-32-195.dimensionesrl.eu. [195.32.7.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3156360832sm50800766b.75.2026.10.05.03.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:06:25 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH 0/2] drivers: pwm: add mcf5441X mcPWM support
Date: Mon, 05 Oct 2026 12:06:22 +0200
Message-Id: <20261005-wip-bl-stmark2-pwm-v1-0-168b9dc653f2@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ7CIBAE4FcxnMWwgNh68j2Mh4VuFbU/gVo1p
 u8u1YPGNB4nmfnmwSIFT5GtZw8WqPfRN3UKMJ8xd8B6T9wXKTMppBGZzPjVt9yeeewqDCfJ22v
 F0RVgHZYqxxVLwzZQ6W8vdLt753ixR3LdKI2Ng49dE+6v1x7G3t+DHrjgRisLlBm9ytXG4v3sb
 aCFayo2fvTyo+RCTyoyKaQhU2JZgDJyQlFfCsCkopKiEaSyJaIz+KMMw/AEXAekVFUBAAA=
X-Change-ID: 20260828-wip-bl-stmark2-pwm-acd1bcaf39a7
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

This patchset add mcf54415 (ColdFire SoC from NXP) mcPWM minimal support.

The "motor control" (mc) pulse width modulator module (PWM) contains four
PWM submodules, each able to control a single half-bridge power stage.

There are 4 independet 16bit counters, i.e. to drive 3-phases motors, the
total counter range can be limited by SMnINIT (start) and SMnVAL1 (end),
in ticks. SMnVAL0 must be set to the middle (half range).
SMnVAL2/3 defines the positive PWM part for channel A, SMnVAL3/4 for B.

In each example, R.M. uses signed values. Reason seems to be:

"Control loop algorithms (like PID controllers or Vector Control matrices)
natively calculate output corrections as signed error vectors (e.g., -50%
to +50% torque or voltage correction)."

So using the same numerical format from this algorithms (signed values)
avoid to reformat values to be written in the VALx registers. This is of
course useful for bare metal drivers programming, but i have to maintain
signed values to have prescaler working (all-unsigned way works but only
with prescaler 0). This seems to be a possible hw bug.

In this initial implementation only output A of the dual-output (A and B)
works for each of the 4 subchannels.

Validation has been done on stmark2 open board, checks by oscilloscope.

---
Angelo Dureghello (2):
      m68k: mcf5441x: add PWM defines
      drivers: pwm: add mcf54415 mcPWM support

 arch/m68k/include/asm/m5441xsim.h |   7 +
 drivers/pwm/Kconfig               |  11 +
 drivers/pwm/Makefile              |   1 +
 drivers/pwm/pwm-mcf.c             | 646 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 665 insertions(+)
---
base-commit: 02156c061b7dfe437f9054b3e353c69fde0f7a58
change-id: 20260828-wip-bl-stmark2-pwm-acd1bcaf39a7

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>

