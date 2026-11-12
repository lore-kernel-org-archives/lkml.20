Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489206;
	b=ve8NDM/co/0NIAoan7E+NVCBdslypjI1Y+I7D7DaaeZdBBuTM6GpWAP4sIcFRxX58b9A
	 AMj5oxcrDgR56wfT2a/KpUDq/39Xo9XgHNR2YcM/Aydf+CmeUZwR7HwGLtlQVU9B9MsQ+
	 E2zXZBuZmJ4zAycajdAUjETUbMa/SYgYOJhXj9sv3R/KsMBS0WxkBBB9OGazhJs847uYE
	 gUD7WxlSVhK1GTIaHxkI3yyedITnEZ36yN79+gxLCw9/AmEZjX+gPhkg7Y8HeG5b8D7vp
	 ymB0zmpR9wqG41fWamCEp8+tk4MYQ57enXOZpSCwvOb1yQ31wfXc6HHOAHUjLvli1iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489206;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=wU31mejql4PZZEtgae16N4HX4x4UHd5kwXITvcm2N2A=;
	b=3vJFcdLjrJhjHI6CvXu6FvdkqZQ++119ltb+uwNnX/n89/cO433n6e9Un5orlEnogdJP
	 3HwOXumoKKcpyEnOrJfn01QpHLWNgM8fKrJwnEvjsKR1RcOdjZc46C3TSUF1qdxQgW4A+
	 J+mUuIffIUF7BnIUMikXCVsOWjb8sZpS27UsKvRz3cVTy49dq/mRfXByO2rEmKjBFKo/i
	 KLHA2PuEro0tOT6f6BrhpQ2BrHZC/Wbs8QL/ZF3Fwlujv1/hq/g10mch7KR82X/J8yExA
	 N/0WEUVA5JWyvgMZ8Q1l6jwu5HpHBvQWWShItKfYwNxhsLYxRW5F/O72N23g1fVyIdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=YOH2z47x;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFF560A2631;
	Thu, 12 Nov 2026 13:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFF560A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=YOH2z47x
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wU31mejql4PZZEtgae16N4HX4x4UHd5kwXITvcm2N2A=;
	b=YOH2z47xfLP3iWrQL8m1jnQ2PfUMKMOeXoGvAO89FIX2UxeFs4J0xxGL+qGyrCHGfb0MkxRot
	vZ29cnj0vtJV/Uwbg9UAtoAU/3C9AEXDvpaEl1aQ0Yv2ZxSvGYAaXgjjjFiYw466xi80jq6uyo+
	ttTWpJC7rQsMjWEX329kT0A=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jQLRP1Tf9zRhQs;
	Thu, 12 Nov 2026 21:13:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 47E6C40579;
	Thu, 12 Nov 2026 21:13:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 7/9] arm_mpam: Program the hard limit for the software controller
Date: Thu, 12 Nov 2026 21:12:52 +0800
Message-ID: <20261112131255.4043381-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112131255.4043381-1-ruanjinjie@huawei.com>
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

MPAM's maximum bandwidth control has a HARDLIM bit:
- When set, a PARTID that uses more than its maximum gets no further
  bandwidth
- When clear, requests above the maximum are serviced when no other
  request is waiting

The driver writes only the 16-bit maximum, so the control is a soft
limit and the controller cannot keep a single requester below its target.

Carry the hard limit in mpam_config and set it when the controller is
enabled. MPAMF_MBW_IDR.MAX_LIM reports the implemented behaviors: 00
both, 10 hard only, 01 soft only. Record the soft-only case and the
reserved 0b11 in resctrl_membw::max_is_soft_limit so mba_MBps is
refused there. Merging resources into a class propagates the soft-only
case, because the hard limit is usable only when every resource
implements it.

The percentage interface never sets the hard limit, and resctrl clears
a limit set by the controller when it resets the controls on unmount.
Write the bit from the controller state on every write, so that a hard
limit left by an interrupted reset is cleared.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 55 ++++++++++++++++++++++++++-------
 drivers/resctrl/mpam_internal.h |  4 +++
 drivers/resctrl/mpam_resctrl.c  |  8 +++++
 3 files changed, 56 insertions(+), 11 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..2c8f60c96d3f 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1025,8 +1025,22 @@ static int mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 		 */
 		props->bwa_wd = min(props->bwa_wd, 16);
 
-		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
+		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features)) {
+			/*
+			 * MAX_LIM: 0b00 both limits, 0b01 the soft limit
+			 * only, 0b10 the hard limit only. 0b11 is reserved;
+			 * treat it as the soft limit only so the software
+			 * controller is refused rather than rely on an
+			 * unknown limit behavior.
+			 */
+			props->max_lim = FIELD_GET(MPAMF_MBW_IDR_MAX_LIM, mbw_features);
+			if (props->max_lim == 3)
+				props->max_lim = 1;
+
 			mpam_set_feature(mpam_feat_mbw_max, props);
+			/* The hard-limit bit is a configuration bit. */
+			mpam_set_feature(mpam_feat_max_limit, props);
+		}
 
 		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MIN, mbw_features))
 			mpam_set_feature(mpam_feat_mbw_min, props);
