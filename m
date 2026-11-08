Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173314;
	b=DzT8oqLdlFFh29PAg9y7goE1NnONP6w6uaQIWKrz7VgRg04q7jvbjZlEWReTc0MkivC4
	 BTH6ToK4Xu7RTol71MDLK7o8ey2pW/K17Zqy/MNQCNVU+VJHtlDiP4M+hTS4GaKCMn3UD
	 8TlfqL6Yy7jkv+RnnN56UZpGjlQc75DSYEVcDabUTF1dgsIPBgrc7fm4gEKvVXw6mDSXM
	 DECVXyCkuGKWJF2mkAbB3t4W8iiDrQW9/n4L29Zo/RLeDcaKZSCqGW3u+ZtuIFL0C6EQ5
	 uEjDTNr6RxYmchXKKnYAIkQQITVja+1qa2EbtXYstCsInM2HZfRT+rloKIp/S76kHDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QXRVCJ6p53mhv78a1V9znscskgidqnRubCEiNV0CGUQ=;
	b=eISi202deU/W8g6dTaj588BanKs5GeGhviUGaQv52pN3yDAUC9L5XwcC9lK94eb9Vjc1
	 clq3LrtvWrcLhp2a/UHFjYxuEnsasY8ePt4+TpRjXhp/8/P6+dEv+hPYxVCgKb8qVAEC2
	 aBgyuZLfM2RO6fRQYM1ifv17DLxnl2wEBvqMXAwClxVxAYOwX6i/+KZYlreUXZKCXcaIT
	 HGou/we9gcljeNlV2HQhd6Y6rxdZu9rzxbpAFa2BVqFP4kW841qZJ9eGKKKgZF5/RD7dr
	 2nXtTnkBwZOQT/FEl3gOsNcp3oXfpupPbxJAnTfY8AjuYchwshhNU1uAPPxFlfxQPpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XL57eWKD;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C87606A32A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C87606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XL57eWKD
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491971ac844so258578f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173313; x=1794778113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXRVCJ6p53mhv78a1V9znscskgidqnRubCEiNV0CGUQ=;
        b=XL57eWKD2uSIcrWKMYH6JeAdiayS1nITNSJ6dRBeiD5M1VHBITmr+3boaUCWUOXPfS
         fuhPT0Cm+8KFc9DJY+p6tgTcg8cgRE/GLbzcbZkJJWbJCEw/g90pwPxX5GOKeAZLEjAn
         WkP7dbiM7+YTF4PoAZCpF6KznK4QsxdADNm8cN5YrAr0Ae8FzEh9IgeIKCeWTLcfcBs+
         Cajlw3AAq9MoU4zlV9JI6ne05Tn9tMTd8KoP8OPLVRQMGj5lI09Xpt0kx96GE0QvCvjJ
         sb7J211O3xzW632+9Q6m2vjahMDfgUYE2mLdSzb1ErY//CWCF4glgBju2qPMgXhJNiRO
         31TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173313; x=1794778113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXRVCJ6p53mhv78a1V9znscskgidqnRubCEiNV0CGUQ=;
        b=19ffN2SOJxK72muHTBxZwQGaAP4GWqrCqY0/TTkLT8JJvl149/qM5+O+SbKsyJ+hVM
         qs86hI6oTPi7fe3YfKA7/4DyLq2lGzV0M/xhziE6QbJxe6mW1NAsmnzRzpPnUoGVpdg9
         QXgMM+DOA7LIawz75RB88/VOc1uqEx5kRXIDmyHcIy17Vw40Z1A+/9chWW/ob2fzYJ3B
         pyDTpPqIuQBVXjgPt32Remxo24N+DkuDuguyAeMTWqjtlMrnZroaAYKUIY71tbPlSfcS
         N1kf+PaC/laNBGoiy+AvFSjsg0fM0GSX2gwzvam+sbfSYNg7yJiCX0JR3FqQLiavDEvI
         XycA==
