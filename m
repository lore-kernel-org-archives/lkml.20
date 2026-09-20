Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0577470106
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938848; cv=none; b=OUhQGd83paLYhtY1V78RK2v+Pod6T/isLL0YJVTJfZDOc8I/6JO4tUV+zzqfjFI4HfKkwQsftLNqmxH3F3ODOyjGXxuBJ1Ef5Wl0PokOvnSW9mQ4vPM6UmrhoCK94qLEu8YZhOCoT17+hTL0MoOzWxxHrYS0Hdnib3h5qby3YO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938848; c=relaxed/simple;
	bh=YOWA2O3X1QEuvGt008dycBlt0GJGoH96hRzWxdnNBoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmKC5pkppkh/RM/aWVVnIpfCX2BfokmjfM09hGZ9A7guYscppi6uRcg5MeaXkIblObbhNOzkO7z4XyhKTovX9dYgTmTRl9EXFDB7d3LSL3YnRvsX7VF+/l3znkV228EVpm+jOrw8mepg+eEFe6us/Fml+22egrjUj7dQUFA92gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEnUAfFe; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEnUAfFe"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1828804a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938845; x=1790543645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eSh1hcyRa6PM+nUi/uX4COeerBsZk9RanDJW9q2qpoQ=;
        b=rEnUAfFedeHX56c5KIoMCcQjY5p35I/LLhMsgFE6YI9SzhjeHGBaLBNJZuKfvx/gLC
         jb0WrM1yfSoXom8q3DsCBooolu0Qv1RHvSmVX+1ObHPdyiZSMEtXr4ihvaE+3bofcfkX
         rtBfJHNuRS35WLvk6sF0RKZTa/WSSM1hC1LuQ8dmdrsfW6yYaqhPg2DrtxT8ExD7xCHe
         yNILZV8gr4RRxcJT0teiWjhFDKq+Wz4igDI5wKoCNm2PxSehOT9oC6mI/Kh+2zlsvx0w
         adYPobMlRgVay9XiGXApHk202jr+cXETDk3N8np4Qk5n+ch45aew2wmeXdsyLHMso7CZ
         7vyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938845; x=1790543645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eSh1hcyRa6PM+nUi/uX4COeerBsZk9RanDJW9q2qpoQ=;
        b=h/3YMr2Dl7CSSMz2qAIEdH2x5f2csA7GHEoA8HSl0dVhPNiJJGgk3CzUlky+B9JL8l
         eyU5AkCr7p0x5L73ktPLXMXXp3EcCMjSeOthufVGbIGBfuS2xvAZ3HX7bK9dEdfbHEjc
         JbTsO/g4g7gcxsOqRKxAgJVMmEYof/qCbi6/3XbmjhblHWgdoyo+Tl9aIoegJaSGAHlD
         bBHVvujBJNTdpJGBohg3khWYUENzEaCshNiBzUJOg+9VTZyHQtGEfvJ1Pdh3Y+ub11o4
         Ixhh0RLDS3NW2CIbjtHIUtCV2p4K7nw98ioF75PX09eSS+zwLYGjXVW5YZpAxM96nQM3
         zkjA==
X-Forwarded-Encrypted: i=1; AKwUvBxDk3AtlhPX9fNoTvfoL0/pYi36suY/HozR20At2iaiiBbUrtA5iKKVvHW3/HNt9zTIn48QpebQR7nfTzE=@vger.kernel.org
X-Gm-Message-State: AFuF++nGhzMfPIchWWGsA6PeHOErnW4ZrMonfKnz+9oGptPbGFQMoyy6
	f4CUIwOOMqLsMbjUUWyJv+Tt0S2DmYgp3lGjLhOD6LYcgVGARa2nDEGB
X-Gm-Gg: AYBFou2WIti8ngbOfhId0MBqZiJ8FrwDZjKbh1uTqRV+kTyR6mrrofcTgGethEfv4r/
	rkRDHRHHNcpqRueDe17Eq/d59fkq28q9jQM3QfqH5QAZmggFrJH7U/PPAeLFPC3ja0FBsh/RaGq
	2KeQ2l7114P9zmTUWCZSxCLjPhnMMVsFh5BYvpDV8QkWkHEGneZRJFZh/XC+ZYGmYoXTgEVkxYh
	FgKzYXlkxKwNYVfgLa1fNYS3tqpNz3/mpqbkW/sDNuS+T7MylDPFyO/VrbfSNVA0nkHGopXTKv1
	ACUvamZVXnLDfbEan0xeaRxolwM5fDfHtlfZiyizhDB3NXjYEXhGNgAitA/awEcWZ0SaqKgn24m
	8RQymuKbwruJjD8fuz9Tzrgyq/v/7tq6qQmt8tHlaUJsfSv4cFrbzobYQX3xcffOHN3dXgNiGZz
	eJLTelPxnyjCsDg7fjYSh9sxS7OgskpE6Os79/AGqwhk/y6SmxvrC36skOnuVFWncSIgPR0uxGA
	THzUJnjqwzcU/IvmCOM9WO3aX+RHt8tisKJ/GgD5kr7Qq9fS7njKyos81wIp1jh8VbkGIeex9e9
	xLbxg51BkpYkRY1rxNfMfKKz0v7z11zE8VE6HBHUAW6c/3K1WKM97Riwc7Y=
