Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E723344BC82
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385446; cv=none; b=mRqKkB/57nL4E14OThYnDJQ+OEeQaxhVKEuS25lnrqp8bbMogBdAYUyBtNVS1a9sWh2FWwVFQVjJB/o/tHMCp3afXwFr/xysBq3Rf0WtSA67cIZCPIUxscNp5GtWT4sVvHPBgwwpaTrYIdR9wRAZxjHsyKXNnWfwHTy1OKyPXCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385446; c=relaxed/simple;
	bh=pJIK8h+LmB1ati3zd5d3Ye4KxsCVXpPb0Skxw0FknUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwsB7BIwX8W3OotNGB0+DBmUlZAvDKjM/8C1ClfeOs74eMbuMPStRe9oCOKWWZS6HpWdv8Efnix/6LevNzzpBvAbSPawrEHLiEG8ZY6St4XMz58tXgVcUjTjJwRFP7eG7DfQrCjHT8wKHJHhCDTkyKjNlDEpRRMLGA1ovvJpBPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgLzrqH3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgLzrqH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789385445; x=1820921445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pJIK8h+LmB1ati3zd5d3Ye4KxsCVXpPb0Skxw0FknUI=;
  b=IgLzrqH3dHgMxMmgSDQrtm7UovAZPGPcEOXzLtr/rE/mL/yMwGeeWaBY
   7QEAw/N4GAZsj/wsEuzJw4y0h9ErRfF3eJjAI88mdMBXaM5N0vANv5WkQ
   JqLpJSAFWgrzq2dcv9ILz5fQNchG1n1jwTBzm7/An4VKVZqkqXJQ7fU97
   7eL8tolHT8jDYFsr+Dz9atRui9o9tJfPRgmyuE+SrunJyuwiedez7Krax
   Lyrk6r22P0Nje57rMXhCD9fD00Bz91zCXEA9q8TmudIT2kZT2unSy2O1b
   tH/qG5dFvIDxFsQi2h2hDMUVKGY1qRlK5ZtzeLZqbpOk3ejoZKpbldUT/
   Q==;
X-CSE-ConnectionGUID: hR5lWzgWTj+0F/9GRMlErg==
X-CSE-MsgGUID: 88xfVySATRyfJczYJoB60w==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89864502"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89864502"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:44 -0700
X-CSE-ConnectionGUID: FC/Ck8dFRvqCZ8vZ49RIXQ==
X-CSE-MsgGUID: ae0jUmUQRcabgSOmiEYD6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="273133149"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.35])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:30:43 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/17] i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
Date: Mon, 14 Sep 2026 14:30:00 +0300
Message-ID: <20260914113003.183150-15-adrian.hunter@intel.com>
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
---
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

