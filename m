Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691645;
	b=I5FMmWNL6WhhWnbqql2XlJhXo4pXRPH0TBIrkRfgETwCo+Lj0edN/kD856txMFY3NC+t
	 iJ2LI8gAhCAOpuzviWifCpW1nsfSlXFrEaQy1hIM0KG7FpWHsYV0iQqLnq0W/wVsG/+Fq
	 jgy5qjs2faK6OHf5g86aU9hBhXwI52gJGuq2sDzWznjcT3sWWuAR3oZ3bE1KWRzsOMUvc
	 Q7P+X/85OzFR9vI3zg4jNhL36Cl0bX17NZeiyMGDBlJOoDz6kKUX5RgKEzyQZdkkPGoBp
	 xIkvvoaA4LX2e03XLwr2m/MsvdRssB+EyL38L2UcNtWFP/JlrTD/l65Xuv12iqxV87g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=;
	b=Wcc3JFTCThT7whDlo6yjMXMXIk8Jb9erZ0wY1TeOki4pzR4K+UY/z896ZkMGsJ6AXE4q
	 OFJsSz8isnbe/PwR2+///4zl4weF02KXF4u1AFFilJItBruvAwpJE2SUa2bPr9C7kGJPU
	 /2Dwb3a9KoCIqPCXszfFik8mSaiunaPl8VFG3aygpA4CFofMcZeBjxn09LDf8IhgVuzJU
	 2h03Fwu4c5oMt79CoDaicTlsIbn4TV7ksCzkKRYlWcVhwDv268qIOU18XB5W8W7cH4mZz
	 u/zgoXkryBQ0KYvJCFCLesT5UlaGN5scJDFHpEetL0/7r0t464akHxZL9xDwgA9ppCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OU6JyIc9;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B21A606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B21A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OU6JyIc9
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso25810a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691645; x=1794296445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=;
        b=OU6JyIc9uZuxLCSN4NWhjghGi135jR+ORUkGaGbSQkWPzPFu2W2DmZ7T0VbRVVktTD
         Q14QrsL3Gp7bjTB06HeXuWUmVDDHVti20xTDnlFgkqH5Cgr0evO0FYaFSrCWsFCG6n4H
         1PVjL+SyVq+ZtxxTt3L5rBpcDAJ7JrBFO088kQFVz56LqbYj3+GstJgXO/cDZILdjvUB
         2v8ExGAbjMa74CoRx2BV5mTUul+LiANHduo1BUz+zddUOpJstwcj62bU+XoIvn7mEKJn
         mGxGFtSW67gdMBRQIGmWUCtJKRxB3GkaWiMtqQoLFpLt8RyHmdiijSwa81pR5DHdgWGc
         zNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691645; x=1794296445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=;
        b=s+IyTDMCCEQ4ZmchG1ZPo6LpsFxzWqwPxE5+j80DWQWVoOZ2ncfZL4AI1h8TGC1X1i
         MIU18hlPU5jBz0jj5QmqneeUsPPdiBD/Y6xteOzVu+sFBaaxhUgXOqgzW2fdSdibiTc7
         NaWAjB1IUnfMWwpbqAGojvWHKSlbB5lz6IOshocE4MqJ9020Fl9n1i4MYgCuxqN/XgBr
         XW4ZfwbJJotD/2mt1YR25Ng2RtsmNP9MiY83cydYRxYG82kPk+h2Q1BKnNs7M9pFxVjZ
         xFkwe2ApEX5ZHCVmvH5mi0VaZe52X1RDUyIZUNnX3USZLWhhofKjpL3+g/yyyoIQAcD1
         4l2A==
X-Forwarded-Encrypted: i=1; AKwUvByMtYwYWIvmELn5V4ZEOCL+6MYyOVCLImbvjX6dM24nU3dK8PQ/92IgArtpzoWkUdLQH2lIrDvVYC+elA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Begbq3bqt8ljGjvmY070DLEZD8bgAf/aqPUHUtDfRj5+wlWBo
	wXjuUXY5W0NyzYXemhiIZyiBxNiebdHJ3m1c1ZnIQCzvC23A2hqF7qyJ