X-Forwarded-Encrypted: i=1; AL+hErE0tQb0Z86VXC1VH4ld8XOmiRtI8Jvb7atvyqlvLHwkdQXbKMWPONIhNPLfMYu4kaeTVA5pLGrPBVvyzxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ss5Q470sdW9brDLMErbT7USBbKpuCTBXavvZV49eex6kOFVxo
	Jarj1aCjQbXeiYNZlFrQGEBnxcMVIewZXDb74e36+Di75zoE7pr/AhZL
X-Gm-Gg: AYBFou0qu3mFIEbUucmlSsZMaGTdOLYWgHVJ9Mu5BZZJGqE2hpdKXnKsxasxsqK1I5V
	Sp5NmYIRcnkGI161yuiq3m3k7EQTkC0PweQq40LMfZ1lBNso0yQ/symZR+OksV5C2tLHNO2n2RD
	puTp7bTuF34xn50lk532+tXXHCPXukz0P2MwQEZLEBpvQfMfIx9iKBUrteB443EgwtSgqxJ1wIK
	xfyxAbx0Y7NeENhFcLEyNWPiGdZZQvSO83lHcddhX7K2Hj9CGAl9ZBpYwkemtzWs3MUp+qObsxE
	eYv2v/lfEf25PlWH4ECIKUXYgR00OVBNh1XSOD+qQZPwpxG6kMGoAXI2HCCgvrRI5yRXtrCAuGs
	lTajmbbW7LGxANvfd4PQ+ugbmhNJClCHQBOR+QrTFi2RO38agDOPlpNtWP/oC498QFeFXtl0L4D
	H7tnkX0/vVg/u9F07ECeUFv2QgfImoncUJ12JksdR3pogEJbXkoEQjqS4nrQbwsasjlJ4NvoGH5
	rT4kFhRhJe/Sl7huWH/w1q3m19Ml88iq+q48Eh2vvKPNj9Jcu6ViWcJHSbuXyB001h5gtw0jLQm
	MrZGGG0aCT17gpUj++ax0VITAEADrslXgA==
X-Received: by 2002:a05:6000:260b:b0:48b:108:48cf with SMTP id ffacd0b85a97d-495844a312emr4255528f8f.25.1794173312645;
        Sun, 08 Nov 2026 13:28:32 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:30 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 1/4] dt-bindings: rtc: Add StarFive JH7110 RTC
Date: Sun,  8 Nov 2026 21:28:23 +0000
Message-ID: <20261108212826.15890-2-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108212826.15890-1-oo.hehir@gmail.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the RTC in the always-on domain of the StarFive JH7110 SoC.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 .../bindings/rtc/starfive,jh7110-rtc.yaml     | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
new file mode 100644
index 000000000..a88ab91ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/starfive,jh7110-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Real Time Clock
+
+maintainers:
+  - Owen O'Hehir <oo.hehir@gmail.com>
+
+description:
+  The RTC in the always-on domain of the StarFive JH7110 SoC. It counts BCD
+  time and date from a 32.768 kHz clock and has an alarm, a frequency offset
+  adjustment and millisecond and one-second pulse outputs.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: starfive,jh7110-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Millisecond pulse
+      - description: One-second pulse
+      - description: Alarm and calibration events
+
+  interrupt-names:
+    items:
+      - const: ms-pulse
+      - const: sec-pulse
+      - const: rtc
+
+  clocks:
+    items:
+      - description: APB bus clock
+      - description: Calibration reference clock
+      - description: 32.768 kHz counter clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: cal
+      - const: 32k
+
+  resets:
+    items:
+      - description: 32.768 kHz counter domain reset
+      - description: APB bus reset
+      - description: Calibration reset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    rtc@17040000 {
+        compatible = "starfive,jh7110-rtc";
+        reg = <0x17040000 0x10000>;
+        interrupts = <10>, <11>, <12>;
+        interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+        clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+                 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+                 <&aoncrg JH7110_AONCLK_RTC_32K>;
+        clock-names = "apb", "cal", "32k";
+        resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+                 <&aoncrg JH7110_AONRST_RTC_APB>,
+                 <&aoncrg JH7110_AONRST_RTC_CAL>;
+    };
-- 
2.43.0

