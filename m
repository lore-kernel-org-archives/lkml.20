Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13E0534467;
	Wed, 23 Sep 2026 20:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790193807; cv=fail; b=k9OrWuraQJLL3JW2oShz7Y4Kz6J3bBITcP7NoywHYMhVIFTBQBj2cz4Nu71UOe//dYGO5dn7YIdbgaaFioZtW2bor5oRyuLLriAnpmoVR673GkqvCE1yu35Q34yUX8Ri1UMUhJuqjBL/z2aPxBQI+8ImiZBJBjJ+IeB9QduVCcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790193807; c=relaxed/simple;
	bh=jKEPk8dXK4MhUOEfL1kQsWmiscrBtRtXd+O2mvKVHvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GrXvh9a4eqYqcG2mulT4AJi4oL48V+qxsHgwew2g11R0KG3qEazzh329e5/i0OZzYsRxqqLpJE5Mwx83A1Zx+SGlpVbc/HQTU0TWQepwj7dw6B0VD9Zqvmq6b7Ea8QZ1kIZcZ/lRwEH1kWA5iljhpWUvXUH0ZhuDS8+BqR1jELQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=n7qrsDh9; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="n7qrsDh9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2RFZ9g0kJ/pDRKYNsN6a2Av303sYnGn+JSsnJznJhcXg2/GEQ3bqS4vVU1V3PeNuAy+tFFjiCEs4zRw4Cj7pSD9SNAz/gJ+n2BogU/p3Uu/ZxvjO54u/6vyf0t/2qd3DFtzK6/Wxva2i/mhDe5tPa7AT3s2/xEK5ctj/AN6sjOp4Rp/YRTj4PkfBxwkY4a5/oBXXkQ7GY1pZQIT5GALCQhSWSkw5pwa+ZDmUC6uifoXDtOs04tq54jlY99q8v4LpGY2ZVszex7QNNSFdQUdw8IrZImuP3LVoIvHYFU4rWXrKWUbjZIYDOLrqHu9P/J85artCqWU4tVTat+o4JsjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXZhqHFAIP+vAX3SalmPffrn9g6fV29+zNH2ePH2L+Y=;
 b=DR3+RfOxvxvMdksTwgDckAbcGe8Ukgs7qCUSVPL9TH2gZ2UlRQjkDt2hn1fiH4kHJgcsBkOC/WhJKx7olR4ZZVR3CTUNOA27PgqH5OxfgBZFGgSgzG9UXqVeh2iJfQC97RDJis1RRNu1aoQ5qZERkaUrEFMRe6c7z2nHv7xfqqzj5Ya9nJuDGZP4nk206UabW1Qhp4IH0rI65mGm/+EbrWQlZ1Fzsnmu0oZohHvTNNGDUclvPnTJPw0nYXYeb2lBkeX18FzZLdEmXoadxQ6VQ/3iPKg23uZsORkSkNmtkuclDMxFj6zRI4oLiqW/oEOrOdoxLsOsO18KDfh6Ws458g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXZhqHFAIP+vAX3SalmPffrn9g6fV29+zNH2ePH2L+Y=;
 b=n7qrsDh9uCUf3yhQL4oQC8FbcT5Dg2KDR3S9re0NoWsXF2u8qC37zwNpW6Yh92Q1pzfv+CAGlGhK4TTtP4sWz59Bp14YLEf7LF3DS6iSBRDHw2j3PMpivVTRvgXch66KoKwLiUQDMIt5fh/bI2kOFjd9yth2tTROOzfjU8raxwPZ17zmk203XFi1YD3H63osa+q5iDmDfYCHnUcdCruq48pw5X+Q8hTW7Ohp38w0mqyFJjTZxsxz8cnZpWDPB3u79e8RasU8LwGDCCwlou561hkt6KhonXT5H0q4zriGdRhu+VyyH3GRtiQqOV43oGicFIV1TJVZungof/Yio4E4ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10715.eurprd04.prod.outlook.com (2603:10a6:800:277::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 20:03:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 20:03:21 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vincent Jardin <vjardin@free.fr>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/3] arm64: dts: freescale: add Free Mobile Nodebox v3 CPU Module (LX2160A)
