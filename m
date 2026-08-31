Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4ED4AA583
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197000; cv=fail; b=KWLnWyJPTE2MWEaCQkdWqQtQqNYne1S4616PLfl9UJv3vqkAEjX7NaUKhYdkR2bX8yiJ6iM+1e3OKm/dHJ2arbjpwnaK1rHiosl62HuKSpVq9ZH9vyDZhRU78jY5nEGPBpt/0XjCA9H1TiSJvJ5gABvAEjDr8LPla5RwUm50qCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197000; c=relaxed/simple;
	bh=ZUL/a5X7yelYbXPkVNdR1F2wWUlWck1nDH5sW1tkZSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AGQ/E6R4TEL0sbO5ckkNpeBIlwi0fwOtZWuhtejHeDSUwF27xnbf2lW26gr16RiADWKnAg4eLCy34+O5L+9c18zwG/Eaig/0WGhMeqC6P2dE64RawYcOW8bqF36EsnvgA6NujAwcxGz9y/H+vCyX530188YgY8S+tgQSfLbrNss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LM3faEYq; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LM3faEYq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqGebK7S5nlimHchG0NdDpZajGL2A2OQKXvm5qIdpyXSXpy9SFjNo+KYoJ+hMcznfC+SwGoVbsKNv0dqC68AjEK9mZR2FB8BlNwCHoCzmGfaxpD28cCTRPTbohY4H7ik3Sv1YqqB4AgLpqZkkHB80Lnq8W7gJZbqv8vDM4RyFeRbSJ71VnTBHEOvIP9y7oZqIpmoT0D966zI4hgQcsclHbCWcMbSJR7fIOarNzfCDa2sClXvoz9y6yvK7z+GZHg9ZU1tJJEfA9NqRn/gEamnWRIR6QUmYw1jgjT12QCj2WpKzNE6AnuHzW6Zb8HTXUzGid00USImlEFO0I0t4iuQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyJCB9FM+z0vQAouESmFXjommytEM/9Ede198WLnM0M=;
 b=pTSyPD39aAwvZkmyV5Q3hB38EEsvPZnQ9H3xaCWjhlb23a106J28fAQQNhHkN4hupRHWGjKaDA/UmNAz9LV8RqOarepEYFND5IjstbvHbQu7o3XcVLqWpBaih/j3fpp/HvClO1Mw7vjR/XxnGrRRu4p/9NGcqAbLwE4GC5RQnrxmdr2bltBcA8hi/oUWkey/sylIhcAcRxbjsDAEI0kEzVXZnsS/CBAmyp9auXohfixpDRKvMnoDcs6mszeyKHV6dKQpWCAuzx7pLfNTwdEmHFSNjiR5m/QAisGl9MuzrJPeJfsi7EgAsuYhNmAtuoY+/8Ud46AFZSAfe+Zy5Rl+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyJCB9FM+z0vQAouESmFXjommytEM/9Ede198WLnM0M=;
 b=LM3faEYqOzbWx5IdUMtn2fbuR8p9W4YPXj/q1nCAVLGE58n5cXGqdp7/n9vy7yInZRPIYt5gGJmXUYM58j8dTjhp5udEtYEDsRpamfJuCletP39OX6X1PQfLrxkcO+eGWvlNYWHMS7f3X6K9UB/YIBZHpW+HWkF37RPVZfV4on/tqE1fm+dN4LGG/vR/P53q0o1qCMoz94wAKvNAeJkWT3hscK34g5vYQ3k5UdLz5XAQcL/RTc+GAM3v5voO9olzYOEm6FKjsYwQCg4m0ZKi4xYqhIR8dOYNBU1NPf14JWlnpoW+GjSg/PpKl9omp7tMqBM+Ii08oBXIUSQgR+GffQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:08 +0000
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
Subject: [PATCH RFC v2 11/19] arm_mpam: Emulate MB control with node-scoped MB_NODE control
Date: Mon, 31 Aug 2026 10:22:37 -0700
Message-ID: <20260831172245.42253-12-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::8) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a49db6b-2c51-472d-b3a9-08df07848446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|6133799003|18002099003|22082099003|56012099006|11063799006|3023799007|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	n7VkTYewpii0iMw7Bz9mu0DC2Eda+nZd7oee7tTT9GmTtXx+hkVk2hVk4tF76BVn/y/o7+HFRZDiGCCy1bI6y4mU2ddB5DTWX4OImuHcyOSYTOnUAaqduS/Vrf/YCBGwUmQECDw+YbkHpeIbYWPThR+P+sQonYV2+NCcgmjeNFs7uKaXS8BNFvADkX/75JAUTiWkk8TtlpCfGw529ShcIxOgo3UNkwtdUQLV+kRAryzrKCsmryh/iOHdIz8GToTLAswJx2aQaCdbH0LoJhJqXwe/VbptPXlU5+cauRKGnJlcw9dGqAQiByFTXYwuwhz4kJ1UEhpxBfkI/EAqAQo0pm4DWwzOyR9vza2SKiC3ZlwRZd7I/POUh4UjBkZufbfluoLvEUi1mieFR9L3RI25Wz10E6+BQc6JV/3OgJixwuJmxwJDxAbIk7AqhAczqNVPoTR1AxNBw9+7e7hsvucFaVIIObquQoQEW2VSN8dHhnF72XALc93/eMDNn7FH2dGx5cnHpo/L1DNBTNI5U6SmeIdlJozKyQg719fkXawkohmgzqtZfNmUj2k3BGPPzAoaeZQsGO8CxHPUlLy8UV1yNYcF4d+sGew3tLzW/FUQ71vIJWXOfk0znjcdTyWF7sL05m2fLf2Ya+frcXBWsA64Mfp6U6j+METbMXYgwztzHxKIcVnImzHp3pkM5YUH4v26VOFO++bBpXXjC6f7S0F4og==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PqAzQbNom604zzR4D4Kpju717fGDhXC6exLW1CJ2H1eIMyOrYWKs5sanCiyh?=
 =?us-ascii?Q?wNxLTBz6C1ClE5ZhOlrnS7PXr3hGCN0LIW693KSI3hEDbTiv0nNSO/nHycTB?=
 =?us-ascii?Q?8DRNb+4fWNU/xshUv/GvndqiQ0Re8EbFfPqpZIku5O/FiMsMiC22Tz754dDS?=
 =?us-ascii?Q?xWGqeP38AhVh0SOFA+0f27Q6hZBibqpSoJynbU2S5m8ssAcl71aSmNh6rqss?=
 =?us-ascii?Q?gn2pYNsfCJSOa6WCIOEu5bXWv/oQEFB0YkPjDsrwQ6HSmE/goUeVMED1PvoU?=
 =?us-ascii?Q?3uesAalSaIU8VFbb9TeZaT/qQ9kK3/SFiCigH/JhkkdSco9aR6hISYdNVwN6?=
 =?us-ascii?Q?QbVstdRNl0P2Ocv5m0qbR5MNWFtNi49Ob4oCC6I7l+3AZ6367bhX9lyNurOY?=
 =?us-ascii?Q?wL4+Nu8+vvt6GLb4PQBK1UCf2I4BbKBLxZ5ZFtCwc+6oT6OLy6D0FPzvE5be?=
 =?us-ascii?Q?1K/bsU6kkMyEIUO9si0BbpsgE94y5baL6UOXmKO42W+1riC41QBhyDXZKXBk?=
 =?us-ascii?Q?gCcTxLJ4/kG7aJNylXf6GE7EwOZCCC932blUZOV1wRoGtuM7J5DjAldVIKUn?=
 =?us-ascii?Q?/F2/yePRPoXzyWQeZv1yYAXlBooGO9EY5O8zLOZh2LhAUv0JGIeH81upTg69?=
 =?us-ascii?Q?KVYNYlIaJ7gHz9hQRNdZk68SsyOHJV6Dv3hYKIyqLlCNLS5ezP42TC9JfuQ0?=
 =?us-ascii?Q?C3d2NA/lHrUC5B5bXBLknok8vW3cItxUfoYzcjn1HXjjQS7zoe/1B5kA5lAB?=
 =?us-ascii?Q?smlArSMBHTf8O0ZDv6B2DfR0CO9IP+UOSMxvFo0PR8c97zxFIysB32ge/ik+?=
 =?us-ascii?Q?17AaecB4+I7HhBq1kssRuDqYd/jq20bPIr2pUMa/VQmKcR2o7yL+GuLwW75w?=
 =?us-ascii?Q?dKH2EAQR5ptX9khxt6CNQfQ4SYCL3gH4dlI0RmdxGW0nHIen7V1RTEt4neoX?=
 =?us-ascii?Q?yiqgqLqHFCz7av/Dpze3UQoK9h1CiGMmbyZn91HaZgCbvehHSe+kHK+INubd?=
 =?us-ascii?Q?hIrpugMAjqFqdbrIGjQeRIDFSzSBIg9g9New5Tw/qHD+obPHJHOtosheuxmd?=
 =?us-ascii?Q?SdwDeWpxAwF8KFv5SE1iZFARQsndTz3K9P+3cO14CuT7nsORAPr3sBsIFIQu?=
 =?us-ascii?Q?/oQhfPheKLfrlySt42ioH3BopOkikXAkQ/MP8S23IyTVKjeW7XIM1m1W1kQC?=
 =?us-ascii?Q?MQ1lCj+GWkPd0ltxP4KvsBtyrwRpawMliZgBKm+GZ2PQuc/O1QLnoWzR2Yo7?=
 =?us-ascii?Q?jc45QAuggeAWVzV2CMF+CVIjs5jLf1eGHyzb8TB8v9rdlQnj+R1H1V6XcM7L?=
 =?us-ascii?Q?LcFdqiXRRqp0DPplPBaQk3VH3g34oDgL9yIIkpUCZu5S2CUjaJv/N7mPl5G+?=
 =?us-ascii?Q?Vtz50Xm2vAKEOlpm0MF/Ma2MnOD/Pyca7u5P1bso6KxXdZVX3p7JcWjOPjTq?=
 =?us-ascii?Q?zNXG8tyJ4t8YrxjyDZmonJWdzz2vWJarEkbYpT782b8UMTnS1YpPzmfgH5OJ?=
 =?us-ascii?Q?5yqDDLgDwCdhxYP9lUy4jRhf1MX4lbG7gYBZfYI0GKKuyYaEcfyxdkeK4f+R?=
 =?us-ascii?Q?6+76+9cQ61YFZB+Qhlw5nGcjy5mRBQURLfqYvURZUS6g8nwbT4QwhNRihPq3?=
 =?us-ascii?Q?8djW/KGqcLo/EC7d/nKP6ixNuk0b65tRjICObrqACln4JtiIR7H8hcaWgrkd?=
 =?us-ascii?Q?eyLE3D9C2aeFS0f+TdwNG9cIZLFHfLc9Z4XQUITUKPDlxFbLDGZy8i4SIpBn?=
 =?us-ascii?Q?iHTjuw/7Vw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a49db6b-2c51-472d-b3a9-08df07848446
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:04.7179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCN+p3Kfh76yhsOJEDCk19EcKkS5oVUchtye84X1eXOdbikufsnLXVzrlmdV3jQb/1HwFQWMT6vtlEYqeeytUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

