Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787579;
	b=2ETsbH7UP3T8nPaQQzGIrVSybKpgZg3ra26oOHvvZjBr+er8P9m4D0Ui9z3mc9Z/5+22
	 1efjFwrOFzxRKgM9O7T7Y9TtrY8LdI7zk6zcTjHoP4+2uOIUMKwPjl/YhXZ9dKmC+pGs/
	 bkmTLgs3wZnajwkBIcHp2dSqaiClu3OkD3UEG2wyCASVKcoUxFwHnr7/vxvgomF8NDKL0
	 zaT26a+BhhB5xLHJq0JTKY/K+Q2ZRfDaiYTGTS9u6tzxv5X8fDB5LSlm2DvYDKRx3VGY6
	 128eYH6yOOSKSptbKIUAjjqdRLCqhpZOrEtEiaVF0FBk1SBGBwirTdSshL4ICFAikJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787579;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=KJn6XSHeMbhPBetiy5kOmfJqFrJfZVU+mS+17u1fQmA=;
	b=k/eC+geKXW7TWCsZCWLnLfdkUCXeqCqzsbSgyyj7YIpjhCRzP6KEeHVz9vrI6tnT4s63
	 t1DGA6yTIPtB+/CBNuy5KPP7ECbSaXF085VXIYosJDys3Vj/PjMzu7YvznbGu7A8Ib5yc
	 sXVFFwZIH2QNVpnNctRHWjCnNLSyFHUdiK+8dMVZmGAKo8Tlp/Q0Ru0USw5os6ytkVVWE
	 nsfShzt6Nt3rKqSlEgM7Dfo42m9MGwVH3KpABq/I8nlQRbfhErq22+TuOMBIpnZE18IxH
	 zCa5XwAy5zzTDivxVnIKI00N6rALmKxw7t+XBky32CSG6P/JvMDDCNX5FZvm+hiTjtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="38K2/wcs";
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B89606A33C;
	Wed,  4 Nov 2026 10:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B89606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=38K2/wcs
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KJn6XSHeMbhPBetiy5kOmfJqFrJfZVU+mS+17u1fQmA=;
	b=38K2/wcsycMHEcPqxY5RSG7iHScFXnvmjPYSzzyX9SzlKfo5sbgT69ajbN/uJTOz5FgRHVecM
	zc58PYh35PJus+FH0MVOrpN4xepI4Re8tWeSCdMqWQCsI1oPLs0zSmp4jNnPk/zwD6XQS9M1nY+
	IdTd6ELE0MzZAV6o0OW/gl0=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jKLyh2FCnzLlTf;
	Wed,  4 Nov 2026 18:19:24 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2BCCB4048B;
	Wed,  4 Nov 2026 18:19:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 18:19:34 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <jic23@kernel.org>,
	<tan.shaopeng@jp.fujitsu.com>, <gshan@redhat.com>, <zengheng4@huawei.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <ben.horgan@arm.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] fs/resctrl: Disallow monitor group rename when the RMID changes
Date: Wed, 4 Nov 2026 18:19:13 +0800
Message-ID: <20261104101913.586595-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

From: Peter Newman <peternewman@google.com>

Renaming a monitor group to move it below a different control group
changes the CLOSID of its tasks. Where the RMID only has meaning
together with the CLOSID, the RMID index changes as well: on arm64 MPAM
the RMID is a PMG that extends the PARTID, so the group's counters
belong to the old PARTID and cannot follow the move. The monitor data
would be reset and would then report the new PARTID's traffic.

Check that the RMID index is unchanged before moving the group and
reject the rename with -EOPNOTSUPP otherwise. Only MPAM systems are
affected; architectures where the RMID is independent of the CLOSID,
such as x86, keep the same index and still allow the move. Document
the restriction in resctrl.rst.

Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Peter Newman <peternewman@google.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1.x
Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
---
 Documentation/filesystems/resctrl.rst |  7 ++++---
 fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..5f21ab20030a 100644
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
+-EOPNOTSUPP on systems where the RMID depends on the CLOSID, such as
+arm64 MPAM. No other move operation is currently allowed other than
+simply renaming a CTRL_MON or MON group.
 
 All groups contain the following files:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 9290a346386e..358f2dc8301d 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4405,6 +4405,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
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

