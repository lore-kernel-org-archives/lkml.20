Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9260B3B774D;
	Sun, 27 Sep 2026 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496410; cv=none; b=scatDTx0tqhVvLGMjNYV8wn9xS25r02WMJ2Qk6xijPgkrWRkyVUEgrrRdNW36KXPCu3JBIJ/RoBDtRx+n6YQs0dJr4pgf7v1fq5ecSR52d0Lzj0fsAkko3966tRBt2CdP/wBqjuF4xkVe5pcujQOtZu47yTC8+oxBn32IDiuAaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496410; c=relaxed/simple;
	bh=TQslhQ2BI0bjh7zzJg2Cna7rUbTdb4w1dluY7qdSuFs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Un166G6RdKRqRbD3ULFme1Igl72LQcPD79rQVB+ZrRIbTTOv8QhNcjl5Qa7Cr4QTBsB2LEvN8H5qzszKKjBi5SXJxcE602SLBI62MijXpU3KCE6Ej1mdA40fmcbJQZaPXnxjXNKSVPBqpPJy4EALs69qG5IW9Wted86dUA+J3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=FBV3n/sb; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="FBV3n/sb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790496409; x=1822032409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gxL7gOF/ZLCVUUQTZZzzxEYE6WokdQEaF5LSqbrtSeg=;
  b=FBV3n/sb/0QcwlljtFtanTbLTHPaheO06iNT66FmAfy9Vkv3XWHulgDV
   k3q55uMIXpPXg2ciOBsYho4oRNe93MTS1DuNbXLe3vONUec9aYFiD9Ir2
   tf92vIvRN08HUcDziDRfftgQCAjxf9CzYE1/ZoxCULQNGmfBs/ZiZRtM6
   JAfbvtn1PRy1F9h6ahzQIWKnDzACMWYwBM3J5eCEClRpPtZ4YfHBWmpLe
   jAP/1YIgzMGIPWfxXKhhHvZ2jiKSfEwmWercAxHS/eaY8xNZQ2TR/i0TQ
   WBlWwDJmJQeFreyoyui2OKvjFpY1AvukPg/LS7QJC6hZrOMrbZzJpYI/4
   Q==;
X-CSE-ConnectionGUID: 2OTxk0tOTVeSIyEXWmp78Q==
X-CSE-MsgGUID: /8UcMptZQxm1i0gQhpak6w==
X-IronPort-AV: E=Sophos;i="6.27,126,1787011200"; 
   d="scan'208";a="29538869"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 08:06:45 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:17025]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.58.237:2525] with esmtp (Farcaster)
 id e6fc282b-a836-4cee-b694-552e875ac656; Sun, 27 Sep 2026 08:06:45 +0000 (UTC)
X-Farcaster-Flow-ID: e6fc282b-a836-4cee-b694-552e875ac656
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 27 Sep 2026 08:06:45 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Sun, 27 Sep 2026
 08:06:43 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/8] irqchip/al-fic: fix argument alignment and a repeated word
Date: Sun, 27 Sep 2026 08:06:30 +0000
Message-ID: <20260927080637.27285-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927080637.27285-1-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

The continuation lines of the irq_domain_create_linear() call sit three
columns short of the open parenthesis. They were aligned for
irq_domain_add_linear(); commit affdc0d1bdfa ("irqchip: Switch to
irq_domain_create_*()") renamed the function to one three characters longer
and left the indentation as it was. checkpatch --strict reports "Alignment
should match open parenthesis".

al_fic_wire_init()'s kernel-doc reads "the fic hardware to to work in wire
mode". checkpatch reports "Possible repeated word: 'to'".

No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v2: new patch. checkpatch --strict cleanups (argument alignment and a
    repeated word) split out ahead of the functional changes; the touched
    lines also appear as context in patches 3 and 6.

 drivers/irqchip/irq-al-fic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index d10ac9b63c99..35581332b40e 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -132,9 +132,9 @@ static int al_fic_register(struct device_node *node,
 	int ret;
 
 	fic->domain = irq_domain_create_linear(of_fwnode_handle(node),
-					    NR_FIC_IRQS,
-					    &irq_generic_chip_ops,
-					    fic);
+					       NR_FIC_IRQS,
+					       &irq_generic_chip_ops,
+					       fic);
 	if (!fic->domain) {
 		pr_err("fail to add irq domain\n");
 		return -ENOMEM;
@@ -180,7 +180,7 @@ static int al_fic_register(struct device_node *node,
  * @name: name of the fic
  * @parent_irq: interrupt of parent
  *
- * This API will configure the fic hardware to to work in wire mode.
+ * This API will configure the fic hardware to work in wire mode.
  * In wire mode, fic hardware is generating a wire ("wired") interrupt.
  * Interrupt can be generated based on positive edge or level - configuration is
  * to be determined based on connected hardware to this fic.
-- 
2.47.3

