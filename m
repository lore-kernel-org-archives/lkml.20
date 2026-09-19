Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC945D5E3;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789813705; cv=none; b=dbunBR/gBHP8WhV7/XvT60fDA2U7JLpwdzbYWXzamAG2K1KzAk1SypTCMigThnUudzMTY+PxSlD7daHQzIptGgh9Pnr05IcbAZgey3mhfr02lXcuQ2r002SP939PXaMYFHi62hG1a3uYvgKFUClhEynOp8tvOBzekjjjiO6oVx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789813705; c=relaxed/simple;
	bh=tuo9FTC9trpH9PTGtyXsmxAlQQNcjXaX7nP/LygpwVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzuVCb5hb51cggYKaFoOUIsn99BxpzKQcD08cK8iq2lwOYQGmGLZFvxH8lW3BhoGu9KU74478riz5pSm6aLZHCdxitRrrwrUQDam04GnmUdYuhka0Vth6HuYjL+OalIGLhOQ2LF8XlimglxYCXCdhlK20fKKdWgV0ZbheSEggfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwFvZTGR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwFvZTGR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5951DC2BCF7;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789813705;
	bh=tuo9FTC9trpH9PTGtyXsmxAlQQNcjXaX7nP/LygpwVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jwFvZTGRmUC+k+oN6aF/64mcm5/dTwrKKBO4BmG2zNjSHm1VvKoi2Vd2yB2wwvhWJ
	 fBAA6YDspa84ZI8iy7uM9uwtxcLziZh21sK7o6+eNm8l5MLRPnUiuehzwnJdP1JNyz
	 cyEl+CSxfrCLYARIJUeFExL9HZpSIR+oZ7EVOdNQ7ttEjQQrrGME86neXXaKd1VFZ5
	 N+lZNfKNlyryi8LIo6uesEQeRI3pIyKs9pX+gnGPqJ8eywT/hEp/1IGTxef/MSDtNI
	 ui+LOUSdfy66yhx15sA9dJ0Kw+NOURIrOpA46LY7/LRzsBJDFsPtkbcxxMwysTDIw/
	 U8ylbA4LqWHnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CCEC982CC;
	Sat, 19 Sep 2026 10:28:25 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Sat, 19 Sep 2026 18:28:17 +0800
Subject: [PATCH v7 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260919-r28s-upstream-v7-1-e80a6f8ef521@proton.me>
References: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
In-Reply-To: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=GjgiG/CwrGYA6nG9hPXid2MYCUCClI7qpstAQn8fUNs=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqx1ycdlp/poMgdu33paPfj0iRvdTS61+64sX2JaLHfRf
 7qgVW9rRykLgxgXg6yYIovspupIoVXRM4tYpI7DzGFlAhnCwMUpABM5Uc/wT/lQ1nMphfCFHz/z
 G5yNNl24NULE+t3uKE+JlFqpjthpfxgZfl6zswvNaqm3W872/J/n4y2q7z8Kb4l453N7C6fu/+Y
 adgA=
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Reply-To: HystericalDragons@proton.me

From: 安容 <HystericalDragons@proton.me>

The NanoPi R28S is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC. It shares its base devicetree with the NanoPi
Zero2, so fold both boards into a single RK3528 series entry, which
further RK3528 based NanoPi boards can join without renaming it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 81744fbee9..dc69999862 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -347,6 +347,13 @@ properties:
               - friendlyarm,nanopi-r2s-plus
           - const: rockchip,rk3328
 
+      - description: FriendlyElec NanoPi RK3528 series boards
+        items:
+          - enum:
+              - friendlyarm,nanopi-r28s
+              - friendlyarm,nanopi-zero2
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPi R3S
         items:
           - const: friendlyarm,nanopi-r3s
@@ -388,11 +395,6 @@ properties:
           - const: friendlyarm,nanopi-r76s
           - const: rockchip,rk3576
 
-      - description: FriendlyElec NanoPi Zero2
-        items:
-          - const: friendlyarm,nanopi-zero2
-          - const: rockchip,rk3528
-
       - description: FriendlyElec NanoPC T6 series boards
         items:
           - enum:

-- 
2.55.0


