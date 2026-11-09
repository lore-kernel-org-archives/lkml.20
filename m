Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259794;
	b=RrGSoH6B2ghRe/dLBqdM/9vM2XlN7qdhWY3fQpx2VMDpM0GsXFyyK6dCcmFQ9E90MUnZ
	 lbM+J7EltIKR3h9H8X2zBLE5RndzXZMPNS97+nkzBSKj9OTc6v55PvfPeT1YrcgrNwz74
	 a6LMfNgl0NuddlobVZA1DvR/Gj/OH1m/+Z1DDl4EoxftyK8/dP+gUZoo0zklkK1M0PLFp
	 /ThphSmFkxs9I8cALosjbjq93hy+jElKYJpOOF1emZbPbJU69lLCjLvJZC5C/zhDVk5DD
	 p0v+RaI0dsyrzixbS9Z04rDQg8euvtxZUdSue9/u+E7fsX40shk2fbOXvvvcOQYyoSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259794;
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
	bh=KpIZuS4/LeIcqKfkqEPM8TUuKLo1V9W5FpsYmoz552c=;
	b=VMiD/P0FquPJcOx0cU6gfGoNSa4qZPUOkEhqZa7OGEjInBrL3UasNIcTZa35fBz1FZ6d
	 Vo4PTQqlKRvx3+PKR/sUtiQPrGtnp3ox//bRNQ5ewA/2VIKDrdw79WO8Ppx+LNe29A/lu
	 lleQ7ZYkyuAZJkjmQIp4+qIC5qFUXWlszvMsiKl2/0P0gnDSxi3qGSCpMtHjB3SXWP6yn
	 FBZxHnEN0jPko6hhlfE69nYCOcNPM3lneV/BOkgFtGIXw6GUN3Tu2F0xHUiHF3KfkBpi/
	 HSPBiZoSuSss4Z8g/IwCI+SgwufCDKS0SrQDCVyRwOC7lDU46DOKx8aix4m5a1FUTvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LSOKH0eV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.14
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636DB606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LSOKH0eV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJ43BCsgB2yZ/GGwqc75UtonFkkk5EHZY8rIyi6+C2gpUNmX5Vl0ftlpTdJhw4DIWijlp/ji2J2pmsrltgDJ+kvLYgitGtep0QwB8uQUIfn9jYmYw2vuFv71jRY1AReWvy4s1mV1D1JmmGXUiICWUBfsEWZ/rOuQ8QjSlJtJnmoM3b+rQGfu0cX9ajeNDt6MY+i0u1sm2ewK9GufbcC8nuESTte/BD2qyC+o/acmQr9w8t5IzQyUtCeSrHRjXyk+1bb5ImNnNfuMBIKudmjzUnBq8GZ4s9cvm0d3C1mKtYDT6K9OirNCEgPhJl0+mqKn3oopRDGs+P2yHRjvFQcgag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpIZuS4/LeIcqKfkqEPM8TUuKLo1V9W5FpsYmoz552c=;
 b=Kc4lCVmpInBxZRZlYVJUsJMOvm2gzTHgMpgghjMRotUqcmCwR2HwNTlwKDfE92YSCYHcR88RHcBh6GYXZnCgs4Xer/mo4DSjKvfmu/ctAUWwjCwmypv/ZGuIEkc+wr5EJzewEJpQDrXNGDYB2211N91i4FqbFB5wxCjS5Z8TAO8PQh2sngUVVvZXQQHRgst8fwwNrsRpJ5B/jkTBApAE9MXvMUvhwu1tnj6uOuH8PbzJ9fXNUl7KTEuZ+VnxISup51MyJY4B+6iv6FVeYJ+BhuJV+Fa6fTjB092kxkq2WE2ridcwyp48q5eSsF+714WpdBqOR/VeWaDwuB6eAXUdqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpIZuS4/LeIcqKfkqEPM8TUuKLo1V9W5FpsYmoz552c=;
 b=LSOKH0eVzkf5Ax/RGzfVsH4fUDqAYRrTqVhya9wGAI5it1pc9hCycF5RS0Mc8kjuYMHtFzAF2jc7LST5LhBGtW5NwPGNGdUzXrQrdmj6C1KD82GVtiaeKJO8RC7Ofripr9d9XSPjK9952kVPcUHqujlNx2sVKAPaURvMtzuszNaiTmPvbAwOx9kazxoQ8W0M5TXBMeN3VVnMQxEGHbDqVpNNnWbNMNLRcugGHvB84XMX4QiTQoEnmxV66eOtgkSYcMfM+fGdYEcy/LK0kHFB89jW+CzTSLLQfxm5jRjk6Evh7Fy9Tg+/svTOmzDCdMI4C7+oOUz5v7Uvxtd/mIksEw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 21:29:48 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:29:48 +0000
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
Subject: [PATCH RFC v1 4/6] arm_mpam: resctrl: add MAXHLM control on the MBA resource
Date: Mon,  9 Nov 2026 13:29:35 -0800
Message-ID: <20261109212937.1409570-5-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212937.1409570-1-fenghuay@nvidia.com>
References: <20261109212937.1409570-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 7fa28b25-d1a6-4350-37ae-08df3ea894a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|921020|11063799006|5023799004|261021121427099003|261021123027099003|261009223027099003|261022105027099003|56012099006|261022075727099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	b8X440lHfuzZSaz8tUm1meYBMFvwjl4fpGzl2GPtRNc7Sq1TtZ8LOrm8rA1MAwWA4gw3J7ax5K4TjHfgN/FxmrxGiPYbSnxKuGzeTI44jYKZ50hf1Ex8a+nknVBbPAzbZa+f25VKUaunskuNixmnwDyfsBCk5+bXO2X7lKExje4lgRvHNKm59Jj/px466qvUhcTeFcHVrN6XJXYLDU4wi4amdvMHggvr97ieRgvVa2I4d0/V87YR7dX2mNIgjCKHsTI8DMvvh38un8u+RG5Ku135m06mdIeN5QvI+0CJJ89W8ALkVfU7+1ic1P0vTvtg1Wc3E/qwef/40ecYIcZeWevPZceqrKo27kevxPuToB35pVdbPtUMHRG2LtfnayhiXaUiPD283jMkAu1l1LNDWRvVRYTMzauWreN4dHJ9NOAzmqP2zexdnbZCy69vWgOY4qEVmvKKEEq2s+uR7QGqbRaBJao56bW8dB8hk1yFrr4iSsgwl+4KBNNSP5xgIX8NydQYk5GvzDQ3t/45wO7vkJSw458Y96iMp9XtsaFhZOtIwf/5gdBRBJKjxTs7VVPTdhKuped4J7+JYcCpIbxpwcLjqQUA0FG6cIDIdRwwkmb1TV6C+mkgKXGFWIYbhHNGTGJQeOAOpBJ05sw5HQQkTJp3DBtC8ayJTHBHLzL2wBEiUHcJImujMgAwDo13VXlM6tO/SOLWJZoHtQ/fnTiT+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(921020)(11063799006)(5023799004)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(56012099006)(261022075727099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JY0YfGP+HTaIZ69KoRxWZYfffDEzhqrQErgIC1zHSAoV9Kdo1jVCkLHzngWj?=
 =?us-ascii?Q?rWoOmAvlnC9VzLp8U1BWZ20NGm3octEFFZ1Jeb1g/xdwEZ/JcSs7cz1DVzuM?=
 =?us-ascii?Q?nVMD+P5PVjnN8oGfhvmso4Wbnmw3h4/TCWoBLo+yJKlHTKImZM5PPVJ4yWkS?=
 =?us-ascii?Q?7rvAAbaC3nSYnmuT+NAjFcr2iyKtAYkdgpjGKixQJGQiptmy4qnEhG4fOHho?=
 =?us-ascii?Q?akQHzVQveos3Spk5nkwqLIsCcYQEojMUZGXTwdKkMkZfwWCONsPZ1suSHgaQ?=
 =?us-ascii?Q?Vy7xbQu0OJcp+p+xMknxbfObUQtSjtg48LoCSdgJEywXhDc9qP7xNvfB09Fl?=
 =?us-ascii?Q?B0snKMYZAxUe/R/R588zf4N2oBdqX2HpelgV3AVGmAzm6+T0tCF5brahuAZu?=
 =?us-ascii?Q?ynKmzLom/dOtOvvms5h2KPBIYJ+QTt3k2cGYVHmSJir7aRmJssnNXdmvrCwv?=
 =?us-ascii?Q?s4RRuwfhst+xm0f+EGQkVR0lFgEnNwhLxu1FUxsJ8YY1AAGoakzGUahbJLh/?=
 =?us-ascii?Q?ZNr2WuszOEUd7kcsVPR+vwi87HW2bJAsJ1MX/Vd95Lz/seHbpjJMUZbGj+yL?=
 =?us-ascii?Q?pDfV6S3RA67vzdrBjTvp53kgepdH8B2S9b4q50FW3d5tWmOCw8ZkPpWN8Sre?=
 =?us-ascii?Q?1SzJrU2cyQHUtzACB6z042Ed6OEuwVcY0Oo8WKtHLqNXULiDdPn+m/l1IEKJ?=
 =?us-ascii?Q?oYCly0dTV4VACQrAdILc+IcffltsbyjfTC4WDekQ7yjGdJYaw8glyBvzk9iv?=
 =?us-ascii?Q?0brYl2KBag8hEYJKnPK+Zhe8Deck8vTnuhs/ZR8ooX0NCMcrfleX4B53ErUC?=
 =?us-ascii?Q?XU1Oxs6luEWrH1S45+DR6tFYGHgM8iTYQqaENwPIBE++hiM9SFkyigeEpr4g?=
 =?us-ascii?Q?sXhoQP7Z6ueFWv2yUEbkRHf9fYK7p0ApqM/+G91MhmDP5AkezA7wn6YKbD6e?=
 =?us-ascii?Q?IMEgTEehwtl2jnZbJgNLBiQr+HgaCC5Z72YwBxs5iEi55uGQJ8k6lnBT9i7l?=
 =?us-ascii?Q?kGWFI1OK1mf7vi0CxxtN/mRRjRMFcJjWiJVg77qg5pka8LdwfQ+WN+SjBJFl?=
 =?us-ascii?Q?RhA8zd0hbT4xcQzp4mfDbc6U0zEJsVKaEWbi3LETXVIa9+VvMpZHX+2PvoE6?=
 =?us-ascii?Q?lIMIJpGlemzpaIr9/uiMZzqxfSkIveS1z044nr1rZpQq/SEo78obIkRzr2mL?=
 =?us-ascii?Q?mKFiN+zYhFhktWzNP6/FjfQMBCiYxnA2LqHkuvSlxHwmn1gVuaJRFpw+S6pI?=
 =?us-ascii?Q?WXRXtv+N1ZFfiiD3HuDydzZEL/+ZYHHtZA2W7V1SkszgaIhRCuKDTpsvq4J9?=
 =?us-ascii?Q?FQLIz5C1Wf0hme66u7g6rUbUPl5jrAV3lGm7TCZS9LA1LuPEaAh0+y504iiF?=
 =?us-ascii?Q?keiti0sb/PYeuXiu5i7jKGhyizK2MG4tf7kvlbXt3jxrTmcskrkml3HaE+yU?=
 =?us-ascii?Q?ob658Zu/53E+JGjHkXxqIISxSPoptYr/GYejC0Hm+dNUfn/VSQjkFrw6kCtj?=
 =?us-ascii?Q?iSWxupsyjK/Oq78ZCc7QeRWlvZvklBBR1iJ1HxXoE513QS1xlx0ca4zcY/fF?=
 =?us-ascii?Q?0nZ6REEXx4aUmG0k7pOYBUPISUiNqhT94DNrL7IIDwYJ/RAVHPoUNEk/uPZ4?=
 =?us-ascii?Q?5wR3uzHPvv8D/QtSDXr80yAyINYUPzYFyT0tKsClpxfXpPAFJyTRmmE6046w?=
 =?us-ascii?Q?hx4ZMBN87sPaKyCDOKWoRodWG9xXBzX0ovypAlh2oK4bg2XOHYWIjWLsrKLl?=
 =?us-ascii?Q?MdTngv26gQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa28b25-d1a6-4350-37ae-08df3ea894a9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:29:48.1409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mS6ziWcwXKFt9q6rCEWXI8pOY0AVX6KtMtHBoMkAS6sgyV5REeqejuBsk3feLv6MiXaIvbkDZJFDGTqW3KKbiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

MB_MAXHLM toggles the HARDLIM field of the same MPAM bandwidth
hardware as MBA. Create that control on the MBA resource when
mpam_feat_mbw_max_hardlim_rw is present, and read and write it
through resctrl_arch_get_config() and resctrl_arch_update_one().

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 154 ++++++++++++++++++++++++++-------
 1 file changed, 121 insertions(+), 33 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 8a169676c4ac..ea1fb7fc7e01 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1266,20 +1266,95 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, evtid);
 }
 
