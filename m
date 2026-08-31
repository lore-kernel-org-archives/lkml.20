Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2074AA1FF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196994; cv=fail; b=rWMi18K4wDmag1KZBass9IbceLJ5o3eWOEvISNpLwA++Trl6cuOBA3vHgg8txQEYd7Dsk4YUaDPll14eoF9iHYSHayA+8r1bqVeGhVaoo3K87UH77A1SvRHjHyHepWH0cGufQKtmUOpB8tGXLOqGL2aOo4T2kD8q9j3QCzwMFg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196994; c=relaxed/simple;
	bh=SFvGQ2jjVut1TC5vF/QDBRPgJ4cOvBRcDe2gWU3SHjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s6R/6TYF3g7oRVBL9k/UAdUVwwwyVvraPO8cxz4wJKSOcnWTWL9wyd+ZNl47hWiwM61+ZPBVuiCdk6IalwHTgV7mZAZUYUg9SGEfoZynb2G7yPItqp5Dzsm/1++NFxa9/ltli7Aiw/9CtGhB/gkckA1/rzIEGbPIDrlkyhP6h7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AC1hIQ8K; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AC1hIQ8K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OP/G0nQupSUMJOw+sxqB3quX2T9EJCra3yIeZC6quTuJOnMYz4mothYGFAUGNkz2MrDJVX53xSqlwdqwKw9+8LZj0RFkjjLAlUy7R+IZuKqYbuCW6EjheGFTgS35V7gjRfHUn/bGYwl8JC6CNrPs0m8P3EsRSumDNh2FX6iCwszpes56sbeI55VRYQMEtnhiK/meKrSsIY7ayuP2oAjsuDN9wZRO2kWnYC2rFbYAvc/p4CAmV2SniQUAuwJrZGFGblC3dSwVYXhJ5V+H/rs8N9QE1uvOKLWXUVdwP/9MRorv8nrhzWkmsKY1zxUo4cJ267OSVSRmTDEKEnc/Q0jiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRj0h2V4fSy+ZZ/N8BVkT4b3SpbT5sQUcBI322quWuI=;
 b=Bw6SGrrgj8ixsXpkUrOJV9jVUM0cVwdlhsESdTIQ5e++kPTwNcz1qs0SSxksyDjCvbMcdzRHh+2Tfp62+XvqVoaDDAAK0sfSg4Os/t7hf9OMpkb0sd1DUx9JU8utiIpmAaqYeaBMq5f8oO5xRkMQPNUvJAhQkQEqWsANCqEDX+NBujvJkq8q2VoHkBf/nk00R1cAYXrUbE3G0zmlMrPtCTp0urrLCUs/KYmKrzdLu88G4yiRo1/zm6mhfjSth0ZtbPBvAXV2tRYmF7R3CQj0xMYGK//lmyMgGPlYLsxBg8HWBbkXnZ1RNg+523trLwcVahWtrktj1/yFfAbYfqlO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRj0h2V4fSy+ZZ/N8BVkT4b3SpbT5sQUcBI322quWuI=;
 b=AC1hIQ8Ka7mCrwwVn/ldEbY4D2QCDAYBx65DEqPkRWPQZ32xR7b+Xwn3X374HFZpwHZ5anh3ZANK9PSfknHVAQNJ7bqBsNAEATwQlymQ7Mck0E/m5ymelrm2aqo9UVz0nzU1ZxhHOfSV0r/bzmXa3MB92qxqOf888ToZcPtfCz9xKCM6fDGtt4pulLeBnaF/NJVjPHVq5SwZE3YWOeBSKKIKMwzQWVnBfnBH9CDCnEYV23UMqF20muxs54jJdl7fKl+1ny98ZdcWFl7uYnl93F8dq/vILNhps0fkw0ROjIhknrDhl0dw4okzlyEZVKZu5tSZ2VXJhvOI3fufNjN7fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:01 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:23:01 +0000
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
Subject: [PATCH RFC v2 08/19] arm_mpam: Include all MSC components during domain setup
Date: Mon, 31 Aug 2026 10:22:34 -0700
Message-ID: <20260831172245.42253-9-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: a8083883-a19c-4e78-649c-08df07848235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|56012099006|11063799006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	y/X+pEgki6iKRMGK7/zUnBHdnA6iPhNy92plwoh1xA1D6johu2+k1thB4NiQntTZqlgwmNZC0Alua0Klyt68jR0gmZRgOzNw8GQuE4+6b54cITBtHOTmgjagQVU2bsiZYS9Mf5PrZRhCfr1DyFhbK1gF/3rYCD/hIptLLhEO1jVyfRGxxeQG8olOPscUYR9Wr3JB28Tr6fFuW3Jrna6ig4pTNWfemZEt6Ua6utPIvO8CK0/VQ7+ugQyzm6IN1spzfpGbQ/6nDy7nhCZV7Bc4XR5doGGeepXiLsLFVMmVEubefcWpIuP8EiMhkbkGjCqo0NAMae6/d+kqMxl0gilIrEjqa4cgSGr+X60yaFkD51pauW+KkkzcZ5XohOOh8sTuY17CUbmT7Tm/KgJ09JNgMXnX527/hfQGs8TetJjisH3RTAgzEa8BHSMAm48xxA51Nbg2Xc4gZC7cLGqiz8xIpN/oiLA52Xq9mv1ZqYrs665qA5/amS4RmVmV7GtSOQSYv394zJQ7phm3Q0TrpZjEBml0LW6OERwPk4NkqFvzfr09YvsbmIDhVoZSu10R2YnZzz6lyc0/EBBVmXM0wV+rbdtSkt4o8gb//2LoMEzdpFnjxwLEOyveG6van6O8DzeymoLQnizDFxilO9rKLIINUet/84drKSZvThquVkceFlmvmoAM3yomC3vISdJL3T9M9h4jlgIhAI39+VDf3M7s5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JN0EiHIomX2mezQNaRcQYGS6aAFFuiqSBglVJgUKdlGE9LnNxl54S/A5CjcI?=
 =?us-ascii?Q?IIbYgFuqfuQbRP9zM/tAQzYy5yxb1WoDnYn8GuLiwloHVXoIPa5UPGvfz/ne?=
 =?us-ascii?Q?QUvWXY67ejsz1m4rEAkVnjnge1ShYclgFjmiWkzNm6PeYKe/4tD/aHI4IuX8?=
 =?us-ascii?Q?2JleNxrGERTFEaF5u5b88/YmyHZSyWhZZI3ATkIEvHyP/tXHUCdn48CWQaNf?=
 =?us-ascii?Q?892ErZhuDjmxw7CzdjvdPshxMLD13+Rhfw2VYk8JZSNo+7Cgod0fqR1Jfhmg?=
 =?us-ascii?Q?nn5mOOBevBBx/CUO6jkrN1xjeqIoeciF1YAocy3UXqdKU8dQyV87W4dMvNcg?=
 =?us-ascii?Q?J68YNLUY+Bw9rn978gnecrKiGTLLYF8TR8iqxeZscwdDfPqBhycaOxvUgX2h?=
 =?us-ascii?Q?iYhV98zGucJj9xgnAPe55EIVZRRNmdWIbEWYsVkbFzI5feBBES6i4h/g0xVx?=
 =?us-ascii?Q?eDqhmVbhiW7oObZsX/t3/A7Tvpl2cbkwzijxVFizvWKC4oXQHIWwIJ7TS3BI?=
 =?us-ascii?Q?+5MreAPAxDrERJxaarVufyOaIG3cF8+pJ7TKt0FTuzOrj3BjWivJHf7yubI8?=
 =?us-ascii?Q?bxyFfye3WtOo7JDpRTs+b7O7iGptZhuC2iFbs7Pd1GNMpdTLBGh9C2P4WCbv?=
 =?us-ascii?Q?Ewm3CnuUvXqQVT4Sa4E1W78adC0jORDDD9EIJz027wWhNwPq69eHegw6iklp?=
 =?us-ascii?Q?IUvYP7SDC1GoI+trsyvcqL+82d5jIvJpAxYF88wrffdUHoUhSaq21Wmqx4Fj?=
 =?us-ascii?Q?xQGdwBdUouxMwvdlGvAgXG+fE0GqlSlBcKXYLGxhPrqRImpqMIbirit/zDp0?=
 =?us-ascii?Q?hhdWpL4wGBAvUMoMG/yybcOkvtwTurRbAPqBrxfSxDO39L3eRfAs9q/obndy?=
 =?us-ascii?Q?5A4v1WnAnUOX5Nc5liH6+qQizLh5gSq5fwZU1ysCKKS5Pbm76RdPvHeU6KLk?=
 =?us-ascii?Q?Yrx8GEKptSOf728Yg1pQnmJa0OpYC1jjKsbCMZYYtJYVOimXtNkLXnuy/OOu?=
 =?us-ascii?Q?8BXBr5HVno+a7xFnXzKhVQUf3glq6ZTva5gwzuwoI9++vPB2RQtEQ5LzKtHX?=
 =?us-ascii?Q?DkgSqlsyhVTp4sUeEhrRuOyB5fslM+Ul70StknsF1yIngxP/UFcXcKLSWoNA?=
 =?us-ascii?Q?ZqHSRXLJeIWEfAKe6B6/RDIhRdNqv4MjS6cZrb3HTxyrPWaWfoXwBjqXXoka?=
 =?us-ascii?Q?IlKD45yrGzI5elm9J65pUBHUkVCHUwpxHaQxjsjdhz18y0YQSv3Hrkp1WmQ7?=
 =?us-ascii?Q?bbn7Wf4iBLypCf1PbK0WPWlgQKGcGhG6YeklKM5BXwANDuZWC0Kv7uybm/gL?=
 =?us-ascii?Q?U4mj+S9ZoSXQzVslXfGBAuKtfQDfQVVn0sJeAhxi+XOTtgiNMoMaObmtHjVz?=
 =?us-ascii?Q?m86MeQsQCQHBPe+OBWeAzIzxjgqTTPUU2c9tKXjQLqG/hTBg+sk6icK5ENFC?=
 =?us-ascii?Q?/HJ3t7P46uKHkgtQQBAFxtm29PldsR/t3eo2zNRdNqN5BJrVK3g1UXRE5Drt?=
 =?us-ascii?Q?hYp5WP/3YOjqlqLBYE1SXc2Jj1uNzqz4MVuj1WZpRm4PMj2DVGL0EVCKXmwT?=
 =?us-ascii?Q?YI6cOh50Bk/Dz9BXL5l0880Otoz2bUgWoh15HQ6ILlzfOSuVTt3XT/HQHu25?=
 =?us-ascii?Q?RBQzZhKA68Bsvko2O9at+E7xakhE7KMC39uxYqCLQESnarze/oc8MmFTW4L+?=
 =?us-ascii?Q?+LxiDIiAYjZeGtNOHmIq6zeRsmRLSVvUX/UFScJcRK+CZqN9BLsumWAvEJC4?=
 =?us-ascii?Q?A93z2Cr7Dg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8083883-a19c-4e78-649c-08df07848235
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:01.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJHmTRhdsvHkLjHji9EXnmGozcBjWMe9ktMn5wr2t4uE9IyT7kj4933QMJzjvRJGuwlGXn8lmUuQ3tmRi9sEpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

