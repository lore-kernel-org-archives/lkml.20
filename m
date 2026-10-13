Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91E54EB85C;
	Tue, 13 Oct 2026 11:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890272; cv=none; b=ey5a+EsMxaePAity+HL7lfXKz/RdUWCawvJhQAJ9+77qqPp2iHWMLXKTHorZReU0XeRGj4DKWvrz+q0nv90zNBkVRBabm8Z2b2pGUJnGJeJxEz1a9Qs0+h1wec3UEauM0nyK7yJJ7kLI3FQ6snIvzDGvEDoTFVx9XyvgMm1ykRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890272; c=relaxed/simple;
	bh=Us5JQeyWAjeqkzjH07CkgrToUp8VEU6EHoilQK39GyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eL10PeHJ6o7ogUiY4FZNMz8z6RdRta0DPOgF0D3/G2kGGPASSjB0fhg+ANudha5lUglzDq5IRl/pm3IGciiAyXpGOQMul/EnLOBSgyuQfaL5mN7UtpLDc127n7aY99VxGUOMf3JqM6NGy9zXSimS7jw2i2Nu/Ict3q2wXhbk5yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=YAvubxDS; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YAvubxDS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=qOLekdNuUKzpmlNyvUEJ41eSHKcZqRHe2taebwYI0Go=; b=YAvubxDSLgMXQsRLVXATgjnTRu
	TeM+Df/7kbL3PpG9O/K1StvWDylRJiGYleSUQ7mv5zj5TnPw6e4ty6DGXxH2fS5M+Qh+gVbE+wkVa
	qayoGrFSvZ9JMvDdR8rBRIkjGXBWlz7dFa1j4yMulvo8Z+5NKMQNXAgMdPiqxdZyNFvjxB/Xiogbi
	T7KEhvuLEIPto301Kl97eXPQLEhIIApSd1gepYxrIketSCmcZJRj3MkGc6GBQ2EFXNHo+riRLfYfT
	lfQawsFTPNpkyjzkwdzMEDhdlQ5Ejo+t9dmx0OqwUEU/2rlwS6oCoZXzRTljXVOavCDg4ubeRhIEN
	HNwxwb9w==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGaVq-000OBb-1c;
	Tue, 13 Oct 2026 13:17:42 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGaVp-0005it-2s;
	Tue, 13 Oct 2026 13:17:41 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH 0/5] LVDS support for TQMa8Xx
Date: Tue, 13 Oct 2026 13:17:24 +0200
Message-ID: <20261013111737.998282-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28152/Tue Oct 13 08:26:14 2026)

Hi,

this series adds the LVDS support for TQMa8Xx on MBa8Xx. It is based on
next-20261012.

The first 3 patches are from an earlier v9 series from Liu Ying [1], with a
smallmodification in patch 3 (changes mentioned there).

Patches 4 and 5 add the overlay for LVDS support.

Thanks to Liu for providing the DT patches earlier on.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250414035028.1561475-17-victor.liu@nxp.com

Alexander Stein (2):
  arm64: dts: freescale: Add LVDS overlays for TQMa8Xx
  arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8Xx

Liu Ying (3):
  dt-bindings: firmware: imx: Add SCU controlled display pixel link
    nodes
  arm64: dts: imx8qxp: Add display controller subsystem
  arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems

 .../devicetree/bindings/firmware/fsl,scu.yaml |  20 +
 arch/arm64/boot/dts/freescale/Makefile        |  14 +
 .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 ++++++++++++++++
 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 240 ++++++++++
 .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 443 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   7 +-
 .../dts/freescale/mba8xx-lvds-g133han01.dtso  | 160 +++++++
 .../freescale/mba8xx-lvds0-tm070jvhg33.dtso   |  88 ++++
 .../freescale/mba8xx-lvds1-tm070jvhg33.dtso   |  88 ++++
 arch/arm64/boot/dts/freescale/mba8xx.dtsi     |  58 ++-
 10 files changed, 1522 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds-g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds0-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso

-- 
2.55.0

