Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522623E5A0E;
	Sun, 13 Sep 2026 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789295148; cv=fail; b=tnTeaYzV3sc7bkOnBLyYOkDGrIzoJG0QV1kmchopBVFD98/qGkq97dOu3EVcSR9NtLRruQKTN9UhHaB23TBOlXnOh1cup6E68JFiqxKP8+VBOgez/6Bw6qfJ/h5WaaIQSL6X0RrEv8tNT0+oHesblzrmtI5lME1pwjZILFsqxtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789295148; c=relaxed/simple;
	bh=75ALwQBydTWODIyVJj9u+2IKtRt22VOIgG4fbZIz/FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lDdrZIs5iBiLn6D397nEUOgIlUl0pRjf6rfJdtHWnDch+EdHYNJ7Jqtei+WvuioAqDNlgzZn/WEoxTKlndQsYiFblZZR6aeduW42dUqRCISjALBJ+UJkJPy760CqPZkojNwHUa8BeFRDfgjjuuYXrxZvQQNuXyP2DJfJHu8NwAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UhrgfH3c; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UhrgfH3c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0o0n4m6vP0Ekr5jCV7IHwIRSnn2mE3u4ScgNFHauUpxcH+vCRuNGvh32sYtkmzaxYCXMoVRwJ0ihW2D3XZWqHxA0B9dLbBTU4pBAPOTPApHsKQoy4Y8ZgIysCj7z8qRfVNis8yrMHoIv61FkAa1uxySbOnYgpSfdeZdeJ+/G3Ul7OlvYeJMzI7M5/RjDTVPtXHs9FNIDbbpcXsKYp1kICiJHt9kAt4eYGxWchNOWYsag/N9bPRH6Aun1lKjysGkqKObSoM461qNG6GHDvD8Xmjw3Qj+Lv74LddAye4G7i8iQ1ZNEsO9IAL1YWib56xbiaw2DIzRjp2HZX29oVKHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkK6I9s5uKU1recQfKuHVMIt2oRWwq6XIZpjL+ZAKgM=;
 b=SMYgi/dbU80LxZJFfI+Bj3YYDLa5BqYOaPPyVcVRo8uhaf9nvUMOEJXxlnve5R2u6O6y2oUfa0fUGw3tKSiHwdiuQuvOx76hsHRLQK9+pDtVGPlva3AHHRHuFtBAhAC7m7247IYUdydbuH27ZaQcR6wPopIXHCcGOLgIF2XNr1gmGJy2vgfs2xghu36PTGWabR/TaGeuUrvVP2fC9+f6znsjrBecX7wlnupLMBjhltU/hakMehvJfpgvan1Jd4Nz9y3z6wNgdgp6p2r4KWR8vgjMtLbYouSTRzVrhciiruGW/wD+BnN5fjA6K3xjJdm6D2IkVt2K2CdQRXpTN+8sMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkK6I9s5uKU1recQfKuHVMIt2oRWwq6XIZpjL+ZAKgM=;
 b=UhrgfH3cBpODKqRn0jOnSKy5+GBTqgTp3Og32kriexGDPyRp21v1/ykuIQDRsFiDBnUDqh4Z3oeiYg+6/K9tbYdMD45krFxnIfIkWNXlAldPv4rhoNGYkmUU+f80aE7m4P0nPaOqTtZ1kDY0sJzQx6uExL2pRjnSIQdpOmr2/RyyqyFYPP1jXQksL66ZnotdX4Q1nLWV7/H3PujL2q3g9LOvAYgIO1hPL1uDCgAbnnZUwLO8KUQ5JDjcPE86nifdXWaCdBeDRAzQv6Drd8OWJJTpUbWmldth15EVYBTdQnrZ7SKbGErEXMSdI76+0n9WVJHLR2qbsVbkVpZ18z/u9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB7006.eurprd04.prod.outlook.com
 (2603:10a6:803:137::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:25:41 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:25:41 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ASoC: audio-graph-card2: Free jack GPIOs on card remove
Date: Sun, 13 Sep 2026 19:25:02 +0900
Message-ID: <20260913102502.2805912-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
References: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0036.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::18) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 9207d60c-6b38-412f-85c3-08df11815c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	wUhNA3dRVb0p+qrAOBk8qzoK6YhNpOPlOpXj24YJMvI5jWvoLKw8TtYtRxiTD1pnyIpGRWSkj8dTHtwixaxH9vk0kzfyRWYt9n84Ub7WBCwLZqrvuvjnpUxRXcwYgqz09X2aCE2pJAsVi8vBm8mPfZHEN2/dBbIQv40LgPamIJkaEfV5+Z3ZOfC+2TnEFN1b8xdLoLX5QNdZWEK+RMJBG7XF6uPXb6xr/oXJE0OB/mIhBlJZFg+3s0V7p/SkjjLuh0JxVuDewyTRDb/O+Haqlz+YQWxj0G7SDOFMvME8RtDb7/OUtwJzpNAH2F32dwc+KNEi7XGQo21dlLSh+SM2yO//t4MsnmY+4P4nnfyjsEhOIBgT4gndRh8hOdozOWrvpak4JYAimbJ/mq/npp2TePLc7wegsPO26+RRosXlXI39Mc1oAN5gwyiMu04/7FUEc9BrVvcmwYtKZPTWH7ehx30oN2B43jAnhT656bfhpNAKI2Phk6rHAW9qVQjpjnE5WfpYsZ+1MfamawsqRmLCqdEHCvgZe2YRi6NJK9anejKZBhYHfe8i8U7DErXgN7sfdZ23c1KyKJeULVqYTw20kk9OjBp76vAe9gcKrmZOlbyap6pKv977hPgWmdR5kJe+MIKWKpKEAFYbRYHmvwV9iRqJi4bif9QoVxz/qKwy3uQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YXWjwrYIcAoiayYuD8NPSY+pWxShmr5xcpkyR4ZEUCKh5+0X/7B9tU4oJ7Nr?=
 =?us-ascii?Q?NFUCjARtVlMFuK1q8ZiQ3LcKqInUGcOVmvfIn30gyqeunD3s9loM43hhNMIo?=
 =?us-ascii?Q?w70X+c8W02NPd90hpnnG+yWqA0RAt4OFGhA9x5saLuteebgMGA7GLWb4C6wk?=
 =?us-ascii?Q?4lVaRtjXUQTPwAuHo2HDuG+1ekLW5c9XWTthQbF+aAr+B7npS154vL5/FqY1?=
 =?us-ascii?Q?gv2wJ5AUqA071jnETcW4cmjAq4OyWt5bXdXBGH7NdIoja3aTfMdfmWw9Jh9w?=
 =?us-ascii?Q?TKpT3SUVf5fIRwvxt2RQFsNoefwubZLMhIb6uVY5hHXrhKItvmYUo+0pGzsZ?=
 =?us-ascii?Q?gfcjQJPsXDtqxl/jqCmIH2Z1/xIcPk1bL+L1jt2O7euu/vXqgxcGhxMRCMDq?=
 =?us-ascii?Q?e61OGQ0b8Ydyza4Hij60cYj2/OoU+OCqATj8C0DcxG+N2kUDHcxXb+rhnhwz?=
 =?us-ascii?Q?ZDOrQ8esAJWf42wX+j5CmsRvA8WR5xL4g8Mmv3ZaIvV/1WDpJhTqHZriqJYN?=
 =?us-ascii?Q?WKpbe9ZWjujAl74ftYR/ioMODdbGvxLwrTDelsOO+rLlafI6HDDBhzMgdid1?=
 =?us-ascii?Q?y2Hpj6ijnEtUEIieQqP2+/akBr+O4hGjqSRdjq+O5JoMu+eHN1UzmGIE1/c4?=
 =?us-ascii?Q?REpqUtJedIJv7kbIKiaMUGqmzYw9M6zxAsg5uRz10PYewVY3gS6aKjyU/zJ9?=
 =?us-ascii?Q?83ux9Psiyd6ud5uNOggV/jkP1KvZqBo+y0ZQtZvqQctbMfXvVNo9kg/ieAhw?=
 =?us-ascii?Q?RTGvjV37NSl+MsE7cOT7nKYIIkWw7HEKKxhtLaid6erZ9OtYW8L+htwKfxdc?=
 =?us-ascii?Q?k4kYjTR8qgx5fUa9cVaxllZGJNuazt8QM01jimlAQmf890qdmq321YyiShNF?=
 =?us-ascii?Q?DNiALkFwSmc76nBUVxx/8EHgppLkhhTmZEBECOget0v0gf3eCyt4rhoJUI6J?=
 =?us-ascii?Q?2ERbR9JtJrQLla8bCR7dZ7t+c2UVu9/qmtUq2r9FOnY53Bq17rFXOOw80REm?=
 =?us-ascii?Q?zkE5SXGIU+YJrQFFFYnmBfiU4zN91JzMktrvXBF2+J9TB9CzlWs/JG20P02v?=
 =?us-ascii?Q?4/J8vo+JqyTHpovX+E4VeWUcFs6YM6ONg24ziIkBNuNSR7UTj7ZioYJhgoEF?=
 =?us-ascii?Q?eDG0T+xa6BrHa0BOb9dCwcB0gnWz+gU09QtkwTKOt7FbQoyMktTnH7dsJLP7?=
 =?us-ascii?Q?TW8aop6MzZKam5OiNzBD2kZaCR2wu8jlR0OPmreoBEs6uQZRv7Izkpkz7dKz?=
 =?us-ascii?Q?/MYImCUqxkAG+j8Td/HuarL9KzbNNMsHB6wX+FKh+MhAm+PgoQyps7BZaKZg?=
 =?us-ascii?Q?BT5s2k+WTn83WSHVk59xYiiTBDRStwm3qcyffTxeGlNnMuTYOmOUfZndmnSY?=
 =?us-ascii?Q?l2HjH/U27kA/q5J653XoYqzLSsCmoDVo5oQ5vaEm2fgVmzsmgdypt9TYvhZ4?=
 =?us-ascii?Q?8tpPzeZRDxiECccuGLBJ9C/K2HVxhL5nycU1UNbx9UrjPJRoCUp8bw+5tJlO?=
 =?us-ascii?Q?4k4wMdt6AfUtKKyELObel5YmxmuMz9sl8jbExrw/tJ1ihILWV0we0ngPxo+v?=
 =?us-ascii?Q?NnheiMoi9f8KUUBsy6kBYillqbYLao8UOoOu5UA0KRLu5LuvoBzWByrRl6wQ?=
 =?us-ascii?Q?K0TVhkEowww+oYfhRszXcGNSkECAlcOvtKVraUdu1I12YVnmGOTDCeXzZBLJ?=
 =?us-ascii?Q?DDT8hfyfbTEFZxs+KGIFKWTnBt84QJMkCJhIwR2HXZw0UFf3xBZb/Y+W/0dn?=
 =?us-ascii?Q?4pCshsfG6HeeqylASEu4tH/t/71n4HryxX3b6W72gVfE9/RcI7ho?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9207d60c-6b38-412f-85c3-08df11815c42
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:25:40.9937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiuSYZ1j/9lRswJOjc9j3ctUf8j3XUjiddfmsOV/5/r27Okqo19x/IlEoU1wcH+Hi0RPXgDEzRbsGoGd5FoXpxObEHBSiFDVU+bFnwOm8rFbfWthG4NnhRwMu5hotYK0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7006

From: Chancel Liu <chancel.liu@nxp.com>

audio-graph-card2 uses graph_util_card_probe() to set up the headphone
and microphone jacks, but never released them again, so the jack GPIO,
its IRQ, the PM notifier, the delayed work and the sysfs export stayed
claimed when the card was unbound. Re-binding the card alone - for
instance after a codec component is unbound and bound again - then made
graph_util_card_probe() fail with -EBUSY and the card was never
registered again.

Hook up the graph_util_card_remove() counterpart added for
audio-graph-card.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/generic/audio-graph-card2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 9fb3d3df5cf6..e11bc8135cb0 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1310,6 +1310,7 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 		goto end;

 	card->probe	= graph_util_card_probe;
+	card->remove	= graph_util_card_remove;
 	card->owner	= THIS_MODULE;
 	card->dev	= dev;

--
2.50.1

