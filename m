Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792931049;
	b=AuOvZ7dENfGZilyLXYTofSaxG+82nsGodZmNBLPBFWRiRmOtf5QVlO9d6Y8neGZTESzI
	 l2vSjhmd9OyGLQwtZzWlLDbOHD5jQMwh8xP5OtFz3jz5sKbKanyIin3iCcof2MuYXPP1Q
	 Fv3iD1blwnHZeHUD4mjU3F8qqKAuOh/JkQKWbU9Vqz6Ff2s6EkXsUfiJTC5LGHtmwHST8
	 ReHmKVv8eOLBaOdwnKydjUuzipgz3wx+j/XGQ4xCj+zm1O+WhvLt5hEgzly8/SG+96ULn
	 Pm+dguLvL1DL0so/81AMrcSnjXEj7vqAS4s7e2ORcCaFVDWmcGK6uaRAjNWis2P7ylw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931049;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	b=jiBycxuDMHPFHbDnkM4pYWo9s+lWIMk3tmVffDQl5YgUWOgG1lujUQExslZ9emEsdYto
	 m9cdozttqHeMFyQ48kZH+nRJxTRxZ882ZRsMphF5v1ORMuu4wMPw0An6OtvDnp3p3coVN
	 srUzwvW6JNQCp4shbpPbsXLulYqJvhR3xSBWE9CSPy+4fSqBGJ/n3ejMt8BNaG6+/s0+B
	 9WnwL/25hTLBvF5GXjtgmxCfN/lZxcW6Qd+sX27GOSQSnXrl7BCgivky7TWOxULaaF0my
	 WkutqOeqp1wkAYSkxIQh5TGRzBcMazglHDykULcEYTLN5xgffgU+XFjviLTbWZNsquA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjzqbHqI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D5D606A31D;
	Sun, 25 Oct 2026 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjzqbHqI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792931048;
	b=rnmr/2diCnaJERe2jpE6rpRBhIMBQ4ftwNKLisghfjZxyxw5VBmwK9f42JOO2m4VgmCJ
	 YJu15Z4GiMsdnKUtHnyBzT3uO0fcRo/UuCex2Se9CEfCy/Jw9B+B8UScO2BcqkJGDghgR
	 YWIvPuaoZJtoj+uUDbjs/5QRZG2ulhRcGj9yZeuDcDVuybaFPT9W+u5EI8ytp77so4VsI
	 973JiK8156Tj5AMbf5bSTAIbG4ZeVAnDkIRDibnBGpyqo+sIXfD/+Eq9wStArLRE/LAkp
	 XowM1viA4MQaTQCbUBbeHmjG6l3aNcfz5g/O+mGW2xkM0sfGK1HN/kbqiic7VYsJUNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792931048;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	b=vFiPlJJ/DdTAajNvkIXODLQzhzA9BRTj46Q+TBobUCF0jpId3jObqNIMNfvZWKhn743a
	 5KqZxNBxmDtRdX9Vyl1B/sCU1oLPuvA9AZPJMwH5XLPGvMu2MIOYAV6Gfh9l43mo9JRz6
	 JSIxCkI3zYng4owf2alHzBdNJPzACa9MR7zGDcDo7A0bP2xFeBEPyFv7Lu8SyMYHH+7GB
	 jeFLBlmuurU95zuzf07+0n9UEDWTgcvEKqwft98JCwKei3f3tpgrU+GRbuJvpeCtX+nba
	 YIUk0J5tQhWHLqChrTH72MWyPx15GOtkzEpsadW+nGBrXco70KVVXGVQunPz5u5Wq/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B240E1F01829;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792931048;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YjzqbHqIopwwRiird3IIEb9lP4Ac0sM1vhy2LXGcblqn6iYlfy7Mtp/FqezuHIy2S
	 5lo845hfe5DPSpIuvI/wxxPQpyWkfw0UskLumpyg0ctYDHReN4iDodF52qQcgEE7YK
	 ya+wzzRJRSbolO8cMsOG/BmBdU8sngrbxxiTShCrtulPtvmhcV7Z/YS/HK/wHcCR0c
	 mwCMI5STg77Ez30vpWxM8rfudm5PhkXi3XauUIbtu9tpaC3BL+Ey86F4f45DgfypGX
	 rzyBOq1L4XQ/rNkA3AQ4sdruvf+AXgwxjqRYGKYjno4YwN9BoTcfJLLeE5k0Put6rD
	 /3LtTRNLZrcgQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2CE3A44A0C;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sun, 25 Oct 2026 20:24:03 +0800
Subject: [PATCH v7 3/7] dt-bindings: riscv: Add UltraRISC DP1000 board
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
Message-Id: <20261025-ultrarisc-dts-v7-3-621eca2b8790@ultrarisc.com>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
In-Reply-To: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792931045; l=1942;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=F931PJB7CYQDP8Qv71XY2lbmZu4qGdN+Fjh5HxV88EU=;
 b=x3sj9cxqwwazyJiIe4+NtnKNCGysuZOXG1R0BLXwU5KXu6hkTBBllk8Oy86Zfw2Fl1kSAMCJb
 LLbH1Ym9K+cAzPWShVDg6Rt2plj5D3BapNtGSyg77KXs7zoXmMJTCYt
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


