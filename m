Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437184;
	b=KpIWhnOTovyNm8RPrjh58/3G/a32v+bDP0LLVTBbytviLuIr7jXk6chA+Sy0/td0sFzM
	 uRaxygAE21N0iPJjvfzZ9gug8+5EoT6uN2a26jIBbea6G/S76cf9MS7q0e8rgO5nNLpxT
	 U0OVet+LKEgDbGCRRR3Pl+XU9/R5qittjb11pyrHLf+I5WKaNg9cA/yMxZOmEZkhXvKka
	 2dPMQEfhH9NTEu6e/tPn3JrlvTESPvc2Qev1Sj+ROuU8EDGteGPdZlFj2rmiLsqgjep7F
	 NMLi/4QgVwPlP82nlRLNiiTuJ7GkZ7lAx+bDK+zzPZ/XLuWkLu5r5R00NLmO02QjfNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437184;
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
	bh=bYGGHsPoZjYTsaEOQPfJAeJDDbaWvCpXSpDXwCjUT4k=;
	b=a6N2yHw5NQypJN5jpejBXRm1kdBpaD3/KRmJtlST41YuDrtqbc5MFNIR/LCJIPJVjaTa
	 aD0usKG50c5FOn8nQtQ5Iww1qHTaDn85bNOvt6B4KI9vhWkeZ2u7kgM0IoHZ2LL5SEynp
	 j60XgEJLj6VKuWRQD8xIbkytoYSx66bzh//spy1ziGwm/9mq5L1nU/2+TuLI/uiiD98go
	 4frJ5EYn/TRGQxmUmBsXqm2M3kix2vGMRT96s1jVAYETljPUyslUVB99TjSaAMNS/qOHp
	 x1I+L7DtXq7FWPRivJs+1AUQQdoittH2wg81ljXWln5XU04dfiS654thkq0zWhynyXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ri6h1arW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.31
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010031.outbound.protection.outlook.com [52.101.193.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B5606B00C;
	Wed, 11 Nov 2026 22:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F6B5606B00C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ri6h1arW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOApiry3kA1zacUv55tMbizqIPnMM25hG/+NgFwF0E/Zp7mXAM9Qmd5ECC9xfSuEZN6ChYJtiRDPIRbZfhNLz7+h7F4DzjN+dq8JJervozgz8/eVayTwjcNYAKVdcTlT/4tHzwtBmVnScS2ZGWRRavaEIAGNBTTWQSF2tBCVMBvq74q4ccGSECEsGM1V8Wdn2B0Hfkn5izR6fNxV/fWbc/dJ8xGMN1k95nEWuZ9S/kYpJoy4j8yyuV6AUO1nNyu4rXhDH88FOrtjTDuEA/xKsueLtNNbqNYJHv05kMoh64RRiVTkZ6hA3Hlo4MdA0GZxj0om4xqDvxXfIaWxQH4BkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYGGHsPoZjYTsaEOQPfJAeJDDbaWvCpXSpDXwCjUT4k=;
 b=AgZAd1hjhlsceL/ATKzqe7KOao9FYcPha26wU/OQVOeOyWJor7AkoE+5xDumEpYmMklysr9i77CnKarhfR59Jslw5Zef69XY+58gWYeuZeYIc0nRqUwu0RqZG+auT+3JLHghJJBUnRn2p8nVgkZu/bWITTUh9p+dqgH8owrZE03lhuAS8TmilgvkLqS7bvfTGZTUgEADgI+6wNmh4tMB5JmhyTpaiyL7kLokFGIssUgdIlJnqyPbHj2Lh87tzCflzS8jsnBGTHIHGdJ8V6jqz5enaRDY3kfXCEAn9fbHR+BVDv6AD2IRuXcyoWto+o1CeakB7kX0xK1YDDlNZOvzrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYGGHsPoZjYTsaEOQPfJAeJDDbaWvCpXSpDXwCjUT4k=;
 b=ri6h1arWnF50kmW6ubHiYLBOt228w7yyBFrEiJbWtptbkI7Xczlb1HkNrZxXgZN5/jZ6Or4SggG4wPL1Eym0q7rp+pkFxEup6Hzbx6I2knPQ1mVOkPW3MeIqL4FvPYwVB2E0LNHPudZyuAb4s0pv6jN05SiVm92N/halXk7fU88=
Received: from SJ0PR13CA0027.namprd13.prod.outlook.com (2603:10b6:a03:2c0::32)
 by PH6PR12MB128275.namprd12.prod.outlook.com (2603:10b6:510:3da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 22:46:18 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::50) by SJ0PR13CA0027.outlook.office365.com
 (2603:10b6:a03:2c0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Wed, 11
 Nov 2026 22:46:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:46:18 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:46:16 -0600
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
Subject: [PATCH v7 11/19] fs/resctrl: Add support for hidden resource group files
Date: Wed, 11 Nov 2026 16:44:04 -0600
Message-ID: <905c67e0ea380ac150fa096c57025e39c79ba185.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|PH6PR12MB128275:EE_
X-MS-Office365-Filtering-Correlation-Id: b97dd279-7295-4e29-84b7-08df404599bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|10067099003|5023799004|56012099006|11063799006|261022075727099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	7MnGeV/o764E5mUysdtcrw163tWfjGleqkeYYuV+HTz2uY9+rUjUzE4GAfmUOPe/EhrTyfADNS6B3vpSxG9vMB64U8NgSwJrWk6snHyqJpcngypVr+ASEt9SPe8K1rpHDzGMJgKRHsg+k6hXEkq7YSxmRmN3EEiUnTTRrsqdCxkkgC5NjiKTz8hr4SDXwP8JbBaxEauVLRV7OGh1qI84KHleMAZ1KeNErCmn6+hVRM80MYQtDNd1yR9DC2weTywBxl0BgEHb8/JrQSR40GSmpWi008MtSS0HJXk/tWgF0ZJf3vpYXozTCkUhMkcFt1OvwfCzMkdD3kZZtiSjLdPJQQNCYnIYqaFp2VUO38ffmPQxszoRfXG8JnE78K4QgbG6iiMeE6Iyw4KJERp7dV3tirlwOI7S5x++WKWUPxI5a9uWTQBF0T4k+9Jeg5sxNs9T2a32Zsf92ws5teg2XAmi+AeMhhVoFjZmywcjZ+C9PhSR2w+Dl1Pr7i1fnd8nN2eim2aSY5ZNOCY7O6xl3qxLoT5qfTsnFjSUpE8udUFDUD1u8hC5YHA/eggplRnsoschzjkGCQ0O57+ieOlzxR4td50AG+Z3j/IhSHtjOBJ5S8OtKIXvvT8HUtAHe9iUu8JaJ/OjKBEN8ewO6S/hDcgd2nOJKzVDG98rGM8ad46yQVl7xpKyWLDHfOctAan7VrunwhZqQR9XSnfuKTVAgVbY5g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(10067099003)(5023799004)(56012099006)(11063799006)(261022075727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BSX9gh7fjtnb95vfECqXY1+Hhg6o3xBnKXrHwDNca6Z6lI9dz5Mb300czU+VGotZgJFVfp72twsAniysp6WmEU7b7B74qnIhGM+DDN9l//jEYaFBgD8qJ43PubM6vfSqM1OOzUFGBp4bKRF2vS1IHHcDVDSDsdQpyToIRR2CGPErQ5apOHW7nv3Az7VsOpwHmeJfJrzg2AvmtuV2tqAIgNYNOHNJ13gzeDvgdIGF1ocy3SFHTUeWLZcVmCgzRt6q9rcswzYAOqgaz30DBoIpDKEpXqge5j7CLCIZOCJl/mkIsskOEq8387wF1CMKSIg+khoMnC652aSXPQhHVu9FDGtlsn1jm35Gg7w2dQFDsRAyGokxq3+Ev7ZpK2OyRSj86P1mojm9xnS5AvZBoAs3yU8HJ08VLMYKWyEiaPXo5YP09GXJzLT1FWRhyZ1lgEGL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:46:18.5127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b97dd279-7295-4e29-84b7-08df404599bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB128275

A resctrl file is visible to user space as soon as its resource group
directory is activated. A file can only be hidden after it has been
created, as is done for the info directory's BMEC event configuration
files.

In the global_enable_per_cpu kernel mode, kernel work running on CPUs where
the mode is active uses the CLOSID and/or RMID as part of a single backing
resource group. The files needed to display and modify the CPUs on which
this kernel mode is active are only meaningful in that group. Visible in
every resource group, the files would return errors when accessed in any
group other than the one backing the active kernel mode. Creating the files
when the kernel mode is activated, and removing them when it is
deactivated, would add failure paths to kernel mode activation that showing
and hiding existing files does not have.

Allow a resource group file to be marked as hidden so that it is hidden
when created, before its directory is activated, and is never visible to
user space until resctrl restores its visibility. This provides the
foundation in preparation for kernel mode support that shows the kmode_cpus
and kmode_cpus_list files only in the resource group backing the active
kernel mode.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Updated the changelog (Reinette's input with minor update in second
    paragrapj).

v6: Removed resctrl_hidden_files_set_visible() from the patch.
    It will be separate patch.
    Re-wrote the changelog.

v5: New patch to add support for creating hidden files.
---
 fs/resctrl/internal.h | 2 ++
 fs/resctrl/rdtgroup.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 38aa0c0cfb7e..909511e985a1 100644
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
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index afbe0f94940a..9235f094245c 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -313,6 +313,9 @@ static int rdtgroup_add_file(struct kernfs_node *parent_kn, struct rftype *rft)
 		return ret;
 	}
 
+	if (rft->hidden)
+		kernfs_show(kn, false);
+
 	return 0;
 }
 
-- 
2.43.0