Iterate all MSC components per CPU when creating and looking up control
and monitor domains on the controls branch. Key monitor domains by
component, support MBA mon_capable lookup, and report mon capability
from any L3 or MBA monitor resource.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 197 +++++++++++++++++++--------------
 1 file changed, 112 insertions(+), 85 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 72302f6021d7..9a02bc0e091d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -95,11 +95,27 @@ static bool mpam_class_memory(struct mpam_class *class)
 
 bool resctrl_arch_mon_capable(void)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	enum resctrl_event_id eventid;
+	struct mpam_resctrl_mon *mon;
+	struct mpam_resctrl_res *res;
+	struct rdt_resource *r;
+
+	for_each_mpam_resctrl_mon(mon, eventid) {
+		if (!mon->class)
+			continue;	// dummy resource
+
+		if (mpam_class_memory(mon->class))
+			res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+		else
+			res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+
+		r = &res->resctrl_res;
 
-	/* All monitors are presented as being on the L3 cache */
-	return l3->mon_capable;
+		if (r->mon_capable)
+			return true;
+	}
+
+	return false;
 }
 
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
@@ -1731,13 +1747,12 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 
 static struct mpam_resctrl_dom *
 mpam_resctrl_alloc_ctrl_domain(unsigned int cpu, struct mpam_resctrl_res *res,
-			       struct resctrl_ctrl *ctrl)
+			       struct resctrl_ctrl *ctrl,
+			       struct mpam_component *comp)
 {
 	int err;
 	struct mpam_resctrl_dom *dom;
 	struct rdt_ctrl_domain *ctrl_d;
-	struct mpam_class *class = res->class;
-	struct mpam_component *comp_iter, *ctrl_comp;
 	struct rdt_resource *r = &res->resctrl_res;
 
 	lockdep_assert_held(&domain_list_lock);
@@ -1745,28 +1760,17 @@ mpam_resctrl_alloc_ctrl_domain(unsigned int cpu, struct mpam_resctrl_res *res,
 	if (!r->alloc_capable)
 		return ERR_PTR(-EINVAL);
 
-	ctrl_comp = NULL;
-	guard(srcu)(&mpam_srcu);
-	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
-				 srcu_read_lock_held(&mpam_srcu)) {
-		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
-			ctrl_comp = comp_iter;
-			break;
-		}
-	}
-
-	/* class has no component for this CPU */
-	if (WARN_ON_ONCE(!ctrl_comp))
+	if (WARN_ON_ONCE(!comp))
 		return ERR_PTR(-EINVAL);
 
 	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
 	if (!dom)
 		return ERR_PTR(-ENOMEM);
 
