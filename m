Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569894;
	b=WIF4L82LRIc1cWIhbF6E1Z1R7doEN83TsbAaKlZwhVtiJ9TvBvigbODHPnlUUUzy6Qbn
	 Ljx2S6mzut335RNSCcHkPLBnsmQItqKQ3Z1wmS5okr2ALjgq2DwhFl/U5fDbqJClURxWd
	 lKHcDH8ZQ2f/tL0A7onazkjoatG+Vie9ie54JFdWAzHSpq4ailvBitOliiqUMfm1BQ5Z4
	 gRA2Lu4NL40SwkrwQoS/D3lFHFOL95xUkd82j0nOTSQy5k4JH2ye9kXLwWT4jll5wSn+z
	 USFaih97gFoHOHDlPP08gG14NEvYBeHGZLVkqyL8nvz/0sunv0BR5ndIR+p7lz7tUaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DyYt9/DWMV0EyHpbAMNA++QZYC/8eNT5egYzuTC+VI8=;
	b=mXWinc4MRM+KeNkLqLPSvBNlnnrXLg0JIUiUafdgn1KAa8bADb6gg69HJjZ4EqFtSXJv
	 D/r20tz6eVwnMmAlcsPWHHVP46sC21KGD1Ko0GP/zyeQknYU+ljKiAXVj+dhAmK84mYji
	 RvUjpn3s/NFoEcAg5Z+KkKrznn8pRxwEPWIljpyJC2QFe0KDdRkLo2ngffZAlVUJaDwbz
	 j3kjb1NQalb8xsnlktsLswmIZq3tDtnSOpaqB0vPgTdtkRdDCgnEfSGYeyz9+WfioEnf/
	 JIDLBcgqPmxWu5WxnV9ZjNkrk/nV6p97OOt4S1h7UReqWQIFpYvBZmmu9BdtiZThvwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=VCZSs2+Z;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A30B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A30B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=VCZSs2+Z
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so13207275e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794569892; x=1795174692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DyYt9/DWMV0EyHpbAMNA++QZYC/8eNT5egYzuTC+VI8=;
        b=VCZSs2+ZGVdHQ04oXSJdZjvF5y1D9vqsZ2iaiROWDPTfdhNFPI2Zj8BspmlOw6304u
         J1hpe/W+BSrSem7rccM+ivbX3k0gkLPJAArQhKflWIq8wu7RKYfO9gUXDk40/i3lyCfo
         hS32/TPYuB1usvRVxM6NFxLMccLHqfeJ0NRa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569892; x=1795174692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyYt9/DWMV0EyHpbAMNA++QZYC/8eNT5egYzuTC+VI8=;
        b=X3SzD1Y+pWAU9SocqY4u9N0lWVajcn5PC1kG3eviYEg1lrO6KJ3G9kyUoByFM/Kl8g
         Xg56Dsv2ni0PziRSpL1ncN48EpVovTu5xFoyGdq5ulgFWgWQv9f2UeptUzd26KLHF+ph
         C8ldW7BkpfcSCDozIyQi9ho1qlTHEcgXwTAxfVTYS1Yk5VexQn1OSgooLIDbz5eWG5wh
         50q6u2CaJXyKzN9AJW1754Q2p2TCfKRSVWe0UI3lbmeaHizENWbo3Z9CGnkdGlQIjZQS
         ziHEN8TnBicHgnQzzAqdr3s8eXtMIFUlOJxb615WeUbKIidbfARATCG7vmVjdUpHzZWE
         8HsA==
X-Forwarded-Encrypted: i=1; AL+hErG5TA9tYEX2p/OvTHSg/nfaqDWXHx6/et2wbZl+cLtcUu2q1O7GcXuDQBjvGf11OGtHPWuEh+1THEL3M+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bKASFLSQ2eaJokpl0pIhzH0h6Cj4H2hh0KiRTcGoLKYcv2Dha
	VL79Muf+HhrG2YSsoE7Qwf1VstqFKVG34VqHREl2z2EyQdt2aw/G6hOekwPraLTpdYc=
X-Gm-Gg: AYBFou3Tzk+hbTnADJVTDbuVRsFBB202Jw3lU6pBm7Ij4Kbv2/MndpUaEyNdvlEJTQR
	QkTIam6gGoWULwxnhpePVOyNW9AGhn9SvjOM8hc8FAV8Q32bSzxf9FfTrbro66O/Qme6y9wi6d7
	xVBausSDNcuYCx1G1WqQgdJclWR+xdwrGNm2n0qyOuxK8d1haVpkTEEyvnAaDB7F69nBHYNaT6E
	ylBCemPoRn9WTrr16UhdP5rPWjWAFciK1yVIFjuKaNBoeROfSHfDhQ7WTzSn3qkJ78LuytMSG94
	+Q3M8TvCBestMJk/sW6adPiEpLILqvXceEZncPINLOcqnMqazjXF6UaiG9s/mbxdm5m7cszvThM
	WY7k4rjHq7tn23etAyvaU0I+qr4A3rHZ/YnuerykJFcsqRiOUALEkQTj//iT3rzkkn34ML8l5ef
	8FBmStgYMx4uGQQLcmUSjMhd8uXadxGZMYiqb5tsTVnNrHP2oqmS/ecGR8My0PmxYe/mv5kFfte
	SURqSyukfySMf0yR/BpQPcSI3tGqIRa+z+wrkw/PNyFTq95P7ThJVkrceQ9malw7wpZPwPn0VBn
	8aL1XeydPgYb/0crDdbQjKf1v0Gied4asAr2OLZq95wOcWIMxiOsHcGjTK5d9e9qiMP8clfmuiT
	E
