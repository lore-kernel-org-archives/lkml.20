Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793686901;
	b=mUb5eN7/Ne9PqQdfT8N23EsQcwKxYD/4Z93HrfHzMvrB97dVKQNzTmuKOrjH6pmgsTcO
	 fBjuZj04HHMnSYbiltpIb6Pib49wDpzX+EmCbg1xTAjMEDxhxgB54TQGhdfZuszfpoaAU
	 UcBPtb8Tkq9928lUwCK5Kqxw5qTaitZ6tT760KyCAlrYBZjJenQuBnM/v1nL+lmcNLiSN
	 GD0CBHoyA7lvWAOSkRC1qsSwxJbq512PO4oXBZOZ8MDpbO+wG+4wBgaVBjp6nAz2m0E5i
	 DwyZ7plbtPoF39ezdZI4ifRRrGnQjPCU5KLorJyvlSYPL+E3dIf7OkLakRqpdmO+3iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686901;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=4Ht9nvrRP7MJmmvEf9IaM1WvMEL9gyNrapNdmCfL3Fk=;
	b=fVEnh4POTozhcuTd62qSQGqKK9F5qDYVi39jJT8JW2ExJa2FOoj6wwMtO2CLcMcM5gat
	 2F8Iwk+3mhdygdIaaGUtpUrquJTfGIquCQsaAE/PVPO0mUosK4dPxigIM8yn5s4KWNM/Z
	 jBW8oNvwaC5PIFfn2DlCjvMskiMos2K26OnokNKcYLSGMJNIIWmbc38dy0hzLhGPWQFWl
	 pN0NTl7fSkqCftc3eown6/DBU6FZW3WPrqjx/UIllhChySTc5jVtCOVRSmGsKrW9GblXB
	 lZScIb+7qKDXMSsSuG199d7i6FmbZNZ99nprDtlSoqWHdYtr6bYzDW9tBRMnU9xMDfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VRq99vDO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.18
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97B0606A324;
	Tue,  3 Nov 2026 06:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97B0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VRq99vDO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amDv4xP6JRXETtY9jGzVs23f9XmbOdzuXKAjQoxyOyDG5ozMxVWNQUc2HpcB3u68UOqX+hWwjkWugxGO273UcK6oCmaE+4iBrgRXClyRQ8mGkhK4Yj4ri/olqZibeoPDPKbO+5HRn6Id5VWojCbPsh4C6tlxYRHFllxT2RuYQNNGCeS1UjZ/kvjlnLLUiZRgPl3jYO0FFP59hbKEh+OusIC6X5RFcUPWP4dQzTUtTRXfdJx0UQiHhJO9CYAQCEAPu8DysSmjZyv3703+57zTyi+3zxC4xvksSWaufmeZpePPzcaFI+ijW2oc7EfUCv7u5SrzyJNIiFz+3w8g5q/PXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ht9nvrRP7MJmmvEf9IaM1WvMEL9gyNrapNdmCfL3Fk=;
 b=T/u9PC4KQVD5WT6YUkooJIQW2LRLwokVou6FgdY3vk/3NT7sqxwV5Bucieom8GBrLgIZ+jSi3XEWT/krL4/u2vVfAWRKSzjHMghWnTlO76N/nJqauY4Ayh/AswrvN7b6vGassOsnEfXf1qAHQt86F9Ni8zbhzOpN+Wrp2q0UyxU9Oyu5ZrRuGQPkpxeUWRe1OTaDDhQ8GaZt607K0MzbPgA5+dnUvncGcMwTeSXPrXD7B4BtqxZ0JKlGlh0D26v0B1bToio8P/TnngXpspYTMFNLr22+Ds1tixFSzoeDDFrGXN5cUz7pFuQOvsIYnXwBR8yBLtUQmkkKB+VXMNwfhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ht9nvrRP7MJmmvEf9IaM1WvMEL9gyNrapNdmCfL3Fk=;
 b=VRq99vDOSCQIbtBOuu3/QK1fh+M2XZWb65jhhhfhaPfb9yp8BzK1/t+q7eqe2W+pLzRwDeRMu+NCn95y6MhYoq+AFn/VXk2fmFl+EnrudNrTjRRzCkZOoVjbfiKv7g52nKTxybKcpRkeIk1n/XarN81mta9KXDIM/n0r31xAT+gqzKiinArg9uXOzLbNXyNUQ7XThRrj0blwzz64Kw29K2ZuAx5f/RJdWMc/ut+efN0+AQivJEwhOvwr0lSdfR6IBjXjBqPe+QRpvjL7LTAbEA5EuukcnAG+59evnZKxP/dA1ykJKLgzu/aec2f00ZMhJFChWrqXy8QPSJpwMYl9bw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by PR3PR04MB7353.eurprd04.prod.outlook.com (2603:10a6:102:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 06:21:38 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:21:38 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 03 Nov 2026 14:22:08 +0800
Subject: [PATCH v9 12/16] drm/imx: dc-lb: Support getting secondary input
 selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-imx8-dc-prefetch-v9-12-3b985e7636e2@nxp.com>
References: <20261103-imx8-dc-prefetch-v9-0-3b985e7636e2@nxp.com>
In-Reply-To: <20261103-imx8-dc-prefetch-v9-0-3b985e7636e2@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To MI9PR04MB350878.eurprd04.prod.outlook.com
 (2603:10a6:290:c0::7)
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|PR3PR04MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d579a3-22a7-4c41-76e2-08df3972b7a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|7416014|376014|1800799024|10067099003|22082099003|261102123227099003|18002099003|921020|56012099006|11063799006|261022105027099003|261021121427099003|261009223027099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	uJOowKYMO472dEhRDT+QDCS4zRVOYuZ0aB5CwtuK4o0ysi3T9ExRnomyj+UOtiXqCcqG/oH3Zh6IwsgmHZ195tgUSbnItNAp4K9Oxwao2fALu7jTOJxe9ZXyIWKaZZoh/Ntxw9YtCDxQ4g3uI9bgT9/3k0THTnowFWZa5IqvqBMWBmpwzedwJi0JDfRbgaDeahPPwULQEeD0Y7bIjufMKlTiaEC5rNiZLzoe+1ZlF9Y51OyHxbkqt7pwxWOvbvHU2X0271VRKRSkFLyImZ6HARP4Oj1pt0/L8XeRh0sQ8wcPvRSytcd3tjIflpg8CMmjKt7Ph7tedx3lpPmEqBR2kQVexMgnHInY58B54qW0trm7CeIGIz++6ZJ6z/ru/64ku9lxDN501SgWYD5zCyUa8t+mK0IcwC4rxWEnL0niavbp7Z35Bb5H0ii/s9K8T31z43tUMVm06iAOtlFRP9+QwKXPr4mU/TmJzo18vKXxxd1yh6WO/obLqXLTAlVTd/IIBiWW96O/myH0kyuTGf6DjjH6N2Cjd5RglZObZa8U1PdRZ3JbUnmIOPRiyIDMvrSWSZ15CbvhoGjc0llM2M+JoIk/a7MRFI8ca06KH/vYV9k2kN8y6J3DQI7D5NEeYeac/gqllrlZVJ8PH0QRdN5OcHOMHAeW8+/CN23guAPttudqNZ91xw5EzYcG22cQ4vChBNJaOsAfHMMObaov99H1GA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(7416014)(376014)(1800799024)(10067099003)(22082099003)(261102123227099003)(18002099003)(921020)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261009223027099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vzd0VTdLYmJqSmFJOG16aFlGZXZkSkdDMjBZREVoZmNZR2pGZ094YnVMTFVt?=
 =?utf-8?B?MmtxWlhqQWJ0dXFneEdYWVF4ZVNPTHlEMk1ueklCTmt4anBMS3M5a2NiV2Rl?=
 =?utf-8?B?ZER2Y1dlMU5NQjN6SEpaYm5YTzNwOTZIZmRaVlFLZXcyeVkvbExwbk9zaE5S?=
 =?utf-8?B?MTJuc0NsNCtFeFRUQThNRkVkWVJYN2hpWGxnV2NzclgvT24vUmVRRTNXb2xw?=
 =?utf-8?B?TVpSTWF3WjlzRldyY3MzMmN3b3hVZ3kzd01NcEZBUHFJSTRMY1BQUkpQcGRh?=
 =?utf-8?B?NFZKSGNiUThUbnloNW5HMklUZGhzVjFodjhtSTMrSkdsNCtYS202a25EWTY1?=
 =?utf-8?B?bzFGUXF0NlRSazdGTkJ0QUFVQlRvMjBKdFF0ZFA1WFFMN1BDcnFrWmRIYk5O?=
 =?utf-8?B?OE9OYmRTelF4S2hZTDZvb3VTcHo1MzAzME0xekd2bXR0MjRnVzFuOTh2M0pW?=
 =?utf-8?B?SUN3K3NNeHd3RXdVWVFjaVp0WjUxTm9tc2w0ZnFIZjA0S3dxOGlzSEREM0xZ?=
 =?utf-8?B?enpwMVJDd2J0VlVxbUplWXNHNUlsTVd4Vnhod1hFMFlZR0c1cTVTZkNqdzJO?=
 =?utf-8?B?bWR5TmlaU0tjZHBTYWhIT3lDSEdhb3FTaXltTFh4UytTY2g2V2k4RDlaWTRW?=
 =?utf-8?B?UzFOa0Q1dHlZK0NOVGFMK21EUk1xQjBaSnIzQXRsREdKb1gzT0lxUnhsdjlN?=
 =?utf-8?B?OHJrZGRlVElvSjY5cGtMVkZyWC9HV0k4azVEY2hQWm5CMmNIWTdjdWRqdkk0?=
 =?utf-8?B?UHo0aVBKOVdGT0x4NTU2bTlseUQ2U1RhUlpFYWpZdG1MM1dMOHJLc3oxNWp2?=
 =?utf-8?B?QjFSaVJsMzJIK0FEZ1UrU2ZraUxkTjJKQVlmazRZN2kzczlJZEVCWGgwYWZG?=
 =?utf-8?B?V3dGZ2dRT2dtNTRleTR3SHFObmpjOHN0TjhkVENOaVpJd2tWZW5uc25lMWlt?=
 =?utf-8?B?UXdDOWNTZFY4cW1VUzMySEVvK1B3ekJFUzgzM2REeHZNREN3WXlwdmNMRFAy?=
 =?utf-8?B?WUxjTkloRE5IZkgxcHFTalIwaGUzVkxXZnRFRjNjbG5wTVJhekpLMXV3WWFi?=
 =?utf-8?B?ZGRPZ2g4aXcvVnNjZGE3U3JjWHQ4cE9lclhTV3pESUFMYlh0ZlJlRW12a29K?=
 =?utf-8?B?TXNUY0FEejFjVFdBN0ZhTFh2YzJNV3dtUFl3bkZrSXBrUW5Lc09TWjV5dFlj?=
 =?utf-8?B?L1pTSnhDeEdBbFAxdTl3VExsMnI5UWJuWGJJMm02OFhXR1hmRGFJQnc5V2dP?=
 =?utf-8?B?K0I3S3hBak9ENEI5QlNPandkd2dmMVJPVTVXck9MeTlvQjZlVGptaDJFbnVY?=
 =?utf-8?B?Qlp5NFVBZXBad0h1bEZRMTNwWWR6VVlNeWU0eFFiSGN1MEJhL2U2MHNGTDFI?=
 =?utf-8?B?b1NPK3N0SWlMNStzVGZMUWpkRDZCbTRRVFRRaTVaV1lwSjZiZ2xqQ0xZUi9q?=
 =?utf-8?B?U3lWUDJCWnRMTTJwZmVyakh4TmdBUU1GMjhhdkZVQ0V6K0FHRkRPc053T2px?=
 =?utf-8?B?OTF5TS95V0drbGpFSVB2Y3BEK25DRGFDMS9sQUtjbmFveXNMZHhDbzUzMnFH?=
 =?utf-8?B?cnk1d0orcmZyZ2Rac1JxYTE1Ukpqbk40b0E3UmV1L2Jna3F2OXczbUJmaHhu?=
 =?utf-8?B?anZ3RXJkb3p2Q1VnZ3RERlRGaEFqeVVPTlNuOWhjRHRyMmkyV00rMU1MN3lB?=
 =?utf-8?B?cU5xenBJdzFCKzUxN0VoOG5DMkJjWTFUYkxUYk5LbGhRODBwZ2ZhbmNZVGk4?=
 =?utf-8?B?TWRtYmpIU3ZNcnhQd3dyU2dvMlhMdjBndmtiZlU4ZzRaMXpTaW8vMk1RUGFL?=
 =?utf-8?B?aU9LQnJ0ZEZ4dG82UmxNTUFHZ28wSHV5bFA1czE0c0hobDBVRjFoWUMrRVZ1?=
 =?utf-8?B?dkxrZ25XNklHczJjcGFPZlR1Q2ZndHNadjVQaGF5NUgwcmR6eDQzZlVuTUQ1?=
 =?utf-8?B?YzkxT3dXYTV2K21mMTQ0QWJKa1lMVVR1clhiRVFtVlpqZTJuOUdPV3IySjNG?=
 =?utf-8?B?Rk1tQiszNUdLYXFuQmlRRHQyZEdNNys3UFJqNXlRcXg1VzFROTFFVVY1bDBJ?=
 =?utf-8?B?Qzd4Umg4alJsSTcvUjlZb2lnOTJhUWZHdzEzOVpxOVoxRlBDY0NJRW14N0Ur?=
 =?utf-8?B?L0dUUVZhSFZiRTNiNVpvKzJ6aGZnRkxjK2dhWDlJeUk2OXJPb3RNSVZBSk04?=
 =?utf-8?B?Zy84TE9YN3hKbFEvR0ViQktSZXVscU5yU0hGNFJPcUV1ZXQrSE1OUVA4ald0?=
 =?utf-8?B?YTRNMDF1bkxVUkszY1F3QkdkdkJlQW5QWlMwTDl4U0d6VGFjMVJQT0JJS2JI?=
 =?utf-8?B?SjIwbFVZOFVGZmppQjZiVXVPOG9MajZmaU5JdHRONHN6aGFGY3BSdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d579a3-22a7-4c41-76e2-08df3972b7a9
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:21:38.0862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMe5DplejVZ/aMl6QKfQc2MxWGdvLJIm/iMgkf+RQsfHe5f4bnyYbL1HXEediMr91k5LH8q86PaD0vq1phQ8MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7353

Add a helper to get LayerBlend secondary input selection.  This is
needed by disabling CRTC at boot in an upcoming commit which tries
to get the selection.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8:
- Fix dc_lb_pec_dynamic_sec_sel_get()'s return value when regmap_read() fails.
- Iterate over sec_sels[] to find the secondary input selection.

v7:
- Collect Maxime's A-b tag.
- Check regmap_read()'s return value.

v4:
- Rebase onto the latest drm-misc-next and resolve conflict.

v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index cb614f3c2f69..924a0de4b909 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -19,6 +19,8 @@
 #define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
 #define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
 		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_GET(x)	\
+		FIELD_GET(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
 #define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
 #define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
 		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
@@ -181,6 +183,29 @@ void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
 	dev_warn(lb->dev, "invalid secondary input selection:%d\n", sec);
 }
 
+int dc_lb_pec_dynamic_sec_sel_get(struct dc_lb *lb, enum dc_link_id *sec)
+{
+	u32 val;
+	int ret;
+	int i;
+
+	ret = regmap_read(lb->reg_pec, PIXENGCFG_DYNAMIC, &val);
+	if (ret)
+		return ret;
+
+	val = PIXENGCFG_DYNAMIC_SEC_SEL_GET(val);
+
+	for (i = 0; i < ARRAY_SIZE(sec_sels); i++) {
+		if (sec_sels[i] == val) {
+			dev_dbg(lb->dev, "get secondary input selection: 0x%02x\n", val);
+			*sec = val;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken)
 {
 	regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC, CLKEN_MASK,
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index 0b81dc6b251c..4e38aead69bc 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -93,6 +93,7 @@ void dc_ed_init(struct dc_ed *ed);
 enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb);
 void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim);
 void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec);
+int dc_lb_pec_dynamic_sec_sel_get(struct dc_lb *lb, enum dc_link_id *sec);
 void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken);
 void dc_lb_mode(struct dc_lb *lb, enum dc_lb_mode mode);
 void dc_lb_position(struct dc_lb *lb, int x, int y);

-- 
2.43.0

