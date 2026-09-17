Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2FA4AA3F5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683965; cv=none; b=gdAL0czF383naPLrLDOgM4HtHvZInXsv4UlNIKr3LK8skHEcXU6y1q+QK2R3CD172e3TbUwHfyxGHFKJ+e3aTkVrUtKadNfCOTyaZ9f0R2dX0xZNqs5lAkT2MeUv4fZOteLUl4KcNiJXQgSr0fDSPicBzPCX2vfOIzWUbxL+bGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683965; c=relaxed/simple;
	bh=PPUQzK5TqVbrrNTNE0CnhEJ8m/zbeT/JzkU4m//5RaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxzefUaCi/nRun3J7/DrLVYOQuRU3d6c6ixYIX8HMBVsaUmQO5jNataWtPv/6mH5o4z1oB2vtYShGpuP4qIsePIMcXBr2AXwDjmNlcRm9SSLkWTX9plav49qW69Hy6GubWewFPwvLlsvEkoMoCY8950MB5eKq+rEDN8alOcmlMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKzmNN1m; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKzmNN1m"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso540545e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683961; x=1790288761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZ47DVQmyZYVdJhDE2+Awlch6+GR0MpCzXRi8vv+3B0=;
        b=PKzmNN1mk2HTpdwx9gCEfp085fXixXBaj1g3pDxfFWiyu/EwD/8ut4pwh3872edRpw
         pG47wafN98dmPxkssvZhgHswER0hIqR7cFVMvG4a2abRxsVOLrkKX1KK5zyWeu4P/mf2
         ZjWjMHEkogc3urTZTfKlg4zAfBT6yqxQAvCooG8zNaQJxGLyXN/1xGUeLogsDCFMV3B9
         qX/6+Bxyzb2Jx7qqCSrefLpCJQuhhHMJnO9HtPnict0yOXrT7b7ycIH2HOAZOtga+7V/
         YMtEn+uLUijiQDVi/HA6z1NZqoGDCPutobOVwSNjna+amZ1Hyz83mr2qeMO+tRMfxn6O
         eLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683961; x=1790288761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZ47DVQmyZYVdJhDE2+Awlch6+GR0MpCzXRi8vv+3B0=;
        b=LVawin6aeB7Cx/uCKzpkrPxzMahoYQguQGMUo/Wmzb2wyTSxX76yrCMPMRkC3hZbls
         Sej4XHOq1HAiAqMds+rrpo/AHtdPXK0iYnh6fJi5wZWaCza7yMsmpN4gErn2uWzcM2t1
         7DZjCMXhrglYQSSQkEE3XKmamL/mKDXJZm9vhUgPZ+AVGCLiNV20vi0tyz5++nEYiJed
         YR0uwsc/KFWy626A0hf7ElDvxgI5u3P9OOwmcW2jJvWCnN0us8Z6xEwfVpEj2koY+qLU
         F6abhyKbuodCHNrK297xbDXGbnHb9xpzpdgJLQCzktfiUAVgNzZeWAseVbRQ7+4/Qy8E
         jw+w==
X-Forwarded-Encrypted: i=1; AKwUvBxM6aPg21dKpz3TuFTcI7Siu8E0Al0LJyc7mdx2hmL62iRVFxHbx4ZKa8JKSgFBKaEbaoqnF8NdgniEws0=@vger.kernel.org
X-Gm-Message-State: AFuF++nh+6G3+AkexH8KEsBO/aCTjPLVhkQnScN6ezUfBfHEDIyl4uc9
	CT14BvGJyOLUI9kliz4fbL3peyNKAvfTdRacx8sB09deQEPJypWcyEZV
X-Gm-Gg: AYBFou2cbaYlH++gFJnsWBxhY8u30BMPvxcsMlT55fAvxCq1k+2U2dVKPQeofDHSK5J
	rpbSIXYTHUVCws+QJ4hnwcA/o4rmjAmU9K/X2XeAt2kp0PhkfwIsIFsHF9E9QxYOLPOjVR2M/8y
	2ynLS6za3YTMPLNjhO9EMigk74aEZC5/5n2X4TeasnGNIMViCh7f2nj/YH5DNcaIAyH9dyzXCEm
	aLh8Cmj2r69rKKdHHLgs3CpcsGsIjV4kqUG9hAuf+Lcvfnwiap37vEzGMNHNRaPnBlxMB7JpTGY
	u41JcQQJ5WAwZzbu/6b2UO4dRU+3VfaRKCOd2n7u9BG7UG4J8taDqV7Nx3VWSMQCTNOqVcbK+Mq
	k1W/c77hZVYpz2QUchus7ifamBLp7wlUArYGPTLfPzLjvAY+3W0PnEu/kzp0hQwiZf6+VT+DDZc
	Fm71hXUESR5N/JAfCr4fAQY2hTpcUhvT53E7gknjP2A496g8i4RKw7nfGbcnpxCCs9loiHR8Ivw
	YPk9ciom7j9NuhgA3JyysoibyagR8aCax3U+oS2IgqUC9oJVC3j3oyQwMZtKiQpQ/PC/7m5j8Q9
	CMNkadkENQzK/WnN1nLmtg==
X-Received: by 2002:a05:600c:4e53:b0:49e:715e:ec1f with SMTP id 5b1f17b1804b1-49fc5757378mr3630865e9.30.1789683961158;
        Thu, 17 Sep 2026 15:26:01 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:26:00 -0700 (PDT)
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
Subject: [PATCH v3 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Fri, 18 Sep 2026 00:25:43 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789683864.git.stefano.r@variscite.com>
References: <cover.1789683864.git.stefano.r@variscite.com>
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
v2->v3:
 - 

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

