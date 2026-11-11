Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403901;
	b=U1y8Mc7xFbXX0J6jJH6wb4e5cUVczoD/1GyauP/0O8vYDPBUIsX/fiKvFMk7u262DLgg
	 Zl5vZ5JiYp7/gNfp7ubokwnKizohWeITlf0ONBxATY7rkIPnlQhg4KVSRN/k4jipIsTKT
	 rscaYkINzvKGE/CLKhqE9Lg3lj5WQYgMMNe4KLT1GjBOM11enh1ONQb5JYwTHqOoSxxXk
	 kjkhtM7BiEM3OrJiZKarybWCts9101/j7uAIjqRIiNHb2B4WiQfQpvXoPi1GiOExFiu15
	 cReS0b7GXInNwhZDvsuFehj8ZtM2jNksCOMnNsbZ8ynNbKkTI8gpfr36Bk4jr4W9rMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H0L8NY5KvCN7Y6Y0k6z0RIGpvtUytxSeGPbkleqES2c=;
	b=dAFXYwO5c1s1978xIhmikhLQ9J1ODowqvI+TLdJeLq566Cd/KoZYWMuWXFsC1cnpW90D
	 67cxexHTFQL+svxwXk137DwHRoZ7THCJ4p2gQCvqYqUbJYpC2rgRQ4NiVrt0NZdqk+bWs
	 J34YLEEbROvmnFkRnOjZLdXeChNqWVpPxE4460nfvHp4UuLPJkjk8qOYCdPJWlebEIhVc
	 7eBAhIEgPyiiI/u1RbDXMxQ2zZ5vk7W8c0ELNuzMc+xj8MAgYRWLUZAl46aJZnN5rlzMi
	 vDy4qbxuGcEFGerRhA8g0p45twOsSOSyCXsR4q3cms2yp5YJFwiC3fP5sdTCXrX8Oog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Vvwbhrmx;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7BC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Vvwbhrmx
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a215e64962so35706165e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403899; x=1795008699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0L8NY5KvCN7Y6Y0k6z0RIGpvtUytxSeGPbkleqES2c=;
        b=Vvwbhrmx8Qa4L9mk5Xgmt8QUYEXWoqRoofsxkGWcYrENndglPL95VqaebTdaEx2p2u
         Y9tDrEaz4Z83KsWdJyf7R3A4upA3r3lcU0iHv9y2a1RWA2XVcVmebcCA0UTJsbHwajuF
         UB7rsWzLItAC4OqMiuLJay9ZDDHlxusgy++6QLMIM3gWvJ35DFfwh5cfyXZ1r3/7UVSL
         Y7Kr/ep9HPcI/gFQ2SAy7ah10GiEvPOFmsv2/sdM/NtmnMZz/gY76v3JQZBMNdVL8X0c
         ObEV7GCbyR9P2VgToSvC2hSSgkWC+NxtwaKXFgV/VhZtCsLeDGRtjKTWIw0hlUAGloI1
         zXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403899; x=1795008699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0L8NY5KvCN7Y6Y0k6z0RIGpvtUytxSeGPbkleqES2c=;
        b=26zslgsgFIlaOZSytIW0JYgTcYU+U6wiWAWr4wuIkmATZ+63hrjimwmQSI5Z36Fl8l
         y5gT6vxdBb58cealUwJvnyfW/7+5C4bGsccng1W9G0aXBAromslKhG3BeLXERWiP34xq
         Wd/pSUnENPb6R1A1l+QMhhq9XmcZj4ty950svCwCUdFJ9SONI3tGP64/W+PAI5ogm+IQ
         PU7N60M1PkRXgD0NOiCKpl8GK1BIYkGgy5spqPM6eHyFQeLEwoA98QDvRgF2LwRQdyqn
         vkZcvljHxOutrDJWAamkrqMCwDNf56J3r6Cw6EgOPzRXdFY7UhzkdxzIypWyC7WKHQ1d
         dGNg==
X-Forwarded-Encrypted: i=1; AL+hErGvX5M/MG5eDWTYb6K/D4/MtFz83UkFO7URahe6HFkGXh27tGmoH4XvsYbRNLNMjZhcK06neURmpeLhzpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sf/YVA0WKQeVWQK3LJOFN4B1jLsh/IY2Gg3CAHf8BpJorspeX
	8+65IwYz3q5Xk8YEfuv0k5zkp7QaPEA043A7Pxz3bW0yKaizSrBRgnOPATvXqIxMj5g=
