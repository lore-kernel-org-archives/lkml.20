Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51A05678C2;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964435; cv=none; b=UJ5cJfbKxEhzmLial0m8H0RsofC6lmBnC0tbMtVRh7oAO6uef57scPFRjhO2o9cAt8+hZU+f9/fS/t0IRSRcJ72+BXZApqdkX89nUIh+SnugbUvFOFOzLfnZrkuNclo3HKcLtqXMluj367cai2rLUFaaIASM5uiz1ZQOH5wFP+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964435; c=relaxed/simple;
	bh=P0YPesrumASY2chPhCTF+pggK8fjgG4J+tY6vpB+8us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCa0DRNYvL8T0U6cFTwH/cG+6LiNYOxOu/Sc8NURkM+tujyWFQ6YA7X0IlFsy2uOk+6GIVltj2msgQVk3muqDbITPFSM048h2p6c5W4fURt164RP/gVTVtwpsFx7dEx27FywWJIMtpKZleE/WngOipYmX6Nxo9V4w2EjMuwABWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIexx9cV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIexx9cV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B167C2BCF4;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788964435;
	bh=P0YPesrumASY2chPhCTF+pggK8fjgG4J+tY6vpB+8us=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MIexx9cVy7xGow76/SZeKfZHD0bZaN92Lz8u260VU6kk5oGWWDNAQnZhgm6zCFj0U
	 KKcSy/HzsepwFMAPe2quls+aFTsqYUCvQ3pk2MPezEdIsc0Kn7ZFzXSR5yBPDtwlnn
	 4bDowvWTrzDLypaHuKE4Gbmb/yyLnrxNHXB9zk6n+fIM/ex56taQFs+1cd40pm3Qq0
	 R9rV8B2U/GrwkoxPaQibv0W2X8akOUWnaY+WDNMwtJIjDM/To3YS65QZ9+53YEuW7Z
	 3INbK1cFqr59EvzY2Mk7CT/lr/bGORH2oGtiPGaCGYZjxep6oOuHJNumFruWYtaDB/
	 Vtg1jVLXSrRWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65563C79FBF;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Wed, 09 Sep 2026 22:33:23 +0800
Subject: [PATCH v3 2/5] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-r28s-upstream-v3-2-ee3e1a34a353@proton.me>
References: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
In-Reply-To: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=Al+UNS9q6dX1IoEkQ1GzieWtXOTRL+F7n2qKNKypKz8=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqyFeYE5T7cwyzTMcrwvk2Sezah6Lip800b/L6Kr+bnf3
 7nNLSPSUcrCIMbFICumyCK7qTpSaFX0zCIWqeMwc1iZQIYwcHEKwEROnWP4H6twYqnoMdddQmfv
 aKlp969MMC13FGA5qhoUGNr0ZcZeI4Z/ljdSjjY0PS35WK54XC3eoqmv7vEj5pd3DlyVENrkc30
 5DwA=
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


