Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894039;
	b=l98w/OrU3EoOdEb1DNqd8j/GAT7xegwUd/4wNRvwk9ERjLF8JZtW1sJMM17teS60mh2W
	 YkdIEpUctnXYaBgqYNHMWMu4U5mg7JkLZg1N09QgIUAtatJ7G/jvQsCC0TfpPUEm4cqZ6
	 8nk5OacK7HLPZ1NBKWyG2x9AXek2z29WnLmGWhQF8IZ7n/flNlqL5nhRLoj47ZdQo6+G6
	 zXjnqVgffDxwkJ1POEKQbutUpKCXdNdiJggC1mY2nr9x34abGzWmKPFgX1nOH6oIm0lPc
	 oCX5lq6NtCeqnGYHce2CYQCtcsAwWWS0jnJ3wigHsrI01NpB9dWWnCiVa4ivSOS3zag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dbmOJwNiA9U5ZN5yfEB01wzVScVRVlQu8hg29XoBtHc=;
	b=la7h0YI2+z0xDBjZdLzyKXeBAR4wW1B3HPzxJggn11MuHaxez0gsNHqeU+Hk/vx8ueXM
	 00w3aEUrAl9w2pDndW48yJJkKDW1bQho1aSInV7Lo2WysAWhw6iDd5uYs1qgY5PmU/4i/
	 h/Q62iLgcqN2fn38K4/60yHsBQ7op1YwOtaDt8k12f5UhTNZKhAK8krkx03Bd9O9i1rXb
	 NbbVQg0K1Ig31tqxhoQsd7FW3fzgrGRDZRy6cw+WLm4TzVlOkmdN6vvg/SP9Rx95EqC0U
	 djPM5g3u6P5FryUVpfyjzwil4DnSG0REDn5S9XN+UuGwUJyt55yUqFAfK/jQ8rc2z/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3qaJxCB;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31785606A60A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31785606A60A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3qaJxCB
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1537646a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793894038; x=1794498838; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dbmOJwNiA9U5ZN5yfEB01wzVScVRVlQu8hg29XoBtHc=;
        b=S3qaJxCBghpm3j1A57D8YpLSxqVSsD3JGGGJz+hQ57er/RdEFj+gaQJ52OfaeWEA+y
         qc07bAhrgwTVTZddzIj0eHLJVchNtzuEOiuEMsSJX1SDw94OUJ2nKCcPSLClMxLifSvE
         5577Uc6pjDGiEh/Nc/PjATY7RPlXNTeOr4lHk0/EOF/qnBZ210kBa8sQWno+GzY/ETtF
         ViSZSiY+swk1puOo9d4JMt05B4gcdDSPw6a0/QmoRed9V+rVKS/voR2oVjSzFJsUJXb1
         5UD6mSZNPQh9rUOjK3PFc8sXxCxRqknDHDRtuJ4MoikRPvC4ndcqUxLmtqI8T4/QbcoA
         YObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894038; x=1794498838;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dbmOJwNiA9U5ZN5yfEB01wzVScVRVlQu8hg29XoBtHc=;
        b=uZSRpV9PINXiZUY5/IbisYQ0a3vdM4MqipSP7G73bLA58tCgatXqXwlM8ifGtDc2iH
         g3lW4sKCBc133xUX6OZBktdsPdgANroeSuKbiGVuRqFO25bXsdKcxJvI6gQBTlkaXAo5
         i+bgZbKL+58GPTpK9xBL9L9j61UhmB8wZtbfYbGtOi0tKAVrOyMk9tn704L6ut9Uq2yP
         2aivD7sSaZjiaF3i5HAZnIHUGT6bY7mi/cWIXSD79PTEt1+1tnA6IHIoctuUY4W7GXSK
         tL3G++X4RAmGJt3lu0u2JA+dry67wyeWmBPSZF6y+jt2H0eUOi7/7JyrhZWiGImUSu+c
         nZKA==
X-Forwarded-Encrypted: i=1; AKwUvBz8vZ9cgfPv/QqsRsSzYLVL8wNJ+++UcqyfhZ88pwKYTEzNRussSa/+ncQ6ISodW3gRYg+EOHCINfQvapA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OjNuKnMRiTvAFa6b1wZ6AuauTLkE6EEIsnsG5VAVOCxxXGqFk
	Fo8sZjcBlCFVenEKqa6rIA4pum/RfcJp+9xJLM/L37tOQiRcgb2Yn54g
