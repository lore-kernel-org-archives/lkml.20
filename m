Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A662E48F033
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395321; cv=none; b=SeQs7hFk0Sr5WGKBn736TN600yJvwxLdXTr0bYh2p3IpEQIbxOrRtHCydLxcZ/V0SBle+9vG3ikKgXArCABlCbWqXZu2Ql/I3zHtblntc+/70zw+Uqshfmnf8Sv4vPSKD9OF9UW3hGtvLOsGnPxuJ61rXptqJig0HL3NfPehaOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395321; c=relaxed/simple;
	bh=uhG673gQIHESA0ckKx5/i36fXjVE0uH1+OliZ8qACm4=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Qg25PPP5tOIGhegv4nkEVH7HvZvWR0eUvXskThQpNDe5mqYjOXDX0vvydNXfjjdMCC32YM6xZMBBhhGbOimt3V30fuWGFuC3XHU9X7odRMtZWEmwSJx1N49e9fH4V4yTSHx1LUO/WIJHCfEqk7PghxfqGN7xUX8k/ns8SqGNAGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=I+n5R8hy; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="I+n5R8hy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395315; bh=Nw8/oC/7idO9zmtgTLOz1UYdwCR1fHrYtwW7P/QOEO8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=I+n5R8hyXxsNgA2V6SbylrUGQXLhCMUEgigzJYbD3b2qV03S+lEW6rweS4qbcif4l
	 7yNIGC+F4EDqm7Cl8taeAxvQiiRHwhk2tHTqWDoVoxurKOw+O+vYrYunGOnvNUmmAi
	 2j/7a3PDlHDZ8OzC7e5hSCduidayKewm7dMJWV5c=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395312tg94m5cu6
Message-ID: <tencent_A4124915CEC41FEBAD28A5294F8423BEDC0A@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+MFINV0qEIf5qH7pCV78X2lll11eA/qj7zSC8pxTX83SqODEjU8
	 knuwQLGCeu8Azn0gyRLWU+ptdob+plNqx3XLlvJtNO88ShxfWTw/tV5LQgeHd2j0F1uR/jI/PM5l
	 S6ofYLaTjgaCfFdkJgmRIl9mCwTj3N+IV6LtHeaDHfa0QjGZz7kupAMAvZqRQtuazvu6r2bIYkWA
	 Baw1R5iOHB/IhpORnHHrwQNSjcCz8tB4prEuSK4UD8nJ05tH/bcR4EGrHt6GvybHvSugYkKyjKxC
	 TyMebLqo2FM/VuTatRn6uvkomyN5K9jlffhW/YMJvf9CqQ7FD8ID3ZkQiSgV4hBAbWBDwTz2MER2
	 QDpVbIb7Sffg1RUWtentr7cC4v5eVCRWOVPgqtjl24ebmeFhnXmRHXyvPVfHEM1G+ugOZJhcUyhr
	 c6okTabQsOEMxdIM9kedgXBda5mqXK7GPgabUo7Ia3aC4DSJGnR1trUJBZf155s8kCEQsRC8MWwc
	 fNhhtAipPRnFdJUuzlvH3tn2i7yxmniYLfgvyhAA7pjePYCiQvm7J01sxRBME71xTFa5RNWZuI/J
	 MK0GYahpalWoss7QIxXRqN6xjRnCkv7PnucdyHehh2G9V+odOiGpMAGnifLgCRrVeVKVk/HKIVoc
	 Li88ixhASxINbAim+jAgFwlHlUrs4YpmL57q+BIdsJKsGc7XYE4UV1m5AMcy/2Y3EPnnb0o8aXQf
	 /6fkc068qVGaXOsWrf1VwEiV76u3J8ccuVn2BtmgKyquCM40UdzFZ0gW340uMLZSLpB6eq03gbA1
	 cCcdhZdjcAK7qVQTn7AawGRl9QkYHynkTgnD6To4p+y5urRcXGU6K1TapgLwprJHKTIGkf2lXwb0
	 xh4wG81pinoUQxeW++4aOHRz83/eSvVI4OR/c5PNVXZ2UTYs/09X1jjmHzyR9JIhs/uilLZOqyRb
	 8Qj1NWTRXnt5vkx3S36f8X+RVkJItMEE3qdAw6tblsUV1s2Qj+ryJWPZrhTCPVpemgQDNoXWmj9j
	 TeX2v1AvYg/rTwg1mBmCq1R+b3Je29ddWYXO/pS3iLvNC0EuuIVKYQ0UR0bAuW5iMcxnzV3EIGON
	 YfbtId
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	reinette.chatre@intel.com,
	ruanjinjie@huawei.com,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 10/15] arm_mpam: Track the PARTID and internal PARTID limits per class
Date: Mon, 19 Oct 2026 15:33:36 +0800
X-OQ-MSGID: <20261019073453.2142856-11-2118537295@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019073453.2142856-1-2118537295@qq.com>
References: <20261019073453.2142856-1-2118537295@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

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
v9->v10:
 - Copy partid_max/intpartid_max on the first aliasing merge into a
   zero-initialized parent instead of clamping to zero
---
 drivers/resctrl/mpam_devices.c  | 34 ++++++++++++++++++++++++---------
 drivers/resctrl/mpam_internal.h |  2 ++
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index a44d66a5733d..7f88a0170c05 100644
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
 
@@ -2270,6 +2271,21 @@ static void __props_mismatch(struct mpam_props *parent,
 					   child->num_mbwu_mon);
 	}
 
+	/*
+	 * Take the smallest, so the result is safe for every RIS in the class.
+	 * The first aliasing merge into a zero-initialized parent must copy
+	 * the child's value, otherwise min() would clamp the limit to zero.
+	 */
+	if (alias && !parent->partid_max)
+		parent->partid_max = child->partid_max;
+	else
+		parent->partid_max = min(parent->partid_max, child->partid_max);
+
+	if (alias && !parent->intpartid_max)
+		parent->intpartid_max = child->intpartid_max;
+	else
+		parent->intpartid_max = min(parent->intpartid_max, child->intpartid_max);
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
2.43.0

