Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020120.outbound.protection.outlook.com [52.101.196.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC5859C97E;
	Fri, 11 Sep 2026 20:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157563; cv=fail; b=iwZYYLPbSjJ7Ojl4XKcHQu38o4AtMbd0FlhnvarCg+a2GQLqawESknuUGWXQskv2WluWjCOcQnCm5iugKUm6mb1RF5n6Gz+qhj7IQrNezibxJ2d2e/fAEQI+B/6ltuhsgQuNvJuDmIFEgQzvzkcbNhMY8qvHx3pgblgwKCZ3v1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157563; c=relaxed/simple;
	bh=iWCP7KZc9SPZ1Yyp38nsgG056IgNWJN4NGPlklVEg5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VlX0ImlGarxfq+JCIUrEkRWp0mAxzcUKQGpLJqcoFf56OheA6ZyT+cdBDloVqXScOH1DIjtchcLfRk3piz+v+4XVBVkN58/9zUB8w33Ebl35vpwGRDg7X2BL/BgCTpOyeS8TdbK/yISeitReFdIpNTE49BlqC+PYQh7U5kygjPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.196.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJ18xZJSSa/Cj+2g0QgnsSE4EqB3C3izKBaf914rj8Vsuso+gTED9sbHAptDvz1BPsIz3Gr24qgfKOku/9QnDmCvg3lZJ9O/EcGhJJ4pVp8gKGX+faXe1GsFkGoxLEHC00otee5vPHnMQZGtkR8XmGz3LJ8BQCm6IiK1K0UZUyxaMgE00KFGTJpvpWMTpHk8sdDM/eLnSJ7oHNh+qNpKC5Mz4xJbbLWJe5PIRbNF928FwK52oimKfSRUAg4FodbnrNBA5ogvelnfC0s8fKoeauPUhFTYDJp4+Ha2Uss4TW9TSET7dg1hnNPQRJEdK6UnzA0Xy1fNIEKpvld5EUEjbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=/YFJhaaH7Ry9L7GFNz6RAO6isQkfNGeM2mxhZFDYWRE=;
 b=F5Kd6zuTIzBaInUYhQki7n94OjwaGZ19D02UCJa94atHhJZTYjajwlcQXY2cBHl4HdwjuNZ5lyx0utQnkNUc1kuIxE5Q9kPbtZmvqUSwin489ZJCTSgIOZ1igRg7iGwhL8LMjTNEZU59jLbfxvZVHRoWXosFS6TN2bsJYuXRmu8TXFXI0DuduNj64RmPt+LsLfsbIpkseuzdsgTKWSy1lBPEQTAJubj4NGwaHAaXjs6Vi8lwORJiYQwOnQQ28e/44G+/E6LniaJsxSTIgV8Gk8cPpSE3iKoBO1ntgS5OOr+H6PD4Mx6BES3sBVWY1O98kUDYmAo1Zn/LOpUfQ7BE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWXP123MB3207.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 20:12:22 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 20:12:21 +0000
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
Subject: [PATCH v6 3/4] x86/mce/intel: Clear mce_poll_banks for firmware-first banks on hotplugged CPUs
Date: Fri, 11 Sep 2026 16:12:05 -0400
Message-ID: <20260911201206.532113-4-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911201206.532113-1-atomlin@atomlin.com>
References: <20260911201206.532113-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0590.namprd03.prod.outlook.com
 (2603:10b6:408:10d::25) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWXP123MB3207:EE_
X-MS-Office365-Filtering-Correlation-Id: be2dba92-ac7a-4829-24d7-08df1040fcea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|6133799003|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TaiEDoTeylcKPEM+3xnPknBEhDW8ull7ql00cuXnQY9Zc5kru7+OLnVtgu9U/UG7SqXOUHWLtZ4HCJUugiR341Q3rUg/vhv1ZTXCTbRU0pFAVru06dYXyPbCvG+sr+Nm5clj4Hm1n/hIC89PvYTQlnZbQjwmHd1wHIkky1hAGzfThhn6w9C/1cmLerVyqNbkHIAGLW0crpsyp6zfjacMJj9NdDGoWjKwGzK8/Qtgn2UVS7H2aZ+c4lUgzVm2FN0NcRXjK75VkW66DjPFlTN4UfXm+Bgw81pncR1qS/D0ykG38ljbxb/JkXdiVUmtvZYKPOJcKuKp/Fdf+3Yt/hZvJSeZdscaXZyaC9oFqxMz58BrWHSGOF4wSc2Z/VL9dapvnPbbti7q2rgk+kOOLnXNOHKZ9NKDEyeP6ZVpDjrjxeSMfWIYpAV6N8CICHfG3eQCQOTm/fDBrpEel+HtCNxRBYFCryu121RR2bHZ7ObIWTjbuRUyUYRcSMcF+GOi5r0SNABjh9iOxIImSuvNSngAdL5Ce7S/fxRZ3OmWqgnV/T/t/qt/SE23s/MfnGvgCq+3oqx8iKdUZ2bZFuN55ZSIx+YWGWlSDgq7ZrzjI9o/Z9K4AGSRa5+8Y6GIKNkmTfAWm6gC/PuXXwvH80th/7umXChZ6zIz6+3AWck1Iwq+Kk8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DLFW0XCax0paf5Ox/lyoJyLpGVBDcz+4HTd5IP3h0N4O4iO+MAIDaYc18RTd?=
 =?us-ascii?Q?uyd0L3InOiXuJd0qVJ0L3cb3KNUFFjWlwmRmbyCsN8N1pJCLqb51A4nnsSOX?=
 =?us-ascii?Q?GA7bAFDM6AVZmt8vawJfNSIkf/+gfg3tUAwUdZf+0ERoTn2xUvJ3oRhUslz3?=
 =?us-ascii?Q?lp/mCa8Cypv5N1zub3GRvxgTPK4q9iXvBen1ZZKpYs3Kr5qBlbpweVN5zl8+?=
 =?us-ascii?Q?dBaPQRRMCzHrvsh4ObRRIWeilMXENMKFMS28E4hZDpiCtLJ0kM6rPBL+awMr?=
 =?us-ascii?Q?yshpwhpbBSJWcoi5Vs9CJCOV/ptEUaMepZNbzk6P6EakmwMGxNQ4zCav6Pdg?=
 =?us-ascii?Q?Jyf3suW/TGygB2oxWW8IQLUuFig7pa+V07yX1uU0OweZJjMwBe1Tfdbj0qNX?=
 =?us-ascii?Q?TvxLr4+yt4eGu7PKtZXFpf5eWkfcpNW2Z2bCpSHrQcBtpYBzeX1oGySeJ2zg?=
 =?us-ascii?Q?2ALlxLaMpfdVVnLsALU6r+rx9EbCHnxNQBjyeq3ZrSlmlkhxrZkgO04z5WvA?=
 =?us-ascii?Q?BL518b3V66oiljhIrps4lwv0gbWNUhzb/dT5lEy9Kyh4IuSv4Rdn0FJirYhg?=
 =?us-ascii?Q?sw+H2lm0WreMm0FusaAt2grnUop5hun6fQLbHzMbw/CzWWnNgkaGf0TYG5Kc?=
 =?us-ascii?Q?PeUTxDnAxVAC/iXzF6loJYYPq7UnSmov+UfewUc9WH8Ae2zdjfbN7Tvrrl1h?=
 =?us-ascii?Q?yjmPZ1zfQxmJhvHl5t/URPdAmj1r5Ym602j0EnQcrvUmJFPQOzCH1Igvjctb?=
 =?us-ascii?Q?6GHcHDCCdmDjHMKcmfXU1KAI/H7ACRz0RZIiu8tONk05RAku5+wyuL1lcyry?=
 =?us-ascii?Q?PqOmeg51uwgUbYK6/ohI13O+/cXqsOg/L933yGyjtF41nRJq1QE5v5sqLSSR?=
 =?us-ascii?Q?kjukPL1R7OwB6oLIJ5NS7NSTw7xoDFhLblbL4vfSMAqRMs0ZXdC3HiNAgjWZ?=
 =?us-ascii?Q?iGe/S35zVFcb3snysvl4QjbR/UkdnUNPNwjiesJpQwhC/dQ5s2k1DQ1RI9aA?=
 =?us-ascii?Q?scjxto3TKkDBhrLYEbjDmMwsKeHcQtMX3t5GYH88vw337ZUonQv8MUakSNHd?=
 =?us-ascii?Q?3BU81bjbULDWseNUBsusncckluorvXTCfDdb3Gr/uonnH88BTIHDlGQm7+T6?=
 =?us-ascii?Q?XbEmvF8gtUVmRLqqRTivGq4n11JGdzAnacXs7cU2qEaVVIiFHyIlojYL3jCs?=
 =?us-ascii?Q?bq1cFm/3SlbLbeVvz31HCEPY/NfMyVJ+Q9Zjs3HUdEaURz4WkkMiua7J9U+y?=
 =?us-ascii?Q?QpYZNduRaSDDzc1iUW2wdSehfGd0n/dEygH3CYIk5uyB+0myARFk7jj5nTmw?=
 =?us-ascii?Q?snDfPse4CpQFgwu4YxSX/7RXIGnZ4pGD/l0+LVuh+h0EhhXDIN2VxlolPJWL?=
 =?us-ascii?Q?OkLdd3Zl3wP8pfS9BxnULzIDCo8mFcl/PZcuFr41o7ceVq5pxesbAVq1ZTl0?=
 =?us-ascii?Q?oeTxjIqJ64d0vij+uSBUTITEoH0npIZxJbyE3hpHjfRGPNXjdIUNtsprOCAW?=
 =?us-ascii?Q?17IkqDd54zZbMm8rDivKsDRJQLsgLptUwCXMuQpcmReZ5aixmpQU7lyjVeLM?=
 =?us-ascii?Q?hfpfFHwBgRVVmGpKlKoxFs96XwwM5NIbK8r8QeYMLEWgt4oji7VjE+BScgSM?=
 =?us-ascii?Q?ZvMC/N4Zg8ydhRcesG1CBrbRuT4pEQbj9Fww1lJk4M7WglPjwPzx49r1GOCa?=
 =?us-ascii?Q?FB5oC5dgogkL6z7nA2hyXv6NofOf6yw91s4M2DoI/Kyh57aUaVz9GOgA+K6W?=
 =?us-ascii?Q?6ld+THIjKA=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be2dba92-ac7a-4829-24d7-08df1040fcea
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 20:12:21.8739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOGd+bqznPrUJmSpLgk7YEymX8qjSTfqqlx++XzCjqYetKYnm3nAx+J+9QpF+AYPuOd7nQQlOgFuIm/mG1R6gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3207

During early boot, acpi_hest_init() parses APEI HEST CMC structures and
calls mce_disable_bank() for banks designated as Firmware First.
mce_disable_bank() broadcasts via on_each_cpu() to clear the bank from
the per-CPU mce_poll_banks bitmap on all currently online CPUs.

However, CPUs that are brought online late or physically hotplugged
after boot miss this broadcast. Because per-CPU mce_poll_banks is
statically initialised to ~0UL, hotplugged CPUs retain the set bit for
the Firmware First bank.

When such a CPU comes online, cmci_discover() invokes cmci_skip_bank(),
which checks mce_banks_ce_disabled and skips CMCI setup for the bank.
However, cmci_skip_bank() returns early without clearing the bank's bit
from mce_poll_banks.

Consequently, machine_check_poll() on hotplugged CPUs periodically polls
the Firmware First bank, reading and clearing IA32_MCi_STATUS. This
steals hardware error telemetry from the firmware, breaking Firmware
First error handling. In addition, leaving the bit set defeats software
optimisations that check whether mce_poll_banks is empty.

Fix this by clearing the bank's bit from mce_poll_banks in
cmci_skip_bank() when the bank is configured for Firmware First mode.

Fixes: c3d1fb567a63 ("mce: acpi/apei: Honour Firmware First for MCA banks listed in APEI HEST CMC")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 arch/x86/kernel/cpu/mce/intel.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/intel.c b/arch/x86/kernel/cpu/mce/intel.c
index 4655223ba560..7be5713aa190 100644
--- a/arch/x86/kernel/cpu/mce/intel.c
+++ b/arch/x86/kernel/cpu/mce/intel.c
@@ -181,15 +181,17 @@ static bool cmci_skip_bank(int bank, u64 *val)
 		return true;
 
 	/* Skip banks in firmware first mode */
-	if (test_bit(bank, mce_banks_ce_disabled))
+	if (test_bit(bank, mce_banks_ce_disabled)) {
+		clear_bit(bank, this_cpu_ptr(mce_poll_banks));
 		return true;
+	}
 
 	rdmsrq(MSR_IA32_MCx_CTL2(bank), *val);
 
 	/* Already owned by someone else? */
 	if (*val & MCI_CTL2_CMCI_EN) {
 		clear_bit(bank, owned);
-		__clear_bit(bank, this_cpu_ptr(mce_poll_banks));
+		clear_bit(bank, this_cpu_ptr(mce_poll_banks));
 		return true;
 	}
 
-- 
2.55.0

