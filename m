Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F1C51AEC7;
	Wed, 30 Sep 2026 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777740; cv=fail; b=cwAaII6QF+csYMXdmMThd1rckf3GqW7XrcVBcHsTS8q/BJbhJviTV7/wbq0b7kiujYTZHeMVBN6kis5GtaEgFas8dKDMdHRceaaHH1Nn/9OaZeQi7nTSZnhVblUgNp4zX0KUPgGuHY636uSom5b5+rmf2MRV8Xns3bnrlp6wXlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777740; c=relaxed/simple;
	bh=wILOxUTZPPKww9iw3D6wSrWiXMqBPbQf6FiNRwYQzBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qc9JgH4UArRXrpYPGHv0ZEdwTWTJHjv6WNfO3i50CZCvRA2IsAT8A9aRFbY7KTJ5n3od++Ypbw6YqO7lSKUIAwQ4AgzA0qirfdimq4lto2NhYY5yEO7ZLAMC9eDBxIqKFQlkePOrRKgvVDVwg5zUhneTUs3I33hUTKpts4XVQgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gOA1P6f9; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gOA1P6f9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtGP6EWK9D5IGkK/4B93v/BTZqgMDJuQZWgEkjYPUwXXe08AF4LlYmByKKLYJR08peIvHX0fPeRiEjBuxlPRI+hZixvVCtZxCIXn9a0ofcSmtQKONQhf63CFtYDf3M5dasIJF1gsfeqmtZhlnI7LMR9/RuAgSrgdLd8ua/ezuxvlQZOFz0jRwlQqaTags7uU0vpwM2t13e9YyzEMC1w8GFEoQk/wMnabA+bqZDhohzziGq5bLscdzuVREal+w1sCIDKBdJrQbuE66KY6wZfekcrq3wH9FWM03hBBMn8HXZX1kjYAMeW7o932FkoivQwVwJsh9dx2xIvbwoh/tJD6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wy61ah+UjtvAvUHmaH0Sa87y1xDztN1VNUhi1UjxiW0=;
 b=u1dNzSEgtPn8eJIqNG/vTK4YemPA+8rL+rSBgL6svaMz5RyhmX+cI46c5njzbJ+hMcEh9rHkxZxQHhYH4lujPPv7+7EEIFQi8WsVU2VuhhyFs3XLEAhM8SBmDDW9iXDMT23P6qtUaPbHOtjZu6IbSIDKH3z8loKvti6QdlYBkoSjNTDyC6aKQotrMUjCkbT/MSZyXaimAWskR45dKLJFtUEDIeaaKy+uMt2qBmvhsONsgD6ssTWR4xsrEzZYjwlagHUP9viaZKhomKfzTFkGUFfrRLS1IoWalUOox3nkx6A2kiTBBYHwiimad7e7n5AkQOBmIVqpKY32NodD7vYXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wy61ah+UjtvAvUHmaH0Sa87y1xDztN1VNUhi1UjxiW0=;
 b=gOA1P6f9K27VJHhZMqUgEvPinviNZPusxMaZ4BENPZbL6xbloh5qPObc62uwkpmWX0VI8YcoO1tiXeQ/Rr9clxT8Kvzvf4nd6PIBWPl4g3SJ8b5ngxb0pxwDfaMY/JvUM+mTvfi3VuYNUKOKl00sYBFkbZNnt0KjUZI0NWj/QvhIIWcMliWAY5UH9/iC1Xn5TJPYBYC44YPW8K8bHSP174QI9RxEjCVwdgT7l8mfaX0fnYY+Xe2qzJhds4ZBld6wvwSDUtnIO7ecAbGDcwq/6PP2D1tH2CcsNejNfvv1uG6psh6M4X0GtU78cUIagmaBOhjJI5ZAz3QrUFs5Blb/Gg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10660.eurprd04.prod.outlook.com (2603:10a6:150:221::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 14:15:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 14:15:27 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vincent Jardin <vjardin@free.fr>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: lx2160a: set #pinctrl-cells on the pinmux node
Date: Wed, 30 Sep 2026 10:15:19 -0400
Message-ID: <179077770479.503530.16353886299339547562.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928-for-upstream-lx2160a-pinctrl-cells-v2-1-1227b2e897d3@free.fr>
References: <20260928-for-upstream-lx2160a-pinctrl-cells-v2-1-1227b2e897d3@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10660:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fef916b-4e6b-412d-e84d-08df1efd46ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|7416014|10067099003|56012099006|11063799006|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	0vD9xoQPtnCVRCV3YdTw8JL3h8tcVIa46Est7TLHBe+2Wv3pR2TelAU6EMgUWQqmkFd4KYV0EBvLi4urXNq1BEaQctzMu0xXRV5gR9WYosEIZq9FPnyCO/gDZZaKJsHZTpM+dO+IQqZajqm+JreC7pqxZEFjdrKbSN0BwXq+zBSiPrdfjduTd4VQozj6/aktaVoA7yk/BPC26cE6b7gh15guwUI/BXbVdgcor9GeZItot/0E7EdS8F7Z4ugdYUQi+VIlXaUOJT5Ot9Ea7SBN6ur7Sqks6jxW0DBle9op4AKWIHruiDyvbe87qSS9tkb1asSiXedZW/ND62lxllJWLPub8tMAaqDVd5tRoT88j8938NZJRGs5xJ0YNL+Weat3hSNmZsBbFvHPCehvhlIcCE1tzFEqjrVv0ghX2NjNKkJJ595tJTp77BsVdo4PlJqukOb0MO9k/yCbEqvfHzA3AcAgJOyNDJQX3IyPDtxIS+SlkRYxEia39Cm7q6GoBY8SuItdSaElrohqbCPW2LlITBsArzPBTK8BNl54RYEgM3X8k8Lx+AyLE2yPNfLtTTupwjfiYNqD4cmeublXZW2LnFzlz2teLMZECsJqGVcxd45gTV2LVODkX6MNGRgq+dDTyDr+H01M7V5SFo0dG709OwaaPrsfS0qiQliKnUWoGp11VlBwZacfePpCytHD9NgiB43bM8LzuG/mfqY2PCxc1EFXcrYrlQRTeFrXkVdvtks=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(7416014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NldzSXVWejFRVXl2bjgxU0Jsb3djRWFTYUdwekJSVVB0N0lZRUgxUTQ5Ymd3?=
 =?utf-8?B?OTJTdnpnTXpSTFVoeFNlMGREVVFkWmsrMDF3SmJlLzk5ODBiRWRtWWNITjVa?=
 =?utf-8?B?UmNBS3FFWURoeTlndWlNMnJPZ0twWklQdDlVa21saytZYnNGY1E3aEJnc3Vq?=
 =?utf-8?B?dlhSSXh0QUtQVEovN0ZJaFhXblBnUndyTHVwcnJDQndSZ2FCWS9ROGsxcHI5?=
 =?utf-8?B?Z2lPRFo2ZWN4UkJXZTVDSCtwQW5RcE9YZDJ1blVNWnhUMUtPV3FvTVlVZXhx?=
 =?utf-8?B?cW5tdkcvaUUxUlhBRWdtTm9XTXZoTk4yaFZNK0d5Tldmbk81ZEltcUFKRjUw?=
 =?utf-8?B?bXNlKzdWK0tzRTFwVWt6NjVsdEswTE84NUxQMmNoUUZCVG9FalM3Tkl1YjNn?=
 =?utf-8?B?TFAzcE5qY3BJQVdCdk5QeWg4WWZSQVRLcHk2a0lTUWVYa05jRFhkMVZaMi9j?=
 =?utf-8?B?Ri9CWUpVQzc2cDRFV0JuSWx4WVNDelZQYWl4ckVSWllrUGtNa21wSzVQQzln?=
 =?utf-8?B?dDNXS1JnemRUMmpCQk1renhtdm5EcDFUWk5jdmdZaFYwQVE4RllNYlJBUnF6?=
 =?utf-8?B?Z1BqUVcvMXNSdFhXTUQ4ZHVjeFhidHJjN3EyMnZKWjZ0bGxiWEhOWGhEU1Ew?=
 =?utf-8?B?a2tkTXY4SlQrN1h2Zm1jTFdDbUgzQ3NHR3Q0TmJydDdqeVdwZFliTDg2VHl1?=
 =?utf-8?B?VllBVWw0ZHVxMnl6TWZCWGZpcERIU05Zc3g2WFRaNnN1Wkp5dFNxUUJ0cHlL?=
 =?utf-8?B?T3NVRWJDc0pUWEUwTnJMVkhKUVJtM2tGaW9XVTJacTFZUU0zMUE2OVhrVTln?=
 =?utf-8?B?RG1NQ2RtT0srKzd5NlI0dHoyaHlHaC9JYmdEQm1XWW1NSTAyaW91T1V3Q1Ex?=
 =?utf-8?B?UkZwT2EzUDBQMGsrY1FWck9ONGlNQXVxVHhCcUhNVzNRbjBjbDV5R2ZpaGhl?=
 =?utf-8?B?bUpwR1V2WlUzZE9iT2pGbHF3YW9VTE1NV3FDMlEwV0JnQU93N2twMzFiU05o?=
 =?utf-8?B?bkw3Z0RETHo0czc3b05Kd2tiVnNMUVVHMVdLMkgwL05TMkpZOGMvRll0eHpR?=
 =?utf-8?B?S2FITFFGWGdYMWEvUlFxYnp6ZEdGbmpEcmhGdDRwaW0rUTdpdUUzT3M4TkVS?=
 =?utf-8?B?TUUrWHA3NTdpLzFEeWJ4UnJCVnZ2bEFsZmN3TWJ2TXlUc1NyYzdRY2xSWE1i?=
 =?utf-8?B?QzhFWU0xMEZCTWdoOTRJMDhlSkFUT3BEeFB4RXhOaXNzK0RHMmdSQ2xXNDJ3?=
 =?utf-8?B?d05xUU5PSXRFS1h5WEVCL1Y3NjRodG16UjErMDA3cXZLWWhTQkpGemRIZy9L?=
 =?utf-8?B?V0QvV2RKMEVzL3BqT1BmVFBCM1dXcTNSWE1LRUtOYkFDRS9FbkpYNnZzVURH?=
 =?utf-8?B?SkcxK00xSnNDMmpSeERIZDZpRy9LUURXV1poM3cvSFFPRzRPMEltUmpRWmIy?=
 =?utf-8?B?NUYxMS9mOVNOUFR3VXFJbi9DWUFRcTAvZmRrZitXYk9lYWQyY2l0bEYzM2Vs?=
 =?utf-8?B?YUFHYUJqNjgxRmJ5OGNrNjZ4RU9USUoybXI3MDVubTBPT2o0azBLeG4zcHpl?=
 =?utf-8?B?cWJSdlc4SDlzOU1Ba2d1b21ac1JGd3c0SGJPdHBBT3dkV2tYbm9qeXY0L0dH?=
 =?utf-8?B?YVFNWHN1WFV1elQrclI1blFseDRqandLZU1UWGVBakFTMlNoWnMzUkgwQzU0?=
 =?utf-8?B?cTJaWEk0bEYvZU1RYU1GaG1WUW1DV0MzVGpQRkpGSWp0TWh2ZFZxcDBGWXBw?=
 =?utf-8?B?alNxdDA1WUQ0dTFZT1pQbVNoZ09OS0trRnJobDQzUm91eWJmNEdHdjl6YjJp?=
 =?utf-8?B?UmZkM1FXR3dXVjF5MDNEaU9TSFdFNHNwWG12ZFRJeFlxcFFQclR1NERwTVBM?=
 =?utf-8?B?QnppSmppaDlSQXRneHZWSmJ5ZzFyc1h2OEdiMnpNdG9Rd1pYZTN0cHB2MS83?=
 =?utf-8?B?RmZRSCtjT29mc255NkNHMmVSYmpMTVNoNGt5VnJBamVzSGpvcVgvNmVkaWhx?=
 =?utf-8?B?dlBlMit2akFMVUI4NEdjZlZjWWpOVXkyTXArUXByUllFVm8wSGlqUnFZRDVP?=
 =?utf-8?B?U1hBRDVnd1UyTm1JSExhUjFxZS9ySjJaWnVhUXFqQitKSk9TQXlnTkV5aXUy?=
 =?utf-8?B?RjZIenFNMThseUhwNm8rYUMvaHdjd25oMXhRMmJ1Y3d4bEtUd29CSFcxRWZt?=
 =?utf-8?B?ektoWnRzZlFTdUQvbkFQSkxUSzZXNW94UHc1Sk1EeXRuUDFJaXRJUUtEUWZP?=
 =?utf-8?B?ZDBpRUloNXFKeThWUkZKYUhzMXdhQXQwYjdid0t0TVNUdmlzMkZMa1VjQVpM?=
 =?utf-8?B?REtxMDZRN3lRRDJnZFRsSWlvK255N1IweEVNb3lvRDUrVmF6UGhNZlJzMHVP?=
 =?utf-8?Q?7uguB8b555b2QUBc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fef916b-4e6b-412d-e84d-08df1efd46ce
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:15:27.5486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2SJa8XVRYyvyT+t4GG+S0KGjernN3RK29WYHhVrAdxBxVtPGkb6UyuJV4KKzr0PQ6ymPIfYQ/VgZx3HuvmCE0mkkUR99TFCh5g2eh/b3Z+JvEBZMz/yROTvAylwvm4P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10660

From: Frank Li <Frank.Li@nxp.com>


On Mon, 28 Sep 2026 23:08:28 +0200, Vincent Jardin wrote:
> The below message shows at boot time:
>   pinctrl-single 70010012c.pinmux: please update dts to use #pinctrl-cells = <2>
> 
> Add missing #pinctrl-cells = <2> to fix it.

Applied, thanks!

[1/1] arm64: dts: lx2160a: set #pinctrl-cells on the pinmux node
      commit: 4b09c93679eea12cfef87ed7b4a75056e8e9428e

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
