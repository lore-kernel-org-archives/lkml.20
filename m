Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259789;
	b=C3ZauWnzVFfROjxVffMQ6QVbsUHr/o9ypD3Emuur06hrvl19Pf36alfjGffustvTLOyQ
	 qhf2XEkdfvLDpgoMWrdyyl5SLKLUvaAgP69xMO4Nl5w3cLj5QWrtXnAsxWvJi5/sxNbmW
	 8Hb4V0+3VIbNMF/lnhOCvHtfGEG1gwHpj5+un3P96NCahbNEuFH/yyl0UBX0hFTLA3DZq
	 bGbSc/l5ne0A/umyQGZLeR4GNvZVOnsTF1nRVgzRt2+TovOUlVXaIm0iWC5ISy9oWT8C7
	 VJf4iRng1VIvy1B13pW2WI6PNZvjtVeiHLwFO1IpBqyyQjoqNlNAZtaucUO21Eogx1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259789;
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
	bh=M88iGuP12vfDsQXq3Hu+LgUoRyTyultZBV2uFxWoQ1E=;
	b=1YKn3/U9e39MlMWdVyBOmLz7k4yXz1xZE4+XvMDMxCm+Bmj7kGQkyZAfziW5OxaWFN9p
	 9a3BJ+kWv2p7D87H1csVwEzSGQDj2iG4CxiCBPXkPdKy6gAXa4FK8YPG+VWh5LpeeTkl+
	 qXkIV/EpDxKKLH4CRH5hqfxcKUHgM6PMsFCwlfOjn9eDH3l2eOaSqcM97v1DBCP5nKMBd
	 KSPu18nKjF2reE0NXL8VALsEN9YKTqqGVWHoSgT/aPVHQ/HcfRlbAVqdXo1DRp7Ryd2U1
	 nAK6xjTgkKzkulFmyYEPVqvUjw18+hiz5YWcPAYjN88tmM6OrPDkZY4nzEf4Zche1Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=W90H7NhR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.24
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010024.outbound.protection.outlook.com [52.101.193.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7BE606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C7BE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=W90H7NhR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrQy+7+43guiT3bEpRh5wYOiw9wlL2RN/LIO2K+wGOfPxzfriNI7fzDIWktdXPMftPfHmDd5NoBBUac8hZjPjg2JXvitvD2FCckXybHwmExDWQxpohpx80hBAtPxIdDtgNIk2mnJxzg5moi1T5b3AWKN+IHnd5B/nGINk1Z6Birp61aNeGQ4i+gVpNflli1DyDxR3BwqvQi/p0Egz0qfQ4agmqxP1dTytb/oTZ6FoLqM9gayrAMcXgww/x5XMpyaOiCVs24sgfrn6EwVxLu8wQPwQCmnGQ8lzVM3bTI3dwmvzIU+hfSNOpanW+I9+04AD027wRUtjtDr+nCCffZ0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M88iGuP12vfDsQXq3Hu+LgUoRyTyultZBV2uFxWoQ1E=;
 b=S4c0wGVRe55jxrkerxB1Y6UI06xtTiCTr1NfWEMzgz9FVOfhvgj/NL6ggzGPHeyrYCikgwC/ntHo7XUQHtEcgZ/SFsrgzqxfRcYPtSU99m2XOxDwDybnLakNCpi79KFXr36kju/07J4yC/8Apc7MnZVUNl/geI/hW6eIkdyDO8g9vC+MuFcW+STsGIMInAWHNVdjFHhVnnWUOaSnaElZBjqdeJiYABd8ej06UH7AZduIPoo6ZmgJqfw8jeI5KCCN8NqOYtiiNSz+kedIGpRGkXgbVZrRt904+6g8aGPyjsYGDLNPO9Zug06qkmapNOgnyU1OlcN5hwsQG1uOP1MZ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M88iGuP12vfDsQXq3Hu+LgUoRyTyultZBV2uFxWoQ1E=;
 b=W90H7NhR8k9EEVC6iqvl3/Vq6vzmmtuBYDPIR3xmRLSogSoQgT3QkUR2I72I22UpxWX3FGA6aqGxo50Ekdi/Yc+WtLri+se9CEJOZvhjGlPGCRhMT6QCsjwGmkxXl+KQoCli0/PNAxK1rQYumIERcbeaL0op7N4d9xw/h8ty2tK9b9329S32v5rR4wgfZOupn/pBwSML2luHrC5fF3oTlaFMikWPuqcc8DR3qj6WY6WWUjK6syEpCPCZHScDVY1Nmw1VGE77mqrO19hmiKUxhILZpaMC1Y+9zGJ2G8dTdDwQahH3gGvNhuagkd2yZEJ4uTw5CkVnZbN80matQs1O5A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:29:44 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:29:44 +0000
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
Subject: [PATCH RFC v1 1/6] resctrl: wire MB_MAXHLM schemata parsing and group setup
Date: Mon,  9 Nov 2026 13:29:32 -0800
Message-ID: <20261109212937.1409570-2-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212937.1409570-1-fenghuay@nvidia.com>
References: <20261109212937.1409570-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: cdc585cf-8816-4cad-5db4-08df3ea89284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|921020|260925021911599003|260925022911599003|260925021311599003|11063799006|261021121427099003|261021123027099003|261009223027099003|261022105027099003|56012099006|261026140227099003|261026121527099003|261102123227099003|261028144727099003|18002099003|22082099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	i4NWvFioQdr1Wj9+gSrI55GoeReRX1Z1YoQ99K8ZBqqXIsYs38zSHAXTKDt2/dpgmezwR0JKWau3ydV+tW3WNE20S+7t+Tp+18S4tFq3nk+8m5XsmpkgSJ7gxLSR9Th8tBt+G7lZbdBqMzlJqRVqvHIt+CFLfhh682NMHBS6Fr5YkeAc3r2/KW1Rkbbxz3qCDYoEtRKL9bR0UNtSlr9nJW8g2da5NoUtvi5mLgtQ46gI7rMvdn6qABbWnCkb2sX9RRGHtpmh8yw+cLhQk3/DSDsrBfv4ESXsiXB5wIrB1I4lj33gLXcbXeixqKEZY8kRsesEGs8j7Ss627Bzlh6H/OPfEAszUZD1ddKbzq8IFdzrupmCUGfhI1Q/lrUQbdpY0ORa9WPiMtKghcGaOBa/64ROM3OIEvrVyDBhAKWaixA2fHtqM2GL/xZUoNIxKc6g5ruv3ukFhVj3d4ZKUQiuE6NlYxSTtsxmmROav2nRNCC2LhgXM6vqnbcbkJ5GPeNBSGgNgVibW57A9XvcNRw//UP4EewjwwPLGRDmta3TtXXQJdDG/bBC0CRV+ow2Sz6qYNSGaR8NDPVcwn4N0Cx4HwTppCOpjvrF1HFn2ZrXF1NI2/niJbIXepG7jVoPolrQ2Gcv+F0Fr+C3YvfXO/fQoR8JgC8QkdROUGvJK2QXrXMFySZ+azYosKjL/G5rw1ENiLSzzN6mO+M48R6T8HKSSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(921020)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(56012099006)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WHtUOA9askszthGRwK1p0ONqbzbIlvjy3+Zgbn9Y6ZqUtrU0jXQmGJ6dXOx4?=
 =?us-ascii?Q?j/ZuXqx7i8MywZooVYXXIwJU/Xr3H6p3/qXkHFmu8Pln9830GQFd1/9xPAQi?=
 =?us-ascii?Q?D1RvkhqwuZ7CYTFeLUCqfK1t+Ror81VuSvrbYJxl22kyoTxBTMlTAXqpgQgR?=
 =?us-ascii?Q?aVO9HsJaHAgpeK2zpGnRi+FL2VmMCCzNuB1W6Cy1fhPHZcE1pZoMK6/7+g1V?=
 =?us-ascii?Q?bOGykygyZf0moXh99bd6HeMxINoMAxwL5Qb5gyyWvDB5hMebPnMAZK/35fUR?=
 =?us-ascii?Q?KOVXlXwU6cmMTTvwYkgfc9F7HZPdiIpmF/nFPG7/qRuUonDgcYo6BraCfw2t?=
 =?us-ascii?Q?5j2Ea9X9AIe9oKnAj3l/nrFgi/dG+/Cxn0RFyiPw4LlgsGwBXkUPcfuXFQCJ?=
 =?us-ascii?Q?cCWI82skpZeg3ND+hMvMJneTEXR0ZF18GcZGdnkdD87zlye9txWI1W1lAmhZ?=
 =?us-ascii?Q?zbPW0VYx8lxuNs7OYYt9RItD/VuzabsmE0yrIjySHQTWAr6/IdhdqtlKwE6i?=
 =?us-ascii?Q?ugCP2O9TSAG4FrsJVgoLynVbD+U2NMpo01StI26i2Ta61z9QkvoN8Jcgn/EJ?=
 =?us-ascii?Q?sV11uZjn7iOYvJBK4/XTSuPHKztT4OcYomELEgCYiLUetSDdZAuWM/O9j9l2?=
 =?us-ascii?Q?R1OZBAmOGixUsV3uB1zOEZW70ELCSGXh4nEFc2YnRrJBItLyr/gQ2CPg++ac?=
 =?us-ascii?Q?tW/q+NuH67uyOemr92ZOLFmHMVRD/abntZgXfDI8Uao3NpV+ddZHtAJqelOz?=
 =?us-ascii?Q?vLDcslEhEg5+v3oK6MQBigYI6VfXw4L0nzYXtB2lYwy2sfCUyXp0P3eTJmfA?=
 =?us-ascii?Q?5HI+uIU9IjoTpOXjNi8qPMo12unFlHdlzR4QLB2Mqwon8ldPbD9P3L0lETih?=
 =?us-ascii?Q?/m4O5HLhPdFb2RJ1Us8LQC9UL+lwXb/WCPo8q928dbtGz0fVz72+a/FlRCBA?=
 =?us-ascii?Q?utH2l/foSA8tY1hNympWvo8XUTci4tpLPRaCdf0mH/N8ehGVsESKZIEF9dPY?=
 =?us-ascii?Q?VUkpbPx62+Zwnaf3AN6LkTsB+C1uC81jrc4eaZA8rzemfDbioMIJmnO6yJ8X?=
 =?us-ascii?Q?hpO6J4+je0q1W4nLTNjPRz/aNcYQtF1ILKys7V3gCF6kozI47xwfeb/IRyu5?=
 =?us-ascii?Q?j0YyZRUtXjMY7faofmEF9oizI0W5lzb3vOKig0At3e71AJcI5TCxj3FaVzZ3?=
 =?us-ascii?Q?BPjZjDbv2M9XrfCvwo0AtLuk2R21NaAsvxmDlqRg/WjOkxrhil/K7Ul2e7hc?=
 =?us-ascii?Q?zxYB0Q8itPBwvZ8e023cY8iaT6RZKfuWM/t/ABOVMZWtHEQk/e1Tvc+oyPDR?=
 =?us-ascii?Q?gc2zZ0nRf9WFcbslSij0NO4t1Z+WReieSJY4qXdNz7e2+LOnIYTP1URbLmF0?=
 =?us-ascii?Q?Gf86Jo2EIU1uZiZ7/qVHZE9iT4w6qTHso5EKChpI6MDT+uZyy/GhvTmqEj4U?=
 =?us-ascii?Q?cWg8PNmtl5seCn5SvmeOispTsSc5a2h/RvFzlDw7HS2wM5l18BFEqcfHiQSi?=
 =?us-ascii?Q?fw4m838LoDOhUz009WqXjyF53dL2P+lGJtl8uj72b4Is5YfCGXLxba71FWBh?=
 =?us-ascii?Q?baMDJraXDb4AcFN3zJFhgWjmn4RxLLq9g1PcMdwnLlX7kGFd+FPWMhEd2lOM?=
 =?us-ascii?Q?zfwI7dkZfMb7mLjxb9g/O5xuciqhDERNBK6sKk9dw+2Ae3id+lOV78V9SW7q?=
 =?us-ascii?Q?IrRXUBv0NDbagLL/VK8cve7erZ2l7TnwTaZrh9RCK598g+aHB65ke/pH58Ja?=
 =?us-ascii?Q?pxOeNSXarw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc585cf-8816-4cad-5db4-08df3ea89284
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:29:44.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvhadsAVS0f5tvJP2il0UxcpS1PRYEJJu6/C8574cNxXi/ZdfGEmdp1nUXu/r5gXZJ22KPGp7KyevzqilvzAKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

The hard-limit control is a 0/1 value on the MBA resource, not a
separate schemata resource. Parse MB_MAXHLM in the bandwidth parser,
reject values other than 0 and 1, and initialize new groups with the
hard limit off.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/ctrlmondata.c | 35 +++++++++++++++++++++++++++++++++++
 fs/resctrl/rdtgroup.c    | 17 +++++++++++++++++
 include/linux/resctrl.h  |  8 +++++++-
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 77a2f2e877a6..9111b0130783 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -62,6 +62,29 @@ static struct resctrl_ctrl_priv resctrl_ctrl_priv_all[] = {
 	},
 };
 
