Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611531;
	b=SwZzlVJKJFeD22WfnVU3UvM+2ikjKAPlxVTNVu4tSybzaRm7Nwg3dorUvGh7hFWFgvci
	 mq8zlzNpg6zxpFUvl7R7q2RqaEaauNQYx7copEUGdBjV83PhpdnSWaJMiNp6jRMzdL/xL
	 k9vBC+MePuZH0QbFBxuS2id/G3NWH/uGW3b9C6TeiRpHs1TLcGXbxGfhdGXeWjJeR84NL
	 ERVJMeTBAMoMKxN5J5m/4xhNK8czCR0vq0PFth/izazJicPSAdEE0BLATwp+PY8iED/ym
	 eN1vsjsvZ5PXVo02hEDKMNicYsIOQniQTRNM9uj9a1bZ84HEMoJGEAQZ8rhpdrFlkqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611531;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=r8C0Ob2CNzmsQoE5e5UKbxtC5lY5lbsEgLXR9yXeohw=;
	b=XvQikN2rb5YVzq0UYXaDkrAVoK5NMqgzc/mrFdjwAYv7XmFY1nt2c45pzvecm7UVHJZT
	 NgGqxAP252O3SVgtVs8vzwJrIL7Z0iCR+skIbAwN7h9RJ45SbMWp0XJq/Emjc2Qj0NRca
	 8HSXue62SYrC9rQeetSAxM2xf8Pti0vEYiSGm1iRac0GzUTOSrWjvneg8+7JvJ7p1/Jrp
	 s1bWk/HrkD7I0xqMUkdXS9KtPZm9GQpBVULwojG6z2zZBemiCFuFeEly03ZVTUC0X43vU
	 CwnlZLw61u/tkz3E1OTLCVjDqolZ7zHGIg6Xlqg5g1OUjYO5iRqb0yqnLsCakKb6miA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=h9cDbTAZ;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C606F60A2605
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C606F60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=h9cDbTAZ
X-UUID: 541cd758d69f11f1b1788b6acf885367-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=r8C0Ob2CNzmsQoE5e5UKbxtC5lY5lbsEgLXR9yXeohw=;
	b=h9cDbTAZSs/rZCf46MviNxyK9/3Z8comypBDRFJ68YMM4yFd0VcnTUhgTdoJ218DXuotnE/wajdBC2K0d90O9n7Fe3Q8DQ6qRu1Rh2iAqUe1ri27vhAo6ce/GabfbNBAWYWWzCBVRlx+0dpH8Y8pglaK+ArJBhhC3hczra6Mbws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5be2ba7d-158d-40cf-9df2-caefb750e4c3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:b7fc9978-4c28-42d9-a11b-3ae385bafce8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 541cd758d69f11f1b1788b6acf885367-20261102
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 623648512; Mon, 02 Nov 2026 17:25:22 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
Subject: [RFC PATCH 04/11] soc: mediatek: dram-ecc: handle GHES vendor records from the firmware
Date: Mon, 2 Nov 2026 17:23:26 +0800
Message-ID: <20261102092334.138759-5-santino.wang@mediatek.com>
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

The secure firmware reports an error as a CPER record that carries,
next to the standard memory error section, a MediaTek vendor section
with the raw DRAM controller error registers. Register a GHES vendor
record notifier that decodes the most severe entry of that dump and
then:

 - tallies corrected and uncorrectable errors since boot and keeps
   the first addresses of each kind,
 - for a recoverable uncorrectable error on memory that Linux manages,
   isolates the page with memory_failure() and panics if that fails,
   while memory owned by a device (a carveout) is only reported to
   its owner,
 - passes the decoded event to in-kernel clients through a notifier
   chain, for drivers such as a GPU driver that must react to errors
   in memory they own.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/core/Makefile   |   1 +
 .../mediatek/dram-ecc/core/ghes_notifier.c    | 364 ++++++++++++++++++
 .../mediatek/dram-ecc/core/ghes_notifier.h    |  22 ++
 drivers/soc/mediatek/dram-ecc/core/main.c     |  10 +-
 .../dram-ecc/core/mtk_dram_ecc_event.h        |  47 +++
 5 files changed, 443 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc_event.h

diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
index 66ce5d306a45..304117845420 100644
--- a/drivers/soc/mediatek/dram-ecc/core/Makefile
+++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_MTK_DRAM_ECC) += mtk_dram_ecc.o
 mtk_dram_ecc-y := \
 	main.o \
 	smc.o \