On memory-class MSCs the MB bandwidth control is node-scoped. Add a
node-scoped MB_NODE control that emulates the default MB control by
adding it to the default control's resctrl_ctrl::emulated_by list, so
the legacy "MB:" schemata line keeps working while user space can switch
the resource to native mode to drive MB_NODE directly.

Introduce mpam_resctrl_ctrl_node() to identify memory-class resources
and use it when selecting the control scope, replacing the open-coded
assumption that MBA is always cache-scoped. A memory class has one
component per memory controller, so its control domains are node-scoped
and rdt_resource::ctrl_scope becomes RESCTRL_NODE.

An emulating control has its own control domains, so give the MPAM CPU
hotplug and domain update paths a walk of the emulated_by list.
resctrl_arch_get_config() and resctrl_arch_update_one() accept the
MB_NODE control name alongside the default one, both being backed by the
same MPAM bandwidth partitioning hardware.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 265 ++++++++++++++++++++++++++-------
 fs/resctrl/ctrlmondata.c       |   1 +
 include/linux/resctrl.h        |   2 +
 3 files changed, 211 insertions(+), 57 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9a02bc0e091d..cd9bebf5f0c2 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1264,20 +1264,108 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, evtid);
 }
 
+/*
+ * Bandwidth control on a memory-class MSC is node-scoped, unlike the
+ * cache-scoped control provided by an MSC in front of the L3.
+ */
+static bool mpam_resctrl_ctrl_node(struct rdt_resource *r)
+{
+	struct mpam_resctrl_res *res;
+
+	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
+
+	return mpam_class_memory(res->class);
+}
+
+static bool mpam_resctrl_cache_has_mba(void)
+{
+	struct mpam_class *class = mpam_resctrl_controls[RDT_RESOURCE_L3].class;
+
+	if (!class)
+		return false;
+
+	return class_has_usable_mba(&class->props);
+}
+
+static void _mpam_resctrl_ctrl_init_mba(struct mpam_resctrl_ctrl *mpam_ctrl,
+					struct mpam_props *cprops,
+					enum resctrl_ctrl_name name)
+{
+	mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_SCALAR;
+	mpam_ctrl->r_ctrl.name = name;
+	INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);
+	INIT_LIST_HEAD(&mpam_ctrl->r_ctrl.emulated_by);
+
+	__set_bit(RESCTRL_SCALAR_FLAG_LINEAR, mpam_ctrl->r_ctrl.scalar.flags);
+	mpam_ctrl->r_ctrl.scalar.min = get_mba_min(cprops);
+	mpam_ctrl->r_ctrl.scalar.max = MAX_MBA_BW;
+	mpam_ctrl->r_ctrl.scalar.reset_val = MAX_MBA_BW;
+	mpam_ctrl->r_ctrl.scalar.gran = get_mba_granularity(cprops);
+}
+
+static int mpam_resctrl_ctrl_init_mba(struct rdt_resource *r,
+				      struct mpam_props *cprops)
+{
+	struct mpam_resctrl_ctrl *ctrl_def, *ctrl_node;
+
+	ctrl_def = kzalloc_obj(*ctrl_def);
+	if (!ctrl_def)
+		return -ENOMEM;
+
+	_mpam_resctrl_ctrl_init_mba(ctrl_def, cprops, RESCTRL_CTRL_NAME_DEF);
+	list_add(&ctrl_def->r_ctrl.entry, &r->controls);
+
+	if (!mpam_resctrl_ctrl_node(r)) {
+		r->ctrl_scope = RESCTRL_L3_CACHE;
+		return 0;
+	}
+
+	/*
+	 * The control domains of a memory class follow the memory
+	 * controllers, one per NUMA node.
+	 */
+	r->ctrl_scope = RESCTRL_NODE;
+
+	/*
+	 * When the L3 cache has usable bandwidth control the legacy MB control
+	 * is backed by that hardware and needs no emulation.
+	 */
+	if (mpam_resctrl_cache_has_mba())
+		return 0;
+
+	ctrl_node = kzalloc_obj(*ctrl_node);
+	if (!ctrl_node)
+		return -ENOMEM;
+
+	_mpam_resctrl_ctrl_init_mba(ctrl_node, cprops, RESCTRL_CTRL_NAME_NODE);
+
+	/*
+	 * MB has no bandwidth hardware of its own, so back it with the
+	 * node-scoped MB_NODE control. Legacy mode keeps the "MB:" schemata
+	 * line for backward compatibility, native mode exposes MB_NODE
+	 * instead.
+	 */
+	list_add(&ctrl_node->r_ctrl.entry, &ctrl_def->r_ctrl.emulated_by);
+	r->ctrl_mode = RESCTRL_CTRL_MODE_LEGACY;
+
+	return 0;
+}
+
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 {
 	struct mpam_class *class = res->class;
 	struct mpam_props *cprops = &class->props;
 	struct rdt_resource *r = &res->resctrl_res;
 	struct mpam_resctrl_ctrl *mpam_ctrl;
-
-	mpam_ctrl = kzalloc_obj(*mpam_ctrl);
-	if (!mpam_ctrl)
-		return -ENOMEM;
+	int ret;
 
 	switch (r->rid) {
 	case RDT_RESOURCE_L2:
 	case RDT_RESOURCE_L3:
+		mpam_ctrl = kzalloc_obj(*mpam_ctrl);
+		if (!mpam_ctrl)
+			return -ENOMEM;
+
 		mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_BITMAP;
 		mpam_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_DEF;
 		INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);
@@ -1308,20 +1396,11 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 		r->alloc_capable = true;
 		break;
 	case RDT_RESOURCE_MBA:
-		r->ctrl_scope = RESCTRL_L3_CACHE;
-		mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_SCALAR;
-		mpam_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_DEF;
-		INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);
-		INIT_LIST_HEAD(&mpam_ctrl->r_ctrl.emulated_by);
+		ret = mpam_resctrl_ctrl_init_mba(r, cprops);
+		if (ret)
+			return ret;
 
 		r->bw_throttle_mode = THREAD_THROTTLE_UNDEFINED;
