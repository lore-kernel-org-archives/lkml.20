Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916154ED1AE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659723; cv=none; b=XlyMINhLThHOlu9AbMjiTb0ZjXNXrigFMB0civ1wuYlknExrfFfpQadsALBVyNP2cKN+dzqvqdP+Mu+MtCXnR/cZatmp4ENx2fQAZOUOegvDOQ1bm0uOHcUgU3vKlFCxxlnhLoSrQtazYQ2moLy/gzKujqhqeZGIteLxPrD2Gbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659723; c=relaxed/simple;
	bh=VGQ7i0rsWlHK10W0mC5TJ9kvAaDRj77XeWPsthYR2k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mgxwk0OELLcC+VhUPxYc7Zk8H4QTMUlilPuHQ7Ep7QfkBWmJySJ1JUsndGum0Cpk71es0YOnJLZPlZ9Lf6k32X8+vWFzsytlUhMkWwi0wyVSSOcHyvtQeAdFsY4NYbOtkpKLtbvv9swgTd6BFacD96WFQVMYBDb923ClSeKcRFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVL/gwOm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVL/gwOm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso10014175e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659702; x=1790264502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZTHVF5d2BHEGYh8wWAhHMVlO8LgEUkq4aZ2zQxWQOk=;
        b=JVL/gwOmbN7dbw2jyPCsk5zA0J0lVl66D0eLyToe6JI4R6UhMHXGBnu0JjW1MjwlXk
         uCuh+CKmj2R3T0uIRWhwx7HlyQXpjp2/nDhMHdnumf448I2gzirW6E8aTCZOCvYl2xFn
         9Tg+AZZ5xcVVZ53LFNedpwySdsLSnaAHaweVeSghIIoZBjTyoT+zDJuMEGyjQ6HLr4/e
         FJLT8EcI8kXnEuw1Vd21diRCs9Wid0PJTtzDOIGbvAF0D4Kar2FZ987me6jkCI5yEP58
         NF4FXvkGhsaQvMK/c3HrxQobHchkaP+72uUPcTXhhGRx4g4aqZZ13n0SgZPSL2nkHrEG
         56OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659702; x=1790264502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZTHVF5d2BHEGYh8wWAhHMVlO8LgEUkq4aZ2zQxWQOk=;
        b=X7yEKbZf3y3p2PvBNPASo6j0pY4ErfeWlZDAgn3PHScxNkkyELctHHJA6KByjk8Lqx
         IarQDl7CpfoFKEoqS43Qrp+PcOs/Q9XN2TeM1qc8B8ilkxitMdHMjExFE+yJ5b2mr0Nv
         aWCUHtK+V/ff+vXYfLnGAR+wUF1/WvOhL2OVVLsiOG6vmGDQneITkhDcpUDJ5z0pQzBE
         G4o7n/E9hhdoydYbYiaLokFO/8UNeL0tclq80qziqiVhlhZRkprezSZkfphVbn8cAst5
         q6tqAGUzkxqlUoUBpxai4hgu4tPemmDGeo0yR52TKoEW4imOQz/eZ3chnkv8MYV3IxZ5
         a9qw==
X-Forwarded-Encrypted: i=1; AKwUvBzkMz7eiIG1/eQN6Fs9z2DUo7Za9exBvmLfmvGCkBP7qyvtWMdelDsV6pZzqDM1GePtY2TZHqXz7NQeyYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++moRqwEIdsCb2iVwCGCvEgmToucdVhoqwKBoU5ptZXHM0TMZgH2
	iWFVFGszkUNBPVbNoUqDhEf8j+soHWh51eal2QRdH1an2zmZQT5NEn7u
X-Gm-Gg: AYBFou0eoJ8S2+kyYLKtQQJi0H7LHj6KvatgYBgrxExsvmjsc1ykc3KotdFi8o/96VY
	esFYzGz89XruDJXAa7yVL1mq5hLCG4dKwyAfYslpJOopgnSCfHyvMOAKe4QSXFaQDusKbaEXvjI
	QqbUxoO6att0sUJ/zP2xNlFzeGjzGI6aMuCTDXwlCDhliqyjf47L/5h/9P0Q8Pdq0yhaWcNPFno
	lPHRxem6b5tbq+474b5Z1ep0a/sgjuo8Tvlz576ZJ57XYrKRtjmjYExt1U4mYSNndWS5zKQfyBK
	i+2Wsyp5pAYWrtYuYN7q5r+4lIchUhVG0S1QqldAg9FHLpz+mPlQ+Wi90Rbz+qopmoKM6WQOXt8
	PVOr2VLjN0y9ODhLJ5deEg0B4i+zwthiThOg25j+PErRe/Bzd7LONiiLZW/SLwHaAYw/MA3E+Tn
	16ZvetGsQ7FKa7V8bep89ln548nU+KCuXpVbwxtWLG9QeaWMLVonxA0FYRdcHOXZ0cQmn/GCvz7
	3RGmB8ZFylhp1R0IN9hxvdI2+fXeHhuhhYZazRC6uaADcpC+EO4jlZ7Cg7bqx1MdC1kMf4gRr04
	5D5C6OH08xRdQ0YJ6773fm5eTyqM1EKN
X-Received: by 2002:a05:600c:3b20:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49eb733ba12mr88495725e9.33.1789659701524;
        Thu, 17 Sep 2026 08:41:41 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Ferraro <francesco.f@variscite.com>
Subject: [PATCH v2 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Thu, 17 Sep 2026 17:41:28 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Configure SAI3 to operate in synchronous RX mode, so that the trasmit
path uses the receive bit clock and frame sync signals.

Remove the TX_SYNC and TX_BCLK pinmux entries, as these signals are not
used in this configuration.

Co-developed-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 2324063f8fd9..c7a9eb23e5e8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -305,6 +305,7 @@ &sai3 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <1536000>;
 	fsl,sai-mclk-direction-output;
+	fsl,sai-synchronous-rx;
 	status = "okay";
 };
 
@@ -446,8 +447,6 @@ pinctrl_sai3: sai3grp {
 			MX8MM_IOMUXC_SAI3_RXFS_SAI3_RX_SYNC		0xd6
 			MX8MM_IOMUXC_SAI3_RXC_SAI3_RX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_RXD_SAI3_RX_DATA0		0xd6
-			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
-			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
 			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
-- 
2.47.3

