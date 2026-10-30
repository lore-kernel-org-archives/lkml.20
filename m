Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357405;
	b=4XThbVWXcgWFWcbkvHYVwm2KI0Izg6KIoSgqhG0GFKhWQXhrEzco9kv7bx5UjCa81hQi
	 Q156gT73JPhh7OGjYxsm0g89z0+CzPuUtVc6VHV+/X8AvqVPxO1fmNgORlokk0+7AehCZ
	 J3eXn8dfmU28wqi9pdvfTjYyShRRd36Ubfr3GX/pJXBCOSqCnvulrqZuzLwgafhPwGKhg
	 7qTF3ld+PMOkt2tQUwPj43wZq/LMRMaMR3/fN06GW9+CNS8/++OVj1iwUSKyVLSSqHoTP
	 6JLOHqcqyT4ET7Kaa0dYss/QQ9Q0dlQrvDTuk1B3sJ3lmiyTZbfdO3QzsTbDdx6JSYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357405;
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
	bh=UBZ55AVg375ubyuavUBAY3z9O1elTHlf0FlR8u3qRG8=;
	b=EL/U2ZrWUvyjzxrA2N0a6CHlSMEr9wOx/wQA3blIgfdDWyeUKYhcuUK2yvALZ6z6gQG7
	 DRhqvJu3objeXIqsucdmWFJGPpjvdMfYAzlG+dsChpjLqvPjBcHOZpK4ffHmGxDvAK1hm
	 rHnyFRaEbeR3XeTT1jf15sV8kWWR55Q3RIxXdJ59mKEI5bk4bcpK0LBkCTyhbPh3PHps5
	 XrSjs9diOeISeWaChQ8AVCpYE3blHxf4lEtgcBc4+zb5oW2qWhRff1OrxWLiBPAAtO0pf
	 6AG735HjYvl7rm1ZVERwErMnFDpkLdW7Q4CZwjyMwRsGIyu/GUCZsFXK1rCNdUFZ68A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=SyIUb13O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.114
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020114.outbound.protection.outlook.com [52.101.225.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6371560A263E;
	Fri, 30 Oct 2026 10:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6371560A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=SyIUb13O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FclaCJtvQHo0YRg1MWImYdNjA5N9Z/+9+Ry0Ex5Yp5pYmO8eGcG8x7ku6f7TYXGIi9N3Wp/YT96o+PLR/AtPKFwCfbVHNctqaKXrQPsfkxDXceP0wQDuhHF1z7YGpyi+9ebqKBJ+pzDnXDlvzzsWR4cBTawqZEqabnbBeCVELXq2nwS4D5wMe1vjc3huLg4nRhmlUeQA8VsQ+gAhHFsYzXlIp3FnboRf6z+L0+AcLjrZIr7D/SLJMBPGPStQqriiCA/QwlxkYa8awhPKtLizmxyUq3sBx1G3/UzjRoAzaV0lsIObVkSrnTz4mwXhnuuBgUUJED9Zgw1tvfS84xQlmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBZ55AVg375ubyuavUBAY3z9O1elTHlf0FlR8u3qRG8=;
 b=wtxo30zgwgQ0FZGCgvUrRYUZCapso/AYvVUgbBZnxyubWSN3yeQjgMttzrTNJCJzcN6hIgEP1fLD4c5C6ePFV6j3dxEgF1ts8DrpdrW40Umu29JaCBu/6yl5CgbkErTJMsyzZINhoPAv9aRq41IP9qkuk2gBrgnNwhX5NbxIlfhmibKAdyyzaMMWL+pYiOBwpSdVNmZTbu1M8Ni6usGx5bd4JdkpY4Z/xCNBYeoqxh3j4G5Fw/uzpo+4gh86BEr+ELEEAscam/WSn9AlHtBN3B8C+flulgysx0Kg4bzR1BpeWhQ11+ZHyfsGquSuduRKN+1tjxmNPqTt3/T713HmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBZ55AVg375ubyuavUBAY3z9O1elTHlf0FlR8u3qRG8=;
 b=SyIUb13O+0l8uKjCyD55IvEg5pYE1XLSoo9hyky/PWI9LLzQmivKGIjFHAZEm5xnVWXts/KT2XGwGejqgrXgQYU555a/E8wT2FUqwiTMMgn2boXTdpgxu35iAmxcxp45aczqdqjcLL7YhS+YBEzC5x3/9a2FUuNu/SQLn+auNTxH4xupsLYWZ3GxTmEhfiCk3Ev8nMtwj0Nw1jbSg7u6scMZNpI6mU/zt9LlVx6EbiDkg7MgIcGV97PSxtuK+pKIfk9dDEUO0qzvgUTiGfkAQ2TfCwIymkmZ4HEYk0JMs3l9Yxzac/9LWztgk/YIkE6g+FoaZC+oOVmBjkboLODkHg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN2P287MB1787.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::8)
 by MA0P287MB1769.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:49:59 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781]) by PN2P287MB1787.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:49:59 +0000
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
Subject: [PATCH v5 10/15] media: i2c: os05b10: Add test pattern options
Date: Fri, 30 Oct 2026 16:17:59 +0530
Message-Id: <20261030104806.1223991-11-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: dccc5b4d-a4c0-49fe-536b-08df3673668e
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 uPU1VrZs+KQ447cTSjskpNull4spByddPE8JeJfCEHJAzSQUQeRk6cjesVI3oTrmZNFNcV94rWARoiiSK78UxTqx7Qd0x2c0EetBciE0qJLxofK/W7Nrda+JgH1LK1Kl3yBdpUMTby3M2wVyz7mMhN12sn3vi7uKb6c6aszLI9kVLd4wLhM6dHk20mBEqJQ4pmuOlh8MK7EIRA7KNpG/Jd3fIKOeHuLXsLmJZSG8DVVkU9mR6mxm8P8l66KLvIKSlG9HqOmXU7w4jINJmt9qHOYb5RSJf0SJfD255azcFvb6PgeJJAA0IdxQBYc+/lHBfaSJGTjLlV0OKkKWaOtRD6IeENVm/H+xPTTWpUbYh6P1cZ1krVVpG/poTNhSvaDBTkKJmtCJMFZsMQasdJuA6/RroZVKuECKxD22hNg+j66xQwWnd+zTyEoRx24K0D3s3ETNU/qE3Ly90EZbAMtQuH9lzsBGHZTSujPK5Lrb0A6SCRFxrb/kJj666uAt7oL3jkCR5MMoQC0LENb9WJ4bG8VWH/qel341vnyaCEd3X2fiBJ/2oFM5wWOA7cd6u+icn0r869xzAvz+eTNeEC8xxl7DA7rVkgLBeIoOZHmipaQzYhRHlM1woi7+HhH6F+ulv+CWCW8i6klCX/pOnU4RcxgvmSwW85s6fU5ud7Y0y10vvVE0vn/1al2C/2GTmWs/oaBKptZVu7mVmvVnyKRHIfGgpilqjLFyZDai+zeFPCM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB1787.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?T+TonxWkzYpUxJtBqUsmMawYGkjc4c/7QKM3sfiez4YbNSvQNwKfkE9Fdo4u?=
 =?us-ascii?Q?SLwsmUedcE37pB5P+dzbexWGnzJjVld5fS7knJRjXMH8qSlzh9SiVSh5IO/I?=
 =?us-ascii?Q?cqOiwJPym/K/g+D6HUAUe1fSMMFejk27ZVz66kG40Ywt0y+7oOMpTimTMCBy?=
 =?us-ascii?Q?EItBpZXhj2cH/UHuw1QaZrOITOUl1Nthx13gIOywYFqf9OAjFAWXnfkuoUU1?=
 =?us-ascii?Q?C56mIG+1CKQkgVlsJYLEjxGjm6pGEHIxn/VWcPbsWu70fwZJ9/6jnDmPJhAY?=
 =?us-ascii?Q?SSBF6WbkZu8/PmJ+Ot/Wrk+G6MpDmnYbmLlsv7Dso8DY/O8NcGXP9ZuNfrkJ?=
 =?us-ascii?Q?kM5pac+mSiNVopVUTOm5IaDnsM31sqE0NRwudU90+XlLQci6xcJXDEq2o0A8?=
 =?us-ascii?Q?/07alKTVEgjZbfbgVRiaOE2ruQlSR5NTRRr7ZF5VPs4C9UMc/5Cr5OYmyjmO?=
 =?us-ascii?Q?7ZPdRkxO+GIe5ZoZGh19ZBqo2SPv3HeY0Gq7pTIUSOBsolgG/bvtP4EFD1f2?=
 =?us-ascii?Q?rSjoj4mA0+PsyceHOFdHZqVWWuvFEK056ivEex+/0d7U9VO6Bjo9D2LnAhZF?=
 =?us-ascii?Q?pbLa4+Yv6NwvwEprzhO4TBTZN2Nb4km1Q03do49zSO+DJGBRTkpwLDlExF8P?=
 =?us-ascii?Q?kZb/NfZtCT62BaoFaCarymXRHQsUpJ+J7luckFQobTcre39Q9T/KkNND2uiB?=
 =?us-ascii?Q?BVwdGW549fnFQWwGX7YNJTCmQioib1FiJCB1FJMEr0tCyC3JkbbeYYnvdc1u?=
 =?us-ascii?Q?G+MnjwxHhPf5o01Lflorripokblnvylj4Lv65arZYSzDSSUF446HaDye65v+?=
 =?us-ascii?Q?US88q0y8OXPoQ59Z8fELCaoKSMQxf1KP+RLHnFVieXUX022O58PUD0CwsCO1?=
 =?us-ascii?Q?VP2SlfjoOgatTWK6h0U6FIYolbBGodsas4/EI2P9/Nn/zbDcpuzgTxEhA9pD?=
 =?us-ascii?Q?g9EBARmXfJZ6rR105kE26BxbusXuvBh6CHkz3awYK4Is44gSWoAwHAA5UYQa?=
 =?us-ascii?Q?YQE2sAfGqk/BrIwD3xGRGlSymoaZdyX4Mh9v6Wev7coEUNtrvUTx5Jirxl+O?=
 =?us-ascii?Q?sxyb57f05kF2NZigHD61PGsLcRKjV1mW2Dqkcjcz1tMHOJgHER18BhjjJx05?=
 =?us-ascii?Q?9tIyThupmT+txyH8iSEXIAu2AAJJOoYZL59yLBJ0ghRvfHKst8gnIZjET2ad?=
 =?us-ascii?Q?V3ScaX1C4+eH2J0N0XL5LRwz6qkSZdwIzks0FcPTbg2fZybkcdMbDK7auvqB?=
 =?us-ascii?Q?H7S1R/PeNUXVVfob/EdWYNaTAfXB9TV/MMwnr7URz5DuRXvJZ1qirAT5Xg60?=
 =?us-ascii?Q?wZLsiNha7cBSwRm4oqo6nUQoUF/FXOoEcdu7Vc6zMyH9Z/6EINmhoLZ90MuR?=
 =?us-ascii?Q?UAFJjpZouRcWD8aQ9fcAJLIWeU2W9AiUpRWNy177GPpa2FvkM6/jVNrOK77x?=
 =?us-ascii?Q?H5ILQkqeZQNiqHQKU/lSZxkZuctQlrkh5epJNYVghOXf6VrXYJtPvbSs5F8j?=
 =?us-ascii?Q?L1mBqRJI7W8eSH7zWxiDe5D/QcsufQCMJJRbWS6H6fqCbPncvY+FTILH+ub3?=
 =?us-ascii?Q?w+xwLbwzJNxi0NQR8hXw5ZfZWYSGAkl9Gc/zcR3UmJc/9bqpI3teLLKM76Ns?=
 =?us-ascii?Q?mSv/02N3bIdg0my0me6nb5DyM6MmDMK1NXgqNF13GafZtsrdhpgEu7AjX7Zn?=
 =?us-ascii?Q?qWUZGxgj87mrZDb+9XE38oqGFbJthuAdylh2hjsUCQPIXNZ5mlvfAAN3tF/2?=
 =?us-ascii?Q?zxyCfeML+MX9RknrrwLB3GKc8d8UreY=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: dccc5b4d-a4c0-49fe-536b-08df3673668e
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:48:58.0734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FNScUHzauHd0x1ycBM3tVi9X5HPd3pdngkOHprU7kJZ2W8GLz/xCOrKGW414RkOomg3FgzCC4NYPXGfhlNDGhVyTDLlZpO5ELIrgImYpfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1769

