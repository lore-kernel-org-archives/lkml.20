Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611530;
	b=u3BQl0YzChDVLzDrI1ZDJ02uExgoU7o5dsoEmNBrla8gwj5gZCdiIrCse/+g4ShAfqBF
	 VtrIUS3R+4PrL5Y0JhVq3pHI5aftfZquDojThTFQs85E05f9LRdYKwca2AbCkilB0snUs
	 Aow61pHDwqDSb3qabQCepAwICn4ZiOodzjNClkK06inUlRhxj/DyZ0XxfNASQiDPi5qhL
	 vZT4pA8nCSrz80f9YmhlXYbgoYUwgma/kOrRaoroN+nOypJ4yzRqhHIiTyz6gj03gIxWi
	 DNyzcDaRnMaBG0C36qbegW+gDbkLA2MzCajHe3EWWJKPjhsp9TNaVEV6S2L3ejfr0IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611530;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=gi1MqL4X5fk68LngCNYkXbC56efnXIz1LNUKx6fFEzU=;
	b=WFrCTsVuS6wciKPnrtPhl8vMqGEUtm7KUTNaUu0zs5YNnxZcPD5PlhZBVwz5TrI2wntw
	 Xev//4dq1nW2ST1+vNJjKiIPhcL6vGf/jTV+gGykeDN9NhKHEaIt5L0tpCSL5AVyI5Kwf
	 X9H8JZSN9ODgoQv+QzPeVAH3BwfxsYYkXaVEQaADHe/9+g4qjTgqa8867NV/1mSx/HoF+
	 A1iwD9W/sHW3XsP4rXc957GVWo5ZXVFN80bgeab8QOst8T15rtHurX1frgYki846vwc9L
	 NShBGBzPzrYC1jIS046LBWIkfOJBOZNjPNijZkip3j72igv6jvpXc+BhZnFyo69MKKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=JVYcYO9z;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568A1606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568A1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=JVYcYO9z
X-UUID: 548f2178d69f11f1b1788b6acf885367-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gi1MqL4X5fk68LngCNYkXbC56efnXIz1LNUKx6fFEzU=;
	b=JVYcYO9zVbLSLGUTGwx8TCPI6G10DuSrh0zTPyEGXD2QS0q0S95slOHO1ORt90HHmc+W95QKTD0kj7J8apT1XfHZoTlvDS6bDNCGMJwAAaZaBT6/HUciITtpVXj2OjS1QieK92J8k0yubYsPbpZTmYm5e4Xtp23PRVHLWARlAN4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:837de429-dbb3-494d-b0e4-e920abd82f32,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:b850b2ce-02bc-447e-ab88-2baec399874a,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 548f2178d69f11f1b1788b6acf885367-20261102
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1640351718; Mon, 02 Nov 2026 17:25:23 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
Subject: [RFC PATCH 10/11] soc: mediatek: dram-ecc: report an uncorrectable error of the previous boot
Date: Mon, 2 Nov 2026 17:23:32 +0800
Message-ID: <20261102092334.138759-11-santino.wang@mediatek.com>
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

A fatal uncorrectable error makes the system panic and reset. The
firmware preserves the error across the reset and UEFI publishes it in
the ACPI BERT.

When the module loads, scan the BERT for such a record, log it, emit the
standard mc_event tracepoint so tools like rasdaemon see it, count it
in the aggregate counters, and delete the UEFI variable that holds the
record so it is not reported again.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/Kconfig         |  11 +-
 drivers/soc/mediatek/dram-ecc/core/Makefile   |   1 +
 .../soc/mediatek/dram-ecc/core/bert_check.c   | 240 ++++++++++++++++++
 .../soc/mediatek/dram-ecc/core/bert_check.h   |  12 +
 drivers/soc/mediatek/dram-ecc/core/counters.c |  20 ++
 drivers/soc/mediatek/dram-ecc/core/counters.h |   1 +
 drivers/soc/mediatek/dram-ecc/core/main.c     |  10 +-
 7 files changed, 290 insertions(+), 5 deletions(-)
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.h

