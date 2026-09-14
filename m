Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC4347B42F;
	Mon, 14 Sep 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395102; cv=fail; b=a2W8wAQp99vB+sLuYDWVxqtGDG9Fh+aWsgdPzZXWO5xQ+4Z3OBgIQH5s7kKOm79jYhhGr0BFEZ8BkNh8ISMsdGplBTZKcomgQ3t2qbrKDJTl4zfxrtkJwOr6n2TSh80LGUEYolNsMO1Y/c6Mv7U2mqt0gHqB1WJzN8qVRKD1pK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395102; c=relaxed/simple;
	bh=lyrBjuIdc9Ih1jTyvsJS2jeIUB+2LTzsFxJRufYm558=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G4VDiiblYpq9i9Ygnh0siZy092vXm0jqnG9kFnTGLIZKeGzAF52ZjD78HeMhNE3PWIg360jzZGsAgWfBZ8hyx+6Sd2pdOFGWoKhZ6SCAWKgLgAVPJSS53FQsz3STDAwZ5+vjpmwHdzTGuPYi1z5gQLGYtb77q4TiVD23xSYI4Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lKkJcIUS; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lKkJcIUS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcfeNKZvjjEsqVGbng/SvDC51gPaJQXwr3BngrjY2b97UDursI5RTad9N3sXLhNjw/bweJEd+uKx8n4D9urMSXCDieDdvCRB4plblRMg1P/fAV6LJyBm9PJNJ0E0xQrivtBZpzUdtpRhjm7lSCiYtpWpG7JHG5pGSl37Ptj6OrU8fYqAyT80LZzWubtRoCyd/Q5I8nqWcBFXxQ6MSxEwAaZ2NmPza8/RuEn97p0i9/lo9zNFZK/uyGXjHNcbLYLZ1MUJHx7WGmXadxBZmiwzDainRrRdH9sk15lFWXMeDRR3MTdKUWsqqZir8osNXg6nyTMVDXrOqBagvvj5uDOT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGiiNzXPe3TwviR2iyoc4v4DbbtT1BgYLtrhEDaYcKM=;
 b=bqFrQTjDBkgTFajVkdIRCsNpLMrKlOqqKIlt16eyZDMelSJM0tpS8dRQVZ91RusqUKAp1fGLruDiwQ4RFkdmQa+Ofnl73uRBAK+BIZ3PXl5Y/E4WKktYhfhGmoh9K+05siKE6AvB0jmi5VKDGXonucBwjwNb5Irr9sp6tJ1yGTgGzX/ZQssIGg7sOeVNpRfJeaO+Cnt3FOWymvEG0NKzFvY9vJN0uhvovr2adrDHuub4wq5Oku/Vc0bW0gAWClrfxBZh7XjC2muG2zV0npvTlLjI6phgF5ohbN3jYDki04WXMPWWITKcU7dDmtQLvNkAZSCrZ+Db+Srblq5r+eqoBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGiiNzXPe3TwviR2iyoc4v4DbbtT1BgYLtrhEDaYcKM=;
 b=lKkJcIUSURT96IqFffqZpGLXEBg1Y3hKsjVXydvzFRGS59wrtSFWPG3C1STIlB/b6f1RLdTFsUucfn5As6KETuPlGT0kK9spcY0NW4qZ5A74Cxc2UQkY6hL0Y0je1hq0IYAe1AI4Y/Cl2fP2pQzkigQNIkAJ+Bo0v+JE3rg6L5b78LaO1oi8I3OkjXPtcOVv4/GPGWNmfNPr51qgu6yaMA4RhjXKCLB8py62INPzX+c5Ir0IyBhOIwrJTGlnrhtFZobRAj4alOLvf8yndPQi3o+hr/WdwMdQN1LbAIb7Fck34wOkh1F8vD2kKRq6Xh8m3VH9i48FLDkZwKeGnHG0wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM9PR04MB8618.eurprd04.prod.outlook.com (2603:10a6:20b:439::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:11:04 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:11:04 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 15 Sep 2026 01:10:01 +0530
Subject: [PATCH v51 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-imx-se-if-v51-4-4a7dac612cb5@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
In-Reply-To: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789414820; l=18015;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=kF2EqFWM4USlrXEQ85FngFC56JJrjsIGC9OrD6bKtqw=;
 b=cfZjItCeif9MPq11XRdoMhYTXeIZQ/tiK6Oy05Rb8VOibUrtQogmNZuylHRzWj1OFi21r1eGc
 28GqdmFzKBkDtoTPWcVlrO2taoJYUwoh0lYVrZXVbX9GsnBSyF7g5O+
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::6) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM9PR04MB8618:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df7e8f7-8f4c-4134-0cbf-08df126a032b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|19092799006|921020|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	pP6J+TRYD9uk4J3UXNOgx4U0w5IbiPDfVlWrLO3DcuHAMSr7kuDMmfpSbCLCwJ38KmovdGB07CJpG/T0zrRaOjvTnmy1X3n+zWtEiYnj7hEYZDGh3MQ7lFr6tuh23+6oNrCmFNZ/hwnO3eTfOxYMigR76MEAEYG2qi5Ho1d72lNnfneXJ1EOk/SkFRndv57QSfWErNRjhhnwnfjNEXIsAWbfr7wQn/l0/UrJyPXN2BPE97ytcDMRqwhP7IAb1joFiLPTCT6RyT8ejfbbLBRDdWWE8k0q/ECpJb7w/LiSlGBr3Oe/PAaW1pA+K0XNTrzSAltZL2/y4IbRq/A7b3v8FCdI+cufj4+LeAy1/oKYQzVXqL9E5VQhgKRjV0P0bDY8sjvR0z2NB0nlM/tSWGNy9O1n8B2JdQ4WldcDTLMOAhVLN7S/0uP3cBltIaVF1WFjvx6UPO5ZCk2d9j732qabW2rI69yV7iXf9Ga2dhwxdN0pwBxQsMqiDTovlIWhbrtt1JbzZknkRwxlm01UKvas4wc/FWDRHAKd38JH6vQ7zDBX7e3QFuVdQw8bBqkGTWwr66snS92f+aRAbO4ojBpWLCxErB5ampxLQ1vJTWmTeWpyYjq1lePi2BQlL+dlwYc426FkMXcy8S/KxcxfP3UFULF7jfg7bqoQLhmNJOOh8lWWuk5va+TWF5N57rHSAiQBD+hs4od1+mHCYzpf6dUS9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R255a1JNYkx2MGxFQkFBMm9qSEhNZmJmRWZkaWNpWHQzdlFxdThLMHpoQ0Zr?=
 =?utf-8?B?SzBMNldCZC8wYjBLbTQ1MjBZaWFSajlNdFg5OXpmVmZ4c1FOYXlreTZxZS9w?=
 =?utf-8?B?ejhMZTAwa082VUMyQ0hmSmx6YlF1dkcyait2b0dlQUM4RmtxcWM4TzQ3OEVs?=
 =?utf-8?B?RW4zY1NwN2NrWjUyUzVrR05La1BSeEorVVRuci9jODVGMGdTeUlwLy9zU0c0?=
 =?utf-8?B?K2QvZElDUjljaUZFSzFPQkxJU1BQZG1HQ3RiS0l3eklwT244YmVxT0Z5L2E5?=
 =?utf-8?B?UWM4cmRueVdOSjh6ZmpqK21PWCtta0dCMUdiOWxmUlQzaGRTMGYrc1g2OHd1?=
 =?utf-8?B?T3BlYStOMUNrcjNTekZjeU1IWmlQWnpuV2xkMDhMZ3ZxOFJNank4bUpacUpt?=
 =?utf-8?B?Z1IwVGhDR0tRSkdJcXFtWTY5N0puMUJadmoxZVJXR0VQZTgwNDV2a1FIVG1n?=
 =?utf-8?B?NEJLMEpPVTU1Y05KbVZhR2t0WXhhRzA2Y1F6SUJYL09rUXZTSnQydGV2Rnlw?=
 =?utf-8?B?YkRvU2NRb2FXeTBZZjdZRVordE54dGVmRFQwVzJlS0pyS1lDMTVIVGF5VzU4?=
 =?utf-8?B?UU9RSEdlODJNaWlmekZTREVQYzZ0MzBQc21pVmJCdDBkT3BMQlZ0MGo5QkVR?=
 =?utf-8?B?TksxVlp2MG9wNzVrZmtzWFdtM2dLbFdkVE1tNG1zRXdaL0FXQ083TDBkWmJQ?=
 =?utf-8?B?blMvY3diZWFYaHZ5cXpya2t0QXYzVHlzRmlMWEFWQVp5dWtXbHlaaThRb294?=
 =?utf-8?B?N2lQRjB4aFd5aGJFSEN2cTVzWm1NT0ZrWGFkd0w5aDV2RVEvS0NKRXNZMTRk?=
 =?utf-8?B?NE1uSmx6RmlhdE5lQzdxZnJieW9TM0NoTk9XSktBWVRJOXhXbmtYbW4zT2s1?=
 =?utf-8?B?M2FibWE5ekE2MUZqTXNJdUtRMnN4R2ZrQzgxUVRMNnNQTEZ5S0Z5cUQ3NXhW?=
 =?utf-8?B?VHRIM2s1M3RnRHpydURaY0dCdTJRaEJVZitVSXNPWDgrTm5nY3FLUDhwZlNP?=
 =?utf-8?B?bURMQUpUSTJwdHBxeWhpRCtxZUtWMWtBSEtyK043eUk1RTFZcVFLNXZMYWY1?=
 =?utf-8?B?aFNtNDF4RjlYR1JKWEdINlE1amQvT3RHNStPajNmZmxEQ3orY0JtNFA4Ym9O?=
 =?utf-8?B?T0ZGbURwWXRlbmtab1Z6T3pDcFVMdEplNVZtVnZJNitEYlJHQitMTmE2cFB0?=
 =?utf-8?B?L2tSS3NacmhQaWxvNHQ5dzhNZkxPNzVESHA5cWtLT2dFbTNncWhUeFVEQzE3?=
 =?utf-8?B?c0w0VGV2ZjgwQ2ZKNjh0WkR6V29wQ0ZPNGxzK0RNRXdKd3M0VFQ2MEpPNS9Q?=
 =?utf-8?B?TDI4cFZrK2hBOWgwR2tWb2Yxa0xFR1R2L3I1QW9iZlo4OVAwa3NQUlBoenla?=
 =?utf-8?B?S2pjZ0xuK2lidDZkMUVMTkg5TVVpcitlYTRFYTI2OWxMSjdlMDJUYnFUcGpP?=
 =?utf-8?B?Y1B0eGlaLzFvd1NOVXBTOTRVVkUwQ1dYcnhMN0tHZWR1NVdWTHhkQnZ0YW1F?=
 =?utf-8?B?WGJEcUhJakVCOVBCdS9YOVJHeHY1dm5acFlqbDJ0a0RtZ2E2NHNRYjRSZitC?=
 =?utf-8?B?WnErSndRdDN6d3FkcU9MRk5WVmROMEFDa1oraHRhTHIxK1NBYkxyTWFGNmJ1?=
 =?utf-8?B?NW5ZcXJ0SFA5anRhUEFpYzlNYjE4ek82RnRubUhSV1FmSU5iTXNWT3pFQ3J4?=
 =?utf-8?B?UzFnanVTTlVNVHNwMkE0YVhWMDUycEp3Z085eUNRNGRKSWxMUzVJa0FTWlg2?=
 =?utf-8?B?eW1YT21lNXFRNVpwcUlsQ3V5QWYvNSszZzNQSW5SMVp1d1ZDdmVQQUwyNUor?=
 =?utf-8?B?L0NzWm9JT1ZsY2pOOG1IT3E1R3dXWWdDWE9kSStCN291OURMa0pCMEx3OFd1?=
 =?utf-8?B?bVd4alhwZmRLVFE5RGxjemxPTDZ6WVJUZnAxUlpmcHRmTFRCN0d1S000aHRE?=
 =?utf-8?B?WFFjcUNLbE9mZjIwRmhkNmhvNGkrVDJRTzJPM2Z4RFpKWFZOZ0JRd1gxcTlu?=
 =?utf-8?B?bkJVRXY2WjNkM2xTTk1Ud0pCSU85SlNlMW5BZkxtNHFLYlNoTWgvV2tKcU9L?=
 =?utf-8?B?eDRER3A3NWVqbzY3YndrRTk2Nk9tWWxUeGRHVzNlREF0eHVwaENPSFFBUDU3?=
 =?utf-8?B?QTBoaXhYamVVUWdVRVRXVWhkT0NzU280dnpQMlNTakhvalIyWHQ4b2tNdERH?=
 =?utf-8?B?K1Y2KzNnREJWd0xSR3dad0JMc2hBR2pkR0t2bHlZck1jUjBqUFN0ckJ4OWJx?=
 =?utf-8?B?REszazBkam1FVVVKSkllMm80WnVDa0drL2RwK0l5VTdWcFIrQWtiMzZHV0dv?=
 =?utf-8?B?bUIxaHBielJtdWMvWHQyZ3Q3blVVUGJFMUxFVVl6ZXhmMTFRT1ZhcGM2YTBp?=
 =?utf-8?Q?m7V+VlX76MExCZ+w8UPthP8q8TgGO3M9rzTbX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df7e8f7-8f4c-4134-0cbf-08df126a032b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:11:04.1143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l28hmwQeEkWzisJsqoBQ2uraktgIQf3IRw3DzWxNdDSm1QK8bHIJD/zgEObMSXWZL9tpBB6ZKV1dhKs9jhdLG6dcx1fjffgY4p+dqM2fTkWoQ8oCYzEeaX5875bbcoLv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8618

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 25 ++++++-------
 drivers/firmware/imx/ele_common.c   | 71 +++++++++++++++++++++++--------------
 drivers/firmware/imx/ele_common.h   | 10 +++---
 drivers/firmware/imx/se_ctrl.c      | 34 ++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++
 5 files changed, 105 insertions(+), 44 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index dba6f0ee83ed..650153d39f46 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -82,14 +82,15 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
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
 	}
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
+	ret = se_val_rsp_hdr_n_status(priv->priv_dev_ctx, rx_msg, ELE_GET_INFO_REQ,
 				      ELE_GET_INFO_RSP_MSG_SZ,
 				      priv->if_defs->base_api_ver);
 	if (ret < 0) {
@@ -144,12 +145,12 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
+	ret = se_val_rsp_hdr_n_status(priv->priv_dev_ctx, rx_msg, ELE_PING_REQ,
 				      ELE_PING_RSP_SZ,
 				      priv->if_defs->base_api_ver);
 
@@ -203,12 +204,12 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
+	ret = se_val_rsp_hdr_n_status(priv->priv_dev_ctx, rx_msg, ELE_SERVICE_SWAP_REQ,
 				      ELE_SERVICE_SWAP_RSP_MSG_SZ,
 				      priv->if_defs->base_api_ver);
 	if (ret)
@@ -260,12 +261,12 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
 
-	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
+	ret = se_val_rsp_hdr_n_status(priv->priv_dev_ctx, rx_msg, ELE_FW_AUTH_REQ,
 				      ELE_FW_AUTH_RSP_MSG_SZ,
 				      priv->if_defs->base_api_ver);
 
@@ -309,12 +310,12 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
 
-		ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_DEBUG_DUMP_REQ,
+		ret = se_val_rsp_hdr_n_status(priv->priv_dev_ctx, rx_msg, ELE_DEBUG_DUMP_REQ,
 					      ELE_DEBUG_DUMP_RSP_SZ,
 					      priv->if_defs->base_api_ver);
 		if (ret) {
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index c4f87fd0fe5f..838d2f957e74 100644
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
@@ -401,7 +417,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 /**
  * se_val_rsp_hdr_n_status() - validate a response message header and status.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE device context.
  * @msg: response message buffer to validate.
  * @msg_id: expected command identifier.
  * @sz: expected message size in bytes.
@@ -420,9 +436,10 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
  * the firmware status indicates a command failure, -ENOSPC if the response
  * size does not match @sz.
  */
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+int se_val_rsp_hdr_n_status(struct se_if_device_ctx *dev_ctx, struct se_api_msg *msg,
 			    u8 msg_id, u8 sz, u8 version)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	struct se_msg_hdr *header = &msg->header;
 	u32 status;
 
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 39bba4ebe8b7..89ae4c335e7b 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -16,16 +16,16 @@
 
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
 
-int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+int se_val_rsp_hdr_n_status(struct se_if_device_ctx *dev_ctx, struct se_api_msg *msg,
 			    u8 msg_id, u8 sz, u8 version);
 
 /* Fill a command message header with a given command ID and length in bytes. */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 0013c960ec43..b5d3421c0987 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -294,6 +294,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+
+	dev_ctx = kzalloc_obj(*dev_ctx);
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
@@ -337,6 +360,12 @@ static void se_if_probe_cleanup(void *plat_dev)
 	of_reserved_mem_device_release(dev);
 
 	dev_set_drvdata(dev, NULL);
+
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+	}
+
 	mutex_destroy(&priv->load_fw.load_fw_lock);
 	mutex_destroy(&priv->se_if_cmd_lock);
 	kfree(priv);
@@ -426,6 +455,11 @@ static int se_if_probe(struct platform_device *pdev)
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

