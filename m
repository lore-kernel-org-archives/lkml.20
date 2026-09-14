Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882E6472543;
	Mon, 14 Sep 2026 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392910; cv=none; b=vFYrDuNOfjupPOaPQe9bI/dzuA3u17M79HUzxk31p6L2opUw3q8Q3qsRHfV3TnNO39rawufTVLnQaj+zZMP8/y9IEjGIFP8j3C6I2ocgu/0uVAhkbxU7JBS1anBNv2c8bDpKEB33pJJJWpXnKfcGaHGsmBIW/POP7yFyZwonloQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392910; c=relaxed/simple;
	bh=SkfaGXmQEY5xHBDu4QnDfNDV0wqVF01smR5fjT/K4uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ntm9VZts1vdepVyBsKAJ0V8mtBnxf6t25gHnH2x0nHXMMtMlUp+14AsA9/RgIhB3/cF3JGCVUaMy02/TpdNi2wYDVAg83Uc1WWTsuuaOi5RqdOLZooZzoAiKwny53nwWbnWJOtJ8aaVyBy4v1Ej5fpZ79tPKB9WQ3KRxGM1PWMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLqDDLlr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLqDDLlr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23F4EC2BCFA;
	Mon, 14 Sep 2026 13:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789392910;
	bh=SkfaGXmQEY5xHBDu4QnDfNDV0wqVF01smR5fjT/K4uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LLqDDLlrULmcvs6aYTI19vZaNm15qYtWstADfX02PkphnDL8W2nTDX3C3LRH9xUH3
	 LlM/Q7rXou9aqPMmcoW6s1B3dpfb7qriwXWxvDk91R03fjbD9hTEJHmYebivb6eaRs
	 g69GW+DuM6XL4/m1W+y+fruAGbs9ON163U+ZoGWIetqUXIJhFS1ay9c1LxwXqtUuFq
	 ChJFphmUMix4xrnLQp+aWm+Mq4cNnqcyJkoR8rZBmu4uVfdA+dWnpY0K1VRKFhj50n
	 O9mOXpj1VOgKFZs7OG+Q5qxW22RGF/BOQ3EBtvn3EWUgq6/KZl/71iBpT0WLIbMt31
	 y9r3dSdGOcyzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A7CC88E70;
	Mon, 14 Sep 2026 13:35:09 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Mon, 14 Sep 2026 21:35:01 +0800
Subject: [PATCH v6 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-r28s-upstream-v6-1-ea9edd75c126@proton.me>
References: <20260914-r28s-upstream-v6-0-ea9edd75c126@proton.me>
In-Reply-To: <20260914-r28s-upstream-v6-0-ea9edd75c126@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>, 
 jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=ukrn4M7rYY+NNZWj9jv6eu5CXunQ4mtIC9zTzcL2LVQ=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzlP3ikwhaf+PBurlFc2vzoaGZHoR0X+JzOfzVMiy80t
 7qSFLKto5SFQYyLQVZMkUV2U3Wk0KromUUsUsdh5rAygQxh4OIUgIncOsjwP3o7+90Irp9fmBwr
 rpdKWN55uTlaxqxFYKLZq+lTrx5vNmb4n8DkmH93sv6WTDEuj6u6lX3luz/9Ytu0zmXCjpP/dB0
 O8AIA
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Reply-To: HystericalDragons@proton.me

From: 安容 <HystericalDragons@proton.me>

The NanoPi R28S is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC. It shares its base devicetree with the NanoPi
Zero2, so list both boards in a single entry.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 81744fbee9..dc04946db0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -347,6 +347,13 @@ properties:
               - friendlyarm,nanopi-r2s-plus
           - const: rockchip,rk3328
 
+      - description: FriendlyElec NanoPi R28S/Zero2
+        items:
+          - enum:
+              - friendlyarm,nanopi-r28s
+              - friendlyarm,nanopi-zero2
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPi R3S
         items:
           - const: friendlyarm,nanopi-r3s
@@ -388,11 +395,6 @@ properties:
           - const: friendlyarm,nanopi-r76s
           - const: rockchip,rk3576
 
-      - description: FriendlyElec NanoPi Zero2
-        items:
-          - const: friendlyarm,nanopi-zero2
-          - const: rockchip,rk3528
-
       - description: FriendlyElec NanoPC T6 series boards
         items:
           - enum:

-- 
2.55.0


