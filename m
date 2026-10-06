Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED583DDAF5;
	Tue,  6 Oct 2026 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281649; cv=none; b=nbU47Nhj+Jq78HXRLErFWAtucQ/a3ehMx+GEfPm7YNtNpI+OJgx5E+zDrwLocxJHHhicIU8W9QydIKPr0H/xX21x0rtUyi+XCLMk1zujTprDN2aIb5phBzPFelD6+BPBCLD33l57g9H7sFMXphkfhThILyzKj+x1kOjxIGWB5Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281649; c=relaxed/simple;
	bh=JU4S6f+VTPLSmecQszCMKDptqNqxDrvqGo4PW04BKhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xl+Lf8Aptkgvq7fZWRFcpmM2DgDHf6B9kxws8tlScenCL+HcxuNc2DjuPBnwv/LQ5zNK30ZUqumWx6i1gNoA9UciegMQnWu6tW9PPs1q6708Cr7WD5NCFI0AkB68DiPTdro5Es0/oy5jacNhEZd/zS6R8xvoPXph1xpcbq80FlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=YmP1+h5u; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YmP1+h5u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fBX7y9Dvx0JYFE1OtZUYqD4Au/PXvpJQYPvyzoWixqg=; b=YmP1+h5uPnQbsxlOVLIkoJG3vb
	ABj8pZSxFtSUGaBDfRj+NxJeisIc+dx5vTTF3nDFXMscpUvBZfZLQZzevCIAsag0zsZOthBDhZSQV
	EKjo6+wiBZUk507NL4D5uLIFR7wDZfcT+/chXKxb8GwLArLIWdCFj+wId/HYi5rc7fZZ2isS+309G
	DlCFwtE31jCD6eHNvti0FsRoRpgWbjwShDgHjNU+D9CmrvNu7Ta2c9RMA3YHX1IvuLm+QZuzwenGI
	CjnVIXW+ymmnrR6fL/DOBjEQ9yn4RIeDnWkwZBZbI5BtzoFREAhDF2IrOoIAAUj1S9Xryrq+QWr2y
	9bK3P6Lg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2BR-000EzG-3D;
	Tue, 06 Oct 2026 12:14:06 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2Au-000Bni-05;
	Tue, 06 Oct 2026 12:14:05 +0200
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
Subject: [PATCH 5/6] arm64: dts: imx93-tqma9352-mba93xxla-mini: remove pullup from CAN pins
Date: Tue,  6 Oct 2026 12:13:49 +0200
Message-ID: <20261006101358.2189639-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
References: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
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

Fixes: 20288505481c ("arm64: dts: freescale: add initial device tree for TQMa93xx/MBa93xxLA-MINI")

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx93-tqma9352-mba93xxla-mini.dts  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
index 0d553a8da7135..d1f63aa9312ee 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
@@ -477,17 +477,17 @@ pinctrl_fec_phy: fecphygrp {
 	};
 
 	pinctrl_flexcan1: flexcan1grp {
-		fsl,pins = /* HYS | PU | FSEL_0 | DSE no drive */
-			   <MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200>,
-			   /* PU | FSEL_3 | DSE X4 */
-			   <MX93_PAD_PDM_CLK__CAN1_TX			0x039e>;
+		fsl,pins = /* HYS | FSEL_0 | DSE no drive */
+			   <MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1000>,
+			   /* FSEL_3 | DSE X4 */
+			   <MX93_PAD_PDM_CLK__CAN1_TX			0x019e>;
 	};
 
 	pinctrl_flexcan2: flexcan2grp {
-		fsl,pins = /* HYS | PU | FSEL_0 | DSE no drive */
-			   <MX93_PAD_GPIO_IO27__CAN2_RX			0x1200>,
-			   /* PU | FSEL_3 | DSE X4 */
-			   <MX93_PAD_GPIO_IO25__CAN2_TX			0x039e>;
+		fsl,pins = /* HYS FSEL_0 | DSE no drive */
+			   <MX93_PAD_GPIO_IO27__CAN2_RX			0x1000>,
+			   /* FSEL_3 | DSE X4 */
+			   <MX93_PAD_GPIO_IO25__CAN2_TX			0x019e>;
 	};
 
 	pinctrl_gpio2: gpio2grp {
-- 
2.55.0

