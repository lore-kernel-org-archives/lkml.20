Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C64F3B5846;
	Wed, 26 Aug 2026 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772909; cv=fail; b=sSpBDzd+t8aFKUS8d6JcSqnXcw7cdRZMVetFdRJalEUvV3Xm8mMVFUAsLGYw4iNehnHf1EdvXCN5POsBn8CIX8Ev4aZKuI89Ibq4inVGMoq/CB5qItjju9Tm/OC5gdf/4eKc++eVr+k7qbPhIW+Ykce44OVI+faxhUDM3dUnyjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772909; c=relaxed/simple;
	bh=OH66Y9tUbKoRwlcZlLyvbwDJwXYp1m0BlYrKIJMav18=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YP+w/kudF/7DraPpk9OM64dmw4QIl5mybXe+QRJyKe3hEFGlmwAgXb3f5tKTgI8FawDAbS47m96wFYQLO9XYdmAnnkKz6Wk3JdrfExZBwEU7nBn5i6OZZz5NWMZamT7LPsa72f0724ekG7xQD4Wim+a4coeZfe5knmqT7lL/G5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QQpS53fV; arc=fail smtp.client-ip=52.101.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QQpS53fV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXlMrLzXOhPF+2GSeuoaMGC+sXDmBO77CH4HZZscnpvAPlXNhTGFd0SI/JWlMlJ6YWP8STKFh4iKlVq9rYvN/HTTfTO6MEQnpllMnE+AfpOm8qHIE1+O84WzMJhA3PyfDRTrYVizx9tzBjiAIHnq0sqbMJdKe3D/FH+3Ox898KxXb8B1K67l6KqZ5Fvu6olG76qXYcwunjTF+LRfxfRpwpxzkhbn1UDmSaX0d8+5lDsLa3eCGNKENEdBeZtJuDZ9VOj6MZducmzOm5JkA68mad73OYWFWaDKx6tew21MkRD1kO381ANJeoFfYKF/XwyPigxXpncjtUHFve0tdtY8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyUfLSu+Chi+1ws10J2wuB5cggKNupDzEQtO3tVahto=;
 b=QVsFgDBCIsp4NG0G4dVQnl+aL6kzZEQ6QIChUC97Jw+YQ9CVM7f30BsACJdzE5wORL2s5qQVuhVcNtsM2mf2VhQ2WANZDqh5M6N7u23zp3q0D2eyw1mFz+bDIu2pMo6zw8lhfjHLDb59FfWtMrrfcQoQLh6Tn+UAvmYl42q5t7VxhZQ3xcm1eLoEi3BkdTig90ZdFMme2FWsv+QOwF4MJCriAo9WywDUusJoi8rsSfJaEsy+VovvZcOaPtAAbABBUuC8yi6dazdsujpZej6GQRQoWypeHwPnECnFFEaPp460IWwBE56se5+7OOK/rQDuH8yxpfBzflIgHqlgQcGWxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyUfLSu+Chi+1ws10J2wuB5cggKNupDzEQtO3tVahto=;
 b=QQpS53fVBDN9BU/cXWdA7YcS2T/B4qjGdP31Iuby+l7pvUy9Bm1A/QvKsrBW/ZkZT1/gm2U/F5ozyDwjOueh3zGAF1CW/eeW4CtrPkTCYYgDrwExRYAJqv2Du0SbSDLibasE0WxozuHz7X0nf0QyhFgF6nXFL9a/76qfhp+tgyE=
