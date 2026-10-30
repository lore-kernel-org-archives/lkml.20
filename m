Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357335;
	b=CxyAhKBEDpRG4HkLwucQimMsKd48sMSLRb4q8Q0iCIcFvWaA2NmcDODxKrkuuTQVHPlz
	 KShBopvWV/3l1RLKSz/dc7Xa4W4LtUHzlECnrQyPwx0Pfjg5eJHVP0QfDzhleVVCZXrj9
	 va10Chx+88JMje0pwuftRdZZACvjQc7kMeg2c2q8SnJ23KCZsIzmeuHv0CFuR6RxOeoYu
	 2f1knhW0s7BKvFaEmUlJ9qJdrKqqbeBG7kaFT/x8KeYDrWr9wgmet6/ZgwP7O3QwHedaA
	 fwUJt7GGSR29+zP+T1DuI+AojliqZ9hrojX/YLXl/8K9kO2e0tk56Wu2x9Yo0nReaBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357335;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ICgWWywauF7jNA7531RZHSOsVExrer8px1HakVu8gTM=;
	b=V5zNkY9/V9t7wc2TMHZ0a5R5FW7qdFCcssJf/nwL1FUOmrZKxEcoyFAl3FZeEKQKLUSZ
	 ANhn0cpr7IIjLLc5P3v6ej4sqCEgTKTedDXn6AKTe2q3dKsy18D62fSISugyeOIcsWHK1
	 jfFl3YCuz9MLU/xewyC3arwDxd1Hbr97yEQpehEAKL1lao3p/DMz3KA4zNW+6JkCDj0dg
	 hHO+jrFHE09TZ0XLWJKZTslytvqjQ1Ymo6D/QI2KgqFKQhtSNNm/Rc2jHpWOlE/Rr0li+
	 858tRaC571zewDvFzhz/M2yi9UTcEDEEaip3dx4TMmGvFjjb4N/ttb3J0S6h1vkIBaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=KCcassfB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.75
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020075.outbound.protection.outlook.com [52.101.227.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE5660A2634;
	Fri, 30 Oct 2026 10:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE5660A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=KCcassfB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDd9r/T7RiyqXBWrYX+mpJbTFT7NQ4XiOblD8uS04YwrsGUYxyu+soYjjiDqZLTaMxGXSOMbZTn736zaCxvPjdDvHvv1m6pxIAFlFecwcmRn+UvbGjiSZDfSJO8Ryeee8xFZNxaYQqtn/zpfW0lKk2Ri1OfOHWv1zRO1s3fLBKGq3cNWd3PTwyVkEn+hG8vKmyrQf2YWYF4DXXVK375gEsF5N2CwoIXkmfk+9sqSdgdUETqwL1usQiSQB9aYptsAbbZ/+YAQhZ9z9Yl74sMCZPlRxBZBSa5LsiAylC0INwx6ybHHFTVEUGubudVphBbia11NkxPqvhMdVAANYj7VsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICgWWywauF7jNA7531RZHSOsVExrer8px1HakVu8gTM=;
 b=TdNsKr/Q4aL6/xQdzZBllTckE7WTProUckLMjtsDnpT6QEoQkWyoEFR5OgPNEwNJeNTxBpFSVJfpxLogslAL6s+7g7NyPOWGKWWhzfD8E0AajmM1ZDc5pwQW78VBWCYPZe/XLLy2VmWnfviSeVVoWks93+PsRwigLv8BBq8rJLVYamv895/6YB7az+ryoJGd3mv7GuGeZvpsmmmvJ5AZDN7D8+C0SRo2k6c8MlAwdfWmvaszXRsJ/c3U++2IRkuke8u0JvVJZTOV8MvisiojoimVUwzpkRbcz8xFLfXlbYvaBu900xcK2UZmGF0Lb2xY0X8gHKjecPsmvOBSWhAadw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICgWWywauF7jNA7531RZHSOsVExrer8px1HakVu8gTM=;
 b=KCcassfBXTBBYIe2PMNDgPGjxlS/veZPOgYXpcEuvrUsbT39mtyaDPX09ogw+ZmplH3gLN0p4sjrXhg2CZDilohixgB3BVaTnHX45Vnv34tEXKmoYE7CkIjeKUe5gX9vBaQymOJTOJgHWmfoEOqllVBcT1iXwckz1yEP/SeYUp8nYZ+q6Aa5oyxhykWRE7oTU6DyWm4Qr1prprgGPuEXMBXC9f2kYG20liPePUFqPdkr4loWP95ikr0Ko5j36ig83yr2a5gcjDsKX8CDmiEh6ncsQFPjDwv1NadYGlX8YKsmXrRBS6I5HPVflrABqNQchJ9ay1AefWHhO0DPcV4Scg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNWP287MB6082.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:335::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:48:50 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:48:50 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/15] media: i2c: os05b10: split common and mode-specific init registers
