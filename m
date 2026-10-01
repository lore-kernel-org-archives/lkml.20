Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC69468C0F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870809; cv=none; b=rO3cNZrJoOpLj5q+TH+YhsclCKnjjW8ftZaZo3esDVk9nmFGmfHSAg5BjFjDZunio85HZQliUga6OYRxxJdQwe/AQ8RGqJ7e2QKXsWYT13HSsZsyj7k1WJHxQsPK0t4EKEJea8dL4+mVkzoo6BRAcNkiaByNybCqkWwimDypH9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870809; c=relaxed/simple;
	bh=/Q2BrDG59GmMlxGGtQS3aLFT+KnRGjYRz96TAYWMkFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyCwMY7Fr9s+dqz029L4AM3mgZ2ZZCGl2bLl6uYd1fKTjJJMTh7qpcXTyVDWh9o3Nmtf+sL9070TbvCBgbeZH96ZMTLfSYe4VD8VL1pmAGuIc/UqqfbjsYwKnxu5AIHUvkHyWtr4ueYY2FXFN2JWZ5+VYeCJUebvZpFNs4XtdJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Fp3PL77K; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Fp3PL77K"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a024e16179so3438045e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870805; x=1791475605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ij5hZ/f/5ZSAVNfXmFdWrj1YYWFbkwnSZJULxesQxbM=;
        b=Fp3PL77KkPiQxkZBc2knFccmUX4dAFBbdBbjP9AojRAzbftWIMcUE579HOJbTB3VkC
         2plLXw+QuV4nn93elE/hNB6yExUFK76RIWiSYAZ3yPQB90MIkYd7h6lM5B8Rb+xhI3Zb
         PYMWE6C8j9AhZzzQbBEUyudMPTIUbJPnIpWeE4NDIWKxb3KZVzUTrg6ZD7v9L3PcY9Rt
         yv95KZBLpMNzr/J9WIC8ZHjzj7ia+0AsGWxPQ7L32na47yQ7QfsvvM2+ylKry01z/MOr
         VvH8MnNRGDY1vespw4Fo93rK1PfbQDSuxK3c4xe/eMKYEKpkrBAyaKfDWiZ3O1VMQws6
         6l6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870805; x=1791475605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij5hZ/f/5ZSAVNfXmFdWrj1YYWFbkwnSZJULxesQxbM=;
        b=k4Zv2gWqwo6w+z3+CdzQrjlIBBVZrj8dUFUYi3ihDO7BFQ/byMY/WdgPRrCC9nzqIF
         JeMBLAOwczsFeZarFwudBkLZVwo7bjbUz/bjwEc3py5Zo5sRCTBMpUYsOvuegK4xMWSg
         39OLY1t55LGgMj+DglFkFqw6lIRIf4AqE+nluanCzJalLIlpHeuEQp+Jrg9ezZNIk1Ta
         UVuXxhKHP6AT6qA1EcbIF923+n0Koh3UZzYBv1+7VUtJS0JuBOu+QFWiO8sdtdS7BmXE
         cyPg8uWggQNYge3R6YnSS6zZyow63M87WERyOuylw6QSUlsDxCpaoLB4AHQw9bJiC85j
         3tug==
X-Forwarded-Encrypted: i=1; AKwUvByoyajyFZ5wg57KUlkL0NVAb2wClMgqhWkK/MoC5JyHHhfb3HfD6vqki3EfBYxSY2Z6NuJuC9iOhH0nL1I=@vger.kernel.org
X-Gm-Message-State: AFuF++kfVaSY7nr80GCQwhDoDPyAmsMTw4WY2mV4k9dwgjZQG4q2PTRW
	o/Zm4WDXOYOKuybLOdoQCeC1AyxoJqhWtsjPHxUpK+JVmMGZOH2/biPESNnKQ76B3Po=
X-Gm-Gg: AYBFou02iwRWLqQli4luCP88N6dC490XOsguTYYyLSWfsehIxQ5crcgvC8kCLMhCIMn
	B8yvzbhYUf8gN5KzB54hSS5QZ4EKRTMfDpLOgGX26IAQiqmZN24uts0Mn6P56y98HzopVUWxKZZ
	LxkpWxB/mr2tWk1SuafSJbKQJYwDn0ITTNEs8vzjydnglYPvOo1RmrUPwE7QIh8IrHmNBtlDzGC
	ystaRcSBm+aC6MPXR0euHBV0wPs1Mt0YJ86cP46AVrzntfSsPnDqDOUA6wPvaTtkYOwaEuU2f8A
	jz1QenmkgglBExU5k9tW9YUtMMB+5yxMM693WH9hv7/MaqsKw75TdtWf1EYMhv7xXkX+oonNGHN
	ewWlXvv3eQoOoFTpktyNHnwByUNhP7bJVXP7uWVt76pNEkRBSNZenY58qfwLlH+dMzW5NnJwYCB
	YfgFsqdo3lg12u5+hwCf0mI2jFYjDv3YW8/Hb3JGOVdrnrPCNi1nZycWOpIByV9zoL
X-Received: by 2002:a05:600c:6091:b0:4a0:a34:f6fe with SMTP id 5b1f17b1804b1-4a027577f81mr1689465e9.17.1790870804666;
        Thu, 01 Oct 2026 09:06:44 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:44 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:32 +0200
Subject: [PATCH v4 7/7] arm64: dts: amlogic: gx: add AUDIN node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-7-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3008; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=/Q2BrDG59GmMlxGGtQS3aLFT+KnRGjYRz96TAYWMkFk=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrmf3L3b+J6zXq3/e8YmKettBq/Sry057jXRQ+VYt
 P1Sa2PNjhIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExkigYjQ8+B1u1S3P6FHOV2
 drLNsuWG/ybtmm7978aTy/LL5rK47GT4cbX1npJ8voJV69w52luWKnJtFVn/+U93yXtBvqmTtp3
 hBAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

AUDIN provides audio input support to Amlogic GXBB/GXL SoCs.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to an OdroidC2 (GXBB) board using a
custom hat board.

The following additions/overlay are required on top of
'amlogic/meson-gxbb-odroidc2.dts' to make that hat board to work:

    &sound {
            audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture";

            dai-link-1 {
                    codec-1 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-3 {
                    sound-dai = <&audin 0>;
            };
    };

    &audin {
            status = "okay";
    };

Then, from userspace:

    $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
    $ arecord -l  # find the "FIFO Capture" device
    $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..2b92a99ab2cb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,15 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,gxbb-audin";
+				reg = <0x0 0xa000 0x0 0x148>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				#sound-dai-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..8f3c7ca06a3c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,11 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..de213c0b63a3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxl-audin", "amlogic,gxbb-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &apb {
 	usb2_phy0: phy@78000 {
 		compatible = "amlogic,meson-gxl-usb2-phy";

-- 
2.47.3

