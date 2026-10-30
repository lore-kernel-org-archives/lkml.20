Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.85
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357333;
	b=TUujLZ7WNvLtm7n+eRzlqeWEkLMOlo7mVMMKF5l5BN9l6GJoVklqsJgLEh2vfYZ1xzRp
	 3c1/xaxJZ+iVfYZJqyFM6sBOLzZMfl189mscM9T2np8atFVxNRiovTiOkmfEm94KKKQyA
	 zPn7ugHv298wZ5esNvKxmXORutc8kuqPBoUFeIjrMhrMBXrfsE350iI2U3rg+Lmr2jxBa
	 SjHRpOPJkZ/TOQk1rjO4HmN2evIdJ3XFv0qAWzWBVyGF27SjkSQJZ1Pu8wUvcaPucm9QB
	 eAIsLHb0aspvSVSF9beu7wptMLsGJVCVbhJGkk1InLhxFCPtV22Q6CrJeM3D9WCOfdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357333;
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
	bh=EFa9H0DOJfAGUAuUI/NEV1TFJF/b8DmJzU/Ou2CZuNA=;
	b=RDmJNFZP7GT3j0bDhpFOvxb8913IlYFKn4o4EI03rvFqIIVwbpnZiqWDkutdJosQDjJi
	 3zCH+SXx+CaLUGN4e3tL6+5V6Z3/vXn5Tt1JOfPtt0gx1fD3ElUMB7tAbX87QLB0mJOwK
	 ueclq3twTi5F+cXPWoWcogneSnh05ATjAf/H0ntvUUzh/WE2lPFhwLrijkixIbWDxE52h
	 uGNftIrFFjGg9KFivGXNkY+1xlCQFSFskNYzhHYBMBmvb3CWYXpCQ0YxGX7SHHiRnTulF
	 49sK63YkKMkPg0Je/OynLBl7GpRHpxqOLFtc4bC5BdfiKIo6K7PNwmkv9pA512MI3TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=RxhgeRkj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.85
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020085.outbound.protection.outlook.com [52.101.225.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19CD606A336;
	Fri, 30 Oct 2026 10:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19CD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=RxhgeRkj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdnZmgQOtHhhoDcag4iBK7dWY+CGbefjDK2PT8GNZtC+kHgcuR3L46K+Fq0EztUihNWH58KVu6sE/KTGO3W3QdamHnRWsSDx8VW0qt3eLJkoB9K4rM1XvEJusQ2wubOqwcKPdjEQpvEIxrlXYGWskjJs5cd+jAl7m3mTXJJjSKzcEkuMdEfaJbJmdmh0JTEVoqXU5P9KcJ9F1rCXGMvx1K8vgE1gDwhUnPKQEVnhzCwQFM3YRew+LblSxSzoAU3UlmYXXYv8SMsDVwVJy12FX2FtkEpVt1NbV2NE1HrgYgCwqfSo3HfNd5HDH0Be7LbaVAWHu5fOou4KqsDJAe9lsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFa9H0DOJfAGUAuUI/NEV1TFJF/b8DmJzU/Ou2CZuNA=;
 b=J5oej0eAeVygKrQb0Ylr/cTIq6HbE2qdi9tnt8MQpcbEhuEhMYO2TWNb8GL8NweaonWs7/+HU/Wl4JRLQRcVA6nwdnO7xaG93refuPVj10CJYErmoFDJhzp8vonpOpxxZoUPWvWt8YJUM9d8p6Ig6oD7Za0zQlA5HsU6/zZhgiFIcxO2mlN6jkMq8+xhc9597Lau2eBpJupTJ2xXb8EcAhEfQxIj93IiYtoqBeA9HoN6yRWuPyzX2L6itKPSxnqOPMJ3gENI3JCpUZN9/33mVMH4geop+pZhWWIfzIb07fpt+6Kyxg5higuHGBO332lnv06r5rqK8iFHy+k5G4zO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFa9H0DOJfAGUAuUI/NEV1TFJF/b8DmJzU/Ou2CZuNA=;
 b=RxhgeRkj7j//q4liZFd0zYkw8/Dxs+Mg32HyoIyO4m1xyYmWT1OJgPvUlU4LCTCx79sIH+i1fslvRo8rjHmeqr1cHymEfCw2gmYaPn3PmfiJLl0rIPolclO8IHVOJqRPoWH3dUV5pIqChWuNhD4scIaB8EXm57bdNsWvqfIdLujauESdAsgB06jY8ee/8fqRd2KS6qzAaOXCCd2m+CW+w5zdvBXMOJxoNz3By9YokU4ivH6uWqpb9RT65864cNltn28DbDqUHqkrDcp9uVAMQWj9iC6rRfwV1sT16ZAMW9X3q0JBLdxERCyEg3Ynu8salnWGcaRePxFdrHlX/7epcg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN6P287MB5027.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:48:49 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:48:48 +0000
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
Subject: [PATCH v5 05/15] media: i2c: os05b10: add register definitions and use them in init table
Date: Fri, 30 Oct 2026 16:17:54 +0530
Message-Id: <20261030104806.1223991-6-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN6P287MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: e23631a3-444d-40d0-9161-08df36736108
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|38350700014|56012099006|261009223027099003|261021123027099003|261022105027099003|261028144727099003|261026140227099003|261021121427099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
 6SaX1xTc/xtUSmTHfSouy2woeULCk0AvKi4E1KSePuKDzEDKA0303kicKxHGU8+TX6y8Z/57isClFDFfbY5QeSkJKMB5RjF5tQVr/kGhe+rcIcWC6Lp4IJDEUws0dj/Z6IMFh/T2C2R+4sE89IZ6cEdh6fdkqv5bQ6E+1GytQYVhKbl5H0TIgg5G5cx0oZsY2ISQeHT4Wkol0ZvMaZr0OtJVKhcd8HgMkIonF21lkXWY62OX37asgagv3WKiKFQZepE4tfEd0TTi1KdHMMm4d3uIx/Xd0PWMZ0Fy8KPo5QqofGRrsibuEJZae6N2+UUHvo574qvos0iJ9xWvRr6nP15eRzDBDNX8Uq3OMwbxihbGc0n7IiwgJ2KQAiypFhGufRe1wsvZ5SVHqNhAhTq6RdtUJTD0/yoUeVnEgvAch4pjKXKABJK/zAyVWutqQmgMqfS5Bg8fxyOVouW50hswyI6FpDDIV+Xp6qoTMyP1xjUipvX+0LJm0tMtzT8sHEiD7tYB63IJxO7ZXdlSx9/OVinqfkT3L/16eyW4ukWieFEjzUsoWZ1a2v1SzOJMWJ2XhCAJykb5qTu5+o+ud8TT/FptT5qIXq/K3oSmkm6PUBQL/RPAAzty7RlsUexv9FEy70pWzAGWT9IVQO+FreVfVUAeNucBlo9E4ppLZtnqPmYEyygOpa+qtpRiobIJxzrFw3uT+SgyqgRW6OzxoV6loy/a/2Zu36oVwPBYb5f+SeY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099006)(261009223027099003)(261021123027099003)(261022105027099003)(261028144727099003)(261026140227099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?tU95gRK6BKrI3vq9A6o45c1ST6v9aEd3v4XZwoYtBOGFUk2zu/FhHMdkZTPj?=
 =?us-ascii?Q?tE76lJOvPVCP5wXfZGo09gm0zGxPM+WqfYZ2jD09dkM+2LQ8rwVr1F9Gq9t2?=
 =?us-ascii?Q?dxnNBvFnTi5CxPi+DxnwgOGpGLk2lZAMODU2+YjcB9wbKTXEqo8H8AgLlUAM?=
 =?us-ascii?Q?wQyWpWXumpL6qsMta3O5DaSuGqZOgFNKDK18NOlFLzMO8a76ilg625S04l2t?=
 =?us-ascii?Q?dlSjkymI7E4pStsDXti9iJ9mtqWlMAU2+vIHvBbPc8mjONLwh2VZSAsUM1Ub?=
 =?us-ascii?Q?vUpDxAtIVPZbCwR/FGOTW9eNCg8pHZIk5ClW848JCJwTCXKzgxhGWPjw56yx?=
 =?us-ascii?Q?9OKMYSNwr0bVnu8hshih3VsJCVNFdRDc1boXtLan51AhUfXowcru12cWWQMn?=
 =?us-ascii?Q?tt00irqTjk1mGYLVxirAq3XEhNUlHRnXzO7jLQVlz6+pqINIgNxFFYsRQViU?=
 =?us-ascii?Q?SNxPZ6pRHLk9tIqSWIiF7R+7xevT3hzCSH+9NKRhtm/dM0H73byP/nSTtCP7?=
 =?us-ascii?Q?euapZwCG1xOgm6fo6+1RhG9U+9lDoCyNeu5Z8nre9oGbE+8XYIjPHgtrQq2G?=
 =?us-ascii?Q?fF8U/0FCAIu/Y11DJL+1i2UoXbyxGew4HsP3psqynWw4c6pnsBzRLKgKeIdI?=
 =?us-ascii?Q?lMX5IiMBkEoeGrKq+1BK03M+E+yBd9g8GHaS/hI5QGg2zCeak/C2R0Pg3l8C?=
 =?us-ascii?Q?s11vIrRp2JmeITXGKaDOpao6Yg9f/MGwmVG3hI5g8ZtFhwypimvBJxGmM8sr?=
 =?us-ascii?Q?Re+zul49SMooBxdefiBtyPs+/I4zZrPX+4hRpiC+fgC7s1s+Ita9QSQXlPIC?=
 =?us-ascii?Q?oJMXrif1XPas9rnaE3kMK45sehw3X+PLCkW3yOszsSOKY38CkJLtcj751ktu?=
 =?us-ascii?Q?EaYGa83RP7+GR0p+VBiYLMpvl2Zn8SR37h8M3bZNk75FGdCp1s6JHQ3FOyiK?=
 =?us-ascii?Q?/BZY2CeqEy4eAZUhTlvUzQVLqsHxhGO+6Hzod5TcH5SSeACRYCkClu76dqYz?=
 =?us-ascii?Q?grGv5UY+JB1uZFl5I/NftK0vog7Y4pGm1Gai2t1dEPJD1ASE4a/pMOEkHzID?=
 =?us-ascii?Q?/oIdiQYyApIUTA9Pjka/ruuZeEjAjL6hsreUBueEAkrAyGzl25d7x268E55V?=
 =?us-ascii?Q?Eq6OPMuCPe1SasbMGyg4woAg3PMj0PmdGVcFGvjBhphcG+U2W4nAlmk0VMhf?=
 =?us-ascii?Q?KrYj/nKNNjpwkeQTuonOZw0WULNxN2kEA5htp1dujb+YfvdszY2Tx61XCYLJ?=
 =?us-ascii?Q?7FYzrV/CQ15wq26jyVR+Fov+IHSGQiFQpgCcz4oRT/I2yJdlOr82/x3Ftec7?=
 =?us-ascii?Q?bvxQJIGFgDqyQ0pXcHEHpeI2RuJkzN73Eek2Lu56/ZlBVw4ROD6P2IXGjHar?=
 =?us-ascii?Q?lpJ8MICGLitUR2TNCqj5X9q9nRKG9lkHL2Tqxu/xYJBxpFShR7s6JS812QVu?=
 =?us-ascii?Q?mkYftKkqmcvVsvL/is23OT5v2JP+l99kv+QMG//qekjSyDsbOmmibrmSM524?=
 =?us-ascii?Q?wHIdPACcKbh6kiKv6Y2iRN7t95Mfve7a59Fsciab92Hb/Wb0PuEpNJNmg+oN?=
 =?us-ascii?Q?YVVhnKjOGbOsKNGlzeXpNXXwaCrUNwEtn21oab0i5yLOzmPsj+oNoTj6elAy?=
 =?us-ascii?Q?6MP4lZBPbLgd6JA/oDlX/mI4UUG1J5MEAImKr1YGfOT3s9BjZb4Zb1mCmf3M?=
 =?us-ascii?Q?/tzgNOIOvwJGU6zZ/uhX9O6g/GpGkiUArd3Hrgvwcj1CmXK1vdPaor1iGUyH?=
 =?us-ascii?Q?Liym7X8bEBD0z2RpFH8/LFky4qHihms=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: e23631a3-444d-40d0-9161-08df36736108
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:48:48.7848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9FE7Ei8nmrOWj2lMaDFHQZj2LWdkkMmN5IBwI724WQJYHbA9EqtsRZnXpYY5ZIlSVuyVBNluzUGtJpyp9gGHz4f7DLryYa0KcbUxFw13Rs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5027

Define named register macros for OS05B10 and replace raw register
addresses in the common initialization array with the new definitions.
This improves readability and maintainability without changing
functionality.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 108 ++++++++++++++++++++++--------------
 1 file changed, 67 insertions(+), 41 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 7f6cb4c7edc8..3f478bad1fbc 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -38,6 +38,16 @@
 #define OS05B10_MODE_STANDBY		0x00
 #define OS05B10_MODE_STREAMING		0x01
 
+#define OS05B10_REG_PLL_CTRL(n)		CCI_REG8(0x0300 + (n))
+
+#define OS05B10_REG_MIPI_SC_CTRL	CCI_REG8(0x3016)
+#define OS05B10_4_LANE_MODE		0x72
+#define OS05B10_2_LANE_MODE		0x32
+
+#define OS05B10_REG_MIPI_SC_CTRL_1	CCI_REG8(0x3022)
+#define OS05B10_10BIT_MODE		0x01
+#define OS05B10_12BIT_MODE		0x61
+
 #define OS05B10_REG_EXPOSURE		CCI_REG24(0x3500)
 #define OS05B10_EXPOSURE_MIN		2
 #define OS05B10_EXPOSURE_STEP		1
@@ -47,13 +57,43 @@
 #define OS05B10_ANALOG_GAIN_MIN		0x80
 #define OS05B10_ANALOG_GAIN_MAX		0x7C0
 #define OS05B10_ANALOG_GAIN_STEP	1
-#define OS05B10_ANALOG_GAIN_DEFAULT	0x80
+#define OS05B10_ANALOG_GAIN_DEFAULT	OS05B10_ANALOG_GAIN_MIN
+
+#define OS05B10_REG_DIGITAL_GAIN	CCI_REG16(0x350a)
+#define OS05B10_DIGITAL_GAIN_MIN	0x400
+#define OS05B10_DIGITAL_GAIN_MAX	0x3fff
+#define OS05B10_DIGITAL_GAIN_STEP	1
+#define OS05B10_DIGITAL_GAIN_DEFAULT	OS05B10_DIGITAL_GAIN_MIN
+
+#define OS05B10_REG_ANALOG_GAIN_SHORT	CCI_REG16(0x350c)
+#define OS05B10_REG_DIGITAL_GAIN_SHORT	CCI_REG16(0x350e)
+#define OS05B10_REG_EXPOSURE_SHORT	CCI_REG24(0x3510)
+
+#define OS05B10_REG_X_ADDR_START	CCI_REG16(0x3800)
+#define OS05B10_REG_Y_ADDR_START	CCI_REG16(0x3802)
+#define OS05B10_REG_X_ADDR_END		CCI_REG16(0x3804)
+#define OS05B10_REG_Y_ADDR_END		CCI_REG16(0x3806)
+#define OS05B10_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
+#define OS05B10_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
 
 #define OS05B10_REG_HTS			CCI_REG16(0x380c)
 
 #define OS05B10_REG_VTS			CCI_REG16(0x380e)
 #define OS05B10_VTS_MAX			0x7fff
 
+#define OS05B10_REG_ISP_X_WIN		CCI_REG16(0x3810)
+#define OS05B10_REG_ISP_Y_WIN		CCI_REG16(0x3812)
+#define OS05B10_REG_X_INC_ODD		CCI_REG8(0x3814)
+#define OS05B10_REG_X_INC_EVEN		CCI_REG8(0x3815)
+#define OS05B10_REG_Y_INC_ODD		CCI_REG8(0x3816)
+#define OS05B10_REG_Y_INC_EVEN		CCI_REG8(0x3817)
+
+#define OS05B10_REG_FORMAT1		CCI_REG8(0x3820)
+#define OS05B10_MIRROR			BIT(3)
+#define OS05B10_FLIP			GENMASK(5, 4)
+
+#define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
+
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
@@ -77,30 +117,25 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ CCI_REG8(0x0301), 0x44 },
-	{ CCI_REG8(0x0303), 0x02 },
-	{ CCI_REG8(0x0305), 0x32 },
-	{ CCI_REG8(0x0306), 0x00 },
-	{ CCI_REG8(0x0325), 0x3b },
+	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
+	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
+	{ OS05B10_REG_PLL_CTRL(0x05), 0x32 },
+	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
+	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ CCI_REG8(0x3016), 0x72 },
+	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_4_LANE_MODE },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ CCI_REG8(0x3022), 0x01 },
+	{ OS05B10_REG_MIPI_SC_CTRL_1, OS05B10_10BIT_MODE },
 	{ CCI_REG8(0x3107), 0xa1 },
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
 	{ CCI_REG8(0x3503), 0x88 },
