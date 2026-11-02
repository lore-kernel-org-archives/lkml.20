Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650483;
	b=tpHDd7SGlGv6cixCkyCcffjb1MNIoY+xrhdUCZ/gczZbzOPGOPuGLK9w2KlS3ab0NlCl
	 CHMQm8T21Th2Jlw1POsoOZtYI8s+4Gyj7STUgryqHI1DsBp+0lcZpjphzg8h4LNwU3JOt
	 h+pmEZUSeFaosuALJl6WF318NMcROZPUmcl0eA50IVRGdwZsIseRYjMxUsfMzePtzkvvA
	 OQou58Z6BbBqbINvr/hoDCJFSTl+bcy5RkcbuZXxWiAnlpfvjbDfUsYhDR3J2qKrZZymo
	 B/CYGbglMx7ujofaRuDhYyK99bMx7Ka6xf01WFSBAzQUHUOrO6rm6oaiHEZ8Ne89pkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F0qZYx4u9TnnDtbB9BjrJLHvlePNA0vWLxRrEccaJmo=;
	b=sreLk5G3OkJPdpqt8FVtzFTrZAClNPnuk32v5HR0/w9OhgVJAtWFMSwdgaDaIFwgVCMD
	 zt9IovSury3q6MeEy3507AVs/uptSmU8WtQckfgwA+UKTWsgfhx4lMD6takrYvrlUb/iP
	 J+HU+BzMPxY2+d2nkKptD4ksAOXCjg1SaCqgvjXTXnWALHwYRycandUwyqlDSRZuOkXVc
	 xQ+cRc+6QBj/1u+Hx2NpS6VXFycRBj+3/zEqnNj+fG9EwHF9gAMX2ajRowsbvmbRpdeju
	 obZuaXZ7WIQl2EynBbssgDqnklsAKV88jrVaAX2X01nFJahnBtEdTjNa/bA1KBmUrnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IjKNJDCO;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F78606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4F78606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IjKNJDCO
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so38942495e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650481; x=1794255281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0qZYx4u9TnnDtbB9BjrJLHvlePNA0vWLxRrEccaJmo=;
        b=IjKNJDCON19xI91iHAVMwQ8G7AwpxC0FK6cKznlFx6cWtYq7fTjlvk3Ke7zCyx8kUH
         9QHFxgj+D8pmwYFdgq6ony1+OhXTDeKl/mRabgy8cpmzqWcylwrTUzbuRHVJXAlx2G0F
         ymtUebS4VY0isduE6A1dQ0cmjQW5/8YKDwUBdm0JakV+tRu1GKzDZMbO2HjCHPbrZZBg
         dhUSHov+FkHN20xnyvQYLY2v0aPDcOe1LwCiXf7RkRQ1ikWreKJbKDiajhjWh9SgVhIZ
         QjoNdcXmZiVnu5EGKPhLM7yXA6hr8f4xmvG+IkZKmW/JQM6H2XbCzOVBRTtG1ArfHN7A
         W0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650481; x=1794255281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0qZYx4u9TnnDtbB9BjrJLHvlePNA0vWLxRrEccaJmo=;
        b=Qb+sr9BXqXJ1CcfXgLqWngZmFLdS9qLecdIhGMttfwd7uvxjJFqavj3t6vJFZ7l0dn
         E8/mnPqHP0OwMZjFU5NEd3x91hRjpqct3gY0Zhjx4TByGSI2VuLy1hkMrEyDfYg5+YjO
         I9sFXZnA1W7qb94K7qm4mP22OAolyxwFHW2I8bpZ/PcgUMbZuboKVO355EjwHylzkVAC
         i1hd0lkOegqMe8hSTCuOS8SKl2Yq4xXTo0hO8XqJrAKnaQO0Th52bWXR/pEVg/d0P5J9
         8WHiVUIb2wnk0PBJlPz+CqaxjDf+wYg2uMB87+set4T9m7Lps9DD65z3K+Kj+I9CBGLX
         3njw==
X-Forwarded-Encrypted: i=1; AKwUvBzUCQzYplralISn3Xg4DVaYv7ZyHfCoJIUNWogvFGNiidNKmkb9ZnRSWEegy9MxoApNLOUkQXzlxP8V17Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl/ClT1Y3QxgyNLMkmqShADau8gc6PSQvoVN+P2OA+2tUnzwso
	zG9SGGHkvn8TCNXCAGVzPMHeqaJSI6TMicXFgwUUqsQ9y4FBhOSjYvW5Vnx8NFyX+gE=
