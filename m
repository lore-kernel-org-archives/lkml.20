Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80264119E0
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094038; cv=none; b=OLEgFkaLBh0eKB+HfZFTeuhDPhHxIk6CM+JoiFLjglA31hUW0m6esmKzisJBn943Uh+uTAxVaXb6ETJ9a+/SNGCDhSsJ7s+9PhLw992Zx9hI/jLRg85+taE1ABAuxIOJAJ2FIx++edlXELoZXrFlYfChxMx3Er24uF/I2EXe3rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094038; c=relaxed/simple;
	bh=j+2mD3Lw4/MJvYfFqphn19jd5ntuiOHqc4m1K2MPqJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFcyIXJpq+tqhTO/f/TSKVnhHIFCkyhGN4HujvOgyp3AJXsnJW8e+atD1/nExAjqfwGZ/9+IhNhGZoovp6dP1EXhV0RSuSkFpWuwF35I+fQV3+WFrB81SN/Osn8beJ/eM3Owtkxp5adA2mFfDccB6de86lIXZ4g2OSroYuTAIzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzPnLf1U; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzPnLf1U"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381b831d535so614420a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094036; x=1791698836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzaFTmYz+CkkadaQPdQFMgjPkjJonjXtWn2mskY5OKw=;
        b=hzPnLf1UAeUQh+tNxlKZP7VWMSTVYs4PhOeEg71KFKO7EHGgiAQW+tdBeBAZlXUbs+
         oQ6tst3fjTyiEYeAggWwkN9h3XbCw2g9WCsZ2IdqW+4ja3vPaCRcYVJ/Xdw1UnsB3y6f
         xmq68vLR1g0r1yr5ggJNZp8Xn+IGa31F22CU8mYe6gL2C8OFg+5HEwQ+7HJ715EXk+wC
         +sPRkpP9GaV5GTpQSeHYS3hli9/6WLoKA/RulhXx4g6xIILtbLGMjCSZN7afk73Ojm1V
         e8uLE9beH571ytRuULxMOwWKWp8+ZSRUF8nb6jCNHV1NknDD8Wf06BQNYSk6O2Vli4A/
         a55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094036; x=1791698836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzaFTmYz+CkkadaQPdQFMgjPkjJonjXtWn2mskY5OKw=;
        b=0PXRH9BbqkTApk99brcshZSfglkaDcbAdb0mpyYrMsfVBTdIQeCvfP351YXDMPmrBt
         +vAMr6DCkbuQpeURQvUioNcItWMmeKoGHEQeVcLy9JrR/8KdgSfLJqk0ncT+quC5PGq4
         OflkgpBHzlFbVMMVgLBnPNfVMMm/B+HxVeiNy1psIK23wGQWg+X2pcnxtx9Pt5DbtMaY
         k8+fgAP4p6R0VqE9dkXpX0wbxKAl/b3a2J4QYC8DScQSdcJ+uDJg8SHrSkAKwPLqGZtv
         eCy7zYvnTC2u8N8cm2rCdOT3Zfwzv7GIGJFCdm+XSAV2oCvoSRXBxMe0rdXLUwiCY3MQ
         UaOg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ7dnSgueH8BxL4YvKkT/2wWBhtfqdu4rTQMirOw9QUf5rbwPVpb0jf73JEbn9gR21bznKk40N6pJzpqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKAy4dQHePaaIOYU/TDUM4gYheVD6+hb98fgx8J72at9KDEMS2
	1AS+q3Yv8oCKwcxCWpU6EXj9ZkbIDzQr4RGOiftRwtq1FK6xgIraSBbMlMlIxg4c
X-Gm-Gg: AYBFou0zN5QATbP+ycrYzPmRyv03NF8m03Nqz3afQHT9fckhhotgpaoxG2S+YLzvgYT
	8+lUe884o1hSMNCc/70KQrIt5dkJizrgMNa3zgGKqQjrTqxyDbTJ0sZUMB2Wahjm2z6TqPlCCSu
	xi6/8K/1chjTBNnsbxT40X2bpR9uTps52lP17VV7It42hs66yPOe/sNcAOtRGyRpHAd5El57qwA
	wz2Ptv7JZggrC5gvZsh26m0vRIERb7fq7hBCE61ICHTNboYrlAR0V7JQ9I/Ttz4ddpGM3R5qHmB
	JryXRBFhi68qCdGnMJ9Wf21WExbjdoDOlj5j1rDgAzdbFzsPEnD0d81EHrD8g+IyCzzpuUN23cP
	a7gKTLN8ReCH2WxWYV9KBzAxuOFnTP3mhqNuJF7twVsJd8V5Ithig0ss351AIRqr+horGYJhlI1
	ngrijAN1YgderU4zKHUUTcG5BXWu3oq9aAfMjWCE8M905CWL9diV6JGQUMLM6GztQER/rPKt9H4
	qNP81WP1Dew39TtPGyz/4XUZ3mAvJwewpyR0NV/be0SEFciirMHKrSEQXO1SPMo7vdhHuElf3gf
	/N6r+xIBwk+siVHwzvoOA7D0PjjT+VyV4zmhyNvDd/7HN84=
X-Received: by 2002:a17:90a:c2cc:b0:3a4:e89a:21bf with SMTP id 98e67ed59e1d1-3a7873db396mr2837779a91.39.1791094036003;
        Sat, 03 Oct 2026 23:07:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:48 +1000
Subject: [PATCH v2 21/21] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=j+2mD3Lw4/MJvYfFqphn19jd5ntuiOHqc4m1K2MPqJs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Rf2a8aUrExzb1QOepzh8zJfDu2xPAy/q8rvjbJZ
 8xfeqK1YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNW/tzAyTH/13rXH33uWx1NR3gB53XwtpaUvo/kPyArq3Wd/sm35NEaGnR6/n6y
 /xiJSZzNZ7uVUVp0VBRsfaWW1plgdP7/06ZMTLAA=
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
index e3c2635d84fa..7b4c4ef471be 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J473";
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
2.55.0

