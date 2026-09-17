Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F51E0DD8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672450; cv=none; b=L4dEHbCDQ5vaYav0yJpY80EmIDwryg6wZMiq/kTBdKC3RPpSAWkHuVQn161/C0sqgnzuQCzr7gJy+iLpu9oXgALr2fxBjK7LXfZrPwWPRt3PZMGs4t96JHp92q7+f/iuO7v1+ewnOMw/rcCqhU4nJlDaPcbYDybZCULnnQ3TuTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672450; c=relaxed/simple;
	bh=SUyc+nMLAwZJvPjjFsQn7tGF2W6VgYi2i1dh4rd6pr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgEryCVfrQ7l4pT3eTmV8Bo13DJn/51/YM5d4XU1HFmXQYHo+JUm010p1kSwRkcQX5oHrTHo6IlGtHjHah7mpi08Se3TQ51dZ2hCkok5vjeD8kQn2jmNd1lL1ZJQzvYYSfPVVGJQgkbxK7mih179fQ/bGlFRweRwHSChXvL0g+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMMKa6PF; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMMKa6PF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672448; x=1821208448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SUyc+nMLAwZJvPjjFsQn7tGF2W6VgYi2i1dh4rd6pr0=;
  b=YMMKa6PFjJRlgbEzDxsG7h6cNnVxtGvwuswuB8zCrMxN1DHa7iVDskJI
   ODFKE8bhRxWc741oQXm26imxwQdZcBaJsaFJUWuiuQjsQWBYEF349t3OT
   DnGtZNj+IuS0eeBI2vbwm+MzmvntIa5ElF/ltDuLFDSEmLergm1tgPNC6
   8O7Ftc+Z5fY3Fz898rZ2Lawn/TSXZZI7GjsAKFDc/o2f0pwFa6KG8e9mS
   TRAVL9epftFaBq79aYHzWPUSjKhuS+p9t1UCJ8kA1dhamqG9FXx3Kk2bh
   P2o5slyRaYq/QfHvDxiifOUolfKBsCAtHkeqzz69p4F5HradyljQN3/Ky
   g==;
X-CSE-ConnectionGUID: WZr9c0yBQ1Kr6BEKc4k/hQ==
X-CSE-MsgGUID: NXRR8tTYQhS13qY5NTiGwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639856"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639856"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:08 -0700
X-CSE-ConnectionGUID: L8ZJvUhpSAKSS05IdkThCg==
X-CSE-MsgGUID: pzCKcvXtQlem4H5tB/BkWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271917"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:06 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 01/17] i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
Date: Thu, 17 Sep 2026 22:13:40 +0300
Message-ID: <20260917191356.133242-2-adrian.hunter@intel.com>
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

