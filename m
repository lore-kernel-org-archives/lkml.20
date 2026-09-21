Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D8D4A2617;
	Mon, 21 Sep 2026 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001371; cv=none; b=ITzUgttRyNYKNIzExWiq2f3zQ04eVrAcL1qQw3yRA6Jb7n+8bDbNUH0XYlRCxckZ3oIEvuQ+Cg5ch69mdcDysRs8BjWY3Ar74ix21vIv4O+Ts/+yMjSjwqO87UJvoxJYJVJ8WdKesfXvXgTywz/lux4yyJoWb1+bjUprZuiwoKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001371; c=relaxed/simple;
	bh=ZIK0xCkexQBqyQJA96xFqjCpNT9qXiTKF+FxrGI34Pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvX0Xp0cJWMhuQG481zUT1bUMd/gY2z/7SrisJfsuIWpToFOo066AUvklps/j4FRD0iRsXncHXwU4MN1LitnZd3ms+OQZMZ3e4QLoeg6VZDB5kseCHVFoizfmDLzERLiTWHMB7WzYH3hgGr20lWgCsK9+mi5cairOA7GJa+Tpek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r05i/Pej; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r05i/Pej"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9E04C2BCB8;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790001370;
	bh=ZIK0xCkexQBqyQJA96xFqjCpNT9qXiTKF+FxrGI34Pk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r05i/PejEXJfMAmTiMpbQ7/UfVCxSSEuKOGtiDxwd0JxdoDdbECGC3fpYHhVXOws0
	 J5CKtVmfMwXXe7EuvQjVsYm4MZj3kmTuGDHy0RrqmTspNWJu8Nn7LIHA+hH2tMnXRi
	 OxQY0RxbaUxXsGiRYPotTUtgHQhW7nnO271bchKy31D1tykTS9/OGYzijRoLSvDRiH
	 TqLEdl5CNDOqqMy+sSoZHFCT6IzDI9ibqTSvO0w2I9+jVJavHM3wWP1fMHOt6veFQD
	 wJU2rTRNQIhw+OvIhnEU7w4gMxQPbsI38/62ZhAQgfA7V0MwyMlM2/X86inCjfJCSU
	 Rg0CCJmgdkzWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C93C982EE;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 21 Sep 2026 17:35:47 +0300
Subject: [PATCH v4 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-6572-nvmem-v4-1-e9c14156559a@protonmail.com>
References: <20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com>
In-Reply-To: <20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790001369; l=1140;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=5K32Q1swD4S3cSggeXC/0toQquH0mxZvBxfpkIPi+IU=;
 b=vN0LQ6RrUvamCnJ3YNAb1NmCBNxWbR1qb6O4xG+Yo+hFue9REj1sTD2uAKhHpARSpX17c7SlD
 0GPpYNQY6z6DrrpgVXrJH+q+uTxZ8jnCorvR57pliwVopbBLWNkC9Yp
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