+static void _mpam_resctrl_ctrl_init_mba(struct mpam_resctrl_ctrl *mpam_ctrl,
+					struct mpam_props *cprops,
+					enum resctrl_ctrl_name name)
+{
+	mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_SCALAR;
+	mpam_ctrl->r_ctrl.name = name;
+	INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);
+
+	/*
+	 * emulated_by is left empty so legacy and native mode expose
+	 * the same schemata line. A memory-class MSC is node-scoped,
+	 * so that line is MB_NODE. A cache MSC keeps the MB line.
+	 */
+	INIT_LIST_HEAD(&mpam_ctrl->r_ctrl.emulated_by);
+
+	mpam_ctrl->r_ctrl.scalar.min = get_mba_min(cprops);
+	mpam_ctrl->r_ctrl.scalar.max = MAX_MBA_BW;
+	mpam_ctrl->r_ctrl.scalar.reset_val = MAX_MBA_BW;
+	mpam_ctrl->r_ctrl.scalar.gran = get_mba_granularity(cprops);
+
+	__set_bit(RESCTRL_SCALAR_FLAG_LINEAR, mpam_ctrl->r_ctrl.scalar.flags);
+}
+
+static int mpam_resctrl_ctrl_init_mba(struct rdt_resource *r,
+				      struct mpam_props *cprops)
+{
+	struct mpam_resctrl_ctrl *mpam_ctrl, *ctrl_maxhlm = NULL;
+	struct mpam_resctrl_res *res;
+	struct mpam_class *class;
+
+	mpam_ctrl = kzalloc_obj(*mpam_ctrl);
+	if (!mpam_ctrl)
+		return -ENOMEM;
+
+	r->ctrl_scope = RESCTRL_L3_CACHE;
+	r->ctrl_mode = RESCTRL_CTRL_MODE_LEGACY;
+	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
+	class = res->class;
+	if (mpam_class_memory(class)) {
+		_mpam_resctrl_ctrl_init_mba(mpam_ctrl, cprops,
+					    RESCTRL_CTRL_NAME_NODE);
+	} else {
+		_mpam_resctrl_ctrl_init_mba(mpam_ctrl, cprops,
+					    RESCTRL_CTRL_NAME_DEF);
+	}
+
+	/*
+	 * Allocate the hard-limit control before either control is
+	 * linked. mpam_resctrl_setup() does not free r->controls when
+	 * this fails.
+	 */
+	if (mpam_has_feature(mpam_feat_mbw_max_hardlim_rw, cprops)) {
+		ctrl_maxhlm = kzalloc_obj(*ctrl_maxhlm);
+		if (!ctrl_maxhlm) {
+			kfree(mpam_ctrl);
+			return -ENOMEM;
+		}
+
+		_mpam_resctrl_ctrl_init_mba(ctrl_maxhlm, cprops,
+					    RESCTRL_CTRL_NAME_MAXHLM);
+	}
+
+	/*
+	 * Link the bandwidth control first. list_add() inserts at the
+	 * head, so a combined schemata write programs HARDLIM before
+	 * the bandwidth field.
+	 */
+	list_add(&mpam_ctrl->r_ctrl.entry, &r->controls);
+	if (ctrl_maxhlm)
+		list_add(&ctrl_maxhlm->r_ctrl.entry, &r->controls);
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
+	int ret = 0;
 
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
@@ -1310,29 +1385,11 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 		r->alloc_capable = true;
 		break;
 	case RDT_RESOURCE_MBA:
-		r->ctrl_scope = RESCTRL_L3_CACHE;
-		/*
-		 * control_mode stays legacy. emulated_by is left empty so
-		 * legacy and native mode expose the same schemata line.
-		 * A memory-class MSC is node-scoped, so that line is
-		 * MB_NODE. A cache MSC keeps the MB line.
-		 */
-		r->ctrl_mode = RESCTRL_CTRL_MODE_LEGACY;
-		mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_SCALAR;
-		if (mpam_class_memory(class))
-			mpam_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_NODE;
-		else
-			mpam_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_DEF;
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
 
 		r->name = "MB";
 		r->alloc_capable = true;
@@ -1524,11 +1581,19 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 		configured_by = mpam_feat_cpor_part;
 		break;
 	case RDT_RESOURCE_MBA:
-		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
-			configured_by = mpam_feat_mbw_max;
+		switch (ctrl->name) {
+		case RESCTRL_CTRL_NAME_DEF:
+		case RESCTRL_CTRL_NAME_NODE:
+			if (mpam_has_feature(mpam_feat_mbw_max, cprops))
+				configured_by = mpam_feat_mbw_max;
+			break;
+		case RESCTRL_CTRL_NAME_MAXHLM:
+			configured_by = mpam_feat_mbw_max_hardlim_rw;
+			break;
+		default:
 			break;
 		}
-		fallthrough;
+		break;
 	default:
 		return resctrl_get_default_ctrlval(ctrl);
 	}
