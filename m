Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91722517BB7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293120; cv=none; b=T6KSzCyqhJK4+S7aNgD86YIpec/nNO6977FKpIsEF4aCtq3cVNmIN3ZN0M77XGke74YFuYPGu+IY4R6gHpbh6NNTQzIANdsfOeyhXFORBTVZtCw9WU4hLpWRmK7eoq3pzmXF5wdj75hJ7Z/5yWo+ctHRUmYDlpu86wUrHFTuKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293120; c=relaxed/simple;
	bh=47bvnxHvOt1qoV1HXmjEEJNBwyKlDNUEdhGKNns4F5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ek+WhcnH4LwCQmHlG6ksm8nkuktPssPUiA3Mh+bk5CT7V+ZDk9QhY/4AAOzJ+I58zzskfoIKH0z2RDQVRu+pl9tMvnyKTxykFssj73VVUowflkDmyxKVC0hkdnVmJDlQj58QrlxiNCPz066+9skrCH6++wxLAmg2+2JM18WXDAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqWq9Qo5; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqWq9Qo5"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398beb616f5so175488a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790293118; x=1790897918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/8tm57BNT3aTGO875q1dXTe4xQHMiaxLYJYyXeBXMI=;
        b=fqWq9Qo5kmdXX9TwsCxBj94Lr1aE4VoKR1PrS5OJO78KXFS53B2Njy+53drTE7FejZ
         RFwEFYir6+VBuskQh3IiCGPsfsiXqzD0QXMr9gn0c8a+wR7+RGz1qoXwZD2hJHOjD2ow
         glacQ13xfzs76KiDhHcclQXTRs8MpspQLNFQ/IgWeG2Kf18p9Gbb7KmpKmQf30uziP7U
         AH8eHVpWyUDdjZKsrOr8LExE8d9ZMfJnH2T6vTQB6jLNBRlbnYIM2NWxq/cMKP7X+9jo
         8Fx+2IRizFsFJ4K9R1LjmU71TIWZ02GFX/4UmNxAyprYG1Q5nfghlFPy+5SC40dmsE2c
         Vntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293118; x=1790897918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/8tm57BNT3aTGO875q1dXTe4xQHMiaxLYJYyXeBXMI=;
        b=v1aCEp+xN8dd3OkpoLdZ994RM7AAmBYlh4NlwxVgZnXyO4jaXJPj1i++orPKcyQ2QP
         9aEoHugzaH1y2PLzXVI4VHjHNZ1PwpQg+bJEbTozGvvednCLINGT4TSyJzqrV0H082Vx
         ymt85rFv5dvH/ubw2EdizR+cYFIaM5YEFANIDA7TDgSuKtDg0wdtk/BCbF1a3hNrLf/s
         2e2MKIB9XDKFLt9s4fSilNgQQmHdrUgNcRxviMGG4SgSSc8H4fzuooEuD1f6HrfJQe+B
         eadp1xcMYWM7kjIPG/YuCsqFIMmHq7T1wWK6ti3OL6bo0UgnNTy8mDd9LsfvnYnWQUUk
         j1lQ==
X-Forwarded-Encrypted: i=1; AKwUvByr7g7tL6+R9Ud1TWGrihjXMk5yhap154RsVlSsv1+wjKJdSknbdZLoefjIrC+zOkAY3Uze/qFWNCGgl1U=@vger.kernel.org
X-Gm-Message-State: AFuF++ldFXkJN/837fIOw1nEnZvfJwczl0APlj6a7adsOJWEJp8T4TDf
	nvbyQLmsady4Nt2ZGTJXRmFS45KXSXPC/ZSLfUnhUQkisR1c4AsqfOPv
X-Gm-Gg: AYBFou27cKIyOLkkslxLUjs/klsxFxiT5lT5YbL5a1LqZ3noA1YmAqxRvi6ZxCZLYl3
	Wb1Ov6LHuRY6pGb5juz+3P57FrqjUD2Z8NDwCo1W1GPT09zC+jV3kYnLJpxpUwz/zgAmStqL2P1
	UaPDfER4nNKD545C/+t/V+HNbZePQNiSnPzfDN0xM4y8hRxBL530k60KiHCWnaol4MEWVG+hagr
	BLLkbz6rFTVm3gPjHei69tPuGl2rZmG4wSRM3tEpJ5I48w6E5rF3/s//DcmPhvhbbZHijDJ4djP
	57AKMkmKr/AMK1Fr8VxXLSi5yfC5dBkXR23dyRCyIojVISlzjnPipQHkNo9ZqfGZSFyZbPhHF2j
	AM3E+UirZRf85OygJsovusp/Qs3fjL3c+kN1gdq1IpLSHUVW5wrZJoVjLXMJ++lrCS2f1hDuDcI
	xJsSWXJ1RcPoKwLU7inlW2m1VPNhlTJqWYbkQeZw/zoQhGxGdBEr8uNvclG0UGBP+4aTGLOYkHz
	zKTdXQODjDvCovrFiSnYMkhf+QBATMtRBmlxtNokhq+ZnNAmu9nE5CF3xR93+3u0OU8y5lzN3T3
	4EGQ7yXn8qnAlSccprj2Y0Uo4QaSQLMnLKLnu/J0WdAw2OwloHR4yxbA+jY=
X-Received: by 2002:a17:90b:258f:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3a0982a7f75mr2180909a91.0.1790293117765;
        Thu, 24 Sep 2026 16:38:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b7d11124sm1307931a91.10.2026.09.24.16.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:38:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3 2/2] ARM: dts: broadcom: model USB VBUS power with regulator-fixed
Date: Thu, 24 Sep 2026 16:38:31 -0700
Message-ID: <20260924233831.127617-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924233831.127617-1-rosenp@gmail.com>
References: <20260924233831.127617-1-rosenp@gmail.com>
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

