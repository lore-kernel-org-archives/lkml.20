Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F6247607C;
	Thu,  8 Oct 2026 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450070; cv=none; b=OqIkEpShjhHTWmFVoSPtvtkpxaAigjxiIwkzei1uC30QeM3Z1v5IR5X2/gyLE4qHrw2Idd5I1Ut2GGyhfFSPjWpNragw2G/lK07m9GocC8nxtiv+UDzd/s821CFDuA6ucm3OhYsbGMPKpgmku99aFC58WOHBAWbAn+1qEEPii9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450070; c=relaxed/simple;
	bh=ESwhqS0jE5qUZtXIz55D5MrufOIA+wXuas/GNiSmWKk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxmbDQyP8HMaw/WoQHcQ0C0F5/JlfcyiNM9dQx70ZRMlwRHmTzf0csjS9wZhGnUVCaVD/rHQRgu9z6R41/YKbnBAr5TLx19nNI29QYovdQaiHsh+7d7iHktx6+YqqCJyzAU7w3xAnyX2eCySUu0bEECcBzV7rkBLmsvVE8lhv0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=OqWgZZYX; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="OqWgZZYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791450069; x=1822986069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b6K1w+VnnmYpCWKqN4QeJt+VOXsYzYKFMC2T/Wy0v3g=;
  b=OqWgZZYX/Ye/hDu5VkmnEDLsYdiEEweCNB0DixKiy35qzka35ic7BkO7
   EbfmQIh3nRSPMXsx5geFymFkvMQ5uDvJz6ZSTaG2XhzTGntuyx2bG3NvQ
   IyGUklyR/PuIPxsh5j4CnOzlMOFsuGvTNKMT/MMTvHJfnQGvk78F96rtf
   kHfTMkeXE9dDH1mDSw6tYVE2uZssVyY6gwBtmRKxDSkzA6ouxI18FQZ+6
   rKS2cXs/b//iUz6zDfyWbuB3bmKs4m60NWMVIMj4aktQ6w2FmI5PUH/cF
   E6rFei+j6y7PDROr0zP1mJD/cUjxo+OmES+7rj9bkAvMw5xgV1DHvcG6h
   Q==;
X-CSE-ConnectionGUID: bKzfVwIrS9CapR+XCvYhng==
X-CSE-MsgGUID: 74tnak+vRx+72zEnHctpEA==
X-IronPort-AV: E=Sophos;i="6.27,146,1787011200"; 
   d="scan'208";a="30709615"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:01:07 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:25699]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.36.228:2525] with esmtp (Farcaster)
 id 21b05c82-88ff-4f44-906f-8022399c8504; Thu, 8 Oct 2026 09:01:06 +0000 (UTC)
X-Farcaster-Flow-ID: 21b05c82-88ff-4f44-906f-8022399c8504
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 8 Oct 2026 09:01:06 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 8 Oct 2026
 09:01:05 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/8] irqchip/al-fic: fix argument alignment and a repeated word
Date: Thu, 8 Oct 2026 09:00:51 +0000
Message-ID: <20261008090058.38591-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008090058.38591-1-farbere@amazon.com>
References: <20261008090058.38591-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
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
Reviewed-by: Radu Rendec <radu@rendec.net>
---
v4: no change.

v3: no change. Added Reviewed-by: Radu Rendec.

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

