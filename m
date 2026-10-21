Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616085;
	b=prel9za41IU0Mo3g0nThekSV5DKnPcIqB5HWESWcINljxbxBtNVxAyeCjcQIA13ERXLK
	 rTAbwDdeORqiMyGr49BPLbPKMsmthodYC/McpC1BLKSXtL97yvpH94W9Ya6yphwcqD8FB
	 IxVRYOvy283AT1eHuhVG7YIM7rlr92GtmbFXFKpNMSylzMBrl8qfPJixL04L9a9tWa9FH
	 jJ/3hRjlGYim58PI6gyqpzVZUEqYk9A3MVr31RY3Jcq3Tn2ODPciuuA/fza8fl0dlJyO4
	 sNzw5rSz/W2SsWZi5flkq990WbKKDEPEg45+KIiFKZoJKSh2OClYrNztQbfMgm9NhUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616085;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nyxxw8DG13rMyX2N86ekq3tZi/snenQJIvWLK/Fd68Y=;
	b=LcuWbgDp7/RXLZU5+SCkJ935swn9AqTt75vleA+hqZGfp9zFGzhPJbIor129ichf+kCP
	 HkBqr5JqNtLFiLXsPNs/PltJ/PenLHmSupivUDzEuwrNYDBAA9CkLSrSh2zQ7wF6//MpP
	 FAtgLEp+FarERrGQ8qCL8aFLte9rg6ftFFCzM1nTxspEswHE+paESOWvaoWw7P5iDrB5N
	 5fwmU/J0f0eQ8MhEYSB1E5iPlfHccnCQUHH5ZH3+JxGXbRW+Y/psfATdvu2GioI6bvIBB
	 V67TnIXp2gqjmtLsB0SV08bYcoWwKD55TJpjwFG3/pLYqNUhPJQQEb3A8nTozQ+EQog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZAvTNvVL;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A7E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35A7E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZAvTNvVL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792616085; x=1824152085;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nys0NFF+SKnsf1loxXJC2D3JKXXqFWVDDp0Z70gpJU8=;
  b=ZAvTNvVLsLR9XVNZM/QSCLrCNAAXwKxZtwx/K0ON7mSsSm4qDQwgltny
   e+Wq4dJI5VOfITjGhfu/uhxKPr6md/Xi6J8EhtTO7H4j2clvC2iWUMHMW
   8xglPFxvdVs6W5o4HE78EL2lp0SCU/ZVnh+Y/7XKhfOfM39JstJfgdjLt
   m1SXhtD+gsgp2Veh3J6X81yPiRoqHZjGy0GtHvrxKQzJiEMYYES7MBww6
   DDeImN0V/nUENYn9r97hiU75K/r0IGAQf5bEjtFpaI8Q4m3bC+/X44IJs
   ZfuARJlMMfWH0yZUe8CBTBfOXrHeksOapD1LZ1Tzh3G0SdTWn+io+wvGq
   A==;
X-CSE-ConnectionGUID: jBounDmITdaxPwpRYa4urQ==
X-CSE-MsgGUID: 9p74PMQOQN6StL3SaIHA8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1374371"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1374371"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 13:54:45 -0700
X-CSE-ConnectionGUID: Xmdrkm1cSpqwtJYqt+V3UQ==
X-CSE-MsgGUID: Cnc7wkRLRXWlsuVWsB93/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3525321"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2026 13:54:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 343AF99; Wed, 21 Oct 2026 22:54:42 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v1 1/1] regmap: irq: Get rid of duplicate check in regmap_del_irq_chip()
Date: Wed, 21 Oct 2026 22:50:35 +0200
Message-ID: <20261021205036.1013622-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

irq_dispose_mapping() already 0-aware, so there is no need to
perform the same test outside of the call. Get rid of duplicate
check in regmap_del_irq_chip().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap-irq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 715eb9e7aa2a..bd7c89618dd7 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -1021,7 +1021,6 @@ EXPORT_SYMBOL_GPL(regmap_add_irq_chip);
  */
 void regmap_del_irq_chip(int irq, struct regmap_irq_chip_data *d)
 {
-	unsigned int virq;
 	int i, hwirq;
 
 	if (!d)
@@ -1039,9 +1038,7 @@ void regmap_del_irq_chip(int irq, struct regmap_irq_chip_data *d)
 		 * Find the virtual irq of hwirq on chip and if it is
 		 * there then dispose it
 		 */
-		virq = irq_find_mapping(d->domain, hwirq);
-		if (virq)
-			irq_dispose_mapping(virq);
+		irq_dispose_mapping(irq_find_mapping(d->domain, hwirq));
 	}
 
 	irq_domain_remove(d->domain);
-- 
2.50.1