Received: from SJ0PR05CA0133.namprd05.prod.outlook.com (2603:10b6:a03:33d::18)
 by MN0PR12MB6176.namprd12.prod.outlook.com (2603:10b6:208:3c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 19:34:39 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:a03:33d:cafe::2d) by SJ0PR05CA0133.outlook.office365.com
 (2603:10b6:a03:33d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Wed, 26
 Aug 2026 19:34:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:34:38 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:34:36 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <bp@alien8.de>, <ben.horgan@arm.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <jlayton@kernel.org>, <enelsonmoore@gmail.com>,
	<kuba@kernel.org>, <ebiggers@kernel.org>, <seanjc@google.com>,
	<peterz@infradead.org>, <chao.gao@intel.com>, <jmattson@google.com>,
	<naveen@kernel.org>, <ricardo.neri-calderon@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>,
	<elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
Subject: [PATCH v5 10/16] fs/resctrl: Add support for hidden resource group files
Date: Wed, 26 Aug 2026 14:32:24 -0500
Message-ID: <f7bcf19ac8113a1e3d9575739c1a6400c455ce6d.1787772750.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787772750.git.babu.moger@amd.com>
References: <cover.1787772750.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|MN0PR12MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2e0476-8ea5-490e-50ff-08df03a9118e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|23010399003|10067099003|5023799004|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BO6jSzorB61CE5zY/30rWeayHd8CAOiLwBjdKQ/mXZuTI667Mn108c14lCwl9ap9Nos75W4Zu2ZVMRxzuRUnv4n9EfuBfSjbMz6NeL0zAyNYhDUYOGllhgiiRFiy3BKtaBbKpcavR7f2t7cbt/X5B2KMXbGOAa6g0/4sZjMuDWkkCHtjoOm9nQe5TSNNkoP/tiQ4oEPUTwmIxURwMfHaFtlqsYS2RjpuqXETNjafkdK2dD8rxOJ67M4YG+Kpf6r5CY0SbX+4fo7SW5XZFck1WiVsPRuXpO8zg1AKxevRFeqS4ooMpR2Uzut/0kryaboENJ/UVxbw49gN2uEq5HewqOAduUeCf3VsObQG58atoA9xmN0uA47zaE1KIfPRPwR0y5kPRi5SJw34m1YiIbtqeRGmY0IkhVplGI9hvuR5Y0oKS1tDPZJbbLpByAxXBaGWX3Z/ea8MZWYzNWm5EqlRonoZuU/1lpcDbEhx8liFu64MlMQkBoJ71Iiivovavq34e3GZmRKohf4VGKfFvt3t8e+iJb5O35kJ0wsXHzjfsA2o9Q/8+JA36Qpo8iXFFp6szUwtUdOSCi427WwhIazrVQrdfezvaJ0Cr55YEVbUQswahPub7tsXaJNaooWXeN34Npiy0T/IZs50KKbi77U9ft2FTNs3Kdlv8Cu/p4idJHbvgNp85i8CO4q8oZHpAXUnDEPDm1l40Ue2TYn0q2jWNQ==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(23010399003)(10067099003)(5023799004)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F0Lzz8CXd4jos8mhYD1ldzt2I27rP2nd62bnjLAw/jeimBhrnde9I0LmKw9d6ZoCEMzBD62gBt7XL1glayy8hwHou09KmymzlEhJSFrMgWsXsScvidWCqgu1sXXAOCsTsrmM6GMuk4kRiACC+zWmvfiGUF0UZxdj25H9aT8IkmBg+ttd69W8g/hSqDBxDnFU+UK9/F7TU59C4WaUi21WBhEZvub9vsQh3g7uMYd770x07iYaO+WqH7HtL/jlo6CWTR1PnXkMhRf6k6WsESGEKhtn3kD7u+QnyhTbOe2g1fIqkgs0Mji6creH3lD9nJoX8fpsiPlEPmXS1bePMOSVZv9XqeDnAgB1FBYlvAh5NAcRHu9VnRIzAq2EZVCyc98yBrm4uJ0RVH5Bvgn+DC99TJ9zCL9C1wzB5/QCRXLEVEPxUE0/+7UoaFcoaFPCwozX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:34:38.7748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2e0476-8ea5-490e-50ff-08df03a9118e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6176

Some per-group resctrl files are only meaningful once a resource group
has an active kernel mode association (for example, kmode_cpus on the
associated group).

Creating them only at activation would complicate group setup and
teardown, while exposing them on every group would show empty files
with no clear purpose.

Add a hidden property to struct rftype to hide files at creation, and
resctrl_hidden_files_set_visible() to show or hide them when association
state changes.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: New patch to add support for creating hidden files.
---
 fs/resctrl/internal.h |  4 ++++
 fs/resctrl/rdtgroup.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 4087bf44a06d..b56f95625072 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -283,6 +283,7 @@ extern int max_name_width;
  * @kf_ops:	File operations
  * @flags:	File specific RFTYPE_FLAGS_* flags
  * @fflags:	File specific RFTYPE_* flags
+ * @hidden:	Hide file at creation; visibility may be restored later
  * @seq_show:	Show content of the file
  * @write:	Write to the file
  */
@@ -292,6 +293,7 @@ struct rftype {
 	const struct kernfs_ops	*kf_ops;
 	unsigned long		flags;
 	unsigned long		fflags;
+	bool			hidden;
 
 	int (*seq_show)(struct kernfs_open_file *of,
 			struct seq_file *sf, void *v);
@@ -480,6 +482,8 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 void resctrl_bmec_files_show(struct rdt_resource *r, struct kernfs_node *l3_mon_kn,
 			     bool show);
 
+void resctrl_hidden_files_set_visible(struct kernfs_node *kn, bool show);
+
 int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of, struct seq_file *s, void *v);
 
 int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of, struct seq_file *s,
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 992af586a194..d2fff8adf915 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -312,6 +312,9 @@ static int rdtgroup_add_file(struct kernfs_node *parent_kn, struct rftype *rft)
 		return ret;
 	}
 
+	if (rft->hidden)
+		kernfs_show(kn, false);
+
 	return 0;
 }
 
@@ -2377,6 +2380,33 @@ static int rdtgroup_add_files(struct kernfs_node *kn, unsigned long fflags)
 	return ret;
 }
 
+/*
+ * resctrl_hidden_files_set_visible() - Show or hide files marked hidden
+ * @kn: resource group kernfs_node
+ * @show: whether to show or hide
+ *
+ * Iterate res_common_files entries marked hidden and show or hide the
+ * corresponding file under @kn.
+ */
+void resctrl_hidden_files_set_visible(struct kernfs_node *kn, bool show)
+{
+	struct rftype *rft, *rfts = res_common_files;
+	struct kernfs_node *kn_file;
+	int len;
+
+	len = ARRAY_SIZE(res_common_files);
+	for (rft = rfts; rft < rfts + len; rft++) {
+		if (!rft->hidden)
+			continue;
+
+		kn_file = kernfs_find_and_get(kn, rft->name);
+		if (!kn_file)
+			continue;
+		kernfs_show(kn_file, show);
+		kernfs_put(kn_file);
+	}
+}
+
 static struct rftype *rdtgroup_get_rftype_by_name(const char *name)
 {
 	struct rftype *rfts, *rft;
-- 
2.43.0

