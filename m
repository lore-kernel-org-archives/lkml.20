Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C4C4F30FB;
	Mon,  7 Sep 2026 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790456; cv=none; b=TEJx9X/PQLP64FcDqOrPtdOvmCWYVCwYtWWTlW8gsqb4VsZRFQ8h1733qenn/K0wtN1rmoYzqmW1aEXpmv7R345ZOM0GxAqiu6vSz/FXTb+95bQfsyUWv/c7bplpvN5W0zBDyyHxhpPO+lmURCa1Y7aQEOikqlXKDyoOWsHX40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790456; c=relaxed/simple;
	bh=8Gwxp5aoWJUfNbbLdYN5LWeAcCfH1LcXcRH62cWgIps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VRAfgopbv756of6uGno/fAe6x4h/dHvVhzKp2uTFM4pz4Oel9Fj+kQAthgqSHqY+xwd2Lz48l2EWL+u8tYbmsuBLjq08TFn1dRkyejfrb6iPjYHmbExw9gWQlg8AahjEtBVEHytFUD2MTdJedP3Xe/5fczdnn0gFPox8ebGouYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jubPEiGN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jubPEiGN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AF2AC2BCC7;
	Mon,  7 Sep 2026 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788790456;
	bh=8Gwxp5aoWJUfNbbLdYN5LWeAcCfH1LcXcRH62cWgIps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jubPEiGNjDDwgik7Tz0Ccvj2+ItCjZZflXnctzuyJsu3YrJTg8LwjGbiVqaHEmsAS
	 zmu2zIvlrtJS99qPnYP1fx43eRLxi09BEQNuh6r2PDnoHg08HxxAX52BI58FkYr0WJ
	 oz+PZ00T2XDi41GRTGCD0l/0YNib+snzJ9ukxS2/AfJ0BAtxBGjVCnBOL7Z7yOmW8N
	 XHTfb/o68Wp3ZLsSD0e7b2jiOUS66u5XNvSCoViSJ36kuQNZFa+fuX+rwBq5s+N2K9
	 4F6VrVPUKD3FKKuYxigN3IGU6K47ZLUg/LyOvcf6cpS8eqOkrWJIVmi39TkpRJ218m
	 j5N9UWUzcr9kQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93E5C79F9E;
	Mon,  7 Sep 2026 14:14:15 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Mon, 07 Sep 2026 22:13:55 +0800
Subject: [PATCH v2 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-r28s-upstream-v2-1-21ab570fc91c@proton.me>
References: <20260907-r28s-upstream-v2-0-21ab570fc91c@proton.me>
In-Reply-To: <20260907-r28s-upstream-v2-0-21ab570fc91c@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=LDAlcJQezbRbao3W92BQlWiQhp4bd/SQs/nEjmwyH1U=;
 b=kA0DAAoWFccN7oSCbgcByyZiAGqexraiZ5L7ToCkfpy8sawe5RyogUK47lmrosMUIKy1kgRej
 oh1BAAWCgAdFiEEHbJ7WRKqW5lyBBrHFccN7oSCbgcFAmqexrYACgkQFccN7oSCbgfRLAD/Q2T9
 KMFxgUqquC0UmhkV5yeXcW1ukQADSOjNBK+CCTEA/0EWfKl2yhK4z1JbJMWilZTOEPRJht2guaJ
 XNL4U0dwM
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


