Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933290;
	b=hOzJBwo55s2JqwE5Fy0j7W3BRAyLWqRI2EWpiin/SQXgF2zxhdN1RJ88i7TU/fqvou3r
	 +QDcBsVMDTwQvC/wW2J0EC++W/Lo1MLqRnD3jFjkAZf//9ubLErfUNOcFYwGlLLE3OtmF
	 LmP8aixFRGzAKGIxVSQmZ2X40Tm6xhZHrtVZsP0osYUOiQcdtjzhbuHFbX79wf6fAfyaY
	 kYfuudspba5zq6N6pqSaqZV/fNKVkdyAjJSg81n5yCP1grzpBDhmrfPYvi9iiWqsmKOm1
	 M4i/mk03Orqz1gSZyZbnn3hc3KHgqUMg6p19xa/lmTiXZoKhoddTQ2lflODx0D4k1qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0nLr92kUcJStZC2BCr+sdHppUBlRwS9fPEEDDTJn8Q8=;
	b=EDmXwVZx3t3FNsKYluylnaEXQEIcP9zkpytcHlmKepBiZDQYVRlG9K8JZqISssSKSA2q
	 KscazNVuylw6Jcy5DXKP1dcmSK/3AeiER1js/Jj7lCiuw3WSGqEfRZVB9tbGiepKQH5fM
	 xiKOcA2deGNd6AikqArvJGGbUsMsjUiWqwAoi1OirbLnhyiF+J4wlWtPWlsc0uYdY1hCi
	 y70vJL6CppfsmqVWOd9H5k9gkIWu3B3DbaCv/cN4ftnzwB5LS6OIXFMlvITxbjDbrRlQN
	 G+06zuvrbrQ3+8kgehAlVC1s+dUAusbItNlHrBF7Rtu2ZL5dtJNyipmrokOMkxQJl/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4q3T7wT;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8530E606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8530E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4q3T7wT
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5126591f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933289; x=1795538089; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0nLr92kUcJStZC2BCr+sdHppUBlRwS9fPEEDDTJn8Q8=;
        b=C4q3T7wToBWaEWAHAaUkEgc7IXBfUPR9NnEL98/CNVERz5kG9TGeFB4fZqLgIAD70n
         JMRkTC3c7PdNLL2uD9l1LY3pZ1E1rCpTpHmq9HDCylbBUNSVqnoTOlHrwUUzYMPS94rZ
         uyCvWY8DWOancmBiHuWEanvDTdxe/lKOGFOTewYj2LNJPh9mggqU4h6LfuJc30qv2bjJ
         yudF6uYvmMaXLRPDXnIgAV0qDlcimx8Chb+Co+hViyJxovQQM6v1ciJDL98tcOJ/abKB
         OcnapyrtMkAWiSkbcXTzjiQCPc1F4J75s8j/feT9hdhyfLtx66BnrIMsTBet3DkogyC3
         2z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933289; x=1795538089;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0nLr92kUcJStZC2BCr+sdHppUBlRwS9fPEEDDTJn8Q8=;
        b=xW80C0RfUpE7w+UIYulA1UFYGHdkSv9EKHXEqNcze24COupLHgwwXKnZabTGUd7XhE
         Yf1ZB8BPo9+tThEQZIlCJb1OKKSNzvu6bql/RFVcxbHIQRymUBjUG5LlCKairXPIKBAI
         40npNj5teVCl3BNYHPJ+Api4bd3RgjxuPEmMfY2wimzFYNZ4uhUW4jnNsCfWeOPSPLCv
         m/y6LwAWtuHu2S0Jeq1f8sWiKfVEoQeC47VAsEpD//1gS+SqEEdlKTXMuoLFjiCjgrPV
         /Y/XkOLFwWT44LlB8cvA+nKavJcapIfmgbIHt2qIwRxinEqQR7wUqvuTnrYsNujYGKgt
         0bSg==
X-Forwarded-Encrypted: i=1; AL+hErFarIDrTpyzWp6c62k4GjfYNZwK/aCwtp7rR8QEt6hNJbNVHpH8WQyf8ZxgduHorq8NiNZE/CUSO/r9+tM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vyhkodu/HKyilTV7N4pr8lJhggsAs65U7kEO9GD5V+ZrJ5bDq
	ffcO4j9lTtCJcNXuHHC14aw9tNeyvhu/bUtaA2yrqXvscvEIn/3GBZJj
