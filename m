Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D2B411FA7;
	Fri, 11 Sep 2026 06:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109840; cv=none; b=juc8qVUYU9eNTt6+vZyH1qlVZ+ZOvKwKyiw46snayAoMx2/2YKSR1+yOg6QVinp8QnK3yGNmAYmzprK306+thH+S5BTvrhKwLEpQERTW3Aadk8aTvHF+ffDUlJKs3qKufWFC35XP4alOVHYhA1Afnv64YTovpkJXaodTl9Q/F3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109840; c=relaxed/simple;
	bh=5rcMbUAdobuAGakJIjIneARVnmyrfS5TkQFUk1rbGpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jwhcRYQr39VSgwglwASxBlDzq3gwcPEL5mhtc7NXrqLkIeuC4nzXMTn3oX2GPd3RNcky3/s7k2DTSxsP4bYhXyZY5rCIm6OJXXbA5oh8X4YNC33bFj1tZCTf+5OZybHjc9gghJbs9EuEVsofxDXCF9j+77IRg7rerg9LcLIj79s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIoAsF0I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIoAsF0I"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90CB7C2BCFA;
	Fri, 11 Sep 2026 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789109839;
	bh=5rcMbUAdobuAGakJIjIneARVnmyrfS5TkQFUk1rbGpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WIoAsF0IYxSKmWNSLOa71196St34gBmQhVoLXdfc2z0CqXs+68afjmEHbjflvM/sl
	 5kd7Bdlh74r94ju8YW7Qfp0M9S6HDEBHpek790LC3A51citrlFMM0peyoCHyKI6r5D
	 iyIgbLqSYKS7Oa8r9uSQdoZoIELr3fSHcW27Dgkfr8egN+PSqpIFSW9Iy8HivQUu/R
	 2dE1z/QD4akO2ee2u/dlyYNgWQ77BB8DUSutrrwubrcI5uD716WMs0NOA3lcWAyIFx
	 5veRT/MHPFyFYcBVlhkqeLvywLlL65VTGZPOW0cOq8IwtJshdWiIMPI6F0f71mvTOD
	 LjH6FK7uPLDAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C3FC79FA1;
	Fri, 11 Sep 2026 06:57:19 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Fri, 11 Sep 2026 02:08:33 +0200
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Free Mobile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-for-upstream-nbxv3-dts-v4-1-2fd07d5575ab@free.fr>
References: <20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr>
In-Reply-To: <20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789085313; l=925;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=x762//eHMd5qaHdbwwprESV14msPmnNZ0HZ/Q3vEj5Y=;
 b=T5P2Hdy3EeWJxJPxzR376NinjCJus2xiL0qrZAYOf1cWVBWICLtWbe7ZMggOHKPsAz0rElFph
 swd7k/zygEqBwO1o9uHDJm1MT8ponwwRdtqZTtf2Nu5xSdfMInzcVmI
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
index ba20029693734..e467da45cd7ac 100644
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


