Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810169;
	b=RWwtLbf/2fIaQgHQLlibchrOsSBbbe2PcBWMW8TIkAZAl5mk/TGcGKnKQ/cHN4ypMPf6
	 EtAIESB/oHGy/MnAlOSYYJclOLQjd9W+heWZdFyuqNxp7KWKv4S6VHxcZRMxxi0ZghSt8
	 Wr2iyhsC4RxDHw+0vzlDj6hiS1nkcdIozp8SSUIXv+8OwhVayZ9eQjpszhCbmJBxy6tbO
	 zSzeKXabAyr/hXawiYDuTvo96GKQ7jpLRqxz/b9THD8tHS4kJOS+Oh/27HuWMuQaP2qBU
	 f+/SqJ1jrt8hBEfpmpAQB9LNNnmmNRDvF89Vxs6FstLeo0zTKv7r+XB2dcPIA+qMgTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810169;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=qUQJdCDrRqnIvXLVpD8XTl0Bo54PvOPr/Tpz53Dd6Nc=;
	b=zj66ydcECXDpZRZmh0UIKkZhPu+oeeGE57Nk8bvJV5IS8vjxxF2m05IRTs74B6lecnGz
	 FG//35ILAI0Xg2rFpnQyw3m04hKKh3phWRZVHwrJxco0wDJAOnyVgdyO4gsB8LM0QLiWG
	 SNOAIAkg6vEdneHRSqRfGX+a86IK1lgdrJ30UsY17wFaSuruE27zYrl/0eVAQc8ZwIMW3
	 OI0DkGxVNyPyasCqH/uwakGMvcDy2/N7opfA/BwDNl0jS1AW5z8LgEvNAHB0N8L11UhRc
	 mkKniYH4ew4WsPcr1jCAjTRmNsbCLHopK0ptQpz49Zf8zft8KlN3fOF9e+0EI9vkaog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="XBKje/ia";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314F8606A335;
	Wed,  4 Nov 2026 16:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 314F8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XBKje/ia
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=qUQJdCDrRqnIvXLVpD8XTl0Bo54PvOPr/Tpz53Dd6Nc=;
	b=XBKje/iaGps306YEZsz9AfH4Ce4hcEuLV9XauDih5wZqrhn68hDDZNxBFu9IW/
	OOCmbA2x2nJNGwzPxbIVwOLbmib6N4qEoSYdFoRopRJeXPextMzPezJmhm2PcZkO
	ELC63ySEMoxy3sUo7xUmxgWkbmaJ4rlCQTrCqzzKPhEfI=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXH7_CXutqdSA2Fg--.15833S3;
	Thu, 05 Nov 2026 00:35:17 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Thu, 05 Nov 2026 00:34:54 +0800
Subject: [PATCH v15 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
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
Message-Id: <20261105-quarkpi-ca2-v15-1-2347608d717a@163.com>
References: <20261105-quarkpi-ca2-v15-0-2347608d717a@163.com>
In-Reply-To: <20261105-quarkpi-ca2-v15-0-2347608d717a@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wDXH7_CXutqdSA2Fg--.15833S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr43WF17Ww13tr1xKFykKrg_yoWDXFbEka
	4xZF15uFWrJFyFgw45Aa1xGryqvw42krn7AF1UAF1kA34qkws3tFZ5t342kFyxWr43urn3
	Crn5Ar97XFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_pVbDUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+QVey2rrXsVdAwAA3t

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
computer.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cf..db93d97eaa95 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -187,6 +187,11 @@ properties:
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
2.34.1

