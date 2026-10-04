Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24948407590
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093979; cv=none; b=QREeBwST40QOy5jcu/A3SRMyhXPxh7T53Y8lBfT84BdT0AiIOpTZARoPWU3YJ621zE/QgsgYHjbWrISvhj02i1ktaUhuJzpJ7UT1au6UBKY4Zu1T0K0XCDPn08F5SgRCALHR1JR8cs7kkU5PXZwXO1rHBj6WM5aE/YKunz6D34o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093979; c=relaxed/simple;
	bh=xSEWuiivvLImBm73BetJSsdcZ+ZyPP0PeM5RNvPqaaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1af7cF1hl7HJQy9klbPivlCs5E8wyX8did6I4IuQc54527bwIWb16ff69WyAdjOlqk79o4v3VFIVi7QbmyUXIy+hm0V9XxdmOpJlGoNPFnH+YDLnazaJMMZRXHB/EYZpajLtIhFEfSKJMPeT2x7i/oadJpsp1mm8D/2ecA3zbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUiX2ZGw; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUiX2ZGw"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so270918a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093975; x=1791698775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzOACeBa4mYeUDCoCQIwuHgYdi0Q1ADawlRRSYPiTaA=;
        b=KUiX2ZGwVUmK3MBiiFBrLnrpoUxm2bVzpqTNy8q6KYNuv0MANfzPzTP2znD5Fy0VV+
         xj7t+Ar9uXNW4fjGViDgQGcBpfdumSFRHk7Zy2ZnydclsqUnCmfEOMRb7Bqr5nkspfou
         o3au+0DlNsmvuyZeAngh7vOEo1xCniuC7j7xW4t6tUKMdtWTgBmPwLICHyRraeqf5MOj
         XuH9GGhSH0zz4MmWzpfsAoFIaEdEzLDFhDhUmn4Yz9HyccJ4dW3RHcpgsmgon2P2Z354
         ajKjgGw3JLZl7I05bL8+PGhQF3XPm2SN12uE02i81Mz1bwhKso7Z2MB4xL9lQ1wrm8nT
         zOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093975; x=1791698775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzOACeBa4mYeUDCoCQIwuHgYdi0Q1ADawlRRSYPiTaA=;
        b=Tu5OBXpNOaSgzHpnqeWFJexm+qTk0wacXJqLBoTiBnluK1AL1liwO3FOguKk6vkbNC
         4EoW2EomIfdbkpH1jhLbZIKiYDH+ANAuZgXX/JrCFiNfKzZFTjD91Y/TxeyhF2nL+B18
         XGLmnUMd6kZV/KZfpgedf/h2AmaDBM+Ao76ata6fQN/MvKVif9FgOGS58PyGaaIaG+yd
         UCrJht3sMKRTTCZf5frkraDeiR8UfF8+23vFAa8jsF80R9B/4hj20mxLjatcSC0bhhFK
         r+8Y9tvBv26cfg+sjktBLHw2h3JQamX2XnVcQ9LCdYBVkcbDjgzFmr8TFUws52+/wvc8
         d+fA==
X-Forwarded-Encrypted: i=1; AKwUvBy6T8mqWz0Eb7ZMtZbandnF/Kr11e1x9NMOcO3LE1QPpE79g8yeytzlhmVe8hrF2b/cw7k2+7zB9utbBFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEC0afaSynuGyJqgQU1KBtj+RPG6/gC8PVYZeVvMEX80Nv4oPo
	6NQRlstOqvd9vHs3aUzqfT0dq6mMV90Q+yRxB5ixO66nds4ft7qj7efbR1d5s+3a
X-Gm-Gg: AYBFou0UQFSB5Jxur+av1V2bCT3r2HPctyzqRpxtM6GaoUGyj2N5DDN4ADkpPBw5sPQ
	8Bn6qJ11w3DH5D0HworB7IBomTrTXV4+o1u3BnjA1T5MwCJhrSzV6gJ/QrdLGALi605TCRS+MHI
	AKjTNf9NuFXTLrBdStgdDav+QfJJIso7qBGxZudmUmgObFFh6WgIV5e0GxlLCEsPWjPz+Sf4oxD
	2hU32D22IKJdJLdENuG8fWInQhpbd50FgORtGSAxjsTE3POQBx7jSp4ayuhH4mRFQSTSNBWXSCV
	WpkWWrVGzhsHPKU8/TlCYs7SyJACk7Sbp53XuwfDsEjayr9ZvDIZWobONfARGx3i612xSOpXYzS
	IeVihFsMjAY3+ambYNfTXpgGMhRmVbUav1cri7iiwkKGE6Jxh/CPdwVNnRvlKQ4qXaitQOERmzq
	SrPr8rlpsvdq0mYGwmBma2/5v+ObOlcna63vIwXyuZgy758fni/cOfIMhVysdvjXg3UMMdkCa3U
	dI0RVwOOH+UTyIpPp1ytZUw7mdB4he0wMTCLMaavqEFC/s9bUbREBM+t54a1utyWpwqtnba5oUe
	IY8aG3JT1Qdeqb6cDqycSGwgQLt+Oi0TwlsZOHsSt2a7gx4=
X-Received: by 2002:a17:90b:17ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3a70ef41b96mr1617600a91.2.1791093975353;
        Sat, 03 Oct 2026 23:06:15 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:40 +1000
Subject: [PATCH v2 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=xSEWuiivvLImBm73BetJSsdcZ+ZyPP0PeM5RNvPqaaw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Q5LFjL3RtSMiU/o6jw7r5DE+WVkp1unFFRPeVzz
 tbsxi7FjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSLRjEy/P6odGs570MmjXX1dZrfd/o9K659JXrLfrv0x2mTor4trWb4p9l83uF
 9lXVt+ubJZZkaTmalMmuOTnc/9ipA8vL/3a+YuQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 38 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 38 +++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..1fc74ebf9ab2 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,41 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
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
+		compatible = "apple,j456-macaudio";
+		model = "iMac J456";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index ebddde75455c..d8ea6bb53b3f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,41 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
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
+		compatible = "apple,j457-macaudio";
+		model = "iMac J457";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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

-- 
2.55.0

