Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC373D1AA4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880267; cv=none; b=nQgNLkqxdCl2hfWHDcQvqjntOmWbnDc0hCeoYnihixlIv5uVPx6oRj3wkCG1NdMqAtl+xkImg+bLqSaft6hVTUyMF0tBP5PAmn0ApVWmbd0/Q15fvmV/NCxiHHeIeDw5P/NsSnUgFoAQN7cD8zNMEW4GKRcdzS/eGUvTdRNI86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880267; c=relaxed/simple;
	bh=8zNWdtKPfrMTot/trMqvbPPvlUGNanqtL8uZSqGwRp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyIEwYBsNi1BPlaoYqOoxmRU9iIRUAkq6023FzVn+sO2yvrxu6Tz1BVDWoCY272AY1K4STg88lmFz/VB+tPZewqcfHOfh5gMvjqF8ymlOnIft0Zk9TVOH37gX4b7UXb2hM5u3A2oXOBL4NQOnVJvACHxJeanZu7n7FdaJgdcDys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0YP0012; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0YP0012"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f066d8so6965185ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880266; x=1790485066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=;
        b=e0YP0012Tx79B5P6JkQ/XHH6aE/DsZSulwx9pOeBiNCDqK4LCd1dkMhtv9kC+P35cR
         ac79czZAuYFz1HsLP38UJP8emc7t1ys9ndH+nj/Z0vStj63I2/J0Dap0YD1CoP26vnNM
         I+SrQDHDNx7FRXYnybhxYpv/n/m4vDBY07IlGjzyWJ6UfRemcfOki3KJlAMQdLT1isvi
         o53R/zbxQDl7vtGi97QjwR46uOire7k+IyVz1T5Yd7R70ihJOjbnc9Dx8mqDPMND89bH
         XPrc8quynuXdVMWKQr+qQ4JR2JNJDt4b3yEwGrYIRQMTf2Zsh9ObKOi4RjN30d6dSWMy
         RbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880266; x=1790485066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=;
        b=zipRtyo1OblNzeutSlgHXiXE0jXPPEWXcIfEj+xjfmf1CvtxhgR5Kl7oaaTU6iJWcp
         OLTCtq+svLVAA+ViXJ+P7ngmaZLGNJPpsAJ7cCpM+Erz9dpFT0vTK7cb9nI9fNv+QZ1c
         k8yKNa4EOlbayDt3GPmBvRoM2/y/uC3qUNCUAOJwucJ237XGrgr8TqRdV1efRqJxHant
         RALHDv9+YrPtongSopngpdxdETDZL2x59jka2EgknxH2oRHKSHLybiFJUBb9yQPEJv/t
         iqyGySJPLpDUhUCmx7Jhksueh2NhIviYkQBp+dYaV2QjKX7LrHdUlBIQayjKkmbeCh9g
         ZQ7A==
X-Forwarded-Encrypted: i=1; AKwUvBzIHZrZD90+3xFHsnUwPnAp/sqBExV68yKNwWxhdB87XA2+YOPt2YvhbVX5lN2LYWZHecL2NVR9Xqn5DlQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kUdWTDaFXqL5eSuFe7VUiDka94YBb/iP9HZ8mntnai0ihIBQcn
	/iio9DgvgAjanP+vwWXxzb3BM+xvBePTaQnKAqxqfnfqirwPoMjCoUOc
X-Gm-Gg: AYBFou0kxf0yotlo3masa188cLNlE4YMFsrgTHivz4cZ43EN5qtAAU/H/HdwjkYbREm
	WPs2xYDDBpEvKRr6MO+t2wD69xEh0rIMJ0JlQcH6xM0/IzP3qwHxzMZRJl7oGaxLxD1UdZ2vi0K
	5hSq3cP8p8urNUuFL4xwJl1ddUYsYPBUH0fWQsOqRDyqdah1fjmPem3xH9MpwVZG5hiXl/UAdAS
	fUmnDN2Crl7NfIERsZCtSsHmQ36WplkS8ZzVlKYlVOjGQ735e9/2ywXwidpeS2vbVhtS4U5txEt
	sQFxFp++ujULqQvXimZigIAt7SpgAOKHyWix0uP8OR+wfycYXWQ0aYwO+RHFjmxCDHwJEIJU2Us
	LZOyGQAzFttYrFiKqDfN9Tu2VvEYKGrwlYMkR1cNpwZ8iGe3f/i6HgNwQKX96aPVHeqIxmdaBGB
	p259UnSNAH30C1/4mTxgFyfqfGJ5bABnY5EMzFhD6lt3fZ5WSIPs/50GYDGF/mD0g4xKPk+xxlJ
	/xxAdK9g5eWsJzki2KvAufqVfvGJWeEa3Suihv6R0t37gSpdfHULtEt4DyOeJI3z4RBcRCvFzrc
	2srDZfAEJ60Sajc1SV0KYiYW3Uryk4NJNiRg4jZ6hDTGzNwh
X-Received: by 2002:a17:902:968d:b0:2dd:c100:2522 with SMTP id d9443c01a7336-2ddc10025c8mr27195935ad.43.1789880265641;
        Sat, 19 Sep 2026 21:57:45 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:56 +1000
Subject: [PATCH 17/28] arm64: dts: apple: t8103-j274: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-17-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8zNWdtKPfrMTot/trMqvbPPvlUGNanqtL8uZSqGwRp0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXdco7N+HGOUWzOheZGiRfnWExFhb/cm2C20dHE7
 VzbsU+rOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNtvpqRYf6XsGtTFtTf6XP59EMmqiisXvPxPqbFIjOKGw6XVD75d52R4bZnwxJ
 Fn0PT4412Hr2i9FaFwzzHdc0UvkJne44aZ/lbnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..4b30f08eaac0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,64 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio", "apple,macaudio";
+		model = "Mac mini J274";
+
+		dai-link@0 {
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

