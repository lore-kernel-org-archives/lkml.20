Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A779A3C1D6B;
	Mon, 28 Sep 2026 19:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624400; cv=fail; b=PSqwF9sVeq1RydRqvnxFx3o2jm9bg1RcB5Q7ggGCVEb9chHh7YDhLEVEtYsXrkF8NkZyota/kVSTkS44ZypsxaQdMYBdC/GYEzV8Pv9TvrAtZAcMGwPjDWEiL5td3mR25N12riuQ/x38wIS3qAwAadpSAYLcTtKG5tus6EloLug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624400; c=relaxed/simple;
	bh=CY43sPJFapyW+mx4BhCpJEunL8GMLfcWBrwCt+xEXZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VDkxk0R/DyFB8NBhyxNeCKt2ICppj5VJQa0kDmoB5TtEs6qWEIwaSFQF5Hn+aWemahsiPxo9x3LowFR8q8DlFs7hl4X4v7DaFt16S0VFMB1DjE43rFRxjer0ZW8vha8xgcJX9aLPHqBwdUuE58RhJvnUlzfdwqhgL86URF97PD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P2BeuqjG; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P2BeuqjG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpKJk2lSFO65IpzffbjrekMzjGpTn+GcbXtm2lSbj5fQCc1Tie3JUJLe0cBR31sVRrQp/sQ6yUOfn70VVl4JmShhaFFDZnnPnFhRLGCO80cY/NowZu3kBzvuPq53nez6mKgkgMws5fTkeFrIcCQ9sNNaHCyQHwRYVdj+JvcbE+2jECS+I8EUU9ZSbA3n/dzf0SbkKMBh9Q5hUieHHbpg2cMQPqUD9hix56tjCvVTCKNRCKqe9PAInr5nfMMjBSA/Os9B5j4GLSlNj6w4gbtViV/jASlGOx96MR2mY3YqzsU2kKib2kvgXgnuDUHvo1sV9os0MoVU37Bvc/wazrlpsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wrvlkk+Az9sk63pYDUxFE8/vU4qUIFMvy25A2O9Fi5Q=;
 b=PdjjhoOz3DdPmrOw+Z0mRqI9SxbL0L1pW7Ir+NvjdXAiWPbgdPS/BPfutyBStBdRIorNg98sycX6ugAMc3tmcZCDYlvD7zfpc8HyDMSAqKA4no/O9M7X28bsL1U2XhhJ71+0UscOS9e2yqS0bVpKFsARd63sfslsgB/ZZW9kyvZ1SEHnEc+NihxnVmjmVkb3ToIRqOoWmDRmRr3xfQBPXQWUUgVBoBCZKzUC0l8X37l/t3TNPJDFaLhA0OXUD32tq4ZC3noXJounbw3A6u1ToQxZi97qIsunEV+HG/TM41kVKfQ/iJyp6UM2EM9i1L6E5glz84fee4eGlYdUpEzc6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wrvlkk+Az9sk63pYDUxFE8/vU4qUIFMvy25A2O9Fi5Q=;
 b=P2BeuqjGcYO4f+QZ9CrkR3bYGF0Ws/NnuhfWc236yRw8UfqL7wcOmsRFpwuulSkswNqUAV9nst/B4kyYfmEw/PLfo35xc/fbhlGVdgfn4mPb+GA9d1v9ZWCV20x3YbfcVT1n0Xl82GA5TRRHXd3+U9MLCPbbJTM4ZWSEScERiHx5/S/5SXJFcs9H5EbIE7BxAd7tz1fNACUbLECTeBi2RKBPYN9QQ7qXgFsEskfbDCoU6zIXZxJo8Hjg8Cvt6ivYUNUDPImuLbvmz0HpeV8UObPhF4+CYeElvt8uAoLvtcAu4Ztjk+bg5eb8jNf+7eU+IJ3cPA4aJPMZK0F2C7PZlg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:39:55 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 19:39:55 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	Josua Mayer <josua@solid-run.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-solidsense-n8-compact: drop undocumented adi,led-polarity
