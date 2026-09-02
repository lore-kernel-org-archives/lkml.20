Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88005305693;
	Wed,  2 Sep 2026 06:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331161; cv=fail; b=lvPIG7jfKx79M3raf9W/YvFVTpRoy2BMsUr95+Q8SSNhk1BddIgLadPiQ0vB8A+ntTpJD7XqonEC1OwMkU+AUJcZLHJzn8KSK1Zbj7wha1zIXOqMSsQvOWUUzEvSdwS7teY/z7nw7JWznnXCIAFkvdiBWh0/ia5Uct+MistIIBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331161; c=relaxed/simple;
	bh=XCZ1kGnaTN0QtmpHOqfXuu7OVxRKV+pjFtqgbZE82zQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MWte+3mC/QmTHpMCzRN81efWX/OIaFrBZLKZaDsgVFmi/Ul459eRxjUqma4I/GLbT7+u1vgc7RI/hMwYiRj7z0FX6d9m3P/AQDGyIfpw21fKAP2wK9oeqk/5o6EzxZa4PVx6KXV81X22362lGot7Qe5JEtgvm1htiygoDyRuQGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gzdFjZLY; arc=fail smtp.client-ip=52.101.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gzdFjZLY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syGA2dbNAyb/O0VZEBW/1MFldzqaZAoZgMYmTe0jLIWa/X9FjGnLK5fZfG+wI/DLCtCj03SHR9tsI0eF52TY2QaPJTNh+oVP8ftOtJ/1jMDQOucq4POKDwsCIzCqDQufmj+3k4xYV08T9ijb7jeX1AbaE8YruCg4Fp8yHWJXJxa0kCAjdlDlXL3nGWWsof7ygsxqfUEt7fCMF7jy4T7xMIrcxMKSY1sGlZO9rejMv/bdKpt6+qrZtpFn680w+bNE/QqmroDsGXdBJe7BCZ+3voMjil82y4TreaqlIighzxdL2FASDnUrCzcpP0xh1CiPrsNrJQTyLg58mdAMLkaHgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWOjfYYcRTlC75gTmrIW9j9R1XpywBUM8Zdqz1BnSXs=;
 b=VppWPBr6CORzaYXmyhoxIbc53wvaUBnosL0Lhh0Ai7xYP+l2fpfBtFf2+CS4OHy5xxWguXL9U44itxdR+IqnDpIok5EDS3hqMZy3wxy/kPfdU3FJnnHxTYd3KtBXWRHVGTnEInxGBKegG4X5jxtSgAuvoA2MGwbq+6oW00EnF0YSr3zvxAaBfTFObLNDalN7Lat3fjH5lnEkFa9J8+Xpjm7V3N0sfOFC/K/FmEsxylLXhQKj2MlAIIdUmyA5I85m7ks340kaJar7+PbQ6KOJWnSOg8DtZGYHh8h0B+PTjhelA88dSAh+PD6A3d7NfytYbHGZI4vfnx8/oQHefnMG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWOjfYYcRTlC75gTmrIW9j9R1XpywBUM8Zdqz1BnSXs=;
 b=gzdFjZLY76O9ZRRRXhspgiPK3b22tlPUivXiqTp+xSfmNyE4hOyRRJqe9t8UilVIIhP4nOWcUX5tOZciG0ipIZfveQl9PK8NGU++KZkN4bfUb51wTC4qld+Dh11Vm3DZnyNQmip0zODMkXEVe/0IMU685oQUNDGO+jYpaWch+Uw/9+JDJz9W4l4X+igQMTv5pUuPd8Mz2s4b5vZGIAkCO5RRnOqNnz/qUnFuiCF8eQ9RKjHm+U6BTmwUQ1kgIUOL6yChPCwD0qAGlZWDaPhC8sWEiymNpedFthTyjgK1+Yox/Lu81m3/C2i1s+a9fDVFB5+oLj8qlFvlJ0X2q5YspQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 06:39:14 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 06:39:14 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 02 Sep 2026 17:38:56 +0530
