Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628230;
	b=sy6bY9V1MCurQuaqVlOowjAyFw+xy8FYXIwT+8xla70h6g8lZx8tIUrwu0mYPdpIL26K
	 IWjOp0i8o4jXpPgVp+QOsIByjhSYnJfXqeo1rznv+L5E4yYEi807A8qQ8Aqu2sMYcTZUe
	 NVT1kCqqnfsgEb0+wOMvs/sI4PH8cl8gZ8hcpwRywqg978XQEMBGRX5EdpjrllR9PHtl0
	 OTnwcjB8jBKkV1zcBBbXhd1+C/ATZsJ6YeRy01vMMVSiV9b2nAZO7T7Q9BM2fUoFRNLmZ
	 onXHXbGCXOWtyeUnUuXKtrrG2S2myU9AsXzyjY6Y8e4WCJaWwSeyS9SVZWfFs98lE7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628230;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lrDmTei/H3yU/35ScAiNT+t+6rB/hDCxf4yutPBBvyI=;
	b=w3bVQ3rEB1JH+xiqSBfRzHoGiGO2sayVo5XNHIJbH0qVQFM8v7OJiAk0cumlwNnK0k7N
	 KLfUPube9zPPq04OEcZ1ETG8D2dn9Z+aX0/h7zKSKj2TvsGarLpuIcES8fJeC7BAGEn8/
	 p1SR4kJIl+Y98TpaBUnJt+PQR90JsxDGWxZqumGEdqZYB+YxwyHZWBYBTNDV/Cb0Sj5VO
	 nxW7IAXKg2Amx+0smGK+nEb+XEoTX6GFfg3OoF9IdfBzKyInBsiFwXSWGnXVE4uvCRm+f
	 D/ASRlgC1Vc+zWJgwJIoPLRz+EQei0NrE4s3V/dIIthP6u794fSN1PegZS5VpMj/q6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SH1NrueF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.27
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A295606A329;
	Mon,  2 Nov 2026 14:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A295606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SH1NrueF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5Wom5cg0WcDeQ8+gtto0oESfVU7gjazCcZ+QtES+akzdh/ajj3lp+w5IBDj0iY37GW+qI2dXSWg8FYj+2MiNBddety/Apac9vVhN0s3kD71bAkiSpoSn0XSCslaxmsZSeVL7ZZdMkMoCu2hL8+WeWokT3Of8DXpkiGsnXTMQRRDVbXqAPUENfecZMQEvy2MeVVEZR+0e5EEMk6yV/S4qbITA8P+X0yf8gIWOHzO+6OIT4oBrr1PMk8apZdyZl1sR1YTSHNsnHGa12dSrQS4e/kaOt6GMJGmwfeIJqIzSycqMW6jdXFu2tGxIwk97dhZuVjY7SXanD6MDBmtHZjDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrDmTei/H3yU/35ScAiNT+t+6rB/hDCxf4yutPBBvyI=;
 b=q/NBy+zfK7u2REczvCwR3MPhNE27hxSyHieK+H3lFfyR+KPfId5WyUJDtPd2Ypys57ceJD3wEaggtaeOEL9HIZXTuiuoGhjVfEPjGAThlp8XtUxjXZRruY0G0y3T76O0Rot1ym5f5EXGHD4j+ixgrUoKJRB0VN2z9/sQJtltkBUcWTeu1J8UQII7Er76rm8lMRy3Pd5HzJrSrsNfm6s/GWnQBYnTo7rIo+hFIr6By2nQ0O/jQfVkzY2tKX5giYi3vBHvNHHjj9dbtY1CATAas2+SkJ1vnhVS5/JkX3BjDHw767GbtfaPCByx2VKQYrgF5q0fYVcEBEYiI1iZzOfx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrDmTei/H3yU/35ScAiNT+t+6rB/hDCxf4yutPBBvyI=;
 b=SH1NrueFs5TRLZY+EEHVxVI597FjH4jasrBERjKDBka5U507tRdEwqPJszgYh74eF1Fttd3B8h9/bggTX2VYxZFWTbebd6e31iQHBXgJzWVvXp1gLjfOVJ/oBtl/NyUvzETsIj/FUQ6kz/IfbH9+onWhRvwjrLbj+xhtcbfsVPsp4BzoR1ivx9VMoPnhIfsHPwFgJ3CKFeHP5O7k8DBlbo9IU+zXAm8CmkDEfN8quaS1rHWVTi27nizSx3bpJGl3bVw1ld2miFRWFAXjLHB1kcNv/sq1SkQGAGge5wrC0Xv44Q5AgKs+iIvltkRzEq4E58VX3HKng7JhN7P/C2DKeQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMVPR04MB12628.eurprd04.prod.outlook.com
 (2603:10a6:20b:773::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:03:47 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:03:47 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [PATCH 2/8] dt-bindings: riscv: cpus: add OpenHW Group CVA6 compatibles
Date: Mon,  2 Nov 2026 15:17:21 +0100
Message-Id: <20261102141727.640769-3-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:510:174::9) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|AMVPR04MB12628:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f18579-2d78-44b4-2681-08df38ea1d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|6133799003|22082099003|18002099003|56012099006|261009223027099003|261021121427099003|261022075727099003|11063799006|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	CZ8MICeG7h2MXfI1Ydyw9SZdjapfHI7j6w9FOYw0/06nifHn75EJRZpnWQ6zv/fFoHR4VQrLMflaj2p4wfZFfwpHIxzW/OHIZ59C5Xdu7Gvu7M71AlegFkCL/7tzq+n3Hi83JiWQBe5spR8iIwfFL1CJubceO0ELA+D9kR1EvJmY1B8mJx15F1c61aKqDDVBkOdCqQgmjXygoeKm/BCvmkdD7JoYi6FojsO7soEUyRk2KsdZzmk3aU//ZYqt1/cOVDtbqw+R7jFQ3yc4PGBDHybzuPG4WOZbjEupwvzmUmpT6Orbl4IWj0S8nccmiEQIOEkBpjfh1PY1gMupz1uyEuCn/Db9cL6kVeygAoUktyha3w6MeInxXsn/X+ZMk0NGQAfP/x/tyW1Yv/+ozaDkXQ8jSiqWbLZCqs+IMYmGhfalHELZISBtpa50YnKBgjTzjbpcEKXXsty88wX50MUE1KdLGFIl5+4lb6Oy5sgWg+fqZAgkyaEKUMgXWCAn1WicicbWGercyQtqNPv5jckng4UL3Sz1OjIGf7yKFVJ7nmcNu+eERihuHA5mqPV/8dzxgFk/f2BONh8Zd8pbk3bZCqv/R2HliLX0jAnwPqk3FBXAc2+r5oYY/0mg8VtqEhf9DXLy7ekJ3DemuRZCEk5f1e9kKbLokVIatkv3jedarbE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(6133799003)(22082099003)(18002099003)(56012099006)(261009223027099003)(261021121427099003)(261022075727099003)(11063799006)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jZOM972kkJ+IniITbxGaE+8bSYYS/lvcVGMJQtsTkj+bGCWnSjTpJZ+SdbdL?=
 =?us-ascii?Q?9Sc8ZRpq7meCOZr9e1sG8EhY1I1uILpiw7aQutFE32ZSX4FbrKqewfvvlbeF?=
 =?us-ascii?Q?Ck5FtLFvqihEQW1U/zYXmri9DrXpM5Hb2VJGCGLEFuVqxB4wSNC67BEeWXBd?=
 =?us-ascii?Q?cFdj0/Xq+0s9ItEb3DJfcAaTTWVj6rBwDDChIo1ZdNGma5yFt6NxHXmOci3g?=
 =?us-ascii?Q?Fwuqeprf7A/zWC8lMd5yy0kizIRN5QhG2OJEiZ3JHqNfq45okix2+RIT9bLq?=
 =?us-ascii?Q?AHTL33HttR6axNj9xR+jo8VEQhZOJDWZROI2nVi74134ZT+SI/8X6AE3zdhB?=
 =?us-ascii?Q?RcZqgRzZuny8yQBDd1ilSjMl3rHRfyqlykFQZsOlpoh9Ai2HWbsn0R8askIJ?=
 =?us-ascii?Q?p1OusvL6/IjGZWCoFSGovLDb00tsDVfcA6nOgyI4AfUSRFdDobmdcI8gWM0g?=
 =?us-ascii?Q?z2gWeDTX/11socDCEKmR9ITRl1tGIgCik/gU8v7uYPbAGEPW0cmNMqhRQdis?=
 =?us-ascii?Q?wjelUHahYkKhla7U+SZnIrCMAkGB5+AVIXyAon5Lek+NRCZwHyczZp1cADS/?=
 =?us-ascii?Q?V1hklf+k7nqILM45U5OltsP7Ita3cwFgYkaaLRkxvUaRgCaBWV3jxYyWHMC7?=
 =?us-ascii?Q?MwXWTxFt4qBmqhijG1mPZzh2IToWtmJQI5X7QK7+xrGvLjgMXrXtRZ3ID0Ku?=
 =?us-ascii?Q?nK/YzBt4Kixx0mLTHZvVVK6mdfpprh6iOWUSum5LSU13FJs2Cw8j0H0h5QS9?=
 =?us-ascii?Q?U2cWJiIoR0VjDmDy2fzhnxqB6n8UNuQvR4sMwdvaOO11cl9swK8FAOCiZiig?=
 =?us-ascii?Q?5O2Se9b9OyxatYvjhB0ha0O3MvvFEHp/iYnsGESuf9QQoVK5WrkDhK2v3uYi?=
 =?us-ascii?Q?qjHBgay7XFfBn6aKHQ1GhZ2q8u1auiN7MyB2N2KkU8gisA1MIU/S7UPeUVWc?=
 =?us-ascii?Q?QJdb4pIV94BAaxhW8CRhtwcAM9+GVhO8ZsJLzHSUIZCkEKKZfa+gu6qMXw65?=
 =?us-ascii?Q?1Yc0GZ8xuvMApo85IdnvMT1oGrU3Rg/dc3ao9Jy110oxnWUHQXIvwTBngm8H?=
 =?us-ascii?Q?tpBNJSASW6QdQZeHx3v7Ye41xCxFS1bRrLD+UtaKhlF4DUwS3xvLp0av/Qyw?=
 =?us-ascii?Q?xhFc0EoQKn6m/UqPH3VloT63daQw+sbJAJfrmOv8m+sv76c4rcyldsvJPU7a?=
 =?us-ascii?Q?DhMyciOlSc1tyRN/YIMkeHDicd7Og8HznwMjI/KHbTbTgGfcZHNRLDeV2YLD?=
 =?us-ascii?Q?N81cxka/zTTogc1KV7HRfwZ6p0f5a6gVrbugi1jScz9Jz5Z15fr3ZYTodq2j?=
 =?us-ascii?Q?hbNemTqFgCsrx7SGYOjXMTATO0UjDrzNzrEDiZ4PLAFzU+GEYOUCEyno/RLC?=
 =?us-ascii?Q?B5P/8oRNPrk0VkZhusaMPpLUjqOpqdanjDIagmuhEthWxvPBGJMurrdEH5x2?=
 =?us-ascii?Q?Dcc7ZBrqHQOU/UahiZ/rqqDLGdveHFgYxua4hepDEvbsVBj4TnOnMeh0oh2w?=
 =?us-ascii?Q?fhjXADW7Nox0PuOsn1ZbwThqL6q06PaWjFK2/RNLT12Psfb//wxwAvAAzlFN?=
 =?us-ascii?Q?IM2kRrLfUKe6syK2sCXAVMAwDTP6ycgBaG82gCm6gqcw41uqJS+U3COhuNWe?=
 =?us-ascii?Q?4VpkY/XxY8/+u2IELRAA1B8EL1gwbmsaiLTRnSlf9Z1HxGPvDYIY0QHlwAIz?=
 =?us-ascii?Q?nJ3LczDW/rWhIqKWmIyIgeeont0gZ7HS7Bstc53ipRSedRLvQfu3x1OONuPi?=
 =?us-ascii?Q?o/hC7QHz2lDHcNcSXFSTo4uXPbhOcMsOWJcz2gtjTrU0qiBfk1qxgQCSorXJ?=
X-MS-Exchange-AntiSpam-MessageData-1: LGqTLWwi5T9GGw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f18579-2d78-44b4-2681-08df38ea1d1f
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:03:47.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtORqmHrUDdktTRDct3ClOflL+ZUNBwAUCwXfTTf5SdR5lDI651lBx5+v1szlsmTNP7Dg8n5V6cWWdKUm5aAfunQbytINiggC/M2+dlim1Ge5Qg7/LdWnikupJHCQ3+6pWQaliq5Nr0jFed43OoUng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12628

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

Add the compatible strings for the two configurations of the OpenHW
Group CVA6 application class core: the 64-bit cv64a6 and the 32-bit
cv32a6.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae67..81c3a6cf91 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -49,6 +49,8 @@ properties:
               - andestech,ax45mp
               - canaan,k210
               - nuclei,ux900
+              - openhwgroup,cv32a6
+              - openhwgroup,cv64a6
               - sifive,bullet0
               - sifive,e5
               - sifive,e7
-- 
2.43.0

