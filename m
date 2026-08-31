Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D9F3E5A0B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176325; cv=none; b=WkiLec76RrTwuwTWj2RqgaJ+RbXfaPhH/Wa21qlB0tRISQU/whbE3tgFQYe7d/tgi+sU++W7ue6JyAB108coMTi3wW3hZ0seGUaFvjENLLM1ldMHClccAF6A4Lt1XjqfcNSHCUJ4GBaQSBd+IF+hJAH3Qx3tLoN3Bj4XQEk6QW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176325; c=relaxed/simple;
	bh=hwmMhCYK3a8hrYjtNGCx1Y4KisTSk2GO7CBfRf7aNxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXZyXa2Ib8DIFjAzpIH9bvYXdCQ5G0TYdoeMKsFzPhg80RBfb5UHpLvSM14AIgUgSuOkmn15oCLefxVRBjGYDD3Rdwk2CYdL/JvKRv08RBIBFPIxAR+I3hF4uNRgvVvWs34iQzJFdZmdTtu3TR8gkquDdpcFJVyebGsox4Up3AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nu1auKKG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nu1auKKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788176323; x=1819712323;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=hwmMhCYK3a8hrYjtNGCx1Y4KisTSk2GO7CBfRf7aNxU=;
  b=nu1auKKGWBVV9hPXVEh1Yr3evGMqYFxDtRD2BYygCyeyxCZIbT2jPCF3
   ks3BNSXQWPYWbis89+Cs39hxeE2N6jvS3w+mgcKO3j/x4zPzb6ZAk50Ib
   0tYzx9EAzPezzNMFCn0LrZLnN/y1LtMG/ZY4tg+U8K2ZQYrFdScw+pVt4
   bhPo4sRnXR9ql1+He9kw9HUbzL7XBUlKHSNAI9JhkwgLpcQ5YwlTdS4WB
   9xIosgNkGZXjj7sOmNlko8xl2/YSYAx2vNbRX2KGxjz2LtNS4R0zsC8Yd
   zVezjdqpii5uGN6GlgkuYTduJbnAaQIAzKRH/qROC1TyutdmxpvE8p5pQ
   A==;
X-CSE-ConnectionGUID: cFALQ5q3TWiPkw9wUqhj6Q==
X-CSE-MsgGUID: tzwnlRaFTS6Az9ZL1JHtiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="76129324"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="76129324"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:38:43 -0700
X-CSE-ConnectionGUID: QMHlCdtdRyifUEhbDWpOeg==
X-CSE-MsgGUID: BPA5cbmWQ+mYfrX121x9gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="262645106"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:38:42 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Mon, 31 Aug 2026 14:38:31 +0300
Subject: [PATCH char-misc-next 1/4] mei: make polling wait interruptible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-cri_polling-v1-1-d927315e6598@intel.com>
References: <20260831-cri_polling-v1-0-d927315e6598@intel.com>
In-Reply-To: <20260831-cri_polling-v1-0-d927315e6598@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Menachem Adin <menachem.adin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788176320; l=1426;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=hwmMhCYK3a8hrYjtNGCx1Y4KisTSk2GO7CBfRf7aNxU=;
 b=MddRt+qCW2c6GwWqb/yDM5MGm37nqt1wnc+ETtVg+MMIKn4NBa2aMU8TpGU4QHBN5k09gDgzu
 bkHRPMZK7L1Ctp5um1H+vAH7KUIFcQ/mWS3ICrkkeBWci9yrHJ0J6lV
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Polling thread wait should be interruptible to avoid stuck task.

Reviewed-by: Menachem Adin <menachem.adin@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/gsc-me.c | 2 +-
 drivers/misc/mei/hw-me.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/mei/gsc-me.c b/drivers/misc/mei/gsc-me.c
index 376840b2c354..b38ddb04f2e8 100644
--- a/drivers/misc/mei/gsc-me.c
+++ b/drivers/misc/mei/gsc-me.c
@@ -242,7 +242,7 @@ static int __maybe_unused mei_gsc_pm_runtime_resume(struct device *device)
 
 	if (mei_me_hw_use_polling(hw)) {
 		hw->is_active = true;
-		wake_up(&hw->wait_active);
+		wake_up_interruptible(&hw->wait_active);
 	}
 
 	mutex_unlock(&dev->device_lock);
diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c
index e7fbc02fb70f..ef7e1289ad7e 100644
--- a/drivers/misc/mei/hw-me.c
+++ b/drivers/misc/mei/hw-me.c
@@ -1441,9 +1441,9 @@ int mei_me_polling_thread(void *_dev)
 		struct mei_me_hw *hw = to_me_hw(dev);
 		u32 hcsr;
 
-		wait_event_timeout(hw->wait_active,
-				   hw->is_active || kthread_should_stop(),
-				   msecs_to_jiffies(MEI_POLLING_TIMEOUT_IDLE));
+		wait_event_interruptible_timeout(hw->wait_active,
+						 hw->is_active || kthread_should_stop(),
+						 msecs_to_jiffies(MEI_POLLING_TIMEOUT_IDLE));
 
 		if (kthread_should_stop())
 			break;

-- 
2.53.0

