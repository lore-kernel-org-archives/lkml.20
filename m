Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794693990;
	b=ZXssdngz5fsVPy9mp+ipBZiAz+SCHr1Xcipz8IhzK42R8xUbcdNQlekeDykUorVPum76
	 obtOrOfGUURUhnuWSU9xxZ+kEflGzh85DpgggTskbVRn80WeZ1rOE1+KDnh6LscfngqIc
	 KV6I7hBjOAkDWbnZLDoAvDlUtI+DcJ8x+MNzKh1NdWlA0StyakG6FE6ezH9iF7uoF7GUc
	 X6MKUaVI1ImcDN3e0R9YlUP+yjfDe/UwJVTgTv9yuvAM0RoV86zIljR7b+rM8aAmHnJn5
	 30ceezeKfFJ6nzZ836kqiYsf122Chj9oojoOADur6ZizUyx8KcX2UscpO2Lp9sSdRGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794693990;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=GwKej1T3BOoQPomvPN4YWkh5UASqK9UKMcPoRc5lP9Q=;
	b=JlMe2cuXt1tMrtJOik1+g7pegXTHzwD4SzmvA8bA0jb9U3NYerNk7GQTq4HGaA09a2DY
	 q2W7H0j/+IGbb96UukOBs5K503ayjCTVkPeqK6qky3F4VnGabhD/eTSDlC6ggYoaC99Bk
	 yM4gFLiED94sdBjQxYpprDLyCz4HDMscWJ4KFhyZ+0LW2QHI7vwl1xHHteDujnJWhQUtO
	 BANY9Wp1lPKbQP1iKkOutynv/zGsmW0wQ3uMsp5q5uRBK2fJjyrkUFLBGcE1IZo21WC9v
	 I8Csj5Boxjl0SP5v9aQT8M5p3kajsTjg2cbIWS8LY0F4sSTRF69X51PK274MEzhSVLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Od3NKH12;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81229606A8AC;
	Sat, 14 Nov 2026 22:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Od3NKH12
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C266A1F000C6;
	Sat, 14 Nov 2026 22:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794693990;
	bh=GwKej1T3BOoQPomvPN4YWkh5UASqK9UKMcPoRc5lP9Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Od3NKH129FmKbRGsP7XekQUZflwcRBY11ZrcWbuIXq/NSdOzZGg05mRKu8P8w715d
	 cSgNZ9H9RCkhvvAmVFP3staDYd3tjZGTmCLJVuDGsElAOlpM8ZrQJkgPzS+nNXNSre
	 0DzkfVKYQyVNj5/XAfVIJhsR9nZcg/uwUqySM4u7B+NLKn8i/AwosQfOf0eEPZF9GD
	 yDhJ2SqTk2NmFtPPSHCEqCjOI8zpRuKyn6xkydob2rSUd0w1QLtgx20aG/bTNMN93x
	 1j9/MvS7+hegB/J1IPZcEKyh+W/L8BwEIDub2CLr6rrjLpGRF+GkZbIVYhxN+6zSay
	 lOeX69ebArauw==
From: Drew Fustini <fustini@kernel.org>
Date: Sat, 14 Nov 2026 14:06:24 -0800
Subject: [PATCH v12 4/5] dt-bindings: riscv: Add binding for CBQRI
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
Message-Id: <20261114-dfustini-atl-sc-cbqri-dt-v12-4-6ef1f627072d@kernel.org>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
In-Reply-To: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4819; i=fustini@kernel.org;
 h=from:subject:message-id; bh=sKXr4EexR1L1i1sCn1FNTJvR16635O+nA1JRFhfXrew=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWT9uJ18W1ylcOqyLXcN6w0LZZr1bPpmb7f6qdReaJj89
 lVe0FPPjlIWBjEuBlkxRZZNH/IuLPEK/bpg/ottMHNYmUCGMHBxCsBE4qwYGT56M2c/bfxglbf0
 nkz+4ulHjZcdTbk0caPD9OnvZjrNSDdlZLjvb8ff/EDk5iIu3/Whdd+iZpgppJ+Qsbl8Jrhdx3V
 DDgsA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010

Document the device tree binding for RISC-V CBQRI capacity and bandwidth
controllers. Each controller is named by a device-specific compatible
followed by the generic compatible. The binding also describes the
common riscv,cbqri-rcid and riscv,cbqri-mcid properties, and the
riscv,cbqri-cache phandle, required for capacity controllers, that
links a capacity controller to the cache whose capacity it allocates.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Zeng Heng <zengheng@picoheart.com>
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

