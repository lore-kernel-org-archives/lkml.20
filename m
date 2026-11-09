Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794247028;
	b=AsnTJm3ZfvSGFWrCYxBOor1IK+SondLA/UJmDK09yMRbLqi55RA4Wf8b3gFcVk+DLXP8
	 tnHC8LBkwSJFbvJ1uXodKzwdw+RDa9x5OaLdcERRW72BhxanmHWEEQOp+6YB4YQ6aZ8ta
	 eRXdHhYerEb8RVmQLNUkbeeYgXT0RmJIO6A0PIqWmhCbpnu97FOxfGOM2HRYhATNR1tGH
	 AjzJkOCcyq7LckbfJk5u3pP1lZnvW7AIRK5QyDsbBq+717+iKWLI8wH6C87NiDKPBi/dl
	 /QH3MTa6GzMpb//baCMrgg0X5/wU/aBFhDQNaEzoEZ9Y9V+dP39M3fOO6YxBd485AZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247028;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q1V9qzgn7u9HDINwvPhcPNr3QkQmz76AqBGgnB4L8yE=;
	b=QIrKpsEHjTSVl+hixMUIV4JDIiJmJVYjgQ33t01Y5GaeFHF837lz41RO1nBiEF9QrwJ0
	 TE3CmC+3/7x6GQtwoMtTeb0A4yQiA5utAYxwTm/EDPAhihNpk2J0Ux1pYW9D/ZcC7huw0
	 TD2iPDwbGz9cWQF57hXBWsCquSfC6nkHocmlouXrGwsrcC6ujG1dO1EwImVRXl2VQj4N6
	 SFDv70qvvEdCdaDxL1QaQslrwQioi8pvK+DWM3SC+CsHE4ZqFRWvERXFfUFAbgPm06yzF
	 iFXBs2mAz5W47eDb3kUernpjj35thFKABvcilgjDKeAb4PjVXrCyaVVjvCh4Qsys97Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvQf2HWA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45743606A335;
	Mon,  9 Nov 2026 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvQf2HWA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794247027;
	b=bvXMyMM5R8TnWkurBaVQS9rc2M2oaWDmt76B0xDbz8qyo8T2MEXVl+JQl91yay3t0Pml
	 /Ms/WSLZk0QU1y7t2usBQmoTNbNxzlYhmLUHl/cWhoeq+wPcgYGkY5XLs8Sh1YBlsoxD1
	 T1RzqSghNWaP5EhrJjbGgJJJk4yNWhjy/8Nd2tI22sZfrf+47EMpbx1wPRIndyx7ywwSH
	 VWkJmG8LX0G19/+BUp6KrTZ5IJ92ZhDOfpf4KoOV9LWH/Szgid27rJX1KAnKnueroMNbD
	 PNd5QcKSQyXm6xLmImu3zv+aDYuGBgXkSsyuah16GJLaZWTTM4FV+z1Fgsbkr5D1QXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794247027;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q1V9qzgn7u9HDINwvPhcPNr3QkQmz76AqBGgnB4L8yE=;
	b=NEhnOt3sl+Zouh66q9cxEULE2rG7BmCBS8qSmDDryP5n+b2UK9eiWiOGc59U9KsRroTp
	 XMLdTYvj/YhKn91SGXjHJuRYlL8Ob3rIrLSdBgf0EPntnYoUHIdWNNCciWPG2JK15WU5t
	 hqYpjZalmYXfHjrLDTZQlslhdSaPI3MlviMDb5JOUkkJBcY16mkcnKKwaxgCnRDMuspCH
	 3gIS6yCwTTQckQ+txVJgCp9FgTea8RYxth4TgDwdKLyN0JuvPD/jK6X46senOdKW+Bs1p
	 opqLCzQQXd+YEezl4+wHNtp501id/SIqaGo15lybtY9F3uo67Lr5mdvTuW82DZuQ4Fw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A63E1F008A3;
	Mon,  9 Nov 2026 17:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794247027;
	bh=Q1V9qzgn7u9HDINwvPhcPNr3QkQmz76AqBGgnB4L8yE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DvQf2HWAEA174BlMEuFCKB7pgZL48qhoUCMRigJqmHTBpDxBkS6QTyKP8/84fkZZD
	 TL9QFoS/NM71XdaH97HVtj8PiWpRNSGHHsvLf5g45iORxipyuyBi7sU/eRTI09FX0C
	 fBMtXyIDEYeApBmVuel9snhyqiEMEKYRhMygBP/2s0bgj/9uZIqeRYn0W2hvWn0vvm
	 SEh8Em0TdyUstGNcqXK+ZUZLQOJKqAEVd/9QX1qfDYByFNnJ2OZHegaamwb4D3yPSe
	 C7DrK19W+mk/ivILgBdSricC6kbw1ZBt5pzd0hcwvB9vEiaqwwIkCIcR/BrnoMGCAm
	 W5REd5NgtAbSw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9A6F3485A4;
	Mon,  9 Nov 2026 17:57:04 +0000 (UTC)
