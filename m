Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB44028FB
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094001; cv=none; b=DJkcghIsnt3WE0GSDNcZB0L9GnZH9x4RkLOigVh8ty1BkRjeojjmoh6KQ1Fsi6qoHxa5yPL7jL0H9N611ivzKG8RSabBkqP0nbipgOeuFLLNKtC8MUE9pZhTRtVsVlzCRdCMTMrd6tn3Ub4vk+pQ/Bspj5voqo7coGvHZioDJqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094001; c=relaxed/simple;
	bh=10CNjE6ELuFX66IXNrkb7f+2daPg1AbLL4enNg5zaBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XQBJ6G3Pv4IYFENgbQgXRUEsXXvEI59xRDm9E3bkeIkUrps5lZJy7chnwmzLnKWW5IQjYXy6Kmlsp+g1n22o6LbRu6xylqqRUc2Qxoh/gmyvrj56507o3eZdt8PBpNxnqYhRNkP/vWEH1KZJRnDpXiyQ1tAlhqLcNk+gJzmbwKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wx1XBNnE; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wx1XBNnE"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so441069a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093998; x=1791698798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=;
        b=Wx1XBNnEo7x3iQwrOd95uPQTvoRLzFB3SDqM7SqcfXkzcC2JEicnqo5FhmWohOXrJO
         /ios3Q5oPUQ4Qo1pYjrc4ywkfqOAe2+sByLJDEweXb4fFy2V/t/nfTEUNoGm2gO/TaKd
         sWCchIY+8ssSrKpIE/O5gwREAFBLuSPJaR9YdXoMrRRlcJqyG1s8ABkrZ/RLY7/PGP4F
         fUrMgzFihEEqF01LHiZueGWr6iomO9fMHcnhw1y1mKN0q4eY/CaPM4E1GnaKi6vNXb9x
         Zv0bjdGWHGyqqfBEEwojBrfA9XhKr5n1fKGOkwxuQlNElxlX6As7mpyPVpbHs1/ufzgY
         qcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093998; x=1791698798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=;
        b=GF+gV3qmXt0I/ISjFVi04msTY+3ccAjfPZk0DZFU20rVlPMlt8xLCc5Ay88ou6F8C9
         ZKMZBennBv5a/iTqfBsUZSs03TqLHJoEMPTb0S2HxKKboc3I6jty9MSr0WTxhWixYWma
         4eF9kHSPk6X/9BR4lXFzd9/4RYJwMuTjwETQih7IuFGQU/z/caajVP6kxoq3dverWHfO
         wOXpZtiub7P8Jf0FXeCQuHRmXWbesFVjim8QV1U287CphOVtCuxVZYNYo7nedajh2qe2
         FHdP8AytFRa3xd/nSJBwgqeAZWNvANZTEfVSLCgBu2YWi2Nn6oIdOUDB84cghT6hWzCW
         MPDg==
X-Forwarded-Encrypted: i=1; AKwUvBwf+F5T9hSexJvMvPmRVZH+BVQu57X1CMrYd2aoIuFRQzIUM4H3BzEG23nSxdszgVmc2j/5EzToRymOs+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF9+jnaL8cyXdBYgJ/sm3pJAcDTmkiy8HzLW+niuepswT3aNVT
	qvc9h1k2ijNg61EpZHEDeqpQ0bKLBw/rpIsIVdqXtiUS6z4g6/Trt11mvTlAhPKh
X-Gm-Gg: AYBFou2eLwwcB/IS9vkfjafMrk+lrBAnEBGk8L/D77i8NQoxme6hgVZX5+uA7Q3AOIa
	S5sOdn4kO3fypHmBZ1lSWALyH7qzqfCI8V9ARAFnen+87XevG5ATdBJM9K5PRXQToYALhF14UJ/
	AfG+eVmM2AczwKjz124CCYrXSM6x6AXpkEuieh5bppqJHs7UQmHKL6Tl5aSpLyVdW0ScsuWpluE
	LMffbn+9UHuB+gCgIvm6vHDLNh10Qp2QUlClc/A69OE3J3pqU8yx6y7qj1p4Sn3jKVS2rVn+X2l
	38zHCZBelyPZU3p0VnxAlkgkeXe9BHO67irCA0R/RK5yY3pY6ltIfAv+oc/nPOkjQzUY+OSyFEu
	+8d4E+5iQcLCCVby2O8jXBjjS3+z00yjV+8GakFfkvBObXEJSZofuKai6I3M4jLgNBGxB4oTwZH
	crBCUHUx6qSxtnJuF2R2+/6ESHHK+xL/iAyPhg6zxGcSpsLSWTCEAvUE/SZOH66c/pOaBV8mqh3
	ctOUvBoWt96NjNiRd4upZXuA7ECUDypbpkXPHjg5ygl2fvjmKc3z2oBTU1h/1HCacCLfpQhMdke
	VmtftCeaB3NTSFZj1vSyRTQrr6+NV/I2zHpdHFYPv45TzwE=
X-Received: by 2002:a17:90b:4b83:b0:3a5:1c7:c2f with SMTP id 98e67ed59e1d1-3a6ce986288mr6844237a91.59.1791093997815;
        Sat, 03 Oct 2026 23:06:37 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:43 +1000
Subject: [PATCH v2 16/21] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-16-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=10CNjE6ELuFX66IXNrkb7f+2daPg1AbLL4enNg5zaBc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+SpT/mn9Yw/NPxbgufaM0+qi9NObXvIvuFI4oOQW
 a4ZNSyTOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNdL8fIsO7XQYO6x03LbdPLE0oNPZ9W2QWKF4vWiTFNfTf5Jv8OYUaGLS7Obd+
 uv1v7zKW2L1qITXhHtfRz6+jmpDrmOtk7O1dyAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..36f06c6e385d 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,66 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
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
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
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
 #include "hwmon-mini.dtsi"

-- 
2.55.0