Date: Mon, 28 Sep 2026 15:39:48 -0400
Message-ID: <179062437989.2051924.7816774578871901661.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923211312.3793073-1-Frank.Li@oss.nxp.com>
References: <20260923211312.3793073-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AM9PR04MB8633:EE_
X-MS-Office365-Filtering-Correlation-Id: fa93179f-fd2c-4202-ad22-08df1d98457f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|23010399003|921020|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xTEm9xE62NH/OhI0qiwKW+E2gmKhLU+vVbARVEIUQJlFabfnySClo5F+sgWeW/TuvXdYcEq5jICNAJ10yGFxv/3qTIi9cFZtU9ilALNzGHyNdXG/B+EywETGv6SZqoeQ+rntf3S+n/rmVwQ0uL3xkcznECHPMGIDkomOcuV7rDGDBR+4spBCfJYPECwtGUf8w45tPr9nAJz7DR/ZTySji8ntW2ubYDJSI12OGyMuhsLsE0M41JNUVsLpwB936RTSue7o398gWP1GHsDBOymUNZqQLiRdPmyjDvp2ef6nJKWQEFUNhKcV2Jkqg711x9kG2rwWQkEdPjeOsgALKsAxABqUIhsxLAST2TVuQAwvBq67B2McNFdO2PDW4KN5XLXmWMNA+6thg8QZy86fQW/jeUc0M6dq0NA7ewVFASkM3ifuWse2F3S2wHSJQlZ4nd5pXgRcFaLxqszEl+4/BuSF1RHULlWZ5vuE14FA3c/ITPdy1YH2HGoJP/0DtAxrEcArl/GTQ2+RuBrnHCN9sGQBuCHtGx+SSTG+V9gB2WNrUqR0fkyXcSrz2PFRh3eT7kxYo9NJ0h8ZLZKxpaAaY7zr2ZmFzrHezbqHxXcbuEkGLHahk+IRp+yz4jdZSyXGrc5uni4Xs7QXSPtomIYKPmV/J5I7uvMo+dfurr/4t6R9byQ9cnyiyYlZLXtVH7WV1Qp9Cb1BSfT8hXIgvjmOVUOKCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(23010399003)(921020)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVc5cEJDK2loNENNRC9YOHcxMVdoNk95djNHcU9kTnkwUlF2TFNacXJQbUdn?=
 =?utf-8?B?blVpUEtSV3p1eDJ2Tm1BdDlnL3hLQUxoVnB2VUI2cnkwVlJFd0hCL1Zvc1Ja?=
 =?utf-8?B?TVFGd1oreFd2cDZ3UHdRekxtd3ZSQ3pJaDlkcHhCazNsK0U2Sk1qTC95VE1U?=
 =?utf-8?B?dTA3cXp6bkFpOU1WeG1PWEllRHVFRnl1ZElrRFhJU04zaklmeUphbHJWaUgr?=
 =?utf-8?B?VTJYUEFFSVE4aDZQdS9EUGg0ZVo5S0VqQUFFZGpLRHI0VWsyYjh1bHVScmRj?=
 =?utf-8?B?eVlaVFBZVTgrUUpaUllnc05pRjRWOG1PcysyQ1lqL3JXUE1DOG1tSmpuc1px?=
 =?utf-8?B?eGZLcnFVeFZvQncwOXBsYVI3L01EUVAxNnFNQjlabzRtc0laK0FtS1ZVdFl0?=
 =?utf-8?B?Uk92KzdKUGwveGk3Y3BaNTNoTjFiQVNnTGFNWVV1S25Fb0NkZlFIdEU4cUdN?=
 =?utf-8?B?MGh6WGZuRWJmY1RJM1dYUS91R0VEdkFBeEoxRGN2b09hd2tMNVUvTjZWWHM5?=
 =?utf-8?B?ek5nSUpkWE9GRmoxeWd2MUtNT1FzRWZWZDBPbTcrZWI5V0hsNEFaVExrOEs3?=
 =?utf-8?B?ekppaVZJVWw4RllJekk0QXhaREJTaEovYW1STmpXcWE4R3ljMmZEa1FMS3k1?=
 =?utf-8?B?SzAyVDV6TEtmQWtxMVM0QVV5RDZOT01ZNml3UG5WTDZsT2lBQ1NqdmNSbUxU?=
 =?utf-8?B?Vm1QVkMzeUFlT2lBODJQSWxGeUlhcVFvaGhJUzhXK0ZnS2F1WXozcWIweEVJ?=
 =?utf-8?B?YlplUHM4MU9Bc1h4NnQrdVFvbFBPQTUraTVCaFhWZ1FqckJaRDlwL3hSRmlF?=
 =?utf-8?B?blBzRmZqWkNHWmNwQktUV01kaVBHeGFnaUxRUXd5V3BLRXhKWGV6eHRBRDFp?=
 =?utf-8?B?bitHSHk2MisvbUpmYzQ2bTlHdG9rMVNvaE5mYm5udisyZldJK3JqdHpCcDRo?=
 =?utf-8?B?dmYrWW8zRXpLVkF6a2VVdGdTUGpxYTA1WGIwM1RmdFprYnU0TGFQRDZMT1Jq?=
 =?utf-8?B?VlJHNkw1OWpyUDd2aUJ6QjVyRjMyS2ZFTFB0U09Oa1k1Yjd0amRFMjZZbTA4?=
 =?utf-8?B?cWNVY3g0enE2MU52R25xLzdwa2Y5SFpuZTBMYWdhMlIwaUZyMlY2V0NONTNV?=
 =?utf-8?B?MC82U2xFNnpPckZEbHVoVDhQVVhsTUlMT0hJNXdSL29rVzM1Qm81YUJibTdM?=
 =?utf-8?B?Q1pnZW5DUDFkanhGY2R1eTgycHFtUG5JeDJvSjQrdUdnaENmQ0pyeVlEQ2NK?=
 =?utf-8?B?NUZjVGl3Y3lGcENISUc1eXk3d1RwdTRaUlRtaFNSUFd6ZUtGN3FkMGU0aGZ6?=
 =?utf-8?B?bjhKWnFLbFF0R04xd0FMNEYwSEVsK1RWSm5IVkRoUklCQXFmc0YyMjFYak54?=
 =?utf-8?B?ZzA4UHpmQ2Z6c0ErOEwvTnRGbldPN2s0K0hlb3lIZkZaRFg2VkVoZHRnQXh2?=
 =?utf-8?B?UjZMK2duMXBJVzRyckRvN1gwZjdhVVFBTWg2VlNkYWtxSkVKdVJwbEpaQWda?=
 =?utf-8?B?VlE1L293SVF6WlhES3YvZW8va3N6U25EbHM2WFNoL2szeDc2V2hBZ0RyR1hO?=
 =?utf-8?B?RFE3S3RpenlWTnhXUS95RVZwM2kxN09FQUtacTVQU2hhc2FDSi9mdWJHV0Qw?=
 =?utf-8?B?ZXRQYnZEaEo0Q21QTVl4MnpMWlh6dVBRNlVVN1NGSFl2ZFdUTUFYOUFoV2Rn?=
 =?utf-8?B?QnZPQTIwQVRSQ1l6Yml3QVBoYjRvNDVYaHJyR3d0djVnL0NDdk5xMXM3MktP?=
 =?utf-8?B?TEhwQmR2U3lUeGZDS3ZJUzNiakozNktEMkQrdXIwMlRub09tZXFJYm9pYTFB?=
 =?utf-8?B?TUVEZ0xHMElSVWx2TnV1eHdyTloxRkRrTW1mNVRaTW5MbUZZQVRZMmJLa2tE?=
 =?utf-8?B?UCtMaVdNclhOSllMNGpVNEhZK3dtVnRTOUJ0d2lYdDcwcG9YSEtIU2g4NXkr?=
 =?utf-8?B?SU81dThJWklkTVRaWTZVZDZPNVkzMjRrek9ibWtCNjVUeDFGcC9vckpKU1Bu?=
 =?utf-8?B?M0dxMy9YbDlMczBIODR0TkhUTVhKYXdZZUlaMDJqYkVSTHRsbE5RRkl3SlNu?=
 =?utf-8?B?c1hkZzBWaWg5K3lWb21Mb3o3cmozWFFoWXhmZlhnMjJiNnZpTW9zU1RHKzB5?=
 =?utf-8?B?ZCtZNHVyQTJZVlFtcVAzSG5XeExpeEt5R0FtQldSZTZYUmVhNzRkQ2h1UmpU?=
 =?utf-8?B?dFJ4end0eGJUN09vSE9OWlErUVBLRG9KSnRIcUtKdHdaWkRoWnI1T3hEQ1A2?=
 =?utf-8?B?TFNGMkpBSVA0aGloQ0MwQnZkN1oxdmV1UmxGOVVOak42bHV1Q3VGSlMzUmFo?=
 =?utf-8?B?dFRWRW5la241SjJxUGF2Ulh3RmtBL1U0TFZnbXFiQnVsaVdRVjVHcHJlSHhL?=
 =?utf-8?Q?jV2FG0g2UjMHXbCa0P4lU/OoxlH/TkVIxFxEt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa93179f-fd2c-4202-ad22-08df1d98457f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:39:55.7050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2nVN1kXFmDgGtyM5k8a8aT3IS/444kfNU9ggSRFLhdcMnSTWvor4xM9rbNSBZ55UkRfgQnAMD5xSn05TfnBNxsrNpAosmH/vDaaxB6BCKWtjbSo2VFJtQXSCsVNM/HM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Frank Li <Frank.Li@nxp.com>


On Wed, 23 Sep 2026 17:13:11 -0400, Frank.Li@oss.nxp.com wrote:
> Drop undocument property adi,led-polarity and adi,link-st-polarity.
> ethernet-phy@0 status is disabled and no in tree overlay file to enable it.
> 
> Fixed below DTB_CHECK warnings:
>   arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dtb: ethernet-phy@0: adi,led-polarity: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mn-solidsense-n8-compact: drop undocumented adi,led-polarity
      commit: fbbb3324b517f7cc59d424bbb90266cc1b13943d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