From: Ricardo Rivera-Matos via B4 Relay <devnull+rriveram.opensource.cirrus.com@kernel.org>
Date: Mon, 09 Nov 2026 11:57:05 -0600
Subject: [PATCH 3/4] ASoC: dt-bindings: cs35l45: Adds Boost BPE properties
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
Message-Id: <20261109-cs35l45-bpe-v1-3-9d7bc95a90a4@opensource.cirrus.com>
References: <20261109-cs35l45-bpe-v1-0-9d7bc95a90a4@opensource.cirrus.com>
In-Reply-To: <20261109-cs35l45-bpe-v1-0-9d7bc95a90a4@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794247023; l=13501;
 i=rriveram@opensource.cirrus.com; s=20261106; h=from:subject:message-id;
 bh=EhLWg93O5krNhwo7UD59yzW4H2U5drNYi4Z2Zj9jWYY=;
 b=agO08oBWqgNrEAH2jGxMKGKEJRMZBJWrQKzXVtAl0a8w7wj46D8dBnJ2xfzr7f6aYVwThG6Qa
 uevQwsq6PsaASBiojFgNmNseR0dqOeHoJLWD0OXvR4fEon2G0w9rAE+
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=k/iAEAtSPXvaWRDFupudzm6His7B7iJP1uiZ578a7Y8=
X-Endpoint-Received: by B4 Relay for
 rriveram@opensource.cirrus.com/20261106 with auth_id=1437
X-Original-From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Reply-To: rriveram@opensource.cirrus.com
Content-Transfer-Encoding: 7bit

From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

Documents devicetree properties for configuring the boost
brownout prevention engine (BBPE).

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 254 +++++++++++++++++++++
 include/dt-bindings/sound/cs35l45.h                |  45 ++++
 2 files changed, 299 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 2c118fa57ad1..9373ce4bc3a8 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -73,6 +73,64 @@ allOf:
         cirrus,amplifier-bpe-attenuation-levels-db: false
         cirrus,amplifier-bpe-attenuation-levels-microvolt: false
 
+  - if:
+      required:
+        - cirrus,boost-bpe-enable
+    then:
+      required:
+        - cirrus,boost-bpe-output-operating-mode
+        - cirrus,boost-bpe-output-attack-rate
+        - cirrus,boost-bpe-output-release-rate
+        - cirrus,boost-bpe-battery-limits-microamp
+        - cirrus,boost-bpe-battery-thresholds-microvolt
+        - cirrus,boost-bpe-battery-attack-rates
+        - cirrus,boost-bpe-battery-hold-times-us
+        - cirrus,boost-bpe-battery-release-rates
+    else:
+      properties:
+        cirrus,boost-bpe-output-operating-mode: false
+        cirrus,boost-bpe-output-attack-rate: false
+        cirrus,boost-bpe-output-release-rate: false
+        cirrus,boost-bpe-battery-limits-microamp: false
+        cirrus,boost-bpe-battery-thresholds-microvolt: false
+        cirrus,boost-bpe-battery-attack-rates: false
+        cirrus,boost-bpe-battery-hold-times-us: false
+        cirrus,boost-bpe-battery-release-rates: false
+        cirrus,boost-bpe-inductor-release-mode: false
+        cirrus,boost-bpe-inductor-threshold-microamp: false
+        cirrus,boost-bpe-inductor-threshold-deltas-microamp: false
+        cirrus,boost-bpe-inductor-threshold-hysteresis-microamp: false
+        cirrus,boost-bpe-inductor-delay-hysteresis-us: false
+        cirrus,boost-bpe-inductor-delays-ms: false
+        cirrus,boost-bpe-inductor-attack-rates: false
+        cirrus,boost-bpe-inductor-release-rates: false
+  - if:
+      properties:
+        cirrus,boost-bpe-output-operating-mode:
+          const: 0
+      required:
+        - cirrus,boost-bpe-output-operating-mode
+    then:
+      required:
+        - cirrus,boost-bpe-inductor-release-mode
+        - cirrus,boost-bpe-inductor-threshold-microamp
+        - cirrus,boost-bpe-inductor-threshold-deltas-microamp
+        - cirrus,boost-bpe-inductor-threshold-hysteresis-microamp
+        - cirrus,boost-bpe-inductor-delay-hysteresis-us
+        - cirrus,boost-bpe-inductor-delays-ms
+        - cirrus,boost-bpe-inductor-attack-rates
+        - cirrus,boost-bpe-inductor-release-rates
+    else:
+      properties:
+        cirrus,boost-bpe-inductor-release-mode: false
+        cirrus,boost-bpe-inductor-threshold-microamp: false
+        cirrus,boost-bpe-inductor-threshold-deltas-microamp: false
+        cirrus,boost-bpe-inductor-threshold-hysteresis-microamp: false
+        cirrus,boost-bpe-inductor-delay-hysteresis-us: false
+        cirrus,boost-bpe-inductor-delays-ms: false
+        cirrus,boost-bpe-inductor-attack-rates: false
+        cirrus,boost-bpe-inductor-release-rates: false
+
 properties:
   compatible:
     enum:
