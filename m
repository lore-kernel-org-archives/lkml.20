Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9243AD503;
	Tue,  6 Oct 2026 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293124; cv=none; b=MyS9SZCao+cn8n4/BFzSkQ7AA/VBu2tYax7IhBU51k3y7I7q1eoE2WhOxjaUfwFttJ8t8piFr4KvoInnvgLZTB//nsbDxwQVVZARGrcXh3anKxcRb/HRg8NxB2dLqnTWFznawpFO/5WmZst+t1FfN0rFCE/uCul8li+hBEdo75I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293124; c=relaxed/simple;
	bh=i8lcEiZcuKG/QWG4KYOZLLDlPj15yFiGS/IymKTw4iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptK0b0seml0RQJrKsWPEMdVV2gSKOfiBA+ZEtE+LxArAzgaf+HCEO2NhvIi3xOmJ/WQHavwUGniTmVG7UvVJ1FesblhXbHP6tfFsmBat1d3tNnGG06a+rpQIUFOXAGBCOs7htQZgLWBbqFJD5RBE66+7oLixJCS4lWaR6lYZP/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=HtWD/aSs; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HtWD/aSs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=JqZWknWAOmVqxPDKeV+BvtkD4EvaaTtCgX/WPhuPNUQ=; b=HtWD/aSsXW+Yf2sTqNvE2222BM
	CMWScLqLRLvraGpGJpnl3xB1NmCP33fpSCHDiAVrHw7rwTut/1BXZDoYM+i8u9t+5D48DwPI/Z01F
	arbSHiDk/qg3R2Udwwq2osRn8ObdaWgvtwOX4TmNlthkBhvsvMq9E9ejEgxp2K6/8bF12gUg2e9nz
	I5cbkTohtBNKPgGPLkMF55ZRt2Pk3RId5NxcFQjAHi4K3zvlONQ/Je/wn2+Md7xkX2QuWkMFh89MZ
	Fd4JvZcG+p8z5Fx6sntkNprdDLd1aA37/MCWfFnO5NBX2F4XHZjWExNMD9FpUSnAySH8DN2z1R6+9
	M5FheZ9Q==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5AT-0009Tf-2S;
	Tue, 06 Oct 2026 15:25:17 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5AT-0000rD-0L;
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
Subject: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: restrict clock for SPI-NOR flash
Date: Tue,  6 Oct 2026 15:25:10 +0200
Message-ID: <20261006132512.2246196-2-alexander.stein@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index 48a687926aa1b..c88d83243097f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -63,7 +63,7 @@ &flexspi {
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

