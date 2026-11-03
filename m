Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691802;
	b=q7TOilEn8KMrNOqF8hM/Vi9uAcqdh30dG5WeijP5aeIKsggqyJiHGGgjlVS4DCrLxsYS
	 0H8+y+Qsk/Cs9v/CFV1idlnrChZf7ri3C3sALPgcV/gTKjml7BA2lBI8DUimfMKEV7409
	 cgJMbZkyO0yoiYpYHh3eKYXNIZ1dIOgngY1/qYl0fhFm+AG60sUIix4hyLfI8wpR3oUCy
	 vVNV4G9PsupUg3Dx1z9rApSctM5iGI8ijyKRrJm7akK5mzodtzocZeWn3JXS9o9+MT9p6
	 YkCobSkPtUj0qm01omnezouuT/0P4vZsysJTZA7MKlS35qe3wVROoJfRjGqct0kjYCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
	b=F2szo/6sUM0V3mDjRmuzQ/CexnYAN/x9eBbXDO1Gb0hdBadpIojBw4jVR8EYh7Yr+sze
	 wAV9sWd0BieVTxd6FrX9uf7w/HIShWdq57HxRwmoSUGVhDwI8QTF0lFRsgvNhLXn1Yj4y
	 ACKCYuXKybyrhgMH98M1L9JRrZmyUEcs6UvhHY5mia+9avrxGnO6zDH345giifi6KpzK8
	 El6BSnNZ+5tLh4Idm+RpPMSu8Ntr01NSzDVDHNVlaEOVLBFNLr2X65qhYu39vurHsauGN
	 lLz2xO7OG5aISM+YFOiP8bYfgN4y5MlqSZ3dm7IQTDJsb4FmE5t0D2/lbKpFpVviZ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOMJs7wm;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F2606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 514F2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOMJs7wm
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1533361a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691802; x=1794296602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
        b=JOMJs7wm64L3SLWZU+8B/pCRUU08onnqAWFtbZGVHmVRi7yT6nH0gVq1sDd3yWBZsE
         y55EPlDsqqFNRCTrmYzAXT1Bsimojw7u0AurFUQvjEECf7k+Jv/lLUWIJ4WvBHpZlvQj
         bpQp1RG8cUlcN5qfwrovcIFq7DvoXiNJhbT/01mdLKHzHYtq1vNnTzfrUqlmD5InvfIM
         6UI17jZ9Irrb8B8Ht4f73SOYPNgYULsHeL1JOCwVGJHce/J9a0E7aUv5wMtRWpkHYUbs
         yeuqblaFBKOGT+bjB3pe0yzToWtSIqteNQM40kyBdO4TIp0lifCsjZ0QPZL03Ag7mo8/
         75KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691802; x=1794296602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
        b=abcvHdHug7ELKA/HXFf2ymcLVOMcA936YaanfEvflzi0KVqI6aMApIMM6RuWZGrKEz
         j9QcKxVpTW+VlbbY1sj/oTk2NAkr/5YZ/TumQjFbuCKq/1b3U/mkLNQRd1fEchYcl7Z1
         G9ZAKAIo3LUn8FHqnxuh4FwTKfvKCQJXYih8F42OVmecjSe+VCygYC8RwjTexqu8CE81
         YClWojYTVSLdp9YFaSwNcHRf+b7aSI47YeWw69eDrIuquwEJDCI3pHIh/fVzQXOrWh9A
         mcsEwBsVhY8mInCps4SLNqLlhcXFqc/uesLJJWElJWaSeRyXiHTcJgF9j8wuKSl+xcxe
         07+A==
X-Forwarded-Encrypted: i=1; AKwUvByM7W7l19D4HtzeeOXsZ9C8bcxt6u+o/OilPt7TvX08oKJ+8DocUroyKlZNAHJqBpt+kMWzprn6yoonKvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jjlzcRtnQkO9v4+zOKgWjzb6z0ki7ssCv6ekYTWk1YtGp62Y0
	Z/F8d+OI6wOlHh1ewbHRlR/t3A0nHEXnn1n59Wz/wGnbZm1n7DqP9nFj
X-Gm-Gg: AYBFou0Swimb+2ff5JdZMMRwF8pUZezeySF11q28TSCXl9H8LpWn61qBsnnztZfRI0J
	yoQ1/B2SKPr3rvGzCFt0zD9Ap+UjnujnCZGieW0M2KBeiiWoEVQfl9KvRpagOXQ40BDof50OFt4
	F3Qzmwk/6zuVyZjPAbWubryHMkzAO93XhOs2UTex7P+UgUOoNAdPcu0BOKyZiBLveJW/9DR/5Kq
	nLj5XqkkX+RG3CasmOPAA+dfEsSkxpB0pHvr4HnuA4c7Ip5Vm8eK1Y7PUSsIH/ZDms6zkGbh/ym
	903DTzf+lW+ubd1lJhB9mGejCZjX2pDvHZgJr9Hj3W5Iymt84BXOkVAPzzl6NLckjw8bdwSNzYJ
	BiFHqpoWm2RGpf97naXuVwdywcHYoLh3a7IjoFZC/u2ivPPqz51lGX0/aHkyild4fBJWumarecx
	CuWoVn2Oj/217/T0PPttPcb4+Sj11BKwOWlpVY//2aKRqfEaQFVgYOj6HVh06tfPCKlKUHTyIHP
	fiMRk0ppeAD6qc567TFig7QNaj4qOWTX7uRQ/iiO9czqK97bwf44MwWYjRc6qNog1dNHm1/M+LY
	KT49J3dDFNW8yA9PL0xMfp6dOw9BiuZ6GpvJ/uOfn8Fzt7o+yFW5X/ic/fro7Zz0w57LDSQDJ1j
	panepe1isz+rmcOnaEFo1dR/qFaCtplDqk8aqnd/5oLUFt/M4n/get4bX4xND6V87gxT41HOhyS
	TtHR0=
X-Received: by 2002:a17:90b:4c44:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3ae897356e2mr9451595a91.19.1793691801674;
        Mon, 02 Nov 2026 23:43:21 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:21 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:10 +1000
Subject: [PATCH v4 22/22] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-22-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Mpa6Lyvo5t3WwDhLa15s7MQvnpQJvZyAGw7Ghv9V1tE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y/cXfot+mNMjqG8VQGnwRn3EyJWLF0yd4RXtmu/+
 PuK4dLTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT7czD895M+e0r0trTbnV0nPsxR/+sWH2Zbxmy//I3n/ESnsJq4dYwMZ+yOvLw
 gwH4mdKdQWcjzb8U8nGvO1fbvNZLOyU+ekd/KBwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6020-j474s.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi | 10 ++++++++++
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

