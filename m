Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7CC36C588;
	Thu,  1 Oct 2026 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862698; cv=none; b=f7NpDGPS946J/FrZ+ccJaG/l5ZczXk687n/KB2Zg6e8mVn/RGOVv9bJRSk84YeyvxDhKXo0JRod4pGi548ygyg2h0Dy8+E8WZQhtCVwM4e1UKE0dtSIxws7fhy4FarwWX0ToNe3gMx0WQqqEK5FSBf2C8pqprJ/fKeNqo1d/Ggo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862698; c=relaxed/simple;
	bh=ZifscX9ECT0mS9cXZ5DR6c3DldNnefWRukZDDhcXf1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References; b=BlZ1NQKmJ9F41LTlzV9Llhxar8Kco6URxQfrKhYP0qNBcEpfl/ZmqMRag4nJ9lco5anRro8X6tyMRILxli/2L2kGTVrCdDRTrE/CBEJU0cARFzJNHAKp5FJTJ6Sekrh76x7MPgp3w5dpDNsMEUZNcRF8lMLXspCOF61JoWUWlyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=L12QBrto; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="L12QBrto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=UkHYuan1PuG6FE1
	cRuk2LF2qvnvHGpPzEYvnaNQadyY=; b=L12QBrtoPn0tepl5hLDhAJkZpszENHC
	FSrj2C/J9L+cW1SsWxOGaRX3ujnH4bFAwAt1wiZ4yoKLFIUT56byl1rij76EtqCD
	VuDkX89jvaN7fBukUoGUdLdwdDHV2LDI0Yplnh+43i41avGLxaEjFwocUyeuLI8I
	CzYjwPJMn+g4=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: add ALIENTEK QuarkPi-CA2
Date: Thu, 01 Oct 2026 21:51:03 +0800
Message-ID: <179086266302.29834.11881496781543805639@163.com>
In-Reply-To: <179086264917.29834.5543033479795788817@163.com>
References: <179086264917.29834.5543033479795788817@163.com>
X-CM-TRANSID:QCgvCgDXxWpGZb5qGONvCQ--.6059S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XryfJrWxWFWktFyxAF1DKFg_yoWfurbEka
	4xuF15uFWrXFyFgw45Aan7GFyjqw47Krn7A3WUAF18A34vkws3KFZ5t342kFyxur43urn3
	CFs5JryxXFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbq2MUUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3Qe0Imq+ZUfjmQAA3A
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

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

