Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352130;
	b=IueUsypJgyf82bIVCaCBUFKe1+TWdjblQMgjlqKymv4+CpKHcZR8A1RL2v4mellxFpjf
	 bRAOttvnBjQcASe+PAtibBYosigFsQHUbhHh83jRG+trWL7Rwi2OwIyBSPL/osJfMOCkW
	 8ZUz0MoF+x+foHf93JFzaYYZrExbepQpxwP2HOx6bNVcqg1Rk7otDqTdrC9eGjjbPPjZH
	 1c1HhmWVRQVss3q5L/zQpkfoMiNCsoNftWH4XrzNeg9IN1Jdbe00mRScjj7iS2EK6hYjQ
	 /faRtC9Ez12/jcjma+vBAPU1Ypm21sXz7MQgGrVFUJqdPXR0AlgB7mVpwiW6ubis9AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352130;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZDPkJs/skkAjJj2aTicdtXz8aIFCjTrORnb5MkomVp4=;
	b=MfH6dKRQXShBGecocFnOexu5PCGKih6fOE7dkuvcSmCDDEEVgSdvpBMqJaIDrcyGv8HZ
	 XaMaufgfe7uSTHoGhrnw9+FC9bhmYVhdlac7n6AmaCMrQgeGMXxcFxeIl72R+ZB+qgcHt
	 qtfKq693aMoT7kxR5j+6asCESGxAijj9Y79E47TZzAn6nEXiL7xZsK9LCkkGu8t4ZuWYN
	 6sFYLrMxtxmqSKKx71h5xHH7PHwwiGRTDpP3LKfhjibooCVopIebUXtSrR3jpQ0TfYdZu
	 XEljMR+Q7OvP7F57nqRlP64oFN7L3M5POY9HpUHmfTQMcpom0JPNTck08qgsfogcnTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=FEb+4nEa;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5383606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5383606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=FEb+4nEa
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZDPkJs/skkAjJj2aTicdtXz8aIFCjTrORnb5MkomVp4=;
	b=FEb+4nEay15Lw8EWXPrKN7cxjcJzcUvS5j0FH9+3jvKrpG774M5/5sX97UBCZ3/UFLilcs5GC
	nIHc0dfXYGiP9JKxPlH+w1DPJOwNu3ZrVQg8ocAsRCRNqDDQlsfRyLyLj/8rLLBwhluZ1zSfb8o
	tliwrFtDXyWqZhCPvch6idU=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jGFwr4dccz1prlp;
	Fri, 30 Oct 2026 17:22:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 43B6040537;
	Fri, 30 Oct 2026 17:22:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 17:22:05 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<tan.shaopeng@fujitsu.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/2] fs/resctrl: Fix RMID limbo handling
Date: Fri, 30 Oct 2026 17:21:41 +0800
Message-ID: <20261030092144.1233551-1-ruanjinjie@huawei.com>
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

Fix resctrl RMID allocation to report a retryable -EBUSY only when the
target CLOSID actually has RMIDs in limbo, and split the domain-offline
path out so it releases busy RMIDs without allocating a monitor context
it never uses.

These two fixes are split out of the v10 Narrow-PARTID series below.
        https://lore.kernel.org/all/20261020134239.3921377-1-ruanjinjie@huawei.com/

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