Add V4L2_CID_TEST_PATTERN support with multiple sensor test-pattern modes
and program them via register 0x5080. Drop the fixed 0x5080 setting from
the common register sequence so the pattern is selected only through the
control.

Removing the default write of 0x04 to register 0x5080 does not change the
sensor's default behaviour. The value 0x04 leaves the test pattern enable
bit (bit 7) cleared, so the sensor remains in normal streaming mode. It
only programs the color bar style field, which is ignored unless a test
pattern is enabled.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 55 +++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 4b87ef60a2a7..48c905165954 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -98,6 +98,17 @@
 
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 
+#define OS05B10_REG_PRE_ISP_20_0	CCI_REG8(0x5080)
+#define OS05B10_DISABLED		0x00
+#define OS05B10_COLOR_BAR_1		0x80
+#define OS05B10_COLOR_BAR_2		0x84
+#define OS05B10_COLOR_BAR_3		0x88
+#define OS05B10_COLOR_BAR_4		0x8c
+#define OS05B10_COLOR_SQUARE		0x82
+#define OS05B10_BW_SQUARE		0x92
+#define OS05B10_TRANSPARENT_EFFECT	0xa0
+#define OS05B10_ROLLING_BAR_EFFECT	0xc0
+
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
@@ -391,7 +402,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5004), 0x00 },
 	{ CCI_REG8(0x5005), 0x0e },
 	{ CCI_REG8(0x5036), 0x00 },
