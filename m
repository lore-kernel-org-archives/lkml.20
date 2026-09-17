Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278584D4891
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672453; cv=none; b=jnYq0pTHqb2f0xfovHgS/rdRUg2b5DJOz3ogmV/phl3So8eHp7X8YxcrgtGESLuQOC0R2oihz+OXo0ib6oqIjbLkn1KjbXrWijJF8eUzV8OFczyDKpHpVq7ISNNQyogrWrnitVKSrNwjrPeaHgHNVUL4Eu/hFTlY8cCd5A787Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672453; c=relaxed/simple;
	bh=z1Ysn0ALQpn96UsvNcVVXzDqe+f+3zOb78ZzcXMOS1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+fLBp/HzWARyYnsaa3US9F2V36wjan3y/z5xqtxm4B7w0EpCRuJZRRepDie66nDDxD9+sr/iCokBebZobxo17w9kb166/lKhFmtQ30ZZOy32DccrJRpxLwKAUBkJ6PMTSkotdNLTV2aKzbdA5nL6i0ZPTYusZF1bIeiSJnQ/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzK2jgri; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzK2jgri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672452; x=1821208452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z1Ysn0ALQpn96UsvNcVVXzDqe+f+3zOb78ZzcXMOS1k=;
  b=kzK2jgriI6kh+Fv7NEduJX2Oeefbx0GtTOft8J0eFKkWsC/kyRp63XzI
   7h/aAGT5Kz0HWOjYVzSq3CeTHTY3G7bt9ZDeSh98YUhF2xqNLacb2wniG
   TkoEfsVgJIQcMe1Ao3VdTtjqIwEXl4nJ8O2MreWq65JbJCjek8IRQ28k1
   og/+GD7Nfe3kRm3JmvJ9f3JBVn0WMkzMlXHu1d7UlWj0Jsv/at2D1Bnkp
   OkuOJkC7YB1TG8qKoTtrTsMgNbYKxMPA7HNQbb5eKvoyw6tz+VKPPV5vw
   a106/HYqZoBSVCbrUSV+loJNbg567YwSCiMS4vHQe3oLwu59dsUYiG425
   A==;
X-CSE-ConnectionGUID: 0yKGOUDoRaaHVWRGdokZPg==
X-CSE-MsgGUID: QL4uZ38STt6v0YcemclPRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639873"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639873"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:12 -0700
X-CSE-ConnectionGUID: QYJWFAdjQpewkl8I74tQLw==
X-CSE-MsgGUID: J8n+oo17SiuEiPKQsSqLhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271930"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:10 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 03/17] i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
Date: Thu, 17 Sep 2026 22:13:42 +0300
Message-ID: <20260917191356.133242-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Added Frank Li's Reviewed-by tag.


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

