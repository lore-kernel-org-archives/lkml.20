Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9904EFFA2;
	Tue, 13 Oct 2026 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892307; cv=none; b=FnCRH0ZVYNUqgTCro3TJe36FHuH4mT7YXcXcBGAB5Tl65RpS8H5mQXH5rDJsupLuSg4Sx/6A89D0Vhn34DL/9I/y0gwtOhQHy/nxKex+0OoTNIFo/nJKLvo87EZ4JLoBJZELotnLKQv7n8dYTthYnw2AxGgGz9s0wSc/H3vGEgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892307; c=relaxed/simple;
	bh=JvAKBjpK4xKoAwy4jAjV8i0/BfGk7/Se2e8aQ/KOSFU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JFSPL9iIK8yMOnt3FLDB6Hv5SNymsuICi004llRcZChnU2NPG9nqEurFmVL3N01sYd/xt1F0TpyhbqcMTUEyZD+axmpPcM0M2n88yuGvo2+3kIcYpjT9txsJaJ7O1KyUihQ9Qy+RYeWRkNOxZui6ISOSN8o/uLFlLtVJdQtT708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=iMAXLYx+; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="iMAXLYx+"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yoPjZhSb5KCkFLQNsq/AfOKK0PfeyPWC0RufbhGAvcQ=;
	b=iMAXLYx+W9TX6mfZ9fJ+HFfO/H5ZJiR9CYcixlwqqr/AfDAlL8WWScEMhHX0GrJclPyeRF
	/AOBpXQi5CjkYOGoYG6GsKPa6pH7leOtT/N3o1iDE/XB4BEG6fIs1Wk087awOKFs/BfECd
	b6Oin0AUvHZ/3DO4pBnOfnudNiRq1OcX2ySvy4vS70p0z1lho+ZDG3HMbt5LZTkVrrVR6v
	V2HRw5a6iCptHr67RFPpMb9rHOUXok/7hNVphq0XgqIe3gBz8/9I8k/eiA0ljk354nuZDm
	I5TVoav40Dzn8ipijtXBnKtl0WZAPJyhFwQTm1mg9P2qXp2jcWU29ARzaPavnw==
Subject: [PATCH v2 0/9] arm64: dts: Kontron i.MX OSM GPIO Label Fixes
Date: Tue, 13 Oct 2026 13:51:05 +0200
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6DIBBFr2JYdxpAJbGr3sO4UBx0WgsG0LQx3
 r1oL9Dly/95b2MBPWFgt2xjHlcK5GwCecmYHls7IFCfmEkuleAih2UO0WP7IjvAMJODqe1wAkN
 vDKCMUboQpVZ5x5Ji9ngOyVA3Pw5L90AdD+fxGClE5z9nfxXH78/UKoBDVRheoS4lR3N/Ohu9s
 9ceWbPv+xf4tXT52wAAAA==
X-Change-ID: 20261013-upstreaming-gpio-label-fixes-6ff6c415c63b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=2618;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=JvAKBjpK4xKoAwy4jAjV8i0/BfGk7/Se2e8aQ/KOSFU=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctOOPft9HmzIZLggvzihuuJp20+3vCb3jQj5fX/0/z
 neKW3xCRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwERupDAy7Mw+d9dnFlPo4Q9f
 JSNP5D18HKRY9zE3Ye2W5ZlTJ2fHr2P473b8x5bZHCaHVr+WXea5SDJu8/b1L++omp2+nlI0Yf0
 8d1YA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

The OSM spec [1] clearly names all pads and GPIO labels should match
the spec in order to have unified names across all boards. The intial
board support uses different labels for some pads and contains bugs.

Fix these to provide the correct labels the user expects from the
documentation. This invalidates some previously used incorrect label
names.

[1] https://sget.org/standards/osm/

---
Changes in v2:
- Also fix overrides of gpio-line-names in board devicetrees (reported by Sashiko)
- Add a patch to fix the i.MX8MP DL overlay using the wrong GPIO for panel-stby-hog
- Link to v1: https://patch.msgid.link/20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Eberhard Stoll (5):
      arm64: dts: imx8mp-kontron: Fix GPIO label assignments
      arm64: dts: imx8mp-kontron: Fix GPIO labels according to OSM spec
      arm64: dts: imx8mp-kontron: Remove obsolete VDD_CARRIER regulator
      arm64: dts: imx8mm-kontron: Fix wrong label for SPI_A_SDI_(IO0) pad
      arm64: dts: imx8mm-kontron: Fix GPIO label for PCIe_SM_ALERT#

Frieder Schrempf (4):
      arm64: dts: imx8mp-kontron: Fix GPIO for DL panel standby signal
      arm64: dts: imx93-kontron: Fix ETH_B_TXD GPIO labels
      arm64: dts: imx93-kontron: Fix UART RTS/CTS pad names
      arm64: dts: imx93-kontron: Fix GPIO labels according to OSM spec

 .../boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts |  2 +-
 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   |  6 +-
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts | 43 ++++++-----
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      | 25 +++----
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   | 84 +++++++++-------------
 .../boot/dts/freescale/imx8mp-kontron-smarc.dtsi   | 75 ++++++++++---------
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 41 ++++++-----
 7 files changed, 135 insertions(+), 141 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261013-upstreaming-gpio-label-fixes-6ff6c415c63b

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>