Date: Fri, 30 Oct 2026 16:17:55 +0530
Message-Id: <20261030104806.1223991-7-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
References: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::11) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNWP287MB6082:EE_
X-MS-Office365-Filtering-Correlation-Id: 7717f92b-2b6e-49c6-72c8-08df3673622d
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|3023799007|6133799003|22082099003|18002099003|38350700014|56012099006|261028144727099003|261022105027099003|261022075727099003|10067099003|261026140227099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 Ow9aFM0QJMxT08QKoI1ZKZ19pcDuAB/NkSPQnQ/3iI/vKRcFmFEPkYagdQkSY9QOjC0wgiWJpj7tSXh0VxGveRy7saoHTK8o0Sw6vZldA8QpIxGbNiAwDv/575tEVbFlFnVsrvPy3DunlDpxgizBCrdgRHYeSjIfk5rOEgIr+YzHXO91h7SHpB24aLS4P57TjUuMtyQnibDURisrvK4gfX3/9wvMonoo+8CQP25EAUPb57l3IKCN5blGlMY+9+h3g1ZPOZrqjHlNk5J+CVXrBGaeKpxxvctBnXtbFVKxXJqEvbsduNSrmjjPDGc6q1t9fQAI3tsaCiQZsd79TdxIZszKYIbWi6Mxu6kL16vCFME0eV/xOAH4Up7ftKG2qUBDlZgfGIGwnO7iagQMasJmwIdjUskrSoykOy4JxEBIEQfv9CxecOsQazIrja9QCNxtUq4YoMOGpPK1DY8/7jvUDZoMhY9Hh9jWRrCvPf5tZ/ne7DwGM+6BK2yi3/Q1ITrb7RZCSqGqyL0RGqixUqVaouMVRwU/pkURq7+OcfG6yd/G/pxtdiwpz9ESrvBdbRFRF0X2d7l4o0rgtQ+jg2oyXx8txZJLsETWFQ7Br+DPnC8r20qHHwnYfu+/YUafjgOWFurr3LWBUtxgnwpQkyJO1VTgL7dyFEe70xVvAm7uQ78Yf9/0DuE7xFuH7dKw20hRQrVCy+dmEX2YORXzgoUfQoLasHQzs+tTkQxvVqdWuZI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(3023799007)(6133799003)(22082099003)(18002099003)(38350700014)(56012099006)(261028144727099003)(261022105027099003)(261022075727099003)(10067099003)(261026140227099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?93jcQxRdGqi1/OExnzhkkVqpYMO+sEzkQj6BdYO+DCvULx5XTkykw3iQNUvT?=
 =?us-ascii?Q?+/LPvsmVMrzfi9kQQW8mlqAqTZ+0TyL0mhAqLuUQEp3e4VMbdqwCn39lM8Un?=
 =?us-ascii?Q?qrpIOGWu3r1H+s3OZsiW9qGGmgw5a/QdXIHfjR1ZJO0gfeidutnL5idVeXj/?=
 =?us-ascii?Q?nJCoSFEV5wpfi0k3QKgPr+EIfr6lajxqsj1JWRnmCi/7h1jWpWc9DIv92/+0?=
 =?us-ascii?Q?ySZOkaCsbt75TpoPc4jQ3F+wYI5R8aeiWZTbNK2FNF32bDEO/CL45tj/IafR?=
 =?us-ascii?Q?GDXzMT+JobDP3LI0+DYQcH8Q19F9vbHab2aPH6z7BbKYOLR/Le7URlvesaUh?=
 =?us-ascii?Q?xaNqM1Es42dju5WRnwis3Sz4srjM9VS1bXyrYJ6hX6/2vejKjLwtItvO8Ab+?=
 =?us-ascii?Q?EVA1tVJlXhPoInLbt5639bMUulXbxWKPVik5qw7cBMwv0K62c3g7R8Ig4/oj?=
 =?us-ascii?Q?9sbh3zEiZzlf0EJ5UROwyN1WLmfFDeTM5XSiOY2GjgcRwgP1upw7PBDLSEY1?=
 =?us-ascii?Q?28v4YKSokueuIK78QgFup61gspdznN0rMAw+8y5gexNskg/AcWJeCuO0Kzch?=
 =?us-ascii?Q?gKjxbM8viBpSyIJuqycJLcvF9Ssg/KkSF2x2Jv/92PPexKmM5+8rFeOwbo0a?=
 =?us-ascii?Q?xgvY73fcFTfm3J5BMB3SsB0HK/1nv6TIxVjzD4JFbrgeMxq7rAEuLjbpJWtE?=
 =?us-ascii?Q?t/3j9DXbNLxFuZTObz5B/jNEySNCannJHEm91b0F8Z7uULo0Y/oBf8nHG9et?=
 =?us-ascii?Q?NLDjLvF2xEKnt5Yg4aS+snS0/DHCEWfAlJWPNQbnNLGtY1fmfP25YJT4PVXN?=
 =?us-ascii?Q?H7HL8fOkg2HvpOMwWPAVNRQXZxRVnUDIWUWEREoq3v9gdvW7R0ZQ/M63qpoN?=
 =?us-ascii?Q?PHs9k0qp/GvVfgSiBqFaA+AdP6whWDIic61kwbbs+Eylm/XrK0AwhZv3CCE6?=
 =?us-ascii?Q?El39bmZomhBWnsJQimR/VPILJ+4APl+qVLjy1npgdIq9+Z4mdumqzQhDzzt+?=
 =?us-ascii?Q?gawtwnLqD8MedzmCZhHYscEFxa8hgNwSIKuX5NYL8GG5RjARtTCxDHSCqm/j?=
 =?us-ascii?Q?OWOLVPLFezcwP8waL88hKqWB/Wjn3od/XfUUiNXVbnPGAYPSmj/S/K1z+Gmk?=
 =?us-ascii?Q?YnJoTvwHpFpkjEPeh1Qgxirb7YSuHgZAveSwd3L5XrKuAJ4jdgeklVmVCNNz?=
 =?us-ascii?Q?Za+YD5ucwLDe/5uS8Nh2aQo9Zfbl2KSOaISlmr/BQSPi8EKnFlZMfbNm+R6Z?=
 =?us-ascii?Q?k2GdBIlkzkX3OgoY7eD50KECx7/uou0HoDQ8AUorCujpub8PyDTiyy9HVbzH?=
 =?us-ascii?Q?sT0zO0G9DX+pImvbULWdGXFxyRgpFyjCOchylXV7dJ1grJzErSmV0Jplqjak?=
 =?us-ascii?Q?qSzmv5jDr/xCjW5s3wPsu1UcR0Ml8FBItqFs3zTgpSf017peUebicXMuePZb?=
 =?us-ascii?Q?gQiUelIieO8z6b6vKgM4swR3rP4J9FUH528vRcstEuZfzKVMh5gw9Kvfso1i?=
 =?us-ascii?Q?Ww1L6eFEUIqNGuuQfz671t8P+ZcRKKBzewtv77cpL1yVYUsa2DS4TogIQl1j?=
 =?us-ascii?Q?f8cMPcZaPaN5/5vmmDuuOgsz4wwdJzZQFj/xhWi6NIZUdnA2cBwAnDUSRym6?=
 =?us-ascii?Q?sba6orxAAIJpOm7Ie9bDPEAIBvskjCae45WowgS8OQdGW/76NE6mYny1FrH9?=
 =?us-ascii?Q?GI3WOqbwKdz1JwjHQ/BsZtJSw1mlBEg+WhCrcJB+o4vGrmrbHLIKsjFyhZa8?=
 =?us-ascii?Q?x24kra9b1OgJToGUxv1zP1kXToM8JSQ=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 7717f92b-2b6e-49c6-72c8-08df3673622d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:48:50.7195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXBVeAmRiZZK+v7y9uOASyC9kVp6jjcB6VKLdVcuVPGsrCHkeDi/uxUlvzS0upFUpHykzB6nRyVMv/9Svnh9sveY8rlpDIZdeauNBIhjBeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB6082

Separate common initialization registers from mode-specific settings.
Move resolution-dependent registers into a per-mode register list and
program them during stream enable.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 96 ++++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 3f478bad1fbc..46d514d2a479 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -138,16 +138,13 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
-	{ CCI_REG8(0x3610), 0x87 },
 	{ CCI_REG8(0x3611), 0x24 },
 	{ CCI_REG8(0x3614), 0x4c },
-	{ CCI_REG8(0x3620), 0x0c },
 	{ CCI_REG8(0x3632), 0x80 },
 	{ CCI_REG8(0x3633), 0x00 },
 	{ CCI_REG8(0x3636), 0xcc },
 	{ CCI_REG8(0x3637), 0x27 },
 	{ CCI_REG8(0x3660), 0x00 },
-	{ CCI_REG8(0x3662), 0x10 },
 	{ CCI_REG8(0x3665), 0x00 },
 	{ CCI_REG8(0x3666), 0x00 },
 	{ CCI_REG8(0x366a), 0x14 },
@@ -231,7 +228,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3714), 0x24 },
 	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
