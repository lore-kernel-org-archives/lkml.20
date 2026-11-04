Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795588;
	b=ZoEHcRfEZQPYnHyhF9/tr8C5ky8B49UH+RedGMwj4pFeItRE3CSiyjKnkXpDWjGr8OhG
	 b25l+DeBHmEZvGDXKu9FjBgsHdMr75ocTdh5C6j7cVk+jEMOx1KthDwNrjYLnN/VAINY3
	 E0KbkEVP6O1reZBuTSrsqPG2sXcm2IfXRSU++17LdqSB/mNpqjTPJP3O4tfprlcCQV/LV
	 rm/nxvVcwUAlAqVooguqfkja2e0WNfeSyYh+aF/muJe98no2t86/ExV0mdpVhYK+XCLB/
	 AWWpTNS0hZ98v34zD8Hegy8tLqKVgDYc7//3NH5y9FkL8qpXsewGQA/e9Yy2puXZqew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
	b=btnjmVxZ7ou5NDorR52oRyceeeTxy34/nReJkONMyFiDO2vdoS+5EFJ3wGtLYyw8mPWN
	 O7fVfEjZzAxS0q4Ghr3BbrnkRQ6qxr/vnuG8YXBL1RvlU+luHBPMtWsKSDKpJEOMmGG+8
	 fAE1uxkyLn3+99v7PCgyWtGHqxo3uypu1NBLM1MVBHASE0IPN79y+Rmk9FflDELDkwIRM
	 JbuC3O43P8jmBsnBYxlj+eijZmZx6KhhYSfK413hy9Bh1K/lmqqImngjSTK/Y7tW5sJA2
	 Sl8pPLb77AVdbxLJmZKgsAKX5EDr8tNjqWzq+4nALjxS2l0OZ0KzDd6MgsRLC7rLnuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yog3OyDb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726BF606A33D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 726BF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yog3OyDb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so5358095e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795587; x=1794400387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=Yog3OyDb1q2TKjdtPXm6WYUczAoOFpStIyM/2ceCytih0faqgI4mpLtu+KHaw0el5I
         O++3e+47REx92CLnuYhbQEEFcpMlwYhBO2g9nbVvkwJaQb3wOnAyjzPp9kPBgMGjYoXT
         i98KwkG7pgyAGIhne6+M2opCERjb9gZ1kT6gseCX1ky4YWz4E9golN1JpyRbK7kw9tM/
         Irs31lfJYnMG4qIgm9aAohf+/gF7sUd2+WzM4T9X3Fz9tAs8BDAxuDGW8KV4/FWaOUBZ
         C5jepseInrn3lNT/LcqJ33u3HckdUtsPs4ZcHjTBY2yjCrD53zafkTliwXTrTQeX3c+x
         Q4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795587; x=1794400387;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=VgXna0QGt0mpur5/BQqlp6G1vVTA4yweMnBAiiKuipCmRe66YAsHciRlBUoDX+tcRw
         bB2uXSUH3diG44AFFO2Zrj0/5a+X3MqHUlqXWrBRae2SDrC5WzIsuTGTsfohtII+KBPT
         GNxXsrKDEgPlYB8DOSWuPeejDEWKosXYxpQa2QSbhZlLDxTxfkXE/vKS5b3tn2JW1IIN
         gNUL2zp9BiOtIDRSfE1mbRjE77mPf7Idcr2TeRajHQpZ+Tj4HdWy6m0Hs2SekQ4d420n
         JZt8MQ1BwaWyDKC0r3XdI6ZTxXAmSTeCuh1Sj/Be/YX6c7rfZH9oqeGDmzoXMaP9/LzN
         vAQg==
X-Forwarded-Encrypted: i=1; AKwUvBzG20yqxZlpKoLPveSlEJkFY3cBrVt4VDhsI8z3gmchaeWC5VVBqQPyQi6QrgvTNHM27cqLcApE4Lrkibk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZB6mwtMKxBH+kGGKPqrg3VgfrT+/FheCxOKFu+Gnp8Vr0AZsL
	SfrUu9MTcO7uA5N+nAOdqFXZHAKJ5r2pK5Mt0PvNuz+ycpnpG6PSxiFd
X-Gm-Gg: AYBFou15VO1CslUyeJ5+nldVsj87pYEoug0AmZ+ZftXZ73ZJf+AGJ0vMOQGKb91GtG9
	qBRR1yfv3+OgpIt9O8881k8M+7M4yuXaafKeeOTIgRcmDOox2hm/h0C2jZLEy/v6AFIq0tOGtIa
	IG8ZrBc3s6CS/iWPQoUROOzlFujY66Z4w1W7NRvpRTKPixXopyNYLT2joBceWBCBdgxz5tcVqur
	VzQQWBmDY+M2W0m96cOIw8b0RNS0DGjNDvL2Fvr/NUikHlI7GZWQLs/y/6pp8hmRaX01rEYn1pO
	eHzehjVC1jKBBYarC2ARKD1mQ2xzJTkNk93eDoBXTgaD7eUAetmJSHMkQPjR0bHUc1VNH9Xhq/L
	M4etBoBQ0T1sdq/yqGGa5bKbVgF9OCzWaKProNEYcmZsVYcy9mTTAYDCd1aqzRqv2zsdQK7Dg1F
	wHCoXCvsMz5UcfcSUmeOWI5jqmR7x5i3z4BHkbuPm3ElV4H2i8K/WXT/LDPy0HH5eOYYp3PELhv
	JkjtQXCfBudZiNU5AV3snccajzwDl85JIuRXW7EdDQ3/26k4wwXZaqFkZQa+/y61wWSYLWp9i31
	dVZXsvlquCPJMyDoj49StG8kwf9pMBS7la4tIDVWYvnBPUnvbvI=
X-Received: by 2002:a05:600c:5397:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4ac15584cd0mr357132435e9.4.1793795586634;
        Wed, 04 Nov 2026 04:33:06 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1caesm3509380f8f.17.2026.11.04.04.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:33:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] ASoC: dt-bindings: Document FM34NE DSP
Date: Wed,  4 Nov 2026 14:32:46 +0200
Message-ID: <20261104123249.227920-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123249.227920-1-clamor95@gmail.com>
References: <20261104123249.227920-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the FM34NE DSP based voice processor used in the ASUS Transformer
devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/dsp/asus,tf201-dsp.yaml          | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
new file mode 100644
index 0000000000000..8b39089c99a9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/asus,tf201-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fortemedia FM34NE based voice processor
+
+description:
+  Fortemedia FM34NE is a hardware voice processor (DSP — Digital Signal
+  Processor) designed by Fortemedia. It specializes in real-time audio
+  processing, focusing on noise suppression and echo cancellation.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - asus,sl101-dsp
+      - asus,tf101-dsp
+      - asus,tf201-dsp
+      - asus,tf300t-dsp
+      - asus,tf700t-dsp
+      - pegatron,chagall-dsp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Master clock to the DSP
+
+  reset-gpios:
+    maxItems: 1
+
+  bypass-gpios:
+    maxItems: 1
+    description: Signal that switches DSP into programming mode.
+
+  vdd-supply: true
+
+  port:
+    $ref: /schemas/sound/audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - bypass-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dsp@60 {
+            compatible = "asus,tf201-dsp";
+            reg = <0x60>;
+
+            clocks = <&fm34ne_clk>;
+
+            bypass-gpios = <&gpio 222 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 115 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_1v8_dsp>;
+        };
+    };
+...
-- 
2.53.0

