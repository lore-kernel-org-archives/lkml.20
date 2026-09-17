Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454804E4C5E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659719; cv=none; b=ALIijiHtcUoZ156hr55qke+07dCYkBRn3JAyFlWEJLgdKmeoR58DNrm0PaiUsXNkS8K3jZ1jAqK5yFBKLoLnwh9DKcI9aELtupa1uSAM6fw0M9GFBmeJvN3621/1xN1b0lyAtgEESEnhigz6KZlJCvygDZKJs8guH3CczGDNY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659719; c=relaxed/simple;
	bh=Tuw8fjQ4Nitl5LlGiEpAxv/8p17A8gL6CzHwHUI51iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qX20Vgw2zCVcg62iEnl1dHgp61AMcxPe5PxKnQOcpIJHu3kxrnW5BteThUiicscb4u/pT428HmYqDHUqMZ2Kl7H+grKcaZuBRV2dkmn9j/MeHdMl5WoMIDFUkwSMKIqMmdatYBpknFfgeszrzs2DcY3GjRlCycfxGfEPM4di5Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKfXsseR; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKfXsseR"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so6133325e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659704; x=1790264504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogUWVPuPz4Wv0AWXXjemfDDswNqsh12xy3+UrN+ebnA=;
        b=hKfXsseRydZBb9cblvkW0Vxuv3UfJjmWrQf9M+2J37yq3iLMzvhvIeNxnKA9JcWEz5
         XX8y/MiY+qUKlt+uU93hO/IQ/hlFWbGJVMUYIwgbC8B7lRIGurCovQw3XmxtKCBXEQ+4
         H1xu1qgrRwr2r5d59uLW9TIYB/MoVvIs+OXoUE/zxl3oOTNatfb61i4s5Dokr05Hh1/m
         Bs/0Tat1hTRDtAoyAhe3akoPJMpbxv18hU6oJzW5CnidNrunSbXDDPat+U7eSph8jCf0
         UTHFdEthvm1LssryMuXMGPO8WwIMgt1N0XxCw8V0javRnTwkxwE2pFx1qw+h8lYk2NkF
         VVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659704; x=1790264504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogUWVPuPz4Wv0AWXXjemfDDswNqsh12xy3+UrN+ebnA=;
        b=X3O3xhdZsYItP1A/LOjbrnPlMQQifiEcGPG+O0KIhOoVrzsqk0v9MHH6LtCf/gk8dg
         HIkRlatBxbnSyYdSsPAHckBPxsTMXknyQ9ARbuW0SES1q9Pe3ZcDV03+cUKs7eZAy3FH
         BRlfJ+ZEURvbd0EBQnqjfHHmFPmS47MGKQlTyBa68Ia98taBSebkim8e/Z5Tb+7Et/ju
         OYEqSmrFGtJq1fy6su2vDjUxr1J7+I+jhn7yMcO0WVOO/VT0utKKO3Fr3MLRDofCbtwI
         Q9MkdoRNfVbghXqdujZD9P0C0BIEr34LGae6PEpulxD0VgmHEyg56Js4za3/l846DL2W
         1Mig==
X-Forwarded-Encrypted: i=1; AKwUvBxwnAn1oUvQ/sgORFny9ylXefgo00XNddaEJOSMrFkIzmnm3XE7GajKjwatC5Il9XQs13nqz2IVzvB6Pg0=@vger.kernel.org
X-Gm-Message-State: AFuF++nCfdNUKrYPqQM3VmK77mFxo3IZOrIzVXpB6Ol3iIrlyeG7V963
	Zw3BhbfNexVE0nAlCe19/qlw2Ob1oaINDJ0xV7uqWF+i0/fsR5mS+uhWuzhxvcAA
X-Gm-Gg: AYBFou1CEUU9M/uJbLBMjQpKsk0Gb91IWVyo9QewEVhMiw9/QdfmHK/a9nIXvXQuZbq
	JCjjhW/EbEp2osx2NujXU4kxMDpzTcD6fVpr+bEoQfu70mun90/VDsycvLzSnjOOclsAwPpKc+5
	m3VM5ZqX8sCBQXUNho/2qshk2DWa3DG/wCgC9o3o/+EqRhoq/kj2GGgcIgGNi8u4o24WYNxIjIA
	SkBxT2IxuHMNAuypxQi9UfXmTTtDxMFM/q3Ghf5oLgJMMWpwuV0co98B8KG32Cre9mbVGlq3tgk
	fASgFsZa02WBM/4jn73Y4rHn3kQ1ZjFI81fiD2cYH9LGKIA9h40X5UzgidUj/3jaswCkAGVNbvu
	Tvf8URCy9edGsI5QF2x+T/+WLMf/VcXQ2IPBfDrOjZ6VFKDjziu5v3Np2TBo+xYjRCdMSjkXpR0
	TU9061+AuHnCHmFQzeDV0dQofVDc/IDGl/m2wjpx4LqGoege4iPZJDtK+EoZdM/5xx2Oa4d9T3J
	PZnnnuJ9B6N5q+r/GR2C4PPGGzPv50jlN3+E7LufNHtEBHhnRA5gba3/zUETCFLRimMbNvTYoIP
	GZtIA8sWbzYjQm07FmF/CQ==
X-Received: by 2002:a05:600c:8b81:b0:49e:69e3:884d with SMTP id 5b1f17b1804b1-49eac45ba21mr81456555e9.4.1789659702746;
        Thu, 17 Sep 2026 08:41:42 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:42 -0700 (PDT)
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
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v2 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Date: Thu, 17 Sep 2026 17:41:29 +0200
Message-ID: <57aacae2f4f57e877ba32d8082915d6d6bcd3803.1789659585.git.stefano.r@variscite.com>
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

Add support for the TPM available on the Variscite DART-MX8M-MINI SOM.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

 .../boot/dts/freescale/imx8mm-var-dart.dtsi      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c7a9eb23e5e8..953950e55bf9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -138,6 +138,16 @@ &i2c1 {
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
+	st33ktpm2xi2c_som: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_tpm_reset>;
+		label = "tpm";
+		/* active-low TPM reset line. */
+		reset-gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+	};
+
 	pmic@4b {
 		compatible = "rohm,bd71847";
 		reg = <0x4b>;
@@ -452,6 +462,12 @@ MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
 	};
 
+	pinctrl_tpm_reset: tpm-resetgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31		0x19
+		>;
+	};
+
 	pinctrl_uart4: uart4grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_ECSPI2_SCLK_UART4_DCE_RX		0x140
-- 
2.47.3

