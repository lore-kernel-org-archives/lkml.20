Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021111.outbound.protection.outlook.com [40.107.51.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBDE3033D6;
	Mon, 28 Sep 2026 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597732; cv=fail; b=Iq5DScTLxs0WrN53PN/7pAetv4c75tmP4jE0RD5DjpRyIO1IOlzgzQmY1XH59EG+WjeeYwDAyOXmiVXOkGB48yJQTBpwYGQuCEteHE1203I3PruXxXkBiEfbCthzhh1UZrcGDdGFmaxO2qGf8xa1LxrMDuGur1lgOWkoTg+4tEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597732; c=relaxed/simple;
	bh=3svBSxxjsMPhEjH116BAuGCR5z658dtMMst5o8e6xxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rs2wZipElzzOPZtyPzb9KAyV8sTzOD0uRfA4PZMjI7dP3vRf/45stgOrL1Pyk4WBM7RSOSXtR5coQKcPwvRzWuaawWjo/n3psdKNHUmZdqmDeqJqsR7TqNhV0vYn8dF8oBoInauWyDz5GyKzsUF8ApOdQChW76Bh9mOrSnSGuv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjuoqLQcan+kE0HSi6zL7twmjxOK+1Hsi2oitpPYfnURkuJhgxEqv7CAgqJd7DC+aDbDRv8lEwjyKDarhbUKyyYrh8ZRyy4FlVudkuaEbh4VuqkqDgLUD+nXUjgRyKmJgjvtm2nHDcuHLBhsGnWgiuMxZz6v/QLIXumvfy0uXLeiuTM0Uuj+eMgD1onZ81Vm+RTrKb4outbPZEI95haQoSPyB6eFoh2K51W/XwLcxUM0xlcPK8t0DCAKENMKe/pg4VZoAQ5FuwnCPkjaS0A1sIO3iVY1OeiVkigZ6c4AWj7iyFU0cPvnaAmvHVta5XNxr2v8GBtTgy952u1mLWA/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyZ/17TlucPAHE0LTypb6I5uKAf/HjSzjgRipFTY5qo=;
 b=CZC1WTqh0S0x1qasVkMck+/KSFNMLvp7FmHLPB5F0Z0PwQWkpFVgX+7Di7t2RnufJcLD4pFzmTJjChhiarz/zvW8S6/nm/sy5y847+WXEYGCZl7KbNlUW/g4AzdbLjvGnqhMRx0AulvZcemliFs2+JMtKfFkh4cmYTRe3AoTteYT22VHuocLXlBjmVCwATGEYed1mGzhkRi14QCkhWDs5FVfGFRSsPQ1pZo0a4hSUvMOSxhrXbezmBgb94Wdb3+GCCFLv5akwaG2wuT0sOMlYH5qA4rKXOwKXj9ZVUlE/PQaogpQPWmwi/mdE+ActuBnFcemRJrWEuQ61nFjzyPrKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA0P287MB0267.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:15:27 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:15:27 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v5 2/6] media: qcom: camss: vfe-17x: Fix write master selection for RDI lines
