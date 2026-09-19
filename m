Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374B137BE71;
	Sat, 19 Sep 2026 19:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789847059; cv=none; b=TSNmzO1GKH2l/RsNT1WQ5wgMtHRpv4wBGzsZLZ0xz36SzIOusZC/51aKbAHxjoWEfEcystwmYysw6o74RQEBBaYb55B7W2nm2LzEbY8zuMEiVHH0zFUxBRZoNBqnRMqxKMtEHYWnvjpSJypkYThpY93X/foF2bRkIYUElAI9hJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789847059; c=relaxed/simple;
	bh=hdT+L3Aro+iyRTysKZmeSdAuyXa1BuaAuONMoFRlMqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8+Evvyjyje2LB/SlEBPxJ8g8m/w7OH3JRnj/4Scgpo4Hq32BKe8wsXULzd6290PBo9Srqg42vQfD7LlU4ZwE9ldAPRizLLVmECk05fwGAOYup1cITMBNM/APO8HZt2caOIHJlg0PcQqWmxd7rkkJOaQeu+Cu+DAOPGeVEroYnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mX52mtlV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mX52mtlV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDD17C2BCF7;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789847058;
	bh=hdT+L3Aro+iyRTysKZmeSdAuyXa1BuaAuONMoFRlMqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mX52mtlVM7ixtOXQ/RkMcfxTI0Yk2HwZqMg/KRn15jrL7OKIwtNuKV4jEQ3enOXDh
	 5dQzGsRsP5VIYhi1VyFNRyu5Z7GlxMd16nxqXY/tjl0xDiDpHGONh+XpGSIXuxObJ+
	 G1josAgbfQMFCZ0ZfZJmfzom4smFznYADy8sw9qrDWQG3V/1agtoyHxeStnNxA+7P2
	 /+CEWX3Ownbkb89XEbd/68y5gQULHBjB+vyDPTsAdjL4K3R2sAPTwVXPpGeleEDQky
	 7PZdZ5BNOqa8UdBlm6Wc+4w7F7ixm8GlndYkd4eis8x1hbRKvlxEYVrPUt1y8b080A
	 RnoClnY1dEFEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C89AC982DF;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
From: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>
Date: Sat, 19 Sep 2026 21:44:18 +0200
Subject: [PATCH 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-send-dt-v1-2-365615a74ef3@studio.unibo.it>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
In-Reply-To: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789847056; l=1405;
 i=nicolo.giuliani6@studio.unibo.it; s=20260919; h=from:subject:message-id;
 bh=y6YYIBXvEGJH8GoEFsgQ5cuo4swCennTIRdUH242hhU=;
 b=GQWGJk6JAc+bnFpLomU6YmOR4xCP05ObW/ztx++Epil5oUxUZYiCJVhDkAp3xu229+AffPwlP
 5HCFyvyFB+2Cnb+6gTaeNXUoLJlWmfQ7EDjRBkCRgnG5pdhRqI3zIBD
X-Developer-Key: i=nicolo.giuliani6@studio.unibo.it; a=ed25519;
 pk=D652ecdT01GkA1eoFWNFNX85xIg5ZnFwUWyjfestgQw=
X-Endpoint-Received: by B4 Relay for
 nicolo.giuliani6@studio.unibo.it/20260919 with auth_id=1040
X-Original-From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Reply-To: nicolo.giuliani6@studio.unibo.it

From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

The Sophos XGS 87/107 desktop firewalls combine an AMD x86 host with a
separate network processing unit (NPU). The NPU is a Marvell Armada CN9130
SoC with its own eMMC and SPI NOR flash, connected to the x86 host over
PCIe. It serves the front panel ports through a Marvell 88E6193X switch.

Document the compatible string of the NPU board, with the CN9130 SoC
compatibles as fallbacks.

Assisted-by: LLM
Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
 Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index 7e77310da6..2e114139f1 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -136,4 +136,13 @@ properties:
           - const: solidrun,cn9132-sr-cex7
           - const: marvell,cn9130
 
+      - description:
+          Sophos XGS 87/107 network processing unit (Armada CN9130 SoC
+          with an 88E6193X switch)
+        items:
+          - const: sophos,xgs107w-npu
+          - const: marvell,cn9130
+          - const: marvell,armada-ap807-quad
+          - const: marvell,armada-ap807
+
 additionalProperties: true

-- 
2.48.1