X-Received: by 2002:a17:90b:3eca:b0:39e:6a7f:1dc6 with SMTP id 98e67ed59e1d1-39e6a7f2209mr8464761a91.34.1789938845311;
        Sun, 20 Sep 2026 14:14:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm10609743a91.4.2026.09.20.14.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:14:04 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 2/2] ARM: dts: broadcom: model USB VBUS power with regulator-fixed
Date: Sun, 20 Sep 2026 14:13:56 -0700
Message-ID: <20260920211356.186967-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920211356.186967-1-rosenp@gmail.com>
References: <20260920211356.186967-1-rosenp@gmail.com>
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
 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 14 +++++++++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 25 ++++++++++++++++--
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 25 ++++++++++++++++--
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 14 +++++++++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 14 +++++++++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 14 +++++++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 14 +++++++++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 14 +++++++++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 14 +++++++++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 14 +++++++++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 14 +++++++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 26 +++++++++++++++++--
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 16 ++++++++++--
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 16 ++++++++++--
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 26 +++++++++++++++++--
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 14 +++++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 14 +++++++++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 14 +++++++++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 26 +++++++++++++++++--
 .../broadcom/bcm47094-linksys-panamera.dts    | 26 +++++++++++++++++--
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 14 +++++++++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 14 +++++++++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 14 +++++++++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 14 +++++++++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 14 +++++++++-
 25 files changed, 391 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
index f5c95c9a712e..1bedd74e40d0 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
@@ -129,8 +129,20 @@ port@4 {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
index 9f9084269ef5..faed5e0895c6 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1166dhp-common.dtsi
@@ -138,12 +138,33 @@ button-eject {
 	};
 };
 
+/ {
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
+};
+
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
index 95ef6ca7210b..6dcfb273329d 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
@@ -134,12 +134,33 @@ button-eject {
 	};
 };
 
+/ {
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
+};
+
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
index 03d5546a147c..41a02961763e 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -47,6 +47,18 @@ &usb3_phy {
 	status = "okay";
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index ad246f9a734a..31aa34288d18 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -44,6 +44,18 @@ &usb3_phy {
 	status = "okay";
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb3 {
-	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index 2bdbc7d18b0e..f8c8bb9e9661 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -83,8 +83,20 @@ button-restart {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb3 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 55f0d9e90d5f..4c9b11c798bc 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -88,5 +88,17 @@ &usb3_phy {
 };
 
 &usb3 {
-	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
+};
+
+/ {
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
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
index 73ff1694a4a0..87c4766d181c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
@@ -106,8 +106,20 @@ button-restart {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
index b6a5886698b2..3673d4b3c2b6 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-tplink-archer-c5-v2.dts
@@ -108,6 +108,18 @@ partition-file-system {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
index 3da2daee0c84..e97a41d1a400 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
@@ -141,8 +141,20 @@ port@4 {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
index b7cd2faa30ce..66c141ef9f6d 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-buffalo-wxr-1900dhp.dts
@@ -119,8 +119,20 @@ button-eject {
 };
 
 
+/ {
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
+
 &usb2 {
-	vcc-gpio = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &spi_nor {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 37593e7582ba..4d2663627d08 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -154,12 +154,34 @@ &usb3_phy {
 	status = "okay";
 };
 
+/ {
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
+};
+
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
index 24ba8f8f9bf3..1911daa84b08 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -93,12 +93,24 @@ button-restart {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
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
index a4b135d37659..5940f052b77f 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -186,12 +186,24 @@ wifi@0,0 {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
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
index 5a8b2b1567e6..69ff4f14b89e 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-tplink-archer-c9-v1.dts
@@ -92,12 +92,34 @@ button-restart {
 	};
 };
 
+/ {
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
+};
+
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
index 2d2e7e581291..29f54169d072 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
@@ -166,8 +166,20 @@ port@8 {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
index 8bf623c67de0..0906c0ef8182 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
@@ -150,8 +150,20 @@ port@4 {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb2 {
-	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index c5099defe9f9..046bca843e29 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -117,8 +117,20 @@ button-restart {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
index 944d592dee2c..1816f636b293 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
@@ -157,12 +157,34 @@ firmware@0 {
 	};
 };
 
+/ {
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
+};
+
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
index bdbd0f097925..b62ac448fe2d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -197,12 +197,34 @@ fixed-link {
 	};
 };
 
+/ {
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
+};
+
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
index e374062eb5b7..fbd362991e43 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
@@ -61,8 +61,20 @@ button-restart {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
index cf95af9db1e6..f1f099a90997 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
@@ -61,8 +61,20 @@ button-restart {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
index 4d0ba315a204..9420ae1367d8 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
@@ -101,8 +101,20 @@ button-restart {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &gmac0 {
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 8e487f60a2cc..f4f718b52c6f 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -97,8 +97,20 @@ wifi@0,0 {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb3 {
-	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
 
 &usb3_phy {
diff --git a/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts b/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts
index 0b8727ae6f16..fcb0bb9f3942 100644
--- a/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm947189acdbmr.dts
@@ -91,6 +91,18 @@ wifi@0,1,0 {
 	};
 };
 
+/ {
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vcc";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		gpios = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
 &usb2 {
-	vcc-gpio = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+	vbus-supply = <&usb_power>;
 };
-- 
2.55.0