X-Gm-Gg: AYBFou1tDE3PJGIet2OOQbvC35FX+g7wTY+Vw7DReGnCKEt/YOtKugDYKLZBU2ZdSsc
	N4PYlIgiEAxf4VUQQYPxfKj8YSirwZu6FTRFCawCHLjkm1c5pC1TfeF0Dm/9srEK3egtj3KCOkA
	euFYyVB6TngiXucdhoFYUaNy9gh39cySy6HLk46/Pmfc2ORgn4OKZlOz4UliIPsJOAWvX2Afd1y
	3XoXu9SPPIiozVpI5ePj8TTLsoBh6a0ywXuCFVbQ4LqeKJiJUtDEThw2BNA6+abr2OqCFyHgGfp
	KT91YhpYB4UbJEnVpYGupZIpHbZOGYCzvEJVFK8WOW4tcc55QAxgefl4k6vGwwIDGkgg6fq0jME
	vwkeyKcZugIgugSWZVdRLJhnvZX/QHpIiVe8hcARYjtLoIC6kRdwvZmHHXuCHBABO97iloHTzgk
	ZtruQxScUcSf6Kv6oQa/t3Z4C0gCe5gumZIN/U1OY1CQChs788k/EgA362xb4sJKkbbjblQOFFH
	Y4bzCMughwcf1Tuxu5eYxOHi5WggQzkuOZql/2253iv5Eux4++a1+vqI0pIHYA3u2RLohdNpvOB
	r79N4xe+d+vZjcBC+ooLPvahPG8rIno3
X-Received: by 2002:a17:90b:2e4e:b0:3ac:9d83:8856 with SMTP id 98e67ed59e1d1-3ae895a5673mr16536437a91.9.1793894038354;
        Thu, 05 Nov 2026 07:53:58 -0800 (PST)
Received: from [127.0.1.1] ([2405:201:201e:816f:e3c3:bcdb:ef3c:2956])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b2cf80c9sm4518780a91.0.2026.11.05.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:53:57 -0800 (PST)
From: Viral Patel <viral8854@gmail.com>
Subject: [PATCH 0/2] iio: magnetometer: add Infineon TLE493D-W2B6 support
Date: Thu, 05 Nov 2026 21:23:46 +0530
Message-Id: <20261105-tle493d-v1-0-3246e91e6394@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIum7GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3ZKcVBNL4xRdQ5NkY4s0o6QUI3NjJaDqgqLUtMwKsEnRsbW1AFL
 N4cZZAAAA
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Viral Patel <viral8854@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793894033; l=5107;
 i=viral8854@gmail.com; s=20261014; h=from:subject:message-id;
 bh=E5ABrNVOOLIPXc1azjaTAT+AtKnHce0xIEtXnuYn4Dk=;
 b=v3SnX26XMaaHHllG3roFdxbI5vmzdNDOgpk/dcq9v2qkisFxyrt5NOTOE3VPDJ3p2vNm2cqgs
 GRInWGmFFCmA2Sl1F+YOkLK/5peAKIrNSt6dHowzNWC/ydFxW7eqqx1
X-Developer-Key: i=viral8854@gmail.com; a=ed25519;
 pk=UC+UDB53t70pTK4wncXf3tfh0hsYMCqpxYnTaKX3MYA=

This series adds support for the Infineon TLE493D-W2B6, a 3D
Hall-effect sensor with an I2C interface, 12-bit X/Y/Z data and an
integrated temperature sensor. It was tested with the TLE493D-W2B6
Shield2Go board (variant A0, I2C address 0x35) on a Raspberry Pi 5.

