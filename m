Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74472FBE1F;
	Fri,  2 Oct 2026 03:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790913167; cv=none; b=YktNuBKGLeRM5Fw7laYx6o/sClYo2Tir3ppvHfS7i52ajIaNpH9EEB1vOXS03dqqIKHPsCeZNC4ZuEAR8u/p9rxNyJjaCFPqRYQids0khLu2Vy5whKfe1jyPCdXJo6ExsUieGJw79SWpoJv27pYUpNmEzH6IB34fqlFfS6L3pLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790913167; c=relaxed/simple;
	bh=BEj+/B6Y2XXzZ9/4xYV4CCC89MOGIPKxEVyVWT69VTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Em1/WO/UVk3KA04i5DQ8CAReDnF7ghdDmqM5YRxouQSfcKo++AxKVlqQny7Ryckw7qmxWgmS6St4FxQ9mxU7PFPuAKEFwoERVAZFZP6zI9AteUGoU+OBgB624cce9BdONGSJng8KTHOrbaX0ILewyVIMmaVZjOO4Vh/Ym79jeJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Iz79VAHu; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Iz79VAHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=HG7hLYwo6VKRj7UF0IiJn2CjzUewNY8+lmn/zodhbzY=;
	b=Iz79VAHuPviVItrkWPC5D1s5A7KO4pL0saUgClXIBwNPQaSTWi/GcDKqA+IMpp
	U74MTtB8sYm4HVxlophdrJrhQ6HMNte+fbOQlb4ZytZ0eXik0fuBRC2EvwafafwG
	ma47g+vfOLZVPFTXxufEYs02d24e85FQGo7e30LQ3iJ6Q=
From: BG9OXA <bg9oxa@163.com>
Date: Fri, 02 Oct 2026 11:52:12 +0800
Subject: [PATCH v6 1/2] dt-bindings: arm: rockchip: add ALIENTEK
 QuarkPi-CA2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-b4-quarkpi-ca2-v6-1-9fc33f27ebb9@163.com>
References: <20261002-b4-quarkpi-ca2-v6-0-9fc33f27ebb9@163.com>
In-Reply-To: <20261002-b4-quarkpi-ca2-v6-0-9fc33f27ebb9@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, BG9OXA <bg9oxa@163.com>
X-Mailer: b4 0.16.0
X-CM-TRANSID:QCgvCgD3f4BsKr9qRjXKCQ--.24074S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XryfJrWxWFWktFyxAF1DKFg_yoWfurbEka
	4xuF15uFWrXFyFgw45Aan7GFyjqw47Krn7A3WUAF18A34vkws3KFZ5t342kFyxur43urn3
	CFs5JryxXFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_YiiDUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3g8wnWq-Km8NywAA3q

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board computer.

Signed-off-by: BG9OXA <bg9oxa@163.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843..a3191bb90 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -182,6 +182,11 @@ properties:
           - const: alientek,clrv1126f
           - const: rockchip,rv1126
 
+      - description: Alientek QuarkPi-CA2 board
+        items:
+          - const: alientek,quarkpi-ca2
+          - const: rockchip,rk3588s
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board

-- 
2.47.3

