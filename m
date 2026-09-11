Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B5B3FB7F1;
	Fri, 11 Sep 2026 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120979; cv=none; b=e7gWDKlHzNODQl2fRSNzGJZbaziWkxygyvMNJZIDOMpMwyfWEVgtM2F4hXknwBUr3KguQbjCq2f88lvXO69sYlLmjPas5w3Kz3TwIZwfKWU7oBaExpNVUTbdc+YacqSRIzLp6dMB8hBcPG6lExT2cdEj1N9+sgJtKU7aeINRhBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120979; c=relaxed/simple;
	bh=P0YPesrumASY2chPhCTF+pggK8fjgG4J+tY6vpB+8us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUNz/WRWzMGsUy3sQb50J1BqNtG7PH0yvp5/dmuVXAO8lhR6PYrpPLRo78Ib5dOFZl8j7G//E3c3tE52t6ffuWyYRkfAwRTTkHR71uJIPYPl26+J+EaAe9B3O5Y9yZMGexq9+g7KpUQ+kIehcEeZ55sIjKFiP38uBqUDt36IygE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zh/OEkdJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zh/OEkdJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBAB0C2BCF5;
	Fri, 11 Sep 2026 10:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789120978;
	bh=P0YPesrumASY2chPhCTF+pggK8fjgG4J+tY6vpB+8us=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zh/OEkdJzRJnTqAU21VfvbSCdAxW4U8GCvkTtBPhh0oVmaot+5VgzGg+RHgxD7tX0
	 PN7qJRzsQbgoLEVKTo/69KPwsYWidvevdk6kiHxm8Sd08Eqv9gJNxTQYmMckuC1xPT
	 JAYkrrgXhgV4w/RypwmlVojzkRRh4X11ZSqYqr4SxSfTwvGdpMCyIkNVvHUEtwKzQk
	 HYWfSpWZR6jIch/NwQ9rfuVJqIMLe8wNPP1BMbIFhqaAnU7d1YHlHkQPsAQij63Hn7
	 fpjb1DhOTF94LfPiPMMarreS9dSg8dOP1WPBqv6A+RAnJlxJgHa+54QlL+YwQA+uNG
	 b0br4btkWF0sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952C7C88E4C;
	Fri, 11 Sep 2026 10:02:58 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Fri, 11 Sep 2026 18:02:44 +0800
Subject: [PATCH v4 1/4] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-r28s-upstream-v4-1-fb6c85f226d4@proton.me>
References: <20260911-r28s-upstream-v4-0-fb6c85f226d4@proton.me>
In-Reply-To: <20260911-r28s-upstream-v4-0-fb6c85f226d4@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>, 
 jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=Al+UNS9q6dX1IoEkQ1GzieWtXOTRL+F7n2qKNKypKz8=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzFFy/2aSt11DMdW9JYU80onHpu8j6Jr5K2PzhMbQ3/R
 y5z85rYUcrCIMbFICumyCK7qTpSaFX0zCIWqeMwc1iZQIYwcHEKwER0oxj+F7Ct0Fp0vkz+3x+f
 Ky0CjTYmk/weFHHXrZ/0KMD/bEGtAVDFftGNdfkLVBZnH1Ut3JbzInWZ8uKYtZNKPfy3Hsq6qc0
 AAA==
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Reply-To: HystericalDragons@proton.me

From: 安容 <HystericalDragons@proton.me>

The NanoPi R28S is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


