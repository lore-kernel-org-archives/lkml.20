Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9280C4E0B7E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672476; cv=none; b=Bt+HDSjH1CuvjxLAV2sEArbfePPScqJUmUgj8Wvlv/hMI/r48/L4/pR//UzElPi/XE6lqaZBSGVPsCVgS0MxTuBl7OmUgW7WbG3RA++5Gf2SIuUDPXbMYiqYT/RZibUzrzbzjkl2q6kOA+DArXlwzZDBlkgTA0tb2uGqmlDXdt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672476; c=relaxed/simple;
	bh=1IBS9TcW8iwf8Wot5JZR8RPd1EsQzugRVyv9ZPA98gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3hmGApaNv4hSfK23LYk927btXsax8uggEOd2JDjhESICrvlIPIsv+nCp6GwonVjb29rTTzYnPmLBoxH6CVnnGgyXsggq/s6HaWkFrQrA5t5C5V/R2JZNse/V5N2hziTqWxMEw6Kz8eH/Wl0eyR2WOgjfnKsSKK21VYDbPAgZZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igg3kriC; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igg3kriC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672474; x=1821208474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1IBS9TcW8iwf8Wot5JZR8RPd1EsQzugRVyv9ZPA98gQ=;
  b=igg3kriCzFFnhwxqANypbB1APgwdK/Mf9VEs9FxFbfoiAAvI/fLYTQ1X
   YrmocJQKfmImMmx2ZbPlSgyHWwtM2y5CFy+ugMpzCEZcWx/rFgX8dyKCO
   4Djc8m6x2fZ1gCcgga2N9lBW4JjPt/sCUJtQ1sFAmf58pq++gQCupPMpE
   FMzwsEMlEUfegWmf//0m22j3gumYXIcRATP9+KQCbQOu6Ly2xRgMh3GTi
   vVdU18uortvpCGzfi0iBLePEFUiyHgB2pjbyACdf6lO1Fgo29eebZXMkx
   c3Ua7LZxjckTESWElb6Ott/EPPkc75KfgLIerWUkM5h/c2CI1UdaqpZR7
   g==;
X-CSE-ConnectionGUID: u/ms+IoSQkK4FPPPMzL/cQ==
X-CSE-MsgGUID: uXVF4z0STG+zQd1o6HzzLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639969"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:34 -0700
X-CSE-ConnectionGUID: jBK0WX7mSMylube3TxvwAg==
X-CSE-MsgGUID: JEq0OZQSR1+eLsHa1pA1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270272012"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:32 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 14/17] i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
Date: Thu, 17 Sep 2026 22:13:53 +0300
Message-ID: <20260917191356.133242-15-adrian.hunter@intel.com>
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

