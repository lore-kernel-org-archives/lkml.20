Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723731;
	b=U57ra9Q8mzdwVHYMtKwZjwaEOxiXNYB40MRwU/KiqC3YpAp1Uv3+VuvWuzW+WjgzCvr0
	 kMK3qH2zC3FZLkp+gAm8AtLWd04+XDBmVJQFoYTClbGQHfbJ73En1qtE5LltUfgLCTvij
	 LwJ4t4Y9yYxxH5xvlmzHeNepYu4MSTcslraxVrslfKQBF5wX/rq9sVmh6APL2TgS2pfjO
	 ZsbW0IGac9WtMkXC4zOUAHyBDnfT7k5fWkO3NxEUP4UZ9IOPZoxjlb232pF4Hp61J/cgA
	 3F+1j6UBi+4ZSXb2d5SRnWL1lcXdhIbVbO+gaiHRdaluDbp2AFTBVehXqJSG30GUMzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723731;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=APiUMyMMIhK6N3JrpNxfmnUxNRyO6x/pOI+8+NKn8mg=;
	b=ZTJli8PcgjLNUb5RapGA9T1/1cvo+UlEWVPTxMuX2s8+erGc6Yc9/I8my7f9PU/sVikk
	 wLkbcgiITzAz6YIv17S8hH1jUPlL/pSyG2ml8UrR+LpDPvhfEhYvQeh00Fan9k7cnkrK9
	 JOxcFlOtIfPOTqu9INpxiUamUgP3Jzv275583PjjrxClvzP0WFhGodGrMtUFMXDSMv3yP
	 krboAIHdvL+SQrZ6FoQm7OE3pJ+YSnWgp/FIAjc4BICRwlVMeeZYmuyzo4Vqco5yVXqJ0
	 47yXPt5HarJop7HZLw8BOt30ZjkS+u4MdiLLl/hV7JwBfL3TIrg1l0FsuEIF3BvAkPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=qOsUuCwC;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD1F606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD1F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=qOsUuCwC
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=APiUMyMMIhK6N3JrpNxfmnUxNRyO6x/pOI+8+NKn8mg=;
	b=qOsUuCwClZ4uGJQN9ovIvidCR5MeOdK8m6IjxbwdPcv/QM+DA1VURRLl5ZnulsYfsqtCQDIP0
	XOe3boJWA4ooCxPI7Q5BWZ22r1L8tK+v2vsq03ZfsMl9vsWFUd6qFzpgLrTTZu5HThVXVq8+w7o
	Iif3XMSt7TUB/W80rS9HMeU=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j9nXB28HMz1prMR;
	Fri, 23 Oct 2026 10:48:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 451F64056E;
	Fri, 23 Oct 2026 10:48:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 10:48:46 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 10/10] arm_mpam: resctrl: Expose the bandwidth minimum and limit as pseudo resources
Date: Fri, 23 Oct 2026 10:48:12 +0800
Message-ID: <20261023024812.232820-11-ruanjinjie@huawei.com>
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

Expose MBMIN, MBHDL and MBOPT, re-using the class picked for MBA.

MBMIN carries the bandwidth minimum as a percentage; MBHDL toggles the
MBW_MAX hard-limit bit; MBOPT exposes the raw MBW_MAX fraction without
the percentage scaling.

control_init() describes them as RESCTRL_SCHEMA_RANGE, with the ranges
derived from bwa_wd. update_one() and get_config() carry the values
through the mpam_config fields added earlier.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 73 ++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 008db81e734b..346ee3729ddf 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1064,8 +1064,14 @@ static void mpam_resctrl_pick_mba(void)
 		res->class = candidate_class;
 
 		/* As with the caches, re-use the class for the pseudo resources */
+		if (mpam_has_feature(mpam_feat_mbw_min, cprops))
+			mpam_resctrl_controls[RDT_RESOURCE_MB_MIN].class = candidate_class;
 		if (mpam_has_feature(mpam_feat_intpri_part, cprops))
 			mpam_resctrl_controls[RDT_RESOURCE_MB_PRI].class = candidate_class;
+		if (mpam_has_feature(mpam_feat_max_limit, cprops))
+			mpam_resctrl_controls[RDT_RESOURCE_MB_HDL].class = candidate_class;
+		if (mba_class_use_mbw_max(cprops))
+			mpam_resctrl_controls[RDT_RESOURCE_MB_OPT].class = candidate_class;
 	}
 }
 
