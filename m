Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43FA3BF684
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769830; cv=fail; b=molZe5WY6B5y/8TepWwfaawAeiPdM0ekzUkwwUGd/tTCsLMtsoSwpOMJ6sww7ilitwIAQwPqAzmUx4c3IdARUHmdFQBXZ8nOmmEm1e8zPJuc3lgEvIMmabQCzgDQsclERz/skGrPmf0HfzO5lAvbyzNU7FC0vM8EQ/wPKOARC9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769830; c=relaxed/simple;
	bh=hu8sjLr/4XNxo7hwvPEI8Rmo7yyr1fPmEtuatRQxOps=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p2WAx+4z5Z6kI9yTi9Ui0Ww5MzviUcLESS6QdHDr0UL9PylohyvaKNkEPlgoY1jvK5Me3aysO5pMKOfBU6wSRwNokOOt/nrZKD0E8JUyGNMFkVspk7n86pcdNhNxCQGIeJ5q2ITbZJMlX4gh09QbtL8i5ctwNnMEFeVhGmDdvWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Skj6x1Mu; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Skj6x1Mu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMYthwF7zxqCNzyertKn2kh7qzUtG9IbKvZ6C7mLHAQq6GGWW6okzWVvuqthnd8p8o9dJbJn96EqQxV9oszvUq5Xc6TEc4A+Iz0Qx21iu/77skuve0kF2ATVNz1s5IWRpy5+vb2sjKUsTSj9fMBI3RBadIfOhMvv/l15Fk1HVi6rez3wT/htCQzlneZNi3Mj3Q++FlnG7F2nWFrCAmvsm2YTSYspfCln8jY27yBXIMn74aqglXq12z/XWBChc+0cYFSln46UdNfAQyacWjMxs/NZk2rZu5hqibaDhCQUx6Gud3Wmltlw7uaOv6qMFgBy3I1Dp8peAKgFfYfHlnLUJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5Wu3rZQTtUhRTj+hasSa2p6LbV/GyAsgRUfthcL82g=;
 b=C5N4/osFq9PBsflleyoLjuF7Mt8IDk/yBUO2bKhaY4xLXAS0RV7nva9KrJGNAeZ0eFPZDV9jTWluHloFwwXmYUirbyW5KFy66eDwbocZ/jrtYrXrx5piN7tbUWx8RWHXGtr1waeC8bX0XO6OY1Lt1718eQCxBaTj7dPdyk1kArvHJVOCZ1Wl6YRPQ/IF8Fsy3eiUgvzI1+Ikig56QzmRgsgRRaZN5RdSStjqJJHKfeSHNFWihoXXG/1f+UeWJMaT4ME4VbarrsQwi42qUqQLN/FG0IWyD/gOlERYdNGYib0w5acR8Lajat1EQIhissJkZU/FxXTWo6Bl/nBCpyD/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5Wu3rZQTtUhRTj+hasSa2p6LbV/GyAsgRUfthcL82g=;
 b=Skj6x1MuzVcu8A1TjZlJmz5ulQmzSswEqTyuMRyJSnxMeKD54d3ODfO28gpCYyzFqGNjFUlFUzCGsQ8NVJuHuPRYCa9B+EslW+Xumg+sHcfojvl7BwviDBbElEq1frgFjKVQCRPu/hzkO+n3shG2RbrbZhy7YMfkrGfGLJ8ZIJCN1o+qntthOyfOJ6wX3dsqsydDLuv6DIHdrbWQocLxOHjSz0khk3X00UFtTvUZ15PYPGC5nzUKGLyWHN2J47KrZqVNAbsHn55GaliJ0D1l3z7HTS0hGY+f/Z6ggQ9maZjpMS+MYUx34Q+IUwgUxeRqxEpUwexkZTrGjfrC/WfQqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ0PR03MB5680.namprd03.prod.outlook.com (2603:10b6:a03:2da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 08:30:25 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:30:24 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: maz@kernel.org,
	tglx@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v5] irqchip/gic-v3: Add Altera SoCFPGA Agilex5 GIC600 DMA32 erratum workaround
