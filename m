Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021132.outbound.protection.outlook.com [52.101.95.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3421950AC0D;
	Thu,  3 Sep 2026 19:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464536; cv=fail; b=u4Soki2jrQfi8EnTPSK76LEXpvzhgU7oR01DB36Pjpq+NlOzqFSkFK3VNMKZu5KTltrjdvJNG4bRHuOEt06lCTvRKNFjjFkOHLQc1cHKmxUgs7XfpXqU/2ftLuW1hLPIFH7IbfIYTW585KAIzjlKhOoaRhpZEubFM3LeUws/Rc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464536; c=relaxed/simple;
	bh=7VYF3jfXgG2hvqokeaMhz3+2gXvcUSchZjGLOl7lEGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kTYgn6t/SFfDyYbVkIKnprdIHRhzNc/w4HuWo/oKRUtqvFLNLtAAkeajHrUXKntBFXsfgBqTskH5tEXxdhsHDNzh+MOqfwJzsHXjTGqcMTFak3o048qGOVw6Yn8UMgi/RLkGkVHtQiiJvx1KOHm7qh5F7EUgUcD0iHGuFX5M+2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOYI1FwXinXYH6u/Mr6BUqS41KyzgZEGsUHmMMLxOwL6EaBcDHrrjKvfgRy7dOdAMj0K3MSYW82ncwvmFVFtFZje7lRhpIylg3d/4alZq3L+Om6vlO0m6Wibx6nP90V3QDnK2elAY7CpG0yu3XcJxVxTTzlrsW29qD1XxAR+8ByQXeF5GjNNAu1uPnQjiYNCzJGuvAY2krGCAbJYPlI3O1/Clo429nGRGUpK8/SlYk00xyqwkE5vHQwSdBYXsp3fvj5ZzE3bPls/N1l9gvBuCltbAZGulbKfAgyw2XnocE5JpSo/+eqasPIFZxC+cX/UAiaUiIMSX6KDtmG/o+W7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=DrQbTkcghw4VfLcpjls7iuxtNtjSNPh0x+LywmSgrZM=;
 b=IWSyDVvS8oSLrSKs0/rrV2Q5Vs+V3Tw3xsoziyQO4lsSY7K0+1TUgt5jVIsWVRtCbGt9SrLIVzZXjC64Hdio1KLIDdCkm/bOql38rELla24MB7f7y/JB1vV2XN4HN86+vboQKBKjz+vKp+0gFmTr39Sp2FKHxk8n/YiIFJdc/4KQsMTbmeMPwpKVIB3PS6qqQWkl5weC1zxywjtLViULfYja2scwTGtfjwaeVnUxXCSebPUV56f+irlBVgYHCVXL3vD8S//Fes8pMn6B8W4ZBT73kB3JSaWobevKAkQRp5wDo6iqoLzUQtZS4c9UbjA/Xc3fMsqPbmd3Kevl6CnfSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LNXP123MB3609.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 3 Sep 2026
 19:41:41 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:41:41 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	frederic@kernel.org,
	marco.crivellari@suse.com,
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	mproche@gmail.com,
	nick.lange@gmail.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] x86/mce/threshold: Use atomic bit operations on mce_poll_banks
