Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3631A1A2C0B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237876; cv=none; b=fI86z5sV6qak0LYVJnYRYwKoCGBo/JnC3cnP10xRDxjB9ajPjBmq++PGzmxuPvf2hV5T7p8/8Vwofg8Q+lCOhsYGz8rkmkN5Oav+oIgZhaHTv97MjY5G4vZi9rtxDZv88ulmtOw44TkiszxOykBg3aZz2WNNFQG/TnRIGTumVUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237876; c=relaxed/simple;
	bh=PGOK5rrllQ6EPdYdH2FGROUSSSbtZBeTR8aZb9od9Dk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JzIRcX6lBMHYvMn9G6oJFuRKvPIwQbt7yLGD3ufsTI61fNfg54R0iNHHJsLrnpG1wD57oDAdXxhb8l+kaTZKNM0oAZaL3LqWox2EMsqoslB3rylMi4cC3rHEYMmx47fTbq+nnYClCmDSF9t6+sB8XHJKjiH+dzwHMtXoQUacZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=6rX3XB0v; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="6rX3XB0v"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RibabsxW2jvLCKzWFQ7KfrkioP0mi5YTDF7rqHviwfs=;
	b=6rX3XB0v9LSwJfFXv7CZsBd/k9mwH+D0hfb+1BAz1hE8HO1A3er4UImjpVu5sMFTuxrWBtFAf
	TvFpKHtT35EXhZ/8xl4G74p8yzD2XI2PW6BO81rYz1dwrli3pqM/mJTJEy600s9Q1B+TB8pLKXr
	XrAztJOVICFCjdJkISlohCA=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hr5xV42YzzpStW;
	Thu, 24 Sep 2026 16:05:50 +0800 (CST)
Received: from kwepemk200005.china.huawei.com (unknown [7.202.194.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A1E840561;
	Thu, 24 Sep 2026 16:17:50 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemk200005.china.huawei.com (7.202.194.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 24 Sep 2026 16:17:49 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <tzimmermann@suse.de>, <dmitry.baryshkov@oss.qualcomm.com>,
	<tiantao6@hisilicon.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <shuliubin@huawei.com>,
	<chenjianmin@huawei.com>, <fengsheng5@huawei.com>, <shiyongbang@huawei.com>,
	<helin52@h-partners.com>, <shenjian15@huawei.com>, <shaojijie@huawei.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH for drm-misc-fixes v3 0/2] Fix some bugs in the hibmc DP
Date: Thu, 24 Sep 2026 16:06:07 +0800
Message-ID: <20260924080609.3681795-1-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200005.china.huawei.com (7.202.194.71)

From: Lin He <helin52@huawei.com>

Fix some bugs in the hibmc DP driver.

---
ChangeLog:
v2 -> v3:
  - Delete irq_status and use hpd_status directly for hotplug
    detection. (sashiko-bot)
  - Add debug logs when hpd_status is not HPD_IN in detect and
    encoder_enable.
  - Move hibmc_set_enable_flag() before drm_dev_register() and
    hibmc_set_disable_flag() after drm_dev_unregister() to narrow the
    race window. (sashiko-bot)
  - Add spinlock_t gpio_lock to hibmc_drm_private to protect all
    operations on 0x0802A4. (sashiko-bot)
v1 -> v2:
  - More states in HIBMC_DP_HPD_STATUS are added to the
    'hibmc_dp_get_hpd_status'.
  - The call to `hibmc_set_enable_flag()` has been moved before
    `drm_client_setup()`, specifically before the connector detection
    triggers the I2C bit operation. (sashiko-bot)
  - A read-modify-write operation has been implemented instead of directly
    writing to prevent clearing the I2C mask bits. (sashiko-bot)
---

Lin He (2):
  drm/hisilicon/hibmc: Modify the method of obtaining the hpd_status
  drm/hisilicon/hibmc: Add a flag to indicate whether the OS-side driver
    has been loaded

 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  1 -
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 32 +++++++++++------
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  5 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 34 +++++++++++--------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 32 ++++++++++++++++-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  2 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   | 19 +++++++++--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h  |  3 ++
 8 files changed, 96 insertions(+), 32 deletions(-)

-- 
2.43.0

