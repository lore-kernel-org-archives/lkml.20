Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E32939EF0B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302903; cv=none; b=W8S36cUrOHRtB05fRM6FAL+Ek0MrXe4uLcjueBllhjtynzuPUvymljnz3Q+X9kO/8IcFUwGBe7k6C9BCt7cGKZfSB1TKGdaOyWyIrVEkKdSEem7ZloXYmj6b9al9HcNMVya/zLAsuE+hmH7S2F0C1n7kn5+vfL4mOcB4EsQlqN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302903; c=relaxed/simple;
	bh=3ck7KSGiW9djZTJnJd3XJPwpvlOTzheCeApXa/16sy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PS1FCz0kBiGs69InbDa5v1uIoa2soV5m67Bk6GIIEnpTMrW8hlwHaPzMldn6nR2yGAReqKm/nYBHYuDdWxeQTG7QCmvDgWYjcrxMOwzdllitOa4I/2GdGgPWPUg78pClaAzHa9naBQsN9hFoz5LSQ8y3y5tIde0k7eaQq7GqYEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=riC6b4RP; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="riC6b4RP"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so890858a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302901; x=1792907701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0GzEErIsg97OelPFAk/U2hm5FNFeQmobbehjAEKQNY=;
        b=riC6b4RPYJLnkjCkeBS8QqIVbBLgAuTL56n9ReoJjxnXdW2Sat5fuVoGsx6eYlJg56
         qWB1tFg6k9AgUW6sqUeUhnwlrMFk0Yj+znzX5LseXy69lP+bv6FxGBDveyf7DquZ6Iru
         xBJiFuL5C0Nr7zFcw3b6c146oTcTObVQVrq6xec87LgvM7W/kSUaLGiXmEgkfW9f2u3U
         bxQSXCQ1T+rNsXTkBv07vHsFQZzMXnY6EIk7wWdwq1G/gSKrd+w5dhWFatGP8y7TH2Rk
         Tt1Y0x6yxZVzIuzoFit8R38jzYac7Jk/1xv4z0rDbN3x9zq6Gp1TpxyaKjSqZIomuw3a
         xxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302901; x=1792907701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0GzEErIsg97OelPFAk/U2hm5FNFeQmobbehjAEKQNY=;
        b=qaoRoC6Fc3l2Rs+69mGnryE1QJnk2dcfVbnHhEd8pC6Pbi9zJD+HzV6FkN0ToQR4e7
         ToWMz6hSae2wz+i8x2ajobkzFafBaYYuZl9ug9l17Nh20KFh7HjJwLfoa7Y1MorZ1wzF
         acW4kQriC1+I0MjJ0FFfiJ3FNr8tTTstFe6ewIbbqkdagmJ5kWhNz3BchSbHZS3GH2AX
         CVf4bUXjEslfu2PjV9DQUdhJ/Z0+eUV0TWsxp8YKft9Rc0DK/aSCtA2IGJXyktaKKCRI
         Xns5A5dVRgGehrlZM3wHUi0o9JgcnIedQIzPqcA5Gk2kY2KkeXKlwQDHR5vyIlPvp5m8
         /NYg==
X-Forwarded-Encrypted: i=1; AKwUvBy1gGLsxZyc9NRE3tlmluVZFacSoB/v+lG7i6Fa2HKdwrOg/gtO1L4x8j2byCaA+61rZDE+o8PtBHeGaNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR6Z7RSobVep8QxShqNxYZUumFDt3aC/z9UNpIaClQJvpWRHjX
	OlxwDpiv2ceodC5qKaL8wv5XH4Zw/RsvoG2ufiVHHDQXGO5TUGflvS09
X-Gm-Gg: AYBFou1KNPBrTKShvzFhlbhfxeQNtHHqGj+b9TZtAk1+dTCGLfdZNxyMEdFydP8+/BN
	WU1DBitZkdjjKS25gk0+M4EL14x1XpVvzMRk80tdp0e0gLdMsJTW9csYuqVnu+MQ4EuvqkXhP7D
	AiLWOqrYBo50HcgqY0ja1DzG5cvqH8SBsBws4F6+GNpe84fJ2yKf+660soa7QQujQQHhlKUc7Gd
	tHlSdDyNQfzqVCy+qBgh/y1b51U/rWhkwpe2z9T5bybmXqohvhTcJIdUSPes7Zvr9+wVKtn87kh
	YxdajC7SL0lDEKs8IGLkavNKyVnCenc82DZKvQgMVzF6BtyOad0OxFe2y81ITXK7wgkYXAnM3NF
	M0m34BoRQQ01fjlvmDpvU1JwzWtU6eW3yKw7RKERyT5DVf6BQ4Ge43Mo1KuRcfaOQw51q5kWxNa
	shuakOLEf03VfkTnrIyFIuU8evGJ2v8enG8Ort6D06PIg/iXMePJmopV3SFK+ElA3/tQ1S1J6YO
	OS1i72WZpaA8DgHEIeHt+qzoRn5wXPF64mFY6SS6CAPNOWo+lOJLGB0OBdWGkl8KEKeezahu0kb
	80VQ4osOJEGDaevkPRmX0im1Mh2XmrcM9Bi2BLgonVcYWw==
X-Received: by 2002:a17:90a:10f:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3ad1b31933fmr591669a91.60.1792302900781;
        Sat, 17 Oct 2026 22:55:00 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:57 +1000
Subject: [PATCH v3 03/21] ASoC: dt-bindings: Add binding for Apple Silicon
 Mac audio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-3-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7168;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=SS0IiGxMzo2EMW6a+AaERracfk8R0/aaLFv1rffDov0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rkvzrpT+3hikpd0XyeHaOQZWyEpE4t6hTOGb6VLj
 +VvPG7YMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOpWC4a/8oLvZRckda2Tv7r+9ooPjcFXLz7W43pwr/NTVlBt3cr5UxkZNn8vj/3
 7JHkNg4JizDzez8xF/XtiuyNyg/5McbkuaKnKDgA=
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
 .../bindings/sound/apple,macaudio.yaml   | 212 +++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..af8e9686ba7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,212 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sound peripheral integration for Apple Silicon Macs
+
+description:
+  The speakers and headphone jack on Apple Silicon Macs are
+  part of an integrated audio subsystem comprising of Apple's
+  I2S peripheral (MCA) and a series of codecs. The machines
+  have a wide variety of topologies ranging from a simple
+  mono speaker in the desktops to complex stereo arrays with
+  dual-opposed woofers and tweeters all driven by their own
+  mono amplifiers. This arrangement can be expressed as a
+  set of DAI links, where the MCA ports each codec is connected
+  to are represented by the CPU side of the link.
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
+  "^dai-link(@[0-9a-f]+)?$":
+    description: |
+      Node for each sound peripheral such as the speaker array, headphones jack,
+      or microphone.
+    type: object
+    $ref: tdm-slot.yaml#
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
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
+    patternProperties:
+      "^dai-tdm-idle-mode-[0-9]$":
+        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
+
+      "^dai-tdm-slot-tx-idle-mask-[0-9]$":
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Idle slot mask. A bit being set to 1 indicates
+          that the corresponding TDM slot is inactive/idle.
+
+    required:
+      - reg
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
+      dai-link@0 {
+        reg = <0>;
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
+
+      dai-link@1 {
+        reg = <1>;
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
+    };

-- 
2.56.0