@@ -240,7 +236,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3730), 0xe1 },
 	{ CCI_REG8(0x3735), 0x80 },
 	{ CCI_REG8(0x3739), 0x10 },
-	{ CCI_REG8(0x373f), 0xb0 },
 	{ CCI_REG8(0x3740), 0x28 },
 	{ CCI_REG8(0x3741), 0x21 },
 	{ CCI_REG8(0x3742), 0x21 },
@@ -286,8 +281,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
 	{ CCI_REG8(0x37bb), 0x02 },
-	{ CCI_REG8(0x37bf), 0x05 },
-	{ CCI_REG8(0x37c2), 0x04 },
 	{ CCI_REG8(0x37c4), 0x11 },
 	{ CCI_REG8(0x37c5), 0x80 },
 	{ CCI_REG8(0x37c6), 0x14 },
@@ -296,7 +289,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37cd), 0x17 },
 	{ CCI_REG8(0x37ce), 0x01 },
 	{ CCI_REG8(0x37d8), 0x02 },
-	{ CCI_REG8(0x37d9), 0x08 },
 	{ CCI_REG8(0x37dc), 0x01 },
 	{ CCI_REG8(0x37e0), 0x0c },
 	{ CCI_REG8(0x37e1), 0x20 },
@@ -309,25 +301,10 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37f5), 0x00 },
 	{ CCI_REG8(0x37f6), 0x00 },
 	{ CCI_REG8(0x37f7), 0x00 },
