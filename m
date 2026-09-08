Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B9C530DE1;
	Tue,  8 Sep 2026 11:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868190; cv=fail; b=LQbSNmb+GETQkpoSItiiXMi6ueFwn6rFiQ6+zb/E2WpvG1GrEvRQW84MTiK793cD58pusBZwhT7xsyPCZQvtYJHPl/6rJKWjmQCgOzT7kVh9FHNYFpLTCuHwG6+cg9qyYb0i1Td3WjWWB38M61wog3Jie8F5rsahmiZHxZqn6MM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868190; c=relaxed/simple;
	bh=Ue/Sg6kCsHGFzC6lY+72OrEsVgeJLAs6d4PsvwkBZ0c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Qjz4TeLhjml6BgxdjYE2ZsHU/8w/u463CMyCnlHmIT37XDOxIeS/PMZSEfTeLpptqqkr0UV3G2FpGrRAjlb1yjj1cJvrXs61shnJVkPOzBVr+qAxvUwXL2Aa72AVrviqISqC78g2QV8PWwoFF88HSZKfcqYYCJZeI98YdU53o8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sT42A7tJ; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sT42A7tJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQu7yOjkX7XEEhocaHl76XSGLrgYIYiWeHQkD03fj0QQDpHW6bfUjbtnrCLYPPbUrIWEiYJImH9MOF4TIIp0oqK9ymM9WKbN9eFqORxrz0n7/5NnUmHFXCvpHhipwLvZkHJpAsj+t5joBgywaQpRIJTAp5TCf43P0tx429Rvn2Ip2xP5Y5XfhyvRo3zjFOeVZ8lhQ8nQBk89m29RnWfO8x6DEymi73pACh801BGeX0box0F6Ruh8B3hTuNyIn/d0+s6SuXo6sx9agUQXLd/jS+ZQZjrYDMIG19JFLcts4Q3XWSIk/leyJixCxelGIetjcyWrG7LkMknuFFodc4nj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjPV0SzITnAp0yGsX8acjraAAbAPvE3Nlcjy+7GVYno=;
 b=rkElDARUd86SsdCQnEK323z3ku64XmBaS3wGCFBYcAxjSKDjouclUJSvbFDh31HEsI98usiw7bhECQizRuYpCR85xNGsuR9MJnO9k/1OCOhYox5AaCFTK+HhYRScWoosH9vZfirtme4wS5TQfmnkNal36pjrbjUXh6vNnmuvLcUP48XdObJUKG16BZe8tlCX8HGBJq/H4ul59Qh6rpeSxJv4uV6kpEJVv/nqSxc6yBQ6GkOEqKoneoV9vX9/cxG7LTZuC91Xbs3+w81GyP4yHXuHcJ6P2ESeqQHGVZ2YSB/rJ4y1IUcBbkU0QeYH14Wu018+FgDTMbdoroXH3a3JsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjPV0SzITnAp0yGsX8acjraAAbAPvE3Nlcjy+7GVYno=;
 b=sT42A7tJTeFCVqiQqOtQbcWGenQI6i2U5DsHqFk8qx/UwuXk/2W26gYOiAPOI/MEnTVTfihn0NrGHCuqigpcGd2ca4dZau/uEKAbG/EJxWEFMTGt5b+GIURZkmBqUuPrZiHUIXEzsvXfaMUZ+4QfjNr4q29IgxXoQMj9bUaB4lhe1MfEX4jzTdxcKFGN/Vc0eKkOmzeME+adteOvvGGI8ZvyUOBdBDVf6Ny+JtBNEAI4L5wEnYzYtkZC2RR0ZtQ5edsPSNKI+Foajpi+X/PL5TOTcUrmV4U9cT9//ogTg5Uo9LH1+DukoeCSsoXAnXmf6NCsIydly2W/Pb9tboJvaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GVXPR04MB9780.eurprd04.prod.outlook.com (2603:10a6:150:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 11:49:12 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 11:49:12 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 08 Sep 2026 22:48:14 +0530
