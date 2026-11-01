Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559471;
	b=WbmVLBaZ8DC0S3asf8GbLlkiqOdj7CTF20ZP3C7wzVuTdZM8K6j/3ogp9Eo0yV5Ph78M
	 5N0zMhv9WPUn3t19SvuI8xwzcvG7Pi9J6bxVaUzVuyFNa6hV8ltFcGZxuXdHPx9kpEcyl
	 WpGfEu4f9OVE4suuEY+TriVpKnxOhWsZZyKYcbLJxW7LRhzDvtXNJIKLPOmf54tRkQRtP
	 NBVXwuZ67Hx9FYqB55z1ckVWbsT/13/I6VjE/7QtwM9Ao2KaoTU+sQLgA+EP2WiuR4bSD
	 +msLCWTiAyOkV1Lbh2v3P/Y9aSXJVOpDVEyzidaEeClhHgo6YEOSHR6eVTkr9cXsjhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=;
	b=3ZacmOTdpR/GjySZ04WfjlLbNC/A/Yle+sYhmxsb71qpTiXYDxkOYuHClkKnKqIz2K3m
	 Ig5YUeGoMbDEKNgUlUdmpuIIykxW5snNx/JeIOSfgGVYg7rYtJ2yO9nV68jsWPXxXDk9G
	 bFxSELmo1LqCb8dQPVZxQaPt44lp0nSB54pD3cJCRBUT4NwJjMEW8WcoirXKfETPrCFqs
	 wKcesjM7gqXOIxGN1cd4pJzivHNZpm3TwH/FydlQsUxgbvLqkA2mj1ONS2AyiJbD0KPiO
	 AyOtvhVQFxLvRR+KNhqvdoNMQ2fO5SvFvHFVX9Nl8ixUUG3rg1MBW/Ke+hLHY60w14A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cx1AxKqJ;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D6E606A332
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D6E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cx1AxKqJ
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0cf2c0785so17703147b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559470; x=1794164270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=;
        b=cx1AxKqJ3cO8+MrbxhYBhwO3vryfS6TnRAiWbiTqopVW+Ze8tWFnp26wPERRK+DpuG
         yoMdC7jHPG+orucKzYf9/2QHyBloDK3LNbIp6aomvArA1dYfG5po9M/Sw3T3MZaZI0uY
         rS8rwdSOtKlGMcXNwR+euwmkFX4N1klDkZSu7wD7tJzOVrKd7EkGbWQB1IExcDYxqZce
         5W4kRsxO9xwhU1dv9X7J1J4TniK6Fw7zDNTo1Wx+m0MyqHHk3f51JDRxWS+A+ZFRnagj
         XyGplyjMPdg+Y6LR+vRd+Q685JNuuRKUHcs5L3OGKqlU/OZ9IEYbJSHmTtBCmFJEFEp6
         zY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559470; x=1794164270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=;
        b=CaeHteFcRSi2QCBP0yMQ5qRyViGZBg4HBWadLIvGNRJp3igtXucmRHOUCPnjLTnS0J
         IdLyFMNjTFaE6nJgNRmKgA2P+Zdj4wUJu+8lQa8eDTUrCy9XfwS55/bUhji3ybeerQYY
         8XgbsVBz1C3jAyH9n//EP/6TNII3NOC1qAh5kOnVsuRyAWmTgsO+meSriUiGVw+6evHs
         xQL9OlPi7uuKDib7izPfYE2OHTSXEBWRgnrblqXU0FnzG0rrz3SMUMo8kUdHdaRoKJQg
         lg7Yddbl7NA4N9IgOUgNZUG7F2nEmeTKyq+qbkCX+YlOrVGZCfgH4baQlA3jN+07qfG6
         Maqg==
