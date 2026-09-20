Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E033EC805
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917198; cv=none; b=lJM5ty2dwD5DUWkK0Sl0obDvK6KAb74kwclt6w08Y0LeyQOTfa9XLSWoZ5eQ9UDsX+hQgx1lMh7vr/R3hfpmGEacsntWB2CsZ3Fre7Xr/likMBn8ILfqJRZWqxHLlzE8bCMoYAAhRtQV+C+IFgDIwr5C0ucwV3LIaLhljeHEyes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917198; c=relaxed/simple;
	bh=tsbhW08RnMhR983N7W+oT0nzxoyR6/vrAI0hdff9dBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+j7Q/EXMxyip0ioNH2QqgVarpNG/s180LEojACN4JTGRk9h3/IJXijdmPucAI9oMrauvl3QzBifcUPYoFVNIzmWW8F8gEe9m+FVvNCRA9PSIObo8taq87X/GUef83wH3W6eMAqiVLeB8AR9HJkcpTb0lIK9tuXtOq9c7NMXV7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5JbIyky; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5JbIyky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917196; x=1821453196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tsbhW08RnMhR983N7W+oT0nzxoyR6/vrAI0hdff9dBo=;
  b=n5JbIyky1ipYgxC19njbmy2EI/BOvU1dmfPhZAbPVDnO1hM8TZ/78pGO
   TF3IHIYALLm4ngdbcuEscDLYUp2z7RpAYpLxIF0Ek0D+ZLbTJUH05pTIW
   ugGvm55WK3sK8P3/xhUnXfxN6IdllJd0bsR5lkYUgvRZeG6uPVMNgspmK
   0HUVwQ9Z2iQD2LvDohgayn+1+N9rI5TqqlrDPhHSCwKyIzm6mAeekgCNu
   lARBY/RtAJLqInu3+kFmU3X8bQLaL0A+TCHVVWBqGwaRD+X2H7y0wjBLx
   elk+9dk7BzeE7SxVq55GJwpLJIDBD9vYhqzfHLgV573z8Hz8oUz6j7sin
   w==;
X-CSE-ConnectionGUID: qvVTbkmbSfiG5PjeUOlU7Q==
X-CSE-MsgGUID: lV5NjoQKR4yKORnEzrRXNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548444"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548444"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:16 -0700
X-CSE-ConnectionGUID: 93HTLn2EToKSfCUKP5q4LQ==
X-CSE-MsgGUID: cj77OfaFTtKEd7ZQmoGKqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352416"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:15 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 08/17] i3c: mipi-i3c-hci: Fix runtime PM violation in i3c_hci_free_ibi()
Date: Sun, 20 Sep 2026 18:12:38 +0300
Message-ID: <20260920151248.46936-9-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Content-Transfer-Encoding: 8bit

i3c_hci_free_ibi() calls __i3c_hci_disable_ibi(), but the latter
requires runtime PM to be resumed.  The ->free_ibi() callback does not
guarantee that condition.

The cases where ->free_ibi() may be called without a preceding
->disable_ibi() do not require re-enabling runtime PM handling:

- runtime resume failed in i3c_dev_free_ibi_locked(), so it skips the
  IBI disable but still proceeds to call ->free_ibi()
- the device has been re-enumerated under a new dynamic address in
  __i3c_master_add_i3c_dev_locked(), which tears down the old device
  descriptor and deliberately clears olddev->ibi->enabled (to avoid
  sending a DISEC to the stale old address) before calling
  i3c_dev_free_ibi_locked().  As a result ->free_ibi() is reached with
  neither a hardware IBI disable nor runtime PM resumed.

In both cases the important requirement is to prevent further IBI
processing for the device.  That can be done without accessing hardware
by removing the device from the ibi_devs[] table.

Replace the call to __i3c_hci_disable_ibi() with clearing the
corresponding ibi_devs[] entry under the controller lock.

Fixes: 650716f23eac4 ("i3c: mipi-i3c-hci: Fix race in i3c_hci_addr_to_dev()")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Added Frank Li's Reviewed-by tag.

Changes in V2:

	None


 drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index f6a34ce7a295..b9b20797d045 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -675,11 +675,13 @@ static void __i3c_hci_disable_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev)
 
 static void i3c_hci_free_ibi(struct i3c_dev_desc *dev)
 {
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
 
-	/* Must ensure the IBI has been disabled */
-	__i3c_hci_disable_ibi(hci, dev);
+	/* Must ensure IBIs for this device will no longer be processed */
+	scoped_guard(spinlock_irqsave, &hci->lock)
+		hci->ibi_devs[dev_data->dat_idx] = NULL;
 	hci->io->free_ibi(hci, dev);
 }
 
-- 
2.53.0

