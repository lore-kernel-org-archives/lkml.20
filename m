Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BFA50AC30
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657022; cv=none; b=DdPWiRldNKz0vYd16YsXL37HxAK+WxU6Lq2DovC8jcRZeDYqM9Zn1b68EJImamrIgx6B9GZqUvLhqAkrbOXoZn3j66rc+7pZUdQgVk6Di/q7FMwyIGlQO0iX4TkuXOhWtLrL1TRaNC0pepWcMFrOh3YweRxzbQJx8FwalaMt+BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657022; c=relaxed/simple;
	bh=lb4IRP+Y1Hz2fJbSNi4TVLYctKlrDlgtGYuXAuzDSJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AccOmFWxj1ISzBKvyvKrUX3s4thT9VR1Dl30tJBFH/X+alWfxG985EdiDUM1F4FCE3W1ltxW6/EREbJiVgwDtYe7LbhySdBlGQlRzqRGIgV1MHpI+zNL91e5gBz8gotCtQt8RWg5o6wZRAutcap5YKV1yTrTzktOnr3pTT7Q4bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nr/3FAiG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nr/3FAiG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E4821F91;
	Thu, 17 Sep 2026 07:56:30 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54DBF3F86F;
	Thu, 17 Sep 2026 07:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656993; bh=lb4IRP+Y1Hz2fJbSNi4TVLYctKlrDlgtGYuXAuzDSJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nr/3FAiGv7IZVAPqm9GBEIy/0+t1vKHstf/mzx+RjYYIEe7/+PDk81EwkzBgG995Z
	 a/ecN+6wPCPhEMzpyDbaq+QUFGHPkPyXEREU3Irk49O44GJs+eNXfPeiplSo+mzv3H
	 IcIBpYHxf+2jze7w9j2rD/utgrFcwMDxJKk0Kqc0=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 04/12] arm_mpam: Add missing mon_sel locking in MBWU save and restore
Date: Thu, 17 Sep 2026 15:56:09 +0100
Message-ID: <20260917145617.2202986-5-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mon_sel_lock is used to protect the mbwu_state, as well as h/w accesses
that use MPAMCFG_MON_SEL. However, in mpam_restore/save_mbwu_state(),
mbwu_state is accessed without holding the mon_sel_lock.

Add the missing locking.

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since v1:

'continue' if monitor enabled
move locking earlier in mpam_save_mbwu_state() and adjust commit message
---
 drivers/resctrl/mpam_devices.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index e349db525882..d39d210574a6 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1652,17 +1652,26 @@ static int mpam_restore_mbwu_state(void *_ris)
 	u64 val;
 	struct mon_read mwbu_arg;
 	struct mpam_msc_ris *ris = _ris;
+	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_class *class = ris->vmsc->comp->class;
 
 	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
-		if (ris->mbwu_state[i].enabled) {
-			mwbu_arg.ris = ris;
-			mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
-			mwbu_arg.type = mpam_msmon_choose_counter(class);
-			mwbu_arg.val = &val;
+		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
+			return -EIO;
 
-			__ris_msmon_read(&mwbu_arg);
+		if (!ris->mbwu_state[i].enabled) {
+			mpam_mon_sel_unlock(msc);
+			continue;
 		}
+
+		mwbu_arg.ris = ris;
+		mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
+		mwbu_arg.type = mpam_msmon_choose_counter(class);
+		mwbu_arg.val = &val;
+
+		mpam_mon_sel_unlock(msc);
+
+		__ris_msmon_read(&mwbu_arg);
 	}
 
 	return 0;
@@ -1680,12 +1689,12 @@ static int mpam_save_mbwu_state(void *arg)
 	struct mpam_msc *msc = ris->vmsc->msc;
 
 	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
-		mbwu_state = &ris->mbwu_state[i];
-		cfg = &mbwu_state->cfg;
-
 		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
 			return -EIO;
 
+		mbwu_state = &ris->mbwu_state[i];
+		cfg = &mbwu_state->cfg;
+
 		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
 			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
 		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
-- 
2.43.0

