Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BA244B681
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385445; cv=none; b=rIHjJbAxluDDLNOaW5REeYZX1vjs3J6dE/iCB1ZoCk0BuP7ZqM9hlYBDs+0/DUeE54eSZq52GvM/+fAyHKdzTbnLrZJwVjfIkdQSVUIfeWCFbF9Wi9ceW/DR5GzM8B+CNxW5Kj6O10c0SBRwv9dZqGv1qlk4d/LZPszoBK2CSIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385445; c=relaxed/simple;
	bh=jUJX6Vwi0QJS1vF8ANtiaodTfduuJhjMv+hosq07Gco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VpPgIapaafS3AzbBLbGlBngFMHwcUhxYNLJB78HWamBc5l/EZ6tkVtbWEgJ9QHvo+Kgs4hX4+E2FjCYndqX+/H9Uvuzx3S33LEPqdYZglZyoBKdGA/OcRJAUliTsoo48DTbqhUL+Lkez2yYwgZcma16eIPV74nUBGGIOxTAKEc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYxxRFOV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYxxRFOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385443; x=1820921443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jUJX6Vwi0QJS1vF8ANtiaodTfduuJhjMv+hosq07Gco=;
  b=KYxxRFOVW//kdVadW8yGEv0isll8ggD+xCpEYzGEmAko7jhSK8MfySfy
   YQybvj4NgBTcLI9neLmIno9dVAGdLOq5eZhCMyHNvWRuiiola0LtQ0XXX
   GCJA91Gk50Kdjkm5YUq1soP+2Yt/T9uEeH9tlCv0jfo1iAwSG5/nMRZHM
   zsj4XB5h75xlXL1kk+eG6u75CXXuK9DnRBodwTt8KPOP761ysJMOpSJX2
   SIGlcwzFdh6q7Z9ksOIyEdyPcWUOIVDMthKSwQ1Wwpek0GOxYZyQiz4DR
   DE1LnS/lhkKwqRiOdqI0GhzpsMWCR4d3j76XvNXQoEjAMFf6E+AYPJAEf
   g==;
X-CSE-ConnectionGUID: AnN16SPqT6C6hM9PKYS9zg==
X-CSE-MsgGUID: KFuiGsrWSFytV8ZI3zkQHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864495"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864495"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:43 -0700
X-CSE-ConnectionGUID: M4VJyuRTSu23vQlT1DTc5Q==
X-CSE-MsgGUID: Y3edpOEER7eDOn1BkKT6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133146"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:41 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/17] i3c: mipi-i3c-hci: Remove invalid transfer size limit
Date: Mon, 14 Sep 2026 14:29:59 +0300
Message-ID: <20260914113003.183150-14-adrian.hunter@intel.com>
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

The driver derives a maximum transfer size from
HC_CAP_MAX_DATA_LENGTH in HC_CAPABILITIES, but no published version of
the I3C HCI specification defines such a field.

HC_CAPABILITIES reserves Bits[31:8] in HCI v1.0 and Bits[27:22] in HCI
v1.1 and v1.2, so the bits used by HC_CAP_MAX_DATA_LENGTH are reserved
in all released HCI versions.  Neither the HCI nor the I3C TCRI
specifications define a maximum data length capability.

On compliant controllers reserved bits read as zero, making the
computed limit 65536 bytes.  Since struct i3c_xfer.len is u16,
transfers can never reach that size and the resulting -EFBIG check can
never trigger.

Remove the unused capability definition and the dead size check.

The driver's effective limit remains unchanged. HCI specifications
define DATA_LENGTH as a 16-bit field and require larger transfers to be
split across multiple Transfer Descriptors.  The driver already relies
on the core's 16-bit length types elsewhere when constructing
descriptors.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b9b20797d045..4629a16debc9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -51,7 +51,6 @@
 #define HC_CAP_SG_DC_EN			BIT(30)
 #define HC_CAP_SG_IBI_EN		BIT(29)
 #define HC_CAP_SG_CR_EN			BIT(28)
-#define HC_CAP_MAX_DATA_LENGTH		GENMASK(24, 22)
 #define HC_CAP_CMD_SIZE			GENMASK(21, 20)
 #define HC_CAP_DIRECT_COMMANDS_EN	BIT(18)
 #define HC_CAP_MULTI_LANE_EN		BIT(15)
@@ -473,7 +472,6 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 	struct i3c_hci *hci = to_i3c_hci(m);
 	struct hci_xfer *xfer;
 	DECLARE_COMPLETION_ONSTACK(done);
-	unsigned int size_limit;
 	int i, last, ret = 0;
 
 	dev_dbg(&hci->master.dev, "nxfers = %d", nxfers);
@@ -482,13 +480,8 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 	if (!xfer)
 		return -ENOMEM;
 
-	size_limit = 1U << (16 + FIELD_GET(HC_CAP_MAX_DATA_LENGTH, hci->caps));
-
 	for (i = 0; i < nxfers; i++) {
 		xfer[i].data_len = i3c_xfers[i].len;
-		ret = -EFBIG;
-		if (xfer[i].data_len >= size_limit)
-			goto out;
 		xfer[i].rnw = i3c_xfers[i].rnw;
 		if (i3c_xfers[i].rnw) {
 			xfer[i].data = i3c_xfers[i].data.in;
-- 
2.53.0

