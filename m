Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022081.outbound.protection.outlook.com [52.101.96.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14289632
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788015215; cv=fail; b=TQ6k0GhH6lYg3lz3FAdiGiGzh748P99NuLnjwBY7JnJg5FNF2JfBd9XOmg10AF8NmEVW6Z5vB99jz6CSPNLPatptqzymXfMIElnX27QKn6+UXYdyDxGyJVY+Y/Y80VQg6G3Wjri86ARqxz1SxWSIS/0PU9TB36AqudadrLMLGvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788015215; c=relaxed/simple;
	bh=+zPAQZXLUrnGlSQ9NPndLq/y58j3Vr5LYdcU01PAwxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QRI7SwZBwnniM2wukR9EK1W49CyT+Ht7nA3G9r8yCxko4PbUM2x0O5oJ7tN4CLoDp84M1WmgraPzYj3SAi4aBoFXmgh1R++Fp47tikHxd2/ecuZtkJ/Qap9ah5LYiNFZuEsvUdBQY1HfUejCQ0r36aaPVtrHHPAtOReh4Ypv2qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caKgsoZ/5Tum+X26ukKX8c4iLc7hMiI5JHRg56WCdq+iLDb7Y1HrlT1EFqVXgX7APHsCGJxUkgxGcnys4PU2MGEw8zkko44JMtc8nlr81g4e0HOB1LdszTJmbv/tZgdew5sW4ByrKyDPCneiHwU/0E37at3kc0KzmF4rgCoDDFSR+JwHpJaV3owm/L7P+WZiS8LMaPMhIsZLoqf+iiOQyOK9GAXiaveCBchgGLSiPJG7NT3x+ihlTsMNso01lz/9wFdWbR2gsFgf4HA0yTlxNPCgRk1Cbk1NOnIbF4oKzfGQxJr0iEXQxMZI7dwOUSxwlFeb2r64WplC5nWR5vVq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=Wzm0JTEpq/iXmZBvQUwRVEjtoy1pZJJ8vdMsR6ZcImE=;
 b=vV/lA1K4tTBoXBhBrs7pRZz9CtjBT4Ej9zKjlZSqEZMIoNDZEpviBQKKnnamgqOzn2MUq4knjAc6NR6D+bYwmaq3vunIOGcp5kzIl7D3sPxqD57lwQvAr8xyeCO0JC2TP85D+s0lF7ZePGDMip3U0fi8lqbmWsrx60Qa0Qgm6IvrLXy2pKaCm9tipMqae/peUaDs0N0mIWW98rhcjnZstn+GWpicR3cWpOIkaD2PnrNnNng4efTZYWabYqWx5MKg3WnrbbnMNAh8TC9+G5iD4vfTuZ7SOUliWzCS03uYOJUsCedpTEWTTzdRreLtwzXNpLWYu1cvnCd12hyl+Tf58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB7197.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:333::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 14:53:33 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 14:53:33 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mhiramat@kernel.org,
	pmladek@suse.com
Cc: linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	atomlin@atomlin.com,
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	steve@abita.co,
	mproche@gmail.com,
	nick.lange@gmail.com
Subject: [PATCH v10 2/2] hung_task: Log summary line when warning budget is exhausted
Date: Sat, 29 Aug 2026 10:53:21 -0400
Message-ID: <20260829145321.18423-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829145321.18423-1-atomlin@atomlin.com>
References: <20260829145321.18423-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0396.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::11) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ffe653e-51a1-47a6-83b2-08df05dd4bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|6133799003|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LYm80oOf9nxJ3LLzC6Gn2jDuqzEw5wSnPOb4OG4ctpKhPMcW5xEJX5sYBfzHxZTomyfpVTYgvQyrPaejuJpvBUbNEJY44DC4eeVBcI/mrg7KWIUe0oREQLzsTXAcdVkkSDD1pZnvBT8AJDFryzRCR9V9Tbc/YqAu80u4eXGkt3yVe6nzsf0WryskIcIL6VqwU8NvKPrswHDl6X34zyYUSVvNArxNz9jtwZTe7EEWFkMzpyxJgn27YCDK0OnWQyA+AgufZMnTT3ejgmhB115/GCOirjxoDK2RsRbXmRLMTzI1g0aIcFToEkDLb3bUoTOoJ7rkN+lHn0ELMJmcU7iiUV1PylkGNDb5lePUyOq/KNmyCHzM/GG7uQLejEzkCldGPlC5+TTgIPFbX1fIu+wVOoWKI0BHpR+h5HwhSO2dYA1dAPO4/JVppOSbYVloHngztdwOVVp5mr/I9GhGXvup9/nQI9St7SBcCGsU/smMtW5yvdRkeqhI1OS00DY8hwV93PuqZJZ5q8axIkQnS+Laj7cCq0hE1aPcJhxnKu1Jpj6bgcUoL8AaQQIFB9JNa6eKwtI6gqdroh0eFZ8SSpqR3vEEWEfwi4xh0ngPgWLKItsT6PX0rw1P24VOJaRCLG1bvfP1b9gZRkv1uByA1hZFFS0/0sI4BHTSyrsfxk1hRFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?at45idlKPSgdCD/D4gOVqWW65fsHi74egUarip1/pteMPX9+aBZUt6h9s9yz?=
 =?us-ascii?Q?KuKlugxhTy8ag/zNFjKVW0ZKVSmLtlOEtlIzjNfr5OqH8m6vBxO9epemOBAc?=
 =?us-ascii?Q?FF1qdx6xTTCYs1ADGyzfPnlvzpd5xGIA21ejEc82l9BvcpZPkajJTzgasopx?=
 =?us-ascii?Q?CH1GowdX4hLVkcs7Vn3G/NhYISEuZDu0f0tZiLvoepv/9b4CIULM3PhiL1e8?=
 =?us-ascii?Q?qrbHdsZZVozhKsENAy6i3OLnODHlwbRlYvITmswj0G2/XfgDgSSSbVNmTHGf?=
 =?us-ascii?Q?VU1W/DfMrsxqp+4pb/zqZ4n6XE0n/AbRBAK1W/R4v1CyvX6UroQiXydHHOkc?=
 =?us-ascii?Q?ez2Bb7MgVn4pkIzW2H6B+TYK9UChpxpO3sX8AllkwXeBIStfSXeKiaptXGY3?=
 =?us-ascii?Q?Y0OgUrwTMfLlcbIvP9VEgOIyiDv0XTAEYKxjyxweAHPtXvcQLhB0dQB9t4Kb?=
 =?us-ascii?Q?yhNr4OsBDst1RQuQINB23GJvuvUDu7ux+h++pu9u5T0mozwyL0jKUk5e+37x?=
 =?us-ascii?Q?i1OAcC03txmOQ0klHBdSZQp/VDeT23PJZKtkIvkKccq7TJxCy9BwJ4TRFmvv?=
 =?us-ascii?Q?/LadFHpteLR775V2eZQPDBunJ+vY3h/J5wvqRefqlV0PbWn3yZrR6FsmdPT9?=
 =?us-ascii?Q?JdFAJteuaP5iiHVKcbZU+QYz93RNbo8YXykcgCePdJfAfZGLrZVs9dOWDlv7?=
 =?us-ascii?Q?SrRc5Ouf5fc8/u2ljInx0fxq1ISW5bvnrTvvt6RG7q5xuJJk4hCEgskFLAJm?=
 =?us-ascii?Q?2iJ9e0GfNk+d1JGvxLPLsEn9BZPugvE+PJULoPmPLg+9diZf5pDad57V6GHT?=
 =?us-ascii?Q?8f1J5lVCnkijQCxSlXDF3Hps9+j2yVpL316N98fhFP2l85GZt+g/g0f5izLi?=
 =?us-ascii?Q?OURVNPiiQvc6P7sltO0KslHHbCvHvKvPLv9UKq/T8NZOSDSGJx0xHjTMUOma?=
 =?us-ascii?Q?yH3+VGyrjfazCLiBMHeKG0ZdMx5P49E+GVZjHaxXiuPVPNxPZdvqxfoGSd4m?=
 =?us-ascii?Q?4O5h3jnrGnJovsExB0KamKYEj90AXXP8Yvaqve/e7sXEsDtJpRgg4zq9mvh1?=
 =?us-ascii?Q?1kitV/60hVDIafTL5mH30iUsFd6EQvH4DakXdoKoWATBoWJ/lP77qV8quqB4?=
 =?us-ascii?Q?bcE34sFtitdUifEGJoxRMYob9+h8BfBHw8dcxbn61WF/YT2bSwTHA3qTjuLF?=
 =?us-ascii?Q?jH1ykY85k3W6IlvKDXs65JOl0UPUv7Yk0pP8SCwJBQ3qq3t+/56+6hU7CJGS?=
 =?us-ascii?Q?fMmx4RZ+4kGQFFyW62/Y7wKNXMHn6NYMniSxR+WQzqe0sHWGzGUzSGBNM+en?=
 =?us-ascii?Q?Pinpegxzc4bbyxlnCOl9G5Wh0Nh5v+Gt1ITVS727Uq1oyRSt0vLYorZTh0Jn?=
 =?us-ascii?Q?I4PQuqYerCVdxhbXARxejmtofPDJOPNJ4MnGRQpZ4VtsNNKZnk/Jq5Tm+VPg?=
 =?us-ascii?Q?UGmoQhSQhLpPW5dwS49ZT2BBe3tQROkK/lJ9y1preoM83momID8Zi2x09DlP?=
 =?us-ascii?Q?+wfVtccL9P8+UWB+vOUmxr4NFup8Dkd3VspwefudOS1mCusi87w8v1l4zepF?=
 =?us-ascii?Q?rSTYRIe4qjYutB9IRKQtNUBa0XsmCGzDwnidmCpkePOBA0R10vsLtSkc/XY9?=
 =?us-ascii?Q?MEzUyAZ7+fCJIU0VvvCziDk5RDODx51ZDUyXTjLj0Nz0hG100sCcJwa7bUkm?=
 =?us-ascii?Q?KReKsDEDXGOQoft5WmCGGen2BdGyjoBo9KdlhjnGKMEAFpLrpvxDcVn9Emtn?=
 =?us-ascii?Q?pBY30dPxpg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffe653e-51a1-47a6-83b2-08df05dd4bf5
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 14:53:33.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BX7dFWWIBQgo6WKF8zThpCreN5iZEgsnrL2vAEg9kW1gs7Zeehs6aNy0/jqvJbq5vgkRpyzQ02PMRU/G612lGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB7197

