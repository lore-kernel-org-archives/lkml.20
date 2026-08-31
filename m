Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE5038D3FD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180649; cv=none; b=YpW3oppypr03qQjPOLPXn2nvPRABxcxnuACuoypA3gdPAgP3LkZpLoPKKjwENy2BM0x1mK20JF0PaYDaVthWFxfavy0aM34jjFPtIfFvR5enyHI/mm7tsq4rUgof90UciRZ+W7rvcguBOCRgSDiDw9BlL7WlP5kIDtx07GirECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180649; c=relaxed/simple;
	bh=7ZfnDv/XtekNv1yVLAJXU7rSq3e0UdmAHM7woI/rUoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TuRNZvw4u3A0gKx1VZWRthwbQQedLqShSi9fXx+Ng14GzJmcIgZqLtV2Tnl4MA96a6Xl8ePbDS3qGRevSrFm5CNS5PEv0BxWJhNNwCg0PQEBg4XVnfoSJdhgaWCjuwel064OnjZJfNUbv+j+p6VpMsJCW7biX1rNzZU1omiWS+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4kVJVt/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4kVJVt/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso20079865e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180642; x=1788785442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTylV7csYnLWM1x8O3QnuC/IfF/z4HrLSIT7SMiMU7I=;
        b=r4kVJVt/NF7GjvezkY2scURSTxwoftn/LR8GPQqJgmWVtgyUow7DOt+zT2WFWIiE58
         v5zLEAziu8K78fZBwci2JHlTPncqVzqvKp2mOdGaGjW+7OumG5Gjv9rzK4GLelXB8dLN
         7YnZonEQhtcIVlmBt2GLoRwzGUDjR7TSE5Pqtpja8sa+jXdDwXVzSRQG958mv0V/7H+Y
         /9ObCv21MZm8DPPxWJp+w9hj5oGXiDr9o/gLFtbl6kihRNjQgGZsk28z0vZ056yCpn++
         3m6YMSVQL8n9rGseuGkRiIukkmMxO943JOvR6OiaCpcIGo/4w5FA54kZT6mjgOy72Q3z
         YUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180642; x=1788785442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTylV7csYnLWM1x8O3QnuC/IfF/z4HrLSIT7SMiMU7I=;
        b=LFWzxAioKbsmCPm9U0Hpiv+B0SIIZcyUwjtSLwXUUSQlRI88ayX7W7h8hKvcSxekvP
         bA0UiZpJYU38w3XC3kSMCwNIcm19GgNflHDFqTapFbQsR5Mr5dSeLBD5VrEiOt00Ou2X
         uTjO2lFfC2VMbAVjUyOUvxsl7I1QPnX/RaPXNtxMNNmgXvlRYhpqMQEWMtno0fpPNnQf
         pscVUEG5jaCntTybt70XnskNiWS5sMqsAMrktOccxjTsO+k/SzF2gwwIjTEEsp/S1LsJ
         gTpxzeFotBSL/DWXBYOFXFEgIOHFJxo6at8hpRlX6nP2EFEonVZanK8OSLO6tC47WAnK
         45ww==
X-Forwarded-Encrypted: i=1; AHgh+Rq7D9173bIHP7tksRm68y8BoTLFDdCNZHOmZL0XR48CS1Gmt07/R7zIfjEmFchA482Wtjg0RSI5Hb0aIJA=@vger.kernel.org
X-Gm-Message-State: AFuF++ljtEP1Gw54eAsxfDbmCX5DvYBTYD2ol2LHXJ3FdSBhvMsYb/ep
	LyJ1j02hEnljW/3nyQ71ZziQ9xY3ghmfdW1/k0cpXkBHZT53yXi4FASL
X-Gm-Gg: AR+sD11aNuTStFc9oSgLCHEWtl55MdRDCPykJokEAN787EoG55FF+wP9aA0HkVKeH/L
	aCyzY577Wql27EsBJsRlClY9N3GusqLos+XL7VzRBYat9XQxwrA3VYEqoMFo21zqOSsMbcpfwaA
	Tk3vczUm9pW8OOTA2zaX5NuObUOukpMBbbA9jCWhE9nuXM6hDEKJM8ct7CeJTXVU13NXLVw5EWH
	H1GA/puc06hI4m7v0JifLvfd2j2CgqHSzDOIT2XCEtxNus+sLsIQIXegdm2nu50vS0fiIQLEreA
	iGVUpgT77purjQEBtFdWUBRtTQlU9SWsJ6OSYG9CQVcKMPisQkbURSHMMHtlDBqfI3Pey0YPjq8
	kwibl7rIhE0elC4FonIekvQyynYTRg6h4EhtehFcbuFWg23zYpfrCQDZ7Qb7qB1+Z+Aoae1FBGf
	xgpaYrRJAORHhuEFMMz/qTR609S1cJPm+IhoqDvaNWR8dPl+v4y5hhqxf2HJGORUqsqWqELYxmR
	+DWlVg5ztyUvaqcqtiujs/N+Q==
X-Received: by 2002:a05:600c:354f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49b91c1ece1mr452067475e9.5.1788180641698;
        Mon, 31 Aug 2026 05:50:41 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm116571225e9.13.2026.08.31.05.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:50:41 -0700 (PDT)
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
Subject: [PATCH v7 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Mon, 31 Aug 2026 14:50:22 +0200
Message-ID: <cover.1788180142.git.stefano.r@variscite.com>
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

