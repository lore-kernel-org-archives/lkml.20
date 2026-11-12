Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509722;
	b=dBTAwpOdZ+WB0Pf2fg0RSue8lEF9ihpqu4dUJpHMducY+CG9/xizKEDulcZNio14ISAu
	 UYtvZYlr8aT5z0LcFthypeMmK9Y2gYI1ji6XE852LWCtq3hJQwYg9Zb1rRGfAKwKVa3/B
	 bDvUdMwFig1jrKOl0eWFtkcmsrrYCVkU8LShnK8q3Tg3om5t2iYN7s6Bm08CrUtB5OAAF
	 oSjzzpoG0e/E7P6vpkNUAbPk2Jyw4qmOJsg3reMGfRQFoiDY0JkTw3Tth1dh9W7tiTI9g
	 rP5eFboO2fiPfQCaBQqvLfNeYziBMlxmP/fOHlU43g7Vr/3O1ukbbWxjcudwwzcvtZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Lmv+SXFI0Fqj2caWzKa5TPeKY9FER/v63fJ59fdwvcA=;
	b=uL2wjABs6XUz/t13/dXAKD59Tpl2r07MK8briGY3rHAeEVczm5QWMj0+wWEOd7RS93RM
	 wnXpgko7/vLrvtDDnsueMMhfBcdwHMJ0wXOlpbUmx8XfIp+fe/me3V++o80eWhdcES50P
	 RTws+3Poxvf3vnjlSSgr2OHgvj3o223hOVDA1wwAUPCq6J9d1UEIQz/alhazhK9de4TxZ
	 MNvYvCc91FDBMPayER5AzKTjeVYCi5G51uiLx2iTeRroaBEl7DqqPfYD2ocwIflsliJrF
	 ZxAz+/+njO4tkWpgfkOojKTIV/04jOrYaCvCBVlw9DvfthFduXE8W40NyimEmm1x0Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DikTIHXs;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF79606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DikTIHXs
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so1109855e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509721; x=1795114521; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lmv+SXFI0Fqj2caWzKa5TPeKY9FER/v63fJ59fdwvcA=;
        b=DikTIHXsZeppruNXlTvpRT9UEUOvBSjJsL16v5Em3tJeBeD3Ng6YUDp36BLvlCJxAX
         kD2f5IudDYqAKqmxeW4uTMEMaSLFsJJxH33HmQtpIq2JZMuYlFPXF/tU7R/MPpI8mof+
         c3+n0muRmlJZ2qLtRsinnJsWG2MTQI68H0/7bc4ciZZYwIYAPhCWxEg/J4rAFSOrfFEs
         giOHz6jwySY+sLdgY7o1MqLmetZ0Zv1JKMo5f3inAM84S9Fs3xdQ82UtLjfSqN2Y4stR
         bqS+PXDOJGEqpNK9ULes89NX7VMVQjMc/MvjVAtRfkGL9Q/YpBkryTCjvTuFYzzcKFo0
         9RRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509721; x=1795114521;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lmv+SXFI0Fqj2caWzKa5TPeKY9FER/v63fJ59fdwvcA=;
        b=L3slAysdO6aewJXiqRIupE1c5xp74x/FAdKeYDoVWxCN/s9BkyU5yCI6FXNnHyH9kU
         sdzEFqp/FY2utFns7QmwW1RbCbiTcuq00rXhfN6vrteWrt0gD7TaGfTZWIQxQqRsXIyR
         lx6NRoM5dcWbEBkC+mj/jyBKS3BUUKpMu3p0YiI0EOx8XpB9qZOV93KT44L4me5/N1Om
         ctKp7r7axPM903GGuDMGtd2GF+gB6SL+9y9qyaSFrdF6hhoSQ4158eByODwD3daqAIRT
         FwJqMRCHRx6rSW1/CT8STsBrBe1kpzOAOpNsh8TQDB7C5wbJILBr5Z1x7qlC+xmFoO9u
         a5Ug==
