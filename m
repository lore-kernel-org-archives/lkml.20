Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B328157D23A;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884726; cv=none; b=ifJ00hAihR9Lngg850hpcGGh5y8lo76WXlFKFEx5/x4JNA41cloyFJdk7KdXrgbSqvRmIOhz5PfhNL5RikqB6nqE+yJj8N3jVqJCkhFtSeAmUkfDR+8y/GE7ESu1+zLJwUK21n1ipZ6DWpQ3zlLcGcx8eIEra9eF/ApZM69nUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884726; c=relaxed/simple;
	bh=R6VPu7/qGU2BYSDwQ7+fgFxQjvHX8hCgZTCn+hEyGGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFTrL8b17B39M/bghyS28ePBC+aY0piXQ9HWp+RRlBiktOy5kY/8ccqFRW9/PenZePlWN+BosUbKDppXWOMbj47sCAIddQpo63opJiGKJR4G8X/yrP1TYURV707ZY4yMhKBfpJuZxWwFRTyJ7brxZD1Jh8LfbPFZErNzGLzJ7YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=In1GsxsK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="In1GsxsK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A4B3C2BCF5;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788884726;
	bh=R6VPu7/qGU2BYSDwQ7+fgFxQjvHX8hCgZTCn+hEyGGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=In1GsxsKGDkhqOC0FMq9h0InyQMutg/u4n1DJ85BoRWsvAWuQnR8TvAMMJScwR78a
	 Wt6U6Na4ZUuV+IAEqJFgJuRcylfoJn6OTKhFrYEtoDcrVnwQskgX8YKxVRRDStgcl+
	 3g0TEucG6F6IgMg2K9Z3hNM+awL0Et8FnUu+wEOvWl/Lipy3fRc48w4yGpsANpxUl7
	 eAv5e+iBlNjpn/EIbyf5D6W3upPDpKiITfiC3TOHwCzTHp9yxtQTn0J6C43YyhibxZ
	 spa/72M4oLvop4oyjCwChNDqzIkLeboWNHRtc+FEcV97qGKJOjwCcentX8o6cbSmhs
	 AToh130T/jJww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9D1C79FAE;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Tue, 08 Sep 2026 04:12:44 +0200
Subject: [PATCH v3 2/3] dt-bindings: arm: fsl: add freemobile,nbxv3 board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-for-upstream-nbxv3-dts-v3-2-1d88b2c11680@free.fr>
References: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
In-Reply-To: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788833565; l=1075;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=O8dCXA7+FxVb3qjlvlxUSE16nNAWYoDpG+zNdVfj+co=;
 b=dCOb3PjMPsNwF9nyF/4TaC1kok9kdLTRo4Dth1OL2pRKW2tQDyRu3877cfXITSxWqslSnbDaK
 bCHIqTW568EBa4mc+a6khbjDsFuXnfRDAxf6C+nBP3LvDqx2X8uaAoU
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Add the Free Mobile Nodebox v3 CPU module to the list of
NXP, former Freescale, LX2160A-based boards.

The board's root is:
  "freemobile,nbxv3", "fsl,lx2160a"
and the DTS is at
  arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts.

It is needed for
  make CHECK_DTBS=y

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


