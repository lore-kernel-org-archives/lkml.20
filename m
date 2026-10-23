Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723730;
	b=W2qZzwP+AEg0nTK3AYEt7BJHxW7M06DFJD5mJ3Eb3f9ps4er//f62emxYTDLxx0qM4g1
	 osQtDf1+cVOW2o14SM3XXLwrcU/XiLcAmbPFPDqMgIbICUD1lvpVpZ4gy9pa+PLqfz2pz
	 cMkXd5UJeSo2L8dUyOOI9SYABiT6PbqR9E6TTUMTRtiGskPsNaIg5yorlJpyKrDVQ4wCB
	 86CwH8sBm/tcFj0OpOhQtl/94jv1spLATbuxn3hbIioC+nZpe5VRIRK7ZbKpvx2i580Bm
	 kKm/0eCVrHK+pZJeNayTLJqjM8RuVaQae7D2OrnJ+Cd5NNAx61bIGvWO4I21EVb48dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723730;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=rs9bOnLz6kjHQQHVp1+twUAe3lgU2cNZ9FLNoimuly8=;
	b=kgZHGkm604WYO0AK5amOQh81T/4KjPdkdq4USHTZO70KhgdPIpLojEN4chUmGqv8hLSy
	 rFauxtOh+yf2QVy/yRIhE8Fb3ny3mx5ovJSVewyMMPowhsweZBYR+1vI7DCjZ19PcuHpc
	 xpuPSYtzDkaVjetplmkMI0eOceGnh4c1r8jkT6CLRaJ+fpE1KwLsIuXbtYd8ifjsEpMCL
	 vmmlYEfE8fmeF0kX8BaP8kHJWQjugAfZCMVSbgEv5qP4P41HzbLsVlK99rMXV1IdmfowX
	 QSf+MOtryw7t1bl55FvcMHRzsiJNBUMbw5bJ0XbgB7hUIKQYNQVHrmUwSq2bWW5+qTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ihxtrccY;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC4A606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC4A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ihxtrccY
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rs9bOnLz6kjHQQHVp1+twUAe3lgU2cNZ9FLNoimuly8=;
	b=ihxtrccYwShWnAGS2WNyyCUAXfXDwfe/souBiFs95DF3031/+5Sl9LV8nNpdixOo0nvrCAEJz
	iJxljygq3U/nuIby/0XlDnFD1DW+KQXY94g2mNyFn4l2ew7gRs98HRrQbhtEsQ+STAagwnOFN1K
	F77JIb3lqixMxJ3/ckZUggM=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j9nXB5H5xzcbX5;
	Fri, 23 Oct 2026 10:48:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CB7C940561;
	Fri, 23 Oct 2026 10:48:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 10:48:46 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 09/10] arm_mpam: resctrl: Expose the priority controls as pseudo resources
Date: Fri, 23 Oct 2026 10:48:11 +0800
Message-ID: <20261023024812.232820-10-ruanjinjie@huawei.com>
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

Expose the MPAM internal priority control as L3PRI/L2PRI/MBPRI: the
cache pseudo resources share the class picked for their base cache,
while MBPRI shares the class picked for MBA. Each is gated on the
intpri feature bit.

control_init() describes them as RESCTRL_SCHEMA_RANGE, with the range
derived from intpri_wd. update_one() and get_config() pass intpri
through mpam_config raw.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5f423b7a8e41..008db81e734b 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -999,6 +999,9 @@ static void mpam_resctrl_pick_caches(void)
 		if (mpam_has_feature(mpam_feat_cmax_cmin, &class->props))
 			mpam_resctrl_controls[class->level == 2 ?
 					RDT_RESOURCE_L2_MIN : RDT_RESOURCE_L3_MIN].class = class;
+		if (mpam_has_feature(mpam_feat_intpri_part, &class->props))
+			mpam_resctrl_controls[class->level == 2 ?
+					RDT_RESOURCE_L2_PRI : RDT_RESOURCE_L3_PRI].class = class;
 	}
 }
 
@@ -1053,10 +1056,16 @@ static void mpam_resctrl_pick_mba(void)
 	}
 
 	if (candidate_class) {
+		struct mpam_props *cprops = &candidate_class->props;
+
 		pr_debug("selected class %u to back MBA\n",
 			 candidate_class->level);
 		res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
 		res->class = candidate_class;
+
+		/* As with the caches, re-use the class for the pseudo resources */
+		if (mpam_has_feature(mpam_feat_intpri_part, cprops))
+			mpam_resctrl_controls[RDT_RESOURCE_MB_PRI].class = candidate_class;
 	}
 }
 
@@ -1308,6 +1317,23 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 		r->name = (r->rid == RDT_RESOURCE_L2_MIN) ? "L2MIN" : "L3MIN";
 		r->alloc_capable = true;
 		break;
+	case RDT_RESOURCE_L3_PRI:
+	case RDT_RESOURCE_L2_PRI:
+	case RDT_RESOURCE_MB_PRI:
+		r->schema_fmt = RESCTRL_SCHEMA_RANGE;
+		r->ctrl_scope = (r->rid == RDT_RESOURCE_L2_PRI) ?
+			RESCTRL_L2_CACHE : RESCTRL_L3_CACHE;
+
+		r->membw.delay_linear = true;
+		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
+		r->membw.min_bw = 0;
+		r->membw.max_bw = GENMASK(cprops->intpri_wd - 1, 0);
+		r->membw.bw_gran = 1;
+
+		r->name = (r->rid == RDT_RESOURCE_MB_PRI) ? "MBPRI" :
+			((r->rid == RDT_RESOURCE_L2_PRI) ? "L2PRI" : "L3PRI");
+		r->alloc_capable = true;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1480,6 +1506,11 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	case RDT_RESOURCE_L2_MIN:
 		configured_by = mpam_feat_cmax_cmin;
 		break;
+	case RDT_RESOURCE_L3_PRI:
+	case RDT_RESOURCE_L2_PRI:
+	case RDT_RESOURCE_MB_PRI:
+		configured_by = mpam_feat_intpri_part;
+		break;
 	case RDT_RESOURCE_MBA:
 		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
 			configured_by = mpam_feat_mbw_max;
@@ -1501,6 +1532,8 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		return ca_max_to_percent(cfg->cmax, cprops);
 	case mpam_feat_cmax_cmin:
 		return ca_max_to_percent(cfg->cmin, cprops);
+	case mpam_feat_intpri_part:
+		return cfg->intpri;
 	case mpam_feat_mbw_max:
 		return mbw_max_to_percent(cfg->mbw_max, cprops);
 	default:
@@ -1563,6 +1596,12 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		cfg.cmin = percent_to_ca_max(cfg_val, cprops);
 		mpam_set_feature(mpam_feat_cmax_cmin, &cfg);
 		break;
+	case RDT_RESOURCE_L3_PRI:
+	case RDT_RESOURCE_L2_PRI:
+	case RDT_RESOURCE_MB_PRI:
+		cfg.intpri = cfg_val;
+		mpam_set_feature(mpam_feat_intpri_part, &cfg);
+		break;
 	case RDT_RESOURCE_MBA:
 		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
 			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
-- 
2.34.1

