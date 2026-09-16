Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBBF3ED3CF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541640; cv=none; b=QmGelZUti1ZkukZghLXrHoTv15VZu+cAZ2kfq2VFbj1ONhKK3gqg4svEq3IIW1NwtpO1J/0eZ2fM3d1nHRim97dftL+0lgA9bTXqMmh7CPEwUNQAdgVWpF2Dw6Zl9HtzyMCiJsRDY9MkkKJcAu9z8LHqyECj7VKOo7qj21PeOnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541640; c=relaxed/simple;
	bh=D8f0wV/O85KcvIj1PCs69VRQRSBjTsktFfZyq7l0rw0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qWr3fyVNBGEGQAFpxf4guiWOA5kiZumugSyFHSATj3UHXGoOVfy7fTmz75sy0pwHKtepGoi5gfvhrJ2e7NMAcMW3SfL+M24JppiFwI8civmW8I/yZZ4KPXWVtfnKMjifAv+WfF/ouxHjRt5HNGIbWJFJ90ARx/J3OhMCo4zhX2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=HVgQ1OLw; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="HVgQ1OLw"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SozDZ6x9armJ/32Oy5om2a8Pqp3TR4ddT2t8jGKTsHE=;
	b=HVgQ1OLwcc4HhIdtZ90hoFF34MuP4/fV4iZHJZQ4Xq2P/peOLCUBKxlm5P5WwAjjhjSwO/FX2
	Jh2LyoODKZcykQrokXTmPzYU4Zc8dXWKwf9cFQG6PvkT6pjPLCEqnEIvVVP5hW3JK8pkFLJ3que
	MFSOG4p5yPJHutX0XXR2wVU=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hl8TW10NGzmVCK;
	Wed, 16 Sep 2026 14:42:55 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id DC60140578;
	Wed, 16 Sep 2026 14:53:53 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 14:53:52 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<jonathan.cameron@oss.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <u.kleine-koenig@baylibre.com>, <linuxarm@huawei.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH v6 3/3] drivers/perf: hisi: Add cycle event for new MN PMU
Date: Wed, 16 Sep 2026 14:53:48 +0800
Message-ID: <20260916065348.3957834-4-wangyushan12@huawei.com>
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

From: Yifan Wu <wuyifan50@huawei.com>

The HiSilicon new MN (Miscellaneous Node) PMU exposes a cycle event in
addition to the existing event set. Add a v2 event list that includes
the cycles event (0x0F) and a new hisi_mn_v2 dev_info matched by the new
ACPI id HISI0224.

Rename the existing event list, attribute group and attr_groups array
to *_v1 so the two MN PMU versions can coexist.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c | 63 ++++++++++++++++++---
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c b/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
index ad898153ff49..1ded8a6b2358 100644
--- a/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
@@ -188,7 +188,7 @@ static const struct attribute_group hisi_mn_pmu_format_group = {
 	.attrs = hisi_mn_pmu_format_attr,
 };
 
