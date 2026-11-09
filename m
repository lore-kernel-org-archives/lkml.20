Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230827;
	b=VO4zxtUnKZ00hEJDCaSI0HZrsEcS7d41UILTE+izkKLHfdcl87E6qlZ4hZFoQFTFYSCr
	 bJ8n4ICCaYtq0KlcvThi7CscmHoHkXI6F6OwAbnyZf9BiU0I4dbB14o1RVIIYMyrOTCdK
	 fFx/Xxwe3xrJSBrLuAjtoCZpMzKeUFj3KQL4nOS+DUonwnOAQQ80vWpcXK7nZiSTGz5Aq
	 Dx0SpZw2tGCNDISFr+gu1vVYkaSueteyIkebftqeWnuE0ycLx7m66YeWcxmkc6R3DMwYc
	 A9LrP8fv02R5wu108JG6eAcfZmkb7uW1bnr7yY6mjOigv6tEeQOPWV0OTM000Pr5XSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yjcmzLe9NLb31BRnk0YYkyQlltkBEnbcgBXYWiIw6EQ=;
	b=gnnT5jXNBLgLJ15CJRkX768q7CLKLpJfudQ+ycw0uP2oyOemWYLamWXaIhm9mUimPVle
	 wE8ymrhBV67oNx7W9EYL7QfTxs33NM2tzL0vMHYQqLWwVWHY3jwu2iLBP7gh870J25uoX
	 q32njHSZ9qYs7H/z5SVMmtUHJ0UByWHYSKS2yazdZB51lKF6NQauPTn2FiQHDh0LaSLw+
	 PNPcjonzoA2Rc87jQOqO+228MmTHIQJg4NldXj7gbkQMfykXpGG5lkiqposEa/EksOmA1
	 uXUkVEY6sb0AYRA0djCZYE2Ku4dhivraS1TO12XtsfSLSuIIdYnPa2M7Nf5KscBnVEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOnEoRaJ;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA86606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA86606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOnEoRaJ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso619942a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230826; x=1794835626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjcmzLe9NLb31BRnk0YYkyQlltkBEnbcgBXYWiIw6EQ=;
        b=BOnEoRaJaQ8SXaiOcetimIWNWbQ+7UsWUrCCnjs2uC9ELzvmoi31fLLUIUTYtpKEPg
         GLIlJ5n2L9RvbSYWRr+3ZKNhsOHTu6z2NAFABRZ7dUgnVFBOvqsb5OPwzhZ1WvDj8fEh
         rK4FM8wM2o6Q1CdEveKQdEUy4Nn8jZMTzXmHMK7p/2wq3MJHyrPxFtSRpr7LSjA65+QT
         T8szyVfbZDBiaJU2rOoVli3vEeq8427Ie3L1QzGzI8nHd6cbC8IkQ2A0Y5+cowQ1Mrsb
         mlKshoXFSg5db+4UhmjGFlYsd9WmyVAax3Dg/OfPBkILyOqSdZLHwfYGT+WL8JrEsoLN
         2iTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230826; x=1794835626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjcmzLe9NLb31BRnk0YYkyQlltkBEnbcgBXYWiIw6EQ=;
        b=YgD3KJOuWLbE0OulLTEHPIEHXab8y07sClYuLl8KZrMbvcj/laeSu9M3Zs/if/KnrW
         snGG5XdxK6MCOpAABmqOaoHqOLEd7DA2JNaNnzL3Exr4s88meQ6uSMp7wYaCJy26UA2T
         9mcp0m/OblbboK/LVNpnLvFj1QvuV7UnSqu/wRl5t8rgHwKB21QTyKpuAa9qRj1P5iKQ
         ZucsOc8UKKj9aci6DUHY1O48dshrFAv0HN1g+pkj1hOAr72pvD+rghhZ5QgttwObMeEI
         Zv89DsCEIZm04+rDDWaIltBi92pzYw9RYCerYNWO1H78tw2YFAeuOp9GacRGBohRDRU5
         jwGg==
X-Forwarded-Encrypted: i=1; AL+hErHAHA0OOXkjiTrLoMZuIDP0uygr5aMv7gjV7Req6C/p1YLT9CRpRv3synj0Cel0o8g/4d8YgsqIa2mhIwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UNFzY1qXAYsyZ5eqVSojokaJB1jkCq/nfHrEZfxWwko6mTqGk
	cqAQ6L3zKiVZBs8C1AhCxyEDIURXVmrI+ARsI6LqPfaXNVuizS7pdFyh