X-Received: by 2002:a05:6000:26ce:b0:48c:571a:a1aa with SMTP id ffacd0b85a97d-49c70de38a0mr4829044f8f.19.1794569891720;
        Fri, 13 Nov 2026 03:38:11 -0800 (PST)
Received: from thinkpat.amarulasolutions.com ([2a07:7e81:b71d:0:3e39:d071:1d81:5914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm5448492f8f.1.2026.11.13.03.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:38:11 -0800 (PST)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: [PATCH v3 0/3] arm64: dts: rockchip: Add support for Axelera Embedded 111c
Date: Fri, 13 Nov 2026 12:38:05 +0100
Message-ID: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
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

The Axelera Embedded 111c is an SBC based on the Rockchip RK3588
SoC. It offers efficient AI compute for multi-stream computer vision and
generative AI applications in a compact design.

Product page [1].

This series aims to introduce basic support for the board,
which includes the console, the eMMC, the two Gigabit Ethernet ports,
the four USB ports and the HDMI connector.

Changes in v3:
- Address Heiko's comment about the incorrect Signed-off-by chain.
- Address Heiko's comment about the dts name being too generic.
- Address Heiko's comment about the deprecated
  "regulator-suspend-microvolt" property.
- Add Copyright header on dts.
- Add Krzysztof's Acked-by.

Changes in v2:
- The board was renamed by Axelera between v1 and v2, from "Metis
  Compute Board" to "Embedded 111c". Address the name change. Drop
  Conor's Acked-by on the bindings, since the compatible changed. Keep
  it on the vendor-prefix.
- Address Heiko's comment about regulator node names starting with
  "regulator-".
- Address Heiko's comment about non-existent "mem-supply" binding.
- Address Heiko's comment about dropping the unneeded "Use rgmii-rxid
  mode to disable rx delay inside Soc" comment; checkpatch complains
  about uncommented rgmii-rxid, so take the one from
  rk3588-youyeetoo-yy3588.
- Address Heiko's comment about reset lines of the phy nodes being
  incorrectly described in the gmac node; note that these are still not
  described in the phy node because GPIO3_B7 defaults to pull-down,
  which causes the rgmii_phy1 node to never come up; rgmii_phy0's
  reset GPIO, GPIO4_B3, defaults to pull-up, so that node does not
  encounter the same issue. Moving the reset to the parent mdio node
  instead did the trick.
- Address Sashiko's high severity comment about hdmi0 node mixing M0 and
  M1 pinmux groups; use the existing hdmim1_tx0_hpd pinctrl group
  instead of redefining it. HPD is wired to M1 while CEC and DDC use the
  M0 pins. Verified hot-plug detection on external display.
- Address Sashiko's medium comment about "full-pwr-cycle-in-suspend" and
  missing "vmmc-supply" and "vqmmc-supply" on the eMMC node; drop the
  former, add the latter two.
- Address Sashiko's medium comment about the pmic node lacking a pinctrl
  assignment for the interrupt pin; add it.
- Address Sashiko's medium comment about the "vcc3v3_hubreset" regulator
  hack; describe the two GL3523 hubs linked with peer-hub.
- Address Sashiko's low comment about defined-but-never-referenced
  regulators without regulator-always-on property; drop them, alongside
  their pinctrls.
- Mux PCIEX4_PERST_N as GPIO, to match it being used via reset-gpios.
- Drop the unused input.h include.
- Drop the unused rtc label.
- Drop the local PCIe x1 pinctrl groups, which duplicated the
  pcie30x1m1_1_* groups in rk3588-base-pinctrl.dtsi.

Link to v1: [2].
Link to v2: [3].

[1]: https://axelera.ai/axelera-products/embedded/111c
[2]: https://lore.kernel.org/all/20260522174918.61523-1-patrick.barsanti@amarulasolutions.com
[3]: https://lore.kernel.org/all/20261020113717.189082-1-patrick.barsanti@amarulasolutions.com

Patrick Barsanti (3):
  dt-bindings: vendor-prefixes: Add Axelera AI
  dt-bindings: arm: rockchip: Add Axelera Embedded 111c
  arm64: dts: rockchip: Add Axelera Embedded 111c

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588-axelera-embedded-111c.dts | 810 ++++++++++++++++++
 4 files changed, 818 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-axelera-embedded-111c.dts

-- 
2.53.0