@@ -1911,16 +1925,21 @@ static int mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_max, rprops)) {
-		if (mpam_has_feature(mpam_feat_mbw_max, cfg)) {
-			ret = mpam_write_partsel_reg(msc, MBW_MAX, cfg->mbw_max);
-			if (ret)
-				return ret;
-		} else {
-			ret = mpam_write_partsel_reg(msc, MBW_MAX,
-						     MPAMCFG_MBW_MAX_MAX);
-			if (ret)
-				return ret;
-		}
+		u32 val = MPAMCFG_MBW_MAX_MAX;
+
+		if (mpam_has_feature(mpam_feat_mbw_max, cfg))
+			val = cfg->mbw_max;
+
+		/*
+		 * The hard-limit bit follows its own feature bit so that it
+		 * can be set without changing the maximum.
+		 */
+		if (mpam_has_feature(mpam_feat_max_limit, cfg) && cfg->max_limit)
+			val |= MPAMCFG_MBW_MAX_HARDLIM;
+
+		ret = mpam_write_partsel_reg(msc, MBW_MAX, val);
+		if (ret)
+			return ret;
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_prop, rprops)) {
@@ -2661,6 +2680,19 @@ static void __props_mismatch(struct mpam_props *parent,
 		parent->bwa_wd = min(parent->bwa_wd, child->bwa_wd);
 	}
 
+	/*
+	 * The hard limit is only usable if every resource implements it,
+	 * so the soft limit only wins the merge. The encoding follows
+	 * MPAMF_MBW_IDR.MAX_LIM.
+	 */
+	if (alias && !mpam_has_feature(mpam_feat_mbw_max, parent) &&
+	    mpam_has_feature(mpam_feat_mbw_max, child)) {
+		parent->max_lim = child->max_lim;
+	} else if (mpam_has_feature(mpam_feat_mbw_max, parent) &&
+		   child->max_lim == 1) {
+		parent->max_lim = 1;
+	}
+
 	if (alias && !mpam_has_cmax_wd_feature(parent) && mpam_has_cmax_wd_feature(child)) {
 		parent->cmax_wd = child->cmax_wd;
 	} else if (MISMATCHED_HELPER(parent, child, mpam_has_cmax_wd_feature,
@@ -3405,6 +3437,7 @@ static bool mpam_update_config(struct mpam_config *cfg,
 	maybe_update_config(cfg, mpam_feat_cpor_part, newcfg, cpbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_part, newcfg, mbw_pbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_max, newcfg, mbw_max, has_changes);
+	maybe_update_config(cfg, mpam_feat_max_limit, newcfg, max_limit, has_changes);
 
 	return has_changes;
 }
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..184fbc01fa91 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -234,6 +234,7 @@ enum mpam_device_features {
 	mpam_feat_msmon_mbwu_capture,
 	mpam_feat_msmon_mbwu_rwbw,
 	mpam_feat_partid_nrw,
+	mpam_feat_max_limit,
 	MPAM_FEATURE_LAST
 };
 
@@ -243,6 +244,7 @@ struct mpam_props {
 	u16			cpbm_wd;
 	u16			mbw_pbm_bits;
 	u16			bwa_wd;
+	u8			max_lim;
 	u16			cmax_wd;
 	u16			cassoc_wd;
 	u16			intpri_wd;
@@ -364,6 +366,7 @@ struct mpam_config {
 	u32	cpbm;
 	u32	mbw_pbm;
 	u16	mbw_max;
+	bool	max_limit;
 
 	struct mpam_garbage	garbage;
 };
@@ -628,6 +631,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
 
 /* MPAMF_MBW_IDR - MPAM features memory bandwidth partitioning ID register */
 #define MPAMF_MBW_IDR_BWA_WD		GENMASK(5, 0)
+#define MPAMF_MBW_IDR_MAX_LIM		GENMASK(9, 8)
 #define MPAMF_MBW_IDR_HAS_MIN		BIT(10)
 #define MPAMF_MBW_IDR_HAS_MAX		BIT(11)
 #define MPAMF_MBW_IDR_HAS_PBM		BIT(12)
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..53fcffb23984 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1236,6 +1236,7 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 		r->ctrl_scope = RESCTRL_L3_CACHE;
 
 		r->membw.delay_linear = true;
+		r->membw.max_is_soft_limit = (cprops->max_lim == 1);
 		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
 		r->membw.min_bw = get_mba_min(cprops);
 		r->membw.max_bw = MAX_MBA_BW;
@@ -1481,6 +1482,13 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
 			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
 			mpam_set_feature(mpam_feat_mbw_max, &cfg);
+			/*
+			 * Always carry the hard-limit bit: the control follows
+			 * the software controller, so a hard limit left by an
+			 * earlier mount is cleared by the next write.
+			 */
+			mpam_set_feature(mpam_feat_max_limit, &cfg);
+			cfg.max_limit = r->membw.mba_sc;
 			break;
 		}
 		fallthrough;
-- 
2.34.1