Date: Mon,  7 Sep 2026 16:22:59 +0800
Message-ID: <fc927e43892b86200e157fa303b0d1dd344caffd.1788751033.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ0PR03MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: ca10efb8-9b6d-4789-1bc8-08df0cba4351
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|55112099003|18002099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	K9DFC/Wl/uhMDDOR/y62ZNyeSXRPD/q9i1WeSM9JvtFqiF5qmGQGGfH6OH5mVkfsERRQ+XLVKtLAdYisiZuUSGXIN3TbQ2Dc/ZmRdnMMjpYS3bhvsxxim4thmLMh3ZE9O5GLS9dla5GI/o2DF1CG6F6c1u0PBewJmFwNYaUtFrWkK/reMOFsEPByWHl250ojfzHGtuDJ0HCbs+whi1v5JVCp/tfnUoGvoXnjsSvLeaC9DreYQ4XX8uoJZxLeIePqZn3Hnif7gYHDE70+0QrJYEwdaaD5xIbdMkE9smFadSpop4Kypgw7/fPeUa3T8LspDziR2EM4O2cSfn7q1ze6Ml/V92ClhGGIfwObR7Q3bSTTuSdRLUWbkAY2b9g1yH/L70GZ5LBkc2U2tWnYCjWloIUjgxGZ3LwHlBzz/7q609AEt1h3UAUBIq2YDhjEYuPxRYnY7J/F66m4VGMLzhrLlVQfH4+/mKQaUievrbNATwoiKh4AiehYNKO+W0UqF3sU5cEXiQbmBk2NiL+OolN1qfdlx4LF+Sot9sPBCZelp5UPPa43OOcmsKNu4eTEHst9oO3NtJzxVLt2Lope0HqPVtE3mT1CQp6+IHv5VmgqCg5janxNoF70zFDkuy7E43kQJsDY5bJZ97uzCqRtxML1TmXi50FgWFCrSksrL+mdZ9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(55112099003)(18002099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WbuI8LvXLhRVNU5KnVvG3rfvHqc23gjdfkLWsNCYDkdczdI/41aiCWfhktk/?=
 =?us-ascii?Q?G+C0E8egIBBiY92J3WacHuwp6wQTdcIIdC54es1B5wkzvhQe2/L0m80/9b41?=
 =?us-ascii?Q?ed0caQ471IXYTGm2Fsg+DLKZsmefXwUGt9ywpAlO0rIIsUtT9lnpZmO/jfJh?=
 =?us-ascii?Q?XH5DDvzrHaTcY5TQqjViNtafYakEEUsnLyIUvQDDPCjW6qd0+/HcijRPj6pd?=
 =?us-ascii?Q?plF4HvWP4K60HPRs1i+sn4D3xqZzyeujGll22ERRmn2g50xm7FIIGAFZivsb?=
 =?us-ascii?Q?xxL2iZwYNB6iuZV1SGyv0T4sesYzXomv7/Lxac8nS150ITEF/M6Vwxk32G74?=
 =?us-ascii?Q?hG/rjxjit0bcQpHaV6VUg+yzxy2xMk4UtDxMES0aQ5ApBPWFlkNdDhLhI/QC?=
 =?us-ascii?Q?723dV2qQ1jBAjz//i+lSpOEBqCbTOmK9oIOSCtGYCgeK/uyEtllKtACsdHA/?=
 =?us-ascii?Q?N2OrEP01PJnj4HpOsJq8hI1Wff7TBkq/K05eNJUjhTtdPGanfPKeQ4glYb2e?=
 =?us-ascii?Q?lWPyHjbl4Mjt2un/EjPkcVMigrdfQbkspAWj0KK0y4Xk/r9LC2NHyNl48pt5?=
 =?us-ascii?Q?Ox3/Cm3aSvR2ekC+GksazuFJUh2bxq185MdmpjB/7jRcCe9MQD20LacvewdM?=
 =?us-ascii?Q?Kj2aKyKSYfttuWy3lhJi3Lg7FJHtjLmzBsfvugXTwXMp5Ir7E74H026TNu25?=
 =?us-ascii?Q?WNC5SPQ+CWGY9f4o1KL50UaF+MUF12kHC4PCcdT4gQES8uBY3wsxFCp9VacD?=
 =?us-ascii?Q?ifcCQTPzGXy64DGNzAYEqqRJuhsZ3c6BwHlzuP/e5y8dhy9v/kCCc4xkWG+X?=
 =?us-ascii?Q?qzaWCLXklYRGuoNxlJRazvxJmqm2la0U6omxI15+OwfzMFavnXmkVr9EKntE?=
 =?us-ascii?Q?+b5Wcy2lZDO+RnQArenqUW+2OyUl/JB2cY4qH4VAOvFvXxSeWbuBcNIUMt/e?=
 =?us-ascii?Q?Ge0AmVd5s/w/b7BP+rAIGDAkakiQNP0DjhCOFoOvvBCAHu/9W5XKsVcX3kod?=
 =?us-ascii?Q?DG3/l6tN3kkYCE0mpmb1Lsyx70BH86s3jbdDd9vbHxbrlFZykrQ+2403czh0?=
 =?us-ascii?Q?19NBCfs7/WV4bI/cd8PB4/m64IDh3D70TvWfI2/xhO2L84qXUqIpUn+aPmw6?=
 =?us-ascii?Q?yZ78nlHp6/g7BaeRBhZTLC0e3J41s9PHL/+GSvrHlO0r6Aro1vGPx7CL3niy?=
 =?us-ascii?Q?XiStX7QX5KoZpA46t/V5bwiXHXwWsodOeYFM0ED+cetFaIW5HEw67I6YRe7M?=
 =?us-ascii?Q?YwSwkUaTbnnAVxLhVQlJ4e2ufO8gCuY9KaiyyxalAso80OQAhtON99zEgAVs?=
 =?us-ascii?Q?5SGlivK8UGXByIY6d7ivotdYuZ3IBlNB0kqE6cKuZ48GxAW4SjPMIeS/SF89?=
 =?us-ascii?Q?AsVvOa4hF+LT/aTFP57QdGKG2/KrLAaB5+d99mEtZelTuCA1+RKrdDS99S/H?=
 =?us-ascii?Q?VZaeIkALDktPtbTO5GTkrJSyKAy4GiIGp350/MdDeOWxIXaTsX/Q2VsL2C8w?=
 =?us-ascii?Q?I/7SSMZV33uuvDtnzliI0UMAptMPanK9aDTHWLwmtgHaB1zpxTeqAdUdLbBN?=
 =?us-ascii?Q?a3TZ0wGQXl3F5vGi62m6Zh85CT5mkXvSsmIjzD9/Gh893/6HUJG/UiXwm90Z?=
 =?us-ascii?Q?27dyxaEDtr2MtRvSVbo5VGbRm6WMmOAWEY0XAHuonzycfpYTyg2mD/iN0Qnp?=
 =?us-ascii?Q?jU//TMD1gt4DOtEbrLSnxXesa3yg+yyGYttrPk957LnAk2u3D4tdgdKApHyE?=
 =?us-ascii?Q?slYr0GkWcDq6QxzcmcY+SkjTYkQK3g4=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca10efb8-9b6d-4789-1bc8-08df0cba4351
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:30:24.7590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0krw9/6uTfSosfVCUkNqS2ygAkWWEu5bksH5ibnn70StxaMEH/6CQrrrDjevAGIOUsHmWnqmuP678QM2SadyR653LBAj25cixwSqMlYFCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5680

Agilex5 integrates GIC600 with an ACE-lite interface limited to a 32-bit
address bus, so the ITS can only access the first 4 GB of physical address
space. Register intel,socfpga-agilex5 on the existing
dma_32bit_impaired_platforms list so ITS allocations use GFP_DMA32.

The workaround is guarded by ALTERA_ERRATUM_AGILEX5_2_1_23, which is
selected by ARCH_INTEL_SOCFPGA as all Agilex5 devices are affected.

This limitation is documented as Agilex 5 ES Device Errata 2.1.23 (825514).

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
Link: https://docs.altera.com/r/docs/825514/current/agilex-5-es-device-errata-and-user-guidelines/hps-gicv3-its-and-lpi-unable-to-access-physical-memory-larger-than-32-bits-causing-msi-x-interrupt-failure
Link: https://lore.kernel.org/linux-arm-kernel/372f059069a5551ea1096015f855cc306dbd7cd4.1747368554.git.adrianhoyin.ng@altera.com/ # v1
Link: https://lore.kernel.org/linux-arm-kernel/6a44509ca0edaabc17e59d2e27fef1c782183456.1751618484.git.adrianhoyin.ng@altera.com/ # v2
Link: https://lore.kernel.org/linux-arm-kernel/20260622024945.21354-1-muhammad.nazim.amirul.nazle.asmade@altera.com/ # v3 (untagged)
Link: https://lore.kernel.org/all/20260904091114.2259616-1-adrian.ho.yin.ng@altera.com/ #v4

Changes in v5:
- Rename the Kconfig symbol to ALTERA_ERRATUM_AGILEX5_2_1_23 so it names the
  specific erratum instead of the whole SoC
- Move it next to the other GIC errata entries in arch/arm64/Kconfig
- Make it a hidden symbol selected by ARCH_INTEL_SOCFPGA instead of a user
  choice

Changes in v4:
- Rebase onto dma_32bit_impaired_platforms shared quirk (post Renesas)
- Add ALTERA_ERRATUM_AGILEX5 Kconfig and silicon-errata entry
- Cite Agilex 5 ES Device Errata 2.1.23

Changes in v3:
- Extend existing Rockchip dma32 quirk path for Agilex5

Changes in v2:
- Drop DT binding quirk; use IIDR + of_machine_is_compatible()

 Documentation/arch/arm64/silicon-errata.rst | 3 +++
 arch/arm64/Kconfig                          | 9 +++++++++
 arch/arm64/Kconfig.platforms                | 1 +
 drivers/irqchip/irq-gic-v3-its.c            | 3 +++
 4 files changed, 16 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index ac3248b9f2f3..25afa79266a4 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -53,6 +53,9 @@ stable kernels.
 | Allwinner      | A64/R18         | UNKNOWN1        | SUN50I_ERRATUM_UNKNOWN1     |
 +----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
+| Altera         | SoCFPGA Agilex5 | 2.1.23          |ALTERA_ERRATUM_AGILEX5_2_1_23|
++----------------+-----------------+-----------------+-----------------------------+
++----------------+-----------------+-----------------+-----------------------------+
 | Ampere         | AmpereOne       | AC03_CPU_38     | AMPERE_ERRATUM_AC03_CPU_38  |
 +----------------+-----------------+-----------------+-----------------------------+
 | Ampere         | AmpereOne       | AC03_CPU_57     | N/A                         |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..d25c77a15276 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1427,6 +1427,15 @@ config NVIDIA_OLYMPUS_1027_ERRATUM
 
 	  If unsure, say Y.
 
+config ALTERA_ERRATUM_AGILEX5_2_1_23
+	bool
+	help
+	  The Altera SoCFPGA Agilex5 GIC600 SoC integration has ACE-lite
+	  addressing limited to the first 32bit of physical address space,
+	  so the ITS cannot access memory above 4GB.
+
+	  Selected by ARCH_INTEL_SOCFPGA, as all Agilex5 devices are affected.
+
 config RENESAS_ERRATUM_GEN4GICITS1
 	bool "Renesas R-Car Gen4: GIC600 can not access physical addresses above 4 GiB"
 	default y
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..07127f7291db 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -361,6 +361,7 @@ config ARCH_SEATTLE
 
 config ARCH_INTEL_SOCFPGA
 	bool "Intel's SoCFPGA ARMv8 Families"
+	select ALTERA_ERRATUM_AGILEX5_2_1_23
 	help
 	  This enables support for Intel's SoCFPGA ARMv8 families:
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index e9807af23537..4758f80a2746 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4895,6 +4895,9 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
 }
 
 static const char * const dma_32bit_impaired_platforms[] = {
+#ifdef CONFIG_ALTERA_ERRATUM_AGILEX5_2_1_23
+	"intel,socfpga-agilex5",
+#endif
 #ifdef CONFIG_RENESAS_ERRATUM_GEN4GICITS1
 	"renesas,r8a779f0",
 	"renesas,r8a779g0",
-- 
2.49.GIT

