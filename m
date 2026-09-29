Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1221E53B358;
	Tue, 29 Sep 2026 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700972; cv=fail; b=u8tnsnbsmxGYCcT3HU+PIfE0Ui9ha9RIb9EwzZIpCH6GW6dozJS1QQ+7bzb3DunyLnaBNAat9J0NssI821N8I2UGx0epXPD1dg7j9GBP14SwAiic/WQ+v4BM1pJyly4+22GiAE+v/vO5r8WsR1hW+vcjiCqCNuLDm84LwK5I6N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700972; c=relaxed/simple;
	bh=Ad5XmpCI6OIjQQUiX9AFAFF8jPw92d16/9UZOqTLJ4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CEicpANpFddF3+/q2eW0Rmm2aLr/Nn2ok22wbli0HN/i10ruT6v/ODGp5JlqSLOOk9SxBPkGhc6VR1YgdMXK5R5wAX6g4Rte3rkdIDJY4kfl2//9BOXzu9HUE9Ku338aOO68uihk7V7IrGbPkc/xEbY7EOR8CYrxLircZTtkqms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MeP26QnZ; arc=fail smtp.client-ip=40.107.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MeP26QnZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqLTtenB7+qgI8SWhVtC0YnF9apjNJdOvka8bztRGmbRY2qZ2kO8ju57HDa44OJf++W0+2H9RSo8PG2S4r1d+1qCtSbYolvfqOleID3Fv+BKzpwBHdFKVBnSv2pEALULqmHNX2FVc5iNVT2bHm5cWM9rsq3sqqrKFEnvMp38z4/Mfy+uRQ/nJD7SQza8a0H9W3GSpZ8ELfXtQSsnOlNGL37lFUbv/N7pZkNCQvGzI1Be4HZuJpgCeqKnjOdU7RRzO2ZZLICmlKmRH9iLMpL1fTTRUbFafQJKP7jxjzhO8uvkhQAe6R5KS0Bma7MqwGm78zPncKv4/Ynm7ayN2Y3FRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3EgK+Pq2OSa8tGuyR+9zwVemQJ87+rRd+5XFuCg3RA=;
 b=s4w3k3xFc8CfcwKvOrzTptb0ONOn4X1xM6wHOXI7XJd0opERVG9iCkw0qpyk3W4/EimVN5KnC/jwQDjUkqP7nSP9E9n9nYP8AW2QeCCyYf1zmnmyvTXJurQ2j1NJj3mkEp4up1HI+n/4VwVB60Pm6vQlWqEtOWjDYGr5McrThQuncB/6rfdgDG9Ki11m8Q5XI3N0QQVuYAEbabZbnc+53fg9r9FEJ/beVpv33/NHdc+eCk5b4p5M9DB0rvXtWQDlIG3CXE7LYHNnE2vJYBTHCD2yyezhJoXKZMmRQj6XW5rgaVmqzwVthXqZ/7ybVTzsEn2HzNHHSX0q8Cj60YOgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3EgK+Pq2OSa8tGuyR+9zwVemQJ87+rRd+5XFuCg3RA=;
 b=MeP26QnZXveB9K00eK+Gd4B5CnTk0+h7xQXwSwwGG/DAE4cQ2uFbQHJvFL8fwaLd/N/dy73OwJXz+Dw1DB32iZJcG50nqgbbrFdr6am+wbO3a3wiJ9CI7RWWcTnmyCViIMTKIuFbp4aL34h3xiCdQDUen5S53ycYR2kkPPgZtiAPLLGx/nUAyJntqFGVpgSpG8q870kvO6sjeJJch+8DceT242YxuNiKqyrzmafIfg95fU79m1VYY06oDyFaKhuZrCffYBCo/qaIZCyH9WHSQ3/mGqkvHhTl0BNqZICV1ryFk2o4jPgQbJlw1IU+4RRjylltvzVLge4mHroQaBcS6Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 16:56:03 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 16:56:03 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lee Trager <ltrager@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] sched/topology: Add asymmetric SMT packing override
