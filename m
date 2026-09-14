Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030914457BF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385424; cv=none; b=irefXWFd5z8Y1lnxHJLfjwgiqV0qXg0LGSfjD0Mn1bRsnRLvx8Uzby5FITaWWo98aBaQZydMPngy5IG6K3LeO6KUC021fKjBJgvffpJuX+Cv3++nf7QWibhBYXdVxRF4NY6GjIbE6bwutMmB1KI/aXFYf63NMi4iKOlqbMeSb5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385424; c=relaxed/simple;
	bh=/qRaVzi57uA1RVt6op5h061fdRuK9AL6oojq4XEDI2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAEztIAm3UehPI4gxy2KVRpToBK4uQcCORBOzyoSmbuwFMjCqDxWunFQxIUaYJFaRfVz408XANT5KF/9F5VFtmR2OSUKXT6F28opVFwsF7SD60LOlKMJGMvWEreD0Oqqc4PwydiGH1UyPVxTji7mlmK6RO3DWINiY8SwBtzi1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mP3gd6Fn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mP3gd6Fn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385423; x=1820921423;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/qRaVzi57uA1RVt6op5h061fdRuK9AL6oojq4XEDI2M=;
  b=mP3gd6FnY956EFexEQLdi+0+j2Q+5DheGgE0nRi8YZcBxturxOIJ+nBU
   gdsCZqLgX11TCCUMPHC61mOSPRWf6krSHfxMsx5q6OBUjw7PANHbwxKli
   ET9RSmSfsbeLclf62cvUuEzjpYodIcwF7gt2kJBhg7h15EOP5Vm38iS9P
   FnYT/K6yL2qCvwhoAlmYWNNa2k5twMyeNo18JJmcvcZjIRlB04I14gDSy
   W1A3+SEkwWI+y+KjHPqfVfgILgRJbFuos4TvmByOFQ75snKeXYX0ErFBQ
   sZqFya9v3En8Q/un+XxwOHQv9Eq/1vPPMZDa7z2ITb9ljzv841yKhTU22
   w==;
X-CSE-ConnectionGUID: x/tDHJPoR0+HRUqa15cj1g==
X-CSE-MsgGUID: pH4ArIX9RH24HYwV+9kVUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864422"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864422"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:22 -0700
X-CSE-ConnectionGUID: nIFkBfFPQjuDGNbkn5+V8A==
X-CSE-MsgGUID: Rudr8J3cTci5upHLmkQ++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133086"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:20 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/17] i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
Date: Mon, 14 Sep 2026 14:29:49 +0300
Message-ID: <20260914113003.183150-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914113003.183150-1-adrian.hunter@intel.com>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Content-Transfer-Encoding: 8bit

intel_i3c_init() creates the pm_qos_latency_tolerance_us sysfs attribute
before probe calls pci_set_drvdata().  A userspace write to the attribute
can therefore invoke intel_ltr_set(), which uses pci_get_drvdata(),
before drvdata has been initialized.

Move pci_set_drvdata() before hci->info->init() so drvdata is available
before the sysfs attribute becomes accessible.

Fixes: 884a33131f2a ("i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index ab595661db1e..af9595009b03 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -445,6 +445,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret < 0)
 		return ret;
 
+	pci_set_drvdata(pci, hci);
+
 	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 
 	ret = hci->info->init ? hci->info->init(hci) : 0;
@@ -455,8 +457,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		goto err_exit;
 
-	pci_set_drvdata(pci, hci);
-
 	mipi_i3c_hci_pci_rpm_allow(&pci->dev);
 
 	return 0;
-- 
2.53.0

