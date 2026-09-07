Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB6641DEDA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787595; cv=none; b=LbL/J6MUJ1JMSr747LUEsencz9Fddjy1XdZ2hjrRtZyHw9xd+8+WKKAoipBGHu7Za7nLvPdlHb1QFBJXPnaIVD4L4+MJA0Gmw4eEt9Ntt7QWyXKczVS5d+9I6/MvYENeby6cxF1c5IWbxtSccgRrwMP+9ENdK6N4W2d0Gv9afoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787595; c=relaxed/simple;
	bh=dHwT++cYO2vjpch/eavOet3q9OwenZlSdGnjWkH32QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T69YmtY2lyAGVoAXcL2B8O2lC5YrfHxXDkxkVh5foZKuzYxDLNS5bgPx+fsR8L2sQSs6CBJ3HBCQH9IFfg89LX6XZUiDJIbRvSZ3CUR1O+k47MmT9uSGxacBuwrvuKxaOwvSEy9zRJE0Bu40hiJ+RRj+Nk4qlylXadqyF/ZEZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=BOy3HlKC; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="BOy3HlKC"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c255c58156bso687281666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787589; x=1789392389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=flXIHxP55T3td3EAF+4UDOtvTJ+j4gzcSAMkRD2rGz8=;
        b=BOy3HlKCC/hVeNbesC3MhHYY77h/pe0TfAJekPkzccE4imx01JrueVKf18syXuEKXO
         d7soXQl9WTlXt3aYZDnlCkDK0pbfC+rZ8sCN2aMtwdtq6ZCOThe4RkEB94beN6XLEvZ6
         2g26FoN7Pb4Ih1cuUqXI9u619fA+s+OCtW6KOLu0uPf2oSAqRFBkhsWXyCwat/WIUF+e
         04BnzYbYZNNqrXblbh0qaAHCOb23n4babZ3yp2Z9RCV4cMWG0o/TXmay2t5bG5NJiwyW
         gNSTIPfVzhKcSdZML35FFPMEqHOBdxvq4lvNgp2zN67mUf7IKXtQX7sKqT06RWQ0uQY+
         i4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787589; x=1789392389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flXIHxP55T3td3EAF+4UDOtvTJ+j4gzcSAMkRD2rGz8=;
        b=eVaIkm7lcjfMdEQzb6Jo36dhuVshDOIwaSoJ+hqeQ07Dnlbc81d8wVmptIccJEpgb1
         OZIc54DouGQfYMwhISU5ui3PUC8cUvHinB+2WgVGhmKtpq2rsYah0lMi69AUko5MJEyV
         19+yk4juRFF5fSc1crA/IDsPngdo29x3BTNuF+NWUUzNxjVDoR7ZFhpBLtmZt4yjvLUC
         eR1gDzlKn2NCEvNKRBtkBAX/9vImR8bGidECjkevoaAGjZhH21lJS3HNqkkXRrUBhGEB
         LKGw9b0AovxwlrcoR1j77neWNqNp4n0nK4ZY4jjnJyafbFmXcL7AChbHEmlqgv5lkB/F
         ES0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwteFCDdFNR3dtfxAA9G9dzwB/8BZuqjLaT44yB8D2NNb3pCJfBcxESnlLhVEfXozFhT5FKFfpcMgvUoBg=@vger.kernel.org
X-Gm-Message-State: AFuF++n2GdpR+1ybuxRV4uHMT1DtX5iHUIgmGujR2HXu2qnTGj0pirAX
	IzhwIY5KczwAiz0aCxXG2hkfhWaRMHmdOXkQsldBads1P04u0geIhOlREvGGmyWwVGg=
