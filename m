Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF77A4EDCAD
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475069; cv=none; b=tpj/wqcuvU2k+FkTbyFpcpLhdPLr2+RnHfFyviYauWaPYEBDgOnRL6+5zuH8pPo49pwKHN7ApKOWxQ3GiadIrlueob9q1cM8Jv9Eve5ydrj2fGdSWJgqUBgNfgozYEfA+W0CnYlTQqvWyV3vsDhc74NSawSu9U+CCmG7ZfilAHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475069; c=relaxed/simple;
	bh=sgMW6iuE9hLczn9U09tlFx56RGfrBjeSN6MEvAo+Xkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bsUcLeHl6Jd8I/tsXghOZWuC9mv6e3DLoRCaDEPb+Ik7YWdq38RDl8QnXBt27LkkiDOR9pP1Crz2zVf2gKzrrNAvRL92Tt8N9BJqixyFsrz1219koZCbWvunmcDZcDwcOmK4L3YgJjzdfiXHB7YTVwl34HIWemKZznU7Y1wRM6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8UwU9G6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8UwU9G6"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so99576a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475064; x=1792079864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7xs14ys+LRyire5ztufFZS8Bw/b8qvOT1NT4ptoOa4=;
        b=O8UwU9G6rju8hwDj25dWw/hCPCT2v/E0AZzVLMPQZBx9Hqd0XLJ6prx+5Xoh5LTZfx
         1Y7yQ2YabMu/J2H11rXAtyP32neowmtt3rzmjKgbINYSIGMPDUJD+XXXcjGBzqkce8R2
         PT4thXYPsunDYr3R2MDZpBGW1DbpDVHB97XjCHewWpVtstPgdof2+IyZFYw+xREF+R4Y
         ePWb66H4wjmXXMa2PpcOYFJyKM5jLV/HHaYyQEwBQsAtChf19sVzFrgZK6pXHDGEOUCr
         a/eTBJLDyAE1kHBqxg/u+mX7PPOK9JTAgO71obQxsFZ+kkSvaDxdlTf94B4/ppsaBp/J
         zA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475064; x=1792079864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+7xs14ys+LRyire5ztufFZS8Bw/b8qvOT1NT4ptoOa4=;
        b=Fel0Xq4LrDOkG/geeauCygOL2YPlawbK8kSHSIULyI+RbqtVMthURvbBIMdkXUlh9I
         FCQiAE6DaO6vc9HiKae7h28YaX8rvRMuH68psIskCv5hWL/JmQH1rfbl6bUCSWZg91op
         uPTqkqrLWqZocwklqMLuR9ahCBiwyV1PU9a1a/OaV65AQqyD8gagq8tsA6JHnBMigWUs
         fKaBO4LzMGugnuhDwHrYvg7gNOfsM5vesnh+DbPem1ZEGQhDFxEzH4o02uKXwbCCZScJ
         yH5qNcXtZ5zUy7vQB7arQelasJq6i5t6fyYt9q7XHlwbfyOnNyFPYSmsUO44CCaJ5dMp
         ZG1g==
X-Forwarded-Encrypted: i=1; AKwUvByQxUvpxi5G8GC4/Gblbbw00dXIXnEaBkKdTrQtLAA6E11zM8oOzFTBqGPR8nhFkUVpNfuS60yS6BOynl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP9Z+mQHQTn7Pewy0ImqIlebvkBQ4N66xGfxrAyH6/FhmFmwqk
	oVGKZIg1GtR4yDV66zxq2m3JspxfM6Hhn1povvWQ9lbiTJD+7EnkL/kK
X-Gm-Gg: AYBFou2t7qaUoqNaH2ssvIcOiqowOEXjvP7K9mvGki7vTG1AVaQbGapo9RtUqYQ2iSc
	IeJQa7dtU7blnAJqMn3GLgxNXHXamWquLtYLapTXFhhyfJCQanorO+JUojSnaqSXnGyVa/Z5ST5
	ZaEYAFfmTMVHDUEf5NHdgVWiXFDakvPzBNl8JCvvQLG5LJiqA3GQddGXaApNM/EyFT70Z41TBOb
	ekald4ccyRp/W74pVLQKOA0KiiHXor1FniI6DSvlmucmnJUzJ/XsVd4jYl+LF5HuSuysBjRaIe+
	HOU5I5WqBPop/BpywecwwNvVQUtiWlVGRqi7EbbHvKNKIRmja0itScYcLVLDmDO6bY9UXTSb6hv
	S2KNmLQKuUe5+8dJJ9LghiVYceOjekiB3MnFNg8ZamKRa4JMOJfpbig0KxJo/SekmXlyjdQTi6A
	kjQsGb4JeC8epiNIpsc2X4gTmI23BOZ7nwDB47ellZMYbYgSxLCteV2xkXYyVa/5NEoncBqm2ud
	yvvZZq0p7Z8C1tyQRf9xMVwIw==
X-Received: by 2002:a17:90b:2ccc:b0:3a8:211b:6c7b with SMTP id 98e67ed59e1d1-3a8a04ba0f4mr5235029a91.4.1791475059178;
        Thu, 08 Oct 2026 08:57:39 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0aesm27694045ad.28.2026.10.08.08.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:57:38 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: regulator: add HiSilicon STB voltage regulator
Date: Thu,  8 Oct 2026 23:57:24 +0800
Message-ID: <20261008155727.3801095-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008155727.3801095-1-mmyangfl@gmail.com>
References: <20261008155727.3801095-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMOC block of the HiSilicon STB SoCs drives an external converter
with a PWM signal. Document the binding.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../regulator/hisilicon,histb-volt.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/hisilicon,histb-volt.yaml

diff --git a/Documentation/devicetree/bindings/regulator/hisilicon,histb-volt.yaml b/Documentation/devicetree/bindings/regulator/hisilicon,histb-volt.yaml
new file mode 100644
index 000000000000..34deee17d034
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/hisilicon,histb-volt.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/hisilicon,histb-volt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon STB voltage regulator
+
+maintainers:
+  - David Yang <mmyangfl@gmail.com>
+
+description: |
+  HiSilicon STB SoCs provide PWM outputs in the PMOC block which drive an
+  external converter. The signal is filtered into a DC level between 0 V and
+  3.3 V which is summed into the feedback input of the converter, so a rail
+  follows the average level of the PWM signal and its voltage is set by the duty
+  cycle.
+
+  Where the duty cycle maps to in volts is a property of the board, not of the
+  SoC: the endpoints come from the resistors of the filter and from the
+  reference voltage of the converter. The datasheets therefore tabulate a
+  different pair of endpoints for each converter of their reference designs
+  (0.65 V to 1.15 V for the Hi3798cv200, 0.7 V to 1.25 V for the Hi3798mv200),
+  and a board built to its own schematic has to describe its own.
+  regulator-min-microvolt and regulator-max-microvolt are those endpoints of
+  the linear range, and the regulator has no other source of calibration.
+
+properties:
+  compatible:
+    enum:
+      - hisilicon,hi3798cv200-volt
+      - hisilicon,hi3798mv100-volt
+      - hisilicon,hi3798mv200-volt
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - regulator-min-microvolt
+  - regulator-max-microvolt
+
+allOf:
+  - $ref: regulator.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    vddcpu: regulator@8a23018 {
+        compatible = "hisilicon,hi3798mv200-volt";
+        reg = <0x8a23018 0x4>;
+        regulator-name = "vdd-cpu";
+        regulator-min-microvolt = <700000>;
+        regulator-max-microvolt = <1250000>;
+        regulator-always-on;
+    };
-- 
2.53.0

