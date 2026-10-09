Received: from sonic310-14.consmr.mail.bf2.yahoo.com (sonic310-14.consmr.mail.bf2.yahoo.com [74.6.135.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275893CB576
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.135.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581149; cv=none; b=r4CQETbkJF98GEj4Qt+kNL7QtHxQVGA9RV39RK7qTRmQ+oQmuogQhGwO6TjGrC8fj16kalJ4RlFGVGo9OyK5WEJKWD8EFEDyIufed3UvfjsMu6isHrikSGKf8HNW6GWbMMKtCl6U5X0sBluxN9KAKP918ElNB5TikzUHDlMgVM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581149; c=relaxed/simple;
	bh=0ex8Sz5fobxXflXiE26sr9k+PG9iBqZjzi6hZN8XHg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=AIctd1N71JgXbZGp9yEvanvl0l4CPbKCxonTKiRb6MuzSNWwFRnd1gz834yrcOhEZ4HEOk72Jvyz318jVloKNw8VEfEUU5T5XE8mMklY612G33Hqy0CGntD/AwfVIaAfTQlr1+aPZT6XoJi/dBadNXH4P69A8A9PLHHYU7am2x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Li1vekXM; arc=none smtp.client-ip=74.6.135.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Li1vekXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791581146; bh=qHgSxkdnVQlY19v7EQbRAz+8I29njKHZVqqI/RHgg1I=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=Li1vekXM6z4HFi4T7+iXVh+JfYOgVhxDDGA13VssaIOJwqywufPHbfGl7wko5X2oT+9SzihRagnyeUKohs2lhejQi8pH7X0JgVcaze8R+KufagiCrEHP5Jgc8sB8Db+M/rvJnIxTG/9z6ZYeE+MBirJYUCnSJoIw7G8WEjA51nQYh+YwLj3F8j/KF9pcdj/y6gBaz/G14Rh1hfZjFl2gvCbURZ+SSECWUeyf7tX5xvwGq+7lKt0N2UE+E3dQXiZOkWN/rO9bF+cPVyp/C/uzGdauL6lrhYk33W56NYgxa/lf+Xt6D7NyHCU+tvNurHOsst8egyH8V+2cr8hk23hNRQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791581146; bh=QjwHDuG7EvLIxV9IsDMehLgmW9jAmuUnjwenQMDuytA=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=WAfK3a/A2bfXALreoryEyAv56BQP0TLb8W4WuoqrGitgJ/4T9yiwfIH5Ojh67BL7WBD6owRRTz1UHgPcJkVh2+Ckv4zQHsxDjR9Rihzr05FJoiSKJ++LbxuBL383bIESlt1WjYJ0CrOn+j8vbNA3cBQd2iy4wBX4VZDQj4NuP3bQOkknlfCx8oLYckUqURcJVClzqHrpOJwdC7mdtd+x4fvBjyDLB/uhffOMgd/YGGYnk1LTwdsKIlzbB9OOWU/QPq1iZXoZ5aE/PR7D5HKCsh7mbhoE5uVObzVtBFLtMVvdpwBzzAXOz9ke94T4D1MQ/FgpSwxNSAskZelWATM9xw==
X-YMail-OSG: HdACYQoVM1lJLtcHSfLxnpElQvH_U9.e7Fx71SDV2HcUDJtfyoDap3nvDDtQd5b
 n7.0MosL7f0peZblJeHSgMDZvUh5wRU7c5J15pkCCPtpB8CTewp8rPx8Wq4YuMOCiKSNrA0fyWyL
 G60338NwM5cDdC6J.xGPROT7fBNBTQrei8WwMtLvcbSDHhqcUwHj6ab1hXVVUsora8H.CuRCMSUf
 FbF1WglpAR5M2i5SOzz3TKW2a9YMw38QETWBK6yXz4H8NvjavQHFKEs5puH_DO1Ro_URKTyDlrnv
 BrnBtwh_88DPknNhOLbVSSCQOsv14MR3oN2I9LWJOZb8BpqWZHPuDbSrBaBMYC2LCCjgYxi8SJyH
 VbQuI15nJ0Vq4g5ef0VuZ9YBXH302XN2gGUajBnXHL90vFR86tRVQve2_4EdEzxEUL0EH0Svqict
 r_aeiHzRzv8_HIBXX8yelUeOotVzW1wt0HW6_I5M5eE8boOULbMqmwlXqEjia2aVPinWva05x9sE
 bCn6uC3KaVMQSP4HFTtqCIyA6vPeb_pVvl_VZSMXKzzF9xNZ.2tFGEfueD0KAy_E3NaquUQXyDI9
 3Om8Rfdap4.qC1GkhTWXMAskO56W9WczImH1T.y1at3GwNzVZlqb4WHsQudIzgg8PScIFOodF8DB
 pv1WB9K_2jNcO1VrkKjNV3J0B5mLP9XJ5FtmJyT9R_aJdpzOV0yH8MjqP4tkLAM8oGHxkNQye4RC
 UbJr442fg_6kdFq_XGH1tTeJltmpHvaz9bZnEtl5CGhjPgH9J7stVIe9gX1jbMkPiE4KrdoJVDxs
 iTuZm8QO20ranTHwT1t1RfLvAFVaSq2sN39aYX2qaLxWzjXH8JdmEPp5QUNNRaxhpHjsl5Bjsbpv
 NO1QDBJkztZtGtgjCJTbRLQ8i04qzpKW3Wugx2.cTi9ySlGBTQfA1NB5C.PjiZcmgUmqtI0fPSGH
 T0SpF4_eUKK6Gk8HIK5a_95OQeRf75Ra7aBkq7sDL1hMIB.GDKo.vTh1SDU13GFsiJCmgOAxhxQP
 zweGvVuy_33PGEzUShUBUjz_zJj.yB_2TT2vLsLO5kv.l5ytOBXxtTDBHIpA4ZCZp1GpqGgHnZyH
 yC9U9Q_2k5oq2f2Lmk_PGnrR5fPbbSbrLjpB2N.037XTHh0zsOynBuV_p929ISBrsEy9mcWDMrLJ
 s9Jph6Epzj.6CAmoUKev3btCGemyDSBVpMISRDI1zABXZ1cZf8KYF_HFpSvssL6cqsYLFmP2hIY2
 jsbjSLtvBdFSDKobpfaFd0G7SmpS5PmbRJExJtxL0I4VGRfQ5MfBaXfwBBBkuTOz9brMNc_Z6BT.
 _EWtNXacZ3L.LxzSIPmIaXwQPUURg.2BQQd8vTWDd.fDGFL2jnwh2rdFxF.IO1PigVj46d7wV7_z
 zdbhg12x3p3xnEz4ySCTR8RSKPfHBc5K_NufC1ykWZD4vi9fKuEevQ4Di7ntTmqpTFVBj8g.fyIG
 GC7_LgMo9gaatkdDhqmRocSGEsJ4chPH0r59b.pwZrGnMW77eXuUuWsjc3TFWYqQjj3_4puZRWau
 q9JQ.JWL5rDvf5D3YllL8I3Qfp2ezT3T2szBf3xjDmGybExCP2gHnKSIwEdw0REE68SQrSrtlc2i
 Z1Wp7LGwEmbk2YnK.JEAEfbwiwxmF8CKIf2dh.Yowu21jzDA0aW0LN1OTblf4XwX.bSXBVujp5AD
 G6VuXyjO24YOqnr00UucKuc.OTzPWobkpdXwlx7JBvLdMd7qUawCmMfyDPospbfImGAeQTi4RRLe
 cFaZ_3zrMa3GWKpE58VAhKw5A.R7jrroHfasK0pL5ynw6T3kNXhtaf.Cdi9QXO3.ZQs0mJCmUe3J
 Wm_UrqIRWzZMrPFNjh4qdplE1CVbdSEixi67REVvO2a6Wpy_Q3WQeFxaZ2js9DQN5CQmmMrmpj0x
 kevBTH7w8YIneLFrpU6V1O72OIIHoP2ssXWULPTJkTm91h3q8s.cvICXPqPxANbLyolTA4koOtf7
 7EOx5mWjBgIJoOUc6lfd7JCNcJHLNYeN.IzV23nZsLTIdeGGvIKgHVDbOImNfLPz6cJZ4HJPWrf7
 .CE70l.WNmZ7hbxqwihIwx1lztdmoV1L7qDncC_3Zg5w2Nsa3xsEnP4Aluav89YK7RYKOmEL3mQ2
 2ku.9J47HTqqkGHpvvQRKRpovVesNnq3RwddcLGWw.2UwN2ukCH43LP9Rgd1kQpdOoTDCpDGV3jS
 wzQ5_JudibCABHq86P4hgA_Hjmew5C0DS.Tf4xQ--
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: 47e50a12-97c2-4c6c-bcb9-ab6b9499186a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Fri, 9 Oct 2026 21:25:46 +0000
Received: by hermes--production-bf1-6d6877594b-r7rdv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 89dc1a489e21d216279610b62058c333;
          Fri, 09 Oct 2026 21:15:31 +0000 (UTC)
From: Jeremy Dean <deaner92@yahoo.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeremy Dean <deaner92@yahoo.com>
Subject: [PATCH v2] dt-bindings: pwm: Convert NXP PCA9685 PWM controller to DT schema
Date: Fri,  9 Oct 2026 21:15:23 +0000
Message-ID: <20261009211523.56122-1-deaner92@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20261009211523.56122-1-deaner92.ref@yahoo.com>

Convert the NXP PCA9685 PWM controller binding to DT schema format.

Changes from the text binding:

Document the 'reg' property and make it required. It was missing
from the text binding, although the example used it and the device
cannot work without the I2C address.

Rename the example node to the generic 'pwm', as required by
pwm.yaml.

Describe both cells of the PWM specifier, and state that 'invert'
and 'open-drain' apply to all outputs, as per the datasheet (INVRT
and OUTDRV bits in MODE2).

Assisted-by: LLM
Signed-off-by: Jeremy Dean <deaner92@yahoo.com>
---
Changes in v2:
- Use the same name in 'maintainers' as in the Signed-off-by. 

v1: https://lore.kernel.org/all/20261006033518.34332-1-deaner92@yahoo.com/

The schema and commit message were drafted with AI assistant.
I verified each property against the driver source, the
PCA9685 datasheet and the binding. Passes make dt_binding_check.
 .../bindings/pwm/nxp,pca9685-pwm.txt          | 27 --------
 .../bindings/pwm/nxp,pca9685-pwm.yaml         | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.txt b/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.txt
deleted file mode 100644
index f21b55c95738..000000000000
--- a/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-NXP PCA9685 16-channel 12-bit PWM LED controller
-================================================
-
-Required properties:
-  - compatible: "nxp,pca9685-pwm"
-  - #pwm-cells: Should be 2. See pwm.yaml in this directory for a description of
-    the cells format.
-    The index 16 is the ALLCALL channel, that sets all PWM channels at the same
-    time.
-
-Optional properties:
-  - invert (bool): boolean to enable inverted logic
-  - open-drain (bool): boolean to configure outputs with open-drain structure;
-		       if omitted use totem-pole structure
-
-Example:
-
-For LEDs that are directly connected to the PCA, the following setting is
-applicable:
-
-pca: pca@41 {
-	compatible = "nxp,pca9685-pwm";
-	#pwm-cells = <2>;
-	reg = <0x41>;
-	invert;
-	open-drain;
-};
diff --git a/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.yaml b/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.yaml
new file mode 100644
index 000000000000..40d82a2437b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/nxp,pca9685-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCA9685 16-channel 12-bit PWM LED controller
+
+maintainers:
+  - Jeremy Dean <deaner92@yahoo.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: nxp,pca9685-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+    description:
+      The first cell is the PWM channel index, from 0 to 15, or 16 for the
+      ALLCALL channel, which sets all PWM channels at the same time. The
+      second cell is the PWM period in nanoseconds.
+
+  invert:
+    type: boolean
+    description:
+      Invert the logic state of all outputs (INVRT bit in the MODE2
+      register). The setting applies to the whole chip, not to individual
+      channels, and is typically used when the outputs drive an external
+      driver stage.
+
+  open-drain:
+    type: boolean
+    description:
+      Configure all outputs with an open-drain structure (OUTDRV bit in the
+      MODE2 register). If omitted, the outputs use a totem-pole structure.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pwm@41 {
+            compatible = "nxp,pca9685-pwm";
+            reg = <0x41>;
+            #pwm-cells = <2>;
+            invert;
+            open-drain;
+        };
+    };

base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.43.0