-	{ CCI_REG8(0x5080), 0x04 },
 	{ CCI_REG8(0x5082), 0x00 },
 	{ CCI_REG8(0x5180), 0x00 },
 	{ CCI_REG8(0x5181), 0x10 },
@@ -507,6 +517,30 @@ static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
 };
 
+static const char * const os05b10_test_pattern_menu[] = {
+	"Disabled",
+	"Color bar type 1",
+	"Color bar type 2",
+	"Color bar type 3",
+	"Color bar type 4",
+	"Color square",
+	"Black-white square",
+	"Transparent effect",
+	"Rolling bar effect",
+};
+
+static const int os05b10_tp_val[] = {
+	OS05B10_DISABLED,
+	OS05B10_COLOR_BAR_1,
+	OS05B10_COLOR_BAR_2,
+	OS05B10_COLOR_BAR_3,
+	OS05B10_COLOR_BAR_4,
+	OS05B10_COLOR_SQUARE,
+	OS05B10_BW_SQUARE,
+	OS05B10_TRANSPARENT_EFFECT,
+	OS05B10_ROLLING_BAR_EFFECT,
+};
+
 static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 {
 	return container_of_const(sd, struct os05b10, sd);
@@ -522,6 +556,15 @@ static u32 os05b10_get_format_code(struct os05b10 *os05b10)
 	return codes[os05b10->vflip->val][os05b10->hflip->val];
 }
 
+static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
+{
+	if (pattern >= ARRAY_SIZE(os05b10_test_pattern_menu))
+		return -EINVAL;
+
+	return cci_write(os05b10->cci, OS05B10_REG_PRE_ISP_20_0,
+			 os05b10_tp_val[pattern], NULL);
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -584,6 +627,9 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		fmt->code = os05b10_get_format_code(os05b10);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = os05b10_update_test_pattern(os05b10, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -972,7 +1018,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	        return ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -1016,6 +1062,11 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
 					   V4L2_CID_VFLIP, 0, 1, 1, 0);
 
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os05b10_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(os05b10_test_pattern_menu) - 1,
+				     0, 0, os05b10_test_pattern_menu);
+
 	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
 					      &props);
 	if (ret) {
-- 
2.34.1

