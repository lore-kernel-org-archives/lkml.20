Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793183933;
	b=yT9SQtUpUWpp2MDoSEbStZUeBrT22VHcLEaiofdQD77a6YFKk5su0dWjoa+cRuaN2tD+
	 W/fVTsG2Vxv5vQt1FP36RcnmyZE7qziNHVBz72wCpYqm/LHnnc3jehcns+KME5oN4dxKy
	 se0caAwkKWh4Z7KJuqZdkrtmCfb0PYL41wnGp5glI1e8ZizByBIpdUT8YK8XHpHWpyTkL
	 5BqZtab9+o7meBUKozUB47By4CRjUty15yDIL+5QbEbKtd0kN6cX9SQHoEB1UdwQCKWFY
	 VuZEdgr7q+b7btC4eSOPyYQAZvz+Ha0I9z3q2omOPRqUu6U3sJEOrwWkpwxuQjKeQsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183933;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZdBmqWoIAK9ETV7duLGYvvPktodYvBmwhRO6fWKb/58=;
	b=GGE8UNVvxss9z0aC62eFtwx0CZJxGKmZOVZYwJwabnLP0RLhEau9HhItuyVool8b0tY0
	 UCiqjlwRBYuOavAQQFIQyBuv5Pift1J/Hd5e9NG+OmuQrzZZvVjN3/raX9KqSjr8MniHW
	 mK3koyCpMF5IE5ypeIHxeXlWbf+rbmfDt9coEiBdmI351RbwW8Uek7KhuCwX/o++jVrlm
	 CKx4iLZHeBC50DdX7FIdLllRRoUsMzhHe3jDNV1Romf1b810sFhOKojq0LFuf29FWN/Cd
	 c1r5jmQgHqPfiCr3J5mo4tlrcwo52YJEB6gBE2NBFa7jqDip5kRG+ZOrQI/NUFLpO5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3w9YgKo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE464606A335;
	Wed, 28 Oct 2026 10:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3w9YgKo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793183932;
	b=EhL1DHN89Xor69V0rcIITDMbw0JCGkQNbnJkoWvZUQayU/5uYl4j/dIElebk5WJ7/hmN
	 vLP3+2JvI91fYxjL/LaQHbw/ubNfKhfpUmaOL/xBsyVQ1B0x914DcYtduCCIijm4+f3VH
	 KYixvD4kiRs4qnkAim7fPvgTw70x2v/mJ7d2aO9s33BTCTARvghBpyhs2e9avaXYGSvSE
	 alPgeqYxlSU+y74f3FvHO5QzsYaFJbC1BLq0g8QLPJ9LSK+E0cHTnwpLX2Dkh099ZapnC
	 EmweSYFdZwQCgYoChhhOTFyA0rvXWrwhl0Se55DlU4s3YVY80ZMP3edcG0F5oOA9Dvw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793183932;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZdBmqWoIAK9ETV7duLGYvvPktodYvBmwhRO6fWKb/58=;
	b=c7R3zws39ou45J7or2Lt3muyeUBoRZbqtU/TheChtlGJ3+/3an/QkozrQt1Lp+J/bBHo
	 uIRXxCsgYIcOtZA4GTRrZ6CUWPscAfsJuOswdKUk6wTxeJpDmE11iAI3lNiECL5dgxVcH
	 z+ugwBaxyAI7a+vALYiH8CBQPcj4rS0gQf/dKzqgogI9268MhVBsZMD1k/Y15xiGj7SqC
	 XKuDIcyJfuDLcQyplpjQ2DrYu3nFqYvuUAzDNxpkWA3ZW/HTjcYU3v+Y2ygqNilJeEHd1
	 R6iJh+lovZ49l2+1y9ByylWN4RBMuXYajT5OAA2oY0ufnBRjtSaKaOG5VyhAN6TybPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C8B51F031E2;
	Wed, 28 Oct 2026 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793183932;
	bh=ZdBmqWoIAK9ETV7duLGYvvPktodYvBmwhRO6fWKb/58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=B3w9YgKorUpNDB7XhiumFcHbaJMjjfgag6f1lx/BJYcGd7FHdPwYnCBAsrdm4V0d7
	 bQ9YwD7Q4TVvOVoZ4kAyvttMYtxCcrQpHIXJ0OI4UFLmi7k1FuXo/2J7mjr+ajxlJ1
	 WPneloPzL5Qb7bA2Gw7kpRJk8yxaRq1V/8COd4UTBdncP32LWaoaPUyHcAC8WA2ncR
	 ZUKdNuGE5Y/Y9Mi+0qn9XxXGSjUzPP6M73XdqYxHwtx4Q3TGVxBBx5bWmY0GKw2Z83
	 O4uxQ8XJbpfXJ4CVDfsE+TvetDdAuH/QAAosov5sMjSralzOtUawsjhDuNACtlid5X
	 bMwjpGW/3s7NA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 78836453CE;
	Wed, 28 Oct 2026 10:38:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 28 Oct 2026 12:37:50 +0200
Subject: [PATCH v4 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261028-6572-pwrap-v4-1-1780c58d2097@protonmail.com>
References: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
In-Reply-To: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
 soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183929; l=991;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=GreXcy6jnp+7uSBsM4HWautBYMOxxhKkXIgAc4qRklc=;
 b=Y6KcgZp/YNmbaIJLnybaz2481KbTtOyT3rLH/CfH6CTFlGkG/aJAaXieIrFxPDw5aOSBZe6aH
 Gm0EZjnBTd/DNMaXoCw9JcnypfFG3+vfRJvldQGcxJMrK7mAK511OU2
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com
Content-Transfer-Encoding: 7bit

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
2.56.0