-		__set_bit(RESCTRL_SCALAR_FLAG_LINEAR, mpam_ctrl->r_ctrl.scalar.flags);
-		mpam_ctrl->r_ctrl.scalar.min = get_mba_min(cprops);
-		mpam_ctrl->r_ctrl.scalar.max = MAX_MBA_BW;
-		mpam_ctrl->r_ctrl.scalar.reset_val = MAX_MBA_BW;
-		mpam_ctrl->r_ctrl.scalar.gran = get_mba_granularity(cprops);
-		list_add(&mpam_ctrl->r_ctrl.entry, &r->controls);
-
 		r->name = "MB";
 		r->alloc_capable = true;
 		break;
@@ -1484,7 +1563,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 	struct mpam_props *cprops;
 	struct mpam_resctrl_res *res;
 	struct mpam_resctrl_dom *dom;
-	enum mpam_device_features configured_by;
+	enum mpam_device_features configured_by = MPAM_FEATURE_LAST;
 
 	lockdep_assert_cpus_held();
 
@@ -1512,16 +1591,26 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 		configured_by = mpam_feat_cpor_part;
 		break;
 	case RDT_RESOURCE_MBA:
-		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
-			configured_by = mpam_feat_mbw_max;
+		/*
+		 * MB and its emulating MB_NODE control are both backed by the
+		 * same MPAM bandwidth partitioning hardware.
+		 */
+		switch (ctrl->name) {
+		case RESCTRL_CTRL_NAME_DEF:
+		case RESCTRL_CTRL_NAME_NODE:
+			if (mpam_has_feature(mpam_feat_mbw_max, cprops))
+				configured_by = mpam_feat_mbw_max;
+			break;
+		default:
 			break;
 		}
