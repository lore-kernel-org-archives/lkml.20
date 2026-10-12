Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9674582D5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793491; cv=none; b=qFAlfEegGaQ85LvaN3fYEy19ODYZHEWK6a0MtEGBJ7ErFta4YakSYSKgE7cHAm1VCdA3QDzNW0svCfoOhztsAbow8GxRVLaDaaEMvzDWFyoAiHeYag0hWRa4hi6sm87rpd4cwXv+ajkPXak4ZfrNMN8uiS8eREpKZr0O3/vv+p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793491; c=relaxed/simple;
	bh=2WB3Lzg6IHR4UjcbojYmGgEEb458C3C2HPsnS/7tfmM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NIQI4+4FelB9bWslVb+AMptkAUTywoUYIxxicHuTueu3O8+zwVpPEis3pSML3BGsCOd3RASiefsgN1Y23XLYrw6Kucy4CWqdYwtn9uwNxjhCh8wUhcrBDwY2TLVixYthFDNct4SDv5QOFTaC5IctzyqsNwNXffRpddGo9f4+t7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=N+D8oKOK; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="N+D8oKOK"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=TrI+BR8wLQEeW0fz5Gw6zCeNzJACbqEs8T3hX8iy8zM=;
	b=N+D8oKOKy1s8pTxPWIjjMKbemrjJTgBkgPvuXlXNYxaywpwhhzR2LmU3dAK7EibxUD+M555gD
	Ee008PTTiWY5hta21lBCBzF8uO+mll6WbtTz2qTh0oX/nWvuox3zHD6NADGMWck7jyePDoIPNGe
	ZSdmhWWelEhbhYNFZD6wT5A=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4j39Fy29RXz1cyPY;
	Mon, 12 Oct 2026 16:13:26 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 572014056C;
	Mon, 12 Oct 2026 16:24:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 16:24:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 8/9] arm_mpam: Identify the non-aliasing controls
Date: Mon, 12 Oct 2026 16:23:36 +0800
Message-ID: <20261012082337.822258-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012082337.822258-1-ruanjinjie@huawei.com>
References: <20261012082337.822258-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

A non-aliasing control can't be presented by writing the same value to
several PARTIDs, because its value is additive. This is used later to
decide whether a class's non-aliasing controls must be dropped before
its PARTIDs can be used as separate monitoring groups.

A control that aliases shares the resource, so writing the same value to
each PARTID keeps its meaning. Several PARTIDs that map onto one
internal PARTID are configured as one, so a class that implements
narrowing does not have this problem.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Suggested-by: James Morse <james.morse@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_internal.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 5a7590568a05..0433ca6faaba 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -221,6 +221,24 @@ struct mpam_props {
 #define mpam_set_feature(_feat, x)	__set_bit(_feat, (x)->features)
 #define mpam_clear_feature(_feat, x)	__clear_bit(_feat, (x)->features)
 
+/*
+ * A non-aliasing control (e.g. a cache capacity) can't be presented by
+ * writing the same value to several PARTIDs: its value is additive, two 50%
+ * values add up to 100%. An aliasing control (e.g. a cache portion bitmap)
+ * shares the resource, so the same value written to each PARTID keeps its
+ * meaning.
+ */
+static inline bool
+mpam_props_has_non_aliasing_controls(const struct mpam_props *props)
+{
+	return mpam_has_feature(mpam_feat_mbw_max, props) ||
+	       mpam_has_feature(mpam_feat_mbw_min, props) ||
+	       mpam_has_feature(mpam_feat_mbw_prop, props) ||
+	       mpam_has_feature(mpam_feat_cmax_cmax, props) ||
+	       mpam_has_feature(mpam_feat_cmax_cmin, props) ||
+	       mpam_has_feature(mpam_feat_cmax_softlim, props);
+}
+
 /* Workaround bits for msc->quirks */
 enum mpam_device_quirks {
 	T241_SCRUB_SHADOW_REGS,
-- 
2.34.1

