Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A9C443AA8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385420; cv=none; b=LnEd77sISRsPaBHEWo02mrHljLgPoH6tXxRENTmvmEsR0oOOjzL8JyoICVebKfU30BglT84fsKxckPmqfjyCITehuj9lZc8hOJUuagX2g6JR+jnoHkbPtgRSN9qqGGdCNx0NPW4xlBsyTx/apYUvRPFXaVZQhRxkdDSE4PgqlbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385420; c=relaxed/simple;
	bh=aVG8ApbrMeITL2vobZYuzF9rR5qtyehLwSaBRnUoQIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U90iRB3G6aicLrJ+oOZcfKvSo45UQhnB676QxITkp29kyurx1q5EvcSKfRoPD9QcYKszF9HfEAZQxsAy3NYG32YAzQDwp8yAN/KkUu+WS+CLs7VWxoQYOzC6T3Xb7QJ/dC3lhgoCROwcM2pbMqVrFQTOix2WWlaoQgWFUqBV+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7npPajC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7npPajC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385418; x=1820921418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aVG8ApbrMeITL2vobZYuzF9rR5qtyehLwSaBRnUoQIw=;
  b=D7npPajCCAZNJSr0n33d0fAsDfvKBMFmxVLUHFNsefkmoyWZUNo7blUo
   1ylwuusbmbYHAqlTgxg4bhS7RfAn3ciQYXW3HBQUjIZS3kB70quwIoTbd
   e9fjnzmbHboAFyR6KN/1Wxn9248F+8c2/xTSVUD9Wo0ID26zWBpCUrgdW
   oonYXPSh+rpUbh3Xoh6ghFf2a51y3/gqTQ5xs1iYaBR7KWfnhMv2KPKnc
   lO2cukAnfMOyf4VJXQpCYIFF4RTmIUO87xIyl2OuNfEKm+ziI9YXn25KF
   lBpMztIFH+wNXNo6MCwbjFz27poLldZADcJz37K5kWV/MLnt4d7/kWMQf
   g==;
X-CSE-ConnectionGUID: hrN8dE54SNi7svw6HoT7HA==
X-CSE-MsgGUID: ACB84OAzTTeLFrV12ZYRFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864410"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:17 -0700
X-CSE-ConnectionGUID: HXP2fMbxStGHVn4ZSJatIg==
X-CSE-MsgGUID: 8Ux+fK0pTpa2osbIOJH+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133021"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:16 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/17] i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
Date: Mon, 14 Sep 2026 14:29:47 +0300
Message-ID: <20260914113003.183150-2-adrian.hunter@intel.com>
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
---
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

