Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CE3264D4;
	Thu, 24 Sep 2026 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242755; cv=none; b=k9c0XNNqwVAdq78a5we+BhwPHdRzwxdpXnA5v/LdCo64u+bsbkn0oz0UKAaIVG3ugRyG/1QlIBPsu1bHEbndMsha9yYpC/A7gJ3SJlFngKpbYwGC6b3iGjeyihIqjjJujoL97R2Ds0bODJAYcutIPvoKwlvfA2N7BfcF52MUPN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242755; c=relaxed/simple;
	bh=bT2W1UDZF4zdPaoV4uUSUjqsSdEIUuEZX91HiXXbM3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcsUVYaokQxnswgenu81H+mB1n6JQJ8rwN5MNgR5xoHcIb3KjbL91hK5IzG4SvjG3JhjrDYQd50xomr59lyx0kOdogVFBrDWDkCKZTA95H/Ttl5u1oe1+0kzSgUe4fQMAC4YgOerUyEOCPwGgU8PYZ6jY2nWVH8VUNgsBujkS4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heZJ5oIS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heZJ5oIS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3F57C2BCF5;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790242754;
	bh=bT2W1UDZF4zdPaoV4uUSUjqsSdEIUuEZX91HiXXbM3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=heZJ5oISsm99AdOvdPiYsZstT5Yc3rpzFpCmQhUcmPum1jmT1hfNx95XxQVLy/ATD
	 XzOmTBz0N5qNk3czuJ1PFUtMcxGGt1XMsdxg9i58LLtfS00nh74IjmaBdMb77aAzU9
	 GEQO/PV+UbeGFZvM+r3KKSuIziPhXJsCA9cuyGdGMXaGKQ83mB1inDcDg189XFRaOD
	 M2Gi6iHcxAzzUjJ6OPNiGcsl01NWYI9349Y/bSlbrVfoGbRsC/McSNv83u5o3oqlam
	 HI9vThN3B2nXSFDcevgr1RzZktbRxqmhYkEQv9IttsXP6UpFahOWTEQapFTRstqZJZ
	 h0Ku5zYDGTWZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA380C98311;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 24 Sep 2026 12:38:30 +0300
Subject: [PATCH v3 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-6572-pwrap-v3-1-64769b6446ac@protonmail.com>
References: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
In-Reply-To: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790242752; l=991;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=uNVyUZDV8R4iF2b6R4zcLD0vBmolhtFBIa0lDNJRWD4=;
 b=ftKlSyYqYUwhwaHAhRGBN11hEB23eQMqN7A1kzia/kjMRE6hb3OiWVgCC/d6sPjxSDM0ciaMo
 NNpAy1U0jB6A2Yb5KlDkCS16tkgWUftcpAvI7Ai31nkUpFNR9Wp1flX
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..a3cf11153fba 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6572-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap

-- 
2.55.0


