Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723730;
	b=E/cCbUM73mHChqccjmHlx8ZfPiiUnHwhgaK6K65jn5vz/S5s1JHn18LtZMg0HDLj91i/
	 Qo1oRg4pFFuYRqKpTR0g+diu3d24w0ddgYkVNBoUmdQzyEN/0twszHSQIaEu5xK1Lkf12
	 bJYxIYRATuztTBUv6zcYDlBMwU3GPw/x2/NhTu2zqs06+YgsG8/qr5rec5ZlBAublQ+sr
	 XxE5tahKFLwpLC99PEcqlOTXpYjN4G9otIGFsCenVCr46p0y9cKbWP6ABapgCOMm+un8J
	 2gDPGHUtWqBzxav20Oha7xOrjYC+KwmHk2coE/ltsUCpNXbcqbk5bxC/WZYvgP3rNuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723730;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=H/r5lCESdnLWixismF2Ll7J8Tt+0Gu5mGs338JRoUVs=;
	b=ogEqRPFA6qXyDHrQiDR3lyapU4yLlQ5jJEfkbV0P9H+qKe3pOlvfJRu+kEu+nsPNMxG1
	 WQWhqi/T463HRbyx6iDjhmB0Ou+HuSAF7oiQBobkAcOys+8s7c21w+2VIHLomIKSTYla5
	 FmKPQqyb3B3cikK4S4U14UBGaBWfwM1Wl7SyBygoc1no5pvPqf62hEAvpZoWcJcG8Oz+q
	 wIyCIisZmSITXQGFjOil8aEeBoJWVnPimlgFwuFJFTu2kKujvhqM1V5wPo3gfnC4DrqIG
	 9Mp6y4IYN129cMIu4Cwn9lAwGAwPfGJz1V6ieDLJ4gGY4coGbctKa4mlsC5uqgBZH8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="Hl7kYP/Y";
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2289606A327
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2289606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Hl7kYP/Y
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=H/r5lCESdnLWixismF2Ll7J8Tt+0Gu5mGs338JRoUVs=;
	b=Hl7kYP/YEfTDlkjNYIJzslKvGrcsZ+aRvRzeHzY4+KB5HPAAX77fTVG5hKCqwRWWPEGfqLqiH
	9SSxt3/zX8IO7bkk2ACuXVJD/g6rOt0IcaLxC2jb3mdfUpwEAsFssdZuYcfRXk1sNuta1SDVLI+
	mjPV+n1Cg+RrC8TIeQWoB7Y=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4j9nXC20WGzmV6F;
	Fri, 23 Oct 2026 10:48:43 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 51BE840578;
	Fri, 23 Oct 2026 10:48:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 10:48:45 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 08/10] arm_mpam: resctrl: Expose the capacity controls as pseudo resources
Date: Fri, 23 Oct 2026 10:48:10 +0800
Message-ID: <20261023024812.232820-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023024812.232820-1-ruanjinjie@huawei.com>
References: <20261023024812.232820-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Expose the MPAM capacity controls as L3MAX/L2MAX and L3MIN/L2MIN:
pick_caches() gives each pseudo resource the class picked for its base
cache, gated on the corresponding feature bit. Sharing the class means
the domains and components are shared, and only the mpam_config field
written differs.

control_init() describes them as RESCTRL_SCHEMA_RANGE.
resctrl_arch_update_one() and resctrl_arch_get_config() carry the
CMAX/CMIN values through mpam_config, reusing the fixed-point helpers
with cmax_wd.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 81 ++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index dcdbf0404f07..5f423b7a8e41 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -756,6 +756,12 @@ static u32 mbw_max_to_percent(u16 mbw_max, struct mpam_props *cprops)
 	return __mbw_max_to_percent(mbw_max, cprops->bwa_wd);
 }
 