Why a new driver
================
The TLE493D-W2B6 is a second-generation sibling of the TLV493D-A1B6
(drivers/iio/magnetometer/tlv493d.c). Only the X/Y/Z bit packing is
shared; everything else differs, so this adds a new driver rather than
extending tlv493d.c, as agreed with Andy in the RFC [1]:

 - Writes: the byte after the I2C address is a register address that
   also carries ADC trigger bits; tlv493d writes a raw stream starting
   at write register 0.
 - Reads after reset: the sensor starts in a 2-byte read protocol that
   Linux cannot drive, so the first access must be a write that sets
   the PR bit to switch to plain reads starting at 0x00.
 - Register map: a single unified map, 0x00-0x16.
 - Mandatory odd parity bits (FP, CP). A wrong FP makes the sensor
   release the bus until it is reset, so FP is recomputed on every
   mode register write.
 - Data validity: a Diag register (PD0/PD3, frame counter, bus parity)
   instead of the channel bits tlv493d polls in register 3.
 - Temperature: 10-bit, with a different encoding and scale/offset.
 - Different power modes and update rates, and a selectable short
   range (X2); the A1B6 has a single range.
 - A dedicated I2C reset sequence.

The other Hall-effect drivers in drivers/iio/magnetometer (tmag5273,
als31300, si7210) were also checked; none share the register map, the
write format or the parity scheme.

Scope
=====
v1 supports master-controlled single-shot measurements of X/Y/Z and
temperature at full range, via sysfs and a triggered buffer with a
soft timestamp.

The temperature has 10 bits of resolution. It is reported as the
12-bit aligned register value, so in_temp_raw moves in steps of 4 and
the scale and offset follow the datasheet's 12-bit LSB.

Not supported yet (possible follow-ups): wake-up thresholds, the
built-in self-tests, low-power and fast modes, sampling-frequency
control, and the short range.

Testing
=======
The series is based on iio.git togreg and build-tested there. Hardware
testing was done on a Raspberry Pi 5 running the downstream
rpi-6.18.y kernel (6.18.59), with both patches applied unchanged apart
from a Makefile context fix-up.

 - Probe: the module autoloads from the DT compatible and the Version
   and ID registers match the A0 variant. With the sensor disconnected,
   probe fails cleanly with -EREMOTEIO.
 - Raw reads via sysfs: with no magnet nearby, X/Y/Z read within
   +/-3 LSB of zero; temperature reads 31.7-32.7 degC at room
   temperature, matching a userspace bring-up tool.
 - Triggered buffer with an hrtimer trigger at 10, 100 and 500 Hz: no
   missed samples (200/200 at 100 and 500 Hz), mean period 10.000 ms
   and 2.000 ms with at most 3 us jitter. sysfs reads while streaming
   work.
 - 10 rmmod/modprobe cycles and unbind/bind: no errors.
 - W=1, sparse, checkpatch --strict and dt_binding_check are clean
   apart from the Datasheet: tag line-length/link warnings.

Known limitation
================
After a sensor power-on reset while the driver is bound, reads return
-ETIMEDOUT until the driver is rebound. The reset clears PR, so the
sensor is back in its 2-byte read protocol, plain reads return 0xff,
the frame counter never changes and the driver times out waiting for
a new frame. Recovery is planned as a follow-up.

Use of AI tools
===============
Claude (Anthropic), used through Claude Code, assisted with this
series. I gave it a specification of the hardware (register map, parity
rules, I2C protocol, conversion constants and test vectors) based on the
User Manual, together with the v1 scope and IIO style requirements. From
that it produced the initial drafts of the driver, the binding and a
userspace bring-up tool, and it reviewed my later changes. I did the
hardware bring-up and all of the testing above on the Pi 5, including the
device tree overlay and boot setup, analysed the power-loss behaviour, and
fixed up and reviewed every patch. I take responsibility for all of it.

[1] https://lore.kernel.org/linux-iio/atyPf0msZ85z2m19@ashevche-desk.local/

Signed-off-by: Viral Patel <viral8854@gmail.com>
---
Viral Patel (2):
      dt-bindings: iio: magnetometer: add Infineon TLE493D-W2B6
      iio: magnetometer: add Infineon TLE493D-W2B6 driver

 .../iio/magnetometer/infineon,tle493d-w2b6.yaml    |  48 ++
 MAINTAINERS                                        |   7 +
 drivers/iio/magnetometer/Kconfig                   |  13 +
 drivers/iio/magnetometer/Makefile                  |   1 +
 drivers/iio/magnetometer/tle493d.c                 | 552 +++++++++++++++++++++
 5 files changed, 621 insertions(+)
---
base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
change-id: 20261028-tle493d-14c38f2bd273

Best regards,
-- 
Viral Patel <viral8854@gmail.com>

