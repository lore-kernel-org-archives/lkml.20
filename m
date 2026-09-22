Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD63535FD6;
	Tue, 22 Sep 2026 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073403; cv=none; b=HV1N+vtVKw0IWTr/Y6Shato2H/tkwZtM+g/zPQT4VkmGrzzbaB0BljwwMd5dgUYTzwAe75f0xTxFq6/ix7kd+4H0aZeZcN3egGXYntTlqZ/TTZUKqNH3pje9zc+lfuezjlS18V6GkDDBF4YPGmHlEBxm+W3ZnxlEDPtVKHhtR7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073403; c=relaxed/simple;
	bh=dDQekg1LQlY6rPoeTkrWeGq/YZnkxUkZ48YS2x0iegc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrTJA0kn+JT1rm8uYRG3WAeAQE1jTDLZwORGg+Q9a+1uN/rZCzh3NF+9fPBvWK8Pd3JRc4N/8rKO1Cr2pnYvWg4WLwk2FZnW6Cb23e3X3ybC9yA1F910RLkYTRchc+YVSI6RSJXmI06YMdPONn5HSdz2vKBjZBVaWUsGiNFHOEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOBPMOzR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOBPMOzR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA7D4C2BCFB;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790073402;
	bh=dDQekg1LQlY6rPoeTkrWeGq/YZnkxUkZ48YS2x0iegc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iOBPMOzRtTyRPfojvnBiE1w9TXJLQrrlHasnxGlUnzJi8vn0btL1oqHASMoExQJek
	 bmuil3fJVLZ/pZdnnc70aBDduGLiTTZPG3TIkcWA47PkbfDY9Qca1+1/5o0CeW0sYK
	 2CRhHvoJhbOeyGe2nDfc3vUymWbj+UgqIJJF6DOb9vDgq78E6v16fnL+URPFZQVAJz
	 AlIMC4BYvUwNZO4d3sepbnrOODCQDqpPYsD+6ccMElz0obEoU/6XP8oE9jymhztUCE
	 IqdqwOaUDPYxn8klqh5L38fjMO7QWvJ9ToFPFrzFDHMFnqNdwUIqx41RC0BDvv2Lh4
	 iWlfy20mcfOvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A682C982FF;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 22 Sep 2026 13:36:40 +0300
Subject: [PATCH v2 1/3] dt-bindings: usb: mtu3: add mt6595
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-6595-mtu3-v2-1-71203a362b36@protonmail.com>
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
In-Reply-To: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073400; l=868;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=0Wzms1rnoBQB2Z9NCd6dczMgNHErrKSjaFIHZnHiWu8=;
 b=u+zdx4TMBsgbMFqD4aogBqgvtNP2oLM0oap1dKWP/exd0ovNr63e4qRznv6SGBHlXhr73Y/qr
 e9yj169YIX8DiJ5Itz5VHLQjjySdfwzg22yP/gNw9Rt9Vhx5seUMy8D
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 21fc6bbe954f..4538df164a16 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - mediatek,mt2712-mtu3
+          - mediatek,mt6595-mtu3
           - mediatek,mt8173-mtu3
           - mediatek,mt8183-mtu3
           - mediatek,mt8186-mtu3

-- 
2.55.0


