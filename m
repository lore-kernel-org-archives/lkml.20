Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ECD3E4C96;
	Mon, 14 Sep 2026 21:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419696; cv=none; b=jFD5tyQrjlZbnTTqDz/cw/pAO9eINaw9ctxMR8QMvNzNE5len2KL/73PaYp13X+3kJjZQF4nxVyJOEEoqH8qwVMf9hkmLyfan+sEuRgXp2ZRlekETwmSCebe9v1bHftHSDclTcfQ75EObxzEoZZTw7DCC4EBYNojKPQfmgmVYS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419696; c=relaxed/simple;
	bh=Gt3QugH5YSeuFpR9N/CWqvm4OyVCPWupQ4FMz8kahjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qEfKNAjorfKiWkqHSJFeEwrrhC7l9ltPBXXDzBnVb76hDQHNPlSZ6hGjXsan2ETfFoIa/J31LklXIW64iJNKhCfYMC6RvBihQ8xGiKZgGGggw08SbFf2m9vV50L2ST03muQBYCO31JfmkLPK+UsElrF1YfCc83TmJyMVCtmVuhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uddjLK3B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uddjLK3B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2943CC2BCFD;
	Mon, 14 Sep 2026 21:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789419696;
	bh=Gt3QugH5YSeuFpR9N/CWqvm4OyVCPWupQ4FMz8kahjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uddjLK3B/Ph9P+dFjIXo0798VlyyUQ28oCGIZ/9w1JPRdTRh42GCzHFd6c4yMjr/c
	 JLhVsJJXj5YdDSJVCmFDDcyH+PM7jISDeSqK4d3JOOxlyJKRfTW29Kj3JEhcuzxjkt
	 19/hwWGTrhzUMHD0zJzpYJ5Gz4QJnS9vOZZ+PYdcNfp/W/giPu1aQPkaTfDNuEYsMi
	 lo+iq2QRUK4gD9I4Y8eMXFjG8z31lOcJQ80Oy1Ap6XBIuDQ8hVqM1okdGTWlrOhWv0
	 OPLvIFK2igYpCpn2c4KDEj0XfIGMyk4YdSjV/MijA5CPTUzqtYdYiJ2B8iZiuRTZdC
	 P9G1WryAArsPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC45C88E73;
	Mon, 14 Sep 2026 21:01:36 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 14 Sep 2026 23:01:35 +0200
Subject: [PATCH v7 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-for-upstream-nbxv3-dts-v7-2-373a142b08d5@free.fr>
References: <20260914-for-upstream-nbxv3-dts-v7-0-373a142b08d5@free.fr>
In-Reply-To: <20260914-for-upstream-nbxv3-dts-v7-0-373a142b08d5@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789419694; l=857;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=aN/KjzM3w/R03zSyqrxMJrkTwr6xMG2+UX7Pqb6dLaU=;
 b=xjO4NxMapAH9CrpO0SPfAn7eKAZpx4MSyDkJ2rWQKVty1WRC+RxcsnS0P9RuCwvYc5AX+NrPw
 FM6cXUzeCw9BPA4CvGgrx3DpCDwpfQ4kpHThdmwiHarb9ekgzjWatyE
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Add DT compatible string for the Free Mobile Nodebox v3 CPU Module, an
NXP LX2160A based board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


