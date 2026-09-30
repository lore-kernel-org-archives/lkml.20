Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF3484880;
	Wed, 30 Sep 2026 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764470; cv=none; b=Sc5hNpw9UVQ4vYhMumjyhyA9G9CUzvSxClQVYBcyDiuq2wdGBWUSJzNesB5zsq4HIWrVym+9lWR+sbTJhhkzKE2BZpv5C17Kp4yf/FrurP/cW8VhDHaJbAsRJ3gBmh9PYF10SeJWCHQygWvB0ZL4jzqJDO74tDkvok7L5z+/XIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764470; c=relaxed/simple;
	bh=yZ/0NL/5QSG/cX0kPKkuJr+iGmXepoifFzPLE2xXo/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e35gWnxs7w98xLDXE5N+w5k6ShaizmtC4Kt3i4cJT7l+XQYk+5Q31IPMuV5CokVFAsZb2fdU+MNrlZxV3Loe3bwDjq6hptMwSuv+IV4ZbMjtODCCTYPYzC77Dwoq7gqkfUzV0FSjFuob2UqcNF2ogSk7i6lSBsD7k68C1p482P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Ar0TxQoH; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Ar0TxQoH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z9e30zNnkd/2aGEdqLw0xnKg0Po7szNciJvZ2BImHus=; b=Ar0TxQoHRF8w7MryRBOKObDH1s
	41jIUGrWNTTPRPkPK7DCOJS8xwcorjCbtJvF4+7dqcue0Sz9r1BeZZ9ublyUv4sArMQ6DeSn+zK1W
	1EW5NWLHOEBJw+u86dr38uLQkP5lpEACgFTWxnerPfzgWgJPO4knU4PQqU/52BpEQfRkLGb7BXBrD
	gBd6f60zmqwwjJHu/oDsZ+hwTUYLNsTU/ZKl7uw6XHQvDWCXFLMRIyxsroenboLxdRYj6dIfEEQeP
	DjAAjIDYSSI/Jen/j07p5ceMWevbnW7wHWzBC3aM966bJvywdgVbYpI//+MNVc1sT2ZcB2fXOKAUn
	rZF3xWCQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:46122 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrds-00000000Z3d-3fYe;
	Wed, 30 Sep 2026 12:34:26 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/2] ARM: dts: imx6dl-phytec-mira-nand: Enable all peripherals
Date: Wed, 30 Sep 2026 12:34:24 +0200
Message-Id: <20260930103425.2315286-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930103425.2315286-1-primoz.fiser@norik.com>
References: <20260930103425.2315286-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

The current imx6dl-phytec-mira-rdk-nand.dts describes the LC (Low Cost)
variant of the board. However all phyBOARD-Mira boards in-tree are
actually the FF (Full Featured) variants. Now, sync the i.MX6 DL NAND
variant device-tree and enable all peripherals (CAN, PCIe and no speed
limit on Ethernet PHY) to enable all RDK board features.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
index 8ec27080ca1e..c2780ecb5936 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
@@ -22,8 +22,8 @@ chosen {
 	};
 };
 
-&ethphy {
-	max-speed = <100>;
+&can1 {
+	status = "okay";
 };
 
 &fec {
@@ -50,6 +50,10 @@ &i2c_rtc {
 	status = "okay";
 };
 
+&pcie {
+	status = "okay";
+};
+
 &uart3 {
 	status = "okay";
 };
-- 
2.34.1

