Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196F33B9922
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152651; cv=none; b=eH4u8zbyHe7mgv/JTWv+LHRteDFRT0MjMROQXhOjXs0VrFR+E7xKjoRP9kQ36LPaYwm66c6+imU6pPn5TEsVT2Ey6LYriEVQotXPwpjuaWtJ/VrSdiygRfH3w7ALd2SrsPpn792NPLuUZ3w8RUUFUv3SrkX6X8P3BFROs2R9yOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152651; c=relaxed/simple;
	bh=NRy2zow/DrCu3nMeNhfZZEUsE/F5NVGi8JKtXFXZauc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u04Xeqi8BhWbfEEAr1l9ilpMuOddc8Mjk/EK5vByu09WN2hf/UHvsnSPm69JqburzFJ+By6Yibfrm9cuwB4r6NjvTxWnmFpc34I2xqnaW1T9dGQMPQVa9A81bT1UphCfR9a/l4mUNJm3E2k2zRu0KT7P8Q0twsRsYaA0JGk1jKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=kb2VyDnH; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="kb2VyDnH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790152643; x=1821688643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T9OFgGNXERb3VJQ/3J3tKtQZkWd5zwiTiKIm6bYoF1Q=;
  b=kb2VyDnH+ft59y7Cu/tMVB9sDrK6zv9VAa/0hhBh3OjDWH2BPkpIn7j8
   v0mIpE4GXXNYAqI6aNyITESfJRlQpHhs5mkxsAqzD59YYqK74h3pc+Wcx
   6+rLDz/Rd5eZepZus+/7ZbAAAEkabeKbrEDqinQ2htCj6djOw/FMe9hTr
   B0rM7/oQG0hq3tmZ3T0vcotuDpvR42MvsFua4LATcyKnkzRAvwYzav8JI
   F324w7GUuX/TKsM7KOLzE6mnnE/2FtXiOsfUCcETaui+bXwtS5TFtURHv
   wn/AihmgwdcQV/nro4ZxTaA2G/MMy0W7YH1Y5ygvY5+g7VUcT/7T6h/uu
   A==;
X-CSE-ConnectionGUID: TdnE58viQGmMC2XHXrftmg==
X-CSE-MsgGUID: qw+WaUgRQ3ezHTfqFhJwuA==
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="29208085"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:37:12 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:25055]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.195:2525] with esmtp (Farcaster)
 id 216cd999-a0c1-4063-8f93-3258ce205892; Wed, 23 Sep 2026 08:37:12 +0000 (UTC)
X-Farcaster-Flow-ID: 216cd999-a0c1-4063-8f93-3258ce205892
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 08:37:11 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 08:37:10 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH 1/4] irqchip/alpine-msi: Use SPDX-License-Identifier
Date: Wed, 23 Sep 2026 08:37:00 +0000
Message-ID: <20260923083703.38974-2-farbere@amazon.com>
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

Replace the free-form GPL v2 license boilerplate with the equivalent
SPDX-License-Identifier tag, as preferred for new and updated files.
No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
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

