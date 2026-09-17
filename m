Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEE64078CE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657039; cv=none; b=DDfKIyugnAIODv2nv6YcyY+ReUO8TyiuxRy9GwLK91hqJA/2xiKrhKrVlO93vdVT3fdDBrhNb/npDJHALMdVToNJoOQbBB6xf8x/Mx684Yv5W6FZF37f77sYdfHNu0N3ZMklMeBBFU60o4lSg3eJvwzEJskEf3EO1z5XGSbBuwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657039; c=relaxed/simple;
	bh=76q5cpOhNsALoJHhtg9CHZox/kN9XBXelve6gDLVtEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfCKb2r1lbc5KK/wL6fFOjsiO3OpTMdJXDNLQ8652FbY8XRlh7KoI4g7VmMBh1b0rb8H2tIVvoxTybGEOGeoAQqDaOajQpU9gJofyiRDl3AbWzdcdOVLTOsU4OWMRLiINyJtjANM1JxxxtPwYf64mExFOSNxf6XRKgR3uGui6uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EqZyHqzM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EqZyHqzM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BA6D1FC7;
	Thu, 17 Sep 2026 07:56:33 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C24E93F86F;
	Thu, 17 Sep 2026 07:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656997; bh=76q5cpOhNsALoJHhtg9CHZox/kN9XBXelve6gDLVtEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EqZyHqzMjBKg6m/UKirpd80PgMEJzPxJM8kIeLs3FCZ5imxkqVAzhF0hOOAwjGChw
	 V5o97xmDZR/rVJuHdajeqOW8xW3vguixEe1w3aBIc8jA4REKWSo9YGCHbPvWm1cRMe
	 Wh9wXRJkg+3pjDHUSK0max6eP9jAuHwG7UyNBXfA=
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
Subject: [PATCH v2 06/12] arm_mpam: Use __ris_msmon_read() for saving MBWU state
Date: Thu, 17 Sep 2026 15:56:11 +0100
Message-ID: <20260917145617.2202986-7-ben.horgan@arm.com>
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

mbwu_save_mbwu_state() reads the MBWU counters and adds that to a saved
correction value. However, the type of counter to read is determined by the
RIS rather than the class and overflow is not taken into account. Fix this
and mitigate against further divergence by using a locked variant of the
same helper used for user monitor reads, __ris_msmon_read(). Using the
locked variant avoids having to drop and retake the mon_sel lock. If the
lock was dropped, an interleaved monitor read which detects overflow would
cause the overflow not to be accounted for in the saved value of
mbwu_state->correction. The correction is no longer updated for disabled
counters but this has no effect as the saved values are not expected to be
useful for disabled counters.

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since v1:

'continue' if not monitor not enabled
add __ris_msmon_read() to avoid race on update of mbwu_state->correction (Sashiko)
update the commit message
---
 drivers/resctrl/mpam_devices.c | 63 ++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 6cba3ef21cc8..62562ce2f9aa 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1029,12 +1029,6 @@ struct mon_read {
 	bool				waited_timeout;
 };
 
-static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
-{
-	return (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, &ris->props) ||
-		mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris->props));
-}
-
 static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
 {
 	int retry = 3;
@@ -1202,13 +1196,12 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
 	return overflow_val;
 }
 
-static void __ris_msmon_read(void *arg)
+static void __ris_msmon_read_locked(struct mon_read *m)
 {
 	u64 now;
 	bool nrdy = false;
 	bool config_mismatch;
 	bool overflow = false;
-	struct mon_read *m = arg;
 	struct mon_cfg *ctx = m->ctx;
 	bool reset_on_next_read = false;
 	struct mpam_msc_ris *ris = m->ris;
@@ -1216,10 +1209,8 @@ static void __ris_msmon_read(void *arg)
 	struct mpam_msc *msc = m->ris->vmsc->msc;
 	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
 
-	if (!mpam_mon_sel_lock(msc)) {
-		m->err = -EIO;
-		return;
-	}
+	mpam_mon_sel_lock_held(msc);
+
 	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
 	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
@@ -1312,7 +1303,6 @@ static void __ris_msmon_read(void *arg)
 	default:
 		m->err = -EINVAL;
 	}
-	mpam_mon_sel_unlock(msc);
 
 	if (nrdy)
 		m->err = -EBUSY;
@@ -1323,6 +1313,21 @@ static void __ris_msmon_read(void *arg)
 	*m->val += now;
 }
 
+static void __ris_msmon_read(void *arg)
+{
+	struct mon_read *m = arg;
+	struct mpam_msc *msc = m->ris->vmsc->msc;
+
+	if (!mpam_mon_sel_lock(msc)) {
+		m->err = -EIO;
+		return;
+	}
+
+	__ris_msmon_read_locked(m);
+
+	mpam_mon_sel_unlock(msc);
+}
+
 static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
 {
 	int err, any_err = 0;
@@ -1674,9 +1679,9 @@ static int mpam_restore_mbwu_state(void *_ris)
 
 		mbwu_state->reset_on_next_read = true;
 
-		mpam_mon_sel_unlock(msc);
+		__ris_msmon_read_locked(&mwbu_arg);
 
-		__ris_msmon_read(&mwbu_arg);
+		mpam_mon_sel_unlock(msc);
 	}
 
 	return 0;
@@ -1688,10 +1693,12 @@ static int mpam_save_mbwu_state(void *arg)
 	int i;
 	u64 val;
 	struct mon_cfg *cfg;
+	struct mon_read mbwu_arg;
 	u32 cur_flt, cur_ctl, mon_sel;
 	struct mpam_msc_ris *ris = arg;
 	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_msc *msc = ris->vmsc->msc;
+	struct mpam_class *class = ris->vmsc->comp->class;
 
 	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
 		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
@@ -1707,17 +1714,31 @@ static int mpam_save_mbwu_state(void *arg)
 		cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
 		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
 
-		if (mpam_ris_has_mbwu_long_counter(ris))
-			val = mpam_msc_read_mbwu_l(msc);
-		else
-			val = mpam_read_monsel_reg(msc, MBWU);
-
 		cfg->mon = i;
 		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
 		cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
 		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
-		mbwu_state->correction += val;
 		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
+
+		if (!mbwu_state->enabled) {
+			mpam_mon_sel_unlock(msc);
+			continue;
+		}
+
+		val = 0;
+		mbwu_arg = (struct mon_read) {
+			.ris = ris,
+			.ctx = cfg,
+			.type = mpam_msmon_choose_counter(class),
+			.val = &val,
+		};
+
+		__ris_msmon_read_locked(&mbwu_arg);
+
+		mbwu_state->reset_on_next_read = true;
+		if (!mbwu_arg.err)
+			mbwu_state->correction = val;
+
 		mpam_mon_sel_unlock(msc);
 	}
 
-- 
2.43.0

