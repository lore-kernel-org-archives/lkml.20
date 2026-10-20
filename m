Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503808;
	b=vI2fa1TM8BbZ9ONaO+QN572bktSOjqXdVOFEqwWUNg0VQwY/+mA1oxRdwiBhFZotJfAD
	 UWedNE/zkE1sL6Jxs95HdDia0AvXMal09sBYh0mup0RHp/MnK6PYC0X3XncG8Zf6ffkXK
	 UxdLaHuCz+pyYsUFxkiLZgjMmLzVgazW4APUlqoEAt0g9BY9JXCvzUsUJkVjTouRKTAio
	 Ua2K644NXUGmUzAhDEpLq313yqoP+JzI4mKK5laE4oj+7dNOcXGeIJTCWfSgzKUQo2lk/
	 QBx+7QZ9YOyh+pMAPZxLe5L29Zto+rBqYnCAQAGQmaokZ9oeucLCbdKcckJ8q0YKUWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503808;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=jkdtO4u7xlPMM95oGzXEGLwVOxZyN7dpOjUUAzRLVIM=;
	b=4+418JmpmlulQEiUgbIqpDUxJYhNLfp4kd7mrw+OgmnDkr+/5tPXZSkNopY7Nng0zWhf
	 o42xiZd/iH4RE4MA2UeV2rm7VXLmOEOpq5qrj5ZbdaQbRXZP6LbNUuQTakCwZMGY3Qhwi
	 J8ReYiRjfrgtMH87kZPud0qsTQl8aQt6kVZqFqzcOWtrB2ZwxacrriMSHR09MyNPT7Qtl
	 4UxTAneBQQGuE7tQbqxdcYTQC6VVIAzbEsmsgx4CCxMWjgeK4SHVIcDev9lbfXFiZyYhz
	 t0oFna6z8ht4iPjVY1TydbXpyYvJHoVUvLZf72/Lzvoh/SQNqdXaQF9wcZU2+Z+wLdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Hf5CibEY;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F297260A4AE2
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F297260A4AE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Hf5CibEY
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jkdtO4u7xlPMM95oGzXEGLwVOxZyN7dpOjUUAzRLVIM=;
	b=Hf5CibEY//6/wDG4/Yc0fb5XZPNN3GaovQITeX+Iemk6RMKOuB3dbNrkzuor0d4lcJCDeXanS
	xYmgp1JWenFKiTgG5poOfJC9wFVzgt0nULkywyPNMYscBIubC1KliJd3qIsqO9Yy3NVDEjkEEdM
	AGc6pb+N3eJY1ouwxHQ71dI=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBm55MnzRhTp;
	Tue, 20 Oct 2026 21:43:12 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9013220333;
	Tue, 20 Oct 2026 21:43:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 10/15] arm_mpam: Track the PARTID and internal PARTID limits per class
Date: Tue, 20 Oct 2026 21:42:34 +0800
Message-ID: <20261020134239.3921377-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020134239.3921377-1-ruanjinjie@huawei.com>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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
2.34.1

