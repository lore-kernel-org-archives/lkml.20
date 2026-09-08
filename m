Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21C9552946;
	Tue,  8 Sep 2026 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876002; cv=none; b=h7ewKw4ZaCl0Vdw6ssTVEjuI9jIx/24K8ba62PpmiPpP7wAIqV4xA07f1a1GccT4VYqB5m4BhsPLl+jaZb2TPC7PP+0Z/vvOns/0+13W3FsVAmcIGv88WeWq4Xk8YHqiZUY7QGcZjq/YpWzS/yrHjHmWWe5qI5sBrg710ZvYnuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876002; c=relaxed/simple;
	bh=1yrsw7EfCCl5e0HroSc21jsyrFqJNPeX7I/G6E+OrzI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dTM2lE1FpSH4xAfaz3ea4AR+GjRaku5lpGUXgOfBLu9faFUKMnG1Mxn4J3607wAqv9mglam4N7d3aUiLQPx4eh+wU0ffYV/gEkqa1021xxhfv11DLJFs37/bjFplM19AmFf8KHvcaVSPYjBtST8fxUCbNOtPggij5cYKmpbN/ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=ZekgHt6q; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="ZekgHt6q"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SWN1S1aR/SL8gM+eidiWKqzRizJ1TYpZGVJia38C4KQ=;
	b=ZekgHt6qZvc3TbotMpRzzcDvHOV7WjRhllv75UJy7QBiUUTcVY7zbaCa+98sAxSJfWB0ub
	I5v+nZ298lwRQHuVzYHR+dbG52A/hSmh9OrFobJifezgem/a70At5ibmZg++2LPFX7YqRC
	jtem+JbDREb0+WH6WuQllXPoGViSuWdIEUn9qG+4bTFMZuCN0yAAL7sjTEwAgqk/AYi4sh
	dnwFTrGNpLOQVnBIHEKZz+TqJZuOo4Agbk1hx5Pdel6guHQYSFmjD37vSk2emzO9GK+g3A
	fUfBByixo/oA25QAZ8vRjOzLJ3UDVGiWRFxHP7o1E1oY/ez1IlbIGfhaS3IlJw==
Subject: [PATCH 0/9] Misc Kontron i.MX DT improvements
Date: Tue, 08 Sep 2026 15:51:47 +0200
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrDIBBFrxJm3QFrQGuvUrpI4iSdgkYcI4GQu
 9e2q8+Dz3sHCGUmgXt3QKbKwmtscL10ML2GuBCybwxaaaOcuuGWpGQaAscFq0WNHHb0pU3Ka6V
 AsQi2nzZobD9r76wj00MTpkwz77/Y4/ln2cY3TeVbgPP8AHoUlUSOAAAA
X-Change-ID: 20260908-upstreaming-v7-2-imx-dt-improvements-08-26-673f2d979e63
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Eberhard Stoll <eberhard.stoll@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=1yrsw7EfCCl5e0HroSc21jsyrFqJNPeX7I/G6E+OrzI=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsO7vu4oNW63DXy/67W93M58n64aWubWMBuuV2+nHj
 2zL3TW5o5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCJHoxgZblu9TatQu8Ao8Tkz
 MLanL2V3/pQVyq+L3m1ke7yH/+6MPYwM+52m2zu/EDtzdN36gqP7Q6dbLZhRv6tzR6Lwr6fqzw5
 LcAIA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
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

