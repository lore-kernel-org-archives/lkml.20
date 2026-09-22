Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010042.outbound.protection.outlook.com [52.101.69.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E55379C5D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.42
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062220; cv=fail; b=QwFzI0yVf1iQ4gpvFLBgUI6gSSh6S5uuUCWZM4X0uEAzN1PHzOjXl/8NHnj2lt0VP0wcUJ+ffZcDXxQWSD7g7+6nASOMX++4ZPzbHxj5Uwu1PIYpcKTLxOEKOZQU5LtEHAKnYw8YeeuGXdVQzRAk2FTio2b987fUjINnJ5iVdwc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062220; c=relaxed/simple;
	bh=xinSu8wbQZTy26QZsTeVCLS7aL1tEsYVX3EBEAjd7m0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FD4BG94//B5gCqxQTEqsR5V1bqL2scgasv1/OGk8hz7D/jiTqrAM8oOwvoPkHMVYhWxRSIhOlvO6/TAAGT0Su1eNcH1evEuPMkAy3M7uc3X78w6UJTqW4b/qq4y7YbLZfUpYpttyAyupgxxBHKSrdD+ZG9XSL3MbkDJLQfC8hPE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YrfsNVLs; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YrfsNVLs; arc=fail smtp.client-ip=52.101.69.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YrfsNVLs";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YrfsNVLs"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UIiRIM6FfV5oGcJT4Omlwh5ifnL+qk03/2I2bpSpPmXTZYEreslyf0987GUNWG2DPMbdL0K3XDDC2Bz3EHOpHLJVVb/yJZOqfY/9cO40LT/OGT/i1jObE82+9LgjROE9WySxCuXzQASNu+a3eQJgjO0pWvYMMnOYDum2nho2i1sDOOwUAHjIK+WK2mI0B1F3CrbB2enSun6RWa2KKsoV/60ycbtVkQWgjWpvJXJPJZFsiiaHdY0f2ZprSsNEulySN+FcalPxZSwOFs1ryArlNrTVVkd1PB3H3n3ZG36zHyfh2CAvly1vsaYwRrZUkRRMykifJGiZc6AMyg9CngquVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNyarJcZ42+utvO6gJ4uHRilxhWNVrrlA3d1MhlXl90=;
 b=QHAVhvmft2NHHuvUgDpdAaABENLkrM1K/wgmfJwGqikzLdMBZKggorNAxlLy1+kyNfBIH3C94eDBSDYD2vTaL1O7drfaHJCNa2zjtYTuOVVfZWAMdb+IVe/AFO9jync8/ARdLCsszLWqEyAGaeBJf35a8GpP4DeuGtLVzVN+XMX/6G8+8wKMq6l8B0ZktE4Wlu1IobNTET5sVoje0Mr5zxoD+wxdfaGquahu+WFBgWDEM/7hSvbIBiS7PwT39Tcow2XMNQusEkZLJTXElYujaTLQH1I2bqSBAIOGrS80LD44QQMGiOF2PLDtItLaJz8IuqIUeIIccy2kCv2D6JISvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=hisilicon.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNyarJcZ42+utvO6gJ4uHRilxhWNVrrlA3d1MhlXl90=;
 b=YrfsNVLsHGe4E73FWlKfmwFLqW81z0/qOeVfwKHP63RxrazUmEjBiVsExIGoo0x2ENlQ5x7Cj/lRMf+JvgBXAGbpnyRnp2LqWpwzQBgx6qDGvdVtYTfYMvye+vo5RSTDOEX7ePjPIqzyR8wmhnzMl7ZnssNtFPkRvHYL5MF6mk8=
Received: from PAZP264CA0094.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fb::20)
 by AS8PR08MB7305.eurprd08.prod.outlook.com (2603:10a6:20b:440::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Tue, 22 Sep
 2026 07:30:11 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
 (2603:10a6:102:1fb:cafe::6d) by PAZP264CA0094.outlook.office365.com
 (2603:10a6:102:1fb::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 07:30:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Tue, 22 Sep 2026 07:30:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akKzewGFJKA1mYJwqh8DrTc5lNDLeSRFGR9gkiVWjs6udCB5BRF9htqziYaMgV3EUEaK+1UVHvgkvyOuLxuWnsoJLo74wYTz/Nwe9yxLxWAv/3M8GzABM1dIUuvKytF9FWGzWxxVddQuLaZ1joixPWI/m1U8UPl/7/Sz+BN4K4aWNsTEYh6Oc0XDzec1ZItklEfjwRXeATbiBQe2mQiWCtEGe4wDxv4dtu/g/K/lK2RaEKjEVEJNoD2JkUVr0yxnURyIkcTvFOPmjVF0+ytVSONYnTvN8dXnku7KwZfp+Waio8IUGxlqNoiRKnIygAcFXUaofEo84FSWYOpsQH5F+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNyarJcZ42+utvO6gJ4uHRilxhWNVrrlA3d1MhlXl90=;
 b=sSJTRo/7fHCQjHU/nh11duqvdj/2M503m0QBz+sn5bavGM2zEv5oRX59WlY3fwNgbdLHSCHjG/jGRa52aM1TvXubVMVFvlwWF6Gz2lo7s/ch+pau3eZ13Kg8oIky5XDFxH4A6i/cR60ScWnjB1KWE9uwrb8RWswNo3dZZGAtJdlLcXcHkt6J4G9T2X/HW1BlNttfYqAVW5/iB7HXtRDRP1lFNSEmTxjVuO2nT0v6asN+nWciyIqJjwYSYKSvLoAGsJQDTMUIKLzwcxQtLIDnqcpt/dvzamvqhjQFnbpTIogt+eF74POx6XW59pYF3kDZxbIwnUZnWk8HnuHrcuAJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNyarJcZ42+utvO6gJ4uHRilxhWNVrrlA3d1MhlXl90=;
 b=YrfsNVLsHGe4E73FWlKfmwFLqW81z0/qOeVfwKHP63RxrazUmEjBiVsExIGoo0x2ENlQ5x7Cj/lRMf+JvgBXAGbpnyRnp2LqWpwzQBgx6qDGvdVtYTfYMvye+vo5RSTDOEX7ePjPIqzyR8wmhnzMl7ZnssNtFPkRvHYL5MF6mk8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by DB9PR08MB8676.eurprd08.prod.outlook.com
 (2603:10a6:10:3d0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 07:29:35 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04%5]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 07:29:35 +0000
From: Bence Csokas <bence.csokas@arm.com>
Date: Tue, 22 Sep 2026 09:29:31 +0200
Subject: [PATCH RFC] cache: Make cpu_cache_invalidate_memregion() error out
 if there are no handlers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-cci_enxio-v1-1-00bade212729@arm.com>
References: <20260922-cci_enxio-v1-0-00bade212729@arm.com>
In-Reply-To: <20260922-cci_enxio-v1-0-00bade212729@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-kernel@vger.kernel.org, Bence Csokas <bence.csokas@arm.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: LO4P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::11) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10455:EE_|DB9PR08MB8676:EE_|ZR1PEPF0000E6AD:EE_|AS8PR08MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a01941e-04fc-444e-db74-08df187b541e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 BJFSTD7eCiS0MYUvL44ilxrjxWADYBlKw/A+5ChZLH311B7IJX/W5P6Cj+q+5eJBaWvPNLf/bFyRjwy1Dwe32neyqOGeDZLTGeOscrFt9GjjUpi18CfbdAyQrQc160rJdrjQNJSRgSdnpxCC4dxVTZJhABbaDlZ3coeE1PINKHIAtgYOK4rO07eb7+HkQwP5uD0hbromd6Lo1uUYDAR3Hc1TTGYgKXThYxu+jIdfwktg/8U8C1NmlEWEoq7iGuvaB3lbbL/C0H3GpKwZf5tjV7wIp+jpqo3Nu8IBeQXcnsc+h8pkonCKM6ZTdXetfKkSIhM1Y4pcpULy9X3R/8Rs8mqsuVio9LrEkfbZu62VBdXVCTNo85mDLfSDH7dWglFBVZUchanFS0MnpqzxYzgeN06WhQ0bIqomNcWDKRKHxSMLcTm0LQbBmlJ1MbJZHK/eMm97ACSA4bu1PnAy2WqVXzPNOWi2uV+GwDxGpQCfEIUaUJQeoJpC5KW+/QTZ/df5glapfzdcD7i0VVmj+3O7EtziRwlw55EGrFGQrqZGeShMGEKyhS6cWireYD43Pqm6GY66hV595kpW2cKK8lh6QirlI828EKukcyNfn3PtvyFomhByYVZ5nGq2OupUqkeQWu0PoITShRT3R5WfE9NidZ3lInYZFW+25WtZyVhVuHM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 riBwJblPZLK2ya9/nNZW4CMfR6qPGSU3oRartYs2SnSn13m3wWAijHiH313AzAgV1xk0mz1ZfNeIcetUUzlRnZM363GgpgYJ6aOwybKEsOq6KMh2euaaBchy/MgkrNgITwlpUpSasCgXHWINbATQ/CGds1GxtibnXJQB5UVYGzR0yaCFgXHTDVxgtopBYD1J6B3UU/lkyO124rCKF8yRiv6g6ThetBNnC4xFsrOEtkodjIAEUtdOoxim8auFVXQew8ijSCE92bJW33mrzHHZM1Pe+DmMouBc8qZFKoCcFRZf++c+NHg4PPVHmcD401A2S3l+SCDFja8V+W4B1tYjOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8676
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23016584-19ec-4644-3d32-08df187b3fec
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|35042699022|14060799003|36860700016|82310400026|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HXyKclhFs/eeammdQG7mjYVS8jryBILZKqdMcZ2mvayniik5E/rTxpo6YUuv9s41Z3GTkoZSwlLyoE2xJ6FIbIOmGYLiEEcPDcRWzpKYsPHcep4sxkdTEJaq/0+o9Mf+MsZN2Fm3HGjqcI5BAs/EyA6lbc70DYOgv/oMmEtIHIiaeMjZeVNjW6TRzQEfj7Jfd/JgKYFC9o/k9Ymt0b65N9PzTK2AtuwKJ1YLU+YKoWf1pl4OfBdywymC+pgPGnq1+ux2HMgZqbXn8U1DR/qucBoDKrufFnLHgEmvc4OJKy+AVyaVKKq1Oo3cbfbim6GIIIFx5yFYBoNKYwlK0uyWnevJCwJ7FGEO/scewnmMiTNj7JOcZiyFa6UMKuPEIFC/q5egi8U5xDL3Bg/YS5iTTzyPq4/sfyLBzGQyNCxaEsS+9TOMMKVC5M3ezXUex1FdeGsKQHCmG8WvVVYF5rMmSLnFldmK+stNVcHcT3Fbggx1pb0VLmUSY49SAW6Q8eOzCv3NtuYeEF3Ob4H3vuCt9DBkoov3KxUiayeLHFn5Ascgx84wsfn/2OcBW34basSBAv6KVC9Um+elLD7nhBCUvPwBBDcLVBm9HpKcqcddQiL2OPex3S7NXF+plILUZYRHm8lGzpMTtbBUZ5nyxZr7kurpR/vXFm7uk5WnVeC3rDdH7v1ZjSvmruncwfSO0vZS++q6VsuEJEdVaGkXS2cOHA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(35042699022)(14060799003)(36860700016)(82310400026)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m3N24/7b1fjpZfrl6BHEfoQe+HPFOxsjMEWyeGlyJ8V4wS/YcUwkgZnXH98zi5hJKVA2xmgyU3U4Q189sScDsBomG6LL4phqfFh2GwPQeDp3jvtjLSAJft2KdM8IRW3WmOrdlrBoxngKDHsvVs5Zb8CKKcN6SGQ0tR1l20ZCKmFbu/a4ma/B580tlBJlCTuiam9I9eIfcC18GUuyQYYiu1uFmieOyCzYBl+ctpZhmuZM+S9e2YrWDZ1cZMZjjymNmSEqjYNSYZYqc1khQNd9NYKKAbCc2Ws3mNNuMFT3/ygTTkVPSXXjbM08SRnCYtA4969/PzTygVEs1AVZXk+yJfy4uLTheJs11tyfOKZvGeVX+uwmUGR8aV7sXe+rT82stNszc4YoXfTpRqBBip2Jienq0HiJLd+IUtGtPRZ1VgIzUjWUvzBWOj1UHWWa/SPd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 07:30:07.9780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a01941e-04fc-444e-db74-08df187b541e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7305

Currently, if there are no registered handlers,
cpu_cache_invalidate_memregion() returns 0. Callers are expected to check
cpu_cache_has_invalidate_memregion() and return -ENXIO themselves, instead
of calling this function. If a caller forgets to do this, they may
erroneously think the operation succeeded. This is in contrast to x86,
where cpu_cache_invalidate_memregion() itself checks if the operation is
supported, and returns -ENXIO if it is not.

Signed-off-by: Bence Csokas <bence.csokas@arm.com>
---
 lib/cache_maint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/cache_maint.c b/lib/cache_maint.c
index 9256a9ffc34c..132d2816d6b1 100644
--- a/lib/cache_maint.c
+++ b/lib/cache_maint.c
@@ -59,12 +59,12 @@ static int cache_inval_done_one(struct cache_coherency_ops_inst *cci)
 
 static int cache_invalidate_memregion(phys_addr_t addr, size_t size)
 {
-	int ret;
 	struct cache_coherency_ops_inst *cci;
 	struct cc_inval_params params = {
 		.addr = addr,
 		.size = size,
 	};
+	int ret = -ENXIO;
 
 	guard(rwsem_read)(&cache_ops_instance_list_lock);
 	list_for_each_entry(cci, &cache_ops_instance_list, node) {
@@ -78,7 +78,7 @@ static int cache_invalidate_memregion(phys_addr_t addr, size_t size)
 			return ret;
 	}
 
-	return 0;
+	return ret;
 }
 
 struct cache_coherency_ops_inst *

-- 
2.55.0

