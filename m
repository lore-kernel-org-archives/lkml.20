Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6381319D074;
	Wed,  7 Oct 2026 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357627; cv=none; b=hncbXuBeyAFAn/R0M1WhPxNXUkxRl5gvgb3GdE13MeoDBWIIKWv16Fdf2G0jIyW80vI4p+OQlHwnyjP7wIR1rNNkIZZ2NWYvUjgMMMVWupFItggkUWsRBe0XIfT6IffFu0HTJ/cqKrHycgNhO4LnvrKiwhqCkUl2cTjUs2a9eBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357627; c=relaxed/simple;
	bh=KcLtmpJNVBxWzrNRn48NnFN+1S2JnVVs1E5y/Dq5MOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=miKXJgVWFcBl97//t0buGa2zxDxWyd2JVk9sDlh1aoWB6mFjWb8N3hsgs6uzKxnLh8m11qiqey4cnO/myH+6EPdqbx2C1gY6TNdSri4Wq2Yj84iCQUtpojj3iDKgvnQ1D+P4r6yCjKSqIS+yfKHnpEKJPf99Ug6vLtH+W6apOtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NdhnOh+2; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NdhnOh+2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=njYXrrB8oAWtWRh5cSrz5BsmD6ADy2UrTysoMzFRbA0=; b=NdhnOh+29LzpYHwsXE2euS0ScV
	a+eiZs2nPS/FcmxuwylmWdH3zqFYKhBrEunBLeO2SZaP0e16+0ViBwP83LvnmG+SVbb/xt+uL0UK2
	r8Kfg5d7ImRz8o4vVdLOfr3DSY4Xmf2k9txt/T9HQmbw6ONBvsjJb+Cw9qXO92UkPETKnBr46XDmn
	UsTTW8GtjtR4kekrytqA0FWzOC5lOfpwj8OWNreb7iEJncDpINl1TgHS2qKJPz+RpLowN491Gtqde
	Qzz7U8FCI4dhcKmV4dY/5Adtlp8eq/C3DiRjdPyt6H/qx9dzrRpd4lOgZhKfZA2glsWr7yDEqs8G0
	I9pKucpg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELws-000GId-0V;
	Wed, 07 Oct 2026 09:20:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELwr-0001AH-1y;
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
Subject: [PATCH v2 2/3] arm64: dts: imx8mn-tqma8mqnl: restrict clock for SPI-NOR flash
Date: Wed,  7 Oct 2026 09:20:14 +0200
Message-ID: <20261007072017.2311818-2-alexander.stein@ew.tq-group.com>
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
The i.MX 8M Nano Applications Processor Datasheet for Industrial Products,
Rev. 5, 09/2022 lists a maximum FlexSPI frequency of 66.666666 MHz for
that mode.

Fixes: 3e56e354db6d ("arm64: dts: freescale: add initial device tree for TQMa8MQNL with i.MX8MN")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Clarify which datasheet is referred to
* Add Fixes tag

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

