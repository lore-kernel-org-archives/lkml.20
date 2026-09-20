Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AB53D331A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880322; cv=none; b=qW6YU+PQbqisxw8Lnkcq8iazEYcJC2r3X5tzk/hkEotvkx1buGUjDchXy/TrZkUbaEedl0oxmkIKZAJ9xIoauuYsRs7QwkEVSrbTvfgEyqeI6dBPrKp8ZMVMQ27uDKb9SLAODkom+i7rQ4E9RkCdiEMY4LIeFTsLbc8QKq2iWxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880322; c=relaxed/simple;
	bh=CU9srHz2GgdK9c8dFe4loM4R0cHA8ZEmrmM8hXKxyBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gOjCfndnT5CK5SklzmG0PBLA/497pKrss+Q7BONk6lMC74tn49E+AnvMVH5P8XtU3apoWi9DILsEAPlvQZR4QXtttY/1BtfTbvOhlxSEHFYUnbi3k+3U3uf5VNXSmvigHfMB7rKPl1/79cKBZSLMmuonGhGZu/a4b42Wyi5Kbxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9nfcVp2; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9nfcVp2"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d93ff61046so19907835ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880320; x=1790485120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=i9nfcVp2Dry3qKRflYmMIdXL6MjoEVFxvL2T7tgECLVqB8PX8p2VLC2wlMFhEdv2EQ
         zBxHlQVRAjgGQ+xmUg9yKpDgg1Sf5LonBpgvbvC9BMhOfM3rKuenvECpxiWS0/NAuoci
         QutVICTSOo9pMgUt9kZpZqJL2SOh8DWdYC5VS5sgJwtEAgWGRG2Eep9eGMXdIk7yZizx
         hlBe4knhiLaFEx8mtTceQ88RRJLoxmxJWKMkDhO3ZlqQV2QgLT7m3LLUtZOXHcIQnKmz
         0GB/3KFq/OzJSixTB5GVnWFeM+Crisz66sI/8WFUJpPJ+i0r/ua7HTZ257BTMyLZw9qf
         +pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880320; x=1790485120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=hwhzu5Icn2d2bU3n7/w0mKXTYMX3uYQMUdF6qnfnpvI+EYrhyyCygk8LPnQMWLCyZb
         QiImlNSyen6XSrLAmrGFrJ+hbmjPeT8kGD8NHZ8xq9DWhnx2vxi/8SOAZL9wZ7WK/IwG
         C89/OujvbO10fJGvTLvu133TSCxgqDB99K3FNG0MyKh8O4yscGvIYeh9h95+RWGyGZ1v
         rPig2qjOPVvqKFQWRdnqZSilU+ya9XLbrTQUlk5rkm1Giid3Va5KU6lHzH1UtCHw/PkA
         zAk6rQgJR0id9ge2UcpKQmZfUn/Vf4Cokf5eJ8XbzUBZPH8oIrLHAQsGwulOjAaKFRZ5
         jizA==
X-Forwarded-Encrypted: i=1; AKwUvBxq0t0Yb0fx3fgi474GtFcuKxPJ2PGMD+XHjLX49L33t84tx357dZw993u91Ydwz1TYx2/gn46sOGBMA3M=@vger.kernel.org
X-Gm-Message-State: AFuF++koicd6oAgE1KybarlA9TJtedtLICYScHoU9rcX1nH+VzPSTGAY
	BJaNBAqIWLt5xOpZPXpaDz/EAfKhf7tWaVzsPHRyA/628ws2/ROvw9q2
X-Gm-Gg: AYBFou2TdkICPyFVMiUooGlwYRtS+2hUo3fDz3qWGP/pD4WjvDvEk3v5NAH8tdKMKh2
	yzTN8gx4fg0Aeqwrmta6EP8okRsDCVnY1VswEdH8+u/fBKZqJgbytrGBhyZPl2jqaDTQIMcUYkm
	4pU1Hup0h+jusASM60Ylx8Jch915Hde1t1zZ9bmrQ0wflwQHowDC4kzDfaPjyhBQr3HUePtXzOS
	y3RFxvSGzxDnR/HXAZNI4223rKNjGrfHHN75P+q2KF5hQJiytsRrZ2uY6dQowRiStqlQe0moNdw
	Osa0/QKLhiK8KOFUTzZnn/gBfRHbqA+c7RLHBduYFvwrBKwLDjv8ELMR+21QkM/sl/HnFLTiEf0
	PETf6SgLybHxr9iB63Sqg85D9UMCWJn8goWVnxe1ov+d5n7eevTIsRIekbtDFFM5vW21fsJUk/T
	7/WRS8wUJ4pdll3CZZ4GK4a3qXNOrl4mcomRg84FfhGiWUp3yNW8XJbeZZ128iRs5rCCKk4BSqc
	ohbRdIzzyGBUFbXUYTXriM/EPadQM3aEpbXlXpiZtDTjIdIf9LbXY5ckncoemPbZeMFWdaH/ecx
	pRiz3nnloJOoeVARJf6XwL796XkFhHhhUbC2b2KkchdlESU=
X-Received: by 2002:a17:902:728c:b0:2dd:ad74:ac1f with SMTP id d9443c01a7336-2ddb1bb26e7mr76373875ad.26.1789880319821;
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:02 +1000
Subject: [PATCH 23/28] arm64: dts: apple: t8112-j473: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-23-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=CU9srHz2GgdK9c8dFe4loM4R0cHA8ZEmrmM8hXKxyBM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VcxLh0uAQ6FiSlzpQTeSvnrh373E/mvGIyzzXm2
 3z983M7JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 pGOsY8TAxSkAUz3rDsM/ZaXESME8nayVqaKSDUuiH7OXfN39fW9z/Qe1+UohogezGBmOzPm6p4P
 dwPaF7e1y78Xaonw8ektLpG0KnYNSTkqcXcYEAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..50088283f2e8 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,59 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j473-macaudio", "apple,macaudio";
+		model = "Mac mini J473";
+
+		dai-link@0 {
+			link-name = "Speakers";
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
 #include "hwmon-mini.dtsi"

-- 
2.55.0

