Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826F040681D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093970; cv=none; b=mGSuV1oQjxC8KKenPoiRUvs3bQvNBOUP6wzZB+SzP6c0qXqXV6O6hL3OhCFUzq4OYcik7/vw/djRuuMP0vMq+b+f7Be6P+QzPIxXVXPIyeFcCcSakBhaGjjRX+2u7N6yLwSkgUXicohf1TE+013IdYSVBxblMqWhnSzhSa3B5fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093970; c=relaxed/simple;
	bh=fs1ai4BpjRrKf1Z6N1gXbBVEIUvHZAvrJK8NPJKhhz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ia12bgbRNk4gZ91Gz6rl9P1BtQoi/peIPINPSlWqygFJo1PK++kbMADjYNlDL2IHxsLYTVCErEMbsw+wcLmn2XczT2PMr3ZhT/EsziCT7Aehd2MQJZoO7Vz2cQA2Rna7dJ/1axVKDV7etVVMFaHxiIMcHEzCCR0+PiwYNNC1MNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGJGfFm3; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGJGfFm3"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so595715a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093968; x=1791698768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3QHSkSxST2zAhLEr4m0t2e0b9c14pDjRMyYQ78t1Ts=;
        b=YGJGfFm3WEwzt5PLAdt/0kLFViFN2dBk9PR60ZVYhweSGFYmfPohlVKr0BYIhklGeH
         IA8Y9aLIHPRudDKC7eD/NsRW2RPHJ25N+uDE2/7VN3gz4pMproMcMNo65Lyrc49S7EBw
         7JXsJLr8Ob/R5CKwQ5SRBuq14Ig9uQneIrS3qun1+4M9rx+ijSoYS7QNeLHpiHql90X6
         R6wcX5YBViOYaNrpTM8SxqiVDgAQQeuKmVKcN3x0ZjgkmhBIsfyFaSrLe4exNkYlTn2s
         HLXFyIlqdBhATPdQgL8WpGZyvAx4i1m0FS+xxP4E+itkm3qz7rwyEp02uzdAIFeypUN1
         kUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093968; x=1791698768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3QHSkSxST2zAhLEr4m0t2e0b9c14pDjRMyYQ78t1Ts=;
        b=R/IMOca8OvMBYYaZNxwwsiA3fGEjRLTtlo3WoronM9xwxm+PRD8W7+NGZDG6lS3Ckd
         Jr3qMjkxy9nOVlMjWOWvSKIG3Gm7pHJRU+LKy5TV8SYt2+AjUeMwoAI/RG0LDooZXELo
         rIQ9ivu0/B3IViDbktVIjaTCkdIoW/1W+4RF5aIFldBGSNJcT0dUJDOH0BrbMlx2dpNt
         UfAwWJBH50x9GrAhE+J22yhdWS22S1A/Qm8tnnxNdKvY3edj3uj3D02YxJhlGBld0bBk
         kClEjattKvvO3g9/gZVtXbwvSgsLKzZlDJr9PSWTcfdXrYLw1syndP391Raha8aY6c9J
         ydWg==
X-Forwarded-Encrypted: i=1; AKwUvBzGTxAbLQEO9RFtP0UqmbqUccbOtE3RjiVJQK8/53xZk7YUvYJuLnnjo9c3dHl/Wtodha9h+juZlYZeSGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwU4opkvCk5oNPPgz59E6fbwpbWv5ddmT+w7qB+Qp7bVJjWEMC
	MJZ+dtH9DzP7SB8qMgl+lsF7Sy62HDqZENgVhcFQ0etf7l9M1yg7MNJsTdXARbZp
X-Gm-Gg: AYBFou1GZriSe/e5cLu+6owbJj9+Ed4iXjXKw5jC8ChQXmf63kmRNWYZ6kOGMJ9PDmz
	1PIy1CjeyHYNsu7M0vsljHzRrDjrZTJODIhKagtVxpCUf/p5YvlwGfFVq4yIX3nMvPHeb2PonSx
	TwTCz8F+OHFQZggsniMt0vfBhvedk5wPPM5JyQvgLs8vO8MK5ytioVru2d7UynVVld61fGxb6gx
	yGoiJakmL8GeuPPLyRK01IprKpKlraolACVOn0h9UCYlHTfuaSYqzn0OTZrABZfPBsuZZ6klFDJ
	BI417tfIKJDEKGDzuCvZ7enH+MiXnjoiJ1O+Umg8vyPNL8lalS11754TgedqrTVtXDjsfA6voVr
	KtHudLjGXfLq71GlLl79rmcJV5/HNVUnhk9aID6qhdAGwhGswS39GKVThQ1P443PVi9rBwAT7te
	X/Bj6dVmpS8IGveErl8Qh8CNat/d6wJ9j5+ftdkzhXH4CS0ytFdW2+JjXgutOzjUWbfYyuHTeB9
	Wfl8nbNnFIZTFEltCY9U2IH87Vnm2FSTWyR2MKcj/364T+3TDvI/nW4tmHfNMVH2qw8Qn54shKE
	uhB+ZLh9cMQMjDkoiqZAzZ6jiuaua5dcym8pQAQ2i5S87n4=
X-Received: by 2002:a17:90b:3903:b0:39e:261:4e0d with SMTP id 98e67ed59e1d1-3a6ce75d5a2mr6439953a91.25.1791093967799;
        Sat, 03 Oct 2026 23:06:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:07 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:39 +1000
Subject: [PATCH v2 12/21] arm64: dts: apple: t8103-j293: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-12-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fs1ai4BpjRrKf1Z6N1gXbBVEIUvHZAvrJK8NPJKhhz0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+ReN1+v3V95y/atworQPe6OPrPKF8wxlV2+xsjf9
 d8uj7PFHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk+9pnhf3BKnfevWe4+XwXOOdVorvkdZB1/evG3vruFp/ZclNK3d2L4KzMldv8
 9gQd+zm2zt4cVreSS4jp5f9uBCDPud7ZPmHVmsQMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 111 +++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..42f1127151fa 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,116 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@32 {
+		compatible = "ti,tas5770l";
+		reg = <0x32>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
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
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@35 {
+		compatible = "ti,tas5770l";
+		reg = <0x35>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j293-macaudio";
+		model = "MacBook Pro J293";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "pulldown";
+			dai-tdm-idle-mode-2 = "pulldown";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
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
 #include "hwmon-fan.dtsi"

-- 
2.55.0

