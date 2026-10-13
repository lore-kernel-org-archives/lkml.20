Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A9519928;
	Tue, 13 Oct 2026 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913590; cv=none; b=osoVhuBVmXooF8ndzGEoprdL/p+9RzkqBbbYeCi1AX70cSvWn1E195xdHPNzp2m/BN7jUPU5vfobErc3KDaIH/Pcp0vH3LZctyDt+L3OJQuzvCi89CG0yn3n9Fg6WCgt9XkQRWG/SVzRfJS4M07wlycsXrj4hpZGllOywyBHapM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913590; c=relaxed/simple;
	bh=vf5ncqnzFHEa2zJ+HjrFKRIj4lljiqdUitPFf/ueiKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YNUJbOk11eYt/X9qSkotqHVs2lEKEVG8OaY+E1x+JwrBlJREVUTbNVT7mHBVzrVenSSHUXQP6oQzViMMJKveRXi9G6xZ7FznqsOQpAuRqf/TfNl/kdq+4gINWmmDLdPuQXxOvkAu32hqewmjLkxbVfbp7UEgVtvqrMnwF3LEMvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwvZ+S1z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwvZ+S1z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9BF7C2BCF4;
	Tue, 13 Oct 2026 17:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791913589;
	bh=vf5ncqnzFHEa2zJ+HjrFKRIj4lljiqdUitPFf/ueiKw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NwvZ+S1zhrkAFjjsHPO3ANhKdXEBDnT61VBKD9yki4/a8QRFw6WoCDW9kC8fnsQwe
	 tpHx73D5FsFpLRFoX//Pv4HEpzvUwaICwC7IbhZNXuBF7asOGfyDM9Tf095SVXXr7L
	 R3Dg2cLhh6+XqGruZ2dNboo9JnPc8Fn4RO5FUeU/c7Sy/84+O+w98nm/xUGjoWk8Wo
	 jS3WjWJXl6L1CfGDsS4yEvl5nKoc6NMtVLlRd/JHbYCiupBdxLwzMujvmpuFH/bWUa
	 O+c/ZhLcs++eSXHQngQz3bvWH6yQDMNQdDJqQDsOOP1e6Pq/CbQsgbpcjsSweG0psQ
	 l9JCH9HrqdT3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B143CCC6B1A;
	Tue, 13 Oct 2026 17:46:29 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Wed, 14 Oct 2026 01:46:00 +0800
Subject: [PATCH] dt-bindings: vendor-prefixes: add Ambarella
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-cv75-prefix-v1-1-fe95ed567880@ambarella.com>
X-B4-Tracking: v=1; b=H4sIAFduzmoC/yWNzQ5AMBCEX0X2rEnb+H8VcaAW64B0ESJ9dy3Hb
 zLzzQOMlpChih6weBLTunhQcQRmapcRBfWeQUudKakSYc48FZvFgS6RYNEpI9u81yX4xR9/trr
 5mY9uRrMHRWhMxPtq73DnnHsB9JFY7H4AAAA=
X-Change-ID: 20261014-cv75-prefix-4e8b1c0a7d29
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <zl020895@163.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791913588; l=1442;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=/DBR6bJT9D7LQ4feEnzdAHUOtPgBVZpuVoWKIq8de8w=;
 b=HBTRhm1gjTs0qja+wL9IWY5zHWPD46YwsAvZnu/RgayZpaETzqhNCbT/WnJiPVMaJ1ei6l9jB
 fg7IHg6aixqDT7SzNh1RugYBMhIAO1DzAsf8+WUFzXRG3bz2EQtMb2J
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Document the Ambarella, Inc. vendor prefix so Ambarella DT bindings
can be applied without waiting for the SoC series.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Long Zhao <longzhao@ambarella.com>
Cc: Long Zhao <zl020895@163.com>
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 85a27937832e..f48aa6dabbe9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -112,6 +112,8 @@ patternProperties:
     description: Amarula Solutions
   "^amazon,.*":
     description: Amazon.com, Inc.
+  "^ambarella,.*":
+    description: Ambarella, Inc.
   "^amcc,.*":
     description: Applied Micro Circuits Corporation (APM, formally AMCC)
   "^amd,.*":

---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20261014-cv75-prefix-4e8b1c0a7d29

Best regards,
--  
Long Zhao <longzhao@ambarella.com>


