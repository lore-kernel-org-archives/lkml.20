Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259796;
	b=POsteXwptX6IxdI2XK/s4XGCdBQVrRUdPyJmp6nfO62U1ihriErlScG/XPkQWjVZmdRe
	 Q3SY0AAlilFjiS3gEOAuMn9DzJZIEWd8r+EM93vDJvkA51UV+OvBa7fzN6x2el++g/Hk7
	 MYpAccpD7tsif87ViQkEKVmJ4hIuEiumtMfWOrXXozWu2XWzRofKA9wyw8NOF7dfOsew9
	 dbGaOYiVzkFZ8JFPq7qb4saPAxx/eGWyIZwZxlgf+gwDYW+5z7zEJyhb58Qw8j1Fe/G6W
	 tGaVonAX7Gc6VaQEg2/knWltJ7lYh1Xc5XqGG3QJQJVa+0VmdTXLldU+kMLNRwLJGIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259796;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ikddIXqF3DONwjLi5Em8ykshRTz1Na7HdzITCo1sXgo=;
	b=Z6C8rCvSuuaJwu97+IDyxRUqACUKEWNEsl8ousViG5gkghsOp4wplwX0edYsQ66K0id/
	 Tb6XMuS+JfnqlijL7led6LSS7nb0Gygwb64svl9T4pEfB2j8RDLriFZ2WRh9QtBwgbM4z
	 78bXHE3hkyiOGqa76TZJshBnXuDZ9IN/QQcoytex9mFUCGOJxiCNGsFzpQjUcMUAXKJzN
	 4F55SQ8TmhhOmSjhuENfFR3zLAzB0dSDM43+oZPxf48gDltzxUj44wQQ59PyKAcQGLZNy
	 kR/sW1lGtapZvfPjChdw/tzWFZ+g35YQUtb1YPGikbT+MVs9Ublq4BVafuClthDMPlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SdusPW9e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.21
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010021.outbound.protection.outlook.com [52.101.46.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B72A606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B72A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SdusPW9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeKzh816EfK1ATA7M0TbBr492lnBuK3mpehTA+ZYNc4YIEg3nmKC6Wl7Gpf1w5Qf5+/MiEeysyfLNnq8tpXFEh4hoHpML7vylO4XK+yFzKe1NXaTIAH9GUjPfzHmIoTJm92j6Qj+XXNVDY67JWFhW+dFCNzPdYNmyofivVtA918qgN+Kjo+il3+Zkbw0yDTIbsCYGX1+VSk+9HFhXZsFgOV3ELd/8PL8/m36fTpOUgWIsBaL0LGoWPBg4UF7AbUJvCtsNnS012yNgT84/SM+75DxBdDCxVojvSke8qWnQBwdrPHQOmP4o8d2310Bq4dLDjt6YyrRd8KnQEYJE4ERzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikddIXqF3DONwjLi5Em8ykshRTz1Na7HdzITCo1sXgo=;
 b=Vw9gdG24umWShkusSEx/S/gHXSsgLqzYaigh/hZ+4AAKj8gVjG8Fw0Jcs7lQk1RIxJUtBROOjH/VmXP5XwD+ultiZfBgv09ZgMH6+TT0q/XRN60pGY57WhYbBggcwoB3zkm67hyeKoTpDWPvNMG0rpnRLkZpOgzCLZZaWDXM+iUCE3WdrHv3nVqm4OfbAOusB171oOeHkCALkhOh6iJZC5jjna9BzhO9KuBiiSbuYLbIFhTH17gNndqRpOxHcZ97buTjDg+B/lor2aTDdVyFchWmE/Mquo5lfHEf/seAQGayPsSjnrfC/o6Jrt+kSfFhdO8enaZtFx/ndhBR/wjqwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikddIXqF3DONwjLi5Em8ykshRTz1Na7HdzITCo1sXgo=;
 b=SdusPW9e4GHNdg5sFBrAkubEYnpKEuVH9rAYByvqmmH1jnSA9dqy17zkkZDOSxL1xBYtYFNguht9Beoup7kGIDciLiRVzb6tnZPxNosE1r3/WLGPF5f3Zvfw3LetRlZ8eOX5nHGsrMyjnYtJNQBDJoljNlTlVH/jqwQ0lpCkntoAaCpSQLamQskUHGE2csOxmOQiBA5//Aso+7idYgokI4YsXyPtptJsGpqNcTl5h8aY52dpkbBSRQ6LXmf2UskUIkrYwsZJCYkhHITmk9xUXQeMzi2caLs9srEKMw1/YhNDoJDlKeK8SCQUX/4wUFwHBbuJ8+eONgGpNxqfidItBw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:29:49 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:29:49 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>,
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
Subject: [PATCH RFC v1 5/6] arm_mpam: Add MB_MAXHLM_NODE and Node scope
Date: Mon,  9 Nov 2026 13:29:36 -0800
Message-ID: <20261109212937.1409570-6-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212937.1409570-1-fenghuay@nvidia.com>
References: <20261109212937.1409570-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dac2600-e66b-4851-aafb-08df3ea89550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|921020|260925021911599003|260925022911599003|260925021311599003|11063799006|261021121427099003|261021123027099003|261009223027099003|261022105027099003|56012099006|261026140227099003|261026121527099003|261102123227099003|261028144727099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	6FactSMcyTu8dgBb4Ep+ILEbH8LFbUhhO5d35JUJ/yHxiYuEWi9qdw7UopoAuK9MHVXyaDDhM/9d5oGiBcs2HDDt7G5IYs231EbSz2Uvaz0TZrRxcj9E7sNTF0GT6xrEEj++KP8Ztr/Clbw1w2i8etg7uRy16T0G41H2uNeAJjPCeFXuQm8rcUO+YprxDRvSXTYNMXN1+rgAethgl9fBj8YKDwJexeAUNoa/9QpWeUGIEOPv8h0PsSXtt9zTishFREKsIdJNfYjhf44he0ssLvyKYOy3oMit/B3yOjVQN8PuUmJBKAp1wuDybAE7lTtdkHt0Mx3WCIS6UK3tDKfsd7Rf4BcxQuGdr0h9yiWT20pRBrY+NTqntUIzjTs5EYQYkL3vv05YR6zMTvAKM0i4sQ16Z9QvJa4oAY+MPKsen20MDuiHAyV9d94IynsD4gj4oq9lFSpxagh1dZZHkoiczmxdSqHY3kx0TRbcmcoqMbrq2l0R7YolTrP2cC8wCMvV9ap16EAHatdzadVOFjRGpmcRXtfMH7+1ZlCuXQ0Jm/m+Llxbk3M7eIr4qZgtZ+uDAafVMEmNUD6vriPS+Auzuby32MenXp/YMbk+F/LTIEHpBL3+pqQbjypMZ8ilHwvJcRd4/P3R47yuipFzKgqXZIKv5YLjN84x4rq5cRGJj5OD4Eghx8wUK1Wvr+ybsR2zjOuncDH8LMSddD3GRMLncA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(921020)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(56012099006)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3TwHWNags8t8Y0iSMX+/PUm5Zo7VafuEXt/nb3P7nmgbrgyAIs8CYD0mUtWi?=
 =?us-ascii?Q?6kbRReLgOkATnVEpUWnweyyBWruw4NnPOpzoM/TtDw9BTHxNCcAZXlFCqi+o?=
 =?us-ascii?Q?GBle+FZCoHTi9rkSvJvlz4R8QQwMukX/tL/IX4hE8qA4w3KPriB3y6NYnUEt?=
 =?us-ascii?Q?xXDStgSSt/wFDo2asy6xi76nPRZbvQuZg8JuqV6+qasmeAuvVv3aEUWmVkLl?=
 =?us-ascii?Q?nZOMulSg4lgoBNbG0SleQlTjqAsTlmu1IFHwK5szyXQy/Qc3Ka6onqPvEQ6v?=
 =?us-ascii?Q?c6pZR3dhjrlsnGBqzU0GV/JzIJReaNlvxDfNJRnJNeFHUE90RmIiVvQ+m7LG?=
 =?us-ascii?Q?iXPfHUbXry5CwY6LbqV5a6FFOS+vg4YYi2wmuWx0d9+x9qG5OK+Sd5ivL5TH?=
 =?us-ascii?Q?00EzXgmMCjmjOxdU4xssNDM+Zx89V9yESEE5uCwDevhv3yCzp0tmD5OcRSHB?=
 =?us-ascii?Q?MjEE0z39kpn+x7MmPO1ZHJViitRlCtJ9HAOC5BiVRU3M0sEyufWOCC/cY7Zw?=
 =?us-ascii?Q?H+fo6fRRnCf6PrtiitUUHqTtYt9TLKcFlDuyrYj+FEV5decZsXj9xK0sgkVq?=
 =?us-ascii?Q?troKvj3h2tZEAkWB61bAX9SQIUgmuEpG7CHX/DzKGGMc0DGj9adr2V8RUFWD?=
 =?us-ascii?Q?pH/e5j3f+Mmww/4InFoWB3s6ShEHlL3gA2lZ4BaNibyitYQdXWCJz4GHfsZh?=
 =?us-ascii?Q?37pqU/Y8dqXTdE6iDs+lgIaOxjtcL35QmyB8fuNyMzMAcm25rh8b7otEMEZ9?=
 =?us-ascii?Q?8rhO/tjIN7+ExT4iDLjSFt+My8AH0FAaU6EjfDIu4Kvg0VGNSVBA9+TWR7vm?=
 =?us-ascii?Q?J/RfNHUiUk1xztqInBVKIiwItGOw4mDyF/MQeSqlYzrGcHQd72gry7qoMfk9?=
 =?us-ascii?Q?XBcpNRIg5D7fmlUKBecqiBDEhsKCc3iRGU5YQrZ/9z+h+X/27xcT8tZ4oDgQ?=
 =?us-ascii?Q?kgfXiUtwbgrWV03QTW11EIJxb4+QTXejKbiS2P8l+g4CK7ovdzkUEMOlSEp8?=
 =?us-ascii?Q?SiTv1QgMo7/L1KOAefRTGSyYuSJZn6zGMq/oGhszwdA13cYwJZbywzwZeLw0?=
 =?us-ascii?Q?095kCpG4b93XmmYr9HuYfYvKgIjcnOP2FuokH8PgYiQdOvtWWi+3NNI8B3hy?=
 =?us-ascii?Q?v77KexEBWM9zVJD5BfF/K7Bg8u4VMa5BqVYKNgnsXfX35T2e089EMUX70AYP?=
 =?us-ascii?Q?mJrpEbC6Rkuc8gO5k2zlZGY1UfQlc8687ODRO3aKXnrGnXwWDbuv7juzIdlq?=
 =?us-ascii?Q?woWa/4owVZ1xxMW+sV5BFYfRQzD/UYfDV5O3ePQAxMZ4eeGtB+Lb3lM6KgBG?=
 =?us-ascii?Q?+aF5GRvE9WNQcYtx6VYIEHRnQLUo14h/IfeHizYwDLVYf9n95ldqICmWDUTp?=
 =?us-ascii?Q?dYOhL4RaT65ALiSrgWEpjmVaRe/JRBmmf3KArSsdjp+tHafgmUw6OOmENejb?=
 =?us-ascii?Q?j1txwVqikK60ll+hWHSMj8aqROvCCzZnqRPpuFI0zmvfbJ+BFmM7cL9N6wp3?=
 =?us-ascii?Q?yymJxaEsZ/70akACC2pP742qM0205Tfc1nZnW03eTgpPSJVNrMtsm+nwKswh?=
 =?us-ascii?Q?t/Ql4QG32GkKLCMCnhVE4b18cKa1Z0VUeglJBg5DdkYkAU7l4G4Q2BKXeKJD?=
 =?us-ascii?Q?PFf63vq9xD+CBonXwZ9aqhfPhbn6+zZfJ0wQTEuEL5UjXK07rAgLJTj5EdHd?=
 =?us-ascii?Q?6ofbI7dbd9WMDsW9ioFPnwJiaUfGuofoBhoTdDFu6+M1zlP+7rqWrXQvNHXe?=
 =?us-ascii?Q?2PydFj3Bxg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dac2600-e66b-4851-aafb-08df3ea89550
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:29:49.1796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsscLPh8X7aZ2TVH6uN9l/qn9DNY+sg4k+nmKbauCSRs9pmcH6Zh+dQXTlu5kD5+pPyuuejqBCcsotPU8wkLiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

Memory-level MSCs expose their domains as NUMA nodes, so their
hard-limit control must be named MB_MAXHLM_NODE rather than MB_MAXHLM.
Add RESCTRL_CTRL_NAME_MAXHLM_NODE and create it for memory classes.
Set the MBA resource ctrl_scope to RESCTRL_NODE for those classes.

Add resctrl_ctrl_maxhlm() so the schemata parser, group setup, default
value, and resctrl_arch_get_config()/resctrl_arch_update_one() accept
both hard-limit names.

The hard-limit control is a 0/1 HARDLIM toggle. Set its scalar range
to 0..1 with a reset value of 0 instead of inheriting the bandwidth
percentage range.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 47 ++++++++++++++++++++++++++++++----
 fs/resctrl/ctrlmondata.c       |  3 ++-
 fs/resctrl/rdtgroup.c          |  2 +-
 include/linux/resctrl.h        | 12 +++++++--
 4 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index ea1fb7fc7e01..f1325ffb6343 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1266,10 +1266,14 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, evtid);
 }
 
