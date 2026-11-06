Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966343;
	b=cPVfRUnr0FmunfgcsoT5lPBH4xYmNexJSgm83xJ6sZxJcCMU4kopeDPGVt8UaouC+8e0
	 31FzXixWpbvFpRTbJBGGariuNzoWMM1zaZ3Rjc4wsPfvOTyrgw2OCQ43OWmWrlpTIzPkZ
	 Uw9T93MObGOpkWljIdn0u/KLAIz2gjqd8R4fxQDfxeVU1o6LT4PNQt7dZe/pFpciTJn+l
	 z6GkAl1pzXQKHzGeRaTlD7r70PkysIsKnh9tzmbSQ1mR8xDimme3r/xHr29qYE40OKtAc
	 dd8GAJ+rEIHpH9F2fsqglNBWlWPFecjQCdVe8qZC37AhlbdNZk9fRgRTt6dKN0/74jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PERZnCTf3Wubqy6fD9gw9rB48GlS6WpObwHFfIj5z2g=;
	b=aSbm5WztIeWqdyzbShsio2weU7YByzOaQsLV/mGTJoef7Ojqbl26vA5MTW9RuwtnOcG0
	 rpsZjga0tE8Eel8Qb4tPuAQZE0nEEBI+XWDVCi5v03qcs5niFg8CEJIcv0l6Q44LpI7aG
	 XzkjMXx+zbhAG7rv0H1s++r0z+EhzMhutFhvynKsOK6oxTxyr+IqKt3X3S78Gzk2TElLE
	 cC8dHA1j9L5jK40vpKAnpF5WE9ACnAAiR3xT2038JAp2mxyQB/+us6ndkyREoDXWwkiAm
	 qWDHnzCLkV+wSZyTenfYK9aFHoOXYcMxYOe0NGO9azk5YtEjupCMPRCEjuLp/Or7xoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCK3UEEe;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13615606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13615606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCK3UEEe
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b467581b98so4182485e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966341; x=1794571141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PERZnCTf3Wubqy6fD9gw9rB48GlS6WpObwHFfIj5z2g=;
        b=GCK3UEEe/FYa/4rJTX21W6ULCaJr7nJyTCzMxvEnzbugtDfZ+uceqF4ozasO6cG1mK
         tEbDfrP/b9FfLVdlfl/FwYf+uo3XtVDqOypHbExWyX4wDs8y3OtIJTT8kfy72WBAgW+T
         jS8MbDwiSkfbhMMneD6AisdFkv7qN6DxESIEoo1KWVzBnG34B/OIa7R/5qVRngG9lDgn
         amFbx4Lwk7RzWj48FuYoGZ11vj9PAJ9Ib/0LnFJms1BqCR/wiH0+6tR2phIuYWv9om+i
         dPjSDinWFTOH4CFCN09lOBgoav+H/xtMy2cHUkVWguiFHX8GEH48ivJaWXjIUzVkKhxi
         AL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966341; x=1794571141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PERZnCTf3Wubqy6fD9gw9rB48GlS6WpObwHFfIj5z2g=;
        b=wfwYjlrPTIGOhLz+vITVZ6C/taNAXYbi9+cQrNNoFb2YJ5p7Aawh2J47+s1c/OtnHE
         5igkAEX9179EJPGbHC/CMpGt/Ialef6srkFlzUU2AwO3rD+4xB4bkwpfmlbT9BKwkUFk
         kAx1iohq6m9voUhYwca8chylkTpT+uEc9lgP7kyR/jJkl4+P9htDW0ILJwtRVRajb525
         WCu2ZC1CKPWLMjc7V/d00SAJV1cig/O9ngPdQzFrHDHa/7YmfYociahpiIbwIEKrpsuH
         sNvmCSrh3W925m+dVgc9qLQArNiw8luA1zWKVHD8b9NeV6FKLNGp4EIzVl0VVfNwzhK7
         sEUw==
X-Forwarded-Encrypted: i=1; AKwUvBziCnr5pu3qg42by0FX93CIPiu2x8U7yCYpqm1Bp+sNCJetNAE3VTP48iKzwvYqcRtWILOYQqZsLmLVe24=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B9DcmrCZ/PRMJ7R8tRqlFV1wj+WGysvphmcsKhh2V62fOWWPb
	RgHxIhu7aXM/43b+TS0gkK8wy1OC22733Yhfwljp/M0P3+AEkGfrTeqN
X-Gm-Gg: AYBFou2DbF/3frk7BrYPGKTvOod1Hh4he8LBHyDZC6IbQ/TCePBaz3mHYJ9DoQGCTbf
	YTpLh9x9y2YNFTrGSsWNX7LFf9BmnIhO87gwpJ0vuHN7z49l3HQ4TVgiig3yBm7DLcG6PABTGWL
	pWMdOVgpdhE8YoawcoX2dbgAhhT4XqQCbHJQHQ9aIIEfE++49UBmkj5LB+OyxQOn/Zb8p545jnL
	gB8j0JYFy3uiNJPem1uXL4tryaD5Lh5nnUtYfUyS4B6YRGT8RfpV7WVUkecsLRXfX2dD/1Of99W
	Li/PCGy53K0xn4GlWdyS7NgpfVi2EMJRysPe5jIdF2GAqoW9wDNzGxrSsxOC5teGELg18CTVtbn
	m9ZZ7tOCM2T1UD8ev//awPU6l+EimaQ8EPZUpxUBUWcfRHqTQG3x3qlt79yW8SScgsDaDICvWNl
	2jexCoUmRUb7Xd3LA6md3ass8N5eiq+IOO/4PYDj42dsNBXV+/pAO2iDuzlLqAbbgzSkueXUstN
	8p79q2ZGMyge/pM/+bP+V+IOOTAo0b2eXb7+vQfzfcUS8xOqkWLyYrp9YOfMMWfBKL9uBSDrAFM
	M1Ps1YyzYajR9uOcsM13iFVJYu+xHq8+TazBCFd8alAZkCWJwdNrrCn8tolWpBT5x/cmC8mS9ee
	x4Nwjtq3Wbjyt+OSDsnBhvQIV61ZJE1A0rooiV0mm7m4KdDhy94jKLI8=
X-Received: by 2002:a05:600c:6095:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4b6dfd98684mr32795175e9.30.1793966341140;
        Fri, 06 Nov 2026 03:59:01 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d52a7sm4849775e9.1.2026.11.06.03.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:59:00 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v11 0/5] clk: add support for Airoha AN7583 clock
Date: Fri,  6 Nov 2026 12:58:45 +0100
Message-ID: <20261106115852.189098-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v11:
- Move to global spinlock
- Move pci ops to sleepable prepare/unprepare

Changes v10:
- Fix whitespace in include patch
- Add reset and phy cell as required
- Add additional patch for devm variant
- Add additional patch for lock for clock and reset access

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (5):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: use devm variant for clk_hw_register and fixed clock
  clk: en7523: protect concurrent access to reset and PCI register
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  25 ++
 drivers/clk/clk-en7523.c                      | 352 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 ++++
 4 files changed, 437 insertions(+), 8 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

