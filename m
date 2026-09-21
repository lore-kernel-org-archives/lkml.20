Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C554A466B5E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984299; cv=none; b=vB3o8KXmDoEgHXiYchxS/LmvEmVV7cLTteVoMZ9rRO7EdzDFIZpBlrPdQ8ey50IEMONsjAdlZM5VyAV5Bq/ErRuWDxj9JHahDkF2ytFGXSQtuwrhZXCSNJ5UyyekWZPBHTmV4nVtyJ5fzO41hvOi5CuBSK/+mJX6tmJ1QmiJVL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984299; c=relaxed/simple;
	bh=bVtbLtmPcOJx8v2657uFaJlPotPP83zKA8hM2nZ/J9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alSRwn+YbGFpOP4v0VlMcK2DiJ4ohTwTuWwEC68oUd6zH8jEgd8+WdcAItex1JM2ruxT+dzQQQDaPSnmEcv/oKFOcwvgEInwuzeqiQAqu4ZteeKSvm7QCe1oc3gFetaneaKTJDSh42i0PlosNJX9bto6Nu+4hqDg2jjBmuEHsaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBE6FOXj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBE6FOXj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e2406so13924795e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789984296; x=1790589096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NLBLoLmGyexJB8ebyHo1jEpwbF+ARzbn+plV3A8j38=;
        b=gBE6FOXjuSdqEtGPohLcSBG60Q1XaRw49g32Rc8u6HoP/+vZ+1N/yKUrGx9rdXsyCE
         2jEjyGh7FJwBhwjB6/O/gywtj2ETIMv9Yp8x8UwQZTFvdgBRFtlAlHRkSVHtH2N/PklT
         sxxFHo8TKUOrdU9eAPPJeTT/kVTZvBAQ5yNtHSmsuogAg9FiQSfkGqPujxv8mbTsCoUu
         PJ9unjo1iR/PnIJ/kyvstadRXmX6E6iLpIuRgo5+r+SfAGpm2ISn2QWf6/3BKAHjT0VD
         DxH4VMaWVRf+lk/O+PyVj0/WvaDcJcMizVbwLNWyK7JF/PNwwry+PkpqK+OUiReE73FM
         WW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984296; x=1790589096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NLBLoLmGyexJB8ebyHo1jEpwbF+ARzbn+plV3A8j38=;
        b=exm1JiMIIkpANnKr41BkT10ldxXyg6W2ViqPxFhlqkseQY+HEcx+tv6k3QQomhxqa6
         Chc0Y5fJlX5hFJaBAAV4YOsclQN8nRlvwWtRfJtsX5Zf5XWJJDlf4XBk6OveIs+NAF9Y
         7flkHHzPs5ay9MO0+eLTQldcjJuA8ciKAUyA5Dfyt7aAGc/l4nTX8wEZ0VM/iQ6/VldH
         UHpyVlJEXZbXm7Vuw3/hC0Egqt+FQW1ZW8jGwowx+/ObIy4fOBvlWx601zTMiAIR/WPx
         sUCHs19A2RbPlIQhLXIU9IsgHJHE8qSFCXk64v2celtj+nAoX8/sgJjrBtcE4yaEB+TT
         EcGw==
X-Forwarded-Encrypted: i=1; AKwUvBy0uNPbofUAfbX6bmBQ9ZmwKf144wQ0IyYxzgRHrQndyC1R9ryddKH39WMyVVHSnVr4SsXfqHoNj/Tcg5E=@vger.kernel.org
X-Gm-Message-State: AFuF++mcFd1VYxNdmLPVUgA6sbGXGmI+WIv3xq+gQAVQpxn2TdKuVTSr
	6hBmLLkRw8RDIUlT41mDg+hfLz4UuDiuYyWUvyZ0ehXmn7eHBD4B5ygRuu1fQVoIsqU=
X-Gm-Gg: AYBFou1mRxuQA2uAkJkjTUZgFQJo+hJLoIzyE5w8xUgqvwtK3CNadaqMltc07MVsRvX
	CNJqClm6xbIp8VFRUM8wfnpls3Tm/gE+5vknuK1/ayLRkAjwk2t6GgkynIjR27N6J08bukCUob9
	mpreQbONWoXkRxpOCD8EDZ8tbUIn2F62AQV+m8Fdwg1rs66o15FU3HhdrOqroALPa2EgXAyzywx
	DzzGyfxmI3uGp21TbzOWnBR1+lqprNIIDruq+lVQbjuML43uO1viv0cYPzN5Hzc5rn4pA67oLNu
	mtFOGMmAItDd5Enjrr7fyF9iFD1s+FzIc68bZYvsIXOc6joqKMM78JnC0fINVgtSwcXWf9OSEZw
	VFfcDES/LyfoyZK5noWLHRH+ug4ZASZgO00t0k+NGvm8BCOx8564bZooc2GVAzRpvX1i3m8diL3
	DxNXi5LysG96sqloNcwoj8SoiAwRGy13vsmQZDHn+tRChERbCBmdwxKQVik6BddsRAbWaLkyagF
	kj1BiFF8tjMIbd/aA+LnysktivONrK2
