Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882149;
	b=ty6cXBO/QMNwh8Z672p4gVVlViUGPkA438onG9QrVx54eFeQZ1FFsaIBeOMR4OuXwBlI
	 +s/qix79L9ZnaiNBizk0Rmh7WP68UQ6q2ARluUzddsO0X0vENouI7zsUa5YwuJPf7pN+i
	 xUZEBnPnPSIctDix5Ej1VOFgV4NNyQ1dpILzu+4EliPfBdbBQZF3IJoDFmN2wOI+Q/A94
	 po0RjdxIFThSthvKh//Tvc+g/kQnKuTiIE8Vobbgg/wGiM9AFW9ta8hBvoRcYBu1AYrAT
	 RR0uCsfo90R9B3tND5KZ96f+cso52hfguJ3YvvNzd8jzpN33cLcsm4njxRmsH4cz6wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882149;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=nvdKY3zOuZvF5FDVOlawuLYvXNZx88e8c47N8ZUI26M=;
	b=jWmYZS5kEed76jTzaZhO6E8DbCYbHAqUhn3e6vg2Jvxs55bJAUtagQd/GhuX4tJeE7xP
	 XLPidJP0oJeUBUR0WLo35e0F4YjbVcSzQlKIV9YGYmQdQwz/ekpydX+Kk/Qx8V6mC06wD
	 Sm9mfsqDflH03EVZPoEnK6VXZ/8wHne+bG/PoWociHLDUlxzgik9yGGIMxVQU37mB42it
	 2b86uR3XRL8LmJEAzavGqu+FWOrEMtG9w41zhvkaYOVTJ0FQdMJ2xMsTvY8GQUOxz1iwa
	 rzzB0gwsaJwYQrG2Bd6n2TmKyEzxG8vqIdTvT24X737azpoPEk60zz0OboC/1pxISfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DY9uTL05;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0879606D806;
	Thu,  5 Nov 2026 12:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0879606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DY9uTL05
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nvdKY3zOuZvF5FDVOlawuLYvXNZx88e8c47N8ZUI26M=;
	b=DY9uTL05VUa4qH8sRHIIREy2Q1C3ctDVS6+rwvj0vk0rRFfxoC9oCIXMwcq5VGp8KVL3pbaLb
	825a+8CzZPI0RKa14aaQ7wkiJGJa8oFJXiIW3AvZgLNF3TjGj1Y1SDPbJN/V1RUEiDAg8/MUFZc
	OntNJ5s6DwkVQalnkoWiUMQ=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jL1xG3Lbmz1cyV2;
	Thu,  5 Nov 2026 20:35:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 487234057A;
	Thu,  5 Nov 2026 20:35:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 20:35:41 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <zengheng4@huawei.com>,
	<ben.horgan@arm.com>, <gshan@redhat.com>, <jic23@kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2] fs/resctrl: Disallow monitor group rename when the RMID changes
Date: Thu, 5 Nov 2026 20:35:24 +0800
Message-ID: <20261105123524.2282090-1-ruanjinjie@huawei.com>
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

From: Peter Newman <peternewman@google.com>

A monitor group can be renamed into the mon_groups directory of another
control group to move its tasks to that control group's allocation
while keeping their monitoring data. Where the RMID is only meaningful
together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
extends the PARTID, this move does not work. The rename succeeds, but:

- The group's monitoring data is reset. Its counters are identified by
  the CLOSID and RMID together, so after the move the group reads the
  counters of the new CLOSID instead of the ones its tasks used.

- The tasks are not moved. mongrp_reparent() sets the new parent and
  CLOSID of the group before rdt_move_group_tasks() looks for the tasks
  to update, and the search then matches on the new CLOSID, which none
  of the tasks carries yet. The tasks keep the old CLOSID and the old
  control group's allocation, and the group does not count them.

The move has never worked on these systems, so rejecting it does not
take away behavior that an existing user can rely on.

Reject the move with -EOPNOTSUPP when it changes the RMID index of the
group, and document the restriction in resctrl.rst. Where the RMID does
not depend on the CLOSID, such as on x86, the move keeps the same index
and is still allowed.

Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
Signed-off-by: Peter Newman <peternewman@google.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1.x
Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
Link: https://lore.kernel.org/lkml/20261031101052.1692230-1-ruanjinjie@huawei.com/
---
v2:
- Drop the Suggested-by tag.
- Describe the systems by whether the RMID depends on the CLOSID rather
  than by MPAM, in both the changelog and resctrl.rst.
- Explain that moving a monitor group is already broken on these systems
  because the tasks are not moved, so no existing user relies on it.
- v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
---
 Documentation/filesystems/resctrl.rst |  7 ++++---
 fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..9ae34aace0ff 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -552,9 +552,10 @@ will automatically remove all MON groups below it.
 Moving MON group directories to a new parent CTRL_MON group is supported
 for the purpose of changing the resource allocations of a MON group
 without impacting its monitoring data or assigned tasks. This operation
-is not allowed for MON groups which monitor CPUs. No other move
-operation is currently allowed other than simply renaming a CTRL_MON or
-MON group.
+is not allowed for MON groups which monitor CPUs, and fails with
+-EOPNOTSUPP on systems where the RMID depends on the CLOSID. No other
+move operation is currently allowed other than simply renaming a
+CTRL_MON or MON group.
 
 All groups contain the following files:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index e6b64a5c9302..3c002b711024 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4398,6 +4398,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
 		goto out;
 	}
 
+	/*
+	 * Moving the group changes the CLOSID. Where the RMID is only
+	 * meaningful together with the CLOSID, the RMID index changes and the
+	 * monitor state cannot follow the move.
+	 */
+	if (rdtgrp->mon.parent != new_prdtgrp && resctrl_arch_mon_capable() &&
+	    resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
+	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
+		rdt_last_cmd_puts("Changing parent control group not supported\n");
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	/*
 	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
 	 * current parent CTRL_MON group and therefore cannot be assigned to
-- 
2.34.1

