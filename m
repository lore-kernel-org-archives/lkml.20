Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357407;
	b=rITobt2ExQ8b2KdGYiia6w2uLWOvCclelyn6KlX8uX00YyvFBlh8Ma33ghvaa6CGJu6t
	 CLyoxqErOEUDpQHPOTQRFAsa8+JLYmKppgfdH07Noa5z4oY8MzQlnmYIXnhoVP2CjuYiP
	 ClPeF8KqLw0hFZ4bkiAZ48NR4sl0Kl4HztqMZqdqP7BM5zWb4gzJPpzwxDy28VtO4SNmE
	 0IqB5zn9e5vxsYJYD53kBxjDtuA1FatEE6q1TXUUoJEvTsAiczv1QIX7poz1WF1ur9nmL
	 190KYjFK3bAqD+RY6Qg2dtYb9HXplrFIH5LtkLOk+H85oP6Bg82+0KaWPLvv4KfalWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357407;
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
	bh=2SMNnj5nRpOiSEZBfZcZ2EZmtZ27OnVQPeWaiCcMXE0=;
	b=JduZJvvf31T1VCaPJZmMiDUAR1k+xF95ThOFszBM5egA1aNKNRfPGRyGBjGQf5t3K9Ji
	 9hdhC44q0CIDQQUeYALCIDopOVvgByk7czvI2hBq8luozQ9/1SZD5PLxg2iIvyqJVBYEy
	 RXLke2Pt6XgGz/D683aDd1JlLWR/R30fQnUAnIp9qhv0ci/KvZ45yBAb6Rbnh3nE2Sl5B
	 /Hdm37I7iQX46zW4xbq/Pa8XdPi//V5L0ESkI2md2Hf5qen8zMFJurcvjKs4V78KrqfZO
	 8d9GPfYXza0ceLpaNGshyglwT8dXCH7n/wmOUTVc8ECozTIBNcdS1Culs+mHWI8Jt6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=gVCfE0Jx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.114
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020114.outbound.protection.outlook.com [52.101.225.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799D960A3811;
	Fri, 30 Oct 2026 10:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 799D960A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=gVCfE0Jx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+C8M3e7XPJvD2lCArzRijbff8xncnwBFV5wpkOC8KRo5GhC8L2PyGg+ABvBOZ62gQ15KiY49mOcM/s0nwwU9XFCs2iyAJggtBQu7GZpMniCuzAPar1+ZmChn2FUT8yjKArajdWN54l+yaFSVQvXtJgjevGJEt+3CMvPx9yA3/xrU54DvAbhgIrnmXDjXbscSYk3CRz55X8BsWjJ9XAwVPwVdl2W6ukn91VnidpKEuk7MnVPU6NGMb/Eb2HbUBtEeqYFVoADvLdxG2w0XBESEukkp9gaL93Fm6SM1tOlE6oiwFESxWBtTq2ZVfN2RbJ781VGoSuFztWdb2kNrfDtLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SMNnj5nRpOiSEZBfZcZ2EZmtZ27OnVQPeWaiCcMXE0=;
 b=evDU0yzU+AN6Ao5KW5CJDqZVd5Yd/mk3tMoYhkd+XYNz/pBXfKYcJ5tN14X+EpgrR13P9CwEJEeyI5kakksKiI0YWEg3EOieR8i5zkHQL11OzTG5UFcQeJhjuHH7OAhTKFYM0fIZjO31Ky0oXJVQt9bKGbnO3FRU2VehwRVANj0i9UbsyvCgMC9OzC6glzV6zacYPlPi1NehFOS27FQo9cxFH4eN5QKiymP2N2gdwqMTPVEgLSEyVXE8o7Uw2cDrGpJTihANFIbmFae2b8JM55Xe5XI0iYajc5YL4JjmO0SBNjsSGkTPq4mhGH+kQbMpZ2jSyLMPCr4FrrxyVZihFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SMNnj5nRpOiSEZBfZcZ2EZmtZ27OnVQPeWaiCcMXE0=;
 b=gVCfE0JxMEAq5SZRNBvaAnW7cOnsI7/HNFBI0XPYKciSlW8pdqNrh4fpuTF9EckOj73dZvGjFbdPIS2BPKDiSUZ6/GBayUJsLezQrzgH0tEc+8hAQVlvCUO5N4uWqs6cVFoj3VxIGe4Q4sBCE29R1z3o5fpFvKGEFTojv6PmwvG5yVLQDD+XX5xFQZrrZ/KQgyLQOW+rf3QM0F9B5aCprM8PhtG9AWEBukVI80PDelP0fDWVWYFp3f9sKQdj2aYBBRai93X7KbGlEAWmi0kuZV83npf7PhjeSCMg0v7+hsAr6CFYNXZlEmOPqaS9DvYn8+J0kh/wfx0Wq8ZIWFDNyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN2P287MB1787.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::8)
 by MA0P287MB1769.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:50:02 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781]) by PN2P287MB1787.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:50:02 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/15] media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
