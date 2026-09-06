Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95686379ECD;
	Sun,  6 Sep 2026 20:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725756; cv=none; b=IMnUmFu54A0sFjqyAJP+Yx+5AFTiFdHEstb8S3y8WAan9H8BNAMF0z3F1NSfT75eZiAl4l5bUNAao02NqEmMKwvdU6jpyEY55NpJdmaH9add1FxHO4QnSzNcx+M7YHUWaVh7yoaTubxMsjUpH0Z/yM5SXiR7D3GXCANRkcN84Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725756; c=relaxed/simple;
	bh=aiLHuNbGUXeOjsGe4LLGSSurEzXcB+xoaLQCSq7E60M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWo+TrUPzmdmpCU1dtEY1l1WNV9neyM3EDSMGBD42YHNa43xyJLZGBC/o3Lg1iaLKVgIjKh+o5buYUmRsXvwbwpR4LmZ2TL+NNmiWcI+0+9dRze25AkuC1LRuj/TwN0eqSDlIbiguaeWI2RYCjaoh0tvlO5SuyUbKYcejgD9Ltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=QY/0Z20j; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="QY/0Z20j"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1788725747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifr8dfzJ3fmn/enavi5lqZlBqhGNx/GKUeKdq458mOU=;
	b=QY/0Z20jwGnKx9iu+pv2rhm+3lwrEs6xpK2Hmy8s1h4LxTsrvM4fTuq0fsn4pNPe/gNem0
	JVB287T93XomRVlk4FWhi7vfnSe7sjG82Q/rZQcAR3YYCYe6q2YzuNHDHrFnA+3QlH+/ry
	Nb/u0ytSSUgK7V17VACWgfO3g8oy9FE=
Date: Sun, 06 Sep 2026 22:15:29 +0200
Subject: [PATCH v2 1/2] dt-bindings: nvme: Add apple,t8132-nvme-ans2
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-apple-nvme-t8132-v2-1-ac0328590823@cyberchaos.dev>
References: <20260906-apple-nvme-t8132-v2-0-ac0328590823@cyberchaos.dev>
In-Reply-To: <20260906-apple-nvme-t8132-v2-0-ac0328590823@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Yureka Lilian <yureka@cyberchaos.dev>

Add a new base compatible for the ANS2 NVMe on the Apple t8132 (M4) SoC,
which requires the IO queues to be registered using additional MMIO writes.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
index 4c0b1f90aff8..a1e5b1831468 100644
--- a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
+++ b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -16,6 +16,7 @@ properties:
       - items:
           - const: apple,t6020-nvme-ans2
           - const: apple,t8103-nvme-ans2
+      - const: apple,t8132-nvme-ans2
       - items:
           - enum:
               # Do not add additional SoC to this list.

-- 
2.55.0

