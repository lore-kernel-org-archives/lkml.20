Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2092.outbound.protection.partner.outlook.cn [139.219.146.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3EB44063E;
	Wed,  7 Oct 2026 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367323; cv=fail; b=FYiyDYJa8JJk+7r+rCrTMrFz/nxL9iTtGUx6q8P2msWeLGfbphyD3cFZfVAKOINaQRYs+sFA9LbcWiB88x744lXYVbRxdss0hkfeCDFeL7jhrUaP9wFVqiDo3TO6jEMVoS54ET3oix78gIbJjVOc1h8ifWsrpLBfnSvVbqlhERs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367323; c=relaxed/simple;
	bh=gX67sP/DvsMujlY4P05L7W3x/Lf+nX6TWlUjb7/sy0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FN/dQLeigBtoyVgP3dIk2JFDnuTE3HHmmAElo54sEFOtPj2ih7TC1L9rRKJRC8CTNdRVo4IyG0ZQEXMLikOUi8oHiiVRBtvUFmKiiYVIZYqql/QdhvB0z5tfkdvJ5Y3YBWF47f0mYAcjfeoNhLeVBYS3aUyDR7i7bXlPh8v42gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVc6lVQ8TmLf2/v1fAVMChy37NR/+Y6FmMWvZbg5aaMW3Fpfac7H0IeGRECKaUWkWkpPJByGMli37tzrmB7aEmLt6xr7GmlioNqtarP8O0BQemy9ROi86Iy32ILEihZj6UPjeSQdnNda0wRPtLY8c183p4aC0sCLtgx0IzNuEnQ5erVUIk8FV2YCMEum0LnfAZPXfNLHdURtm8oD46VuvdoGeuwH83qdd85czTuYwMLcYIFsdrCbB99lOW5DdEWl7gukd4w1uucm/RPPSq7hyzRoaWs64ufxPz9okHRENDi0uFP5euiBbA5lc+1zXTvqB86NXkjs4yAzYrEL5mhmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNUJsLwUdWwBQo9CHUeRSd9wmc2H4fQt0rhhRfHIBg0=;
 b=lO3oNqSr4l8A8xWAjlNhth+CRaQBDT40Ku5/k4o9lx60ZJATEQp0nMuPE964SeDZqz3vHG/GbZKrSJKfF0EY3PNP6VFcYiR2yFLOLQAMW0sBJle+33LcZqMLVNMhJ+FpK02kvzyoYSTjwXL2LJaUnnOIB0V10ZNSeIqpIK2JaXcj7k+lNA3ZWU/0ORZI01p+E3wKkzW2JvwxSgEPQAxqdI39HbHAyMNNUIApti29xiZl/U7p5Nwnup9n9BHDjcn8221JgZIm8sMMvpPgfJZTs980dU764N/jOGTkP8FhQpl8b4bgqIxeyQSZV/E7cqniDJFRS6Sd6B2XshsqQ18QBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0796.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Wed, 7 Oct
 2026 10:01:20 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0472.016; Wed, 7 Oct 2026 10:01:20 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	rahul@summations.net,
	anup@brainfault.org,
	lftan.linux@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	joshua.yeong@starfivetech.com,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] MAINTAINERS: Add RISC-V RPMI voltage driver
