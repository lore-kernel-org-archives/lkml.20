Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2ED51EE0C;
	Thu, 17 Sep 2026 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662691; cv=pass; b=BHVCeAzQwKczgpiEpOqMx7pyMyfzdUat2mHln7MLgKQwKoydECy2tzi/M76K8fUFw+24hHwKTkE+3VGf4YN8uGQxDZFtkfZxvqHXP/TJI9uqKSKVOJrn08XnPqGlFL68TGKqNLApl1NYajctp8zSzWtjW+0q0AyhYo4P2Lgtl1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662691; c=relaxed/simple;
	bh=3xCk7OGClnr/wXNaDol09PLEBK26cy2PA+QvNHwN47Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJPPE/6VhOkjXxdgXHP3neP4dc7BcHuuymYjW+JJRTcS4oxSdcI8k5OkeQXYGEYRT5XoXya/5VzG4696LcqSzMYE1VfTbz5j+GTbhDSqPAtukkd0XiEHNr3p0iK1m0eiGN0b40wP/WP6f9XTl4a3olnssBWqgCb2DNqONKq2jeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=hwAD0j7N; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="hwAD0j7N"
ARC-Seal: i=1; a=rsa-sha256; t=1789662662; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gnYBVvwbxguZPKcTueRFRVOdJ/Ik5PTmF6P9/oEPZkDLrLC1PhEhy3n09ZkJUhDXPuegv2asODvqMa8FrW6paKLnNvBclvyDfuS4ESU6bgy8pu44wZc6gkzbLfuLyCQlJxIgDOjKkGxKH5zURZD3Mi+syG1OUirNSim5dIFilIE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662662; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d/R38e+KIiy763V8ovXVlsoTRmA0dX2whnVD1VgfDpo=; 
	b=XbOVqNYPwQm1wgO5X2OmGqO8jPzbGDqt0ngnWqfDVwhj12qVzlJhuPlmDxS0MlF7LIag6ZZ7flt7KofoqmkN4JWYqZwqd0/w70dw+4tSP5zb9FOinRD6z+//3hVgQO16p3xLk+k53BFuD3e4GKNb9CE3hYbykMMIkKumUjcv9xc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662662;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=d/R38e+KIiy763V8ovXVlsoTRmA0dX2whnVD1VgfDpo=;
	b=hwAD0j7NWo4L3/iZ1CCFo8mJTZp+pjydJ0dryhC8W77OB6PVC3VCj8bGj592D8zV
	h6CtqKOqWmuacuiU/m8RtRX0Or5QFrjDlR7J4N7nKIobiWF7E0qGPu4Mpas2f7DB9Gh
	a9J071Bdt0GRJ/rbH46oBcZVDBYegUEOqLDmsA74=
Received: by smtp.zohomail.com with SMTPS id 1789662660763610.4312802809931;
	Thu, 17 Sep 2026 09:31:00 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 18 Sep 2026 00:29:36 +0800
Subject: [PATCH v3 4/6] dt-bindings: timer: sifive,clint: Remove
 spacemit,k3-clint
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-k3-aclint-v3-4-cf4fd4050e14@pigmoral.tech>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=3xCk7OGClnr/wXNaDol09PLEBK26cy2PA+QvNHwN47Q=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiHazCkv8ci1LtL/QXJ/zZX2kdUz9og+FZqf851bIH
 eK3LQ7tKGVhEONikBVTZOHyF/9nrcPz7YhA632YOaxMIEMYuDgFYCJaHowMX5adOjSHlTXfoNal
 s7BdlPnLQn3pww4Rs2/amBeKP79+m+F/HN9JvttnChsVvPTXcv1ZY14TbGuneNrgu93Co5FfLq5
 hAwA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The SpacemiT K3 implements separate ACLINT MSWI, MTIMER and SSWI
devices. The existing spacemit,k3-clint compatible incorrectly describes
the SSWI register space as a legacy CLINT.

Remove this compatible, as it never matched the actual hardware and
has no remaining users.

Fixes: 6cdeb30db4d8 ("dt-bindings: timer: add SpacemiT K3 CLINT")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..d53f52e80d88 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -34,7 +34,6 @@ properties:
               - microchip,pic64gx-clint # Microchip PIC64GX
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
-              - spacemit,k3-clint       # SpacemiT K3
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100

-- 
2.55.0