Date: Fri, 30 Oct 2026 16:18:01 +0530
Message-Id: <20261030104806.1223991-13-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN2P287MB1787:EE_|MA0P287MB1769:EE_
X-MS-Office365-Filtering-Correlation-Id: 5388afd0-70a5-4d3c-a128-08df367368e4
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|56012099006|261009223027099003|261021121427099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 pCKznsxWW4jYR6YmIxUn+gKCjYJgB8pXnfPuAAdxVdklxL7DP11HpSP9Ei4HaC7C3LrDIE6ca6ABAQ0J7C8apASMIDQnQW4UirRSXtyAE2eSqi3Upu9sFBlI7NWcsPkrqALLtubYTrcZ7u8CTLnbA3rXUQFP5R3QWbkCmkRVHjzWRU98SMvFFiGFy/2XGt0+diDjvCsqxBd5gzP7a/FSaD4H18GdI/BoEwq57qDeNoSOOzJphxFaqWOQmUYkuH3F20x32YKV68BtIpGXeTB4qEN8AkYWiDpLNYaWdBTeHTjEkbDAhHxL+E1bo4Nw272Bbaqr4C2BFsQ1MgomSGPN2yvJ7LtkKQJ9Qrf5BmNnjELrGo/ckdZfIby9gZ/+CPbFn7/08EXtdjCgnq0heLKrfQducUMSJ27KGqMYXBCql7WYKs6+sx3vc1HW3DT96EmYAb2F9I+vPaknmFgSX5R2IMTWsQsxCAbo3X6O1SdwzGVJOdRsXwgggk00qBo4lXVf7NVDhpcrHZsaLsIaEKb/kLOq1/HryS2JdbBl5XrtNWBfyvFGijwTaDOJQNj1E/g6OFwmIaP39m7D01gyHMPpsWOxV+9Nc6n4EUV4wzOA5W39hf7uoMTTkd89kagLCoFF9Z+qjTGguDBDJkO2zTzwcIBfPtdt+9gE1iWv+V681AtGXIHLR7EFSRubCZs5vRSZVW9AgrSMU2QjPWOipseZs5P7uDnOBEGAngQ2gtnhMwA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB1787.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?wC2GACuppln8PDsCljvS2xzXUd3WUTo0bDfw+9Cvrb90oUYpgmy9o5zbegw6?=
 =?us-ascii?Q?wLZUhT7199DEFSOfKWOXW3DwuJrzuSv9oqT2NhYeKy17Z67l/qgFoXEEgL4C?=
 =?us-ascii?Q?1VaxInZlM2bPgCsbi+ufgOsSnio4qyrTPHSusTZ4Awl9HDS9hT+JoWNXfaw7?=
 =?us-ascii?Q?s+P3LXRxMNMDhFXsJbY2INC5Dc1xMZyIACLv1elvn98i9ByaG2AxdWx4B+ke?=
 =?us-ascii?Q?0TZ8lf6fSjHOJpjIkOkNmcp4PaNsbnj9UTzKnshuIEEdhNCNgx/J5qM29i01?=
 =?us-ascii?Q?YqvL9vvdf3NlERxQ82hqX56jPBobEwvwNsrpsFojxChfVO1Go1obL//87IMn?=
 =?us-ascii?Q?hnGkGQrALo4dozFDrQHYXhIKKyCPerUrN68l+oFZa+Vugz35g9PJOc3NORMm?=
 =?us-ascii?Q?Mg9PeBGm5Qs4lXpEIwEAaSOiSM64ulTtM9uafprrRkrV2P5ifwVufJGqTw/e?=
 =?us-ascii?Q?lrRqlF3Gm7krwp1rLogjpMTVXnptTLEzL+QHOoAQ5v4kmDV0FUflb31Ii6jV?=
 =?us-ascii?Q?/cy0/geSRMnFFGHpm2tAHViWZ2Sz7xQBLsdoUGm2T/9cHqoKBWqyeogx8efo?=
 =?us-ascii?Q?sqmgEn/8Z5PPSCeVwV4kV2s2hJsVwYfj0vz0oFnGYlKV9p8ZcEMgPWqu6L+9?=
 =?us-ascii?Q?42uSEfMN7xc+D7T+uizU6x+M03hfoc6A7jZPUZ1GHjJm/He/gNqzUGWNku37?=
 =?us-ascii?Q?vuQEk0zU84m6YIGswjy8cjC+/JPCE/wdBZvYmS7PK11NUAEqVWje51rUUTRW?=
 =?us-ascii?Q?4nVcNsSX7u7BVucIK/5ii58nf41wusjLS0GW9grXWCbR61IkpNeezhrbM+3Q?=
 =?us-ascii?Q?vTxKrxYIqr2m1LKCNdGi/kqJ1A1jL6+c3A2vS3Bol5WJ9QGqXCxrxSqTDzus?=
 =?us-ascii?Q?Rcp93WeUkzrXQLTtn/g4oiGxzxnmuZUX5Msrd+UMcc4HpeSHzTkny4RSy3lH?=
 =?us-ascii?Q?Ja+kbR9J/eRRof3++pVf0P9iCErWMUOzWITf/YCR64XSNPWRnbFXichxFdeT?=
 =?us-ascii?Q?9pHtMziYQ8L4F8Q1IC6s5lJuVLW2X0jD+3PswzAyUvyPsA5PcfDwt89VjFSf?=
 =?us-ascii?Q?htgO8znhVk+AgcJysUQzvBadIO9tU4150b7he7XvScCrN9hoDIdQs7bFqtbY?=
 =?us-ascii?Q?Q87ENn268VMiTPsn1HYo25KonmyraQReF+8RKwVz1yP8zwEi7al4VsjV1OBa?=
 =?us-ascii?Q?O+sfbRFxgBqAIAsfu/7W2m5GvMkfo5C8/pDZ9cc1u3z2UG3kMs0Ux36pfvUN?=
 =?us-ascii?Q?AbZuqgEpdwve3HAWY3qAb+PWtrsovroR9bPkpKPZ0vJQoK0ybxwDRzxqvYwi?=
 =?us-ascii?Q?Sirfv4PKyw40CJezSDgtI1ZT6GtDXmEzXvsqg+SQRt7HBuojvg7nyOmaIIzY?=
 =?us-ascii?Q?N2HpIpObLJXQSokD+aT31aPSh08+uJ47Y11sJqtysd4a/s/twdZrP3dY3Zts?=
 =?us-ascii?Q?h9GBSKHBayKVh8VBjnuo3vz+UlaOxwW7TBBKfQVWAZ4kZt9YGqEch9DZJP/g?=
 =?us-ascii?Q?If91hC+oAGq4IhglPfZNugnaBF/BavNod509aHBEB+ySdpaihstmY6V3NYAl?=
 =?us-ascii?Q?uwkYESevSQegIFAytWyhdDReGwVXtWvuXpb/MytmI9PD4/Aw6FYSA7svIqvQ?=
 =?us-ascii?Q?SM9zCoO0wzRYIm1Xe1tRlCBeyLdiHFB8fZdUJy6ankaMSDzM3x8SzJ+RcrTY?=
 =?us-ascii?Q?xwOmlEcX11izFotZimxF9SZCrAsu8nTV5LWZ4HfyzxZSybomfiStlbBDl9LG?=
 =?us-ascii?Q?dNqcyUKbGjbDNy9vQcw0EKTm0IOyJoo=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5388afd0-70a5-4d3c-a128-08df367368e4
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:49:01.9757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++A1Y913GFny7C90uoiJ3KFYvyC8Rkg9BAGeZ5Dybismfq+vGMopVXMWu/FWDR9IqasaUgl6UsRI6W4kE3vkK4JcDHxOvxcAG8bQFy1UsDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1769

