Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925297;
	b=wq21ZhTuSyVjcRC/UumikX7t2UZ/B7bSz2ky9xhTLLzn/RfPCBtJsYDYo21XGAVH7Kwd
	 NoC8oxFagbWgSiREo6yoMNKowsEzDz9hdW+yS1HRuWKtHOb/PNI7WvQs+UURq095Y9SQ8
	 AxuQozQBJfwxHlorrVitcW3QkTs8BeizFttVyshfdVGezjJYWsgy35UtRofXLaZRVmGhQ
	 2CJAcMD7oxN9pK2ZBYUBLeX7FEmE9yprgONHyDJ/g8rWbJX3ermMHs2hTmo6+cVpH2sbD
	 C/HHRL6gMt9cSrElB//NRzPcPl0tYQuackRfe9bzMZSfM5us+le/ezeVHxtynPFJY7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=;
	b=BaebdZ+iQa+iuRyrkDAPiwls5UqFMDituOLukNa4ugnswVbT6jgNjwTrDP6cZTlBrhZz
	 z8d74jjXffIbMRqFuY5d47xm4mawMdkfCSaqAvRQPERcQDTIAvYEoCM0nHnMpXzaU/p2v
	 FMTd2D3NnP7Jc+J/ymgsGnigNe/vRaT3L40tiPmjFXUZflfYA+G6Jd48a8P0o3oACwatA
	 8uvMpqSDs5hUcjeoETbhkMTGsjXsSePcEXja6RgsMlGT6a18Z8pmSUpejJKAVcFhytuR5
	 240dJcPnUlEeDIzVAvKVnXT4f/NqG/xs3Ru5BVFMNvxO6qLZgTq/QkW6wRp8KKOBgqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vf3Hjv9E;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8141A606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8141A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vf3Hjv9E
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380b40319bdso2284499eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925296; x=1795530096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=;
        b=vf3Hjv9EeZL0XwPDoPToH9V1fcVk607RISk0iwl0VPUOXZbNujcs9J0zuN1HMjtHCC
         U9LPx5IlJCwKxka70rvcRCr/e7FncDuFTMeBRCnYmPmDjDtCt81QLbHDQkjqrQSL+9BO
         Bo7mTZr6ZmpUhiLTus+0K+4fUl40u+9MvqQDY1sHR2ENvNI5upRpX/HCIIuAiqN3UiV/
         tbSBPT3HBqCSDpLdSXkp7klgDU4ZVD3EUg/Ygn/8ByY6upIsHf5YjHbI4nSNs7YGso2f
         Mqfji1Q10OVjc9IoBKLbpSx7M6+CJFpB+wzy7m35c7NOPlzqw81eoZcIS9OEqzEK6Le3
         bmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925296; x=1795530096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=;
        b=agH/r74RUHzixeuTJAVhlwRWOCQzkuSM6iIir/wdExyhMUrbCmvBL3xohHdFyazecc
         lT+Q/xj37VSXCwWuA6NAuYuanakG36an2Ka0YSBLFj12/I/mv78lUOdpRpa6MCLNNCuD
         7f0H96tC0qrmvj0r9rraZEYkOGUtLzE3HVhIk2aMnIMyFxMzqZQpX8BeAADoep0VfrBV
         AWFPA0ynOArQPLqtxt8YZVOARYLeG91oludWDUahtpzHkVeWS8iGOqWHG3a1KK4viYD1
         qUtNRxmlSCw3jW8Agsa6mQRw0QhJL+dLglo70TfasVkdYTOzvtMaeYJKzR9lelISA5ws
         qOFw==
X-Forwarded-Encrypted: i=1; AL+hErEi5FPDPeJn6PdacAW1C6ppqKN8XppIF3qkH17CEdQ2Rsvr1iyPCjgj8T71tafXDAT0yU0+Pg4kKFqnNXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9htcLBsX8VF+njamSQ5q3TW8NUhtQ+rXVdjsP/k7NrWa2sr7M6
	4Dx/vS3dvZW4TcO5AwxGG0vttRST5Nvd7GT/RCveX2wmTaTUq8ttR7dA