-static struct attribute *hisi_mn_pmu_events_attr[] = {
+static struct attribute *hisi_mn_pmu_events_attr_v1[] = {
 	HISI_PMU_EVENT_ATTR(req_eobarrier_num,		0x00),
 	HISI_PMU_EVENT_ATTR(req_ecbarrier_num,		0x01),
 	HISI_PMU_EVENT_ATTR(req_dvmop_num,		0x02),
@@ -215,14 +215,55 @@ static struct attribute *hisi_mn_pmu_events_attr[] = {
 	NULL
 };
 
-static const struct attribute_group hisi_mn_pmu_events_group = {
+static const struct attribute_group hisi_mn_pmu_events_group_v1 = {
 	.name = "events",
-	.attrs = hisi_mn_pmu_events_attr,
+	.attrs = hisi_mn_pmu_events_attr_v1,
 };
 
-static const struct attribute_group *hisi_mn_pmu_attr_groups[] = {
+static const struct attribute_group *hisi_mn_pmu_attr_groups_v1[] = {
 	&hisi_mn_pmu_format_group,
-	&hisi_mn_pmu_events_group,
+	&hisi_mn_pmu_events_group_v1,
+	&hisi_pmu_cpumask_attr_group,
+	&hisi_pmu_identifier_group,
+	NULL
+};
+
+static struct attribute *hisi_mn_pmu_events_attr_v2[] = {
+	HISI_PMU_EVENT_ATTR(req_eobarrier_num,		0x00),
+	HISI_PMU_EVENT_ATTR(req_ecbarrier_num,		0x01),
+	HISI_PMU_EVENT_ATTR(req_dvmop_num,		0x02),
+	HISI_PMU_EVENT_ATTR(req_dvmsync_num,		0x03),
+	HISI_PMU_EVENT_ATTR(req_retry_num,		0x04),
+	HISI_PMU_EVENT_ATTR(req_writenosnp_num,		0x05),
+	HISI_PMU_EVENT_ATTR(req_readnosnp_num,		0x06),
+	HISI_PMU_EVENT_ATTR(snp_dvm_num,		0x07),
+	HISI_PMU_EVENT_ATTR(snp_dvmsync_num,		0x08),
+	HISI_PMU_EVENT_ATTR(l3t_req_dvm_num,		0x09),
+	HISI_PMU_EVENT_ATTR(l3t_req_dvmsync_num,	0x0A),
+	HISI_PMU_EVENT_ATTR(mn_req_dvm_num,		0x0B),
+	HISI_PMU_EVENT_ATTR(mn_req_dvmsync_num,		0x0C),
+	HISI_PMU_EVENT_ATTR(pa_req_dvm_num,		0x0D),
+	HISI_PMU_EVENT_ATTR(pa_req_dvmsync_num,		0x0E),
+	HISI_PMU_EVENT_ATTR(cycles,					0x0F),
+	HISI_PMU_EVENT_ATTR(snp_dvm_latency,		0x80),
+	HISI_PMU_EVENT_ATTR(snp_dvmsync_latency,	0x81),
+	HISI_PMU_EVENT_ATTR(l3t_req_dvm_latency,	0x82),
+	HISI_PMU_EVENT_ATTR(l3t_req_dvmsync_latency,	0x83),
+	HISI_PMU_EVENT_ATTR(mn_req_dvm_latency,		0x84),
+	HISI_PMU_EVENT_ATTR(mn_req_dvmsync_latency,	0x85),
+	HISI_PMU_EVENT_ATTR(pa_req_dvm_latency,		0x86),
+	HISI_PMU_EVENT_ATTR(pa_req_dvmsync_latency,	0x87),
+	NULL
+};
+
+static const struct attribute_group hisi_mn_pmu_events_group_v2 = {
+	.name = "events",
+	.attrs = hisi_mn_pmu_events_attr_v2,
+};
+
+static const struct attribute_group *hisi_mn_pmu_attr_groups_v2[] = {
+	&hisi_mn_pmu_format_group,
+	&hisi_mn_pmu_events_group_v2,
 	&hisi_pmu_cpumask_attr_group,
 	&hisi_pmu_identifier_group,
 	NULL
@@ -347,14 +388,22 @@ static struct hisi_mn_pmu_regs hisi_mn_v1_pmu_regs = {
 };
 
 static const struct hisi_pmu_dev_info hisi_mn_v1 = {
-	.attr_groups = hisi_mn_pmu_attr_groups,
+	.attr_groups = hisi_mn_pmu_attr_groups_v1,
+	.counter_bits = 48,
+	.check_event = HISI_MN_EVTYPE_MASK,
+	.private = &hisi_mn_v1_pmu_regs,
+};
+
+static const struct hisi_pmu_dev_info hisi_mn_v2 = {
+	.attr_groups = hisi_mn_pmu_attr_groups_v2,
 	.counter_bits = 48,
 	.check_event = HISI_MN_EVTYPE_MASK,
 	.private = &hisi_mn_v1_pmu_regs,
 };
 
 static const struct acpi_device_id hisi_mn_pmu_acpi_match[] = {
-	{ "HISI0222", (kernel_ulong_t) &hisi_mn_v1 },
+	{ "HISI0222", (kernel_ulong_t)&hisi_mn_v1 },
+	{ "HISI0224", (kernel_ulong_t)&hisi_mn_v2 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hisi_mn_pmu_acpi_match);
-- 
2.33.0

