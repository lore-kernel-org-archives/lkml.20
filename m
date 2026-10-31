Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793441480;
	b=avg2Avp4oF0lQS+VqYoPNUG0M+FhErRL5xpeLHOWe6MOBp5bV8/oOZKJmhwUsdwNF5PH
	 oDs2X+dCCf8Tqks7UhsNojAAyH94FWETua7qmcvbhQedXo22W9AhRRE01jtwJzlExfJ/E
	 Hgfij0ELePJQVvoEumFMcgdBsirpBbvY9CfksU12UXps4rvYtgtySHfqxSSzoVTzud0je
	 JOXKfx+TQNWk6AQkJj4AVrcz6EdJQZPaUs9QxeEY/CSZhqk71rLwNEPpEnyc6v5GXnNAa
	 b/YzVQNFEu2JmNabyYb+9aLz7gjCNIdVK0VqFTyYoHn7gBuwbRly/pZyxlNqIW+0QEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793441480;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=AUrRoSBnALL2MHWa7u2eypqGeKyOhsumZE2uqm1T6EY=;
	b=C5HoFClDiEUanAQZaIqpKYbKmivKNbFc2ANuuNT8RLI8GKKR3FEEJ+7EdIfPf5IE/ZmG
	 QjcgGvA01hsEsCdmTaveYdHv8pSu/Un0997CuQZWAfb52GNlEef8nimgqnhwMIFOrKZMQ
	 +ABZgssC9jxPpHzBuIAIujguvrMOG37yeKSGRfFRekPL/hGNHpHjkVQnEV/TmHMDE/Myj
	 EGnI6k+sUn6jnqoRzr83Al58pYaq9buacOAh6+Oaw2lyvuGXwpLjWOyYMNtCPStKvOyx4
	 bJSXwfQ+PXm6dDM9U9wC7eX6m3STv9SR+ifTusrW9VH67snKF6q73Y/oSgs5CHeWgbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mF1DedmR;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8943B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8943B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mF1DedmR
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AUrRoSBnALL2MHWa7u2eypqGeKyOhsumZE2uqm1T6EY=;
	b=mF1DedmRnZnIdm9dfshS3SJ32wabSWXIegTEYfpwcJek0rtlqSLONkzLJGYVp++/m9gTC0iGJ
	lZChdEm3D98dNpmN9B/651NsV0fz5UYmorKlFR9Pf1aPpRHvdDVeLI0kvF7GvZImUAlcjwb6Zjz
	Vfa/uPuQKvchK3hPtf6Fo2s=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jGtyw5rGszmV7v;
	Sat, 31 Oct 2026 18:11:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 113C44057A;
	Sat, 31 Oct 2026 18:11:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 18:11:12 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<peternewman@google.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] fs/resctrl: Fix CLOSID propagation when reparenting monitor groups
Date: Sat, 31 Oct 2026 18:10:52 +0800
Message-ID: <20261031101052.1692230-1-ruanjinjie@huawei.com>
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

Renaming a monitor group to move it below a different control group
changes the CLOSID of every task in that monitor group. mongrp_reparent()
updates rdtgrp->mon.parent and rdtgrp->closid before calling
rdt_move_group_tasks() to propagate the new CLOSID to the tasks.

rdt_move_group_tasks() uses its first argument to identify the tasks to
move. For a monitor group this is is_rmid_match(), which on MPAM compares
both the PARTID and the PMG of the task with the parent control group's
CLOSID and the monitor group's RMID. After rdtgrp->mon.parent and
rdtgrp->closid have been updated, the match uses the new CLOSID, so no
task in the monitor group matches and none is moved. The tasks keep the
old PARTID and continue to use the old control group's allocation.

x86 matches on the RMID alone, so it is unaffected. Now only arm64 mpam
affected.

Save the monitor group state before it is modified and use the saved state
as the source of the task move. The updated group remains the destination,
so matching tasks are moved to the new CLOSID and RMID.

Fixes: 8da2b938eb7e ("x86/resctrl: Implement rename op for mon groups")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: stable@vger.kernel.org # 7.1.x
---
 fs/resctrl/rdtgroup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..33b23b59a6de 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4322,6 +4322,7 @@ static void mongrp_reparent(struct rdtgroup *rdtgrp,
 			    cpumask_var_t cpus)
 {
 	struct rdtgroup *prdtgrp = rdtgrp->mon.parent;
+	struct rdtgroup old_rdtgrp = *rdtgrp;
 
 	WARN_ON(rdtgrp->type != RDTMON_GROUP);
 	WARN_ON(new_prdtgrp->type != RDTCTRL_GROUP);
@@ -4338,7 +4339,7 @@ static void mongrp_reparent(struct rdtgroup *rdtgrp,
 	rdtgrp->closid = new_prdtgrp->closid;
 
 	/* Propagate updated closid to all tasks in this group. */
-	rdt_move_group_tasks(rdtgrp, rdtgrp, cpus);
+	rdt_move_group_tasks(&old_rdtgrp, rdtgrp, cpus);
 
 	update_closid_rmid(cpus, NULL);
 }
-- 
2.43.0