@@ -165,6 +223,166 @@ properties:
       - 0
       - 1
 
+  cirrus,boost-bpe-enable:
+    type: boolean
+    description:
+      Enable the boost converter brownout protection engine (BBPE).
+      Configuration properties are applied before the engine is enabled.
+
+  cirrus,boost-bpe-inductor-release-mode:
+    description:
+      Selects whether the inductor current response releases instantly or
+      through the release counter. Required in combined mode. Use a
+      CS35L45_BST_BPE_IL_RELEASE_MODE_* constant.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  cirrus,boost-bpe-output-operating-mode:
+    description:
+      Selects the operating mode for the BBPE output stage. The BBPE can be
+      configured to apply the minimum of the battery voltage and inductor
+      current response or the battery voltage response only. When operating in
+      battery voltage only mode, the inductor response related properties are
+      invalid.
+
+      Required when Boost BPE is enabled. Use a CS35L45_BST_BPE_OUTPUT_MODE_*
+      constant.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  cirrus,boost-bpe-output-attack-rate:
+    description:
+      Boost BPE output attack-rate selector. Use a
+      CS35L45_BST_BPE_ATTACK_RATE_* constant.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+
+  cirrus,boost-bpe-output-release-rate:
+    description:
+      Boost BPE output release-rate selector. Use a
+      CS35L45_BST_BPE_RELEASE_RATE_* constant.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 16
+
+  cirrus,boost-bpe-battery-limits-microamp:
+    description:
+      Boost converter current limits for battery voltage response levels 1
+      through 4, in ascending level order.
+    minItems: 4
+    maxItems: 4
+    items:
+      minimum: 250000
+      maximum: 4625000
+      multipleOf: 62500
+
+  cirrus,boost-bpe-battery-thresholds-microvolt:
+    description:
+      Battery voltage thresholds for battery voltage response levels 0 through
+      3, in ascending level order.
+    minItems: 4
+    maxItems: 4
+    items:
+      minimum: 2300000
+      maximum: 4500000
+      multipleOf: 10000
+
+  cirrus,boost-bpe-battery-attack-rates:
+    description:
+      Attack-rate selectors for battery voltage response levels 1 through 3, in
+      ascending level order. Use CS35L45_BST_BPE_ATTACK_RATE_* constants.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 3
+    maxItems: 3
+    items:
+      minimum: 0
+      maximum: 7
+
+  cirrus,boost-bpe-battery-hold-times-us:
+    description:
+      Hold times for battery voltage response levels 0 through 3, in ascending
+      level order. Infinite hold is not supported.
+    minItems: 4
+    maxItems: 4
+    items:
+      enum: [0, 5, 10, 25, 50, 100, 250, 500, 1000, 2500, 5000, 10000]
+
+  cirrus,boost-bpe-battery-release-rates:
+    description:
+      Release-rate selectors for voltage response levels 0 through 3, in
+      ascending level order. Use CS35L45_BST_BPE_RELEASE_RATE_* constants.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 16
+
+  cirrus,boost-bpe-inductor-threshold-microamp:
+    description:
+      Inductor current response level 1 threshold.
+    minimum: 250000
+    maximum: 4000000
+    multipleOf: 62500
+
+  cirrus,boost-bpe-inductor-threshold-deltas-microamp:
+    description:
+      Inductor current response threshold deltas 1 and 2, in that order.
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 3750000
+      multipleOf: 62500
+
+  cirrus,boost-bpe-inductor-threshold-hysteresis-microamp:
+    description:
+      Release threshold hysteresis for inductor current response levels 1
+      and 2.
+    minimum: 0
+    maximum: 968750
+    multipleOf: 31250
+
+  cirrus,boost-bpe-inductor-delay-hysteresis-us:
+    description:
+      Release delay hysteresis for inductor current response levels 1 and 2.
+    minimum: 0
+    maximum: 992
+    multipleOf: 32
+
+  cirrus,boost-bpe-inductor-delays-ms:
+    description:
+      Entry delays for inductor current response levels 1 and 2, in ascending
+      level order.
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 100
+
+  cirrus,boost-bpe-inductor-attack-rates:
+    description:
+      Attack-rate selectors for inductor current response levels 1 and 2, in
+      ascending level order. Use CS35L45_BST_BPE_ATTACK_RATE_* constants.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 7
+
+  cirrus,boost-bpe-inductor-release-rates:
+    description:
+      Release-rate selectors for inductor current response levels 1 and 2, in
+      ascending level order. Use CS35L45_BST_BPE_RELEASE_RATE_* constants.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 16
+
   cirrus,ldpm-group2-vmon-select:
     type: boolean
     description:
@@ -412,6 +630,42 @@ examples:
             cirrus,amplifier-bpe-attack-rates = <6 6 6 6>;
             cirrus,amplifier-bpe-hold-times-us = <500 500 500 500>;
             cirrus,amplifier-bpe-release-rates = <5 5 5 5>;
+            cirrus,boost-bpe-enable;
+            cirrus,boost-bpe-inductor-release-mode =
+              <CS35L45_BST_BPE_IL_RELEASE_MODE_COUNTER>;
+            cirrus,boost-bpe-output-operating-mode =
+              <CS35L45_BST_BPE_OUTPUT_MODE_BOTH>;
+            cirrus,boost-bpe-output-attack-rate =
+              <CS35L45_BST_BPE_ATTACK_RATE_31P25MA_PER_US>;
+            cirrus,boost-bpe-output-release-rate =
+              <CS35L45_BST_BPE_RELEASE_RATE_3P90625MA_PER_US>;
+            cirrus,boost-bpe-battery-limits-microamp =
+              <1000000 1500000 2000000 2500000>;
+            cirrus,boost-bpe-battery-thresholds-microvolt =
+              <4000000 3600000 3200000 2800000>;
+            cirrus,boost-bpe-battery-attack-rates =
+              <CS35L45_BST_BPE_ATTACK_RATE_INSTANT
+              CS35L45_BST_BPE_ATTACK_RATE_125MA_PER_US
+              CS35L45_BST_BPE_ATTACK_RATE_31P25MA_PER_US>;
+            cirrus,boost-bpe-battery-hold-times-us = <0 5 10 25>;
+            cirrus,boost-bpe-battery-release-rates =
+              <CS35L45_BST_BPE_RELEASE_RATE_INSTANT
+              CS35L45_BST_BPE_RELEASE_RATE_62P5MA_PER_US
+              CS35L45_BST_BPE_RELEASE_RATE_31P25MA_PER_US
+              CS35L45_BST_BPE_RELEASE_RATE_15P625MA_PER_US>;
+            cirrus,boost-bpe-inductor-threshold-microamp = <3000000>;
+            cirrus,boost-bpe-inductor-threshold-deltas-microamp =
+              <250000 500000>;
+            cirrus,boost-bpe-inductor-threshold-hysteresis-microamp =
+              <125000>;
+            cirrus,boost-bpe-inductor-delay-hysteresis-us = <64>;
+            cirrus,boost-bpe-inductor-delays-ms = <12 4>;
+            cirrus,boost-bpe-inductor-attack-rates =
+              <CS35L45_BST_BPE_ATTACK_RATE_INSTANT
+              CS35L45_BST_BPE_ATTACK_RATE_125MA_PER_US>;
+            cirrus,boost-bpe-inductor-release-rates =
+              <CS35L45_BST_BPE_RELEASE_RATE_INSTANT
+              CS35L45_BST_BPE_RELEASE_RATE_62P5MA_PER_US>;
             cirrus,gpio-ctrl1 {
                 gpio-ctrl = <0x2>;
             };