diff --git a/drivers/soc/mediatek/dram-ecc/Kconfig b/drivers/soc/mediatek/dram-ecc/Kconfig
index c015c66635b2..bb46e00f8988 100644
--- a/drivers/soc/mediatek/dram-ecc/Kconfig
+++ b/drivers/soc/mediatek/dram-ecc/Kconfig
@@ -10,7 +10,10 @@ config MTK_DRAM_ECC
 	depends on HAVE_ARM_SMCCC && ACPI_APEI_GHES
 	default m
 	help
-	  Driver for MediaTek DRAM ECC runtime error handling. It works
-	  with the secure firmware (ATF), which owns the DRAM controller
-	  ECC interrupts and reports each corrected or uncorrectable
-	  error to the OS as an ACPI GHES record.
+	  Driver for MediaTek DRAM ECC runtime error handling: BERT check
+	  on boot for the previous boot's UCE record, GHES real-time
+	  CE/UCE notification from ATF's dramc_ecc_fiq.c (independently
+	  decoded from the raw ECCERR_INFO0~31/DB0~DB4 dump, mirroring
+	  ATF's own decode), aggregate EFI-NV counters shared with UEFI
+	  RasDxe.c, and a sysfs interface for containment policy, storm
+	  protection, and leaky-bucket tuning (pushed to ATF via SMC).
diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
index 1e2764914e9c..8845eab3a67b 100644
--- a/drivers/soc/mediatek/dram-ecc/core/Makefile
+++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_MTK_DRAM_ECC) += mtk_dram_ecc.o
 mtk_dram_ecc-y := \
 	main.o \
 	smc.o \
+	bert_check.o \
 	ghes_notifier.o \
 	netlink.o \
 	trace.o \
