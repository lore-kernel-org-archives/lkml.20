Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB5B3EBF14
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541639; cv=none; b=F50JAtaAQ5r2CpVEKaH3t+k4NNjukqN3GyQmLlvSwoN/XfuvDuxWuETRZyiaS6B+06aOjPNJz/B1fMO7VASZ1Nj2kXvevHhQ2+UQWTzIg9zGvOKKdQoI/bk59Dhyur536wd0aoRMRWOplqqGuLL6/wrY7zDglTug/ya42NslUCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541639; c=relaxed/simple;
	bh=uJbJheBhJqOEo8HBLXYs1o5DQvJ5Gt4rdQL0BqivzY8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qAWhcFoJNOYt00dykFMgF2MXTdfkpRL64zEcXYkCr3tnOXXKgmQVLmBvJZJUmeHTA7ZRq5x2ytKWlFoCeyJmyyRapc2MEcAMu3mgvX3xAabqG+20yfOP3WBmJ7dgg11dJ3dRi0zSPtFZrJ6CvOYDv1oUYXD5pZxgmbq0qeWlQbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=jltuD7AQ; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="jltuD7AQ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JqFVv0Hc7ryF/Qwit4aH/3PwyU2fwcaJR5qGMvoCTyg=;
	b=jltuD7AQPzJ+fDbJr5eHkh5C0g4bRZVHWeAO4UUMAyk8Ay59MjNmcKZnKRgAYuH86ciPf9Hfr
	Vepw5OQJcWbRIBQVUMdh4f7fDWLTQpJGr3Hn96u3/6nF03aNMUaBtZD4bG790XvIxTLd0KXIp34
	1rDPq4PW9v0++UxnX7kXUHw=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hl8TX5g7dzRhQs;
	Wed, 16 Sep 2026 14:42:56 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id E0D914056D;
	Wed, 16 Sep 2026 14:53:52 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 14:53:51 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<jonathan.cameron@oss.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <u.kleine-koenig@baylibre.com>, <linuxarm@huawei.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH v6 2/3] drivers/perf: hisi: Add support for uncore ITS PMU
Date: Wed, 16 Sep 2026 14:53:47 +0800
Message-ID: <20260916065348.3957834-3-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260916065348.3957834-1-wangyushan12@huawei.com>
References: <20260916065348.3957834-1-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo500002.china.huawei.com (7.152.185.250)

The Interrupt Translation Service (ITS) PMU counts interrupts routed
to the ITS by category (LPI/SGI/PPI event counts and latencies) and
also collects micro-op statistics for the ITS itself.

Add a driver for the ITS PMU on the HiSilicon uncore PMU framework.
Like the NoC PMU it has no overflow interrupt, so the interrupt
enable/disable callbacks are empty stubs.

The PMU supports filtering counters by a 32-bit interrupt id (int_id),
composed of a 16-bit DeviceID/PEID in the upper half and a 16-bit
EventID/IntID in the lower half. The INT_ID filter is global to the
PMU instance, so only events with the same filter configuration may run
at the same time; events with different filters will be
time-multiplexed.

