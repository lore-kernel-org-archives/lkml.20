Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723729;
	b=atMJR93tLHGGyXWrGCRfXvpYy8vA5RfSaJPR0d4oB3PipRot6JJG6rQxKoMcMaUS8sff
	 jl/9elSadaAE3K+1v4yBvw6jI46IcZtGzH4yjNYjpCD98P6OrFLFHi7kB0hfNZ5M6CpZ5
	 gVe+WasplcEeJB8kLWSWpyW1DI0CYRHbowf9MhRGUZJBy3b07/A93d1fFLHyBZ4HwxQd4
	 wPN4aaQg752e0kyeE2q7r7oARQY+lUXHkGlkb9hJqGbGL4RVPLfMDmwSFmI/02V0I5+ou
	 HejOqTAt8hjIfvkejy6pGWXcMXeMGYNlLo9z7758ycrr9xx5WgqMevGktIfbZpbLJ4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723729;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=0HJJmoopbCjyVzbxdBX9tDcedg9uWgF9IULG9coRk+U=;
	b=Q8BbfQu0HnPFF1B/RG+3px4lK7C1Q2KwxrfSGMhIdiEB1F9pmegEmy2Fhi1Bsrj1awNq
	 6fw2TAoI9+eiB8jrF3A0FfLVSOPNpqUvJFKGj5+GBFIpHM5SEptre86SL481K6dpHUjo7
	 01kU9SSNlBqDGC3pxCJk5/R+LYfKTaW8Qq/94zBS4IfjCa4b20ce2LBMdhKaWvbYPkePo
	 HpbHLfBC8fCF7DkDWdCfdqSy3N+5+7ePp9xTdriKl6oYeb9/QOlZwHEMe9XjwJK4ZnCWz
	 XQm0PFySpnQNf+FSljXgmdczfuaBMy5dCmGo5pgjG/DpJ/9nNjj1fQMdFWXmNYRxIFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=V4HuOMfZ;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5222606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5222606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=V4HuOMfZ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0HJJmoopbCjyVzbxdBX9tDcedg9uWgF9IULG9coRk+U=;
	b=V4HuOMfZgyH6k71po1DRvIRWR3RGAnFwoIB4i8M1/XAMsNjgRdGuVPlM9rnvZouBZHc3W27O2
	r3iBg/OTZ+2fWnqSxIrN0660s3JuZ3jGwAG+/LY1m8dOzfWzG2AAvDliVEN1ih0bs4t+kGbLjQ2
	gMRXJKGM3f7Q6jojnU69jUU=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4j9nX96S0cz1T4LQ;
	Fri, 23 Oct 2026 10:48:41 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F32340538;
	Fri, 23 Oct 2026 10:48:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 10:48:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 03/10] arm_mpam: Carry cmax and cmin in mpam_config
Date: Fri, 23 Oct 2026 10:48:05 +0800
Message-ID: <20261023024812.232820-4-ruanjinjie@huawei.com>
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

Add cmax and cmin to mpam_config so the capacity hard and soft limits
can be programmed per PARTID through resctrl.

mpam_reprogram_ris_partid() writes the config's cmax/cmin when their
feature bits are set, and falls back to the reset values otherwise. The
local cmax reset value is no longer needed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 19 ++++++++++++++-----
 drivers/resctrl/mpam_internal.h |  2 ++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 806bf61b6dbe..f5ac427a0100 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1553,7 +1553,6 @@ static u16 mpam_wa_t241_calc_min_from_max(struct mpam_props *props,
 static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 				      struct mpam_config *cfg)
 {
-	u16 cmax = MPAMCFG_CMAX_CMAX;
 	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_props *rprops = &ris->props;
 
@@ -1621,11 +1620,19 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	if (mpam_has_feature(mpam_feat_mbw_prop, rprops))
 		mpam_write_partsel_reg(msc, MBW_PROP, 0);
 
-	if (mpam_has_feature(mpam_feat_cmax_cmax, rprops))
-		mpam_write_partsel_reg(msc, CMAX, cmax);
+	if (mpam_has_feature(mpam_feat_cmax_cmax, rprops)) {
+		if (mpam_has_feature(mpam_feat_cmax_cmax, cfg))
+			mpam_write_partsel_reg(msc, CMAX, cfg->cmax);
+		else
+			mpam_write_partsel_reg(msc, CMAX, MPAMCFG_CMAX_CMAX);
+	}
 
-	if (mpam_has_feature(mpam_feat_cmax_cmin, rprops))
-		mpam_write_partsel_reg(msc, CMIN, 0);
+	if (mpam_has_feature(mpam_feat_cmax_cmin, rprops)) {
+		if (mpam_has_feature(mpam_feat_cmax_cmin, cfg))
+			mpam_write_partsel_reg(msc, CMIN, cfg->cmin);
+		else
+			mpam_write_partsel_reg(msc, CMIN, 0);
+	}
 
 	if (mpam_has_feature(mpam_feat_cmax_cassoc, rprops))
 		mpam_write_partsel_reg(msc, CASSOC, MPAMCFG_CASSOC_CASSOC);
@@ -2939,6 +2946,8 @@ static bool mpam_update_config(struct mpam_config *cfg,
 	maybe_update_config(cfg, mpam_feat_mbw_max, newcfg, mbw_max, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_min, newcfg, mbw_min, has_changes);
 	maybe_update_config(cfg, mpam_feat_max_limit, newcfg, max_limit, has_changes);
+	maybe_update_config(cfg, mpam_feat_cmax_cmax, newcfg, cmax, has_changes);
+	maybe_update_config(cfg, mpam_feat_cmax_cmin, newcfg, cmin, has_changes);
 
 	return has_changes;
 }
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index f5efebde3c2c..77f643cef28d 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -321,6 +321,8 @@ struct mpam_config {
 	u16	mbw_max;
 	u16	mbw_min;
 	bool	max_limit;
+	u16	cmax;
+	u16	cmin;
 
 	struct mpam_garbage	garbage;
 };
-- 
2.34.1

