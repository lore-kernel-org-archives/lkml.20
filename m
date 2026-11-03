Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691759;
	b=x309/gOjik0qGUD0bsLkgVBXOXXzQplFt0JH4aDtnkOsJev98W2QA0N7CLIBT7Rw/L27
	 qyD/GaetKIvGX2rktOlCeRx3elSIeMovR9N6rsHvvpkQNhdM3ANOc37nNbwpMQfBbS0PU
	 yuwt7GeA7hzQ9AUB+2qKO3lxCK9q02wdD0DT1TH3+D0APDp7aW34zhOE44jaqV7eqDQWc
	 5II+niS7vhqRo1HiBLiRyzancuTn+Mcn3dcn64GVMogYbGRE39cUpi052g2UI3E3oKKB9
	 JQND6FnqAyTgxaNUzPi9LLeMgamOTCzZlXYU3roZCvnbMvWninL95Kf0zHxF/Su/Kyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
	b=WHAC2ptnsc8RfkuiHvDqf1EM/OiANwXK2BzhD6IWIouWZCTGgaWezNp8HI2j5PS545fY
	 Er1qV//Y3/g8+XDweCvhwaEoCuNBPXXGSfzSYRRF3liTAsOgPp2K4yFnSmU6qDAoWEHDz
	 Xc4jH7hnVwA+aWWi/wzcxjDQ/LH0P9tPYlXZfqGl2BKjS6ZiMlaF9vL1WYkC3Cg91IsF6
	 +LR3TleKw6Ub1Pcogr+LmJlOjyfIEbPNfie0y1Hi4g4sd/67euf/19+wnFGfy6V0JAc/X
	 7w02q8KsIjiD7uMbRHH2D+c/HbHFA/70/ImTAnulasb58f0t2oZ2K06VSq3z1GocQUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iuunEE49;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E844B606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E844B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iuunEE49
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so1301026a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691758; x=1794296558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=iuunEE49RrUD7Hpbjb2aUZpMRRiSomZtYuMEEtERJOZbiR8kxx+YH+vYOgQ+YsCWbt
         RsF5/PphdWanvJKIjgCMNn4vM9DbkCJKhZtZ9hAP2PKwsN6RQB3LyzjOTJN9Uz12zspn
         wQKnLLHKrUnZI9+WVFKGNdXV68ubmPNmgnrIpClrPBHHe71Mc3eYtnTRYAFI+SBMVsVE
         eoCi+ADQcSzmgeidNnoJee61DeNBSqPhDcI+waf46+C9jdmMY+2y/q7HHlrHbOtDYKgp
         fOW9O5KtKB3aOtgcG9FG0vIWslBcbeyGNqxA7aaXqTVouumvhsScGaKv+vE0rzIVoqeA
         8/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691758; x=1794296558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=L8vafsiV0nr8FpW7CC7cxanAdusM6kD5MRbODv1Y/3OKxsS5qrwXM3hnwflLOmgENc
         8PrZISQScJ+v7wxcuAjfKd3R9MnBokqcPHh49YAUkxAxkcsQgRghKp/f+WekQ5MfO5N8
         3nQ23Zym3m16LA226qU/WBeqBHmJlNPecQkuuzLGwE/BoM6w7di+x+AmS3W2x4CbA6NY
         6+4g1d0oZH6iNpooOp3CEORG8lEz0geR5NOPz3o3ng/T58IPQxMs0CEIGy2NswWs+gde
         gfwHk1hTYf3XkzY9Kw2Fcl0DWSla3h2vUtXGfQ1CGB1sXeAMaQBIwKQ6h/wp/gpn1Sq5
         s08g==
X-Forwarded-Encrypted: i=1; AKwUvBx4X0wt+ZMyk5F3LeLqxLD3Igi0KVHySN7tFZYLqstyZGUTW07xkrYmNgTInx/Xk6++Jy6U/UFZeBA0VaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J4v0jrZKWrAQZ/lRRr4/GtMRATS7/cWQ9AfdJrAsjySphSTr1
	TDvrLShWb+3B3CDyR017NesxkOplxUaJOWNeRtN3Aft5dHXZjKB7Lp7v
X-Gm-Gg: AYBFou2HOCVGFbgR3qKL2w1tXx1nkACtNOY9LFZ3UuzyCHCV24jZT7OUnsqbxV3Cl6u
	ZklAl1jP1HAFn5tZ3g4yNWOlkNCnzrpE6AgT73vG3mJXyBlXChhVF+SEOZk8iVBszXJ9ETqWexk
	i+K0yVAuJ6d+KbuZKqh4TkNK/yUUKxavH923GtQIJPsQgt5UmuLl0vgDuXsSAgsFiun19Uist+K
	NxpLDuPtDgDWIWldIypv/oq8R8fS3vl36pAlbqfji3K1pE47QEbTbluffFtTA6BN3shxaLeEq4T
	ukqrooUFL48BhUQq/XWyLoapQqAwyN4yYyYNFdGkK4v+KiHUFZDK6Ik1lGXzXLSDMQg2V0ZHhZK
	s64Yf0LcUE5Dg9K9DhgMtgl1opNsmuQuyuwz7d6UNBtOmfaX7HVPJe9Rfv4Z5q8i7CRy2XhZENR
	nvblPrfUYSlQTOYRc7bMAM6UdqcYBDf/wDG4NSVb1uExg1SBX00u0utavIRJPllcfCSNZcAO0oj
	5hjXAn8bnIYTQ54GMLbCyCiUyrTTjs3rlEIXyF/yfewR9hNxdqBhNi0FxQflgHh7HH4CFnkUeMz
	dhl5buxB2X2kNgHKKm7hQnGLVKbYya8a326JHExrgx+jf/EBm6Q4hSEpDmgNVNrSXNw1iUNqvdv
	YJQV9kWg6pDZvEqogDJuTVKlqAvoQ0ec+0kJAMCrY5zUKIsQnno2Rz6RwIxdIi6txW4/LlxMBY6
	H7spQ=
X-Received: by 2002:a17:90b:4483:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ae8979ba8emr10104416a91.39.1793691758138;
        Mon, 02 Nov 2026 23:42:38 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:05 +1000
Subject: [PATCH v4 17/22] arm64: dts: apple: t8112-j473: Add
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
Message-Id: <20261103-macaudio-v4-17-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KxdvsBHCHsOgUdKIYNQ3yP4bIh+4Vy0Oz8XtoAQOVeo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89Xx62O3jC1V+SyUKnljuUFkfUzbs2NS1jV+n2zh
 uF0wYv7OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFO97DIjw47K7990qu8sXTpV40lwXnSeuuYVy6OzqzYf1q1SUq3je8Pwz9zvc/D
 7CTr8d4OP+Apqzq+on+4kU1LvfPuwfrGark0hHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..6d79164cea89 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,62 @@ &typec1 {
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
+
+		speaker-dai-link {
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
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.56.0

