Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06E845D5C2;
	Tue,  6 Oct 2026 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293124; cv=none; b=qqzXa1+sz0UnZ3Cki56ovcX2UmESnD+X/mxswqtEJAlAgNNv/u+rFNsxJ+6n7ZZSihaIVMhbjhyDZIf15Cc+rWCzB3LQpX1CulOMllGnzBFJ6cFsohLPrBCIZT8uqizSQIWfEUDsYGtYjEiC8qy7/uJFHkDtE7tvxfMgBxCJhlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293124; c=relaxed/simple;
	bh=4lol9T+NnBL43epGpq5I8ELMAp0xZ3ZD8usemTGyqwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XvXBh3hGTcTVMlqTbOOQ2AvF/XZND8XhBMSO5dsFSsxYbKOYDrmpP8/7fS+jGNT0A2zPNmDV9OJ/OXef37quS9befAWUvenbbFscpSz+ffNDj1JcrSeQXmIflwvq2hcvzGIQW5wnner1PTYyyk8O5XwfZc5HelBEaBeZe+6DCGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=APJFysTO; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="APJFysTO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LB/84ZVCwL47WTvxzYSv1yNeUPWFliBH/yRbyUFkjVY=; b=APJFysTOBS98WDqg7ECxiTD/yS
	tkt3ZY/DywWzFUaQjYHE7e2uOpPZVroPMoVe2V3YTgp8KN3uYjtMuMcrxicMWSohfpwlSOe+kPfiq
	pgbJl6ga9VZzNkaDhP30W95ZPPf/F99uYUK5hoSzbKzrOBrLuf82RFxxahOYmbvfJCs32PYdSZDou
	5+wmkWam9I7Kv1mW9tHq8hPYQ9SjcG+Q43c5q76O79HpnC+ozvMqcBwgBZ+rmVQZvVtZFAuUprAgT
	pn15t+q0ckqOOa2j9AU60jRElPLL0VghoJQ0gHUf+ZG0gm2kzc3crtNNBfV7DQ8rQHR+kQp0jpWdN
	dSwAUbnA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5AU-0009Tm-0j;
	Tue, 06 Oct 2026 15:25:18 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5AT-0000rD-1r;
	Tue, 06 Oct 2026 15:25:17 +0200
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
Subject: [PATCH 3/3] arm64: dts: imx8mp-tqma8mpql: restrict clock for SPI-NOR flash
Date: Tue,  6 Oct 2026 15:25:11 +0200
Message-ID: <20261006132512.2246196-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
References: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index 9716f24f7c6ed..0593bcb450a57 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -47,7 +47,7 @@ &flexspi {
 	flash0: flash@0 {
 		reg = <0>;
 		compatible = "jedec,spi-nor";
-		spi-max-frequency = <80000000>;
+		spi-max-frequency = <66666666>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
 		vcc-supply = <&buck5_reg>;
-- 
2.55.0

