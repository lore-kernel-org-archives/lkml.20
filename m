Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5119548AE1F;
	Fri, 11 Sep 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134519; cv=none; b=Mq62KZnGsbUfXA89LelrE1TaiQtZTzBE6+hnKVxH5gfsk/TOOsEq15T6wMWs/XZBnA3CxeSjF7czf1glsWmoB9fhCIuBcjMLMclPNWgbkbtpy2XpYX+rc5a3VFUDBZ1JGQWg4ylc/e7LINhdRzefccXALUqBOTBK6+eWHaE+mgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134519; c=relaxed/simple;
	bh=3UBksvgt/qdlKN1s8FeogwlZOBzUwTUkG2h4TW5YjRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbIPtUn/LBj1Si5vPUOPadhkHqLx1uzRzDVxCCx10pGQiqRw1I07j6+u/FsGffz58EUegSyLox5shIPEBlEZxW1bZO6G2evGslckD5ZS5KLbx4ScytsiMY5MWv67WG+y4vmqVzfGgtNxtV/m8WFr4u2qa2iUtsSRvixBx2K/VUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgDLv0gE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgDLv0gE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA51FC2BCF5;
	Fri, 11 Sep 2026 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789134517;
	bh=3UBksvgt/qdlKN1s8FeogwlZOBzUwTUkG2h4TW5YjRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cgDLv0gENhV7b5EzTV5zbTjeUAp+6xlsscIn19l/Q+ZDqKbaf094/wZ3EGRZMe0Mg
	 dKZ/iq5ytadP7Db0ieq8Mv4yGgyYUNc5ojlnbGaLaFtyl8td7wiLeQu9PvV1vfa25I
	 eibb+mt9No6Z1GJsEVN9zbtATDgebuz7CehJ4OB5Z36cslv690ec5nVZy4ZaAprZZh
	 WrwlV/AM6a0Fz41/Qec0ejjRV92YFtCxwlqGetdZYgLfGm16nW2QQw6TYgspqCDF7c
	 FS/m0i75QmdEKCmhBTEpTTJUoGs9ULINowXn+etcaH104nnM1nuzX8bgrSWQD1k2uo
	 VyC/U8cFgGvvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97CCC88E45;
	Fri, 11 Sep 2026 13:48:37 +0000 (UTC)
From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado_via_B4_Relay?= <devnull+jcarlosgl96.proton.me@kernel.org>
Date: Fri, 11 Sep 2026 15:48:37 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add SPC Glee 10.1 A64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-b4-spc-glee-a64-v1-v2-1-ed0b7ff02e0b@proton.me>
References: <20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@proton.me>
In-Reply-To: <20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789134516; l=1619;
 i=jcarlosgl96@proton.me; s=20260906; h=from:subject:message-id;
 bh=Xzdem3/+TDF7+9mo+NvDiiNz7PMRPxV5UR/Ew2LHb1M=;
 b=YK4WUVsNgqCrbxbQjewYp5t3YdnZ0R53TOZ9mwRj/PuFL8VHGh+KG2mjM7I4sg9EBbzfI5fkH
 N34XWTWhC0BBDG8xkngZKdCmCbrwwK7TrH8DOmzZarDMztSTfI5E8Cp
X-Developer-Key: i=jcarlosgl96@proton.me; a=ed25519;
 pk=2/GzZfrbHAiuUrsA5A4A9ixfHKnypfDfzyE+fToY4Io=
X-Endpoint-Received: by B4 Relay for jcarlosgl96@proton.me/20260906 with
 auth_id=1008
X-Original-From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
Reply-To: jcarlosgl96@proton.me

From: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>

Add the Smart Products Connection vendor prefix and the board
compatible for the SPC Glee 10.1 tablet based on the Allwinner A64.

Signed-off-by: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml       | 5 +++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..459a1772d 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -902,6 +902,11 @@ properties:
           - const: allwinner,suniv-f1c200s
           - const: allwinner,suniv-f1c100s
 
+      - description: SPC Glee 10.1 A64 tablet
+        items:
+          - const: onspc,glee-10-1-a64
+          - const: allwinner,sun50i-a64
+
       - description: SL631 Action Camera with IMX179
         items:
           - const: allwinner,sl631-imx179
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..9d864dc56 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1253,6 +1253,8 @@ patternProperties:
     description: Onion Corporation
   "^onnn,.*":
     description: ON Semiconductor Corp.
+  "^onspc,.*":
+    description: Smart Products Connection S.A.
   "^ontat,.*":
     description: On Tat Industrial Company
   "^opalkelly,.*":

-- 
2.55.0


