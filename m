Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED2547DFBF;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219963; cv=none; b=hgxPifVADgvdS59VJDReSPJRQr9Yx/oE03Qnyd6ge305+YKrE7CM++QZ3aqnWQUqYIDJxaMJXz8Aq5EpKzHi9DPJn7O6IZXDWV7a/nRZW3yWLs7zCOr8U40gnT0YQvzUGt6BuGnCAnIaBe2721q0gBRMmfkQ8b75mdMDrJNb98s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219963; c=relaxed/simple;
	bh=JkwzbNYwRAgQqV5i3Ky5WDnTYDRC8C/A4yQ5N2SQlvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8xEKrhtgVJlevjUPN8wKeVleRNWS101vkt3JSbEdKPAYM6VlIC2ZajCd9TwnfkZCJFDrC071uR5yiLkZSUpQaeYm58OsMCIoA70dglN1I1628T80/tTEImk0s+vEOY9qnDeISMqqQErAb/sPCsyEWq+Iyl9hZUIMdEJAjbwNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9gAkp0J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9gAkp0J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E241C2BCF6;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789219963;
	bh=JkwzbNYwRAgQqV5i3Ky5WDnTYDRC8C/A4yQ5N2SQlvs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k9gAkp0JWhV7mBN8QWBqNqigjYp78I4lt8FZrxRf2jW0P1EcSYeviR6rt8WxD+Tb4
	 35NX5AsEkAdvx9GEvvhGMM08TRPgFcUNr0AN+Mtu8eqiDOq8MSuxcMPSOQSuKHJK6d
	 KpqwsUwRyckwWEBv/hjnwaU5YIK0hFxdJFjOLP5Un/peh7q/RDzt2jRJ60eSO5RDz5
	 BJh323p9LYwrMRuv0Yf8akW/JnLyvnq2l3upSb+P51neENMNvsKxcOUXr8ZCY61Cr9
	 Bg0wdUqS62BB/6ixb8a1QYzx7ZVVH3PRsKdo4zv62VibOmRf5PxS51OqLhH6ph4A+Z
	 sDvv0pMj1Zdcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E51AC88E53;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sat, 12 Sep 2026 15:32:37 +0200
Subject: [PATCH v5 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-for-upstream-nbxv3-dts-v5-2-ead604dba61b@free.fr>
References: <20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr>
In-Reply-To: <20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789219957; l=890;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=6NRdekrvZ1bADwMMSU8BctmnPr4DJ0Rx7XWnLNXPJac=;
 b=oYnzQwBQLJRk7ZpVu3rJN78/oGczQp1xYVeQKVjG73zu54wxvJB0DAiodIs1x37ZRyQHlTLpV
 1AgbD+BhuDgB0+/JhUrFD2pGdLbG5FJXHZCpDBDJ/rK284dkX9QZUMb
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
index 656f2596e1d5..baff4f4159b2 100644
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