X-Forwarded-Encrypted: i=1; AL+hErEoW+871hqgEqhxJtS/CYYUFXcQ1AqgLERZpWqIjm1nLL7FJg2x2bzkJ0HpF03bqPQfBvPfNAmSZXc0lvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rB4Pc3DxiIHsj1MIj3DwOK5Wef1LaHNYElHxsZUSKliRRyO7E
	9fWH4rJx81pZY/PYCzM+e3ChZCq0e8BCpnTI+ICes8ld6cWnYHEE5I25
X-Gm-Gg: AYBFou2LHCl8SRVODAVUu/FBKlETbvkoxwLvFhJFHSWsy4ZuVnAFv1O/h6gVC3zzgQe
	PqcoS/0wn3qiF40D2a5O1oG+LnTcCGhcv9Kga7gK7FWCkreczQvIB5m4Xb+MG2aXzSrM8rBNa7k
	Mo4ZmIlf0kbFi820zYYHzG7w/6BTkG6PlPNKpCJM3eVa0/BerKSPcW4tOpYj0iuFTSEMaFwSYfb
	t/i8Q/MQbM8z3xnLpJ8oQj3Mf452QBY0jYQYB6/gVraAJI7gZtkOJjoSDl4Z9IsbjVpFthCKYbF
	ABU68YrlRLNYl+AxTgbslsqMrPaQ4l1dlK2jJsBUWFKOG0Dm9zpwIbI9xbWhW3vNvb5U40xV9Ag
	EUzxfgE6PyNLJESR11SmUl2JbmxCW9s1Z/ke9br7NNNboLQC1fcdCuWRbQxEsk/cQUoI+Ta+JwM
	ELMY2G0wx7ZuUzHlyJQRjK0a/vP6gxxTWO2Gldz8toF8oSqdPIjDIVy/d45WYVxT/c8D0tp/0a1
	btCfnyUzV6F6xv3JKFzvfogdC3YkZZYbcJy8P7pLbr+hCsp+yobgAhWK6OBqaakAyr08DkWrAB5
	1s1TWbCDV/tiSGB6DWPpvReuqmfnFUC0KIPFjHGFfwRS9Mn1hsYF76YufJionHvFgSMqutkT2IY
	Y+pDoyrI=
X-Received: by 2002:a05:600c:5395:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb55a95d09mr2276655e9.15.1794509720587;
        Thu, 12 Nov 2026 10:55:20 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm71734755e9.7.2026.11.12.10.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:55:19 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v6 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Thu, 12 Nov 2026 22:55:07 +0400
Message-Id: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43PwWrDMAyA4VcpPs9DViy762nvUXZwIqU1LE2xM
 9NR8u5zCoMurNDjL9AndFVZUpSsdpurSlJijuOphnvZqO4YTgfRkWsrBCQgcLpMWwLQUxwk6a8
 zh0mytjYAI3bsEVRdPSfp4+XG7j9qH2OexvR9u1LMMv0F/f9gMRq0a73rfd9YCO79MIT4+dqNg
 1rAgs8guCAkxKaFLZGskeYOMfQAaSqC5s2HijhseY3YOwTNA8QuCNsGXDAuiF0j9AxCFfFiWza
 Ge49/3pnn+QdMa2BjzAEAAA==
X-Change-ID: 20250506-vt8500-timer-updates-44a0d22cd720
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4679; i=alchark@gmail.com;
 h=from:subject:message-id; bh=mq9dCgZxRcstSjZiALPf7wdNd0P1Pq/qf9rQUdUH1kI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR94556t32HgVnXyc4S+97MMxUabwX2bD9kxfx7hhnHm
 p8x7ga2HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1/B2Gv9Jp/VHhdyMT98yzjHpx1+LNjx+3nThfWxkFGXadaPxxzpThf9g7/vV
 snI3Oi6yOBH/Mz9n2MeC2Jo/ormLhWouSPBlrbgA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add named defines for the registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog, and let the watchdog restart the
