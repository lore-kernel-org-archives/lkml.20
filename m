Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7851245A2BB;
	Tue, 15 Sep 2026 20:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503655; cv=none; b=mXW0JddaIgxXRPu/zVLn/+WJJxfWHjU9bjiOtykGnZb0cv7y2+67cPH5FqIBLIFwahFNuCfW1dRNELh+GmHDCk0xId+jCwTvdlppo+hCNY3rvr3dfs2pOI73gCW0IX8I+sb+j/IUL+WnA0qwique7nsVOEke9c9w6tKCC9yu8lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503655; c=relaxed/simple;
	bh=cy6NnsJcH0jNfhQsnNyLRIM3THjaYMss2IiZOPpYDUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d0X4Ak/O+RqnrluJNthNRdRdkVqcrTAbFPLXolfUuSVx/TIxRsqU9hEfjqzLA6aMT18iQlK0ua6hxLjNVTO14Y791ESI7k2f8inlpTHXkKKFkMi/pGqZJuqUi10c2ScEvL+syq/5acQpbo8banrnS7bM/XQsAAtEgTpB1+vMWT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ogt5JmZr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ogt5JmZr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FCFCC2BCB8;
	Tue, 15 Sep 2026 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1789503655; bh=cy6NnsJcH0jNfhQsnNyLRIM3THjaYMss2IiZOPpYDUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ogt5JmZr2+bC8zTS+J4lU+R4lypuyK3alsxxAnc9QqBsLlkJN98uVNBJ/ma2FfiME
	 Hu8u49u24mplGfbK6pxw9zOE4gw0cyTx6DOJp1Bp/rlC7hzW9C2T7MxpbUke1TFWlS
	 eVRPaBLZxBHN02Y8K7lp4z3zRhHcRPRyGCZFS/G4=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F264AC88E77;
	Tue, 15 Sep 2026 20:20:54 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 15 Sep 2026 22:20:23 +0200
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add Vision Components
 GmbH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-vc-mipi-ctrl-v1-1-8a42b693d889@linux.dev>
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
In-Reply-To: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789503653; l=978;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=cy6NnsJcH0jNfhQsnNyLRIM3THjaYMss2IiZOPpYDUs=;
 b=Nq5t2AjUH7qMg4geKgmTyocO81gMyO8ukMpX6uhC4wfyNVte5YYuI52grFHXffNPo9ioy5wl3
 3XzREEVAISPD85LMzhwNKeJ658UQKGpkaewdQ5btcosPN8fWenA9xPU
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add vendor prefix for Vision Components GmbH, a manufacturer of camera
modules. The prefix will be used in the Vision Components MIPI Camera
Controller driver.

Link: https://www.vision-components.com
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693734..b853fb9338527 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1845,6 +1845,8 @@ patternProperties:
     description: Vishay Intertechnology, Inc
   "^visionox,.*":
     description: Visionox
+  "^vision-components,.*":
+    description: Vision Components GmbH
   "^vitesse,.*":
     description: Vitesse Semiconductor Corporation
   "^vivante,.*":

-- 
2.53.0


