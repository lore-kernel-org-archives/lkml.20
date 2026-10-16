Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CBD559CB3;
	Fri, 16 Oct 2026 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175254; cv=none; b=qeNSkKrBd9QwA3sJu5cz1XLXgPQ41LOuPpJvRs6tWKlRZJriS1GSfpK9Qt5t8DBfoJ94yaIyPrHt7mHhc7bnSc6MfFauT/4exDOe+g6webOTPAZ11qJbXkx72R5eakJB8IrBBA79smtVEcwW0eZphxFZsaOP0gCKWkSZivZq+Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175254; c=relaxed/simple;
	bh=L72770060tG1YWBMEpx+PQ5qVJqAP1qUPGT7jZu5ZpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPQ9GbhWob54zEydqh/tB9NkzL0cP7dzl6/S7krHJgd84JZFwhTXwyZfTO67tbrNXWSDk+T4jDQyJ2wwOYHdbPlnBvK4U2eEeS9h31rgsfYUsq33xoLOV1OdS5zo/ieiEs9C/U3iAZgZsyc8fFSdgDKChdjfAqjUIZRG0vGfWg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kqRp/384; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kqRp/384"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7B121516;
	Fri, 16 Oct 2026 11:27:28 -0700 (PDT)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37DAB3F8C6;
	Fri, 16 Oct 2026 11:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175251; bh=L72770060tG1YWBMEpx+PQ5qVJqAP1qUPGT7jZu5ZpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kqRp/384Q3Og8WrWM93ZAx3VllWEZ5LIYKt3tGkPw0McKB6FSlCsN1dqnKAX3rCIf
	 OM7Q4sUhk8t4uw7DP7O8Q4x42OH6nNxnHyLhACOXY1VFCsogizTYaeKO+FZ+ug4v+a
	 Ra464/Xz+VYiLucFuhs18frqcbXqZYDEIVx1hrOU=
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
Subject: [PATCH v5 3/8] dt-bindings: arm: Add Live Firmware Activation
Date: Fri, 16 Oct 2026 19:27:07 +0100
Message-ID: <20261016182714.1835813-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016182714.1835813-1-andre.przywara@arm.com>
References: <20261016182714.1835813-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

