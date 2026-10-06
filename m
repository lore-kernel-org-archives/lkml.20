Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED53DDAFD;
	Tue,  6 Oct 2026 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281649; cv=none; b=DSv28DTqZYNz7xeYyr8s4ZgI8PvvK0CCT6qlMqX/8ux1Ja1q7S5jSZQr+QFStDWPP2xSDC+wKmyy1O33gKLviug7ZF+LkxHchG+UbAMF3dLrZzAknJNi/k7B/hpQlr1aUwibAqpR/Ww6kpYP3t7j9daxZFgvQI+BCH91/d1A5Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281649; c=relaxed/simple;
	bh=kdd9MkLIW3JDZ4okLNl4Jgub1FrRtZOJd9pS6/p/SeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTev1cfiUoTkRY/2NUF7bRAe7n8OBHVd1u/l/isWxaNSmvzyaJQrn/ZWW9VEc4KuboGkF2C1E2fZRb6lrqTZE92+28qD5ZxwcGnMwRcXDIvod5mFvS07ckwsYupuECAwg174bO0MeFDx29nHblO8LdJ083tpuitA2rCcsK3YnQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oLGXDxPD; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oLGXDxPD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=s6hYGaj+l8zn205PzV4yQ2xKxNIHOEpLfbwuow43o8A=; b=oLGXDxPDCr7gCgrrbzD845mP3c
	JeObEhoOJkd39BIeOKo4KROTaoDpNxD4pfE2pMbE84QcYAduRRYxvpwwkOn/+omsVsn60z+9bPTDl
	fGGCv98Q1PbgnHMufkcbThYCBlxzJ4AMCjXhsGZCKTAjiQAbjBYsC7chWwRhLkRqERyEDRCDgM3ll
	risGp6GtF0nMF/Ni2yttd4BWD36cwKqmjvIKv4HhPdom9pAenvBy9N2cDNElLjfdjeCXJTJ7fMaL/
	KnYvL9kaANCcLIDFtXxckjZVJzb4aDbW0QynsbGafMJT73CGkmCksfOzT1BH2kEs8SjmbjC42xZNz
	yNUnY6vg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2BS-000EzN-1l;
	Tue, 06 Oct 2026 12:14:06 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2Au-000Bni-1n;
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
Subject: [PATCH 6/6] arm64: dts: imx93-tqma9352-mba93xxla: remove pullup from CAN pins
Date: Tue,  6 Oct 2026 12:13:50 +0200
Message-ID: <20261006101358.2189639-6-alexander.stein@ew.tq-group.com>
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

Fixes: e9237480629f ("arm64: dts: freescale: imx93-tqma9352-mba93xxla: improve pad configuration")

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index 914efa9b1c22a..4c18e212b8dbd 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -705,19 +705,19 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x1000
 
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
-			/* HYS | PU | FSEL_0 | DSE no drive */
-			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200
-			/* PU | FSEL_3 | DSE X4 */
-			MX93_PAD_PDM_CLK__CAN1_TX			0x039e
+			/* HYS | FSEL_0 | DSE no drive */
+			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1000
+			/* FSEL_3 | DSE X4 */
+			MX93_PAD_PDM_CLK__CAN1_TX			0x019e
 		>;
 	};
 
 	pinctrl_flexcan2: flexcan2grp {
 		fsl,pins = <
-			/* HYS | PU | FSEL_0 | DSE no drive */
-			MX93_PAD_GPIO_IO27__CAN2_RX			0x1200
-			/* PU | FSEL_3 | DSE X4 */
-			MX93_PAD_GPIO_IO25__CAN2_TX			0x039e
+			/* HYS | FSEL_0 | DSE no drive */
+			MX93_PAD_GPIO_IO27__CAN2_RX			0x1000
+			/* FSEL_3 | DSE X4 */
+			MX93_PAD_GPIO_IO25__CAN2_TX			0x019e
 		>;
 	};
 
-- 
2.55.0