X-Gm-Gg: AYBFou0OOlRUcQdue77Q0QwOF62I3ktBVB5EP0UQwh/XU99937o1gW28yYOWToarZa1
	ECT0E0PQZ1W3rx2pbbHk4TLsi8rjyS0eqoN4jSoJz+KNZzln0OSgeGHAdqlqKdCCHndaXZ3bVRJ
	BfHamzaZOoj8uTZMBNlbWcwvF2G4u5WIaNDGQeZ+3n28PHRbzKu4lE+HBl2ekPi52+STgaRWrnM
	RMRpfo0qnwV0il4w7rGCqKfHUnzfLRV3RyF4NmKoznJ2gpaXNSeV7dYNnejaY0wYw0Ofy1o+HjM
	YPJN4G1AAXduMZoOWx/kXBkt3WHl1VNS8gWtfXlf5nmIfYX3II3tp8yId4JFbRqEsXlBuwahQic
	BEet+MmakZUsTFD3EpndLLpzqNOngwA0FC/8+CrIcUiPKtE4Xijon5JAAKeBJTP+bjkFHih2FVC
	2LtIP16U2DKRmi/49b86mDcGmHfIxB85FRhDWN9xnur68Qul+UkQQowC1QsDt+LwRoktZw6oJqu
	bI4DpdI9+bhvvWOjs3RODd16NVW70g22CJkDOuY9m7/Os2PqjUMTVpTrU+DDaQC9Rra3xxegJkR
	/L9GxFSXKHwEnd7LpM3qsPo9l6Oj2QD0QFx1bUA4tkpd02xETut/QuHdcBV3
X-Received: by 2002:a05:600c:3b09:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b14017c507mr79134615e9.20.1793650481373;
        Mon, 02 Nov 2026 12:14:41 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a8d60bc5sm9559305e9.8.2026.11.02.12.14.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:14:40 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 0/2] pwm: Add the Ingenic X1600 PWM controller
Date: Mon,  2 Nov 2026 21:13:23 +0100
Message-ID: <20261102201325.29507-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ingenic X1600 has a PWM controller of its own, separate from the TCU
timers that pwm-jz4740 drives on the earlier Ingenic SoCs. This adds its
binding and a driver built on the waveform callbacks.

Changes in v3, after Uwe's review of v2 (thanks):
- Krzysztof's Reviewed-by on the binding, unchanged since v2.
- Kconfig and Makefile entries in alphabetical order.
- The programming manual's link in the driver's header.
- The limitations comment says what 0 and 100% do: the channel is
  switched off, its output held at its idle level.
- No mod_devicetable.h include; bitops.h for fls64().
- X1600_PWM_MAX_COUNT from FIELD_MAX(). PRESCALE is four bits wide, but
  the manual reserves its values from 8 up (section 13.4.7), as a
  comment now says.
- A comment on why x1600_pwm_ns() cannot overflow.
- The prescaler computed without a loop; it matches v2's loop on 300,000
  random waveforms.
- A channel that is off reads back as 0 or 100% by its idle level, over
  the period its counts give, and as disabled only with both counts
  zero. Its initial level plays no part then.
- .write_waveform() no longer waits for BUSY, the clock rate is taken
  exclusively and cached at probe, and the chip is atomic.
- Fixed: v2 changed the divider or the initial level of a running
  channel by switching it off and on again. A channel switched off
  finishes its period, though, and switched on again before that, it
  keeps its old word, so the new waveform was lost. v3 writes the
  divider, then loads the initial level and the word through the update
  register, running or not.

Uwe's questions about the registers, measured on the R1's channel 0
through /dev/mem, with its pin sampled through the GPIO port about every
microsecond and the clock divided by 128 (a 10 ms period):
- IDL is the level while off, and nothing else: set on a running
  channel, it changes nothing; on a channel that is off, the output
  follows it at once. So it does not depend on the offset, and every
  write now sets it.
- INL is loaded with the word: written alone it changes nothing, and
  with an update the new level starts with the next period.
- A word written without an update changes nothing. After an update,
  BUSY stays set until the period ends (8.7 ms in one run), and a second
  word written while BUSY is set replaces the first, which never shows.
- The divider takes effect as soon as it is written, in the middle of a
  period.
- ENC clears EN at once, but the output finishes its period before it
  goes to the idle level.
- An update on a channel that is off keeps BUSY set; ENS then loads the
  word, and BUSY clears at the end of the first period.

v3 itself was tested on the R1 with PWM_DEBUG, sampling the pin the same
way. Through pwm-backlight, 30, 60 and 99% measured 30.8, 59.8 and 99.0%
high, and 0 and 100% switched the channel off with its output held low
and high. Through sysfs on channel 0, with the backlight unbound, all on
a running channel: a new duty cycle; a period from 100 us to 1 ms, so a
new divider, after which it ran at 1 ms and 25%; the polarity inversed,
so a new initial level, after which it was high 75% of the time; then
0 and 100% inversed, and off. PWM_DEBUG reported nothing.

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time.

v2: https://lore.kernel.org/r/20261025191624.9219-1-olivier@mgcrea.io
v1: https://lore.kernel.org/r/20261025084643.93167-1-olivier@mgcrea.io

Olivier Louvignes (2):
  dt-bindings: pwm: Add the Ingenic X1600 PWM controller
  pwm: Add a driver for the Ingenic X1600 PWM controller

 .../bindings/pwm/ingenic,x1600-pwm.yaml       |  47 +++
 MAINTAINERS                                   |   6 +
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ingenic-x1600.c               | 289 ++++++++++++++++++
 5 files changed, 354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ingenic-x1600.c


base-commit: 9ad5602d4943635ea2b3b73d1a720161f88da1a1
-- 
2.54.0

