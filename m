Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013031.outbound.protection.outlook.com [40.107.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82C54AA58C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197000; cv=fail; b=B8ZucriZc6q3xhpx0R+Q3UjR8eguDk6uf7rw2fYbHNA5ol2wGjvZMIP5VguAZFEKXVth4Or4SVnOLY8RNt106kXoQdx/uNU7kwvYDMr1QJWqzWXWFrHQ3Yf1pwNt5OiwPPUByn1flZdxtUni+mtOUkXYvyXcPTbecK5DUdCVjks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197000; c=relaxed/simple;
	bh=R/m1MqIFQUaqD2SD7M/qIn6eruuzSwF95UlzM+lZxLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CfbJIrvf3tAG1b5DSKh8hwUvqsviEs45MIECO0OswK/81qdauAsPCWYDLMm8/wdno3ubc4IRXvP9vKotiMHgtdHjcDFQU8UEr/nMu88wDK0F8y1kLmqAKUxC9TlpwvLkscvw16X7jOYMhsHInUPGcG4Om3HCvLQCyUwyjvxRNDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hbPjC9GD; arc=fail smtp.client-ip=40.107.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hbPjC9GD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSMeP0m6TaxaMJbDsYwowwVAdQJD5ZrAYIYaQ0L3/kPTi0LQDNfAsD55XIyhLvE9Xtc0CfIKi3ubRwwl3vDNdC1p9vEnSyKbfXY44e7rI9aTAYLCSPMVsG71ZnbIvqwm8Ga6wXIB7aItMRFHFRiQLJgpUB/lwja2hQOYrHfh5tW0fnhGsuOqgcR4iqudnJVZmsJkzpRIAswIJ9YTjX5QL751YcgUFjUqJ8qizOm/n3GuMqzJhWScwFGvxRqc8Jfdbi+db9HFLhITbBrxKjXai9cjdsZ918EFyHLKz539xkVOhZjjqCYD33DOqpxKCWo7IPhthQSTO3xTMtRFcR0YNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA2KkXMD+6sJD9XUtH1Jj2zLyB1rHqw0sRQg67atvZY=;
 b=Rzu8tlc+6RFLS0UJ48PQf3N157Lyq0o4hTYAdQrJ7rxt2T2BorJ7xdUkXjhPhPLTRi96rYoMtvl4N7NILxJWPqtE4Du961t7UG+Z1ev6iCLt3mvVN9v4Aj1PVAYW3uIIGC/K46C3CK3cIA3jkT8NKD99+gU9tv7NdgjUipSxdZW6Qu0AboRTOf9EGGqN7+e6fUPeh5mU8jadiCd3NJrKvTrORIk5rILg22q5hkLi/dqztMaqKxe+UI9AtPAeYDgJUBNVZH0kEdLrasC1shcDl2592STOn58SDMJV3fkqAhM4Da6pD6TUWlrijds2anD99yHdO0J7tpWQfxxQW54Llg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA2KkXMD+6sJD9XUtH1Jj2zLyB1rHqw0sRQg67atvZY=;
 b=hbPjC9GDZfs9iUzfZNMF4USFkM2n/vBgLRNbQ5RG00hhtIAd702e5zNFJ3XooIqkyuphLnE6EgDU2pnZIz9jl5dEgklg3UQJ/TQcuXo0Gh6AltiSi1wyeh4cUa/Q+0AbqIJmjLGK/TIEXab0kYfzwuTk/sVJJBk1mqN+AfIAIs2Ni1FkGMOExrzhw/fdbEZm7uuHTqYqrCc85RgRAr02OBqq7aVPN+2w42NqHbpLMVrgOctngDL1RcLhwoh4WDtV7aJcm5szQx+7TvRvBZBbyeikusGhGTAep/nGbBb2VFkzFOQyHLxjF9IoI7xH/gBsB3IIAA8SXoDUUr3kbRrXdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH7PR12MB7306.namprd12.prod.outlook.com (2603:10b6:510:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:13 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:23:12 +0000
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
Subject: [PATCH RFC v2 17/19] Documentation: resctrl: document MB_NODE emulation example on ARM MPAM
Date: Mon, 31 Aug 2026 10:22:43 -0700
Message-ID: <20260831172245.42253-18-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH7PR12MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a13fa28-f6dd-422d-71b8-08df078488b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|3023799007|22082099003|18002099003|56012099006|10067099003|6133799003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	sy93JrwHqj/lpsnmeabuSQ7Bm0js2qoNFTXwS7O++Y9Xe5RB9zBaEffJmz2lKmZkz/qS5DzsfDfk4t6QKnV7B/x0kSB0QjhiyNwVKn7V4n7OhVwIzx8UVmM3C+YseWWugPA89UsEEPAkNhVIp9LlHoc5stLprhj7pPXIzI3CQnzDUgRrBIpCM7Ldia+fNCKIrRcjoOmakEQPuBxQTC/m7jLarYBXwFrl8/3W17lGogFeRSw0btczK54pxkOTvtbZXRZ17xGh2PsgXkRWJFg303dgvgadEtcPqDEU/wWQReJqfqU7pRQQRloMQnf8izia2tYHPPiy78PKemnDFArAf38NU9hGOJIG6mL58pZEAvbduNWtlYXwdL0jQj0QoD3A+H8vowbOoC8NgOm1EBqFTuMapUSRIFyWOTD6bJsgSRrdZTVSEXM+P6W65IRWNXzB5IHYFzs4uDsttAXqivy4tmaD1sJeum8jPPUVlydBnfdU5c00ZBkr6sgTPK9LAS57/il+yW4KtfQ9xkDH0BzLSl5ZahtXXrft/bXVksenZteZNTtYyGQDi/MUCtj8zHwxZjkaZprQKw1ODuqodEueOjjkK7uiHdbfq3O/BxjjEsnctLqcSsVa6rwORjsYe4a09iAPhPVoeQ4NZxfBCdxsdlyQbIlstMhgkTt8Y1VTkUfZ8R4PnXfY+kfzgtUiJoX0Zp5Uh4J1nl/3dyjV9iFzHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(3023799007)(22082099003)(18002099003)(56012099006)(10067099003)(6133799003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck1QdklEQTZCWVd2R2FQQnhreDhtbnBINCsxTkoweEdWayt6Nmw1RHBjVi9k?=
 =?utf-8?B?SHk3V1FlR0NHMldrS0NXNFNKM3ZpMEp4ZHpXWkg2WGh3VXI1V2VZYUkrajla?=
 =?utf-8?B?dk9VNDUzbzZqYjAxVFhiZDNFb3FHLzhUUWloOVB1cHdleFBKYlR1UkJQSkJ2?=
 =?utf-8?B?L0RGZzVUUzlaVVV6cm1ESjk1aWIrd2xIcWlRejh3ZXBNU21BcHowNjVIK1Jq?=
 =?utf-8?B?MWxkNmpQcU1NcUxmN3VMb2IrelRSMFJqWS9CMXBqTy9BeThGUHp4Z1VzWE53?=
 =?utf-8?B?RjFmeFpsMHVQZkVpRG9lWEFoMEo1RngydTFNSE9OWkx1WWxtcHkyMmJVNGFj?=
 =?utf-8?B?akNaa3VpdFVWZG1pcG1mL3hSaDJCbHJQdWxZM0lhblhpY2Y5RW9SYkNycnE1?=
 =?utf-8?B?VnpwME5NU2w5UFJOb3cyR29LRCtoT240SVlaSGJTNmpBbE1FNzBJZkN0eFRC?=
 =?utf-8?B?elRhQmxpS0RFOU1UdkRCd3NkbFhoSDR0NStUQjdjRFRoUmpLUkZSa2MxMFd0?=
 =?utf-8?B?MmpucnVHS0p4VGI2UTk3bEl2TGYwbnZCWUNWbFBrSlh6SGtlT3FxaUZ5VEJU?=
 =?utf-8?B?S0thQkpFM0JJYlJjU1VZL1VpYUlPWVMrc1FMREd0SlFsd0ltdFBUbEhyRjdu?=
 =?utf-8?B?YTZSdjdzZWVyMzlKNnB2TG5hUlJUaEJ6SlJ6OXM5eStWUE5VbVdiUE96WTQv?=
 =?utf-8?B?MG9Ob3pWdms2TmtyN0REbk1ZenNMcE15NmRUY3R0aVZqWkZZb2NjMGVsUUdC?=
 =?utf-8?B?UUZ2Zno0UUZQTFkrMFAzczd2dnBjdkJYeTdMS0JWa2x6eitPN2N5cWMxY2ND?=
 =?utf-8?B?VGhtdkZmbHJoektUSmViMHpGSmRtRlpLUEtoYXNPQlJjb29WS09JL1YrWkJL?=
 =?utf-8?B?TS9aNE9sdXhKaVFMQk10a0FnekNJQWhFZE5abmFOam1NZVFidSt1VFVBNWlj?=
 =?utf-8?B?Yi96MEpheC80T1hjeVJRUDMvVVJoZ1ZpM2N5MS9aMk96bWM1VGV5N01YaEJm?=
 =?utf-8?B?cmRIUzFqQk13dnlRLzhGandua2cwRGRHdU9teGUvdVBJQlZGUVowdW1aamw4?=
 =?utf-8?B?WFpxK3J0MVR5eXZoajQ5amNzZWZJRXBpdk84OVRKWVVMSlJjbjc3Z1VHbDg0?=
 =?utf-8?B?K0FOdm5YWDQ2WXQ3WHpvbFdmdVo3eXczemhPTlNKd0JsclpXQ0Uwdno0ajM0?=
 =?utf-8?B?VHd2d2ZiTDU3a2NjRjdkVUF2RFZWTDZFcG01ZUY3bExZalViVnFQSGtVbVFt?=
 =?utf-8?B?QzJjcFByalFUNHZZVTVjdEF3amlzcU4wSHYwWEd0dnhDTjR1a3MvdENmQXJD?=
 =?utf-8?B?SWxmTnZmMnljbGtUalN5ZU53Y2h3cjV5THl5Vm5qZ3Q2OWEyTjVSUmI5ZHYy?=
 =?utf-8?B?TTk4UUo4R0VVZUdZZ0w0VkFPTytUVE5yUFNSMHpLUjdadVRmVkN6Rm80MTNi?=
 =?utf-8?B?bTRTTU1VVk9ZZzMyMHdZdVJrV1V3K0tTR3RVdlZZZXBlQUtrSGZnL0ltYzQ5?=
 =?utf-8?B?T3pwalgyZGF4WTRoREFRM3BIRU9Xb1cxeVRPOFkwNnRKY0ViMzdIcVdpUXE4?=
 =?utf-8?B?T2lkQ2pMQzBXdTNMMklYN3VTRXRpY1NleVRraU5uTWg1WGNKcVJWUEt4ZVlz?=
 =?utf-8?B?N3Y0QWZ3U0t2TFpkN3pUREF5M2Zsand5MjlScmx6MC9EUzF4YXQ3WUdRUklq?=
 =?utf-8?B?WSt6empWaEpCSGJqSFlrSFhlUFVva2w0TU1aT0pZckVZWWtKSXpKclR1U2pX?=
 =?utf-8?B?ZGlmMnJ0cHMrQmJGNlB2Uk5CU0syaktBSmlkNTRUQkMyQWtJbnM3Ty9hSUdC?=
 =?utf-8?B?T1o0cjFPdzd1ZnVKWTZESExGYnJnc0tLL3ROSjlrN2FQaEsvK2pXck12bnhU?=
 =?utf-8?B?YkQzVWxJcGlzZE82cGVXc2ZUR3dva1hrMTZpVGJLOG82RlpscldYMVp6WjJs?=
 =?utf-8?B?cHhLV2RhVlRJMW5ldDRabGNIVjdQZ0RKSFNCNDJFWlVCTWlJS3llMUc1OVp5?=
 =?utf-8?B?OEl6cVJGOWo2aHk5NmFQeDd5eXd4VnBBZDl5Ukk0bVgzWitWangwL0JMaEh5?=
 =?utf-8?B?KzdnQTd1aTRhTWUzZFNQclcrNmExU0xCUFAwZUdrQmxYWkx5emg1WjlPL1NP?=
 =?utf-8?B?dHFISVRCYjMwZmMzd09CcUw4Y3ovaGphd3hPaTFEZ0UwbEQ3amtSWksxaW1J?=
 =?utf-8?B?Njk5bmRlUXh1T21NenRPNzFpRzN4T2RLMkpEREhodFhuVTRUbWd2YWk4T1M0?=
 =?utf-8?B?cTNmaWx6amx3TTRVUmo5K2x6REVqZlord0MrWmt0ZWczMXI0SnZNaWNndVRR?=
 =?utf-8?B?cVV0MkxXNU1URmxtNnVxRENRdnB3NFFZcDJRNmdTbVdZOWRXdWU1Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a13fa28-f6dd-422d-71b8-08df078488b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:12.2273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Qayo2DgNMV8Sll23LwsDwaz81Gimlb90+gcrx08tINTmjIl/iPHBvF9auGAuh+wgJE4HOCySn7kaWZNrMgi4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7306

Add an ARM MPAM example to "Resource control mode": MB_NODE backs MB
when the MBA resource is a memory-level MSC and L3 has no MBA hardware.
Document the info/MB/schemata/ nesting, control_mode, and the legacy
MB: versus native MB_NODE: schemata lines.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/filesystems/resctrl.rst | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index fbce6a1bd4c4..450cf269472d 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -353,6 +353,57 @@ schemata file::
 		MB_MIN:0=1;1=1
 		MB_MAX:0=1000;1=1000
 
+ARM MPAM example
+~~~~~~~~~~~~~~~~
+On ARM MPAM systems where the MBA resource is backed by a memory-level
+MSC and the L3 cache MSC has no usable MBA hardware, the kernel exposes
+two bandwidth controls. ``MB_NODE`` backs ``MB`` so legacy mode keeps a
+working ``MB:`` schemata line.
+
+``MB`` (default):
+	The legacy control. It has no bandwidth hardware of its own, so
+	in ``legacy`` ``control_mode`` writes to the ``MB:`` line are
+	applied through ``MB_NODE``. Domain identifiers are NUMA node
+	ids.
+
+``MB_NODE``:
+	The native, node-scoped control backed by memory-level MBW
+	hardware. The ``MB_NODE:`` schemata line uses the same NUMA node
+	identifiers. The control directory is nested under ``MB`` in
+	``info/MB/schemata/``.
+
+``MB_NODE`` is created only in that configuration. If the L3 cache MSC
+already has usable MBA hardware, ``MB`` is backed by that cache-level
+hardware and ``MB_NODE`` is not created.
+
+``control_mode`` lives in ``info/MB/``. Switching mode changes which
+lines appear in each group's ``schemata`` file; it does not rebuild the
+``info/MB/schemata/`` tree.
+
+**Memory-level MBA, no L3 MBA** (``MB`` emulated by ``MB_NODE``)::
+
+	info/MB/
+	├── control_mode
+	└── schemata/
+	    └── MB/
+	        └── MB_NODE/
+
+In ``legacy`` mode (the default) the group's schemata file shows the
+emulated ``MB:`` line::
+
+	# cat /sys/fs/resctrl/info/MB/control_mode
+	[legacy] native
+	# cat schemata
+	MB:0=100;1=100
+
+In ``native`` mode the ``MB:`` line is replaced by ``MB_NODE:``::
+
+	# echo native > /sys/fs/resctrl/info/MB/control_mode
+	# cat /sys/fs/resctrl/info/MB/control_mode
+	legacy [native]
+	# cat schemata
+	MB_NODE:0=100;1=100
+
 Resource control properties
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Every control directory contains a file named "type" that specifies which
-- 
2.53.0

