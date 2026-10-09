Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A33F4CDDCF;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543626; cv=none; b=TjR/WW81n5qcAjbzL9zp5JgoS5iuwP/ePvK3JqLs1ZJx9e5pzxj3f2QV9xDCfjmlq7QVus+m0bCYzsde3SSrGm9DXOeNJiXJxv/yxepxgfP3ZBZs0JXnGDc5gf6F13KmSqYhMY8qMJHXo6psSIYWX1XN+8HBEKBcAUR++BwX7Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543626; c=relaxed/simple;
	bh=n2PC5Ygmm3kKQRsnARaZvzzaiZN9N9d+mwOfSpacRzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bo3WE4ugrmsxmZKC51WtDzwa7Ed3So/U7KzxpFtruhw6rBD0UlDDc1uG8piYJePGfHr5UIaBikhsNJzgpQD8jjqA17eobuRqnxwM1iFd97sDAv8TkpJVzo4gd++ZkZ6zvw2tILzAwIJ8Tr4FxztM2i/SjW6VktGq8X324QnybdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6f5ZTU3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6f5ZTU3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 975E4C4AF09;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791543625;
	bh=n2PC5Ygmm3kKQRsnARaZvzzaiZN9N9d+mwOfSpacRzw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m6f5ZTU3zeaGD3Pkm7VES8gYbThRibw6PWiIYAx/w93Kfg4m744WlP8HMdCGgdJiT
	 YifIyEs/A8JYEoRgQZwEM+kes9zjmm7O1F/LP8aTBeqfTo98ThxShsIAlQpkc4powM
	 AqC2M6duxIZAE5GEtC2BTAe1IL1XLcsnvjH+2lbwTi/MVtXF3KrfBCALro+g++1Ysx
	 ObDp86S+qF0fLyGckdLEGLKaZHycvlz5pn01VfmkQozGuK187MUt9FxohlqzeAvIYl
	 G24sFPv6bLXZqOORk+5lxD5Y7uztwuAJRJA7AV4iIX/8SDjbxdDibf29YrDBjhs6Td
	 fbD03+68HV94g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856D7CA601F;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 09 Oct 2026 19:00:23 +0800
Subject: [PATCH 2/4] dt-bindings: mfd: syscon: add Ambarella CV75 secure
 scratchpad
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-cv75-soc-v1-2-808330e93ff1@ambarella.com>
References: <20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com>
In-Reply-To: <20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791543624; l=934;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=sWEDtsH7Lmq1R/x+RLJKvlPiYjtNzkc/ykiOxa9OBkU=;
 b=xgMXHFlE0r6oLPkI0VxxMrzReu67bf/gK3plkl0CEj768TtTEYtjOsPURVE1gRgEhf2/v/xva
 374waGNZlTvAtK3EkixRX13+RCtFZf5V8BR3t/09ZxPhruvoMXZtIvs
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Allow ambarella,cv75-sec-scratchpad as a syscon for the shared secure
scratchpad registers on CV75.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index fe882d3f828b..9ebf702c06f1 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -32,6 +32,7 @@ properties:
               - allwinner,sun50i-a64-system-controller
               - altr,l3regs
               - altr,sdr-ctl
+              - ambarella,cv75-sec-scratchpad
               - amd,pensando-elba-syscon
               - amlogic,meson-mx-assist
               - amlogic,meson-mx-bootrom

-- 
2.34.1


