Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B34A5226A5;
	Thu,  1 Oct 2026 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868022; cv=none; b=sbL3GXGgb83wgXM3VNZinR06gzwEt4hBMQYBT7XFIm1I6quZ0nHuXy8C2GRoaWXPE4/jsfpHxEkidAT21MS97Q53khVOHk0jk4pbwPMaZcj6Hb0StRomBAu5IszSkUqyIZyHMkKaEwFLE8WHPtIReoaJxyHHWeNOTOznwxSJPZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868022; c=relaxed/simple;
	bh=BEj+/B6Y2XXzZ9/4xYV4CCC89MOGIPKxEVyVWT69VTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxUIcrySEnUCpFJFiLc4kiS/yKIkTZ/YzrPVprhs0k2omMbHDuTQ1k3qiMSmQGrRqbKCfA5upiva2OP+ctwoKF+Lz1H8ElHem51smEFkmB4xGPixQJJ0wMLcYT+xTzVmJ4p252EAp3yUrEPEXDm/GYSoHyfMacZPkcW/vGzN5LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NhKjIsTm; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NhKjIsTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=HG7hLYwo6VKRj7UF0IiJn2CjzUewNY8+lmn/zodhbzY=;
	b=NhKjIsTmsyjyPz3YmhUQyrce9e+amfZYx2IH1/dnMr9BUIdpUXuXbG3AZaQb+u
	3KzwcaVXTxgleb3kKZNGzfx12mfEOJiC+SAACPNU9Y0m7nqs+lSqpp/sVeM4+xf9
	P1UeDGJ8rZKWXvqZMAzm3SDLJj4We0dejRxL/F9zMqnwc=
From: BG9OXA <bg9oxa@163.com>
Date: Thu, 01 Oct 2026 23:19:46 +0800
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: add ALIENTEK
 QuarkPi-CA2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-b4-quarkpi-ca2-v5-1-e19296802978@163.com>
References: <20261001-b4-quarkpi-ca2-v5-0-e19296802978@163.com>
In-Reply-To: <20261001-b4-quarkpi-ca2-v5-0-e19296802978@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 BG9OXA <bg9oxa@163.com>
X-Mailer: b4 0.16.0
X-CM-TRANSID:_____wD3H2MRer5qrBReCA--.56692S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XryfJrWxWFWktFyxAF1DKFg_yoWfurbEka
	4xuF15uFWrXFyFgw45Aan7GFyjqw47Krn7A3WUAF18A34vkws3KFZ5t342kFyxur43urn3
	CFs5JryxXFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_6pB7UUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3RTtW2q+ehQqwAAA3v

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

