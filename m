Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B40A3DAAAB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164922; cv=none; b=sOYSSXjmq2jodCRNH9/LlGWzvrP7PSjwYme2zofJAL4YVUBYxkrDAPtO4tqqeHLtvxPm+8DJ9eqHjx6/HfL0Amzf25s8gCYb+e+gWU9bb8QeWNNNn+ZkYupbAA6wZJOnCeUho73ZbsaWn4wJPAGafLq14l5jN4t/0Js45MvmSZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164922; c=relaxed/simple;
	bh=EUGGUwRpDjNyAsnmTwsH+7qy3pCx+bRE90pl3e8XqMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXmDxd4cwosDsm/uV7zvSy0g0Ap+op6HeE3Z107h+CIqw+TgtCMXMGBRxyw7qriBGLdlhPKpumxqBYqIFSiSUH33ye897TsV4Z8/xgUdjwWc8aZ4OQcRLbccMvMj0+smPoLn67zGPZAIwyCgdu751W/fb2oD6axNENCV+4TWACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pGBkWm9r; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pGBkWm9r"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso492005e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164917; x=1789769717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QeSlDRgaiFiP620nk2cfLEt5zYVqqWMK+mQKVyliaDE=;
        b=pGBkWm9r7J37Mjmxlq4iN4GSs4XMc/iuMhZdeoTBrU/6KaCreOCMsc+giXkyq9nx+z
         gf2O/3qk+nJTV0ynzy3SuZge/Zjz77mJEFR/ZoRkY1wgRN2K7gfnLVwpFl8/GZhCNwYe
         nMomsDfkUgeiHoGl2vZiNO5rvtVxEP/WimMZLwRqM3hPzCI+K9PZxx+w5HsT9pCHcz0+
         TwU6D6RfqJvReO8nl1Eof6R3hrOt57GyFSkEy0eMnfMtYKhz+G1vejl4PcqAiZdox48K
         cLEGoFi+HHiV/TgbA3PgobkmJAgvVd9W8i42zlNEdRYDGajO99ZDjixUf8MZtCiRhBmw
         N1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164917; x=1789769717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeSlDRgaiFiP620nk2cfLEt5zYVqqWMK+mQKVyliaDE=;
        b=s0IKyrktfx7Dq4pH3PfWKUFaqhAZeFjd5+YModnl6Bpk3d45CXdFrdhdIOoQr5ctUY
         n+rEydAVL71dOYGqLTjEjZY0XSNdj4VP5J7A3hRBkzcOTL8odzQmX3M6hgldzIWhCYoy
         GiFF2lQd22f/gLTXZO7HQQF8zgVXLuXKrbA853d2KzoBGloFMVqE3Ai7fkOygkMpoUi3
         GpMwseZonM7O3Wm2gEGasPndkGODbbsqe9ehGWq3P9C7BhFEo+d57gAZ9nzn6eg/qc/l
         WwEjhtvxfAjD2fynQNd3G1PU4kkxs9QYoq1t93Ol0V4vmYQh2pNyb9zfeuMjnf9gzGmz
         NUXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxutYsPkcs7xYfaB3sLmx/thqZR7JhX3TnP+T0PZoKpp4Tk4kbQqr2OFr1h+ln5K8ThB7sxeV5wUiCMm+s=@vger.kernel.org
X-Gm-Message-State: AFuF++kQg21Kgw5Ng3WukAN9TY5IMP0W92m/G+I60u4NBowljpljdR91
	cgPrMEAS/dSvlV6ZKcbnFxBM+9RxpQrBb1fr0KRVgwuLjJV/ggOJ99aCFV+gCkFAhM0=