-	{ CCI_REG8(0x350a), 0x04 },
-	{ CCI_REG8(0x350b), 0x00 },
-	{ CCI_REG8(0x350c), 0x00 },
-	{ CCI_REG8(0x350d), 0x80 },
-	{ CCI_REG8(0x350e), 0x04 },
-	{ CCI_REG8(0x350f), 0x00 },
-	{ CCI_REG8(0x3510), 0x00 },
-	{ CCI_REG8(0x3511), 0x00 },
-	{ CCI_REG8(0x3512), 0x20 },
+	{ OS05B10_REG_DIGITAL_GAIN, OS05B10_DIGITAL_GAIN_DEFAULT },
+	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
+	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },
+	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
 	{ CCI_REG8(0x3610), 0x87 },
@@ -274,34 +309,25 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37f5), 0x00 },
 	{ CCI_REG8(0x37f6), 0x00 },
 	{ CCI_REG8(0x37f7), 0x00 },
-	{ CCI_REG8(0x3800), 0x01 },
-	{ CCI_REG8(0x3801), 0x30 },
-	{ CCI_REG8(0x3802), 0x00 },
-	{ CCI_REG8(0x3803), 0x00 },
-	{ CCI_REG8(0x3804), 0x0b },
-	{ CCI_REG8(0x3805), 0x5f },
-	{ CCI_REG8(0x3806), 0x07 },
-	{ CCI_REG8(0x3807), 0xa7 },
-	{ CCI_REG8(0x3808), 0x0a },
-	{ CCI_REG8(0x3809), 0x20 },
-	{ CCI_REG8(0x380a), 0x07 },
-	{ CCI_REG8(0x380b), 0x98 },
-	{ CCI_REG8(0x380c), 0x06 },
-	{ CCI_REG8(0x380d), 0xd0 },
-	{ CCI_REG8(0x3810), 0x00 },
-	{ CCI_REG8(0x3811), 0x08 },
-	{ CCI_REG8(0x3812), 0x00 },
-	{ CCI_REG8(0x3813), 0x08 },
-	{ CCI_REG8(0x3814), 0x01 },
-	{ CCI_REG8(0x3815), 0x01 },
-	{ CCI_REG8(0x3816), 0x01 },
-	{ CCI_REG8(0x3817), 0x01 },
+	{ OS05B10_REG_X_ADDR_START, 0x0130 },
+	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
+	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
+	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
+	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
+	{ OS05B10_REG_HTS, 0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
+	{ OS05B10_REG_X_INC_ODD, 0x01 },
+	{ OS05B10_REG_X_INC_EVEN, 0x01 },
+	{ OS05B10_REG_Y_INC_ODD, 0x01 },
+	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
 	{ CCI_REG8(0x3818), 0x00 },
 	{ CCI_REG8(0x3819), 0x00 },
 	{ CCI_REG8(0x381a), 0x00 },
 	{ CCI_REG8(0x381b), 0x01 },
-	{ CCI_REG8(0x3820), 0x88 },
-	{ CCI_REG8(0x3821), 0x00 },
+	{ OS05B10_REG_FORMAT1, 0x88 },
+	{ OS05B10_REG_FORMAT2, 0x00 },
 	{ CCI_REG8(0x3822), 0x12 },
 	{ CCI_REG8(0x3823), 0x08 },
 	{ CCI_REG8(0x3824), 0x00 },
-- 
2.34.1

