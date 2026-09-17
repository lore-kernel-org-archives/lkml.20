Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03674DAFBD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657025; cv=none; b=uXXPtiDDiBlD4Bnlszx/3AH2sGd54+a+ccK2BPbOZvNOfxKk7Arsbt7a04nU+W9Q0PYCK/9wpi/4b/z4lYiIQ1PRnza1acNfskuWzpQM+4zvfZZCus7ifBKSBrN8de4tAbU4RH1YZr1bjfoCASIWuuEMgdipSgExzYA3EP0jCr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657025; c=relaxed/simple;
	bh=xXU2j6Vlto2OKlCswyt9x1bLuTnySAcZffwGOCbaRbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gy3LEhGbkcEGw4rUxTbUv/T7O/b9kfbLj+ctUlXOg6R0CWa+Bsn+zoGE3IBydATcQLArJcPlvvTNh36u13tcKxyKjNTL+BQQoGTWIbct9MlkbtPhNJysxp83de6gUQepqQW9ALUMJ0tbUGDNjxDCeVRMAyeDN+ahFuYarOQS77Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VFBQdp/J; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VFBQdp/J"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9F3C1FC4;
	Thu, 17 Sep 2026 07:56:31 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1177A3F86F;
	Thu, 17 Sep 2026 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656995; bh=xXU2j6Vlto2OKlCswyt9x1bLuTnySAcZffwGOCbaRbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VFBQdp/JVixGXtOxuJU1o8za8y8MkMXHCDT8D2M+w4XzsxOgiMz0evSBT+/YG3FWE
	 PxBnFzKOL2Nif8TNAKNZ5SGlRR0HUmIfJm81dEpYmpO3YYUyBwboFWkxoI4kKNjgfc
	 pG3P3Uk955/em+dpKoTFyiHYeDw1yPz9fupj9Odg=
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
Subject: [PATCH v2 05/12] arm_mpam: Ensure MBWU counters are reset on restore
Date: Thu, 17 Sep 2026 15:56:10 +0100
Message-ID: <20260917145617.2202986-6-ben.horgan@arm.com>
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

When an MSC becomes inaccessible due to cpu offline CFG_MBWU_CTL is set to
zero in mpam_save_mbwu_state(). This is very likely to mean that the config
will mismatch when restoring and so the monitor will be reset. However, the
state may have been lost and so there are no guarantees. Ensure the reset
happens by setting the reset_on_next_read and remove the unnecessary writes
from mpam_save_mbwu_state().

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
---
Changes since v1:
Use local variable mbwu_state consistently (Shaopeng)
Only access ris->mbwu_state when have the mon_sel_lock
---
 drivers/resctrl/mpam_devices.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index d39d210574a6..6cba3ef21cc8 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1652,6 +1652,7 @@ static int mpam_restore_mbwu_state(void *_ris)
 	u64 val;
 	struct mon_read mwbu_arg;
 	struct mpam_msc_ris *ris = _ris;
+	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_class *class = ris->vmsc->comp->class;
 
@@ -1659,16 +1660,20 @@ static int mpam_restore_mbwu_state(void *_ris)
 		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
 			return -EIO;
 
-		if (!ris->mbwu_state[i].enabled) {
+		mbwu_state = &ris->mbwu_state[i];
+
+		if (!mbwu_state->enabled) {
 			mpam_mon_sel_unlock(msc);
 			continue;
 		}
 
 		mwbu_arg.ris = ris;
-		mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
+		mwbu_arg.ctx = &mbwu_state->cfg;
 		mwbu_arg.type = mpam_msmon_choose_counter(class);
 		mwbu_arg.val = &val;
 
+		mbwu_state->reset_on_next_read = true;
+
 		mpam_mon_sel_unlock(msc);
 
 		__ris_msmon_read(&mwbu_arg);
@@ -1701,15 +1706,11 @@ static int mpam_save_mbwu_state(void *arg)
 
 		cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
 		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
-		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 
-		if (mpam_ris_has_mbwu_long_counter(ris)) {
+		if (mpam_ris_has_mbwu_long_counter(ris))
 			val = mpam_msc_read_mbwu_l(msc);
-			mpam_msc_zero_mbwu_l(msc);
-		} else {
+		else
 			val = mpam_read_monsel_reg(msc, MBWU);
-			mpam_write_monsel_reg(msc, MBWU, 0);
-		}
 
 		cfg->mon = i;
 		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
-- 
2.43.0

