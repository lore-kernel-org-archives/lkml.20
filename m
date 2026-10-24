Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792870630;
	b=hbA0kSuBdVvmHoZ4lk+PUy2DwPH+iWTBgEK9HlyivXQGXy5HXXMgx3jifu7RY6A9DqRd
	 8ZTEU/YFanJUOSwswexXpNhSkZqiSnOOYPJsNF0sgJVvBYJ8PlL6L5JRSOzxHKcPU8C8y
	 pkgp90ocdPjXJElPwyyZkzamyO5UAst7eyUVMaZPhlZevqGeea8f18n3NF9vuatJQnpvx
	 VZVsDOt3vlIV+ZbQTrBtJB/b9f0/byOhQV8giTuFGDZTP0YUzfxH6KYXhRwct+lFs+Omq
	 NvX4aQiLczR9cZPrGBpSPh3WN0m1u261MQs4RubPf7kAaYRACCPR+d9RFy2pzj55R1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792870630;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=yMu0dYJrCWSiOfaDMHw/hzzu7wk/SUoyHAnzJkBIeJs=;
	b=XcH0tA8YplbfExEzHmUWT6SDOy7PRdNJo7A+xr3+R3Zm0EkYbN8np4rsL4MWTXRd2gjs
	 3y3Kk2sZc6FHsNIO5wYvRtrxMFgLku59wgwEmRNc79/h/icCFp6mzVZqts64D08GPNbMm
	 zPKpZtXkCsgS4qa7zH0C+Llx95EwOG8d6O8WboWOWGKM2cuya8MugLBMrjBt8xt0SsRT8
	 4IqdyD5zv+uN8T3ap1jKbSN2gYRcL5haO5sI76rtTKrbp7EAS+EojahvHpXkbC64A6h24
	 RwFG3x6tCezL4WQIfuTdci/QzHFlEDn0+LTf1ReH+5pFUD5ggnyNicGNBrSV6FqGmNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=dTrKrXZM;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D2606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B32D2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=dTrKrXZM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870629; x=1824406629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yMu0dYJrCWSiOfaDMHw/hzzu7wk/SUoyHAnzJkBIeJs=;
  b=dTrKrXZMLED8C+tG5okw6dhFV0XG08l9FmM7eNh8A9IZKcr1gEkAGbFp
   aQm+06ua8WJNqjrdslA+4VDIgaKnMWdB+8BD5EYDaBTj8RLerBYuzewOp
   53rF2V5as6PcWXGND6y9lzKOhEFkI1S7Iqd5ZKbs/brBR9JW+5TvwW5/P
   5V0E+9A97XBbvaHjWGrwWI5jAUu9xLjw6QOo2TA7IC1o4Aj0xO44eBCwp
   5VKrpPi3jyh5iGGt/igWFW5QWRpG8KwZLFWhGOAo3E26MPi7AkyScBigM
   jGG/tBP/gh3aovR8BUB9JrbJABcVy8p/LYYzJBJJ9H5nMxq7N6gcY2Fx4
   Q==;
X-CSE-ConnectionGUID: 33Vujdh8R+aHpA/YdbLOhQ==
X-CSE-MsgGUID: GTTrso5XSXu6LCk6brR0KA==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="31923595"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:37:07 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:24348]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.47.193:2525] with esmtp (Farcaster)
 id 0659cbb4-d2aa-4aff-9f15-f722995b7d39; Sat, 24 Oct 2026 19:37:06 +0000 (UTC)
X-Farcaster-Flow-ID: 0659cbb4-d2aa-4aff-9f15-f722995b7d39
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:37:06 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:37:05 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 5/5] irqchip/alpine-msi: Add debug logging for MSI allocation
Date: Sat, 24 Oct 2026 19:36:20 +0000
Message-ID: <20261024193620.39999-6-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024193620.39999-1-farbere@amazon.com>
References: <20261024193620.39999-1-farbere@amazon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add log messages to help follow the driver flow when debugging: an
info message on successful initialisation, and debug messages on the
MSI interrupt allocation and free paths.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v2:
- Use %u for unsigned values (Radu).
- Write MSI/SPI in upper case, to match patch 4.

 drivers/irqchip/irq-alpine-msi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index fb84b6046193..c13646c763d3 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -104,6 +104,8 @@ static int alpine_msix_middle_domain_alloc(struct irq_domain *domain, unsigned i
 	struct alpine_msix_data *priv = domain->host_data;
 	int sgi, err, i;
 
+	pr_debug("trying to allocate %u MSIs starting from %u\n", nr_irqs, virq);
+
 	sgi = alpine_msix_allocate_sgi(priv, nr_irqs);
 	if (sgi < 0)
 		return sgi;
@@ -116,6 +118,9 @@ static int alpine_msix_middle_domain_alloc(struct irq_domain *domain, unsigned i
 		irq_domain_set_hwirq_and_chip(domain, virq + i, sgi + i,
 					      &middle_irq_chip, priv);
 	}
+
+	pr_debug("allocated %u MSIs starting from %u\n", nr_irqs, virq);
+
 	return 0;
 
 err_sgi:
@@ -132,6 +137,8 @@ static void alpine_msix_middle_domain_free(struct irq_domain *domain, unsigned i
 
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 	alpine_msix_free_sgi(priv, d->hwirq, nr_irqs);
+
+	pr_debug("freed %u MSIs starting from %u\n", nr_irqs, virq);
 }
 
 static const struct irq_domain_ops alpine_msix_middle_domain_ops = {
@@ -235,6 +242,9 @@ static int alpine_msix_init(struct device_node *node, struct device_node *parent
 	if (ret)
 		return ret;
 
+	pr_info("initialized successfully, SPI %u to %u\n",
+		priv->spi_first, priv->spi_first + priv->num_spis - 1);
+
 	retain_and_null_ptr(priv);
 	retain_and_null_ptr(msi_map);
 	return 0;
-- 
2.47.3

