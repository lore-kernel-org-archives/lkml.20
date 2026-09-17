Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41004B44CF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657756; cv=none; b=VpXtIfvHfV2Xa4MPtThGN7h1skGSMyMA8ltn/5ufv3D7x81IlnwEpWufDCmo3HGKbHO7bIAjZu4UabAWlN/NR5uvDl6ybGYfPD4AlShGXqxVBo0v6AjcYFbfgoIXgKQhGM5Ud49YNzIfsZMVtgPcIz8amYo/bEDKgpb+0H6xHV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657756; c=relaxed/simple;
	bh=TEfy77fQc7gzUcObXL0A2hoFIbOeaaX1tVmcfYmjZFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ipl8er6IexN4q2rfFJXN7TjOk2Iw3WJLXkCIeYrMuRHP6rxUzQAoa29K0Yp+6m2agwUNt1obA792hCajpX00SnXT1NSEriJ4yk8GEmwp3WZmRgUMewCJimmrzZa5rh5sMHJFX7T8kHs1516Q8i+1Fs+/CLb0wM3qVVw7xjyE844=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sm2ZBxra; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sm2ZBxra"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so6276905e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657739; x=1790262539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdbF+rIH2kuomyDNZ8PZiq5VuqMW/f4lQBUYl1lQH/Y=;
        b=Sm2ZBxraG52650HMKhOWGmrRgClOUJ8MwaMCAOPVzoc+NEXuERuAqdTkcvDirA8NLY
         CiqEQ0scbjSq0A+QBh7muH13ONgDaIMkCdBPqzUVKRrpoArL0kC0Zyalp7M0tMTffJQr
         2iemGVZkDeZ/1AdZO/5na1SHC1P+RZ+tinD1M8QaoCYsjSaKLI9OvRr+clG7dPNBAwwd
         5AJRWoyPgAc/PlbwwHOEeCvHbwWlTdTgnrrq9uSoLxgPmhtE0HMa9MxRLz2OtJKDvPAw
         tNacREIfuxH/c9oILwX2YFPzhRxoC5Do5nulf47uJNZN2JZiXCfQr0ji4Tc1xq9Nu2RD
         1gfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657739; x=1790262539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdbF+rIH2kuomyDNZ8PZiq5VuqMW/f4lQBUYl1lQH/Y=;
        b=hBYt6Wp48Zz5eKQQLszfWJ0j0+A0LTOe54oLuxXUu3FTVxYYJDOJ2cK7IYA6GdT+o0
         tfjdM3uayoirNCOVFUooDojg9lgWapS8/qq3oWzndjaJEOAj8wAqpjHOJCadELQzFefe
         uDffQnGwIcoSlk/TzHfYH62DrxMh9vB2cM2JUis5CIOI6o5z4IxuuAOyTdM47fpGgPBs
         QwaIULqjGelP0VQIKB8i1gl9TzslEcJD4t0ksNEknZlPtuun1tk/0Uoy+qocTgmg1xNO
         dhPEp4wCP7h+uzJceJLD4YFnZXlD9LzJopy52OomH1HsbuQ07AQEqgk72rr2nV8Jf3jA
         rTbA==
X-Forwarded-Encrypted: i=1; AKwUvBwEJmaibBvjmaNCkJPmam4eEM9vYyBMVrjOEMF+sd75E8Lo+2aLxwKO4kbi+W2QL70+9koAH09rwMhLmqc=@vger.kernel.org
X-Gm-Message-State: AFuF++kBg9eEUhfy665p5qHOjxcWr/uTS/FBvrSLNUpLdwl1wDXZU+PS
	LD/ryS/F08tDA24dw7Mxs4sC2hkm6bK8jNKcS2DBTY7ENJyCaW0ktcF/
X-Gm-Gg: AYBFou1oiIeQfpc/YTThd5ta0wqY28Xif5FBnvTFB/O4jkRtTf4dyS3gjTjtaEzKtk6
	SjWT4l5AX9WF0BkZOYOcRYradStlf5X3kgztnS/QTFxH3eF4NjEFQ0e6qoL0c/QtfwxAH9a8Hd7
	8tVhd1KRh0KOl2SAVJUbhW0QzjTv7V9A0rZM6i8WWSHVWSDktL3Z/VDJbbpot5N6k5Sq6LuN60g
	lROBJSXSpJhhj/TEEj6J7FX0Pg0k8sydp5AhZQWYc73NGELkVfyuR2Kas+oBwKMS1EPHAlrsMsT
	lckf67baBd0rFcUvhnIaDqrzWLl4sYjeIuzNnB7QawhDe83PNdYsVunH1VYPPHRrEnrjrjWMNC7
	UlNh5LIjfeOEOod0kEtFVHKgZZug2lcteLrDSVsP/ARMUCyLcM4ficvtX486QTDSmLF13ZEzrlk
	OKmLTd6iCn2Y9XFOEJpcwjOdU7j1iAUugrTktJFZortsY5+Q5nKkcT5+PLnSHquU5D0mFaC3wUQ
	BuLMx3PKuaqKCsL7wmhuOag5g5o03oqaoxGMjSIHmGC5VDyuapBfNRArdla+tHiGU8THAphuwZb
	8RV7rmr3+gRlqyo85YvFEDo=
X-Received: by 2002:a05:600c:4e91:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49eb72f39d7mr165685185e9.5.1789657739517;
        Thu, 17 Sep 2026 08:08:59 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:08:58 -0700 (PDT)
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
Subject: [PATCH v1 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Thu, 17 Sep 2026 17:08:43 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
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