+static bool mb_maxhlm_validate(char *buf, u32 *data, struct rdt_resource *r,
+			       struct resctrl_ctrl *ctrl)
+{
+	int ret;
+	u32 mb_maxhlm;
+
+	ret = kstrtou32(buf, 10, &mb_maxhlm);
+	if (ret) {
+		rdt_last_cmd_printf("Invalid MB_MAXHLM value %s\n", buf);
+		return false;
+	}
+
+	if (mb_maxhlm != 0 && mb_maxhlm != 1) {
+		rdt_last_cmd_printf("MB_MAXHLM value %u isn't 0/1\n",
+				    mb_maxhlm);
+		return false;
+	}
+
+	*data = mb_maxhlm;
+
+	return true;
+}
+
 /*
  * Iterator finding enabled controls.
  * Dynamically traverses controls based on active control mode.
@@ -165,6 +188,17 @@ static int parse_bw(struct rdt_parse_data *data, struct rdt_resource_final *f,
 		return -EINVAL;
 	}
 
+	/* Parse mb_maxhlm line */
+	if (ctrl->name == RESCTRL_CTRL_NAME_MAXHLM) {
+		if (!mb_maxhlm_validate(data->buf, &bw_val, r, ctrl))
+			return -EINVAL;
+
+		cfg->new_ctrl = bw_val;
+		cfg->have_new_ctrl = true;
+		return 0;
+	}
+
+	/* Parse mb line */
 	if (!bw_validate(data->buf, &bw_val, r, ctrl))
 		return -EINVAL;
 
