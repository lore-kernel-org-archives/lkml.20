Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794448872;
	b=PEQpzLH9PKtMQBZojEUeIkN5aQQjumN+4+No6NpMXKrc6jJONl8GXd+J8bZtiQk1jhao
	 AAxxPSotuzAPdVmvSOTvGQpKPkNEYlhnasn0U60CilOnY7Io9ANu8NQhmb6r8IPVlqCUK
	 KmCRP167TGJ59LYowTT44+ZYMm3MTxqRcFdz2viZHqBzl1+Cv51eK3oAaIDIGJabD0uwt
	 LmlNr4uV/Vr6eYEB0Pw2xGfnFD/er+yGNq1pIdTF0sPi6TMwIe+ULm1jnaGovxf+pWcyg
	 YkKjz3sO0oA6ypsS72eR+Rcjc80B/K9P/XS/ClMsN8p0C0a1WXX+O2VsS8RJ3gd+orw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448872;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	b=M16X/bfxIFVl1wrBsR5h80hQ60P2Fq25zHu0htiQxeky0Owa5OE2nXWJK6wFu0Ak21Le
	 JsemWZdA688SPIW92nrK98VPDCRZ+e5gc4uB5A4DNI/2CPvEMqNW3TYPfqxwYNUqBqquH
	 Z5NiAIhrzPGPbMSgtE2lbQbvUef9JQAFH1nWysh0fVhEcsrBW25F/CVuMY2qevOIT8Ag/
	 C4n+smvQF/6g3AzMXAjbZixim+BcCCIqV4UB8wSmzgLjmZ8vH3VMaR1OIDU48bQMKAxYt
	 v4rwlDPxiL8zbN7zpfWhwWj3ENx4VU6ZMdxO67y3F1W/Y06b4r7QCyq+tthlSRDJTUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RNjYO2Qz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AED606A335;
	Thu, 12 Nov 2026 02:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RNjYO2Qz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794448872;
	b=naO1hf2BchfZa7ZdwaIVVqiBd2HIVmGHFgvENnrlsm2ILp7pv/PjVnQ8HQ4id++S5nSd
	 FbHW8vsQwURUwTi2D+Nsp6Q4ceZS5Ge75Q/L59jDvyg/BLQypFsydovJySm/hzufjNv51
	 BYcLmpCmSib/mutcbCcrNsQvwR0cD8gU9ICYe+evZ7GOm93Y3QzlUfqRwf2vrDOZEAl7Y
	 EaGO8EleTc42+0wQNdHkPW9sLyW0uU1qd0TdLbqcIvm1a0H76Q2M++0bPv1bNvDhOGsqA
	 86g7++kVzdm7ZJhpsiPhM8LBHTBUcvWJCfW4x1+7f6kUawXeNpKrvQYpR7dbADa9LEQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794448872;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	b=hcCuWMfAqjLNptb+Z6aeAFFZd3zbwfZqUHB8GpsR9IdQVdVwf3oww2duFac5fY5F/jaE
	 X2Kv3RsoxiZKZFULmJKqxLQHlDP5byMcBmuJHnfbjMSH+sGUzKpJSJlCrdEr7pghPOXyH
	 l5yoc1RqnybjFZ2CuVzjHg2jNCnY/ZUzfJ9byT5hbzC1xTs7JsLJaVehEu71yjGpxFvie
	 tadN9xDcMoV1aY//sl/UEgkSrZ57rprGe5toDpchFBVcfnb77THVRha0r85Fym3ClrEc2
	 wunW+ZqH5BKRBs6mc0FHrSH3q6OycsnCZZbjPzOEyX0koJkxpfC1Xg7RfnEbsin4qEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43D841F00A08;
	Thu, 12 Nov 2026 02:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794448872;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RNjYO2QzjVbkuOy3c2qBs3z34vnkZArVNfwQjSVss0tFUQ49TlgJPdRA9Dn/BIr1i
	 laUeQNNyknZKoKjHmEkC7N3/MEBbi0uEL5nRPPMwzAFsE1YBsprK+daoB0BJl5u76X
	 kK/cVerRDLLR/KOsBGBkwOh2T7fMCtafghvDsJ11OzsacL5A0rmleVE2huj0D2tDkK
	 nFm94xCSRg047o6I1lcB56pMXrjCDa8CE0vg6Z4snqwjDJDUyEAMifsiwBRSqERQFv
	 9Y06mHoJ5dpbhuYX5YbNGu8HTPCLc7Wr9Z4w2ZVxhS4rj8qvQyFeAPQUa1EX8+brju
	 doXot7mw0zLhA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C3E7D4920A;
	Thu, 12 Nov 2026 02:01:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Thu, 12 Nov 2026 10:01:02 +0800
Subject: [PATCH v8 3/8] dt-bindings: riscv: Add UltraRISC DP1000 board
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
Message-Id: <20261112-ultrarisc-dts-v8-3-14fa0834cac4@ultrarisc.com>
References: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
In-Reply-To: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794448869; l=1942;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=F931PJB7CYQDP8Qv71XY2lbmZu4qGdN+Fjh5HxV88EU=;
 b=uCeEcF3sqmLvKivh28tCH9txNjSqjjxHRBK9Txfi3cSaebLNLlXG6wxfj0+zkxuqb5+sqOdqW
 Dwb02RSfnokAgHe7qvsci7iBKob8XtzNZyRuyT9KTGKspAKMtiq7rQB
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