Document the int_id and int_en format attributes in
Documentation/admin-guide/perf/hisi-pmu.rst.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 Documentation/admin-guide/perf/hisi-pmu.rst  |  16 +
 drivers/perf/hisilicon/Makefile              |   2 +-
 drivers/perf/hisilicon/hisi_uncore_its_pmu.c | 385 +++++++++++++++++++
 3 files changed, 402 insertions(+), 1 deletion(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c

diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
index d56b2d690709..8cb4711c9c37 100644
--- a/Documentation/admin-guide/perf/hisi-pmu.rst
+++ b/Documentation/admin-guide/perf/hisi-pmu.rst
@@ -128,6 +128,22 @@ channel with this option. The current supported channels are as follows:
 7. tt_en: NoC PMU supports counting only transactions that have tracetag set
 if this option is set. See the 2nd list for more information about tracetag.
 
+8. int_id: ITS PMU supports filtering by interrupt id, which is defined by
+hardware. Interrupt id takes up to 32 bits, and can be divided into 2 parts:
+
+- Upper 16 bits: DeviceID if counting LPI, PEID if counting SGI/PPI.
+- Lower 16 bits: EventID if counting LPI, IntID if counting SGI/PPI.
+
+int_id is a global configuration for each PMU instance: the filter applies to
+all counters, so the PMU can only run events that agree on it. An unfiltered
+event (int_en not set) cannot run concurrently with a filtered one, and two
+filtered events can run concurrently only if they filter the same int_id.
+perf time-multiplexes any events that cannot coexist, rather than corrupting
+the counts.
+
+9. int_en: A one-bit flag to tell if int_id is used to filter the statistics. It
+allows filtering 0 DeviceID and EventID.
+
 For HiSilicon uncore PMU v3 whose identifier is 0x40, some uncore PMUs are
 further divided into parts for finer granularity of tracing, each part has its
 own dedicated PMU, and all such PMUs together cover the monitoring job of events
diff --git a/drivers/perf/hisilicon/Makefile b/drivers/perf/hisilicon/Makefile
index 186be3d02238..5f28cfdb8a72 100644
--- a/drivers/perf/hisilicon/Makefile
+++ b/drivers/perf/hisilicon/Makefile
@@ -2,7 +2,7 @@
 obj-$(CONFIG_HISI_PMU) += hisi_uncore_pmu.o hisi_uncore_l3c_pmu.o \
 			  hisi_uncore_hha_pmu.o hisi_uncore_ddrc_pmu.o hisi_uncore_sllc_pmu.o \
 			  hisi_uncore_pa_pmu.o hisi_uncore_cpa_pmu.o hisi_uncore_uc_pmu.o \
-			  hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o
+			  hisi_uncore_noc_pmu.o hisi_uncore_mn_pmu.o hisi_uncore_its_pmu.o
 
 obj-$(CONFIG_HISI_PCIE_PMU) += hisi_pcie_pmu.o
 obj-$(CONFIG_HNS3_PMU) += hns3_pmu.o
diff --git a/drivers/perf/hisilicon/hisi_uncore_its_pmu.c b/drivers/perf/hisilicon/hisi_uncore_its_pmu.c
new file mode 100644
index 000000000000..66311657db89
--- /dev/null
+++ b/drivers/perf/hisilicon/hisi_uncore_its_pmu.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for HiSilicon Uncore ITS PMU device
+ *
+ * Copyright (c) 2026 HiSilicon Technologies Co., Ltd.
+ * Author: Yushan Wang <wangyushan12@huawei.com>
+ */
+#include <linux/bitops.h>
+#include <linux/cpuhotplug.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/spinlock.h>
+#include <linux/sysfs.h>
+
+#include "hisi_uncore_pmu.h"
+
+#define ITS_PMU_VERSION			0x21000
+#define ITS_PMU_GLOBAL_CTRL		0x21004
+#define ITS_PMU_GLOBAL_CTRL_PMU_EN	BIT(0)
+#define ITS_PMU_COUNTER_CTRL		0x21008
+#define ITS_PMU_EVENT_CTRL		0x2100c
+#define ITS_PMU_COUNTER0		0x21010
+
+#define ITS_PMU_INT_ID_MASK		0x20008
+#define ITS_PMU_INT_ID_CTRL		0x20084
+
+#define ITS_PMU_NR_COUNTERS		4
+
+#define ITS_PMU_EVENT_CNTRn(cntr0, n)	((cntr0) + 8 * (n))
+#define ITS_PMU_CNTR_CTRL_MASK(n)	GENMASK(8 * ((n) + 1) - 1, 8 * (n))
+#define ITS_PMU_CNTR_EVENT_CFG(n, e)	((e) << ((n) * 8))
+#define ITS_PMU_EVENT_CTRL_TYPE		GENMASK(12, 0)
+
+HISI_PMU_EVENT_ATTR_EXTRACTOR(int_id, config1, 31, 0);
+HISI_PMU_EVENT_ATTR_EXTRACTOR(int_en, config1, 32, 32);
+
+struct hisi_its_pmu_regs {
+	u32 version;
+	u32 pmu_ctrl;
+	u32 event_ctrl0;
+	u32 event_cntr0;
+	u32 cntr_ctrl;
+};
+
+static void hisi_its_pmu_write_evtype(struct hisi_pmu *pmu, int idx, u32 type)
+{
+	struct hisi_its_pmu_regs *reg_info = pmu->dev_info->private;
+	u32 reg;
+
+	reg = readl(pmu->base + reg_info->event_ctrl0);
+	reg &= ~ITS_PMU_CNTR_CTRL_MASK(idx);
+	reg |= ITS_PMU_CNTR_EVENT_CFG(idx, type);
+	writel(reg, pmu->base + reg_info->event_ctrl0);
+}
+
+static u64 hisi_its_pmu_read_counter(struct hisi_pmu *pmu,
+				     struct hw_perf_event *hwc)
+{
+	struct hisi_its_pmu_regs *reg_info = pmu->dev_info->private;
+
+	return readq(pmu->base + ITS_PMU_EVENT_CNTRn(reg_info->event_cntr0, hwc->idx));
+}
+
+static void hisi_its_pmu_write_counter(struct hisi_pmu *pmu,
+				       struct hw_perf_event *hwc, u64 val)
+{
+	struct hisi_its_pmu_regs *reg_info = pmu->dev_info->private;
+
+	writeq(val, pmu->base + ITS_PMU_EVENT_CNTRn(reg_info->event_cntr0, hwc->idx));
+}
+
+static void hisi_its_pmu_enable_counter(struct hisi_pmu *pmu,
+					struct hw_perf_event *hwc)
+{
+	struct hisi_its_pmu_regs *reg_info = pmu->dev_info->private;
+	u32 reg;
+
+	reg = readl(pmu->base + reg_info->cntr_ctrl);
+	reg |= BIT(hwc->idx);
+	writel(reg, pmu->base + reg_info->cntr_ctrl);
+}
+
+static void hisi_its_pmu_disable_counter(struct hisi_pmu *pmu,
+					 struct hw_perf_event *hwc)
+{
+	struct hisi_its_pmu_regs *reg_info = pmu->dev_info->private;
+	u32 reg;
+
+	reg = readl(pmu->base + reg_info->cntr_ctrl);
+	reg &= ~BIT(hwc->idx);
+	writel(reg, pmu->base + reg_info->cntr_ctrl);
+}
+
+static void hisi_its_pmu_enable_counter_int(struct hisi_pmu *pmu,
+					    struct hw_perf_event *hwc)
+{
+	/* No overflow interrupt; counters rely on the framework's priming. */
+}
+
+static void hisi_its_pmu_disable_counter_int(struct hisi_pmu *pmu,
+					     struct hw_perf_event *hwc)
+{
+}
+
+static void hisi_its_pmu_start_counters(struct hisi_pmu *pmu)
+{
+	struct hisi_its_pmu_regs *reg_info = pmu->dev_info->private;
+	u32 reg;
+
+	reg = readl(pmu->base + reg_info->pmu_ctrl);
+	reg |= ITS_PMU_GLOBAL_CTRL_PMU_EN;
+	writel(reg, pmu->base + reg_info->pmu_ctrl);
+}
+
+static void hisi_its_pmu_stop_counters(struct hisi_pmu *pmu)
+{
+	struct hisi_its_pmu_regs *reg_info = pmu->dev_info->private;
+	u32 reg;
+
+	reg = readl(pmu->base + reg_info->pmu_ctrl);
+	reg &= ~ITS_PMU_GLOBAL_CTRL_PMU_EN;
+	writel(reg, pmu->base + reg_info->pmu_ctrl);
+}
+
+static void hisi_its_pmu_enable_filter(struct perf_event *event)
+{
+	struct hisi_pmu *pmu = to_hisi_pmu(event->pmu);
+	u32 int_id = hisi_get_int_id(event);
+	u32 int_en = hisi_get_int_en(event);
+
+	if (!int_en)
+		return;
+
+	writel(int_id, pmu->base + ITS_PMU_INT_ID_CTRL);
+	/* Write 0 to this register to enable filtering with int_id. */
+	writel(0, pmu->base + ITS_PMU_INT_ID_MASK);
+}
+
+static void hisi_its_pmu_disable_filter(struct perf_event *event)
+{
+	struct hisi_pmu *pmu = to_hisi_pmu(event->pmu);
+	u32 int_en = hisi_get_int_en(event);
+
+	if (!int_en)
+		return;
+
+	/*
+	 * The INT_ID filter is global, leave it alone if there are still
+	 * active counters.
+	 */
+	if (bitmap_weight(pmu->pmu_events.used_mask, pmu->num_counters) > 1)
+		return;
+
+	writel(0, pmu->base + ITS_PMU_INT_ID_CTRL);
+	writel(-1U, pmu->base + ITS_PMU_INT_ID_MASK);
+}
+
+/*
+ * The INT_ID filter is global to the PMU. Events can coexist only if they
+ * agree on it: both unfiltered, or both filtering the same int_id.
+ */
+static bool hisi_its_pmu_check_global_filter(struct perf_event *curr,
+					     struct perf_event *new)
+{
+	u32 curr_en = hisi_get_int_en(curr);
+	u32 new_en = hisi_get_int_en(new);
+
+	if (curr_en != new_en)
+		return false;
+
+	if (curr_en)
+		return hisi_get_int_id(curr) == hisi_get_int_id(new);
+
+	return true;
+}
+
+static int hisi_its_pmu_get_event_idx(struct perf_event *event)
+{
+	struct hisi_pmu *pmu = to_hisi_pmu(event->pmu);
+	struct hisi_pmu_hwevents *pmu_events = &pmu->pmu_events;
+	int cur_idx;
+
+	cur_idx = find_first_bit(pmu_events->used_mask, pmu->num_counters);
+	if (cur_idx != pmu->num_counters &&
+	    !hisi_its_pmu_check_global_filter(pmu_events->hw_events[cur_idx], event))
+		return -EAGAIN;
+
+	return hisi_uncore_pmu_get_event_idx(event);
+}
+
+static const struct hisi_uncore_ops hisi_uncore_its_ops = {
+	.write_evtype		= hisi_its_pmu_write_evtype,
+	.get_event_idx		= hisi_its_pmu_get_event_idx,
+	.read_counter		= hisi_its_pmu_read_counter,
+	.write_counter		= hisi_its_pmu_write_counter,
+	.enable_counter		= hisi_its_pmu_enable_counter,
+	.disable_counter	= hisi_its_pmu_disable_counter,
+	.enable_counter_int	= hisi_its_pmu_enable_counter_int,
+	.disable_counter_int	= hisi_its_pmu_disable_counter_int,
+	.start_counters		= hisi_its_pmu_start_counters,
+	.stop_counters		= hisi_its_pmu_stop_counters,
+	.enable_filter		= hisi_its_pmu_enable_filter,
+	.disable_filter		= hisi_its_pmu_disable_filter,
+};
+
+static struct attribute *hisi_its_pmu_format_attrs[] = {
+	HISI_PMU_FORMAT_ATTR(event, "config:0-7"),
+	HISI_PMU_FORMAT_ATTR(int_id, "config1:0-31"),
+	HISI_PMU_FORMAT_ATTR(int_en, "config1:32-32"),
+	NULL
+};
+
+static const struct attribute_group hisi_its_pmu_format_group = {
+	.name = "format",
+	.attrs = hisi_its_pmu_format_attrs,
+};
+
+static struct attribute *hisi_its_pmu_events_attrs[] = {
+	HISI_PMU_EVENT_ATTR(lpi_num, 0xc0),
+	HISI_PMU_EVENT_ATTR(lpi_time, 0x80),
+	HISI_PMU_EVENT_ATTR(sgi_num, 0xc1),
+	HISI_PMU_EVENT_ATTR(sgi_time, 0x81),
+	HISI_PMU_EVENT_ATTR(ppi_num, 0xc2),
+	HISI_PMU_EVENT_ATTR(ppi_time, 0x82),
+	HISI_PMU_EVENT_ATTR(sl3_lpi_num, 0xc3),
+	HISI_PMU_EVENT_ATTR(sl3_sgi_num, 0xc4),
+	HISI_PMU_EVENT_ATTR(sl3_ppi_num, 0xc5),
+	HISI_PMU_EVENT_ATTR(sl0_ddr_read, 0xc9),
+	HISI_PMU_EVENT_ATTR(sl0_ddr_time, 0x89),
+	HISI_PMU_EVENT_ATTR(sl1_ddr_read, 0xca),
+	HISI_PMU_EVENT_ATTR(sl1_ddr_time, 0x8a),
+	HISI_PMU_EVENT_ATTR(sl2_ddr_read, 0xcb),
+	HISI_PMU_EVENT_ATTR(sl2_ddr_time, 0x8b),
+	HISI_PMU_EVENT_ATTR(cycles, 0xcc),
+	NULL
+};
+
+static const struct attribute_group hisi_its_pmu_events_group = {
+	.name = "events",
+	.attrs = hisi_its_pmu_events_attrs,
+};
+
+static const struct attribute_group *hisi_its_pmu_attr_groups[] = {
+	&hisi_its_pmu_format_group,
+	&hisi_its_pmu_events_group,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
+	NULL
+};
+
+static int hisi_its_pmu_dev_init(struct platform_device *pdev,
+				 struct hisi_pmu *pmu)
+{
+	struct hisi_its_pmu_regs *reg_info;
+
+	hisi_uncore_pmu_init_topology(pmu, &pdev->dev);
+
+	if (pmu->topo.scl_id < 0)
+		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get scl-id\n");
+
+	if (pmu->topo.index_id < 0)
+		return dev_err_probe(&pdev->dev, -EINVAL, "failed to get idx-id\n");
+
+	pmu->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pmu->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pmu->base),
+				     "fail to remap io memory\n");
+
+	pmu->dev_info = device_get_match_data(&pdev->dev);
+	if (!pmu->dev_info)
+		return -ENODEV;
+
+	pmu->pmu_events.attr_groups = pmu->dev_info->attr_groups;
+	pmu->counter_bits = pmu->dev_info->counter_bits;
+	pmu->check_event = pmu->dev_info->check_event;
+	pmu->num_counters = ITS_PMU_NR_COUNTERS;
+	pmu->ops = &hisi_uncore_its_ops;
+	pmu->dev = &pdev->dev;
+	pmu->on_cpu = -1;
+
+	reg_info = pmu->dev_info->private;
+	pmu->identifier = readl(pmu->base + reg_info->version);
+
+	/* Reset the global INT_ID filter to disabled. */
+	writel(0, pmu->base + ITS_PMU_INT_ID_CTRL);
+	writel(-1U, pmu->base + ITS_PMU_INT_ID_MASK);
+
+	return 0;
+}
+
+static void hisi_its_pmu_remove_cpuhp_instance(void *hotplug_node)
+{
+	cpuhp_state_remove_instance_nocalls(hisi_uncore_pmu_cpuhp_state,
+					    hotplug_node);
+}
+
+static void hisi_its_pmu_unregister_pmu(void *pmu)
+{
+	perf_pmu_unregister(pmu);
+}
+
+static int hisi_its_pmu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct hisi_pmu *pmu;
+	char *name;
+	int ret;
+
+	pmu = devm_kzalloc(dev, sizeof(*pmu), GFP_KERNEL);
+	if (!pmu)
+		return -ENOMEM;
+
+	/*
+	 * HiSilicon Uncore PMU framework needs to get common hisi_pmu device
+	 * from device's drvdata.
+	 */
+	platform_set_drvdata(pdev, pmu);
+
+	ret = hisi_its_pmu_dev_init(pdev, pmu);
+	if (ret)
+		return ret;
+
+	ret = cpuhp_state_add_instance(hisi_uncore_pmu_cpuhp_state, &pmu->node);
+	if (ret)
+		return dev_err_probe(dev, ret, "Fail to register cpuhp instance\n");
+
+	ret = devm_add_action_or_reset(dev, hisi_its_pmu_remove_cpuhp_instance,
+				       &pmu->node);
+	if (ret)
+		return ret;
+
+	hisi_pmu_init(pmu, THIS_MODULE);
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "hisi_scl%d_its%d",
+			      pmu->topo.scl_id, pmu->topo.index_id);
+	if (!name)
+		return -ENOMEM;
+
+	ret = perf_pmu_register(&pmu->pmu, name, -1);
+	if (ret)
+		return dev_err_probe(dev, ret, "Fail to register PMU\n");
+
+	return devm_add_action_or_reset(dev, hisi_its_pmu_unregister_pmu,
+					&pmu->pmu);
+}
+
+static struct hisi_its_pmu_regs hisi_its_v1_pmu_regs = {
+	.version = ITS_PMU_VERSION,
+	.pmu_ctrl = ITS_PMU_GLOBAL_CTRL,
+	.event_ctrl0 = ITS_PMU_EVENT_CTRL,
+	.event_cntr0 = ITS_PMU_COUNTER0,
+	.cntr_ctrl = ITS_PMU_COUNTER_CTRL,
+};
+
+static const struct hisi_pmu_dev_info hisi_its_v1 = {
+	.attr_groups = hisi_its_pmu_attr_groups,
+	.counter_bits = 48,
+	.check_event = ITS_PMU_EVENT_CTRL_TYPE,
+	.private = &hisi_its_v1_pmu_regs,
+};
+
+static const struct acpi_device_id hisi_its_pmu_ids[] = {
+	{ "HISI0591", (kernel_ulong_t)&hisi_its_v1 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, hisi_its_pmu_ids);
+
+static struct platform_driver hisi_its_pmu_driver = {
+	.driver = {
+		.name = "hisi_its_pmu",
+		.acpi_match_table = hisi_its_pmu_ids,
+		.suppress_bind_attrs = true,
+	},
+	.probe = hisi_its_pmu_probe,
+};
+
+module_platform_driver(hisi_its_pmu_driver);
+
+MODULE_IMPORT_NS("HISI_PMU");
+MODULE_DESCRIPTION("HiSilicon SoC Uncore ITS PMU driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Yushan Wang <wangyushan12@huawei.com>");
-- 
2.33.0

