Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259490;
	b=ETeFLRNz0JQnSGTEWadxV9o/yIrZPibJToMJS8Mlongw9wDSTtsDx0oUOnd1fzxSnYlK
	 fA7CQi00irVp32IY0bMgNL3iq1EZM8nDbBkMyGeZmcXhWP5//AhBqrqCmbIX3U13vvXFY
	 QzVAR3ppErtyaJOnr0/n/euCLyV5T+ExupbY+vo15rrTyA6XLO5iQrtcIDOFNP9LaJ7mu
	 rKWPTvHtlqvyDapfcIbLPEf6BkD5YMDgiOAx+6krbzDdJ5FIip3GscZwvy2i9wOnmbeM7
	 y3A23T3vdkBQ/AZZe5SCAgQoBS6K18vCsV7P+I26QZIJ/hjCSiYzYcWK1rUpf6imkjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259490;
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
	bh=xWCZi14bd6MqV2i+IPx+LFFB4DzXvBH16bu3FKsS5zY=;
	b=1crzh7hoTkD5y88117r0EZdei/zawke0Awh07YYq5/sAuBOCdLZHX0Rsmj5VISv4xiIq
	 99URQCzrDnRXGuVBdxOCPmHJBIS3JsS6Na/DkSPqk2AiYw1izA1RYV4tlYMEny0lHUwx0
	 UkvQY+lOxNItk2x2iWcHt171We6pKC2vlkqeQsyNAACd91P7YhZFtR7LWCewKHUdIba+O
	 EuDuw/9WQCM3BVps3jnaf3O3JpegM9XhkNlnI6rfREEyiMapNN3sOSc4OSNgOOzMESevL
	 iVCBaVrp9byZI190xoNYrdcWlQjKbGTbVd6r8frcus+XjwceMfr1RByo4qha3QjzwLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ETv57c+b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.68
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011068.outbound.protection.outlook.com [40.93.194.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A0260A2600
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A0260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ETv57c+b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dw3pJ1s47skQ01mcAFjuW4PgABiddNUTEFrcDXlif+uvWtHpmqwfaGsmsZdm2NHdgkGX/ibMeQFwqvgJwhYNbURlSTxYsFs6mrhFjsOj9MTPHtppqs+NrN51KqF4L7zw++7tnV/va6tRVFn/+iUgqJau0LrGZypXLoT4PqjsnjUwJJsySK61tTQOzO3fh6yt39UnYgMJmk0o2UX5PbbYpAZeddmYZAYmT5NlSz+ilJhCuJGT70WIS7Aep4BddnXJts0lZ5PmXHe+Eh6/eSlFhd61ZqRi7k2c3rFIDYeVc8d0TxvmkXXE+87+9iPXYHepbKpa0Wm2+SXQMEMjKeLnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWCZi14bd6MqV2i+IPx+LFFB4DzXvBH16bu3FKsS5zY=;
 b=APGlu0B0BrU2T4k2W8Qrf+0FpgCEb/EYq0FnaoMMYwyzlO2COoLtQ6WJG5FUpeGTu1NT+aSeQjrRHTBqCHnzExAAY3SYslDSxmA5t21oQXHpYtqoJ9d0loh0FWgsmO53lVNJT4ERC/r592jiXYHSiTQaX8ycHCcB8hduUfCri7BuF57/bDIXjxhbIBa8r/ZkxNG6JCV2QVQFZLRN1aPVDt5k0z146DP4IF+kT/FDedAvP1LnUAIw6MRGwW3lbIVAZ7ovcMXWmWaSICCwqtr/0bnpxYBG8S7bU4k1mou16arjzz2dX4ZvZEjGGWhV4gNNK+zUkLCt8rc2qYqLvHXXrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWCZi14bd6MqV2i+IPx+LFFB4DzXvBH16bu3FKsS5zY=;
 b=ETv57c+bOO9xTx2BLneBprHIYpRubjpqYVaI07/O07f40AfCu2WmdL3SwGskPPYzXk5ZEMmqAe5ZfFahZzeZoO4v0nCWwjiIpQuYqKfHo5LsWyO+txlSBWRXgoA6gZWqRJ5dfa5FFaOtUbmGhd8ORQAEomBj7WnqGDT+mwd5BcpAI0rjVrSSi8IXOPidkgPV3nlmjDAhUCgC6OJ/eZIvMs5tQDKOPja2Zj0u9Bp2iEm/SR7c0Z/rU6q2deiW3ixrmsIzT7zKYrklpBHEzQ6WgqnxJF38b9ztf3m+EDp9p8mt6LNrk78n+Lk4ufy8RyDYctbtbYTMtd8fw7fK9FOhiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by CY8PR12MB7098.namprd12.prod.outlook.com (2603:10b6:930:62::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 21:24:37 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:37 +0000
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
Subject: [PATCH RFC v3 03/15] resctrl: name node-scoped monitor domains mon_NODE_<id>
Date: Mon,  9 Nov 2026 13:24:15 -0800
Message-ID: <20261109212427.1409204-4-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|CY8PR12MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a61ead8-e9de-44f6-f395-08df3ea7db44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|921020|261009223027099003|11063799006|261021121427099003|56012099006|261022105027099003|261021123027099003|261026140227099003|261028144727099003|261102123227099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tDiUjMm7Fy3fnMndbs5EYJIOYLzgAAz/v/bgkYb8LOtjzhorxVqg2I3QDDUO3C0X/i6v2ImpNCD4hYHKfkLlmiotr+gwa4ta9bmNdS2jRBuhQSXEMOBmktwYZiEjPgUeKxLkEe5+AYS3RyaXdYxKfXm71iei7hPdVMjuR586sDZGGp+ciE2QRcbTIPFBntll2PES9ZsQHQ3WoShu/vkH8brfcpeZ03DhiBM83hjaFhxdDC8fVbi4VbWbjugfg722ozp5RJFNU0jL0L5UMa1blsLORDvv0ismHZUwdxa2UgdWLJs+Jy6AhIs0Y+pXE8PyMNzASTdmXZcoSgrbi2WGavzAKvXt7H3Mmds9L/0qjUlqJbXwijCvHlWRZavLvneGsiMdKcsReTjGfEZuioFppcsJnjCBkyIqh18zzp6mVps+K1UfSMqLuM66fgI+A/1cDFuHLaUOugPihcwGl2hhoYO4+W5ftjDtO50ZIkRLNCnoCOOc7FAKQcvq3/Lp+2P1aU1TvYul+1qdz9dLbm4ZlanLFip/C9dg2rcPyEkMOCoZ9ZwVhhDBYd6P1kspMd9P3gw/uclwOOR/5Qi0IXHM+VCY/gzJIdbzWHRA2m4dFiMjauWTj5BZvC/C+eRAVx2pSup3D/6Ipi3aWSOi/5TCuxHXvX/ZVBLdtgoAE+vf2wHkpPuWZ3LpUl8luxGSHqOPalQOHcEfR4KCybJ7lau/uA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(921020)(261009223027099003)(11063799006)(261021121427099003)(56012099006)(261022105027099003)(261021123027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fpGj1YFe0tv6d3l2BYDs8cl4FrViAm+Ue90cmcYd8wWIMFzGYnvLbitTlb6A?=
 =?us-ascii?Q?KrQ7VyLeEEKOquuoTf4fuy1n3Y2UZ7An0+7HTnrMEW0hFeWUbFrSHmAm8TuK?=
 =?us-ascii?Q?Y6FddngZ+2yeeKD8ttXFxzIoP7mibbd8/S4XuiSuz9fcvhHBdDl+C7FZ4hQ5?=
 =?us-ascii?Q?76JmGWpbmLBBJ8cbKM67e1cDEvOUSHWtLFWKhl/TQTx5JEd80zsBHzBDqEHS?=
 =?us-ascii?Q?9Ld9iIExTLreEx89FaeOZokcr3NJPoFWFqpm2GY71L+Y3aF30OwntgPg0v3e?=
 =?us-ascii?Q?HNY1FTk0Mqwf89m+JtMEZsgv8ytru6bToonhWtNgjGJ2DO1b+eGoLasLVZDK?=
 =?us-ascii?Q?1bq3jxf1nF4WRmvyPaLScmvjv2Ji2yhv9pMqmUkNNEhWsnGmiosFMNTydGYd?=
 =?us-ascii?Q?LBV7LZfgOqRb6GONlaaEtg1uAorJE1FB67Phc3hZgAFpdtXbAhpteiVAQ2i6?=
 =?us-ascii?Q?Nd82CuCM6tkTuoja0IFcTfml6HaUJhsjOtSfdAijTgfNbeuHl8Oo8A/OFzSs?=
 =?us-ascii?Q?7iRwOqp4ij3z8qxE354b0ixDvNODauR13cWAsacqVLavMzcIHqEFrWMaVbT3?=
 =?us-ascii?Q?l6fW1ytXjW7BbH5tDxJXXLtBic+9KMrxMwBwlYtvbNeTn9KIodwlhYHijYii?=
 =?us-ascii?Q?uaEoV2PIcGj7XKkI7XKuruT0AjX5UEcShSTjZuX77MNtLjQ8TQwl7b3zwupA?=
 =?us-ascii?Q?tDvhJBUkjVP/YDIMLUmRQ5Ytvu7JpvEDnIXO52po1Ydc1pMZL+4rGognxjbQ?=
 =?us-ascii?Q?Vh5p+6YznLS4ku+WeL/H7vh3xgkh6OupDR34GbR5rn2du8y3AjwHDvSMsfeW?=
 =?us-ascii?Q?CPFmi8pFjGcN/xNC30tsd+pKIzFLOpDJQdOv2u4k/qyrSDmuliqXrjDj6mur?=
 =?us-ascii?Q?mQ/6wv6DvmMbaG5Dv2q6tdULaYBnrxSTZiY8EMiU03Xngv0HjeGkhB5BPkVV?=
 =?us-ascii?Q?bVXHwac5LOM9NJ3x9PCtr9Ma5/mmgr+Tt8hl+BVhFEFfuvDIL60PMh4PvcuD?=
 =?us-ascii?Q?4N9XER9uR/Aom0PPlj4+6ylK9tL8kQ/AmkH0tZzURM/DX0sZOT3XARxw8csV?=
 =?us-ascii?Q?cAVPNCIDC0WgJvPaKqQ+RMx9MjRwXV+UcdNPymUOrPlURYDDg6I1BQ2W1NxP?=
 =?us-ascii?Q?oO3373J21O9ogt/5GWNVhLfAnmgXQyvpxnRKxevRbfvqp0VrSdPdo67OQO+C?=
 =?us-ascii?Q?88vqD2/KOXzdBTkWf1bzC10AY3IKON01AwnlOlpxHGt+7DlCpKuksleYNdXR?=
 =?us-ascii?Q?3ErnvsQE6gx93CnYVTxTSRRWk5qL6fHHm0PlG4aGuMnQVJde9PfeQJ5iPE/o?=
 =?us-ascii?Q?DaS1PjOkqZwRrqnbPf1wEMjhlqoKtn3vWam36RN0pqjddxhDlzEeNOzIY8Do?=
 =?us-ascii?Q?Ty6Ui/6K9Jwu6VPMBti+6iknteHqdi+rkZMCKO3lLNlXt/pSqPCAGkze5aJW?=
 =?us-ascii?Q?aWBq0A4krevWj33i7cKj5ndHj3XxuaaUahQN54iki0BWfNwgGQABSBuAo/NK?=
 =?us-ascii?Q?S1YL3E+rYCFfjZ5lXg5PM2hhdFsj8uc4RRZo0ecYrNNb+Ek6VX4+IUOSnkVP?=
 =?us-ascii?Q?zIZLH5OzJ8piT4N5kVrSyp4w/XYjdoFQEIEm3H85kA0Vlbe71LKXKtRB63cR?=
 =?us-ascii?Q?jAtqu9CxplJuszEUfNCDpXp8EhQom2gqBC4FO9KD1JAJFiFn7+vbfjWq9XKV?=
 =?us-ascii?Q?HUP9Dctyrpt5+5pG/qTHOYvwJ55CTdmqYL3v5PgWr34GYWOcwZcV+J3pYPxn?=
 =?us-ascii?Q?Ttj2WZ3ONg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a61ead8-e9de-44f6-f395-08df3ea7db44
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:37.0497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlfXqQkRdCgdyvO52FgKIBLzqKoCxgXlXn5XUnfP1hkWmjKzz3MahU8uEVMSlw5wNbFJCR0MeKoPgKrEbdh+gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7098

Monitor domain directories under mon_data are named mon_<name>_<id>,
using the resource name as the label. For memory bandwidth monitoring on
a memory-side MSC the domain id is a NUMA node id, so labelling those
directories with the resource name ("MB") is misleading about what the
id means.

Add the RESCTRL_NODE monitor scope and a mon_domain_name() helper that
returns "NODE" for node-scoped resources (and the resource name for all
other scopes), then use it when building and removing monitor domain
directories. Node-scoped monitor domains are now named mon_NODE_<id>,
making it clear the id is a NUMA node id. L3 and telemetry naming
(mon_L3_<id>, mon_PERF_PKG_<id>) is unchanged.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/rdtgroup.c   | 25 +++++++++++++++++++++----
 include/linux/resctrl.h |  1 +
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a0635888a0a0..264666e54852 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3967,6 +3967,20 @@ static void mon_rmdir_one_subdir(struct kernfs_node *pkn, char *name, char *subn
 		kernfs_remove_by_name(kn, subname);
 }
 
+/*
+ * Label used in the mon_<label>_<id> monitor domain directory names. Node
+ * scoped monitoring (for example MB on a memory MSC) uses "NODE" so the id
+ * is understood as a NUMA node id; other scopes keep the resource name
+ * (L3 -> "L3", telemetry -> "PERF_PKG").
+ */
+static const char *mon_domain_name(struct rdt_resource *r)
+{
+	if (r->mon_scope == RESCTRL_NODE)
+		return "NODE";
+
+	return r->name;
+}
+
 /*
  * Remove files and directories for one SNC node. If it is the last node
  * sharing an L3 cache, then remove the upper level directory containing
@@ -4010,7 +4024,7 @@ static void rmdir_mondata_subdir_allrdtgrp(struct rdt_resource *r,
 		return;
 	}
 
-	sprintf(name, "mon_%s_%02d", r->name, hdr->id);
+	sprintf(name, "mon_%s_%02d", mon_domain_name(r), hdr->id);
 	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
 		kernfs_remove_by_name(prgrp->mon.mon_data_kn, name);
 
@@ -4114,7 +4128,7 @@ static int mkdir_mondata_subdir(struct kernfs_node *parent_kn,
 	if (r->rid == RDT_RESOURCE_L3 && r->mon_scope == RESCTRL_L3_NODE)
 		return mkdir_mondata_subdir_snc(parent_kn, hdr, r, prgrp);
 
-	sprintf(name, "mon_%s_%02d", r->name, hdr->id);
+	sprintf(name, "mon_%s_%02d", mon_domain_name(r), hdr->id);
 	kn = _mkdir_mondata_subdir(parent_kn, name, hdr, r, prgrp, hdr->id);
 	if (IS_ERR(kn))
 		return PTR_ERR(kn);
@@ -4169,8 +4183,11 @@ static int mkdir_mondata_subdir_alldom(struct kernfs_node *parent_kn,
  * This creates a directory mon_data which contains the monitored data.
  *
  * mon_data has one directory for each domain which are named
- * in the format mon_<domain_name>_<domain_id>. For ex: A mon_data
- * with L3 domain looks as below:
+ * in the format mon_<domain_name>_<domain_id>. The domain name is the
+ * resource name for cache and telemetry scopes (for example "L3") and
+ * "NODE" for node scoped monitoring (for example MB on a memory MSC,
+ * where <domain_id> is a NUMA node id). For ex: A mon_data with L3 domain
+ * looks as below:
  * ./mon_data:
  * mon_L3_00
  * mon_L3_01
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 54fec07bd173..f2c3621b006e 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -349,6 +349,7 @@ enum resctrl_scope {
 	RESCTRL_L3_CACHE = 3,
 	RESCTRL_L3_NODE,
 	RESCTRL_PACKAGE,
+	RESCTRL_NODE,
 };
 
 /**
-- 
2.53.0

