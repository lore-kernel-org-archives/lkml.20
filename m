Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D040B360
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094031; cv=none; b=kMdSZzPZoJ6GOuTH9aYKziquB4Ef2uZY8x0OoOiHSzuNNIgNpSEgILwjIZLCIOKhjiYkSZT+Px3BX2bBGvo2c2B2d2+c02gR9qYNGCRHxEgpThdXvXZcFuh6Uxq2DyXkcS/0VbEJb3bXj43HiwYzh8XUvvSFEkSezHEJNea1aMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094031; c=relaxed/simple;
	bh=gcEmnx4AWZiPV2AjRp0zlkie8hCkMFmgpjBnY4FNmw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VeAENlRZvuQjlS81B0VlcOs+KAGd+1LgvJqjBWFkLk7iSnXXY2BpOM447LMZq3cpsUZthcGUgAKxFSXNZnZd/E20c8qBaB6p2NrtWThF5vgC17jCNGBfbAYA5+5XovjQjVSMMtpTS8Y+4bodB91qjynirzxJcRJ6Hd/gSnRcVU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSt+mJiN; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSt+mJiN"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a7e13e2a77so32089a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094028; x=1791698828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtNnhUCvwBmA1Pd0xS3AXh7wfPALnqbmv0yzoWp+gA0=;
        b=qSt+mJiNyi3MiRma/zBuw+x2pZOEfwaqArP69brTJPBucTJA0YukdunqU8eNYsX+cZ
         K769QrUdMY4oi4teNE3gjcRS0VLkCS8AkdNJIQnIRzsMvL5nqeGaHlgnYJ0x1Lhr6NWr
         FYeyMjjplKN8fqOpgo3rbnw/4IUF0Xw+w0FvlvvuKndV2M9zpEh7H0Z6Q4XIfI3vG1Sa
         042/Zu9gBAEkCJzDRwpOXpTEaqazSsufvjCC87/+MSLaDNuxuP4Yhi2f4u3QwKV14a6i
         7P85l0dZujCtc3BPkSwmp/+ZFvY6Dl2A+bFOs/2H5NTnQo6bYE65XO5itf25CUZAV8JY
         +j2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094028; x=1791698828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtNnhUCvwBmA1Pd0xS3AXh7wfPALnqbmv0yzoWp+gA0=;
        b=GYePzYLf0B7lP/viM4wx4hIupIPtTkpwD820cwYkFzIWNlpBNR/YOW8dYGiSDvRTTv
         vMMuhYEHRE+jmjlTvnpe0Qdtby73msMucyTvl+0vK927vQzvEDcM4rhaj+WgpIYnOJJ5
         egH8Ov8cH9OisO+GdHqmV1hhG79P3zSIgO8EKxBr0BP7f4IWs5rV+RoBDurIaNTzLntd
         +/9OF3D4tPMLCHElgRB6JqnggIFey6aGzlklUyTkP2wpfhH3msiw6c6ylYaKyD+1enCW
         gC1F9nA3ExADGT+7hxmw7xdlAug7mH/nRFDMliMPVOtz51IQeklsRnDtmEvWRzkyZosw
         YJhA==
X-Forwarded-Encrypted: i=1; AKwUvBx2Xcs6x9Q7OULdofxQQR6xLgJqLPo/gXSEexrzbOa1Oe9oFMZetdoqmGjvhfDlw1DZjjUoXE6Idp5NrM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDu7YwdNyQapozfknqi/g3+H+lUaqYDZrDD4wAPiff2PhXLO9+
	6qmN0bMCnjLT+9bzesD3CuyW458N5aUxQOF5+6xNOFGaqi9cld42LHFNlFCmYKoM
X-Gm-Gg: AYBFou1jYoiZUSZKFwHWHQYtLZHv0+EUe5RSm1ZORrsApPvxh3L/lnwYRZw+g4Gw7lG
	CbNjQ3qkuCKG0Erfx89rI/QIi7cUPMub/I3WliyzCneawmYhAKdOMRI2p6TQhWTTxVGfP+MDuKO
	ZgZRe3e+BUFoY4JqxrNGd5jrbtein3AV0AWplgks1/JIJmkZl6RFJJUGer9IjsA9KCzpoN6bRPT
	P+sL2iRVzTJDGoy4ydkQj8QT7jh99e5lbpJ3V2mJqcwBiPKjg8UkBZiSOKfLb61axQl9mn69+Mw
	BURmUbVW1K9cWFCW2Prk3wKtmDsqiHqYb0OYdZFmIyjHGMrQGPPoEYnMnvEJYaqCHqJMvBElpih
	hYFeUJeXt0qULwdfAUUWP7I4/HThe9g4ffySFDcOPDZ3mqPTvNUoSGRCGhgPZYdiGy51Dtp/BnO
	Hnf1NJW7eYfKf8FZcqkjQEQ3aV5yrPiVOodwZz7JG9w7xazttzZWtLBEqzp0nJ3WvYV984HREEY
	J/RGUOJujoYtNd8N7hZi+2fzL2yHY7nF5H9WUEQrmOv21lMuVyVtTTY7q2iLCGwvFmqOUldckJ1
	a7q8jsa0A8ybUJwtwZWJGd5oD2R+msBe1MMUMSiUhJ5gUaA=
X-Received: by 2002:a17:90a:dfd0:b0:3a4:bc68:310e with SMTP id 98e67ed59e1d1-3a6ce7f684amr5172343a91.39.1791094028414;
        Sat, 03 Oct 2026 23:07:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:47 +1000
Subject: [PATCH v2 20/21] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-20-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3704;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gcEmnx4AWZiPV2AjRp0zlkie8hCkMFmgpjBnY4FNmw4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+RHeG2cdUNOvI+5MOZVKn+MVrvVx4OTZhY9W+sw1
 zhwynKjjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQfX8fIcNHTODT83Aq+rLku32+9V2lzY+za66QQt6UuLm12cvnh9YwMHR3d36K
 upVVnf9232mbCnOgoM5NJFSfvCcT+3bzyZFQcCwA=
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
2.55.0

