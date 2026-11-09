Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259498;
	b=Q65qyIPmveLGA7zI6nwXL937wgpIuYWY9zg9wNbkFVQ8XSx49VsZ0+OiT8uFohTt23K/
	 eS8JNfoWhIV4G76kqdoPa/MyQnccL2LndGpm3tF73VuLj03LetcKTiIyYZwnC1wBXfEYt
	 /7xGhI7qrbeN2rB9piNvcjKpqq1YBuAsk+oDQibI/Z4mi3JjECRWNm9PhoQ8Brz6y58fY
	 NW4Mrv7leAFSmRC2RskeQDxkdH8wC+lPFwl9SsIhJjZsp6vXsGE1XJo+/SzEICvb3xNk1
	 BaPaAaulLr7u+zETA188j42j+XFoW3XMupMsWK7YXk999GDrf+r3JSR2ZELRz5DE7Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259498;
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
	bh=fE34Cqytr+pkxpLaGRSuO+vPLII8SExZnPXqGngbbNM=;
	b=Z3KLYVPCQ/lvXPv0aVN+PUNX1XXNROttUNoibPfYhDDbOJ3dpE+UMQDd4T9pD0PX9GVy
	 r7xYHQI+UOh3w6PUt0epaXUxWUaoYkLKO01gJ9OWwMEbZblK7PXrpzNbhIJzLk1QndsA5
	 46vqTUoUf1r/KHcu1u/dkSHFze7WtAcyggFxoRut2fSDDJjwHGU/6f9rmR9JOYDOTBDL1
	 duH6WhO9ekIuPpbvUeXEGDqAbmWyVLQqn0TFQhSNAhtgPeNbwnuESPjHsvYMstIsB9cu7
	 ioYj/oa12NkkQIEQ7hJXnHd+fQ0zgLNE4x9SMg7SP697uUNJMQhcYmc0yyK+3UXSJkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cRZQM0P3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.49
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E27C60A260D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E27C60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cRZQM0P3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xemTJEYbuFMpyg+0z4aKSZxpqdu2A9H/2CSpYQggHnjPwMX8ckDWXCiNeg6Wipo4/al5j0K4nwD+aSOboHZgmNU3uSjXqgf4TMCrvElES/fLdtmnsWL9LTnQMwdDOZG6gJ/uIIgIwqDb7/0gZIUc9R2OOq/AX7v/e8PqYWDNG2TtSEZIz/X98+4zTDx0G8DU63DO1waaMASLvmYfu7uSe72+DSLWuGWiyRw+KZ6XOaTSm7EncNhI9XSiYBaCF9ySpcje6Rc8LWXO50w0vb5N24yAmYVVhD6dUACoDbFEPMOAo0KJk9D6Lagbupc1R/+mcIoDjdHrIXN1jfAJMKMOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fE34Cqytr+pkxpLaGRSuO+vPLII8SExZnPXqGngbbNM=;
 b=sY29WHUXK8tkfzUlpdlv4qxxVlLNYiqecEPt1FeD3+EFTLYatx7A+aiEksCt7GOdYWt29v6J2uJEcI9jVsDILRLYIEzrb9xtcFdarWpyNm8hHDX2tFKj+jE0qpgvUCTok57HiXTTW4+dyEzvQ0tNvgrB3o76Sr0idx6MwBCnZ3m4eQ7lgtK8+Wmxg/nqKtYhxsD9+uLzJmmJcmlQlcz3rVJf3xwE59gaENkzizdR6xUlBBbDcStS17qXdm26pS9dZ40pwA6d2lrL0IIGTiS8Wim1bASAhU317+lnnePrTtLTJG1PimanrFq13i3gLMoiH5DCcWNJlvrCLmsHK1hQTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE34Cqytr+pkxpLaGRSuO+vPLII8SExZnPXqGngbbNM=;
 b=cRZQM0P3T8dCoLmDLmrvP4gqBlmXICiQTQHbBXPmNf1vmrwSxQLTDZtL/QjMUgihDllY5YpzA8GjehNf/drgmkgWsTN1Kd4acCHrbHnpmkhCm8uNU7UMDr97At+PEO9hcyuF2hdOTiCmypBMqXs/r8eDnt92Z0CC3SGwLZI4vHYxkwVZ0j8EeEsiXDk9lSwt7z4mra3eOLnIN9dRXmrMr3v6mJ/IoUInUJCRmpxtF2FHbslI1FreepnLxkmx/QmKpwf4GWZ0BpoYKqgerD1uFgeUO+bkxBIFAS6UoHkj1oX7rhsOcrg9oI/8+pnpre56xEanAhXqmrtf8mKwWIheQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by IA3PR12MB024753.namprd12.prod.outlook.com (2603:10b6:208:53f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:24:43 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:43 +0000
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
Subject: [PATCH RFC v3 08/15] arm_mpam: Include all MSC components during domain setup
Date: Mon,  9 Nov 2026 13:24:20 -0800
Message-ID: <20261109212427.1409204-9-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|IA3PR12MB024753:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f23f60b-15e5-4ff1-2de7-08df3ea7ded0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|921020|11063799006|5023799004|56012099006|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|261026121527099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	iq8rvEleb3jdag7QGrf3IFOry9N2ddBw8LtV+7VERJtttsO511faSXeOoR5Q0I8GHTqvUCOHT1MUtCzhFsAZ/oz83AXXyU8O+nGwbYmj2TjlrRhbKWmWVuWAAhXhXhFRLdxx8w7L2cWC/1NazctARznIFOJXHy2QP7sm3nHm9+fd1zLToXuLaWtKGYf2GVs+9KWuzJ8xVtHwrD4nN6CyG3KHa96oTKWkwx66MTlZbGYV5XTPhsD+jJLrqeMx9wx2aDMCxOUtfnKxLWMIiNYM6EE2xC2KDbv9ndWxRC16SWBUvB3s9fY+vXvIiARQ+oSMr0tDuJH63clxZktClfq41j31jyYoRYaVkbobPM2gE0ECZwNBiuG4zPntptzeDhrf6jcoF3jItLB2AY4oMMzLOXP0xUEQ9PYMdy6PUmp4/DuNhDJbQg9Aey8+pyVSMKqzMXqmXkN55r7tFtIZdPRBXI1hQKaCJFOGcwmf7P59Sm15vO4zKG5Z5NrAc90I7gTMFe+XyYzAN4VY1M1q9oker8/ate52PDbdXhqzKFQrXzEXDBZhZnTylkptfVNdhl9Om4I/XTYcso5DXFkARk6hakE2w0zDMxS7KdcZWk9u4MvNWUSimfwxpjZBtXej/XcPV0Pg1e6KIq52kWi4DbWt8RHFaDU6RXHlwBARan5FRtE8p3Oln2d2NF+fJiZGMc4f446SWnMnjKrNw6OIX4yt7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(921020)(11063799006)(5023799004)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QZAGUrLttYjSOsWkvh/lWghTg1w7Li+ponkzmvxubHdiZcCsN2713OIfSJtS?=
 =?us-ascii?Q?4XryTe3Lz8itjgwWQh39zYJZKxA8vexyqzIDjIrnMuIk9G8dvyjEEnjeXMlm?=
 =?us-ascii?Q?MOYQY9Pi6bSVL4U18QSlAxzfRqYahMmzgXeC7btTkWCmeH6MpAPr4zHp1HzR?=
 =?us-ascii?Q?tlNqwYEOj4cJutTOiInQ+vYKXhQNEKPPkN1wlpH+4mcUONQ61svbrTYD+t6M?=
 =?us-ascii?Q?LblG3uwYh0Sd8LpumPl91NtPD9ne80Qm25ssK5j3pAcSWWLVMrulGDcudSXS?=
 =?us-ascii?Q?LZVcSu4Br8hE3zGIVR13O9wqfGGj/5tc44FsGWKzXcAWLhTLp5dkdrZAsy4f?=
 =?us-ascii?Q?RA5p+uvkw0Jsl1JbXH/hdGxWDQ7PpXJm/3uTeONl1WGU07nKANvtDbYUGy3l?=
 =?us-ascii?Q?V/UW3EBAZXOD3NdztfgxBZUUGGr1Br5wnwIzt88S+/fU6ZFTKB/JVPu5ETeB?=
 =?us-ascii?Q?fwzDCqaG8M62ZKpbS1Hd4m1rYLBcNoxaFnFZ6qfw5W9BJ+n+NfGQnLBuINJI?=
 =?us-ascii?Q?c7sMbOYqheyi8UE8g+ox+Mk18SPBq92Pwnvnv7hai1CniIL56RiMUgP0TCkC?=
 =?us-ascii?Q?KTAjlOWpTZUavb8COysrZMpPAnnb41wgLSwqyabCxh6TiXfVVLkxeS3dxrl+?=
 =?us-ascii?Q?piWo+FXp0+u6oJ7CtExnij0vlevkegRXlYPMiffYTjpxnZo16WuimzobkatU?=
 =?us-ascii?Q?PkUnp8BjuVp0AdF+fKIyRrkZ0yLgzbhYNUCX8zcOmMN4kz7XX/os4GRAO+Er?=
 =?us-ascii?Q?fCcE3mIz+EvUsRsfDHVwpVJ1al/bqrFTieF8k3vqrO7WgEZMoXITeeIqVKj6?=
 =?us-ascii?Q?FAASGzstNfEP3HcrIxvCg/kRQxCGS8HuYtYAbChfP3EAVhnkn4oLpVrByNXm?=
 =?us-ascii?Q?+86GCaTE2vd/vZqfK0byabsWnrM/FtWd1BJtcZ4JskcHrHvV5qonJ36Y9pI1?=
 =?us-ascii?Q?wPYsP3sWD59sMMsTh8TsruqiodKQquuNMcdz3ewl9ZU4Rec1zdVE9mX4p3dF?=
 =?us-ascii?Q?z5RtBZaNkP0ls0hpe7ss7dYztE/DExYvdJJzG53CdSjJ0pkYIswNoqu04y+J?=
 =?us-ascii?Q?fV3Nw3cqc/oL+ZJeCwPYCAWRrpAeSmqEjtevW7DnYM1Zgm3WUBiQCxDhvCz4?=
 =?us-ascii?Q?3WL9kvsfOzOPQBT3Qezy4lpBv4a71NE9Jp5y9zoS717FB8MNQmPi++FRUEYn?=
 =?us-ascii?Q?kwJuyiU30OyKmowsVuhM8FYOhbdsYY0NGVlTMMdPgAORcA+7U9o5LbIIEZN4?=
 =?us-ascii?Q?Tfj8KHNYgDZcABPDvreUHRvwjWqfUGZAGu8TVnEcxn9XYWtVkVs4c6ORwxrN?=
 =?us-ascii?Q?mp58ADR4m5/pDTisKDWex0hQxOAjy1Sh0V5EX4Za5381Qtu4gj6mYgc+D8Aj?=
 =?us-ascii?Q?N9wLLioN54D81/5y8NGsH/VGbw9+4g/w3+6Z3LUCe6q2b4lttOafrITedEeM?=
 =?us-ascii?Q?7ZRjdly4bJgPepVyLOgSSoH9X/puXjrsebW76d0oL3wD0y06W8CCVTri4SLD?=
 =?us-ascii?Q?sNv4BAU8Q3VQtOKwZ9e0ALZd2UOqOYT59ANkfms8fmXwSLMHdAEoGclgtaBC?=
 =?us-ascii?Q?/C/Tbo5e8fESDqDM6Rby0OzWZXd++imIcR7P10ZY83LoXm5mrhjPuzcfzxbE?=
 =?us-ascii?Q?iKFr9xURZ6UNusF7ioqfugj9fnFBBMhTylq+X9WgYbrIA4F++JRccVUYRFUn?=
 =?us-ascii?Q?9yDDGlFsX77Tbuhh5+1f0euSXnqxFjgn0rwnNbOUS3/LvyZVFc6Yn9gDm48W?=
 =?us-ascii?Q?HwZu/qYcGA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f23f60b-15e5-4ff1-2de7-08df3ea7ded0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:43.0246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwnMYAK1mNnMc8FL8o4fdTyBkWI7n53H3cj6FRnDoBVhJsv5Yi26xXE82MWyikSczRtVTiOwyc1NSahDHXNdVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB024753

Iterate all MSC components per CPU when creating and looking up control
and monitor domains on the controls branch. Key monitor domains by
component, support MBA mon_capable lookup, and report mon capability
from any L3 or MBA monitor resource.

A memory-class MSC keeps control_mode legacy and names its control NODE,
so the schemata line is MB_NODE in both legacy and native mode. A cache
MSC keeps the MB line.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 209 +++++++++++++++++++--------------
 fs/resctrl/ctrlmondata.c       |   1 +
 include/linux/resctrl.h        |   3 +
 3 files changed, 127 insertions(+), 86 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 72302f6021d7..ac0c488abe12 100644
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
+
+		if (r->mon_capable)
+			return true;
+	}
 
