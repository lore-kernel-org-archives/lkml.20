Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE9E371899
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582351; cv=none; b=OWs8sGN2+/+A3/8wvGz8UIyMJBG+HjvIO82p7dpbiCT1AxxQBFrwATrWZNK8SzDjTV5r5rVhZJ40JST7Inadx2rdjTConGrvT2lK4sMEQ3qJ8HwWOyeg6iCElBdROvrhPa1Qqf969Kve0DQISwfsRA4asFdo3zb0NFwF9hfxdZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582351; c=relaxed/simple;
	bh=jWKNCexch0JMH5o69BNwck5/VG83+M+LSrUbl5FXSeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkJP0dj75k9uC/XyvRmBwTJKWh90T3TgYb3xRgaPULWerglR9iATSLodu6k/2L6wrby+ovMDJNCHD6OlXrf0TrUF6d+a1bcfVytRPgHEfZH1ATZFfkI1TtakdejrZmhC6S+CNvwaLYlIgx0KesLyivSQAaq/yJ+skh8po4zqwlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4R/Joa5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4R/Joa5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e5378b281aso925075ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791582349; x=1792187149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=timCtjlY4tD1ADYkJgRTpouWmQk1mlvlYkq4uJksmig=;
        b=p4R/Joa5adCR5LF1V5XKthc3aTfwxXKHGStxiMuzjqM7MNQfMymgyJPa4Hkd7hIhI3
         DKXhgquPQ2afZfL3o1lzav2qDedHvurqL9u4zr7390PFnVT1sr4uNVhtxVqqX8KB+WoG
         eJmb1lbpVBDEP4TZtVZevMwMz6+LJwcpd3IGcGTqVPGvjJWt2WV4XtkW3kg+oCOh+kHS
         oeAsipXo5qV1W9i3koWBP6uUH8csvQP0jKAr3pTA/90KHHF3lNJV0rqEhDsl3xFLFsum
         kxW/0oiEr4wfbvq5UONnjRLsmqeZOpSyEIvdRr7fMlpehUwtu/lnT1axhlFH8ByIWzrP
         PHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582349; x=1792187149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=timCtjlY4tD1ADYkJgRTpouWmQk1mlvlYkq4uJksmig=;
        b=iYHi6F1PhfPd+CZWtRKWb2yo0iXKzzHoNPMveMneOdlyHM2UxIvw9XgrJEun4ImMoD
         dibkaD5EF69c7nUqWwLcv1awTPxJ+ncvBA5BcCJIz+zkVv8GNletlMHAjyUjETMb9uFM
         K+uGQWBFl5603HQU0x4/yKPVh4jP1Ez0EEQJUWZYFAowquqZlCK33Io5ih9WiEen+/dY
         SQ4JQ8bUJlt/C9atCYlPIaOE2ZmKaZmIOkFTu4WQ2PJIyyRPJD1iZ0O/dC7hMM7l7Ta8
         Iil1lVE111nrNVmog53AWx2+ilgY9bdr91s4qYcyXtXGcRaprhW5aSRf90g3f6teb57v
         EKAw==
X-Forwarded-Encrypted: i=1; AKwUvBxUQ2X3SXsSy+ga5JZJKR/Tj8E03zCdNhRmzTe6ENjMYF2BDqx5gHFP8T0iVM5AgcF2goRYnWawH6C8coM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgWS4ziM6nFNuQ5chOefYBfBTpHghVUHGdBWste+ddXEd3xr6+
	VRhJJj/1UnTFQl2+09mUvSnDH6q+pshoiiHOxO/5THbY6jfhGSjPFXZM
X-Gm-Gg: AYBFou394aFFF2I01D/b2vOF5u9g+pr5n/ZpKp3JyvH/PFt+ijWAm4DnWO5u+F+hwXE
	1G+m8sl6bNr6ySrVHRB2KKjHUXMo0tOn4ewgkfPyr4/Pb4bXsUOI6utJhWIRYFoHuWVnv2D5ioc
	E56ip0ZuZjZPi+cRH7q4g54GrPpI/c9pP2DMxMwQJeDjf7/Tr36KRVxoQ7y3Dk9dsGDxowhF0xP
	ckiwMFjHxTECIrwhkQC2Ge+LHK/WxAu94IYvSUn2JUOEknWl6/V9PjcyqhO5m0TINrltyzU/0wR
	eoDIhJMzTywLgEt0btN/RsrOH/2/W/YJCICgrKgOENohoi3RmbUDBBKC4w0of2039ugOi2cPawT
	KDh4f2g8oAwhj77sS8SHRv2rnrn3+w/ZFqMzX24uJCAN43i4ekZzSHwj1F+MwQpZLLSzqWhuCQf
	olbHHq3NktaotyqzQ0UQTIokk1BAIvxBV7AWIqA9LTpNzKsEQTflDLvN3WL9S7yzH9MTGcntRjx
	sjBrKTEDms5moB41v6GbvCiPjr1ieV+PSVxzA==
X-Received: by 2002:a17:903:298e:b0:2e8:3d48:4d92 with SMTP id d9443c01a7336-2e842bc6da6mr27038245ad.33.1791582349209;
        Fri, 09 Oct 2026 14:45:49 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([104.28.215.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e54asm16615975ad.13.2026.10.09.14.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:45:48 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] regulator: dt-bindings: add hi3798cv200 regulator
Date: Sat, 10 Oct 2026 05:43:39 +0800
Message-ID: <20261009214404.722628-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009214404.722628-1-mmyangfl@gmail.com>
References: <20261009214404.722628-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMOC block of the HiSilicon STB SoCs (Hi3798cv200/mv100/mv200)
drives an external converter with a PWM signal. Add dt-binding doc.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../hisilicon,hi3798cv200-regulator.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml b/Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml
new file mode 100644
index 000000000000..812d94aca1f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/hisilicon,hi3798cv200-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon STB voltage regulator
+
+maintainers:
+  - David Yang <mmyangfl@gmail.com>
+
+description: |
+  HiSilicon STB SoCs (Hi3798cv200/mv100/mv200) provide PWM outputs in the PMOC
+  block which drive an external converter.
+
+  The voltage range depends on the board design: reference designs specify
+  0.65 V to 1.15 V for the Hi3798cv200, and 0.7 V to 1.25 V for the Hi3798mv200;
+  a customized board has to figure out its own. The regulator itself has no
+  other source of calibration.
+
+properties:
+  compatible:
+    const: hisilicon,hi3798cv200-regulator
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
+        compatible = "hisilicon,hi3798cv200-regulator";
+        reg = <0x8a23018 0x4>;
+        regulator-name = "vdd-cpu";
+        regulator-min-microvolt = <650000>;
+        regulator-max-microvolt = <1150000>;
+        regulator-always-on;
+    };
-- 
2.53.0

