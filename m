Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CBD414A1F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302981; cv=none; b=WR3InMbvPQs7RI0i0Ti22NwCa4ggkGSTKQWmw1A0V4L6XGQbSpav13SePg23FVfMGVVUMkpcx1CuMPmG3/eHJM0ryQ87gaI8ETFzG6KIxlTSfk+Inob1AneoZu+EQaXj89nXB0BTqUpxhtdWU69276Ea9yqVrpvXu79M52NshKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302981; c=relaxed/simple;
	bh=HgeKP4GX0C8xVVymnI3UcLA+XVtzd7U2ZKk4pTgAUaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z9W9Uqpy5dOCNeSKBIqKPJsdTFnZjemc+wZJiGdMJSbPfTPY2dTb2jJCkrCXFSVnI407SAEBCXw5iyf8wMp3G1yBq8UxKH/rJUjOFnjUyRbL+4znHuv4xfq9lLbHl5xVXs0v1kc/WrBBRPEmimegegeC0B3tPpV1IEMdS8G2tqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDFSigx7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDFSigx7"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab41538192so909499a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302980; x=1792907780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKNPOCoinzGZ8u1xC7JnkW0RdGTkMTpvs4SLnqlKxuU=;
        b=NDFSigx7LZMaOl59pAmMjnlidh2V85KiDAaYpwHgKuOvS3tnvArHvGpVb46jsWrAuc
         f6dYCgN46CCvME+IwQllgzR5hVgsFT1ImdIY7JC50L8oMkb3ZiLXkDKLPY7eo4FwIMwt
         FbyPNB/xOr3s3RAAJtOPKQGP0xmj6JZz8L0wqh3i9j2ku7NmyZvdd4XQY9MidV/bogwy
         +X0UJsm7rfFRROjt21E1Bc4FiCSPj4UCBjmuGXPj8cPgQ55z2I6NQBuhavnejHxan3ph
         Cbzqj1JPr10VK8d2dFiHoit/sO2TlzBu8Ik1Xh5dYcPhxgSGjC+9oCqn9ypO8K4d+1kv
         c78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302980; x=1792907780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKNPOCoinzGZ8u1xC7JnkW0RdGTkMTpvs4SLnqlKxuU=;
        b=w5t73xz3lY5ktqXiNuop0x7BR0+iwTHsvlx6gkPcPdKJsaIwK0oiuaN3EMkhYft7C4
         c9sH6hG3AMA4J2Jd2JWOX41PTMhnC10TZjVeqJaxaajg1EvTLOZDVkVLIXNV2NyuNwkI
         mNI4SdgCo8n+ngP9G81x8KvDA6GUyCh0CdYbDkmUPQpQnDCGJtNdel33MpkgHWF5Rw3H
         LpNhtr2n+hT2EKTR9nOu/F869vwIL0SRU+baoi6ltkt/DsPY6AkBmM8XzpHLHExSJ7YD
         q43rOYvYRpfMLzyVSY7bWy+81BxNqN4r5RV4KF5bPIVe641utQsD/gd7iSO32iM0wzFh
         7G8w==
X-Forwarded-Encrypted: i=1; AKwUvBxdAqQoEmFRzoYmwbBfyw5oqA9smd2rLIjpw062CYuLy0LgTnctoUsX5cCSchgkZpi+Zbsw4GhKFsGcVgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa+7fSRmWQHjnbMTGWhULObTMs41U0o7IVANclSrMZMpsX3EVp
	TTDeAAQJycm7ToHz1pT8uXpT9VAVNUaXtXYHkET9FpdaMGbnbVew/lCn
X-Gm-Gg: AYBFou2cTvHWry032Yo77HpJFUWA/Yv5hZg+ZzgDiSpTlDUo7nhQbzQjYiv00jPnT9E
	0HyaPmDV7Lf39LWUzkYddkd1inRkwhbAYWzaUVSm3RLuWRlUwMBOXjsfyOJzyKcrne/tQZoqph8
	kmYPziP7b2/nEGnRfXfi/+P5QpVEpiJUvVQvPca8mOiumcPONMtKhY/UDt0vInQCPoX9sDCB7Se
	6atIgkgdqketJZun6VdvsJ7I1/Ip0h2HovHH/h6wLdAbp891hTkF9Dh+eIniFtXlDikQyvjNFC0
	dIELsNCT5lbaqqaMeLOnnmO9s20lMnMuRVo/kguX8vAOo4sKyP7axbtl/KdN/iSKDMD7EnXJnNM
	L4xs2+wSbrpvyDqcRJC8sH9iqHBj/o2YNb7R/flJx1A+Ltk2Z+TyBga3RegboCADRxI8b1eQ/5v
	UqR3iYQzahj5IkVtLCyeR7nSX2CeK5U2imRnvKfzYDIwxYq2bK9I8cQIOniPXsHZGcZSoP6SS7a
	gAcWRMpXhfi7EaCNUKPpEz6lyMSFMYkcTWVIchn14D2dXuKp5pIYEMa3bg5y4w1KVkPczH/GEh0
	KgScP9xvm1hdZuU2L5AszSPObJ2oZwn1xQCT93IDOGBjkA==
X-Received: by 2002:a17:90a:d443:b0:3ac:97e3:7389 with SMTP id 98e67ed59e1d1-3aceefac299mr3428943a91.44.1792302979629;
        Sat, 17 Oct 2026 22:56:19 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:19 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:05 +1000
Subject: [PATCH v3 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-11-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HgeKP4GX0C8xVVymnI3UcLA+XVtzd7U2ZKk4pTgAUaI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nmVdrF8n6+zRbKnZNPTcy8WvWZoP/ppXdiMHQryS
 jsdZ1x/3DGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqPR8YGVYbejg82f4lR+LH0cCjC/+bB/2akW8gvSDs74r9/ycpPbRm+Ct4/U9
 PICvLweea5q1v/Rwddvfnqv8punzuZ10LR5ZsCzMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 87 +++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..ed0eb358809b 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,91 @@ &typec1 {
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
2.56.0

