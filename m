Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D3C3E9C05;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763286; cv=none; b=l/h/SH7vQygqXUSW4g5+PRfcu6qgEMTIPGGMjqlDHxsMaccUpRZ6/CGDQ+srvZIIQWEf7KNgpBPYq5bEncAhocOzMxYNDz4vlSMbBvPR0NlSg0sk7xfNUwZRYazkopalqxG9y4Bbrw8wNuL9RzGgpEhQ43+1mPmBYM/lmZDzt8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763286; c=relaxed/simple;
	bh=ZIK0xCkexQBqyQJA96xFqjCpNT9qXiTKF+FxrGI34Pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W7Fuw0c4ah91jl3u//xnFjxnhIh7GQXB6pABBqswdXQCPSBNbeIYqodPEtN2dYRsOeE3174JJC6jT15Wlb9FMFab1yA3urRly74xcebdLz1jpaqhAOF3R131CKb4VCFV9bhS7UjSjn3BLKzYMIuA+71Drq97k+jaoxPR0k3ov5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWFgsGtg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWFgsGtg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B1C6C4AF14;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790763286;
	bh=ZIK0xCkexQBqyQJA96xFqjCpNT9qXiTKF+FxrGI34Pk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gWFgsGtgDJuUZLReQVjIFnbU3pZqrkWc/c4PksKTHTOC6jOH2kUv9iHmqrwb0QtG+
	 GxFcfry+GkkbhVX8h1t3eNR7c8tt57Yy+O7c+LuyQUhQdWEiB1SntMwifnhOXgVX3c
	 mhGuteI/3splkI0Vop46/FGH7Tf5pzJ3kT/vKtpn1DGMnnDAsx8D1MYy7jD08TtIdb
	 N2uYWzE/Wg2aDZd/r8VJN6hmB1eLA8V2k1Xs6p4SIK+St+MV7O/2KuDYWlYG8h/aHe
	 /X1Tbz4OvJqygzhSEuDwofje5ZGEBaURyHgam4pU1hz1DcSZRM08+i4eB20/6V97sS
	 C6kQZzwYjNrBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2D2CA5FB1;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 30 Sep 2026 13:14:27 +0300
Subject: [PATCH v5 1/4] dt-bindings: nvmem: mediatek: efuse: add mt6572
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-6572-nvmem-v5-1-384d2a3a1770@protonmail.com>
References: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
In-Reply-To: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790763284; l=1140;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=5K32Q1swD4S3cSggeXC/0toQquH0mxZvBxfpkIPi+IU=;
 b=M5/+WU7HpaDQSfcWxQZiRaA9XqEdJXJUf99cACRJWf9sFJsmkIkc1oQnfBjYsGTIQgqAQypN8
 aQWVac7lxewCQy2A12P9ZVN2Dij1muWKQwR7Zu0KCJX72yqllDEF1UO
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC efuse controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


