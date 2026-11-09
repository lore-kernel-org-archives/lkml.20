Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259517;
	b=ElFSXSe47tUcyjZ/qYnXedU4WisrCXb/4uV1HQB0hvx0NKabsiZtoThG5t+GJJicRgkt
	 PyFKNa4go092T/tLKpo1Iarcr6aBiV9ZWHntUqUFD57Y3iUAQv8uQnLPzCWvQtv0x+CHk
	 S+7Rv6peGjLX5sRfjWJBytVDkG1XM34KUousKUYeOJnvygcIZ6urJnn1cfD5VlSBhJ7rz
	 Oqqv74FGJxQPQiH97F3MSKmrR1D+R03j3WSOKzhPBOmp+QiNwdvMM2ABZlDIEpFQLFZzI
	 +IrALjycjHGFLv5ewhAtjqKjx8DPv45TDVynFFOEevees22RqSuRuWbg4t6rBiwf3EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259517;
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
	bh=E94mD6UqzqWlubVjmImfagf/ISNcFzjBebrECEaQ6oI=;
	b=ukj4oJhuY+StR6XBsTmNTjWgdWcpZYqmUkyUkQNwncmHBD10PzCwsXg0nhtyEbfBRrnp
	 nTAWeJlIFmqZViz3XPNLvd8PMh9D3y5qUojV9uyMwSaU3dHLUQaYDqv62+h/4PrPnVFBl
	 VVnpV54tTNfFkDfqsqNBNytOVadsBr7yVdx/6lSujpJVuqwz64A20QFKaaAs2DyWE1tFX
	 Y3VZkpBUanML+WXSFr8/IpqNWtMXFrTjMGnzfu4bxzQYtY55EHjvdBAmrlOVJRsQJWHD7
	 5YyEI+ZCln0aMMzFGkuiyIX6c8epe73YO5oLt+AY3zcYeYyeL75XyOc0EN/J7AfhfBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=E0unIzX4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.33
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201AC606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 201AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=E0unIzX4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdCMLq98vxo74+Q/F1TQMeWQ7hXZ3GV0AqsGirLx+pt0I2YxDDGh0TL9ufr1GYOOR+xjRlYR2Sfrl1LVaOeR9AzDhOdE+mIcNcmpMd5uP/uoDZI4xNyH4LAvbgqhVTyrummVvNUJdkV3qhHGl6OgELAyUgyD/J+Dmyf+1F2MV1SPHZoNY8eq84YHEiaAu7EXmf+c0utr9l/FaFo6BcBWu4xWhS4wsKGYaz/OW6I+4BK674dVCm6TU2TAq8f3giudz+6hZ8NfzvI7a3S3EQWtKrWaBBcxL9+75Yy7m2RME5AMAiYtL+4SxBA/aDvIkXQnmqN9LcQ95GxlgH1nAr7Ogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E94mD6UqzqWlubVjmImfagf/ISNcFzjBebrECEaQ6oI=;
 b=qLSYDbI/xJGrzQ1Ssku7iTjfwlpAVARgRVbhdtbSPD6QXpFwNPpwKbVkfJurAj6WlGUzrawvwgHagsZpfyWaYvktTnNFdRPN6IqDkaGwdvjCfwH1el5skzoGThPYn34zQm17g7ltdPWVCUJyAsiuE9jWC325X141dL+4ZFXJdb1wh7qJzp//m3sEfqt2c/o8Xejq7oQ09kkxdbgkZNNm1TYe4LUyOGAbDqDkEddOvLAoem35cswrAF0O6uPjIGa3iWiOt8VMS9G3eei9TwPowiKexKa5mLJdoAE1hiTzWyMfVWjrHuFB1NwM9wVEywdcW3L1VnsoLYaWBWUS4aNA4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E94mD6UqzqWlubVjmImfagf/ISNcFzjBebrECEaQ6oI=;
 b=E0unIzX4FB+YBnjw2W10ILEQYAW1a9ku0yuarROjjsSdO77SwHU+PqwuOm1ACc9pohPI/t3pM8zwTFa9UtvDys05EoFiMPKa4JQ78mcErYcKzL4wOkvg94m79UXvzCISFImQPeFJltzEpas7zGyIZ4NMt+ZnzWC9rVgUWa/D4T/+Id4Ts5jYqU+857xtho17P/NxJsQpyKhQc12rD7jo9j6RCfFB3AWEF7ESYW/7uiVCqyjbwudjQEsgmw5j3sZIBwBkRgcxhKKKEPw7JLlemOFjMSG3OcvlcOst7OvKcobb6ci9If4mGmlpzuyYTHz8OS1VJT1bHNYitOspKRxDhA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by CH3PR12MB7546.namprd12.prod.outlook.com (2603:10b6:610:149::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Mon, 9 Nov 2026
 21:24:34 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:34 +0000
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
Subject: [PATCH RFC v3 01/15] resctrl: De-hardcode L3 monitor infrastructure
Date: Mon,  9 Nov 2026 13:24:13 -0800
Message-ID: <20261109212427.1409204-2-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:a03:332::9) To DM4PR12MB5230.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|CH3PR12MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: e345bb2d-1a25-4220-fc50-08df3ea7d9a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|921020|11063799006|56012099006|261026121527099003|261021123027099003|5023799004|261102123227099003|261009223027099003|261021121427099003|261026140227099003|261028144727099003|261022113327099003|261022075727099003|261022105027099003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	doiaar3NqZTcRlAEXNCtHfUY7+ifXmfmOU2vFrUUl76wsNISPEFJE+zoGzHO0itaL/FrUwqpKCyimzQkhLOaJlnTmFq7VtuR2UCH82lZWwmn+3i3L+qR8r5IgBg2LEoH/dg+/O+vOx2K1sPJMjghvFig0GmHUS0cWvo4xEok1AQDl1xyt+0QJxiuumzaUvFWX+hYdx3D0+vo59IrtUSHYKsOh6cIVI1ysOEZzFeJNdV/cb7iNx60qQ7NinMqMPbRr0fX9Sz/51SCql242+cf7ETM7eCvED5SbgL5EEshF95Ia3RYNk95xr0X7EEpaq9lq+2CfEX5HLde+zPCU+YwcyMFHLuJeqJpI/oAONGuHd1uQmQcBYQU9LhvFEzQRANg0/0ydSU89STzpK4gk+TtU7oKOjSiGMJMUlPdyKsuknbiuOGET7VU9i6F1Q08LMJ0IN+PsqtbXB/ARnBuWmqYxZxlBhrSgiXwUenuh/daquCx/ubyk9oYW1OUZHTYI1dRdDS9i6fvVCAqtTf3aT1iBsIIovySSHwidYiA1nBwzCPg9wuC+MYsKDRv12k8oO256weIuAtpimlgQRK9PDKl3baP3JH34atALtrRwUUczoOKvXD90fbP4vlBj54TFBV2mE1vSDdK7QZHAdpyXjJHn3Sps27JnGEGOsbBuVwYU3hKl+BvvocTH2GjHBbu452fW6VwRp2kMo4oq11NQEreUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(921020)(11063799006)(56012099006)(261026121527099003)(261021123027099003)(5023799004)(261102123227099003)(261009223027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022075727099003)(261022105027099003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YiE/hm4BUvyV/TplIUuCROxsUpqt+9/vhidWSMSk4N4JYANmeWTJN1rN9p0w?=
 =?us-ascii?Q?aHWrhT4frR7I9YX5QFk2I5fu2r2xlwRKNmf5s/qzU8hUGuixAV9t5CMwTHuW?=
 =?us-ascii?Q?vVA8Awj3whxSndmgVw4UqXeFrOiecguBQbFrgmeYT2qn6VcAmZXZFAiapJc8?=
 =?us-ascii?Q?Lun/mZdEBK92CSKrGOz98pL7+lyawS6MbuGCaKCPWCbmcnJZ6a3n3zn5Q8f0?=
 =?us-ascii?Q?MBUly51EyecnEzVz6ZoV2BOoUnY+yX94Oca1LL1213NRdW9cPtnULIkiFNQt?=
 =?us-ascii?Q?QWOrgznihaY8/I5gBYUOS/ghMbxhu0nb7zs6o3SK9zgnPjNx1i/XMqnckGbY?=
 =?us-ascii?Q?f7eVLxbgaJUo0xHzqebMJq6Yaq0oR07KCTdQMDcTpiKqNHh/2anV2EmRWy4F?=
 =?us-ascii?Q?mTgINXCAvut/eR92Qm+gkH0O8LCM3w0Newe37TaLnnUpHgde9tz2Lfpw3QuJ?=
 =?us-ascii?Q?iXNmwoZdmNbZmluPFRJ8sqHtsPbIK4YKw4ndldH1uc+zqTv2YAAkPlxkvPi1?=
 =?us-ascii?Q?HzCAYxanxyG0qHPpFveu9zgnWxiGonugFlUm+4gb5qbWYQa7+kcuSi5Z0gJ4?=
 =?us-ascii?Q?yekBoh0QJtfyP/asQPkrEBQdnpw1VIFtUMDwnSx17utdaUNVL9DEsy21SBJ/?=
 =?us-ascii?Q?zGbNEs2foJ20IgYiJzaAFZJty8VaUY8kqU8grueInRSEkf1gfi8sw65sY07F?=
 =?us-ascii?Q?N7lS8t+K/af2A7U9CkTHQ75yCEUsNQwhEja9OLS6yyj7LZPbO8+/7Smj4Jp0?=
 =?us-ascii?Q?JzmRZDAmi5YnL+UrWniGcxNXNQCz6hmYTcvqutX2MVNE7hLeAMxwRuRIPzyL?=
 =?us-ascii?Q?QPgPGAevDaJyNpIKjBS4WQCX28feh9wnIHZ5eFfCfg/QrOJkmWrR2quE46LY?=
 =?us-ascii?Q?L4Jt9nQPL7npPcwtTtaUbhPH9O+AYF8WRXb/QC01peeI+OH8YS8aJ3WxnXf6?=
 =?us-ascii?Q?2AnIv9G2BOpdInQRyK49mbAgxl0qITINhDYc6DNbZ2U4u0O3xovpP3hmR6k0?=
 =?us-ascii?Q?q0SgdY9bHw8G+UVdDx9Xc3MoXio0SZ41DHCokmkH8JtaLfS4EagKbORCz0BV?=
 =?us-ascii?Q?4xHZikgL2LMDJXmzbEQEq9oFjelEi5iuu+gGp3fbfCgXQpyztg03Ypkk4lqq?=
 =?us-ascii?Q?LDIEe6URlZfrGgaKPEulRsCJxvPAS5ARARAU80WYMcBoynk5acnmJ36GAtHt?=
 =?us-ascii?Q?KqTvIJSXBmreRrRyqQ9VIwWWXx54eOG1iDfaCTyOPF0gMou+ZbBHTRLUF+KS?=
 =?us-ascii?Q?iB0fMsi8nO9HLmgEcalN8QJwz/+AR24+rxJWCNIDGO6oTZQ8vmuGxtVSje3q?=
 =?us-ascii?Q?/xtD+eM/S5FpxAyy2/ogR4S9zPbe8xxKZd01FP6QYXr9eJi9qP5c5KEVSKJk?=
 =?us-ascii?Q?pAFnPOKV5cAycfYrjGYZGwFs+4ijxJV4RFtiEloT+xEuL1QZIhVkVSg42GzS?=
 =?us-ascii?Q?Ddzqbis0sQEpfmmMZ0Do4QMSbKAawO7NiLCkFhH7cTZF4xFf4SF1osIDmUzs?=
 =?us-ascii?Q?7YwMXmJNcplhHP4u9qvTxU2Q508qJaMCEbpnzLJgDAJ8/CYhHgnlu8Nz3Boe?=
 =?us-ascii?Q?hXGcr3vgXR7vumWR9AfdW8QR0O4UoxP7KAOROXgCZrFh74Xb4FLHPFwWkzcq?=
 =?us-ascii?Q?P6vfd7Z5RJqJ6Tgaey3jiyUKuDY1iD2FmlYhAqCa4wi9HIBht5+uVGXojTj+?=
 =?us-ascii?Q?ebh0/+fU+PUmED24D537RCrFQFw8Afhok9r9Jlut/RJ1vnvt45B+E55FcVFC?=
 =?us-ascii?Q?Fn9HkGEx5Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e345bb2d-1a25-4220-fc50-08df3ea7d9a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:34.3461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znmibTKWtGLDSBFQ8GnKgk0HRZE1IWUdQoKPq7koq9ViFVVybQLiJHaCGub6Aj3N5INAy1N1Bs7qqY0yYsQVCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7546

ARM MPAM can expose MBM counters on an MBA (memory-level MSC) resource
as well as on L3, but the resctrl monitor core hardcodes
RDT_RESOURCE_L3 in domain validation, online/offline, and assignment
paths. That prevents reusing the same monitor infrastructure for MBA
without copying large chunks of code.

Generalise the monitor layer to operate on any resource ID while
keeping existing L3 userspace behaviour unchanged:
- Rename resctrl_l3_mon_resource_init/exit to resctrl_mon_init/exit
- Factor MBM counter assignment show/write helpers for reuse
- Validate monitor domains using r->rid instead of hardcoding L3
- Allow monitor domain online/offline for any resource ID

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/internal.h |  4 +-
 fs/resctrl/monitor.c  | 94 +++++++++++++++++++++++++++----------------
 fs/resctrl/rdtgroup.c | 35 +++++++++++-----
 3 files changed, 86 insertions(+), 47 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 4bd09b1541c7..af2e6e0b2af8 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -381,9 +381,9 @@ int alloc_rmid(u32 closid);
 
 void free_rmid(u32 closid, u32 rmid);
 
-int resctrl_l3_mon_resource_init(void);
+int resctrl_mon_init(void);
 
-void resctrl_l3_mon_resource_exit(void);
+void resctrl_mon_exit(void);
 
 void mon_event_count(void *info);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 1552ce2b4f7e..2b5654f05480 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -432,7 +432,7 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	struct mbm_state *m;
 	u64 tval = 0;
 
-	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3)) {
+	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, rr->r->rid)) {
 		rr->err = -EIO;
 		return -EINVAL;
 	}
