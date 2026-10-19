Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C38493D38;
	Mon, 19 Oct 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396531; cv=none; b=cA7rwM4+bxTk9oEywCHAsM4WxywVMUSXDetlezr0HdX2Qvow2LE7vnRPWVG6H/1Pyw0WxKnflJnZ8OMPD+fCOf+/zA55zTmH2N7JxQ5HeLLMIruGDSu+SqCVzkdb7bGh4Um9WujCNLiG2F0c4iiOEZVgSeJrl531JkFdTm2uPpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396531; c=relaxed/simple;
	bh=UH/9tXjtdEDMWx49kupssMJS31sfLv7FO0+FnXYwDuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbOGr2m+BPKjYIceej9pVngJ+RZbF/nUDCVcEf1z2YjQSJM5apPrceJDoVKUd3uwHa2iYqNNcP9KdkdweH+HLMUIdFQwwV/bMCtLJfG4wdY6kVwTEatoXoF+PqSd9qmvsf9LUn2KtVzbxFtA1bP0jQX9D0J9oZ6jSw/d9c+gzmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pB9SLlpX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pB9SLlpX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09B07C2BD00;
	Mon, 19 Oct 2026 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792396531;
	bh=UH/9tXjtdEDMWx49kupssMJS31sfLv7FO0+FnXYwDuo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pB9SLlpXC+zcBf/35nSQI3XDdDd5z0a38c3AMwg9WqsUatJLeCj93MM/EKankiYaj
	 tQ5wm9jV1Vgitvh27xBODSQFEZXRMcdd1WLoiO9aJKqHpq+EaBWOcLoJOFzapiKcAK
	 cD8oSTdad1uVjj5msGWRUrDo5OjxNKufBtXMYQQDbQpYU23dtx/E5gHy7gEfw5iyv+
	 /xuLmQ+QhZdRosEcjpdF3ItSrzO+erCKQmZI6X1zqs3rK7ZEfx3lkUDLFN+b1PQA6d
	 DuO7ZJQ8PAJ0mg6+6Pnb2PS7qeUFAN9JK5IqaEScumsQGYhMH9sK7FgiARpv9Q03X1
	 XGY7UGg/Bh4bA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB20CCF2DB;
	Mon, 19 Oct 2026 07:55:30 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Mon, 19 Oct 2026 15:55:26 +0800
Subject: [PATCH v4 2/7] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-ultrarisc-dts-v4-2-3979747cda2e@ultrarisc.com>
References: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
In-Reply-To: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792396528; l=804;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=4TAyfkBcv/s6Kdb5vlK3fVOCoBkGrwHfHTtS6V/To4w=;
 b=SJpG5CJHqSM2MOpgQ4hNk7rG3FGz/inBkUXnsgsbJ1Gq1Ea+K1lbDOIINPQm1B+NeW+xPbhNR
 W7pCdeS2HDgBCxawyfNrsljc5jOD9Qs5O+LO60k+eFF9tVhtchsGvl2
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


