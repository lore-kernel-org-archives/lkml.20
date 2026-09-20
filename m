Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B63AAF66
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917184; cv=none; b=OEGSCi39IdUItckbIrSQQ1jI2Q4ky5ARWMs5UQ1dl5Sge5pcl5vNQswsqAxrlCuN55bWcli4AigFuOGMJNmklUQ+Jr46R7m/B0cBbFdeDaDSW5sKI7H9+1TF8HvGVvhMRUVAqIFzW8TZgzcdigF3ULxc0wA/80vdBV40QhIA7As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917184; c=relaxed/simple;
	bh=+mvbro4HcpH31cszgyyMFbMU0IezP7BRdwSi2K06DJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjsUuah6vMB5EFyRw7MFmXrfHO8q41vV8Wq0mheRZzEL83wqVXztUoLW65fO0E0EM14alyJ9y6Q/VMbo5yRndJqjuXwM1Ox5Hl7dm832kkUN/q/kDcmXf6QQ33+kYqgf23V2MYZa9b+tltGH0Ylg7TQIbg8Md6FoHRGrTpdio7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khanKkdY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khanKkdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917182; x=1821453182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+mvbro4HcpH31cszgyyMFbMU0IezP7BRdwSi2K06DJg=;
  b=khanKkdY5Ad/YJmLLqzycfCgVJjsHPd4LkrgrrMNO/6nqvKRIEt0JFOI
   VgrAxPffLfCN1Po1Xw66X1ZcfDoaTQ+SEV63Ok9Ps+vxUang+gnUU/Z+S
   gYclLDd0DnAZg/1kkUp7q4EvLOXHbmq0rDSp6dhtoaLk6dC5W6tMz2l56
   kFYRiBEzhTN8an7zQ+6CxDCI7U4dl8XiWEKBZgk7caaxzqNgb2kqknjDq
   DABF+myVf9cUZ5JBwSPcfM+kOu7cMM8l6+mzsCeuTILeq3lgl7AEZfyQi
   VpiWr85OrOYLnBn+1i3Y0uPopw3XpM6hskAqVHeCAwH1GCO01tvtnEj3U
   g==;
X-CSE-ConnectionGUID: HudpsxBtQ4mxqiFc733yzA==
X-CSE-MsgGUID: pC4P/E0iRzSVTxhrAK1lzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548403"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548403"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:02 -0700
X-CSE-ConnectionGUID: xjHqLrnXTGukPC4pRtnCGw==
X-CSE-MsgGUID: fHmtMA16RGeQjjS7Fr30ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352366"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:01 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 01/17] i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
Date: Sun, 20 Sep 2026 18:12:31 +0300
Message-ID: <20260920151248.46936-2-adrian.hunter@intel.com>
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

When a bounce buffer is required for DMA_TO_DEVICE transfers,
i3c_master_dma_map_single() rounds the DMA mapping length up to a
cache-line boundary:

	map_len = ALIGN(len, cache_line_size());

It then allocates the bounce buffer with:

	kmemdup(buf, map_len, GFP_KERNEL);

kmemdup() copies the full allocation size, causing it to read map_len
bytes from buf even though only len bytes are valid.  This results in an
out-of-bounds read of up to cache_line_size() - 1 bytes past the end of
the caller's buffer.

Fix the issue by allocating the bounce buffer with kzalloc() and copying
only len bytes from the original buffer.  The remaining bytes up to
map_len stay zero-filled, avoiding both the out-of-bounds read and
exposure of unrelated memory contents to the DMA engine.

Fixes: f8d9e56aeb87 ("i3c: master: Add helpers for DMA mapping and bounce buffer handling")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index afcd7a21a3e6..f9a6c8560fab 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2216,12 +2216,11 @@ struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
 
 	if (force_bounce) {
 		dma_xfer->map_len = ALIGN(len, cache_line_size());
-		if (dir == DMA_FROM_DEVICE)
-			bounce = kzalloc(dma_xfer->map_len, GFP_KERNEL);
-		else
-			bounce = kmemdup(buf, dma_xfer->map_len, GFP_KERNEL);
+		bounce = kzalloc(dma_xfer->map_len, GFP_KERNEL);
 		if (!bounce)
 			return NULL;
+		if (dir != DMA_FROM_DEVICE)
+			memcpy(bounce, buf, len);
 		dma_buf = bounce;
 	}
 
-- 
2.53.0