Subject: [PATCH v44 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-imx-se-if-v44-4-104658bf941a@nxp.com>
References: <20260902-imx-se-if-v44-0-104658bf941a@nxp.com>
In-Reply-To: <20260902-imx-se-if-v44-0-104658bf941a@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788350933; l=15491;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=dRc8iuXLIZzObFtuA6aP15+bDHkjhOGtGupQsl95w4c=;
 b=75qIqqRAN9SECARpsmmbYzvhvtyjhNGc3T7bPLNpBgJABydoJImFJBjcS+s9eOx8xWghTKwzF
 AzV51YhA7/mBF6QLVQiMK50zQIzsoO8yl0CqSqct1heWypM9+/MEx2E
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: JH0PR01CA0053.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5d::10) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM7PR04MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a4cfcc-2474-4f69-3fcc-08df08bce782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|56012099006|11063799006|6133799003|10067099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	j8g8IsR1zj2F/oPPMQpZpfWzQ49PSIVme8Uglws+pWbuB36QBiEXuOy/AAmSEo0u6OIahcb/+Om+RgtJ97MLxRe+807AVqqVJDd1t6OCuhKvcHp3A1nX9zUHLmKcEIKx2GJOZHJ9KQoDFggHRIvqRjrTSLS8G3kV2u/TNaczsA5tONxF2dlrR4Kc7an9IgdME/dDyhAI1mGhzJP3Sy4/SdDk22G+6cePrpdaPmU1E0EDq/UwXhMEGw8ACXoB2tB1NwHkIKcKLKh/4MXpBA/wPGOAZzPZ/Is1X6dnf7WcHhL+hFFh5ZW+R/oFW/gsYYy1s/1QRbFeChcUJRyY8g6uKRtU9U3CH4JN8yoXjXX0KnTo8rSDYe4aTdEpA4350JilNM6cYBYP55+qe88bxrM56c0vptwFa/OFwH9/b5Svq9Qi+W5Lp166UU+Q0xGN89/WzBXEiwEj7CqkAbAWZvnazQR4x+J7pGNspw5JrvVh7GaKje5t21JwuD9qnPXR+/cSay9sfkl1x3koSkmHo5/ZS0h0ohvljIfyhgwKzJ3XSVt2WuqkUH6gqx95QUDt7yhHwSCf/de7T71HlV2PMBpMLrDeGdgmAaccwdvDi1J/xuigimCGrWhJax27do77MukVngIh6gCOHTJmFQa2vUmDIQVHY8L7cnD/EPm1wdLR2Hxbo+kga9sDMQCh0DTMJNyNHHH+JwL5p6wxvFj8qTnaQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(56012099006)(11063799006)(6133799003)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2Z4UC9Fb0UwTDhvbFZiTEsrVU80Wjg0WTRHNkovWEhFOE1Cak0rV3c2a2ZN?=
 =?utf-8?B?d3pxWEN2R2lNZ1lDaHNLM09SNmozc3ppU0YzZm5rV2VWbkRUbnpDZzdJcGpi?=
 =?utf-8?B?WXNZT2N3eDQ4OEtTK0xZTzZlQkpKbUhYTXcxVGVnV0I1bXh6WUVITmRuOUpN?=
 =?utf-8?B?TG1GMUNnazlZVjZQODNMVU1kVms2VUhSUmxFazZTNGZzSFYyNC9PUnZMVk8w?=
 =?utf-8?B?M2hQTU5LMjJ5U3pHdTFMTFIrcHg4VWN3ME8xQVdkdUQ4Mm82a29nZGltUi80?=
 =?utf-8?B?d3hiaXBtWHM5cERHMWFLOUl6UXIvZEFjOWhYcVVXRld4dXRGYnc5aFNPbEdD?=
 =?utf-8?B?d1lBMHZvb0RxYWM1UUJmSWUvYUV6dTNMdjlHckpjbmRPeDNwdXl2V2w5MDJp?=
 =?utf-8?B?U1k5NVZlTDhEUjg2WGk2NHJQSGpHcG9SZGtlUVhrd3doUGFjcEhPRlB1Ny9t?=
 =?utf-8?B?SlkvYUEyaEl5dVdIRzFncG1ZM1NJdXducVo0VTBRSmRjeit5eFVtSnRKUXdU?=
 =?utf-8?B?RGNEU0xDOEU1VGxJeE1lTW9mcUlDaEdIRFpaYlloT2piVTZjdTJtSzh5cm5w?=
 =?utf-8?B?TzF6QnppMTdNR2VpT05SUlUyNElMV1crTWNiK0h5K0tWb291bWs3OU51alV6?=
 =?utf-8?B?RytuOTZYWWorclp4b2E4MmpZMzh2UnJXZ3AwcFVjWkt5TDE5ZjFIeEV1d3lz?=
 =?utf-8?B?SDZsYlI2R2FDajUyOHJJWldiUkljVkNyb0pFbE5EVTBOcVFBMDJKcFNxNjl1?=
 =?utf-8?B?UVNRcDRtOW5zSEoyZEFuMFB5WHVnUzBHRTYvWHZGUDRSTXBEYis0c0p6UE40?=
 =?utf-8?B?dXFCNnFDRkdUSVZVUGl5dXJsYWJ3TTB4ZEV1eU14SERWUCtGVUNqV2xmQkpp?=
 =?utf-8?B?SEw5MmRUbmhEL2ZFWTJueXFrVDJwaXNVc1FJRTlKbW1rS2xuUFVjTENTcUMy?=
 =?utf-8?B?RVVHbnlVcURmejVLUzRRYWdwcElJb2MrRnZTOHJRckxtM1Y3dUpDdGFkTmV4?=
 =?utf-8?B?R2tPUDlIUnp3QWMyWXduakNuNUFWRy9VY2wzaVVJTGtlZThMWXVNcGNDRHA1?=
 =?utf-8?B?YmRqclBpcVdIdDFkT2t2c1VmM2Q5OWoybjdxUk9KdE5CYnpYQVYvTjhTemRr?=
 =?utf-8?B?OEhmQTRkUEFFdlVpdFdZS0J2WkxtYWdPa2NmcE9pbS9xcS8rYUNvcVRQUkRP?=
 =?utf-8?B?aFE3RTUvbkl4aTZxZ3ZtQ2xiT0dZTGgveDNUNjV1ZGoxdlFKQkQwNWg1Ukls?=
 =?utf-8?B?ZUk0eXA2TnNIcHdPeE1ybFJXWjd6Y2NYcWdHc2hKUHRnMjI5N3Z6Z3YrVEoz?=
 =?utf-8?B?cUkwMUx1cTVnRmNYMVloWk9Qcjlxb0VOT1dkQ3lxZnAySzE3d2pweENZL2ZK?=
 =?utf-8?B?STQwNTJhVm12SnRYM1JlWVR1YlhUOUtlc1R0MGxIc0hxZjE5YlVEVDJaZEZn?=
 =?utf-8?B?c1VIeHpqeHJNcHRvTENiWmo0WldidlQvZUdCQ09hNHBaWm04bUhzRjFyL29F?=
 =?utf-8?B?MDR3VXNGSnE0NDBTVHVLb0FwblVJYW53T0FnT0F1Z2Q0alBESk5RQmdCenIx?=
 =?utf-8?B?MG1JTW1HUTFpRjkzS085cis4UE0vZXpad1BrNkpxcVptT2hxZ0d1TDNjR29Q?=
 =?utf-8?B?LzVjNDJGYTlSU1p6RTNIQ1h3eW9iN0RDekhmNUROYmIwUjlTTzNYVmFGR2hR?=
 =?utf-8?B?Ym54Z09IZ09oWmttYVArZXE5Y3VDaVd0ODAwbDRLcnR3Q3FCVmUwYytzaS8x?=
 =?utf-8?B?TUQ0YVRhbHZKVWxycVhaWFZMWk9WM0lRSGdrMnN5QTdHSmZ1cHdkZzZ5ekNW?=
 =?utf-8?B?eWNVMkNDcDl4K3Q3TTVBK3IxY3hteVlZV0F5V0RTRStpeFpTeGx1RkNFYVRD?=
 =?utf-8?B?QVBWeXlnS0lubkdrbHZXcFd4RE40R0pQMFFCaUNORlpaN29GNFZTZGtjQnNP?=
 =?utf-8?B?L0RCZ1dDYStpSDloTWJZOEYvdHI5WXpYWVpwKzVoZmVUb0IvbXJxY0dReFMz?=
 =?utf-8?B?Sk51TFF4K1Q3MDVJY0l5SFN2ZW9Mckk4RnViVFFVRVQ3YTV5a3A3U1Eyc2d3?=
 =?utf-8?B?QXpjdnVqaEFjTXMwR0JZL05sZWtTVkg3aWkzNG41bS9vT1plc0NhR3BmZkdZ?=
 =?utf-8?B?WHZaRkVCR3BmTm9sNDc3M0tsLzErZkZMU09kaEtUYWQ2endFMGg2N1N5cEhS?=
 =?utf-8?B?YjdMMUxpZ1NYOS94ejE1YUJWbGd5ejJva0tFR21jV05mYzNObHpXeW9kaGJh?=
 =?utf-8?B?LzJQcGdOM1lNUGxYQ0FKa0hnSFdwZFdZMFRGZVhwWDAwUnhzSmZDQmdEYUQ3?=
 =?utf-8?B?MEJzMFBZTUlHYzFycVJsbDkvZDhCdUQzbDUxMzJNM1VVMlBVa2tZanVkUEwz?=
 =?utf-8?Q?H1y6EeTMftg1tQBgnA8l8umn48olmu0rw5Se1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a4cfcc-2474-4f69-3fcc-08df08bce782
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 06:39:14.3377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejmcs6uk7Y2aGPfCoIqovLpEg2Dp4HBGZGmi58vSUWPr+wbNEuqzURc4pP0ULs5SisGPnFUZ2uCQdF4nmYnrxiO3pkrnznfUtHTaDgDNe1NmmpvbNcRzwuX0lme6sJVc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 15 +++++----
 drivers/firmware/imx/ele_common.c   | 66 +++++++++++++++++++++++--------------
 drivers/firmware/imx/ele_common.h   |  8 ++---
 drivers/firmware/imx/se_ctrl.c      | 33 +++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++
 5 files changed, 95 insertions(+), 36 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index d00315d36e8a..8d4fc756b81b 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -82,8 +82,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 		return ret;
