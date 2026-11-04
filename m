Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793761389;
	b=4urBWJu2RtOXnymEzUUmes/arFGekVeFZ/TFdPMwK7MTQwJgQ3C0OKMl+2OBQ4laVLng
	 ZT+QxPKMwwllhfKyZD0IFJY6LiRzquRW0YdZyhVrQm+i1RpKOnna+Y7MuQctmTei6asJx
	 x5/1IuFoE1sGXirAlZhzkGt5z02Ju/abddPPrWW//PXKh4JahWO3MRkqNKRuWMwbbpCxT
	 eAMCGxoSaHH+plsdGn5CY0hcWcaged1CPi7NRSh4BaYBaY8hwXENMV4qpagunZsZOZjxt
	 z6YusFqO0zal1BD18Mwm7YOyMB2e4oB5wanQk8SbtQ3KVKWVYtgLksNgSI3wbRe4Ivg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793761389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JODTwBcTg5LnDv4KmwCkQfqEz0wC3Hbmzw/64fppHts=;
	b=iFpmQbG+cISqZdsKlqwuPUdAYBD0AQPFIKgvz2Ihes/IdshVNgo3ujmz5uP6x6rwXt37
	 OslVQVWxFGfbcEKixJpEjflx/fU2mFmSh1c1txthKKHt1APB3PLiGoiQdjkvMdkSJhZEA
	 Ny4pdIAjmmI8fqO0dpsFOgtJyQE/bZD/wblcQ7SYi9nq5Fsm01TANWGZt9maxpntBnY+z
	 fkIx6PIMgtpturqEPYg0R1XFx7qcZ84TjElLnlMsiCJcygAUgCw+g6CBwOV46elIb/QUh
	 AwrBCMqAP/Rzzt3oNeqo3dVvabCKaER+X8lt9fteBp+u8Usd+z2O6XK8LPNPNDPQBrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A6IMNBE5;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB46606D812
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDB46606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A6IMNBE5
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so826570eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793761388; x=1794366188; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JODTwBcTg5LnDv4KmwCkQfqEz0wC3Hbmzw/64fppHts=;
        b=A6IMNBE5Z+EgwzrT94tR+g0zbZnUHBITCVZiYh3zom4ly75wPSYGMAHjKvvPhx+cdQ
         6PvGJipCnxydSQ4ScbNKTPJPlTu/XT/qvC4B9OaiqZUwk/SjZncp1jxRU2ye9pY5QV2f
         CYD51/G4uUSts2Zng+UL61Fqz17W2iWko+RXgNrhnOk/EeufSYk0KH80EUQfKndpiYHA
         FM2GHQNmmmaKOqNlyzZw/eyT66azUNnDY8Jvbpq94hoiuzQuCB7ISKDRFqZ6z5F07TR8
         ixbarNY7FSfLJiv81Y4223bClYOAid0yFXRLdwk6fDnOFu7IB211qY66GtiH9fd399cG
         fmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793761388; x=1794366188;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JODTwBcTg5LnDv4KmwCkQfqEz0wC3Hbmzw/64fppHts=;
        b=mbYakcvaCsaTL8hwKE99gL2L9jApR5ZP4t5OF/kUPCuwagafgIJH3OHJTkmLGZTuNe
         i820dY6YH3ZErzKcH7eMH7lx9XyuFLXSGeB4Fc2fXOZoNTLGlbnnptgmljAaOVjPw5rT
         ZrwSq442DOSqxaNCnsUAaSee7gi7ZRvmIhZ3hb9mPXYGtrq/a2Uh1ceSyDUnz/cS0SpQ
         r27HyHnxcvJOk5gD509/OvApCO02rwlrUJuNq2qmovi1i3Qb+AqWGtGI77d0METAeqn2
         u9K334HxlSas5N79fYWUNQ2EV+fOQfS9frCEohoCnsA3fxvSOPlDK43FdQ3ZXQwxBrNe
         jiwg==
X-Forwarded-Encrypted: i=1; AKwUvBzQbkGKEYo4ZG8RbWCa8jvjKW6SuvgdxDlFEC67b0giq8yxVYerv79tpoGkwJnk4v1eCVUxqTBieOQZgJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mDI45vvBK94+pNIplEYvgF1vbv2sJwKbKymXZ/UYsW1ZLBYso
	pPEE0bT8Cne8w2GZxIE0VV94duh44JBAwrO5DIaoZLDiZImhJruBI0v6TKctAjU1V/8Gm9b08a4
	jeEAzeWezHw==
X-Received: from dlbur23.prod.google.com ([2002:a05:7022:ea57:b0:185:5973:326c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4512:20b0:193:9aa3:474c
 with SMTP id a92af1059eb24-1ac5ac4efa0mr21972153c88.21.1793761387538; Tue, 03
 Nov 2026 19:03:07 -0800 (PST)
Date: Tue,  3 Nov 2026 19:02:58 -0800
In-Reply-To: <20261104030300.1140180-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104030300.1140180-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104030300.1140180-2-irogers@google.com>
Subject: [PATCH v17 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dom Cobley <popcornmix@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
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
index 000000000000..2f1f4f286ab5
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
+  system traffic. Two monitor register blocks are present: the primary monitor
+  evaluates the System fabric, while the secondary monitor evaluates the
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
2.56.0.385.gac671c819a-goog