Subject: [PATCH v49 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-imx-se-if-v49-4-a59529118839@nxp.com>
References: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
In-Reply-To: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788887921; l=17905;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=NKGIamdSxTb0scskBFcDxtMsNlkeITKRCN8n4SQEzwY=;
 b=Kwz8sv8gIA8X2KLnF4Gla67SPEJLTNja16fmhpOYyZgvcW7qvRVnCh+FQWyMsZx6YbDDI/INQ
 wFLEjLf7QQmB5qHQWP2N67RnB59vdQU65B9U2JZGpHzBWHInEIzqKCU
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI3PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:295::11) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GVXPR04MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: da4d2d97-f212-4e80-465e-08df0d9f337c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|366016|1800799024|376014|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	LP/Ha1IU7db/+8UqKQacyL+zQNNr6LPBqtuqFNNuvjha6cJnKGR1tzNJn3lbfDvhIsq9uO+kJhEmre29h2jW0tLrgtvEOxrxL6XeTmwHX9CCef0a/H8I47Cv7XNn33EFc6ZSqspRM8EEpKpr1MRwsRjJx2jEzHMIxNkOkhw0MKwOS3LtZkofiDsKENGWXkv2frWuJ/FfpkfWKX4M3uoJxAvBLO35rNuFbWKjafIl4G/2mgVY1YLE/mn36LitKnsdmgfC2+cAHSCgCMFCcd8XfiRPyKMSLxAsB3Y0FpzR5NathPLOU/7vl2B5UswuFFBx4GNYk11dQxZQAeC4PYiqQnPt3oFRgkD6aUZxzqH67hurVa2V6JuaBeFuAOZHhgQ/MRj5TzFwuKDA7yv6b6DvwM+0WqruPXBtFYhwbNaARPg6e+xWVHdhMO62IyB3sfBJH5GCo8wk8I3F50Ngcw5mRvuWozLMyK1UgrwPxMk4XRr89K1IVjv2lS60zXfS5Bv2dluSi1Si2Y8N2Phou2vjt7RyubU9KbpiAt1qc63W3UPA4waCkJIz18dk3D4oHAAewZE5luJB+z32yM4D01Us2Gf2mUs2XgEIIN8BP6QpQJY8eQZ82YXzma9XBzV0Jx3Bu33woalluhBTcNAXq4+CRKtp8Ou64cy+Y0Nq1zASzSLQgZWJf8UL6DOrxlpLOkI/1gFSoX50zdnrXLhQiqzoeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(366016)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVc0NUhWbHJ3cVpzZmJhMHo4cW1qSWszdTFENUZJK3RMci9SRkprVVE3R2hJ?=
 =?utf-8?B?NEtyOFBFVi9zYnpvMCsvbW9sMTR6K240SE94dWM0WFNUOVF0a0NSb1VsWTVs?=
 =?utf-8?B?L1lGOWxvQ0tQYUdjUHQzWFVkS3g0TGZLSXhsNHl6cS9CdEdweFhBZnRzcGxK?=
 =?utf-8?B?MHJkZjh0UmtzSlhkd05ubUI0ci9kcWxZaE4wYXl1dVZCZEVQWi9KSkJLWkVn?=
 =?utf-8?B?WGdXdmtMN2V1ampVQzVVZWJQeUliNkovSmxreTl5cnBBaXdZY0xMNU1nVnE1?=
 =?utf-8?B?RjU0Q1gwNkU4bXlzL1l5ZGdyZm92Mkl0bWlOOFdZYXRxVHZNa2VITDROcmVI?=
 =?utf-8?B?eUU4QlpvL2xDV3pZemt6cXNDb2xyVEJwOEtQWE50SEE0ejBjazhhVlhGYXJu?=
 =?utf-8?B?K3JFMUUvdUFxU2FiaVZkRHZhTjJzQW5hd2RIUUNSMWY2TnBFSXpDVWhDcTQ5?=
 =?utf-8?B?ZU9zNmkvaEJxTlIyWWxscWhKYUszbFJSRVI1Zjlyd2dzd1BxRE8vK0xkMks1?=
 =?utf-8?B?SURPeXpsdEVDK3AycWZFeUNHUytrT2lEOUJWemJqNG0wYjc5d05RMmZjKzFl?=
 =?utf-8?B?UVRtMm5VbHMwYWkrRzJobzRZY0dOTFJkS1QvRmJNZVF5L0dLUllWRTJUYVRH?=
 =?utf-8?B?cjZEQzBrUVZLa3ZMc2daMk80eHpaYTAzK3FIL0F1MWtWY0xNeTc2aHlUdW0w?=
 =?utf-8?B?aEFHRlUyWkpKbFRmdHhySkNUL0lVcXZoMWpKTk1OOTNEMFBpYjdZQWpMZWUr?=
 =?utf-8?B?S1dsQ3pYTE1Ba25oQXR2anNPMitNMXdFOU9JRDVqOWhRbVBtRi9tMzhLcVBN?=
 =?utf-8?B?MTlKT1M4MHNHRmJGQ0ZMaVh5MUFCL0E5T1pkUDdjeU53UUJvM2wwa2RTNHpy?=
 =?utf-8?B?UlIvR1l1Y0pNWlNwaDdETVhRTVpUazArVDBoKzFUWEJkSFFtOHZvVzkxR2hz?=
 =?utf-8?B?Q0ZvdUJ0NEJud2hjQUZCWmlrbVNUV0VsMyt3ZVJTWGlZMzVBZTY3ek1Jb0tv?=
 =?utf-8?B?TUdraGpodmFiMDlsNHpvODhIRXZSbWtUdnFraTZ1WXdJbm5uZTNFblVtMklM?=
 =?utf-8?B?TlFpdlFlZk9DYk0xdWtxRE5QalIrZWJCeEJPVlBpbnBwKzFXQUh2M0ZZaUNB?=
 =?utf-8?B?S1cyMENpQ050NERxajR0MHNoSWNPbFhvY3dNTWw4ZDlzZzVXamZ2VE1zdnBI?=
 =?utf-8?B?RS9IRTliVnEwemtyRUpRa0szK09TZng3bTRDVjJOSk9CSDNIWVVyME9DSmZ1?=
 =?utf-8?B?M2FQdXRWN1N0NG9aVitOSWlYYVVJc0M5V21WUVdycXZmY1o3dDhqeDMyWkoy?=
 =?utf-8?B?a3RteisrVEZITFl0VVk5UWVqSHB1UXRlSUVkSTlFR1hBK1dERFVDSFdhdTFE?=
 =?utf-8?B?dkdqZFpaaEp6MVNTZ2xybVE0bXRwRFd5MG9NczFydC9Lc1A3VitqT0hqNmVu?=
 =?utf-8?B?SmppTUlheWhGQXMrR2dpL3lyaGxyVG9SMm1ER2Vza29jRWxFd3JjaG5ZeUs1?=
 =?utf-8?B?UFJNVHFMY2xXenVFRTJtRFlKZ2oyMFJpMWRROTdWeTk2eU56ZTJxbkFsODRH?=
 =?utf-8?B?dys2MGJ3UUp3bmVKRFYzcGNPMzQ0OS9qRlVsZ1JhNlBIcWMyNGlTNTgzWlIz?=
 =?utf-8?B?QlpDUUpyV0hxTEdmQkxPR1kxTG5zdWFhMStqU1cvS2h5Zk9KbkpTWmZzRlY3?=
 =?utf-8?B?ZzJkOUIwdTdKV2VoWEoyNjZ4ZGhBVm5URjZkZU9xWCtLdlZOV2NIRjhsM0tS?=
 =?utf-8?B?U3RBQmVIRUZoKy81Si9KckMrbXhqT1liTUkxVm04WEhrUlRNUk15MTBPZ0hU?=
 =?utf-8?B?bVRJWGE5VExHdzdBQ2VXRWhCZ3lpNzBsSVdlNXZ2ZVpqdlRtZ2swRjY5dG04?=
 =?utf-8?B?QmJkdWx2WUxpVlNvQUVKZ3N6MnFpWVlUOGRENHJ6eDR6M3RjQlhnM2I0S01l?=
 =?utf-8?B?WjF2TVN6bkc3SE1USnBNYXVFSlZQRStHTG1VbExETHJxQWhqSVgrK0pBQ3V1?=
 =?utf-8?B?eWR0dUYxWTFITlczZTV0aVJ0ZU90ZXBaelVhZEJqbGR3QmtDU3R1NGhiQkpO?=
 =?utf-8?B?bVpnQm1EVE8vR04xT2RjTGFtQUQ4T1YyNlVOZmNjVjhNVERBMjJqWUVxa29D?=
 =?utf-8?B?RzJ4b0lQUGY0Z1FjKzBlY2tmU3BGSVM0WUJSUkxsZENJZTdMWGVIMWhsZ3Mz?=
 =?utf-8?B?eElGVzFLakUydXFiaTVzVEswMGkybmtNTmVLVk43UlludGFPbjY0TTRwOEt0?=
 =?utf-8?B?dGc1cFhFdXp1Z1Z5ejVzQXFLb0tmNDFTOGllUE01emM2RUZJM3Jra3FiZ1B6?=
 =?utf-8?B?Y2lHT1kzdEtIdFNPTkxpaEtPQWpnVmZHbEdGaDlmSTM2eC8xQlFiOTc1aDJ1?=
 =?utf-8?Q?gpnITmyphycGanqlboXAg1FgfEdUVjJoxvPdf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4d2d97-f212-4e80-465e-08df0d9f337c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 11:49:12.6767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkEsTyf0w3V+gOtvzcwwTINBj0Jd2/mGUAszkOtPOT+5pFeS0HEGkBwvOjuvWWIvrIkLdbAj4cxeJ7gmwXab+OwECVnd5KFJsfgk1IQBannSoaLpWyI389yau8pGR+KH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9780

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
 drivers/firmware/imx/se_ctrl.c      | 33 +++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++
 5 files changed, 104 insertions(+), 44 deletions(-)

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
index 4b9354b0e24a..067c3f63bcae 100644
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
@@ -338,6 +361,11 @@ static void se_if_probe_cleanup(void *plat_dev)
 
 	dev_set_drvdata(dev, NULL);
 
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+	}
+
 	kfree(priv);
 }
 
@@ -439,6 +467,11 @@ static int se_if_probe(struct platform_device *pdev)
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

