Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3176A43DA4C;
	Fri,  4 Sep 2026 09:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513730; cv=fail; b=iQ+OKPRk2l9lLv0M4g6dH6LoaOrxSPtKgly4XbgjTPyvc8QuQyDKPzzY9hpsjveK9Yd/NZVqM66zoFV+4elQqZyr+Rq/VYRphVLDmUyuwnipbXy+Myn8P1tWVilpL/6Gf2ggUvWX7fqDqa4ps4t92ehfRoFbjwDZMHqJDLIDybg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513730; c=relaxed/simple;
	bh=44juJycKpExTKmMKaJkSXoNm7DL4Wl19vWOXjpeynHQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SVGMaG11fVxc37+nHStBW7N++hPe+BVO8dCklJSnrw+6OHdsUXtcuNtnScIKrtyd+0wpOSGjf5qLxwRLl+zsivREd6kb7FTVPwEJyzAPxaSHi8UDhAK3lUt3KwmHaLYHBpxBJ4oS1oJkbJQcshe/V2nfycH7QD4Q0+/hZNoSjT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pCwJtOyN; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pCwJtOyN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtl1upFVKv8uSo0l3kRdT/nUpJXHtcKpWKJPRYmYYztT9sqZF9zlec/Z1pjATZPE5F6R7g1XSGMbL+hd1ZccIX7/XyNGwXT0mCXEqi+YQFk5WF34Vg6pXARqpQwOjOWpj2VegA1HRMz8QPeST1BSNsy7/3lJwGh1A468YVMhR1fUNhUFBbLPfrNHPugMEVkk4G6s/26a34OxOJVU4pZZHbSHu5Fgn7N2YkB+h2I8cCGXQ9+G9s+vhVCaVZLn4Q4ezgMaVh6SaRCfwcawVvxzCobGwL1BCAgq6iKusbT7gKMtkDPyI71H1PxxHndh1JQdWlAw5XVM2Rbf2QZy+ujeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoZmEjGtryQX5nYAgY6sPVSMkbE3tZq9pVCmTMjQh9c=;
 b=a2BHmYN5itnl8gxMn6eZYM+bvOiS/KjeTYiF9aaBwxCZf6C3SkzwoBlZ0oaxPpWYmbeHSwIBDYqGtd2FbBzuHZeesMoYqJiL+WgrApvUgeiy3WDv6q0Jx7rAC7PfTyLbmq+36Ty+kRWssxQBxXdngU8m8PDlkUqZntG+WHaeRwisJB+dlXrPebCFGeTRUSB/7iSFndw62TaIctMvjSgb8Vt49O9sq2knrPWI25I3CFWZZaoKMJSYXLQvYGeHPaRcTHsJ7Zd8gKvbZp6t7PgbFqKloveeVTEiZ7HDl15H8iLT2LWtwOT4AlC799nGnkHoKCqk+bRTrxRJjvvjyUY2Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoZmEjGtryQX5nYAgY6sPVSMkbE3tZq9pVCmTMjQh9c=;
 b=pCwJtOyN7uwCxFj0/5S0JV5aBOYM0WCwJ+LOY5QB8Yk76IIhyP0qeGZ8QAvkju1IZp+GL2O72TPSuq4B1rVLHqeU1h+07eBw7tE/wExPXK6FSwSVgELtOOOj8ttpC7ch1WxsBwyPvWAaWSaP/yMWjPxr8dUvEk2sPIOuHmjjyf+I37m3typ9Djvv+VoFx8TSXwfScpgoklwgKX0HJObU2CyOKmBsFJ8B26YXOI4L/NjINA+31vjv2cAjrXRpDgSDcwEStNFtgt2aDwyj61ScODhfohZ7ALLIKW/ye0KJFKXBYaqJsya6PS/OZqKA292Noipw54Fb9UOrWuCBoKvDUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 09:21:47 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:21:47 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 04 Sep 2026 20:21:22 +0530
