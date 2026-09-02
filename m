Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED0476CCC;
	Wed,  2 Sep 2026 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347148; cv=fail; b=g95s2dr8Jthf0CDKNDM4Ag3QQoy95+n47qTEykPCO9ZUPLSndY2Dg1KubAsHec4B+XAQikucXBIXSJQGrksBbSP8hPmpQYekljIkoiWMrtHoxhJsPfbYmbvL6cgiOJrj9sXdf07TDoH3RxnNoN6GlqxvtyFwgOo/d437cfzJk/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347148; c=relaxed/simple;
	bh=XCZ1kGnaTN0QtmpHOqfXuu7OVxRKV+pjFtqgbZE82zQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=adnVOuLJ8kdOyAOqSkNt+bxYfCrOzFvmVgwvDeGCgub342DeJiNRj3M3uhhCQxThbInXMeWix18jra80l2Azg3NjYhL49VjIHXrpqSsCftpp/N+n+6aHOMT013zSbC6xIpxBFhcEOhYQNNcKny3mZnbdx9F26W+alRu/RbwC+Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H4uv+Ls8; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H4uv+Ls8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQp0U0EdZ5gR1NVhrw8zVis2HyWgky03u/T3+Ql9X8bjm89et8FhFeBk9l9OSNWzz7ERQOkxnYlFPSluogji625JVGk1F+GckEVfh5PjDrMMESpCRWdHK/4CVZxdY6cM37SvKv/Y5ZH9D1tW++9cvuSj6T6H/G8f1W/4SA6pLyvHxsdDR/Iqkzv3R6KQTYyMP4vyXH4lIpGrjbpF/MF0noE2y4kwRw95473QAlWU1aQa1Z6/2L4OusQgPUR05zsaDCmn4tL1OyF9ybUsWfTonhriov5+l8ZCDjYrgLqjc4p1RrE7lENuBwGkvx8w9Jjf+hCYi9n23QTKmzExe3PmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWOjfYYcRTlC75gTmrIW9j9R1XpywBUM8Zdqz1BnSXs=;
 b=EigghLI4Uim1F9YLhIf9C1GvLijMupV+dYDYXeZUV+XcZYOiswczMej3kT0oIRuiUq0ib6lK21v6sAOFfyVqtSrgmkAGnzEahe1HoSmDd3xik3zYMK4qoKinuqU1SdvQxCFKm1oL68wtrAymK1lwNvM0X+DUrYyFtmf1/Mgo619UvP8zF+FSaz2rpnDW09jn9S4DDS76twSDTQXHjWg+5S6F+KbFrPgLloVQaD7S/UqrxlrrKt0AQFQ43HXkkd0mIR9DbCdTNUrvqwu6Z7Ff6pe32155saLGu6vgiAGpnts/LzQL8nFKVcOxk9GzVYYCbDHwKowXNV/2bJVE9OVUsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWOjfYYcRTlC75gTmrIW9j9R1XpywBUM8Zdqz1BnSXs=;
 b=H4uv+Ls87CQwaFd9rMaHDK/XrT3jaKSYq89oH5usW/4CyWMeVthrehJpeHAKcn5cOZlfWQK+KkOxU4KgRVuoszYC19DmRExbXhtbWKkPS59MT8k5v4hYzEZ1PigI0/jCc/6FVywdZManuiw1B9QmCvS5msTrKEpOQTGB3a5DtgEDHbaCb30BSJUO/L2gsVU2S++fn41Ii7EGsPAiXKrT7vPz2I69j4b9O/ZOCNB/cd3P2IJX3FZh1xh3VCcr5xIn3IcQ8FiH6bOZ0O+ErwyNpyaPcq3+ml8jxubzpuNG6o8egpJd/8o/B0gqsvCaG2LvlNAJqEBLzWKUBR3LRKjvSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:05:37 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:05:37 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 02 Sep 2026 22:05:17 +0530