X-Gm-Gg: AYBFou2KENOIPitI23iYhdnLT3YfOfq0TmL3YuQvHbkdGZ9+f6Cz/nKmmLVBYR3uy8E
	jjza5i1vGiHYZB5uGRF0P3FVbqc878/X6cJ/7sfBCJnF0hoUZG2hQ1lPAT0/zxV4d4BctTmARHE
	WBb0VEMWAD6fb5OKl3ujvhqaiwpUE/m+t5Oa0zxVl5LQV2cIX0pLxsanYXB5Ag8i57GN/Kst+jg
	4ipVejEzK2LrTEksyRaEdoTHJ3iriCsBWGJh9t9b8ayy/daYYd2qhea6ku3ruaTQACJ231cNoM5
	15ittZRIDZ+lIJG3kDb0At/BPrXBtg96MtfelHV+Ma322Q4fAghUg9bZ/HPkmxAyNooF1Cmvz47
	34MEvzLYosUShJQz8fyStZkc2GvIKsBxjvl9geBsz9/kEFl+ie7MXYThzDS/dqBVngThSCyNvDv
	GnAZowtcm3qnz+4FpvaR0XQ7E/LwH5hHnbN4/pYoAwfIEZTLYRBD94smMd8QyJ+DrqZuIAMpfCd
	UDUcwGM6q/XAg46DUmcWR7Az0pONGFeHlJ+4Lqm3gQGsE7VNzNlccNSwVisvDY09h9r/6pJPriv
	52jy+x9iLM0SjDDXe+1ACFXEhn3TQ4KoDhHbUw==
X-Received: by 2002:a17:907:198d:b0:c29:5b1:d530 with SMTP id a640c23a62f3a-c2905b24a92mr30863966b.15.1788787589057;
        Mon, 07 Sep 2026 06:26:29 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:28 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 0/6] mmc: sdhci-of-at91: add LAN969x support
Date: Mon,  7 Sep 2026 15:25:28 +0200
Message-ID: <20260907132617.1198548-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the two SDMMC controllers in the Microchip
LAN969x family. It also enables the onboard QSPI NOR and eMMC storage on
the EV23X71A evaluation board.

The LAN969x SDMMC controller uses the same internally generated base clock
layout as SAM9X60. However, gating its clocks during runtime suspend leaves
the controller unable to complete software resets or stabilise its internal
clock. Add a generic SoC data option for keeping clocks enabled, while
keeping capability and preset restoration independent from clock
enablement. LAN969x then selects this option through its match data.

Describe both controllers using the fabric clock for the bus interface and
their respective generated clocks for the controller core. Use clock rates
suitable for the supported SD and eMMC modes, including 8-bit eMMC DDR on
the EV23X71A.

The QSPI enablement is retained from v1 so both onboard non-volatile
storage devices are described by this series.

Tested on LAN969x hardware with an 8-bit eMMC operating in DDR mode.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Changes in v2:
* Add driver support for the LAN969x SDMMC controller.
* Add a preparatory option for controllers that must keep clocks enabled.
* Restore capabilities and presets without unbalancing clock enable counts.
* Use the fabric clock for the SDMMC bus interface clock.
* Configure SDMMC1 with an exact 50 MHz generated clock.
* Keep the SDMMC nodes ordered by unit address.
* Remove the unnecessary maximum-frequency property.
* Retain Conor Dooley's Acked-by on the binding patch.
* Rebase onto next-20260904.

Robert Marko (6):
  dt-bindings: mmc: atmel,sama5d2-sdhci: add LAN969x compatible
  mmc: sdhci-of-at91: add option to keep clocks enabled
  mmc: sdhci-of-at91: add LAN969x support
  arm64: dts: microchip: lan969x: add SDMMC nodes
  arm64: dts: microchip: ev23x71a: enable QSPI
  arm64: dts: microchip: ev23x71a: enable eMMC

 .../bindings/mmc/atmel,sama5d2-sdhci.yaml     |  1 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi    | 24 ++++++++++
 .../boot/dts/microchip/lan9696-ev23x71a.dts   | 25 ++++++++++
 drivers/mmc/host/sdhci-of-at91.c              | 47 ++++++++++++-------
 4 files changed, 81 insertions(+), 16 deletions(-)

-- 
2.55.0
