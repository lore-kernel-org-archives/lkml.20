Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA28525783C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468468; cv=none; b=OoVFB7lHbcq+i6XnvdNPPi3/Sw9AZf1e9i1rKfjA5hXFFiEJbhqf0qz/JGJDYAC6iP5WIrrMwXfTMY8I5bA3ru6QV0MTirjowkwseGMPHyX4lINud3JriDY6ISAVB4AGCHXmsWb4ACvNu6Bq4KmgD6tzCzsCULNB2kj1byYJ8MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468468; c=relaxed/simple;
	bh=8/pV73x78jrNfWMKzRpgQhL/uS+KEamSLh1zpjcATE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnHOrG8djOQWrgZT8efwo05wLxE48p1GuZcgJiYpNlOo+/wdkqgox99g6siJiJ0a/Sj1L31dH/zQCmNbpniiJNBYWDKGWM36oJVFrvz8x49h5/B6M3WcUJKp3WHEReIPmOfMHZBw3W0aRRPljjj2nuqnhqO8DG6JqjcIcCP8duw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGvk7F3e; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGvk7F3e"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b46bc1282so128159a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468464; x=1791073264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIkNGJES0hm9OJqnA5eP6Pl3OVYCfTyaqkdgFUAgvWM=;
        b=IGvk7F3euwaMaNp75/CaLvLlsi+WiLgGIzC6pcuRiPA0KQLXWIfWU2fLyInIirUJN9
         bmkKe/82nQIBFYRcRpGOpQnptGY90jlB77nW6RoJDOkVk59GGGWV8hLhZp6PDkhDc8Yx
         S079royIQYPsiORQhxfFCdvSVnWIB5m2csYcFJJZxJvX5BipEeq2kWTM5dS5QMqm8wgh
         sClmDCffaFseGRjPuOeccaQnu2vRsBzOsYniK2Huh952rv/0Uu2m3cRUG98ynOOjtSQ1
         4AekKerLkhEQ91buIEqIk62G6I+3fp7hXLbjBzhA1kwVVpLVrO5a5XT9S/cu20QQc2eN
         udcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468464; x=1791073264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TIkNGJES0hm9OJqnA5eP6Pl3OVYCfTyaqkdgFUAgvWM=;
        b=g8dOP/KcWpHgWH6GEaA52aBaYnfLp0NX+kE7AfeJrJd0lJ7/JnJdr/hO6Ys+4diGo+
         vZXlwY9ItvBjp3Q1M0fD79rPLdYlIb4xRfnB9QLlMG/BYDOHBShla3NyHGetn6mGqSFF
         R2KKiakn0shhW0m+oS/SNiJzgk/NfW8epLkU0T7Wka/Q/rQlYG5556vUSDmcaJ8otDzl
         7Two9eRl10NHaANbhS4xqg93MR+R4bhQRZpS1T5QceCuPj66al+6oEN6rqfvQ5h5O13J
         6LXkElO3aTgOYAU/ffRB9E7lUs1vbAF8cCwL+YgDD9X0jax018PtyeiUaX9+YIsMcNPw
         gteA==
X-Forwarded-Encrypted: i=1; AKwUvBzOValsZVHgYe6W2VjKnwCEvV7BvJG0D3Tu+V32VwPm+OTsD7GaiORXsiuOy/WvBs8kauJixtuS5ejnlNY=@vger.kernel.org
X-Gm-Message-State: AFuF++kMXCpE9bsFH70DB3F0PuI2rrTz8x3Mq3sBD/Rz3l7qWUsul1W1
	8Lu/EE77G395SZQgwAXN41HBYXn/4oz0r8lPJ1Zvi0BSIAR/5aHu4wzi
X-Gm-Gg: AYBFou1THW6/zDvebNwPxwShP1CvmGRPwI58FRbuNKCVuS17bjzxHZx5o9XMUg4XPFp
	6mIk/QDIt7O62fsPNpz6wXbUyW+W2Gklv7CpsChj+/bcOsPSi+Wg/i3AHU4/J2VlJY3xUQVuZfh
	JarqAz+TUkOY5uBtMdkkjtlojYSYLIsdfeL3IbOIaXdP94199oDpqV1MGixqWVjjfzkd7s1lPxk
	Ut9wWUhAF/MIaDLrx+MXOq/bCMCPrTsLYQo1qbA3woSf3BmxqniCa5Ea7EEtNDNvO5HJ9J02JZm
	kPur+zfrvCQTO4OZ03vENPzGzbiCXuWxfu/hXsG8KYtKB/I7dufgH2Hl7Tl83XRaLqmsyZlsoBg
	TA+OPva4KsVzbECHpyj+NPJI5/KGa62nCQpb99NrrJ3Ltrfsn3GZ+uduncFBnBJQuGl8OvVWp/5
	vaXOq9NzR+9W1FhIaY/+3XXoeK59/7wNS5ThtSIoA5+FDYjNQqfIO2KuyoaeUUIoadu8eF+fGtY
	jWsByALLt42PwXS11Ds/Q==
X-Received: by 2002:a05:6820:61d:b0:6be:137b:3f98 with SMTP id 006d021491bc7-6d5b869c1f6mr6321898eaf.22.1790468464256;
        Sat, 26 Sep 2026 17:21:04 -0700 (PDT)
Received: from tcmichals-5759.lan ([2607:fb91:3584:35a9:66f8:2cb5:aa80:21fd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8828e1ea0sm838989eaf.6.2026.09.26.17.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:21:03 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v2 7/7] arm64: dts: allwinner: add a523 msgbox and remoteproc nodes
Date: Sat, 26 Sep 2026 19:20:16 -0500
Message-ID: <20260927002021.797069-8-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927002021.797069-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the hardware mailbox (CPUX_MSGBOX) node and the XuanTie E907 RISC-V
remoteproc node for Allwinner A523/A527/T527 SoCs.

Connect the remoteproc node to the MCU CCU clocks (bus, core, sram,
msgbox) and resets (cfg, core, sram, msgbox) and mailbox channels 8 & 9
for bidirectional host-coprocessor IPC.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..b4699c4df5e9 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -605,6 +605,23 @@ dma: dma-controller@3002000 {
 			#dma-cells = <1>;
 		};
 
+		msgbox: mailbox@3003000 {
+			compatible = "allwinner,sun55i-a523-msgbox";
+			reg = <0x03003000 0x1000>,
+			      <0x07094000 0x1000>,
+			      <0x07120000 0x1000>,
+			      <0x07136000 0x1000>;
+			reg-names = "arm", "dsp", "cpus", "rv";
+			clocks = <&ccu CLK_BUS_MSGBOX>;
+			resets = <&ccu RST_BUS_MSGBOX>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "arm", "dsp", "cpus", "rv";
+			#mbox-cells = <1>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun55i-a523-sid",
 				     "allwinner,sun50i-a64-sid";
@@ -1144,5 +1161,27 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		rproc: remoteproc@7130000 {
+			compatible = "allwinner,sun55i-a523-rproc";
+			reg = <0x07130000 0x1000>,
+			      <0x07280000 0x40000>,
+			      <0x072c0000 0x40000>,
+			      <0x07010364 0x4>;
+			reg-names = "cfg", "r_sram", "r_sram1", "remap";
+			clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu CLK_MCU_RISCV>,
+				 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+			clock-names = "bus", "core", "sram", "msgbox";
+			resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+				 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+			reset-names = "cfg", "core", "sram", "msgbox";
+			mboxes = <&msgbox 8>, <&msgbox 9>;
+			mbox-names = "rx", "tx";
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0

