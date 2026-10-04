Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D094840B360
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094023; cv=none; b=Je3Fo1RQjfqluvuzrPO4ZfuW+Zb5CpInXYZ4mlML7gO81sWHPBPRJqEf/2PGsFUqARy4kUpOeZoUtVicLe6CA3VOxWwNBlSJKRh5xwoqkpxV1mbdvX3jOV9JuZ+6fkxfkpBx3uwDoj1dCzDl9+4Z8nRGePqrGiYQ+CQfu0IcayQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094023; c=relaxed/simple;
	bh=USmIbIxNd8CqGfdxvcD6LlyT9J8+ju7yBuayKmryPMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VatoQfDwJeKixg5geyGNlXoLIaKNF4FEfLNXto7qU4mi++slKUp08tjN2fzV5wU9ZKAmaNeU8Vlzpk02A477DMFCofyv5at1I9G5/5SvEmA2GPYWABk3LJg+RrqU2OjeD8yq1V97J6wv0QUDD9/Bk+tz/Tg2/T83ueLqdepy3MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPoZea0K; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPoZea0K"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so297654a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094021; x=1791698821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9eRBqZKtThzspVubPXk6ZwkfjHPkOgXRwJNp+IkXIw=;
        b=iPoZea0K9NNs0DFgcQY4+rV5shaxMJwg0bmHO6xB+uhRQyAWQ8fJwT9FYZ+Z4C5vdr
         KvgcaXCVr2jH6wljBijWRZKmwwGjEUJ8nkeRa8AqMPeNXF5qmiPAHbEiReqJFEZsbkGA
         /6QFwwJfC00sSQ9ObY24lz6AwBpuyrvqO4Oz7JEtNSQsvxhBW+ucoQ20E7PGUEllVZIX
         yDDEdUQVcPLmJOr2qkN2gsW9RtLPBzED9iGdabYgUmd6BzldjYTZzN1cJREu7lckUhfF
         VFmhywO3eBDKDqVZVSYrnYJ25pTmETjevap1qReWeWD9S3Ph90ujMlfnUr6KywBoqGKL
         kr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094021; x=1791698821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9eRBqZKtThzspVubPXk6ZwkfjHPkOgXRwJNp+IkXIw=;
        b=OgVBNf1c5XaD0GQZPvWWFUGn45ZI3jKNGg0sxkDHFLn237Tuv3Hkv5/VP7Q6XUSjUw
         DHt3PS/BP/FIcGUwTPpDGXaJeNKk7YjEbA1hoYd6+1tX1WWF+1BVsEBo9k60HGJrzhaz
         etl8eVcgaBxiKb9DZeOqT2iqP2gZe+dHA+NyXW/LlHqux2L/ASOMXug2c2zd6mP7Dg4x
         jM9tDSWuTpIcce7kgoj+xMC4wV3crOlbOR/BlLddXWNuCWEvw/glmC0HOUmYQGzoTo67
         78WVJU5Km0nIP58fx3gt97yGsYzyRt4vIIyYPF+kXztpKwGC55xUg719WHJksize0J36
         p9ew==
X-Forwarded-Encrypted: i=1; AKwUvBw77Ex6FxAwP5HSiLwcKThIUZ/53Df4mhQV2xUoJ338SHz//RPIrsiZMyHwQiEPNzOcrnN/ODeJNXoFvc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAOss4XRPMDw9eTkvM/Q5r7njDtfk0SWSuM2TTTRs5azm7FJxL
	ZjWGJF5xn2TtNzO0eme7GDuB/B3zb57+ykKbJkKn/EQGcep5hCVkhQseOs0gWwvq
X-Gm-Gg: AYBFou2ce1HwQKJYuzxSAllsiTHKrv2TQlu5wxCpZb/wb6UrvmMOYLoeXUjeWZJQvTj
	6v2Dc9kdlijlmCwWB9AyL6VZh5FqqZiXDoc60lnYnHK0O/q1AgbP54SzA4acvovxo+OM04PGyUa
	x3dW7QI5UO/LTSLOdMRtgPonNRclADjMccpwHD9g6GEqwWJx+847xLTXyb7PRsBULmLixIfG5p5
	EGrn9N/JMqS9X+ghxXeSs/ojDknfBYJyAJCtJSftq6Nbju+Tyf8a6EkldMLsPvJHizWtBkXYxS9
	R+b6mDx9RoqishGinZhxAE5ARquoZSoEpM64w0LwMgCyLu3fatkQ2tBiDJxrLCNo/bj/y5sIt3O
	kqrwQWYdvf0JfyE7U4MIcIUz1jz1rbd4ZzfO6H6R5dLZSNxv0KbUN+x26oOkmdQbErDoAjoRpkB
	yuIcvZwH3HhT+FtforiIDXkhTbpI0TFc607sBln8SxLRXzeJISpHXLgLfMJdD957BAEnzQXXDXf
	plfuQTXfWxShy09Cil/26TfsmEn4FzKwZISlItPleV2Tixbe11IhYJqyVNn2Z9WXGQLoPzEIo9d
	PKsOznPr8ATiZWTCZKtlHqex5ryzbr0PZpiXEQPKYNPmwUk=
X-Received: by 2002:a17:90b:3889:b0:3a4:c11d:b78b with SMTP id 98e67ed59e1d1-3a7871846cdmr2805455a91.22.1791094020938;
        Sat, 03 Oct 2026 23:07:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:46 +1000
Subject: [PATCH v2 19/21] arm64: dts: apple: t600x-j375: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-19-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=USmIbIxNd8CqGfdxvcD6LlyT9J8+ju7yBuayKmryPMY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+R3zmUMuv0m3bzStIRRUaPBfw7vqY5lc39fP9q69
 GiQ0rOlHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk2L2VkeLNmctGcwpI73e6/d0ZHPr/JbVZpJrXj04UazzW753Gf6GH4Hyg70+V
 tm82UkPQJjimL7NavrqsOn8xtLhGybFao409bLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6001-j375c.dts |  5 ++
 .../arm64/boot/dts/apple/t6002-j375d.dts |  5 ++
 .../arm64/boot/dts/apple/t600x-j375.dtsi | 65 +++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..2e544f43b085 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..dfdf90fb1825 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..6c34fc86af74 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -179,6 +179,34 @@ typec3_connector_ss: endpoint {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
 /* USB controllers */
 &dwc3_0 {
 	ports {
@@ -410,4 +438,41 @@ &pcie0_dart_3 {
 	status = "okay";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+
+		dai-link@1 {
+			reg = <1>;
+
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
+
 #include "spi1-nvram.dtsi"

-- 
2.55.0

