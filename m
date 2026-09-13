Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021101.outbound.protection.outlook.com [40.107.130.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFC43E7173;
	Sun, 13 Sep 2026 11:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789299648; cv=fail; b=epFEF00HMKrWYr8bE67QIq7kaWwRJhnIzwd5VIdTpbMK2UwzCQDJUx7iE7XJDBBAMvBofWZ3q147g83G+NAlKHLGc3NUrE3yazrhppK3v/2O6LPLfKTr018qf2oXwgki2c3omO8QOtmC4R+e/Fqcx/5O+HtOXJJupsalxcGVLDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789299648; c=relaxed/simple;
	bh=yntPL8liEZ16G9/FY3FFL2qwPPSch5KB4xr7SU65mQI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RVPT7KQef5arJiTe3XiOnGN3ud08DmtSRm9USEU6Ir50wXZZTUM9wytxe1DRj2UExcu5sXpAq2xSgaMg2AHvaU8X0/EIjREcQftXe7wIbrw/zCwRcsvadUQmuJKEoUAhQPu7t0tuetrTRpY8DCZCu0to1KhAkn3DmBZrOgJVDjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=ZS/cL+Hk; arc=fail smtp.client-ip=40.107.130.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="ZS/cL+Hk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUYt6+Is35E1sySm/nGiVNK8ugypStKx6IDKSii0lkM2waexGBLA5orOpsbwIZggLRdVA6wYaH+d2PUbsEiD1gFmEG5Z3Gcz7xlSK84mIHMAasPG3enNH8U6KPuHiVIFTw5+3gI5k08Da5YTfqoKWKUVO/70tVO2O6dJWWgWMNsdd7wXMV99TSSELvrOuz7DU5Iet0mk0lXY0T71n4nv8cf/BiDS24pbCzIJG1M5IJwoMyKf3RbQUqcvKY0QLK2n2p3jBG+c9/t2k6NHNJQPw4FxVRFCdeVdq00FVCx5erkxtG8K/QnH42o0yipvV7/Zgz+jZhUglViz0TE4ebfmNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7yVOjxZG6qBRomblvj79qC0Ze4AIospn4V2UXGQufA=;
 b=fn/a9roDgwE0DsMj6gQPpAdVBU8RtncXaUW8p2eq+Zv2y65dl62Z5WRPqdkSQakBBk7mh8JdML20VRTOxTfydM6N7t09p4i6JR1d1DO4oIMS8SkI409mCpudUQ7GDJBbZ8k2e6Ov7ZPh9s1QNmmZniOXv/59MN5wEP8jkfp1GPy3Xg96sbaa4ZPsm3OScgNr2/njh8XjmUGaFouJZfsoKs9+Qs0xyqHNwrdeDaBY1DP56X9qCrAEyrIQiryywf7/9RQQfdFCe7MdpmzFntiqDVOSE5j7xTi/ox2dRmXec5jN3ejh/pHe73P0yPlf/eVITtl2gwPN2uSjBcylKuu8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7yVOjxZG6qBRomblvj79qC0Ze4AIospn4V2UXGQufA=;
 b=ZS/cL+HkDHVRLiTQxIsOCYwdmf38g91Qlfegy1CHtsNq54kC3oVyswZ23ilsOEC20QM8mpgAkqsDMiSSeIhhox4X4rKoheN5CuKZ93cUoKO0RXBoRyffvq723P84j8HJJgb0s+GmKCLVmxQ2Bj9aMgjPPPaSMgXJQ6Yijk6AAdFguBQatgeNeUZ5BXG2kVF94JzqPjfiwj68e7JLNZIAwXTYZ8rOR5uRSqTPQoAyB0qLcbMFhhGvTkIsqS9yFykGzn5IUf8vr3InVsnqnqeRqgqpLYue/ISTVfDRKn8Jupg4VL02Ljq2VMP8k2bAdcC9HRHidNoubKd2836wqDNjWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by DB9PR06MB8957.eurprd06.prod.outlook.com (2603:10a6:10:4c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 11:40:26 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 11:40:26 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Sun, 13 Sep 2026 11:40:18 +0000
Subject: [PATCH 3/3] regulator: mpq4210: Drop the mod_devicetable.h include
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260913-mpq4210-ohms-fixup-v1-3-dcff627001ff@vaisala.com>
References: <20260913-mpq4210-ohms-fixup-v1-0-dcff627001ff@vaisala.com>
In-Reply-To: <20260913-mpq4210-ohms-fixup-v1-0-dcff627001ff@vaisala.com>
To: Saravanan Sekar <sravanhome@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789299624; l=942;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=yntPL8liEZ16G9/FY3FFL2qwPPSch5KB4xr7SU65mQI=;
 b=d2Wa/PZMye90iGlSEtRYM9v7/UTKItMEwfKO50ucp6CLenmDI0HMgyNReYN6TIwfyToY1W6DP
 92/FZisc/LbC5fmX9s1lLZ2mZg7UStjf3bdKEyVoza7XCeK91N9ecJ9
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV3PEPF0001DC2D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::10b) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|DB9PR06MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: 9058a1de-a8ad-4150-6fff-08df118bce34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|10067099003|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	oOldVsMNNrj74kmNn9c6Wewpt6mGZLL0gNUHOBDJlIo2okRbyraBiyvBb7VRjr9t3yBS6SGZYbAFMMLDNaPEW7CZ2lO/cvIP/uopC0WzRyoWZlzjlY++aDZDPYHKS9om6OJdQtc6MfKU4gcSx5RdmkOlYEk4awaPGpFpXlat3M9Agifp5JNgQ3x94+0z+TD3e0bzVJFWopsh569BHRTYgaNnhE0flaLdvEo9sJHdBGz08cgl551Uv8dRfbkaSVeTkFHvL4I4th+/R8UPBgtrr5wRbrhn+iInIja9bXO3ev/WvKv75kT7ZHOAv2bICyjKjUt385TomlnU+vtBZPe3zNqrnlt9Yx1Cn0/w8rRh+Q1xkgIpsCMlkb8khhdvM5dlR9Re7Ez+Z5mq+G4ZRnUTrPvR03s23cK9XHMDSfPJCbWPmJmY16IXY4YvGR1wO/ob7OXF1pHah8r4dViv5QVuxIiPelPM3tZkzqhOd5kXIoq4HRTCl0OcevTuEbNwH53d4M1Lmg8SM6oszvkI72RVT4SG6tTor3hu1Yq63OT9/kwfOqc8r+CbhAym82uS84ReR/7wtLhqocrgfnZAbcGG5P42PKUPr6mSXcADLg6jzHfpm6y9KEF/MDUUmvYZ7kGIErrGf87acLmpJyw0/qB+xzPL5cPVqwpAXynoQlkTW0NW757aic7FLBE6u1x04/d3FQyE3SZtqIANlF2Q68XnnD+4FP9w8PmqFgtKQw0Ujxs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVdyVHBjYlEreEJlV3YrNDNBM2N2UzVXZHVMMHJ1Y1pzOTZUS2VEemNwV3da?=
 =?utf-8?B?S2t0dnBRRU4xMFBsTHdyR3JvWjAzU2pHZW5xOTJ6b0N5Y2ljVlpCVnUvTWVl?=
 =?utf-8?B?bHFlUHNvZTBtc2JramRjem41WUMwQ0FmWHl5ZDlyOHQ5UmxjbFI4T1UyYmlD?=
 =?utf-8?B?c0hPUnpFMUh0blJQald3d0wwSEQ2clpPWU1LNFRQUU14emJwcUF3T1cxakx0?=
 =?utf-8?B?K2hoR3lOQmdhYzFmQSt3OHJJaXh1cGhXVUd4aXpiL0QyQ2pwT2o1d05rTkFM?=
 =?utf-8?B?RDhINW5TOVlUZm9nUU0xOHg4VERIcFA2TDFzRExwRjJKNVBKUUZGZkV5RjJN?=
 =?utf-8?B?WHJKNURmaDJEckdUWW1ZTkFsRG9hWXMwOUpISHpTTVd4L2xRVE1sSFVUbUtR?=
 =?utf-8?B?cDlKWkpHVzZ0VExadmxVL25sdWNnWW9wc0VMdFU2Tm95UXkwWUpBVkZDSVlj?=
 =?utf-8?B?cDZobGVIQXdTRzhQWXpOQ0Q2L0x2S2FiLzBkOWtpTUk5WVlwdi9TNHRBSHFV?=
 =?utf-8?B?SUpSKy8zU28wNUdyT21VdGhIZG0wZ3puUVQ5N1hhcnFUbUZWcjZHbk9oSFpt?=
 =?utf-8?B?NTZTL0tDVHJPSkwrenAwdFNyMnRaMTloK2c4cVVWcXJJc1BZY3hycHBKQkNk?=
 =?utf-8?B?aHVKSW1LaVo3MDV4WThKRkkrNnM4cmlvaHBWNGRSdWpzQUoxU1QrU3U1VnBF?=
 =?utf-8?B?eXorUld3MVBCeW52Ym52VGJEU2lOaGluSmVYSEt1ZFljeEtjb2dieFQ1YnJn?=
 =?utf-8?B?eHVPN0tkMWFVSHFrT21uTFNKVzVNZmtkdEgrZG5QZkc3SFViUTdoSFBHZ01X?=
 =?utf-8?B?TDFGS0FiTFdJRmMxZTlJaFhaaE9Bc3NRRnF1WS9QblMxSVB2QjArckRpOE1r?=
 =?utf-8?B?djcwNTM1UzRsV0JPVy9OMlM4eklxWDllZGtjU1RnZHRtaEpoVERSNnVOOTBj?=
 =?utf-8?B?Ri8zZzBjYUk0MTZpZWo5NGI0eGZJU1cyeGZnRjY0TVk2bWR5T1NuNktueWJu?=
 =?utf-8?B?RnNlbCt0WWNWYm90WDRBZXpZOGE4WGFvMUFDWEFDdU9GajUvZ0Y5YUt3OFRS?=
 =?utf-8?B?WGhOdm5OSUJCOUJMMjdzbTduT0VGYjllR1JBQmQxRGR0VVBqKytETmFWRVls?=
 =?utf-8?B?V1F1TS9HaWVJd2pLWkdNTy9taTQzUlJmUHNiRDhWb2RGWE9lVDg4cmJkemkw?=
 =?utf-8?B?ckNnRjlScSsvLzhQaVYyakt1Q0RHWXRLaStkdXc4VkhUWVB5ZW51SU0xeGcy?=
 =?utf-8?B?S3IrU2crVGxkK2loRkR0VVZzdUxUR0hMRm5CYU56NnJhQndwcWg0ektnZ0VW?=
 =?utf-8?B?cG1ZUlVzS0ZCOVgySlhrRmJMNFQ0RTdyblpyYWJpVmhXNFpEUU5ES1kzMUY5?=
 =?utf-8?B?L2twMUxPY2FLNDJHYTBjTDBHRWZZcFNTM0dlZFhOQXp1UTdwWDNaR3Uvd0pE?=
 =?utf-8?B?bHhHejN6d2JpSUJsSHpQRTlwOGN1ZCtQVU12N05ieW5NcU43RjB3bW1qSXM4?=
 =?utf-8?B?VXFyRVp2SXBhbGtjZ21BNm1LSTJtZTg2RWxjVTBCbUMyVnRFaGdVYzFmZDdn?=
 =?utf-8?B?ZTVsQkRraXlUdHZPZFVoZkJjS2xZeE1NdklHeGM4N01KN2pHYTdQaXFGUEFD?=
 =?utf-8?B?enZyelNvbmhCVjNMRDhFSEMxTDBzNi94dzJCQkw5Rm9kaW1HY2ZaQndPZUJs?=
 =?utf-8?B?WG83ZjJ5YW5KdzcvYnIzdkRpc1lZSzNacG16aTljUldjNlFjd2tpZVBpMFZr?=
 =?utf-8?B?MzBzNE5XM1lZcWk3NEtGQmhRZ1J1Q2VjSXJlT2cwMk1JZGxsOHIvMHErT2RW?=
 =?utf-8?B?VE9LeHBsZUNpUzM0eU5nWEVMTnErcnJFNGZFVjR0THhBTXErck96SVJpNkVE?=
 =?utf-8?B?MVp0bGN3Tk8rYmNPcUdlN3ZHYnNBMDZLRDNmOUxXM0N0RG1mM21mUVdXTysy?=
 =?utf-8?B?c2xHOXZsQUIxaTlMZzl6NkhmRXk5aXYvdUxCY3lZNzhlaFlqQmJIZkRvMFFY?=
 =?utf-8?B?ekMvN1hvR3kvL2JoZjFVelROb0hPN0tjYi8rcDFGNWZ1azdsMUtOUVp0ZWdr?=
 =?utf-8?B?WXdTOGF0WGJSblpJcGE1SHh4SGJNTjRwR2haN3AyOTUvQlVXMWVhMGUySjhM?=
 =?utf-8?B?WWNzVjlzT1BBL0N4ZkhOSTFNWDZmUmg2eUtJNForYmRrMVg1UFVGRTRnUlBJ?=
 =?utf-8?B?V3hZd3FKNmlIQ2IyVVpjODRacEgzcHFGQXVFb0cvek03c3V2am1ZR3pFRmNU?=
 =?utf-8?B?c0tJY3Zod29zWkpQV3RCVXoyNUlXcGlIaFlQOE43Z3drd3QxRXZtOG93clV2?=
 =?utf-8?B?VTEveFR0bFZlczNzV2pnTi9Qc1ZUMDB2RUVYM3A2SU9TMHBlenpPOEtPeitN?=
 =?utf-8?Q?4XoW8WxqZSkyzbcA=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9058a1de-a8ad-4150-6fff-08df118bce34
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 11:40:26.8327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5d8NRHdfEMMkWbIBbbdPt6ozXjVpb5RvaUVRgbm7o5dJCNP0fkeGKgwyBUt/cOC7nXPCwE0nK1C4IOXnxM1e++cJi1RcTQ62S3TLA1ekI0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8957

<linux/mod_devicetable.h> is meant to go away, and this driver does not
need it: <linux/i2c.h> already supplies struct i2c_device_id and
<linux/of.h> struct of_device_id, and both are included already.

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Link: https://lore.kernel.org/r/aqRMb8q7BT3uZ9iF@monoceros
Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
 drivers/regulator/mpq4210.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/mpq4210.c b/drivers/regulator/mpq4210.c
index 315f8e02ff2a117e37b32f8a128c9e0feacfac74..293e7b209a987af133230fa2eb7eab826482b101 100644
--- a/drivers/regulator/mpq4210.c
+++ b/drivers/regulator/mpq4210.c
@@ -10,7 +10,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/math.h>
-#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regmap.h>

-- 
2.47.3