X-Forwarded-Encrypted: i=1; AKwUvBx8qLJPbqiJvaX4zpuoF80/DIqtQXbC9R0vwUSJ7o7cou2Q83b+Wsqd3KQRQ/7K11jmM4MthsmdpbQucPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z88JwioFT32aumEMKGCHW/mgh8QNpIqcqu9x8F/4BASsXXTgEKt
	A395ljFYt/wIVKfLFmKtQiVjBF8W5FsHXRemjCz4RiUkQV6UpkpxiWjk
X-Gm-Gg: AYBFou3Wx6e4C7c61ouDe413I13nTymMxvrwXPkh+CGsXd7AWX/3C+HWP/ERdRWQ5At
	92BnIL9Z4KBycw4IYV+ACuYqhWQzve1ytkjvvdfFHmji4v5hvqoD/q41TDS4VAeM+1vuQssT7Qt
	/zz/tdHpTgAqD2t/2Pn7vQavs86jKAjL7rQXokXVgWYlhQIeZI7m+9FxXFjZDmI4nuiOyt00MR4
	jlJ8EzbZlsJPFqmZd/Ke9eIJnO6Uqb7zkpVab3izZ/NGHPNYxi7vgrH4iJVF3B/zr/HDmbJQUzk
	Lr498qIN04Q1cRNxG1S7OSGT+RkjjecZ5UbjsPfIAB/Yana7yQslQU/NM4rhJ0/uvVcWOARzK78
	nvdZ5WalmEznZex3Z/tfZ+CVb9PFrEWMseTwA3BCm9yncXC9yXpN0ta07+WJJgsG3ENu4ggvLHH
	pYa6uxnJ3q8fxys+Njt9hkEI+Oaom12JqWPBcoQ5PTRvQgYQApl4sGcJXyNRJNo2sIXhDoIxn+d
	G9hj2aMw4eYLkjW6tRHHu9VQ1CGjFWhTA3D49nZD8RUDvGdvn3ufEpI4m1QNenPlx3AeNUlZR9H
	lOe05Wm+cMPY+jqjL9x9LKQGc8dXX9dbjBbd09uDWmYcucbvz1unI1RWh8v74h6EFbE=
X-Received: by 2002:a05:690c:dd3:b0:8b1:b916:69f7 with SMTP id 00721157ae682-8b2b671f289mr46540577b3.55.1793559468878;
        Sun, 01 Nov 2026 10:57:48 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:48 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 1/7] dt-bindings: mailbox: Add Allwinner A523 message box
Date: Sun,  1 Nov 2026 12:57:29 -0600
Message-ID: <20261101185735.762559-2-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101185735.762559-1-tcmichals@gmail.com>
References: <20261101185735.762559-1-tcmichals@gmail.com>
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

The Allwinner A523, A527 and T527 (sun55i) message box connects the
Cortex-A55 host with the HiFi4 DSP, the CPUS power management core and
the XuanTie E906 RISC-V core. Each processor has its own register bank.
A sender writes a message into the receiving processor's bank, and a
channel has an 8-entry FIFO in each direction.

The host bank has 12 channels, four for each remote processor. The
binding lists all four banks, since the host writes to and reads the
FIFO status of the remote banks, and lists the bank interrupts in the
same order: the host bank read interrupt and the write interrupts of
the three remote banks, which every A523 has. Each bank has its own bus
clock and reset, and an unclocked bank drops writes, so all four are
described. The optional allwinner,tx-done-irq property selects TX
completion by the receiver bank's write interrupt instead of polling.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- One compatible, allwinner,sun55i-a523-msgbox: the A523, A527 and T527
  are the same die; the A733 entry is dropped
- reg, clocks and resets list all four banks in a fixed order, with
  clock-names and reset-names: every bank has its own bus clock and reset
- interrupts and interrupt-names are a fixed list (arm, dsp, cpus, rv),
  all four required: every A523 has the four lines, and
  allwinner,tx-done-irq only selects how TX done is detected. This
  answers the v1 question of how an interrupt can be optional; no
  free-form text (Krzysztof)
- Remote bank interrupts in the example corrected to SPI 181/174/205
  (T527 manual, Table 2-15; checked on the board)
