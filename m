Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D05172F8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026904; cv=none; b=dwTgD0Qy/qjmJsJejZUWle+lKmfK+ZrBy6AStqqef3XnRcxI35HqjEmXm4bF6pPkROmEjG/l6xYUY6ZsyFGMAhA53uo4vSGgSuLRolfPNHOJ1R4NVbZ7xvP6P1QS7tf9Bl3e1UNQczJwhiUS/yjgZvGr6L9woZ/r2pXaZPGtVLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026904; c=relaxed/simple;
	bh=47bvnxHvOt1qoV1HXmjEEJNBwyKlDNUEdhGKNns4F5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPZyv1xhE26FrR3Klbo/Cx2CduSsX0VxJFNp/TK9YdTRB89I9owgWkzVSzI1BgOelTfZTUoavh1mDsJEb1rtu8WkZfz2fEAifLNRtdlNDOAzusUSj5NePFL5ZPGwPbrqi0wrJ0/Ojbb2asUQS8yISFfR2UO8KX27kVsxcrOYDuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXjdTLSg; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXjdTLSg"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccc02279so2755448a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026901; x=1790631701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/8tm57BNT3aTGO875q1dXTe4xQHMiaxLYJYyXeBXMI=;
        b=EXjdTLSgDoOYhGJw75u3vqB4HkGFX6hwLnhN88nb7WhFEYd0OI28BW3o97mMfzP4uQ
         nbSzs1u1ok6c1+XN2q9i1JDWZ/5oRDqWMWEO4f/EGGtBkD4Ic2n8DU032rJ7N2Q0pBDR
         VGDF/0t2NsFS8YaaZPJeuHAJEt+FQdhKkEWZ6n2RDIowzDUs3iGNVi+AE/DLYwgGD2wG
         ECIWySsxiGOyZsEXEsyX3FFKz3nLgRbs6/sV2OY2VzlWMn8VqOoilthpsQ7TfEeOyobz
         tHAueLF5MN0KTkQ6vT8GJp1P13aEFWqZ2fLXEStmV5FUdBHMfn2qHwH3qIgf7pw+HRfq
         FHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026901; x=1790631701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/8tm57BNT3aTGO875q1dXTe4xQHMiaxLYJYyXeBXMI=;
        b=ieYYeti6sAMFSlzC/wPbBbo73T1aTPDHok7fKeXS6ob1tKAJ2nKZk3YsccHkRNzw4V
         oTppULztrw4G1WRBE/47sKVSLDfaUxpYG38vmFxfYVt8u6IqLlRJB0Cm0LOt4kWX07IJ
         88cUlWMhqiOb9q5aO4qsociXQjIBHTFDJCaCxNq5Y8QCwgv/2pFpKs6BF13s75VHbjzh
         kgmZy3xYmo9LN5wAnnUK4tzLwsIEXZAoXlIXnHNY4tbHgSRv4dVv53HfLMkxov1lt2mx
         s3mDQBGacIowf7TeMACyPG9Y023CJYoEGgenbKv6ozbsJttBqZPkoir71UcjDWVBx7HV
         brVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoXY4cDcfdmlAJ9+mG4OUPXz6z1qccqIyarysiqr/o108Z+YNqQkYDT5rg2z09RV08xozM8V6Z8EKopn4=@vger.kernel.org
X-Gm-Message-State: AFuF++kZt3rgEzRJKSGkTWvfCkuYv579QDeQZm79likPTu/fsbBBq03y
	4xz459ehGGqEjLrtG2wp/nprK/ZW0vwnNZnc0J9KO3PZMT4UCxMOdC5x