@@ -1542,6 +1607,8 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 		return cfg->cpbm;
 	case mpam_feat_mbw_max:
 		return mbw_max_to_percent(cfg->mbw_max, cprops);
+	case mpam_feat_mbw_max_hardlim_rw:
+		return cfg->mbw_max_hardlim;
 	default:
 		return resctrl_get_default_ctrlval(ctrl);
 	}
@@ -1594,12 +1661,33 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 		mpam_set_feature(mpam_feat_cpor_part, &cfg);
 		break;
 	case RDT_RESOURCE_MBA:
-		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
-			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
-			mpam_set_feature(mpam_feat_mbw_max, &cfg);
-			break;
+		switch (ctrl->name) {
+		case RESCTRL_CTRL_NAME_DEF:
+		case RESCTRL_CTRL_NAME_NODE:
+			if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
+				cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
+				mpam_set_feature(mpam_feat_mbw_max, &cfg);
+				break;
+			}
+			return -EINVAL;
+		case RESCTRL_CTRL_NAME_MAXHLM:
+			if (mpam_has_feature(mpam_feat_mbw_max_hardlim_rw, cprops) &&
+			    mpam_has_feature(mpam_feat_mbw_max, cprops)) {
+				/*
+				 * Submit HARDLIM only. Marking mbw_max here
+				 * would program the shadow bandwidth into the
+				 * same register and replace the live value.
+				 * A previous MB write is already in cfg.
+				 */
+				cfg.mbw_max_hardlim = cfg_val != 0;
+				mpam_set_feature(mpam_feat_mbw_max_hardlim_rw, &cfg);
+				break;
+			}
+			return -EINVAL;
+		default:
+			return -EINVAL;
 		}
-		fallthrough;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.53.0

