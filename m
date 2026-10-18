Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F4D419FA6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302974; cv=none; b=bJVpTLefpLPdbC5FHLTOw2h00iZnoSFF3AbF6D9UL9vE0ekNSHw1I6/sQYBOoxhrgxGiyFUY0HIZpYF4iLdg4znyBEby/CtEhIKSnc+SMaHxApdr+0SN0RT5OzpWJPN3sk5nSECaGuMj2zkcIwEc/WQQpz/TFZh6M3qf8odal0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302974; c=relaxed/simple;
	bh=7YjUxx5cRZKi+klFXhj4dazdV+HixE7bGSBpAbaz/eY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9wY5k0o1A7rmvqJvL3GOCzmc775Budo6Pz8c9ZnXjJvsnl76tRUHYlXvS0AEo15I8A+8FN1DdsIr/5HwiwvuD3nhy3Frh05CKIpOyq9WPU19keJe5J55Q3+zFMveOuReGlZLc8mGcgvAEh9zBz/u0plO4k5qbJ4TLAWdgHNnFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZgkE2UG; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZgkE2UG"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab41538192so909458a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302970; x=1792907770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrWabHNJwVCKT8rO401JvBzl+Yh/bItuPD7jZ9TyRbU=;
        b=OZgkE2UGSYCmkKP90iFfrB/IVNMt6wGV6c0EohJ8rGRSwCDGPwxwGXUque42Hawrz5
         +5T0h0GBILlBssgxHDKcm9cfBG5IzPRY0RPzo6LxirRUannx3pockcjhHq+kYUOqIRNT
         zmN6QNPJSSFL3Fxkozwmjc7CHGpk2nJ8Z6trqgSRXzqnU+HiOmYsA8URNuuo7yGLPc/J
         sAX/uV22uVzWCcK4L9NCpt582aNdyvA6NhXO3uSfCKlwl5KXccldnYXP6M66b8LDkEqD
         qYiDKZiKCBzwsmnZKxwp+VTWWI0tSPE4Gq3D2/g9RDU6dC4hr9Z3QP+1Qeq/e58pns7i
         oqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302970; x=1792907770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrWabHNJwVCKT8rO401JvBzl+Yh/bItuPD7jZ9TyRbU=;
        b=hRfi+mEOJ2+lxecP4/8iUY2uht/ITB/jsRaEiMcPgvPXW9OuLFpmPskKLWVmjMf4vI
         JnJuZuPA6/RKA3S/BwvJcnExccwDD1AwIucvpNIYo56nre4VDA0038bpW4WgzhYiBurU
         JC55JTlRbgSl7lLLpm1qPipbV64a8Ao+YVrAFKXTfDxYGdRjnAXQmI2cvo9vS2J9kFC7
         v+4TzZvzjlQ77g5mcc2cvArTWgfPhiQzoiKodYtd2VRW0aESV52T6BG4tqu8gxPg5GNb
         2nsBVFwJSS3or50EaW0m2Qp3im7NdjEu3k38n54fzfV429jBPZHcm4Yd69tvCxN/I9Yi
         koHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDwg1803lhd0lt0/t5oG/V8pwnD7nn2NxYdOayqR5cnbSLRo99sHPSIlhweqq/GTDeDF4jdoankvETjso=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNKkmccPsxmRO3kYfVj5LSZBsXEd4gYFyckn5PqLpxPJ+kdIdC
	apiebcVp/p+Pyc6pTkkZpp6dAwlM2qssJ97/2cZx2BHWR8J2lnuOksym
X-Gm-Gg: AYBFou1GgVH9GLo5hlZ4qvos/jr5YWA/CEBE1xqqG2AN6cpjr4FXs4GCzps0QqeDqh2
	elZYBcFraOt7xAv6Rw6gjD0AQ+fVOjJICV1FfJIdwOVyINteKF7Si8sTRQp8DMVCNzOamQwv0Wn
	p19HO0SRRdqHtKmEUEldzEpVbXnyFzIv+y/nXqWBhqjwT/AcF9GQaT4G8g3wrA0Tqh/N5N2LWfj
	ei/dOSysHetToU2MRqv/s61La/hOmiPJNHteaZu99xTE4Vz28w2lFvEJE2aza2DZcyBXjUHtOQ5
	ZCa6CDInkLlAiLSivfxZvRBuC6cUSY51YQ+Z5WlDgfn9JEZi3F13PorFvyzarTHPmn1hhard7eF
	okzLgovyvGKeL4TSyF4MQa93xL8RxdNeCcFDDRXvAyIG02Yb9rJws07bFQxPfCHTXmEaP/NI1k6
	clSdJpQSCHKgNw/Uk3IOThcHrdoFBlpwpp6gpTGwd61O9wp07mWHQgik/XZddF54/uFuD+rtsty
	CLZw96yaJYyByZg4cLEOhf/QRcg4kes2po+pY/sveYBKWcX6cJanKtd8gx8ro1RGBIMlviTPDYH
	28JzK8rZXwDx9yXn3p5TRHgi5OetoSPr2iVbwQ7DMIfV92DsfSKs/Hw4
X-Received: by 2002:a17:90a:c10e:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3acef10a76emr3948159a91.58.1792302970047;
        Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:04 +1000
Subject: [PATCH v3 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-10-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7YjUxx5cRZKi+klFXhj4dazdV+HixE7bGSBpAbaz/eY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnv5xU5ifpW3Y8/1tgrVHjA1jpI9H2itEec0gq5j
 cLG1eIdE1kYxLgYLMUUWTY0CXnMNmK72S9SuRdmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U21DM0
 0jHWMWLg4hSAqdafychw6fvlqiSXi6yOnRG7j4qU8a7tZ3v0/xjfpoCN0V+n9UyRZ2RYk7e4/Dy
 XRAJ37yHxqKNftsdpXTjstlGpi+NdoK04pwMnAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 72 +++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..150d778565f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,76 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
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
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
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
 #include "hwmon-mini.dtsi"

-- 
2.56.0