Date: Tue, 29 Sep 2026 18:54:41 +0200
Message-ID: <20260929165538.726616-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929165538.726616-1-arighi@nvidia.com>
References: <20260929165538.726616-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0024.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::6)
 To DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: f82fac17-70bd-4bd6-c783-08df1e4a8c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|10067099003|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HrWlNETenyLEDs2QM6+uAPfKoMc5ju3917ucMl4EIJOXaaKylqA8OL8zAI7zE4tY/KGNcILkG5mDLbIg4l0odOASeLJPqhMNZA8tkHC1FgexePcVjJp8T2iXofPyt8v7I/isqNFUwjrEG8zLxH0sHhe2wKVKWC7lbOcfiy64680m43gsQ7Ee2ug+ZHfI9LFuLdINjVHb5FrwQsLhiw56L6d7HeKaduQcnUAgzPgYBMoNHoGURTOV89vjSXQgS0tJxJkildPqg/8mIkDBI5ZEBsiAF+uq1W1wanR1EjxWZjmC3YiPAWuSpaJtUNjU3grqf972TJ7CeCIcPKG/tDK2ZDyfWJsJjLE4K2loJhI7wIJt9TIHCe9SACbEOaT2OlflSPXFjR3wXBDvyjTQhG35pQAiepZCwXaWR4o+3f94kClAOyMfMQTNHBh3tCoa3j9dOYUbkVQ2xwVxT0Uyb7Mf15Dndi7SGXZQnfDyaWYgq9/guiHRdhD6ZNDqEsDHg26II3vzjWnE7omvlH0wqcfRpSp5YugEq+uMr8kcbJVuvXhKWLCe/ZZaT+UzDMAPXN4Ukve7I8M61S8zUP+hPmZ5h3BbLGKmEwMpLQuUZIdhnV4y4ZgHdkObKWezxxK/9Kbw6RmGYMOsxWXiYIs6b7SFIy8i21ZLnGPajYQK6+wN7jI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(10067099003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2I5/dBKR8uBrkBiMTOJvHx2NfrHrChIYVMgcvOVnNg/uAeBXhO/PYKYcBtf8?=
 =?us-ascii?Q?AwZzIv2U54YLBmxPOJMNDARzewgQB+iBxztLaLaXFijrehl1MM6FWj3J+PHg?=
 =?us-ascii?Q?W72TgNEpDCsuiWkNrQds/VCOdipCUSiwUHpa5L2McZ0jq1RbHRNlNDJdkkod?=
 =?us-ascii?Q?xiad225ofvxxqoK/zuN6GtBmIJs4hQKADV6zopdJ9Gc+PLDqr7WNpS53oMGi?=
 =?us-ascii?Q?xDmpANRCn3eLddDI/4dlJQniIkv+1EXSlsIC5sqaU777Dfu5azonhtdVRC9x?=
 =?us-ascii?Q?IJWcaTObQL1zlBP9Ofmbk7mmDo31iuJ0nKbGWArg4IHWFq160RED1JCM04GW?=
 =?us-ascii?Q?Nb7EC45GSJJnsF5Cf6EtPVjIO8UQLEMdvIDBPPllEbZ/L3bbFKEmQBW2Ck6l?=
 =?us-ascii?Q?UVwJBw5plA8iVGwfS6AO8p5mubxUgAPy41HTQ9qRivlxVORLf2RpZKIxJN1L?=
 =?us-ascii?Q?dU2eT/oFK7ICUVcsyyUPaIaJg2fCmqG1sRZ1fzJUtHVjLEMwlOMQMJ+xP79w?=
 =?us-ascii?Q?FVdNIh4w2PF/OMiocZgFhrZ+tomktjcMuffrFRdhNrv6bObdnwvkn0ynknRY?=
 =?us-ascii?Q?Vhui/igFxOFT0EpYBlcZabSYrvCnqwnIEve/7Oxf6TiolgzQJIHeyrd55OvU?=
 =?us-ascii?Q?9B9ZckBcCJqNFkVJo8h9pQ1gFIKyGujpxwgNqbZj6W7R9FFayLRk6JImGWlk?=
 =?us-ascii?Q?taZPl8NMaQgzHPNUJseiH2WC6y8Hz7XN4Qwx9W68uRZtpt6WOyL+1bGb3T/H?=
 =?us-ascii?Q?BgA8FInljGWYazLqzkfnmdkPn76R+KlNFjFbmc4tmMyl8nenlVn035WxTYF0?=
 =?us-ascii?Q?0Rhq25u7xgCDO7cW3nRLLnQAEgBN4HAfJutUFdjISg9dHskEbWBg9iHckEjj?=
 =?us-ascii?Q?NrDmx4AFlnZO1z4+V4SnDrDufkb5A03dqQSFgN+3rBzACUMyvhlF2Gq1H2NK?=
 =?us-ascii?Q?XZM2SS8h+6V+6ZZSv8cQm1mPukVxS8aOIwwMjpMeEHv+HWSP1XKxiz9sgJAI?=
 =?us-ascii?Q?w5Z+H2PV2rVzK6E3reOwkiclgFLKEiHW1KPJVkE2xuYRiFwH+rTYKjRBiPBz?=
 =?us-ascii?Q?j+tU8675pRzfyCC9KCXRIhhlLSk7AXK4kP6D2NhGjrUl8v0Jn1E8ViZz8Ylx?=
 =?us-ascii?Q?W+B5ZpJaYXV+DVHdULNZ7zYGx03ATLm+rErfGw6rj2NgfwJAUyae29p7poxq?=
 =?us-ascii?Q?gWwpXU4ltfCwVNjNiLxqf9/vppOoUv/h3aomm3PU2Abtlj2qvt0zpJocJa8t?=
 =?us-ascii?Q?vRHCS9Ym/x+YXCS3uDYHyPe9fcOBAmaYL9PuNW5/iGpRhb5wQL6uVjdRTic6?=
 =?us-ascii?Q?c4VTKnOTUNMk2q1EsCCIal2P0IJxy1iCz/tto3zmsUxQoiHv37t/bbvwKPv7?=
 =?us-ascii?Q?nKib1LWWRIlLRiYWZUxZgbkRDPfQF0AJ1NIkm8nPsmG4FKSFkpNuQOtXl1mF?=
 =?us-ascii?Q?2P4cO/LYqEMsgg23P1jmzvwS0MlXwtSp4na+9O2xum+qVf4WbqB2r9PPa1sf?=
 =?us-ascii?Q?wjge5mY42aGJPED0hYiTBOEdb1sGgPlzPnsOfTKF+Qe47Niy1oGAQ6Q1IYar?=
 =?us-ascii?Q?WDFd3F142GwTAxF8z9j7eQrdvv5RcyebU8+g3bxBhveyZYvvV/bMmsO+LwoS?=
 =?us-ascii?Q?+iQ/UcUbdmd+zMFntUk3VVTZCRd+zqO1J2EWrtka0OqCbbeoD1JHf1mQ3wKb?=
 =?us-ascii?Q?aJk+skLYQPnF2vGM/1MnWR7wINXna0asw+obKgmogA426pw67eM41A7t9NVd?=
 =?us-ascii?Q?/xZOBqu1ug=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f82fac17-70bd-4bd6-c783-08df1e4a8c07
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:56:03.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nppver5+eef1PVVVcBS9XH6nahf3jXo/APkM4H5+Di3H8MpHP6mlbSK4OllO/JWS1lHcU0B3cDow0QmX7sahlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620

Architectures can use SD_ASYM_PACKING to describe preferred CPU ordering
at the SMT scheduling domain. Some systems benefit from this policy, but
their firmware cannot describe the preference and inferring it from the
CPU model would embed a platform-specific policy in the kernel.

Add sched_smt_asym_packing=on boot option to force SD_ASYM_PACKING at
the SMT level. Omitting the option preserves the topology provided by
the architecture or firmware.

Apply the override centrally to domains with SD_SHARE_CPUCAPACITY so it
also covers architectures with custom SMT topology callbacks, including
powerpc.

When enabled, priority remains defined by arch_asym_cpu_priority(). The
weak default prefers lower-numbered logical CPUs, while architecture
overrides remain authoritative. Siblings with equal priorities remain
unordered. In particular, x86 with CONFIG_SCHED_MC_PRIO normally gives
both SMT siblings the same core priority, so enabling the option there
does not prioritize a sibling.

Tested-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 .../admin-guide/kernel-parameters.txt          | 12 ++++++++++++
 kernel/sched/topology.c                        | 18 ++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e0cde..8157ff434cb5e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6800,6 +6800,18 @@ Kernel parameters
 			solution to mutex-based priority inversion.
 			Format: <bool>
 
+	sched_smt_asym_packing= [KNL,SMP]
+			Format: on
+			Force asymmetric packing at the SMT scheduling domain.
+			Idle CPU selection prefers siblings with a higher
+			arch_asym_cpu_priority(). The default implementation
+			prefers lower-numbered logical CPUs, but architecture
+			overrides remain authoritative. Equal priorities do
+			not establish a sibling preference. For example, x86
+			with CONFIG_SCHED_MC_PRIO normally assigns the same
+			core priority to both SMT siblings, so this option
+			does not favor either sibling.
+
 	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
 
 	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 3dab0253976fb..919d0fb00bd9f 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -32,6 +32,20 @@ static int __init sched_debug_setup(char *str)
 }
 early_param("sched_verbose", sched_debug_setup);
 
+#ifdef CONFIG_SCHED_SMT
+static bool sched_smt_asym_packing __read_mostly;
+
+static int __init setup_sched_smt_asym_packing(char *str)
+{
+	if (strcmp(str, "on"))
+		return 0;
+
+	sched_smt_asym_packing = true;
+	return 1;
+}
+__setup("sched_smt_asym_packing=", setup_sched_smt_asym_packing);
+#endif
+
 static inline bool sched_debug(void)
 {
 	return sched_debug_verbose;
@@ -1954,6 +1968,10 @@ sd_init(struct sched_domain_topology_level *tl,
 	if (WARN_ONCE(sd_flags & ~TOPOLOGY_SD_FLAGS,
 		      "wrong sd_flags in topology description\n"))
 		sd_flags &= TOPOLOGY_SD_FLAGS;
+#ifdef CONFIG_SCHED_SMT
+	if (sched_smt_asym_packing && (sd_flags & SD_SHARE_CPUCAPACITY))
+		sd_flags |= SD_ASYM_PACKING;
+#endif
 	sd_flags |= asym_cpu_capacity_classify(sd_span, cpu_map);
 
 	*sd = (struct sched_domain){
-- 
2.55.0