diff --git a/include/dt-bindings/sound/cs35l45.h b/include/dt-bindings/sound/cs35l45.h
index 5cb77d48b0b8..4a7535a81612 100644
--- a/include/dt-bindings/sound/cs35l45.h
+++ b/include/dt-bindings/sound/cs35l45.h
@@ -17,6 +17,51 @@
 #define CS35L45_ASP_TX_HIZ_UNUSED	0x1
 #define CS35L45_ASP_TX_HIZ_DISABLED	0x2
 
+/*
+ * cirrus,boost-bpe-inductor-release-mode
+ */
+#define CS35L45_BST_BPE_IL_RELEASE_MODE_INSTANT	0x0
+#define CS35L45_BST_BPE_IL_RELEASE_MODE_COUNTER	0x1
+
+/*
+ * cirrus,boost-bpe-output-operating-mode
+ */
+#define CS35L45_BST_BPE_OUTPUT_MODE_BOTH		0x0
+#define CS35L45_BST_BPE_OUTPUT_MODE_VOLTAGE_ONLY	0x1
+
+/*
+ * Boost BPE attack-rate selectors
+ */
+#define CS35L45_BST_BPE_ATTACK_RATE_INSTANT		0x0
+#define CS35L45_BST_BPE_ATTACK_RATE_250MA_PER_US	0x1
+#define CS35L45_BST_BPE_ATTACK_RATE_125MA_PER_US	0x2
+#define CS35L45_BST_BPE_ATTACK_RATE_62P5MA_PER_US	0x3
+#define CS35L45_BST_BPE_ATTACK_RATE_31P25MA_PER_US	0x4
+#define CS35L45_BST_BPE_ATTACK_RATE_15P625MA_PER_US	0x5
+#define CS35L45_BST_BPE_ATTACK_RATE_7P8125MA_PER_US	0x6
+#define CS35L45_BST_BPE_ATTACK_RATE_3P90625MA_PER_US	0x7
+
+/*
+ * Boost BPE release-rate selectors
+ */
+#define CS35L45_BST_BPE_RELEASE_RATE_INSTANT		0x00
+#define CS35L45_BST_BPE_RELEASE_RATE_62P5MA_PER_US	0x01
+#define CS35L45_BST_BPE_RELEASE_RATE_31P25MA_PER_US	0x02
+#define CS35L45_BST_BPE_RELEASE_RATE_15P625MA_PER_US	0x03
+#define CS35L45_BST_BPE_RELEASE_RATE_7P8125MA_PER_US	0x04
+#define CS35L45_BST_BPE_RELEASE_RATE_3P90625MA_PER_US	0x05
+#define CS35L45_BST_BPE_RELEASE_RATE_1P953125MA_PER_US	0x06
+#define CS35L45_BST_BPE_RELEASE_RATE_0P976562MA_PER_US	0x07
+#define CS35L45_BST_BPE_RELEASE_RATE_0P488281MA_PER_US	0x08
+#define CS35L45_BST_BPE_RELEASE_RATE_0P244141MA_PER_US	0x09
+#define CS35L45_BST_BPE_RELEASE_RATE_0P122070MA_PER_US	0x0A
+#define CS35L45_BST_BPE_RELEASE_RATE_0P061035MA_PER_US	0x0B
+#define CS35L45_BST_BPE_RELEASE_RATE_0P030518MA_PER_US	0x0C
+#define CS35L45_BST_BPE_RELEASE_RATE_0P015259MA_PER_US	0x0D
+#define CS35L45_BST_BPE_RELEASE_RATE_0P007629MA_PER_US	0x0E
+#define CS35L45_BST_BPE_RELEASE_RATE_0P003815MA_PER_US	0x0F
+#define CS35L45_BST_BPE_RELEASE_RATE_0P001907MA_PER_US	0x10
+
 /*
  * cirrus,boost-low-power-mode
  *

-- 
2.43.0