X-Gm-Gg: AZFdTZf3CQ3HLk8bR36SX4Dt729rqYzuP1qTMSibrK7g3RvZOMt9vqBjd/NWaAATDn8
	sGboK+roxIlE+A5W/qJ4dhlu/tQ7oJiLiWDJkotpndinVWrSrsjvre/pfoGH+FpCF8fLtWUVDlm
	2/1pTo4ToVkFFZgBYk/qmll1tTWG7bi6T2F1GBwsjZP6vHqTvhdxailiPMYd6tV7QbJ3zKpuCpN
	1PSArygyPfay5Zw3os+/TE+x1PKUSYwiWCbZV4bU5WckYXl/Xl3g0xNl71zB8YHGE7q39aRuBB2
	Tgo9jpXCnWXFz6wsjpePks19efckmiWxFzAzDWU+54jsZun6iotXjP7C3MKV9JvWS3SxuyYtwjv
	qPtkw5ov7Rw2F4dGvmWrMfSedcSOvQoxyTYZKGAL9GX2dFbjYdhjoFPd5Sn7JBP+mHrmQb9ijM6
	l6ahXuGo2Lk3ESzEyu91VilqbtO0adXwjtQ/s5vQWxqkFrLiRImi0yjG2yjOzisgl/DWJYGv5mU
	xXvj+9CR7dH66vdo8RE2N2zp4pqnWCyIRBZtkZUnG6xZgMY1zcCrAu5NDGZjB6OR95zPdr7Mj0r
	59letsQXuOeOaGTwrXv6RWpDn488NkST5kaMo+ujkgWGJ0T+eFpsnn+vbSLVzMIAquwed/p9zit
	XqKynvswneYc=
X-Received: by 2002:a05:6000:24c6:b0:491:273c:9649 with SMTP id ffacd0b85a97d-49c70b051dcmr32305652f8f.15.1794933288673;
        Tue, 17 Nov 2026 08:34:48 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:9260:9c28:f0f5:e091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26672248f8f.16.2026.11.17.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:34:48 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/3] Add RZ/G3L HS400 support
Date: Tue, 17 Nov 2026 16:34:45 +0000
Message-Id: <20261117-sdhi_hs400-v3-0-b4659189db69@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIACWC/GoC/3XMywrCMBCF4VcpWZuSmfRmV76HiLTNxGRhWzISl
 NJ3Ny0Igrg8B/5vEUzBE4s2W0Sg6NlPYxr6kInBdeONpDdpC1RYAYCWbJy/Oi6UkqVVDZWoazy
 CSMEcyPrnjp0vaTvPjym8djvC9n6Y6puJIJUcyp6M0YCFak79nAcaiTvOh+kuNivi/x5Tb6gAW
 3e11Vr99Ou6vgGElEJJ6QAAAA==
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794933288; l=2081;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=CBpGJ3J11Ge4CceUmYpikw5K8cAJ7APFU5cYhMUuhMo=;
 b=f1Ib0zXkvJbVhSIRi0rJXpTosKpULS2jRkUem/AewnONbvsTd9To1UD27al99sVL0I+cpOg/M
 8av6eBULDyADkZjoSUf7RzLMME6/kIjvommvFAoXxgYjxWu0Fa2VppO
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

RZ/G3L SDHI IP support HS400 and HS400 ES mode. This patch
series aims to add support for HS400 mode. HS400 ES mode
support will be added later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v3:
- Clear hs400_active/hs400_clk in renesas_sdhi_reset() after a HW reset.
- Disable SCLKEN before leaving HS400 in renesas_sdhi_set_clock() to
  avoid transiently enabling the clock with stale divider settings.
- Drop the ios.timing check, which bypassed the divider before HS400
  was enabled in hardware and halved the clock; hs400_clk now follows
  hs400_active and the clock is reprogrammed in hs400_complete().
- Link to v2: https://lore.kernel.org/r/20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com

Changes in v2:
- Added fixes tag for patch 1
- Using ios.timing to decide whether the HS400 divider restriction applies
  is wrong: mmc_hs400_to_hs200() lowers the clock while ios.timing is still
  HS400 and then walks through DDR52/HS/HS200 before prepare_hs400_tuning()
  clears the HS400 bits, so the divider could stay at 200 MHz or prohibited
  non-zero dividers could be programmed while HS400 is still enabled. So
  tracking HS400 hardware state for RZ/G3L clock programming using 2
  variables hs400_active and hs400_clk in struct renesas_sdhi.
- Link to v1: https://lore.kernel.org/r/20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com

---
Biju Das (3):
      mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
      mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
      mmc: renesas_sdhi: Add RZ/G3L HS400 support

 drivers/mmc/host/renesas_sdhi.h               |   5 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 111 +++++++++++++++++++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |   5 +-
 include/linux/platform_data/tmio.h            |   4 +
 4 files changed, 113 insertions(+), 12 deletions(-)
---
base-commit: 522b5bdb42c730db0269a384bf5a2501ecb21e8d
change-id: 20261113-sdhi_hs400-5f08e5237291

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

