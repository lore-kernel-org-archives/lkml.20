Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554BE3EAC8F;
	Sun, 13 Sep 2026 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302930; cv=none; b=AHGYVBQGsjIVgV3Az1HpX7cPiCygoX5SMqvQN0N9TR3lO6ThA4AdRO5jvqUJEmCEDhRGh/PK2ZuNqc2MQDa9E7s+T88U5rzmAM5NwYExU5/LIzOq6K5nOLTAQcJIQIZwMyQ4IhtLG3aP6IGrbEOWTyhQPUwYCpcdsOUGuOtHjzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302930; c=relaxed/simple;
	bh=n5QACkd1zv3PhqXE3MIany6DDgK40aeV4SQY8yeovjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sWYmgJ2pdUjfrWltDFxg5QTJyGxHm3W2ZT446W2Zb4dYJnSUe0lR+m87mVs0z4GVvUFdw+ngO+9wIXEypmqGHikpTeXU8I/wYWLI8uZInaVmbOEovZZdHXN0r7Ph4HJw6unT2SxVZkXveKw86A7pE0xP/4r4mysxlabXFXJeNYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZFMlb9B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZFMlb9B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0447EC2BCC7;
	Sun, 13 Sep 2026 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789302930;
	bh=n5QACkd1zv3PhqXE3MIany6DDgK40aeV4SQY8yeovjE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EZFMlb9BsotBM2NZSyDuFcHxDha7T18SFy+34QfzVOeKMMzwvXWIA4XV3nfVh1n+p
	 gG81BH5GxFlNkgkkFJhPLSIyYkUl0zyLUwFrPFQctKBeo7W03hZ53b9jLT3fgf+0bE
	 hrGDD6+G3qnA6GWjfT4FdCNWlOk3O5RB1q3uw0QvAGmzeG+DCutSqhkOjZQG3zL4QO
	 51yJV3Ky41ovTodW10QP4y/mrQy0TqRQ81WMRoHCnrqNyyN4XeeqaON9aR/cxSDZxI
	 DSEZEbhGZi6v04myRdTY4uzw9U5Xw1MUds9cYfy0LsjmxHK1QM7BHdnlRD9vSfD/Wl
	 P93/0qcMOTTUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA05AC88E65;
	Sun, 13 Sep 2026 12:35:29 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 13 Sep 2026 14:35:24 +0200
Subject: [PATCH v6 1/3] dt-bindings: vendor-prefixes: add Free Mobile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-for-upstream-nbxv3-dts-v6-1-058566b93ba1@free.fr>
References: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
In-Reply-To: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789302928; l=923;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=YJnL8SVSS5jtnm6LBYWZbK3h+dEb8nY2DV6ueCzz3OA=;
 b=fvl1lZCoI/UaTwNi3UoWOr5b4xel7K6tYWxSTqp3ywyhpruGjw6c2VjrVB3UP3l2vyQmCPJmI
 HyR1lcmT2CSAhy1ei9/3MRUKWgVTXfMrsHx+GOF1yD/O/ku3oSHfPzP
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Free Mobile is a French mobile network operator. Add its vendor
prefix, used by the Nodebox v3 CPU Module (freemobile,nbxv3).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..e467da45cd7a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -626,6 +626,8 @@ patternProperties:
     description: Freebox SAS
   "^freecom,.*":
     description: Freecom Gmbh
+  "^freemobile,.*":
+    description: Free Mobile
   "^frida,.*":
     description: Shenzhen Frida LCD Co., Ltd.
   "^friendlyarm,.*":

-- 
2.43.0