@@ -583,7 +583,7 @@ static void mbm_bw_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	struct rdt_l3_mon_domain *d;
 	struct mbm_state *m;
 
-	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, rr->r->rid))
 		return;
 	d = container_of(rr->hdr, struct rdt_l3_mon_domain, hdr);
 	m = get_mbm_state(d, closid, rmid, rr->evt->evtid);
@@ -1688,9 +1688,9 @@ int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
 	return ret;
 }
 
-int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+static int mbm_assignments_show(struct kernfs_open_file *of, struct seq_file *s,
+				void *v, struct rdt_resource *r)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_l3_mon_domain *d;
 	struct rdtgroup *rdtgrp;
 	struct mon_evt *mevt;
@@ -1735,6 +1735,12 @@ int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, voi
 	return ret;
 }
 
+int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+{
+	return mbm_assignments_show(of, s, v,
+				    resctrl_arch_get_resource(RDT_RESOURCE_L3));
+}
+
 /*
  * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
  * event name.
@@ -1829,10 +1835,10 @@ static int resctrl_parse_mbm_assignment(struct rdt_resource *r, struct rdtgroup
 	return -EINVAL;
 }
 
-ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
-				 size_t nbytes, loff_t off)
+static ssize_t mbm_assignments_write(struct kernfs_open_file *of, char *buf,
+				     size_t nbytes, loff_t off,
+				     struct rdt_resource *r)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdtgroup *rdtgrp;
 	char *token, *event;
 	int ret = 0;
@@ -1877,6 +1883,13 @@ ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
+				 size_t nbytes, loff_t off)
+{
+	return mbm_assignments_write(of, buf, nbytes, off,
+			resctrl_arch_get_resource(RDT_RESOURCE_L3));
+}
+
 static int closid_num_dirty_rmid_alloc(struct rdt_resource *r)
 {
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
@@ -1916,40 +1929,21 @@ static void closid_num_dirty_rmid_free(void)
 	}
 }
 
-/**
- * resctrl_l3_mon_resource_init() - Initialise global monitoring structures.
- *
- * Allocate and initialise global monitor resources that do not belong to a
- * specific domain. i.e. the closid_num_dirty_rmid[] used to find the CLOSID
- * with the cleanest set of RMIDs.
- * Called once during boot after the struct rdt_resource's have been configured
- * but before the filesystem is mounted.
- * Resctrl's cpuhp callbacks may be called before this point to bring a domain
- * online.
- *
- * Return: 0 for success, or -ENOMEM.
- */
-int resctrl_l3_mon_resource_init(void)
+static void resctrl_mon_resource_init(struct rdt_resource *r)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-	int ret;
+	unsigned long fflags;
 