+/* CMAX/CMIN use the same fixed-point format, but cmax_wd bits wide */
+static u32 ca_max_to_percent(u16 ca_max, struct mpam_props *cprops)
+{
+	return __mbw_max_to_percent(ca_max, cprops->cmax_wd);
+}
+
 /*
  * Find the band whose upper bound is closest to the specified percentage.
  *
@@ -783,6 +789,12 @@ static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)
 	return __percent_to_mbw_max(pc, cprops->bwa_wd);
 }
 
+/* CMAX/CMIN use the same fixed-point format, but cmax_wd bits wide */
+static u16 percent_to_ca_max(u8 pc, struct mpam_props *cprops)
+{
+	return __percent_to_mbw_max(pc, cprops->cmax_wd);
+}
+
 static u32 get_mba_min(struct mpam_props *cprops)
 {
 	if (!mba_class_use_mbw_max(cprops)) {
@@ -975,6 +987,18 @@ static void mpam_resctrl_pick_caches(void)
 		else
 			res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
 		res->class = class;
+
+		/*
+		 * Re-use the same class for the pseudo resources exposing the
+		 * extra controls: the components backing the domains are the
+		 * same, only the applied config field differs.
+		 */
+		if (mpam_has_feature(mpam_feat_cmax_cmax, &class->props))
+			mpam_resctrl_controls[class->level == 2 ?
+					RDT_RESOURCE_L2_MAX : RDT_RESOURCE_L3_MAX].class = class;
+		if (mpam_has_feature(mpam_feat_cmax_cmin, &class->props))
+			mpam_resctrl_controls[class->level == 2 ?
+					RDT_RESOURCE_L2_MIN : RDT_RESOURCE_L3_MIN].class = class;
 	}
 }
 
@@ -1249,6 +1273,41 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 		r->name = "MB";
 		r->alloc_capable = true;
 		break;
+	case RDT_RESOURCE_L3_MAX:
+	case RDT_RESOURCE_L2_MAX:
+		r->schema_fmt = RESCTRL_SCHEMA_RANGE;
+		r->ctrl_scope = (r->rid == RDT_RESOURCE_L2_MAX) ?
+			RESCTRL_L2_CACHE : RESCTRL_L3_CACHE;
+
+		r->membw.delay_linear = true;
+		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
+		r->membw.min_bw = 1;
+		r->membw.max_bw = MAX_MBA_BW;
+		/*
+		 * bw_validate() rounds up to bw_gran unconditionally, keep
+		 * every percentage valid as the underlying fraction is
+		 * converted with round-to-nearest anyway.
+		 */
+		r->membw.bw_gran = 1;
+
+		r->name = (r->rid == RDT_RESOURCE_L2_MAX) ? "L2MAX" : "L3MAX";
+		r->alloc_capable = true;
+		break;
+	case RDT_RESOURCE_L3_MIN:
+	case RDT_RESOURCE_L2_MIN:
+		r->schema_fmt = RESCTRL_SCHEMA_RANGE;
+		r->ctrl_scope = (r->rid == RDT_RESOURCE_L2_MIN) ?
+			RESCTRL_L2_CACHE : RESCTRL_L3_CACHE;
+
+		r->membw.delay_linear = true;
+		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
+		r->membw.min_bw = 0;
+		r->membw.max_bw = MAX_MBA_BW;
+		r->membw.bw_gran = 1;
+
+		r->name = (r->rid == RDT_RESOURCE_L2_MIN) ? "L2MIN" : "L3MIN";
+		r->alloc_capable = true;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1413,6 +1472,14 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	case RDT_RESOURCE_L3:
 		configured_by = mpam_feat_cpor_part;
 		break;
+	case RDT_RESOURCE_L3_MAX:
+	case RDT_RESOURCE_L2_MAX:
+		configured_by = mpam_feat_cmax_cmax;
+		break;
+	case RDT_RESOURCE_L3_MIN:
+	case RDT_RESOURCE_L2_MIN:
+		configured_by = mpam_feat_cmax_cmin;
+		break;
 	case RDT_RESOURCE_MBA:
 		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
 			configured_by = mpam_feat_mbw_max;
@@ -1430,6 +1497,10 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	switch (configured_by) {
 	case mpam_feat_cpor_part:
 		return cfg->cpbm;
+	case mpam_feat_cmax_cmax:
+		return ca_max_to_percent(cfg->cmax, cprops);
+	case mpam_feat_cmax_cmin:
+		return ca_max_to_percent(cfg->cmin, cprops);
 	case mpam_feat_mbw_max:
 		return mbw_max_to_percent(cfg->mbw_max, cprops);
 	default:
@@ -1482,6 +1553,16 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		cfg.cpbm = cfg_val;
 		mpam_set_feature(mpam_feat_cpor_part, &cfg);
 		break;
+	case RDT_RESOURCE_L3_MAX:
+	case RDT_RESOURCE_L2_MAX:
+		cfg.cmax = percent_to_ca_max(cfg_val, cprops);
+		mpam_set_feature(mpam_feat_cmax_cmax, &cfg);
+		break;
+	case RDT_RESOURCE_L3_MIN:
+	case RDT_RESOURCE_L2_MIN:
+		cfg.cmin = percent_to_ca_max(cfg_val, cprops);
+		mpam_set_feature(mpam_feat_cmax_cmin, &cfg);
+		break;
 	case RDT_RESOURCE_MBA:
 		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
 			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
-- 
2.34.1

