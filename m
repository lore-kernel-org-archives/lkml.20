Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793057695;
	b=kLQdwBrZdeRE6VSyvt4Bl/xe+McTcUqIoHm4tRdBdfM7q+GWqJrHmtGs2H3RPBUOqKCa
	 RmId34MMSSXVGm0EHUo2GWISYVxkEVcROeszy9IPFFfWSqH99p+OA8ICQPJnyMbQRZlI8
	 H7jvbrihbuCLEdwJLcK2ZGtXbNfYMsIGfNDb1E7mD7YBqIOSbDZWHgu6VUUyEIOo3947I
	 wV4N/oFDh5NuO7zUOl8X4pQIGxA11dLixgBWAqtw/faW2WKJt5034dFull6Pqoi+qfE4r
	 5vcS7ycEzzidm0fn4Y6L1r7yzK+mU9w5ZKZpVbnDXUGRzHfIyAKEDrziurQflD+GrZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057695;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	b=FUOxnjYcv7NwIPew6mpOJvvoyp5RXkn31xY1NwjfyDnzajevSNOiBZ2CphXWVQvxJJIc
	 eSYKcVvAfMCisZGBR1ir92Z3Y0y8WZOVMRrw98RUyUEW5Waa/dMXgoRTPaI+qiAQrphnu
	 m6IkgOMSD5d81p3CfTXZ6uHNdtLYMqxt7iRzjiIanU4RGcaaedhFVsNRhcYFu4XXxUddt
	 ENaif/VcsJ+kyBNMZ0AZIJNgx7us6FY8CNrd27DowiGPbG+NQ7ufKyKbeC3h2PW9yPNpQ
	 bL/Q/dOSajFD5a2u2Qf/naVHt86z0YOfVZXTIzp4zvxXNcOV6fYonCxa+TleOPPO2Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IP2i7VFL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E101606A31B;
	Mon, 26 Oct 2026 23:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IP2i7VFL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793057693;
	b=NTDZQwH/P4C6LVlwc9q+Dd6LSvjz4QGy71Djm1/OlbqQQBzRVoswY6gs1s9Zc/w8afIT
	 d0fp1VgWwZMF74xNt5BcFqMROLTJnsrL7Zf6tJaTOxkBFCEl4tYHr91DxqMug83bn/472
	 rIX3ntxRMwwzF/rt44kLBKzkdf5DrXQOHa2z6x8MxVvpr5N5GwSAE5WJzXbcjMEwIredK
	 fjsnUI/33vEJ7uujfkzMU/sLAnWsSx4SCK+Q9Zarl0Wtv0TObE9ctaObZfrmmGrrEBbN7
	 apPIuCntn+h4fbkGe24lmbMFLln2o/lBTDMSua9d0YtRGn6iH6YMDPrD1uytfuRSUrw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793057693;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	b=moBaQ/X1VNqpDp4UC3rj2/BD9QVWy7LDJ2T14H6uQGCZaMlU+SA27pcOiq0AU083rQuN
	 IZGIB3rD3oCbRoCrvDR1DRXP/sOD2IU8pSCDXN2aCosvvo2wMxVMXtF+iTFeJPobkZVS4
	 AGncmpI973mIT5hQCcacaXyFDFozT8WKTRbXPMDRnwbt4FZr75ubeOaazJxu3DzZiA+1w
	 FrVq57/G155+WzczEF6VE9fGqaNTLes6eNadF00fKrNzOrlL6Q68a/E63GBla+5DbYeKS
	 bYafvti2dcVUETLTBnIIUZ+cRL2GwmLzYyd9+6mpJseKDDfmkVvQnE9ncod/DF7njWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 588F71F01828;
	Mon, 26 Oct 2026 23:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793057693;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IP2i7VFLrRsu8j7FKFMYfW/oAOcR7n43sjyaXJWJfrVe1YNjhKEUb68HEg8oWg29/
	 QFRVN+WsESZhqr6ekuLC/JVGZC32547mliJHCszpUq/S7kbXpx1tCpaAsdH+Ly1vLT
	 jv7Qjw4vRIqckxW3BiMLOmYJRgDvPXGMkMORviTbA0/Q7Rx2NrdFUp0Et8tQH3hxPz
	 t1PwK/q0ofQuLfSpMhAandIBm6Mi/YG1WaXircQM79cEvSTqR49e6hvcXCCbrRnw9p
	 0fFK7AXC01wNFMH/9ee6/xAbgAyhLkBZQdcBPpkk1pXkXg940yIM3Ia8+8ZCrCQB/5
	 Xg7vy8zRAxoVg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C4A7944EA9;
	Mon, 26 Oct 2026 23:34:52 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 23:31:00 +0000
Subject: [PATCH v3 1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-sunxi-orangepi-3-lts-v3-1-98fef4f75184@gmail.com>
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
In-Reply-To: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793057459; l=1216;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=t1m1y0S3cSpYjFuC+gfshCNEaxwz0B7aj0D0DiamZcc=;
 b=UFkwKF+LrzoyYlPZx7NGE7L9qOh5eMWicHqcBsCJRMBtxjrifjRp/3azHzu7mWQHF+XUvGXuY
 GXaxojGsbatD9mB5zS+yKFeD8XkOpQinDmJXSOOchOVErTzKIa5/SR8
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
Reply-To: filipescu.cristian@gmail.com

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The Orange Pi 3 LTS is similar to the Orange Pi 3, with different
Ethernet and wireless hardware. It includes 2 GiB RAM and 8 GiB eMMC.

Add its board compatible to the Allwinner platform binding.

Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-2-jernej.skrabec@gmail.com/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..379dc8591 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1008,6 +1008,11 @@ properties:
           - const: xunlong,orangepi-3
           - const: allwinner,sun50i-h6
 
+      - description: Xunlong OrangePi 3 LTS
+        items:
+          - const: xunlong,orangepi-3-lts
+          - const: allwinner,sun50i-h6
+
       - description: Xunlong OrangePi 4A
         items:
           - const: xunlong,orangepi-4a

-- 
2.47.3


