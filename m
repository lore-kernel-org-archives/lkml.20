Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2635B446BE8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545600; cv=none; b=ZMIvzQcSkcZ7v0vZD8RR3N7aXTBONc0PwH1etQuBBhjB/YXDglcZjrSXgDXlnQ3P+t1I/0anG9mdLJSLIyr67zBjz+OA61B5PFOHaaZYoQaV9xI1JyY9KYDullVaAlUVkBhA/ZaYKk5e6QeVLJ3KFJhvydkeW0DtujdE9QtCXMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545600; c=relaxed/simple;
	bh=gM8tPRMx33Qx0BJjFPOzM7No2FKd/oVjiOutbBIFOqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ra27jKhmK1sBD70hnIgE5kgwFjpzEhFGdojSIj+33BQkhgMv9Lyd2+Z2Qu/asosVjSkJi+SWv2ssUCUiPhlnrJg4QzT+6DMkrWmJBaBHKezO6ThV5RW/l8wyhPhTk3JNKzw4VSqzGCY74IWt6zycih9SGOR45dJyvdieeOcDevA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jdg7GW8C; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jdg7GW8C"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-395cf2535acso2053440a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545576; x=1790150376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=;
        b=jdg7GW8C1HHcNqR7aJd+x91iUTOLTL7Happ2lazp2b7ruVjlH7ScUU0ArKUwp0LXFU
         wRgvKrHC8NVrxJzF1Ag6XfzZN6HnbPO9Wsozn7hnxgChR/hXqispWTs3/0HIo2hCKDeo
         DJtRtuSixpbhyxM+rEX1IOndzpapMamJGrttA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545576; x=1790150376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=;
        b=hfEdcIH5dfppTdRzAHWWbTp6+H3IoliDngemf/KyeyAQIEGL9oHK3Xt3ZnkCD6If6+
         zdIdOBGsWf9363MnDsHzO9ZHJc7GOHJCundctGNXd1X8dkjmgPfHkVcL/EAWf44U2tiw
         acESAgXY4VNobM8Z1yFLHpZfNpCP/wjtT1neBlydGdJHenymkG0TMGTZ/MNfwitb+6DC
         e/ZlO1UtPamhR6fI+j2+8CfefZrS2iSeh3nyyn7X06E21IlD2K3ARUAULtSGJim9hV2H
         4bj09CwBlNLsK+S0tFr9YFMf1iBmDAnDdOsqm6vo2JUWJINdMxWu0wp7RQG7tIQ5/kzy
         V2Gg==
X-Forwarded-Encrypted: i=1; AKwUvBwX4K3W2HQp/SLxbh2V3KHq6U/teavJy703gW/wPIBD44L6+JluWssoOIZQHuQg5BdAdhuXiDQu0HIb7M0=@vger.kernel.org
X-Gm-Message-State: AFuF++kx2eKcmYxRUuDctuF2iOxw0IKk7ZNvGeBfLyuMSVUv4D1eob6I
	1Le+Nsg5p362QMQ9qud7K5lz/Po1jTPBY/J/le8Qf3lEhNYRHC8NxLR2fR908GcExg==
X-Gm-Gg: AYBFou3mxZQb0LocXUVhYgfuMcoDnRuSGVhVsAJHGRM3W2+ML27qEq7OQ2b2nLAxH4j
	9vuIv0fqPRNpQ2sKgHFSMaAwACM/fPZVl7GHO+4mxbl3oCrRL+NFCJJWqfk7PMbT9D3cHurwXy4
	jUH3K7uITD5PnLwjt3n1mCTd8K/qIoIAR1yuRmRzVXbUDngVaToLc4AoZrNtUz6ckbny5flf8ym
	XLLSmqn6cnsIHGU9wI77f3N2e3tkXe959j4iC+v7583pFolFDnyosVxYcm3zK/Rqzkj0PMh3qLP
	VXHNRd+pbg62F8CjEOoeXuBLT2wAZEjG3T0sSEZMLbrA8L5N5MktVyIrCRBr56b4eQqyk0WTfpp
	3ipJ3aN1rcpejALO5svkgKQT+JIRIvUoeLUWIWkzOqPxnsqtvA/Lb+GrCJ2WbA20cI8zht7DwmR
	jo7sYaRhxEtbTVFoejoslMVnX8AibPwgBhAKhr3EKUbg7kfyan62RDma5rXMVtLtwudt3Gwjy9G
	kz/jT3/n5S8pGuBd4CBz8TXcHi3C5iToeLiLvIl7gZUdLkum6CwzMlCUWqNl+k4gzHP
X-Received: by 2002:a17:90b:3c08:b0:39e:fe9:c5b8 with SMTP id 98e67ed59e1d1-39e0fe9c653mr6440889a91.10.1789545575967;
        Wed, 16 Sep 2026 00:59:35 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 14/15] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Wed, 16 Sep 2026 15:57:40 +0800
Message-ID: <20260916075745.3549953-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 +++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f06ca2bc165d..5d65f4554c6e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -271,6 +271,47 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		w-disable1-gpios = <&pio 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 59 GPIO_ACTIVE_LOW>;
+		/* PCIe auxiliary signals wired to controller. */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wifi_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie1_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				bt_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&usb3_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &adsp {
@@ -796,14 +837,14 @@ pcie@0 {
 		reg = <0 0 0 0 0>;
 		device_type = "pci";
 		num-lanes = <1>;
-		vpcie3v3-supply = <&pp3300_wlan>;
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi@0 {
-			reg = <0 0 0 0 0>;
-			wakeup-source;
+		port {
+			pcie1_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1090,6 +1131,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1642,9 +1690,24 @@ &xhci2 {
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
-	vbus-supply = <&pp3300_wlan>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb3_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.55.0.1032.g73a4cd73de-goog

