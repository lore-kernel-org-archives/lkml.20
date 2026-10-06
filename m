Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2123EC814;
	Tue,  6 Oct 2026 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293124; cv=none; b=qGf+oSTFFe5keuTgyltNKYOpMM2EeMe29DYXJI/0DM5S1rC1ZKH/EzfpKiX97iqr1Nx/0/8tQJahaDXu5Ep83NLazSwUZCNnZ3gZASSPg/ApuqhBK4due6DmtbjS13daDQh+PzkT89nH+HOwCY1GowJZuelJFZBrr9gXo1kIIYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293124; c=relaxed/simple;
	bh=5XNOFQp9yPYYYfRSbb/rsTtZyq5V8u0CfNXEKkLOX2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eItkkokDZgBLB7lTIS2gw+UHP1QJNvhLgSikkPXCzxpbVpFvw9lqPFlMp7AxUCFxYpup1XlHCRk9owpm8sA+13oB4uVTP/zI8D3jSZKTa36g+LmlGLbfEw1hG2utpJHR3QTFtEApnNfEetTyBTCOU9EBAPzLEt7J3zEyoo8mZNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GxHV3kf2; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GxHV3kf2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Uc9m3wRSAlib82ghVEr1AQYEZkIrEHkmPktf4kQ5tCw=; b=GxHV3kf2rXH4IfVAZe9mg9sTDj
	lQa8gXQKN+7CxupBPH3gESDrY5LB5bB6oLIDDNgmcAjQiLggJDGeKz39PeMPMqtl5lxf0bOjlVdhe
	4K6vTXRBcv4c4NU0YBfDBCFAy4FJrI0hfUbYAg4URQrA19bOiUavW56DbBtMt3xjDU6ppSXGeypn8
	zh19cZ9vc20H9DER6PC2ISYj2O6WibmtFCFth4Lw8cd1Ocbii102gRDfHU2n3NjEInSWabSGbk3/i
	Dr1w2OXJEDVpR+ZgcJYLhrBYH95Gloi64nERPewCpBUNamYx8AaQWqRZvzLaKq/FyQLxUidiRlg0n
	qr86Lisw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5AT-0009TZ-1S;
	Tue, 06 Oct 2026 15:25:17 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5AS-0000rD-25;
	Tue, 06 Oct 2026 15:25:16 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/3] arm64: dts: imx8mm-tqma8mqml: restrict clock for SPI-NOR flash
Date: Tue,  6 Oct 2026 15:25:09 +0200
Message-ID: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
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

The FlexSPI controller uses quad SPI with internal clock recovery.
The clock is therefore restricted to 66.666666 MHz according to
data sheet.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index 1b5ba3c47164f..48285bcbe9bbb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -60,7 +60,7 @@ &flexspi {
 	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <84000000>;
+		spi-max-frequency = <66666666>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
 		vcc-supply = <&buck5_reg>;
-- 
2.55.0