-	{ OS05B10_REG_X_ADDR_START, 0x0130 },
-	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
-	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
-	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
-	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
-	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
-	{ OS05B10_REG_HTS, 0x06d0 },
-	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
-	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
-	{ OS05B10_REG_X_INC_ODD, 0x01 },
-	{ OS05B10_REG_X_INC_EVEN, 0x01 },
-	{ OS05B10_REG_Y_INC_ODD, 0x01 },
-	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
 	{ CCI_REG8(0x3818), 0x00 },
 	{ CCI_REG8(0x3819), 0x00 },
 	{ CCI_REG8(0x381a), 0x00 },
 	{ CCI_REG8(0x381b), 0x01 },
-	{ OS05B10_REG_FORMAT1, 0x88 },
-	{ OS05B10_REG_FORMAT2, 0x00 },
 	{ CCI_REG8(0x3822), 0x12 },
 	{ CCI_REG8(0x3823), 0x08 },
 	{ CCI_REG8(0x3824), 0x00 },
@@ -337,7 +314,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3829), 0x03 },
 	{ CCI_REG8(0x382a), 0x00 },
 	{ CCI_REG8(0x382b), 0x00 },
-	{ CCI_REG8(0x3832), 0x08 },
 	{ CCI_REG8(0x3838), 0x00 },
 	{ CCI_REG8(0x3839), 0x00 },
 	{ CCI_REG8(0x383a), 0x00 },
@@ -358,26 +334,19 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x38a7), 0x04 },
 	{ CCI_REG8(0x38b8), 0x02 },
 	{ CCI_REG8(0x3c80), 0x3e },
-	{ CCI_REG8(0x3c86), 0x01 },
 	{ CCI_REG8(0x3c87), 0x02 },
 	{ CCI_REG8(0x389c), 0x00 },
 	{ CCI_REG8(0x3ca2), 0x0c },
 	{ CCI_REG8(0x3d85), 0x1b },
-	{ CCI_REG8(0x3d8c), 0x01 },
 	{ CCI_REG8(0x3d8d), 0xe2 },
 	{ CCI_REG8(0x3f00), 0xcb },
