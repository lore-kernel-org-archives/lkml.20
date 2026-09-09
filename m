Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85665443E5D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938570; cv=none; b=HJxqjPnHqQY90OKNljCp4+IsgsEbRu/aldr0YFOu6ci0vdKu11J0IA1XUI1n0LcG2BdEu9TxPlR/cD4mMYzdppzcXiEPYX9NfJ8RCzeksorezsLjmjmrp916dH0mMHGg9SORpn0yqBY56n1AK2zwfgLYMN42w00CCLQm3lPRZmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938570; c=relaxed/simple;
	bh=JvIGx+uKS37B7icwaZZHOCccNXkTewUR5Tq7jtCdjtE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WT54GDBXyGcFEk2ytAiLSBxTe+mnGroPvrkmcuMstL4Y6Fw8R2F39eiXIuFIWbpE1/Br44CpkvC5AWIKqxeoFapvmpJklXZURED98VFF6cBIk7TawIkg5XqqcxqNJhuFiZZD0WRSfNTSULzuPdK3MSkoeHhGJzHHJf+tiINnCgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=lhvwHOI9; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="lhvwHOI9"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fUYca7abhZpRRXyQpq5f0A4w+RCfpQDFro+1XnmDa3U=;
	b=lhvwHOI9jghIPBpJvn28k9KSMrl3jtx22BNrianbg9D30D0a9FMCOqX3fOdKmM/ZBEMkDh7nf
	HNnSGc+5PzEWe1+vHFn/axR/vzjEgCjLeruKYQVvpsKnvOKDRMYmU135wq2/qYQDRDt1HyMIduv
	oyi48oWhX/8L8zXfikvWKs4=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hfsRM2fFKz1T4LY;
	Wed,  9 Sep 2026 15:11:11 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id BC78440537;
	Wed,  9 Sep 2026 15:22:42 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 15:22:41 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <u.kleine-koenig@baylibre.com>, <linuxarm@huawei.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH v5 0/3] drivers/perf: hisi: Updates for HiSilicon uncore PMUs
Date: Wed, 9 Sep 2026 15:22:37 +0800
Message-ID: <20260909072240.2308808-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo500002.china.huawei.com (7.152.185.250)

This patchset adds support for the ITS PMU and a new version of MN PMU.

The ITS (Interrupt Translation Service) PMU counts the number and
latency of interrupts routed to the ITS by category (LPI/SGI/PPI), and
collects micro-op statistics for the ITS itself. It supports filtering
counters by a 32-bit interrupt id (int_id).

The new MN PMU version (HIP13) adds a cycles event, used for MN metric
computation.

Changes:

v5:
- Reworked the ITS PMU global INT_ID filter handling per Sashiko review.
  Implement a get_event_idx() override that returns -EAGAIN when a
  newcomer disagrees with the currently-scheduled events on the filter,
  so perf time-multiplexes them instead of running them together.
- Reset the global INT_ID filter to disabled at probe, so unfiltered
  events do not inherit a stale filter left by prior state.
- Dropped the now-unused struct hisi_its_pmu wrapper, filter_lock and
  event->destroy callback.
Link to v4: https://lore.kernel.org/all/20260724025238.3411328-1-wangyushan12@huawei.com/
Link to Sashiko review report: https://sashiko.dev/#/patchset/20260724025238.3411328-1-wangyushan12%40huawei.com

v4:
- Moved unnecessary cpuhp states for each PMU drivers to hisi_uncore_pmu
  framework as suggested by Robin.
Link to v3: https://lore.kernel.org/all/20260713125647.2958626-1-wangyushan12@huawei.com/
Link to Sashiko review report: https://sashiko.dev/#/patchset/20260713125647.2958626-1-wangyushan12%40huawei.com

v3:
- Added check_filter callback to refuse new filtered events when there
  are already filtered ones running as per Sashiko.
Link to v2: https://lore.kernel.org/all/20260612093812.1249049-1-wangyushan12@huawei.com/
Link to Sashiko review report: https://sashiko.dev/#/message/20260612093812.1249049-1-wangyushan12%40huawei.com

v2:
- Added int_en filter to tell if int_id is used, enabling filtering
  interrupt with 0 int_id per Sashiko.
- Changed event format width to align with register width per Sashiko.
Link to v1: https://lore.kernel.org/all/20260423152959.1458563-1-wangyushan12@huawei.com/
Link to Sashiko review report: https://sashiko.dev/#/patchset/20260423152959.1458563-1-wangyushan12%40huawei.com

Yifan Wu (1):
  drivers/perf: hisi: Add cycle event for HIP13 MN PMU

Yushan Wang (2):
  drivers/perf: hisi: Consolidate uncore PMU cpuhp states
  drivers/perf: hisi: Add support for uncore ITS PMU

 Documentation/admin-guide/perf/hisi-pmu.rst   |  16 +
 drivers/perf/hisilicon/Makefile               |   2 +-
 drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  |  34 +-
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c |  34 +-
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  |  34 +-
 drivers/perf/hisilicon/hisi_uncore_its_pmu.c  | 379 ++++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  |  21 +-
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c   |  98 +++--
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c  |  35 +-
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   |  34 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.c      |  25 ++
 drivers/perf/hisilicon/hisi_uncore_pmu.h      |   2 +
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c |  34 +-
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c   |  36 +-
 include/linux/cpuhotplug.h                    |   6 -
 15 files changed, 519 insertions(+), 271 deletions(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c

-- 
2.33.0

