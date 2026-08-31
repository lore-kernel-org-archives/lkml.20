Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154454AA41D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196998; cv=fail; b=SO18L2aSw+p7YlaxwIYwt/VwjdEBjXTbeNt2I9EAksW6YdmsyR4kJdBOmJ42JmDEMZ39nQwOPiVyfg0eAkhLXPyuJCqU99VNvAWEytR/irdmoEBNjhOhodWE9uMq1rXWN8c5Y9moJiGAbhX506rNQflzuwHhdkicP8c4PHpxelk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196998; c=relaxed/simple;
	bh=nITmBTgEhOV8hrkFdOvLx27Sdnma5rh0DoKAic1nd3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I3yYVoR+sghAu+0CVS2Mo6xXO6ZAg4EWqjN8oFItHHK4FjAZcwyCvMFhfSTdwaatdLCelMAK/Brc3fELEzicw8Ui4sOElUMxxYgDGI3ElXR4eNF1EuX7BIYJ+xC5mV0BwoaufySqnqy0I+P9ZQXdKbdxMUIFnvfV1kVrpjpP33E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HyYvjFS1; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HyYvjFS1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o09LK9m4zYVqVFGvq5Rt68/kDPgKMD7OC0mMFb/dV16hqHk+9dwr3FZxdT+aQBMn3hJMPRWKReUqsEteel2s00OYq8PgWDxFjLpClK32gzN+NHrzWcobDZdd2Lztr4ax+vrS+yb8Bz5eFkhSDiJdRxHByginJuRBz8Vzmu8TROXoWKFB/nqx7KT2rn4YppiBcXAeiNYjH74LEFeRsKvk8rL5C1pYusNLaxtTLc4xAZsPmKkJM3Ntsk2VKmADb9QshyqMZEcKy+3t0FxJxv6s9Bz5ellUXq+SzLX5X1O4PDok1XM77GgJnCVURDhJxq82Dx31/SzX/nYftPnWMQv/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1F8EhvxRsHNCE/li/Bbp9x+lqTT08lvh1eTHgoUQufc=;
 b=K9YX9qAaoUMdFblEmqUC5bMOIrdRr6a+tXQtzCWy3iPrmS3hrV4o5NJ/cgGhHY26JzPvPaDQfM1hVgW5mYuFs06EG59ChBudbCb0iVFrqRU2hQrjGnzmwjBtrDN4EYflCcn5xoA+QQs0ZafW5dKGeePk3UfJAGvklteF6vmO9OD5KiNCeP2hk3tBGzcBfQ044tIfc8hzKx00uKf4xnPefaBBjlTOv3+itClXxGABpCaVmz2QOnGQMCkbVUNG9DX/Dt+hIWbbc2cH1aDcqtnGJnmTEuN0zwXP87qqf+Gu196lpSqA5YIv5tWt98Qreu1KfRovM/efbvqFuGBM4Iujdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F8EhvxRsHNCE/li/Bbp9x+lqTT08lvh1eTHgoUQufc=;
 b=HyYvjFS1Zlm8CWFynqlWX6u9tsYoxn26t2VpC/1Aq7Rl6Xx92Jdnvn0IP+KgEjgjIeVX8hNewMxY5osH8NBzir65OsAQGnGWBZylLtK+um9lfKD5RD+BpnqmrTo9uBya/lSX+iRS9Ro3mk0tKbbKio0/jbX1eelwJk9n1rrTtExqFqRonMFNth1DTHoTqrWPO4v23Q3Zas8gYrZVCrlRUtUMRxLG60KRTY08SKnNiLHcDmHwwlixeKCsJmQKaiOfJdN0UHqahrl5VuysoRLSs9MTiNS+3gZij9h5k372lbcU+hayL32iHCw3uJH7UQiSra8O9DxhZaYj0DS/JCtSqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:07 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:23:07 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v2 10/19] arm_mpam: Handle CPU-less numa nodes