Date: Thu,  3 Sep 2026 15:41:29 -0400
Message-ID: <20260903194130.186096-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903194130.186096-1-atomlin@atomlin.com>
References: <20260903194130.186096-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:208:32d::27) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LNXP123MB3609:EE_
X-MS-Office365-Filtering-Correlation-Id: 529b3fce-6d33-4142-895d-08df09f360ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|56012099006|10067099003|18002099003|22082099003|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	5jRh2qk15psbXIOpSpjkvuvjUedL86B9gEsCnHj2RoPCvB8mLrQScaPI4TlV89cCzvL264KTNnrmF3iHL/0h19hA4fkVx8nGQSgxFgf666/gf+JH98GrV+bRkEmbP06Zkxf+FpbT6D0/xflwP8XBjM6v4GAAzaZ4xTaYL8aJaNX6S1bdB4rm+hVP4AR3wNQfl29OLBzZmCCICsUHbC2QOHv3JEumAX0ao6MjaKQhjqwEHmwi5kTqRL8Cx+dFt8xl/Npf8o0j8VABl+01Bup5J71CkaNJcufnKU5dJG2ZiwiBVP3HB4MwclSojdybPQMzA15fuHmx1SrTblA/5N1tV0zIUOrHMh9OPb5YyE08UojGjL6nrxW0q7nDhJtVnGt17UqozrxIJdy6aoBr84CQA0Y8SZNKDb+0jcXt0EJYSaX4NGty+nvC3tkgsX6pYaNIcktr3RxybXPzPCls29N6jZ5ocBbPkmkAx6y4wuDWlgCZa1Tn8pcIwtKDnxZSRsnGfzhq3RtLPoBbz0NcvNb9NXGHSMLTgCWvgOB+4y0kZkYIMgYf8LSrkNuB53A/t2UgGtRW58LdAJALvIyLAI410x+Hdd9F3+J3LiV+ksPgEeGo2MXShvqRZlXwA5dycDsqDZOxXD/tYZrWKIRRCYbFe7PEOQbeLgqUv/HjfZ/LHDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(5023799004)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OZJtkkGEhNjxtAStNm1zilo71EeU8oKTx6h+Oaygdpy+5oIdK7Dtv91GPEh3?=
 =?us-ascii?Q?qC2JDp3HmLeRLIlXuWW5Pckm900IlpkQc6hcm5A9nnEGuBH2kXYtA3fykOuX?=
 =?us-ascii?Q?GuE0jjM6BQ2gd3sRIWm51WTKHZz6I2q5pfwfoFK2xwErnOq7m8Xx4hLQO2wt?=
 =?us-ascii?Q?fUsXKALx1rWlnpCVLLfvGcn3C5/NQPsS7Xc0daWQDopkuM2fIqgHncSkna4L?=
 =?us-ascii?Q?YhhIK7wlNNeXs+jlCz1da457Pz1YB8GaC3e80aeor4ld2AsUvsFZcE4P/A87?=
 =?us-ascii?Q?j084MUNt0Jjobk90v0XPH+fWLy9PZouPGZXQREvXOXeIZmuofbGux43MhV5f?=
 =?us-ascii?Q?OpL66K0QIFevei4p8VUaQDljC0wRmM8h8CgLZndcyL4FdYgR4p6Kb/1xihmp?=
 =?us-ascii?Q?+G0aA1SFn/MXtGqnEJQm4pHJ7Q1mrg6u6S3pwmRX92sJZkW0jADBLHeA8oZ9?=
 =?us-ascii?Q?Ox5GDrwwIdAOBJ3rGOhm+9HoIzPLkk/sKXAkE1BRYlizXH0L9hG9U8DXfmhK?=
 =?us-ascii?Q?r8OKKdj7X8CeQzewlHT2pEBuKz1EWveeVH8gzPf6quwwMTPhc6a1d//kJjxC?=
 =?us-ascii?Q?1unZbGsDbKTWncByV3NLLAeGNSOYWsDGVpjqXY0df8RYTfbLs0GF/m5/kv2L?=
 =?us-ascii?Q?kVz+czcyAoT/0guSwDE8Sg6csNxcC5L9FioifOLKDMCIaNErI5d8cV9NpKn3?=
 =?us-ascii?Q?JLVnA6H+HURQygTRo64Nqg3u4PNfGUt4q0aNeT4FCb1E/J8shSPHehWvAwoV?=
 =?us-ascii?Q?yt7kU6DVvnC0eNuPxCZt8oKQBj686I5JZKeaqbvRzGeGifjufNL/iOG1rrP5?=
 =?us-ascii?Q?ffljLlt5AMAayfDpGalUolQ3UO7NGqI4BMEitMlkcyOOKE7zzIGaLR3rA0Fi?=
 =?us-ascii?Q?EPFAnb0JiYrTfIvl34gkuhkcLeYCLdZPS16m4GvjQlTkiok3DP+nx+lUyKIz?=
 =?us-ascii?Q?ZpxlFDEsN+3HHo78Bhf10ox9cIFfLOgu9ZIo1Sn9+h6+FUiCd1kHRDqcW+pU?=
 =?us-ascii?Q?KqHLlCtD2zSWBduly5Py3FcDQQdSvstyvmUc2Zzn55JCbLmW4fCn2Pm59GfT?=
 =?us-ascii?Q?eab5xGN353TrpkjAMXDR8tepMXeHlPBWsX7nT3xEljv8VQ5CXoahfHqF8lKw?=
 =?us-ascii?Q?2uGDYs2JIJ+S0gHaIwbD978goaeJaIHe7oXW2bfqlXo+wObz+0UwsC5kFaLS?=
 =?us-ascii?Q?U94O5v1RT8sS3UFUgFlN5WugQ2+s1pprPAFHBu5juchPyzEDHaTbbuWDyuep?=
 =?us-ascii?Q?wFO3BAoxU6j/gReKHAH2FEl21DVak8fsCyzeCoPooMA0Ojzg+zMa1vstc5iT?=
 =?us-ascii?Q?T39LjVYMXs0P1qZSdtPqbtvI1vwiNq1uTDXRRpTtuK2MnUsdXuu0Nrh7WoC7?=
 =?us-ascii?Q?BOM3h4elSRsZfzApHOb3Q6Ox1+pjDQPd3UlOherKtB7tEpsh+MG3CSP6cuvm?=
 =?us-ascii?Q?/uDwkTISidy6GZuVim8QWu7f7X81w9VE59MQdayosCOFwFASnYuRq5tefGYx?=
 =?us-ascii?Q?wpUtGiHA8k0RsIbjv8iVfWugaIdI10x0U6uj/82ebwgxCJoYVE5aFAxmMCtJ?=
 =?us-ascii?Q?cgRBsorW465Bm68/e+V64Nn3YZ3Wl0xPH9I0cL4am0tc/filePgB1l/4pHFC?=
 =?us-ascii?Q?aEtYDE2XvTGcHHXkmEX1bbnr7sfxOxz8lzE2c4igzuNxXdi8LdX+I8hyRUpx?=
 =?us-ascii?Q?0xljBo170ou1uoUsLDRf8vkjznQTkgw0vBVfz4VzDCkDUaOi2sSCEPXgP97f?=
 =?us-ascii?Q?4t7Y7F61Lw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529b3fce-6d33-4142-895d-08df09f360ce
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:41:41.6830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1O7UtoOWy1PzOLgf3snar0PC5aXtd7MAkIywJXHG5I82Nwhr5gTNYvLX1KmgJD5+W3YPKvEBeg/UHjLFU05sUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP123MB3609

