Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13104734EC;
	Mon, 14 Sep 2026 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393625; cv=none; b=Iydu+KAJijxRLiKHt9KY3U3LkqaTLbxPgaVEZfOcveYiC0MyPm+yY7x3NS6rokOpW2TsEnEHeA1FjE3a3ju+oONg0Bqu1ea+vW1bl18vQKzQaLXV722Rgl1yr7W1PbxfdNk2oAgPy/+uGLPc4bqxPJl22mTeVVJe80dlGUUcB84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393625; c=relaxed/simple;
	bh=HhKaOp+p3KwfCAFbogop7pZiTI++nVe1i/l8LRcwlhI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dRMC6CYI+ZZIoWQzFAyiuOqSrnPVx6JBlz+RVlZX6MpHnGPwvfFRlfPwqJU9E7zGyIdUmf9p9DIwsko1a1SjLF4SCMnbyy+Q/20rrj4jtbYM4/K5h0ZHIqy/8Q8IcnLS1oZ4lhrkv+YpA/6ly6xmQh36JVVzi5QCQiAAKrX0LAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=EClNtoXU; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="EClNtoXU"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eUarJMGDCqEqgZdWHNd0rs5//gAl4YBmb9tU/Vt4LlY=;
	b=EClNtoXUYcXzDih0sdO1e952pojjjB1DfG78s/IGdSmmcoO8KyEl3EUX57/Uc+pp1A6i44
	P0jnaLqmrfh6/HLmufF5tWngrDl9t2lUflbiCxdVs+bvFsGdLBKa5E2o+BTMvqx2EiD92r
	7yBYkxY/kHF6DJZqOQP8FwV6VX2AqHaoGt2gZpcbKSBB23QAaVWP4Qzyz4vTHqDY+Zc2nb
	OGzr/770DQrY1SFkAGx/LGeC7OBzuaUNEW5zaYCNtcvUxnONolA+CBCo8Zb7/v1Rg1hGHJ
	UEHogQxBGKFOc1UqqE/xFAC27E1tX2VThFH+yZoSfQbomFeqWS5L88HtAjj7zw==
Subject: [PATCH v2 0/9] Misc Kontron i.MX DT improvements
Date: Mon, 14 Sep 2026 15:46:08 +0200
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OQQ6CMBBFr0K6dkwt2oIr72FYAB1gNLSkLQ2Gc
 HcL3sDV5CUv/83KPDpCz+7ZyhxG8mRNAnHKWDvUpkcgnZgJLiQveQHz5IPDeiTTQ1QggMYFdEh
 ncjbiiCZ4SJ6QIFXeCV2qEmXO0uDksKPliD2rH/u5eWEb9sJuDOSDdZ/jm3jZvb/C8QIcrppjU
 aubblT5eFsTnDVnjazatu0Lja3ImfcAAAA=
X-Change-ID: 20260908-upstreaming-v7-2-imx-dt-improvements-08-26-673f2d979e63
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eberhard Stoll <eberhard.stoll@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=HhKaOp+p3KwfCAFbogop7pZiTI++nVe1i/l8LRcwlhI=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r63ubrdvpivce9KoeCtILcgxvyF8xlVJKaugkJT3l
 QtWv+foKGVhEONikBVTZJHit3htaxbrI3+sOgpmDisTyBAGLk4BmIiDN8P/7O+FvDEHt5+TFFkv
 KugZf4p/RmT3ojglhUtXDsUked6Yw8jQ/O3xbbPVrN51px992HOS95GY8teaHSfiTRfIylquymr
 iBQA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

Changes in v2:
- Patch 1 and 8: Improve commit message (Frank)
- Link to v1: https://patch.msgid.link/20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de

---
Eberhard Stoll (1):
      ARM: dts: imx6ul-kontron-bl-common: Replace UART3 with DIP switch GPIOs

Frieder Schrempf (2):
      arm64: dts: imx93-kontron: Adjust GPIO4_IO29 usage
      arm64: dts: imx8mm-kontron: Describe the ethernet PHY LEDs

Oualid Derouiche (6):
      ARM: dts: imx6ul-kontron-bl-common: Add GPIO labels
      ARM: dts: imx6ul-kontron-bl-common: Fix USB OTG1 ID pin configuration
      arm64: dts: imx93-kontron: Make USB-C connector "device-only"
      arm64: dts: imx8mm-kontron: Add GPIO labels and comments
      arm64: dts: imx8mm-kontron: Add SPI EERAM on BL device
      arm64: dts: imx8mp-kontron: Fix LVDS clock frequency for DL device

 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |  38 +++++---
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 107 ++++++++++++++++-----
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      |  11 +++
 .../boot/dts/freescale/imx93-kontron-bl-osm-s.dts  |   6 +-
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |  32 +-----
 5 files changed, 117 insertions(+), 77 deletions(-)
---
base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
change-id: 20260908-upstreaming-v7-2-imx-dt-improvements-08-26-673f2d979e63

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>