diff --git a/drivers/soc/mediatek/dram-ecc/core/bert_check.c b/drivers/soc/mediatek/dram-ecc/core/bert_check.c
new file mode 100644
index 000000000000..bac866ae7198
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/bert_check.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+/*
+ * MTK DRAM ECC BERT check
+ *
+ * On module init, scan the ACPI BERT table for fatal memory error records
+ * left by the previous boot (UCE containment reset). For each fatal CPER
+ * memory error section found, emit a trace_mc_event() directly so rasdaemon
+ * receives the event via the normal ras/mc_event tracefs path - with no
+ * side effects (no EDAC counter bump, no memory_failure(), no notifier chain).
+ * Once a record is reported, the LastUceError EFI variable UEFI built the
+ * BERT from is deleted.
+ *
+ * EFI variable writes can take tens of milliseconds.
+ * The entire check runs in a workqueue so module_init returns immediately.
+ */
+
+#include <linux/acpi.h>
+#include <linux/cper.h>
+#include <linux/workqueue.h>
+#include <ras/ras_event.h>
+#include <acpi/apei.h>
+#include <acpi/ghes.h>
+
+#include "bert_check.h"
+#include "counters.h"
+
+static void bert_check_work_fn(struct work_struct *work);
+static DECLARE_WORK(bert_check_work, bert_check_work_fn);
+
+/* CPER memory error section GUID: a5bc1114-6f64-4ede-b863-3e83ed7c83b1 */
+static const guid_t cper_mem_guid =
+	GUID_INIT(0xa5bc1114, 0x6f64, 0x4ede,
+		  0xb8, 0x63, 0x3e, 0x83, 0xed, 0x7c, 0x83, 0xb1);
+
+/* MTK DRAM ECC BERT vendor section: b2c3d4e5-f6a7-48b9-c0d1-e2f3a4b5c6d7 */
+static const guid_t mtk_dram_ecc_bert_guid =
+	GUID_INIT(0xb2c3d4e5, 0xf6a7, 0x48b9,
+		  0xc0, 0xd1, 0xe2, 0xf3, 0xa4, 0xb5, 0xc6, 0xd7);
+
+struct mtk_dram_ecc_bert_section {
+	u32 uce_detected;
+	u32 channel;
+	u32 subchannel;
+	u32 info_low;
+	u32 info_high;
+	u32 db0;
+	u32 db1;
+	u32 db2;
+	u32 db3;
+	u32 db4;
+	u32 uce_recorded;
+	u32 from_inline_ecc;
+	u32 from_ondie_ecc;
+};
+
+/* Returns 1 if this section was a matching DRAM ECC record (emitted an
+ * mc_event), 0 otherwise - so the caller can summarize the scan.
+ */
+static int mtk_bert_handle_section(struct acpi_hest_generic_data *gdata,
+				   const struct mtk_dram_ecc_bert_section *vendor)
+{
+	struct cper_sec_mem_err *mem;
+	guid_t *sec_type;
+	u32 sec_sev;
+	unsigned long pfn = 0;
+
+	sec_type = (guid_t *)gdata->section_type;
+	if (!guid_equal(sec_type, &cper_mem_guid))
+		return 0;
+
+	sec_sev = gdata->error_severity;
+	if (sec_sev != CPER_SEV_FATAL && sec_sev != CPER_SEV_RECOVERABLE)
+		return 0;
+
+	/* The MTK vendor section is length-checked; the standard one must be
+	 * too, or a truncated section with a valid GUID reads past its end.
+	 */
+	if (acpi_hest_get_error_length(gdata) < sizeof(struct cper_sec_mem_err)) {
+		pr_warn("mtk-dram-ecc: BERT memory-error section too short: %d < %zu\n",
+			acpi_hest_get_error_length(gdata),
+			sizeof(struct cper_sec_mem_err));
+		return 0;
+	}
+
+	mem = acpi_hest_get_payload(gdata);
+	if (mem->validation_bits & CPER_MEM_VALID_PA)
+		pfn = mem->physical_addr >> PAGE_SHIFT;
+
+	pr_info("mtk-dram-ecc: BERT UCE from previous boot (pa=0x%lx)\n",
+		pfn << PAGE_SHIFT);
+
+	trace_mc_event(HW_EVENT_ERR_UNCORRECTED,
+		       "multi-bit ECC",
+		       "BERT UCE from previous boot",
+		       1,       /* error_count */
+		       0,       /* mc_index */
+		       -1, -1, -1,
+		       pfn,
+		       0,       /* grain_bits */
+		       0,       /* syndrome */
+		       "mtk-dram-ecc");
+
+	/* Inline ECC detects every UCE, including an on-die one. */
+	mtk_dram_ecc_agg_uce_inline_inc();
+	if (vendor->from_ondie_ecc)
+		mtk_dram_ecc_agg_uce_ondie_inc();
+	return 1;
+}
+
+static struct mtk_dram_ecc_bert_section *
+mtk_bert_find_vendor_section(struct acpi_hest_generic_status *estatus)
+{
+	struct acpi_hest_generic_data *gdata;
+	guid_t *sec_type;
+
+	apei_estatus_for_each_section(estatus, gdata) {
+		sec_type = (guid_t *)gdata->section_type;
+		if (!guid_equal(sec_type, &mtk_dram_ecc_bert_guid))
+			continue;
+
+		if (acpi_hest_get_error_length(gdata) <
+		    sizeof(struct mtk_dram_ecc_bert_section)) {
+			pr_warn("mtk-dram-ecc: BERT vendor section does not contain UceRecorded\n");
+			return NULL;
+		}
+
+		return acpi_hest_get_payload(gdata);
+	}
+
+	return NULL;
+}
+
+static int mtk_bert_handle_estatus(struct acpi_hest_generic_status *estatus)
+{
+	struct mtk_dram_ecc_bert_section *vendor;
+	struct acpi_hest_generic_data *gdata;
+
+	vendor = mtk_bert_find_vendor_section(estatus);
+	if (!vendor || !READ_ONCE(vendor->uce_detected) ||
+	    READ_ONCE(vendor->uce_recorded))
+		return 0;
+
+	apei_estatus_for_each_section(estatus, gdata) {
+		if (!mtk_bert_handle_section(gdata, vendor))
+			continue;
+
+		WRITE_ONCE(vendor->uce_recorded, 1);
+		return 1;
+	}
+
+	return 0;
+}
+
+static void bert_check_work_fn(struct work_struct *work)
+{
+	mtk_dram_ecc_bert_check();
+}
+
+void mtk_dram_ecc_bert_check_schedule(void)
+{
+	schedule_work(&bert_check_work);
+}
+
+void mtk_dram_ecc_bert_check_cancel(void)
+{
+	cancel_work_sync(&bert_check_work);
+}
+
+void mtk_dram_ecc_bert_check(void)
+{
+	struct acpi_hest_generic_status *estatus;
+	struct acpi_table_bert *bert_tab;
+	unsigned int region_len, remain;
+	unsigned int fatal = 0;
+	acpi_status status;
+	void __iomem *region;
+	u32 estatus_len;
+
+	status = acpi_get_table(ACPI_SIG_BERT, 0,
+				(struct acpi_table_header **)&bert_tab);
+	if (status == AE_NOT_FOUND) {
+		pr_info("mtk-dram-ecc: BERT table not present (no previous-boot record)\n");
+		return;
+	}
+	if (ACPI_FAILURE(status)) {
+		pr_warn("mtk-dram-ecc: failed to get BERT table\n");
+		return;
+	}
+
+	region_len = bert_tab->region_length;
+	if (region_len < sizeof(*estatus))
+		goto put_table;
+
+	region = ioremap_cache(bert_tab->address, region_len);
+	if (!region) {
+		pr_warn("mtk-dram-ecc: failed to ioremap BERT region\n");
+		goto put_table;
+	}
+
+	estatus = (struct acpi_hest_generic_status *)region;
+	remain = region_len;
+
+	while (remain >= sizeof(*estatus)) {
+		if (estatus->raw_data_length)
+			estatus_len = estatus->raw_data_offset +
+				      estatus->raw_data_length;
+		else
+			estatus_len = sizeof(*estatus) + estatus->data_length;
+		if (remain < estatus_len || estatus_len == 0)
+			break;
+
+		if (cper_estatus_check(estatus)) {
+			pr_warn("mtk-dram-ecc: invalid BERT estatus, stopping\n");
+			break;
+		}
+
+		fatal += mtk_bert_handle_estatus(estatus);
+
+		estatus = (void *)estatus + estatus_len;
+		remain -= estatus_len;
+	}
+
+	iounmap(region);
+put_table:
+	acpi_put_table((struct acpi_table_header *)bert_tab);
+
+	/*
+	 * The BERT UCE is reported now, so drop the LastUceError variable that
+	 * UEFI RasDxe built it from. Kept when nothing was reported, so the
+	 * record is not lost if the BERT scan could not process it.
+	 */
+	if (fatal)
+		mtk_dram_ecc_last_uce_clear();
+
+	pr_info("mtk-dram-ecc: BERT scan complete: %u fatal DRAM ECC record(s)\n",
+		fatal);
+}
diff --git a/drivers/soc/mediatek/dram-ecc/core/bert_check.h b/drivers/soc/mediatek/dram-ecc/core/bert_check.h
new file mode 100644
index 000000000000..a12dd520f6b9
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/bert_check.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _MTK_DRAM_ECC_BERT_CHECK_H_
+#define _MTK_DRAM_ECC_BERT_CHECK_H_
+
+void mtk_dram_ecc_bert_check_schedule(void);
+void mtk_dram_ecc_bert_check_cancel(void);
+void mtk_dram_ecc_bert_check(void);
+
+#endif /* _MTK_DRAM_ECC_BERT_CHECK_H_ */
diff --git a/drivers/soc/mediatek/dram-ecc/core/counters.c b/drivers/soc/mediatek/dram-ecc/core/counters.c
index 8e3fd83cf60a..b3c207190855 100644
--- a/drivers/soc/mediatek/dram-ecc/core/counters.c
+++ b/drivers/soc/mediatek/dram-ecc/core/counters.c
@@ -36,6 +36,8 @@ static efi_guid_t mtk_ecc_efi_guid =
 static efi_char16_t mtk_ce_var_name[]  = L"MtkDramEccCeCount";
 static efi_char16_t mtk_uce_inline_var_name[] = L"MtkDramEccUceCount_inline";
 static efi_char16_t mtk_uce_ondie_var_name[]  = L"MtkDramEccUceCount_ondie";
