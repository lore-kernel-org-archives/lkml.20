Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611529;
	b=k3eVgLukJAft+kvPdsTYkOMUdGKEPfrP4L+6yvHR0/sYCLgCIGW7PfbuO4O5Ok0cwep8
	 Yi0ohoBb3rPfkM6/rWOo97Y0hQhFkUbTmequTEYUv75Yd5yNS0YeHzn7KSl2Y2DwiQIom
	 iFC1xoQqjRVu7GfHXbDmvWtSd0EZHgO01BWrzruAObUqNKqcCdb5I8CiaWD6GnxBgCI7c
	 WnOiKwRNONzwtk5ytzU4ep9GUXyFdCBWVeTEnXIfELMAXYdZ6HxfZiIfu3dD+yw7GoWe/
	 WwkpUQngngmu0lLAdx9NZhzBhAChy5BNAG2L2OCD5nH00UNxRf4jIOSxBMbaI6W4aRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611529;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=nx9t0DBjKPEzI7mXKLL19DVrkZGWq9IzOdeDEWe3D9Y=;
	b=n/VQUrGEYeMEdvF8PC2md5aPC5P0Fe2leSki5nwDQqjQTIFnH0t8cKO/uBbjH3FkOKsX
	 KojcJSqh79Rh4BB6xhLBRyIHAz7e5haYLfBKeRqqqMtuL5ecJhHAh8p0dwNfivi6XUw9d
	 F4DjvIRH6Pv0IsFjjh9LAoIhov0FX6mA+itsOcMN+UdBgkXGEkBLqjjz9KxrgX998dYTF
	 cr4h0Ye9X40NoG1T4/9hShq0SXgFTp39pg+Yvwhq8BLdtyJBos0ihxNHErOUyzK9yF6kt
	 sp6g6FS3jjk17giDneZhl0cui7XycvDfeJdLcZdtSdrmG/ilYaufT58qyHAssdj5/AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="j4w/+Vdo";
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28286606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28286606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=j4w/+Vdo
X-UUID: 5444266ed69f11f18dc8c9802ae25ab1-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nx9t0DBjKPEzI7mXKLL19DVrkZGWq9IzOdeDEWe3D9Y=;
	b=j4w/+VdobJfZOmmxo2skt0/swVg3lpkdaG1SC93DouoBdgca1oiVkMgFzdKD1IsEIL4eKo2qd0MekTBaNpzphiuGYpmry+6L+gABzUnm1OhJocbmN1yu9P7L26XQMnYjwM5YA6TJS2Mf8HoljjEPUsqeh7N9kKN+ykalPir0jQk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7dd7ffac-3378-49e7-819c-5a509c6b57c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:f5f1a340-45ea-40f0-99fe-3ce442058644,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5444266ed69f11f18dc8c9802ae25ab1-20261102
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 369095546; Mon, 02 Nov 2026 17:25:22 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Nov 2026 17:25:21 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Nov 2026 17:25:21 +0800
From: santino.wang <santino.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
	<arnab.layek@mediatek.com>, Santino Wang <santino.wang@mediatek.com>
Subject: [RFC PATCH 06/11] soc: mediatek: dram-ecc: keep error counters across boots
Date: Mon, 2 Nov 2026 17:23:28 +0800
Message-ID: <20261102092334.138759-7-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
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
X-MTK: N

From: Santino Wang <santino.wang@mediatek.com>

Keep aggregate corrected and uncorrectable error counters in EFI
variables, so they survive a reboot. The firmware creates the
variables; the driver increments them.

EFI SetVariable() can take tens of milliseconds, so the increments are
accumulated and written from a work item instead of the GHES notifier
context.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/core/counters.c | 145 +++++++++++++++++-
 drivers/soc/mediatek/dram-ecc/core/counters.h |   3 +
 .../mediatek/dram-ecc/core/ghes_notifier.c    |   6 +-
 3 files changed, 150 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/dram-ecc/core/counters.c b/drivers/soc/mediatek/dram-ecc/core/counters.c
index 88d7961975db..8e3fd83cf60a 100644
--- a/drivers/soc/mediatek/dram-ecc/core/counters.c
+++ b/drivers/soc/mediatek/dram-ecc/core/counters.c
@@ -3,13 +3,20 @@
  * Copyright (c) 2026 MediaTek Inc.
  */
 /*
- * Volatile (reset every boot) CE/UCE counters come from ghes_notifier.c's
- * in-memory tally; retired pages are tracked per PFN so each page is
- * counted once.
+ * Aggregate CE/UCE counters. "volatile" counters (reset every boot) come
+ * from ghes_notifier.c's in-memory tally; "agg" counters persist across
+ * boots via the same EFI NV variable UEFI RasDxe.c initializes
+ * (MtkDramEccCeCount, MtkDramEccUceCount_inline, MtkDramEccUceCount_ondie,
+ * GUID must match RasDxe.c's mMtkEccCounterGuid). The UCE count is kept
+ * per ECC source. Inline ECC detects every UCE, including one that
+ * originates in the DRAM die, so agg_uce_inline is the total; the
+ * agg_uce_ondie subset counts those that on-die ECC also flagged.
  */
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
+#include <linux/efi.h>
 #include <linux/export.h>
