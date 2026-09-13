Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021101.outbound.protection.outlook.com [40.107.130.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4493E3163;
	Sun, 13 Sep 2026 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789299644; cv=fail; b=GZjfUUpHAcJBCcX7KiiFoenwbPAXzEA/0cieOE3jFNYdqFmF4iTHTW+ZdUiHTV6sjXCr/DeikSJOtJ+JPX/w84zelXwl1HqzGFiSYQdk+R5dFbsadRqiDVslothMgzQOGO9jjS9hOQk/L14AvXNbENMHHfiSe03L27F/7UufFVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789299644; c=relaxed/simple;
	bh=elPtjwAyabCQjsCbp7t62Pd455w9Oxx3Wc+z3t3bIeE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VxvT4QVJtG8s+zILWt1MhAoeS5Oa34AL2++15YteGLfFa7er1E2f9r+TW1BtPDThPEIIjgtC/LvIcgoSO4rLdV89SMRooDZPg/Qzxwhu+r0o2lVzR19dysovOZmDv0mHSPEaw28qiT4jt9o5CbwIqb8WTr+th0hHwFDlA4SirvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=BYc3ahpf; arc=fail smtp.client-ip=40.107.130.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="BYc3ahpf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wrds6legxdo00dfWl82UCUduK0yxtcV+oU13KTSoQjfXZA1+pJKXP6QClcKTJPMn4tedj7fwDj4kW1Gs5ivtdsh3Otbjb4eDr2EKy+ZKyGcvxfl7cLvuFo/rAnAtDKhhzvgKHcPKhvYQJIBaW9zI39JEuJ4PkVtGrDSoE3ZJMk/MQtkFPxsST9g3b/KJo4aqpxtJjbHMOFGC7oSGm0PHyGpigIi81+DNgQqmFJMM3cYa61JglGo6MFtIGasnt0YywtoayMcietpQ/xXCtZMzkwSeup+pfqdWqeUoSNc0JHg6/MBYxR8HZwc3cjsh7L/EIFAglHsC1Tan8Z870O8ISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BWV9qWb+EHp75CB4kk1+zKR9lCT6YricMc16a4Db74=;
 b=itH2BHcrjAtWQt4AgKYiKt6LaVD1Br5Cy1FU+hDUvng9UI5ANlsHF1gGwNqBVFBCsWZGtPEsFPSC8sV2s1WJZuVkvz9+khrZyP9YkBNELi/5Rmw3tZDHhvDzsTtg058kD06xhiUahyZH3+RjIa3IxhxNRCcLH4UY/PPN4JNv4KfqehNuF+W9hkOnW+EyJsrfl89iEGGuOVwbUOiFzj+/o8tSO2oIJcrJvOxYB/RCbR9vNmE+HW/MJz/oTkpouKAbuPz7TKZ6+v4MxQN4KGofpPIzBal9ZE+1BkmMQWBtoIEakjPzfImqrUrOlj/+mUaH/LBjuvULf6xaqK45NLSPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BWV9qWb+EHp75CB4kk1+zKR9lCT6YricMc16a4Db74=;
 b=BYc3ahpfD+XsesluPYoiHzkzgC2NUlvFGoYWTYfiZuJa74QMAw9n+a1yuPs5wmUWlOMPddm/LGeIKpcB73STgSWpgbXAScpXc4gecqvPXOG4P9jMN14ZrmqCLGornUHwO8EzbjYEffeZuzwiTHUoRQgFK5SnevKdPNTD7eQxf/b2HqmWcw0bEop1MFlgMwBOYn8jEL1x2PLcDDaCp+5ZPx9RSJn0C1iWV9Cjg1ravonNK85hwOSCa4gu7ZMIXjJ/gOyApZO8BfypviZKidqfVkSzajGoLIbPbWCCG3maLkuV7use/M9wCO79iLuu2CdC712UhlUzrEyNASpTvZnh7w==
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
Date: Sun, 13 Sep 2026 11:40:17 +0000
Subject: [PATCH 2/3] regulator: mpq4210: Use the -ohms feedback divider
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-mpq4210-ohms-fixup-v1-2-dcff627001ff@vaisala.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789299624; l=1355;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=elPtjwAyabCQjsCbp7t62Pd455w9Oxx3Wc+z3t3bIeE=;
 b=uE/aKv/qoU3BB0fnagymeilnfyAdAtGAqoclZyqw3TVJOw88jOlqbMG+Pd/ufodVOmPbNhAf2
 gv51sXQ9AnEAXYw4g2oCoDGx14xqTYt9VxK+x2AvbiXea3yf0RerdqJ
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
X-MS-Office365-Filtering-Correlation-Id: 07fabd9b-f4ef-42c4-8582-08df118bcdc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|52116014|10067099003|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	L0kps8I3HHCdWPhELPRfjvZNCxMnBkTYJHE9iozrBStQ01TdPjHquh9DU3JRIzp1cD1JodmngVUr9UU7jV6evXZlq6SZSeuaH4CCkuESrHoGy7vICdVnhXmcDqumTSQV8AmG7yyEfZw8b/uk4V8sdzPFI4pct6uu4ESkGb4sdjwcS0gM7t+DyyWXNGmMkIuo6O07ogfZtEqRKPXv7Ib1fifRNL8294k/XsMufw8ZlRZzt9oQBs15u0lVk0GAsPI0zcaBFsVjwPVP7jJPYrAAh1jmEksqMUtw7ZlzKBbeVMmnrTfIhcRsgo1Llr9nRNnTs4Oy4xNMrE9hOiQALuueWGdWw8FyCRycGfKZp5PZC5U0TFXXRILcpmPzrzE6jwPoL+lgAR2DRdORnjFAD+I1WX/3myFoEJ9xe/DksuM+y4Zh9C5/TtAkuNkCY6Apo4k7oNxXcYy83/CNh/g0/Wow/t0Dul1VyUxDdhtGjO8Ips+rbxi9DNuj0lOHudloutXAyTExbFrX+8mzSyODWIRNgMD0MnLYaS3jQGbhgQFS0SLoym8pLyuRYvjZgzbECZC8hrx9xmZqLU9A7NHJNfizz91/wjoN/LkiM36Wni4HnIaPjdsazFfeMMnCldTa7RQVuSA0c7IaG09cy03D9xotb92uzD0UcsVQDrRaAmjnmkCJ7sQsJXq8vr717AQcnu6bpvHjSLZq3fhJ3BbjIqXhg2K3//8aG0J7l+HWkr+z+k0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(52116014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXdidmtZOXpZaHBHVFlMR3dpT1JaZkRybldEZWl3MXdCckUrQldtSkpCMWxr?=
 =?utf-8?B?eDlzSm5TdjFmL1F1ZkprZ0xNa1Mya081RzB0aEt5NC9sdyt1ZnNkaHlrNWJK?=
 =?utf-8?B?amhvTld4RHltdC9MVUwweTBLR1lpVDAyd1B6R3JGK25JUGxpeVZnd2ROS0hI?=
 =?utf-8?B?WDR1c3d0NjlVVVpMM1A5OWZzUlVpanJGckpiRjdQYTZnbHFiV0ZxT2NYVnAv?=
 =?utf-8?B?WE1JY1hVR2Y2UUw5MUFnekQxL2VLYldVWTFRWXQwSkthNHNSbTVjNm9HMVQ0?=
 =?utf-8?B?cUNaa1NTRU83NVowWWJveUFraHQxL3ZMVmMrTi8xS0JaVTh5M3A3NVNGZGdn?=
 =?utf-8?B?TEpoT1Z2NFN2RVUyU21WdXpWM3R2aHU1NkFpb3lxMUxQWldCR003S3hTOVRp?=
 =?utf-8?B?SUM2RWdnSnc3aFlNWjc1WnRYZFgzKzBLVGFlSDhkQjNvdEc0NkFNK1FpQ0xo?=
 =?utf-8?B?RmFCMENGRHQ0dkhIR1NCNXcvczJrTS9iSHZZRHN5QzgvYWRkZCtGNG1FR01O?=
 =?utf-8?B?MnVMOGlmR2VmVktTbXV1RDJDNVlwdEd5ZGpmb0JOS0I2SlVpL2tJTE9SQTE5?=
 =?utf-8?B?R1JFelVUbnlYUDJQSUdCZmM4bFJMaWl1bkVKTlhjdERJTEFWY1RjMVhhblNv?=
 =?utf-8?B?WVM1ZGJBVGNGL0RSOHVTbWVRT0oraDM1bk5mRHVoQ3pXSUxkQ2FWUUdHQ0lH?=
 =?utf-8?B?YXk1SHVUWVQramJ0TGo1K3hWY2NRVkdqMkU4bjcybXpEZVd0Q2UyZ3RJeTVG?=
 =?utf-8?B?K2cxUEVhMGlBYzJhZER4aU52WklYWXlIVDZ1R2dxc1JqZTh3WDkyUW9ocXhn?=
 =?utf-8?B?NlVDNVpPdWh2ZXcrdFhZVFlYVzNiVnpnZk5Fd3JUZmNpL3FjK3dmeVc3dzRX?=
 =?utf-8?B?a1FsRXdHZHExdENFcWFlKzlMN0dUYnNVTjhRZks3Yzl6cmhyazdlTXJLUm1K?=
 =?utf-8?B?enNFQ0pnNWlLRTd1a3Q1U0JJMERUK25vSkNoL1prTWJDNHY0SkdyZ3E5SWow?=
 =?utf-8?B?U09KMDVCY3BtMG8zbVhYUFAxSXFsTnc1bnlveUhXeHA4N0FRQWZMNHVKa01M?=
 =?utf-8?B?THlXV3Z4Y0RPaXhHc0drMVdYNWdxbTZ6Z3haaFdhcnJFUFFvQ2tYOWE1TXVO?=
 =?utf-8?B?YXhhMjRCV2phK2pUTzN2TjJ3Nkc4bVRrU2NvODZMblc2VkZPZjlBUk1DMmJL?=
 =?utf-8?B?czA3Qy9DVFB6anVleDR1c0V4eTNoNE4xdlB0RGpueU9jQXFrTFdWMVlmUlZp?=
 =?utf-8?B?Z1VQeTRCYkV4SHJ5WjNQZW5vZHlzMmgyQjZOeHNSYnNDdThQeDQ4QjNKUzZN?=
 =?utf-8?B?U3JpSTVieXFEeWgxV0VaWGxTMFJBRkNob3FQempGSTF6QXBTbHViK0lkdnpr?=
 =?utf-8?B?VDVuUU8rRlg0TXdNS2lYeENqMThPKzE0TTgyRGpJUnI5bENka0dkTFUwU25Q?=
 =?utf-8?B?ekp6dWdaQ0FqREZCTjR3WWhlekZCR2NrRXlVNitab2pFTmdPWERMbjhXTWtE?=
 =?utf-8?B?UmFrSU1odmxHMjFtVkN2YUJYL3M1aytaQjJjVWpVOVFibDl5cko3bnpCUmhx?=
 =?utf-8?B?OGowWERUTTNFeEEyTnk4SEhkZHRXMUYxbDZTY1luSnFQYUg4Y2NDbU81R09m?=
 =?utf-8?B?YW9jS0l3RGtMYWlMTFV4SEkvUStnL3pmelhaMjl1ajJ0R21LNFVaeWJvVDNT?=
 =?utf-8?B?bXlIbG9oUGdtN2tsWUZ5L08xZVdoRWlpN0ZNMmlqS2VyNllsWjduNk1uME5O?=
 =?utf-8?B?Yy9QWUNuRndLTWlObmU3YlZSRDlaTUYwYm5JNEVHZHpUN0JpcDhUZ3hXVjc1?=
 =?utf-8?B?NTljYUs1WC95NnZMNnFQMlhTWVhtY3Yva09WOTF5MjJtQ216VFBCeVFVV2xM?=
 =?utf-8?B?RXdNSEFqVDRFRTFPQnFsTmNHdi9nRWZHWGlxbFFNdFJweFNTMVV5YlNXQWJ1?=
 =?utf-8?B?VkJPL3dWUUV0S3RpMGoxQUY1Mkw2Y1IxS05jc1JpU3BhTTVJME9tbFBYZjZ3?=
 =?utf-8?B?SG1NTllSM0NoSnAvTjRkVWRKNkdhSUZjMmN3NkU0T2xsMGJmSGZkbXF2UlBV?=
 =?utf-8?B?eWNlZ1Iya1NyMFoyVnFaY3RtU0RUcCtrbUlBR0RHU3JiT2JwcDIyS3pBL2th?=
 =?utf-8?B?OUc1NlVXNjdyaFk4VG9zQ3BSa1hYalg2NWpYL2dmYmxad2kzbW5uVExaUFR6?=
 =?utf-8?B?UzZFaGFET1paRVNkRFlCelowOGFBRm0xWm4zTmQ1VGlMNkZsTWVrN1A0OXox?=
 =?utf-8?B?TkZoejRxMmZweUxGT21nODZlQVhaZWtJWmlvNTdDZ05rcGVGNGZPRE14Z2xx?=
 =?utf-8?B?cFoyOVlJc3N4aEFnQXJaZlEvYkIvUnJMTkx0MVBWS3hKUVlJT0J0WkoyVlQy?=
 =?utf-8?Q?owOIGE5FW9V5owG0=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fabd9b-f4ef-42c4-8582-08df118bcdc8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 11:40:26.1562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5/E1NthRW5erjyatZuB27kmC7LGmK9YItoB7pb192UPatD61sVfr9AqpjFHtKnhPv5xyKdWElrHsA3rRecBWfUe6YEO/aCYGBbDlKBtAOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8957

Follow the binding rename of mps,fb-voltage-divider to
mps,fb-voltage-divider-ohms.

The old name was never in a release and this driver is its only reader,
so it is dropped rather than kept as a fallback.

Fixes: 61879d561e91 ("regulator: Add MPS MPQ4210 buck-boost regulator driver")
Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Link: https://lore.kernel.org/r/20260911-gaur-of-satisfying-action-1a3b0f@quoll
Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
 drivers/regulator/mpq4210.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mpq4210.c b/drivers/regulator/mpq4210.c
index 227136d8225805a759d2d6545637858ea7122b89..315f8e02ff2a117e37b32f8a128c9e0feacfac74 100644
--- a/drivers/regulator/mpq4210.c
+++ b/drivers/regulator/mpq4210.c
@@ -144,11 +144,12 @@ static int mpq4210_i2c_probe(struct i2c_client *client)
 	u32 r[2];
 	int ret;
 
-	ret = of_property_read_u32_array(dev->of_node, "mps,fb-voltage-divider",
+	ret = of_property_read_u32_array(dev->of_node,
+					 "mps,fb-voltage-divider-ohms",
 					 r, ARRAY_SIZE(r));
 	if (ret)
 		return dev_err_probe(dev, ret,
-				     "failed to read mps,fb-voltage-divider\n");
+				     "failed to read mps,fb-voltage-divider-ohms\n");
 
 	if (!r[1])
 		return dev_err_probe(dev, -EINVAL,

-- 
2.47.3

