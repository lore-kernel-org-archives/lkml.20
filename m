Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAB11E32D6;
	Wed,  2 Sep 2026 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365791; cv=fail; b=PAFWPuvq1TtTCoaL7vNQtY+SbmxeCZXWzScBFnP40knIHOtgBfBqMY9pxQvuROgTAV8JQhJ/uugbdSBDz8YLpZ/bGFOA8Fsd1xA11gtURQ43h8LhoSojCNsILGD1lSRW0z57QTicqU0RV2xpknYhFZFtBRD/i3kQcuqkjyF8sAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365791; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j03fhwxstgVF0VM0b0PwKqlYoPGDZ/OZPJ2cy3Gkc1uNeDEahDT4ftZOCDY9Wsrt26b80raJ2us/5qW8NjsrDcymqiPba2Kj+qfoP94Xyl0VOXCBZ/Fx92tm2viA/5Y5xcvU55I1Jrtj4gpMnfpvzcNbkyCa003/HzYf3g4ScRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xaqm6Ijw; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xaqm6Ijw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAicRu8lciRFw+avYwi2Rs7J2TFcsQQwyo14o6rJBmV7ZotgrNFbcq41fiCGpzndFS9rwnG8PzeyAbd2YguiFOcQnZWKLrw2tZnA0u/82EGeQiUlsR1X9lqSHx+f2Gr6UKB2y871t2SnMzk4zxTgauzlMdikG6oInGIAbXihhx0Me0U+potDReBJkxkIEFHlkE1xy6l0zzk7cl5RRMtmOj+A69tUpiYJSlAnlnQTc5YVW9FzAznoLsPewdAlCuPfbPtYBO7Gbj0Vy897WevGFS4MBLXUszu6P6KzY3fShub5wmQEGVRw6hCErpGPV2skoaN2DTlbr9ygmT4FPZ4nVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=QyEaEGca2Mx2RJb3dtWQ9L/bhz24iUpHC7GTeCTicHFeASfvvcW+qeYhqbWsvZBuT3k0HbG/MxWIor2b7pLLZb+INy8aZKNkrsJ5voDSb1ggWIu5f68TuhcoYWeOqyC8PvNF3qVcLpqE7dfI1zeff14A6u5mVGCncv1yGuxn8bAeOET+tLCy7KQz6y9xbGO8HeEKv1olVIwaclT7mTfb3N+jhWj90vb1753EK0TnjVzIvd0PRitCjy3ZQlmBIlgNy3kClLl0Uk9oZT69Fd6F4dlZWZ31oyb+nEZIVPjvY8LkEg6f6NEC+ARmwTkhloNtqtevl5RCccrjL/7DvQIAAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=xaqm6IjwoRpIOa6lNOwE2wHQEhDsq/e99oWFJrci37WQDAMfOBIg2DrQZVHAa+IP1FBsEINO1eDWG8V15oUSSuPt+Z3cICnw/W+b/eT2UHU+JGF9o1gfxtUgnM8QeO1Ox+XzVYi8LsvlFMFeJPZ5uJZ+W9XA8m2veXp9ySTGekM//9695i7q391nZlSkadM/X+19wnuTtFIj6FmmHn91lhioosLBnzss0k/w3VPIZsUJuWukflMkyVyDP4ZmAot6RxKUL9wUM5jced/2w9jTcA0TppKZOCPC4D/sec56VnNsC9tgGfttW2al+qe4Eq9uA1NwyJTm7cWERPKWDUQmkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PAXPR04MB8392.eurprd04.prod.outlook.com (2603:10a6:102:1c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:16:16 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:16:16 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 03 Sep 2026 03:16:08 +0530
