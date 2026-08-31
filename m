Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DC54AC150
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197002; cv=fail; b=FnJDEiURPyaXe4Ig4ds+5nNt6u12lpKrVhnWaVTR6PQpS6DdCV8w7J4YyE1ZbRN5tvcAdvyU/NLpF9HWC/uBkaLeSxxAvaWvOLJpIjktoRgR+5ImsTlAcGAlTWtmAndOO1eqbw+oCk1XJDu6TvIIISfRgbOFSF8F9o3CMrrcOUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197002; c=relaxed/simple;
	bh=DO94FK1stPXApq6CAVBbhysvch+rJtJkefsY/ovVfJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r8A8k6qlRfH3GZHvlZndQQajbcaXG9jK8tpl8zT9hoKLipy5yvKmElKzTc1vxfx164CTV/0vctJ8pyxKSXG2q6MdGSXcbKMouD+HvDOBt/X7SH7hBcEVQA1Q6aNA6WXd2XzQVQT33Va4/xtRKcnZO+fgGajp3spAgW09KNBxeZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V2HqZ6bA; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V2HqZ6bA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jp/YW7ukcpQEd4gnrnJG4BATLN/bSoRLGt2GeVWmGaWvcQsnHOcAEILidwAqBO2xHQO2BDgtBhnnRNcH9zZ15RZQSll1Q9aT+CHx7B/ponu7+mDhzz2WXXQMvQQUsbhDSHtkyO88lQ9Kq09UkQOwyI25xtoAaGnJ6PQ8B22TYDBeqEXr1OaqoD95mzrHfxD9ncbAyqjU/eiWQUy8t7cJ6QhhjBCLb7oHlZLHsUmrVtrS7BxSywIPbbTiJf4KlCe/2NFt651FfCj9QRID1khsiIefB/TLlcz2QcdmEf6H8ntHCkRDX/w4DQ4le0M5nF1xq0/thgbTehUJSLZUAUbckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6uMh06A67BgxabCNZqHmRHh+QCGcbyNVJGvo7r2QxI=;
 b=pHxHWUq1ZFut1q7F9qdTCEoRJMgzQ9u4FJyrWBJiLDTs4NQlMGuazN6N9cZuj7uXCyNOfvVr42UFJPShxDIS5CEnAMTvD+3TFWHZ+vAFXOii8dyBM5le4xNWh255x1HIssNXqYcUG1AVJAeI36Ss9VBAF06S+8UXXIse9zJQMhSKgrGwEZlcKI7hV+pBQ27vqJnTBDVyb27Y65fuUOYLHpQwHf0wdmgzgOai25IE16mVX8Q7/uRgbXP+JWirQMLT/t6FL7JyGL8JFOFCuxujIQDn/dm/X+ieBiMxs3BVWXrTiAwRXXZRFPw71Poks7uk2n+mHy0b8QcsfpKer09e9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6uMh06A67BgxabCNZqHmRHh+QCGcbyNVJGvo7r2QxI=;
 b=V2HqZ6bAD50r0KlEq9736TVIZ+Rn+G2YBA4gAZUNBF/JgnF8+rqChTzW4z8lAfz9ChMNzpKeHr2Dhpk4n8CAbBPQVdTJjeF5EMzDmq82ZYqNkoO4T84sI+DSnqRMYDpmxL4eVFvddjFnhjadPWlgeediXfTDpHvXP0iYaHcDZLOlJR2wCdnElMBZjsGb/pOeIheEmlY6wbXJo8RiIsup0XZAZrlDCWJonbmrDoBu6tyQMAU12yjzE4MGMKWQNKkawtDovnohZ16v1h3YXGpZdQmscnWxSLs2vrG8qNF9foF9DF1AzSR3we0+a01CvtoyJRFWpqOoO8EjT6axC2Rhlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:11 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:23:11 +0000
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
Subject: [PATCH RFC v2 14/19] Documentation: resctrl: document mbm_assign_scope_mode
Date: Mon, 31 Aug 2026 10:22:40 -0700
Message-ID: <20260831172245.42253-15-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::11) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5cdb2f-ab03-4844-a14d-08df07848656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|6133799003|18002099003|18092099006|22082099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	XAZwu1uM36y77lNCnOqovPpqdcpyKLBohrPQ7WRIA+fbcu+TAWtkgQPQ/XKVMti0pWKqUJmSdNN1sxUbyc0xbFnJQ9WF1kRKm9wWLVDyILOTo5hgPAu3wQcpZ7YOpXZz8PD30i4Ng9jIuBrJ/N21e2Nv7S8RT7Mjq4+i39ej8Kv4RpeSi4OBPQsmCwLmUWI//06Bb8bKb8Bvxu4MMw2wog6M+Bd+x4268cq3JWVnkgrbThnXG/kC+LxBYcyNbqseFtss5BqE6ChOpUbMGC/CFiHszt9OnZTaXwHRZfMvvjXJEwe26kVvDV4HjGZF8S47nTJyr5zVCl3FAt0K7XMmsOVshToPX0mRyLmsYluErW57EHmil9RzVMDpBeXAbFGbquXgIghfwBVkoso2AuHJ2EO1koV2CKTrHcqaqCRRmGtWHJCY/1B5jrYHQEykx+ECHYDwEqDMo1UA6VOPX0iasXiIABJC2YEKw7hzVZ2NbwSsgrDhPGRGrEa6yU9ckGZu3gcvJsdUkJZWQXtjLmfFwpipAn7+nt4RZPQs8r8BNpiMrzyZwOJdWQLyoLn2W8iH7oph0UVLQIfaSK8g0OA33XqUKo15uH4toIcUaftqT0a6VRT71zC3Oq6r5RrXzNeCvb8lonabOruvzMBYR6aMlkWQQdn6zrTAWZPymBXx+111iH/L2Y2EhnUBob7RnkrlH+jn7ZNKCd58x+AjCmR13w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(6133799003)(18002099003)(18092099006)(22082099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W2NFA4SH1KBY4pDhejWhHjPJirKjax+VPE4pRl2H7pqKljpAroqZhNZxX6RX?=
 =?us-ascii?Q?HG011Jc+MKPuzORUl+TOEWnNx02jb5cY5xWIQ66UM0PZtSz1xp4Ku55OOxMy?=
 =?us-ascii?Q?BQAqJBYQ9QxgDBLcdPWre3j5bPDwx6xim3Ny+JAuiTQ6xhwybgmlmoaTY4pR?=
 =?us-ascii?Q?WKdEWeIAxYrtValIHD2QeIx4BflERCUMNTY6bW9hmXHCBFu4zks50PHOoLTw?=
 =?us-ascii?Q?2Eg6LZfhz1gpQQy3TldxAVbUdLVEf+I8VdWSUF+OMQrY3nVhIJiygqxU9b3m?=
 =?us-ascii?Q?CblPUjTstN5NUK458KFqoySnrJ6x4CaFwgT7yYfonkXKceLdNKs02bhuhE8U?=
 =?us-ascii?Q?rMSInY/yAeqO8YwExO9xSPoZaWNBc+QvTlbN7ItqlPiEmS+j1cvx3DopCcEj?=
 =?us-ascii?Q?oGtBoTze0SJMuD59spEbY6hPLOFmY0BJK3dDRmRIwIvgQOCU3aC7A9JQQbOv?=
 =?us-ascii?Q?YsJcVRHsmShfwblgGqpmPNfRncktw53DtzLZcrZYZpRMZzTx8duczQ/GwVFV?=
 =?us-ascii?Q?56RZAj9CAXmuX1oXLMArC3T8DAl5lm1ZZUfXBV/O1oaA0ejVuPc7A/ltGDip?=
 =?us-ascii?Q?STkqIxM1V70bCFvpBTGvsRDTccbFQbt64j/LvvxIfNixoiaaDajoQeXqTv4W?=
 =?us-ascii?Q?UEQOe7hAjnqIWPeHiEK2+pzb3LYn3n21GSZRhpql7fPWmWFuRmYrADx+XlOh?=
 =?us-ascii?Q?tQcguImYGZ3aaDQMg0WtNrcz4P+KSlfJIgfdnIlIhrP7myD54z3sU1fxSLEJ?=
 =?us-ascii?Q?NanzLAe6suOK9jzfkqj51pe+aKvsEwD/9nmqPifh1k22lxseDRTPzdxaox3L?=
 =?us-ascii?Q?3rQKty772us7O35NWB7kJnmCKt9owBX1ysp84rXmeTApt0Xwck4gkEW/tIcK?=
 =?us-ascii?Q?f4g7bQeAWxMgwwaHO86bI8xBA8W9SMRiZLRzNTGpiGuJTp9KjP5UTvRvU78v?=
 =?us-ascii?Q?g7ofUOyQDfDyHSBam6gHQW+p1nNT6FHyx9VtFySObWYas+eSDlRzlzJrqd3J?=
 =?us-ascii?Q?WBDCL49DvK6+OT3riYWa8kxy+FKFkPG022vMIwzhmQiOm7AwXUQFuM4b34CE?=
 =?us-ascii?Q?t22Kyc6z+6+TUDWlM4reqf8ut7HkYBXZjVuPiweKGxpkAcvE/HN23pbqUG2J?=
 =?us-ascii?Q?TYESBtfncCrmUUoYEVCHUKplivdMpLf0f2YT+LD6/2MGbvE5Av2x/TQx1XFL?=
 =?us-ascii?Q?atfUCx4GfjDsbr9R0R0cS89g5ZbvYj9PS61JiMGY5DrLPf7icHpGsJAseBtd?=
 =?us-ascii?Q?+Q/IyhRH5aHU1bq5SMi/zTXXjhgodcZvnBSEulKQpZ8YmPbDh0fOHcZQJh5E?=
 =?us-ascii?Q?xqyFqk8x0vDtycGoPT/1peIVoJtT0HkWrAZima2pITzHY+0o1VPqss+iVbNz?=
 =?us-ascii?Q?fLzd31i4o3r8mNQkcojEXeLNQ+ljnOCSOo9spSHPNLXXpSA3JpG1wePiGhU2?=
 =?us-ascii?Q?I+xxXLnjwKnuH/HgaQZA/wxzU0q9/oSlzGFZAP0k+2gmuo6v/vNIJr5YnV7c?=
 =?us-ascii?Q?4W1Z5bYZrAXNaQLSPYUxR6DnnqSDyHpe0vJ7gIIaq3/GhjyAJsP45Ryk3oDg?=
 =?us-ascii?Q?V9lUB2Nnoh1/Hk6MPFa2ERXWWe+/vOyR+FMQpL8ZWHPbSqwD5ieZ4Kbtc2FF?=
 =?us-ascii?Q?TK7M6uiy/Cypo30mFuZT35S8P2iIqbR43RU04X0CFraEkQXLFyh8FEszSka5?=
 =?us-ascii?Q?biCYsxGxik9SdZjZvKTyJS0NpX20WRbPDHa1LzEvcc8LjAOgCcEFar3GilQ1?=
 =?us-ascii?Q?Z9z8LVl5yw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5cdb2f-ab03-4844-a14d-08df07848656
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:08.4852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nK9lJz97PWmbsqUbCi4X5bYQk99RD5L83zRNgZONHSvKgBCPU+UQI1+h6+ZibPuuQuEDLQ/BcmBrjfxYr7pu5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF

