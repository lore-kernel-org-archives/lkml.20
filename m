Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A904947DF97;
	Mon,  5 Oct 2026 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199511; cv=none; b=nQ7drSzOvvRHJ7+zx32rYCb4wAk63JfaBd8JPIRVMZ48PLoly5T4sKGZmCHE9+9VYliceRAVXaPfr6xTVf+0wyEmGkhI8D4dqmvpBxt/gsXilZzYx6/B9FDwYNZVKqKRb3hFTxw0D2t3NLTMA8H8A+tNTw09ITaZ1D598Bov2tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199511; c=relaxed/simple;
	bh=8CVO6J3w4Q0ArG3vrTWu7p+CbFrxOL7DhiE4vYINQvM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ghSsK03PQ/1H8DyuCCOTQS5Go6PlpE0BpGuVN+z3hR/J6AB1pkxTQKmRKqE2H4wOxE/fhuf0yOI+MEkVKc8gqUJRYx2WAU8jUmgVKCqnVn83olR/a3H4uVvUdgnOyv+qUC63SK3z60wvOZBJHuFXi8GR4emzTkbG4RuIY1t52bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=gZ9pqAb7; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="gZ9pqAb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199509; x=1822735509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hsoh0vA39o/rcCx9IHnSYbMF3qklRpfwp00XGc6Xkf4=;
  b=gZ9pqAb7VhMZMg52fidqoRVryutxb8sHxP8ff5hKGosfeOsHGLjgVYG0
   rlE/Zlp1d4pSmuzFlu5821oIm9dk9UudKDFMz47cGJf2aS1I8V586Bi6A
   lOvnZZK4lX/6KoRJJnBzddl6i4x0JfgzWQd+CKu+ayjfEdB25g9cxD/fm
   kQa5HiyIqSEKFRhLzAXL8jUaJyEiPilGZdm4U591alUjOYd/NzFXty+Lk
   56zSeycoq/Kc00z1wRloV+djRr/iao8cwTpXfABctZRrUNM2qrQhT1Vpc
   nW7gGvMjNY+tc1wRFXgqeLnQQNie9NaHal5ydTv0c+JKMUwOoHLvavdEl
   A==;
X-CSE-ConnectionGUID: gmO1t9epTvWTFq9pGvUBIQ==
X-CSE-MsgGUID: eMMgx3EQROawmPqCC2f2iw==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="30399577"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:06 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:24500]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.141:2525] with esmtp (Farcaster)
 id 00960bab-5b37-4344-869a-67da0b48625d; Mon, 5 Oct 2026 11:25:06 +0000 (UTC)
X-Farcaster-Flow-ID: 00960bab-5b37-4344-869a-67da0b48625d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:25:06 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Mon, 5 Oct 2026
 11:25:04 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/8] irqchip/al-fic: fix argument alignment and a repeated word
Date: Mon, 5 Oct 2026 11:24:51 +0000
Message-ID: <20261005112458.22291-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005112458.22291-1-farbere@amazon.com>
References: <20261005112458.22291-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWA001.ant.amazon.com (10.13.139.110) To
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