Once the warning budget is exhausted, hung_task_info() normally stops
printing per-task details. When panic is triggered, full details are
still printed so diagnostics remain available before panic.

To retain visibility without restoring per-task output after budget
exhaustion, emit a single aggregate summary line at the end of each
watchdog scan that detects hung tasks with an exhausted budget. This
keeps non-panic per-task reports budgeted during system-wide hangs.

Suggested-by: Petr Mladek <pmladek@suse.com>
Suggested-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/hung_task.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index a5043188456d..49d47ae475ab 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -277,7 +277,7 @@ static void hung_task_info(struct task_struct *t, unsigned long timeout,
 		debug_show_blocker(t, timeout);
 
 		if (!hung_task_warnings_budget)
-			pr_info("Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings\n");
+			pr_info("hung_task: further per-task details suppressed until warning budget is reset or panic is triggered (see sysctl kernel.hung_task_warnings)\n");
 	}
 
 	touch_nmi_watchdog();
@@ -363,6 +363,10 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
 		return;
 	}
 
+	if (!hung_task_warnings_budget && !hung_task_call_panic)
+		pr_info("hung_task: %lu hung tasks detected, warning budget exhausted\n",
+			this_round_count);
+
 	if (need_warning || hung_task_call_panic) {
 		si_mask |= SYS_INFO_LOCKS;
 
-- 
2.55.0

