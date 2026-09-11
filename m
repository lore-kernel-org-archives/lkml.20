Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F6A443E2A;
	Fri, 11 Sep 2026 06:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109840; cv=none; b=nl7yaXAaZwSy0ln06VRNs9NXxCzVQ1BUvqjGhLBJGN4LObNCaf4mt7E55zlMCsTuiQyuW1VWZ2ds0iI+onGVIvsGs4ll7I74chXcFWgCoKHv/SxZARmZ3mX+ap7vBuOr1of1HJ+m7RmralpxmzU/tY54EOqiVJ2poaGiCVjPOBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109840; c=relaxed/simple;
	bh=ZwAaadx5hjQEdyKyc9oxn254nSkQCL0+FG6XUZI7g9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ns3zdju95Sx6uwlyaC04Woi0+mllg/tpP9di6bRed7eq7WgPUmItydANOiNLwHWGo5Y03F0HfTlehQ476s1hSYhea7qAsocaYH8WR+cGqqQ2ZM1g8rbp8iFx+T2Dn7eD8caOct5gX0n+u4CP5Bgh8FY1Wu0mEnpR5CC7z+ZZYI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nr7EvVxg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nr7EvVxg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1BE3C2BCB8;
	Fri, 11 Sep 2026 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789109839;
	bh=ZwAaadx5hjQEdyKyc9oxn254nSkQCL0+FG6XUZI7g9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nr7EvVxg3IdAGV5fYoEGkK1wQ901HEFtpaHVoYu4NiOdJOyWmaWyPsaStD1N4WStt
	 zMi/cgwVQuPPCUlHCHNXfhHckxE65zKGJ6RsweMYOs50s1nPPLxmYFuTbM4jiwrQAF
	 8a+tJQ/ImsHMcnEOP9spn92oEFunlRIduR6NfMys5Zss80grZIr9bMKeCNb9L2S2Uf
	 GMqECVrAhv7yPJFnXYfyxctkkqyLBSXTvqyVrCqHBEeTpNqmdoqnOSa4sdynGkhQCe
	 5lNPUgfOP6WbbIWo643JA7iEmT+h5p/Oek6EBMJwn/Jcp9kqSceAWpOuYKu8xTEdUT
	 /JcpNbhapoGXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840C3C88E50;
	Fri, 11 Sep 2026 06:57:19 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Fri, 11 Sep 2026 02:08:34 +0200
Subject: [PATCH v4 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-for-upstream-nbxv3-dts-v4-2-2fd07d5575ab@free.fr>
References: <20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr>
In-Reply-To: <20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789085313; l=892;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=EDQrDIoVj9BzoPOG09GyK9jZt6CKfC9K8e2yVKy7XuI=;
 b=VyZ5S5qCNcz/iULpMonVcIATemrHh/0BDQVFUuqGNFgDQJeihYERbA6zVBlUk2FeB8Nf3cQTx
 hQniqwFglcbCDWmBiiS21LK6WyTQMosSLwn4k5gA1iaRMUday69R9Bo
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Add DT compatible string for the Free Mobile Nodebox v3 CPU Module, an
NXP LX2160A based board.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d53..baff4f4159b29 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1937,6 +1937,12 @@ properties:
               - fsl,lx2162a-qds
           - const: fsl,lx2160a
 
+      - description: Free Mobile LX2160A based Boards
+        items:
+          - enum:
+              - freemobile,nbxv3
+          - const: fsl,lx2160a
+
       - description: SolidRun LX2160A CEX-7 based Boards
         items:
           - enum:

-- 
2.43.0