Subject: [PATCH v46 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-imx-se-if-v46-1-aefaab525034@nxp.com>
References: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
In-Reply-To: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788385573; l=7403;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=eZkJ/OyDvbFEi9alHKbx5eQBZwSQqAAChxeZaLXqulPvSE0SeIUVbrD17gROutxY5qhce+J7I
 hHDSDz9yEDOAVKAKO9EnwAg5FP/4QVX9qe2rbFyEO7Vh+gdMXIkYFqH
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::8) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PAXPR04MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: aafd3154-bc0f-4a74-251b-08df090d8434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|921020|6133799003|56012099006|10067099003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uhS86hpbKBViqZs4TF551tSAakwNWrSQaCQ75cBPQlxq9/3QmosO16x4hIqmiakr0DnFdhYCUGrSEwQdhhRxXYhnmi919r7vYk2KnkNu/4iOpOtRPLzqnfXaC7mEXQPjzZ2oICIywIyjKoIjPKI854erQlrMDxVURL1trHu2yjM33ySxYtCrlxKyRWDyNyfk8LwKZOrhz0ticeZ8QDnULrFfNjvrJ7QWXsN05dLxknd0Q2/0I56OLDnhJj1fSEhZBwB+LsSg0fGtcN5PZwJeredh+3ayxwdu6brqpc5M5T+NTb8+0tJgqwA4dVgLvVPEGgg2LyoOyApzJSZqVdnlt6P9BN/iUTZxQNUKybX0R0mc4yZtZWkK3PQ92LKCTzAVsE7dCJy5pU4ps+Fu4rpkJaazHoKJLuvUdkDbHcx44e/XFG/YuPT9ovRIMpU/wEUeM2qflC5kf1ITJfoWO8pUYCq0yihr0IyyBp7GL/YUjBucrGPCpJsAMsuGLjmq7EahfgNIIXtB+SB4TH+1c9HJMlqR4J752HBfYorRkY5hfaW4nCYeiLz8IBNS8VVNlZJ99K5mM1WN8PzPilMN/wMk3w07xEgZK/iw2hbJjW1v9+aUMMts1lQSoS3M/OJJdpPgNmT/MxZCGLh8j7evMyGfNLjZuXUBXN21gPi92XB1BniTr0B/zZqxOORWPpnOciD4YTtr/YaUiwxGx0u2JhxZxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b29HZXZJM1FxdEtRemQ3a1d5NUZsajkxaXFZZy8zWitXWkRmcUNjWklsME1n?=
 =?utf-8?B?czZjUWo3RHgzTDRMM2JTMUhEUklRRWE2bVZHcHovSTJzZnAycGVXdW9LeUlO?=
 =?utf-8?B?NkU0UFBXY2hzeTBkcnNsb1RwdEdEQTFBVHlRSWlCVlZwVFRGa1JTV2xaSXJ4?=
 =?utf-8?B?ZEJ5aUp5MWQ5TDU2Vi9tNnExbUx3cnlJZkpqbG0wRi9DcndNeXlaUzRlUnNr?=
 =?utf-8?B?VkpNZEwwbnpNRVh3aTFLSW5iTUdrTjdrYldDa003NjNWOG1pMlVxN0VrUmlw?=
 =?utf-8?B?VXQvS2RYVEdhbkVxN20vTmlReFF6a0Q5U1JKQmVvYWo4R0RoU0NsWWRqNy8x?=
 =?utf-8?B?cVFycVVxd2JGUmNJR3NrM0ZJWitDRTVMeFh5MDd6QURZSVhlRDluSUE4YWpU?=
 =?utf-8?B?VFB6QkJOMCtNYUxFUzg4dnV5SUJ4QkROSW5hRFhCRVMySmN5aWsyMHpTMzBq?=
 =?utf-8?B?SGoxb2tFVk8rS2lLODZ2aHIvc0ZoQWpnNEIybVFUMzNxUjMxZDhhL1RTMVY4?=
 =?utf-8?B?NHFpYk9WMEQzMC9HbzdoMG9nMlcwVHBKS3BNSUxwWlVmN3ZTaHloaERPOVVM?=
 =?utf-8?B?YUlzTG55QjZEYVZJdndKbk1jM1lrdzh4NHhTeWJteHlKaTNrVkJSTHFvcEpp?=
 =?utf-8?B?VVJmQUYvZ3UzNGZ1MEFuak8vRzREZ3dxU0VvQ05vSTZlS092UTI2NzNlY21B?=
 =?utf-8?B?Y2M5d1NhVHprdGRLOWNtbUFncHFOWkkxeDZGQ25QNjNEY2hnZnExYWNkZFVR?=
 =?utf-8?B?cENSandrSUVETzlPVXNaZW83bFJoTmlyMFdmbDUrUGxDa0htemxjR2Q0V3Fx?=
 =?utf-8?B?bUZrVjlKM1VmUU5pYzFBMlp3U1ZaakxyK0pQdVUvMGROVCtRZjVKazcrQTIr?=
 =?utf-8?B?dkw1S3k4Q3VUa205ZmVYb2F0K0s2Um1kRExxWXd4ZEJrMGt4K2tkMzFnODZx?=
 =?utf-8?B?bXJ5UEM3VGpuKzJoZUh3MUNsK081SWpaL3o0QUtiRmJyOURJaElTOEYzL1Bs?=
 =?utf-8?B?VjdBWmZMQU1GTkwvdEVubFVJSkZaZ3QzSXhzMmo5SlAzUGlqMmRNZkRlSzNC?=
 =?utf-8?B?dXF6bDAyTzZOYWRFNGYyWmhhaitJdFZsbGUrSzdTdEV2cm4rVU15VUlLc1hm?=
 =?utf-8?B?bFVwcTRab1ZzNHdQVmZQVG14N1JobGZHVk1OVmZjZnZ1NnhOeU03RkZlSzB2?=
 =?utf-8?B?VVRGdXl0VmpaT0YydDQ4NXR0c0JIOUVhVDBQQUs4dGE2SFdRdjByeUJhQUJn?=
 =?utf-8?B?OEJmUlova2REWDc2eHMvR0ZJUEdKb2pKNC9ISW15ZE1zZlpHd3hGSjc4K0Iz?=
 =?utf-8?B?b25MK2VYaTVqUWxUVmR5MmZ5Uko5SHVqZ2FzWnpNRHJCeHE5VFJjaTJYanN6?=
 =?utf-8?B?N2ZZNmw4Y0FET3JEeWhFa25lbTNna3RLYkw4OXQrWE9UVGg4VW5FS01aVStv?=
 =?utf-8?B?Z0FxQm96UnNxU1FRYWtpSVJmRGh6bm9CYW9tbk5BaC8vSzdBcDhBZDROUyto?=
 =?utf-8?B?bm03U2lrNFhRd0l2alNTZ2pHWjluL0VBeVpJS1ozMWJaRjF0czJuMHdWQ0o5?=
 =?utf-8?B?akp0cGhEM2pSeExGQmkrSmRjOHBPRGUrUm1wM0Fyd0RlL3JDYzM1UFVZT21H?=
 =?utf-8?B?NkRrdmNmR012ZGwxVmtsZWM4SER5bHpULzNReXBaVUpvcVd5Um9VcWNSRit3?=
 =?utf-8?B?S2ljZFdZQ1JOZEJKYVBtSFVwMWovaEkzTEVreFEvRUZxQXZzVlBPcGpJYnE4?=
 =?utf-8?B?YjhiU0dPT21nNWRJcTArQ3hZV2phVDhWK1hmLzhSTzdCa3k0MWR6bDF3MmhD?=
 =?utf-8?B?YldyY2g4MXBQVmRDYnYvVDRwMEVFU0ZlTWNBTkQxcU9BSmE5T2VsV05EcU5K?=
 =?utf-8?B?a1JqN3ZnUCs5NWhYQzA4c05sK0x3d2ZSZVlPSnJXdGNoclFCWlY1R2ZST2lF?=
 =?utf-8?B?Y1VqUG5sWnZocXNRMU1TcENKdTA0aWhyeEhMeVBuMGNQeldTS0Vkd1NTeWt4?=
 =?utf-8?B?WlEvMzB0VDZFZm9tWDFra1Jwa0gyWjhyaDEvOGtwREptTkFFS0JHTHdWdGg3?=
 =?utf-8?B?KzhRSmhYWEhFVWEzZ0lSTlNMYjhoQmsvejc0UjRraEV4dzNhL1FEZWpXZHpF?=
 =?utf-8?B?d04zcnM0aU5FNklSV0lScDhab3NPcVlRMnpYT01uNVNWbk1KcU1hdEIrMXJW?=
 =?utf-8?B?U3ZoV0Z5b3JKdjQxOTYxMytzNGJRNzJXVzlESDhiczNEbE4ybmdtUkNZK3J3?=
 =?utf-8?B?MEJXOW80QjBWdkF4b3ZNT3J1ZFFvU3NMZGFJekJUSE5vRGgyQml5WUh2Qmht?=
 =?utf-8?B?WUhiMWRLb21lWDY3Slp3RW5FR0p3TVNLZncwWkd0NmVMRXViRlMzdmp4MlFK?=
 =?utf-8?Q?Os8Po/Z+zXY7R0Hr+Eb8f3nm2YZyTrJ2kICz0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafd3154-bc0f-4a74-251b-08df090d8434
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:16:16.8180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHFzNh5Uy17/6eLpOS87EBaRFiv2MfrQSIMFvEF+57DGOr1kdyPQ3cB+GY9OojuH2UAX+tzhdwL4XCWJdIbcOInc3e/KOeCzYRKLyFNr13ybkWubaXmnfjLzfYXJ74zJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8392

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