@@ -362,6 +396,7 @@ static const char * const resctrl_ctrl_name[] = {
 	[RESCTRL_CTRL_NAME_NODE]	= "NODE",
 	[RESCTRL_CTRL_NAME_REGION0_MIN]		= "REGION0_MIN",
 	[RESCTRL_CTRL_NAME_REGION0_MAX]		= "REGION0_MAX",
+	[RESCTRL_CTRL_NAME_MAXHLM]	= "MAXHLM",
 };
 
 const char *resctrl_ctrl_name_str(enum resctrl_ctrl_name name)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a16e35b587c4..01e69d0d9e96 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4401,6 +4401,19 @@ static void rdtgroup_init_mba(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 	}
 }
 
+/* Initialize the MB MAXHLM control with default hardlim off (0). */
+static void rdtgroup_init_mb_hlim(struct resctrl_ctrl *ctrl)
+{
+	struct resctrl_staged_config *cfg;
+	struct rdt_ctrl_domain *d;
+
+	list_for_each_entry(d, &ctrl->domains, hdr.list) {
+		cfg = &d->staged_config[CDP_NONE];
+		cfg->new_ctrl = 0;
+		cfg->have_new_ctrl = true;
+	}
+}
+
 /* Initialize the RDT group's allocations. */
 static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
 {
@@ -4416,6 +4429,10 @@ static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
 		for_each_enabled_ctrl(ctrl, r) {
 			if (r->rid == RDT_RESOURCE_MBA ||
 			    r->rid == RDT_RESOURCE_SMBA) {
+				if (ctrl->name == RESCTRL_CTRL_NAME_MAXHLM) {
+					rdtgroup_init_mb_hlim(ctrl);
+					continue;
+				}
 				rdtgroup_init_mba(r, ctrl, rdtgrp->closid);
 				if (is_mba_sc(r, ctrl))
 					continue;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 3c4675656b51..5711154145f8 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -402,6 +402,7 @@ struct resctrl_mon {
  *				line is "MB_NODE".
  * @RESCTRL_CTRL_NAME_REGION0_MIN:	"REGION0_MIN"
  * @RESCTRL_CTRL_NAME_REGION0_MAX:	"REGION0_MAX"
+ * @RESCTRL_CTRL_NAME_MAXHLM:	"MAXHLM"
  */
 enum resctrl_ctrl_name {
 	RESCTRL_CTRL_NAME_DEF,
@@ -410,7 +411,8 @@ enum resctrl_ctrl_name {
 	RESCTRL_CTRL_NAME_NODE,
 	RESCTRL_CTRL_NAME_REGION0_MIN,
 	RESCTRL_CTRL_NAME_REGION0_MAX,
-	RESCTRL_CTRL_NAME_LAST = RESCTRL_CTRL_NAME_REGION0_MAX
+	RESCTRL_CTRL_NAME_MAXHLM,
+	RESCTRL_CTRL_NAME_LAST = RESCTRL_CTRL_NAME_MAXHLM
 };
 
 /**
@@ -616,6 +618,10 @@ static inline u32 resctrl_get_default_ctrlval(struct resctrl_ctrl *ctrl)
 		 */
 		return BIT_MASK(ctrl->bitmap.cbm_len) - 1;
 	case RESCTRL_CTRL_SCALAR:
+		/* The hard-limit toggle defaults to off. */
+		if (ctrl->name == RESCTRL_CTRL_NAME_MAXHLM)
+			return 0;
+
 		return ctrl->scalar.reset_val;
 	}
 
-- 
2.53.0

