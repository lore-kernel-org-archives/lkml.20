Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496267;
	b=u31qwYlEHuVZbbSrcL0KWom4NAi5kf3PB/LhmI1KB+55lu+kzB8OXO8hdiLydryvg03r
	 1gcVeDsy7cmwIALgNl/rPLQCG2GYfjEjP2hRQ6S+0qRGcnO6YkxzyIaAxmkKBVdhEDsZi
	 heUq4z7jV5y4s+YxKCExfmNmd7R2FLPH7a82c2iZ31vjggVyc9R8D4EFKVJjDYkevHeO8
	 FDNKEu2hu6yC8reVIEwtke+7V2GE7A2DUIT2FPoAjhz9xJjSkgDfcH4ifnfqbkAk9bn24
	 oN+//k2yvFk9QcwGYk0psnoSxhe3khb+K0ekMWn/vSbQIK/jALD5PUfln7nZEfwyPyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9EfSOgLxi4obTSYFEKDcXWdZzyYRk0JZmlRNRhuV2c0=;
	b=McyVlDmQjWb71hWfJql27qjOAcaoJYWola650bZf7FFYVnB7eC2fx6rF9gO1kebUIAjq
	 v82H8fx6Ky+rkdhxrhTzBNJ9Gdx+1gRuaKq2jbHvi8F8bwmzf+ipsloKL3ES7GtraTmPy
	 LKz5mgE81QhEScNdgTnEc853/jkeu4ukQyJjjZcJ3BPmskk7Uko0Zn3mhBhiV8VjJvncp
	 3Xk9r2pI0S2FhiWkLrjRFSMb6bqPGgGon3alNlr4c75F2IvbudHZ/RLBzc9dDs0LS4Jmu
	 KCzK1jsv1edIFYrUNPzjv6k3sGti/dqdNNy+t4V7iHwGKp/sN9fALdw3+QBc7xbek9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=AVjXfT06;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5901F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5901F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=AVjXfT06
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2579833f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792496266; x=1793101066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EfSOgLxi4obTSYFEKDcXWdZzyYRk0JZmlRNRhuV2c0=;
        b=AVjXfT060smBSSydciK7f/WBfzkpbUzvdYi/U4/+P6RI7tLqa3T6JjCX+LEcSAwwq3
         gVqBgwCZ/QtgURgVxVr+eb8V/5u5TVqiWCS3+nW/AG9FhZSYD/BDi2AIrBQW3beIUG1f
         2usM4TRNloNEV8wMh7ho1WnSCgxGw4lLP3xrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496266; x=1793101066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EfSOgLxi4obTSYFEKDcXWdZzyYRk0JZmlRNRhuV2c0=;
        b=Fzks0yhRXeqQOuOBrztP7XqNwdeHRhFxLwbc1Nk6yO/1cF64uXhh/eaBecaz0JSMkb
         z1oDXVniMd8C6u99uUxAVaiylTo0XlcXx31O4sjVDWMBX1rQsWU8DSKRrVDQU1YxsPCe
         NtBk1OPttkEgf664hm6Naw+K/QD5L35Z064GVYoc0h2UxTa3Dj6mbiIxt5ftKAgb8Iz0
         Op+YEl83MTNlJg6XgiDwJX3bsIdISVdL732/vuq4YnkRm69t5Fr/+S9oPAAwQLXKaJJY
         cuuLDtF4rTEjtGtJCbZibuX8Enm4LoKwqjaJrBNARNOvoRgq0Fkg8fzS40sJvbS1l581
         ELPw==
X-Forwarded-Encrypted: i=1; AKwUvBxeChi9dIZSwOzabW1Q7J5YKRcn2onrA8CH/Ud76xeWlYXklFAxB6aAFoDMq1lMBqi7HfOPR4mtqj3ibww=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa+m13jLRLHs8OZpi1hwB2JjuliLaVpDunio0RyG1pkvIyDXNN
	d5wqAE4X8ogDsQBfEwPL5RKer82emZwEStMbjferM2dcix2eMRg10cCFCZojoYVJavc=
X-Gm-Gg: AYBFou29xiBE3+v++yps4FrBvEEfiI+nzm+VA2uWcjb33ry1jeprPlVgxNzasSll2aZ
	qXz2KoHT8swqMP3ybD5Oa8LiQekiHywjYRUmsrjyNsVrMScLx8KdscvHdqZ5WFw+6l4uuBjMvxf
	tsPhIIw0SlMqfkBoxNdKKMt/X9WOEv6+g56TjXsUAgWBtEiIZpmlYyB6k6MGjUqhwd35cH59I9f
	/OhDqELabgMKXbjfceuiV4lPIudyAFUEaQ1Hx1hFpptwo9uDeAuhA2b7UzEpdN027xpWULHh1+t
	o0lyRhN5klA0j8V9JFk5MlS/9+UsKCyNYe6/Xqkua+SVApAz0LP1wgtVcR0oL8HDVaTqW71eb2R
	HDz/TM+MyLBerc8Elb8zJDSKTZ7U3yLm4eajIQRNt9EaE0fuBNbq6MeuKIf8xKMuU15krHciMfd
	xhYRennHT3CNe+IpeIzg3LzMcuCm+mv5n5jU+kZmFjwvex1mvf8Fi0LLpLSKd9N0stP4YDckBtZ
	nxC9yJM3SxfE0A2HtVnTXMYUUGn4bo55E5eTzFx0w7U/62KVE7V+0cYbBtnziqLYeQgM15AgzOa
	ZE70wtKM
X-Received: by 2002:a05:6000:260f:b0:48d:f14a:9176 with SMTP id ffacd0b85a97d-48e07bc1033mr21008073f8f.22.1792496265627;
        Tue, 20 Oct 2026 04:37:45 -0700 (PDT)
Received: from thinkpat.amarulasolutions.com (host139-112-32-195.dimensionesrl.eu. [195.32.112.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d83a099sm4709728f8f.57.2026.10.20.04.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:37:24 -0700 (PDT)
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
Subject: [PATCH v2 0/3] arm64: dts: rockchip: Add support for Axelera Embedded 111c
Date: Tue, 20 Oct 2026 13:37:14 +0200
Message-ID: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
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

[1]: https://axelera.ai/axelera-products/embedded/111c
[2]: https://lore.kernel.org/r/20260522174918.61523-1-patrick.barsanti@amarulasolutions.com

Patrick Barsanti (3):
  dt-bindings: vendor-prefixes: Add Axelera AI
  dt-bindings: arm: rockchip: Add Axelera Embedded 111c
  arm64: dts: rockchip: Add Axelera Embedded 111c

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-embedded-111c.dts     | 816 ++++++++++++++++++
 4 files changed, 824 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts

-- 
2.53.0