X-Gm-Gg: AYBFou3I+AzqKtl038yZGxGG/lrlNBOhL8XyuqejvvgZeWaAGLo4lk5sgqZbMq9zLFq
	Q0T0XXGNSBXo1B2sSYaXuCbcmf4T83Z40v8tpxL7L41WpEuDHcglTQInt4NTsx/dyht6IH9kz3+
	WBBCs0HDzq6HlloqrHUcrs5vVxCKzhSQAL008BbI/NVxuk+ln41nj9BAWO3+wcdMlMA6k1+RTlX
	H5XmeRZSi+rQMkFBIAcYFEW7c/WSsQied1jAiigPy1z82xE2GVrewV3CEDUO30aZPMwB0TVj0it
	yAea/f7++0BDL68k59T4DBj9A7ap8wcy5DkuW+BBoGDngqWBJ30oCoWueskLylAfTyOfSk65c/d
	bR6OVdqt/Nq79sCcTs+SYmrCAQONSZ7jVDiUxoLc3QsXtQnAT+OCiffFy2XwQ0ixQs1rdz40aew
	wrQcgSjL5+aTmmCdTMyg3xL8MqRez847EJg5/GsjE2QDg2ZjN6L7E+ti2D2WT3SLx5UQ==
X-Received: by 2002:a05:600c:1547:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49e6cc0ac84mr1059775e9.23.1789164917318;
        Fri, 11 Sep 2026 15:15:17 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:16 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:36 +0200
Subject: [PATCH 6/6] arm64: dts: amlogic: gx: add nodes for audin and its
 FIFOs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-audin-v1-6-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=EUGGUwRpDjNyAsnmTwsH+7qy3pCx+bRE90pl3e8XqMc=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanMn9J9aIburev1R2ddz4/cemHtN0X3PRU0urU1+S
 zwfLZywsqOUhUGMi0FWTJGFZfq93wWlag+NE04WwMxhZQIZwsDFKQATqZ3F8N9rQ+sXZ+ZHhp/k
 Dh+ZUv1toVF8w/YZodcnWK37/HJjYK4RI8O/5S9Kz3ZJbef5zJFp/PBv1d7/885bTRAS1vwe4/K
 u6xAjAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add nodes to provide audio input support to Amlogic Meson GXBB/GXL
platforms:
- audin is the parent node that spans the entire register range and
  implements the data formatters.
- audin_fifo are the child nodes that implement the FIFO: they receive
  formatted data from the interfaces and then bulk transfer it to RAM
  when the FIFO is full.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to and OdroidC2 (Meson GXBB) board
using a custom hat board.

The following additions are required on 'amlogic/meson-gxbb-odroidc2.dts'
to make that hat board to work:

    &sound {
            audio-aux-devs = <&audin>;
            audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture",
                            "AUDIN FIFO0 I2S IN", "AUDIN I2S Formatter";

            dai-link-1 {
                    codec-1 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-2 {
                    sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
                    dai-format = "i2s";
                    mclk-fs = <256>;

                    codec-0 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-3 {
                    sound-dai = <&audin_fifo0>;
            };
    };

    &audin {
            status = "okay";
    };

    &audin_fifo0 {
            status = "okay";
    };

Then, from userspace:

    $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
    $ arecord -l  # find the "FIFO Capture" device
    $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 35 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 22 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 22 ++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..68632ed86e8c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,41 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,meson-gx-audin";
+				reg = <0x0 0xa000 0x0 0x308>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x0 0xa000 0x308>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				status = "disabled";
+
+				audin_fifo0: audio-controller@80 {
+					compatible = "amlogic,meson-gx-audin-fifo";
+					reg = <0x80 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "AUDIN FIFO0";
+					status = "disabled";
+				};
+
+				audin_fifo1: audio-controller@cc {
+					compatible = "amlogic,meson-gx-audin-fifo";
+					reg = <0xcc 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "AUDIN FIFO1";
+					status = "disabled";
+				};
+
+				audin_fifo2: audio-controller@114 {
+					compatible = "amlogic,meson-gx-audin-fifo";
+					reg = <0x114 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "AUDIN FIFO2";
+					status = "disabled";
+				};
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..53cc92ebbc9f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,28 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,meson-gxbb-audin",
+		     "amlogic,meson-gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
+&audin_fifo0 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo1 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo2 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..be8fac36fb59 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,28 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,meson-gxl-audin",
+		     "amlogic,meson-gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
+&audin_fifo0 {
+	compatible = "amlogic,meson-gxl-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo1 {
+	compatible = "amlogic,meson-gxl-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo2 {
+	compatible = "amlogic,meson-gxl-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
 &apb {
 	usb2_phy0: phy@78000 {
 		compatible = "amlogic,meson-gxl-usb2-phy";

-- 
2.47.3