-	if (!r->mon_capable)
-		return 0;
-
-	ret = closid_num_dirty_rmid_alloc(r);
-	if (ret)
-		return ret;
+	fflags = RFTYPE_RES_CACHE;
 
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_total_bytes_config",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 	}
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 	}
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
@@ -1967,21 +1961,51 @@ int resctrl_l3_mon_resource_init(void)
 									    NON_TEMP_WRITE_TO_LOCAL_MEM);
 		r->mon.mbm_assign_on_mkdir = true;
 		resctrl_file_fflags_init("num_mbm_cntrs",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 		resctrl_file_fflags_init("available_mbm_cntrs",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
 		if (r->mon.mbm_cntr_configurable)
 			resctrl_file_mode_init("event_filter", 0644);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
-					 RFTYPE_RES_CACHE);
+					 fflags);
 		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
+		resctrl_file_fflags_init("mbm_assign_mode", RFTYPE_MON_INFO |
+					 fflags);
 	}
+}
+
+/**
+ * resctrl_mon_init() - Initialise global monitoring structures.
+ *
+ * Allocate and initialise global monitor resources that do not belong to a
+ * specific domain. i.e. the closid_num_dirty_rmid[] used to find the CLOSID
+ * with the cleanest set of RMIDs.
+ * Called once during boot after the struct rdt_resource's have been configured
+ * but before the filesystem is mounted.
+ * Resctrl's cpuhp callbacks may be called before this point to bring a domain
+ * online.
+ *
+ * Return: 0 for success, or -ENOMEM.
+ */
+int resctrl_mon_init(void)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	int ret;
+
+	if (!r->mon_capable)
+		return 0;
+
+	ret = closid_num_dirty_rmid_alloc(r);
+	if (ret)
+		return ret;
+
+	resctrl_mon_resource_init(r);
 
 	return 0;
 }
 
