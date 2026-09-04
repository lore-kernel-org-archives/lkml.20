Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD297390223
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562629; cv=none; b=CjCRQS/JhXbIayjLfqg7JORKpmGxkMWh0PssetpRGXFc/ud80YrGoPslVHGlnoQrsfbQAWZ05T7Pah5zBAx6Wo6qDAnFo/lOHIHmxbO1zgpXQLnED24IIphvSrXx5lxPzJVBBey9lzYxlQVOFgLqGgHviSuCsns9XOZosMAcCsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562629; c=relaxed/simple;
	bh=dzEvNmjdyNIVi6iYSCSIFXaRFg+2yslmOVwcjZe1bEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SCoOfgEdHL9Otg1sjQZ41LWkTsg62+YFilyZbzj/z+OWXIwsvjbJXSP+x2Ldx8t7X7SgiXZWXw38rjEyTyuyYqnWSSytCnEYHdmfv/XavGa+2k51p+Nhvs/ZG63hLWaURYLRjxgywz+aeMNpUB5CJbXdEIPq54v4DWIvllUYFYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B9myiEYV; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B9myiEYV"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398e9698a70so1364314a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788562626; x=1789167426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y0qNwPkJWJhdb13h4cmrx4hOhK/NXhQErJYGrT9/AmE=;
        b=B9myiEYVJFRW2vQsxbOzMFOiopL0j54Ex4bhdxDJwEMXoyV0Kj3H5msnKjPdw0siVp
         /+Ryvcq47jBWZDcZbnWj0AaqqhM1i6AZnMsTU7G3PHknBIaBy+O3IWDptlLDOu4ZaUJ5
         b/8iKvJeo0vhIq2wEDStnKHyukTCzbuiXryz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788562626; x=1789167426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0qNwPkJWJhdb13h4cmrx4hOhK/NXhQErJYGrT9/AmE=;
        b=FtYhcgA0yNzXUxo01xymhUNvrOdZl+sOumt8wg/jJNr/5KXvlsuirkzTL1de2tfWNQ
         2LqK9tJqmkBxjOlvPZfTibpc7Xg7Uml9ex+4+eb3iWCPfoirxzSSnNn+FuQ/K/ltKzYD
         6LFNObqWf215/4rOhpxf7PfVBexI3yPdCs1R03QFbdAXljWOxatxvlyM6fSe3GI1RB/e
         UIWqY8g3y0Q7N9duicgnBQmDCkYSjuIUEcdhJeZg0/FrSSmTQgKAhBCfJ1F2ZxmT/kZF
         7Z6eO5WhTV1W6uM1xP2G03D3iSOYYnMyeVkVffRMd5xR8ETrLJoOgtbMBTtZSJiPr3J2
         czDw==
X-Forwarded-Encrypted: i=1; AKwUvBwh5nBNWZCdCX5UALURQteUjROf5WyX25aNhzwwCgf55beG1UaI0RYo39AhNNuWwCAdziiCKF5yiVGG/Cs=@vger.kernel.org
X-Gm-Message-State: AFuF++moV1c5PYE6XRJWW8fQ7c15fqoCckVi3OC6j5DwzkRXGuU5AIH8
	I18ukh+RWpr3K/GgbmNqdTUS9WdDXJ6x/2sJB3l/yHh/UflOdFMNinaVPJQ208oYmw==
X-Gm-Gg: AYBFou19ZMzK0KXMDwaCnNCGW7Z7Kc9W8xGgCNiIJNVa6Iuh53812JjLfT7wmw0xANi
	y6Lm4oaBuphg+Td7BdOUfWhexIu1246k97vxFuY18u2xe/XH7NQzZesXcRGdxOrZlRJJFAjc5uv
	e6ZEgXbOGjj4v0/DKoZ7FWjzw9MyFlPQPiSkeZ1iBcilk4omOl7M0afa4OfI4RnXYRxQqrBsvF4
	3mRb5LT0MDGLomVLQ0lDae+R2XYu9+0e/zrts1wHDnV/jdBez5s3fKYuwtbPd5beuTQootz3u1r
	ZwTI1LyTsYie7tgd7eSB91vjOLD1flvBIT2rQA46GmgxOZXUictevLgkY70NRjakDkozOrB+6fX
	9DngOa99ofsUhXm93s++GE2aY+tbj4rm4fy73GK/leN6x4JA8w5LBtZVw48SE9S0PY8dZSZR2tl
	RxLWpn14WXv+LqB9eQE2HCfWMFy0sXF3ImMzKHIO6EVdI00roYI7l6eczJ0tzk+QjXkGa02XTph
	t0wuKE8UNLXHoWiAd0kgeG4UqeX0x0fHjIX4Tw=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr13463573a91.16.1788562625925;
        Fri, 04 Sep 2026 15:57:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5597:62ab:c321:4a7f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3339aa37dbdsm8157345eec.11.2026.09.04.15.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 15:57:04 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware
Date: Fri,  4 Sep 2026 15:56:22 -0700
Message-ID: <20260904155621.v2.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
        firmware {
                ranges;

                coreboot {
                        compatible = "coreboot";
                        reg = <...>;
                        ...;
                };
        };
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v1 series:
https://lore.kernel.org/all/20260428200712.2660635-1-briannorris@chromium.org/

There is a little more background in the v1 cover letter. I didn't feel
like a new cover letter was needed for a single patch-resend.

Changes in v2:
 * resent separately from the series, since the rest were applied by
   their maintainers
 * trim other-arch maintainers from CC list
 * Add Reviewed-by
 * Add missing linux-mediatek@lists.infradead.org Cc. It claims to be
   moderated, and its "join" seems broken, so I'll probably get bounced.
   (https://lists.openwrt.org/mailman/subscribe/linux-mediatek is
   disabled, and linux-mediatek-join@lists.openwrt.org gives me error 550)
 * otherwise, no change from v1

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
 6 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..777da2129e77 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -16,6 +16,11 @@ aliases {
 		mmc2 = &mmc3;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 69cab9f9c530..fa359440ed60 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -22,6 +22,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells <2>;
+		#size-cells <2>;
+	};
+
 	backlight_lcd0: backlight_lcd0 {
 		compatible = "pwm-backlight";
 		pwms = <&pwm0 0 500000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index ff20376a44d7..2b327d9ef65e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -26,6 +26,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size should be filled in by the bootloader. */
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..c65805f2a7e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -41,6 +41,11 @@ dmic-codec {
 		wakeup-delay-ms = <100>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size will be filled in by the bootloader */
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 40d34b16dc80..e8ebbb74987f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..f06ca2bc165d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -42,6 +42,11 @@ dmic-codec {
 		wakeup-delay-ms = <50>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.55.0.979.g7e5102b832-goog

