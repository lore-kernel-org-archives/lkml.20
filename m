Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552D7381AE3;
	Sun, 13 Sep 2026 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302930; cv=none; b=RdxOcFPPxsYTz2pOT+mfS/a14kut3Cb4JJwsc5yp/SW75Eqo+NvnoAoasjblIroSJFszGT8OB9HYNHOeHV3ZSuURp6UgexCzHRE5yFRkO07Nz8+4iaUmx0yLKBlKfvcYgAT4ePcVR78QJ65p7S5zbuT3Bdmod6lT1ChmeDtioCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302930; c=relaxed/simple;
	bh=tpXTrrpS2ClXOWqOB6t0u12IPPhcA6rQ10Hyj4Z9ol4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBWJuESU88eQRgANcYgyMcxpaxmE+sQOsyCR9o0wHCHRNSgKGp7tjdDHdRL/CRbArYMt0RDIYf+kpAcxaS63conVFCd2j3Gz9vRJ3lL8CjtnYxwFPAY1QTK4BMjL18DyszSIJK/kOb+PvyhpPzVTRwqloj7Ya8yOGOyIFfbZfWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/U0OA8z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/U0OA8z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FEBEC2BCFC;
	Sun, 13 Sep 2026 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789302930;
	bh=tpXTrrpS2ClXOWqOB6t0u12IPPhcA6rQ10Hyj4Z9ol4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W/U0OA8zGRDE5m2v89XnSlvORGHG9y1A/RI9PYHw0sG2Ud6qpLy+UvTYUEzy4pDF+
	 HH2zEuNKomtBp7WJlNDCyQqvu6mIEzDMQaiX8DYCjEHxFOuYjd8XofWmwUUCE+MsCR
	 5184NRH/JpfE9i8eRYSUOENWxhJRwhR2gnqcY4JMx2iSm/gxz3XzeUElDQkXHEcjSE
	 m9qg9rXF5oMwIc5ov8zV0ZeyIId3fhgHH4yanZntts+b3HkUqihLyDW4oMjOT08+HN
	 cs2g/TWE6OlAYldU36I+QE/jTPXgCpX67Tlh3xjV9MOngYIpSr7505RE9CGHsgYLKB
	 svXOKc4mwGC2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F05C88E67;
	Sun, 13 Sep 2026 12:35:29 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 13 Sep 2026 14:35:25 +0200
Subject: [PATCH v6 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-for-upstream-nbxv3-dts-v6-2-058566b93ba1@free.fr>
References: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
In-Reply-To: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789302928; l=787;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=7+LCXEAC/QKsgFvm/oL05MEfz8uhqFfnGd3UM0Nw9co=;
 b=1oGd/d0ozcrFqT4OjRDcNgVf1Xl1q5HLGN3zuVQYhzfS+IvhVgh1h5VsfU03PzyZHtX+/QySr
 EBUclC7k4sRDnvlX+0o3pWdtPY1qKTR1CoQ4xgFio7uLUjsq/YyFikj
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
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..f8ea8d51b8bc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1930,6 +1930,7 @@ properties:
       - description: LX2160A based Boards
         items:
           - enum:
+              - freemobile,nbxv3
               - fsl,lx2160a-bluebox3
               - fsl,lx2160a-bluebox3-rev-a
               - fsl,lx2160a-qds

-- 
2.43.0