X-Gm-Gg: AYBFou3gubJ0aCgj/DBBtT9r8T1WAMYhLupcBpGh/7rmwVfBG35rsFueoAqIUrkjyrj
	ve+DB0YbdOpPDKs/Mql4WWm08F5ajc821vs9jJm4P0Yah+uBOY9h1cC6RoWZa6AGHLQ9vCQBVqQ
	n5g6u6/mCu9LmwBD9bR2sTojGonz9jmlRCwoP1Sm4o4ZXm6CL/Og9wI97YYcu8BHwfX5yL8LFke
	5OoEWnE5JRKFPUBGnI666GyZWbEnEVFiXIiz2JiQjIZv6bw23wtgWv84cc1jTxjspEF4wCbfmh2
	h4JSgSd8IwQmg2UdAoiCNle3h7xTa+Qt7tHfdrQGm5nMRYTEVaghg1EoHfrFYUe7Yo0m4oAKpUY
	/rSTlKWyi+iv+9bvHfbhemo+6lLW4iRIRkr7ZM2RqG1gguJDbYN0jg18F04157CB9BoW7pGVTu4
	FOlARq0XioVRSLwC1wAaMTHxnsOIB3c2T+qpqYuqeUs6eTf+LdlPNXY4tlRSrm1+kKewUvNbH/s
	PAM0nNRNB1mQkr1w8oQO2bm6YSIyC3UCC0IwkSdXEWChuDax3GPa1xFCDngDkUkU8DcczYlBTXN
	bR2kWrESqJIeFaVBSZb6ZDilDft8X5EE5+kKqu/UztGYmd46jG+MH+DvwlmNXwu9LPZstFeA0IC
	PA2EOuadIKoQMxZaDgbcQVnHbetWxOXVE/q3YIMJ8q8E3fHfeGUVohJduc9H///m2khidVEZqHK
	iSJBA=
X-Received: by 2002:a17:90a:e7cf:b0:3ac:9a54:e3ce with SMTP id 98e67ed59e1d1-3ae8986e718mr10689427a91.63.1793691644616;
        Mon, 02 Nov 2026 23:40:44 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:44 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:52 +1000
Subject: [PATCH v4 04/22] ASoC: dt-bindings: Add binding for Apple Silicon
 Mac audio
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-4-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6733;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=q6cZjCz9R++Ba7lkffXrC5JosZFNf04Vy9Rd1123Uys=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/usmxdxzhdZvNmS70e5/1RxxwvHDTkPndTUn2iz
 dTIEv8JHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKleEszw369Bo9xKgbn9AUfmUx9e8xcLJE4bb5K+/OLMi3PdO9y+azIyTPryTHz
 tkXnx6kdq9HTaPS9t+bA42k7a7+b+nyInzQ/1cgEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Add a binding for the primary audio subsystem found on Apple Silicon
