Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D32411FBE
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093963; cv=none; b=m5kL4tybrzJtOU3NsM6NxEeujy+Jc57Pym+hsRo9YI+fVf/cLUR2NOGBj2EBu24YHTV+gjGWiZveZgZc88v5bAeGDxCqb42iJ9jZyYW2Dq7oZc2+N3gqAhMsFthUg1Wky1YXhLWyIaSP4GAcz3VWBI8f3zQBMQCGWsy9SvVKUyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093963; c=relaxed/simple;
	bh=mJddJwm7KZ1uNbWRbS6abM2+DhqXtUFRofNbxKEJICc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWl0pNoXUEsykYhk2geUnUALk+bZFSrUbOgK4JX3IEah7XDhnTQWcOVP2/QL98PWYnzIZ6a+hYK1NOPsyIBc83v2wvlJ/76KKTKX9/qOzbkSOY3IzqVj8CqPWGPV18RomQ//s1SuGtLLbSlCKOSBCCiZycIyOkvckJZej/edtdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGvybf6y; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGvybf6y"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a49623b865so343010a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093960; x=1791698760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCPGuiYL0vLRXDDm6MOp5xoRgl7DVlYqvCMkReNNZVo=;
        b=CGvybf6y60eU2/i5nmuyJ+QMBSKPrGVu7OoTix7ZC0LkbkqcLRKFk1xwonxAHv7rvY
         8t1NGKKs1mHxreqnmH6m9jZL3EIgQF7ZcrPpm+rzvgMCCU2On5D/PerNPdLh9jo+43nF
         mw3K396WPfP6ydmzWDs+0uPUoOEZtENT3hzvg2Wn+oJNC6Shb5lXjMMcuUcozpFBsiYY
         PpsBRPmGhigOUTr8Gvh5fNg3clftbkG142VxjD2bb4oc9c993lTh9vaH9aFTuBnCOuIK
         s69oi8jW/pxyEls+glx7VNZ7pCtL8yHMimWBhmPHFSyoNdNoxO4r8lHwJfAEjS8hokE0
         9PPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093960; x=1791698760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCPGuiYL0vLRXDDm6MOp5xoRgl7DVlYqvCMkReNNZVo=;
        b=2E+/YkBca7mxvvuF1uJXKx087g/gND4q8kinJ+vR0ETJWiUSNJK89yJIUtSagf0Rqx
         8FaA2lLYdX9FKJTIdhVwxbdkXp9CuqqdARcMoRlPUzOpVgTBX3ISoe1v2Rp0U4WmIt8C
         w3EnIPrQX1qKcL/1VTIvue23vjE0ssjK1oN4PfWikNbEdSWH4jswHSmqf9J6cAbofQk9
         xK+Ke8xYAgS9vV1mPJshy6FJ3n0YwcbGhVwDHnQmaQdNRmgb1Y4YCWTSjhGOteXBCOFm
         4mdadqvyh23tAIMr/F3WGgrr+0L/3Em68OdMBLcBek1fJbafjhjLVddP/S7TVQCFl+Lq
         NmnA==
X-Forwarded-Encrypted: i=1; AKwUvBwLakfN3hjsBD7F0R2EXlsWZeVxtmjfdeE/hyF3ZWk1S33+bgkrc4+IWSTt4dsfidOvtJquXxGyoyOuo1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk+cGaVuI67/chhvp6ctkBvRXtCto+Hudl6o2s6usWdV6hZ9+t
	dSInWRB8T7Ed/3pumsMNQq0OE5+Zqeh2PBAr1LVdQRcqWmcRm4w6LsonOToW9E2M
X-Gm-Gg: AYBFou2bO+64XqzzeMKlIY5L1EeMW7WxiboSZQPW1F7gvqtI+tT8TYQAQ5MgXxh4+mV
	ow6UnD4jK/GZxBxACK888enIekUErFB1G9aXp9L3ado8E649aaDpbPknVOgmlEHpoUYnmapcmqe
	gwK+rCoIBtYNh2HAMQ1yKRIv+GtRdKhNwH7qKFAk+JVcRTMt9FUrmqCWZTg3GPMlircFNNTBABL
	FE/vXVh01u6mhZI/bSbzjOFWM1IB9Ozmxtbk1n0AnYugeo3XEfhJriRB9GEu+aGojcPfs/UsARt
	ysbOIQz+6tk5eY4TI5ffYI8X6CiAUphMaaMA7jeCIJ+QuVJK9GY6Jda7MvfoyveXRPyU8YunKkT
	pqTs4Mv2PB+DawTgdH0CQrrddtsW/iaZiKcusCro+Q863zNO9twZSsBGXODSgCTfnBjGZhhD8jm
	XiIcLcs5ziPIOz0wztISJP6egH/QQ53EjopuTfHdia2fWHK+6wR6VZerY/5HBBYryYNS2K2cr6+
	ktEf1dbgXbcpF96uzxsTRSGjANbfehBD62T+acva00geW3pDyzP7WFGV37nY2x2vWSJTcmvny8B
	gfc0K2nKkVVegzvVD2KSyVcRtvvSKQLrI4h9mfvFkX/A+bQ=
X-Received: by 2002:a17:90b:5345:b0:3a7:1339:c454 with SMTP id 98e67ed59e1d1-3a78750ccdamr3295837a91.47.1791093960302;
        Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:38 +1000
Subject: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2368;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mJddJwm7KZ1uNbWRbS6abM2+DhqXtUFRofNbxKEJICc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Ty8flGpH+8zah85ePzDT7f9z23WbqmeWefwPw0b
 e/0s5crOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9/iLDX+nXfjbNp7y3RS+TkE1IixG9Xb0+mrPL1rbCq7zroWmjG8P/GF2xxj6
 2/x8j8oJjHA7z5xTVMWwJWZyd5fDw08aS6hJmAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 82 +++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..cdda63ca8b34 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,86 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
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
+		compatible = "apple,j313-macaudio";
+		model = "MacBook Air J313";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
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
 #include "hwmon-laptop.dtsi"

-- 
2.55.0