-	/* All monitors are presented as being on the L3 cache */
-	return l3->mon_capable;
+	return false;
 }
 
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
@@ -1293,8 +1309,18 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 		break;
 	case RDT_RESOURCE_MBA:
 		r->ctrl_scope = RESCTRL_L3_CACHE;
+		/*
+		 * control_mode stays legacy. emulated_by is left empty so
+		 * legacy and native mode expose the same schemata line.
+		 * A memory-class MSC is node-scoped, so that line is
+		 * MB_NODE. A cache MSC keeps the MB line.
+		 */
+		r->ctrl_mode = RESCTRL_CTRL_MODE_LEGACY;
 		mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_SCALAR;
-		mpam_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_DEF;
+		if (mpam_class_memory(class))
+			mpam_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_NODE;
+		else
+			mpam_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_DEF;
 		INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);
 		INIT_LIST_HEAD(&mpam_ctrl->r_ctrl.emulated_by);
 
@@ -1731,13 +1757,12 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
 
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
@@ -1745,28 +1770,17 @@ mpam_resctrl_alloc_ctrl_domain(unsigned int cpu, struct mpam_resctrl_res *res,
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
@@ -1784,13 +1798,12 @@ mpam_resctrl_alloc_ctrl_domain(unsigned int cpu, struct mpam_resctrl_res *res,
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
@@ -1801,24 +1814,14 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res)
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
@@ -1833,7 +1836,7 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		if (!mon->class)
 			continue;       // dummy resource
 
-		mon_comp = find_component(mon->class, cpu);
+		mon_comp = comp ? comp : find_component(mon->class, cpu);
 		dom->mon_comp[eventid] = mon_comp;
 		if (mon_comp)
 			any_mon_comp = mon_comp;
@@ -1870,25 +1873,32 @@ mpam_resctrl_alloc_mon_domain(unsigned int cpu, struct mpam_resctrl_res *res)
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
 
@@ -1896,14 +1906,19 @@ mpam_resctrl_get_mon_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
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
 
@@ -1914,6 +1929,7 @@ int mpam_resctrl_online_cpu(unsigned int cpu)
 {
 	struct mpam_resctrl_res *res;
 	enum resctrl_res_level rid;
+	struct mpam_component *comp;
 
 	guard(mutex)(&domain_list_lock);
 	for_each_mpam_resctrl_control(res, rid) {
@@ -1924,30 +1940,40 @@ int mpam_resctrl_online_cpu(unsigned int cpu)
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
@@ -1961,6 +1987,7 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 {
 	struct mpam_resctrl_res *res;
 	enum resctrl_res_level rid;
+	struct mpam_component *comp;
 
 	resctrl_offline_cpu(cpu);
 
@@ -1976,31 +2003,41 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
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
index 195c0948b26d..3c4675656b51 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -398,6 +398,8 @@ struct resctrl_mon {
  *				has the same name as the resource.
  * @RESCTRL_CTRL_NAME_MIN:	"MIN"
  * @RESCTRL_CTRL_NAME_MAX:	"MAX"
+ * @RESCTRL_CTRL_NAME_NODE:	"NODE". With resource name "MB" the schemata
+ *				line is "MB_NODE".
  * @RESCTRL_CTRL_NAME_REGION0_MIN:	"REGION0_MIN"
  * @RESCTRL_CTRL_NAME_REGION0_MAX:	"REGION0_MAX"
  */
@@ -405,6 +407,7 @@ enum resctrl_ctrl_name {
 	RESCTRL_CTRL_NAME_DEF,
 	RESCTRL_CTRL_NAME_MIN,
 	RESCTRL_CTRL_NAME_MAX,
+	RESCTRL_CTRL_NAME_NODE,
 	RESCTRL_CTRL_NAME_REGION0_MIN,
 	RESCTRL_CTRL_NAME_REGION0_MAX,
 	RESCTRL_CTRL_NAME_LAST = RESCTRL_CTRL_NAME_REGION0_MAX
-- 
2.53.0

