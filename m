Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794782035;
	b=DG/mdg/Fys5oGh9APgga7GDe+1aiGRatDwhBjsfco5/tH57DodoIbGj9dSEEkE6ifyx2
	 jsLXr3w+0FKw/mVjthZRajQok61t6bX/LeBMwLuaugzvZIkcpSDJAE/uBcDY+5IYtNJNB
	 x+oEBITq1bxDORxYG32V9fnojIHgwn7N48A8ZnRuuZdJSE9r0udP4xsqp13e46pGep7vs
	 AeklFx5Yw1up1sPy06EXkWPZruyUM4Xc7taA+bNOkMjlGIcoI6AMrDq6J2ZhivIr/xt/m
	 gGUFyJ9D2b3hF0xjwMI0tqLzYwOsyawJfU25FVjngx16BMtXxBg2PQ0QSUrXPPUyhbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782035;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Puf+AwKlK/UoaD94UU9LY8C6D1KGt2kJdgn/b7m046U=;
	b=zqK307bBb0Q+hvmPqIF9I4sCMNy6oYa+VtrUX4U5gfdmejKsLwEx2L2YZWb7cO8imsLM
	 Sdh+f1ZSg6rypGd9R7Jxx1hgR590uchEHnr1gMC2VhXbgXN4YmMF7fHFeCd8im9M+bCCD
	 eYl6mSLzC20B9Q8lvW3SaEMmCGPB4RHLZVbRCM4aPS8sfxfA2av13SgRQUTKtKOpVuccJ
	 GMq3eYi8/E7S/OjDBg9qO6q4Hwz0kA2lDa/uZ+bkZo3Od06ecse1XucsWzCfjPnuvsWkK
	 Jb88bYJeTG391zpzTY1ofcuG2Lg0T/2wOns7Xgj5KPUJHXWBReRiPLz2B+7JBDZx3tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SBCkEjl6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D0606A31F;
	Sun, 15 Nov 2026 22:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SBCkEjl6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794782034;
	b=jBgPhXvuyJVOjO4arss6uORcSlpRM9bKiFP/RP3GaRcqyXg/iTOc339GK+SOtG1Wxwwx
	 E9y39R6RYA2coQRJ2ca3PFOe5h2sWywywwHijwel+rEwyoxMeuZShC7P0wIRbra/Jh+P7
	 SA7qBLsiw/f/MwZAk3cFtF3DzkIKWBdUdOQrpAhJ2ABQfT2UdLHlJcUM2tiAQx0V3bLS3
	 UJ9gd55AkA/xEdFZwmLvOcfXPxaipLHThf0MaQatOiX/1zNu7VNhQtK3eif/uGHKbJe2Y
	 ugU6TkQfQSPzX3h3m7WoyfHrbvep/AT7eDGo09XyiBEZYVRDUmsbRJuUkIntT/oZRsw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794782034;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Puf+AwKlK/UoaD94UU9LY8C6D1KGt2kJdgn/b7m046U=;
	b=h/VekXOyx2NxgUyOqmZKfRQBVwjJBprbKfUhxISAnDB9gu2pqDQFsacI3fsEJf5RAVYD
	 O9GwIr9eELv0xfBnzBEsDSaxLvRIheM3wGGwCa/Sr2Tzxg/qJugotRHgniswC24WpK/xt
	 +mspy/yDe9gZa9e50HfPrIZohiuBBmJPAvewSi0Bxol934mv3Qtfu+IlCtdp3k9xjrb5R
	 wSCEMUa4QfFHHXKYCgHZDF0+wYpGx98Yzx0NrQzew5kyykDUzag7QafqdBnTIPYawfnSy
	 KBm4fhV5EsoiomH5c4MNdSnOlEcE6CWZWOgdeZ2Y63v3cbIKCXWoBHh/P+Pv6H3lvQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 434641F000C5;
	Sun, 15 Nov 2026 22:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794782034;
	bh=Puf+AwKlK/UoaD94UU9LY8C6D1KGt2kJdgn/b7m046U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SBCkEjl6vyo1/AoXpcXHxlSJl3bHD2jvAMvkmMuF/aPhIvYEX3/bF8sQMWToSrRko
	 GdgUDmbIgahnyqzCAjHR7YbIDyypJJCAqGZZBbTn5MwVX3voZpZjsdV1EupTHvShtC
	 0CWUmBMUFHYj99Q6iN0YBMnIM+VS8Fas2N4pMghrQ+sNKjJQZirX1iK1fOVz+reaqW
	 XV1lvRXeK/oa8ykDDJ5elam+G0pRjsIAYMOtFx6BdKPmzBK/r8l3KOkHs1eb6Hwgvw
	 ATWANPpqqihqsve4L4xxL9JXPDX+9XskGLxPpCOx0qbGzAB+M/dxxqE079iBkxa8AI
	 qiFxs204dD6Kg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B1B0A4A230;
	Sun, 15 Nov 2026 22:33:53 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 15 Nov 2026 17:33:45 -0500
Subject: [PATCH net-next v4 1/2] dt-bindings: net: dsa: lantiq,gswip: add
 reset-gpios
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-mxl-gsw1xx-reset-v4-1-4ecd18c922e2@telaak.dev>
References: <20261115-mxl-gsw1xx-reset-v4-0-4ecd18c922e2@telaak.dev>
In-Reply-To: <20261115-mxl-gsw1xx-reset-v4-0-4ecd18c922e2@telaak.dev>
To: Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794782033; l=2157;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=4FEhgpkbRSKonFfieQreIMKCdNlc7jHkKu3BjReGMyw=;
 b=wf+IED07LZ4coNs5einWhK0QYYS/vCAJYlBpDQ7Ol3L8GyadA8wsF6sg22m28V6hVUq129D81
 YNJaKeJAtT9ATDub8r3TKD89ASXbjf0UIkCPqxpHc7a01RdMCpkoaVp
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The standalone GSW1xx switches have a hardware reset input, and boards
wire it to a SoC GPIO. Allow describing it. The SoC-integrated GSWIP
variants have no such pin.

A reset through it returns the RGMII slew rates to their power-on
defaults, so say so where the slew-rate properties say that the
bootloader's configuration is otherwise preserved.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
index 49af5573e4..89f78a1bc1 100644
--- a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
@@ -40,6 +40,11 @@ properties:
       - const: mdio
       - const: mii
 
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the hardware reset input of a standalone switch.
+
   mdio:
     $ref: /schemas/net/mdio.yaml#
     unevaluatedProperties: false
@@ -120,7 +125,8 @@ patternProperties:
                 1: Slow
 
               If not present, the configuration made by the switch bootloader is
-              preserved.
+              preserved, or the power-on default after a reset through
+              reset-gpios.
           maxlinear,slew-rate-txd:
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1]
@@ -131,7 +137,8 @@ patternProperties:
                 1: Slow
 
               If not present, the configuration made by the switch bootloader is
-              preserved.
+              preserved, or the power-on default after a reset through
+              reset-gpios.
           maxlinear,rmii-refclk-out:
             type: boolean
             description:
@@ -173,6 +180,7 @@ allOf:
         mdio:
           required:
             - compatible
+        reset-gpios: false
     else:
       properties:
         reg:

-- 
Git-155)


