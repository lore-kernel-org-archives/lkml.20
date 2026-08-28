Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B03C226D18;
	Fri, 28 Aug 2026 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931022; cv=none; b=EB5v+ThziBs2Yvo2jc1PHCclXtkkTVdfNluQwcYQXIeHQqlRLHVv8t8fJPCsdOXXGwZXDoyP4Xj7zin+BH+6UL9dV4gJ/YGG0RCXtfhS3llti+n0mEJDgDq5C7BvmRpCnrD4UZJTdbtGOAduFq2QbIZ0VGUIhkUNkh/fsGvaJLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931022; c=relaxed/simple;
	bh=rfJT+Huyraak1YVrhZhCUl+qeiCLy0e0yZ+GR+xWVqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRqHVramfcbTLDAOJwYeve48zzXmps/5ll7nFsbmAe398v1/XcX1LBxW3/tfMta1fD8iGZYjGtl9BsuVJYV6sUAzzB6ZbFSRGNZzpM33HXFw7SGKyRsX2GF0ayb5phvTu41U0umI0uM1AdWiOGChK2UCYcdBdwjS8zZH6cTjB98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIcdezGN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIcdezGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787931017; x=1819467017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rfJT+Huyraak1YVrhZhCUl+qeiCLy0e0yZ+GR+xWVqA=;
  b=UIcdezGNfbtyitybvq1sbD2YFgG52jZSvokKjwZ60JkJeqJx34v0aKVw
   STnYMCdf+xFnKqVsNja2RiEb1Cz+Bk/wrCQmZmjoR+cb0F2zPHiIMabwL
   TciTfGmO+Kv/rBX36HxC47CrZLDSgdKxwQAKVy0bwpClnuF9T4FYDFv5H
   Fg07g/oY9pqksfkCjIWmqW/ewzcLl5rdw0c6wtxjJNaTIbSbQFOFy6Mgw
   iotM4Rtt5qsnQMDtSotlRaYDzICt5oRiY6aaQHGAmDabmCJTWsd46KBBD
   rR/15/s95IcH5pvFyNyOsSez1VZtYqteBKx0drXvA+99SgVHmbU+fdmf4
   Q==;
X-CSE-ConnectionGUID: mTSK/UxUTMyaFRlr34Zy1A==
X-CSE-MsgGUID: Gxj+wTkKTk6Cs0E8XRYCEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99104597"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="99104597"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:30:10 -0700
X-CSE-ConnectionGUID: 2S/vktQ6RY+JB+6hUzF+yg==
X-CSE-MsgGUID: ngP5/F4lTEu1CHwf4LCmvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="291682285"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.223.138])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:30:09 -0700
From: Tony Luck <tony.luck@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Breno Leitao <leitao@debian.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 5/7] EDAC/intel-bff: Reset bitfix filter when it overflows
Date: Fri, 28 Aug 2026 08:30:00 -0700
Message-ID: <20260828153002.10290-6-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828153002.10290-1-tony.luck@intel.com>
References: <20260828153002.10290-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get notifications for all errors logged in machine check banks. Skip any
that do not indicate a bitfix filter overflow.

Machine check banks are scoped to a hardware unit, so the reset has to be
issued from a CPU within that unit. Use the CPU that reported the error.

Co-developed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 drivers/edac/intel-bff.c | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/edac/intel-bff.c b/drivers/edac/intel-bff.c
index f70c5e697dae..c46d5255f34b 100644
--- a/drivers/edac/intel-bff.c
+++ b/drivers/edac/intel-bff.c
@@ -17,11 +17,14 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/cpufeature.h>
 #include <linux/device-id/x86_cpu.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 
@@ -32,6 +35,11 @@
 #include <asm/msr.h>
 #include <asm/msr-index.h>
 
+/* Intel bitfix filter control register defines */
+#define MSR_MC0_BFF_CTL		0x000006c0
+#define MSR_MCx_BFF_CTL(x)	(MSR_MC0_BFF_CTL + (x))
+#define  MCI_BFF_RESET		BIT_ULL(0)
+
 /* Machine check bank hardware unit types */
 enum bff_bank_type {
 	BFF_BANK_NONE = 0,
@@ -64,6 +72,38 @@ MODULE_DEVICE_TABLE(x86cpu, bff_cpu_ids);
 
 static const enum bff_bank_type *bff_bank_types;
 
+static void bff_reset_and_report(struct mce *mce)
+{
+	/* Reset bitfix filter using the CPU that logged the yellow status */
+	if (wrmsrq_on_cpu(mce->extcpu, MSR_MCx_BFF_CTL(mce->bank), MCI_BFF_RESET))
+		pr_warn("Failed to reset bitfix filter for CPU %d Bank %d\n",
+			mce->extcpu, mce->bank);
+}
+
+static int bff_mce_notify(struct notifier_block *nb, unsigned long val, void *data)
+{
+	struct mce *mce = data;
+
+	/* TES is undefined for uncorrected errors. */
+	if (mce->status & MCI_STATUS_UC)
+		return NOTIFY_DONE;
+
+	if (MCI_STATUS_TES(mce->status) != MCI_STATUS_TES_YELLOW)
+		return NOTIFY_DONE;
+
+	if (mce->bank >= MAX_NR_BANKS || bff_bank_types[mce->bank] == BFF_BANK_NONE)
+		return NOTIFY_DONE;
+
+	bff_reset_and_report(mce);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block bff_notifier = {
+	.notifier_call	= bff_mce_notify,
+	.priority	= MCE_PRIO_EDAC,
+};
+
 static int __init bff_init(void)
 {
 	const struct x86_cpu_id *m;
@@ -89,10 +129,18 @@ static int __init bff_init(void)
 
 	bff_bank_types = (const enum bff_bank_type *)m->driver_data;
 
+	mce_register_decode_chain(&bff_notifier);
+
 	return 0;
 }
 
+static void __exit bff_exit(void)
+{
+	mce_unregister_decode_chain(&bff_notifier);
+}
+
 module_init(bff_init);
+module_exit(bff_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Tony Luck");
-- 
2.55.0

