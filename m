Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829534;
	b=VHYmemkjVISwy6giOoIrIs6K9EWhSSdeYC/dVSdqZTNYxa/OzODMdovmqRRJSKFvkWbe
	 DiblEChBYTrQCzQbzSpRuA+s/kHl0xDao76Lt2buso23sjKzh+41m1S1KeDfRu6Qgmg6z
	 ATLkaopVLLxadp7535UCuHSXcgQJObqXewvLpaEmOCxaxtHovtWUKUpp+8tN9jpu2+uQi
	 Xqx1E4o14223mf3yERGxd3D2a/OOKx9BGp021+TwqMPdFsJgQtfy87hkt4Qbt8ZAyvhdo
	 VzYfQ9Cs366qRnMsCuTAd4WDifNQyx/CFVWPuZPHJvEE5dam/CEKVWz1ozEmd6kET5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+AqvPVUykAPDceQuc3GQUkBSHmzMNEYjFHX35nxghcw=;
	b=qPbSG6CPfvUIQlmXgvtYjoX6QHXuyJVQq/nIJSGClYZlU9R3fjJ7B6tUdDp4VlkkyoVl
	 VAIN9E1AoCd4f94lsWHtelMnHUPDZ0LCFr6FCFHgPqSkgqp22xrzur61GTOWTENiHkYRJ
	 EjBOHD5CXOp38SbPjHaVreM1BnBf3iPhwfbZdr5ZkUxtUeKKjhINpwlfYG1kP3Ty6JZG8
	 Ctx9I/zYpxmtakRnnEw/CtAhpP14GG7X7oGgh5vuPNCzCE9lHEELj4x5TSyHvhxqu2CRv
	 cp+0b23tYaPbH2MQ2WNaGjEdQMjQwAKy112sWHJVsHSzuiJNCuMgNxfB+6lMq9JlOlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu7cvwJK;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FBD6074F8B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65FBD6074F8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu7cvwJK
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8794695e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829532; x=1794434332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AqvPVUykAPDceQuc3GQUkBSHmzMNEYjFHX35nxghcw=;
        b=Wu7cvwJK7FYC7glKoKS2nr1VdeOxHSJ9luIIV9cnW/RaC2BQxx3D6fu05kILH5uOst
         4jrJYzlaZCZAIGbifXue5Us2ZB4GOZrh2VmCSluFBPBdAviTckGMcghBZ6HO5LRhSJam
         inXLIsVtwL5A+5aZBOQbfoGmnvcFqATd6lC2R+SzaAImATm8EC4oY2m5JinBpLJcKtnJ
         619dLjonxEPW7jfwU/iNteSQWMANlquYjlkweStldBRu+wgblV0XA/di2RsB7MKKff6J
         Qv3FUYIbl5RSs964ysTWuk9/958pQeeIoMBgaDpm78s8MMKjRxoTfiiGwLp8IHy7ci+8
         CPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829532; x=1794434332;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+AqvPVUykAPDceQuc3GQUkBSHmzMNEYjFHX35nxghcw=;
        b=0R3UD5L20+eS7bQZbYLWgiwq6d9INnQl7Pv88Ph04YqM2XGGyYplJUcai/LDSnnT9v
         I5FHRJHSXEkpSMJ4z1OBkrWj6qNZaQdwaZqphuGnSP0ndDJ//tIfW7th3vNVIIsWrT3y
         fqioGnW6/DMoaf9qbcDFxu130s4Dlwpm+MP3W1TMbU//dyYAXL6fzH7ae1e8JmT/1btl
         4J3JUFXdPwxrnOTN4r5I2V3MBAzUrHWXdgqq4qiV/mCd0Ij5yMiTFy+heqLW0m3H3GJH
         EGOGlwlLolWbxRw7+j1z+gyJi70QJvWXnJHl/PoqGuBKwe2K1wTD4pfPButiskZRxOTf
         oYhg==
X-Forwarded-Encrypted: i=1; AKwUvBxDicGJSZ0NOPExxHAWPE4hs6NXTIy818V8O3gcvW0w8eIctOHgFhPawTJzzovyEr9f/nVws/3Wtcm1xRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z99pS9QfRMKnTwclH/ZYEt0hZYoVDYBhZ8aXVYHF80zphzj5PAh
	uqPJ6RXy8S42RLTQJCrevoVOAE8qIK0MvUNFSEFp5O9wvCXaVqDHSFGo
