Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F73DD533;
	Tue,  6 Oct 2026 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281650; cv=none; b=kX0+SDK98xGjabh4gVtIQL0oQslABi7zcnEhOdqqMVoNFxQWpdvo8ogBiea46PnlY/IeoFliOsmgRnz02cQ7NoBUSor/KTQvnWLJqejf5L+arHZCVzkYbJ5+Jo2rqsqS0NmDlqA/ZGRBk5wgiCwOKC9r2F0RFqXEm2mjPg/QNgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281650; c=relaxed/simple;
	bh=z9iD+7Tx2AxBm1zWOh873HEWpljmnjIO14sA56qP0rg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DxX8H0NsOI4Lf58P4IqIx9Vwlcbg/WUK3gNYSVytKRZWMGtJ6zccUeb0M6ekRVAoiRO4oWJ6gGT9PzI/nApsxCp/fo4ehg7m5HwMHUQO7I6YlAQqxhupNFjRu5Y/yAm21zD0pSSoNbyaU1lLUH1adzAyYcm4wSfGR6n+LWJU8fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Zy0LPWj3; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Zy0LPWj3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=KS5H4193KPqxiaCispUvsgTKoX8n3WQynuhfM5yuyIY=; b=Zy0LPWj3mtgWSErT0qqoXqVVfT
	l5XrwcM4gaGoeW9YCHOY1cu8kftZrAu4dhS8YZIO3b1AY/qXHPUbiRbv4FlASRydv4e6+WQ1SdSnL
	Gwu6ou3+djiGOYlr6Oa+AYl8xlBcf7naK/4cyjKXdK+wvNh09QvrdN6yxtab1cNdjbveruy+YaPLu
	npr207A4ibK7lJWjGxw716g2uys2xFNhk3K5KjURKxPK0C84ziCJP2nwwnmIjUGX55cEPPrOaFCzD
	n4VV7u7GzS+n5VoI9oo/crDRiwyhoG9bxpMnM6UWPidm2SHAyNUuwO+cvMGLC8TYg3XSMk+jPRBkP
	xCFq5ABA==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2BP-000EyV-2o;
	Tue, 06 Oct 2026 12:14:04 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2Ar-000Bni-2a;
	Tue, 06 Oct 2026 12:14:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] arm64: dts: imx91-tqma9131-mba91xxca: remove pullup from CAN pins
Date: Tue,  6 Oct 2026 12:13:45 +0200
Message-ID: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Board has external PU, so internal PU are not needed.

Fixes: e71db39f0c7c ("arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA")

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
index 60d11a4573e3f..db1940ab5cee8 100644
--- a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
@@ -618,10 +618,10 @@ pinctrl_fec_phy: fecphygrp {
 	};
 
 	pinctrl_flexcan1: flexcan1grp {
-		fsl,pins = /* HYS | PU | FSEL_0 | DSE no drive */
-			   <MX91_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200>,
-			   /* PU | FSEL_3 | DSE X4 */
-			   <MX91_PAD_PDM_CLK__CAN1_TX			0x039e>;
+		fsl,pins = /* HYS | FSEL_0 | DSE no drive */
+			   <MX91_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1000>,
+			   /* FSEL_3 | DSE X4 */
+			   <MX91_PAD_PDM_CLK__CAN1_TX			0x019e>;
 	};
 
 	pinctrl_jtag: jtaggrp {
-- 
2.55.0

