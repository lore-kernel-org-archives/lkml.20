Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A033DD87B;
	Tue,  6 Oct 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281649; cv=none; b=aLjDKTtn9MgSqiHeOjOJv2PHSBZaPYjqyhrrxERkR7aPYWmL0jwU4TS1AGzYcAWjUbSjIn3+8GVzmiPF1g0jJvNc8VNo1ubxrPkcFNcFMpVP3erYbGQL+ylLtb/wCK+QO8PfIJTqI5XXE77nyvgFqz99vJ5DgunnZva5pYwPOjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281649; c=relaxed/simple;
	bh=bCv6PrGwJg+1PlPAniwOQwGoXEd1Tel27j+s5lck5IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKCrUhPh5IYJLvHHboyzQXbI7GWS+ydftEUv7H324WRNlQYbHB5w+a0qjxVDFHl80DGQxEZcRA7xCXXxuSqJK6+vkT+rH79HDNBkNjX7aoArucyCE0uYEblU3LJdDRCHmIHrmC2yXFZyXfn82bt1gipn3JjfRA4G7nB9pvtrSiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=o2XngMi4; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="o2XngMi4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=y4dDThd5ZpwLx+nX8cPrB+1Z2henTpAL9SGQAqbGbYw=; b=o2XngMi4PJ1y3IvQPrb3T7BwVH
	p11DBlSeHQkaATfZdNlorgiMpTeGABbHMYDN9ty5YUkQLSye5OrIh8IyLNaf1jRHBhuOsg1pCn3By
	OLpuiLNTcUbnhn3BKk5gfZrxyTyRXlsrYhUz7oHX4elL8LqgUaiZ54RNJB+U0+yHrseGmDMyiS7j9
	3zH7VVF/qVYsPVGA/Qb2XsQRIm4daT7vCJaeyslNv0qgrRnEfRAC/JTOQnUL5JUj91Gm++eOiU5qd
	ou4ojZSq8F8NIKpCil0Bt1zVggC2iRumPEFu3bThsc92yuWvHGYXrMF/lgWO3PiIQrj2b7WM2eUOJ
	xouK24Iw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2BQ-000Eyx-2z;
	Tue, 06 Oct 2026 12:14:05 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2As-000Bni-31;
	Tue, 06 Oct 2026 12:14:04 +0200
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
Subject: [PATCH 3/6] arm64: dts: imx93-tqma9352-mba91xxca: remove pullup from CAN pins
Date: Tue,  6 Oct 2026 12:13:47 +0200
Message-ID: <20261006101358.2189639-3-alexander.stein@ew.tq-group.com>
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

Fixes: e5bc07026f94 ("arm64: add initial device tree for TQMa93xx/MBa91xxCA")

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
index 737326ba1b2a7..f8e4c9cea53f5 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
@@ -635,10 +635,10 @@ pinctrl_fec_phy: fecphygrp {
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
 
 	pinctrl_jtag: jtaggrp {
-- 
2.55.0

