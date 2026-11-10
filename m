Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318011;
	b=JhNKLaQg0bgsCgtz3BEEOzFYXVfLMmqGzacCQwqjhlgNY/ifDzgMQNYTu0rpS0D1NER9
	 pm6c334DggislDa3JIOv8KZB24AZQdmorBaNfZ8xpTR9FwvuO+lmAqIwS5Yji5SV/Rcv/
	 0mumIdibyo9IRIqyhSfoum/sVvW+jAk22gcXxIBbwi/rMmNWce9//wGcTGj98tOO1BUWa
	 VEzvYh3NU/w0CCfL0CI305017cMRP7vvxhSb8zCmqoWG3BH6BphWMf1dbx0Slp0q0vMQR
	 pTTbdUt5Zq7IYbTX5GBzkPUBGAHJAcKqSmEX3t8ixPqIBd2qQ0TmWeTO5Q/ink8ZtKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318011;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=FOJpZUK9FD4frlf0LeV5+AuW06zPoHDaDEEFNeMGVDM=;
	b=w34WcaA8zaYnRrAUPrScE9/4QMWnenLwW2FnRvx4Xw/nb2mwKWFSj0zUZFtW27tgo5hZ
	 l1Qk+bLB7N6VnSLeeN3tEXfbBbYUxFW2oBy4BRnkMKtLeQlY7xrn4ZUZ6rfZqwsVdeKuL
	 WUMyD6pbtFgrxPup3j+3YdnhNPz5Fh6wVb5t1ZBpfjDY7uBt8eVBn7AYrdkxZeYZME50v
	 CIUzv604kSB2ngcpYWu+Bw7+7xWaPL7B8q0dxgcounZ8ZlL7CDUx2JnNUO3RUtpbhRe08
	 cDAer/Tlj9G7fRxELVN7+bFvOMxAnCtMTvd26vLMaNLLCuTJL8yA4XDI4YfDulfQqgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LDbyEurT;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5550606A7D9;
	Tue, 10 Nov 2026 13:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5550606A7D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LDbyEurT
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FOJpZUK9FD4frlf0LeV5+AuW06zPoHDaDEEFNeMGVDM=;
	b=LDbyEurTkHgdKwaTLveY2ZBvF4O/HS70H2ysF68eEWFzFfMPoRGKhHePqdEsrrF+ql2eH7xcx
	kL7Ujmr3tgaMShU9j4Qcz8CQmt08m52ztQQd9iVWfept0R9zYEsTROq+rR1T57PpGOfylnotdPs
	NPlUW31RSNiCvqoSOXLSMOs=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jP76x57Cpz1T4Gw;
	Tue, 10 Nov 2026 21:39:37 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3FEEE4056E;
	Tue, 10 Nov 2026 21:40:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:40:05 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <will@kernel.org>, <gshan@redhat.com>,
	<zengheng4@huawei.com>, <jic23@kernel.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 RESEND 6/7] fs/resctrl: Disallow monitor group move when the RMID index changes
Date: Tue, 10 Nov 2026 21:39:37 +0800
Message-ID: <20261110133938.3768632-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110133938.3768632-1-ruanjinjie@huawei.com>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
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

From: Peter Newman <peternewman@google.com>

A MON group can be moved into the mon_groups directory of another
CTRL_MON group to move its tasks to that group's allocation while
keeping their monitoring data. Where the RMID is only meaningful
together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
extends the PARTID, the move changes the RMID index of the group. The
move succeeds, but:

- The group's monitoring data is reset. Its counters are identified by
  the CLOSID and RMID together, so after the move the group reads the
  counters of the new CLOSID instead of the ones its tasks used.

- The group uses an RMID index that was never allocated to it. When
  the group is removed, free_rmid() puts an RMID index of the new CLOSID
  into limbo without checking that the group owns it. If another group
  of that CLOSID holds the index, the limbo handler tests and frees an
  RMID that is still in use, while the RMID index allocated to the
  moved group is never freed.

- The tasks are not moved. mongrp_reparent() sets the new parent and
  CLOSID of the group before rdt_move_group_tasks() looks for the tasks
  to update, and the search then matches on the new CLOSID, which none
  of the tasks carries yet. The tasks keep the old CLOSID and the old
  CTRL_MON group's allocation, and the group does not count them.

Fixing the task move does not make the move work. The RMID index is the
hardware ID the counters count for, so a group whose CLOSID changes
cannot keep its monitoring data, and it would need a new RMID index
allocated for the new CLOSID, which fails when every RMID index of that
CLOSID is in use. The documentation promises that a move keeps the
monitoring data, so the move cannot be supported, as decided in the
thread at the Link tag.

Reject the move with -EOPNOTSUPP when it changes the RMID index of the
group, and document that a move is not allowed when the monitoring data
or assigned tasks would be impacted. Where the RMID does not depend on
the CLOSID, such as on x86, the move keeps the same RMID index and is
still allowed. Renaming a MON group within the same CTRL_MON group keeps
the CLOSID and is still allowed everywhere.

Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
Signed-off-by: Peter Newman <peternewman@google.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/lkml/3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com/
---
v5:
- Retitle as the RMID index changes, not the RMID, and a rename within
  the same CTRL_MON group is still allowed.
- Describe the RMID index that is freed without having been allocated,
  and why the move cannot be fixed instead of being rejected.
- Drop the parent and resctrl_arch_mon_capable() checks, which the RMID
  index comparison and the MON group check already cover.
- Use the resctrl.rst terms in the last_cmd_status message.
- Drop the stable version range and the Link tags the changelog did not
  refer to, and link the decision to reject the move instead.
- Link to v2: https://lore.kernel.org/all/20261105123524.2282090-1-ruanjinjie@huawei.com/
v2:
- Drop the Suggested-by tag.
- Describe the systems by whether the RMID depends on the CLOSID rather
  than by MPAM, in both the changelog and resctrl.rst.
- Explain that moving a monitor group is already broken on these systems
  because the tasks are not moved, so no existing user relies on it.
- v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
---
 Documentation/filesystems/resctrl.rst |  8 ++++----
 fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..fecb2cd2b343 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -551,10 +551,10 @@ will automatically remove all MON groups below it.
 
 Moving MON group directories to a new parent CTRL_MON group is supported
 for the purpose of changing the resource allocations of a MON group
-without impacting its monitoring data or assigned tasks. This operation
-is not allowed for MON groups which monitor CPUs. No other move
-operation is currently allowed other than simply renaming a CTRL_MON or
-MON group.
+without impacting its monitoring data or assigned tasks. This operation is
+not allowed for MON groups which monitor CPUs, or when the monitoring data
+or assigned tasks would be impacted. No other move operation is currently
+allowed other than simply renaming a CTRL_MON or MON group.
 
 All groups contain the following files:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index b702fe6dbbec..2dfb3b54338a 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4403,6 +4403,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
 		goto out;
 	}
 
+	/*
+	 * Moving the group to another CTRL_MON group changes its CLOSID.
+	 * Where the RMID is only meaningful together with the CLOSID, this
+	 * changes the RMID index and the monitor state cannot follow the
+	 * move. A rename within the same CTRL_MON group keeps the index.
+	 */
+	if (resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
+	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
+		rdt_last_cmd_puts("Moving a MON group to a new CTRL_MON group is not supported\n");
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	/*
 	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
 	 * current parent CTRL_MON group and therefore cannot be assigned to
-- 
2.34.1