Date: Mon, 28 Sep 2026 17:45:04 +0530
Message-ID: <20260928121508.1404808-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928121508.1404808-1-hitesh@ebytelogic.com>
References: <20260928121508.1404808-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0091.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b8::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA0P287MB0267:EE_
X-MS-Office365-Filtering-Correlation-Id: 196ec969-05dd-4364-d917-08df1d5a2e2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|10070799003|23010399003|22082099003|18002099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	6V7yp4goCeIsZpjra5gfeCWP5Z/jkeXTfNJFUHAetZ90YL/XZzjZEyYr4pkiwC/64pBGVTqnImbnLatsJ8uCFz6NNMPb4RyUXhiVvTn/3jYHklQSHAyDUXtN/MC1N+fFuUBAjI/UKgv9Qkn5YOSrQFB7S1t8ocOnhL9QPQywliQLotUJG9k5/ppwaM83ux8n9fly/NJHjYHMem1R7ePMg8Qlh9D9x4ZnLV6bFact9ygq8BGtDM8a1SjoZixDOTNR4HSVjMQh5/gbNk2ISTtKmfAuB1PRfYQaDNO8mRMNgS3zASnhkGzqxjFoRQ0KjWI1VE1T7BSElXIpFIBHXwBfWoTe9thHNUpD9POGgQgRuW0vQDOphYJZrtto9JpWDodrWfKFjQOQhQx0Mylt/sv+ictOEtRj4bhK3wOQ9T/JbKyVpI5dS8x12QbiRwmlXyoaiWZfBdWnsZ0ITpglfZe1lQI9Wcb9QYSLF9U/hHgg8zyGzQ6zuw0vyNv+eAWdloX+Oe56RxxqnSUY4Lw2IG7YDSkA8HAGDw0/H5l9+EN2E7N0hIVeY6RuM3PVezLHQbN4YO7qbtgJhSxidjOa8qBlDQDiwpC3t6dt5qoH4s6aArsXEhbMvC/srTTx4Hr8w/zzcH+aq3hmajr9xl51i6GJt9vIMliyVCTQRP6TKWiyLBE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(10070799003)(23010399003)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U5gkJJIp+3P5E4bLxHU9/2QRgTwDKI+qzb8cOrf8u0LYiJQrlukJrcyikg9E?=
 =?us-ascii?Q?f4DShj+R7UnEgn2cqHTIrmKjh3EWLrBJrdaxpgDvfSwPP9aUPOcjNBLWKfuT?=
 =?us-ascii?Q?ATDlCRAyXW6C9+I+1krmDO4lI6lU6PBK4IgYkRmB8om0pccHvZGBNSxOF7dU?=
 =?us-ascii?Q?TO4dAG/eSKvegTkEakfFUJH9g29lM6qw+cQhWxNihOseqc3bkyjYQKKd48Ui?=
 =?us-ascii?Q?sb5zkd1P2GeksbFIuiKstDCyN/yRuaGUHRpfUbr0G+5DHcJlvONzFW8uAsxu?=
 =?us-ascii?Q?ISMr5Uqv4yDS0dWZGqMRatbsllqclnDVDp1BR2pjv5fj+fRpNC7fHruZHll5?=
 =?us-ascii?Q?XlNTU4rm2FyOLrIu6vhOaFZMJ11LGUBRRSQUWdvxTExeLAX5+jOsN+0YbA/n?=
 =?us-ascii?Q?gxsSn5JT8DKsc3mUKgFjhNOWEsFpx9rjJOTPi5S5ZtcSFFZ+blP0rHW++loc?=
 =?us-ascii?Q?o0lxvpjQcFCsyZWuu851Dl/4vHqENpd+lthg17Fw6jZClk7iZaOlzNO0Zc1C?=
 =?us-ascii?Q?zd6T0oOrGYQdU7VjbWhNj9YqnXsnkK47esmxWZc1r2LaxfsrbltlWcbQZz/k?=
 =?us-ascii?Q?8kM+IXObq3VFuQ4Dqi5k77fDiz1BOyJM2UYHbo+5XdFr44sjgGN78AyPgLni?=
 =?us-ascii?Q?3yC3yprjD/h2/ZztAVwmwypBRyrN81KcAaEloZhCMTKMHE5eeos6M/00LWLQ?=
 =?us-ascii?Q?woH7ERLL4XdtOkrqQdQlLb3m58WUec9v1QOUHkIYx5XUrOzuGvQUXyJ9/uVy?=
 =?us-ascii?Q?AyDaD5izRfKk0Wo6kESlfhtCyRxJKM+1iReM2Re06Z0y9WjSGmewxapI5mGT?=
 =?us-ascii?Q?DTexxKcJHPh93SZADJXAGTqBaANLvJSLLslKzzArafdDYOuO3TAvmAqvBp5B?=
 =?us-ascii?Q?FEw01K42TW+0+zSPr+VbCPdpVnMqC7294w3UtHl6KHCRHpqOpazsU5r3WojW?=
 =?us-ascii?Q?i6hSxenCwtwY30XRmoOSBnpqDeSU/Mq1en3fX2eG1QxqvCIOrgNii/ysKx2x?=
 =?us-ascii?Q?3munTj/VnyqnB3Y05jQCbjFyZbRqYD6fFRyDGiz08aefoezMdB04uBONVczd?=
 =?us-ascii?Q?tQa0Z9kZ3SajS2dbqCqJOXbxhPZX5HMeXcqPGh9Sn/9CnB7pljkuPBWUb1f7?=
 =?us-ascii?Q?Ut+6c1HkWb3x70v7V9dEYJgrZdqObutJeXVe3+621PUvyeejwI4C/K+1emgs?=
 =?us-ascii?Q?kptMQSI7B25M/IoB2z2x9VwUNDjuU7+3/1j2SeHFnKHfk9hFrPkZFcNm9vO8?=
 =?us-ascii?Q?kfAoMuzOuapbe8+uhzvkqQBtSLcXT8RF72BklXwxah4oKEacOMHphVN/r6sJ?=
 =?us-ascii?Q?zO3A9PcfgZOdJaE1TRtdUlIb5NFXaHfczTHN2j1TGgNyIyKE/ozBH3ANcAmf?=
 =?us-ascii?Q?4vvs+sCHRgZC3UYH96nWwY2tIurGEE6DofHqxifQBH9f7lvTkQcv8woqeKun?=
 =?us-ascii?Q?SY+QGJZNxidWZbONNVZ/+3/Uulb+u21B8Oq3mgBshs3QleTLP6bzSu5I/sEd?=
 =?us-ascii?Q?smeF0W7CSFetNtUCV7dsXm1eBYpY2+2bXZV7XWpA23IUPjj3hJn/pATU6Nar?=
 =?us-ascii?Q?BTllBssMwrmOTnmLqmGt06awQdfzxFm6suxm3xuJZRdcZR8KLEdfzPeRzUDT?=
 =?us-ascii?Q?gJ8mEWiRhdY11S/8yq1FouZzAf2imUA2c8hhYQaHfRGtJQtyWwg2c5slrJVr?=
 =?us-ascii?Q?fBycNcHA6mpGzGXpH421RsfAulK4tk4Je84iYev6OVxy6b1j586bg7IyPv3b?=
 =?us-ascii?Q?HuVaY5rAd/WZZXKHhTHMgehaQa35SIe9JRkp3Ty5q0e4v3EfQPNE9cETSfl0?=