-	dom->ctrl_comp = ctrl_comp;
+	dom->ctrl_comp = comp;
 
 	ctrl_d = &dom->resctrl_ctrl_dom;
-	mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, r->rid, &ctrl_d->hdr);
+	mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
 	ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
 	err = resctrl_online_ctrl_domain(r, ctrl, ctrl_d);
 	if (err)
@@ -1784,13 +1788,12 @@ mpam_resctrl_alloc_ctrl_domain(unsigned int cpu, struct mpam_resctrl_res *res,
 }
 
 static struct mpam_resctrl_dom *
-mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res)
+mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res,
+			      struct mpam_component *comp)
 {
 	int err;
 	struct mpam_resctrl_dom *dom;
 	struct rdt_l3_mon_domain *mon_d;
-	struct mpam_class *class = res->class;
-	struct mpam_component *comp_iter, *ctrl_comp;
 	struct rdt_resource *r = &res->resctrl_res;
 	struct mpam_component *any_mon_comp = NULL;
 	struct mpam_resctrl_mon *mon;
@@ -1801,24 +1804,14 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	if (!r->mon_capable)
 		return ERR_PTR(-EINVAL);
 
-	ctrl_comp = NULL;
-	guard(srcu)(&mpam_srcu);
-	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
-				 srcu_read_lock_held(&mpam_srcu)) {
-		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
-			ctrl_comp = comp_iter;
-			break;
-		}
-	}
-
-	/* class has no component for this CPU */
-	if (WARN_ON_ONCE(!ctrl_comp))
+	if (WARN_ON_ONCE(!comp))
 		return ERR_PTR(-EINVAL);
 
 	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
 	if (!dom)
 		return ERR_PTR(-ENOMEM);
 