X-Gm-Gg: AZFdTZeh7HrUepZODUo9ewSavpcqC4sC6X9fbHmJsLipu7PlQZFY2sIsmYOlpwpT5Fb
	U3KtqDOIZC+f3b+e5mPMwJNSlxiR29u/mUH2e6vecuFgIhlemqntO+lyUoPyCQtvupJPURUFlJu
	EcpDqKtsIBCKPYLUny+hIqHtEBvpA5A3s3Q7BED3Crv855zEmMQxo26Ab+fF80JPI7T7jud7eFb
	nRlxRCoT3nyqMZ82BvL3q+Mf06DfEpilgcbdatr4scCp1cmodlEjx9HW3hJS1AsZUDX7u/3iDBQ
	c39SOm4Hqijfpi6gUyGBhNjDFkv1Bt86K5eZsxWOKfONK5dCgluAS/fPD46zFBfJhW+RI8roMvJ
	8SwC8AadLItiBk0jY5MWzQtoioE/A/dSDvW5sV8IvKt/s7Lj+As++fYZQpls+gNYBBvo55Q9Omv
	XBs04umKjE4+guLDnfnIaAk6ukapnx1mPtcqgdb+U57OoukyELB7Vze40kkTWYCuxlcGS/Ocw0/
	wBj+PiwO5DNtytu1HwtQF/lOgAfaz6WKzYx2sttwIL9YRAr2lGq2yQZbhnQveDa4VUMrBHMseUa
	Gyskq2HkK7K7yWYcWSuYiYE3LaFgy9cWgIezh+E=
X-Received: by 2002:a05:693c:41cf:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-37967506841mr13477392eec.29.1794925296009;
        Tue, 17 Nov 2026 06:21:36 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm43828258eec.3.2026.11.17.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:21:35 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: h6: taiqicat-a01: Enable Ethernet
Date: Tue, 17 Nov 2026 22:21:21 +0800
Message-ID: <20261117142122.246986-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The TaiqiCat A01 has a 100 Mbit/s Ethernet port, which uses the EPHY
integrated into the co-packaged AC200 of the Allwinner H6 SoC.

The AC200 derives its 24 MHz reference clock from PWM1, so enable the
PWM controller and the pwm-clock node that supplies it. Also enable
I2C3, over which the AC200 is accessed, and describe the AC200 EPHY
package on the EMAC MDIO bus, with the EMAC operating in RMII mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

---
The AC200 MFD and EPHY drivers/bindings and the sun50i-h6.dtsi AC200
description this depends on are already merged in sunxi/dt-for-7.5.
---
 .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
index 225f42bd3b9e..9b192caeecb2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
 
 	aliases {
+		ethernet0 = &emac;
 		ethernet1 = &sdio_wifi;
 		serial0 = &uart0;
 	};
@@ -87,6 +88,10 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_dcdca>;
 };
@@ -107,6 +112,14 @@ &ehci3 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rmii_pins>;
+	phy-mode = "rmii";
+	phy-handle = <&ac200_ephy>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_dcdcc>;
 	status = "okay";
@@ -123,6 +136,29 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+};
+
+&mdio {
+	ethernet-phy-package@1 {
+		compatible = "x-powers,ac200-ephy-package";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		vcc-supply = <&reg_aldo2>;
+		nvmem-cells = <&ephy_calibration>;
+		nvmem-cell-names = "configuration";
+		x-powers,ac200 = <&ac200>;
+		x-powers,xmii-rx-clock-inverted;
+
+		ac200_ephy: ethernet-phy@1 {
+			compatible = "ethernet-phy-id0044.1400";
+			reg = <1>;
+		};
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
@@ -173,6 +209,10 @@ &pio {
 	vcc-pg-supply = <&reg_bldo3>;
 };
 
+&pwm {
+	status = "okay";
+};
+
 &r_i2c {
 	status = "okay";
 
-- 
2.56.1

