Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211292;
	b=kqUfIGtbzSy4xAx69vygPxvB19faOOq7zVFMM4LGgieFyI6/RqwfHMDM2400hGNL335t
	 xUqsc7kX9o+Oh6SCCQiaVJrBaWalBv/mIdNUsN/Il+jxMtE8lJfJNsO0rrbkOHpo95D6W
	 N44WSFgVOH/V4qZ0ORMtfk+a6eIxSwaf6fp5B8pQWlyuq8doBPYvghK+R7utXq46AJj6l
	 E5N2YT4RWwVhCe4rsIDzSjckpI0G/jXYTTU2y8JNWTlWp4EN8CdY2+JcJVqwCB08MKe9v
	 kUNOhC7fGF59iAGWWl0/UUkNOTC+LMLP3vKfTUmANd7cGaPnQwLO+0V9q3+qqQq2KQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
	b=5fgcODkZ7AdP8sGo9RPIFszBWfdFlQtu5BwxQmEY7yx9pUGmXSi/0suPaXajmED1b35z
	 CAvcvJtdid3KXaqQ2N8uaRX0o3DyejTn7am3FYtebid6ZgdC1NWXRZf9mB9GRJaV/XOC5
	 Z2i6xGxhMimD/qknaQ5Kx71ZNgKn/pEDYpTGFnbbTkcJtRcfFsmZGB4h7cNYcmRlFbEO/
	 J3SV7OkBOfH2lwNqoBX3G70tz6OXVq0C3wm/rmFyb9PLvDZBIKU79B6iHCY4FVMa614XB
	 ELutvWSJRPghSf/gzD9t5E1O+oul21mH9bnywCbqJ05UB5FZVeMTRuMcI+E5+CZRd+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JC6QFXn7;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A9606A339
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A9A9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JC6QFXn7
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1687744eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794211291; x=1794816091; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
        b=JC6QFXn7VG1UrZ0oSG/5nziShFtu8h/Mbd7RSs6hostiR/QocaLss/hoexjAZX1LYA
         UGRLKObGd04O0gwt3WsR0clbnJhk+MQkjq0Ns6ylOg+VeHtZLYbss+gfBjIGudCpxYUx
         USWJLGymrY4By81UlqW1mu2iQAXgVex3HwbR1MgaXSQ6wKeZCol432jficiC8xZIaC7I
         Dq6LV2axisFpu3AAkvaUicXKODv5oru+ZkY1UFUoERb2BVSLJYIewC2K79NoSkC8Z4Gl
         uAZ55IPNcidYQ1jDOuktHSKldevHSY/BKHtc+H4vjzEm63/4QAHNt+lsMb74UYKw7AE6
         ceuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211291; x=1794816091;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
        b=F2I1Qq6C02rqEvupu3BKpGc4leQwN13sh/FPUmGBnp5D0B4EHxeu+zT88A87VR2S0U
         tyAA3xhCig9Vp0EwSmP2wELBzfa2C1Pe8DyAlXu9iT67cmDnGQKPY/yGPfa6pJZBlIzR
         R64fhgu5sghl7MHg/jdPrWLBTI4TsZHP4yA9bZQPVpBVd6TlLQXxZeCaNue5Xvb+lKK3
         m1DQI5Gw2HaZHC8NCV4kFTenAro4AUjq6ddTkFt/TRJrfj4GRtoOHFqoa2gBR345ZB04
         qvwMgIjW6otEBqXpdxYiHZQPY5AN7FAguLKm7Lf9KfKsMmjZgfDBKVnp+n63Djd4fJB6
         aVJQ==
X-Forwarded-Encrypted: i=1; AL+hErEj4uYMqNN4duhh+wVz7gF3NUYSc4k/Cyl+Zw9GmNWIsslq3bxXE/8nNwDhmY6YuYLi2kBmsRyTaxFmFnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jFlW+GzJ9q6e/T/D3fE7fw9re+wKrhw/bNwk9q4z/PjfuyXy0
	PwPoxeqZMDD8me109JNrtp99NDvmRGh26JjO5F55BsvHohujxI/b0DEvkR0t1mCSkAhF5BeMeqw
	PcJkuqMgVJw==
X-Received: from dyx10.prod.google.com ([2002:a05:693c:820a:b0:33e:5767:2163])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6486:b0:368:7c9d:1577
 with SMTP id 5a478bee46e88-37256bef592mr5746863eec.20.1794211290953; Mon, 09
 Nov 2026 00:01:30 -0800 (PST)
Date: Mon,  9 Nov 2026 00:01:24 -0800
In-Reply-To: <20261109080126.417161-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109080126.417161-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261109080126.417161-2-irogers@google.com>
Subject: [PATCH v19 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Dom Cobley <popcornmix@gmail.com>, Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, 
	bcm-kernel-feedback-list@broadcom.com, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
found on BCM2835, BCM2711, and BCM2712 SoCs.

The hardware exposes two MMIO register blocks: the primary monitor
evaluates the System fabric and the secondary monitor evaluates the
VideoCore VPU fabric.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..e1a5a16b8d75
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm2835-axiperf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835/2711/2712 AXI Performance Monitor
+
+maintainers:
+  - Ian Rogers <irogers@google.com>
+
+description:
+  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
+  performance monitors on the AXI bus for evaluating memory bandwidth and
+  system traffic. Two monitor register blocks are present, with the primary
+  monitor evaluating the System fabric and the secondary monitor evaluating the
+  VideoCore VPU fabric. This block is distinct from the BCM5301X AXI Trace
+  Module.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2711-axiperf
+      - brcm,bcm2712-axiperf
+      - brcm,bcm2835-axiperf
+
+  reg:
+    items:
+      - description: System monitor registers
+      - description: VPU monitor registers
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@7e009800 {
+        compatible = "brcm,bcm2835-axiperf";
+        reg = <0x7e009800 0x100>,
+              <0x7ee08000 0x100>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b8a3cb005c91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5338,6 +5338,13 @@ N:	bcm113*
 N:	bcm216*
 N:	kona
 
+BROADCOM BCM2835 AXI PMU DRIVER
+M:	Ian Rogers <irogers@google.com>
+L:	linux-perf-users@vger.kernel.org
+L:	linux-rpi-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
+
 BROADCOM BCM2835 CAMERA DRIVERS
 M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
-- 
2.56.0.455.g6c5a503b38-goog