+#include <linux/workqueue.h>
 #include <linux/atomic.h>
 #include <linux/xarray.h>
 
@@ -17,12 +24,110 @@
 #include "ghes_notifier.h"
 #include "counters.h"
 
+#define MTK_ECC_EFI_ATTR \
+	(EFI_VARIABLE_NON_VOLATILE | \
+	 EFI_VARIABLE_BOOTSERVICE_ACCESS | \
+	 EFI_VARIABLE_RUNTIME_ACCESS)
+
+static efi_guid_t mtk_ecc_efi_guid =
+	EFI_GUID(0x5a3f1e8c, 0x0b2d, 0x4e7f,
+		 0x9c, 0x6a, 0x1d, 0x2b, 0x3e, 0x4f, 0x5a, 0x6b);
+
+static efi_char16_t mtk_ce_var_name[]  = L"MtkDramEccCeCount";
+static efi_char16_t mtk_uce_inline_var_name[] = L"MtkDramEccUceCount_inline";
+static efi_char16_t mtk_uce_ondie_var_name[]  = L"MtkDramEccUceCount_ondie";
+
 static struct kobject *counters_kobj;
 static struct kobject *retired_kobj;
 static atomic64_t retired_by_ce = ATOMIC64_INIT(0);
 static atomic64_t retired_by_uce = ATOMIC64_INIT(0);
 static DEFINE_XARRAY(retired_pfns);
 
+/*
+ * Deferred EFI variable write.  SetVariable NV can take tens of
+ * milliseconds, so it should not be called from the GHES vendor-record
+ * notifier's atomic/IRQ context.  We accumulate pending increments and
+ * flush them from a workqueue instead.
+ */
+static atomic_t pending_ce_inc  = ATOMIC_INIT(0);
+static atomic_t pending_uce_inline_inc = ATOMIC_INIT(0);
+static atomic_t pending_uce_ondie_inc  = ATOMIC_INIT(0);
+static void counters_flush_work_fn(struct work_struct *work);
+static DECLARE_WORK(counters_flush_work, counters_flush_work_fn);
+
+static u64 efi_counter_get(efi_char16_t *name)
+{
+	unsigned long size = sizeof(u64);
+	u64 val = 0;
+	efi_status_t status;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE))
+		return 0;
+
+	status = efi.get_variable(name, &mtk_ecc_efi_guid, NULL, &size, &val);
+
+	if (status != EFI_SUCCESS && status != EFI_NOT_FOUND)
+		pr_warn("mtk-dram-ecc: get EFI var failed: 0x%lx\n", status);
+
+	return (status == EFI_SUCCESS) ? val : 0;
+}
+
+static void efi_counter_inc(efi_char16_t *name, int delta)
+{
+	unsigned long size = sizeof(u64);
+	u64 val = 0;
+	efi_status_t status;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE))
+		return;
+
+	status = efi.get_variable(name, &mtk_ecc_efi_guid, NULL, &size, &val);
+	if (status == EFI_NOT_FOUND)
+		val = 0;
+	else if (status != EFI_SUCCESS)
+		return;
+
+	val += delta;
+	status = efi.set_variable(name, &mtk_ecc_efi_guid,
+				  MTK_ECC_EFI_ATTR, sizeof(u64), &val);
+	if (status != EFI_SUCCESS)
+		pr_warn("mtk-dram-ecc: set EFI var failed: 0x%lx\n", status);
+}
+
+static void counters_flush_work_fn(struct work_struct *work)
+{
+	int ce_delta, uce_inline_delta, uce_ondie_delta;
+
+	ce_delta = atomic_xchg(&pending_ce_inc, 0);
+	uce_inline_delta = atomic_xchg(&pending_uce_inline_inc, 0);
+	uce_ondie_delta = atomic_xchg(&pending_uce_ondie_inc, 0);
+
+	if (ce_delta > 0)
+		efi_counter_inc(mtk_ce_var_name, ce_delta);
+	if (uce_inline_delta > 0)
+		efi_counter_inc(mtk_uce_inline_var_name, uce_inline_delta);
+	if (uce_ondie_delta > 0)
+		efi_counter_inc(mtk_uce_ondie_var_name, uce_ondie_delta);
+}
+
+void mtk_dram_ecc_agg_ce_inc(void)
+{
+	atomic_inc(&pending_ce_inc);
+	schedule_work(&counters_flush_work);
+}
+
+void mtk_dram_ecc_agg_uce_inline_inc(void)
+{
+	atomic_inc(&pending_uce_inline_inc);
+	schedule_work(&counters_flush_work);
+}
+
+void mtk_dram_ecc_agg_uce_ondie_inc(void)
+{
+	atomic_inc(&pending_uce_ondie_inc);
+	schedule_work(&counters_flush_work);
+}
+
 void mtk_dram_ecc_record_retired_page(unsigned long pfn,
 				      enum mtk_dram_ecc_retire_reason reason,
 				      int memory_failure_ret)