Add support for 1920x1080 and 1280x720 resolutions.
The 1280x720 mode uses 2x2 binning.

Both 10-bit and 12-bit pixel formats are supported.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 120 ++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index ba6a22ced3db..48c406b2e544 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -456,6 +456,78 @@ static const struct cci_reg_sequence mode_2592_1944_regs[] = {
 	{ CCI_REG8(0x4837), 0x12 },
 };
 
+static const struct cci_reg_sequence mode_1920_1080_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0280 },
+	{ OS05B10_REG_Y_ADDR_START,	0x01b4 },
+	{ OS05B10_REG_X_ADDR_END,	0x0a0f },
+	{ OS05B10_REG_Y_ADDR_END,	0x05f3 },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0780 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x0438 },
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
+	{ CCI_REG8(0x3c86), 0x03 },
+	{ CCI_REG8(0x3d8c), 0x71 },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4837), 0x0d },
+};
+
+static const struct cci_reg_sequence mode_1280_720_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0140 },
+	{ OS05B10_REG_Y_ADDR_START,	0x00fc },
+	{ OS05B10_REG_X_ADDR_END,	0x0b4f },
+	{ OS05B10_REG_Y_ADDR_END,	0x06ab },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0500 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x02d0 },
+	{ OS05B10_REG_HTS,		0x0368 },
+	{ OS05B10_REG_ISP_X_WIN,	0x0004 },
+	{ OS05B10_REG_ISP_Y_WIN,	0x0004 },
+	{ OS05B10_REG_X_INC_ODD,	0x03 },
+	{ OS05B10_REG_X_INC_EVEN,	0x01 },
+	{ OS05B10_REG_Y_INC_ODD,	0x03 },
+	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x8b },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x57 },
+	{ CCI_REG8(0x3620), 0x01 },
+	{ CCI_REG8(0x3662), 0x08 },
+	{ CCI_REG8(0x3714), 0x28 },
+	{ CCI_REG8(0x373f), 0xa0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x14 },
+	{ CCI_REG8(0x37d9), 0x04 },
+	{ CCI_REG8(0x3832), 0x00 },
+	{ CCI_REG8(0x3c86), 0x03 },
+	{ CCI_REG8(0x3d8c), 0x71 },
+	{ CCI_REG8(0x3f03), 0x1d },
+	{ CCI_REG8(0x4008), 0x01 },
+	{ CCI_REG8(0x4009), 0x06 },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x4041), 0x03 },
+	{ CCI_REG8(0x4505), 0xe4 },
+	{ CCI_REG8(0x4837), 0x0d },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -506,6 +578,30 @@ static const struct os05b10_mode supported_modes_12bit[] = {
 			.regs = mode_2592_1944_regs,
 		},
 	},
