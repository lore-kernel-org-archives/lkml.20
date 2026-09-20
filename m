Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189F243B6D4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917210; cv=none; b=BmBdaiNHZCJP60cv1ziSwp6MdgBgKKQ1yeWoz8550/eezZN9xnXmzIa9sxz9XCsv560GSJK4dXIGoWG15nUJxaMepoHldZhAv367z+wjGyOwAVwnXoKruQvFxtbe/g0KDKDaZbNg7gyEBQehdtn0M00OptjQba9Wv6QcifUb6l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917210; c=relaxed/simple;
	bh=RXVuBSnKZWaEPolC0Z/CcYsfmBjzOLdMt+LByjCo+BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRLFa88O/W2oGpJgB1l3diyLysdzJpVuCmxEve+qEacA32o1uHLx5URsH7hOQazzrD5Eo12NkRBYUPMnxPp/l5vwmVw9L8ElCITBw2ud0p5GY8IFuaqG+3iH/kUWjggffDKPrti/Xfmc0/wGxxy7YpXsv6bZ/gC4Em3a6PQzn7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4O+b0OZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4O+b0OZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789917208; x=1821453208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RXVuBSnKZWaEPolC0Z/CcYsfmBjzOLdMt+LByjCo+BM=;
  b=R4O+b0OZ4ka50TKfa75/qP+NvqgIWaa7Pwat/SDfSuvYAeBvkg5nSq2T
   ipUxK1+p0Lws+hmCbp/tVptNwRPm+Hg6J/+WcpEqadV3e927UC3F9pfZd
   4OP6m4ZWPrl/F+mqTP/hX2KM0g6ShlFZxNHyOgbeVWDVCL7JQBfpq3yF3
   6UimXWnfLxSKMkG2b9AiqS8a1S1WG7VuWufb2u7x2ERoxbjQiVi6Adnc6
   u9GttfVBV3VuT8Gaj8f8Z4ajRtPc2kfP0VPZXCj6qgoCuLJybu8lVxxE2
   xmSKWNfAuBJ7VUCc5cpp7d3s98EcqmFquMz0VIPzFdkYpKTmazlkTx4ur
   A==;
X-CSE-ConnectionGUID: /+YTRtk6R/myI5vIHyUsag==
X-CSE-MsgGUID: 6n2B8Sr5QIWFY/wUvoUuYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89548481"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="89548481"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:28 -0700
X-CSE-ConnectionGUID: ntIJgJZzQRCivt/mRUGLvQ==
X-CSE-MsgGUID: 3NrkezccQbmnu1cH3zdNWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="3352450"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.82])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:13:27 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 14/17] i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
Date: Sun, 20 Sep 2026 18:12:44 +0300
Message-ID: <20260920151248.46936-15-adrian.hunter@intel.com>
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

Several HCI definitions describe capabilities or modes that are not
defined by any released version of the I3C HCI specification.

HC_CAP_HDR_BT_EN uses a reserved HC_CAPABILITIES bit. Similarly,
MODE_I3C_HDR_BT uses a MODE value reserved for I3C transfers, while
MODE_I3C_Fm_FmP cannot be encoded in the 3-bit Command Descriptor MODE
field.

These definitions are currently unused, so there is no functional
change.  Remove them to avoid implying support for non-existent HCI
features and to prevent future misuse.

Assisted-by: GitHub-Copilot:claude-opus-5
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V3:

	None

Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 --
 drivers/i3c/master/mipi-i3c-hci/core.c   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index 3b9345718d27..9910df53c013 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -108,8 +108,6 @@ enum hci_cmd_mode {
 	MODE_I3C_SDR4		= 0x4,
 	MODE_I3C_HDR_TSx	= 0x5,
 	MODE_I3C_HDR_DDR	= 0x6,
-	MODE_I3C_HDR_BT		= 0x7,
-	MODE_I3C_Fm_FmP		= 0x8,
 	MODE_I2C_Fm		= 0x0,
 	MODE_I2C_FmP		= 0x1,
 	MODE_I2C_UD1		= 0x2,
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 4629a16debc9..7a39be64c4e1 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -55,7 +55,6 @@
 #define HC_CAP_DIRECT_COMMANDS_EN	BIT(18)
 #define HC_CAP_MULTI_LANE_EN		BIT(15)
 #define HC_CAP_CMD_CCC_DEFBYTE		BIT(10)
-#define HC_CAP_HDR_BT_EN		BIT(8)
 #define HC_CAP_HDR_TS_EN		BIT(7)
 #define HC_CAP_HDR_DDR_EN		BIT(6)
 #define HC_CAP_NON_CURRENT_MASTER_CAP	BIT(5)	/* master handoff capable */
-- 
2.53.0

