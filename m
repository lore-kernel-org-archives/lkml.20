Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4B43403EF;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801227; cv=none; b=izwGAfX1YQgpn8Bx8W6XzoaEQk/I+UvF+Kj/PDsKedher1DAhd7upPGr18PZE2t16MPrUKYDy+N2yB7sWhf5YKYQDgB766jb4oGtMUtp8E88EeuUuozrW75UuJEytFUIlssXyoXI6NQZGC6q87fI2EWPElv/6kjDJ72wRoPzfEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801227; c=relaxed/simple;
	bh=R6VPu7/qGU2BYSDwQ7+fgFxQjvHX8hCgZTCn+hEyGGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E17qbVmqZKfHTfefex5Q7Rm3kNTNQ51HJ5Y/c7ZpY4xRk2Dct9Fn4BEW3dsqb0mcv4/UqiYB4CXzGaa4IcQUrwNIP13PdHK/ZePQgEY15RR8aBOm3NUIRGi8i/jktCt6FxTS4cCkaSUsWhMtdgY9FDWC1G+6MAuqz5WIRKiKd08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omjIZ53k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omjIZ53k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CA3DC2BCF4;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788801227;
	bh=R6VPu7/qGU2BYSDwQ7+fgFxQjvHX8hCgZTCn+hEyGGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=omjIZ53kIeHaikyI/7DDxfojiQ5p2RlwiEpIVOU+SnOntqFnbcluDAoRPP4mbMNgd
	 VQ7dwaUmdBeA0FR60klB81Le50qHt/cTg7a2LLE4pIc0MncBMZnIIHsHGskUTL4BGk
	 M1IV6jLqNTWgDOFKcZXicNv+BXaPrMyiHXopxD0I5FM1nTyP5hqOtQcevsI1ozDtE4
	 /Gjep6Urgfi3DbpIyYhN16JEyud9crEkDzxh3FWTdy0+hwhRcxwo0hqWFgBkg+RZbV
	 Fg21BV4Le2vC9Kgv61Tm/zIS0cNq+ssfSAGKSgaT2l1Pl0ByWICv/mJVxf5mng2gu2
	 h3Cvz5TuWuQ3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D183C79F99;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 07 Sep 2026 19:13:40 +0200
Subject: [PATCH v2 2/3] dt-bindings: arm: fsl: add freemobile,nbxv3 board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-for-upstream-nbxv3-dts-v2-2-6b4afd36180b@free.fr>
References: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
In-Reply-To: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788801225; l=1075;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=O8dCXA7+FxVb3qjlvlxUSE16nNAWYoDpG+zNdVfj+co=;
 b=ZnPbOV+CeOOr81YAwGJxkubklSZW8BdIS3MxBjMt1PeLJJr76pW1P9j9vYkJwavOsTswtJxna
 oNAu5u8a7NiD1agtAmgaYNJqavn6HtDKEz0rzKTuf3rYzTsh5fTaOAj
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


