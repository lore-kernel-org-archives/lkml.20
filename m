Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679263;
	b=YkK71UJFaM3o+2eLLWWh0ALn5oJ+ippQWr+klPmjPQV1GWUtoE468b+sjKhHSGCBwLsy
	 QNN1DcK+XLK7WBkwrgdcUMdOw1X5eripV6br/1EtPH4TBB0n4icFhgenxu0AMauwN5UgM
	 9Zd8OvRkp7l1qSkRIkbZtQbwnx32vrUIbbrRcTq7b4FeKvZfQ9xidFbZCu4EXSsjh6mXs
	 AhHwKA/8vllzAcTJ8QKONojYD62+YIfihUm9y2ZFmGGKBIVg1RUa4/1ttbjHb3oh3+/LI
	 a4OipSrCzGsM0qKmbskP3k3eTnyGzRzYZvGzMvTJeSirmI7JrwrLYf4UQJJaClcwu+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
	b=tGFGP6LqZqRXdLw9tRPU3mLDi+yHSfMnpEeTBLXI3C3/xpj9Y+I09v4VklVrYkkBDAsk
	 9gTfdMFKTZnFhG61pm/mSnTl1ubR/XBklRkTMh4iWeFt1BrUPxU0ZB5CrEjg0heM1/dnM
	 5nxKHaI3pEjpHTCcwTtaWm4oR6pUEN11CJVEtSCUP05lu6RjiMQ4YY2Gsg73B3z4vly0V
	 S1/p/ENmYIQ8dA8pCyb+i2dAnLXqn5k4wiloFgMSQIcdJyVP5tPVuGXXchh31XjaR2r8/
	 jkg23M8sJSsnHO5w08Kypmrrdv41+/tLtpPKG4xGn/+ACe8c18IGhcE7bnRL6wp3Aqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BdIcOseO;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6588B606D808
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6588B606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BdIcOseO
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so4788749c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679262; x=1794284062; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=BdIcOseOhpuAfK6xAQ+mLDjSfeRR0ar6JK4YgnEjgYAJMDvELqpGJfZJKOfcLCsrwa
         t0HzXn06JzLcc6MZvKvyn4m6SGchWI4kWEm2HajTSG74HLVz3xbQKLpXVTtKK95vTq0x
         TIbJIj+MYTmJBbwxOA3mxL8zheMbZH646Naqs6F+a8SdZMNlC9+hUw3mfUPW5iJkOQUT
         XdNwQHrOK7SJqFV+Fn8MqPGCSZGr/CW4tL8h4BdO2eM6FAhrPYT5vMItA/ahkyeLu1+F
         jrY3cpPoXWmWOwLJ/l5GPPjrOE3NqYEK5etTpwmM2Iy0kfblmoQ5w39SmX7SSNJKiF5D
         T8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679262; x=1794284062;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=Fk9zFdpa5vwmdUUb4o3D9LQjQglx7WVvmrtRF9VEZMEDHPKZkLpucmNqyVokAUmZJw
         vJwxGizcVC1WGPnRtalOPPkcY7smX6tFQWYwli0vuq+MKRiOjOQY6qFtfhiVajsxgoal
         gWpGvEtMdc1cyffOGPgt9zuSlBbdan2v8qL/vmVd+2WgkycEAhu5+zuEvT2IAb+yoE/a
         bwHRPNY/WR4dEp/KN9ofqF7JpyJP0X+l33CHDps1qpMTPTelSOX5lGJEFOGdt00e4ad4
         w5WQiNbDs1TIqrIRVZ4dILemKLGwePk6PdgrpYGirOw8bzJiaSrAzuTC+H3Wyre+7DFW
         GQ+g==
X-Forwarded-Encrypted: i=1; AKwUvBwhgJ1crP/lR+ta2V9MJnpfrWpOfnRFbLbiAZwKCSBzTE9ftMEg7c3KTzkksxORNAkoqAcwzewSG+84e1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxJUc/b20Wwd03YV4ZPRyfmLbDRdh7W0NfPrpsOC5vIQiL7KFY
	KKhzv6AOUuKMBLX1tavtQc039rqqPaJPsDttgM0bLn3KqU2jtspIXw45XqQleGVReoBUfJp6lpU
	1c7GVGsw2og==
X-Received: from dlea6-n2.prod.google.com ([2002:a05:701b:4206:20b0:18f:4e29:3ddd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:c907:b0:151:6e80:baa9
 with SMTP id a92af1059eb24-1ac5a2a138cmr18327294c88.12.1793679262015; Mon, 02
 Nov 2026 20:14:22 -0800 (PST)
Date: Mon,  2 Nov 2026 20:14:14 -0800
In-Reply-To: <20261103041416.2940213-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103041416.2940213-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103041416.2940213-2-irogers@google.com>
Subject: [PATCH v16 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
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

Depending on the SoC and security configuration, these PMUs support
either direct MMIO access for the System monitor or routing via the
Raspberry Pi firmware mailbox IPC for the VideoCore VPU monitor.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 50 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..08d8c7c7e476
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,50 @@
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
+description: |
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
+  - |
+    pmu@7c012800 {
+        compatible = "brcm,bcm2712-axiperf";
+        reg = <0x7c012800 0x100>,
+              <0x7ee00000 0x100>;
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