- reg: the DSP and CPUS bank addresses were swapped in v2
  (0x07120000 is the DSP bank, 0x07094000 the CPUS bank)
- Add allwinner,tx-done-irq
- Description rewritten to describe the hardware; "schema" dropped from
  the subject (Krzysztof)
- Samuel Holland dropped from the maintainers
---
 .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
new file mode 100644
index 000000000000..47b6fe304dbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/allwinner,sun55i-a523-msgbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A523 Message Box
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+
+description:
+  The message box on the Allwinner A523, A527 and T527 (sun55i) SoCs links
+  four processors - the Cortex-A55 cluster, the HiFi4 DSP, the CPUS power
+  management core and the XuanTie E906 RISC-V core. Each processor has its
+  own register bank holding 8-entry receive FIFOs for messages from the
+  other three, and a sender writes into the receiver's bank. The host side
+  therefore uses all four banks and exposes 12 channels, 4 per remote
+  processor. Each bank has its own bus clock and reset, and an unclocked
+  bank drops writes, so the host needs all four. A bank's read interrupt
+  goes to the processor that owns it; its write interrupt, raised while the
+  FIFO has room, goes to the sender on a separate line.
+
+properties:
+  compatible:
+    const: allwinner,sun55i-a523-msgbox
+
+  reg:
+    items:
+      - description: Cortex-A55 host bank
+      - description: HiFi4 DSP bank
+      - description: CPUS bank
+      - description: XuanTie RISC-V bank
+
+  reg-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  clocks:
+    items:
+      - description: Cortex-A55 host bank bus clock
+      - description: HiFi4 DSP bank bus clock
+      - description: CPUS bank bus clock
+      - description: XuanTie RISC-V bank bus clock
+
+  clock-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  resets:
+    items:
+      - description: Cortex-A55 host bank reset
+      - description: HiFi4 DSP bank reset
+      - description: CPUS bank reset
+      - description: XuanTie RISC-V bank reset
+
+  reset-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  interrupts:
+    items:
+      - description: Cortex-A55 bank read interrupt, messages for the host
+      - description: HiFi4 DSP bank write interrupt for the host
+      - description: CPUS bank write interrupt for the host
+      - description: XuanTie RISC-V bank write interrupt for the host
+
+  interrupt-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  allwinner,tx-done-irq:
+    type: boolean
+    description:
+      Signal TX done with the write interrupt of the receiver's bank instead
+      of polling. A message is done once the receiver's FIFO has room for the
+      next one either way; the write interrupt is raised while the FIFO has
+      room. Without this property a full FIFO is polled. Received messages
+      use the host bank read interrupt either way.
+
+  '#mbox-cells':
+    const: 1
+    description:
+      Host channel number. Channels 0-3 reach the CPUS, 4-7 the DSP and
+      8-11 the RISC-V core.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-ccu.h>
+    #include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/sun55i-a523-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
+
+    mailbox@3003000 {
+        compatible = "allwinner,sun55i-a523-msgbox";
+        reg = <0x03003000 0x1000>,
+              <0x07120000 0x1000>,
+              <0x07094000 0x1000>,
+              <0x07136000 0x1000>;
+        reg-names = "arm", "dsp", "cpus", "rv";
+        clocks = <&ccu CLK_BUS_MSGBOX>,
+                 <&mcu_ccu CLK_BUS_MCU_DSP_MSGBOX>,
+                 <&r_ccu CLK_BUS_R_MSGBOX>,
+                 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+        clock-names = "arm", "dsp", "cpus", "rv";
+        resets = <&ccu RST_BUS_MSGBOX>,
+                 <&mcu_ccu RST_BUS_MCU_DSP_MSGBOX>,
+                 <&r_ccu RST_BUS_R_MSGBOX>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+        reset-names = "arm", "dsp", "cpus", "rv";
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "arm", "dsp", "cpus", "rv";
+        #mbox-cells = <1>;
+    };
-- 
2.53.0

