Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392547;
	b=gX7M3IzVyj/m2h6vWWSKJgunhmwPHXmAMsl/O7+TNhu6JDVUOHbY6Bal3tzOIUIiRku6
	 vRm3ql9FhqC/azjQQ82lokWEShA6KwN7qy2mnwQroGzhgsfJLaKF2SBEGedl0SeGoHL9a
	 ZJPrAYH2lIXmjgBsAOsKH6ca2ArfEi6/XP87z/oLncwvUxa/YbK6GKgIj6lzlBg2NGaO0
	 BYTgxqjFfMwgEYKj33j/mas14+diGJmplwaNzwtGT1S5Njtamjn60bTHp1uzpGXTi8QK3
	 TjNu435ecwXl+bEfNpl88G7N+eg0bf3qtFq5DizqegMmQtQ+kvJbFrniDfTruJabf1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Vesw8q50bxaqrPi7FemLEo6X3ZjANSYOODp2BdhZ57o=;
	b=bOXOPQAr9g42J/RfEGXF36sHptu3gFmLvlvwxEhjMjNIMQQUry0onSO0n4VhIXLxBG9r
	 gjE/DyjeEWFPNVovNF025M5Y/tXE6x+H62YM26LfrcXYWEXffeiOiIjkHY5uSzMDsmSRk
	 dbCGO+KJqlCo0lyMga+HSS2LAiRJJUjpDWiTV/K1RFW6lkJK8jFy7eqby1fKTv48GGJHL
	 nE+e8wWdqwF4K87zmN8BPH/virQuDQsoJPUIokazooq5w6FuzmR8UdWhex1lfjMciXNig
	 cPazHjngncj9lwfIA7zuJj13cmTik3uZndFNprrXvSh0p35oVSffI+mlguuIJoT/xNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=gRfj5uki;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CEB606A326
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CEB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=gRfj5uki
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15943c9c005so204451c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793392546; x=1793997346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vesw8q50bxaqrPi7FemLEo6X3ZjANSYOODp2BdhZ57o=;
        b=gRfj5ukiFnQcPmxwrG0sQ0WdFQjOXz3BybyC09i7cCNIXdMGl5c4zCiujxCEpx0TTA
         X1jZ1Q77aDNWtQDOooLsEs8NHHDV+C0uZaaL4vxs71Ys+FiRei2FRoyYkuaVdSNcPi42
         mkfNaaOkKl8BP8PY5r1jTJF7rw5y9B0gkep8DeZewg0V6+UbFvIwk7xpciLVnOpUgqO1
         /pEhwKpOhybIHVM+NwErNQbPp9jpnVkAtr1Qmg/+wXderXJNYxqEwRzgnnyIuSqQ2Wu7
         ro7H4QmoRjZjt5hhawODG5i5m6k801iPspjwCp1fmCPv4BGVPXEhZeYaj6q06U3LzNZ0
         RVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392546; x=1793997346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vesw8q50bxaqrPi7FemLEo6X3ZjANSYOODp2BdhZ57o=;
        b=GZ/25UKPdDLjLfws0wgilssSR7PS1EeZXIsDzM7pfd3wmSQIx8aOaxevpq3pIULhyT
         Q1/sqZprabC+nuDugMNLrVGRdXBB3TWJsCnrljluWuOwlS7imNUI2nA53FjeLoOLqiQy
         KXaYtEIMetjndfCOFsPw4/MbFgnU0rS1yF7/L8A2GdS/JnSuX00goEseYfVjuvqwxpr9
         ql0Ls96bxzIX8MfkyVXYP/xWVJkxpge7/GYawifnRiKqs17Sp4oGtBKGUsiA7oOe3I0I
         NPtRTc9oYk2inlqLvIvOVYl68jpWTiQme3ek0q2ujJv2ahZ3cTE8SIXOMTZbTmnAvx1f
         uwig==
X-Forwarded-Encrypted: i=1; AKwUvBzZM8dOKLQKZ9FiZ2gF10gOcrzI7BHI8KYPtaeqeh6TLCsZvMA+D5VxnMhqcTFOBGNllHREf/tZVPkIID0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdmVOZdFwscv5RVUNdzCCUoAqIy8Fa9hoMwN2+Qm7MBf0sbYmd
	FUAS0gV1U/C5nm/49Ubf0Mo5kN+/EP2vxl5WJkmXTA/cBNypicDEe2b7EbIyN1ruFf58pjQ3QsF
	JpJuPc28=
