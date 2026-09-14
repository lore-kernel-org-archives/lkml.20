Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C844483A0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385432; cv=none; b=UTmsJ5DEQCdk1xz80DVBSEZ6te44uxMS7LWtZu4BrujW/sViPfyZ8aZ5RlnMin/HTOUXRcMgNBGEvLRpnMhv0mSlZSwBZZ9t+oRLUDZBPfSBOswByeHv1ynyxulDq86buXdee4jui7yb42+3qK2Sybcx4C10wiFTrGmv2sak41g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385432; c=relaxed/simple;
	bh=xiBwffZ+2jfHOWWFIuWoiFPyt7CRh5+pNTC+PTaon98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPA6LgcaM1tuLsyUYFfDJaBtqc8LEuivNTpG5aqYtkwzt9zrEJNjrZDmD0HolNiDF0ggKi8S3Uf8F5aGt8WuZaXfWaUT/haYJNgLTcwezyUSwwQ5v6q807Ly7FITJjMVyHVZNe1X+d2V1b/oPRMGMRJraaVgxj1yhJvH5ERxpG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQv+BwrH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQv+BwrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385431; x=1820921431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xiBwffZ+2jfHOWWFIuWoiFPyt7CRh5+pNTC+PTaon98=;
  b=aQv+BwrHJDZFvXRmuuNOmrFxNIhsvpPg3PMJv5avXIt/h4KX/7SFnd4f
   eZeqE2s10YwqlqhHCEVHsFJkcPesKx7vey/vUiRoxS8F0X9OLbVasUb1w
   ulgsqZpfTP1lvYlSqL5w6YyOl7+h9xmjF66CI4HmnROBgAE/PqcPv4dI0
   XwcG+rKbItPu1yHLZg6iaTs4j/c0zPA7BCrq8XRqSyX8eJxv9uTlKjLEE
   FwWZARwhEy/eMdQyKMP/rI4HFcexP+74Q7CyS5NUB94Ycr0v7YQFd84w0
   h2q8VFL+7DCkU6tLUmgZk25SK3jk/QbiG5AdjFss8isoxiKH/h4Wq5ZRy
   g==;
X-CSE-ConnectionGUID: sbWb2BO6R32y6lhE+rYGVQ==
X-CSE-MsgGUID: uew+YPWDQp2PARUqwQqG4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864448"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864448"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:30 -0700
X-CSE-ConnectionGUID: hmCxbhwGQdiBUdBRnxBtBA==
X-CSE-MsgGUID: kBXAUQcWSrWNeT00W9aLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133116"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:29 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/17] i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
Date: Mon, 14 Sep 2026 14:29:53 +0300
Message-ID: <20260914113003.183150-8-adrian.hunter@intel.com>
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
---
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