X-Gm-Gg: AYBFou2W93y4mWVTU1TxUNd+J9mEHYahuKcM/9zRyLKYeAw4eK71QDpq78MZvanLg9j
	2xfWOmnKyN4qDsX+GfQ6Vy2uPQr4HWZ1Pqdn+/4YmrY6RCUXvY/r1XOYLK52sjIHbz7Z9qV+zLy
	SaF4hkIkJyoRjie9hUfzzLzdTwuJQr5m9Zc65VKX7pjLfn41tH0GpoNpJp7gedaGXGpqPmO+HI1
	Qy99g9gSPbkETZEdgBzr26EabAxqXshVhMWxCkvYMrRUZ+Z5DyrRf0OXKxgyYE+EEZHnHEj6YrZ
	g1mHQn697+Q4HR00gbwWnYfiVFPJNNokYMHWrTa53TJYHOLaA6FuEw8xl7LU9c79g5aOE22rfzt
	hRCqbfyuzUdghtHHQjBhETEe1GA+OupddLMdJw6CFWffnYZ5qke5vFEJf+y+KGOUWY7/aZyRLdR
	W1m4ZtJetRMj7K8O8DrUsWubMP5FfAB7Qw1gWecnYrKWDt/7It4i+NMvarvwdeuYw+gsJR1GC5T
	5OfN9LldDBjEQmjucHdgwRN9QX0PIFvqiDAoE2nfGeW60axDeeHLpAYLtfvwu2d3s+cNSuVNKw+
	9lOLkGiSqLLGMFC+yo6eA2y2ROpM5rVAgx/dj4GfRYf1fkiewCOlPCwkj6CgAysWnvKP8c9Rr36
	B2CQoRO40+Q==
X-Received: by 2002:a05:600c:6214:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4ba0939815cmr42149525e9.34.1794403898734;
        Wed, 11 Nov 2026 05:31:38 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:37 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] arm64: dts: freescale: Add support for bytesatwork byteDEVKIT i.MX93
Date: Wed, 11 Nov 2026 14:31:14 +0100
Message-ID: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
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

This series introduces support for the bytesatwork byteENGINE i.MX93
System on Module (SoM) and the carrier board byteDEVKIT.
It also adds display support for the integrated Youritech et050fw01-kt
MIPI-DSI panel by extending the existing ILI9806E panel driver.

Changes in v3:
- Patches 1 & 4:
  - Added Reviewed-by tag from Daniel Baluta.
- Patch 5:
  - Added imx mailing list (imx@lists.linux.dev) to MAINTAINERS entry.
  - Moved controller activation (&lpi2c2, &mu1, &mu2, &usdhc1, &wdog3) from
    imx93-byteengine.dtsi to imx93-bytedevkit.dts.
  - Removed unused LVDS backlight (lcd_bl), disabled lpi2c1 node, and unused
    LVDS pinctrl groups.
- Patches 2 & 3:
  - No changes.

Changes in v2:
- Patch 1:
  - Use specific panel part number (youritech,et050fw01-kt) instead of generic controller name.
  - Elaborate commit message with vendor description, panel resolution and dimensions.
- Patch 2:
  - Update compatible string and function names to match youritech,et050fw01-kt.
  - Fix commit subject formatting and commit message.
- Patch 3:
  - No changes.
- Patch 4:
  - Drop standalone SoM compatible entry from fsl.yaml (only bootable board combinations allowed).
  - Fix typo in commit message ("byteDEVKIT carrier board").
- Patch 5:
  - Update panel compatible string to youritech,et050fw01-kt.
  - Invert GT911 GPIO polarity to GPIO_ACTIVE_HIGH to fix address strapping and reset.
  - Assign pinctrl_usb2 to reg_usb2_vbus and add vbus-supply to usbotg2.
  - Add disable-over-current to usbotg1 and usbotg2.
  - Move panel reset GPIO into dedicated pinctrl_panel_reset group on panel@0.
  - Standardize Ethernet PHY node names to ethernet-phy@... and use tx-fifo-depth.
  - Replace underscores in pinctrl node names with hyphens.
  - Rename tca6418e node to generic gpio@34.
  - Consolidate devkit devicetrees into single imx93-bytedevkit.dts.

Frank Obergfell (5):
  dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
  drm/panel: ilitek-ili9806e: Add support for Youritech et050fw01-kt panel
  arm64: dts: freescale: imx93: Add MIPI DSI controller node
  dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
  arm64: dts: freescale: Add support for bytesatwork i.MX93

 Documentation/devicetree/bindings/arm/fsl.yaml                |   7 +
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml    |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml        |   4 +
 MAINTAINERS                                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile                        |   1 +
 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts            | 415 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi           | 185 +++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi                      |  34 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c            |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c             | 158 ++++++
 10 files changed, 816 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
