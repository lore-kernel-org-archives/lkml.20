Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9134A99D8;
	Wed,  2 Sep 2026 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365811; cv=fail; b=N1YJlf8ydBTpDWdL4kMHoI0Q3TcDklg8qS813HCiSVyhdBZI+tladKvkWO19gdi9nmz6jgc9VYliFAiD0d6H7AebndFKiBu5gTXGL/7UHRpLR47cCK8srTV/AWBYsQp9+F/uPf0Pje77rF5I1FZJFn9SmPypmUhvThxO+pNuiFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365811; c=relaxed/simple;
	bh=dJl2887JtFL0TD8fpRYBYc+5mFlCjQVR43Qsw70MkU0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DgvDR8FvNQmb2iAxrqykq4BQqlLbUtmVZYmIYrA0uiZkX/G/ye9+s67Ha0vLNX5pjsUEYkZ2jkU7DGUjaXGjAU70fLIH4RjqGtK3Q3D5rN5TzHyTj0wk85e3Eso+jTAFnkpmuQUgx0eOG2JVEAHNQz3QvofYaGeULI2qtXMKqiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qeSNGqYG; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qeSNGqYG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbCMD/PhijY3T99ljQSYl19t+A0A8IdyWIAYnKI/433JvpoXxcb9GtRu9muymJEHyZKX2t7/3FjneA8OzYCrO//AISnK74TCoqb4G2DmTqbdK4zFJtItcOQvdI+9xTuarY7sQHXSHxMEW6o6UqgX5fnyjO/y83KezXrWHhwiSgD7kuktkYi1oa9cz+CvWpKLnLW34uqAHhe3GShCM7w8QcKnWndJbTCwa6m9DxR42BXKQ69dttbiiQS1EP7L7o5cbuhFg450Fwj3Gp75tQ+HQT4E1pOgaQR2p9QyQ9yycPmH1THtlqfU3nD8lCtZsX8h0THe3nC93pH3tl7dr+eaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqBqvkLD2m0386SlX4n4urOUDYY8vJeu/xAJrCSOTJQ=;
 b=k8DD89suu1QsrqC4jxjaNH3Ca0n8sJZTGC5zaVL4XB40f5Yg7NiojmXFcrRAaIH5YH2Xls1gzPs2sPIdUYEE6vGH6S8ecaKBpqHTgw9J0JGJP90KgGgVG+cGfD++Aw30r7MCyM248xShCy75YBagIm3ErtpM8EnMMCb0zkvQx/vzKGknmJPapdH8v0egEK4TtWa4ZIOUBtBwo+V5KvyMyk8wFW4sEvI0cbTUWXB3ZuXfuEnYzpwydDc6lE/HxBxiD/q+Jg+HVF6MrhRoRaDBeG/Rlwy+whROKV0OqLzqEPsH/ccqTJSgZM2dzeB7cJa/I62C9Yi70+yzkkhfyMZq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqBqvkLD2m0386SlX4n4urOUDYY8vJeu/xAJrCSOTJQ=;
 b=qeSNGqYGr4S9XyKQZm2N4m6XrWoJ2ERpKg4RQb6rmOfzv6ovdpXPvmm8d9o3+AapIIUs4Vh3bICZtXlBiJsy2q8Q6TYZEDPHKDO3wpRXkRLjIVCsjG5f9iZogLVdhSnY+GQbl/mtMjFyZil/PzA38zQpaAQ/jZQJkOWvsEhsQK4kTjQcmIOuMiOrjd1qPRSk/eTcBL80842WjwWKBJ8io2HfhVEHeGuSEEWS5W00arKcnrwkjz/wm41o0Adv/FXg+s6kemIBiR5NuR7zHTInbfCAB17ChysAuwsdqhzu7ZN7y8Eu9hNH+zp7rtLpWzXj7ooMlzlweDzoRmXy/gGqaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PAXPR04MB8392.eurprd04.prod.outlook.com (2603:10a6:102:1c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:16:31 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:16:31 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 03 Sep 2026 03:16:11 +0530
Subject: [PATCH v46 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-imx-se-if-v46-4-aefaab525034@nxp.com>
References: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
In-Reply-To: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788385573; l=15491;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=P3oQ/nZ3C57TVVdz8LiOWwhBHg3jCkuHmMpdU60g9eE=;
 b=r7ZcvnpqI/lf/ExSBVze9NxIf9B9nvmIkL3P4FXRIeUT0XDKAhgyQCzPM3/WwgMpViXMFWJl1
 HSTh6XmaWVTALKAMTyQG+1lQuixIwMH/t+LVgl0g+oMVykiBDZ9YtzM
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PAXPR04MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 1acb33ab-0cff-4a0f-4a59-08df090d8d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|921020|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uogL+/kmADSrxtlhLC4Yom5ikJ+R0EcIFS6GZql/pnpmZSyLmrnhKxwbctVqIeA7wZynTFIGP14QMIU8Ew4v74ddmd7rs9yR8uk8qoPChJmA+ejWj/oIH3YhDVx/KArACgLA7nOI0ZQGox2ixpoVsmQUMUJfrdnnZyqt/oU6fmaq1Znygiwy6tG21vwF2P3jF8j1uUjAdwk4orLElC2EvyX8s+e8T9+YhsLHc34KXWqbw/RWsNa7yaNo/03pZVhoJhOav9Q3rR4M8m/Nt3X7LztKZ3hH/eko3mlrvn11Lt0UbrmXO2/eLxQy2GP+UeRYJAkNMF/f6Yc5Iz27rzfwVFRKwoHuAm1Ov9OrP2sfEoi+JhvNSMy4xn96r8btSGLhc58eNifE7tn+95OsfLxgQUpZXyN4Q/Fx33jd26zJsNZB614gjjJMjOi9wfuXWmSjP7ebLAkNVNTJt5AYZrYtAHwllNrFR/Sw1JNUDB/yRuwTOYIECdH/81oA4NOUOkk/XhX60Cwl44oXMMdKQwzLqtgbJevcyMoMjwu/bHVLjShgYxaI3+reTtBxtPcQVJPsPgP6HkZhjuEsW6ocT1BzxV6r8rgJlXyyOMpKZr8gRmtyoAqfHcVBJK8ZMo1qWLsHkgX7DITa1a6pVdWJ9ah1diP1wUf7+earH6g4QWHOeLjQIv9AGirDHiAhMuYYWxwalfV53fWsYZeab2N/WiXD5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDEwQTErQVpraTZQTzRYS3hibGkrd0p1aWNSSngxMmF5R1NNekdIeXlEbUxR?=
 =?utf-8?B?ZUtnbHh2TWlyRC9OcnNPbW1tY3RFNnU4RGR1dko2MG5uamVHTG1lc0RoWHVx?=
 =?utf-8?B?VnNMY0VReEk0K0VBL1JYMWxRUldFdDg3MWs0bmhXbHRYclFOTmFDT0F6MGp2?=
 =?utf-8?B?VzA2eEdsb1Z0bWJUVHNRSHJ6ZCs4SDZsVVEwUXRLYXNpb01XSUlwQ3NSVEJy?=
 =?utf-8?B?enNhUnIvRENwcTlNS2NycGgzaVRyVWxnN2VQd2ZZZ0JLV3hqRE5MUkNjSmZq?=
 =?utf-8?B?UVVJZ2xQVkZqa0tEV1g0b09xa0x3TGxWUnZvaS9wb3hLdHVxc0tMS1N6TUE0?=
 =?utf-8?B?Q1Q4SnhnUEtpOWpzenJ4UGtCVStDN3B1U0F2RFVkVE93YzNrTmlqeU40V2VJ?=
 =?utf-8?B?RW01MTVVNmlkWStxT1BLOE5JWUpocnpWVU45RVBjVytsTUhWRzFySmRNZE9C?=
 =?utf-8?B?LzI4R3dpS1Q5QVo3eC9XU09hd3prUTZLelU1b0F6MXJtN0xhbVFZdjNDbHpM?=
 =?utf-8?B?Q2p5WlY3aTFUOHNxdjl1NlpzVWpEMWNIRzNFZHhhWkhVWlk1T0tXVnlmV2Js?=
 =?utf-8?B?UWJsT0N0M2NvL25QK2dNSVl4WXc3N2VhWnBPSUtzejE1ZjVERlZCZk1JYzR1?=
 =?utf-8?B?cU8wTVFqZ08yOThmZm1KWXREZkpFY3R0Q0l3cE1YcUlEMlc0clE0SUhTZTYz?=
 =?utf-8?B?UHNzb000cjd3dVQwUHJIdHRmZ1VVbGtrWnBkc2J6dUFBVEhDYUEzeTI0RStV?=
 =?utf-8?B?YlJpWDg4RHFuRzJTTVpZc2kyTFIvWkRUVWp1SUZYczQvVTBEZjA5L2EvNGts?=
 =?utf-8?B?dms0QWFPaGlyLzNMU08yQjFmVGNBN2d0c0pGWUpwOFROU3hDL1JwSXR2c2pF?=
 =?utf-8?B?blZuQjlTRFNZcUM3S3VtYlE1RjBlaXNJT0xvK2RuWE5raG9yUlB2a2lUMWI2?=
 =?utf-8?B?VllIclFsNHdDd245NUcwbFFYRFhla2RlRGpwSUZBblBEZkVMVU5DSU1ySTls?=
 =?utf-8?B?SUJyS0wxemR0anBIRjM2SFBJMTROMGF4V1pRRzY2L2JwT3hyM25NTXBiRG9q?=
 =?utf-8?B?QUxHTGsyTmliOFAxMjBUMEdtRWVVTld2YVJxaXF4a0dUc25jem5hcnJCU0U1?=
 =?utf-8?B?RmwzMnl1VGtEdzhBdW54R2o3akVFdlYrUXpUQ0ZCVHNMVU9jcGQ2Njc2WFUw?=
 =?utf-8?B?UldOMnpsa1cvRFBFQW9TZUUva2tTLzg1aFcvTldrQnBmRk1KUzEvY29aYXR5?=
 =?utf-8?B?RjE0OWVvak9lTWswdTFQa2ZocXpOSTJPODNuZkxTRjdESnJHV2V4L3JFK1Av?=
 =?utf-8?B?ZWp3S2FXekN3NXdLT1dONDFYZGFGTjA2ZzUzMGxPWHlHN3pMSGM4RVZhbkQv?=
 =?utf-8?B?djUrQjhyM1BIN2dVWDJnRWUyM295a3RlNTdzNzhrMXFTbTE4YndlejdJSHIx?=
 =?utf-8?B?UWxxZnQrT3VuL1lETVN6MzFidjlmTlhxcHd5S3BUZThoWUVJTWM4K0NiTXNl?=
 =?utf-8?B?MU9VN29ibHlIMTJMV2dvcDgrYkg4OFFtWnJOclV1MzBPMzg0NjdnY1N1WFgw?=
 =?utf-8?B?dkdQN3dsY0g2NlcwRjIyVlk0RmlnYjRDMEphL2pBMGpPVkRJQ3l4Mk5PeGRi?=
 =?utf-8?B?YzFMMkI3bHNEN2VTRXl6VUVFWkQ0OWVnMElka29LOFdJVFZrSkpESDlOaHRs?=
 =?utf-8?B?RWRUc2h3a2FEbnJFVVpla3ZzQTI3dTN6T3U5bGtRN2ZENVVROSs1MEplRDk2?=
 =?utf-8?B?dlV3enpMY0Z6TnhBT3ZXOWk2YVRKVHFCMVNyS052aVFiWnJLNGFvNGkyaitk?=
 =?utf-8?B?SXRpd0wycklwT2F0MHk0ZTZGMURycy9LR3o3a0haNDNUblBwR2VQa2RxdWlS?=
 =?utf-8?B?eVd2T1J1WjBUclg3MjUvR0laNnNoaGIvN01HWHROWXBFS00yeC9MNnh4TTc1?=
 =?utf-8?B?dW9PbU1MQnNVd0FydjU4N2NncDZGdXk4eVJLQzJVcWowbExUbHhNUXNVdERM?=
 =?utf-8?B?Zm9HZTdVei94MDEvdnN5V0pYbGoxdWt6dVZFaEYva0NNcHdWQTFQemZ0MFNt?=
 =?utf-8?B?cmlabkQ4TWtrOEFkdnJoK21WZEplK3JWSk9Ta0hwdytQT3B6cmZJbURiYmN3?=
 =?utf-8?B?L244Z1hWVWwzVXd6NVhBbDdXcTZ5b0FzbStHdjNYR01jR1FUR2tub0NEaE1J?=
 =?utf-8?B?ZjFtdlFkREptNCs3dnc1REZzaTB6Umh5U2JkUDhkUXlPQmxVUE81a0tQRlBX?=
 =?utf-8?B?WG13UW5QaUwxZGFoQ3BKZHZtc1lkaEJOM1UxbyswSVFFVExOMGN5OXJPYnhn?=
 =?utf-8?B?NmlpaWIrTXJzVmQ1aVkzSmR2bW9mdHFPWkxFN2RjQXc2VkJycUpaelgwNFE3?=
 =?utf-8?Q?r7YqR2egaV02nW8p11orKckH14/rEAeOlEYyb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acb33ab-0cff-4a0f-4a59-08df090d8d2c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:16:31.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADfPwtBDohuL6E7XWwBygKf4Sv5Vn40G18P36wG6WqitpjLlqNSxePK6Wj2yhHX7jKOE6AVEQ3iXk/RP1tG1rfe2D7iospeXf/s+2vgW71vZSiaBL3N/d1B0sssaDwfs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8392

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
index b0e7c643cfc2..12febd3c4936 100644
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
 
@@ -211,7 +212,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -268,7 +269,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -317,7 +318,7 @@ int ele_debug_dump(struct se_if_priv *priv)
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

