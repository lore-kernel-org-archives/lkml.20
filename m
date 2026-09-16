Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E473EC813
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541639; cv=none; b=O/weqWzg70NF4unZpQ8/xKl1Q3Y1zzzzGbnccE7sRlkkV07lgM1OdiDfg6b/HtD6G0zL5dlhJgfGfUFzEQ1jLautOrHro3bloqroNayUQ+JVCiqIPCRMmJW86GtXbuC4+lYEDwQ8iN3FaoFYHy4Y/E5Ll/qkRAZOFlS7HjC7w7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541639; c=relaxed/simple;
	bh=eltwt5LbHTw8tHyDar4cwQJHyJlivgtOxZVh6Da41gE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oALZIOyNjnrVeSnUXDoEwXposxOhzsBU8x9hc+CyhE/rwoDYYds/eD5BajTwf9OW2Am8B823NtRBpHOPMbvmtacpMi0ahUyTrdrVQVSR8HkK8y9GLh1un7+uVMPFX0zae5c+DSUxFXOWhYord1BkHs1L2rKvImhUbVA+Uu94/6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=GtYdrR/5; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="GtYdrR/5"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FxsSqI31vw5qztPAOovoi4cnPxVEZcbEkZRBIJrsIog=;
	b=GtYdrR/5Ogm7QDOE62CmmrMVnwsk+4l0LS08bAqUSBb5MSwr6lRNd0+CD6s5RBV/nPCttywTa
	vFvPNQCZaq4sVfLE6qSbh0Uj23jzHgm+GzHmvc0VvAyw3y5mCRFDRvgTfyGM+14XS5B43RpX8mT
	HHF6HVbJpUbMo4LhpJWBXRk=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hl8TG52xCz12LHh;
	Wed, 16 Sep 2026 14:42:42 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id EB2834057D;
	Wed, 16 Sep 2026 14:53:50 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 14:53:49 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<jonathan.cameron@oss.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <u.kleine-koenig@baylibre.com>, <linuxarm@huawei.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH v6 0/3] drivers/perf: hisi: Updates for HiSilicon uncore PMUs
Date: Wed, 16 Sep 2026 14:53:45 +0800
Message-ID: <20260916065348.3957834-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
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

This patchset adds support for the ITS PMU and a new version of MN PMU.

The ITS (Interrupt Translation Service) PMU counts the number and
latency of interrupts routed to the ITS by category (LPI/SGI/PPI), and
collects micro-op statistics for the ITS itself. It supports filtering
counters by a 32-bit interrupt id (int_id).

The new MN PMU version adds a cycles event, used for MN metric
computation.

Changes:

v6:
- Preserve global filter in disable_filter() when there are still
  active counters.
- Updated stale commit log.
Link to v5: https://lore.kernel.org/all/20260909072240.2308808-1-wangyushan12@huawei.com/
Link to Sashiko review report: https://sashiko.dev/#/patchset/20260909072240.2308808-1-wangyushan12%40huawei.com

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
  drivers/perf: hisi: Add cycle event for new MN PMU

Yushan Wang (2):
  drivers/perf: hisi: Consolidate uncore PMU cpuhp states
  drivers/perf: hisi: Add support for uncore ITS PMU

 Documentation/admin-guide/perf/hisi-pmu.rst   |  16 +
 drivers/perf/hisilicon/Makefile               |   2 +-
 drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  |  34 +-
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c |  34 +-
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  |  34 +-
 drivers/perf/hisilicon/hisi_uncore_its_pmu.c  | 385 ++++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  |  21 +-
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c   |  98 +++--
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c  |  35 +-
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   |  34 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.c      |  25 ++
 drivers/perf/hisilicon/hisi_uncore_pmu.h      |   2 +
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c |  34 +-
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c   |  36 +-
 include/linux/cpuhotplug.h                    |   6 -
 15 files changed, 525 insertions(+), 271 deletions(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c

-- 
2.33.0