-void resctrl_l3_mon_resource_exit(void)
+void resctrl_mon_exit(void)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 416b73c57016..a658e4958562 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -5102,10 +5102,17 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 	if (resctrl_mounted && resctrl_arch_mon_capable())
 		rmdir_mondata_subdir_allrdtgrp(r, hdr);
 
-	if (r->rid != RDT_RESOURCE_L3)
+	/*
+	 * The remaining teardown operates on struct rdt_l3_mon_domain, which
+	 * only backs the L3 and memory bandwidth monitor resources. Other
+	 * mon_capable resources (e.g. the package-scoped RDT_RESOURCE_PERF_PKG)
+	 * embed a smaller domain struct, so casting their header here would read
+	 * past the allocation.
+	 */
+	if (r->rid != RDT_RESOURCE_L3 && r->rid != RDT_RESOURCE_MBA)
 		goto out_unlock;
 
-	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, r->rid))
 		goto out_unlock;
 
 	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
@@ -5135,7 +5142,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
  * Called when the first CPU of a domain comes online, regardless of whether
  * the filesystem is mounted.
  * During boot this may be called before global allocations have been made by
- * resctrl_l3_mon_resource_init().
+ * resctrl_mon_init().
  *
  * Called during CPU online that may run as soon as CPU online callbacks
  * are set up during resctrl initialization. The number of supported RMIDs
