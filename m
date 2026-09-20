Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11E13C945A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917192; cv=none; b=pg0+JrK/0cxCL19oWo1GYgKXTRTQKmcfEgRNf5C+oPxa6nU9cEFePIGoU2jgL+4M4a7vECJrlJKozDs0SmIiV79ZhMsixwPKK1VjI96jbYaXGNxr+rjwa7nrvQuW7r+tNQ9QM3VS5Bdd3ZELYdGSyaAEbbAAokClQq0Tpc9WPcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917192; c=relaxed/simple;
	bh=HqcLNXZXj10D61oVSmkM1nAmz8awVXqF+dcY1IPM0N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6ZxfCvFRJ/t4kfc+lHSCj3bWNSX6m4GAQyBbbOXmCOi3FdLBicuBPZdc09jj4XvuFbnqrjw1Z/8sc0olm1Fv/3G+mO0V1xzC5zb1agHSnCq+nKYFn7Oavm/jSnGGGjnbM+k7nYsoydvK1rFszb6zIDCjA2HxaG+6kpywqTQIgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjHQRXCO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjHQRXCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917191; x=1821453191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HqcLNXZXj10D61oVSmkM1nAmz8awVXqF+dcY1IPM0N8=;
  b=UjHQRXCO3o1CzUfv8k4IqyRxGwvrE3DCZEi+Nxl78NEsYusnYl//0vxq
   J7x9jgf970mgdgQZmAa9YxqFsrsiaq+ETJkC7rd7zEVXMsLbkZaFM1Yag
   3En1Hk08vVIXlmVfN7cUYBc9fBTb0lIcHb+/0rsfxRtaeqln2fOfW8dXc
   4ARIfZKb8YaNJAN4ZwBtCtcD3+SDnhUs95UW5o9j+B0bWdzZlTVzu6D5n
   a9QTP9jJfPS+Xkpp4O8fiTuZR7ELlVGZ5S5aVEFJdPKny7q2HAqv8GfX8
   RSdxvKjDka2i/BHHt52f0T+cfYXKT5tUOecbs5fWkcq8sfsAwN9YXWx3n
   A==;
X-CSE-ConnectionGUID: HO5HwiwFQu2WKE7OmGOT2Q==
X-CSE-MsgGUID: 3dsdQAuRT0qRZ1EYZQi3GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548428"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548428"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:10 -0700
X-CSE-ConnectionGUID: K7hErQ6fRum88BStUx2ezQ==
X-CSE-MsgGUID: q5q4u6K9TPaqeCjFAULdfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352388"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:09 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 05/17] i3c: master: Remove stale GETSTATUS length check
Date: Sun, 20 Sep 2026 18:12:35 +0300
Message-ID: <20260920151248.46936-6-adrian.hunter@intel.com>
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

i3c_master_getstatus_locked() verifies dest.payload.len against
sizeof(*getstatus) after issuing a GETSTATUS CCC.

This check predates the introduction of dest.payload.actual_len. Since
then, dest.payload.len has held the requested transfer length and
dest.payload.actual_len has held the received length, so the check is
always false and can never detect a short response.

It also predates the addition of generic read CCC response length
validation in i3c_master_send_ccc_cmd_locked(), which now performs the
necessary check before returning success.

Remove the stale check.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 215a22f2c7b6..4296c51a9537 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1777,11 +1777,6 @@ static int i3c_master_getstatus_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto out;
 
-	if (dest.payload.len != sizeof(*getstatus)) {
-		ret = -EIO;
-		goto out;
-	}
-
 	if (status)
 		*status = be16_to_cpu(getstatus->status);
 out:
-- 
2.53.0

