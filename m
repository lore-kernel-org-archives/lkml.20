Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8D342A144
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303075; cv=none; b=nBI8RYjiMS5xBw4gQdlqPPVF+sWUJXmEbVWRO/rqOBWByeHlQRk8zydBhWMIAEu0CgVo3+HFHSmSgOqwaAcm/enbKJ1UmtFpnXbCbaiIC/ax7pgYrz5rheRHms6rrLNF8KS9arHbINH4nczI2Z4NpVTkeqzEGhk8VKPn2hVZ5ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303075; c=relaxed/simple;
	bh=nr9+CGWG20c/KVGlppqHBL9R7cNwf/g9iBmeoDmHgmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qBrX334gGXkrfVaGAdqHR4/umbqbwYBmS8nrLcOdUfMQoXJAlffzUkLBH7e1s9Lah1vSmzApzG2hu1N9l0kZJSzFpKTcQ6AXM0rIaIpnni/QnaNQKVjnv8GXWUE7cIzB0qlrEFi2F01sxNv2WQQXFJFxSi42gJPegowwQdbfiEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFnJlv1Z; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFnJlv1Z"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e934449bb0so9890845ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303074; x=1792907874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMJIf3eDmeaMzHhnQzRW/7JZUIebuAdZzOruphxa9D8=;
        b=GFnJlv1ZSebKdOD/sCb5pWEco/8KRfYm2bM4hkE/T76OsYSTVArxMH6nWFzNG2feBw
         4QX8AyjSPC+DbFuDie3R2qqEhLeHCxFRvYpp06TxeyXt90DOAI7iqWrNGIKaiZIkF5qD
         apNvHjAxmkNmonsTFcvZEtoQ9dxIwmtbup4YG388zDbnDSTkuyZjmf5znNPi3L3lt3Rn
         x165/SMKTMVobH+3sXnNsmC3OuiYpiQS90/SGDlgtdJ70h1dvGz1TsiwAqdtBWnxbU2z
         hGrFslXIJPOj/quFEu+KlZ8kxHWwLTGz8dA/Qxc2dGjhnF8r2vCNCUueQuYOSu8tKs2M
         3KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303074; x=1792907874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMJIf3eDmeaMzHhnQzRW/7JZUIebuAdZzOruphxa9D8=;
        b=IY1PoSSIoYLeczVAbMYRo2S7Qd7XIUdmvllU5vZ8X9+XRf9ZZtQGitNEPvxc/w4pkg
         /NdNG1wBROujuGLERUwCk55iPdnQcxy56RNXk8DbqQ3Rx6Ii8FXk9ts/eJmE2PrBWfL/
         azJDwE3gVuz/PC5Duo++sGNsFO17Ykg0b+rhXpneNrMamkvOAn7v5v6MDuPG4vI8fuTu
         OJbR0ma/zLXyBC8WOq0Wq2KFB+0OYIZCEAAfb3PNHflisgLha6R3vNtRwpiauCKJRFOd
         Q3njRDYKba27oxX/791k6Vyq6TbdatCmDNd1XyyMy2Kfkcnpk7OlshY+1Plh3mmSTEuq
         3paw==
X-Forwarded-Encrypted: i=1; AKwUvBzWYgSmxuRFmfhttLfpG60deITXdcioadi+gUaeXF9G8tsVlu2/sAxMuQCf4brKzdxWTouYhjVYTdJ4i6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgYI/2Jrf1liovxbWOwrrtBS7W/uoRfOA52QB+jlXkfY2eOg9V
	dyIwKTAUwdq7mUxi+937EGULuVn/1TKIajcGqDshS0DpTvk8Lc+c26J/
X-Gm-Gg: AYBFou0Y4dfsjsbEibUQUO6l7KwL49qk01zx/Ppu9s31aXtl4i/+wjnbpcCXB7X9Dqn
	BYaZv+lgseFEy54MpS+vSUNzIKFDmxaG1ZdBItw+EqZgfYj/G4X0miaK55wNIG9D6Izq9MUKTCu
	aVlQRdE00avyIZPGd/KJpStEAkArhFaSxxAPUVBeNTh2TDAiwe5kyOL+Z/yb27Yfbt5jYrAV06X
	La3QSPJVyHq+O27VOHaVQqK+sxkGa0nDG5fhCtohtb6ZCfaY1EDtVvhWfgYNCiTsR+X96BCvF1F
	uTMLQ2KyLDwQSjq++vSkuEGjPI2xr1idrY4QyMicmk5lHx1HLtvLLCFa/1HPrmKgjaOcKzvunS2
	a2GYsP45QdNP3P5nz3vF8mNrDKwOITxNsFxsZjSLUSVtrN/qRj4IswOh36Vm1Ctpew+eMrvHYIM
	QuN+TTUBvCJFyPRNPgkGxs/kMfPU/Gn6Of42N0rO4voT4C6PN+N/l0PPash+AfG5AnLu2XWCtVC
	jaFZ2hkWpEoy+OVuAbU7cFhfxqLKqueE5SpCVKEDbt3pSnTGKONc5sdqQhVq+a9p/2l0RA6zLzV
	zKPD59Lxq3dWpxHZebPINGC1xtYdJrvR44Obsq/9BHuDWqkGCKoCnYIZ
X-Received: by 2002:a17:90b:1d4f:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3acef3ce33fmr3975115a91.55.1792303073667;
        Sat, 17 Oct 2026 22:57:53 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:53 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:15 +1000
Subject: [PATCH v3 21/21] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-21-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nr9+CGWG20c/KVGlppqHBL9R7cNwf/g9iBmeoDmHgmY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vnkDzg9mCoWcqDjxoT0H5LPMpd8KQzJi39uzituw
 3EwIuRfxwQWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKonzGZkaH696/E3gdUNqtv36a7ffLLu7PqI1sLuRZn5AuecV22J9mH4seAo+80
 gXbd9iRv3zVguMP3KCd34U3KbTt6Ojz+emHaHFQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
 .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
 .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
 .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..f39697490365 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J474";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..f8f776f9eb1e 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..153899f1569b 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
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

