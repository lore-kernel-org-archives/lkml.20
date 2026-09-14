Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE4C4477F4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385431; cv=none; b=uopMbV25jd8lFuaOZTfBt+7xVJC5OERVQvseiL70yuDfJ9CDw2zkBSxYZhCse3g+nQZ4BSo4Kss6QKx3shRq0UndECe+wzqG4t+YDlqKh4B9xj2ZVPIkTgxcGn2ql0QFCeqLGR7A8bOV+azms1dLnFrpTB1Kduk0pE4uSnpPB6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385431; c=relaxed/simple;
	bh=PnOvkPZ/WXW8f4HhiUTjMvupYjHVFfcuoyhnEqzhSZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0oez8MuA3ziz+dlS5dOcPvVcxEYP8bKcDB26b5196G0+m7tquCTSuLMmtg4BHprwrxD448XcNP4kGaFBtIIzvZULXv0bZPDesswdycu3ygpEfQVyuIEVjVfJk5fEhCaT9RWRvqwW8ZAJ7gyo7hfiP9VpftpuQpucjL+0aInKmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsE/den9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsE/den9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385429; x=1820921429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PnOvkPZ/WXW8f4HhiUTjMvupYjHVFfcuoyhnEqzhSZE=;
  b=GsE/den9wLsS82Er42M2VekrcARYmg0N9WcssuC2Z4UYlUXqjzVblMpy
   V2dhf2eunwIlb/3p99BE/0kTl8L92cJCOjL9NMWZShqaXEiQP+w+qO4a4
   w3D7qQbkqJ5lH10SDWlnLms26GFLiZERrJ3GMWkX1AyNOUZFl/IbGMytC
   J+lFHnncqcEdv+qSTNkk80Bt55YpDc12OBNmQpqv0XBqJ8OV6JQvGRSGP
   FZYXpY0/XSYo/dXeJbda9fS4+npxcB3idae5AUzLZis72B9hOCvdai4m+
   R0R6CAxdu6JQYWRPN+MREQfRh+k38RbGiPqm9HSdnuMlLcjfs7+TVgEXV
   Q==;
X-CSE-ConnectionGUID: frZ2b5H0Seu41XORlNpIdw==
X-CSE-MsgGUID: H0MpJ2luQrW0XSsCryNxlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864442"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864442"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:28 -0700
X-CSE-ConnectionGUID: tF9f+P3zSMaJw0UmnvWVkg==
X-CSE-MsgGUID: 64xSYaZ8S7mjHwakYL/Cug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133110"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:27 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/17] i3c: mipi-i3c-hci: Fix i3c_hci_enable_ibi() error path
Date: Mon, 14 Sep 2026 14:29:52 +0300
Message-ID: <20260914113003.183150-7-adrian.hunter@intel.com>
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

i3c_hci_enable_ibi() performs controller-side setup before sending the
ENEC CCC to enable IBIs on the target.  If the ENEC CCC fails, the
function returns an error but leaves the controller configured as if IBI
enabling had succeeded.

Fix the error path by undoing the earlier setup when the ENEC CCC fails,
ensuring the controller state remains consistent with the failed enable
operation.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 8b3a87d8a8bb..166d9f70f435 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -703,11 +703,15 @@ static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
 	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	int ret;
 
 	mipi_i3c_hci_dat_v1.clear_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
 	scoped_guard(spinlock_irqsave, &hci->lock)
 		hci->ibi_devs[dev_data->dat_idx] = dev;
-	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	ret = i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	if (ret)
+		__i3c_hci_disable_ibi(hci, dev);
+	return ret;
 }
 
 static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
-- 
2.53.0