@@ -144,8 +145,8 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -203,7 +204,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -260,7 +261,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -309,7 +310,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 35d2dc77f634..10fb4f60b429 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -47,7 +47,7 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 
 /**
  * ele_msg_rcv() - wait for a response from the secure enclave.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE dev context data.
  * @se_clbk_hdl: callback handle whose completion will be signaled when the
  *               response arrives.
  *
@@ -60,8 +60,9 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
  * Return: number of bytes received on success, negative errno on error
  * (e.g. -ETIMEDOUT, -ERESTARTSYS).
  */
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	bool is_rsp_wait_with_timeout = false;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
@@ -150,7 +151,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 /**
  * ele_msg_send() - send a message to the secure enclave over the mailbox.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE device context.
  * @tx_msg: buffer containing the message to send.
  * @tx_msg_sz: size of @tx_msg in bytes; must match the size field in the
  *             message header.
@@ -161,7 +162,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
  *
  * Return: @tx_msg_sz on success, negative errno on error.
  */
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -173,9 +174,9 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).\n",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).\n",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
@@ -185,9 +186,10 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
 	 * the caller-owned buffer may be released after a successful send.
 	 */
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.\n", dev_ctx->devname);
 		return err;
 	}
 
@@ -199,6 +201,7 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
@@ -206,7 +209,7 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 
 /**
  * ele_msg_send_rcv() - send a command and wait for the response.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the dev_ctx data.
  * @tx_msg: buffer containing the command message to send.
  * @tx_msg_sz: size of @tx_msg in bytes.
  * @rx_msg: caller-provided buffer to receive the response into.
@@ -219,32 +222,34 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
  *
  * Return: number of bytes received on success, negative errno on error.
  */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	unsigned long flags;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
 	if (atomic_read(&priv->fw_busy)) {
-		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
 	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback(). */
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0) {
 		ele_msg_send_rcv_cleanup(priv);
 		return err;
 	}
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		/*
@@ -255,7 +260,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.\n",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -290,6 +296,11 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
 	struct device *dev = mbox_cl->dev;
+	/*
+	 * devname_snap: a local copy of dev_ctx->devname taken while
+	 * clbk_rx_lock is held.
+	 */
+	char devname_snap[32];
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
 	struct se_if_priv *priv;