Date: Wed, 23 Sep 2026 16:03:13 -0400
Message-ID: <179019378816.3736505.5120424228796941617.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914-for-upstream-nbxv3-dts-v7-0-373a142b08d5@free.fr>
References: <20260914-for-upstream-nbxv3-dts-v7-0-373a142b08d5@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR16CA0015.namprd16.prod.outlook.com
 (2603:10b6:930:10::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10715:EE_
X-MS-Office365-Filtering-Correlation-Id: 468b02e6-65cf-49ad-88a7-08df19adb77e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|19092799006|11063799006|3023799007|10067099003|56012099006|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	J5kvH5ExZmD4VlQNgJTm3y574CHrTTWCUlSpIAbBtS7a6qt50Wvp/LIOEJs0v3aLK/Xw+E6VSLBFK9WY6BDEU9a0PqQJpELGmeZyyVsX2XffUlIl3gl64zs8H86qGHp7vSN4B49L0SBul6ttsTEAB0nU/3bYS2OQWoyrI4r9DW7yzOQIYRksoG1Xw/4XQvgDhrcTibEF4WLeQTBCTjmeSWJA7H/Lq1ZA6EutoShhrI6jeXeX1IuM3EYRv0R+1OnfUZR+eGssr5FXwDj/NROshW3pSOnZOGRiHmbREYdik4IIrCfDJ64AHDTTTGtGr5ldpvxRNQWPHgP5njVnDHcs43usPOiJHwTT3bPKFGy/nZuP5xp7NK8dVOA3rPDCE2sHr43U1jT0wEQu69hUs9jXXxcvyxxl2OBBng5nj+WPrpPZFrF5jIoIDNJnjjt17+1jQ3WO8WK1qMbAr5yAIERfKOpOZua+7xM3Bx9lGd/k1u1+7DaBbINjXaBV5ArTj9dbuDYBQMW4j+JUWf31QAsy3tmwZ9gXnQjEstd9v1jIRrKuUYSmHHHhydvlUKO2UvjaeFQh35dHq43okHcT5oGS9RpD8BEkjIhlAArvtURLxAkACUbPGhG9ndUHOskDn26g4ST6PkrazJQzTa9mygnyACIwFCxdnX7uMgQ86i9ZBpMWdhMWVw6ongciA7G6RVuqYik/+r6Pxg+de21flqhN5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(19092799006)(11063799006)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFltdkl0SUxMMXI1UmpZS3Q1R3VyOVN6NEZXMklWY3NlTXN0SmtzelZUKzJS?=
 =?utf-8?B?aktMTXZNenlNMFloNkVTOG5kOEYwOTF0anh6NXNqSE9QRGp0bW5haFZNbWZI?=
 =?utf-8?B?NFB5eWhRNVNRYUVlczdEVTJIMzUrT3ZwaDNjaXBpTXJ3T2RJN25uZ0syWWFj?=
 =?utf-8?B?OWprSXVwbVZNM3RnODVPTWdYMDJyaVVHemhUSzRBcXdEdVJsSzlkWllTcys4?=
 =?utf-8?B?R29NbTE5QzhMTCs5RlR4VWtLK2lzK2ZBbVd4alV2eDhSQ1lUcDRyY2hvVlNu?=
 =?utf-8?B?dGc3TjV5bGQvVW9majQrMTNXQk5QOFJibnZaZjZyTnBud1RqY05hZWJNUEdJ?=
 =?utf-8?B?bXR1NHlCMEpGS1lZem0vc0dZaEFjQXBIaTQ4T3lCdVBVMEtMSW5UaDZqL0o0?=
 =?utf-8?B?OEU3aEk2WjdKN292ZWdCRFI2UnJYSWhoQzlTMVAxVHR5bnpMRjdkVktTRy90?=
 =?utf-8?B?WWJ4ck55STVQeVRpSFFTVitMMW5saXlCSG95VHc4SHhIWE5LbmFQd3hOMGEw?=
 =?utf-8?B?OHd5QjZWY2hyUTl1NVB4cFArZnNoV09tREg4eWc0RWt6QzFocWs1a3BlZklW?=
 =?utf-8?B?NWh3M2ZWcllHdzhCVHpEVTN0QXZROE8wc3RpTGVjSHJtcDFwdzhBcUdHNXUr?=
 =?utf-8?B?cEdNbU1WM2ZhWW5NNTFIN1l1TTM0TUw1TTNLZzllRFBXYXN5cGs2dE5Xd1JQ?=
 =?utf-8?B?eE5yRW4xcEFRL0pmR3BRTjhFaGlhVGlSVG1JRWxuTmJkYndGRituM2E1eFBk?=
 =?utf-8?B?c2VVNjI0Q2lRWVpRTFVQRkdrMG9kNk43aVJCNzAwRGYwdkVqWXJQTi83Vmpk?=
 =?utf-8?B?SE5OWnpOdk5FUndPSitaSU9sM044YmR1VG5XMVQvNnhNV2l0L3JnemduaDNk?=
 =?utf-8?B?ckxBNytDcDUzaEM0ZDI2THYrU0lqSW5HNEFnUUREZVM5VVg4OEdxTHNRY1l4?=
 =?utf-8?B?cklIbkJCK3ptSlRRQlNGN1NNaXpBSjNUZ0FlQjhDTTFqb1Vic3RzUFpsZDJr?=
 =?utf-8?B?UlV4UTQxbkp2TmRxYVBhVjlvQmUyQVhvME5YNm9iYWIybHBMLzhiWFR3TDNy?=
 =?utf-8?B?NGNFYVo5STZYMStJM2U4QmVaV3JYL1ZyZks0eEhmQUlzZDVjbi9qK1ZTcnQr?=
 =?utf-8?B?L0V0d3lpWi9WRjRPYnFMdWJsdzJpRFpSbDRBS3RwVGFQUTY4MTZYaGtEUlc5?=
 =?utf-8?B?ZVVETmhOelFYL1ptNkFjeGp1ZXJlOW42MG5zeVNzUENvbUVKRFJ0alhGNHFO?=
 =?utf-8?B?U1laUVBDK0RGbDdRb0xkMzMvamVhY0lIaG43MkdFcFNReUFHNXdhU2JVSzBy?=
 =?utf-8?B?YTF5SkpOaktBVERXNjFoV29QbktQSE9jMWtCZU91eDZiNURnQkNTaGd6ZzJT?=
 =?utf-8?B?dmhxUXFHMktTL2NHZDIvbkZtUFN6NDVxcUNqTTk0VXN0RGJrZWlLWE5ONDhS?=
 =?utf-8?B?Szd0SFlPKzY2Nm56OVZ4b2ZGdFp4OUhzVjlhUDVCZk1SMTRHWGJDY094LzRo?=
 =?utf-8?B?a2NRSGVRd0tRamduV0pFbU9neGVmSlZxLzNrenlBRzFjUStXN1MwU0RveE1S?=
 =?utf-8?B?eHlrWHJQZXJUeC9XQmRlUmdjWmxsZEc4VHNCUDhmWmVYaWJSVkFLeEpjakJ6?=
 =?utf-8?B?bnAxVS90YktDZmt3RTYyY29RZWxWUTZlQWpFOHB3T3crbXJudk9uOU9zM0Uw?=
 =?utf-8?B?NGpHZ1BtbVFCbEpkQXJGeDlHWnhkaFNMRkpObVQvWXNQYVA2Q05HQnQwVUJH?=
 =?utf-8?B?SzZUVGtjazMvdHdKOWdwbnJRZ2hRRzBOOG1EZm4xRGtjMGNDQjBBejFqckFO?=
 =?utf-8?B?U2lqNWhQM2lpQ0xIcXdPZTVnVFpXV0tCU21LNnQwYTBjZVhkL1pnOXFvcFhH?=
 =?utf-8?B?dDk2K3lCck1zV05yU1BlTzk4QTNWeG9oWngyVGNVSFF4c2NSSktjbmFDZWs5?=
 =?utf-8?B?TnI3KytZNXFSWEljSktxRHAvbEJKRDVJSnEzYm1ITSs5eStKai9KUE80L2Rh?=
 =?utf-8?B?ZTNMdHBjaEppVWRaTXAvTTNITWUwMjRGelE3NjhRc0cxRjROZ25NaWpPU2ti?=
 =?utf-8?B?TVUzcDREU2lWMnRSYnBLK1RvTHlrWHNES3FMT3o1U2RZOXZzcXdCeHVDK3lj?=
 =?utf-8?B?TUc3bGtmdnZIYUZTWVVKYkE1T0VrVU5uVmZTUVdhbzhQLzNjR3hRZVBxc0Vz?=
 =?utf-8?B?aU5yZzR2TG5td2ExNFk5cXp2V08vbjBGeUwya0V4TFdmSGkrVkZqWDVETk5K?=
 =?utf-8?B?NE5SVXpUQmFuaDhCRThMNkFxRWlBSXNWcnVLdzNBUU5VMEJQWFdBdjJJNHZt?=
 =?utf-8?B?c01vMlV4cHVPdWREYlZDTFdRV0hQaDhyVmI4RklyV1Y1a3ZYN2RQSlkrOXhT?=
 =?utf-8?Q?bjBx4Oe/1MZrUQERNSHt41/QNS7DZmbJmqEB5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468b02e6-65cf-49ad-88a7-08df19adb77e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:03:21.0150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQA+Wf9cY/HBcn+x4uWsipKtqAjDNT1sjY3+KrDNJhM5tNtUVMvrs0auLurcviupXOQngCczgKHqiET5dLfZU/YfaX9pYGvaSCAXRgXAQK8dHGxzIK2knVCu2jUPaBas
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10715

From: Frank Li <Frank.Li@nxp.com>


On Mon, 14 Sep 2026 23:01:33 +0200, Vincent Jardin wrote:
> The Nodebox v3 is a Free Mobile CPU module built around the NXP LX2160A
> (16x Cortex-A72, DPAA2).
> 
> The same fsl-lx2160a-nbxv3.dtsi shall be used verbatim by the
> U-Boot port, sent in parallel to the U-Boot list, so the two trees
> cannot drift.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: add Free Mobile
      commit: aa906abf611c7f37c0fe9171c1d33c40270aa5fe
[2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3 CPU Module
      commit: bd4912cb2e063f9b574732144fdc601043281281
[3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
      commit: 565b6713a460126874d15654fe24d995a57c822b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
