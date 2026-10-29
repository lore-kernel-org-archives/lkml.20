Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261769;
	b=fGEVGsDsj6gyhEYxjfm6Kn4C53/s9B8Z0aquNLtBQ3z7ySMM1gAt1PtD3r8peyn/5zL+
	 vZ5K6zYV+XWkXlqXOHmFMSRT1NHOd5ygh3wBGlRaXGGW7f73oSHRI+Hy746ZiPP8OIwde
	 KpCHpJKsK6n+U/Fg1EvM4ZpIv9oP8vMIc9o4MRq/zCCSN2xplAaiLGag8+w+YpyCnzfiA
	 MFrXTrJclkCFvmfZda5Ac7rzfm5cZ5Nly1gclyIndjm90mwzBQU4YUJ5rotS/WkrXnayZ
	 T2T8+8yA9U9OVnXHtRMLtQZrtIMQ5nH0PCNIxjtJopRUHADEk+ec24osprXK/DZZLOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261769;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=I733p0p7a0bJ2W1MyGSljwVHaQ2H0zo0nUfBKqt7mzU=;
	b=a+aFmA4Wm5f4avPHHOFT6ykrNbJBcLNyjDzg8nsDo/pX1H1fTT/0lzFmqw7PvD7de+La
	 E77TsXZvq5QYYbocZBN/64P4Hl+x2q0hjOtIWz6i2dZvKp+chOliUKCYXQ9lPEPawxLha
	 j/LYrrJfU5g1ZH51eHUjFl4tSz6Ih/Hd5uA20A4h/S5c4UKL3Q3oizH7nP1GMg0JNvXrz
	 GOuAnATQr1PG7Rf0+Mfbd/llYtWs3qqXY6bWHKVqaqEJblqGrFydRq5dg17oWSTRzooPS
	 7V+r7XhFxR68lrAtxoAPtXx4jB7HVr4qQJpmjUsMPOkyydkIl2/0+zIwPjv9294n0Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fgfmnWsY;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405B4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 405B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fgfmnWsY
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=I733p0p7a0bJ2W1MyGSljwVHaQ2H0zo0nUfBKqt7mzU=;
	b=fgfmnWsYXZxvQnQDiRYM6SwzkzFtXBqykWvsauCUyR0assF0nR8yBn77pMR7H86yAZQvDowQa
	J6J/smeIIVEeKwxBqv1+nVGCO603vVSAPy4Wpw9ebcionblJxT2Svh40/12+V6PfyKTGhcD5tby
	BnxG+4gyqzoE9yRSbGGNEzg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jFcVz0mbdz1prKl;
	Thu, 29 Oct 2026 16:15:55 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C423140537;
	Thu, 29 Oct 2026 16:16:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 16:16:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 0/2] fs/resctrl: Fix RMID limbo handling
Date: Thu, 29 Oct 2026 16:15:11 +0800
Message-ID: <20261029081513.924019-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Fix resctrl RMID allocation to report a retryable -EBUSY
only when the target CLOSID actually has RMIDs in limbo, and split
the domain-offline path out so it releases busy RMIDs without allocating
a monitor context it never uses.

These two fixes are split out of the v10 Narrow-PARTID series below.
	https://lore.kernel.org/all/20261020134239.3921377-1-ruanjinjie@huawei.com/

Jinjie Ruan (2):
  fs/resctrl: Return -EBUSY when per-CLOSID RMIDs are in limbo
  fs/resctrl: Skip monitor context allocation when force-freeing RMIDs

 fs/resctrl/internal.h |  3 +-
 fs/resctrl/monitor.c  | 84 ++++++++++++++++++++++++++++---------------
 fs/resctrl/rdtgroup.c |  2 +-
 3 files changed, 59 insertions(+), 30 deletions(-)

-- 
2.34.1

