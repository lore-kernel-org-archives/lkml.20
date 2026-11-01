Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559472;
	b=q95/14V8PRHpZ9LnqnMzbTLUq48NmsnCIcl46UpG8AR3PwTKrk1WRlvqfFVLSB+YIRMz
	 FVS1oQHYNT63w5wrajYe1aull3x24jHVCocOUf5f+lXyhQswpWfIQVHEeD/xWYIlQ0yCk
	 Cfd8ZgSKQLnNwdiJKjCXOvxTlZtL3IA23SH79pEVjDioDUiDHQdbB7WHutFBx0rD0qGpj
	 GOnlP1IJP+sWx8bkwBvwFvIY/FfQWDQACOjSw9h3NIxpZqQEcArrq4uemrtCxbZMDBZFL
	 rvSxzayif6EZHJNBieobAO4IC5WYKCFTe66lgeV5LZe4yVGXakkA1jo6rG67M8jnsug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
	b=GEm8owQGrTB2CvIukeTwJJ7/khXXesMqwuC1JDrItI+/7514Zu1+ti4LNqTPYEExzy+R
	 cuJmaf4O87eAO0WOSLLzG/l/mZGibAp7WG33vXL31nZ6akKXytIRMCHv9S4VY1Lw+t63b
	 fLsT9DbCPVb6l2+kAzDOgz24sFqN/1rSKU+0mYZoQJoabJiqPTeD8U464oUICUXrjoO3S
	 Ky+GZyNnN73v90HvQ+XfjOjYqQG+EwwWmz9gK2nsMk+VPtTeyqoz2kEcNBPIHW6CfdlXK
	 nA1kCA9M6mTNtQS7kycg5BIV80g2hcAI3KKi2OyXBgNbQIaG3fqryht9hgmtkPln5nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBBHWtrn;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B4E60A2602
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B4E60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBBHWtrn
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0a921ee46so18804787b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559471; x=1794164271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
        b=zBBHWtrnLvN+KzhRTGzloQZBjdPjbJoacnzhb5LFieDQJiTervtn53JtQI8N2HM2c0
         bSsh0A3WMG3AGCQVa+/y+kvnXV3+eU7FwijPSoKqkxbzeWait4hunT9qokSXJuKLYbTe
         zrPivAEM6sNwnQbG80r0F+YN1fJBEDNbBRVxdOIHelXx5TkkdnP/NudLKy2YIpXnkBob
         AduZhRTZV89taoSgJxgYz8Z4IR0Xma3RtlbZcxaw370X/3VyoIG4o9sFlAHDVZcfyZvX
         RMQEBm9aWaLKx1bsPtSCPhKVEwS2jDBLDYBbILoEWWSys1V3YEM08qIxyYS4ILnTVtSv
         BDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559471; x=1794164271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
        b=mp2IUD5P4SQuVhbJNfnlmv3ynA5NtBK7OxO5JytCWkdk6BJoy9+IdOLkx0gxMmU9Be
         wIgtapcYEkaN/4E0EoDqgg4e2VHqS2y8FqMBhqgyZ0mWmH9PDGYvq4j7rfLmDafb8BeE
         QrIQ4F5Mesw787CzQGm6R4iXzLEQHM7Yjte163dtJMDKfzinrhdMZdUqjKoSwM5ul4mC
         STBXBGbkpZm8ERjYWny/NMjDwB7P2IZlF+cXBUL3eTlcx3J5qVI+cM1QwUzZ3Wv94Jr4
         kjJh+ivtgh8sLs/lDxu8V483W0cBE7bmvJraIEYtz41tT/ketf62PZryRZ2rJSeABy7G
         kRlA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ5teiLdhV3ff+XS+CkZi/PJWEtKzqwwMzn/bF4Efz/PQ7vRDbOp0Kez8V/JrUIev7izOpqv9968XZ9q4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gAoRhXUjZwgXwAR0fcg7399ERBebmE+gB1bTQ1axDdmBS6h4m
	w338Teawk1iZZE3dRlHh4ANEcqfM4fGaYLJ+FZklTV+RrWpFYDT2nVQQ
X-Gm-Gg: AYBFou1lkUWdLqQ1ChyXjJm++Jjoq1+yG1I+OpO1wvQlqHFkDuScyl7zSOph3gKzHiK
	0UzudJb8BL0zM201+1ksES/9x5Ci9s8Om6Od/G+xJWfj5kzD8YCE24bR5Sq+b/0wI54ufzfxvMx
	Xljmqt56br8IBxPCOsUl7LAItIWoosmBneBr05le0jDwnD19h9rcsZwB3EX0g4uLtdiBrqkTaJh
	i1+xkpvaBGIBTDVIxuySoJ3fIeo9mRyWPKtjYiXGNQ7hhjA3SlpN76vqv+hhicd+gmA7dfH0VyN
	XZgDl+a0n9gzPDuf/3O4H5sMqJdvLPNxhfxp/MemaG7r1h9Gey7aLC+DsiJC/f433N0eUjjTeBj
	qfdy5lwTbw79rI/XFSVGwEVrDw4yJuQ2F6Lp+ueZnIvt8bSs0PX2eUkzhJBac5HFzLQcys+JqjZ
	9Mn5RlXjoDoU6MmdiTsnLcUnjuyweH+xqMKaypKw6948C8tKG7dSSAaZBs8hOzhQRTKPq2MhHKb
	Ihfn86qHqE28lIDV0U3KPZGg3g/sWxacsPDM88em339zlDQXK3vbhoDa20FaMysdmXR1rqk/5rn
	JtgOqcOz9moL3S8YJZv6GqazWyIhADcuqSeTm1mOPD7e4cC/MldEgjxiPke0Qp22iWM=