+/* Written by UEFI RasDxe for the UCE that the BERT carries; same GUID. */
+static efi_char16_t mtk_last_uce_var_name[] = L"LastUceError";
 
 static struct kobject *counters_kobj;
 static struct kobject *retired_kobj;
@@ -110,6 +112,24 @@ static void counters_flush_work_fn(struct work_struct *work)
 		efi_counter_inc(mtk_uce_ondie_var_name, uce_ondie_delta);
 }
 
+/*
+ * UEFI keeps LastUceError until the kernel has processed it, so the UCE is
+ * rebuilt into the BERT on every boot until then. Delete it once the BERT
+ * record has been reported. A zero DataSize deletes the variable.
+ */
+void mtk_dram_ecc_last_uce_clear(void)
+{
+	efi_status_t status;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE))
+		return;
+
+	status = efi.set_variable(mtk_last_uce_var_name, &mtk_ecc_efi_guid,
+				  MTK_ECC_EFI_ATTR, 0, NULL);
+	if (status != EFI_SUCCESS && status != EFI_NOT_FOUND)
+		pr_warn("mtk-dram-ecc: delete LastUceError failed: 0x%lx\n", status);
+}
+
 void mtk_dram_ecc_agg_ce_inc(void)
 {
 	atomic_inc(&pending_ce_inc);
diff --git a/drivers/soc/mediatek/dram-ecc/core/counters.h b/drivers/soc/mediatek/dram-ecc/core/counters.h
index af2e5ea16b90..a818ff398769 100644
--- a/drivers/soc/mediatek/dram-ecc/core/counters.h
+++ b/drivers/soc/mediatek/dram-ecc/core/counters.h
@@ -19,6 +19,7 @@ void mtk_dram_ecc_counters_exit(void);
 void mtk_dram_ecc_agg_ce_inc(void);
 void mtk_dram_ecc_agg_uce_inline_inc(void);
 void mtk_dram_ecc_agg_uce_ondie_inc(void);
+void mtk_dram_ecc_last_uce_clear(void);
 void mtk_dram_ecc_record_retired_page(unsigned long pfn,
 				      enum mtk_dram_ecc_retire_reason reason,
 				      int memory_failure_ret);
diff --git a/drivers/soc/mediatek/dram-ecc/core/main.c b/drivers/soc/mediatek/dram-ecc/core/main.c
index 320631b3a044..0c3bc4d6ef06 100644
--- a/drivers/soc/mediatek/dram-ecc/core/main.c
+++ b/drivers/soc/mediatek/dram-ecc/core/main.c
@@ -12,6 +12,7 @@
 #include "addresses.h"
 #include "netlink.h"
 #include "trace.h"
+#include "bert_check.h"
 
 static struct class *mtk_dram_ecc_class;
 static struct device *mtk_dram_ecc_dev;
@@ -63,8 +64,14 @@ static int __init mtk_dram_ecc_init(void)
 	if (ret)
 		goto err_addresses;
 
+	mtk_dram_ecc_bert_check_schedule();
+
 	trace_mtk_dram_ecc_lifecycle(0);
-	dev_info(mtk_dram_ecc_dev, "initialized (GHES vendor notifier registered)\n");
+	/* Log the initialization independently of the tracepoints, so the log
+	 * shows that the module is up, the GHES vendor notifier is registered
+	 * and the BERT scan is scheduled.
+	 */
+	dev_info(mtk_dram_ecc_dev, "initialized (GHES vendor notifier registered, BERT scan scheduled)\n");
 	return 0;
 
 err_addresses:
@@ -90,6 +97,7 @@ static void __exit mtk_dram_ecc_exit(void)
 	 * state it touches is torn down.
 	 */
 	mtk_dram_ecc_ghes_exit();
+	mtk_dram_ecc_bert_check_cancel();
 	mtk_dram_ecc_addresses_exit();
 	mtk_dram_ecc_counters_exit();
 	mtk_dram_ecc_policy_exit(mtk_dram_ecc_dev);
-- 
2.45.2

