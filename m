Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437255;
	b=nF6suMZuzUw6IZ36Ch6e5wgTuNE7vcpQNxq+Se8ZiSZnAu7G8p19FtydibLmeK5+4Ofv
	 U6v2gYjwLxFG8EPEqDcbVPZ+Y06HsDhIbRU9Orfb5rvXg0Bi+BsgggUJn757sI+ImXH9g
	 /X8Kuipg7H9ZRJ4NOFCDQcS7ss3Rgkx8wWSTF9OgfRTGE62NQc/pq+6qIwQz6VnhVHkRs
	 PrEBD3MPXEtGWsmK+GqYH9nD8rUBGsvGPEM4pODjMEkg49YuV457fNBNRcIZG6lGOOhX/
	 9I+1p8X0+rzMNTWTl6iEQ5cTPxtMlpnlT+D3JicD98JvKEjyYt6Fmam69OvjnqkF/gA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437255;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=bOsnuxBg9lSIpbXSJ/FFqqDKMm+/iFytfCNvVVIjFGw=;
	b=JjDlX3CkuOtZJHdskv1Rfej8D7WfyOjCjiT23kzsQCIrop1+c4udprkp3gd+/xEf//W4
	 z2pBo43chEtWULfpXgWBIgFLvaOlMZ6vuUDf/leYKXff/q2V2cerWm17fR0HA6QKXQqhA
	 Qj+dFyIuflH1++1W/iTDEslLCIYuDY/9iF6dxdfl+AQwtIrokiA2G+wkje2J2LiMfSXo8
	 McJ54ujQyqd6+iKbi5dYsXUM/xfjM/LhqJ75ob3demaMVXf1dMN0TY3/hdXe87n8j0FO8
	 L/3wW3ijOyMYgCnISHcWupU424xykNgO9VCPe/8oRTkF2HRQeDJRRrhcqhU9ogMNQLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4p3A2UXL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.45
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90321606A334;
	Wed, 11 Nov 2026 22:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90321606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4p3A2UXL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KteSEcOGQzY0UfxQbns8ZJSFbZ8Pst1v9/VQ3irKigG7k7VhyD26OvWtwJYQicnk9idDLn9gFFerbLN/BNn3Yvbf8bCpzzSAcAvPoT/s4QMEBGy+1nzZle887UQUxakKn714f/QGmtFMma0KF1hPIQiIJzLNDOeMKh3iMgP7DCsA5HyC85TeJ/5JL9PSg1ySU/dPH8uAFV4YkJPQDPdPXyUY3G6B29pAR9RqG8C7xMO1pxApjVM0c0+KiI8S6EscWPLmFFLIhaF+j8ofc5JNriGTxAkrBIS2w8NkugDGhSDnALvywUYqXJcNzNIpAIq7nHWIkgrk3izxFkwWYjbeCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOsnuxBg9lSIpbXSJ/FFqqDKMm+/iFytfCNvVVIjFGw=;
 b=L0ZVkA+pt1+XKwWNVaSmTFtjzSUsRS5lZb6AJteBwwyfLsq3ezuEFfxtr3FaRO5+yNTH5h2w7tZrRY54+svLKiqFvwayoEkUgcBm4TCFP1ufmCIcr4f1BAgiy+Y9lF/wgXG8CeUSG1RMbA3GG9iGSS2rqdyilUyLGuzL/MYpTqYYdWWoWwMautLo9uTusQmYyj0oVLeOw1PlJJGXofZE6SgXFwCld7WcOo0eCQjm0BV9Nd7Ikujx5X992thgMQPhJpy+YHERnmED0+KFQPfFcbNOytswT7YmQoMoO3UXX2MUolsD8Gl8hLJI1zhLdU8p4kGvelW7xH1WZXPftGS3Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOsnuxBg9lSIpbXSJ/FFqqDKMm+/iFytfCNvVVIjFGw=;
 b=4p3A2UXLU4/GUuV4PKEFqxFASMdP4K4JpBB+e7ZshJZYkhqtrvc7uUZFhVmqbFqqz4ji8LaKlgwA6z2lOGlUKTXONq+7XhipRz/BwSbgFzz8gVvQS+WblKFwYzIkrB+V3HcGit+Tyk0Jc4qRmqN13TvgzinpZ0ebkf1XjTt5pyg=
Received: from MW4PR04CA0221.namprd04.prod.outlook.com (2603:10b6:303:87::16)
 by SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:47:22 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::7d) by MW4PR04CA0221.outlook.office365.com
 (2603:10b6:303:87::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 22:47:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:47:21 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:47:09 -0600
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <x86@kernel.org>, <fustini@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <jlayton@kernel.org>, <seanjc@google.com>,
	<ewanhai-oc@zhaoxin.com>, <binbin.wu@linux.intel.com>, <nikunj@amd.com>,
	<ashish.kalra@amd.com>, <peterz@infradead.org>, <superm1@kernel.org>,
	<thomas.lendacky@amd.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <ricardo.neri-calderon@linux.intel.com>,
	<darwi@linutronix.de>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v7 17/19] fs/resctrl: Control visibility of global per-CPU kernel mode group files
