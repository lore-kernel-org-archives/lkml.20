Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2AC3C9EF1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917194; cv=none; b=UrVSka0vj9+TWGSdChQnJsRL8hifCyhHFTHkWbUswh1djkBL0gUb66VSaRsuUEPxo82+MUJJtSPHmnVLkjBY41G5VdVYmFiT8I5pAKY3I9D5jbZNxqO/DS0EuvdZ1DhVCJst0rMkffaQeyncoXf7UL9Ks/FxSqxMClgFuY9dA6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917194; c=relaxed/simple;
	bh=Ymg15iObztoik/4xK8BRUFnYvihNFTAPc3nnaYgSz+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABwkcTTWpIVLTdTj56B3KIeNKVUaQoNv4544qBJdjpzVaKDauqT4lNGCXmquXy6zqyEPsAcpZ9K5SAyn/2cN9ZuqemQLr0bL9nu52slryx0sX1u0EQ9lYk1wbz/D7MuiAe/Bk9AQxH08HK782Lgnb5O/Dzz+J0LkrP8ekgkSy0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h92jQBWK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h92jQBWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917192; x=1821453192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ymg15iObztoik/4xK8BRUFnYvihNFTAPc3nnaYgSz+0=;
  b=h92jQBWK6rUzeB6/YI5pMUkWQvlVKK/0tVWCVid2eILndFzSE9XzsKaH
   fesVGKEEBZQqfbem1ZuPIOsLIFAkOPUzBCmIzTr6rfbKWHb/8+pJhXLTV
   WEHPaJAMhsORolAJfxPl2R1bMsCdT05v4OA9X7ywgJ2/EYfB/1ASIq5SJ
   IAJ5QcJ/24FFS3su3TAr/a5/Gs9iVgBS3wxDGP0HAMZfuWh/SLrb8svk7
   uXvXzL97+/bx+DI87bXaUJ4JznUT7SEX6xaj3OtTJFOlPnKbJXPyj1+tu
   +GIGO3Loke1shF8IyN0B/T3+f64TOThmdmCawq34pgJk2PLcdaFAvZmNa
   g==;
X-CSE-ConnectionGUID: N64eDgrISb2fWXApd6Zy7A==
X-CSE-MsgGUID: VUMWKWERQe+7ergSSEmA/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548433"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548433"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:12 -0700
X-CSE-ConnectionGUID: hA03MWy4Stq5Nya1Ly0QhQ==
X-CSE-MsgGUID: XTDot9IOTVOz4KD2ioynYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352399"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:11 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 06/17] i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
Date: Sun, 20 Sep 2026 18:12:36 +0300
Message-ID: <20260920151248.46936-7-adrian.hunter@intel.com>
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

i3c_hci_enable_ibi() performs controller-side setup before sending the
ENEC CCC to enable IBIs on the target.  If the ENEC CCC fails, the
function returns an error but leaves the controller configured as if IBI
enabling had succeeded.

Fix the error path by undoing the earlier setup when the ENEC CCC fails,
ensuring the controller state remains consistent with the failed enable
operation.

Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	Added Frank Li's Reviewed-by tag.

Changes in V2:

	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
	Fix i3c_hci_enable_ibi() error path", to say what the patch does
	rather than that it fixes something.


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

