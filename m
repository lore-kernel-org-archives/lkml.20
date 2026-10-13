Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66DB3F54B7;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886890; cv=none; b=DsBaeBjn1eDT9OBvxMw1i7sjgtPS/FEXEDJtoFMThXWMkCA1lS0HleZDkCXpju31V3uwL/D78a+Wj30bqgI7s4zjM9Q+yyvLb+lttciAIBAJkW+/gyskT38U0O0cPzvUF+aweNDfS69w62FCFRXzmUu4W2KOpLmSfgkwhYTfBMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886890; c=relaxed/simple;
	bh=UH/9tXjtdEDMWx49kupssMJS31sfLv7FO0+FnXYwDuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCl/qaPRAB+KvNgacBFHlgSvXs5ZexZ8rxlUQ72E8EqjabaIAGQd8tcisejS8kH/SanPctDMkNuw7byzqK2hr0utRbYSKPkW3MpojSl5N+h6jQTQL0+Hods0WsQ6Vu+MbwtX6NRLYYy4WponcoBMrxI8C2L/yEfRn+YYRpkuzJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iu7bin7U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iu7bin7U"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92685C2BD05;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791886889;
	bh=UH/9tXjtdEDMWx49kupssMJS31sfLv7FO0+FnXYwDuo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iu7bin7UJPViS8CgHD8es3z0HMx3FM2EEjWmxDfi3WIVrs78Fz4zehWLLOarCk4of
	 IPfQrOBwcgbpaYl18QM0BR404jBnFWzgtUdzBVKO5yMF06Vwv2ZAtdr/ALoeNlSrba
	 tHMIWpTtUdj29MjmmgL8Pir5ynaXoWbpxj8exjLeAlimiVB0ai0VSuCQEVctKfECR3
	 nN7X5rO4kH+s+Dn5EElJt1XWrSa1riV8gAcgud+DDwF8a7Ll4lAbSfUtVdAUSQBTjQ
	 3WHIDvdoR9j35t+qDeYPidOrUMMWdNpW7ts85LVogQ2hctZ5qFBgq8g8WQ09UrL0tb
	 V6BjqDZ2U6MoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A94CC6B03;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Tue, 13 Oct 2026 18:21:26 +0800
Subject: [PATCH v3 2/7] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-ultrarisc-dts-v3-2-5ff3ebb2a90d@ultrarisc.com>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
In-Reply-To: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jia Wang <wangjia@ultrarisc.com>, 
 Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886887; l=804;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=4TAyfkBcv/s6Kdb5vlK3fVOCoBkGrwHfHTtS6V/To4w=;
 b=a6oHaHiU9gQN+Ua7rJLLGvP2Tuhz2DaAAZRZxz4A6VOffrl/ttBTaeNNnk6ULYE5mU28IrN9p
 brEJk46Gk3OCHllNuDDhbL57M7gg8I4iBTypCVMk487w7lQXDXr8Hmy
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Document the UltraRISC CP100 CPU compatible.

The CP100 CPU is used in the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..85adf72899c9 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -67,6 +67,7 @@ properties:
               - thead,c908
               - thead,c910
               - thead,c920
+              - ultrarisc,cp100
           - const: riscv
       - items:
           - enum:

-- 
2.34.1