X-Gm-Gg: AYBFou2rDr5e0zUttU8AASf0iGmim50W8snX57+Jjc0DLPuSaoQBcA5Grv3sMdm2ggt
	KWITI1t3f4ui9PIdb/RPb3pCw6WMsFdlMYzaAg0jSrRJ2EGmWAT4PyUH1oAjsUC5SvUsYVNumyI
	Cva9m1z7qd8HKbMmQAbbwojE1BVY4qFIquL/dD3lRi6sSOt1xTfSn+aNKOj2KNuwneonAL7oV9Y
	Qb5L7O8zRdVPtYpS2VliUAaKQ4VEd3H8l+48IeKUTZO6GPGjZF3bB0MPpt5TIzJd+ktnFQC38UH
	LnHvIWNLm56SHV9Rw0AA4WwXnZaa/hV3z74rAJiCfrioNyvO8ESu7VDaB5HUfWRTLy8R0M7k502
	ctwkg23enEa0GlMcLXA22GOZ/HQUrDBiALlBmNGDS1CcNBaG0lzlxx6SqzVGYb7B1BJMenVMuj9
	KitEy2hhxi9dF/5dsTU6yGJJTX7NpywHivxPw5S89Rq8SwUJRnuDun4NsU8wId4nLy2L060mqY6
	eD+F1VJ5nkYOkXZ9l+l5XBCepp0CY21CCKMga+O0JcN4yoOuI/ghFJH4lne49tFRfPne2PSeTOt
	AIuqXKYym1bgmV/3Zsya+BoWaLVplaveWYHQ5epFocxuMI/ODwSRUtD/MyIgi4ZR
X-Received: by 2002:a17:90b:3e48:b0:3b0:9cc6:62bc with SMTP id 98e67ed59e1d1-3b12d4ca89fmr3867376a91.37.1794230826398;
        Mon, 09 Nov 2026 05:27:06 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:27:06 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 6/6] arm_mpam: Program the hard limit for the software controller
Date: Mon,  9 Nov 2026 21:26:21 +0800
Message-ID: <20261109132621.3862497-7-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

MPAM's maximum bandwidth control has a HARDLIM bit (IHI 0099 B.d
Section 9.6.9): when set, a PARTID that uses more than its maximum gets
no further bandwidth; when clear, requests above the maximum are
serviced when no other request is waiting. The driver writes only the
16-bit maximum, so the control is a soft limit and the software
controller cannot keep a single requester below its target.

Carry the hard limit in mpam_config and set it when the controller is
enabled. MPAMF_MBW_IDR.MAX_LIM (Section 9.5) reports the implemented
behaviors: 00 both, 10 hard only, 01 soft only. Record the soft-only
case (and the reserved 0b11) in resctrl_membw::max_is_soft_limit so
mba_MBps is refused there. Merging resources into a class propagates
the soft-only case, as the hard limit is only usable when every
resource implements it.

The percentage interface never sets the hard limit, and resctrl clears
one set by the controller when it resets the controls on unmount.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 55 ++++++++++++++++++++++++++-------
 drivers/resctrl/mpam_internal.h |  4 +++
 drivers/resctrl/mpam_resctrl.c  |  9 ++++++
 3 files changed, 57 insertions(+), 11 deletions(-)

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
index 5468367776e2..5f35bfe1955a 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1236,6 +1236,7 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 		r->ctrl_scope = RESCTRL_L3_CACHE;
 
 		r->membw.delay_linear = true;
+		r->membw.max_is_soft_limit = (cprops->max_lim == 1);
 		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
 		r->membw.min_bw = get_mba_min(cprops);
 		r->membw.max_bw = MAX_MBA_BW;
@@ -1481,6 +1482,14 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
 			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
 			mpam_set_feature(mpam_feat_mbw_max, &cfg);
+			/*
+			 * Always carry the hard-limit bit so that writing the
+			 * maximum clears a hard limit set by an earlier mount
+			 * of the software controller.
+			 */
+			mpam_set_feature(mpam_feat_max_limit, &cfg);
+			if (r->membw.mba_sc)
+				cfg.max_limit = true;
 			break;
 		}
 		fallthrough;
-- 
2.43.0