X-Received: by 2002:a05:690c:6d84:b0:8b0:e385:ed99 with SMTP id 00721157ae682-8b2b66c78a5mr43226817b3.30.1793559471312;
        Sun, 01 Nov 2026 10:57:51 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:51 -0800 (PST)
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
Subject: [PATCH v3 3/7] dt-bindings: remoteproc: Add Allwinner A523 RISC-V remote processor
Date: Sun,  1 Nov 2026 12:57:31 -0600
Message-ID: <20261101185735.762559-4-tcmichals@gmail.com>
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

The Allwinner A523, A527 and T527 (sun55i) contain a T-Head XuanTie E906
RISC-V core. It runs from a dedicated 256 KiB SRAM and can use a second
256 KiB SRAM and DRAM; a bit in a PRCM remap register shares a further
512 KiB SRAM (SRAM A3_2) with its subsystem. Its reset vector is set in
its configuration block.

Describe the configuration block, both SRAMs and the remap register,
the bus, core and SRAM clocks, the configuration, core, SRAM and debug
resets, the RISC-V and SRAM power domains, one message box channel, the
reserved memory regions (a pool for virtio, DRAM for firmware, a trace
buffer) and an optional crash interrupt.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- File renamed to allwinner,sun55i-a523-rproc.yaml to match the
  compatible
- reg and reg-names are a fixed list of four (cfg, sram-a3-0,
  sram-a3-1, remap), all required (Krzysztof); the SRAMs are named as
  in the T527 manual (SRAMA3_0, SRAMA3_1); the description says the
  remap bit shares SRAM A3_2, not SRAM space 1
- clocks and resets are fixed lists, no minItems (Krzysztof); add the
  debug reset. The msgbox and parent clocks and the msgbox reset are
  dropped: they belong to the message box node
- Add the RISC-V and SRAM power domains
- One message box channel; mbox-names dropped. mboxes is optional: a
  user can drive the message box from userspace (UIO) instead
- The crash interrupt description says the A523 has no dedicated line
  for it; it is the only interrupt, so no interrupt-names
- memory-region[0] is a shared-dma-pool; the example has the memory
  regions
- "schema" dropped from the subject (Krzysztof)
- Jernej Skrabec and Samuel Holland dropped from the maintainers; the
  MAINTAINERS entry moves to the driver patch
---
 .../allwinner,sun55i-a523-rproc.yaml          | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
new file mode 100644
index 000000000000..b119acaa2df6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/allwinner,sun55i-a523-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A523 XuanTie E906 RISC-V Remote Processor
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+
+description:
+  The Allwinner A523, A527 and T527 (sun55i) SoCs contain a T-Head XuanTie
+  E906 RISC-V core next to the Cortex-A55 cluster. The core runs from a
+  dedicated 256 KiB SRAM, can also use a second 256 KiB SRAM and DRAM,
+  and a remap register shared with the HiFi4 DSP shares a further 512 KiB
+  SRAM (SRAM A3_2) with the core's subsystem. Its reset vector is set in a
+  register of its configuration block, and it exchanges notifications with
+  the Cortex-A55 host through the message box.
+
+properties:
+  compatible:
+    const: allwinner,sun55i-a523-rproc
+
+  reg:
+    items:
+      - description: Configuration block, including the boot address register
+      - description: SRAM A3_0, the core's dedicated SRAM space 0
+      - description: SRAM A3_1, the core's SRAM space 1
+      - description: SRAM remap control register
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: sram-a3-0
+      - const: sram-a3-1
+      - const: remap
+
+  clocks:
+    items:
+      - description: Configuration block bus clock
+      - description: RISC-V core clock
+      - description: MCU public SRAM bus clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: core
+      - const: sram
+
+  resets:
+    items:
+      - description: Configuration block reset
+      - description: RISC-V core reset
+      - description: MCU public SRAM reset
+      - description: RISC-V debug module reset
+
+  reset-names:
+    items:
+      - const: cfg
+      - const: core
+      - const: sram
+      - const: debug
+
+  mboxes:
+    description:
+      Message box channel to the RISC-V core. Each channel has a FIFO in
+      each direction, so it carries notifications both ways.
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: Virtio vring and buffer pool, a shared-dma-pool
+      - description: Firmware code and data in DRAM
+      - description: Trace buffer
+
+  memory-region-names:
+    minItems: 1
+    items:
+      - const: vram
+      - const: dram
+      - const: trace
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt the RISC-V core raises on a fatal error. The A523 has no
+      dedicated line for this, so it is present only where the system
+      integration provides one.
+
+  power-domains:
+    items:
+      - description: RISC-V core power domain
+      - description: SRAM power domain
+
+  power-domain-names:
+    items:
+      - const: riscv
+      - const: sram
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
+    #include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
+
+    remoteproc@7130000 {
+        compatible = "allwinner,sun55i-a523-rproc";
+        reg = <0x07130000 0x1000>,
+              <0x07280000 0x40000>,
+              <0x072c0000 0x40000>,
+              <0x07010364 0x4>;
+        reg-names = "cfg", "sram-a3-0", "sram-a3-1", "remap";
+        clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu CLK_MCU_RISCV>,
+                 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>;
+        clock-names = "bus", "core", "sram";
+        resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+                 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_DEBUG>;
+        reset-names = "cfg", "core", "sram", "debug";
+        power-domains = <&ppu PD_RISCV>, <&ppu PD_SRAM>;
+        power-domain-names = "riscv", "sram";
+        mboxes = <&msgbox 9>;
+        memory-region = <&riscv_vram>, <&riscv_dram>;
+        memory-region-names = "vram", "dram";
+        firmware-name = "riscv-firmware.elf";
+    };
-- 
2.53.0

