Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691733;
	b=oS1z+5HyPsa9gx+WabA5RM833lRzH5DWH6hf5Og8wCrwytB5dzsFsO30e24Gh8VP6mss
	 0XWmdm3FZ6VQJnZRs7twNR44ghUr/05ljyhkgscjFtLdUxLMndarZGYWE+od1aMBlGRpl
	 Psdbd/85dXignu+9APSKtDoNsR315DD3YBr24zTQ0hGNKE9m/7cMIU3kikVBup9HxMIId
	 4ezgl/LYRtV5SlSVkkOA+7cJifS6jLLCgQR04Ykg8ljgPZNcjOuBofOtLrIjzciOYHrqK
	 /0SCR8o864ynBTCdBbVyBKtH4H7P/dqIZ2J1QaWUjYwRose++hDyQ4vwCDIcaGQMbuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KkE9N64LXexnMyyV2ra0smP22ohtWzLC8tidSaqcsb0=;
	b=DOL/qUn8TwRl95Ppqt6hQnQRsaFqEH2qnUeNLDW+ztPj9STSKWZfs8Pe0Zge3EC3l5L2
	 EsJ7MeAtdHEfhmOoCDEGg2KQz61eKvp/RsnE/pRyClaLExVlL2h6jNMJD29ZEulWZijTt
	 1n+Qr92ZdYQT13uYXFr/JzNar2DhSgPIn96il++jDP9mgWaVqFfWwrzUcTT/BIYcI5ANk
	 7iPrYwAgTCpKEYw9f2KdryxY74x8EosEIQgsLe6ES9gYqwLtWQset0iAE0qgh248W99a7
	 r39+iBr0YJ6ZRRn5N6DHKj+Z6+TPDVZoNv2Xtbtb9jC8igpWuKSPD6rh+fHENeSUK+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQ5PEdnm;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BB8606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2BB8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQ5PEdnm
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd69954c755so2806905a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691732; x=1794296532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkE9N64LXexnMyyV2ra0smP22ohtWzLC8tidSaqcsb0=;
        b=vQ5PEdnmpOG58L9azG1iP1aGzgma8FH5RQsnLRjUU+YSWt7CJLURrbcZIOqvyNKiD/
         wzSrpA2pfLhFWbIITjGkEFZWlePffQuTnkyodBy5BI+LX/D6Uqousz9UGE6SpsswTZwX
         kuWEp8Zup0C4kwiZYxlHmz/Uoauq/YoYxC+qmcBaDDWfsg5y3TTRCe3e5TIoB6dEIfGP
         2Xl09RSAVnDT4IytmoVXBux7J3bn4DzxyggG2LNr7jrCMWag0ADR529XMJP63Kjs38N9
         iDautafbbG/x593CgQ4sZnegRJMrFce14m1iWaJV6NlDmrlirQ+H7YanNDlz7iye+4YY
         0Qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691732; x=1794296532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkE9N64LXexnMyyV2ra0smP22ohtWzLC8tidSaqcsb0=;
        b=NaTMuGRMgrov1D1J6l8RE5QN+tWRuF7qWEHuRq9yjRWjpLL3xdHgY1XWbE9pZ8XEhb
         KzcsVwlOQpIe89ox4X0EGV7JKJPhFlmK2LuZ+IYijC1oDAwXJ/FTO7C0Cu/qpnoKcsYi
         owWCtRq2CfPL0FMCkw03r3l05dqBKZXO6MgqbfKAjcxDQ3/7wemrkeM0LOd5l8LkvR9Z
         DBKGYpq+t/PQgOk/TAgEN31CeZENDOMToOsMikAsqO/WNyIUh0kybudM2BT6rC5Hewp6
         yDLKfxAqK7Zm+afyS4Q//L9leN/97g0HRmWoLh7rVjdIKN1aD1rS04kx8xo/D3ArC5kX
         hqfA==
X-Forwarded-Encrypted: i=1; AKwUvBwr7jS3vUFLHtqfDM1RpBo6zL+HYxvmUeWyHCUmcFScOJRDAA0IQSU8NmANdoz6UTgucf5XfSPxgbLfV14=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OSk+yNwDu4MREGNGjkpoj4aG9Lb1rJt8Ilv8QmzrHcDbjF+Ho
	kbE2413Ahoj75BFdJ9Acj8zVZaROqEFTr1YH07P87Bm3DN8PwfZvXt3k
X-Gm-Gg: AYBFou3FMDgYYIXPR0AFz5pgjLsWJvjfIWJw/s6Kew9NS/S8x4Mtw/ZhdFwNou/SR+r
	Z7SaqK4clkE7CF+QAOx7n3AExhozQHmjIiCmj6XH61qi5F0FrTt93xFB4pxm9kOsMPhhOkF3AnH
	AH+9Ef9VQ6MnrsJtrT3nArJO4FIctOw2Z3FArjQ9KLn9Thp/HfgQ4UhcrQxpTSk4ipthAsFi5gd
	A/q+uWhwIVmchTfNpKCsE6S7TJaVQkpjjkgaLQBYpSmZI+I2qnsdHZGHFMHavMUq7LEAX3XsS5f
	LQWUrdmUo01FdNlhk4iZo2ixO62wAPlSnEE9zi3f5Sp+jEGQtL6hLbRIvoqH1ny09GmFOX//4GL
	gUS/Rp0PadQEwd/qCvVhqlqdnSztSTWlDiWrdAwuY98zh7dow00adNyI4N003r4bYN3yaPfmecl
	1fswOj28uu8T1dhQIXeZGNXvm0yfrBpvCkj1Ft+9umJVViFJN5OGvoJSk2X59WfBLGD67yUYmKH
	IXRT5whotztt9goU6JIoEdWzCyfqnpqjrZnSKtbfFYBr2xMqfyI+d0Bd8VPzE+omJIJSLZXxrAn
	8r2Hbck4gzVUJ0iQyAcHTJWYnDS3MUl6PGce9T878Ka+yLMboB0tdo/jLEri+UsC0ayKN3/NRT4
	YET3rlCeT3Xt9+UvPD7azuYjyl9aS0JzG3NTjAABNOiwOlalowxMBzG7gEfh2hd48EsXVdvl/KD
	Hj2Pg=
X-Received: by 2002:a17:90b:1b12:b0:3ac:9e76:aa9e with SMTP id 98e67ed59e1d1-3ae89573fa9mr11002675a91.3.1793691732367;
        Mon, 02 Nov 2026 23:42:12 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:02 +1000
Subject: [PATCH v4 14/22] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
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
Message-Id: <20261103-macaudio-v4-14-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2854;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8ZqQFFxpGVv9nHh0/Eh1D7Zh6Tx5J809tDsq8MzoHlk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/v6RDIyc+wZIkNMv1lJbLIvP8Wp+6UWbs3Skxju
 v1bY/6TjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTnbGBkaD3uUcLovI7pw/ocB5+Y8Dl5fqI3/La6ZrzdUO7mu6jEkpHhV4vq+ci
 2lKzlmjV9Twq9Llz7V+ytcmpKlalw66IF9x9yAgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 43 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 43 ++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..74e9d11b3362 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,46 @@ &pcie0_dart_1 {
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
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
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
+		headphone-dai-link {
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
index ebddde75455c..c0692ddfddd8 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,46 @@ ethernet0: ethernet@0,0 {
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
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j457-macaudio", "apple,j456-macaudio";
+		model = "iMac J457";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
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
2.56.0