X-Gm-Gg: AYBFou206nZjYN4m9htXBrPof1pnbXnNGNnfaaa50Lm5TZySLKBrO6o4509t+bBjdF/
	GSRGa7GxFRCwWQXdzG+Q17zV11UtWpjN6AGe8rVLiB4ov4/l1WgWXuolnvOXb7N/FdYfJjAxjgZ
	AU4Jt9c9Djj5Y577zoS5R2H4bXtdY6XWu/FjUmx+Lspirwi9//qJSVdv/dpdu/KU68YEM0TsWHj
	kKTnILeRyy99uqfsXUYZ7oZavBlMd1quda93QodZWuFG3FeGpfbtNvucJmirhI054Cms2agVTlk
	WB6GMqBLk24VZ2+PX2ku1qFMHV1WWV+WX1dQD4+JkJYgcQdUNgsA9MdMQDArGXXJ4+MFwdiHsHq
	mPfdTcBrZnfijI5eie8gSSE5o44VjuhoFLaekHMqGo86+NCcTokL92Eh9/3ufF8OmLOA97mKt/+
	ew26PV7n1ZurgBY4xGfBqUdcFjzOMohhT+2DLRZ2v4bbzFDgk66iGNNeBiA8RDnOHW4likYU6vB
	gt2bt7w3lae7Cvs48e2OB6eHVmOH01vadSJ9+ppnGnhSw8sAwlKE8yXFfzifPntx8UOlNh3+PJL
	xLwfKBhHEphi5yug7H3e/Ew43A23griwBlT1P7dUbQyy3lC2
X-Received: by 2002:a17:90a:d445:b0:3a0:2817:1fcf with SMTP id 98e67ed59e1d1-3a0281720f7mr9512289a91.11.1790026900990;
        Mon, 21 Sep 2026 14:41:40 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069a0b05esm608892a91.15.2026.09.21.14.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:41:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCHv2 2/2] ARM: dts: broadcom: model USB VBUS power with regulator-fixed
Date: Mon, 21 Sep 2026 14:41:33 -0700
Message-ID: <20260921214133.16519-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214133.16519-1-rosenp@gmail.com>
References: <20260921214133.16519-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the undocumented "vcc-gpio" property on the usb2/usb3
controller nodes with the standard vbus-supply/regulator-fixed model.
Boards now declare a regulator bound to the chipcommon GPIO that
bcma-hcd used to poke directly, one per power rail.

Polarity is preserved: rails that used a GPIO_ACTIVE_HIGH are marked
enable-active-high, while the Buffalo usb3 rails keep GPIO_ACTIVE_LOW
and rely on the binding's active-low default. regulator-boot-on mirrors
the rail being left enabled by CFE so the power line is never toggled
during probe.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 12 +++++++++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 23 ++++++++++++++++--
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 23 ++++++++++++++++--
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 12 +++++++++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 12 +++++++++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 12 +++++++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 12 +++++++++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 12 +++++++++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 12 +++++++++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 12 +++++++++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 13 ++++++++--
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 24 +++++++++++++++++--
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 14 +++++++++--
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 14 +++++++++--
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 24 +++++++++++++++++--
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 12 +++++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 12 +++++++++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 12 +++++++++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 24 +++++++++++++++++--
 .../broadcom/bcm47094-linksys-panamera.dts    | 24 +++++++++++++++++--
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 12 +++++++++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 12 +++++++++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 12 +++++++++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 12 +++++++++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 12 +++++++++-
 25 files changed, 341 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