Subject: [PATCH v48 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-imx-se-if-v48-4-dad90eec7eaf@nxp.com>
References: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
In-Reply-To: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788533484; l=17905;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=VoZ9oTdPA1o680US0D9ZLzfJ/uGm15XUx2Un3dW8e8U=;
 b=cWnnVppyB/Jdjd5UQ3fsOh5rkyAp5Nc2UIZPlcO1naf2HF7P6ehBTtCAE1vI4fyCHFclGyGRW
 n6QKrLdU9lvCOM73SjQkFB+ABOAD8HjbIwoLVsyHgO73jAhcUoGpJxP
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5P287CA0226.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::11) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: d9590d9a-611b-4d78-d2c6-08df0a65f17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|19092799006|6133799003|18002099003|22082099003|56012099006|10067099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	YtISv4soZypW6JxGKsnU/7iayTrLKvnQvkGVuIsEobO7CY+3SY0yCiM3KKjdha0rQjj0DE4b9SOXxOrolfPrv+V1ctx/FWAYUcM8A486wmiQ0BbKk1znfTahutqLGraALK7VV+wT+hBI+8MIEEEBCzw816f7ueySV15FfQSLXWIv5dyEvlSlDV1PIXhCweu/4Zqnh80Mt05jLJ7ShN3PzfjLO+BpCF8K3CYWv825L+JwZMrc/7GsUwOIbfrfPgoF3fKa6uKIS3yoCc4cjmualwP2TrjDhwy7wbGSL7xrgtbk8LNbdsDPLL1YylAynggvVARzMjnzU3nn728LlgdGBVUYTtFYj3YKoFm6Sen3njOrAUP/txyabkZk8ivA2g9bdUM1EgoXdmJsjnu79OXSU8Yx8KAObls56g3hH6t7p7Yd6jvh+LNo1foGOpfCmi0oQdiLjKqZyOB0393aqVt4HvPyGgcC90ZAtm1zh/zF+t2oApZ5PdZbVMNsP9n+2AHL5Re6sjIVxuh1aP0y+dsIUrPtVeHBlaa86WjP+Cvs0yVVK9PGR+uDG4WowhqkBOn91VzvhBhPsEmQXX9hqJ0621OgFavMBiGTyBrdN08lInJRfocYFUQ5g4IZjDSIfmmd1skxqC0dG0d8ba1GzWv4nryG6NZ9hBvNnLxhbDv+tSgQYoN38tvyvpOhrgUMJAwkprNXxg/iJGaegrcsU6/iKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(19092799006)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aThYYVlCa0ZPVHpPdFVmS1pMOXlYYkNJSkRrcGlINDNMOC9NM2YweHU1OXNs?=
 =?utf-8?B?Vis3ZkcvNUljSm5yelhxM05SN0lrTGRsUVpSazRLTUxsV09sTzdXWXdvQWlR?=
 =?utf-8?B?L1d3MDNHUHlhRVdtRmwwNXUwV2JhajN2cDlIR0dSUUV0ZHdIaTFHTlZmS1FZ?=
 =?utf-8?B?bGVLbmxhWkV6TThRRW5mVUJpcmdQcE04UHUxQTJOOTJFRjZYaHVIVWRFRWtI?=
 =?utf-8?B?MlZQZFpqRENINkIyc0xJYks2RUFqVTNrUXY1cWtQcGFrbndxdTBwdnB0cTdM?=
 =?utf-8?B?ZmhUcHhzcHVpM3dZQ293dDNzZVdab0k2OElzdlBOWHdaais4U0p0UHptQXg0?=
 =?utf-8?B?ckhBVkN2RWkyZkF2MGNjK0I0LzdLaHdNbjFMbnZXU3V1eWUrS1JQclVLTlJn?=
 =?utf-8?B?Z3pJNEdIUG41TjBLR2pPbHBvMXJ1aW1nV3FxVHkxL0Zpc1puSmJyM09KYmZx?=
 =?utf-8?B?OExOYS8vOUtHdWpoTnJJQUc4aW5ETW9GenIrV25tKys0RDBneUdwRzBwT0Jr?=
 =?utf-8?B?R1RMSTg1dUJ0QmhyN2xlWTBaWG5YMVRweXo5TFZSYU94S1lUZmtkdUx6SGs5?=
 =?utf-8?B?ZWtQNWF0ZnpsVFJYZ2VKL09WNDltTXhvblBXSll4emdhTlFhUkpsc25VUmhE?=
 =?utf-8?B?cDlMK1NtUXAyRVlXOGs4Y2xLa3RvM1V4K1B1Tk9rY0tQMkFaMlJHd0ZUTGhJ?=
 =?utf-8?B?Z1d5TGV6dzBNMUp3R09DdmQyclU0UVNXVzFpVnV1akxnRytBeXlBaWxrR2ZM?=
 =?utf-8?B?Y096d1pUQ1BTV3k4L1RoTUxuekU2R0FyeTE0TDIwK1FheEJKYkt1YmsxN3B4?=
 =?utf-8?B?eDRpNTZTNmFtMVhzS3d3TENJOHZORG5UeFg3UmJZSERHdlBKdnJYTnNpY1ZU?=
 =?utf-8?B?WC9aZGJxSVVmSkhMeDJ1Vk01VDVlYWhFT3dGRkt5RWhWK05XeE5lVGZaR2tW?=
 =?utf-8?B?TWRZWW9tM0ptMC82ZTVJZ1JVS2JUekZNT1ZMQU8wTmUwQ2VDRnFwSDNoOTV3?=
 =?utf-8?B?dkcyZ0gxeVhvckR4ZlE1TGJDdUxucGpLMklvSlJvNXNvSXJkKzdiQjl4bm83?=
 =?utf-8?B?aGRZYXlSRERFd3NXcUpzaVI0VitLTTY2bVRQTCtEYjJsNEZSNXQ1L1lDTkJ2?=
 =?utf-8?B?UHZnU3NrRDJiZy9wTjhDYVR5RGZscTRGVENVREJHZlJyc1pmeHhYeXF6QTZm?=
 =?utf-8?B?OWpPbjZHTWFpdHdCdGpoSzBHRXB6UkdESWJsQlRxL0JjNVl5cTVmNGlpYU5M?=
 =?utf-8?B?Z3pZa2hXZ0I2Mkxacm5ZK3NtRXh4a0NHVTBlRExEb2I5cVdMSncva3QzdnhD?=
 =?utf-8?B?bmZvWTRGZWtsSWd1bU9nNXA4SVpoRyt1N3FwVGJNa0p1ZVZqb2I5a1V2YkRU?=
 =?utf-8?B?YnJodWFlMTlML243a0xLODVRLy8vUEFvY3NMS083Q2lJc2p4czA0K3Y4MExV?=
 =?utf-8?B?ZFRvMG9IZmxKNHBvUDJ6WDdSc1ZSb3d5cEJJbWpsdmprb2txWlo5SS8zYUNr?=
 =?utf-8?B?MFZDZnRjZWYxTHF0ekxCbzljNUNoVVBKd0Q0RFlYcmVyWlBRNlZNMXljNnRj?=
 =?utf-8?B?a09HQmRuK090MGtOd3lHWExmYnpuTWxmWk42RmVzU2FWdUFyalk4ZnBWdGhK?=
 =?utf-8?B?bUxMdG1pWkRmRHhEcmNGdi9uUm9aWEJrOHJYR2hZV2xyV2lYR21LNjkwS1l1?=
 =?utf-8?B?dG41QWNZTzJCaUY5ZmlTcU92ZG92Y0R2bG8zWnRYOWdsNktsbTFEeUo5eklV?=
 =?utf-8?B?MUkvb1liNUZ6OWZKWHREa3JLUUZwaHhWZTVLM056ZnBZaXhVUzNGWjFrMkpR?=
 =?utf-8?B?aG83aVRPZGxNbDFCcE5aREFLd0hNYmpINHlGLzBuNXNJa2ViaWY1S2xJQTZJ?=
 =?utf-8?B?S0tHNmZtSllJRnlmTVNVdFBRZDUzazlkVFMrUjNDUXpDOVNrWS91RExvUlV0?=
 =?utf-8?B?NHlwMGVDd0xzbzIxMllmdmpEdkJmUW1xcFdBS0FyWk1WNmEzaHBNcFdPU1lh?=
 =?utf-8?B?UFE1RVRXdHkzRzFlOUdWOWVUbUc5bzQ2d3F0NEFob3ZTdFJCN1lpRGU0aVBy?=
 =?utf-8?B?WjdtbWJGNTVrWTZPZGpHR0pGVzVncmMyN0U5T0lzREZLYXdKME84OWpWNkkv?=
 =?utf-8?B?VWZjWHRXRi9GSWM2Q0dkUHRhbm82bkdBMVNtZXhqb2UvTXFzT203NUFZZEVV?=
 =?utf-8?B?QlZ6SjFRcVRaOGJvcnNDTjI0VEd1Rnl4dmFPWTlMd3F4NmZiZzM4ZjM1TkVV?=
 =?utf-8?B?ZnpDUkxXT2xIR1E3NGpsR0YwSVRtUWhsVGxJVis2TlJ2NjdRNDFZVFNpcGp2?=
 =?utf-8?B?MmxFbGp5NFNpT3J4MWg2SmRXcnBxQ1ZwMmVOY3Z0NVZaY2ZnZ2dnaGZOaFZV?=
 =?utf-8?Q?UsufahRBfr2gsmBmhf+E9Iq9MtxPaBKylOQ86?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9590d9a-611b-4d78-d2c6-08df0a65f17d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:21:47.0825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1m6B0cU0YVTz/feypta0l4LVPLPQqnQr69II283LgW7IkKvYTPSa/uX2iBxhTPalCZwtHCK5yPEwlO+u8c00gQDIEHlMtzp8WruYVSNWXZQgrHR1PPDbMEeKVP6i5hp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

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
index 10be46b52896..51e6b52da7f9 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -89,14 +89,15 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
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
@@ -151,12 +152,12 @@ int ele_ping(struct se_if_priv *priv)
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
 
@@ -218,12 +219,12 @@ int ele_service_swap(struct se_if_priv *priv,
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
@@ -275,12 +276,12 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
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
 
@@ -324,12 +325,12 @@ int ele_debug_dump(struct se_if_priv *priv)
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

