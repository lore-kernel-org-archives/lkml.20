Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859411;
	b=0RLej7wluEl5aotk/3J9LGDSn3wMXgto68lVZJF68FlzJIYU3Z6bk+kz/ADq3EfayBFG
	 L0h7Inn3huaPS9mqQG8HmXjCSfJtlNS7dLFLvQbGNCXF1H4dkypvcMEaeTfQM3ZTJrJra
	 glMN8Gh7r4xI0Ma3hDsuptZs2TqjYigMs17Tj84qnPdMZETLFPHEcPByLJgzF7AqkCkOC
	 gCk5lcbJZRrTvXhe5lMiyiA16Dw86XZd3OLnYHyzu0N1PTpuoqBKzI+16fF5NTB2Gw8hL
	 TRmdCvjZoTTZuJXHwoO+fPwIQBjZxWDzDxLUD3KB5ltznv3KlhqSjjQI9qvdQacaQeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859411;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=Rtuq9eSTDy/EBy0lRw7H0h+4JxLcQbJ+OtXDpRKLhhI=;
	b=MCC9qVtOZSffWmKLREQYSHhK2hJmaqGE0rxGsh4sYPjCuFkZETdOKrxGsl1H7Q2jJ769
	 F1/L0TKafxe4+yF2GvflE/kkOFILBzVR0xc9dnON4T0EriiBc2OI7XWyWqRC8X7RwcZrc
	 vCXtSVMm+g3wWhJV5Gkwbk3EhDIoISAG8A2LBRuaNDimzOAEwswSDuAQVtseZlCn/gMxA
	 G2xxhOrRE/rYE/YY6r0JCElmKL5ih37S61AA4emwz9gWxm60WCXSclDb3yHQNP76MukEq
	 CsBGqozBib2RxRSMUQuAbraQaVzVIJxANdM406wKDH6xo64G44U85jQkG+bkEKIHNyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dNGhja+E;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49A606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F49A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dNGhja+E
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Rtuq9eSTDy/EBy0lRw7H0h+4JxLcQbJ+OtXDpRKLhhI=;
	b=dNGhja+EtM5cwz6s8FD6mSOExzYYzOR1KF93AH6qAvt9A0sA4W/ORTRvu1FhiOUvrNpAoGHBt
	LiMjB7UDYQI6iiFQ9fHhwB95+FQb1YHLrbr2vPlbo/5tfaoqiTHduRFT9ViH22Y3gy/tnW0H3f6
	yW/Pv66j2lCzyDgXsL6HQS8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jKsWp41nbz1T4Fq;
	Thu,  5 Nov 2026 14:16:22 +0800 (CST)
Received: from kwepemk300016.china.huawei.com (unknown [7.202.195.98])
	by mail.maildlp.com (Postfix) with ESMTPS id 7633640561;
	Thu,  5 Nov 2026 14:16:43 +0800 (CST)
Received: from huawei.com (10.67.174.191) by kwepemk300016.china.huawei.com
 (7.202.195.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:16:42 +0800
From: Zhang Qiao <zhangqiao22@huawei.com>
To: <sched-ext@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <tj@kernel.org>, <void@manifault.com>,
	<arighi@nvidia.com>, <changwoo@igalia.com>, <tanghui22@huawei.com>,
	<zhangqiao22@huawei.com>
Subject: [PATCH 0/4] sched_ext: Decompose scx_cid_init()
Date: Thu, 5 Nov 2026 14:50:09 +0800
Message-ID: <20261105065013.784398-1-zhangqiao22@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk300016.china.huawei.com (7.202.195.98)

scx_cid_init() grew into a ~230-line monolith interleaving table
allocation, the node/LLC/cluster/core topology walk, the no-topo tail
and the shard range finalization. This series decomposes it into stage
helpers sharing a file-private builder struct, in four individually
compilable steps:

  01/04 extract the no-topo tail and the table finalization
  02/04 collect the construction state in scx_cid_builder
  03/04 extract the construction of a single LLC cid range
  04/04 extract the online (node-level) walk

No behavior change: WARN checks, error paths, shard policy and
publication timing are all preserved. This is preparation for
follow-up fixes to the partial-SMT core counting in
calc_shard_layout() and the single-core shard hard-cap corner case,
which are deliberately kept out to keep this series a pure code
motion.

Based on tj/sched_ext for-7.5.

Signed-off-by: Zhang Qiao <zhangqiao22@huawei.com>

Zhang Qiao (4):
  sched_ext: Extract no-topology CID construction and table finalization
  sched_ext: Collect CID construction state in a private builder
  sched_ext: Extract construction of a single LLC CID range
  sched_ext: Extract online CID construction from scx_cid_init

 kernel/sched/ext/cid.c | 422 +++++++++++++++++++++++------------------
 1 file changed, 241 insertions(+), 181 deletions(-)


base-commit: beb427129cbdd0154cdb017a694779963e46b520
-- 
2.43.0