-		fallthrough;
+		break;
 	default:
 		return resctrl_get_default_ctrlval(ctrl);
 	}
 
-	if (!r->alloc_capable || partid >= resctrl_arch_get_num_closid(r) ||
+	if (configured_by == MPAM_FEATURE_LAST || !r->alloc_capable ||
+	    partid >= resctrl_arch_get_num_closid(r) ||
 	    !mpam_has_feature(configured_by, cfg))
 		return resctrl_get_default_ctrlval(ctrl);
 
@@ -1582,12 +1671,19 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 		mpam_set_feature(mpam_feat_cpor_part, &cfg);
 		break;
 	case RDT_RESOURCE_MBA:
-		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
+		switch (ctrl->name) {
+		case RESCTRL_CTRL_NAME_DEF:
+		case RESCTRL_CTRL_NAME_NODE:
+			if (!mpam_has_feature(mpam_feat_mbw_max, cprops))
+				return -EINVAL;
+
 			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
 			mpam_set_feature(mpam_feat_mbw_max, &cfg);
 			break;
+		default:
+			return -EINVAL;
 		}
-		fallthrough;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1650,9 +1746,17 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
 	 * controls? How to communicate to user space?
 	 */
 	for_each_resource_ctrl(ctrl, r) {
+		struct resctrl_ctrl *em_ctrl;
+
 		err = _resctrl_arch_update_domains(r, ctrl, closid);
 		if (err)
 			return err;
+
+		list_for_each_entry(em_ctrl, &ctrl->emulated_by, entry) {
+			err = _resctrl_arch_update_domains(r, em_ctrl, closid);
+			if (err)
+				return err;
+		}
 	}
 
 	return 0;
@@ -1915,6 +2019,81 @@ mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct mpam_resctrl_res *res,
 	return NULL;
 }
 