@@ -79,6 +184,12 @@ static ssize_t volatile_uce_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%llu\n", mtk_dram_ecc_get_volatile_uce());
 }
 
+static ssize_t agg_ce_show(struct kobject *kobj,
+			   struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", efi_counter_get(mtk_ce_var_name));
+}
+
 static ssize_t volatile_uce_inline_show(struct kobject *kobj,
 					struct kobj_attribute *attr, char *buf)
 {
@@ -91,16 +202,43 @@ static ssize_t volatile_uce_ondie_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%llu\n", mtk_dram_ecc_get_volatile_uce_ondie());
 }
 
+static ssize_t agg_uce_inline_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", efi_counter_get(mtk_uce_inline_var_name));
+}
+
+static ssize_t agg_uce_ondie_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", efi_counter_get(mtk_uce_ondie_var_name));
+}
+
+/* Total UCE count across boots: every UCE is seen by inline ECC. */
+static ssize_t agg_uce_show(struct kobject *kobj,
+			    struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", efi_counter_get(mtk_uce_inline_var_name));
+}
+
 static struct kobj_attribute volatile_ce_attr = __ATTR_RO(volatile_ce);
 static struct kobj_attribute volatile_uce_attr = __ATTR_RO(volatile_uce);
+static struct kobj_attribute agg_ce_attr = __ATTR_RO(agg_ce);
+static struct kobj_attribute agg_uce_attr = __ATTR_RO(agg_uce);
 static struct kobj_attribute volatile_uce_inline_attr = __ATTR_RO(volatile_uce_inline);
 static struct kobj_attribute volatile_uce_ondie_attr = __ATTR_RO(volatile_uce_ondie);
+static struct kobj_attribute agg_uce_inline_attr = __ATTR_RO(agg_uce_inline);
+static struct kobj_attribute agg_uce_ondie_attr = __ATTR_RO(agg_uce_ondie);
 
 static struct attribute *attrs[] = {
 	&volatile_ce_attr.attr,
 	&volatile_uce_attr.attr,
+	&agg_ce_attr.attr,
+	&agg_uce_attr.attr,
 	&volatile_uce_inline_attr.attr,
 	&volatile_uce_ondie_attr.attr,
+	&agg_uce_inline_attr.attr,
+	&agg_uce_ondie_attr.attr,
 	NULL,
 };
 
@@ -169,6 +307,7 @@ int mtk_dram_ecc_counters_init(struct kobject *parent)
 
 void mtk_dram_ecc_counters_exit(void)
 {
+	cancel_work_sync(&counters_flush_work);
 	sysfs_remove_group(retired_kobj, &retired_group);
 	kobject_put(retired_kobj);
 	sysfs_remove_group(counters_kobj, &group);
diff --git a/drivers/soc/mediatek/dram-ecc/core/counters.h b/drivers/soc/mediatek/dram-ecc/core/counters.h
index fd718dc45ea6..af2e5ea16b90 100644
--- a/drivers/soc/mediatek/dram-ecc/core/counters.h
+++ b/drivers/soc/mediatek/dram-ecc/core/counters.h
@@ -16,6 +16,9 @@ enum mtk_dram_ecc_retire_reason {
 int mtk_dram_ecc_counters_init(struct kobject *parent);
 void mtk_dram_ecc_counters_exit(void);
 
+void mtk_dram_ecc_agg_ce_inc(void);
+void mtk_dram_ecc_agg_uce_inline_inc(void);
+void mtk_dram_ecc_agg_uce_ondie_inc(void);
 void mtk_dram_ecc_record_retired_page(unsigned long pfn,
 				      enum mtk_dram_ecc_retire_reason reason,
 				      int memory_failure_ret);
diff --git a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
index c1d885f0bf15..633bf89e2231 100644
--- a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
+++ b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
@@ -242,6 +242,7 @@ static int mtk_ghes_vendor_cb(struct notifier_block *nb, unsigned long severity,
 
 	if (evt.severity == MTK_DRAM_ECC_NOTIFY_CE) {
 		atomic64_inc(&volatile_ce_count);
+		mtk_dram_ecc_agg_ce_inc();
 		spin_lock(&addr_lock);
 		if (ce_addr_count < MTK_ECC_MAX_BOOT_ADDRS)
 			ce_addrs[ce_addr_count++] = evt.spa;
@@ -258,8 +259,11 @@ static int mtk_ghes_vendor_cb(struct notifier_block *nb, unsigned long severity,
 
 		/* Inline ECC detects every UCE, including an on-die one. */
 		atomic64_inc(&volatile_uce_inline_count);
-		if (vs->from_ondie_ecc)
+		mtk_dram_ecc_agg_uce_inline_inc();
+		if (vs->from_ondie_ecc) {
 			atomic64_inc(&volatile_uce_ondie_count);
+			mtk_dram_ecc_agg_uce_ondie_inc();
+		}
 		spin_lock(&addr_lock);
 		if (uce_addr_count < MTK_ECC_MAX_BOOT_ADDRS)
 			uce_addrs[uce_addr_count++] = evt.spa;
-- 
2.45.2

