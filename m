Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794024562;
	b=U2AfDTCkj8p354r7a+s57Z2U9OjijncgR0NW5OsanG+RgJH4iBrQCKu7BT0xjpviuSaV
	 iEetRWSoEX7v4SMyPFoFzuqybCCXA74co91Ib82vCpr2MrRKkrqC5HjWPCutKS4bp7Sgn
	 ruJ+ElfMMkFsWstMQkNp7wBw3OSgFrtY41cC26DBawcNQYD6Wj8i2Piy+z456x9v2M3hl
	 3Eq1XmgwooFSBywR9hkWc1akRCppj1pt+zUa3YPYKg2cz8xi6sO4GaD+bYgd4p518BrBO
	 g6jUdAkq0YnTwmeA1cYhGv9xRJ81iHCudMsk9TToqh8ixfSibrgUbINb2f1qn0+T8FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794024562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
	b=SZh8Nq++uDCJTl3NZI7y8Zi1YvpvKTxKbxhu8Uuc0OiuTG0PFGEJP06Jr1TSTnyT2bm2
	 nlIgHjp2B1TEo6/paE0A6hXV2tAPRM5kprAdZD5Iu4AMW9qaeLLCnrAHXa4sEr8tNfuHy
	 3Q1huaWvoOIcIP/62RmDhEorCcPJXpZxSIh3F893UDY2QtAuHhOR97bv6iclU3c6EVOOp
	 wwUxnBE1nc6d+JhIgVR4tJGQZvJCq1qA84GGywUbhrT/FGVO13yTn579lRUx0jS/tIoHa
	 LILU6eNmPL09Hf6008glv2bemXnrV1xpSV67ibG4pJJn+/fa1eRisExzztAH92IAoug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f5VC1OsI;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589A0606A335
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 589A0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f5VC1OsI
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso1783934eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794024562; x=1794629362; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
        b=f5VC1OsILx7HExT/oUzQioy0+V/J3k62ioZNPCy08hNoB5O+yhhJGb3BwXxsNIn5Be
         1CnfCYV+ZOHUuN7Z/7If246SqxmRzfgi45tqBc3+uf0tgS0rM1XpO5ZynFztl1JILYX3
         ZBILXLRWWMEdgLd3OEb0dA/IxU7a1heLaL/YmkAj6qoznelbe0B4JV02iTmmFy7e7bRg
         tO799ZjzkvpS44ozxscq+CJk8R/uBTHER06Z4Tv0YW+86hM6M0QJeFUYQBAthdOH/alb
         EeuoiY0N1G96g3gWRn/ArW4czf9hEIuEqWgz+Jjst6WUpBve54Z66MaLEQFSOs3ehTBU
         8GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794024562; x=1794629362;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
        b=A9ecWLPNlti/ix1H3TThSVp4VcfKbjy3UXCVMwFEZg7B3InCco0E1kcnXTCSswthpb
         xRSL4zwza17m6RIGGJsvS8a6O40BGlSeQVDZc3qhcLHTz5WW1Hi7G8wAZ2nbaRjDQ9rB
         0kRUjyl6DPWu6l9VAtWdmdISbaaa17ZWvMQJWHDAYwrdkCxtxx8be2VztGLOgkV5ETZo
         /RXpd+g+wEB5/HBXBfOrGLh55VTlum6tTyg0WgWgUBpQj68rY1+kRGsAA70IJcriOKNI
         t8Vj6GWBc1M3okWFxmpE4POwwAHBMNv6DShygE2xMcji605+b9WoAPwPypqzOzPV7UKG
         GhtQ==
X-Forwarded-Encrypted: i=1; AKwUvByz1ipdjLcGL0xkA9w3gf9KgjZ9hFRPpnHeW6GLDUUkkdArOnZkTEXHOdzuDKDTn/ZJmsSuntKeyu0AWww=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HbLmLV7i9GILnEG6H7tivDbFFv6NnroURZzTuecDBtMwQdRPg
	BaJdKNuiHGcs0kqF32XbtBajZiGK3mGIWg8sftW5twvEMawMihexaGpqwtGV017qYBBU80iKajf
	qJzJI4zJDeg==
X-Received: from dloo22-n1.prod.google.com ([2002:a05:7023:a56:10b0:1b2:4d89:1614])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7e0a:b0:1b2:611a:8a10
 with SMTP id a92af1059eb24-1b2611a8dd5mr4522194c88.19.1794024561095; Fri, 06
 Nov 2026 20:09:21 -0800 (PST)
Date: Fri,  6 Nov 2026 20:09:11 -0800
In-Reply-To: <20261107040913.1384033-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107040913.1384033-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107040913.1384033-2-irogers@google.com>
Subject: [PATCH v18 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Dom Cobley <popcornmix@gmail.com>, Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
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

