Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7FE348C6D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303029; cv=none; b=tDj8fJq4rrmEDD1a2SrWACVqSE7OhBw/SUxK3NdssydGpIM2hZ+vU9B3FGc6N4AlNvUfk2qJDy4aueTGzrtaGheQ8p1hA0WW1pQaU5AG9//UcoPHFHM+hMMRtwgz8CetcX+3oYYByaDnOpXVpxiV1y5znlOGLukQE1BWwTX84xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303029; c=relaxed/simple;
	bh=j0rOzFFEXjkMK4EG4U+SxX5aLvReXnNVPffFl/z+LCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKGmliyPnR2YjKBs4PPXclNGUgj/+talOQStykhaJe0gsUsDhoX8lOztIC/t5AsgMpxBum+ELQPOPDDwdi17CS5WjxSSfDyBYIBkLjnPd8GJkwH4MhfhKvypNEs9sW7mxIHxqCz5tWjf0bmwYgG2GNToRieBKz6jPny4/07MNK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY1nyBB7; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY1nyBB7"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so706506a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303027; x=1792907827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=;
        b=aY1nyBB7Az1Snc04SUBkW8P6rAZ6Ic+o05ABNkciyRjwDWkz1KqzpIMgp1T8YTsvYJ
         qilTpmr0zhFJB0IJmH59zZm20oqyA05f9b6pD2nnPH4cmHK6j5S65Pn4/nXw8ZDDQYnm
         Tp9SpXXZO0AzxGNfZar3mwwD0szbCjp9ISOSvr7O8gal0VvthCmTZVjCTWtQqvn7bCv+
         /Rp1fmnJIrs7oMFfqUAV0zlsVZMndXvfssfP9ZIwJqBgVlJfNm56XQRzGSyGCxiql5aA
         rTIXcM6028JM0TsmXJI9PT3tfi2gt4809ajQpFsvlR5NT2mtFekRS/1wv+ZBixzvJVYx
         b4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303027; x=1792907827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=;
        b=mbRhVqjmeckZQRIWsnp+EAsj/DzbE752SoMxYL3DmAt0zC/U8NTLSafqEk8Ed/YACS
         Hn6PJgAor/cnhevKnUa8ypOBJB7qvQWJe1jkJvGGyyvRfIlRtB/K4P4zPx3H3s94j7a2
         C+dPTbs8b+zfIbvRAb6EourwnmERNnkezSNz60o5Js8jQXRQ39VMJFKvI2zzHfmu676p
         vHATLdls53W28DE0RRp3tgbbwr/Tw7m6CR4f68IpOEtu36nh0aqkMgAFJi/sLImGcnIt
         2Tv4bZfC4rDvKGJ7LfI7hvWpvbVNsS+RPXp8EEv5rtmmbuvQO2qF4iYAYVHtMek8MCdh
         JvMA==
X-Forwarded-Encrypted: i=1; AKwUvBzSGWeVdZqWBMdfKI24YwQQSNcMig8P1UlYKEtgTcmwqd2uYRNn7B+Bs9G7pgOqmJMQ+N+e1hULY/Jhljg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXzyYhDQHexiYEpfjpB8eYOI79XH0WEHPnM1HbUBlzUlPdzvAn
	ARSZq8ZDH+qlEh2Cs0TQn61GtrLMocr2PiQZXMmdFE4xziNTGeZZ4141
X-Gm-Gg: AYBFou3qI3p2p3b6L7znEi1yOPFX2F3B26ayLlDnC65kBvyL6g/S0w2tRUqymcYyLYe
	M/jLSeJFVNbPJF22h+o81Qzc4MGDppfGei4gzDdi+g+XgPrma/7VjcrrZ5yeErDxSMoWICj9VQO
	03ERI44dSMNvNyrsy2l7tD7t/oR0XZr0u4SB/tm+0sy8xmknCt7TyAzHU2AwBdLgRXCYd0x2UQC
	5M5AsF1nf5yR6AZU/lusRJ/ng+eNQ6oCDt403U2LX6YopllXoA1lvRKCXpQPXFilT7+FO45Hqrd
	Kf23W5wUIQFItIcYrnzBm98TKPQM7e8ggUZ4GzluafLkRiyasVsCcFlbmujYPcYWPpkWN+RH6fA
	kiLUitSh5gqOFDFRaMuCtxJneodVFqiONmQz3l7vaEXqMJCYkkK4miKfkJVqBJqDSI3/4dStT37
	1VBS+pg67zcq1zntBEoTeiAj6j7K8c/S7vAGyWFnmgfKQNCsR6VzMUQhha19K6HiXSNoSir6fqj
	i9E3b8Js64me6CzJCNdcu3wN80G0W4IkCZ7y8Btb6WRFVMoaleIgOnlD7jg7L5I5gY7ph/xdCds
	T/d/E/3o01uRRb8RKk9fVBED/fpnk6v7AGueaogInSjg5w==
X-Received: by 2002:a17:90b:574b:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3acef1455e2mr2608414a91.21.1792303026863;
        Sat, 17 Oct 2026 22:57:06 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:10 +1000
Subject: [PATCH v3 16/21] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-16-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=j0rOzFFEXjkMK4EG4U+SxX5aLvReXnNVPffFl/z+LCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vk0WW5rpj6bePiVjcsp16Lfqzil65TuCy+bap0h8
 FSdsZW/YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVR9xn+Z0QrbdPOTf875YKM+dsJj+conv81Y/chW//Ml2FFBrda2hj+J3+ffyc
 oeWGv1wFtZbaWyhtMj7/sNUw98ZvN44//Moe5TAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..36f06c6e385d 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,66 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speakers";
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