@@ -5209,10 +5216,18 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 
 	mutex_lock(&rdtgroup_mutex);
 
-	if (r->rid != RDT_RESOURCE_L3)
+	/*
+	 * domain_setup_l3_mon_state() and the workers below operate on struct
+	 * rdt_l3_mon_domain, which only backs the L3 and memory bandwidth
+	 * monitor resources. Other mon_capable resources (e.g. the
+	 * package-scoped RDT_RESOURCE_PERF_PKG) embed a smaller domain struct,
+	 * so skip the per-RMID setup for them and only create their filesystem
+	 * directories.
+	 */
+	if (r->rid != RDT_RESOURCE_L3 && r->rid != RDT_RESOURCE_MBA)
 		goto mkdir;
 
-	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, r->rid))
 		goto out_unlock;
 
 	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
@@ -5361,13 +5376,13 @@ int resctrl_init(void)
 	if (ret)
 		return ret;
 
-	ret = resctrl_l3_mon_resource_init();
+	ret = resctrl_mon_init();
 	if (ret)
 		return ret;
 
 	ret = sysfs_create_mount_point(fs_kobj, "resctrl");
 	if (ret) {
-		resctrl_l3_mon_resource_exit();
+		resctrl_mon_exit();
 		return ret;
 	}
 
@@ -5402,7 +5417,7 @@ int resctrl_init(void)
 
 cleanup_mountpoint:
 	sysfs_remove_mount_point(fs_kobj, "resctrl");
-	resctrl_l3_mon_resource_exit();
+	resctrl_mon_exit();
 
 	return ret;
 }
@@ -5441,7 +5456,7 @@ static bool resctrl_online_domains_exist(void)
  * When called by the architecture code, all CPUs and resctrl domains must be
  * offline. This ensures the limbo and overflow handlers are not scheduled to
  * run, meaning the data structures they access can be freed by
- * resctrl_l3_mon_resource_exit().
+ * resctrl_mon_exit().
  *
  * After resctrl_exit() returns, the architecture code should return an
  * error from all resctrl_arch_ functions that can do this.
@@ -5468,6 +5483,6 @@ void resctrl_exit(void)
 	 * it can be used to umount resctrl.
 	 */
 
-	resctrl_l3_mon_resource_exit();
+	resctrl_mon_exit();
 	free_rmid_lru_list();
 }
-- 
2.53.0

