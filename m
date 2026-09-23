Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3A233D6D6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152654; cv=none; b=ZNJBNQTsnTqhPSiU60XjV4/FAPAEsposSnR4r8niqH8j9PH88KYR+9QuWecGdd1LK+1wtCazrhw6oE7txWptNxfzqW4MfSfX8ueFbCcvmdfw5gGkV4V/clJdXmzWX2z65FFywiLuZ1aTj/CJKJ8U8Sdw4lb1cr8Xskmklawo7w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152654; c=relaxed/simple;
	bh=n5ZSB1SLJvHUrFcFNTTI/FCdF2qh78Jx+GRbTOUAjcY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T3jkEnFdQUhRuWaJvGTltcwqS/3/aWBvEgCeoUttfIIVFB55ZV480eHIOeNEDP5dgAnSmCdIG3ZWq9Lw37hpV6Kn1PuTKbiYfYlnHF3VFp/KMElL8/LryLNP0luGyRmtgo8JwuuAPjhTPIPaNCqXKPUwynIZWdd5kRldmB4qawg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Vb25jRXG; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Vb25jRXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790152645; x=1821688645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vzP4sAc+QEd6N2Rrf644vF3EpqR7lb90v2jCieXNJwg=;
  b=Vb25jRXGWIbJZ6WTcfW0itBsfZDA11fN1gFyeCfYZ4bh7awzlQUFJG9u
   lFtDLDyKBpL9Nlpm6RHksrRLt9F45h6TMctREasqHCdLZu0zfA4jcnz5W
   7YF52lXBlolwNoUZjH3WAn0nt5GpbjK1eVUuKlHxJfOmup1aepcdbqWHs
   l2eHFziXpute95k3t3qF5YadYSucsCrFLdWYA1vRFwnGhV91bYW2rbcpY
   mWjrkb8HDt2lq8XuT9R3xlyfrdi8bsP9JNthg3VOEW1jDaTmwWiXNtX60
   WPWpatKdATndXX/dQY3hfzlSvlV0z1y9zgJPAYFEEG4Rtijz1HbEniv8B
   g==;
X-CSE-ConnectionGUID: yKqgrZgVRoehWzb7KbNZOQ==
X-CSE-MsgGUID: YTxlBIf7Qva40P0vbJq0Cg==
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="29457104"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:37:16 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:6659]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.35.200:2525] with esmtp (Farcaster)
 id 5857cd88-a10f-427e-8576-0d37b6980452; Wed, 23 Sep 2026 08:37:16 +0000 (UTC)
X-Farcaster-Flow-ID: 5857cd88-a10f-427e-8576-0d37b6980452
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 08:37:15 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 08:37:14 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH 4/4] irqchip/alpine-msi: Add debug logging for MSI allocation
Date: Wed, 23 Sep 2026 08:37:03 +0000
Message-ID: <20260923083703.38974-5-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923083703.38974-1-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add log messages to help follow the driver flow when debugging: an
info message on successful initialisation, and debug messages on the
MSI interrupt allocation and free paths.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/irqchip/irq-alpine-msi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 8155f63cfd29..0e68f81014e7 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -104,6 +104,8 @@ static int alpine_msix_middle_domain_alloc(struct irq_domain *domain, unsigned i
 	struct alpine_msix_data *priv = domain->host_data;
 	int sgi, err, i;
 
+	pr_debug("trying to allocate %d msi starting from %d\n", nr_irqs, virq);
+
 	sgi = alpine_msix_allocate_sgi(priv, nr_irqs);
 	if (sgi < 0)
 		return sgi;
@@ -116,6 +118,9 @@ static int alpine_msix_middle_domain_alloc(struct irq_domain *domain, unsigned i
 		irq_domain_set_hwirq_and_chip(domain, virq + i, sgi + i,
 					      &middle_irq_chip, priv);
 	}
+
+	pr_debug("allocated %d msi starting from %d\n", nr_irqs, virq);
+
 	return 0;
 
 err_sgi:
@@ -132,6 +137,8 @@ static void alpine_msix_middle_domain_free(struct irq_domain *domain, unsigned i
 
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 	alpine_msix_free_sgi(priv, d->hwirq, nr_irqs);
+
+	pr_debug("freed %d msi starting from %d\n", nr_irqs, virq);
 }
 
 static const struct irq_domain_ops alpine_msix_middle_domain_ops = {
@@ -235,6 +242,9 @@ static int alpine_msix_init(struct device_node *node, struct device_node *parent
 	if (ret)
 		return ret;
 
+	pr_info("initialized successfully, spi %d to %d\n",
+		priv->spi_first, priv->spi_first + priv->num_spis - 1);
+
 	retain_and_null_ptr(priv);
 	retain_and_null_ptr(msi_map);
 	return 0;
-- 
2.47.3

