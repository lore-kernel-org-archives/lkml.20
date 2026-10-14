Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BDE30ACF6;
	Wed, 14 Oct 2026 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962226; cv=none; b=cIe65RQSjlmxmS3HhZItFMDqPnPtrTxB4WnkVpOMz1R0rhWJYVFDdOdWBlvafLv8g9y/iVqh4ZDtcVqqkNUwM/+utOKh2P1ugnJXDQ5zzIJTwfh5Bt2qYleU5HqukEIOGuqpjnzNBq6XuE0p2GBOENPwEYm1a4R3SPLX8B8hAPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962226; c=relaxed/simple;
	bh=Fg8gyvoy3jRRrvIvR44fbqpfQ6eMu8ZXfIKi3vfYM+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gchl5x7pJN95ZvW+xrnsXsxMDAzAslqYSVjjTQ2Q4y5AFwH3pgFOSXGavC3Srg/27Q9qZl7+gsNaWe2LZ6dpFD6lLl+LwO7B6mN9a69+o9QMEfBtt5TagiSqei4oaUmWGKSXCcGHyrmqlB92TkgKAKHmVWxGmXgi0Y6y4Kypy/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=PxuCaLdX; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="PxuCaLdX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=eplPTkiE4sDdQM8FvyMuAfnnNDzbqvnoXWrVDTqjplg=; b=PxuCaLdXugHnB6CfZaiFo5Gpwv
	P8LEVo5ea4HYnuc9HNoqphKZ37pSQzoV/KQgAs6Qbgp1UBdU8kPprSHnu9obxWcM6TGLEe7r/0tH8
	Q3VGspuuBvub4r0YRERTyKdGdYDWEbObRvSXwtkRrK7VyI+aInG6CU4Mw2GBDWja60bAHBDjLoQUp
	xcx2ULuQfQoPNTNOsEUOH7moUt5iz8aH6gonRIdr8ocYnkmlVM9V+vaUdfjKR07AV7EVbkyKX490i
	lx7fNhZ22c6Wasq3GiEKqRgDhlF5xDzNd8Eoumim4xRb6XA48gBFEOllb3TvPZMZBJoPToXnLf6va
	M77jkIZw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGtET-000G9s-1s;
	Wed, 14 Oct 2026 09:17:01 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGtES-000AF0-37;
	Wed, 14 Oct 2026 09:17:01 +0200
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
Subject: [PATCH v2 0/5] LVDS support for TQMa8Xx
Date: Wed, 14 Oct 2026 09:16:44 +0200
Message-ID: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
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

Changes in v2 include fixes to Sashiko findings. The changelog is in
the individual patches.

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
 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 244 ++++++++++
 .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 443 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   7 +-
 .../dts/freescale/mba8xx-lvds-g133han01.dtso  | 160 +++++++
 .../freescale/mba8xx-lvds0-tm070jvhg33.dtso   |  88 ++++
 .../freescale/mba8xx-lvds1-tm070jvhg33.dtso   |  88 ++++
 arch/arm64/boot/dts/freescale/mba8xx.dtsi     |  58 ++-
 10 files changed, 1526 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds-g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds0-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso

-- 
2.55.0

