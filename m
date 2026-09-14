Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC11F443AAE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385422; cv=none; b=gvnOvNQkMUofauRR9JOdrRI7lmwAqUaL8s7QUkMKm6pj7xnQAu4q2rWjSRKdzZrUWurx7MLSRdo0qdYwG9qeE+AbCKChvI2T5pNMwtW++Nn9L/ZRTWKGYoL+H4YCy7lspzjCH7Fu8plaizf64s3L4RQTR19nfghyMQnSois2gP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385422; c=relaxed/simple;
	bh=AWJpGZg1USdXSuuSye8Vru9aY+e4QifHuzuSPImJmGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQzHvsVWmgOuVCRe9ONxzkKu2lkl81oZlEiekD15gJHr4PaIx7g53kn9e3fBP8retZts5HdJZPg0xFT11Z9qdSSvovyo8rIBuQqqqcqVSb4XmzJtzRT+hxhtuyOcZSASZKF34unWg+tKlvOzgAfltNYojwaiChDWvp0uUW+oRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIfjoMvS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIfjoMvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385420; x=1820921420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AWJpGZg1USdXSuuSye8Vru9aY+e4QifHuzuSPImJmGg=;
  b=WIfjoMvScebZoPsS/J6Ph0QahqbFnhJsca10TziILk16xRmlQTKel43B
   F70EkIEWjnto5XC8ilgLGqf8F9d2R496ntkEutJCdgsHjwcRNxRA9TW5X
   DK0ZJ/r2bknZhVUkY+vqso69gmFpTVM814Z0UiFUjxUdTaXi8Cx60QW84
   TqWcTnJgh+GkwXH8kGQfFNkWIR/GQasF0HF5fvLOWDzcqzzlefUBflw1A
   xvtcPU0jc0rfatOrA8VTikBY0/o9kQbt0VSjjBNt/YX/Lq54LN5zvFPjy
   tcWy62gAwwI2H/r/vDua1l+hllS5e9YXxP0RPCF6L5rOWPdIH8hQOVoDn
   A==;
X-CSE-ConnectionGUID: Hkp5rE6DT86gn5i4v+hlxw==
X-CSE-MsgGUID: ugmG+2z4S3+lXH3/Qa82jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864417"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864417"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:19 -0700
X-CSE-ConnectionGUID: mx4jDuN6SDOJksbcolhC5w==
X-CSE-MsgGUID: hZGL/coTTSmH7qOaW52E4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133046"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:18 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/17] i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
Date: Mon, 14 Sep 2026 14:29:48 +0300
Message-ID: <20260914113003.183150-3-adrian.hunter@intel.com>
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

The controller writes whole DWORDs, so a read whose length is not a
multiple of 4 overwrites up to 3 bytes past the end of the destination
buffer. That is a property of the controller, not of the IOMMU, but the
bounce buffer that works around it was used only when the device was
IOMMU mapped. Everywhere else the buffer is left unprotected.

Drop the device_iommu_mapped() condition.

The overrun is easily seen with CONFIG_SLUB_DEBUG=y and kernel command
line options intel_iommu=off slub_debug=FZPU, which reports it as a
kmalloc redzone overwrite.

Fixes: 9e23897bca62 ("i3c: mipi-i3c-hci: Use physical device pointer with DMA API")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 7c2b20474130..5b195978f376 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -428,7 +428,7 @@ static void hci_dma_unmap_xfer(struct i3c_hci *hci,
 static struct i3c_dma *hci_dma_map_xfer(struct device *dev, struct hci_xfer *xfer)
 {
 	enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
-	bool need_bounce = device_iommu_mapped(dev) && xfer->rnw && (xfer->data_len & 3);
+	bool need_bounce = xfer->rnw && (xfer->data_len & 3);
 
 	return i3c_master_dma_map_single(dev, xfer->data, xfer->data_len, need_bounce, dir);
 }
-- 
2.53.0

