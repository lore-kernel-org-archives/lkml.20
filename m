Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638A6360EFA;
	Wed,  7 Oct 2026 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357626; cv=none; b=Oo0mDwYUIWQfKGZCsneU1aCn/G2SE/80G3zLoDDYXTQ8vLMBLsh7g/yW5MtNbTPVab3CPoAFiaT49rhWyzZjsG8ku+Hq8ewrtbJBzDDyrDHDyhOUm/hJvTZ5kLeLgoyLSh7TiU1LcATWR5qouolyo418RE1Pd24xokikJ/3mZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357626; c=relaxed/simple;
	bh=URHR5EFUePixqW07vYGy2u8mCN+bn7SvTUh2X2b3CrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SFPzwPSQBMftr1f+CixzsaoIajWmXGjeR1t1cEvythb2wfZ8T2zQ+u5dEX3hWDWAcD1VI2ncJGHx4o3v+D1EQ20mX4yHlFrak9Fk0paQK1d5vXzIe17PtJsFTH+ImMX4W5DmZvKUTHUO1CVDQ6Ecv6+qWn5i6yjZjgJu/kg6eFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Jug073Bw; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Jug073Bw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=3b4TlH43p2t+9nundvR/zTKVMfH8eotxPESorxhuxDA=; b=Jug073BwubFZgLTh+BKLqcrJhD
	Q35tVpzV8M38y+dQDvJJN/M+qf6FoGnodQUnplk0a58FobUKlRYzMYC5OAXWVGzhW3/oYNMQ7DEZ7
	7skI5Kz4htIVo9Uw5UUTnkK7zW83nfTFx9FvxyYKE4Dc0CS9mncbnhqKzmiDTkJzMGvsdvgjLq4tu
	7Jm6frOeHy2/dRFpNXk31VDByRbdAnQhSG+/TjxJZa0Bw107RhzAUQpoinddoVB1PLzaZiD4scCL/
	QzPxyH0Mqbcax0yxZvD32Bc0pYH/Fs1sSf9Oq2QMY6+r53l4/9Amjz2QrG4Djm/lU6h7Anp588rmZ
	wnYLmnkQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELwr-000GIY-2K;
	Wed, 07 Oct 2026 09:20:21 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELwr-0001AH-0P;
	Wed, 07 Oct 2026 09:20:21 +0200
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
Subject: [PATCH v2 1/3] arm64: dts: imx8mm-tqma8mqml: restrict clock for SPI-NOR flash
Date: Wed,  7 Oct 2026 09:20:13 +0200
Message-ID: <20261007072017.2311818-1-alexander.stein@ew.tq-group.com>
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
The i.MX 8M Mini Applications Processor Datasheet for Industrial Products,
Rev. 2, 11/2022 lists a maximum FlexSPI frequency of 66.666666 MHz for
that mode.

Fixes: dfcd1b6f7620 ("arm64: dts: freescale: add initial device tree for TQMa8MQML with i.MX8MM")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Clarify which datasheet is referred to
* Add Fixes tag

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

