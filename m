Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E503C062F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216938; cv=none; b=WXz83z2Zs4z0/PAm14evb150KZ+ubO+2yNr0Hhg6CTCiYNm8JhLip63zqHuAMHhbrhCkKXZ/Y8m2z/4eHGOfu9oPxvbygBDKX7HqLHtVUx6L9CeZFz5VSnz56P4SOMwP89TpgTtbG/Xb39ra7ZESeMAJiu0SGls0IDt2TGyMdJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216938; c=relaxed/simple;
	bh=WtJVD2iK5o1Lc1dt5b26jeR027bI01ZPZnTWx/wR+Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M2cPgksMAwrtGyTnChJREEtB7r5vme60CH0qmH8c99jx44zncWyNSm2cP0FPhGgsBfm3EjvbJA+Z2FTDRQ1Dyguw1i1Gev0Yt67//lFwvuXnY3KVep4arLXEpGmD+LH2Km4lO0zbKGMpUcul9jEgFw9EuvhP2j9gZNx3UezuCdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzLvqxy9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzLvqxy9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495590dde14so40691675e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788216935; x=1788821735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+ViYFK6cZ5RDnEJVte/faPIBmDF3fgsQUkS20n29yE=;
        b=PzLvqxy99khyQT8UMXcMxgLjVG0xr/u/97yDxFMLd8dOv3aaFQuFRE+ZBur8zf5RQ/
         7pqodILLRz/bcQ3uzGQ/rEchO7vOV7sswRav5MlBOhXpnh6C/0SrkSQRnOEgYKcP8QQ3
         nnoDo5oA0zxIZSZESCRCbSqQDq9tY+FX2WdaWYx6Y0v3tnEiYNj9OI564kv4dFJevlMF
         7c45znBGsq+dlQ8dpPWkUcx59o52Fcdn40DEb09kcmXel40Xf3miP+zypi188CAnDZ6J
         mVG635/MkQZeTFOJ4GwQ9wTTQKPXD5Z02whPceUhLIqaqyQAuzS8bjIZiHPwODqqg/Bq
         Nh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788216935; x=1788821735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+ViYFK6cZ5RDnEJVte/faPIBmDF3fgsQUkS20n29yE=;
        b=lbhbwEobiPhiX3Gn/sIgTqfogay69/7jP+Cx3JPS6vMB6PYL4U7OYc0Vwf5/lAkTnV
         7CCDBvr9gFRhi/Ghqpc7xvRVuCm7pc9zO5N5+33bfPBXKhNG9gVWgfknWPeiJLqDGUxI
         BvTtoUkaYqcd+Mrp4EpbVtrFLuVG7xFGviWcaIxRiu93lT0QZGErWFDfpH1bDsAcyQgf
         LStPFV4WKlB4Y1MQGY1/lUgnNyPVHu/TdNQ3irADdnKsjxZHHurpd/XaYPsOo0eKHPOb
         yFe/C1svOjuH8hNPXGjmlzEfsOBYEw+lb0tuK+LgfxXs4ScCoDNrO897ghA8ZS+/D1TA
         ajfw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/amJuAJKHpCDpdwCFtwn0qw8yrzMfUsVuje00VYpVloldc2xaGrKMkr0M1dfW3mRwjU8rS229MAsuuBI=@vger.kernel.org
X-Gm-Message-State: AFuF++kjADHdaRQ046HKSb3DrZrpMMKUKUJ/kM0iwQCt2HSeezCdsXFZ
	3rbkf/dAkX7KeHaFjYYUOcMJB+6Nhn8HkEwxp6Cvt0OgP3dovURNGjrQ
X-Gm-Gg: AR+sD12286AXylr0Dt8fz7FkVcPey6EQyLrz+DSGzlboh8t2jAnt1EC4aXdU0IAiJ1C
	TMzQrr+RhZEWaZwpHHepOudtr0gTnmCqfGCCo+NlQ2g3ik58VsIJRxkvECbGr/DcdzKmVrzJjCV
	vKqn8Mp92/zzZi10DxpIeoPYz5fLnbmGG37kYxYiZ8+L1jJ1Zw1JDWCrNaVstsqbRvnLc+Cg8mq
	VlflNyDSV8WDZGcIk4ZUunqo8ANZgmw3nfN7mWYASyzhmUTz1+LzT/HzdHGcXsXMpZVY1XduGTf
	nEJgxJcUUsJNHD1jZz9fntUGjE6vKGX0fX3HqtIXjhaN2kHJDzIrdxu62jYAEODeS+QeC9SrgVB
	KPy9VJ7qAjTNKN3UEDaiy2CHNLzogeWd9wDVfKY5YEGrUkhJgUztqkPMZalZqQqWxCFfuLvSsTc
	i3R1aVEigb0x6Q4Vds62Xz0lbJRuhPz0BtVIAhdDamlm5of/T1cwr56T1iIp0TNkg0uLBVqDo5+
	6t2IOu0/di1Ny+E7CK7gu+yVA==
X-Received: by 2002:a05:600c:3b13:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-49cdc4332d4mr66819045e9.7.1788216934602;
        Mon, 31 Aug 2026 15:55:34 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm24452615e9.4.2026.08.31.15.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:55:33 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v8 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Tue,  1 Sep 2026 00:55:17 +0200
Message-ID: <cover.1788184274.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX7 system on
module and the MX7CustomBoard carrier board.

The series includes:

- DT bindings for the supported VAR-SOM-MX7 board configurations
- VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
- MX7CustomBoard carrier board support
- eMMC and NAND storage variants
- optional WM8731 audio codec support

The implementation follows the standard SOM + carrier board pattern,
where the common SOM dtsi contains the on-module peripherals and
hardware revision differences, while the MX7CustomBoard dtsi contains
the carrier-specific interfaces.

The final board device trees combine the supported VAR-SOM-MX7
configurations with the MX7CustomBoard carrier board.

v7->v8:
 - Fixed commit message adding wm8904

v6->v7:
 - Added common dtsi for wm8904 codec removing it from base dtsi
 - Spacing cleanup

v5->v6:
 - Removed unused 100mhz and 200mhz pinctrl

v4->v5:
 - Removed wrong gpio-hog

v3->v4:
 - Fixed non-generic names and wrong separators
 - Fixed ads7846_ts pendown gpio

v2->v3:
 - Removed wrong header in dtsi
 - Fixed pinctrl name
 - Fixed sai clocks

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio property
 - Added disable-over-current property in usb nodes
 - Fixed model names

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  23 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  56 ++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 358 ++++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  23 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 +++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  24 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  24 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 +++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     | 102 ++++
 .../dts/nxp/imx/imx7d-var-som-wm8904.dtsi     | 118 ++++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 533 ++++++++++++++++++
 15 files changed, 1469 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3