+	{	/* 40 fps */
+		.width = 1920,
+		.height = 1080,
+		.vts = 1504,
+		.hts = 1744,
+		.exp = 1472,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
+			.regs = mode_1920_1080_regs,
+		},
+	},
+	{	/* 2x2 binning 120 fps */
+		.width = 1280,
+		.height = 720,
+		.vts = 1003,
+		.hts = 872,
+		.exp = 970,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280_720_regs),
+			.regs = mode_1280_720_regs,
+		},
+	},
 };
 
 static const struct os05b10_mode supported_modes_10bit[] = {
@@ -521,6 +617,30 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 			.regs = mode_2592_1944_regs,
 		},
 	},
+	{	/* 40 fps */
+		.width = 1920,
+		.height = 1080,
+		.vts = 1504,
+		.hts = 1744,
+		.exp = 1472,
+		.bpp = 10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
+			.regs = mode_1920_1080_regs,
+		},
+	},
+	{	/* 2x2 binning 120 fps */
+		.width = 1280,
+		.height = 720,
+		.vts = 1003,
+		.hts = 872,
+		.exp = 970,
+		.bpp = 10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280_720_regs),
+			.regs = mode_1280_720_regs,
+		},
+	},
 };
 
 static const s64 link_frequencies[] = {
-- 
2.34.1

