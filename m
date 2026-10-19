Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443071;
	b=WkDRgyi6cERnfuIg6nec0QumdxqiqGXGZWV/CbxohpwDIlw5Sn791Bw5SNbNO9dkj+Ri
	 XIrEocgvN2dbH/41+wH9S2sxWh6U0FiLpW/cMx+CPxyJSuLCXySyAHXVfbWI12A54uIj+
	 Yx6ebAseFdbBx1TFuQeTU9NaVoE5UYm2KAD1PT47Q4OI5y+HnBERlAvsrYsAsiZwXYFMY
	 eeDl/N0xYD00wl091U+VLjXwcUMO6UcYKjNaRq1GLxGrVQ3iblpuEJ+Ryo98smKaG0ji/
	 dUNoqGkRu3qswY3MJTUC7eUc0+LQte7tBvu5LiO4YDqw/8cKdEdQzFoMAYvXGme3seQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443071;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aCS690AWyhr4RtY44shfUMTW6R8wi29+vQiNI8Fiueo=;
	b=tQ7b9c2bX3S64C6TOgJ7F2UOZDFjWUrbQxlfzY4tP/QRjBJJb1KXoQv2dmfRZkKPviP8
	 Cvldg6CCbYgFqCr2N24j4v9lHg/H0r9vOWhvqlfPvf3/w2TX2ql8tFEftdmSUuvXCWiYI
	 3otB7Dbh7lxsw28gZwuKd1AHZbG26DUz0PubcmW7Zcj1+cb0llHhACs44ArODxVOMzT6k
	 JsB884SJsPNM6jOPQ9QT3lrTJWaldkQXAyOoJTpjPqtwAfyWfUmSAyO4Bzg7Yw0sT4RcV
	 9W6adH/IQCtfdV7LX6jZXJN8Cmgo2sz6aEw7vkSvj/lkTAcYoky0289PHTBVOBbXeKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=av2t0LAY;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FE160A382E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86FE160A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=av2t0LAY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792443069; x=1823979069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eRK8ux2G90gG/bhywdD3Q4ntlviEXyh8a9xQxKa+XXY=;
  b=av2t0LAYQcnA292obleE1ZlTZw3ebg7dcSPXoCFP5vk6H6O89M1It4Rx
   65nrSePbsjZG9AJMyRcBI4csCBX707VbJhRZ8kqJA3AVIpETMu+Ak2Ftb
   KHigpXBsytpXLi9U71oQp3vAdRlRaqCRXOtd7L4iOBgwmMzStupzZvIW9
   anDIFGm/9JhZrQvuxOcnGK+/2bv6gn82fxr8++C00IZbT+8ay9on4gvHe
   ek+CiJe2DT8fsgVIYDJRMHF0AV2vA1BQUjHXek+lpvJByyw1j0SusWEt8
   gsjF/iMgDQn+LKLD+WRnIynyYDDxu9zcPQxu/7MOvjO4MbPpQBDC29dh+
   g==;
X-CSE-ConnectionGUID: CyE1Mrq0TEuYuqUGDtmuww==
X-CSE-MsgGUID: 4U9KwpouSgqXanX84w+Afg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131301"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1131301"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:51 -0700
X-CSE-ConnectionGUID: koMSN9d8RJS1+w1LHwgj7A==
X-CSE-MsgGUID: KVE9HbSnQb2FHc6ldu2loA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3008698"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.220.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:50:52 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>,
	David E Box <david.e.box@intel.com>,
	x86@kernel.org
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v14 21/24] platform/x86/intel/pmt: Inform resctrl when MMIO maps are being removed
Date: Mon, 19 Oct 2026 13:50:28 -0700
Message-ID: <20261019205031.16977-22-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019205031.16977-1-tony.luck@intel.com>
References: <20261019205031.16977-1-tony.luck@intel.com>
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

resctrl obtains the virtual addresses of the telemetry MMIO regions from
intel_pmt_get_regions_by_feature() at mount time and reads event counters
from them until unmount.

When a telemetry device is unbound from the pmt_telemetry driver or
removed, the driver tears down those mappings. A subsequent read of a
telemetry event by resctrl faults on the stale address.

Before destroying the devices, tell resctrl that the mappings of the
device's package are about to be torn down and must not be used again.
Telemetry regions are organised per package, so the package ID identifies
the regions resctrl has to drop. This may be overly broad if there are
multiple telemetry devices on a package.

Notify resctrl while holding ep_lock so that the notification is ordered
against concurrent lookups of the regions. This is safe because ep_lock
is always taken before aet_lock.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14:
	Added commit comment on lock order.
	New commit comment.
---
 drivers/platform/x86/intel/pmt/telemetry.c | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 57eb2967a4d0..bd63653802d9 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -366,12 +366,42 @@ pmt_telem_find_and_register_endpoint(struct device *dev, u32 guid, u16 pos)
 }
 EXPORT_SYMBOL_NS_GPL(pmt_telem_find_and_register_endpoint, "INTEL_PMT_TELEMETRY");
 
+static int pmt_telem_get_package_id(struct pmt_telem_priv *priv)
+{
+	int i;
+
+	for (i = 0; i < priv->num_entries; i++) {
+		struct intel_pmt_entry *entry = &priv->entry[i];
+		struct pci_dev *pdev = to_pci_dev(entry->ep->dev);
+		struct oobmsm_plat_info *plat_info;
+
+		plat_info = intel_vsec_get_mapping(pdev);
+		if (!IS_ERR(plat_info)) {
+			/* All entries for a device have the same package ID */
+			return plat_info->package_id;
+		}
+	}
+
+	return -ENODEV;
+}
+
 static void pmt_telem_remove(struct auxiliary_device *auxdev)
 {
 	struct pmt_telem_priv *priv = auxiliary_get_drvdata(auxdev);
+	int package_id;
 	int i;
 
 	mutex_lock(&ep_lock);
+	package_id = pmt_telem_get_package_id(priv);
+	/*
+	 * Tell resctrl/AET that virtual mappings for MMIO space in a CPU
+	 * package are about to be torn down.
+	 */
+	if (package_id < 0)
+		dev_dbg(&auxdev->dev, "Unable to determine package ID for removed device\n");
+	else
+		intel_aet_invalidate(package_id);
+
 	for (i = 0; i < priv->num_entries; i++) {
 		struct intel_pmt_entry *entry = &priv->entry[i];
 
-- 
2.56.0