Date: Mon, 31 Aug 2026 10:22:36 -0700
Message-ID: <20260831172245.42253-11-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 97370465-ddf9-4541-eaaf-08df0784839b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|6133799003|18002099003|22082099003|56012099006|11063799006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	ZwRXEPZjRBP9RT6IUSZelV10LrIadruZClqfxXAKCf+s77BQr4Z48AkMuSbvZaZ0Kpa06PiLMDdoxLQ4XbgncSyrnwlLSwS389MWEBYjuJ3F5ALRWMgHf27ibpPcrlJR4Q/MPmfMreGRPszJ6A6c47qGlnurrJSy1FnI6tijLRJpE2XL4xqJzLloq4vvU9RUHn5GPO8Y6VC3NzeYOVdFJbWpd8b98ABipDfPK6+Gu52wLF0jwFuw0zmlBk1aLEJwOoejvdT8IOYYA9KUhz3dkXeI831UjGLk04TAlw8WDUX7xlrLq8HtKQ10aXGdB0PI6stTPxUG/f+N3fxfRFJ3txHf8iHunF9wtt8h4HNPzEQopCmQlTGgvTdAIULfY4yWSt9fBXJiUT9YllFXZt0erbhKRJkN4cASgRlhFYO60tg470LafZYU50sLVlAZaXvAy4+nNk2e4TfS6ZkvoB7m7N7OpjRIoGnvF+Mf/STup5qmx3j1Yp4jbc24wtZx0rh4yQPPMRFMXN/dBox7n4QYle3JPP2iqmozSkBet9ILGL5F1i0KQybMJeObDGiyZWgvpnD8tklMhaKP7wLGOSoUloJ3pQXA/sG9bLkp/ehwSxm+XKu2NsjGY7KrL8zpUwMir7I4OgzoTjiOelaqIWqMkS/c6dG1BYLKv1Q9ovdHTyvfssSGhElzNz62W/EEPoCKmUR1SKZI8z/exI+jKj/qtA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mdZr9gFFYeqHIdfiOZ45+v1dYcp4pvDhxXVok7SszkGwHjyFY8xwe+Y0DMfz?=
 =?us-ascii?Q?MbVkoly7a7ZgtalCeBQzDezsMplN0wwCWTJnnbsBvlw2n987MfAWSXvXH46f?=
 =?us-ascii?Q?Mpa6uTfQzT+SivU+LGfEMOwfpyBN7CDFfUVRF/NH4y+HQMr76Wv7QdSHYB1V?=
 =?us-ascii?Q?kieKjcRjt+d4m4mUIh7wd9bG9gwvKr0jPC5epDhxKeHUtM0TIpJeiL3Zw7rS?=
 =?us-ascii?Q?Z8CNucUFSp9I6AhS70garh106p0neprDmUK8KkFP/cp/gDs0UyoKZxDNkR10?=
 =?us-ascii?Q?yHjhhg4GhsIfWWQboLYwidzClV+ie7YJSIUjq4Q+bWwj/GfmcfT0OaHPfPE6?=
 =?us-ascii?Q?VMx6WT8ayelXtywrDcPr0yDDaSmD8VRlSw5wv2mv6BgLMOLKb7bUZg+giXt7?=
 =?us-ascii?Q?zGpq54XZSaSGLKJRaJkl8rIX/LomqVT3e3Y9+1GA+VGZqikxXrNHub7gHIGD?=
 =?us-ascii?Q?+KdpDhQdwNqifgnFsF0Bm2ej6QoVCd/TYsrCUliYB5p9RFVfnysmPEN+S5N/?=
 =?us-ascii?Q?hBtlas1+0ApLipnlaqb3qAtCif8xC527te9oYWFXLFAEnh5vTItKvfH3go4B?=
 =?us-ascii?Q?2MRkDN6U023EyHXDIzr8tzXK4epP3vK2EemzRZXx3f4z01xHlygH4TPK93EA?=
 =?us-ascii?Q?X6tt6TCYTxbSpA8xqmiT9raiW9KLdc1rm1UgBzKvvEUmc+nrDkFNfsAjoD/a?=
 =?us-ascii?Q?ftCd/hqGgG+8dK8iUEcTHtAdkJDJ9jeV7npUdEfIEez8vytXozXrCFHqAZ82?=
 =?us-ascii?Q?DXfMlj7cd3MkSqv8sckcvd9luffXxUC+3kqz1GxT321tLEq6EUo2UJJMNDv1?=
 =?us-ascii?Q?qj3HGmX7q/TcxH4NuGEndQLxBS53PortUwheQzg3D4kEj5ibua4dbBmcC0Ln?=
 =?us-ascii?Q?jaqsNNSzpjYHdIU/Zzx+/yu0GFHzYcmVG9sVyompN33qeN1lhT4dsQKHJlvN?=
 =?us-ascii?Q?m/e6E5tS57FfmvG7QAb4n/svRLA0LzU2+KBQ+lOiQ5RvvvqjkiLZjIpVKn8L?=
 =?us-ascii?Q?x88EPqQOJt1ubkP8TUop4d7DeuvKYQ64cFzhZRrqk8e8xqDK96jelb/To6Sy?=
 =?us-ascii?Q?7jbzrsQjOgeNoq+UIDn29Bg6/MSGYl/Rytvj2t4ysUOmmR4flQWQypPuZLxv?=
 =?us-ascii?Q?h9KLmhjcnuMh/B3jHYxhEAOjLU+CBOOVPVB24DT62hV99FPGynW7jWcgDnap?=
 =?us-ascii?Q?HVvQX68ffsJqKnigCFCqUC8GCi84zZGqTmm42drpHsuVNO8TtWl3ZGeP6ZZU?=
 =?us-ascii?Q?VbVgvBFJqXwrGb2sR6T7wTAluZSSdEYlPSY+l73WlUUD3J6P7JOCro6XrFhf?=
 =?us-ascii?Q?eAj13fh2zxnIh5+NNjJ9uogj3H0e0kqaKuNg6qSHKnWLbeSTHSQywvrIXpfI?=
 =?us-ascii?Q?PoPP8QeY67Sv45ZZZhOmZ2y2Fs7Rq7keCpfsKVc4OCLH+Ps/OiCjePsXvjXr?=
 =?us-ascii?Q?/KY8ya0BO5JFLFDBoDl6tnjOn8XScRYtuctMWy8kXNUCopIWWVG626uhbXnz?=
 =?us-ascii?Q?jiJaQO/Tfov14JGTJ7XQMAVpg4IYxcNIwux8bfah6ChO+R9K4hd+RxT5uLVU?=
 =?us-ascii?Q?678ydpgmAALxVwDrI8f1WC8D5hpGHTeyorXVEnQXkHqugYh5P7xwkb9ubOlP?=
 =?us-ascii?Q?FesCm7WZw6WG8e7RuKk9PIuLvUQoIxB9905K/wiT7+lez75KeybDmCWVKJ1i?=
 =?us-ascii?Q?P8JamEF+K2AG8UfL+ecn0TtiHnXXZbWlfi3qC2ZoNMPjSxbF4OoKCn3Z9+CF?=
 =?us-ascii?Q?tTtCyVRNCQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97370465-ddf9-4541-eaaf-08df0784839b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:03.6604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INKHqIAKzfHCUNDTCW2xrI6edx8o40h9nf+HrLUi1qEoRibsaQtBr6ga9yM6lRHAyjE8QrxS2oMlkyp/vbwdIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