+	ghes_notifier.o \
 	trace.o
 
 CFLAGS_trace.o := -I$(src)
diff --git a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
new file mode 100644
index 000000000000..4ba65875e427
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+/*
+ * GHES vendor-section consumer for DRAM ECC CE/UCE notifications
+ * (delivered via ACPI_HEST_NOTIFY_GSIV, SPI 248 - not SDEI).
+ *
+ * ATF's dram_ecc/mt8992/fiq.c only makes a minimal CE-vs-UCE call itself (to
+ * pick the GHES instance); it hands off the full raw
+ * ECCERR_INFO0~31/INFO32/DB0~DB4 dump for both sub-channels via the
+ * vendor section instead of throwing away everything but one entry. So
+ * this driver makes the same adjustment ATF made: it independently scans
+ * that raw dump for the worst (MBE > SBE) entry and decodes it itself,
+ * using the exact same algorithm as ATF's dram_ecc/mt8992/fiq.c
+ * (get_error_type()/decode_physical_address()) - kernel and ATF must agree on
+ * what "the" error for this notification is.
+ */
+#include <linux/notifier.h>
+#include <linux/atomic.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+#include <linux/mm.h>
+#include <linux/panic.h>
+#include <acpi/ghes.h>
+
+#include "mtk_dram_ecc.h"
+#include "mtk_dram_ecc_event.h"
+#include "ghes_notifier.h"
+#include "trace.h"
+
+static ATOMIC_NOTIFIER_HEAD(mtk_dram_ecc_notifier_chain);
+
+int mtk_dram_ecc_register_notifier(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_register(&mtk_dram_ecc_notifier_chain, nb);
+}
+EXPORT_SYMBOL_GPL(mtk_dram_ecc_register_notifier);
+
+int mtk_dram_ecc_unregister_notifier(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_unregister(&mtk_dram_ecc_notifier_chain, nb);
+}
+EXPORT_SYMBOL_GPL(mtk_dram_ecc_unregister_notifier);
+
+static atomic64_t volatile_ce_count = ATOMIC64_INIT(0);
+static atomic64_t volatile_uce_inline_count = ATOMIC64_INIT(0);
+static atomic64_t volatile_uce_ondie_count = ATOMIC64_INIT(0);
+
+static u64 ce_addrs[MTK_ECC_MAX_BOOT_ADDRS];
+static u64 uce_addrs[MTK_ECC_MAX_BOOT_ADDRS];
+static int ce_addr_count;
+static int uce_addr_count;
+static DEFINE_SPINLOCK(addr_lock);
+
+static const guid_t mtk_vendor_guid =
+	GUID_INIT(0x4E117621, 0x9725, 0x48E4,
+		  0xA3, 0xA0, 0xD2, 0xE5, 0xB1, 0x64, 0x8C, 0x5A);
+
+/*
+ * Raw ECCERR_INFO0~31 + INFO32 + DB0~DB4 dump for one sub-channel - must
+ * match ATF apei/ghes.h's struct mtk_dram_ecc_subch_dump exactly, byte
+ * for byte (ATF is the writer, ACPI GHES entry data is opaque bytes).
+ */
+struct mtk_vendor_subch_dump {
+	u32 info[16][2];
+	u32 info32;
+	u32 db0;
+	u32 db1;
+	u32 db2;
+	u32 db3;
+	u32 db4;
+};
+
+/*
+ * Must match ATF apei/ghes.h's struct mtk_dram_ecc_raw_dump exactly.
+ *
+ * physical_addr is decoded by ATF, which already needs it for the standard
+ * memory-error section. Consuming it here avoids keeping a second copy of the
+ * DRAMC bit-scatter map in sync with ATF's decode_physical_address(). The raw
+ * dump is retained for engineer post-mortem via the CPER hex dump.
+ */
+struct mtk_vendor_section {
+	u64 physical_addr;
+	u32 ch_idx;
+	/*
+	 * Inline ECC sees every UCE, so from_inline_ecc is 1; from_ondie_ecc is
+	 * also 1 when the error originated in the DRAM die.
+	 */
+	u16 from_inline_ecc;
+	u16 from_ondie_ecc;
+	struct mtk_vendor_subch_dump subch[2];
+};
+
+/* ERR_TYPE_DLEP/LECC encoding (info0[31:30]/[29:28]): 0=no err, 1=SBE, 2=MBE, 3=parity SBE */
+#define MTK_ECC_ERR_TYPE_NONE 0U
+#define MTK_ECC_ERR_TYPE_SBE  1U
+#define MTK_ECC_ERR_TYPE_MBE  2U
+
+/* Worse of ERR_TYPE_DLEP/ERR_TYPE_LECC for one entry; 0 if neither reports an error. */
+static u32 entry_err_type(u32 info0)
+{
+	u32 t_dlep = (info0 >> 30) & 0x3U;
+	u32 t_lecc = (info0 >> 28) & 0x3U;
+
+	if (t_dlep == MTK_ECC_ERR_TYPE_MBE || t_lecc == MTK_ECC_ERR_TYPE_MBE)
+		return MTK_ECC_ERR_TYPE_MBE;
+	if (t_dlep != 0U || t_lecc != 0U)
+		return MTK_ECC_ERR_TYPE_SBE;
+	return MTK_ECC_ERR_TYPE_NONE;
+}
+
+/*
+ * Scan both sub-channels' ECCERR_INFO0~31 for the single worst (MBE > SBE)
+ * entry and fill @evt from it. Mirrors ATF dram_ecc/mt8992/fiq.c's
+ * scan_subchannel()/get_error_type() selection order, so the entry picked here
+ * is the same one ATF decoded. Returns MTK_ECC_ERR_TYPE_NONE if every entry in
+ * the dump is empty.
+ *
+ * rank/bank/row/column are plain field extractions from the selected entry.
+ * The physical address is not re-derived: ATF publishes the value it already
+ * decoded for the standard memory-error section in vs->physical_addr, which
+ * keeps the DRAMC bit-scatter map in exactly one place.
+ */
+static u32 decode_worst_entry(const struct mtk_vendor_section *vs,
+			      struct mtk_dram_ecc_event *evt)
+{
+	u32 severity = MTK_ECC_ERR_TYPE_NONE;
+	u32 sel_info0 = 0, sel_info1 = 0;
+	int sel_subch = 0;
+	int subch, e;
+
+	for (subch = 0; subch < 2; subch++) {
+		const struct mtk_vendor_subch_dump *d = &vs->subch[subch];
+
+		for (e = 0; e < 16; e++) {
+			u32 info0 = d->info[e][0];
+			u32 info1 = d->info[e][1];
+			u32 type = entry_err_type(info0);
+
+			if (type > severity) {
+				severity = type;
+				sel_info0 = info0;
+				sel_info1 = info1;
+				sel_subch = subch;
+			}
+		}
+	}
+
+	if (severity == MTK_ECC_ERR_TYPE_NONE)
+		return severity;
+
+	evt->spa    = vs->physical_addr;
+	evt->rank   = (u16)(sel_info0 & 0x3U);
+	evt->bank   = (u16)((sel_info0 >> 2) & 0x1fU);
+	evt->row    = (sel_info1 >> 11) & 0x3ffffU;
+	evt->column = (u16)(sel_info1 & 0x7ffU);
+	evt->channel = (u8)vs->ch_idx;
+	evt->subchannel = (u8)sel_subch;
+
+	return severity;
+}
+
+/*
+ * Is this PFN memory Linux itself manages, i.e. memory we are entitled to
+ * poison?
+ *
+ * page_is_ram() on its own is not an ownership test: a device carveout
+ * reserved out of a System RAM resource still satisfies it. Such a carveout
+ * keeps PageReserved set, so additionally require a struct page that is not
+ * reserved. Everything else belongs to its device owner - a recoverable UCE
+ * there is only reported to the owner, never isolated here.
+ */
+static bool pfn_is_linux_managed(unsigned long pfn)
+{
+	if (!pfn_valid(pfn) || !page_is_ram(pfn))
+		return false;
+
+	return !PageReserved(pfn_to_page(pfn));
+}
+
+static int mtk_ghes_vendor_cb(struct notifier_block *nb, unsigned long severity,
+			      void *data)
+{
+	struct acpi_hest_generic_data *gdata = data;
+	const struct mtk_vendor_section *vs;
+	struct mtk_dram_ecc_event evt = { 0 };
+	guid_t *sec_type;
+	int ret;
+
+	sec_type = (guid_t *)gdata->section_type;
+	if (!guid_equal(sec_type, &mtk_vendor_guid)) {
+		/* Not our vendor record - log the GUID (rate-limited) so a
+		 * GUID mismatch between ATF and this driver is not a silent
+		 * "nothing happened".
+		 */
+		pr_warn_ratelimited("mtk-dram-ecc: GHES vendor record with non-MTK section GUID %pUl, ignoring\n",
+				    sec_type);
+		return NOTIFY_DONE;
+	}
+
+	if (severity == GHES_SEV_CORRECTED) {
+		evt.severity = MTK_DRAM_ECC_NOTIFY_CE;
+	} else if (severity == GHES_SEV_RECOVERABLE) {
+		evt.severity = MTK_DRAM_ECC_NOTIFY_UCE;
+	} else {
+		pr_warn_ratelimited("mtk-dram-ecc: unsupported GHES vendor-record severity %lu, ignoring\n",
+				    severity);
+		return NOTIFY_DONE;
+	}
+
+	/*
+	 * Generic GHES only guarantees the declared section fits inside the
+	 * copied error-status block; it knows nothing about this MTK-specific
+	 * minimum. Reject a truncated record before the decoder reads past the
+	 * section.
+	 */
+	if (acpi_hest_get_error_length(gdata) < sizeof(struct mtk_vendor_section)) {
+		pr_warn_ratelimited("mtk-dram-ecc: MTK vendor section too short: %d < %zu, ignoring\n",
+				    acpi_hest_get_error_length(gdata),
+				    sizeof(struct mtk_vendor_section));
+		return NOTIFY_DONE;
+	}
+
+	vs = acpi_hest_get_payload(gdata);
+
+	if (decode_worst_entry(vs, &evt) == MTK_ECC_ERR_TYPE_NONE) {
+		pr_warn("mtk-dram-ecc: GHES vendor section CH%u has no non-zero ECCERR_INFO entry\n",
+			vs->ch_idx);
+		return NOTIFY_OK;
+	}
+
+	/* Announce the decoded event before taking any action, independent of
+	 * tracepoints / the optional notify_sink modules, so the path is
+	 * observable in dmesg even if a downstream step fails.
+	 */
+	pr_info("mtk-dram-ecc: %s CH%u subch%u spa=0x%llx rank=%u bank=%u row=%u col=%u\n",
+		(evt.severity == MTK_DRAM_ECC_NOTIFY_CE) ? "CE" : "UCE",
+		vs->ch_idx, evt.subchannel, evt.spa, evt.rank, evt.bank, evt.row,
+		evt.column);
+
+	if (evt.severity == MTK_DRAM_ECC_NOTIFY_CE) {
+		atomic64_inc(&volatile_ce_count);
+		spin_lock(&addr_lock);
+		if (ce_addr_count < MTK_ECC_MAX_BOOT_ADDRS)
+			ce_addrs[ce_addr_count++] = evt.spa;
+		spin_unlock(&addr_lock);
+		trace_mtk_dram_ecc_ce(evt.spa, evt.channel, evt.subchannel, evt.rank,
+				      evt.bank, evt.row, evt.column);
+		ret = atomic_notifier_call_chain(&mtk_dram_ecc_notifier_chain,
+						 MTK_DRAM_ECC_NOTIFY_CE, &evt);
+		if (ret == NOTIFY_BAD)
+			pr_warn_ratelimited("mtk-dram-ecc: kernel client rejected CE event for spa=0x%llx\n",
+					    evt.spa);
+	} else {
+		unsigned long pfn = evt.spa >> PAGE_SHIFT;
+
+		/* Inline ECC detects every UCE, including an on-die one. */
+		atomic64_inc(&volatile_uce_inline_count);
+		if (vs->from_ondie_ecc)
+			atomic64_inc(&volatile_uce_ondie_count);
+		spin_lock(&addr_lock);
+		if (uce_addr_count < MTK_ECC_MAX_BOOT_ADDRS)
+			uce_addrs[uce_addr_count++] = evt.spa;
+		spin_unlock(&addr_lock);
+		trace_mtk_dram_ecc_uce(evt.spa, evt.channel, evt.subchannel, evt.rank,
+				       evt.bank, evt.row, evt.column);
+		/*
+		 * memory_failure() owns Linux-managed memory only. A device
+		 * carveout is recovered by the subscriber that owns the SPA
+		 * range, so this path only notifies for it. Generic GHES
+		 * cannot pre-empt that decision either: with
+		 * CONFIG_ACPI_APEI_MEMORY_FAILURE=y it does call
+		 * memory_failure() off the standard section, but
+		 * pfn_to_online_page() returns NULL for a carveout, so that
+		 * call fails with -ENXIO without poisoning anything. On
+		 * Linux-managed memory the two paths race benignly; see the
+		 * -EHWPOISON handling in mtk_dram_ecc_record_retired_page().
+		 */
+		if (pfn_is_linux_managed(pfn)) {
+			ret = memory_failure(pfn, 0);
+			pr_info("mtk-dram-ecc: memory_failure(pfn=0x%lx) returned %d\n",
+				pfn, ret);
+			if (ret != 0 && ret != -EHWPOISON) {
+				pr_emerg("mtk-dram-ecc: recoverable UCE isolation failed: pfn=0x%lx ret=%d\n",
+					 pfn, ret);
+				panic("DRAM ECC recoverable UCE isolation failed");
+			}
+		} else {
+			pr_info("mtk-dram-ecc: notify-only UCE spa=0x%llx (not Linux-managed memory)\n",
+				evt.spa);
+		}
+		ret = atomic_notifier_call_chain(&mtk_dram_ecc_notifier_chain,
+						 MTK_DRAM_ECC_NOTIFY_UCE, &evt);
+		if (ret == NOTIFY_BAD)
+			pr_warn_ratelimited("mtk-dram-ecc: kernel client rejected UCE event for spa=0x%llx\n",
+					    evt.spa);
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block mtk_ghes_vendor_nb = {
+	.notifier_call = mtk_ghes_vendor_cb,
+};
+
+u64 mtk_dram_ecc_get_volatile_ce(void)
+{
+	return atomic64_read(&volatile_ce_count);
+}
+EXPORT_SYMBOL_GPL(mtk_dram_ecc_get_volatile_ce);
+
+u64 mtk_dram_ecc_get_volatile_uce_inline(void)
+{
+	return atomic64_read(&volatile_uce_inline_count);
+}
+EXPORT_SYMBOL_GPL(mtk_dram_ecc_get_volatile_uce_inline);
+
+u64 mtk_dram_ecc_get_volatile_uce_ondie(void)
+{
+	return atomic64_read(&volatile_uce_ondie_count);
+}
+EXPORT_SYMBOL_GPL(mtk_dram_ecc_get_volatile_uce_ondie);
+
+/* Total UCE count: every UCE is seen by inline ECC (on-die is a subset). */
+u64 mtk_dram_ecc_get_volatile_uce(void)
+{
+	return mtk_dram_ecc_get_volatile_uce_inline();
+}
+EXPORT_SYMBOL_GPL(mtk_dram_ecc_get_volatile_uce);
+
+int mtk_dram_ecc_get_ce_addrs(u64 *buf, int max)
+{
+	int count;
+
+	spin_lock(&addr_lock);
+	count = min(ce_addr_count, max);
+	memcpy(buf, ce_addrs, count * sizeof(u64));
+	spin_unlock(&addr_lock);
+	return count;
+}
+EXPORT_SYMBOL_GPL(mtk_dram_ecc_get_ce_addrs);
+
+int mtk_dram_ecc_get_uce_addrs(u64 *buf, int max)
+{
+	int count;
+
+	spin_lock(&addr_lock);
+	count = min(uce_addr_count, max);
+	memcpy(buf, uce_addrs, count * sizeof(u64));
+	spin_unlock(&addr_lock);
+	return count;
+}
+EXPORT_SYMBOL_GPL(mtk_dram_ecc_get_uce_addrs);
+
+int mtk_dram_ecc_ghes_init(void)
+{
+	return ghes_register_vendor_record_notifier(&mtk_ghes_vendor_nb);
+}
+
+void mtk_dram_ecc_ghes_exit(void)
+{
+	ghes_unregister_vendor_record_notifier(&mtk_ghes_vendor_nb);
+}
diff --git a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.h b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.h
new file mode 100644
index 000000000000..649e2d5fe928
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _MTK_DRAM_ECC_GHES_NOTIFIER_H_
+#define _MTK_DRAM_ECC_GHES_NOTIFIER_H_
+
+#include <linux/types.h>
+
+#define MTK_ECC_MAX_BOOT_ADDRS 256
+
+int mtk_dram_ecc_ghes_init(void);
+void mtk_dram_ecc_ghes_exit(void);
+
+u64 mtk_dram_ecc_get_volatile_ce(void);
+u64 mtk_dram_ecc_get_volatile_uce_inline(void);
+u64 mtk_dram_ecc_get_volatile_uce_ondie(void);
+u64 mtk_dram_ecc_get_volatile_uce(void);
+int mtk_dram_ecc_get_ce_addrs(u64 *buf, int max);
+int mtk_dram_ecc_get_uce_addrs(u64 *buf, int max);
+
+#endif /* _MTK_DRAM_ECC_GHES_NOTIFIER_H_ */
diff --git a/drivers/soc/mediatek/dram-ecc/core/main.c b/drivers/soc/mediatek/dram-ecc/core/main.c
index ce6bd39fa303..3232046394e3 100644
--- a/drivers/soc/mediatek/dram-ecc/core/main.c
+++ b/drivers/soc/mediatek/dram-ecc/core/main.c
@@ -7,6 +7,7 @@
 #include <linux/device/class.h>
 
 #include "mtk_dram_ecc.h"
+#include "ghes_notifier.h"
 #include "trace.h"
 
 static struct class *mtk_dram_ecc_class;
@@ -34,10 +35,16 @@ static int __init mtk_dram_ecc_init(void)
 		goto err_class;
 	}
 
+	ret = mtk_dram_ecc_ghes_init();
+	if (ret)
+		goto err_dev;
+
 	trace_mtk_dram_ecc_lifecycle(0);
-	dev_info(mtk_dram_ecc_dev, "initialized\n");
+	dev_info(mtk_dram_ecc_dev, "initialized (GHES vendor notifier registered)\n");
 	return 0;
 
+err_dev:
+	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 err_class:
 	class_destroy(mtk_dram_ecc_class);
 	return ret;
@@ -45,6 +52,7 @@ static int __init mtk_dram_ecc_init(void)
 
 static void __exit mtk_dram_ecc_exit(void)
 {
+	mtk_dram_ecc_ghes_exit();
 	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 	class_destroy(mtk_dram_ecc_class);
 	trace_mtk_dram_ecc_lifecycle(1);
diff --git a/drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc_event.h b/drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc_event.h
new file mode 100644
index 000000000000..ae7bd7c3abfa
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc_event.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _MTK_DRAM_ECC_EVENT_H_
+#define _MTK_DRAM_ECC_EVENT_H_
+
+#include <linux/types.h>
+#include <linux/notifier.h>
+
+/**
+ * struct mtk_dram_ecc_event - payload passed to notifier chain subscribers
+ * @spa:      System Physical Address of the error, decoded from the
+ *            ECCERR_INFO0/1 entry that determined severity (see
+ *            ghes_notifier.c) - mirrors ATF dram_ecc/mt8992/fiq.c's decode.
+ * @rank:     DRAMC rank address (RANK_ADDR, info0[1:0])
+ * @bank:     DRAMC bank address (BANK_ADDR, info0[6:2])
+ * @row:      DRAMC row address (ROW_ADDR, info1[28:11])
+ * @column:   DRAMC column address (COL_ADDR, info1[10:0])
+ * @severity: MTK_DRAM_ECC_NOTIFY_CE or MTK_DRAM_ECC_NOTIFY_UCE
+ * @channel:  DRAM channel index reported by the firmware for this record
+ * @subchannel: sub-channel (0 or 1) of the ECCERR_INFO0/1 entry
+ *
+ * No agent/master ID fields: ATF's GHES vendor section no longer computes
+ * them (see ATF apei/ghes.c) - MASTER_ID/RID are still in the raw
+ * ECCERR_INFO0/1 dump the vendor section carries, just not surfaced here
+ * yet.
+ */
+struct mtk_dram_ecc_event {
+	u64 spa;
+	u16 rank;
+	u16 bank;
+	u32 row;
+	u16 column;
+	u8  severity;
+	u8  channel;
+	u8  subchannel;
+};
+
+/* notifier_call val argument */
+#define MTK_DRAM_ECC_NOTIFY_CE  0
+#define MTK_DRAM_ECC_NOTIFY_UCE 1
+
+int mtk_dram_ecc_register_notifier(struct notifier_block *nb);
+int mtk_dram_ecc_unregister_notifier(struct notifier_block *nb);
+
+#endif /* _MTK_DRAM_ECC_EVENT_H_ */
-- 
2.45.2

