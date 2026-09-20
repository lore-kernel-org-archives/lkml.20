Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886FE3D1A97
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880294; cv=none; b=iYi/UDZ0937ik88I4COutAOnPPHafZZqCL5qaPljaKcGhn4JEikbCwQe89FHpXx1zsrtcv/9Y6iL0yBoeWoK1Ga+H9sOUKhmYbaY972xHtX/NZlEPfittEziJ8bkKS9XE0G0j32rHdoQvZEvK6q3Q6c+Rs0vKI3Iix2KU5ROXqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880294; c=relaxed/simple;
	bh=smG/fh+zvKf45VDf3t0AAqeGFxv2Guj0oJz9KpBdYKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DgEWzc/5GqzSWVHJrbAk4g010+6Umujw18/XOvoSAYIdxFJKz0kMjY3ceeQIsgnrlvEcPIIglL0Elf1Gtxm/USEFtD29q4zUH4DLSB8x4hTO0dcLKLkmpYBIK9ysVzqGEUh6QcP1uzVtZIxaME3NW4LfkqrmK2x8LhYRo+pUG80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9aJbK8X; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9aJbK8X"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f066d8so6966085ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880292; x=1790485092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=i9aJbK8X7QYSNvIYnLeyEaVGBTyPwWWTNVQBWN1Y92vsXRRUGVF4Q3wAWekK/8hZjt
         dw0hnarz+miBRfFt7wIOh0R65ilMbf57nXYflCdoOk2d/OMESzOyWr7eLviyHSE+AqPa
         b/JF8HPRIcg06dcPJYPIXXMlFyr59aB04fERdkclGXUFS7mNFt4ywFDS+e/f7km9LjAr
         jeGkqiVoIeywmkSOabud2Gf1pOB0yXeTkqQg0tBZe7V77oh1psLyNsG4PEmgz4CnBZkp
         UtAu4yIHhO+zkDML35K8FExVGlX9knV0WWlIQKmuZVWsiqMGoy1PUCIIECuKnhV13p32
         ebaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880292; x=1790485092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=AmCJ+uat8o0AXA6UC+VNjO8vJ0GUVdLob+PywZBjpzwK8++GF+Ec5D7k7gx6K56QTQ
         Viy/+upID2Jg6YpZtWjiU4d+9Hr9dYZGUVnCBcWFM5u38R0pCXoaqZLZPpNavTF4iovc
         8G7y2adwBvu70c/VUyTmlzhDs9qTeRzmul1Ahb2DTx8clrxZ+0ohGmSBHTArEEtdKxxy
         2xm2sm1cpUGLF4TqKKGffLUGirZ5CH6/oeYjb+9J+0J+w3fznfoM6iP4oUBXjpHVPg7p
         z20JX1be69kdOSwmcRDv2J4viI/uxyGcyyFehYj7Fqs35PgwncJgJUZX1J14R4iuNnkW
         hIdg==
X-Forwarded-Encrypted: i=1; AKwUvBzT8/wtaYkzGn1wIQNXRfhB1SC3Z3aWRDbJtV1ql0zVmhf/qBRE/gw7CaVba4yH57v+5dErb/OXFpgC3NU=@vger.kernel.org
X-Gm-Message-State: AFuF++lK8bEoKpXl6vyTN08T1qkwg0AHx4gT7Z/mJKcwwLBSlyTEx0fh
	ubehUGvLRQ6NCtt5b+t5/DvWxGxvon2rMkTOseFT8R/4jFQLPFUTpRiu
X-Gm-Gg: AYBFou3nhc0l2aOtIfzi2AJN3q0Un3DIoUrTDAna5h+u3GXiAgWBdqzXW4vhMF5skwQ
	foe2pVMdb2lv6E2CBhyR52Upj9lcgpxl2gjO1dgz01YjGbIsNy48125eXTrj9l/9Z5hOGnvPj2p
	GblZimyNGcmuD3prZufvX04HE7hwkekr28XDp80GzCNtI/bT55MR0nOiBQRNDYfChhfcljLQsV+
	NFCxrS0JJ/z1e/cOAESJZEhOA0kL+3T2KXIFnGol1SKa1CQxluHtAehM3MQwjf4xSmcbQMeIepK
	7faO/eLz1+xgBMJ+t5XhPkMK71Mu73Uxkz7074yOc24mvKYnCRdbQ4huelT1g3vYs8R0/IUQy27
	4r+JFwb5bVdH6SedKyfV1Nkfdlms48fXrt6yUBWCiWKRhj3eVew5FXlyaT9AcP89o2UxzHtb++8
	ElayMdHL5e6ceWXpAf2CEzuXrBrL+xKdMgF33gGGeYd26uVjrIO3GqYarEvW7g99oy52ok1KL7N
	ciYmPL+DtszlI4GxfgLBEPJtD5R2nJuc9i07Jx8qXqA3Q5qjkKnfeRusIZCKZjjtMlLZsHPLrFC
	zBa+Ac5DrWGtfzqAd353klWxMOmPIaL9j+jVar5Kkxm9epd6PViocdMakQ==
X-Received: by 2002:a17:903:38c7:b0:2dd:c100:2517 with SMTP id d9443c01a7336-2ddc10025aemr41443735ad.32.1789880292039;
        Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:59 +1000
Subject: [PATCH 20/28] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-20-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=smG/fh+zvKf45VDf3t0AAqeGFxv2Guj0oJz9KpBdYKk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VuyhvMW7Ds9h3dXNYauaI1fvENjrYLNloXfE7/+
 /9FwcL2joksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT/msPIsGD6SeetzNUyV32e1hbMDmx9b/3btb5snUCd1rEgJq2buYwMVwW3aDW
 dXZGUEtGZUOsgVbG4d47hzTtOzj7lP3bJzRLjAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 33 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 33 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..41ec1398f981 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,36 @@ &pcie0_dart_1 {
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
+		compatible = "apple,j456-macaudio", "apple,macaudio";
+		model = "iMac J456";
+
+		dai-link@1 {
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
index ebddde75455c..aa2a08cb22cb 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,36 @@ ethernet0: ethernet@0,0 {
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
+		compatible = "apple,j457-macaudio", "apple,macaudio";
+		model = "iMac J457";
+
+		dai-link@1 {
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

