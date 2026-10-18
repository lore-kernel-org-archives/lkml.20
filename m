Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3187E3BBFD5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303067; cv=none; b=nz1R8rqsL8dyo2fQuu4CMX8N5VF3sPW4V7g9llQVv1xV2Abw1AVokFDls8gEVOx6Lo23v8xSYyPS7UOpeeDocJKt+3iXD7DmSfziAzmhz6+Avxo8Jk5ynwOSM5/o3ZzP7E1F69KYadyLBPhRvnqc4nbDcz8bUD58Gj/DZWTPrms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303067; c=relaxed/simple;
	bh=4umqbHnPcmDvTKDGGgoaHBxvCxbbxjsr11wiU95vPB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+H+7OAWFTpwEFksX/cSEjsEyxO7i8xrHmQreSuk/kNK/aH5FEAr3u2qT3Kv/ArM5NH40a7PtRbBiNKtlL46m11qeuejf7QjNbi3zBFsyxifodeFk7iIKp43v+fp0J0lRwuyYfnSgbWDk2BkdvD0P9TP7uUhUhX0K22LuUdQNKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rp97e0w3; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rp97e0w3"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso761294a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303064; x=1792907864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDf0EybxbEMPZU9VxQSFE/nCsO169lfCLx83ijqsYSY=;
        b=rp97e0w3X4d32rSgyKAGGKFj+0azKL/K7kh3cgSVKu8GVsXI5EjnFoM9kYkIFVYszO
         8zIdfJtKsMRz/zqWR1pQCi6tTuzKVFim+Ka1Gqp/qAZ6H+G+jGTWifJaW0NY2T3m/TlP
         6RKbiu5BUWjJP0fmzHIfjceUvk4ZHGcTPQILh6hd6AiSqhl7RlpOYQ13iS8yjMpzUYjs
         rWhMmPWbFCTncCZ181Qrbu8oqBHdLMk8IUcRTY62E0ViBTfdnn5Kv763ubzVaYX7Z0OE
         59cYd3u5TWpirwo9AqkJ5TnyOChQMNi1uAoI/zzhm2HpaqGRyGuUkDTD2XbFj4IkeAVS
         zYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303064; x=1792907864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDf0EybxbEMPZU9VxQSFE/nCsO169lfCLx83ijqsYSY=;
        b=Mc4srCPH1Ur1nJFhfvqZFVe6Us7KIT0FmzKTQpLlnJ/q4gymcI8INao3lhfP6bvv3X
         2xjrkWBUZZE6zCavTWO0YhtZQG9IoBeAbcA33Ml7i3Pf0kfp7Yt9sNsXZavxANZmG8V9
         L6n2W7ArZobawHmlXrVFRpRkOgAzVKadAuDEqF2jbE4OOEZkSuEfjvRJuvMcCmTEj2WN
         YyhtgvOBXUUGRNZUUsU0n+GuvSunnfQKPsPr2cKTMPeqQF9dOUZctRNpV8xbZud1IxT6
         lDWr0b9zCaEZnKWKWc2WcpOZpW3UYA8utKYjp/+HskpPDOixa3DPZQ1MXlCea17SEQQP
         ef4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxagFnnVjGXWNfTq3+t5LI/7t7pQN+4NtFpWN7PimOOXHXNwN0vF4F8EaHg8gI5m5GvDZeKyE3xEIOjuis=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIdc+4ajZozgW7GgtWSjtj30VX4eNhnCB1f6epYEStQY9jdDZj
	rDA0GtoBTNJhd6jMHs5UxspOgLTFA116GKwzLGyQeZ9fy9/YmDgeDhRJ
X-Gm-Gg: AYBFou0eo4UNdDQybwi/tu8C+gXLqjP5PQHkkEAvoDURqVvYpkp5RgIZdn0VWiTLQbR
	52nKuNNm+h6UzCafX+kVOQhJrTsTCNPQ8BjzDbkeVSVwuexE/FimxgOZeJFbh0BOEwRgDqtk0t/
	hAyPilJ+aPkJXFQEahc8MP2oL0FV7iDWgDtpmBEtsS7y3ABs6NY9524oaay60sHb3kgsTPkGHhj
	RA1a3qgbw6jXXxJuufAo8mVJFHp3Besk6eRxdKPq387S6Zl01o6VnCV5aSFP3bOUAGMqdcJEViY
	oZ5H4s2Oi1FtPw6BSFKdpKbfpv7fYrSm6JlFxp6zFgYkaL5HHsO/FXkgw9Iaj6TUyp0S+d4wGq4
	V1Z4/kLZVuO+833SUIEQBtRHpQq9lVzZJGAWRxHaFh0Ve09FMv2bXYFTUWi4ShY0jbiSA3IEk2J
	Viy0G04CxeAOA/rWrbNPwFd+fT2MZvv/Vh2iZF/vtlBup4l6yLFzhddAxLf69vygvwqXCz+p6uP
	N37gxaKkVPCUmjTddR4wR6HlAA50Itu8E2jlZCm8nFSUKo+qngGLNOlL/ZPDZ0Z6JPCiAdgV5Fz
	LfJ+IU/vWxjWIiO6lOndP8LTX3OJnQDrovljj2CUG7ZnbQ==
X-Received: by 2002:a17:90b:1d4d:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3acef5f0687mr3345724a91.64.1792303064515;
        Sat, 17 Oct 2026 22:57:44 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:14 +1000
Subject: [PATCH v3 20/21] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-20-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3704;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=4umqbHnPcmDvTKDGGgoaHBxvCxbbxjsr11wiU95vPB0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vl8PtYHuD+eEiw6QW/zjcuLwwLOnjK6MtFAdca+J
 OFmLv0bHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKl+ocfwP2qvi6NfdVpUzax1+SV/rKyM/zzf3fDra8ud4yf895leMWP4Z9/W3rb
 3QsqbCfUhy1efkTi6uDKdv+Rc04NNLtdCO2LkGQE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j414s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6020-j416s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j414c.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j416c.dts |  5 ++++
 .../boot/dts/apple/t602x-j414-j416.dtsi  | 35 +++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
index 631c54c5f03d..2df6a39c719d 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..7f3f0d6eee87 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..ec4050ec0ecf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0037346959a5 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..852fbcd6277a 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -43,3 +43,38 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&speaker_left_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.56.0

