Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793428631;
	b=SnnBu3qRE/hBLEB0Me9JKqyIlOPQUZvVP4JR+JigQlnszBJuoo+gtvy0b0iAlSGVfQ6w
	 ddHlvj/VOFpoGEE4MlrMlGvWW6r3wYBHSJThvGvgkBqxue5xOczeb3s0G70gqFv7ybRIx
	 aY2VThL3rbDoD9MjHOLkc+gnwGakJvXBw8sqSdQ2GVbi70WleT5nAiKDdWTwwm/mjeLwf
	 Lvy0dJ2yw3DHVW0c4Rn9cDePBcICgUPvwV+ZY5WP/oFQYttRtMFbJSQKTDJGduTDAzGWR
	 Zc7IXaXoXiIqG0y9+4ES7o8C+79HG3FNM7j7tO3Bg7E5LMr/v3YzRY/ifFuw5Y4JIYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793428631;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=LN9bgOGk8oKGPNyAS3E4/iF/kMh5XZyM4j/meiW41yw=;
	b=J8p4Aur8ThRRGJektHc9PNEnR91qHEASBIWfDG5rVLFMg4EMQg9tbAstkIyO7aDuqhwP
	 6zvWAma+US5U0GesPAg+j1CeWmPlUEih3Id80QvJOVyUKgLMmDZhYUCE90lTOEH7dYPlf
	 HvA3iNYe1iCwPIFNqGlgoTsafCWru4G+mHZ8guyQ7nfcxWtHuoGEwaoYHVfLrey5hY1ot
	 dvgnzbKQQV8B8Cou232Yxa47QQDD8aPtGRnI4xQK0y01i/H6atq4wxzHkOWfOGu07LM9f
	 cay16roRN2nNPgEZTZJF2d4iMY6dIYP51gVzvlY/AS4yHt5q7VG6JRlrQ/LyH3fDCnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=w1kNXyUu;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A93606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=w1kNXyUu
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LN9bgOGk8oKGPNyAS3E4/iF/kMh5XZyM4j/meiW41yw=;
	b=w1kNXyUu7vT46dxuLQmkQ06Ae18ov53hO4j+fuPO74sQTtcIvf0lb+knlumRofp6msdCRyMB4
	3TKcewRaecOMVfxi9q/boBq2tphD4MEexBqOA/d8uiSGPAyPuAMNM63Z2Xg1IgrVMKQhCfpTZka
	MTg15Sx/4x8d3Pn3952LrFM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jGpCw1W6rzRhQT;
	Sat, 31 Oct 2026 14:37:00 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 01CC240537;
	Sat, 31 Oct 2026 14:37:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 14:37:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 0/2] fs/resctrl: Fix RMID limbo handling
Date: Sat, 31 Oct 2026 14:36:32 +0800
Message-ID: <20261031063634.1678345-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Fix resctrl RMID allocation to report a retryable -EBUSY only when the
target CLOSID actually has RMIDs in limbo, and split the domain-offline
path out so it releases busy RMIDs without allocating a monitor context
it never uses.

These two fixes are split out of the v10 Narrow-PARTID series below.
        https://lore.kernel.org/all/20261020134239.3921377-1-ruanjinjie@huawei.com/

Changes in v3:
- Add Reviewed-by.
- Local varibles uses reverse Christmas tree style.
- Update the commit message as Reinette suggested.
- Link to v2: https://lore.kernel.org/all/20261030092144.1233551-1-ruanjinjie@huawei.com/

Changes in v2
- Update the commit message as Reinette suggested.
- Link to v1: https://lore.kernel.org/all/20261029081513.924019-1-ruanjinjie@huawei.com/

Jinjie Ruan (2):
  fs/resctrl: Report a temporary RMID shortage per CLOSID
  fs/resctrl: Do not allocate a monitor context when releasing limbo
    RMIDs

 fs/resctrl/internal.h |  2 +-
 fs/resctrl/monitor.c  | 87 ++++++++++++++++++++++++++++---------------
 fs/resctrl/rdtgroup.c |  2 +-
 3 files changed, 60 insertions(+), 31 deletions(-)

-- 
2.34.1

