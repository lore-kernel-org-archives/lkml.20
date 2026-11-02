Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638474;
	b=1bU1k1SnDF8eNKpc09JuKaSg12g9pWTDDIw0zN1hNIW2TxATOgwm+mbviegMqlvErKo/
	 s+KkZNpVUrUZwwL8/JN62rti4gwW5DnysZ2CGRsG4Wefg2uw3yp872WkDvacs/zUrKyIZ
	 5Lui5SJzyOcnnmLQZbZaz/r4mpo0q/41hl0kJhc0jhtEJP1UinR57D1E9+5wxY4lwl/Ff
	 WeU/7zKwfKawf16vNsoTDq2idWboCrDAi0sBRrZVDNcQoQwgKfyguJP/7zdM0XLvqJ2Ns
	 VSBBvBRlICnTcSnf9jp9Ikam8cFJqgSTQGjRziMmFKXLbP6b3LAQFD121aTAActWryg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638474;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SMo7/u996wbVcHi3k4xgqARzUbdAu1qHiecGi066wTg=;
	b=ojjqaEu6f9TbGc+5L1UIT0lc80hxpMi8uONqKrzkvZp7p/r3Vwg+OSC4TsAU1LB6K7ij
	 qSJ7doljhamYMh7G6yD739ceG1xrz35x2Od5jr+mJ78mQiOGpUm+ok6+LRtSpuRhflBoW
	 DLgFBe9RGdFrGRRhox4jKn0GOrYBMvvVtuR5F4d0zQSFydyxOHSqIlfYbXJN+EK8VGAUY
	 G2iNj1MGI7muBXy9Qmk66rXwclNY+plmgpH4xy+DvPyD8RsWVLB/J5DxETIm7OlmiGk/2
	 CzvG6ZYtDh0Iyc0arWgYgQszF8dH0qUxPjSYXLANjFturUwu+r1LF80fE6NQSUsAvMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oWy3HQhm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C3D608C270;
	Mon,  2 Nov 2026 16:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C3D608C270
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oWy3HQhm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A81C316F3;
	Mon,  2 Nov 2026 08:54:29 -0800 (PST)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D116E3F59E;
	Mon,  2 Nov 2026 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638472; bh=L72770060tG1YWBMEpx+PQ5qVJqAP1qUPGT7jZu5ZpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oWy3HQhmHsHKtd7U32Ydo+OrzCfHSyJGfRI9zN/B6tzEs0y8gdXFccTRucK1e1K2T
	 OxZtl7PTvsRXHgSOuIYQajFqcorTL1Vp2H2Ip/KjyXGu1RY45BDPbkNWxiKQ4p2ch1
	 2E3ovXXmU2uBrO31zQV/k446DpNQqbdOxSyh722g=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 RESEND 1/6] dt-bindings: arm: Add Live Firmware Activation
Date: Mon,  2 Nov 2026 17:54:15 +0100
Message-ID: <20261102165421.3651202-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102165421.3651202-1-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
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

The Arm Live Firmware Activation spec [1] describes updating firmware
images during runtime, without requiring a reboot. Update images might
be deployed out-of-band, for instance via a BMC, in this case the OS
needs to be notified about the availability of a new image.

Describe an interrupt that could be triggered by the platform, to notify
about any changes.

[1] https://developer.arm.com/documentation/den0147/latest/

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/arm,lfa.yaml      | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
new file mode 100644
index 0000000000000..de97dc88d0b15
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,lfa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Live Firmware Activation (LFA)
+
+maintainers:
+  - Andre Przywara <andre.przywara@arm.com>
+  - Sudeep Holla <sudeep.holla@arm.com>
+
+description:
+  The Arm Live Firmware Activation (LFA) specification [1] describes a
+  firmware interface to activate an updated firmware at runtime, without
+  requiring a reboot. Updates might be supplied out-of-band, for instance
+  via a BMC, in which case the platform needs to notify an OS about pending
+  image updates.
+  [1] https://developer.arm.com/documentation/den0147/latest/
+
+properties:
+  compatible:
+    const: arm,lfa
+
+  interrupts:
+    maxItems: 1
+    description:
+      The notification interrupt for changed firmware image status. For
+      an out-of-band firmware update, some system entity would signal
+      the availability of a firmware update to the host OS via this interrupt.
+
+      This must be an edge-triggered IRQ.
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    firmware {
+        firmware-update {
+            compatible = "arm,lfa";
+            interrupts = <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>;
+        };
+    };
+...
-- 
2.43.0