X-Received: by 2002:a05:600c:468a:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49fc4fae7acmr162113995e9.7.1789984295895;
        Mon, 21 Sep 2026 02:51:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd03fe55sm254330365e9.2.2026.09.21.02.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 21 Sep 2026 11:51:31 +0200
Subject: [PATCH v2 2/3] regulator: dt-bindings: document the Nexperia
 NEX10000UB dual output LCD bias power supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-topic-sm8x50-nex10000ub-v2-2-eeeaf9b0c913@linaro.org>
References: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
In-Reply-To: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2368;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bVtbLtmPcOJx8v2657uFaJlPotPP83zKA8hM2nZ/J9Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsP4kOweo/gUhpfRL55q1vZfFXA8Q4pH5DsE+7Sj7
 O+iBFTWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarD+JAAKCRB33NvayMhJ0aNaD/
 4niH8vAyLke9q+Nk5uUC2rgK0cxaDHQOYz1XbqCcV2dqQO2MlK3l8f1FeTIXtenV/4wkwKjHaA/+1R
 /p0nROmnURUxh/9edr/AJTy1gV8cvCoPKNvCwtjZU69lebwxE+ZRtDoz9h1BzIYh3IKeSpbxEXH3SB
 HVEDLYwBXFx0v2xRTa4/zugF59rF+HLo9/djLS7Av6sClNCLAYF9fQ4fk7X/ctYdHve1oFQ2ZQpoZc
 i34f6JUH8J+HRonxwwyuBD6L4gvep2bmOdNo8tPERMm+MZCgmwxG9NcbGe/X44JF6XYCvHO82/tTsk
 fgzAEXhrkmhuQp/ADHs0Bkxe6DFi+YOnzjsr1vGeXvXHVONVbYlwRtMRtF07bciXrt8YAb0U7ox4WA
 TVfPf/IHx2nA1e6Y4ZW4U8RR479cKxvjDyVa0a2QX01BZ4ydi1ya0OcRXWueTcMUX8IJE+IZrrEPQn
 r7CjnEAgDbLugRFSJnXlJYtCzlUt+S9B3Voj9GIcFT2+N/AcW65LfHDWJs6wr2nkSi0AOozZYh5M91
 7Eg3PN14BM2wDdGScGE28e7zu2ALJT+F8mQoJS/JxE7xXPcMjxGXksRyhafcZgAZdUVoq9l42DwlnE
 xUWIcXjrsfvvQNENhF7+77Sgq5M7kZBmfFDzSZCKHxCHaTvBAksLngKd5xeA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Nexperia NEX10000UB dual output LCD bias power supply
which provides programmable positive and negative output voltages
mainly for display panels applications.

Product datashet can be found online at [1].

[1] https://assets.nexperia.com/documents/data-sheet/NEX10000UB.pdf

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/regulator/nexperia,nex10000ub.yaml    | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml b/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml
new file mode 100644
index 000000000000..3c0db59b8c1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/nexperia,nex10000ub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nexperia NEX10000UB dual output LCD bias power supply
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  The NEX10000UB is designed to supply positive/negative supplies for display Panels.
+
+properties:
+  compatible:
+    enum:
+      - nexperia,nex10000ub
+
+  reg:
+    maxItems: 1
+
+  vin-supply: true
+
+patternProperties:
+  "^(vpos|vneg)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      enable-gpios:
+        maxItems: 1
+
+    required:
+      - enable-gpios
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@3e {
+            compatible = "nexperia,nex10000ub";
+            reg = <0x3e>;
+            vin-supply = <&supply>;
+
+            vpos {
+                regulator-name = "outp";
+                regulator-boot-on;
+                enable-gpios = <&gpio 23 GPIO_ACTIVE_HIGH>;
+            };
+
+            vneg {
+                regulator-name = "outn";
+                regulator-boot-on;
+                enable-gpios = <&gpio 40 GPIO_ACTIVE_HIGH>;
+            };
+        };
+    };

-- 
2.34.1