@@ -313,7 +324,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -327,8 +338,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.\n",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.\n",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -343,13 +354,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM_MSG_LEN).
 		 */
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, MAX_NVM_MSG_LEN);
+		strscpy(devname_snap, se_clbk_hdl->dev_ctx->devname,
+			sizeof(devname_snap));
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (sz_mismatch)
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				devname_snap, *(u32 *)header,
 				(header->size << 2), rx_msg_sz);
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
@@ -371,8 +384,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			return;
 		}
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.\n",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.\n",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -384,14 +397,17 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			sz_mismatch = true;
 
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
+		/* Snapshot devname before complete() can free the context. */
+		strscpy(devname_snap, se_clbk_hdl->dev_ctx->devname,
+			sizeof(devname_snap));
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 
 		if (sz_mismatch)
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				devname_snap, *(u32 *)header,
 				(header->size << 2), exp_rx_msg_sz);
 	} else {
 		dev_err(dev, "Failed to select a device for message: %.8x\n",
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 39bba4ebe8b7..ec6fbf1c89ba 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -16,12 +16,12 @@
 
 int se_update_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 9e3f81a9a272..0792e5152436 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -293,6 +293,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname) {
+		kfree(dev_ctx);
+		return -ENOMEM;
+	}
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return 0;
+}
+
 static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 				 struct mbox_client *cl, const char *name)
 {
@@ -337,6 +360,11 @@ static void se_if_probe_cleanup(void *plat_dev)
 
 	dev_set_drvdata(dev, NULL);
 
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+	}
+
 	kfree(priv);
 }
 
@@ -438,6 +466,11 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->imem_mgmt = true;
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to create device contexts.\n");
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 54b2a262a2c3..dd4a1ea7e35a 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -20,6 +20,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -44,6 +45,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -106,6 +113,8 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

