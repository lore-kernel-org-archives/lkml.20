Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEF949480B;
	Mon, 19 Oct 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396531; cv=none; b=CS324vX5sih/egwheNdkq6a26B4Gy34MXuX5JyJZdbfqjkTQwGVCKCjFrLDYbnBvJd0IOcqLFY83TReRoLNGsED5h9v1/rejLjIGPyQjNBbG8jdU9CxwwVUer6gBy0T+0SqyCjIIlC2cXIe35wgDArbt5A2KxHyEeC6P667RvSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396531; c=relaxed/simple;
	bh=osJ1peGPbLMwCs9cQfspS5sCiI02TKIU/UTXsG1stLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kiI+JITBPeup3fjGgDHSVeKLP7Fn0joyCCa1zIgPCtbrfPLi1z7fXjVHC4QBU24TspJtBuWz+L7N7jXO4QYOzlr7GmbaBq6DHYez9hBj7W3NsvpoZ+Yx1hWE72dgzeEf1IfXHVcueShzHpz0Bq86dNGECGFSHtdQL7SmEEdD3Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o008IBn9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o008IBn9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26F57C2BCF7;
	Mon, 19 Oct 2026 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792396531;
	bh=osJ1peGPbLMwCs9cQfspS5sCiI02TKIU/UTXsG1stLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o008IBn9QC9B92fTuAomiHsfGAyuviPWxUjXV7U22MJ5XgHPyQYiFxQT4R7saGh6A
	 qtpaYYbN24XF1favmYu4OLQpkbeHXHAWkabsNxzj9t4AOQz5whMEABSFYE4qqeiaii
	 yP+E/j2tnaUqs3lN9UqP8He6s2JEsDQTfnyU8BiGZxNYdXeEFQn2ZOcc9O3nzp2YpV
	 uuSyRAt4lvHfp12GX4WtxVjrr1rVIl4YYZKFYjf1ENCtG1RmeCsRxR/OSY/Krwy2if
	 4SO97s3gIMctJSVCdonBahRynqnFsGFuDCbJ2bOpWi1CaeMWkhcsHXbQbaxUa6GQ6C
	 f8cLvJUL5lhyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119F1CCF2E0;
	Mon, 19 Oct 2026 07:55:31 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Mon, 19 Oct 2026 15:55:28 +0800
Subject: [PATCH v4 4/7] dt-bindings: timer: Add UltraRISC DP1000 CLINT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-ultrarisc-dts-v4-4-3979747cda2e@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792396528; l=964;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=H5nCeqGhgsZIHGD5OQKUEdhmWR2MLVPLwQY1q4JBFrk=;
 b=2AAvX3YsrTx41MJsbYQESKdGB1wnaC3IZ7ilUEYG3e3X8aemF/joCSGGSlPgXh68bhSOdnUYq
 VaOz0Sa8uKJBZZOhnm8dgZKG4+h2rJRRiGh4qrgK1AtFyOaPyrEUYPG
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Add compatible string for UltraRISC DP1000 CLINT.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..878f267d089b 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -40,6 +40,7 @@ properties:
               - starfive,jh8100-clint   # StarFive JH8100
               - starfive,jhb100-clint   # StarFive JHB100
               - tenstorrent,blackhole-clint # Tenstorrent Blackhole
+              - ultrarisc,dp1000-clint  # UltraRISC DP1000
           - const: sifive,clint0        # SiFive CLINT v0 IP block
       - items:
           - {}

-- 
2.34.1


