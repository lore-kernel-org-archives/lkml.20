Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312B05625FB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092902; cv=none; b=pSa85QDMGWz9n62QUBM8Qz/Ujv1f8GqLkp/VGaRYGQ6aMSkWPcythCYpl8PUbF3++5RVg3J4lpYRlSACZ9nPTM6/3mjs4D3iHfXv6pA3C/+fG3bon6qQMpCwM2jb29q0yzf8Ym864azOVN6q95KOq6GOe/FGFyKjh7wfmG8zHUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092902; c=relaxed/simple;
	bh=TZWXiYpGe3PgSXyHXeQpQDxriAYLZIkbRgm507qkSqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pgty1QLT7asLiHgd892LgDxPo2Alb1og19ymwRCCWg9LbTdIk4p9zxyDqU69wEE/4zcnHv/KT6GAPYCVAp5JWj6vb3zs3z+aUsWjNh15hihnMl+tiWzIxghLnY277Qp2suZ+0oAus9Keovp0/HijW/XlZQ0DKMOsADfAGLAGQmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EvSLqEtG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EvSLqEtG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so57835715e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092898; x=1790697698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=;
        b=EvSLqEtGPHpxPy4Sw8qtL5Ih9TQCv4qaPRn0hPJ4wQF/s//LGPB3H2lBf34pulVbva
         QKzBiSJYiseJA2g8aXMD6eilM1oAAHPS2Ockkk949SAQ6zOavkBLgJv3/en+fIba/63M
         3MMPZjUgixNHYg5WrXmVeBrHHMV56rqX/+APoJMmhAw3zbpNECjlDLW8C9DURHzIQyuE
         BLOIXlozE8Gu3ALri5STVf86/0mOZnArjVjXpLZFNvXPow40epWGDxHSo7UBMvqYrean
         5aIBUFWYv7u0Z5YH2Ra/DSlGMp3eFY6ItFd6QlJe7XIDJdQZaA7/sXcy2DVtprgbewQy
         FstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092898; x=1790697698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=;
        b=f1B1p75NnVkDQoy8gmkDRva9F3ear4VufdufSRUlmuvbFhtMNWj1oEaKg8lOpEZo6d
         Yig8aeTUmwfAa5FXFAP4WNhz41aLYuk6/xywXlgWmfFWBSf++GWUR7OrJPgd4GFW4INi
         crgcT+RH9L6zEtCh4RzEO2qZSOxYAuGobzaK4X30mhwrTdyBnH3XseD4TCuc/EA/Sm+p
         0+RgC76lx96V4SeQhbhHr0KAkvkBv/VOHubgifumJt6RrrDiLb5T63wh2WThajfaSv36
         a2LtFTyJEwWz758SutK+pwDOON19p+foUdZB6atKJnRRGKIYZhT46TUgT1Uyjs96prpt
         0bng==
X-Forwarded-Encrypted: i=1; AKwUvBwiukQ0GbghtuK9EFdMrqhWUeNRind9IgBHxyAGFIgJW2oycB5R4pibWQdcsNdJI7WO/pmLE7Jl3/YzVTM=@vger.kernel.org
X-Gm-Message-State: AFuF++k+Tgc6wuo54jueXvHGQGXH4m9yiDD1dVVDKmxD9hwk16utykjJ
	b60MWeR67wZU7L/UkSVKgit92GM4m2tuEJpZO0zmxjtIbKmh+/CnqGM81wwh+MaoJTo=
X-Gm-Gg: AYBFou31JkaBzHjMz/MxSXHmE4LzmctOLLDp4ExrrpkKI/4lQv8mWRb8dYqVjhuoV94
	Qu+2jZhzIQNkkxLHwmOFUYTx7AhI1RkYBCGmgzYIA7fRfTQYQ7pQwr7dr7JwUztaKA1XdwOW7sp
	tFiaAdE6uM203fIPcICgG6TPZE61lspUZjddy08SMm+Hyh70ChP1ZnpZnaByP7MGi9QVYllIgfG
	I7nlFXS+IjTERNkoRLx8d45nTCxZV/fhkOkjYVt5R1LrklzJjCFdEO3EojoQ/rgbAVnC6x3PxRI
	O8agArNQJvUoIaj8GEm0qSYet6omoEqFg8FKTNF75AzDUCHNm1wI8MlQB7Sjci0kwthpLIQ8/uc
	//M6stqmIDrpzY+JGNmZU1/XT935/XWh/3nlqvtfzxNVtSTWWyigGzaqre3zd++xE8amIHGZ1OL
	gaxrEBQmBgVeFXu3tIA3Jyc4XgsRp8WTIrQ385G/as36jffbhk3wmx5DNdiAhcfejbNg==
X-Received: by 2002:a05:600c:37ce:b0:49e:799a:8952 with SMTP id 5b1f17b1804b1-49fc5743c81mr211815845e9.26.1790092898289;
        Tue, 22 Sep 2026 09:01:38 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:38 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:52 +0200
Subject: [PATCH v3 7/7] arm64: dts: amlogic: gx: add AUDIN node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-7-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=TZWXiYpGe3PgSXyHXeQpQDxriAYLZIkbRgm507qkSqQ=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkUluVq2notODD5885mM8wnW4gkfrmuWbj2g/WZV3
 jkRm4BbHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZgI30GGf/YJqwxtZTav1WHf
 IHpv+n120WDjmKciN9d/vhsdFxNpacfwV6bGgXeD9emgB0cmu0q4L9Q0DGix8TRbL1T96nVa9Jf
 jbAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

AUDIN provides audio input support to Amlogic Meson GXBB/GXL platforms.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to an OdroidC2 (Meson GXBB) board
using a custom hat board.

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
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..54b6cc0bb8ff 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,15 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,gx-audin";
+				reg = <0x0 0xa000 0x0 0x148>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				#sound-dai-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..7ad69992a226 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxbb-audin", "amlogic,gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..9181eba81eb7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxl-audin", "amlogic,gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &apb {
 	usb2_phy0: phy@78000 {
 		compatible = "amlogic,meson-gxl-usb2-phy";

-- 
2.47.3

