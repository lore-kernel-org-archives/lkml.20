Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049124;
	b=m44/BpaQB6Ko9Bhm9DsAB13wsWh71aEgZLoGddN0KZJjut+LOb1lLl7/3vpkfQ2+ZJmv
	 52gLej9tqzN0jipzZSquAlX4wNlUtgamFlFHux/K5aROZUzCO6nydbWHHsCsdFdyf3cAk
	 57MHTd7s+lx8OeqRzbTEkr6a4H/k6E1es18vzEp1zG9HB2Jd6aeRlrlEPtK3sBcLeTREW
	 8/dwk+KjiclK4ClkhBaAQsf+QiO8TsV0qUIylgdD79w217D4NHknP/yWGIvmCjq9Ym0OQ
	 FrndY/nfhs7rJ0yoV9jkAeB9M+2CFwJrRGLTraq1mn7Q0HeGFsCJ2SqOIAw7OeOhVuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049124;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
	b=BCSa4L+30ZmWLhjZqZ0Vs9Rda1BnAq9sK3QO9jRipiFfnrZBPCJlU+wMm9EKAWZl591F
	 SFIuOH7uWjWp5mBfqjHo+ao5hTsXUFjNJFamOwaJFW2oCobvfQYhZjaSvflAw0nLQtKOD
	 Ailk9AzBYflk2BDxNc4gjh0T2Aixi47swgsI+Q7RmohGk6Gq4l754tCSl6KzkAZkhWkyL
	 4/kdrNXnBHX5lBmWzXN6L5QX7UdIRBBNATcceLB1kGDelWw03KPv8Tf8l2sE6uUABSnRc
	 pbmbVdcR7mZnPG4MNblBbF9rAqCHEmZm9jsaowyQrRv7xr4yAD4I7tNujxumMCtERBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NnysnYU7;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7FC606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NnysnYU7
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so205726a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049123; x=1793653923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=m1JirjOWfnIyJfkA8eXw9JeDINZSGF8aF1S68C4VA1Ql3rS8zWknsE9JFDNxXOh+wu
         DYymHBcSjLr7BVN+07ubknULAmw4/hiUKUs6i6klhUhnxlbPPHGpcVasOErAUR9O4Aat
         Y9LzHqnoBuTPQNWrkjHKYsWslwKKpGbMbx75TLTCYackBAmMwrcqdqXXL6s8kY4sxxMB
         REi63tZ4pBM6O/FJSKvW5QlwnsUeXIVEyC0UnW9YxGfxRbNHRkoHAmOKkIIf1c9A6zWb
         PqJTvu1kctDyQdBYtjbL7e8RKpJY+HorOyNwBOCK9eh1hHyR3shKvd6ZYFoxY4cNVY5I
         uhCg==
X-Gm-Message-State: AFq9FYL/Q8w2xG9bXkWnipDPhNRrk7RAa7+PQJfFQ+Jmsb68+cjtEJH/
	mb+I/IHp6ynZhvLO+IGBoEk0gbTX1Xsh5WPx1CraawhZ1m0VSVCopu6rL726KicfIloTowhgeau
	Wcb69VnMSgfgM23cZgXzrwuWeervHNuf16xhHJkRuc/5ay3UIyzsaRPM0s0SG2bM5CSV1qmAfvO
	lXGLMQFMSjr8/FkHEg0SNJ2fXlOuFfTjsHQEj3FjIq4QLH/xjanoMMIUK7zL/rBgRfDCOlnoObP
	khhe2MLOKrVueUyBVr/b1BPASk=
X-Gm-Gg: AYBFou3xUZ5j4ikWTeAYKFR8aPqYhTFky23rL2WazvgBUPTK1sno9oCzKEGvc8ffTI2
	Tud+c9EhZSx4dF+H1VpUbqcVJBRU3G+YSTfCf7T2arIYCAbGcDYKpY+8FqgW5WUQd6b2KD4BpMZ
	dkFKfrGx4p19vkvlLobcJfJm0Uxg3+kcau1sCU38iI/QFZWexYd+way0dwjGKX/94/8BOSLWV1R
	0Y/Syk/XznlFc19ng3wegOzszgw5PSVsBF5aC5HOtgjbsg+4JRhwD4AE6gTudCoCKOxciuJuyXl
	F3b9s4FiJeeoWcxeP5xS3aknX+Rj82f+m8mfs4yVc59r5/1DHr01N4ajh5eq/jR4lcBlYRfIiif
	sOkihxXNP/CsnT4wGG+krHn8P+Hc7zx06SHAhG3o1JOkYeWLzi+iuBK2iuopdD/PbyI7LHR2t4l
	D44YEiaTxPg0xVGHioovXfv6+MVZQwv6IsQynqNdBg
X-Received: by 2002:a17:90a:da8b:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3ae40283e13mr350213a91.13.1793049123152;
        Mon, 26 Oct 2026 14:12:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae406dc8fbsm495780a91.1.2026.10.26.14.12.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151dcfb1569so170870c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049121; x=1793653921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=NnysnYU79YnMhg6jBSRtE+Fl4SdFXflwUjWH0sCUcG7gUl7ebUhnf3ZwNUCXCAF9VP
         jxtfuO5z99UZUwaeAM7SVNyvAPkFb8Q1uHbiSN4Gxl44r+eZz0fD3E+5EBEjPK5eVgOA
         rT+ZXQTw6PMvAANqPbelwSi4jlqjcLxNRVa+g=
X-Received: by 2002:a05:701b:42d1:20b0:158:b944:b15 with SMTP id a92af1059eb24-1a3c6150260mr1039966c88.22.1793049121450;
        Mon, 26 Oct 2026 14:12:01 -0700 (PDT)
X-Received: by 2002:a05:701b:42d1:20b0:158:b944:b15 with SMTP id a92af1059eb24-1a3c6150260mr1039903c88.22.1793049120586;
        Mon, 26 Oct 2026 14:12:00 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:11:59 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 1/3] dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
Date: Mon, 26 Oct 2026 14:11:49 -0700
Message-ID: <20261026211151.3212237-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
References: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Describe one APB register window per AXI Trace Module. The counters are
have no overflow IRQ.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  | 43 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
new file mode 100644
index 000000000000..686b20d4cd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm5301x-axi-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM5301X AXI Trace Module performance monitor
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description: |
+  The BCM5301X ARM subsystem contains three AXI Trace Modules, monitoring the
+  two PL310 AXI master interfaces and the Accelerator Coherency Port (ACP).
+  Each module has its own APB register window and fixed performance counters
+  for commands, data beats, channel activity and stalls, latency, and cycles
+  with outstanding commands. Counters support local start, stop, and clear
+  commands. No counter overflow interrupt is provided.
+
+  Each node describes one module. The separate ATB trace output and its
+  CoreSight connections are outside the scope of this binding. This block
+  is distinct from the BCM2835 family AXI bus-watcher performance monitor.
+
+properties:
+  compatible:
+    const: brcm,bcm5301x-axi-pmu
+
+  reg:
+    maxItems: 1
+    description: APB register window of one AXI Trace Module.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@19003000 {
+        compatible = "brcm,bcm5301x-axi-pmu";
+        reg = <0x19003000 0x1000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..b97f22107fbf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5220,6 +5220,7 @@ M:	Rafał Miłecki <zajec5@gmail.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 F:	arch/arm/boot/dts/broadcom/bcm-ns.dtsi
 F:	arch/arm/boot/dts/broadcom/bcm470*
 F:	arch/arm/boot/dts/broadcom/bcm5301*
-- 
2.53.0