Document info/MB_MON/mbm_assign_scope_mode and the legacy
mbm_L3_assignments vs native mbm_NODE_assignments names.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/filesystems/resctrl.rst | 44 ++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 434e6f42db4a..5dac9aa1da01 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -550,8 +550,10 @@ with the following files:
 	the user. Each event within a resctrl group can be assigned independently.
 
 	In this mode, a monitoring event can only accumulate data while it is backed
-	by a hardware counter. Use "mbm_L3_assignments" found in each CTRL_MON and MON
-	group to specify which of the events should have a counter assigned. The number
+	by a hardware counter. Use the assignment file found in each CTRL_MON and MON
+	group ("mbm_L3_assignments", or "mbm_NODE_assignments" in native mode when
+	NUMA node MSCs provide MBM) to specify which of the events should have a
+	counter assigned. The number
 	of counters available is described in the "num_mbm_cntrs" file. Changing the
 	mode may cause all counters on the resource to reset.
 
@@ -583,6 +585,37 @@ with the following files:
 
 	    # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
 
+"mbm_assign_scope_mode":
+	Exists in info/MB_MON when memory-bandwidth monitoring supports
+	assignable counters. Selects the name of the per-group assignment
+	file. The enclosed brackets indicate which mode is enabled. The
+	default is legacy.
+
+	::
+
+	  # cat /sys/fs/resctrl/info/MB_MON/mbm_assign_scope_mode
+	  [legacy] native
+
+	"legacy":
+		Always exposes "mbm_L3_assignments" in CTRL_MON and MON
+		groups. On platforms whose MBM counters are backed by NUMA
+		node MSCs the file still programs those node-scoped counters;
+		only the name is kept for compatibility.
+
+	"native":
+		Exposes "mbm_NODE_assignments" when NUMA node MSCs provide
+		MBM, otherwise "mbm_L3_assignments".
+
+	* To enable native assignment file names:
+	  ::
+
+	    # echo "native" > /sys/fs/resctrl/info/MB_MON/mbm_assign_scope_mode
+
+	* To restore the legacy name:
+	  ::
+
+	    # echo "legacy" > /sys/fs/resctrl/info/MB_MON/mbm_assign_scope_mode
+
 "num_mbm_cntrs":
 	The maximum number of counters (total of available and assigned counters) in
 	each domain when the system supports mbm_event mode.
@@ -859,9 +892,12 @@ When monitoring is enabled all MON groups will also contain:
 
 When monitoring is enabled all MON groups may also contain:
 
-"mbm_L3_assignments":
+"mbm_L3_assignments" / "mbm_NODE_assignments":
 	Exists when "mbm_event" counter assignment mode is supported and lists the
-	counter assignment states of the group.
+	counter assignment states of the group. "mbm_L3_assignments" is the
+	legacy name and the default. Writing "native" to
+	info/MB_MON/mbm_assign_scope_mode replaces it with "mbm_NODE_assignments"
+	when MBM is backed by NUMA node MSCs. The file format is the same.
 
 	The assignment list is displayed in the following format:
 
-- 
2.53.0

