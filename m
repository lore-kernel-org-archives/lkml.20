Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9483563FB
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303057; cv=none; b=Lv4PiIaYx+knunW/Af2PjV/CakXbPWsjQZX1u/+4ty47Ux10oZCQxxhPrx0/riMADvjJqfoRSg6vmYVit3BBtaW7S0EHFVshg9UnImbIOuqb96j+k/piUDMVpqaad59aKosEuxCZiHx/eDBClRbwO4uq5suS05MyfaHU6Nvr4nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303057; c=relaxed/simple;
	bh=KWfosToe+XDrj81BrY6Ipu7Z1wn2VsvneWja6aQY+S4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rRWYwW4Bfr6IgsudQQGi3Nw6g0G9iomW0zeHyf7AGUF3WtarmiAwe76V1wP7r0vb1S4E9Z8yvoR7LgWIhYY3KkwP8qakBgB1ZJOcAZT/oLpX/P4XeoMmUBE/WOYxGOUqsYctINwS4XdRvEXHfdB7ejXGcIGwgxI/otw7vwBTF8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLjsPIfy; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLjsPIfy"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1084877a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303055; x=1792907855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5WOTDOeoF/T8akxfCBPXArsiM/VJ5PIwdW2EmkTdhI=;
        b=FLjsPIfyP02qsQT37oSC9Iq/23jPdILFoEcZE/sfJzfR1Y4eEssOBKJQI/E5sF3462
         hE1NhBX8sN98g2TwPxdgYsebnxm+0SYa7N0qY3qJ+KO5ZKJLcJAWLlktk6z1U9Cq/HUb
         VmSM+jiUX1ZC1/0ysGXm2S1zOZbGneqOtFh+xKf8Z6Dm4b1jo2fy16PUkcZmcd1jp34V
         rKShiPS20fzOrEcALYQyTzTH5E4E3uVGBWkM+FelgbDnX50+gCHJmJZ4cugCtpyOchAk
         g0O/Y3lsiWsbSSAYq65HX/FXI9A/Y6d3A/b1LfYnjX0w3/44kW5SznGKitNIq8HyRcBY
         +7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303055; x=1792907855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5WOTDOeoF/T8akxfCBPXArsiM/VJ5PIwdW2EmkTdhI=;
        b=FplG8rdk3I/LzG0MOdwvN9+zIIULKPFhgzwPiFk+TPWHe7Irew4pswAnLdfe3BNMbr
         eTlCgSvKNEYt+ZcKzAKverk1VrrxjRY9zUrtLd3LFqOmxBf1UznZWPI9Cc3yEFc2uysI
         g8Mjs5eQAo6Ea3sDv7Qcm20T+KptqdT426ILXDsS3rZCt68Z3jPeG+g2RXFkgIGRJLbl
         GYWBwCl3KK6rNcsy8BRIsXhGZ3AxKH0NUQXwlEASrZIHJ9xhW4RBgrjywWf/pVi2tkSd
         0JKIeQCupqiqUDPU6c67VRMxt2wyw/gQWg6QXGUbMKQ6659E1sDbcoTyjksD44qZnnNW
         36NQ==
X-Forwarded-Encrypted: i=1; AKwUvByn1aOeMIICdEXx6P/byEwGL0h68M3SScre7ADwZpnN9QvLNtJhHJz7qjvTQyvgtX2j60h3uyXDprpC64g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFDWTuqXWMEPlrZDl7enmoe2CTHUpk8ewDVg9f9I1WB19Ns0+1
	yX5t5JHR/WlnckQAtVVvFwZHje1AE9Wm5ZSmzFWZfenVXPcjS32aSL/G
X-Gm-Gg: AYBFou2IaFd3WASylzQSp02htJInKuOQvxJ1AvbFEkW/9GjrGtLZR2lH8p33i0BgnZk
	+jhey7gv3QShLL9B2GUCuhn2i3If5KLM7htZ/0tWsnqZo59FOHdi54/ZTp+zh0vMQVR+/urPjsM
	ApgbGDzqH4JBE1wj2MRl8QlV0pEGOawSKCSs0XicOAyI0C+nhZgVEi6ARSdpqdLmKBv7SJDU0mK
	Rqy4fF6rRdvp5swMZMujWzd6YOoCpQL3Wtm76BT8sWI7YRIw5wWTNNlEFB5Ele+kfvL8vY3wECn
	bev9gtJdxtkD4VxFw6cnyQgEcw4XK0+CDwj20qBHqDlU/M91jFqgu5fZqMVbhZd/7vQbrUs5Pk1
	iVL+Isz4Z9TVjDkRU+PTP9/0mto2zfFxvptuO+H9DRDw56pgdDXsYhC9uoIESg0bUBD8dOQDMMS
	Zfzlh8yozVBELkpOEUShZvc6tcBQB4uskRvRDX9UzmxnhhMrMOFc2CqIZz/tMYMM7m0Z+1JFoqg
	PXap2+c3Ya5KiFS3D1eTHR3/7L2sdgdZ/LwJaj5A1Xb7xdXyUat/KgkIeSfwL4IGuxOezOtEBCh
	pSfBHwgEwlp/WE13cWsQcPlw1y0y8yhMsybvVOzCgd0Amg==
X-Received: by 2002:a17:90b:28cb:b0:3a8:c0cd:57fa with SMTP id 98e67ed59e1d1-3aceec709c0mr3956469a91.11.1792303055375;
        Sat, 17 Oct 2026 22:57:35 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:34 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:13 +1000
Subject: [PATCH v3 19/21] arm64: dts: apple: t600x-j375: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-19-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KWfosToe+XDrj81BrY6Ipu7Z1wn2VsvneWja6aQY+S4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vma2hU3a5esWNttoHKVyYa98MeVS8edXolfkz/0i
 sPBPYy3YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNW7fzMyfA1n2z7hzuPv/CJq+7cz/NLqmcXDdMGvarktx+evZ6R5PjAyzCvXrlV
 jn+7trH3DYkdb7Gtr+wfKHWL/5zqs+pNz7OtpJgA=
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
2.56.0

