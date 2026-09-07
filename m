Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1653FE344
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763651; cv=none; b=c3SwGFWQcNB0ZfdS43611nDEackB7OA2Refq80t5+IaYwEG6te6yOfBJ8XtxMVLwQSff2NNxHQ/Ozht/0ygUdJzl06+wEcuXGreCDfASv1powYG+8WziM8aqxbnLQlXKNtGE5zuL9IfdQ2EzWSUESzajzr9oV4pW4rhA5p+z7ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763651; c=relaxed/simple;
	bh=4oyC3B9YoKBnvhj25xvdbfh1IDoKyEgUX7Ty0r+F0FI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAxxRBICV4K/WjoRR+GRm2mX3PrmyjeNS/avv3iTqh16SP0s81RPpHP2oiHhmjDUBIKm7IISCG4FfaG6Hdd6w5p9/AZXL6QYacEpppbtyvtt4wmwvrGyFvzfbdHPQq8DjOGDpT1MgG6dVl8JT9yOZNxKKsG8/r75wA4nSO4zRiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMNklP++; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMNklP++"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48441fa5c37so2246171f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763648; x=1789368448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6pfB+AHXWKtWLZqidHfQCVglH2w9FfX1NUfObO3zo8=;
        b=gMNklP++HYL8Y2H7eWvLgxO4K1kRB7YlOv9tzqfSJxoLz07q2BIDmTaDKtmdPMNG1T
         6i1E+i3gBazhKbcIzbK2YHztJf1wgQc2QvNGKmgRBYd27FIK2ELMnfUqAuLczxfb+pNn
         jLOj5kQCvn1C8qTGJeUeoVY2Nrag1k2F59BbKlmxLxSbW/+lT9enj3XOCeIKnVHyx+Mw
         kgU8LLpVEM4g9gwhpvwwstEbQYP4rN2OiA7/vbNbP4CN9gbtL9eCTGqCTZlcCozkaMqx
         bcqRG7PWe5EwNAzVlEcaXqf2VkOfAUdZ9LquH+PWQNkCFBDgsl4ICf9+qzrw38Msb5fG
         2IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763648; x=1789368448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6pfB+AHXWKtWLZqidHfQCVglH2w9FfX1NUfObO3zo8=;
        b=kCM5Ja+q9nO5nychoO1Vd4YUgOrPBKkF7ffEiMzkrykTwloyCJHdOUGhOEUCilG44r
         hp88GdJQd8fvhjgGEgAkUy5JkMab6V7e2v13GnipkUUjYWTQOPmLoYvmcyG4wrqJDiu8
         xonTl7V+5e/K0rlxOjaJVWCdCivhS0Xp6HjAr+7qqhKsDKrVDuyOQie0pR3mBdyUsb4r
         Jx5xY/09waW7OhxiK3aslq3qgLb3KPu9uGBl+6IEU5auvBoStEhWmXf5Lm+CKej/dj7k
         4lzgudBxaCM2lCuIU7Up4oN4UYsxa3sw/rGLX5JZ9r0A4gSV66jPv9kTObF+JuBbawoA
         hr2A==
X-Forwarded-Encrypted: i=1; AKwUvBw4AUGl09owWDsgQkxNlSZ/Xq5wr0towP5ibLC4IXsw8j0R27A/xRN3yXQ1qBPhegBvdPfQuizsOiymmF8=@vger.kernel.org
X-Gm-Message-State: AFuF++n/ADNSpsSLyKL4EODSlyT17+A6Z6QyT2wzTKLYFfdbbZHiy2iS
	w4VxmgWf13+QY8BM21jY9mZjGTH9GtWAVIkjIKZXxef1uzu3OATfjpnE
X-Gm-Gg: AYBFou0tJQSeCx1TmKG5NHCpoi1D1YilIMqahojerBi9X93hlYWmCLYjneqfCzR4wyQ
	vXRt3Okb0lIXYsHaFJrbEarZwFHdL/kcuNTn6EZZisUb8bbv4v/Y68e2vmQjwOWzUv9HLJhYbRN
	hfsx9wmtwC1vBMy8V/yUON0hzgfpAYpej92G6MeY9L6pKmJ2+62+MODh8WXuG8Kwy7YjRwMfqkR
	UeCXGOxkR1Yrzb1KMx/FKvEejDyAYfKtEF2sOpMcmQm0FiykwOLoGcan9utBM/blOTqt8GOu8nI
	6Ccd0qS68pVnu8cQ0c6RO2X5hFPg2qjcqJ1+oBr9RZuudDwZpl+c9WDhKxMHqifI0b7rkzsck1+
	4OUFG1dOzcly8TnU179G5xPfNQ3NFsA16qkl3SQTNy+j54cxgDgOS6ZXTF2z2NU6ZoTfGWjcwwq
	/g5tfk+5uU4hTwgDf1VS0oe6yfgZtPBkx7Eou39AvgidDajR4dyo/48aBU7XDkWKFQRKl3HivRK
	nuVD0a0Nkf3r2IsVq/Q8/dFlFwrzFo/bX8lvBX1fm9RZDZRuA/zyaYemjkfI/bi/i4PeZejWMrL
	NzJGqAFoT8KaqnhcnWr1v3sWrt+7Z2AbR0WCCsM6BM0xShHL
X-Received: by 2002:a05:600c:4e45:b0:49c:f504:2af5 with SMTP id 5b1f17b1804b1-49cf81dc3ecmr232937625e9.1.1788763648275;
        Sun, 06 Sep 2026 23:47:28 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:27 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 07 Sep 2026 08:47:20 +0200
Subject: [PATCH v2 1/2] arm64: dts: freescale: imx95-toradex-smarc: Add
 ENETC port 2 in SGMII mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-add-enetc-port2-v2-1-e8f1f8b000c0@toradex.com>
References: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
In-Reply-To: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

The SMARC ETH2 uses the ENETC port 2 as a SGMII Ethernet interface.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

---
v2: no changes
v1: https://lore.kernel.org/all/20260903-add-enetc-port2-v1-1-2a21139d7a7c@toradex.com/
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 7437e523ff639..ffe537ccd5bd5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -64,6 +64,14 @@ &enetc_port1 {
 	status = "okay";
 };
 
+/* SMARC SERDES_0 - ETH2 */
+&enetc_port2 {
+	phy-handle = <&ethphy3>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+	status = "okay";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a6c5398a81e3c..27ac9731733ce 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -15,6 +15,7 @@ aliases {
 		can1 = &flexcan2;
 		ethernet0 = &enetc_port0;
 		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -221,6 +222,12 @@ &enetc_port1 {
 	phy-mode = "rgmii-id";
 };
 
+/* SMARC SERDES_0 */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0

