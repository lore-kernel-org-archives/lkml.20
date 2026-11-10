Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318013;
	b=TdrnhcwZro4DTWRwBdRUF5dNJ21P220k5cjUmOisKvUh3q7NA2lVuNCrOzgsgwXNqBG6
	 8zcvM+UfDsQEiauRRq2N9LnBjrXBxGH81Pi/iBG5tbLqQe4AhJwlxSYt8567aFC9hsroN
	 0hVJceBdiDDSamM4P9cCdpZNfCmYT9zzu2zxmpvt5uJJHo9knfsjSASg8IWx8MK3l79kK
	 ICWHwIYTipPioHKtUgqn4s1rsu6PQopIBEo0DJ2MDgcLaFQEZlCGaGHcNltBv9ug61AK2
	 DXroTOFe8ECCw3OWRVoSk3Rd7xPgP8rb+cYKTz24qQ7iwdRX9fjyPN9u2nA1TGJGkPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318013;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=cHxQtytVmjDBHQG3dPoCx8HxlLCtE3kEcShZG74YRoE=;
	b=wF1AHpJJmIilpurYODMVMr2GqhZypCX3lEWXP7sTFvazeyiZmuzrZoWJzkXGPOP1F+1i
	 RbgAACtTTvoGcB35fQNEWmcXoCogZdWvA2VprvFYFdOTmXbBpTA1H6DX5xH0VUSUQ3baz
	 PYbFYaW7xOMbOd8qlEPr5er4hrPtPvDg/P7wVd6pf3+7kwD4XlaU7nBSt2yWRooU6idyi
	 pK3Pgs0mFOWmLbfNkuUNZRZvtM9rEPVFgG/HnIPt4N0ZOub0ImaBTe2iuuE+BfKRErL44
	 7kQ6jp69n8TiBxAoQKhb+FdwH4rs7wIqgpwjy3LX9ZcSnfCR1DPwPTgWePM6xPJueZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5Bt0QLAg;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDADE606AF11;
	Tue, 10 Nov 2026 13:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDADE606AF11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5Bt0QLAg
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cHxQtytVmjDBHQG3dPoCx8HxlLCtE3kEcShZG74YRoE=;
	b=5Bt0QLAgpL0ozO9zJjPSpFxv1nGO40DEneXm8z3c5ZndI8jbh7Alrv8mygYjWpxzS6SaeE1o5
	nhaIvZgiq4ZgBpujaO2L2V0JvaK3TSFbn3++4VuaZQSzBhJGNPFPI764GGZHw+Fucgelv2eHlcz
	4EFav5eLsekxiwzZdGRHenQ=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jP77K0s1dzRhSl;
	Tue, 10 Nov 2026 21:39:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 098D94057D;
	Tue, 10 Nov 2026 21:40:07 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:40:06 +0800
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
Subject: [PATCH v5 RESEND 7/7] fs/resctrl: Add info/moveable_mon_group
Date: Tue, 10 Nov 2026 21:39:38 +0800
Message-ID: <20261110133938.3768632-8-ruanjinjie@huawei.com>
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

Moving a MON group into the mon_groups directory of another CTRL_MON
group changes the CLOSID of the group while its RMID stays the same.
Where the RMID is only meaningful together with the CLOSID, as on arm64
MPAM, the move changes the RMID index of the group and is rejected with
-EOPNOTSUPP.

Userspace cannot tell whether the move is supported without trying it.
Add "info/moveable_mon_group", which reads 1 when a MON group can be
moved to another CTRL_MON group and 0 when the move is rejected, and
refer to it where resctrl.rst describes the move.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/filesystems/resctrl.rst | 11 +++++++++--
 fs/resctrl/rdtgroup.c                 | 23 +++++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index fecb2cd2b343..4be0508c18f7 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -526,6 +526,12 @@ conveyed in the error returns from file operations. E.g.
 	# cat info/last_cmd_status
 	mask f7 has non-consecutive 1-bits
 
+The top level of the "info" directory also has a "moveable_mon_group"
+file, which reports whether a MON group can be moved to the
+"mon_groups" directory of another CTRL_MON group. It reads 1 if the
+move is supported, and 0 if the move would impact the monitoring data
+and fails with -EOPNOTSUPP.
+
 Resource alloc and monitor groups
 =================================
 
@@ -553,8 +559,9 @@ Moving MON group directories to a new parent CTRL_MON group is supported
 for the purpose of changing the resource allocations of a MON group
 without impacting its monitoring data or assigned tasks. This operation is
 not allowed for MON groups which monitor CPUs, or when the monitoring data
-or assigned tasks would be impacted. No other move operation is currently
-allowed other than simply renaming a CTRL_MON or MON group.
+or assigned tasks would be impacted, which "info/moveable_mon_group"
+reports. No other move operation is currently allowed other than simply
+renaming a CTRL_MON or MON group.
 
 All groups contain the following files:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 2dfb3b54338a..a3362f8ad13b 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1200,6 +1200,22 @@ static int rdt_num_rmids_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static int rdt_moveable_mon_group_show(struct kernfs_open_file *of,
+				       struct seq_file *seq, void *v)
+{
+	/*
+	 * Moving a MON group to another CTRL_MON group keeps its RMID but
+	 * changes its CLOSID. Where the RMID index depends on the CLOSID,
+	 * the RMID index changes with the CLOSID and the move is rejected.
+	 */
+	bool fixed = IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
+		     resctrl_arch_alloc_capable();
+
+	seq_printf(seq, "%u\n", !fixed);
+
+	return 0;
+}
+
 static int rdt_mon_features_show(struct kernfs_open_file *of,
 				 struct seq_file *seq, void *v)
 {
@@ -1975,6 +1991,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdt_last_cmd_status_show,
 		.fflags		= RFTYPE_TOP_INFO,
 	},
+	{
+		.name		= "moveable_mon_group",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= rdt_moveable_mon_group_show,
+		.fflags		= RFTYPE_TOP_INFO,
+	},
 	{
 		.name		= "mbm_assign_on_mkdir",
 		.mode		= 0644,
-- 
2.34.1

