Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A69153A8BC;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950983; cv=none; b=DklrKcsN5z1tqutV4/vPKI2bPNFagxgrJfg+Hi94vXqusE6d9lchFuyb4dtauHdUNIxRXOMz8y6B9A+vFt4SR94ON05kzfN2N1XB2IY99EgmPERJRGOfmAsxH/sBh0YfxOosXKdULEj7Z2s9602Vam2qg6Rw4D5x/j9Vhu5K24o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950983; c=relaxed/simple;
	bh=OselYV9Z79ga+Tc9lAyWGhBokVgW3jNj53PuyfqBRz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMMvXIYR/RN6CFyiOMe/gVNhOtWn7ZcNzx/Fz6uBqWKiiLep/U7Oq/w940+Ecc6HD0zmfDVsg3+UraVp1KyUHgixnxobZEa9VEtdYAyHCtAlJ/92SnWLybNvYTam4rBSj1XjkjqD1c9/+SiyEOtCYrHuUJ/KfEPglYUDN202hmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVFabxpe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVFabxpe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11957C2BCF5;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788950983;
	bh=OselYV9Z79ga+Tc9lAyWGhBokVgW3jNj53PuyfqBRz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pVFabxpeuid4J1XDLcZ8yOhWwD1/XLnDCbhlC1MT9qAQ0FDMHgtQK8OivDatQ1q4j
	 NEbabWkF9dm9tePDd8VGGhdOiR8MZRwQdCr7ECWY31IrxIEFYeBTl3kKgLCMSgn5at
	 GcCqvwCfTUw27Cl0H1c343pAHSacObNy8RE7t2t1clzxn4qEifslrCx89mG10ZSW8Z
	 BDQsImbM3oKZvtjDm5slSClAkSdGnd0h6qF0Fk7KarnNIZiqAg612d2qo8KwKiTzSB
	 DddMCr+843lxBv4591jU66WKAMZ9WpyvE6jOL4IFWjAG8n1nJPSP//KGxEwUTyw7Nd
	 mDf2LMookHh2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69FFC79FB6;
	Wed,  9 Sep 2026 10:49:42 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 09 Sep 2026 13:48:50 +0300
Subject: [PATCH v3 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-6572-nvmem-v3-1-c0c441656431@protonmail.com>
References: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
In-Reply-To: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788950981; l=1057;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=t4yY7jNJW5Ruu7MkWUJRRcVwM0ArbnLdvtu2KDe4Mvo=;
 b=YvUkqieMw0zQ/HK0FnVLCruW13b9WxcWXKDU9gpaJfUQTM6+gZ3se4/2+kmSWJdnOxUpBsjmE
 3JB1XTr2O8jB/Sa4+zik77Z6vLNrvdJYig0Nn9s0keEaoE4wiavkAGH
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC efuse controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index f9323b3ecfc8..e10947164941 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -24,13 +24,16 @@ properties:
 
   compatible:
     oneOf:
+      - enum:
+          - mediatek,mt6572-efuse
+          - mediatek,mt8186-efuse
+
       - items:
           - enum:
               - mediatek,mt8188-efuse
               - mediatek,mt8189-efuse
               - mediatek,mt8196-efuse
           - const: mediatek,mt8186-efuse
-      - const: mediatek,mt8186-efuse
 
       - items:
           - enum:

-- 
2.55.0


