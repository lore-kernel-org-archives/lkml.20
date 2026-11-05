Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862602;
	b=Ih3/Vet7etoIDNGgox648We/tjdn8lKKgeesfNMaxARAHCzk5hiJ3WmV4gPVLBGoCyQX
	 Lx+891eygAGSOZfip4H41v5WSt5jwRnM6CCHhvbvG6wY+u3eMf2QB+RP0iD6t6/S2Kvp1
	 PCHTN1a9wuSWzhjP3V+lsMjcLoeOhJ8M2OKMhUe204COc+b3CsW1Kim4KQiMql4ot1oIE
	 R0Bq0wF+MjLxqHfGsQ++nuHgQ5XCmfiNgCKIwSchMbTPeTUYnTha4JYjFriU6DbA5Bp/U
	 Qoj0VTNlB5z97jD70xIvVSq1sMfSf6OkVsTzuq8NQfnN5Yp/w5Wy7RGmQlGM04JfI5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862602;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=TFkSb1AmlhR7ma1WDvpIqz0vVLtG80NEeudpCHZwJiA=;
	b=eb0Wfvz41J7dYIPv+3h1x8Nmsf/o5F2dNwePqCHgRX7bcmRauup2TniWUvTjn/hoRq46
	 35xAhDfjv9FpiPir15S4yVi9H/5IQFAHJdtNfL2lKRmfArV+zP5NjfyDza2Pz6rjdhUDg
	 9Zusxc4LGWwSKNh2J6IWL6LenR3gwuuSLZlhOv69GBkyLTve2RyxpZyPY7PqIX3IUL5dr
	 nudcbNgWcvogYyWcyEViWC00J363Hi0NX+6WsnElfXk7E2BaaN71Q0+lDDUawWW546d9E
	 vJE1v8MJGl70148N83vzKVzYZQnupJSsUPIthnUE1ifrIoxgPfSubyJQljXjYv6UnXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=QNK3DUWy;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F29606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11F29606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=QNK3DUWy
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=TFkSb1AmlhR7ma1WDvpIqz0vVLtG80NEeudpCHZwJiA=;
	b=QNK3DUWy/p18SIrYxBo9iKXifTK23w1i0OGIxiNFRYMeBCu7zHCoXpBi+1NVCWTUVLPHhxfXg
	wDp9gpWy2wEIzIh4B63kBaFKmonAqC9w6napwsqw1Hfb+tdWBMmZcClmP8lrtzFbBRDG/9Yg0kF
	YbFHk+hTHA86Ba6hmn+2ez0=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jKtjC50ndz1T4Fq;
	Thu,  5 Nov 2026 15:09:35 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id AC6A940561;
	Thu,  5 Nov 2026 15:09:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:09:56 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<jic23@kernel.org>, <ben.horgan@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 0/3] fs/resctrl: Fix RMID limbo handling
Date: Thu, 5 Nov 2026 15:09:31 +0800
Message-ID: <20261105070934.2258613-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Fix resctrl RMID allocation to report a retryable -EBUSY only when
the target CLOSID actually has RMIDs in limbo.

Split the domain-offline path out so it releases busy RMIDs without
allocating a monitor context it never uses.

Also unmount resctrl with the CDP state it was mounted with to fix
another bug with mpam cdp.

These fixes are split out of the v10 Narrow-PARTID series below.
        https://lore.kernel.org/all/20261020134239.3921377-1-ruanjinjie@huawei.com/

Changes in v4:
- Fix the unmount resctrl bug as Reinette suggested.
- Adjust the commit message.
- Add Reviewed-bys.
- Link to v3:
  - https://lore.kernel.org/all/20261031063634.1678345-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/

Changes in v3:
- Add Reviewed-by.
- Local varibles uses reverse Christmas tree style.
- Update the commit message as Reinette suggested.
- Link to v2: https://lore.kernel.org/all/20261030092144.1233551-1-ruanjinjie@huawei.com/

Changes in v2
- Update the commit message as Reinette suggested.
- Link to v1: https://lore.kernel.org/all/20261029081513.924019-1-ruanjinjie@huawei.com/

Jinjie Ruan (3):
  fs/resctrl: Report a temporary RMID shortage per CLOSID
  fs/resctrl: Do not allocate a monitor context when releasing limbo
    RMIDs
  fs/resctrl: Unmount resctrl with the CDP state it was mounted with

 fs/resctrl/internal.h |   3 +-
 fs/resctrl/monitor.c  | 158 ++++++++++++++++++++++++++++++++----------
 fs/resctrl/rdtgroup.c |   9 ++-
 3 files changed, 130 insertions(+), 40 deletions(-)

-- 
2.34.1

