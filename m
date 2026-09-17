Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EBA51DDF0;
	Thu, 17 Sep 2026 16:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662676; cv=pass; b=CoU1CeA8CYybsNC/ZLfaGRn7lTHbZVd6YRnpP62E6AWbQ/OTzbT6Hy4qo/hlxzufca1X+erV45mGpWTTdX6ogb7Z2ehG4q8/SNG8VRyhXpYmxp6/Da30585Oodxs2YyvAFQMSMIfKRf/5xx22hdytiGZAF143omXDE7WWuZCdCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662676; c=relaxed/simple;
	bh=5SW1nm7vQ1BZK//GUhTsPrMSo+O35uE26pwaraXiyH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ucbpS5eVKrQv6ZJ3TPvt13/ur/Dt/0jnNhnGfIpX8vd3bOb7Dz7qD4ly61Nih7pNYtWf8ggi1vM5pWmARA/Dmm69fyegwwQbtvkSwsHYlIduOGeduErAEMDmg9oKRCJ7ie6WHcWBtWpJDcVdthkWKypwURSpB4cGw7KNBYrgCWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=gdaMO3UI; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="gdaMO3UI"
ARC-Seal: i=1; a=rsa-sha256; t=1789662653; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lvxC/orxBvwnPvsI+Ac8QvpPGiQNL+TpN7k9oEBdOWWBS4uQCp0dPn7WkzAJNOPLESkQxN4LafpzrIRqmRwWhFCHgmFgu1pA27cqQrAtzdIzz5eE9sLpeI2i7u3Nr85bM9Di1G5Zp5U08ZpOaB3PFfRsSKPYeH0Ujj3MigJeHD0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662653; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q4svquE9ejzTbVcSMhFnWV43R6UH1UzFkaHKI2NgWFw=; 
	b=KAdQ4ZsXgeX+cjhNyg9Nf4FdfDgphYIn/k6b4uVu+6YSl3j3eYY39HLtoZa3LiQQmN7wbCmhCcZxM5srsK4ckJHLONsSrBb4ieUmNt2Vj8KYj931O1opT7adRUFL6ZXm61823/cy/NR+ajMLrCQ+RGh9xBOgQlsagoBtU9Ps7B0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662653;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=q4svquE9ejzTbVcSMhFnWV43R6UH1UzFkaHKI2NgWFw=;
	b=gdaMO3UILilcJqtqDTi9EmNLYfhBw2QO/SXyzz/pADst7LQfH6/OsEYaS9Sm9aWn
	C5Bu9kZrbXyLAV9Axw9krJPmYGyLQIgDx9OGT3q9V9hiR9SoHoD1tcGuMe+t7V87V8x
	yEeJIAMQGXprtzZPSPt46Ibzt9WrXA93nH6LG4ig=
Received: by smtp.zohomail.com with SMTPS id 1789662650992187.68536933248265;
	Thu, 17 Sep 2026 09:30:50 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 18 Sep 2026 00:29:35 +0800
Subject: [PATCH v3 3/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add SpacemiT K3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-k3-aclint-v3-3-cf4fd4050e14@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=5SW1nm7vQ1BZK//GUhTsPrMSo+O35uE26pwaraXiyH8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiHawrfQ50vglwTKuRZOBU3Zb+yfllzNMJ242P25x6
 AP3/YeKHaUsDGJcDLJiiixc/uL/rHV4vh0RaL0PM4eVCWQIAxenAExEZB7D/5qN02QZrgb8j14n
 KqJl+f5z95HulGjTJV7RidzHw1qlMxgZ9sQ02ZUy1q4NkVZz3HZoQ0tPkf6+0Lsl03VCzmakGa5
 nBgA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Add support for the SpacemiT K3 ACLINT SSWI, which provides
inter-processor interrupts in Supervisor mode without calling into
Machine-mode firmware.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/interrupt-controller/thead,c900-aclint-sswi.yaml        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
index d02c6886283a..0b34ed5b4639 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -24,12 +24,13 @@ description:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - mips,p8700-aclint-sswi
+          - spacemit,k3-aclint-sswi
       - items:
           - enum:
               - sophgo,sg2044-aclint-sswi
           - const: thead,c900-aclint-sswi
-      - items:
-          - const: mips,p8700-aclint-sswi
       - items:
           - enum:
               - anlogic,dr1v90-aclint-sswi

-- 
2.55.0

