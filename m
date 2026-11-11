Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392385;
	b=QI1XXQ21DTHO8lkv4f2WEFLq/2WOURpet4zxjrMYs3OH38LG0XemZuP06SM3zNVIqWVc
	 7rgY6p/NXXYe7m/DXpRh0CHfuS/IMQGkW9oNe1R75aDEVIAbwcvjCkB0NWkfuSKCfzZbw
	 C4EQJx1Ix7G73iqTfxp6AjF7t5WB+Wml1zbeS2pDswXBGMPQ7+4voXUfcoFotK4Ofi9T4
	 /O4hmRGip5cblFZ/XRDhGuma/TdbBPNMcyw3jSLmmpwhi1iNxIwgp+zYXlkt9mVlnwQtP
	 Zyz/Hmcv0veVR+4NwBAY204jqtvWhAQx7sIL9a+4D3Adu7GaeWrn4yvfOyD0++e/DZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392385;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Virus-Scanned;
	bh=5dU+D6xlqx5np/vrlxZeszcBuxHck87mXFaV/490fx4=;
	b=kcOogc/ykM4SHs4ai4uFOY9UOPYDouRxgnLwypi3UpG2PPJNAduniiRs9+aSQfvjpQho
	 h3CImWkzMil6xAYbtO/am3/Mj8g23+7txAAaccRFoA10q+84gI2QMhTWAZD8HN0xN93h8
	 vvfV8MVEs7HbRq/wWpkpKerh8eu9sRMuSEaVuUxzz+vccb7rcVw6AuZEWPWAkgZG7XIXD
	 pauKb2pRVjUwZS31FA2i/Y8ixZGoO0mE626lH7b0xvqypWAOH85un3pgv2ESXtKNb+Vcj
	 GRCBPj/5Ma7V3EIVT9tCIS2LWsUXRkeDTi5aqPCVhZMAtNx3rFwBYmH5bm0Cs/38iFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=IncZHQik;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8F9606A32A;
	Wed, 11 Nov 2026 10:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F8F9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=IncZHQik
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5dU+D6xlqx5np/vrlxZeszcBuxHck87mXFaV/490fx4=; b=IncZHQikyfwYYAMIGTmxTbsGhS
	dspfCsA1baFPrJxCe5+m3zZVw5VQZNroMgKmjXezR2GrwQnGl2PDFSY0EXn3Pc56+lJ1hZuj6g6Se
	3GH8rEVuY3awTkgCqNKA+ffUXTp+7iKCLORNLGZ8Mi2Vkmxn15A0nCTCdaOmWFESSNWcXzo5XBD5p
	/jtlnj1MbtcHDntG2kXRGOAzEqIEEtKYTvMM3fSeoEIBKTMr8P1hjSHRUvviSjVfrry729xiSXXb4
	5vGxU79vycY4w8Nj6XH1Yg+B0GvqijZYFCQJ3ksETBlTxl9lFBaryzw9ukEl3ivNtRopRpMlA+Lic
	Q6ZRQXXQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xR5Qc-0006fC-0w;
	Wed, 11 Nov 2026 11:19:42 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xR5Qb-000NjR-1b;
	Wed, 11 Nov 2026 11:19:41 +0100
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
Subject: [PATCH 2/2] ARM: dts: imx6ul-tqma6ulxl-common: add vref-supply for ADC
Date: Wed, 11 Nov 2026 11:19:24 +0100
Message-ID: <20261111101934.1216887-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111101934.1216887-1-alexander.stein@ew.tq-group.com>
References: <20261111101934.1216887-1-alexander.stein@ew.tq-group.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28180/Wed Nov 11 07:24:27 2026)

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

On MBa6ULx no ADC channel is available as the pads are muxed to different
functions. Provide the correct reference voltage in case ADC is used on
a different mainboard.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
index 133961ee72831..fa117acdfcb27 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
@@ -20,6 +20,10 @@ reg_vin: reg-vin {
 	};
 };
 
+&adc1 {
+	vref-supply = <&reg_vin>;
+};
+
 &m24c64_50 {
 	vcc-supply = <&reg_vin>;
 };
-- 
2.55.0