Macs. This binding integrates the codecs and SoC I2S peripheral
used for driving the headset jack and speaker arrays on all Apple
Silicon Macs. The internal microphones on this platform are
connected to a distinct coprocessor and are not part of this
"main" audio subsystem.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../devicetree/bindings/sound/apple,macaudio.yaml  | 195 +++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..7a97ce5bb7a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,195 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sound peripheral integration for Apple Silicon Macs
+
+description:
+  The speakers and headphone jack on Apple Silicon Macs are part of an
+  integrated audio subsystem comprising of Apple's I2S peripheral (MCA) and a
+  series of codecs. The machines have a wide variety of topologies ranging
+  from a simple mono speaker in the desktops to complex stereo arrays with
+  dual-opposed woofers and tweeters all driven by their own mono amplifiers.
+  This arrangement can be expressed as a set of DAI links, where the MCA ports
+  each codec is connected to are represented by the CPU side of the link.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apple,j180-macaudio
+              - apple,j274-macaudio
+              - apple,j293-macaudio
+              - apple,j313-macaudio
+              - apple,j314-macaudio
+              - apple,j316-macaudio
+              - apple,j375-macaudio
+              - apple,j413-macaudio
+              - apple,j415-macaudio
+              - apple,j456-macaudio
+              - apple,j473-macaudio
+      - items:
+          - enum:
+              - apple,j493-macaudio
+          - const: apple,j293-macaudio
+      - items:
+          - enum:
+              - apple,j414-macaudio
+              - apple,j504-macaudio
+              - apple,j514-macaudio
+          - const: apple,j314-macaudio
+      - items:
+          - enum:
+              - apple,j416-macaudio
+              - apple,j516-macaudio
+          - const: apple,j316-macaudio
+      - items:
+          - enum:
+              - apple,j475-macaudio
+              - apple,j575-macaudio
+          - const: apple,j375-macaudio
+      - items:
+          - enum:
+              - apple,j613-macaudio
+          - const: apple,j413-macaudio
+      - items:
+          - enum:
+              - apple,j615-macaudio
+          - const: apple,j415-macaudio
+      - items:
+          - enum:
+              - apple,j457-macaudio
+          - const: apple,j456-macaudio
+      - items:
+          - enum:
+              - apple,j474-macaudio
+          - const: apple,j473-macaudio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  model:
+    description:
+      Model name for presentation to users
+    $ref: /schemas/types.yaml#/definitions/string
+
+patternProperties:
+  "^([a-z]+-)?dai-link$":
+    description: Node for each sound peripheral such as the speaker array,
+      headphones jack, or microphone.
+    type: object
+    $ref: tdm-slot.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      link-name:
+        description: Name for the peripheral
+        enum: [ Headphone Jack, Speaker, Speakers ]
+        $ref: /schemas/types.yaml#/definitions/string
+
+      codec:
+        type: object
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 8
+            description: |
+              DAI list with the CODEC-side DAIs connected to the above CPU-side
+              DAIs and involved in this sound peripheral.
+
+              The list is in left/right order if applicable. If there are more
+              than one CPU-side DAIs (there can be two), the CODECs must be
+              listed first those connected to the first CPU, then those
+              connected to the second.
+
+              In addition, on some machines with many speaker codecs, the CODECs
+              are listed in this fixed order:
+
+              Four speakers: Left Front, Left Rear, Right Front, Right Rear
+              Six speakers: Left Woofer 1, Left Tweeter, Left Woofer 2,
+                            Right Woofer 1, Right Tweeter, Right Woofer 2
+
+        required:
+          - sound-dai
+
+      cpu:
+        type: object
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+            description: |
+              DAI list with CPU-side I2S ports involved in this peripheral.
+
+        required:
+          - sound-dai
+
+    required:
+      - link-name
+      - codec
+      - cpu
+
+required:
+  - '#address-cells'
+  - '#size-cells'
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+      model = "MacBook Pro J416";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      headphone-dai-link {
+        link-name = "Headphone Jack";
+
+        codec {
+          sound-dai = <&jack_codec>;
+        };
+
+        cpu {
+          sound-dai = <&mca 2>;
+        };
+      };
+
+      speaker-dai-link {
+        link-name = "Speakers";
+
+        dai-tdm-idle-mode-0 = "zero";
+        dai-tdm-idle-mode-3 = "zero";
+        dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+        dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+        codec {
+          sound-dai = <&speaker_left_woof1>,
+                      <&speaker_left_tweet>,
+                      <&speaker_left_woof2>,
+                      <&speaker_right_woof1>,
+                      <&speaker_right_tweet>,
+                      <&speaker_right_woof2>;
+        };
+
+        cpu {
+          sound-dai = <&mca 0>, <&mca 1>;
+        };
+      };
+    };

-- 
2.56.0

