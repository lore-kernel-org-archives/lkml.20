Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729C3537F7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716381; cv=none; b=Rvii8laYDsxfpwCtvDlrfYJEcrYTAzVSzY1zrVgV283/fAOrsGSh82NRGUrtHKqQ1Mm/zvS/cXTD0PDIHYxsZ1w/UGSFSreVOiZc48MgMfr16DKk/YtduONOjtAdssBlPNkEHYFRATU29Ne7hh4M3AOFFYEtOdVDn7+lMFAZ5lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716381; c=relaxed/simple;
	bh=pMEqLc1obysora8AASomwaJMtj9BYULDdVJjThrcejI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbQYFCgEldp5iTH7akuBnGLYALaF70x1kU+mjgDGZ27OTy53ZgFd8VdVw07eGDLIvt/IVzeXmg5ds5Ohg61I57jagyDTSoiHcmqNdvM2Eus17dWGjARnRrFupGWDeO3UzcYzh1FLyaeEGOc8Jzfb+SpHOAt8uIYqvm3oy0jm70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1ueQ0Uu; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i1ueQ0Uu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso176996f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789716345; x=1790321145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HW6CJ0U+YwbSTnOwpDeyXwbN/vCM6cebJerAL6vdxnA=;
        b=i1ueQ0Uue1vl5inLYOX0Zt+AXEU9GSHYtQKshLmNKURRoSXyaYhxJKoZm4sgIof4LC
         gMX/LOXfNW27YudwOf2Heb4OPPfb2Pt4yCCza6BNSlQmqe42hrLo4oEFAoaHqWrx69YM
         PAShKxF1Kwj6AvlxgdSB8QrjwV+MwYj1Vc9PURP05weJM8ZY3sGdwJn9T2kbvCVvPODK
         IMivqG8xBUy4FNvscWGnigX0WiHYJNYplEO9zS7mF9zT7S/LKv3j+NOvgCbNaocqfHLO
         D+EKCHN6XJBzAA9UTRNs2LhgCuEDsZwcRNCKNugj6195o8+nMWwAN5raJRON75YyV3Zp
         afgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716345; x=1790321145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HW6CJ0U+YwbSTnOwpDeyXwbN/vCM6cebJerAL6vdxnA=;
        b=JKcC3CkRoBqf11Ydxq/tBUMMxSa74wWOP/qnUXamCrbbM7T6kTKAApcbiTeg1PnkMu
         zczqtsmYjjsROz/3rrN1QTw8ZSVhDkcJLkkCY+H8BnX4HEMCkovxvwogL2vanND9oCmx
         X5A4lM8i1k8G/evr5cvDoBZtWuaPCrZHPUidUwcgck6SXePjmzFuyglw/A4gzcKK4zqb
         JM/FfHam1De0FHzOc2nE2QLvcRo2D24A1uHmyWl8ei17QJ4EQBRBpNu8UKSWxk5gC6Nn
         OQWVsLkPaKxtGeNytEQMbgmvNH+koCYFIGTSVIxsrESWcpuN9n48j1owwHpjECS/isTt
         9GBA==
X-Forwarded-Encrypted: i=1; AKwUvBwsonV31QLFArzm8psQzDU6y6Di311uVyBLjTBpjirXRv2tdlTv8ARe0fYyrQ6DWqHk3xqShF1row65rAU=@vger.kernel.org
X-Gm-Message-State: AFuF++mRvdfb7xUko+ZnSdwMr98yXW0yGKwSyjAw0Lg2qT+Hx61FOwBo
	c+SlN3V/vAZOoJPRoyNBxak3qlwOFuS1hR/vME+Uibp5s/zV++V8tlPxPygdLNhPvsWoaJIWiFC
	Kb/bw
