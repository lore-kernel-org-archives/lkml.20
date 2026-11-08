Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794180098;
	b=Sz9vD9pTjSJm5yYURzQMSTTDEdd3yn2nCOYmPpZh8yWI/qdYj+FGaURNSqowSt91oHwP
	 CiEcFds5DNnOE0tC8l0xjIVEq3UtHNzdQEk9vosaViv8Vb5ryer3ZMU8bsHY1Obo+8sZQ
	 FDY+K2jxtP9aYpS9pztwre2ddQSbznkHgRixn4/cQyDPNmH/rIR7j4DnmrUjKL9YPcO6l
	 EFMofyof5Vtv95dGGKOnaTZ1qv78UQuV+dlEKUCSU8QmA0F4oA2lWV1wgZcyHyszHBaSN
	 hbXPlBZUikQcptgxcLGrNSp90P9KnYjncOhyrNv3ER8F/vLNXUs/wIE4b261m+dG9/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180098;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SMabW/HngJuNOsOXoJdy4PRXuj5hRKFm8xqcMJPvFOA=;
	b=dSBj6BxkrOrm7wsmne+fdia8YUIhQkzeANoWB1rlQm0772pNvkSdbh5n3X7r74iuWMTA
	 dyLn6u/v0mFWIEYondrrcZkrCTsgm+xl6JQiamDbJi42FUQ8PHh4G18hTzkXZmvyOza+z
	 r6Y3Z5U8xpuqzGc4piB1FXj0lyE+WiEtmXm+KlV1Q1aHVc4CJE15aLGPBlNZLTUeFsgZ6
	 LoIxjYgHV7Sv9Xj0LUbjDk6mEfOiNg+zUbo3ZimtFNC91pUc1nkyqLV4PEWcJMEWoKDWK
	 eoIaQI4SZGUNl2BNoBH0XR6a91O+jttYVqwtqc9V8LklT3QyZxmNsie3PpTNe4wu1KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AfRvbWdP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE201606A322;
	Sun,  8 Nov 2026 23:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AfRvbWdP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DB11F00903;
	Sun,  8 Nov 2026 23:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794180097;
	bh=SMabW/HngJuNOsOXoJdy4PRXuj5hRKFm8xqcMJPvFOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AfRvbWdPLOyWsrlK78c/14pV/sGOpRg89bLdfVB+1BC4KPYAUoiFThhWpCsJOZZ6C
	 jV+hY6q+D1vXSR4cGQW307aJl9lzCh/gEJShRO/uqpBEFmQ1Ec/oAVTJPbUudusnFU
	 hx7F0Kj1wI7lwYNusxGolDu8X0mwtv8iQJYLPhZUJAdGTH8gph+EAI+Ol9evy3OLPp
	 jXaqxxj9c0J1hWzjj2EkFAOe0pVcbDTKLx1oAzFqQPaX/pqqoZGcRI48NVW4N6qQJK
	 vtGTzSA+x9iJTwv8iC2DHXb9irkS3I2G4HEYHdaDCc0091htMNZhz8gZ+fkvDkH20N
	 n1bvUr7znJkMw==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 08 Nov 2026 15:20:53 -0800
Subject: [PATCH v11 4/5] dt-bindings: riscv: Add binding for CBQRI
 controllers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-dfustini-atl-sc-cbqri-dt-v11-4-33a1bf0cf01c@kernel.org>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
In-Reply-To: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sunil V L <sunilvl@oss.qualcomm.com>, Tony Luck <tony.luck@intel.com>, 
 Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
 Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4770; i=fustini@kernel.org;
 h=from:subject:message-id; bh=T5fpNliJ19iV1jhGHLqnM4zVC7YMlun7JfqC/DWY3jE=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWR9ZP7X0aycf3Difu0TP/4dnNtlHL+mjuebk2TE1s0+E
 0ujv8cGd5SyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmImrIyNDy4f9+u7/eeV6r
 Z86Zrd6g65WzLMenJnj1Hl83O++Drw8yMlxV35TweZ/jieg/Vn/+vha61Jp/VmHR7Y5f+ls77b9
 7ufEBAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010

Document the device tree binding for RISC-V CBQRI capacity and bandwidth
controllers. Each controller is named by a device-specific compatible
followed by the generic compatible. The binding also describes the
common riscv,cbqri-rcid and riscv,cbqri-mcid properties, and the
riscv,cbqri-cache phandle, required for capacity controllers, that
links a capacity controller to the cache whose capacity it allocates.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 .../devicetree/bindings/riscv/riscv,cbqri.yaml     | 98 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
new file mode 100644
index 000000000000..160b0bc797b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/riscv,cbqri.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Capacity and Bandwidth QoS Register Interface (CBQRI) controller
+
+description: |
+  The RISC-V CBQRI specification defines capacity-controller and
+  bandwidth-controller register blocks that allocate cache capacity and memory
+  bandwidth to resource-control IDs (RCIDs) and monitor usage per
+  monitoring-counter ID (MCID):
+  https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
+
+  Allocation and monitoring share one register block, and a controller may
+  implement either or both. A driver discovers which at runtime from the
+  capabilities register, so the compatible names only the controller type. It
+  does not distinguish allocation-only, monitoring-only or combined
+  controllers, and no property declares monitoring support.
+
+maintainers:
+  - Drew Fustini <fustini@kernel.org>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - tenstorrent,ascalon-shared-cache-controller
+          - const: riscv,cbqri-capacity-controller
+      - items:
+          - not: {}
+            description: Needs a vendor-specific compatible
+          - const: riscv,cbqri-bandwidth-controller
+
+  reg:
+    maxItems: 1
+    description:
+      The CBQRI controller register block.
+
+  riscv,cbqri-rcid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum number of RCIDs the controller supports. RCIDs are the
+      resource-control IDs that allocation operations target.
+
+  riscv,cbqri-mcid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum number of MCIDs the controller supports. MCIDs are the
+      monitoring-counter IDs that usage-monitoring operations target. Present
+      on controllers that implement monitoring.
+
+  riscv,cbqri-cache:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the cache node whose capacity this controller allocates.
+      Applies to capacity controllers that back a CPU cache. The cache level
+      and the harts sharing it are taken from that node's cache topology.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: riscv,cbqri-capacity-controller
+    then:
+      required:
+        - riscv,cbqri-rcid
+        - riscv,cbqri-cache
+
+additionalProperties: false
+
+examples:
+  - |
+    l2_cache: l2-cache {
+        compatible = "cache";
+        cache-level = <2>;
+        cache-unified;
+        cache-size = <0xc00000>;
+        cache-sets = <8192>;
+        cache-block-size = <64>;
+    };
+
+    qos-controller@a21a00c0 {
+        compatible = "tenstorrent,ascalon-shared-cache-controller",
+                     "riscv,cbqri-capacity-controller";
+        reg = <0xa21a00c0 0xf40>;
+        riscv,cbqri-rcid = <16>;
+        riscv,cbqri-cache = <&l2_cache>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 1ba75a57c77b..636835e313ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24137,6 +24137,7 @@ M:	Drew Fustini <fustini@kernel.org>
 R:	yunhui cui <cuiyunhui@bytedance.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
 F:	arch/riscv/include/asm/qos.h
 F:	arch/riscv/include/asm/resctrl.h
 F:	arch/riscv/kernel/qos.c

-- 
2.43.0

