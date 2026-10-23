Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723745;
	b=Ea1HwPrl1R9ddmZz3ffO9/St8hpT8Vp1xaYTnHdJxRvaa1qtmq/zFTF0fABsCjUwxKM1
	 kLMYKUYS9Csln+PxupFjqpu5ka/l6Q7kyG1U+dgrf2hcTB996dsa6HCzBiXNsMNYhLgvq
	 YeK1zeWRhEwwCOuo0syMJ4t6KrfYUNQNhWtMU6kirrP3gPjbmcIV5C6ndPEKX0LE1Ldd0
	 iz5nuAB9JALVgFNG+VQgBu/bCMxydyD+ufTwNWRasj7o0+S+rA9ucKcZaHtWcKrGK1dOj
	 X8Lq+wW8i1A2NFKmK8ZCNTfKeKpFlmm4McM81eHrOCrvWbnMESD3c1O/p2QbUnZQQmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723745;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=NnOY9cWbwd83K+K8CW2wfK39xlCqjAiyY0rcnG5EFdE=;
	b=YA1KRbfW8qmSaKddjRAdjOBkcEwPVjfhBXM5WqLrSOf89i1Tz1A4CQWOrK9/8GiKHYsN
	 KX8rFxbJCFCbJws+/oxhf8V4Y41ZaMiN8FFCQcNxO/k+Z7x9AgNSAyYj9nfWqPkx0RL78
	 hFGXGf4iwKxnwWGACsdjA4467inljPrs0D7+O4c5O2C16COs5LAIamKuyTy3BJQC9Q7Zy
	 P8Cy1ReKzwMJYsqaWk4hv1StRLsoZyuYM5Om/rNE8mxuUbvH9x0dC3kyseazQpYIFCMV9
	 uaD3JpL+V6nKePOGfeaow1QgDfYcskQ/dY3LRznTK8MW89QPvSfitzQOHCQVvCQf0PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=CXJyepXO;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA65606A330
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA65606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=CXJyepXO
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NnOY9cWbwd83K+K8CW2wfK39xlCqjAiyY0rcnG5EFdE=;
	b=CXJyepXO60ZLXrGVu+3+S0KoUVzw3bV3G3miYglBA11B5gRmDVtnh/ZLY/sGp7A9sjblOa012
	mX7zHyCWUwZ2C/p7UB3hltglmrbMWoexAlNFWB14/dz27D+kqJurydHrELoDIi0kUZc/tYe9YQs
	M5mgIKpWcoAeiLyz0xQNP14=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j9nXG4xYkz12LlW;
	Fri, 23 Oct 2026 10:48:46 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 812AB40561;
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
Subject: [RFC PATCH 04/10] arm_mpam: Carry intpri in mpam_config
Date: Fri, 23 Oct 2026 10:48:06 +0800
Message-ID: <20261023024812.232820-5-ruanjinjie@huawei.com>
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

Add intpri to mpam_config so the internal priority can be programmed
per PARTID through resctrl. mpam_reprogram_ris_partid() writes it when
the feature bit is set, keeping the polarity-aware reset value
otherwise.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 4 ++++
 drivers/resctrl/mpam_internal.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index f5ac427a0100..22169436689a 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1648,6 +1648,9 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 			if (!mpam_has_feature(mpam_feat_intpri_part_0_low, rprops))
 				intpri = 0;
 
+			if (mpam_has_feature(mpam_feat_intpri_part, cfg))
+				intpri = cfg->intpri;
+
 			pri_val |= FIELD_PREP(MPAMCFG_PRI_INTPRI, intpri);
 		}
 		if (mpam_has_feature(mpam_feat_dspri_part, rprops)) {
@@ -2948,6 +2951,7 @@ static bool mpam_update_config(struct mpam_config *cfg,
 	maybe_update_config(cfg, mpam_feat_max_limit, newcfg, max_limit, has_changes);
 	maybe_update_config(cfg, mpam_feat_cmax_cmax, newcfg, cmax, has_changes);
 	maybe_update_config(cfg, mpam_feat_cmax_cmin, newcfg, cmin, has_changes);
+	maybe_update_config(cfg, mpam_feat_intpri_part, newcfg, intpri, has_changes);
 
 	return has_changes;
 }
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 77f643cef28d..5d6a4c06c7f8 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -324,6 +324,9 @@ struct mpam_config {
 	u16	cmax;
 	u16	cmin;
 
+	/* Internal priority */
+	u16	intpri;
+
 	struct mpam_garbage	garbage;
 };
 
-- 
2.34.1