-static void _mpam_resctrl_ctrl_init_mba(struct mpam_resctrl_ctrl *mpam_ctrl,
+static void _mpam_resctrl_ctrl_init_mba(struct rdt_resource *r,
+					struct mpam_resctrl_ctrl *mpam_ctrl,
 					struct mpam_props *cprops,
 					enum resctrl_ctrl_name name)
 {
+	struct mpam_resctrl_res *res;
+	struct mpam_class *class;
+
 	mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_SCALAR;
 	mpam_ctrl->r_ctrl.name = name;
 	INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);
@@ -1287,6 +1291,35 @@ static void _mpam_resctrl_ctrl_init_mba(struct mpam_resctrl_ctrl *mpam_ctrl,
 	mpam_ctrl->r_ctrl.scalar.gran = get_mba_granularity(cprops);
 
 	__set_bit(RESCTRL_SCALAR_FLAG_LINEAR, mpam_ctrl->r_ctrl.scalar.flags);
+
+	/*
+	 * The hard-limit control is a 0/1 HARDLIM toggle. It must not
+	 * inherit the bandwidth percentage range.
+	 */
+	if (resctrl_ctrl_maxhlm(&mpam_ctrl->r_ctrl)) {
+		mpam_ctrl->r_ctrl.scalar.min = 0;
+		mpam_ctrl->r_ctrl.scalar.max = 1;
+		mpam_ctrl->r_ctrl.scalar.reset_val = 0;
+		mpam_ctrl->r_ctrl.scalar.gran = 1;
+	}
+
+	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
+	class = res->class;
+	if (mpam_class_memory(class))
+		r->ctrl_scope = RESCTRL_NODE;
+}
+
+static enum resctrl_ctrl_name get_ctrl_name_maxhlm(struct rdt_resource *r)
+{
+	struct mpam_resctrl_res *res;
+	struct mpam_class *class;
+
+	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
+	class = res->class;
+	if (mpam_class_memory(class))
+		return RESCTRL_CTRL_NAME_MAXHLM_NODE;
+
+	return RESCTRL_CTRL_NAME_MAXHLM;
 }
 
 static int mpam_resctrl_ctrl_init_mba(struct rdt_resource *r,
@@ -1305,10 +1338,10 @@ static int mpam_resctrl_ctrl_init_mba(struct rdt_resource *r,
 	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
 	class = res->class;
 	if (mpam_class_memory(class)) {
-		_mpam_resctrl_ctrl_init_mba(mpam_ctrl, cprops,
+		_mpam_resctrl_ctrl_init_mba(r, mpam_ctrl, cprops,
 					    RESCTRL_CTRL_NAME_NODE);
 	} else {
-		_mpam_resctrl_ctrl_init_mba(mpam_ctrl, cprops,
+		_mpam_resctrl_ctrl_init_mba(r, mpam_ctrl, cprops,
 					    RESCTRL_CTRL_NAME_DEF);
 	}
 
@@ -1318,14 +1351,16 @@ static int mpam_resctrl_ctrl_init_mba(struct rdt_resource *r,
 	 * this fails.
 	 */
 	if (mpam_has_feature(mpam_feat_mbw_max_hardlim_rw, cprops)) {
+		enum resctrl_ctrl_name name;
+
 		ctrl_maxhlm = kzalloc_obj(*ctrl_maxhlm);
 		if (!ctrl_maxhlm) {
 			kfree(mpam_ctrl);
 			return -ENOMEM;
 		}
 
-		_mpam_resctrl_ctrl_init_mba(ctrl_maxhlm, cprops,
-					    RESCTRL_CTRL_NAME_MAXHLM);
+		name = get_ctrl_name_maxhlm(r);
+		_mpam_resctrl_ctrl_init_mba(r, ctrl_maxhlm, cprops, name);
 	}
 
 	/*
@@ -1588,6 +1623,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 				configured_by = mpam_feat_mbw_max;
 			break;
 		case RESCTRL_CTRL_NAME_MAXHLM:
+		case RESCTRL_CTRL_NAME_MAXHLM_NODE:
 			configured_by = mpam_feat_mbw_max_hardlim_rw;
 			break;
 		default:
@@ -1671,6 +1707,7 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 			}
 			return -EINVAL;
 		case RESCTRL_CTRL_NAME_MAXHLM:
+		case RESCTRL_CTRL_NAME_MAXHLM_NODE:
 			if (mpam_has_feature(mpam_feat_mbw_max_hardlim_rw, cprops) &&
 			    mpam_has_feature(mpam_feat_mbw_max, cprops)) {
 				/*
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 9111b0130783..352a3f847b4b 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -189,7 +189,7 @@ static int parse_bw(struct rdt_parse_data *data, struct rdt_resource_final *f,
 	}
 
 	/* Parse mb_maxhlm line */
-	if (ctrl->name == RESCTRL_CTRL_NAME_MAXHLM) {
+	if (resctrl_ctrl_maxhlm(ctrl)) {
 		if (!mb_maxhlm_validate(data->buf, &bw_val, r, ctrl))
 			return -EINVAL;
 
@@ -397,6 +397,7 @@ static const char * const resctrl_ctrl_name[] = {
 	[RESCTRL_CTRL_NAME_REGION0_MIN]		= "REGION0_MIN",
 	[RESCTRL_CTRL_NAME_REGION0_MAX]		= "REGION0_MAX",
 	[RESCTRL_CTRL_NAME_MAXHLM]	= "MAXHLM",
+	[RESCTRL_CTRL_NAME_MAXHLM_NODE]	= "MAXHLM_NODE",
 };
 
 const char *resctrl_ctrl_name_str(enum resctrl_ctrl_name name)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 01e69d0d9e96..1a6dbad15fd5 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4429,7 +4429,7 @@ static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
 		for_each_enabled_ctrl(ctrl, r) {
 			if (r->rid == RDT_RESOURCE_MBA ||
 			    r->rid == RDT_RESOURCE_SMBA) {
-				if (ctrl->name == RESCTRL_CTRL_NAME_MAXHLM) {
+				if (resctrl_ctrl_maxhlm(ctrl)) {
 					rdtgroup_init_mb_hlim(ctrl);
 					continue;
 				}
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 5711154145f8..1c75ac68d68f 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -403,6 +403,7 @@ struct resctrl_mon {
  * @RESCTRL_CTRL_NAME_REGION0_MIN:	"REGION0_MIN"
  * @RESCTRL_CTRL_NAME_REGION0_MAX:	"REGION0_MAX"
  * @RESCTRL_CTRL_NAME_MAXHLM:	"MAXHLM"
+ * @RESCTRL_CTRL_NAME_MAXHLM_NODE:"MAXHLM_NODE"
  */
 enum resctrl_ctrl_name {
 	RESCTRL_CTRL_NAME_DEF,
@@ -412,7 +413,8 @@ enum resctrl_ctrl_name {
 	RESCTRL_CTRL_NAME_REGION0_MIN,
 	RESCTRL_CTRL_NAME_REGION0_MAX,
 	RESCTRL_CTRL_NAME_MAXHLM,
-	RESCTRL_CTRL_NAME_LAST = RESCTRL_CTRL_NAME_MAXHLM
+	RESCTRL_CTRL_NAME_MAXHLM_NODE,
+	RESCTRL_CTRL_NAME_LAST = RESCTRL_CTRL_NAME_MAXHLM_NODE
 };
 
 /**
@@ -603,6 +605,12 @@ int resctrl_arch_control_mode_set(struct rdt_resource *r,
  */
 void resctrl_arch_sync_cpu_closid_rmid(void *info);
 
+static inline bool resctrl_ctrl_maxhlm(struct resctrl_ctrl *ctrl)
+{
+	return ctrl->name == RESCTRL_CTRL_NAME_MAXHLM ||
+	       ctrl->name == RESCTRL_CTRL_NAME_MAXHLM_NODE;
+}
+
 /**
  * resctrl_get_default_ctrlval() - Return the default control value for this
  *                                 control.
@@ -619,7 +627,7 @@ static inline u32 resctrl_get_default_ctrlval(struct resctrl_ctrl *ctrl)
 		return BIT_MASK(ctrl->bitmap.cbm_len) - 1;
 	case RESCTRL_CTRL_SCALAR:
 		/* The hard-limit toggle defaults to off. */
-		if (ctrl->name == RESCTRL_CTRL_NAME_MAXHLM)
+		if (resctrl_ctrl_maxhlm(ctrl))
 			return 0;
 
 		return ctrl->scalar.reset_val;
-- 
2.53.0

