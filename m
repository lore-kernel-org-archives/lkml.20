Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566E745A2A2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793489; cv=none; b=BV+mKpLJ0KwVYPE9NmeqSQWthVYMjCV5kOmM0pYKROLwg9O+lI7xw4fgP1tRJdYJ44mVTwQH3BDF+Exm39M0n2QuisqyPJZ/DVXfzpwxj93pFNE6Uk+Kb72mRR+lJeNIgMmeYbg9F/DjEGqahEtEz7VZ9oULAzoz4Xx7aLW0fKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793489; c=relaxed/simple;
	bh=ZUFcQZOR1KUjTg0jEljNhRNZzJBBrmqOpEO8rRhU5xo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmGh+BSrShBN/E4Ti23TY4GOezQjrdgM+8uF9/vCU75NZfsfI3jMwNHkCneNNEVEotzShKwzIbQRWZYpuPN65NlVQ0f9ZVmWKEN81UjH3hn1jg70JyOlOUvIw9HaBergkNdLWuiZnUO716R22LdXCHl+s3ccrGiZgXhKitRG2Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=n/QpiitF; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="n/QpiitF"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+cTEKFzn8F0MejESOsAMmFCV7fbJ50aXpZ3YsFiDhoo=;
	b=n/QpiitFko1P2x2T/+zg7apirlndCdgZJaopydzBtowVZSEubkon25ZGNInQaVhEyOCuIs6GQ
	9Yv4M/mBBRGJqAasTdl5Kr9qmA8wX0b84P6YVListvoHNBZ6S6VwbLSLj9k9qiH5/Eg2XbGistf
	BT4Ca5Emz4HnNXFN226vIFU=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j39F92MFHznTVd;
	Mon, 12 Oct 2026 16:12:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C0DC240561;
	Mon, 12 Oct 2026 16:24:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 16:24:38 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 5/9] arm_mpam: Track the PARTID and internal PARTID limits per class
Date: Mon, 12 Oct 2026 16:23:33 +0800
Message-ID: <20261012082337.822258-6-ruanjinjie@huawei.com>
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

The number of PARTIDs and PMGs a resource supports is global, and the
number of internal PARTIDs is not tracked at all. Tracking this per
class lets the resctrl glue code find the limits of the classes it will
use, and pick the number of control groups before it is initialised.

Resources that implement PARTID narrowing reduce msc->partid_max,
because they don't have one configuration per PARTID. Record the
internal PARTID limit alongside partid_max in struct mpam_props, and
take the smaller of the values a class's RIS advertise.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Suggested-by: James Morse <james.morse@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 23 ++++++++++++++---------
 drivers/resctrl/mpam_internal.h |  2 ++
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..029f105d5915 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -793,7 +793,6 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	struct mpam_msc *msc = ris->vmsc->msc;
 	struct device *dev = &msc->pdev->dev;
 	struct mpam_props *props = &ris->props;
-	struct mpam_class *class = ris->vmsc->comp->class;
 
 	lockdep_assert_held(&msc->probe_lock);
 	lockdep_assert_held(&msc->part_sel_lock);
@@ -938,18 +937,20 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	}
 
 	/*
-	 * RIS with PARTID narrowing don't have enough storage for one
-	 * configuration per PARTID. If these are in a class we could use,
-	 * reduce the supported partid_max to match the number of intpartid.
-	 * If the class is unknown, just ignore it.
+	 * A RIS that implements PARTID narrowing has one configuration per
+	 * internal PARTID, and several request PARTIDs share it. Record both
+	 * limits in the resource properties.
 	 */
-	if (FIELD_GET(MPAMF_IDR_HAS_PARTID_NRW, ris->idr) &&
-	    class->type != MPAM_CLASS_UNKNOWN) {
+	props->partid_max = msc->partid_max;
+	props->intpartid_max = msc->partid_max;
+
+	if (FIELD_GET(MPAMF_IDR_HAS_PARTID_NRW, ris->idr)) {
 		u32 nrwidr = mpam_read_partsel_reg(msc, PARTID_NRW_IDR);
-		u16 partid_max = FIELD_GET(MPAMF_PARTID_NRW_IDR_INTPARTID_MAX, nrwidr);
+		u16 intpartid_max = FIELD_GET(MPAMF_PARTID_NRW_IDR_INTPARTID_MAX, nrwidr);
 
 		mpam_set_feature(mpam_feat_partid_nrw, props);
-		msc->partid_max = min(msc->partid_max, partid_max);
+		props->intpartid_max = min(props->intpartid_max, intpartid_max);
+		msc->partid_max = min(msc->partid_max, intpartid_max);
 	}
 }
 
@@ -2259,6 +2260,10 @@ static void __props_mismatch(struct mpam_props *parent,
 					   child->num_mbwu_mon);
 	}
 
+	/* Take the smallest, so the result is safe for every RIS in the class. */
+	parent->partid_max = min(parent->partid_max, child->partid_max);
+	parent->intpartid_max = min(parent->intpartid_max, child->intpartid_max);
+
 	if (CAN_MERGE_FEAT(parent, child, mpam_feat_intpri_part, alias)) {
 		parent->intpri_wd = child->intpri_wd;
 	} else if (MISMATCHED_FEAT(parent, child, mpam_feat_intpri_part,
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index def0e3a65c23..0a2177241615 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -203,6 +203,8 @@ struct mpam_props {
 	u16			dspri_wd;
 	u16			num_csu_mon;
 	u16			num_mbwu_mon;
+	u16			partid_max;
+	u16			intpartid_max;
 
 /*
  * Kunit tests use memset() to set up feature combinations that should be
-- 
2.34.1