+static int mpam_resctrl_online_ctrl(unsigned int cpu, struct mpam_resctrl_res *res,
+				    struct resctrl_ctrl *ctrl,
+				    struct mpam_component *comp)
+{
+	struct mpam_resctrl_dom *dom;
+
+	dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, res, ctrl, comp);
+	if (!dom) {
+		dom = mpam_resctrl_alloc_ctrl_domain(cpu, res, ctrl, comp);
+		if (IS_ERR(dom))
+			return PTR_ERR(dom);
+
+		return 0;
+	}
+
+	mpam_resctrl_online_domain_hdr(cpu, &dom->resctrl_ctrl_dom.hdr);
+
+	return 0;
+}
+
+static void mpam_resctrl_offline_ctrl(unsigned int cpu, struct mpam_resctrl_res *res,
+				      struct resctrl_ctrl *ctrl,
+				      struct mpam_component *comp)
+{
+	struct rdt_ctrl_domain *ctrl_d;
+	struct mpam_resctrl_dom *dom;
+
+	dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, res, ctrl, comp);
+	if (WARN_ON_ONCE(!dom))
+		return;
+
+	ctrl_d = &dom->resctrl_ctrl_dom;
+	if (mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr)) {
+		resctrl_offline_ctrl_domain(&res->resctrl_res, ctrl, ctrl_d);
+		kfree(dom);
+	}
+}
+
+/* Controls that emulate another control need domains of their own. */
+static int mpam_resctrl_online_ctrls(unsigned int cpu, struct mpam_resctrl_res *res,
+				     struct mpam_component *comp)
+{
+	struct rdt_resource *r = &res->resctrl_res;
+	struct resctrl_ctrl *ctrl, *em_ctrl;
+	int err;
+
+	for_each_resource_ctrl(ctrl, r) {
+		err = mpam_resctrl_online_ctrl(cpu, res, ctrl, comp);
+		if (err)
+			return err;
+
+		list_for_each_entry(em_ctrl, &ctrl->emulated_by, entry) {
+			err = mpam_resctrl_online_ctrl(cpu, res, em_ctrl, comp);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
+static void mpam_resctrl_offline_ctrls(unsigned int cpu, struct mpam_resctrl_res *res,
+				       struct mpam_component *comp)
+{
+	struct rdt_resource *r = &res->resctrl_res;
+	struct resctrl_ctrl *ctrl, *em_ctrl;
+
+	for_each_resource_ctrl(ctrl, r) {
+		list_for_each_entry(em_ctrl, &ctrl->emulated_by, entry)
+			mpam_resctrl_offline_ctrl(cpu, res, em_ctrl, comp);
+
+		mpam_resctrl_offline_ctrl(cpu, res, ctrl, comp);
+	}
+}
+
 int mpam_resctrl_online_cpu(unsigned int cpu)
 {
 	struct mpam_resctrl_res *res;
@@ -1925,7 +2104,6 @@ int mpam_resctrl_online_cpu(unsigned int cpu)
 	for_each_mpam_resctrl_control(res, rid) {
 		struct mpam_resctrl_dom *dom;
 		struct rdt_resource *r = &res->resctrl_res;
-		struct resctrl_ctrl *ctrl;
 
 		if (!res->class)
 			continue;	// dummy_resource;
@@ -1937,21 +2115,10 @@ int mpam_resctrl_online_cpu(unsigned int cpu)
 				continue;
 
 			if (r->alloc_capable) {
-				for_each_resource_ctrl(ctrl, r) {
-					dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, res,
-										    ctrl, comp);
-					if (!dom) {
-						dom = mpam_resctrl_alloc_ctrl_domain(cpu, res,
-										     ctrl, comp);
-					} else {
-						struct rdt_ctrl_domain *ctrl_d =
-							&dom->resctrl_ctrl_dom;
-
-						mpam_resctrl_online_domain_hdr(cpu, &ctrl_d->hdr);
-					}
-					if (IS_ERR(dom))
-						return PTR_ERR(dom);
-				}
+				int err = mpam_resctrl_online_ctrls(cpu, res, comp);
+
+				if (err)
+					return err;
 			}
 			if (r->mon_capable) {
 				dom = mpam_resctrl_get_mon_domain_from_cpu(cpu, res, comp);
@@ -1985,8 +2152,6 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 	for_each_mpam_resctrl_control(res, rid) {
 		struct mpam_resctrl_dom *dom;
 		struct rdt_l3_mon_domain *mon_d;
-		struct rdt_ctrl_domain *ctrl_d;
-		struct resctrl_ctrl *ctrl;
 		bool dom_empty;
 		struct rdt_resource *r = &res->resctrl_res;
 
@@ -1999,22 +2164,8 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 			if (!cpumask_test_cpu(cpu, &comp->affinity))
 				continue;
 
-			if (r->alloc_capable) {
-				for_each_resource_ctrl(ctrl, r) {
-					dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, res,
-										    ctrl, comp);
-					if (WARN_ON_ONCE(!dom))
-						continue;
-					ctrl_d = &dom->resctrl_ctrl_dom;
-					dom_empty = mpam_resctrl_offline_domain_hdr(cpu,
-										    &ctrl_d->hdr);
-					if (dom_empty) {
-						resctrl_offline_ctrl_domain(&res->resctrl_res, ctrl,
-									    ctrl_d);
-						kfree(dom);
-					}
-				}
-			}
+			if (r->alloc_capable)
+				mpam_resctrl_offline_ctrls(cpu, res, comp);
 
 			if (r->mon_capable) {
 				dom = mpam_resctrl_get_mon_domain_from_cpu(cpu, res, comp);
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 4bc7090ad0c7..77a2f2e877a6 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -359,6 +359,7 @@ static const char * const resctrl_ctrl_name[] = {
 	[RESCTRL_CTRL_NAME_DEF]		= "",
 	[RESCTRL_CTRL_NAME_MIN]		= "MIN",
 	[RESCTRL_CTRL_NAME_MAX]		= "MAX",
+	[RESCTRL_CTRL_NAME_NODE]	= "NODE",
 	[RESCTRL_CTRL_NAME_REGION0_MIN]		= "REGION0_MIN",
 	[RESCTRL_CTRL_NAME_REGION0_MAX]		= "REGION0_MAX",
 };
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 195c0948b26d..b8df7489539f 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -398,6 +398,7 @@ struct resctrl_mon {
  *				has the same name as the resource.
  * @RESCTRL_CTRL_NAME_MIN:	"MIN"
  * @RESCTRL_CTRL_NAME_MAX:	"MAX"
+ * @RESCTRL_CTRL_NAME_NODE:	"NODE"
  * @RESCTRL_CTRL_NAME_REGION0_MIN:	"REGION0_MIN"
  * @RESCTRL_CTRL_NAME_REGION0_MAX:	"REGION0_MAX"
  */
@@ -405,6 +406,7 @@ enum resctrl_ctrl_name {
 	RESCTRL_CTRL_NAME_DEF,
 	RESCTRL_CTRL_NAME_MIN,
 	RESCTRL_CTRL_NAME_MAX,
+	RESCTRL_CTRL_NAME_NODE,
 	RESCTRL_CTRL_NAME_REGION0_MIN,
 	RESCTRL_CTRL_NAME_REGION0_MAX,
 	RESCTRL_CTRL_NAME_LAST = RESCTRL_CTRL_NAME_REGION0_MAX
-- 
2.53.0