X-MS-Exchange-AntiSpam-MessageData-1: 0FzMUetWQLJ5mQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196ec969-05dd-4364-d917-08df1d5a2e2c
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:15:27.0380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jshUt+d+mTwYObYAvDq5W9onR06EM5ijD/OYIl0Ez7NcUOGwkAYk6Ff1PRjnjKw8HbgUfja0mQ7M3wg7Y6ZVzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0267

On the gen2 VFE bus there is no crossbar between the RDI paths and
the bus write masters: RDI n is served by write master n. The common
vfe_get_output_v2() reflects this by mapping line->id to write master
line->id, and every gen2 VFE except 17x uses it.

The 17x code kept its own vfe_get_output(), which reserves whichever
write master is free first. That happens to be the right one as long
as a single line streams and it is RDI0. As soon as two lines of the
same VFE stream, for instance two virtual channels demultiplexed by
the CSID to RDI0 and RDI1, the second line to start is given the
write master of the other RDI. Both write masters are then programmed
with the buffer address and frame size of the wrong line. The frames
are truncated to the smaller of the two buffers and the SMMU faults
on the larger one.

Use vfe_get_output_v2() on 17x like the other gen2 VFEs and drop the
duplicate. This also removes an error path that released
output->wm_idx[0] before it had been assigned.

The gen1 VFEs are not affected: they have a bus crossbar and any write
master can serve any line, so vfe_reserve_wm() is correct there.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 .../media/platform/qcom/camss/camss-vfe-17x.c | 41 +------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index c011f64f63..62c2405359 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -382,45 +382,6 @@ static int vfe_halt(struct vfe_device *vfe)
 	return 0;
 }
 
-static int vfe_get_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output;
-	unsigned long flags;
-	int wm_idx;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	output = &line->output;
-	if (output->state > VFE_OUTPUT_RESERVED) {
-		dev_err(vfe->camss->dev, "Output is running\n");
-		goto error;
-	}
-
-	output->wm_num = 1;
-
-	wm_idx = vfe_reserve_wm(vfe, line->id);
-	if (wm_idx < 0) {
-		dev_err(vfe->camss->dev, "Can not reserve wm\n");
-		goto error_get_wm;
-	}
-	output->wm_idx[0] = wm_idx;
-
-	output->drop_update_idx = 0;
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-
-error_get_wm:
-	vfe_release_wm(vfe, output->wm_idx[0]);
-	output->state = VFE_OUTPUT_OFF;
-error:
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return -EINVAL;
-}
-
 /*
  * vfe_enable - Enable streaming on VFE line
  * @line: VFE line
@@ -441,7 +402,7 @@ static int vfe_enable(struct vfe_line *line)
 
 	mutex_unlock(&vfe->stream_lock);
 
-	ret = vfe_get_output(line);
+	ret = vfe_get_output_v2(line);
 	if (ret < 0)
 		goto error_get_output;
 
-- 
2.43.0

