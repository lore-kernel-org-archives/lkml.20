Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792739568;
	b=TMWi1QZzRulmAeRtlkzSAspXpWzmPL7c0YY+br7Uv+YAgJeF9LIEOK6GDv0FkUU24zyP
	 34OziOqbYNEn8JyPK38YfEqZ8QDSlELdPV+U3p05z0sCk/YSlwwWzsetmh+YdPA500ktm
	 axqnblEaSn9bgbUdBfTwIvXOJE2losx1jSo4oSfOhmK5NQnhBRN6m9Cu5hWN0XqDjmwbW
	 D+xGHQCYRvhfj5vBN4oE2r5P/SeYYQKvBMvM60nSUGws29zFlVIri8r0t7jEajMHysfI2
	 isbboSHa8Dw4I3L4tk0tdVwXgvgzjXBMOyBEsuZA8cPM7TfJLCUJtI+/L2HZw2xOe1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739568;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=Gr+jTxUdpo3NzhN96117APqhMup6YbHFADkHGVg4KxU=;
	b=Pv7HYazc8DKgoeoykKUXgEnGfNBiDOq/bOu5UnbdTLt9SZvGyuF8Jpjeimxm5nXjWTn9
	 lzKMSppdtQu/nkkXvaaL0nj8cUPXr/wgJoJd46KuSg2kWmI4cclIlpnZcyw4UaCw4t3zM
	 MQVXF4rvH1M1uzkVBpZqf4mXj2ddu0/owfsHhFREh98SC3dkKevMul3LtXD5wWwA5i5Fx
	 fCvzzq8ASU+D9Srf2lEkiYSBJ+33JoFV2OzN8fLyxRFbnlLjUIW9A2TlIZQLgX7W5rs5F
	 MK5Sg+KrNKbNpmvxGKe30BV1mxFbl7rT06trSigCbClho1uzc4wiv+YWy3srsoNN3+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AnQx7pvW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.64
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C040F606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C040F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AnQx7pvW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTAUxQddCZBJULS5maBzMQQ9kDQF0BpteYDiBAOe4qThngJ488IEtKxahXQVhGbbFUi9tno5w4s+RTM+dRD6GakmS9l0T5J3en4klUBJ3ru1/gOZTavvKo1FIYUKchLXc317FB9Vb/w2VibSWWCgueENJlO2kqNcZiijHDArzoppVyPPn2XDbiIz+q9VFzFt+BKSj17d+MinMEe5O9DYhYfTGII7P1rDy9377NmvvF47kXWApILAxsTUDEuXYSNOtKuk1qcHV/CvKqqPUX94hoCvMqqmyveP+3q7ycFPqIoqLAdd7cYoyPn0ndQzZxIbwEGOLfdY/LiuE9Ln6j9YGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gr+jTxUdpo3NzhN96117APqhMup6YbHFADkHGVg4KxU=;
 b=T0tudcpDQbktIq4OaO6WJTyqb9BSNjUwJAaeAzLcNzKNWwo+W1OpDyp+iTwx8SMPNwYYS7VHXfXXSiSS2rqx1GDyrnCA6gIR2kzKMnymxwzALGh1XGuQzFhiEgsXYSTc8oV22j6XDgqAygBuiCcrKfFMY7H8hriORHUtBQ7fMnw9O24qu6cpmteADpiR+i2aWZ1iXT7bfBSosx7rwxDdfIe7n49Ltk8doruhdc21qtFetF5nEb2Y9YObRcIwTgTE/o4mao/Humd3/OLAlxmz/ehL+GtmfTW8sgO26buRRYi1V4T213OYWd0RkYwNnct7Yiww3qGOY3hjGtRQATHAew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gr+jTxUdpo3NzhN96117APqhMup6YbHFADkHGVg4KxU=;
 b=AnQx7pvWBIoI/cEdbgeeSN8tBxybOiI+jbgVT3M87E4WyiHiWaz1duuDZNAlIvZJ7PzfZ8Upnvsc194iTg2n1s8XyKnFduboL89JzTmFpgZ0R08pPaJ+0isQJ7fTDzprlqerXMF7EZwQReeAEEEheKvL0urinTeoA7Nm6YFYvfD8gusqPlhAGFPfjn5euVuANPKYe9XzvqHEPdd+heG8xiEp97055ZvF4w10Wq4KjPjcn8kxzF4PRegCmxgq+ZA7xbt/dwaheeOlDjoZhjPVumanasqR2ItM+QdazG+0Mq4EzWx9fp0jcEXLAXOwD+YKTV0EpbKGMsTrdhGflb3FvQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AM8PR04MB7412.eurprd04.prod.outlook.com (2603:10a6:20b:1df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 07:12:45 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 07:12:45 +0000
From: shengjiu.wang@oss.nxp.com
To: p.zabel@pengutronix.de,
	krzk@kernel.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	alvin.sipraga@analog.com
Subject: [PATCH v4 2/2] reset: gpio: Set can_sleep for the shared reset serialization
Date: Fri, 23 Oct 2026 15:16:09 +0800
Message-Id: <20261023071609.3795354-3-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023071609.3795354-1-shengjiu.wang@oss.nxp.com>
References: <20261023071609.3795354-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0362.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::19) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AM8PR04MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a14803e-bf6d-4247-e823-08df30d50977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|18002099003|22082099003|10067099003|11063799006|261009223027099003|261022075727099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ONwKPvcunkPtNS8bJ8U9Ncqs8jBVFuVnQ2rDVH5onvIefUWaEWa+N1juJjDihJKMEShearow8JuLuTmlsW4A47XXHFIshMoTTpq9YaNpTWeeVVC1NC1uxwCgSkiQDDJKMFCsWhvfNbbxhyZHC5IliQoXzMdKuFboI8ex+u8CYOvmaLO4/ad7RYwysU4Yz6UeC1F9+WPx//zYmSOLWpL/o/uWJT5muQ6hGRUHp12KJVmlP8KN8GosJfG4Z33dPoJ4OQ11I8T75dUOphr7+QpYYw8MMSLqbfGCjpL/EeVZ6OAj+lycD+CiMsL1IDBNDcGYJyZTHbiEme9KY6+xIFR8yIN7nPM8mHST6y9kHxECm3UNlb6iLAa2/JACe0hxW2zk5STFZvac5/YCC8bIec9f4Fyh6xaWI39UQv67ZgswsfGtxhkn0Zb2ttvOzvJ2++ZMp4mh7/75LtsIbOSbrNo/MBn4Cu1XQR1f1P0UaMd6rU6DKVxFYsPoNq0qVENy+2+fNJ5cJFWAoSBALol0L7o0FG9Dw7Ug+eGmg5Pz7XbFUVn6uCDWALyD5v2NiY4UQ3DdHZWSK3W7CFbK0Elt1CLGKGGnwpGpH8VHXAEvirky8lDxu5eEa8Cdiqnz4TqzBJQBIHubGpZxU9+PXOIk/mybQmZuL3oxqZa9OqdG6qN48SM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(261009223027099003)(261022075727099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TBj3lMQI0T+lZm7fKTtUJLleXlsYTdBfAjGHVRTS4Tn7etS401oJJdhX7DZ4?=
 =?us-ascii?Q?ZmAW34MW1GTnVani+EQTeVAngj2ltNyzckfPWXHXNoadpGc1BvNeIYbMNuOf?=
 =?us-ascii?Q?Pxpy9Ev84qIxJfmWshFjZDVCBihEGkbjfbIG6e2AY7DmLlaeXaeujPXx+5dE?=
 =?us-ascii?Q?IAlbcCw3eiWmqWgmcrrbIXCBw1MAUXdLC9QaREJpyvV22qlqhQF8PqWsZCyw?=
 =?us-ascii?Q?p1Ufl2WRSNS1j99ttgjRhfbvXWzQwTy+b1L8Fj2chJwliwWvwiFc+WU8AwYL?=
 =?us-ascii?Q?NliGoD5W4d0g8+0JKsJWgI6t36Oyt83yG/a+NvnzmwQG5e0TWG670ytMywtx?=
 =?us-ascii?Q?6GQd1ETIId706sKr+KYbFFiTniMxeujJg/DWdz3J+8b8o2piq6DDUqAc5NVq?=
 =?us-ascii?Q?QYedmiAslJMjm+DoXOl27c00VkFfgAxMHHbDS5uT68Cb/t2gD5buN3qby0iw?=
 =?us-ascii?Q?AkUFbw1LzWcBc/K4961j9x5z6xspAL/aOhSRKhaz8OvMzdOVcJToyNXfZr/+?=
 =?us-ascii?Q?FG24X5tUq8Y1jondEg59tiXxC55XUiW5vhyH5goudvPu0aucL+tYxOObD5wO?=
 =?us-ascii?Q?pIHEYeJOvJQl4fVoMXOQ/6O1gcaYJFtvO5eOklBv6+EbSm55ihIgZO/Z3S0Y?=
 =?us-ascii?Q?dKo6fwE3KHjIlKkJwxnXv/tZ2ffW+yXzjIV4Hh2cVVCN/Nf/lwF+Tbb30HDc?=
 =?us-ascii?Q?lztl46dgbD9zwHPltcMSOJvUgySmnVm4cFFkK3o/OAx1UcUFMjw3Pl469i87?=
 =?us-ascii?Q?bCrmyOiQe085+DHUiDlyT4/NPrASWZEfvDPm1fx4VApXATNY7e5Lv1ibbfMx?=
 =?us-ascii?Q?Fv9AhfA9XpwTQdHIkQjTFsLc2+qBU+2NNxkt3KOL1OodHWDq/rzY1cdmfvnK?=
 =?us-ascii?Q?a4GvsxzLpsfJse8FrxZSDoZlnaDShYzwx9kpX2ZAuJoYGxF9zLSC4Gi/xin+?=
 =?us-ascii?Q?T68D7+WEgU3Ncpn3JBJoo9O1zgFoz7LVtD6M5BYH9GqyfR4ScjYz4tWvrDJE?=
 =?us-ascii?Q?1cUiLX/Zb8ZdGj6oj16cjdiPo1Do/WMTvKP64AiXSyiSmIEyluAsLnCzCPtS?=
 =?us-ascii?Q?hchdcU9VJqe3uhpvksRu/jAN5zUNtuy27OUzEaPX4l2sunMMIyHO9Jh6D7bu?=
 =?us-ascii?Q?AIG+t/lA2Rm0sxTlaHx47gI7NAStYVDgcK7f5ZSG+J1KBveq82NXgptANOi9?=
 =?us-ascii?Q?dZdjzo7EkeYwgvMp+BxsvzbKyv7Hz7+YURd9Abmezd62FnbUOGZG9f2u8RhF?=
 =?us-ascii?Q?4M+i2KoK+DASPOUiZ4npRv6lYTYR/2ptgObHonJZfcyWd96QJ9t+SC6ktlGE?=
 =?us-ascii?Q?cYwn2LxEN0Gx7wNhTCmgHBGPqFaAlxnA5BmllvZrvSCgTOHnv4f/xD1NqVqp?=
 =?us-ascii?Q?OE5HmwZ0tJ1lD1jxlQYIFAM4f8W8TtFbBBgmsfTtXiK4kdcq4GVD8k1ZM9Fw?=
 =?us-ascii?Q?T/1qsuHRxM8teasnxmOY0TQiriIe1ox1qP5bxWuSJzvvC379DUQSHCyZsORn?=
 =?us-ascii?Q?EEzc+A7eJ30RQ1xTX50DajXJWvo+uskDVkvPFYqK4zzQeLly2Q2PU0wofsGL?=
 =?us-ascii?Q?7fsj84q0+gPwY9J1JYuK+QWOb8fQ119fyT7j5zE7N9y3fHjZnuIVIvRagQUe?=
 =?us-ascii?Q?Pr09l0BpkuHw3blsZsVcKG/0xFHsOuvQw9FWpgbbcph+OtVsAqQycqngJxXl?=
 =?us-ascii?Q?/hbccWFUqzX0yPwAguZBPmymW9KdMUdZSsMM9ufcdDNUVSKsO+qJpJ4pYCRd?=
 =?us-ascii?Q?9myZBy/ZoBNUTMAJc2IpDQQwFaXg7pB/Hj64bzCHaCPErFlQz/Ea?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a14803e-bf6d-4247-e823-08df30d50977
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 07:12:45.6209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKm+YjFgjm/aWk3v7Z0YhKZ0b/fcX6sDT78apsu65ZAC0/Yl5Zm+Z30UIKevekpF2QR+JNmDp2PbbZB+rz/r4YlLEIvq+I7Dz8ZRKjrZd3m8J3U9xaw9D/igJNVmAlCn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412

From: Shengjiu Wang <shengjiu.wang@nxp.com>

reset-gpio drives the line with gpiod_set_value_cansleep(), so its reset
ops may sleep. Set reset_controller_dev::can_sleep so the core serializes
the shared refcount update and the hardware op under its per-control mutex,
preventing a concurrent consumer from returning before the op has finished.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/reset/reset-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c
index bf95296a512e..b4a198792107 100644
--- a/drivers/reset/reset-gpio.c
+++ b/drivers/reset/reset-gpio.c
@@ -67,6 +67,7 @@ static int reset_gpio_probe(struct auxiliary_device *adev,
 				     "Could not get reset gpios\n");
 
 	priv->rc.ops = &reset_gpio_ops;
+	priv->rc.can_sleep = true;
 	priv->rc.owner = THIS_MODULE;
 	priv->rc.dev = dev;
 
-- 
2.34.1