Date: Wed,  7 Oct 2026 18:00:20 +0800
Message-ID: <20261007100022.2512187-4-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007100022.2512187-1-joshua.yeong@starfivetech.com>
References: <20261007100022.2512187-1-joshua.yeong@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0024.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::36) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0796:EE_
X-MS-Office365-Filtering-Correlation-Id: 2187c1cf-3d72-462a-b024-08df2459efce
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|1800799024|7416014|376014|921020|38350700014|56012099006|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2LjyIljyI0l1Ss+l7wBDPyxh+PWgzE2I2fJHSxTaT6VOC8u1381JnT+jaLjCN2roiJgxGTNzLeZcWb6lkDp9DqmlXFBcrEP3r/HR9Q0K6aXZcon61/BPJ3PldRtMLnmpIWeRXTkXmKSMV7Gl2UAxq3bqLsVB8hD6YAUzzmUaDqGyPsuB4QmZ8muOxzk/XMNYyM6KjOOmewHSzF42tMOK7/RGFw86xbnQ4fuS8TxRUv6itNVrBMSyCJkz9Fx9cEX8AbpJR9/n3ge3+h03Nh/Gl43c57fjkKDVC0g562peCCMXWy2Cgv5YAn8bHyssgYXU07OgNCk+ugFKdFmoi31KXpix3m9GhCgD00eCz1W8rft6Z/wv3WTvBzPMwgs24lqaQsU+yY7K1/6eOJ1psCiGSXRV+uxOJSLMTH6ZI7X2kEB0UbCeHwoDccHjLeMPgzouOgrx+D/XvOKKQgQ80yeTce9JlEMU5CSBuy5/85j6x9IcgUXWNUIqJvimaFVmz/htuL6amlgXrTNRXbW9t+ZAwjb8HPWj8uvgR+Eo8R0Trn6FQWqkkx5myGSyn0221WrHycbzdPXrREn6ICV1BHq4ug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(1800799024)(7416014)(376014)(921020)(38350700014)(56012099006)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T5LCutsvedAPsUgiwG7vadaWQ7cstuvdihY2E4038cVVSlZnkc2QZ8HyTJZn?=
 =?us-ascii?Q?yvyU+yGCA+eAFv6ul/nVj1tFgwJWPrXi1Ezq3xLp6Pgh23R41S4KNP/BbOle?=
 =?us-ascii?Q?j/2056YI2GeKpndIzoiDTvmUvmtVGJ+zlyOPAZRjvs9Y0v4Oj4KRHuKECYL/?=
 =?us-ascii?Q?2f8qKcJiawFl4hSz2+rpZ1Xpv+jLDoN5XeI3iWvN4sqN0/d7wEs2PDgSXPLQ?=
 =?us-ascii?Q?WXF0p/vFZCJHPRhYFVuxXM2XeWQNCQG1fB48WuCT2BxLvj2m00bYZvNEoit4?=
 =?us-ascii?Q?J1Q5azK1zxR8su9fu49v5NqbHdiizWFESOlVWGUlyQGDNOJVDTCAkY1m4bu+?=
 =?us-ascii?Q?X59NbY9Wj/v+Hd9nvr8Y4inosmZoJgktwWvJPnaS0RECXcV1zMepziT/6dyU?=
 =?us-ascii?Q?M8MHyPzdR83KXM7jG25YSzk58Kd8vXTJpcCGp34CN9YR/7lYWhbQXRW0U03u?=
 =?us-ascii?Q?ZELN9bvWcqd6l/if+W8DOrE0EEjRD/kpbmdtsyVQV13Ilg69CaJtq30wAv7m?=
 =?us-ascii?Q?xY4TOwPF9314vbFbgUhNMok6eKyciXog1Ft9wnnRPICmpJynVD8eXhES+i/1?=
 =?us-ascii?Q?W6iOo+EGmsJ9/sQxg7XRG4z0wZ94ELpPPwz4rHF3ABkOUG4b57vEG//CVxBY?=
 =?us-ascii?Q?HH35JaILL1c3gKbRhc/mLaiyBFsP4AYIOJY6ZaEbt6bKd94tZRJAG7d83RvO?=
 =?us-ascii?Q?Pp6RclJBUQyj20WDUbhbXbNDzcRwCEhTEBc5EkqLqMQqXXPIqtIwP10c/1sh?=
 =?us-ascii?Q?SPeYRxgFLTy7s6PHt0fiOebz2nGj0iMseaJpE4oFdfbWetDSKTqrE1rDe/ZW?=
 =?us-ascii?Q?mbFHUgO568th7WYMPiRhALH8/+qMI+wI9twOUH7VafUF/uefo9qUcSTvbsC+?=
 =?us-ascii?Q?kFke7ugpr9s9Lr/H/dWp2kV+g9jS/djtgb18knzWyByWeswwf/NsgrmLwxcm?=
 =?us-ascii?Q?r1r/QWqQgGnW65LtydK6imIEAy3CKAIJKpEj4VMmn2cYITIjiBQzJpgQu+ay?=
 =?us-ascii?Q?/62gRns6Alma2pgAvCYHEhWv/QmNjwO9us4qYWqX20PjReGYt03ND5kWyBd7?=
 =?us-ascii?Q?m3cMXAZBMnNBWL7gARpvDdQVbeHhzUEhXR3L3bYKAhNJ4J9dOtLXwxIwGhFr?=
 =?us-ascii?Q?GiVNPbHcXUFfbTKzYhvk0TjPUusSGjpo3UjJqZxBi0H7yPnjO8vwAg3HKLSP?=
 =?us-ascii?Q?leCsIntw1W60fZmmbUi7LKkGJPSfnfP1RBRRw2X5TyEVHgWGvBT0pqobQTeG?=
 =?us-ascii?Q?QJE3bFPR9tAb9NCpQcH0tigTqbHkVUDhSGk5Q0XQT5m7IVR5QOCu24zymcg9?=
 =?us-ascii?Q?1q4jiwXT3KzaVpDngkOk7xQt8RFfB2i3ldA1yMRDKgV33dFcdv94CDMeov+4?=
 =?us-ascii?Q?Rwue9LWvIlijIBX7Zmok/fs+TWsL4WGz0oHPwSq3qmwclhKu2388GQ0qELsG?=
 =?us-ascii?Q?/jvP3yKIa6YjVW9LeLzflwZMW7FhbceBFpRUHCKTPaBJmHXQuQPJont6iHlW?=
 =?us-ascii?Q?Rk647wtMv0EoKVIa/OLg9zswPm+PoiK7VMJegYoODoB32SSN/qjJUYbKkm8X?=
 =?us-ascii?Q?X68pb493Y9KQ34RUJgGaXKn0OqPLW4AuQNC3fw8jrFUvVVZM0K/X+wVQ1gMc?=
 =?us-ascii?Q?5c8iSJHccOL/Iim128pD+naiF5bVRogZa6w/+65vo37Lq73KL5GEZlwoKbzK?=
 =?us-ascii?Q?K1KgKK/lxcg2f4W5D56aqcaicXO6uKw7hGJbifNJ/eI8YtwtNwVCt3Mi096I?=
 =?us-ascii?Q?6bcm0byCkAGApkZivpJMmPsysrUy5E0=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2187c1cf-3d72-462a-b024-08df2459efce
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:01:20.6345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmYJwnZes813Bm2PN+1hR+p6JU1wlwY7BXoOKqStSFdIMmkvpZ0x/cPeM74V+RDqxS5XPOUQvP3lDgp+oupxrBJN5w+J8fWl+VMkMZ3cfjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0796

Add the RPMI voltage driver and its bindings to the RPMI device power
entry, renamed to cover both, rather than extending the existing RISC-V
RPMI and MPXY drivers entry, which covers drivers maintained by others.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
Based on the RPMI device power series ("Add RISC-V RPMI device power
service support"), which has been applied for next. The cover letter
links the mail saying so.

 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bdee5c7ee83d..cb4072f7b309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23600,13 +23600,16 @@ F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
 F:	include/linux/mailbox/riscv-rpmi-message.h
 
-RISC-V RPMI DEVICE POWER DRIVER
+RISC-V RPMI DEVICE POWER AND VOLTAGE DRIVERS
 M:	Joshua Yeong <joshua.yeong@starfivetech.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
 F:	Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
+F:	Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
+F:	Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
 F:	drivers/pmdomain/riscv/
+F:	drivers/regulator/riscv-rpmi-regulator.c
 
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
-- 
2.43.0