On some ARM servers a NUMA node can expose a memory MPAM MSC without
any local CPUs (for example, a memory-only node that still participates
in bandwidth control). mpam_ris_get_affinity() derives affinity from
the component's NUMA node ID, so these MSCs end up with an empty CPU
mask and are never registered. Without a fallback, resctrl cannot see
or control bandwidth on those nodes.

When the derived cpumask is empty, fall back to cpu_possible_mask so
the MSC can be managed and traffic from remote CPUs is still accounted
for. Track the borrowed case with ris->cpu_less and keep that mask out
of class->affinity on create and destroy: those CPUs already contribute
through CPU-ful nodes in the class, and subtracting the borrowed mask
later would remove CPUs other live nodes still depend on. Emit an
informational message reporting each CPU-less node when this happens.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_devices.c  | 59 ++++++++++++++++++++++++++++-----
 drivers/resctrl/mpam_internal.h |  8 +++++
 2 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b69f99488111..cb6096e9d2cf 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -508,10 +508,13 @@ static void get_cpumask_from_node_id(u32 node_id, cpumask_t *affinity)
 static int mpam_ris_get_affinity(struct mpam_msc *msc, cpumask_t *affinity,
 				 enum mpam_class_types type,
 				 struct mpam_class *class,
-				 struct mpam_component *comp)
+				 struct mpam_component *comp,
+				 bool *cpu_less)
 {
 	int err;
 
+	*cpu_less = false;
+
 	switch (type) {
 	case MPAM_CLASS_CACHE:
 		err = mpam_get_cpumask_from_cache_id(comp->comp_id, class->level,
@@ -528,7 +531,17 @@ static int mpam_ris_get_affinity(struct mpam_msc *msc, cpumask_t *affinity,
 		break;
 	case MPAM_CLASS_MEMORY:
 		get_cpumask_from_node_id(comp->comp_id, affinity);
-		/* affinity may be empty for CPU-less memory nodes */
+		/*
+		 * A CPU-less memory node has no local CPUs. Borrow the CPUs that
+		 * can reach the MSC so the node still gets a resctrl domain, and
+		 * flag it so the borrowed mask is kept out of class->affinity.
+		 */
+		if (cpumask_empty(affinity)) {
+			dev_info(&msc->pdev->dev,
+				 "CPU-less numa node %u\n", comp->comp_id);
+			cpumask_copy(affinity, cpu_possible_mask);
+			*cpu_less = true;
+		}
 		break;
 	case MPAM_CLASS_UNKNOWN:
 		return 0;
@@ -582,7 +595,8 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 		return PTR_ERR(vmsc);
 	}
 
-	err = mpam_ris_get_affinity(msc, &ris->affinity, type, class, comp);
+	err = mpam_ris_get_affinity(msc, &ris->affinity, type, class, comp,
+				    &ris->cpu_less);
 	if (err) {
 		if (list_empty(&vmsc->ris))
 			mpam_vmsc_destroy(vmsc);
@@ -594,8 +608,24 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 	INIT_LIST_HEAD_RCU(&ris->vmsc_list);
 	ris->vmsc = vmsc;
 
+	/*
+	 * comp->affinity must include the borrowed mask for CPU-less nodes:
+	 * mpam_resctrl_online_cpu() matches CPUs against comp->affinity to
+	 * create per-component domains. Overlap between CPU-less and CPU-ful
+	 * components is expected; each match gets its own domain keyed by
+	 * comp->comp_id, not by first-match lookup.
+	 *
+	 * class->affinity is different: it tracks CPUs with a local MSC in
+	 * this class. A CPU-less node borrows the CPUs that can reach its MSC
+	 * (see mpam_ris_get_affinity()) only so that it gets a per-component
+	 * resctrl domain. Those CPUs already contribute to class->affinity
+	 * through their own CPU-ful node, so folding the borrowed mask in here
+	 * would let mpam_ris_destroy() later subtract CPUs that other live
+	 * nodes in the class still depend on.
+	 */
 	cpumask_or(&comp->affinity, &comp->affinity, &ris->affinity);
-	cpumask_or(&class->affinity, &class->affinity, &ris->affinity);
+	if (!ris->cpu_less)
+		cpumask_or(&class->affinity, &class->affinity, &ris->affinity);
 	list_add_rcu(&ris->vmsc_list, &vmsc->ris);
 	list_add_rcu(&ris->msc_list, &msc->ris);
 
@@ -612,11 +642,24 @@ static void mpam_ris_destroy(struct mpam_msc_ris *ris)
 	lockdep_assert_held(&mpam_list_lock);
 
 	/*
-	 * It is assumed affinities don't overlap. If they do the class becomes
-	 * unusable immediately.
+	 * A CPU-less node's borrowed affinity was deliberately never folded into
+	 * class->affinity (see mpam_ris_create_locked()), so it must not be
+	 * subtracted here: doing so would remove CPUs that other live nodes in
+	 * the class still rely on.
+	 *
+	 * Every RIS of a CPU-less component borrowed cpu_possible_mask masked by
+	 * its own msc->accessibility (see mpam_ris_get_affinity()), so these
+	 * borrowed masks overlap across sibling RIS. Such a mask must not be
+	 * subtracted from comp->affinity either: a component backed by more than
+	 * one MSC keeps a live sibling RIS after this one is destroyed, and
+	 * subtracting the overlapping mask would wrongly empty comp->affinity
+	 * while that sibling still needs it. The borrowed affinity is released
+	 * when the component itself is torn down.
 	 */
-	cpumask_andnot(&class->affinity, &class->affinity, &ris->affinity);
-	cpumask_andnot(&comp->affinity, &comp->affinity, &ris->affinity);
+	if (!ris->cpu_less) {
+		cpumask_andnot(&class->affinity, &class->affinity, &ris->affinity);
+		cpumask_andnot(&comp->affinity, &comp->affinity, &ris->affinity);
+	}
 	clear_bit(ris->ris_idx, &msc->ris_idxs);
 	list_del_rcu(&ris->msc_list);
 	list_del_rcu(&ris->vmsc_list);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index dfa3ceb734d4..1c9e0e8b78a9 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -369,6 +369,14 @@ struct mpam_msc_ris {
 	struct mpam_props	props;
 	bool			in_reset_state;
 
+	/*
+	 * A CPU-less memory node has no CPUs of its own, so this RIS borrows the
+	 * CPUs that can reach its MSC (see mpam_ris_get_affinity()) purely so
+	 * the node still gets a resctrl domain. When set, the borrowed mask in
+	 * @affinity must not be folded into the owning class's affinity.
+	 */
+	bool			cpu_less;
+
 	cpumask_t		affinity;
 
 	/* member of mpam_vmsc:ris */
-- 
2.53.0