X-Gm-Gg: AYBFou1UaVR+OyuyzRWcJJkPJiaJckALrrpJrNkT8vrVEooeM82dKVSHS0ZjSPpiY6o
	nTi5Pnl7uUy7W2OL6KOgjgK8IaYlA15DJ/Exr+Nd76IkS3VsAxbglxK+vbGT5E0shpcxGI83Fk9
	K95DyLQKV9lpBvPth5daZ0riBh4VYqtpd7b83MtpGVtvGzvFQSX5efLGmrpazyHHkmeN8KqIwuZ
	9JCBjnEAPs/LyyV58ZOhN1ZoFGnNymAlznzQ7JAgp3e9/e0I9t/VIipDVfrVVbU9yr221ohDAUj
	oGDn/cv+3wcbbW4nSoecZH+n+KIxqE+aOaXZuhzNkUPzfeeS2xEymQTL/SC20bmPp1ZxA0f1SL5
	LVI/MT0urLYkEGweIlGZZ+Ukat4JCHmSz7fL1y5kAv3guCJ1DnV5wZAQHpQZBzMAeRNVwMK6DMq
	44vhbcmLMol3fudf/iCeVYRMdjlvnL47GXTmx5TvQi7wBfoQg7go8SJ2D9l/7iFlnFS+sLRkbf0
	+fzK//g35F2wDikUHJa3erv3EFF71wZQOjc9krdIOLsyzDk+F+nd5HTzHiet0w/RprEXuWv/SJG
	xL+lJVLS0oHlGqy+OIS2f5o=
X-Received: by 2002:a05:701b:42d1:10b0:196:aa86:fcf3 with SMTP id a92af1059eb24-1ac5d3bb2e3mr4938101c88.26.1793392545641;
        Fri, 30 Oct 2026 13:35:45 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm15120020c88.7.2026.10.30.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:35:45 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Fri, 30 Oct 2026 20:35:37 +0000
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add TDK FS160x and FS1006
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-fs1603-v3-1-6f8963a74def@nexthop.ai>
References: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
In-Reply-To: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793392543; l=2267;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=xGdKc4ht4sX2nlaRXtCYdgqs5k7lEYKRlHOOJw+KAlQ=;
 b=6YG0xUeBgjJalLeVwtKSnruKW+t0L+cBhZ/wxrcpzArMdPEhJChqtHGyaPZOCG3ljIySGOMnV
 0ya2pBT9441D8bgW9ZcVLwL1/sy8bT1w9SPyxbEGBclq/tIFmK73jhz
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. They have
no ID register, so each part and factory preset has its own compatible,
including the 3.3 V and 5.0 V presets of the FS1006. The FS1604, FS1006
and FS1606-2500 encode telemetry the same way as the FS1603 and fall back
to it. The base FS1606 reports in 10 mV steps and the FS1606-0600 needs
an output current correction, so neither has a fallback.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 .../devicetree/bindings/hwmon/tdk,fs1603.yaml      | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/tdk,fs1603.yaml b/Documentation/devicetree/bindings/hwmon/tdk,fs1603.yaml
new file mode 100644
index 000000000000..48d6dc72f248
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/tdk,fs1603.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/tdk,fs1603.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TDK FS160x and FS1006 uPOL DC-DC converters
+
+maintainers:
+  - Kevin Jia <kjia@nexthop.ai>
+
+description:
+  The TDK FS160x and FS1006 are uPOL DC-DC converters with an integrated
+  inductor. They report telemetry over a proprietary I2C register map and
+  have no ID register. The FS1604, FS1006 and FS1606-2500 encode telemetry
+  in the same way as the FS1603, and fall back to it. The base FS1606 and the
+  FS1606-0600 preset encode it differently and have no fallback.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - tdk,fs1603
+          - tdk,fs1606
+          - tdk,fs1606-0600
+      - items:
+          - enum:
+              - tdk,fs1006-3300
+              - tdk,fs1006-5000
+              - tdk,fs1604
+              - tdk,fs1606-2500
+          - const: tdk,fs1603
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@40 {
+            compatible = "tdk,fs1006-3300", "tdk,fs1603";
+            reg = <0x40>;
+        };
+    };

-- 
2.43.0

