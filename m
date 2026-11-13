Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558927;
	b=zISRYiNaeXxEIJ6j1rOct5ZBGFSLY1SCW7QMGDuzMuYxIOBqQf9OJooI3JZWl7y90bqZ
	 E5f2fKs9O3YtIkuIit6s8vrgL8bzk9kPN409GEH8Wyfd7zc68lzn8bw2ju5gzeE0j95uV
	 4JMOwC4NXjSa/bekcQgLtP7Gi7sXB1wH7bEFxevyyRor+bR3e8brKfMpciWReb6ZGL/vT
	 4oSUHr8+A6zT8My4iM6xygMkx2gYhWxmt6AJ4kTOKEY5Gu4uTRWVoyQk5nB+Jf+boPAg1
	 XIe09i+JokdHJqV1Iz0VjCT4WxSwouKP570ghFjUu+ZdExJtDDDH4TZU6JcDLZ1XtmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558927;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=P041H6z1vzHatZCrDx9Oq3C51UiEWBIWHceYiGp/3Yo=;
	b=PvupLEuET4SBttx2PRujDfMz1Z2DxWTf03SElXkmXKHWxgJrrnpddVGWy0urt4cu0NuD
	 9BeLwYhBoafzdRGvBljyREoggVshXiRfBQW/hPjw2FigfuRvQm9OzH9QOKmUnvFwRUYr2
	 zOZlZ50ql9thJDj8Eir+w0HJZ7DOC1R8Lf7aA92jjBKdS3tAoaP+22qjXS2aUQTMCAjd5
	 prmynZQ4EO6PvRDibKUuPi4jyzEhJY6sdJjoabpXMlMM1RVMnC9DY6vusUpJwdW29VhD7
	 hXtNbJ4cMKa/fqo8u54bXRiNBTuX3KlvlPdxG47irbQhwFC8dTx95aEeUu6x8IMzLYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PmajVDeD;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556DC606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556DC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PmajVDeD
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=P041H6z1vzHatZCrDx9Oq3C51UiEWBIWHceYiGp/3Yo=;
	b=PmajVDeDmzyjLDIgPuLZlhfihSY4EZlzpBr00bO9xeepo6A+cePsGPqsS/lsPSy2amQ9VyAYY
	WaWcspIfdqd8IBRhV+mACUgy/7yYG7RC7CQRd/goL6HJ4dXcWZ9jE263Cldg1O7mqo7uwvEp8u7
	BkVboGZogokjSG4NI41z2XQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jQrDG3T94z1prR6;
	Fri, 13 Nov 2026 16:35:10 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6091A40575;
	Fri, 13 Nov 2026 16:35:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 16:35:19 +0800
From: tizi4590 <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <will@kernel.org>, <jic23@kernel.org>,
	<gshan@redhat.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/2]  fs/resctrl: Fix two counter ID bugs.
Date: Fri, 13 Nov 2026 16:35:04 +0800
Message-ID: <20261113083506.4129060-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Use the domain's counter ID for arm mpam driver, and give a monitor
domain the counters the groups already use

Changes in v2:
- Fix the mpam bug in mpam_resctrl.c.
- Link to v1: https://lore.kernel.org/all/20261106094537.2337188-1-ruanjinjie@huawei.com/

Jinjie Ruan (2):
  arm_mpam: resctrl: Use the domain's counter ID
  fs/resctrl: Give a monitor domain the counters the groups already use

 drivers/resctrl/mpam_internal.h |  15 ---
 drivers/resctrl/mpam_resctrl.c  | 195 ++++++++++++--------------------
 fs/resctrl/internal.h           |   2 +
 fs/resctrl/monitor.c            | 121 +++++++++++++++++++-
 fs/resctrl/rdtgroup.c           |   4 +
 5 files changed, 196 insertions(+), 141 deletions(-)

-- 
2.34.1