@@ -1317,6 +1323,19 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 		r->name = (r->rid == RDT_RESOURCE_L2_MIN) ? "L2MIN" : "L3MIN";
 		r->alloc_capable = true;
 		break;
+	case RDT_RESOURCE_MB_MIN:
+		r->schema_fmt = RESCTRL_SCHEMA_RANGE;
+		r->ctrl_scope = RESCTRL_L3_CACHE;
+
+		r->membw.delay_linear = true;
+		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
+		r->membw.min_bw = 0;
+		r->membw.max_bw = MAX_MBA_BW;
+		r->membw.bw_gran = 1;
+
+		r->name = "MBMIN";
+		r->alloc_capable = true;
+		break;
 	case RDT_RESOURCE_L3_PRI:
 	case RDT_RESOURCE_L2_PRI:
 	case RDT_RESOURCE_MB_PRI:
@@ -1334,6 +1353,32 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 			((r->rid == RDT_RESOURCE_L2_PRI) ? "L2PRI" : "L3PRI");
 		r->alloc_capable = true;
 		break;
+	case RDT_RESOURCE_MB_HDL:
+		r->schema_fmt = RESCTRL_SCHEMA_RANGE;
+		r->ctrl_scope = RESCTRL_L3_CACHE;
+
+		r->membw.delay_linear = true;
+		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
+		r->membw.min_bw = 0;
+		r->membw.max_bw = 1;
+		r->membw.bw_gran = 1;
+
+		r->name = "MBHDL";
+		r->alloc_capable = true;
+		break;
+	case RDT_RESOURCE_MB_OPT:
+		r->schema_fmt = RESCTRL_SCHEMA_RANGE;
+		r->ctrl_scope = RESCTRL_L3_CACHE;
+
+		r->membw.delay_linear = true;
+		r->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
+		r->membw.min_bw = 1;
+		r->membw.max_bw = GENMASK(cprops->bwa_wd - 1, 0);
+		r->membw.bw_gran = 1;
+
+		r->name = "MBOPT";
+		r->alloc_capable = true;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1511,6 +1556,15 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	case RDT_RESOURCE_MB_PRI:
 		configured_by = mpam_feat_intpri_part;
 		break;
+	case RDT_RESOURCE_MB_MIN:
+		configured_by = mpam_feat_mbw_min;
+		break;
+	case RDT_RESOURCE_MB_HDL:
+		configured_by = mpam_feat_max_limit;
+		break;
+	case RDT_RESOURCE_MB_OPT:
+		configured_by = mpam_feat_mbw_max;
+		break;
 	case RDT_RESOURCE_MBA:
 		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
 			configured_by = mpam_feat_mbw_max;
@@ -1534,7 +1588,14 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		return ca_max_to_percent(cfg->cmin, cprops);
 	case mpam_feat_intpri_part:
 		return cfg->intpri;
+	case mpam_feat_mbw_min:
+		return mbw_max_to_percent(cfg->mbw_min, cprops);
+	case mpam_feat_max_limit:
+		return cfg->max_limit;
 	case mpam_feat_mbw_max:
+		/* MB_OPT exposes the raw fraction, without the percent scaling */
+		if (r->rid == RDT_RESOURCE_MB_OPT)
+			return cfg->mbw_max >> (16 - cprops->bwa_wd);
 		return mbw_max_to_percent(cfg->mbw_max, cprops);
 	default:
 		return resctrl_get_default_ctrl(r);
@@ -1602,6 +1663,18 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 		cfg.intpri = cfg_val;
 		mpam_set_feature(mpam_feat_intpri_part, &cfg);
 		break;
+	case RDT_RESOURCE_MB_MIN:
+		cfg.mbw_min = percent_to_mbw_max(cfg_val, cprops);
+		mpam_set_feature(mpam_feat_mbw_min, &cfg);
+		break;
+	case RDT_RESOURCE_MB_HDL:
+		cfg.max_limit = !!cfg_val;
+		mpam_set_feature(mpam_feat_max_limit, &cfg);
+		break;
+	case RDT_RESOURCE_MB_OPT:
+		cfg.mbw_max = cfg_val << (16 - cprops->bwa_wd);
+		mpam_set_feature(mpam_feat_mbw_max, &cfg);
+		break;
 	case RDT_RESOURCE_MBA:
 		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
 			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
-- 
2.34.1