Subject: [PATCH v45 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-imx-se-if-v45-4-6e400879d8ec@nxp.com>
References: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
In-Reply-To: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788366919; l=15491;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=dRc8iuXLIZzObFtuA6aP15+bDHkjhOGtGupQsl95w4c=;
 b=WcQSF79RkjGn32RNiThx9N2c820o8kFiIkGqcb5RLDlGz6LOQgSs20/lzKbLmIleJwZkwCfM6
 Mgtkd+kfHj4BW4ITbx2zBuSveqlnaQaBUwe6gMMuZOBKZXGEomzMGpU
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4d061c-a932-4b44-6fd7-08df08e21dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|19092799006|376014|22082099003|18002099003|56012099006|6133799003|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	jePl1F5BlWIZTEPm+V/86jOGH1jb5k5gq28iAU35JBjuAcgDSsRgKerMNZ3/jp/oOKc0mrCvc2UwxVyEKr+NI5r/x2FzXSFbT8416Ycd9PXzBbe90Ev8a8k0J4lQoLE08F7Qn3Zv/nxlduuPOwkSJyDiQCVwExFbYrhMeC3nLHItx8clsrdSO6BNsccaz+6cFgSbQCVs7uYWSEkd7MvCmpd8vPwZtMZ9Hr+J4tAk5uZdvIyXFxEqERoh46t8DoiXwey51hY4l/rRzkDZp456//fXisiefZ2byqBBAtQRvV4oJt4MAGO54rwi77zEKlUWyEHaKgmuXNeYv7hWbkBjxMIUOI9qWlU/sV3HJ8rUP63gRtAumCd7pVV6vnQJqOah3I/nzMzMNTqSlM04BL/VAOYlOAoCQy8rRJlsk2p4GOVkPYsSQIl8eOcAaA1diL+nCO/wTbkNlH5jmdpAAaHp5UvSRuS3eY7pIhINo1iOBTgj+3TwzhO8EPK9kbE2UNm8hXxvVwftv0TzBo9PxDT2fzMpVfs+ORTbUBDHDwdysIjgHlz1wQS/RezNRZ3ZxpVPcHIpol9Khivm/dR5523YkBeQE3ZiAoqrVQGvNej/I7CwQO9g5onHodaFTop82+aCopzHoTltzAJaikcpXleAAg5woNsTKt2n5co4q1N+yKeD2o4lI2+GGavFt4ZNAYWs+j2hs4W52W7dA9LEXg8IZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(19092799006)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlVDWDJEUFdiMFpzZFNvKzlFb1hSNTVqV1Rsbk9wNTlNOVAyQ2RVV1Ira2E4?=
 =?utf-8?B?R3JuNmszL1Rpb2xRa3cyTWU5cEkrdEtjcklkdjBVRFpiNllBTS9Xb3BENGxu?=
 =?utf-8?B?Wm50cjd6Um1kbTN2OUREcElzcTZ3NjJqTkdQV3VmME9NSk93VlhEZVB5VThE?=
 =?utf-8?B?VmtXaERFMlVnenNPUE13ZlMzeGVzZ0VqKytmNEpjRFdQZmMyQWhJNDdickg3?=
 =?utf-8?B?Q3pzZ1RrdTBtT0NYNTljUHhqbjhsZmpwNFBaWnV4VmNtVUNuZkk0NGxDT2RO?=
 =?utf-8?B?VkJuOVFjOGdINkRodkRwdXU4NGdKbmZnUEhrTStBMFdOYjUvY1hxY2VidjFY?=
 =?utf-8?B?TGdGM2MvYkl6STE0cE9sdSs3UzJNV1IvSDY5d3BUTUpWSytQWmtXTTRqemk1?=
 =?utf-8?B?V21yNnNCbk4zcGc2eExSYkRoeG5HTmg2WnZSdUQwZnNGRGNhK0M4MWE4WUJm?=
 =?utf-8?B?VG5KcHhrdFdpUVU5SkNqTEoyOU9nWktxTmZ6emQzcmJ6WXIweWxYckdWUlAv?=
 =?utf-8?B?Z2piQzEwc0dTalZSUEM2dTNTb1NqSThVVzVTSW1reEFDc3pNR2hzNFJRck9v?=
 =?utf-8?B?VTIwK3VuWUZEdFlrRzU2MDZsU214b0k4ZE9namp2RjBWcGtBMXB5eFRzRGty?=
 =?utf-8?B?RTNlb1JHakFuZFpQMzQ2MXZxRHlKcUV1M2Q0ejQ4dVRhZW9OSUw2TXplNG9E?=
 =?utf-8?B?a3dmYXBFWC82S2VEZmdFL1pHa3RFSGkvenNjUHNnbE5BbEtDWmJSY09pLzh1?=
 =?utf-8?B?RUh3T29YbktxNkxXYTZWQTJRdm43dWpobDM0TDZ2WTRMRGlWMjdqcHdWTEp3?=
 =?utf-8?B?VWZlQnlHck5iQnZ6M2JCZXR3aFM3Z0Q2c2pBd250cGJ0bVNXdUF6bG0xa1pD?=
 =?utf-8?B?bHNva1NaR2lKNUZ2RUdOdFhhbDlEbGJySWNGSjNySkNjaUh3MThYVnNVT3ZG?=
 =?utf-8?B?Y2FNUHl1MFVSWGc1YWs3WjZiUFBGZnRLelFGSDVYVTcvbVFTTU4ybG5obnJK?=
 =?utf-8?B?Z1ByemoyVlMyVnZhdGpLT0t5MC9aT0xaWVVPL3ZiZzByVzR0Vng5MTc3Zmk5?=
 =?utf-8?B?dGRjS3Q2REZvSVRJUTJ4TzlsVkJQQ3RkdWtHWFRSYW1Jd2s5RHY4QXB3NHFn?=
 =?utf-8?B?UUJVRG4rYjFHZkZCd3MvMHowTkhRUDJmV2JoM09idXVqNFFIYnB3L0VpTkpC?=
 =?utf-8?B?WGhnSmZsNWQrcTN6dVNyb0NoVFlwVVE0T3AxaFJsaGpwQklUWXUrdWxUZFdr?=
 =?utf-8?B?aWY0RndZdDJtbGE0Qk9jYXRLRFpqd0RBZ09EZ3FkNnhPNTA0NFBoRGZnVSs2?=
 =?utf-8?B?WVJiTkRCL0hPZHZ3dmRwT0NQR3J6SVhiRXhleDFtV0RzUURhSTRyWkUzWTV4?=
 =?utf-8?B?N1VDalRkVFdUYnA3aW9qLzk3dFFhclhLcVpPeVIxK1BPcDRFOGJGWFVmakJJ?=
 =?utf-8?B?R29Oa1owMGJTZjBheFF5RGVlV2J6MnptSUZkLzV5VlprSHZLYVN4bGk3b3Q1?=
 =?utf-8?B?bWxFSjFLRjl1ZWcwKzYydG02cVVmOHYzUmNHVGt6RUl0Tm9IRktTSng1YXFq?=
 =?utf-8?B?Z2RYRzVFdnBFeW5IN0p3REZ5NmV4QVZvcDJ2YXk5WHhhZitwV1dqUHc2TFUx?=
 =?utf-8?B?dnlwLzhGeUZvYXJMcTF5WlZJZ3BoQllDbUIwUGh2U2I2SCtza0p4eG45dDE3?=
 =?utf-8?B?eUF6MmxrSXV3WUF5VUJxTi9PdDRtQ1BaSmttR3pDSmo2VWZzdW1tZ1ovbVdL?=
 =?utf-8?B?Slk4OFhsdXQ3Zk9DM3JCN3NOME9LMXFYK3FIaG1BYzZlanJ3SkFHUzVwYkxD?=
 =?utf-8?B?WlRIbm9WR2pJL3dxcmV1cnBWTTgwdDQ2ZndONFVSVWQwdy9INFZBd0cxVmFB?=
 =?utf-8?B?K0VVdnNnRVVVV0RjbTY2aXRaSGJ1TnRFbFMyWEZvTTNxT0Z3Vm1pTkhONW04?=
 =?utf-8?B?SVpWUnIwanBpQ1dxTVVzYzk3U0FxZnp2cGhnL0NheStPa3B3b3ByQW1sVFFR?=
 =?utf-8?B?bGpaeU1IanEwRjJNZC92bHc2RnB1aStlZ21mWFZ6YlJxdHZWbklGVUg1UXFD?=
 =?utf-8?B?ZVVyZmp2MmtvZnRGL1B3d1FXamZ6eThDK1NLOUxWNzc1SGNScERwaktuTWM1?=
 =?utf-8?B?MkliUzZ4ODBTQjkxMEFzdFB3MDA2QzRnTHpTRCtlRDZwUTJaZGFlbWNTbCtD?=
 =?utf-8?B?VTNVZHowUUtkU200S096OE9hcEtuOERIR2VKcVZGSWI4b0M3Sm5OdjhFQVpQ?=
 =?utf-8?B?Q05FRUV1Y2xGcTFLbGVJam5QRVNwR2g2a0RrYUQ0U25ESm1tYjdoVkoxYWZi?=
 =?utf-8?B?NFVaU3N4Y3FIYjdDS09rbVlVdUlWQnk5Sm9hdnJscEplTXp4K0RUTTJEZUEv?=
 =?utf-8?Q?x9I5FWhfBAj+fIygRRVHnpqli0hyU6djEOzzU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4d061c-a932-4b44-6fd7-08df08e21dec
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:05:37.0191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnaO/O4QM1wFV9MPqMaYaO6/jE8AAWX0k/kqe4J6WDDgn4GTdOUZELPIT/hhKcMErqduD0Ao7EcYxuwvuKiHVaKXrX9I/v+BgfZKZ33VvvkI7J1rLztcHaqn84GfcwE+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131

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

