Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1078551EDFF;
	Thu, 17 Sep 2026 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662697; cv=pass; b=X4WDwBncqO12RHq83JpickohZMashIYrypl00uiqDdgteMYaXlWclJVhcQUdS9x8fF9Y50uj6CnBOJJpEZfk3vi97cV5y91NK0uIn/dXuyr7XnCw1WvNBn9DHZ9psazTCFwAm1e9MV/2rBCeOESRuJaaOJiQJO9j4xvl1o8mzsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662697; c=relaxed/simple;
	bh=h8aJIH7hyzSaiZSkDnw2JIZGmRG2/AZ362IquoczBB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tauywn7cb9tPmfGyqLEvkU695PD1ei71/+gJ19RIfQoTxtA0CWpe5Vb7ObO3cnoGA6FSXozrntVBfIAMSPbpjx6UEYIVXqLTtCH0+kJpJnyUr1wehuRjuGfkxO+uCb67gxtHBLk+p2Eg+bElkszmlNhgIkUCLE1S+TKPo1ouoXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=nEZHgWWs; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="nEZHgWWs"
ARC-Seal: i=1; a=rsa-sha256; t=1789662673; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lI7xMM7oeI5QArXfSL/hnCeQEbm5vEI5mLg9moxopL3ljz9jF9FOrqpg1LeqoKGR/b0UIbmx6GOO3otW2IjeA/k6mgKfNlxd8VoOymwmuxMdsfWZLSS0fE1VzevGKL79edfzLdry3ANMYKl5XTKIZil37E+lapr7en/v3duNj4Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662673; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DbZb7rgl/7w1w4tb13GdbjXjUAAevHFVnXZh+5Ul2mc=; 
	b=GgdX5EVGncL8+tdOuLvhUZtvPw7yT92xn/cAFjtz6H1SC6dQrZG1a/jPc0wUXKl0WV0sfk1twbHqh8oMt1gusAoyxWCl20Vjo0tQd1kOS8E95PtNSVAGISBwTgABNYuLGQsYqETXBuk7RMfvXsh8fUBi1vlQUictgVxWnKQ0OiM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662673;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DbZb7rgl/7w1w4tb13GdbjXjUAAevHFVnXZh+5Ul2mc=;
	b=nEZHgWWsaJtsyur+5fl+JWlP5hcMk7jVKqqFoMUTSuyiCmCdMhN01r0kT//vEcv8
	SUxpvCENOElhx89NBVH3W2P0lbUDGIKvTxatnFpYzjzEucq53XUFUdEscBRCcH0lDZ0
	cWDSOKeLXJwXmhGk8IV+f20R0u4pATmVZ4WqHEB8=
Received: by smtp.zohomail.com with SMTPS id 1789662670954111.87388827889936;
	Thu, 17 Sep 2026 09:31:10 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 18 Sep 2026 00:29:37 +0800
Subject: [PATCH v3 5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-k3-aclint-v3-5-cf4fd4050e14@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=h8aJIH7hyzSaiZSkDnw2JIZGmRG2/AZ362IquoczBB8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiPb1TLomq2Zwa8+84j1zGaYd7jrL5my1lc3tSLm8p
 1sE58mtHaUsDGJcDLJiiixc/uL/rHV4vh0RaL0PM4eVCWQIAxenAEzE4CLDX7Fmb7+W7tNz1rF/
 VJJoP+TcsCLy7qbzV8TUitcuO9K1Worhn4KlSfrTac3/qxRWScVpMjuuFOBetsBmuvvzDXsWpiT
 u4QcA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Add a match entry for the spacemit,k3-aclint-sswi compatible. The K3
SSWI device requires no special handling and can use the existing
generic ACLINT SSWI initialization function.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/irqchip/irq-aclint-sswi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index ca06efd86fa1..d3ef2cd3b5c5 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -179,6 +179,7 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
 }
 IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
 IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
+IRQCHIP_DECLARE(spacemit_k3_sswi, "spacemit,k3-aclint-sswi", generic_aclint_sswi_early_probe);
 
 /* THEAD variant */
 #define THEAD_C9XX_CSR_SXSTATUS			0x5c0

-- 
2.55.0