Date: Wed, 11 Nov 2026 16:44:10 -0600
Message-ID: <6af7466df1a5e64bc2804ba3d8c7e2e592793cae.1794437052.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794437052.git.babu.moger@amd.com>
References: <cover.1794437052.git.babu.moger@amd.com>
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|SJ2PR12MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4cb57f-c662-4554-b6b7-08df4045bf69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|36860700016|376014|1800799024|82310400026|10067099003|5023799004|261021121427099003|56012099006|261009223027099003|11063799006|261022075727099003|261102123227099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	eZiADQ8SKq6sesR1LlxpBOb5o9gJ297uPEpyYNGj0M2xAUvcQpfM7gEu12T4sGZKbJOjkzFQ4JdyFZaXeHT3ZciMQGG22Ix/7cABvZJ7acArZdaP97PM6M9gMnXvIxEWIrbN4eedw8V3PcAoHGcm+Idk5lfmaZsSSOXXqkpC1ciSsRCN4ROEddk4ua8QqDCtOTtEUwm0Oqy/J17UETlAfeAzO/QdlNdiLmF8Lh61si0G+jv8ZUii6e3s9m+rntrj4mVElia5vZKu0nAxvWsLN8dMAQIoF6MGfp5j6Eo/xhxDKdwjmy8e4ir12RxLmCnIRkv8bdOtmxEb6PsWP344ZMcNGQ+Y65rFJVeU+bj/nyXl+LkRj/Zdv1uFwo52xns4043SgpIhj5DkksfcEeYhQzRVyve0cjVlh6KIGBuGTzNp7S3XEsz1DFLQeE4xY7oY2ew1Jw0JFR0arG4sLlWF7zMxGmCkDXEdTrP8ISXqTLd4IeKdj/avCRsl3ZzW3EyndpVwhlQDfC3wBTMfKfPfJ44H/7h8Rf3LmCOT31lV77s+7pphYItYqfapEfeDYDzi+wL7icuXJYTdS75w8Eqi0ygB2UrMkHXuUSXzivvKaxrd2BH68jgB0gccrK8tV+ofCQ1JUUgat7fyRklhR3Xk7tayJ2KRIZmLFdfrTfLy1c4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(5023799004)(261021121427099003)(56012099006)(261009223027099003)(11063799006)(261022075727099003)(261102123227099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pUOISFE9hKSLi6P8zfGpXdapbABBjMtHOdWhlIdvl489Fi2mfxxOdRZwX28fXdo2uofSU2pPEKeXsLrgdVPD23/4cWYSaU/ej1NaPxIzH1VYbtYo96s38QrFWpyl0akyoPvyZdXwA9OCKUpNnkIp38FadCEg4zDRiWdls76X7+hmqn5uo+GlwOI9sxVGt7NVptsMVwO+nClLFQnGl+VwidHYAyLjgiCgjVv/GX0ZjGP346LDYn0PduM0wEw3JxPkhR8humdoeU7iIqWLuAGX5ACyYd8RFuhKBvMgXukhtrBLMFAfu074B+CAbnm68OYh3aw4pGQFkUwIW090eXJscK4Nzga3S3SKWe1KY6gyUQ9SB2afCJP116UCpoBROcFPkzTzplsbA7S/uxh9Cik9B82jh7NJr7GoqtbbJg14kFyRynYS26q6eFBL8Ml/7rH7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:47:21.6919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4cb57f-c662-4554-b6b7-08df4045bf69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244

The kmode_cpus and kmode_cpus_list files are specific to the global per-CPU
kernel mode. These files are created in a hidden state when an rdtgroup is
created.

Introduce resctrl_kmode_global_files_show() to control the visibility of
these files for individual resource groups. Show the files only for the
group backing the active global per-CPU kernel mode and hide them for all
other groups.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Updated the prototype rdtgroup_kmode_global_files_show().
    Moved the patch after both rdtgroup_kmode_global_activate() and
    rdtgroup_kmode_global_deactivate() is Introduced, so the change is
    symmetrical.
    Updated the changelog.

v6: Helper named for the global per-CPU files instead of unhiding every
    hidden file on the group.
    https://lore.kernel.org/lkml/34aa4824-810b-4c81-8188-f2f37e1dc277@intel.com/
---
 fs/resctrl/rdtgroup.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 1ad169e714a4..86bd6a66812b 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1136,6 +1136,24 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+/* Show or hide kmode_cpus and kmode_cpus_list on @kn. */
+static void resctrl_kmode_global_files_show(struct rdtgroup *rdtgrp, bool show)
+{
+	struct kernfs_node *kn_file;
+
+	kn_file = kernfs_find_and_get(rdtgrp->kn, "kmode_cpus");
+	if (kn_file) {
+		kernfs_show(kn_file, show);
+		kernfs_put(kn_file);
+	}
+
+	kn_file = kernfs_find_and_get(rdtgrp->kn, "kmode_cpus_list");
+	if (kn_file) {
+		kernfs_show(kn_file, show);
+		kernfs_put(kn_file);
+	}
+}
+
 /*
  * resctrl_kmode_global_online_cpu() - Program kernel mode association for @cpu
  * @cpu: CPU that has just been brought online
@@ -1194,6 +1212,7 @@ static void rdtgroup_kmode_global_deactivate(struct rdtgroup *rdtgrp)
 
 	resctrl_configure_kmode_global(&rdtgrp->kmode_cpu_mask, rdtgrp, false);
 	cpumask_clear(&rdtgrp->kmode_cpu_mask);
+	resctrl_kmode_global_files_show(rdtgrp, false);
 
 	resctrl_kmode.rdtgrp = NULL;
 	resctrl_kmode.active = RESCTRL_INHERIT_USER;
@@ -1214,6 +1233,7 @@ static void rdtgroup_kmode_global_activate(struct rdtgroup *rdtgrp,
 
 	cpumask_copy(&rdtgrp->kmode_cpu_mask, cpu_online_mask);
 	resctrl_configure_kmode_global(&rdtgrp->kmode_cpu_mask, rdtgrp, true);
+	resctrl_kmode_global_files_show(rdtgrp, true);
 }
 
 static int resctrl_kmode_parse_state(char *val, enum kmode_state *state)
-- 
2.43.0

