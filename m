Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384789;
	b=n/Ysvoo6rhbOWRiIjEs2cGNCi6yjY2Oo7iSb6VMoyCXt1EZ2U1wPOMKlFfB6xQYF2BTB
	 dbiwm5pGzoQKv7DfJCf1SqYhbAc29dOmsRga1bzXJxbifzHZBeJCgyzOS2oda/CvotpLo
	 qCe0rs/oFER7T0PmVvs+Oaz4SiLIHfBJ82AMciEzgWpVH1p0rEUAs57UQcxMu8gxdeq1j
	 3pD8rwBtVSglFdbttdsFEa4H3svFJujq/rS6Aob59btJzK8wk3fs9FD9ZgmwOnmUOUrUl
	 ebiuxIivj1pvSk9sOYf934DrRAhjh6bBbHlnsvGdA92WEtDQG2vNMx0aWXC9YM7DTiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=;
	b=VvuGpcUX7zmaA/7Fxa0EhheVNHE0VZLscJW4b9jEZXWdTbEYDDAzjRRU04Kgke/k6wJ5
	 Ka3WMdRMY+82n4XMC6tof1vfu1wzD7y/ZJCeulZG8Bl5wYKOKeeRuODzJ6EVLW+RQSiGN
	 Hg1b4e/tMk//+SG3c3J2dONRE82j4tmXdr614IjgQFftyAxGc4S1T3DUnsorLtHr+8qZB
	 zo0VjvPRiTzpbSkVuZ4xIAAlwjcdUXfdlvCo7eYDqPq6Dn73XTiOFGqr3IltWIwFLeWYH
	 4mHVwS9k+e1MRMudStAdmozadv62Yo7ry5vc95Tl+few6JIaNc5QepLddU/ZlUqcnDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=W7W7gQZe;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645FF606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645FF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=W7W7gQZe
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so30923125e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384786; x=1794989586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=;
        b=W7W7gQZehSxwutldfgIWtGbi91FuCNPbLxVzT8JuXWUrgGR27Tx7jNB+qaa9smDctL
         dwsnNfGMWtnvf3TQ/MWBAkDBWHGC2g1tbHohVXrpxZ92X4xYD1tcTWQfqf4n8l8i4gbc
         LoDr0BCEaJvsS8fkdzjEy07gyEO4KnF7XH36jPLE4Zo16FtU8Od9E0nWTEpxmug2yNmu
         IDR12P4xdA5sHGBbWotJX5+EqH11ojjDR5N+oRG2Du3W2YgjzqV4KzIXR9MEHTfjZ6t0
         hNsCcCXOG8o1IaoM538yBmv8VH0JDKoS8TnmnoutijCFdSxq7wZ6xlFCbAHCRYrwLvJU
         ZfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384786; x=1794989586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6d9NY4/sGebTASwnIbgSwLkcj0rsBaL9wxhXAF9kunQ=;
        b=eYEJUM+vi0BWHCSe4ca5Z4kAu09FituWKmSOf0NiRoilgOIyxSmL8tHMvkQzJTBDnM
         8y1B3MlFXUee588k3xkcD6eGThRxUY8rjbxzbw1m7w42Dr0Itw8iYgdN2trtI3gm4Tmu
         7m2WrFfhgT9ANFdxOU8IGSWhTMgrv6+/lUAVwbZkIEZ4s5JK6X3alYL24dO57tcB3ZtB
         jnECcUWp5nTybSHAYM0pORxzaCABJOiVCjMx5xTz8Wzde5EWowe1Da7GQJsGKPMZI5p/
         374yfupLTNDOG8AajWpTxTeEoGXKdCpiq6qfUMXxXmtsyynZsovYRN/BIPzNkwYEOsWV
         QSnQ==
X-Forwarded-Encrypted: i=1; AL+hErGI+btL3FT7EUcWpwD39iz0+vYdbFljcuXcELrNnIOEfR8FbXudOmzZCDz0EfF4H0ts6iulAOYMciJeJkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mIxpieT8Z0HmjPWcShvzPxCt0ivaFweaI0MO968ayCr4CF+rh
	ZUOPP2FgjiRrxrEo94go9i7uipA/iIC7EwfWk2wZFNtOZqzAKJyk3U6r13a2JByyrE4=
X-Gm-Gg: AYBFou3ZQDX/CAj7M+5qx38GHYz5S3n3oHHmpEEPpYT3cbcKcoapsux6eJjDfuRDrGQ
	t7Ox86Su6cDvOsYAUjz/6b8RmtuXYfKlx5zfJcSHHNUeY0tkYtqvdvyR4ePjJxCukrZ9IVJeV6L
	5IRtchV+FkGT1bTP0kq9EH2TrF1fQROpBq3TSlYqut2ilWwKQM19EW6xXm+rSj5o1xD5xGsNCft
	RyrAaq9Wz9WJC/S46mJ8R1KRDSaRRMmyKrcV3gti5Mo5ewL6XZuo+co/7R5rUF00QEfhh1+wPYi
	4kafPl5HQ3+v8PGriJ0JpxnmdNwvyONVl2L+CfU9OMyBUhYEjCtC+KouS92Psb2Fva44qfgbccl
	WdNaowtk7TuGIvaj8fuhhstxE1oaK4eanTYb1yx/pG1GJnrd9/o4LgjYF91+IqCpEHBiADnYr2g
	EtFmrWrAdQEG4npMtUBhDwmuT56ZnxbJ7kTKrfIdrOBEjNohnYordT1yBbTabDBU2DVoiEA2KYS
	ZlumjVUrqjSiWHJXHOY6wxV/LImFDjxeuSIzD6ruM9A4QezkKfJYg3964XMykgeTIRMdNp+l7un
	DRFrT8NcLpoO3aPQuHY6OFpe8z844xDJWoAZW0vPaG7Hestyh1uI8pmRBFmVrt7VHkEAb6DJtrl
	u1ijw+9INYg==
X-Received: by 2002:a05:600c:6214:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4ba0939815cmr24681275e9.34.1794384786446;
        Wed, 11 Nov 2026 00:13:06 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:05 -0800 (PST)
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
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: freescale: Add support for bytesatwork byteDEVKIT i.MX93
Date: Wed, 11 Nov 2026 09:11:45 +0100
Message-ID: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
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
 MAINTAINERS                                                   |   7 +
 arch/arm64/boot/dts/freescale/Makefile                        |   1 +
 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts            | 449 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi           | 199 ++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi                      |  34 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c            |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c             | 158 ++++++
 10 files changed, 863 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
