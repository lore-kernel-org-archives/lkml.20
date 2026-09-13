Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021101.outbound.protection.outlook.com [40.107.130.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5873E4115;
	Sun, 13 Sep 2026 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789299641; cv=fail; b=bjGCQ7a/dWJipnjMjuo8LiODzCu+xBn7OzfSQh7dW8D8J7d3HClOye09oo7iiA/Od7YYZGL2u8q+uD6mRaa2LApfgZ6r8IPdI5mSXKi3SvMdR2G5jo+0UGlAX+Qp7AzcKaIQzkhkualPWKxvyVHcko0yXRuYvD/JBnFG4LRv/KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789299641; c=relaxed/simple;
	bh=1bphk6S26W2F0AtEV3FAtS/gIVA1HYq8ZOsQR5XsC0M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fK/MWwOQaRY+knjKGX+x3FQxWe/PkZtK9piaIVDLowsFJeTdEYw21e2y1tJRl6IeaitSODNEQRZKiqyTRoTE2wm3RDS89ICMGg20twJMCpBGdwHrhux+KJ7BjYr5ar89vyixLisIMOo7dsrCvcMIllnrzqZk7MA7OoR284ul4pM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=TBPNxEgU; arc=fail smtp.client-ip=40.107.130.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="TBPNxEgU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwScRTw3uIhb1/fvsQsefviTLFW24D9FqZ1YV4fGZsmpH/kvSxFHbK95QQbAi67tCbjuoqtWSYH3Xl+sQcytheT9AipXLjavtYsJbAvIbTYiarg1fK/K+gagCI4O2oHFlmqfaYcgruaiHYwr7djGAwQqDFAUjzspKvQfYOdQYdkhMjIgR07RdqR6ePa6CG7XFtvB0gpwJDsfXmog67QQ2+31ZoOw/af+2k1km6nTfEftqwVQsr4Dh0a4EbMjlP9yG357QV+MZNV7dDSviNCgwlyBHEairfLtw/DYkPnhOaFyxJjpxUgCgZXbuCGh4HHNGJEc38AaGVNjzlD5SLikiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoNyVykxoHnQYQP9G3MZQsKunz31ABBaw3xDleoh+Hc=;
 b=lvTABY7vIfuvEfcNm/2e56f6NFu2eOYfIjx6BueKCAErlt8QEsnB2LIFSl3u9iRlFdDjQsM+Cd+UDCb39xP8a+Lv0aM7HsidplOo1CeQQS2hojoVcnG/MvpQfNRuxsjcCJQWuwwWYxhxAxNT4s69b2IQDR4hFayYDG9knVfNcclF4mo42sNv3aBjgAYpayeulW/Rz2lJBEOU1A4PGOYdiVgvbxB+lrn2zu4PXcAVo2BQKZG5C8DaKLgK0lzOdTPiwk7aLqn/a072wfsJa8PeCP/Ny5Cz1rsvIlEv4LIHz4AH95h+NlmlQ3ooc9E9g9hKYhy7K55CVp8egl2jdzhoEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoNyVykxoHnQYQP9G3MZQsKunz31ABBaw3xDleoh+Hc=;
 b=TBPNxEgUPNG9XZjquCDitVNHvdOOX+zIg7o0sBkIYl8T3A//H3pKBw8EzIVXUqctH3JGi4GaSjvTfvgRkSzBScESo9QxRF8InqHKlzd11Nc2c1ab9Na+8+EbGzMZlQ6QwHCCdq1aICFgxhCwwbwXygQ/3DUZ6G85hhxTI0pj4zBl+zA8PbJhh0WspfB6HShYlztdgae8GiZgYEwgopVJkUB4Jx0JlCdxriJ774gHDf0YJWMSnEXgHy1kc9ZupSIkLgrnkd3j67OznhbJ2VCd2vXGaKJD2Ll7prn/xE+L4gp5Tem60mKFY8mcUZg9YKx4IUQsQ57Qt21r4ZdlkSTuNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by DB9PR06MB8957.eurprd06.prod.outlook.com (2603:10a6:10:4c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 11:40:25 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 11:40:25 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Sun, 13 Sep 2026 11:40:16 +0000
Subject: [PATCH 1/3] regulator: dt-bindings: mps,mpq4210: Use the -ohms
 unit suffix
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-mpq4210-ohms-fixup-v1-1-dcff627001ff@vaisala.com>
References: <20260913-mpq4210-ohms-fixup-v1-0-dcff627001ff@vaisala.com>
In-Reply-To: <20260913-mpq4210-ohms-fixup-v1-0-dcff627001ff@vaisala.com>
To: Saravanan Sekar <sravanhome@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789299624; l=2588;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=1bphk6S26W2F0AtEV3FAtS/gIVA1HYq8ZOsQR5XsC0M=;
 b=vWb1kgmdevMRKqnnIF/F+Q/buS0lZt2sJ3wjtD+SOCyWr023KA+6tZW6HC4J0UGC0PnaTsmB9
 fnrZPjpDPleCGa79WBhKcuK/YGPWfYbh9QgSJ/P3xNafjSfRPHd2bRK
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
X-MS-Office365-Filtering-Correlation-Id: 84e29143-0a6d-46de-488d-08df118bcd5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|52116014|10067099003|3023799007|18002099003|22082099003|56012099006|5023799004|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	uBGqR5YTUyTdqQgiAzG3y3AY53gmyMi1WJsGM7mc/dHZDQ5cfoDqN+V0dmcVbNFBzXMPtP1JAwAd1BWx6PctndBH4sAblyTSU+0v5glsEiCr0jGJBFdlJJF1hdA3EwfbY74zRVBZ16X6Lt/lsuoZPdy5PGlTFeH/xtU/LADzyHXjyoEugvw3GXkC8ahjsHGDMhc5OJ6Iv2PIS/NFMlv8btgR06kOxJPRB0laYE8SaqcCNaWd10FnYlpxMEofu1iurmYfy+ARnysVxeDpQL0Bvh4x09ti6SSENsOQyEH1EycvHRxBrpAhiBjIdW31uy/muLscWUVlM7wiBNpPQ9SOkTq3akRxVEOd3asHfLQ9tIifE1VDBiGG1dGMuZ6CoSsRrbQbR7FrPiThnsJVmDGNUVSXm4DUrNaKGaaa1yQU2kNV0rMhyhl2mYLMHWP3MN6o2kOXBUXJ5q/oE4VAl5C+yFeSETax1lHzT2/6bI6QhxfdJX+JoPMkdbXYyBBsJp/sFwhdGGIjsDYbwnOwz5fH3xYksriO7vcmJ4n0c11ZGMQ8RP676dPcaMmT0KfopobT0HTCvFM6w59BsNajI9wrkM3Cm9g20vGfcHYofTRYvSAXXYixNEr9iFMVIASBOQ+0hjIHLmxa7eCJ9N1bs0NQ7M8WICZow3+y9erRNiiBaJlTNdUa0Scrx0KywnpaHvWU+cjEbV77x3nQr4JNmL/uCd9SRP/XnPYGF0zrtrXDvB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(52116014)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG1ScW0zalJrZG9ocHhkZlkwc1NhSnBZbjNycGE4V0pIM081aDRBSTZVeENu?=
 =?utf-8?B?ZXIwdGpXRW5OYUtpTmNTRXhKMkFScWtwTEdMT3IwM3IwMUcyQlh6ZFBGZUor?=
 =?utf-8?B?N1hZbmc4cnlWd09tTDQzc1pPRjduN01Rdm1BdXY0MXVtUHFrcFMvbVd2WFdx?=
 =?utf-8?B?QXhuOWR3RDgrSEh0cjZsZTZ2cjNqNGluVElnQS9uRXNrQVFqekFCdzZ3cDhX?=
 =?utf-8?B?QzJpdjBUSDFIdXRDQVpuYU1QbW53RENYM25uSXJUeTBQcm9LdlpJWjg4TzJl?=
 =?utf-8?B?dzhRaDJ0dktlUGtTNnVVclN4UmZXNENnTHNIaGd4VjV5Q1RSc3ZGZW5KMkdH?=
 =?utf-8?B?RkVpRkFPeDVPRVBwNUhQR3RVY2FUc2JQUkJqMTM4RUdTVmFFVjNQNVU2M3dP?=
 =?utf-8?B?aUh5SXdWWHo3aXU1MHBEd3VoaTJ0OXhaU0JyRGNYT0x1MFpRTVdzMTM1VllU?=
 =?utf-8?B?MWtaaWJWU0lmY3dLREhya29LbDFoSUx5c1lUOVhLdSt0RlVickFYRUNGT2hr?=
 =?utf-8?B?ditJdy95ajVFOWhHQkErVStJSzF5Vk9mMG9LVUhSci8wM1NuUXlQNFc3cGtG?=
 =?utf-8?B?N1lkZlhxTlQ2YXU2UmU0NTNqb3dGL0twekJvKzRPaFFZYkZIZGhlVk5tcnJV?=
 =?utf-8?B?cjN1SURjS0ZKcGFLRVVuMmJ2RXZhNEJjdDJoT2swSEt1Q2l4Zm9tMmJuc0RB?=
 =?utf-8?B?NGJCdk9rSmNQRTBWYnpMMmRtTkpGMFltbWI3bGIyWDdQM2tITXpoSWJNTGRa?=
 =?utf-8?B?ZnZEeFhLaCtxN2s2UTQvY2hGRWhMdXZ6RzNrWnN5dTBaZTJVTDNIWkZYR2w3?=
 =?utf-8?B?RHRaT0tld2hBQmg4N0o4NUZueHRORWE4d3VLelhhcHJNMDdrQ2duQ0Y2MENY?=
 =?utf-8?B?WTZkTkVQcldXTlBra0lqODBQUG5qQTNkZDhzYkR2VXkvRDRxOVY3WUlMMnN0?=
 =?utf-8?B?Nk5oRUFRRzNOREZ2ODFVREJxYjI1WklMZHA4Y1V6M2VRUDF5SksrZjZqNXBa?=
 =?utf-8?B?Z2dTUUVoRzFTQ0tkVXVLQTZVZUVGL0VnS0VQRkU3VGJ1VGFaREJHbjRkNkJX?=
 =?utf-8?B?VXhMQit1RldEWDB4dG1PRW1Rb2NDU0VxUXpGN1hHZW9EMTNsZ1B0M3dXOXpl?=
 =?utf-8?B?Y0xJV3A3UTVodTFnU1RQUkhEQ1ZvQ1VtdTVVQUlleEp3a09SdjBZZzBYWThW?=
 =?utf-8?B?aGtNWVRtYmtkQk5FQTRhR3cxL0FlQmFuVEtpcm5WK0dzN2FqdXlBM2tNa1FG?=
 =?utf-8?B?cUM1U3FubGdZL2h1TU14RHRPSTVnZlhkNHdOWFQ4UlFvT1JwbzVFVFdpMzVS?=
 =?utf-8?B?UWZIV0xOcnVpN3cxekFzOVhhcHc0VTJOVGtSK1ZNQldIYW9zY1ZBZ24zalVC?=
 =?utf-8?B?RHh0M3R5T1ZJUlJ1L0VPaGNQL1lESnM2TGFmQjR5SnJNcTUvcWdNNG9kT01G?=
 =?utf-8?B?MkNKREZwSkNKUGdiTUFSeDE2cjVMUXBUYkppQjE0Y1QzSTcvNnFyZUE5S0x4?=
 =?utf-8?B?bnp4c0J3UHB1cEx1RnZKMER6L1lBcmVjRDV4UjkyektSM0xXTHVJZ3VrK2JS?=
 =?utf-8?B?djJ1WDhuQU1wWEd5cXl5VmlNUGg0WEt4S2lyRFNFNGVjTjk4dm9wK3BzT0NL?=
 =?utf-8?B?UE5OS3RvcmcxaWU0MHZ1NmFnUUVQMC9MUkFITjhlOXRXZkNYQkJkQWJoVFI0?=
 =?utf-8?B?dnV4YTRYSXprN3ZvNzljYVBuOHAwMWNHTktmTlJjNTBHUENPb1M1YUcxdUNC?=
 =?utf-8?B?bTRSOVRTaVlqYTJyU2h3a3l0RFJTR2I1YmdDclFHSnBqT2xnRWZvZW02VHZl?=
 =?utf-8?B?djJiZExEeHE1MHRnMGxwMUtDWXo1VFhLRjlXd2NhNWc4TG5pWkFTajJ3bmp0?=
 =?utf-8?B?SmpsNWNIbkl1R2loUVR1aks2Yzdmanl5aFdBanBpZjFudU55RDlPTHRrdUV0?=
 =?utf-8?B?KzJuUmNYREszVG95clhiU04weGZMTlE3NWtkUGdCVUpHK0pob2pXOEp2Z3FU?=
 =?utf-8?B?R3JzdFZsLzE0TTBVekFzNzIrMUxvRUtUd1JpOTZoenZUdzVtbXBuc0lTR1E1?=
 =?utf-8?B?bmlKYmlIMkRuem9XQVl6NHl1ZVQ4by93TGpiRE9mTlpKbGRLSUJOMHRZWFZ3?=
 =?utf-8?B?ZVZyd2Z1cmNsM3RneGUyVy9Qa202MjljSGx4ZDloUVRPUytwRTFrV2xzUVI0?=
 =?utf-8?B?MXU1WmlORGF1VHRMQzlINDc2TDZMRjhIOG53M0dTK1hodTFoaHROamI4ZDNy?=
 =?utf-8?B?TlgrVG9lN09MSm1tMW1Od05OTjVWSHhJeUZEcUkwNmExMDBZZEF2UmJMSkgx?=
 =?utf-8?B?OFM4Wi9rNWErdFhad3dSd2V3eXVFc05qVnNaNS9TdXBqVkxjRDZ4ZmpiNmlj?=
 =?utf-8?Q?zUeJs1PuiH/RCO+c=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e29143-0a6d-46de-488d-08df118bcd5b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 11:40:25.4296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzU2TPCoQsT00lxEK1MPnayT+y8YGY3G1gX0mbrV0J1whXbvLRoceCb8YUrM5eho5w0dofZVFJE5qveHMYFBkjnA3dKm6XdsVF1Be1S/1+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8957

The feedback divider property was added without the standard unit
suffix. Rename mps,fb-voltage-divider to mps,fb-voltage-divider-ohms.

The suffix is worth more here than the convention alone: mps,mp886x.yaml
already describes a property of the exact same name whose values are in
kilo ohms, so two bindings from the same vendor spelled the resistances
identically while meaning different units. The suffix states the unit
where it cannot be missed.

Drop the explicit uint32-array $ref along with the rename. Properties
ending in -ohms are typed by property-units.yaml, which reports the type
error itself, so restating it only produced a duplicate complaint.

The binding has not appeared in a release and has no in-tree users, so
nothing depends on the old name. The driver is updated in the next patch.

Fixes: e3c05a881fc9 ("regulator: dt-bindings: Add MPS MPQ4210")
Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Link: https://lore.kernel.org/r/20260911-gaur-of-satisfying-action-1a3b0f@quoll
Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
 Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
index e9e7a87e7533d0948927a459e9af711d1e07e572..c1914aa1a9d6236d5dbd4eaad3e05355f758155c 100644
--- a/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
+++ b/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
@@ -34,16 +34,15 @@ properties:
       be permanently asserted.
     maxItems: 1
 
-  mps,fb-voltage-divider:
+  mps,fb-voltage-divider-ohms:
     description: An array of two integers containing the resistor values R1
-      and R2 of the output feedback voltage divider in ohms.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
+      and R2 of the output feedback voltage divider.
     maxItems: 2
 
 required:
   - compatible
   - reg
-  - mps,fb-voltage-divider
+  - mps,fb-voltage-divider-ohms
 
 unevaluatedProperties: false
 
@@ -62,7 +61,7 @@ examples:
             regulator-max-microvolt = <20000000>;
             enable-gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
             /* R1 = 82 kOhm, R2 = 9.1 kOhm */
-            mps,fb-voltage-divider = <82000 9100>;
+            mps,fb-voltage-divider-ohms = <82000 9100>;
             /* 50 mV/ms reference ramp x (82000 + 9100) / 9100 */
             regulator-ramp-delay = <500>;
         };

-- 
2.47.3

