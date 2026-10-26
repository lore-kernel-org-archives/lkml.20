Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995124;
	b=G8ZvCU4lQsis6demRCuH1btO5FYj7+X0rMFTFC7GDhxSaNmIG733yduyJqtCSAN3dM/9
	 PGoChHZBKbV0gIv9p28t0sUMq9Y1lV3pWCP31pgrQFIsoSWUuRayZv1YMfQymG3Si1GPN
	 u3drDsGvCe5dBcDhKTvprF27hLxewCHj35iZwiUnIlNN/Dz19iMVbsMhgAVH2+Nf3itfn
	 Df8u0lMz6/zTECXBZn6Y67kLaV4S8GsO7iRUquBCdk9+QvQQchIEtz0y8oUx4URByNc9W
	 /OyZxr0TYdya/J6n9gq+3CwTjbTjS7ShAyPMniWn86YGPCq52LPTiGmlcTgTBpM843A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995124;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=s6C/d8Mw4rVyVW5f/84+Wz49t/JDVEQWsKgzojQV8Bs=;
	b=x/a5EAzEyJ4XqQ7hH6B2zxdwXAXeO9+0Jwl7FlqT3KNrzI48zYpmapEdFEP84A+W1ZfU
	 cu9wxT6coqhutgM3Arg3qS5oy68toplEnodbTyCdx0WHKdNVHn5trO7OohnUkhoUvUNi3
	 pams6Pnak/rAl74sReb+InyW8NjmOjVwStTtshnraUrnetcUTJsbqLzlb3oVspv/lrs4E
	 7Mt/hRXVJfH0PRkYufyATkfBv5BkRBCufuSwccsnyvzjSW07Mh2F77AKgF9vIcFrMtmg3
	 9SQE3Nhuf9wnJ0K0ofWBapQ3l6npzaTUW9K4zYiEFBY7gJZKdAVeuVBiAc5MqGYAfmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=QmWKYVrT;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27729606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27729606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=QmWKYVrT
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=s6C/d8Mw4rVyVW5f/84+Wz49t/JDVEQWsKgzojQV8Bs=;
	b=QmWKYVrTDs/MB5AOAoF0gqzfcxp0y0dNrGWxx6AAJeAxWIJzxH+8L2lE54d1/k6MDEB3NH/u6
	xuJZDUo+dvuQnSI04I6KD/4n1Od1OmFT7+asKfcTiYgefUbkZG2rPcjHvxxL84hbt2vL95dBAcI
	4Kl+N+xpLmvpgBjLAwEdgj4=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jCjvG2DnXzLlSk;
	Mon, 26 Oct 2026 14:11:54 +0800 (CST)
Received: from kwepemk200005.china.huawei.com (unknown [7.202.194.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 7128F40586;
	Mon, 26 Oct 2026 14:11:59 +0800 (CST)
Received: from localhost.huawei.com (10.169.64.31) by
 kwepemk200005.china.huawei.com (7.202.194.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 26 Oct 2026 14:11:58 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <tzimmermann@suse.de>, <dmitry.baryshkov@oss.qualcomm.com>,
	<tiantao6@hisilicon.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <shuliubin@huawei.com>,
	<chenjianmin@huawei.com>, <fengsheng5@huawei.com>, <shiyongbang@huawei.com>,
	<helin52@h-partners.com>, <shenjian15@huawei.com>, <shaojijie@huawei.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH for drm-misc-fixes v4 0/2] Fix some bugs in the hibmc DP
Date: Mon, 26 Oct 2026 14:03:01 +0800
Message-ID: <20261026060303.289737-1-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.43.0
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
 kwepemk200005.china.huawei.com (7.202.194.71)

From: Lin He <helin52@huawei.com>

Fix some bugs in the hibmc DP driver.

---
ChangeLog:
v3 -> v4:
  - Fix the data race on hpd_status between hardirq and process
    contexts with WRITE_ONCE()/READ_ONCE(). (sashiko-bot)
  - Delete the HPD_IN early return in encoder_enable that breaks KMS
    forced modesets. (sashiko-bot)
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
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 32 +++++++++++-------
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  5 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 29 ++++++++--------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 33 ++++++++++++++++++-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  2 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   | 19 +++++++++--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h  |  3 ++
 8 files changed, 92 insertions(+), 32 deletions(-)

-- 
2.33.0

