Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A2D231836;
	Sun,  6 Sep 2026 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788697367; cv=none; b=JF/PiJQcMtaeQ673uceviu0JqOO2RSrVkQUUQnvLD4U1vYdKTdlQjrCyO963bG6YQv2dUq6+hsYbrUqYd2WgRg12N18gd+umVOQB9xg+8Ezot4QmPd8dwtaJiYpEDqD49AisqjzTFuRicLO+Z8UDu53uBbzcBx5y/AXSUFEciKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788697367; c=relaxed/simple;
	bh=yjyDtbIecIprmCL8fFazu5hNHhPVthRdzMRoYqh/57E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bc3Hm3ZYFCdZdadd6HWKTYEjI5iNo3xAb01eP76znenAN2CAU5ACtAU0qLTSHpWPElmxxcmBjpDkWFmdFVwjBJ21OHcW8WhjHQVdTK7v64N+c35iJ8uMPsIknG/1tF+av7bm/fbWSrocg30BwCrSKjrTPUsGTQltfGWs3j+S6oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5BE9uis; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5BE9uis"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FC77C2BCFD;
	Sun,  6 Sep 2026 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788697367;
	bh=yjyDtbIecIprmCL8fFazu5hNHhPVthRdzMRoYqh/57E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z5BE9uisKF2pU24h3aVy2m45nmq/RnIeZ7iGTs/4WbvxIJUfsz1SV26gkAj/insry
	 JKAFcGh4AfHnAP/yJb7teB2pyMqufbp08LmDnPRqZ3AfHfKphwpTS3xdRyBngpFtH7
	 hF/G6MGIgv6qrd50G41uecCxX2xQBVco030Q7dixRW3bC7r/p20eq3/eLTNTl8wzFl
	 XJFha2Zz0Bn8cBcq/VJEeWo67Dmvj2k/QKuZs8L9w3pZcxzWdfl8rA8zYUgL4Bj0N4
	 eW59yPn8dcD845lR46kLRXRLl3ud/aCLaxd6kOeE2LGAN0u4IfhmD/5wHzHrapNPbE
	 Y4JHaXZih/NSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06219C79F99;
	Sun,  6 Sep 2026 12:22:47 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 06 Sep 2026 14:22:36 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Lenovo Ideapad Slim 5
 variants
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1-ideapad-slim5x-v1-1-7ccffbe6bc4a@oldschoolsolutions.biz>
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
In-Reply-To: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788697362; l=1259;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=MOSjjYpfBBIQPVl/BSuVZwV6HsAN8S+mDS114WZka/8=;
 b=Gx0SpB6xcZvE/6QipUjHyt8CoMyDq4M9OdImzrUBHT7f5ziP7Rq/srxtiSawCgCyYr2TJCXeK
 S/sBD+Xo/XPAh9LG4aYyVInEvbFRug75UcUKXBkmTmMxGsxGFLFmeBg
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Document the Lenovo IdeaPad Slim 5x 14Q8X9 (machine type 83HL),
a Snapdragon X Plus X1P42100 (Purwa) clamshell.

The chassis is sold with either an LCD panel that needs a PWM
backlight or an OLED panel that does not, so give each SKU its
own compatible. Also add a generic "lenovo,ideapad-5" fallback
for drivers that match a whole family, such as the QSEECOM
allowlist.

Assisted-by: Grok 4.5 (xAI)
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5ccb571520d1d..da72181b55e2a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1247,6 +1247,13 @@ properties:
           - const: asus,zenbook-a14-ux3407qa
           - const: qcom,x1p42100
 
+      - items:
+          - enum:
+              - lenovo,ideapad-slim5x-lcd
+              - lenovo,ideapad-slim5x-oled
+          - const: lenovo,ideapad-5
+          - const: qcom,x1p42100
+
       - items:
           - enum:
               - asus,vivobook-s15-x1p4

-- 
2.53.0