X-Gm-Gg: AYBFou1+bIc3SIDDBEaHoWDu5fabIU5M+Bpd410zsDsSIJpoHoypRGpOJ6D22HwjMN5
	FOja5QRs77NToA8KX+cgSm49fcBBg4zXqOZAq2ygY6Okc0Q30wdffcwGZZ3WW7rlVdKX4j7eqhJ
	5f9TirBUoEC7G+UsSFHNk2YgCq2/Rusgv73aAO2oDE7ogeJq4dCb9kadF8+l60bCHLsErzm4rt8
	MWsLWjBYP74ViNV5OfGdVxf1a7j7H5Lo48WVZnoh5qJ1DXxtD5UfWn8LDWNwXk/JOLBXNTFwpT6
	NInPPzPEL1rdKUtW5b6wrVdH7d/maIDbvYfjPI3WwS3JxBk9IsDmOOfv5XZRApVHANtsom3ZH0l
	NcaTDQeRv9bgr7ZXWjNtgcm//823xclL1uQ4xtABeaHkRcHvSWdIaI0CY8MXjZJUMEpiuQWNVSc
	t7SFhfsgGNjS0t6JXJupiWz4DXqBO1t7Iv58EwzkzMm046Pdt+klixxQpJmTAQ/FpcM/oLyp/Q9
	IjqN0pNrMRe/Q==
X-Received: by 2002:a05:600c:1f95:b0:49e:7862:c09e with SMTP id 5b1f17b1804b1-49fc57238b8mr15703745e9.14.1789716344617;
        Fri, 18 Sep 2026 00:25:44 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm139523555e9.6.2026.09.18.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:25:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Sep 2026 09:25:38 +0200
Subject: [PATCH 2/3] regulator: dt-bindings: document the Nexperia
 NEX10000UB dual output LCD bias power supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-sm8x50-nex10000ub-v1-2-5afe06bace03@linaro.org>
References: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
In-Reply-To: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pMEqLc1obysora8AASomwaJMtj9BYULDdVJjThrcejI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqrOd17fSJWNLgV/orJJfsuqjIjfSbqR0Lihq2Wpn6
 ZfZwPtmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqzndQAKCRB33NvayMhJ0bGaEA
 CWo2sAlS4wbmvJ0AmaGz9fU4tnOVU9iUdJ/wt35bvhoG9gFDw5uHBsYwYlrowKgXS49EiCil2MUmV8
 P9M299zsGiuzGkmhPcZmHgVr30VVVXy3M9gRFJm173wpOv+m16JQiqzqpgsEa1I2lbrTj+1ONGLn8Y
 0EO/dAv+sN3evoNSR0rta1rvpO5kK87vf7YDO7Ji8/m+M5gOpamZ1aEcDgodPDS64h7G3JeCRqlYXl
 m8urirfJUGWfI+cqR+ZdYW3rrZeU3TFJM3exlHYHX4YN+ONp8/cuKhYZa3qej76qBvA0cz1WRSEsfl
 ZA30I7RPOxFrrFezJEiCVOcrrP9JlcDiCVMmnF4KayQZTDUxBIXO+h5LAp69pmEvLwBauLtCVkus+4
 0lukFRxa4yavgkJU5jopUcS5rWxfI+LEnis+jPY1veRV+7/pAZ9U1SEi+kQsgQOegRHn7NSzRiEVVA
 tjyzSKfBstCf2LtSNOSB2HItJkO86dB9IxagY0hzmZNB8ugmhqmPt12Ls9Et8djlKY1muL7VLeHdrJ
 a6D9/y6LkA/LV4M2Wcen+w0bAre45Hu66wY5Fp3K705dr+p0jgBE9+Ji0RHuGiT6mmD/Xl7QYwRVVB
 IC1hAI2NRSyoMso/NNX2AxnetxzxOGIle1Qwd2j3vhSyYivuCzd+ew0HGeQg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Nexperia NEX10000UB dual output LCD bias power supply
which provides programmable positive and negative output voltages
mainly for display panels applications.

Product datashet can be found online at [1].

[1] https://assets.nexperia.com/documents/data-sheet/NEX10000UB.pdf

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/regulator/nexperia,nex10000ub.yaml    | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml b/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml
new file mode 100644
index 000000000000..57a3d633b1bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml
@@ -0,0 +1,66 @@
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

