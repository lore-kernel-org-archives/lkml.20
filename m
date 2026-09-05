Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B9748CD7A;
	Sat,  5 Sep 2026 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788607309; cv=none; b=BYURkknZEP/Ks1w2yFe8NZucmAJZsyAZ20oJ7OnKcknfZc1kW5K4cCTQcbAyj/GBM5fIpFe7OY5iuD3oSMhfxcVUbgI6jfkE8y1U+1IDkb/vHrY/kvd+S/cVSUR1pEiluGJpWP6Eb0csQOawslC23Ib7KRD/qzQh7xa9GgZXnkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788607309; c=relaxed/simple;
	bh=8Gwxp5aoWJUfNbbLdYN5LWeAcCfH1LcXcRH62cWgIps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DXi15pH/wLhH8Wqh3zN7Yh7S1CUwxIju+fxN+sCllun9BBcm1g6B8Mu6ha5IesXFAN7bTHdVbBGfDudKN5eFyR2BvQYb9TCcY1zAA3IuseuvRJcgLTOzwhaOoIALdxkIKadn621q5yvh1gqXgORzDOw7Mzj2ryFXszloZITSFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t69NQKl8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t69NQKl8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE2D7C4AF0B;
	Sat,  5 Sep 2026 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788607308;
	bh=8Gwxp5aoWJUfNbbLdYN5LWeAcCfH1LcXcRH62cWgIps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t69NQKl8k+lWcDnTDuUnHOqqJXZg04FcbATtudZZVNqhxRbhdM4PVMB7+wyMxkH9I
	 Xjulm1Fx4DlZpjN053CKoBgE22YnTT3ZR96P/AP+Sa0SGFqEZJ9dW0LRuYKo1kCuny
	 g6GlDWGCUdR5hsCg8reHlqXg6/SCH6fNPE6qxLeXpfZHaH+z2s1xR+xloz++M1Lwmz
	 g4YWkgraAoG6v4ZAZy6pSvkjUCJI21V1A7CLGcYv5J6VU3dfEaVat5jI9V035luY+i
	 1WWobptxzrLZ8f36AtAmpTbIxF+QjZpmrXv7naX8DZOqcl0AKBk/R0ohwI3i55I5Xh
	 Nh5e5WtXex1rQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69B6C624DB;
	Sat,  5 Sep 2026 11:21:48 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Sat, 05 Sep 2026 19:17:26 +0800
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260905-r28s-upstream-v1-1-f68d5389269a@proton.me>
References: <20260905-r28s-upstream-v1-0-f68d5389269a@proton.me>
In-Reply-To: <20260905-r28s-upstream-v1-0-f68d5389269a@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 jensen <jensenhuang@friendlyarm.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=LDAlcJQezbRbao3W92BQlWiQhp4bd/SQs/nEjmwyH1U=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzZv72lDpnbH9m8ciW/mOvuDut/lW3aCyt0ImRn7+Wdr
 Cu5cPKGjlIWBjEuBlkxRRbZTdWRQquiZxaxSB2HmcPKBDKEgYtTACaSlM3wv9RQhMF56/8C16Oz
 TXUWLV32+ebdL8W93jNnzxFczySq9Y6R4fvdcqEjj15HS0zQ5ozqFRdNNkh1mB0pISU03zZIYf8
 CZgA=
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Reply-To: HystericalDragons@proton.me

From: 安容 <HystericalDragons@proton.me>

The NanoPi R28S is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC.

Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 81744fbee9..709e2cc44d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -347,6 +347,11 @@ properties:
               - friendlyarm,nanopi-r2s-plus
           - const: rockchip,rk3328
 
+      - description: FriendlyElec NanoPi R28S
+        items:
+          - const: friendlyarm,nanopi-r28s
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPi R3S
         items:
           - const: friendlyarm,nanopi-r3s

-- 
2.55.0