SoC, which the machine's own restart hook fails to do on WM8950.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v6:
- Dropped the binding patch, which Rob has applied
- Rebased onto next-20261111
- Moved the shared header under include/clocksource (thanks Daniel)
- Pass the watchdog a single register base, and keep the watchdog
  register offsets in its own driver (thanks Daniel)
- Build the watchdog driver in rather than as a module: the timer it
  depends on is always built in, and the driver is tiny (thanks Daniel)
- kfree the correct structure upon aux child release (thanks Daniel)
- Return -ENODEV rather than -ENOMEM if the timer failed to initialize,
  and drop the message on allocation failure (thanks Daniel)
- Unmap the timer registers if its interrupt is missing, so that no
  watchdog gets created on a timer that never started
- Improved code comments and commit messages (thanks Daniel)
- Give the watchdog a default timeout, so that opening the device
  before setting one no longer arms it for the next counter wraparound
- Wait for a pending match register write to settle before rewriting it,
  as the clock event code does
- Honour the nowayout parameter, and disallow unbinding the watchdog,
  which would leave it armed with nothing to ping it
- Added a restart handler, so that reboot works on WM8950
- Link to v5: https://lore.kernel.org/r/20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com

Changes in v5:
- Make sure the watchdog timeout value is clamped to hardware limits
  before writing it to the registers (thanks Guenter)
- Add a comment about the watchdog match value (deadline) wrapping around
  the U32_MAX boundary, which is expected behavior (thanks Guenter)
- Avoid moving register definitions to the shared header file to reduce
  churn: the watchdog driver gets direct pointers to the two registers it
  uses anyway, so it doesn't have to know all those offsets and bits
- Put the watchdog Kconfig entry with other ARM platforms where it belongs
- Link to v4: https://lore.kernel.org/r/20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com

Changes in v4:
- Changed the watchdog driver to use auxiliary bus instead of platform
  (thanks Guenter)
- Split out the register definitions into a header file shared between
  the clocksource driver and the watchdog driver
- Replaced -1UL with U32_MAX in watchdog max_heartbeat_ms to make builds
  on non-32bit platforms happier
- Link to v3: https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com

Changes in v3:
- Dropped the DTS patch already applied by Krzysztof
- Rebased onto v6.15-rc5 as requested by Daniel
- Split out the watchdog code into a dedicated platform driver, like
  timer-gxp does (thanks Daniel)
- Link to v2: https://lore.kernel.org/r/20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com

Changes in v2:
- Included the previously reviewed binding change that is directly related
  to this series as the first patch here (thanks Krzysztof)
- Created a separate config symbol for the watchdog function to let users
  build a kernel without forcing watchdog functionality upon them
  (thanks Krzysztof)
- Link to the previous binding submission: https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com/

---
Alexey Charkov (4):
      clocksource/drivers/timer-vt8500: Add defines for magic constants
      clocksource/drivers/timer-vt8500: Prepare for watchdog functionality
      watchdog: Add support for VIA/WonderMedia SoC watchdog functionality
      watchdog: vt8500: Add a restart handler

 Documentation/watchdog/watchdog-parameters.rst |   7 +
 MAINTAINERS                                    |   2 +
 drivers/clocksource/Kconfig                    |   1 +
 drivers/clocksource/timer-vt8500.c             | 179 +++++++++++++++++++++----
 drivers/watchdog/Kconfig                       |  12 ++
 drivers/watchdog/Makefile                      |   1 +
 drivers/watchdog/vt8500-wdt.c                  | 145 ++++++++++++++++++++
 include/clocksource/vt8500-timer.h             |  22 +++
 8 files changed, 342 insertions(+), 27 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
--  
Alexey Charkov <alchark@gmail.com>

