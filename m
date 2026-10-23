Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723730;
	b=dBp2RHVxzu7sFRD2/eGqYxFNcNb4yO7aFvR98Wbyn7QNst+Ns7FnAdStjsyYflwdJg7O
	 Ct2D6fsMe+loWxpGF6KL4kgmCPTqGUS2z8yARqQ4UJM7KvqVh8XsWVN5tI3L6RseP3oO9
	 LePKihi4KY6nfP3gywx6oU3OTBRDoIcJv6R/dzc+Kpr1x+X6zgdheqyBErRswJQoezuaa
	 krOx1PCaykkG0K9lYqYuqLzYkbfdJn7e0TRZfdPa9mW5y/3NlmuLK1voTxytOPD2cSB2m
	 YPKDgP9S19sulCq+DAYBfRMlPoWcTbxc865aS9ew20LZz8FVetBDGPglnfP30HrBzkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723730;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=URF6cKDPMfKaEPs1xMjIhMPTPNAlA5xoRhR4ASLc7wE=;
	b=COUXY38eRFvzJc/nA9fee0SteK4mJjeYVZvSVoex3gV8WFMhULvO3BB0eg5gnPrUu8C5
	 D5KceXklR9DjHpZD2NUlnOK6QxK1grIASLeOMe+CXG27VTjKjeHzwK35Ttf9kxzndRECO
	 qFW2b8FogSSJqSEbvYtn3qb+hUf3rXPukoF/0RQ6DHn3E+QhoV9wkV246LUGhZ6bFhxVT
	 bYz7zNiBqk0VXN8BElq+4llg/fehJ8xDT6ixYfAt+/8fqki7oWO7XtI1Y3HQxkrYXvbsT
	 IXNVLKpOgsdW8cbljlUdTtY99xLdHYdr97JUzGysVmYZqFLjSRuQezgfqngXWqfqm0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=FsMOaoUa;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC07606A324
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC07606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=FsMOaoUa
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=URF6cKDPMfKaEPs1xMjIhMPTPNAlA5xoRhR4ASLc7wE=;
	b=FsMOaoUaXcEszgysVcY14XYY9AU7Jn4VCo2K1Me8UNS8TCYiM1mfXoSNryteEHm3B8XwblL/e
	1ZO1gSkYq5HMp9t5NVyib4xW+09MtMuBC2op3cpsNWPAPKzAJOpl9keD9BMW9tVyFPGio+VJkss
	P/gMesGKI0zMn1NK8kD7wKU=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j9nX73SLqzcb0B;
	Fri, 23 Oct 2026 10:48:39 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8E8BA4056E;
	Fri, 23 Oct 2026 10:48:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 10:48:42 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 02/10] arm_mpam: Carry mbw_min and the hard limit in mpam_config
Date: Fri, 23 Oct 2026 10:48:04 +0800
Message-ID: <20261023024812.232820-3-ruanjinjie@huawei.com>
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

Add mbw_min and max_limit to mpam_config so the bandwidth minimum and
the MBW_MAX hard-limit bit can be programmed per PARTID through resctrl.

The hard limit is a config bit of MPAMCFG_MBW_MAX, not a discoverable
capability, so mpam_feat_max_limit is set alongside mpam_feat_mbw_max.
mpam_reprogram_ris_partid() writes the config's mbw_min when its feature
bit is set, and sets the hard-limit bit from its own feature bit so
MBHDL can be set without MBW_MAX being written.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 25 +++++++++++++++++++++----
 drivers/resctrl/mpam_internal.h |  3 +++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 0fbf3464e744..806bf61b6dbe 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -848,8 +848,11 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 		 */
 		props->bwa_wd = min(props->bwa_wd, 16);
 
-		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
+		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features)) {
 			mpam_set_feature(mpam_feat_mbw_max, props);
+			/* The hard-limit bit is a config bit, not a capability */
+			mpam_set_feature(mpam_feat_max_limit, props);
+		}
 
 		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MIN, mbw_features))
 			mpam_set_feature(mpam_feat_mbw_min, props);
@@ -1586,6 +1589,9 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	if (mpam_has_feature(mpam_feat_mbw_min, rprops)) {
 		u16 val = 0;
 
+		if (mpam_has_feature(mpam_feat_mbw_min, cfg))
+			val = cfg->mbw_min;
+
 		if (mpam_has_quirk(T241_FORCE_MBW_MIN_TO_ONE, msc)) {
 			u16 min = mpam_wa_t241_force_mbw_min_to_one(rprops);
 
@@ -1597,10 +1603,19 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_max, rprops)) {
+		u32 val = MPAMCFG_MBW_MAX_MAX;
+
 		if (mpam_has_feature(mpam_feat_mbw_max, cfg))
-			mpam_write_partsel_reg(msc, MBW_MAX, cfg->mbw_max);
-		else
-			mpam_write_partsel_reg(msc, MBW_MAX, MPAMCFG_MBW_MAX_MAX);
+			val = cfg->mbw_max;
+
+		/*
+		 * The hard-limit bit follows its own feature bit: MBHDL can
+		 * be configured without MBW_MAX ever being written.
+		 */
+		if (mpam_has_feature(mpam_feat_max_limit, cfg) && cfg->max_limit)
+			val |= MPAMCFG_MBW_MAX_HARDLIM;
+
+		mpam_write_partsel_reg(msc, MBW_MAX, val);
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_prop, rprops))
@@ -2922,6 +2937,8 @@ static bool mpam_update_config(struct mpam_config *cfg,
 	maybe_update_config(cfg, mpam_feat_cpor_part, newcfg, cpbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_part, newcfg, mbw_pbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_max, newcfg, mbw_max, has_changes);
+	maybe_update_config(cfg, mpam_feat_mbw_min, newcfg, mbw_min, has_changes);
+	maybe_update_config(cfg, mpam_feat_max_limit, newcfg, max_limit, has_changes);
 
 	return has_changes;
 }
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index def0e3a65c23..f5efebde3c2c 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -188,6 +188,7 @@ enum mpam_device_features {
 	mpam_feat_msmon_mbwu_capture,
 	mpam_feat_msmon_mbwu_rwbw,
 	mpam_feat_partid_nrw,
+	mpam_feat_max_limit,
 	MPAM_FEATURE_LAST
 };
 
@@ -318,6 +319,8 @@ struct mpam_config {
 	u32	cpbm;
 	u32	mbw_pbm;
 	u16	mbw_max;
+	u16	mbw_min;
+	bool	max_limit;
 
 	struct mpam_garbage	garbage;
 };
-- 
2.34.1