index f5c95c9a712e..80414c72f912 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
@@ -101,6 +101,16 @@ led-usb {
 			trigger-sources = <&xhci_port1 &ehci_port1 &ohci_port1>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &srab {
@@ -130,7 +140,7 @@ port@4 {
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
index 9f9084269ef5..2823592ebe76 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
@@ -136,14 +136,33 @@ button-eject {
 			gpios = <&chipcommon 15 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+	vbus-supply = <&usb3_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
index 95ef6ca7210b..32088b52cacb 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
@@ -132,14 +132,33 @@ button-eject {
 			gpios = <&chipcommon 15 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+	vbus-supply = <&usb3_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index 03d5546a147c..4c94dac7c832 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -41,6 +41,16 @@ button-restart {
 			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3_phy {
@@ -48,5 +58,5 @@ &usb3_phy {
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index ad246f9a734a..1d96f8a97149 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -38,6 +38,16 @@ button-restart {
 			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3_phy {
@@ -45,5 +55,5 @@ &usb3_phy {
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index 2bdbc7d18b0e..7e9619432254 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -81,10 +81,20 @@ button-restart {
 			gpios = <&chipcommon 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 55f0d9e90d5f..6458b0bbda35 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -77,6 +77,16 @@ button-restart {
 			gpios = <&chipcommon 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &spi_nor {
@@ -88,5 +98,5 @@ &usb3_phy {
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
index 73ff1694a4a0..360237a6f80a 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
@@ -104,10 +104,20 @@ button-restart {
 			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
index b6a5886698b2..baac898761b6 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
@@ -89,6 +89,16 @@ button-restart {
 			gpios = <&chipcommon 7 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &spi_nor {
@@ -109,5 +119,5 @@ partition-file-system {
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
index 3da2daee0c84..6a2516effc07 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
@@ -73,6 +73,16 @@ led-wps {
 			gpios = <&chipcommon 14 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &gmac0 {
@@ -142,7 +152,7 @@ port@4 {
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
index b7cd2faa30ce..be6e164d1a51 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
@@ -116,11 +116,20 @@ button-eject {
 			gpios = <&chipcommon 20 GPIO_ACTIVE_LOW>;
 		};
 	};
-};
 
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
 
 &usb2 {
-	vcc-gpio = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 37593e7582ba..e0a7e9510a08 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -91,6 +91,26 @@ led-3 {
 			linux,default-trigger = "default-on";
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &pcie_bridge0 {
@@ -155,11 +175,11 @@ &usb3_phy {
 };
 
 &usb2 {
-	vcc-gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb3_power>;
 };
 
 &gmac2 {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 24ba8f8f9bf3..c46c1407be8c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -91,14 +91,24 @@ button-restart {
 			gpios = <&chipcommon 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index a4b135d37659..56d35d61a8be 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -184,14 +184,24 @@ wifi@0,0 {
 			};
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
index 5a8b2b1567e6..3c9c7ce5dfd5 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
@@ -90,14 +90,34 @@ button-restart {
 			gpios = <&chipcommon 3 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 12 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb3_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
index 2d2e7e581291..6012cebb2512 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
@@ -98,6 +98,16 @@ led-wps {
 			gpios = <&chipcommon 19 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &nandcs {
@@ -167,7 +177,7 @@ port@8 {
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
index 8bf623c67de0..2e4b2f40d525 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
@@ -79,6 +79,16 @@ led-wps {
 			gpios = <&chipcommon 19 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &gmac0 {
@@ -151,7 +161,7 @@ port@4 {
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index c5099defe9f9..8cf704b3d462 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -115,10 +115,20 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
index 944d592dee2c..bf7291d98bd4 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
@@ -117,6 +117,26 @@ et0macaddr: et0macaddr {
 			#nvmem-cell-cells = <1>;
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &gmac2 {
@@ -158,11 +178,11 @@ firmware@0 {
 };
 
 &usb2 {
-	vcc-gpios = <&chipcommon 21 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb3_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index bdbd0f097925..4f965370f024 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -195,14 +195,34 @@ fixed-link {
 			};
 		};
 	};
+
+	usb2_power: regulator-usb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_power: regulator-usb3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb2_power>;
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb3_power>;
 };
 
 &srab {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
index e374062eb5b7..c6a1d02f7fbb 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
@@ -59,10 +59,20 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
index cf95af9db1e6..cf5bd700976b 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
@@ -59,10 +59,20 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
index 4d0ba315a204..74c6fe007210 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
@@ -99,10 +99,20 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 8e487f60a2cc..8ea19bd2ae35 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -74,6 +74,16 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &gmac0 {
@@ -98,7 +108,7 @@ wifi@0,0 {
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts b/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts
index 0b8727ae6f16..9106a5907957 100644
--- a/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts
@@ -69,6 +69,16 @@ spi {
 
 		/* External BCM6802 MoCA chip is connected */
 	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &pcie0 {
@@ -92,5 +102,5 @@ wifi@0,1,0 {
 };
 
 &usb2 {
-	vcc-gpio = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
-- 
2.55.0

