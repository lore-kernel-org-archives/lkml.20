Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495771;
	b=sUiirqSyp2pocSdt0+cus8OCBsKsLuKctjeBZ34IG/Q4+H6IBw2bu7zsZxfEOPpXZjXg
	 kmKQlhnNxoDiGfRG8ZZa9JaaTzZFyq2jxoQWNUhkP3SYyTrmVKKeW1hLh1SVSoBEPXn/D
	 BKO9xlgOiL0f1O6wzjl/ermzmvbOKCSjrJQqh7pW/fh7Y0UXQPZajNu9kGukIAP6VD+ky
	 U0o6yPToNtTYgvW5jEpBsYZmiVi48RfTNCc5Fkp26KG88cnUSTUIirE+AL9aUk8JbmdQ2
	 k7uYShvnA1I6jqUnnk76eCbZ8+y91Cw5XQNENw4r8A7o/xMIcQokQm6zEAVHsshtJYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495771;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pHY2Uuseo/Jj08uOzuHqoVYzJM4L4mvUnlsbTZ8f4LA=;
	b=fCwh2tNHLJW1rxkTinezV7c/t0SifRVadbZZdZ0oW23YSaRp3fx7lghD8b/CiC1xftgd
	 2WC8dogMaQXm0q0tgvLBZpyvsaQJGgMxAtySgpuhjeo6XizuZunCVwpK2vqwe5B38DwMm
	 fSRR8GzmRsCBDu3qtfaXNsMPohp0XYnk7sIgt7RW8YJFIVV/KZBuLQOw3DdtypLfwxsQj
	 KKqTPOhcJuChsCdxnAQBEjGKMMLHiGhOLiG5aUxoz5cfZkd6qOP553XlfWne5q1vufaV+
	 D7HfEG3aV4v6bxtBRQ5CHDgc6P8dzad4D53uTGPwYmrzJJXppJxY/VgfjZ6c3DViqPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b="iKGqdZ+/";
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A216960A262E;
	Thu, 12 Nov 2026 15:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A216960A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=iKGqdZ+/
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7AAA023211;
	Thu, 12 Nov 2026 16:02:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495769;
	bh=pHY2Uuseo/Jj08uOzuHqoVYzJM4L4mvUnlsbTZ8f4LA=; h=From:To:Subject;
	b=iKGqdZ+/7OJ+sXnCPIRbjDsNy2ruzCEiVX5HdsVE18shrGiXPpiKFHU5rKkoIE9Lk
	 H4TR4ZVlu3an394nP8WYhKGLDY16SqPbdW/OSlcn7S7wTtIFfT2xwRcaDeJnvpfHIi
	 hV5EeMwut2HlpbpaDFMkFua/ceI3zCZiq4HLkGyWFN4WBzmSMdEZL1SQSvXwzYyH2F
	 qfKHavk2zhx76yiMQQJk3c5QC0sZFO7Igz4rhtzbMCmaErMwuYKufEBSLva1boHdUa
	 3eOf+ni5xT90i6RoRupI2ezxpXhnWOXTSxs2RFLSAGgW/gZH5e7zYiM/RF/c7Tjkec
	 ZDXRGP7GNzwfA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/11] arm64: dts: freescale: imx8-apalis: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:30 +0100
Message-ID: <20261112150236.164850-9-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Apalis family pinout defines the SoM interfaces and their
numbering, SPI1 and SPI2 being the SPI buses available to the carrier
board, implemented by lpspi0 and lpspi2 on Apalis iMX8.

imx8qm.dtsi numbers lpspi0 as spi0 and lpspi2 as spi2, so SPI2 does
not match the Apalis numbering. Add spi0 and spi1 aliases in the SoM
dtsi, zero-based with SPI1 being spi0, and delete the inherited spi2,
so lpspi2 is bus 1 and carries a single alias.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 64604f91d567..806f5a8a51c8 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -8,6 +8,9 @@
 / {
 	aliases {
 		ethernet0 = &fec1;
+		spi0 = &lpspi0;
+		spi1 = &lpspi2;
+		/delete-property/ spi2;
 	};
 
 	chosen {
-- 
2.47.3