cmci_storm_begin() and cmci_storm_end() modify the per-CPU bitmap
mce_poll_banks using non-atomic __set_bit() and __clear_bit().

While mce_poll_banks is a per-CPU variable, cmci_storm_end() runs in timer
softirq context with local hardirqs enabled, whereas cmci_storm_begin()
can be invoked from CMCI hardirq context (via intel_threshold_interrupt()).

If a CMCI hardirq fires while a timer softirq is midway through a
non-atomic read-modify-write operation on mce_poll_banks, the hardirq's
bit update will be overwritten and lost when the softirq resumes.

If a bank entering storm mode loses its bit in mce_poll_banks, it will
neither generate interrupts (as its hardware threshold is bumped to
CMCI_STORM_THRESHOLD) nor be polled by mce_timer_fn(). Consequently, the
bank remains unpolled and its error telemetry is permanently lost until
the next reboot.

Fix this by switching to atomic set_bit() and clear_bit() operations in
cmci_storm_begin() and cmci_storm_end().

Fixes: 7eae17c4add5 ("x86/mce: Add per-bank CMCI storm mitigation")
Cc: stable@vger.kernel.org
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 arch/x86/kernel/cpu/mce/threshold.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
index 6c370d5af5bd..af8346f06318 100644
--- a/arch/x86/kernel/cpu/mce/threshold.c
+++ b/arch/x86/kernel/cpu/mce/threshold.c
@@ -86,7 +86,7 @@ void cmci_storm_begin(unsigned int bank)
 {
 	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
 
-	__set_bit(bank, this_cpu_ptr(mce_poll_banks));
+	set_bit(bank, this_cpu_ptr(mce_poll_banks));
 	storm->banks[bank].in_storm_mode = true;
 
 	/*
@@ -102,7 +102,7 @@ void cmci_storm_end(unsigned int bank)
 	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
 
 	if (!mce_flags.amd_threshold)
-		__clear_bit(bank, this_cpu_ptr(mce_poll_banks));
+		clear_bit(bank, this_cpu_ptr(mce_poll_banks));
 	storm->banks[bank].history = 0;
 	storm->banks[bank].in_storm_mode = false;
 
-- 
2.55.0

