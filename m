Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC9C3D3D11
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917196; cv=none; b=amXYZ5bq0Ht9KLi00IMKgYyLn2ZD6VHYYnVvdWT1yPLCIov3cXjqM9Z7K8tUnWzCiJHOzvYEp72B86pqWOqJOtZGnRulrLyxi3KpRhNwBqjWnkH9u/Gc3IgLpC0PqQo1R7y0UTr8Qiplbu8mRBwmPgFsirTC8NFSnNF9RQ2gdNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917196; c=relaxed/simple;
	bh=/NBwEjFcbmbb8ba9Jy+BmQAZLFPU4iOb9Ugzr6Vy+U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eWAwAS/I4+t/4lPQoYFiyDOZabAWoFTcJ15jyGMJ3lTVvLHxD6DyewU6lDsXo+K9ooHlp82QpXZfI8ZQz8ljRVEpdKncBK6JoKt0rr8pSXZapGXgmiBYn8iHTeOOi3LSqqMsa4xk3SqY5ZFhAuoiilS8C9AgO52ZmtGwByaXHoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ha6h2QcV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha6h2QcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917194; x=1821453194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/NBwEjFcbmbb8ba9Jy+BmQAZLFPU4iOb9Ugzr6Vy+U8=;
  b=ha6h2QcVIyAs+ySVId4YrG96zgYTi4D7iwElVFqOXWY0kfaoL2bDoXrG
   6Qwb/Q6nipzsQjkkUzJxEqXSUAdZA+JrXgdTGkM9XLnF3ieff3kjp/hHB
   7CvA7gdRiobCVgostwtCoOc0RKnU/Ee83foYUQrEcPOM/cy4ZqXVNIFBm
   IPHYvL3uc820ASxCYy/O+X9sq/LqdcaehMx0QqSHbvdHKz+kPAIfcm+RB
   waMi9vKEgRRDx74PqPABazIM5p9oM8UtxeyakyLQd/8nyqeKfaPSuwHzF
   qBlq9uTxyQc9wnV7MCaoZHRPYXJw/SVONURmmR7Xfy4EbqHygRUYAgHHi
   w==;
X-CSE-ConnectionGUID: XugNC+PjSIm9Dos77X59EQ==
X-CSE-MsgGUID: mKsH8+uOSKOHwoY5TQlAgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548438"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548438"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:14 -0700
X-CSE-ConnectionGUID: cqERlBjWQoeh+Av8hWPEkw==
X-CSE-MsgGUID: iazM+2xiTKK0rIUVOrgpKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352408"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:13 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 07/17] i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
Date: Sun, 20 Sep 2026 18:12:37 +0300
Message-ID: <20260920151248.46936-8-adrian.hunter@intel.com>
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

Reorder i3c_hci_disable_ibi() so that DISEC is sent before IBIs are
disabled at the controller.

This matches the sequence used by other I3C controller drivers.  It also
avoids dropping an IBI that races with the disable operation: an IBI
received after DISEC is issued but before the controller disables IBIs
can still be processed normally.  Once DISEC has been sent, the hardware
can be updated to NACK subsequent IBIs and complete the teardown.

No functional change is intended beyond aligning the ordering with other
drivers and handling the race window consistently.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 166d9f70f435..f6a34ce7a295 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -719,13 +719,14 @@ static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
 
-	__i3c_hci_disable_ibi(hci, dev);
 	/*
-	 * The DAT entry is now set to NACK and DISEC this target's IBIs, so
+	 * The DAT entry will be set to NACK and DISEC this target's IBIs, so
 	 * the IBI teardown can proceed even if DISEC below fails, so ignore
 	 * errors.
 	 */
 	i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+
+	__i3c_hci_disable_ibi(hci, dev);
 	return 0;
 }
 
-- 
2.53.0

