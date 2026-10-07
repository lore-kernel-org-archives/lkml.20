Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF17838B12A;
	Wed,  7 Oct 2026 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357626; cv=none; b=KsW3dBLwcrASSg6gj2qnmLzkSNsj9q+Vs84YckwSUQh8bkXFMrcX6psXjciDjh1AjS9RaVlJH/jyOgCTjhTi84paXAcQRsoK6dr+4YGyNLU75fF4vw4h1dBpk4CqJO/ZNzVFn+VHWUQ0h6/B5hF2jBOvf6o5HEbxUkiWiYS8xXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357626; c=relaxed/simple;
	bh=ZZULCPKG3+fPgzCqVGA59sTV2xcvGnvXWlExBCE4+G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PTK1tHtTnhcJn/80IedSGfuuxICqlEBIphG68StN5hxc3fb5s9mvtC8eDKoYZGibzW9kPYiLh0SMh6xhUGG6aWhM0AuGwQ9BCBWEyYi1W+ibxEAuJXpInxWKWRLHlo73WnDuOh2j1r1Zkrq9o8AWurz/rAziWUxOkpFLFtiYHDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KhB/AxUn; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KhB/AxUn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xYT6z4kqEdWjCVRSKtWWPizQ5NjnliE8xD78sKcEiks=; b=KhB/AxUnp3oXaNrUfDQyUX2N2U
	HdkN+Zeroo9snaveNrbm+1pd0ZVqcgMMfUaP9tsQpYcWzxWVk9kz0GUEEGBq9T7WQ5f6gTkSiciRn
	RjIP7CQMRHQSEVg+Nmn7pUEEVgQLjiTinAu6Mf67OERV1oSpMWbEcK9KBErIKodBRLzm7O25hmU/0
	QEMgDsQjGv3p73mwmlDCyDnIFOb63axlHhVKcU5mNV51Dd/jZAuVzxIpanhQTgo0f6thdmCSkfl1P
	4/XSdLdDEOzzxNOfs3Tkl0aeSiAA7BmBf4c0DOUM5voxBVd6CEFwAxSiP9nLYT7C86AESEtXfzd7m
	wu/beydA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELws-000GIl-2F;
	Wed, 07 Oct 2026 09:20:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELws-0001AH-0L;
	Wed, 07 Oct 2026 09:20:22 +0200
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
Subject: [PATCH v2 3/3] arm64: dts: imx8mp-tqma8mpql: restrict clock for SPI-NOR flash
Date: Wed,  7 Oct 2026 09:20:15 +0200
Message-ID: <20261007072017.2311818-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007072017.2311818-1-alexander.stein@ew.tq-group.com>
References: <20261007072017.2311818-1-alexander.stein@ew.tq-group.com>
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
The i.MX 8M Plus Applications Processor Datasheet for Industrial Products,
Rev. 2.2, 09/2024 lists a maximum FlexSPI frequency of 66.666666 MHz for
that mode.

Fixes: 418d1d840e42 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Clarify which datasheet is referred to
* Add Fixes tag

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

