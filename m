Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792834092;
	b=QDnrYdyynhXCPapYduEttGisW2A6xAYTg+GckmLaV4jodp7zcvc9K+MeyZHtMK3u1CR4
	 /ewQ76VUiZY/ZP8zfnLoUL5yJreXGItKfi8jklXaGm2lt1QhAAaMOQHTS9au1RAlGek6J
	 iuJJ8SmIF6cv5+jHKlx9taFHNpDereuF15h0bAI7m2d11uNLI+4cHdP2BES/mPuaFpamw
	 YFrqSG36LClHCHvgMAe6EEzYgdfe5pC2WeZA1vXZjzGfmfzcZ+6otIY/WJObmzyopztL+
	 btwDBO2+XyW5RW9FB3lm5cNnJUuIdAvltsep4k/92Nnvn+tu8iN8mr55mgTRJwnoDcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834092;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	b=UscByv11YQUjaHLxeLYEHGqKqpZlYmiHpXADSJ5eUqOg0t4XRefmgkoGFLDEc8ieAcW2
	 Fff7GdbhWfkBWuIVjFc45/LuRIGltuXz4Ck1IBP/eqr6ZzAMfB5lSYsOH4JbkFZXWxfxS
	 TdCUZargjEdlR3YJBsXQ1f+mGv1i1h01CJUzwImpRUIKx7zJt1vdT9132A1qaiQIQDpUl
	 LqxgxHrISqosBTa8a/EegUDc/VlGC8gW4GUF3S1m6gluGjU5DthFFquGpUpoQxoMtVKMK
	 NvVgif5dHd34RaN5jxm+j0tGviIq1kk83Kmpm/Ulcw0NewkLlZ9wNP9/bTbXAYnMjsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JltHSxQ9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77993606AC00;
	Sat, 24 Oct 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JltHSxQ9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792834092;
	b=2KVpyr02x/W158F15mdBA4wr281ITHMWC2kLAbk0UILiaoEV3yGFS52Ep43JMdBbxV1i
	 IfI2ZmiMbIvn3+OAYC034rmaHj+bkO/Qc/OgTj/+lAZQNYZXtx1RKUv08Zc6FHuJzfrUL
	 /cYudmQls9PDZSaRuth3VZ6lEUV9Rx4IuqNdXztGhp/gnK9NANP0bQSqXu5Pweb4T6gl7
	 ovPPWILwzH6JtRZ0ooCddqdunahwnuOj8ozF/1XI5bcgDgHkJFLz4kOc65HBn2IBYWL6K
	 cIVONryVC4aTeDK1hWlM+iT+BgpuBMFswTnu89ZLSJaK3GC7S2tkUKKPUBXZrc9tpZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792834092;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	b=xuMhiECpzs3KQ5BslsGUWYYLwEvZFGkaD/kg1nRvoHSnP9JULHCCsJZnvNwVrTexK3HJ
	 hJBF/m+H/xnWL4kpZ6VlDPE/v4PmPYR0SHpfcfPxrQvNMuwD7nVNLoRcl9O6guTjgJ9Ha
	 86nDkFhzh0JHU2opsK3E7Aaj7FUJk/lLeFm9HcXsA1eXJtaea2hFc/k+YsLDB6VKKPCYE
	 1LKVfILOlAo8clU7A8jnQlklNI7PVB6aE2zqCbG+5GyaXbfdsb5GMZQ8SVlLSPnad3HPV
	 MuUUDsWGBzd/odV8lL/Ok+eVQIN2Bbu6UHi6i0yirL/bsY5jX2bXE8HrRhxtBMcSmhQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3CDA71F031E0;
	Sat, 24 Oct 2026 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792834092;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JltHSxQ94iLY+3c9j+zq3YoDlMboEoijoQ7MhCxCsPRR3PbpSSQGMu/aFDW6fqao8
	 7bdrFTHwtVRKnL2Dvlz+3FqFuuIEH+yX3mK0q4zdN+VeP/2UzM/arsu0a37O2PZLjQ
	 ciwQjCjh+1nsv6YXVlZxxMFN6QJXHL+4QRtwHUHK2jbnmE9NXzeYvN2tKUwF/A6M31
	 osK9KkBjhKiqGA637KLXVicxTnQGtyNoBDT+fQIQisQHwORVewPg0Y/21nbkJikhwy
	 JPGNP9gqNOZMkAiEaYhuMH2/3LotE/hFN183GE3ZRyl709WrWCVDQkzhyVFATYWk2S
	 cqBbDemCY86FQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B93E744783;
	Sat, 24 Oct 2026 09:28:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sat, 24 Oct 2026 17:27:53 +0800
Subject: [PATCH v6 3/7] dt-bindings: riscv: Add UltraRISC DP1000 board
 compatibles
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
Message-Id: <20261024-ultrarisc-dts-v6-3-c62994d8a114@ultrarisc.com>
References: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
In-Reply-To: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792834086; l=1942;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=F931PJB7CYQDP8Qv71XY2lbmZu4qGdN+Fjh5HxV88EU=;
 b=qylgVpcm/tbVtTwXGgCOUg8qEx/VsL85U0LpgxsTnupQO8ZDVZN6wCOZZ3KmXtj2xL9RNVC8d
 +mp0KYKPWvpAWb7GEEYK73PpfG1FQEgbk8BB7vgcYEOAcnW1wLCefJ2
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Document the compatibles for the Shenzhen Rongda M0 and Milk-V Titan
boards, both based on the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/ultrarisc.yaml       | 27 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/ultrarisc.yaml b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
new file mode 100644
index 000000000000..a51e63dbeca3
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/ultrarisc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UltraRISC SoC-based boards
+
+maintainers:
+  - Jia Wang <wangjia@ultrarisc.com>
+
+description:
+  UltraRISC DP1000 SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - shenrongda,m0
+              - milkv,titan
+          - const: ultrarisc,dp1000
+
+additionalProperties: true
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ff1c1aea9a98..7eb1b2971bea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23639,6 +23639,13 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+RISC-V ULTRARISC SoC SUPPORT
+M:	Jia Wang <wangjia@ultrarisc.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+T:	git https://github.com/ultrarisc/linux.git
+F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>

-- 
2.34.1


