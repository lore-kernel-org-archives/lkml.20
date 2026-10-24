Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.34.181.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792870591;
	b=aDaZdJtsj+lhPi4Y4WF6CUtot9zF7GgG0fijRzPya6oG/cPjlOXh66BVJfyXvQ8pjWma
	 lyYBUnW5Yfm8sH7uP3lP/ct17CPDG0J04jPSCDamxtBEClFqRRzHQ/MH4aRzpXGdx5W63
	 I6fmcnuCxDEadjWbuiIYOoUYYDybgtB7BMmheUew6AL0HovzmWHSXv8QnHv0T/OlZvfsH
	 zK0nCT+xtUyCpaWz3SWG1gkVL9n0AwHjsjjM1Ssl7EBGn6D/tWj5o1KJ1KWoYplggoMdn
	 WPJbxxqootmgq9MRxxLCKLDdVCuwvHgbyJEGSt75D1R1yH2IsiNMHIsLonkoas4bMxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792870591;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=BSBsQmp5ZSIRZgSzayMlPUvaeplhZq6gDEMHtvGcZ+4=;
	b=X86abySoL7AbUyoxrPDESSg3u8uw+eNO4WlvqY7c/53IEzkbknHB8pU3v5KoXl6I1Yxz
	 OxH+SCQHeozDND2401YbI8aDtYTc1QN4nvE65CAdga6DvAbDmwjH4Akbo1t0zPfFE6+3/
	 GY0Do2BnTlkIrB/0HRT0DSFh+ufv79f+e+WsKD3W+BpetgVXSMIOnqNzEi4KkiL24kwzL
	 +H4CZMAPgkVkWlHeshAH4DPh8fq2IT/bB4zP9utdawVRCZkT16tBkzT3x+KaYKzR6rLb4
	 WZrAZvHKfPPQ9HFFdRl3hrAYRjv/GpDyDTu8pfkk6EvH1wMhkV6ChFsKhw+qxsQo6eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=qv0G598X;
	arc=none smtp.remote-ip=52.34.181.151
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955CB606A322
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 955CB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=qv0G598X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870590; x=1824406590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BSBsQmp5ZSIRZgSzayMlPUvaeplhZq6gDEMHtvGcZ+4=;
  b=qv0G598XW9LVcnFoxb18Z4Gtp71jp7M4rTMmgYdrabC9wCzdaNY8YIMU
   kRqBZanpJGpziSVDqxr+/vVY4bz/i3eDBw5BkqFuT00vJ+C9ttbD4NDqB
   /NSlCcfjtBgqiUdPn70sdojP0G0dKIQDlRy/2AgRvyhYYJ83ubj1wEcfs
   SKARnCwaMWQrdQqsYBHLePgf3/2/NYW+vPKV1ebCEGcFOkOnanwSLEacN
   wINXlTcrbVH9FmL/x2Zdgbqe/7ty+K1kXETZDDNQbQN1x67bWl8F0LvDh
   J2jExu3wtIL93jptqJBr+jBhf8vBYNmQU5logL2FfLpUgtzkKC+pjPnT3
   Q==;
X-CSE-ConnectionGUID: h4f8CM/URaKOqrTQ8kHanA==
X-CSE-MsgGUID: ji8jyJ/URmWwgjRTzWUpVw==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="32140324"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:36:27 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:14395]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.97:2525] with esmtp (Farcaster)
 id e9da9aa4-6b91-4698-9463-5f797bff959d; Sat, 24 Oct 2026 19:36:27 +0000 (UTC)
X-Farcaster-Flow-ID: e9da9aa4-6b91-4698-9463-5f797bff959d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:36:27 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:36:26 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 1/5] irqchip/alpine-msi: Use SPDX-License-Identifier
Date: Sat, 24 Oct 2026 19:36:16 +0000
Message-ID: <20261024193620.39999-2-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Replace the free-form GPL v2 license boilerplate with the equivalent
SPDX-License-Identifier tag, as preferred for new and updated files.
No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-alpine-msi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 6764d64e7950..0d97abb85e16 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Annapurna Labs MSIX support services
  *
  * Copyright (C) 2016, Amazon.com, Inc. or its affiliates. All Rights Reserved.
  *
  * Antoine Tenart <antoine.tenart@free-electrons.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
2.47.3

