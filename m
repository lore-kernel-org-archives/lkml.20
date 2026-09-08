Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18AB582BA6;
	Tue,  8 Sep 2026 16:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885026; cv=pass; b=tJfMDYjD4lOtoFNIwBUupqktTrSE0t9g8RIRCFKVDPUQ6mnrW+nhKibXyMBlBmlctb00QKkOuUDA7aVqWi6rrPtbMAjbCQnDj92Hr25MvpDL2Y97ZLTNHXR991IOwdCNCxs3w+bfR0tEfhPkSf6P89F4AKaXIanedkvAqE2F1Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885026; c=relaxed/simple;
	bh=h8aJIH7hyzSaiZSkDnw2JIZGmRG2/AZ362IquoczBB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Um77Ke6DksYYSBhgBVTgoBuea2WDAabOWoEzZg0CSiVrnptp3RdKuFMvK0HbnacfeWMYWFPnJOMPs24rM00v8MN116DBbrM4o/fnc4V6RdfztWj4WCUIUO+ZHfSD4jOwLMJbvhsrEsFfC9hNvL6uM/kGARXh01akATyN8JY0UVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=CFhx5rPn; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="CFhx5rPn"
ARC-Seal: i=1; a=rsa-sha256; t=1788885001; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LQPOiqHS8O2y0iWeuFbT0sDgA308iisGfKmHfixf/fhl+s644VSV6iO0734sEnK5JeHzXqzDXuQW/duBbWZ+kKEcpuMMJmLJw/liCg70fRykKk+Wcf+9B9yq1oVXBTsONVdzGHDD7TR7xMp3mnyyF74F1AsKAJn4iYSrznubv+A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788885001; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DbZb7rgl/7w1w4tb13GdbjXjUAAevHFVnXZh+5Ul2mc=; 
	b=I4g3Zax4KezFYoqEQWJQL+4mprqq6oE+EUsuckrOKRlRm5uZWvhR2mHfZTLk3YI1H6MJSMjZHBgMR/Ak3rMOR3On2dJwA3yGBIZ3hPB/jYXOazGYFo/4xmsVxObOyz1fGGiR7SpfM4ipYqh6TVYaBCStSP3XL57OFH7ObMylF9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788885001;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DbZb7rgl/7w1w4tb13GdbjXjUAAevHFVnXZh+5Ul2mc=;
	b=CFhx5rPnXtUuX7tm+BFhX/+6YWoO4k42HdsW8MIuiMlfQhH/7AhwoI8JqgLzIjJ+
	59cUQSrpYbeCy1Wy3T9Y59kaZ/TrvcOzVOIJEb88QpLHgDU9K6aR/jvO1NHClCmMOAM
	UxCsxCSFl3db1JLqhH5mpX3TUY0b8xucJTDFIPsI=
Received: by mx.zohomail.com with SMTPS id 1788884999420980.2422992482639;
	Tue, 8 Sep 2026 09:29:59 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 09 Sep 2026 00:28:48 +0800
Subject: [PATCH v2 5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-k3-aclint-v2-5-7931e5bc86ad@pigmoral.tech>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=h8aJIH7hyzSaiZSkDnw2JIZGmRG2/AZ362IquoczBB8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmJ+/eFOyw/1A06Y7ZTcPitVX1TZMeXJNmEnMve74D
 aHNIi+edpSyMIhxMciKKbJw+Yv/s9bh+XZEoPU+zBxWJpAhDFycAjCR6LOMDG+/Mu7cEcN9cYMQ
 765JzMfmBLwV29nI+vU3391dfiwmt5sY/nA+ObVvzuHQ5bkyVfPm7mh6Pe3mtMiE/Q7lxzg45KT
 q7nIAAA==
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