-	{ CCI_REG8(0x3f03), 0x08 },
 	{ CCI_REG8(0x3f9e), 0x07 },
 	{ CCI_REG8(0x3f9f), 0x04 },
 	{ CCI_REG8(0x4000), 0xf3 },
 	{ CCI_REG8(0x4002), 0x00 },
 	{ CCI_REG8(0x4003), 0x40 },
-	{ CCI_REG8(0x4008), 0x02 },
-	{ CCI_REG8(0x4009), 0x0d },
-	{ CCI_REG8(0x400a), 0x01 },
 	{ CCI_REG8(0x400b), 0x00 },
 	{ CCI_REG8(0x4040), 0x00 },
-	{ CCI_REG8(0x4041), 0x07 },
 	{ CCI_REG8(0x4090), 0x14 },
 	{ CCI_REG8(0x40b0), 0x01 },
 	{ CCI_REG8(0x40b1), 0x01 },
@@ -397,7 +366,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x4305), 0x83 },
 	{ CCI_REG8(0x4306), 0x21 },
 	{ CCI_REG8(0x430d), 0x00 },
-	{ CCI_REG8(0x4505), 0xc4 },
 	{ CCI_REG8(0x4506), 0x00 },
 	{ CCI_REG8(0x4507), 0x60 },
 	{ CCI_REG8(0x4803), 0x00 },
@@ -409,7 +377,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x481f), 0x30 },
 	{ CCI_REG8(0x4825), 0x34 },
 	{ CCI_REG8(0x4829), 0x64 },
-	{ CCI_REG8(0x4837), 0x12 },
 	{ CCI_REG8(0x484b), 0x07 },
 	{ CCI_REG8(0x4883), 0x36 },
 	{ CCI_REG8(0x4885), 0x03 },
@@ -442,6 +409,42 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3222), 0x03 },
 };
 
+static const struct cci_reg_sequence mode_2592_1944_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0130 },
+	{ OS05B10_REG_Y_ADDR_START,	0x0000 },
+	{ OS05B10_REG_X_ADDR_END,	0x0b5f },
+	{ OS05B10_REG_Y_ADDR_END,	0x07a7 },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0a20 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x0798 },
+	{ OS05B10_REG_HTS,		0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN,	0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN,	0x0008 },
+	{ OS05B10_REG_X_INC_ODD,	0x01 },
+	{ OS05B10_REG_X_INC_EVEN,	0x01 },
+	{ OS05B10_REG_Y_INC_ODD,	0x01 },
+	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x88 },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3620), 0x0c },
+	{ CCI_REG8(0x3662), 0x10 },
+	{ CCI_REG8(0x3714), 0x24 },
+	{ CCI_REG8(0x373f), 0xb0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x04 },
+	{ CCI_REG8(0x37d9), 0x08 },
+	{ CCI_REG8(0x3832), 0x08 },
+	{ CCI_REG8(0x3c86), 0x01 },
+	{ CCI_REG8(0x3d8c), 0x01 },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x01 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4837), 0x12 },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -464,6 +467,11 @@ struct os05b10 {
 	u32 data_lanes;
 };
 
+struct os05b10_reg_list {
+	u32 num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
 struct os05b10_mode {
 	u32 width;
 	u32 height;
@@ -471,6 +479,7 @@ struct os05b10_mode {
 	u32 hts;
 	u32 exp;
 	u8 bpp;
+	struct os05b10_reg_list reg_list;
 };
 
 static const struct os05b10_mode supported_modes_10bit[] = {
@@ -481,6 +490,10 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 		.hts = 1744,
 		.exp = 1944,
 		.bpp = 10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
+			.regs = mode_2592_1944_regs,
+		},
 	},
 };
 
@@ -652,8 +665,16 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 				  u32 pad, u64 streams_mask)
 {
 	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_reg_list *reg_list;
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct os05b10_mode *mode;
 	int ret;
 
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes_10bit,
+				      ARRAY_SIZE(supported_modes_10bit), width,
+				      height, fmt->width, fmt->height);
+
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
 		return ret;
@@ -666,6 +687,15 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	/* Write sensor mode registers */
+	reg_list = &mode->reg_list;
+	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "fail to write initial registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Apply customized user controls */
 	ret = __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler);
 	if (ret)
-- 
2.34.1

