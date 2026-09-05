Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E2D3749EE;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600558; cv=none; b=JwTLLCeQmzvHaEWzWyXQ3sJiAMzcnuOkJgTdNSnFjurp1xQ177Q//jeeWGQJDGQNkyD5gNtXWC3iv/b9u87vKnyf4qJ9XAp1CKOezRF8Z45mVmbJgjmjGxi2EMl9MaKnM9cbxiYAHAK7THjpfLw2VIcqswZ/aBEJqrMfUUR+l30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600558; c=relaxed/simple;
	bh=oYMSeKSSRPOwVNZyrMxChpon317pqUx6F+nG0pIu0Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A28z3iWGjhd5mZdKqwy55OgVPTNh5jhrnGITQc2IGWEr0T2NnXxwtmL9ixGNx/fksByqco2L5qkYH9h9/u19E5PQ0U0hXHC42I2ZmKbB8VGLoSMSnnPccM5BU9XvEkUWX913lu6RJxEnU/d5nEl96ysBq5mS2uWGHx4AiTFW8YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/6WabJ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/6WabJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96348C2BCFA;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788600557;
	bh=oYMSeKSSRPOwVNZyrMxChpon317pqUx6F+nG0pIu0Ws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R/6WabJ14JM156cY4TWjPE3Bb7LI+kNGQj+j8V4lBTParwsMeVZejIZjax0Yd1y2T
	 69JyAiui7xQoGYx+QIJQtIcMtZbkmCY7OTAS1CnTmBc/24A5AzHk0QeZKFSDvmOj24
	 DRKXPs2jwetBpoQ85A/bK9BySdliRrWSLUlRpqlt7cMMfKRHp2JquuKLRkTkzhEex2
	 SxDBrc0zcPU3aErlXe5Yw6Z+ZpgTJvx2igSjMEx5YbPIXv2TpewyMwuhrZKBJ+WTuR
	 57oy2ds/g40B7sTYzMiEiaFzz81otUXAK7zFhsO1P9SA4Bt4sbRY8xH3hYStJNUasu
	 O5E+LNFxbwJzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B33C624D6;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 05 Sep 2026 11:28:56 +0200
Subject: [PATCH 1/7] dt-bindings: arm: qcom: Distinguish IdeaCentre Mini
 01Q8X10 SKUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-x1-ideacentre-mini-prettify-v1-1-9a87882973bb@oldschoolsolutions.biz>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788600555; l=1987;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=et/ZQ7VNffXkfxW74a3PzNDQBmP6roSPIOtf9Akxd2U=;
 b=i9RasyOfjLW5VQKkFUupfbfgBfqoDlYao0yl6JDn7ldeGqFEa4ttI1qO3wz+mnQ7s2eXejbaK
 B3yflsXLvZsDisRLDBJfF17MwSuaqGOmLD0eS+YJniM3QJfTKv7PePm
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The Lenovo IdeaCentre Mini 01Q8X10 exists on both X1E80100 (Hamoa) and
X1P42100 (Purwa). A single two-entry compatible cannot tell those
device trees apart.

Move the board out of the generic X1E80100 enum and document two
three-entry lists:

  lenovo,hamoa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
  qcom,x1e80100

  lenovo,purwa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
  qcom,x1p42100

Assisted-by: Grok 4.5 (xAI)
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5ccb571520d1d..4d6f561a8cac0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1180,6 +1180,11 @@ properties:
           - const: qcom,x1e001de
           - const: qcom,x1e80100
 
+      - items:
+          - const: lenovo,hamoa-ideacentre-mini-01q8x10
+          - const: lenovo,ideacentre-mini-01q8x10
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - lenovo,thinkpad-t14s-lcd
@@ -1211,7 +1216,6 @@ properties:
               - honor,magicbook-art-14-snapdragon
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
-              - lenovo,ideacentre-mini-01q8x10
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15
@@ -1230,6 +1234,11 @@ properties:
           - const: microsoft,denali
           - const: qcom,x1e80100
 
+      - items:
+          - const: lenovo,purwa-ideacentre-mini-01q8x10
+          - const: lenovo,ideacentre-mini-01q8x10
+          - const: qcom,x1p42100
+
       - items:
           - const: microsoft,surface-pro-12in
           - const: qcom,x1p42100

-- 
2.53.0