X-Gm-Gg: AYBFou1sNby+X2Q4JgsM9bmAYLV8CvKtQuYzY2bBhNNgL1yMsQgo0ojpmkE+MoG8C0P
	qFNs3wzm3NWQBnM3lJimmWchCb1oiMNWEkbxHWM4hVrnRL2SOOz1a1h2tkBWBB3F0fclwTlwZh5
	/AC12bVjvcBnL/rnzzmBRwHIjeArJFOqHxKtQwzKcUeyiWvYULKki17uyp/yJOKpfn8mEf36UiB
	pDN+3pM72ZTzxrdppG273HzgzNEMBv5ZtidZUg1CV9qzSvvqC+SE5cUUyKJVFAxPl5VGmEguapi
	2zWA3HadDUB+sWqDynnLQDtnSxQ2vTvESx/BUQWpXX5NX/pMWPeXZ62J2HL5JexdPefkCKTuqrp
	QZl6a/t8nGRaUCl+gordePbOeu2qOQugSdjIPIIwrEY7JXBcHRSGTQFTRZAv7/4NvIjbJ4cZEKk
	Z2YwmyoG85MIn8js1/QV4Q/H41uAI60Wkk9neUEleUUTz6gBhUZa9YEHPiBYZxfjl9fo7xrR/MX
	Kv1H2uEWwGlY3L1G2CTc/lJth+/TOYoECIKL9HFqM1a3OFVGEVpuDI+30ps2BS5ij5vBda1OcAB
	ISTSpTn9DpnXtO1pzcxP3NB2fVs24jngroASfjBKcouaOGxjr/7o4Od2fDW3vclZvbQadAN0f+D
	7QCeQScIicrMLj4fjRbTcAnxVkfvQSGdG4U2FI14kfYwHOw==
X-Received: by 2002:a05:600c:314a:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4ac1775316amr368381185e9.12.1793829531676;
        Wed, 04 Nov 2026 13:58:51 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm15526735e9.11.2026.11.04.13.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:58:51 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Subject: [PATCH v5 0/2] PCI: rockchip-host: Make the PERST# inactive delay configurable
Date: Wed,  4 Nov 2026 21:58:45 +0000
Message-ID: <20261104215848.2087944-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rockchip_pcie_host_init_port() waits T_PVPERL, 100 ms, before releasing
PERST#. The line has been asserted since the GPIO was acquired early in
probe, so that wait is also the reset pulse width.

Endpoints do not agree on what they want there. Some need longer to settle;
a JMB585 behind a ROCK Pi 4C stops answering configuration reads if the
pulse is stretched that far. The measurements are in patch 2.

So, as Shawn suggested, take the delay from the device tree instead of
changing it for everyone. Patch 1 documents rockchip,perst-inactive-ms and
rockchip,s2r-perst-inactive-ms, named after the properties the Rockchip
vendor driver already carries for the dwc-based controllers; patch 2 reads
them. The defaults leave current behaviour untouched, so there is no Fixes:
tag and nothing to backport.

There is no DT patch for my board in this series. Its JMB585 sits on a Radxa
Penta SATA HAT, which is not described upstream, so the property belongs in
an overlay.

Tested on that board with the series backported to 6.18.58, the kernel
Talos Linux ships; only the context of the #include hunk differs. One
kernel build, two images that differ only in the overlay: with
rockchip,perst-inactive-ms = <0>, the JMB585 enumerated on 4 boots out of
4; without the property, all 3 boots hit the same SError in
rockchip_pcie_rd_conf() during probe that the board hits without the
series.

Igor, since the defaults are unchanged, a Helios64 with no DT change should
behave exactly like plain mainline. If you want to exercise the property
as well:

	&pcie0 {
		rockchip,perst-inactive-ms = <10>;
	};

A wait of 0 to 15 ms enumerated 17 times out of 17 on my board, but your
slot supply is a GPIO-switched regulator where mine is always on, so I
would not take my numbers as a guide for yours.

v4: https://lore.kernel.org/all/20261028014116.2432425-1-ehbello@gmail.com/
v3 (discussion with Shawn): https://lore.kernel.org/all/20261028005603.2399220-1-ehbello@gmail.com/

Changes in v5:
- Take the delay from the device tree, as suggested by Shawn Lin, instead of
  shortening the wait automatically when the slot supplies were found
  already enabled.
- Drop struct rockchip_pcie::supplies_pre_enabled and
  rockchip_pcie_supplies_enabled() altogether. That also retires the hole
  Shawn found in them: devm_regulator_get() returns a dummy regulator for an
  absent rail and the dummy reports itself enabled, so the old test was
  unconditionally true on a board describing none of its supplies, on resume
  included.
- Keep the 100 us floor from v4, now for any value a board asks for.
- Split into a bindings patch and a driver patch.

Changes in v4:
- Hold PERST# for T_PERST-CLK in the shortened path. Old power does not
  imply an old REFCLK: init_port() runs phy_init()/phy_power_on() on every
  probe and resume, so the PLL relocks microseconds before the release.
  Measured 72-75 us by ftrace, i.e. a real violation of the 100 us minimum.

Enrique Hernández Bello (2):
  dt-bindings: PCI: rockchip,rk3399-pcie: Add PERST# inactive delay
    properties
  PCI: rockchip-host: Make the PERST# inactive delay configurable

 .../bindings/pci/rockchip,rk3399-pcie.yaml    | 15 +++++++++++
 drivers/pci/controller/pcie-rockchip-host.c   | 26 ++++++++++++++++---
 drivers/pci/controller/pcie-rockchip.h        |  2 ++
 3 files changed, 39 insertions(+), 4 deletions(-)

-- 
2.56.0

