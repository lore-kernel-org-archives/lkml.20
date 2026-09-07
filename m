Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204AF3B14B3;
	Mon,  7 Sep 2026 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791411; cv=none; b=pr0ixZ7pZiNxUxnzEddVijLpCINEa1ExIO60Z+oyeV3nxuGUu4jHMfrpuUXIa+fOZzsC0Ulr9nHY4JrbKadNpvP0RMG397a7emqyHiQq8jAtXN0jC9+T4/FY8ZWXWNzq6zgVXVDUzkUD/5yEMgqlUK/gLzqWv3ML5BAmiwgjJvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791411; c=relaxed/simple;
	bh=R6VPu7/qGU2BYSDwQ7+fgFxQjvHX8hCgZTCn+hEyGGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EQ/OKig+msMuHksmUeicX4lw+olRFxffrWL95gfbJFgTPDTvbW5k716MfxNZaFjo9aXeAm1J2FoUo5NSVl+DLlEspSDAP9Z0Viswi2ACezDnaKIgyOWimGxvjy4pHOEu7DH5NyJ9D2pD5wohmJR+IX6lRLIFVYg2w7NDoUgJncg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLE35/Hd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLE35/Hd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD3ACC2BCFD;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788791410;
	bh=R6VPu7/qGU2BYSDwQ7+fgFxQjvHX8hCgZTCn+hEyGGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZLE35/HdPpS4LBByktSN+jvhyRCgiE2Fq0cfylSnFkkLN+QIAvDy6JMnShUIG/n5g
	 423Z3z54x0ROAyxBFI4D+uFwWdnKKcjGjE6Zqjxnv9z45W3oZF2lL0+SvR6h4gVDvQ
	 RDwE5M3XJLTTuYQ9f5uHpS/CjiE3iDnI0ynHOuGzDqB4pEctjXpXB6ry9NMk5S5cc6
	 9pARBp47YPOdc3VI141c/zxzrRJmXpQ9CM7YS935QyjldS7GNY1meR8td5Age2h+gp
	 vCDENPX4aJbcugjPljFCt0JhAZxZkyDfilCpdckp6azfZVqzJWbEAFQB1LR/ZJLrgw
	 GRTxUqz78SgIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A065C79FA3;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 07 Sep 2026 16:27:38 +0200
Subject: [PATCH 2/3] dt-bindings: arm: fsl: add freemobile,nbxv3 board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-for-upstream-nbxv3-dts-v1-2-f43fd0028b78@free.fr>
References: <20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr>
In-Reply-To: <20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788791274; l=1075;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=O8dCXA7+FxVb3qjlvlxUSE16nNAWYoDpG+zNdVfj+co=;
 b=94RATUWJeloIqnP09OX1OLE4DlfY92svTyaPKrvKIrD8l6EMbja5kY/sQG+QnEY3Wn0JGx7gN
 6Q5qrDG58qMBCm6RyDpXGdSG4mO0KRjRlFcKBlKoF5HvYrUobo4dLlP
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