+	dom->ctrl_comp = comp;
 
 	/*
 	 * Even if the monitor domain is backed by a different
@@ -1833,7 +1826,7 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		if (!mon->class)
 			continue;       // dummy resource
 
-		mon_comp = find_component(mon->class, cpu);
+		mon_comp = comp ? comp : find_component(mon->class, cpu);
 		dom->mon_comp[eventid] = mon_comp;
 		if (mon_comp)
 			any_mon_comp = mon_comp;
@@ -1870,25 +1863,32 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res)
  * for anything that is not a cache.
  */
 static struct mpam_resctrl_dom *
-mpam_resctrl_get_mon_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
+mpam_resctrl_get_mon_domain_from_cpu(int cpu, struct mpam_resctrl_res *res,
+				     struct mpam_component *comp)
 {
-	int cache_id;
 	struct mpam_resctrl_dom *dom;
 	struct rdt_resource *r = &res->resctrl_res;
+	int id;
 
 	lockdep_assert_cpus_held();
 
-	if (r->rid != RDT_RESOURCE_L3)
-		return ERR_PTR(-EINVAL);
+	if (!r->mon_capable || !res->class || !comp)
+		return NULL;
 
-	if (!res->class)
-		return ERR_PTR(-EINVAL);
-	cache_id = get_cpu_cacheinfo_id(cpu, 3);
-	if (cache_id < 0)
-		return ERR_PTR(-EINVAL);
+	if (r->rid == RDT_RESOURCE_L3) {
+		id = get_cpu_cacheinfo_id(cpu, 3);
+		if (id < 0)
+			return NULL;
+	} else if (r->rid == RDT_RESOURCE_MBA) {
+		id = comp->comp_id;
+	} else {
+		return NULL;
+	}
 
-	list_for_each_entry_rcu(dom, &res->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list) {
-		if (dom->resctrl_mon_dom.hdr.id == cache_id)
+	list_for_each_entry_rcu(dom, &r->mon_domains, resctrl_mon_dom.hdr.list) {
+		if (dom->ctrl_comp != comp)
+			continue;
+		if (dom->resctrl_mon_dom.hdr.id == id)
 			return dom;
 	}
 
@@ -1896,14 +1896,19 @@ mpam_resctrl_get_mon_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
 }
 
 static struct mpam_resctrl_dom *
-mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct resctrl_ctrl *ctrl)
+mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct mpam_resctrl_res *res,
+				      struct resctrl_ctrl *ctrl,
+				      struct mpam_component *comp)
 {
 	struct mpam_resctrl_dom *dom;
 
 	lockdep_assert_cpus_held();
 
+	if (!comp)
+		return NULL;
+
 	list_for_each_entry_rcu(dom, &ctrl->domains, resctrl_ctrl_dom.hdr.list) {
-		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
+		if (dom->ctrl_comp == comp)
 			return dom;
 	}
 
@@ -1914,6 +1919,7 @@ int mpam_resctrl_online_cpu(unsigned int cpu)
 {
 	struct mpam_resctrl_res *res;
 	enum resctrl_res_level rid;
+	struct mpam_component *comp;
 
 	guard(mutex)(&domain_list_lock);
 	for_each_mpam_resctrl_control(res, rid) {
@@ -1924,30 +1930,40 @@ int mpam_resctrl_online_cpu(unsigned int cpu)
 		if (!res->class)
 			continue;	// dummy_resource;
 
-		if (r->alloc_capable) {
-			for_each_resource_ctrl(ctrl, r) {
-				dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, ctrl);
-				if (!dom) {
-					dom = mpam_resctrl_alloc_ctrl_domain(cpu, res, ctrl);
+		guard(srcu)(&mpam_srcu);
+		list_for_each_entry_srcu(comp, &res->class->components, class_list,
+					 srcu_read_lock_held(&mpam_srcu)) {
+			if (!cpumask_test_cpu(cpu, &comp->affinity))
+				continue;
+
+			if (r->alloc_capable) {
+				for_each_resource_ctrl(ctrl, r) {
+					dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, res,
+										    ctrl, comp);
+					if (!dom) {
+						dom = mpam_resctrl_alloc_ctrl_domain(cpu, res,
+										     ctrl, comp);
+					} else {
+						struct rdt_ctrl_domain *ctrl_d =
+							&dom->resctrl_ctrl_dom;
+
+						mpam_resctrl_online_domain_hdr(cpu, &ctrl_d->hdr);
+					}
 					if (IS_ERR(dom))
 						return PTR_ERR(dom);
+				}
+			}
+			if (r->mon_capable) {
+				dom = mpam_resctrl_get_mon_domain_from_cpu(cpu, res, comp);
+				if (!dom) {
+					dom = mpam_resctrl_alloc_mon_domain(cpu, res, comp);
 				} else {
-					struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
+					struct rdt_l3_mon_domain *mon_d = &dom->resctrl_mon_dom;
 
-					mpam_resctrl_online_domain_hdr(cpu, &ctrl_d->hdr);
+					mpam_resctrl_online_domain_hdr(cpu, &mon_d->hdr);
 				}
-			}
-		}
-		if (r->mon_capable) {
-			dom = mpam_resctrl_get_mon_domain_from_cpu(cpu, res);
-			if (!dom) {
-				dom = mpam_resctrl_alloc_mon_domain(cpu, res);
 				if (IS_ERR(dom))
 					return PTR_ERR(dom);
-			} else {
-				struct rdt_l3_mon_domain *mon_d = &dom->resctrl_mon_dom;
-
-				mpam_resctrl_online_domain_hdr(cpu, &mon_d->hdr);
 			}
 		}
 	}
@@ -1961,6 +1977,7 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 {
 	struct mpam_resctrl_res *res;
 	enum resctrl_res_level rid;
+	struct mpam_component *comp;
 
 	resctrl_offline_cpu(cpu);
 
@@ -1976,31 +1993,41 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 		if (!res->class)
 			continue;	// dummy resource
 
-		if (r->alloc_capable) {
-			for_each_resource_ctrl(ctrl, r) {
-				dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, ctrl);
+		guard(srcu)(&mpam_srcu);
+		list_for_each_entry_srcu(comp, &res->class->components, class_list,
+					 srcu_read_lock_held(&mpam_srcu)) {
+			if (!cpumask_test_cpu(cpu, &comp->affinity))
+				continue;
+
+			if (r->alloc_capable) {
+				for_each_resource_ctrl(ctrl, r) {
+					dom = mpam_resctrl_get_ctrl_domain_from_cpu(cpu, res,
+										    ctrl, comp);
+					if (WARN_ON_ONCE(!dom))
+						continue;
+					ctrl_d = &dom->resctrl_ctrl_dom;
+					dom_empty = mpam_resctrl_offline_domain_hdr(cpu,
+										    &ctrl_d->hdr);
+					if (dom_empty) {
+						resctrl_offline_ctrl_domain(&res->resctrl_res, ctrl,
+									    ctrl_d);
+						kfree(dom);
+					}
+				}
+			}
+
+			if (r->mon_capable) {
+				dom = mpam_resctrl_get_mon_domain_from_cpu(cpu, res, comp);
 				if (WARN_ON_ONCE(!dom))
 					continue;
-				ctrl_d = &dom->resctrl_ctrl_dom;
-				dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
+				mon_d = &dom->resctrl_mon_dom;
+				dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
 				if (dom_empty) {
-					resctrl_offline_ctrl_domain(&res->resctrl_res, ctrl, ctrl_d);
+					resctrl_offline_mon_domain(&res->resctrl_res, &mon_d->hdr);
 					kfree(dom);
 				}
 			}
 		}
-
-		if (r->mon_capable) {
-			dom = mpam_resctrl_get_mon_domain_from_cpu(cpu, res);
-			if (WARN_ON_ONCE(!dom))
-				continue;
-			mon_d = &dom->resctrl_mon_dom;
-			dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
-			if (dom_empty) {
-				resctrl_offline_mon_domain(&res->resctrl_res, &mon_d->hdr);
-				kfree(dom);
-			}
-		}
 	}
 }
 
-- 
2.53.0

