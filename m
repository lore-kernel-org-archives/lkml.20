Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810952;
	b=mYcnTSiVSW8o2qj88oaW6uTe01gdRJmjgs7lwG/uSMZn5Fy3Ldd8ZFuZ/XiYcL4jZ7cR
	 YYcymXMciDiUzjcAEFtBGQ+h/pNg1Ml9Cs2c75J/j6kQs0E8bv3AoSKVsOaPe41K57HgZ
	 UVzS6GddXIwQYG4i3WMnVRJR7Q8GsETyTdhv6r5kjD048gXzl4P5rlHgFa3tJY8vmQHi6
	 5BAX5xCocapeLw+eQfqMAW5idU5ULqf3kTugaZax4nDkZBVmebM/ZYRG9N0mGla2J1gDN
	 uh48kmkCYNA5tjmvbndBeZjzkS2kT0PlNK9L8TphOBFAmH5Dc01pJPLzv6YvhBqfzcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810952;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ul0hUmeo3LFdX4pn+/+/DTUhcde+OaB2Bf1Yr6WVPDI=;
	b=ImSH/l4Wv7ESsJFuDvj720tH8pqLYlbAuvF9oWCiIWtKQGQQ/YCG+v4Wi1XfEm0T5T8h
	 m/LYVkV1hnzq+uCqFwAFufNnB3pczLAQuQgZZetWvwZ6w+RbDdI/6IGQwKWtxjrL6dTI5
	 cwAUa+5OLDZx1MFEiJgNIB+5SVstaeBJr2tXPzqaV5lsspSfvzHk1jg3EnX9wB0Nqq9uy
	 m/Eow8NZkAChCZtEQj+ALVwfQXt91LIJGoTf8XHHogkzVALa55f+LF8lqRMWDaocJMXe5
	 elWMJyJM+lnTdeWN2PoHbbWfBy2rCrpLUeSIA+olPlyH10XX+SseqEtodfNRSAsJtDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JjG5PPKO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0136082BE8;
	Wed,  4 Nov 2026 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JjG5PPKO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16BA1F00A1B;
	Wed,  4 Nov 2026 16:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810952;
	bh=Ul0hUmeo3LFdX4pn+/+/DTUhcde+OaB2Bf1Yr6WVPDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JjG5PPKOpxISlpksdmehpQ/KZfo/DwMkKqPfYVOYzAYHbma7zSbTmygYw5Pd4/sLs
	 MW/DQc9q1VTjTIpJWC84WDJhS72f7tbi6TQT6zgSxhOJygmAtVx1vLbXB+xJndRLpG
	 V9QUIEkHAlxGxwMUvxflG97Z61CR1NJILFuGbO3VNimpiABAjV7zWzqjuX1qHpwhaq
	 3Y/NSF8iOVU5Qu/qnwSML4zjzjW+I0I70EipAeqGlZucSOyQH88+tiGCFeMHkahLon
	 x0Kw2rxW7PsEfGJRfB8fqXQFTyrhdont2OPknaF7MT/f0zVVF++BSBQGPiq4DtNEcj
	 NGw8I7iDX8y+w==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 04 Nov 2026 08:35:21 -0800
Subject: [PATCH v10 4/6] dt-bindings: riscv: Add binding for CBQRI
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
Message-Id: <20261104-dfustini-atl-sc-cbqri-dt-v10-4-1636a003a3c0@kernel.org>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
In-Reply-To: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4769; i=fustini@kernel.org;
 h=from:subject:message-id; bh=8djz2Kg+tF9ynqTzK/QM7Bf2l1QkJifYg2dWCOTqWXg=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWS9TmI9+vWbgnaYTfIdY6k5Cc0J710E8o5XxN/fr3Cl5
 rxmnMT2jlIWBjEuBlkxRZZNH/IuLPEK/bpg/ottMHNYmUCGMHBxCsBErtcwMtzIX9c593eoRHvB
 0c3bFkyxybfbsP1r+Or+DXs709oWlD5lZLj6dZtORLayhX2Zh9Z6nh8+s2TaL1x/PW2GxUIO2yz
 3g/wA
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
index 000000000000..851b4e53a751
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
+        cache-sets = <512>;
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

