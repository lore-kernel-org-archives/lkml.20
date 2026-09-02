Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349553CB2D4;
	Wed,  2 Sep 2026 20:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380094; cv=fail; b=iisP085cqEJ+n6VlFgUyo5LfgQLM9O4ivNhfI2PPq52ZyEo9+J41czJgqySgjfIQNMKpSTEV8AQvFV0dhaMUkwTGE68nP4hAhD1/htdEjH3kZrb0dVZct2Q7HbaM2lFFTjEjUcAbpflcL/0iALk6okEHiwLPoNkNpk90mDwuYvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380094; c=relaxed/simple;
	bh=kN90+9vWcDczcrDH0a/Nbh3AL8oHVCxmXYVbhozwv9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LWWbUxORArBtnuy+q+ffyVLfK2W1mrmqWZCBj9Jban454lpag1hEDAvYjqAFCO9ab5tnmyARnGrx65BVr/cHS6/4yJ/DZaqg0kNKRZz3WyxCnsZIv6cU8YcB9AK9UUSK5fPvesc9kHlQIyD2UrzdLNaXhn2uf1U4FNt94jcvOsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EAh7G1Ku; arc=fail smtp.client-ip=52.101.83.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EAh7G1Ku"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvDKyFdRqzcJOHBNB8My7AJ92eQ7w43LKGD4TS8gQrMOd0uL/K6YQPJTl35oKGHUhU3yxNADIZHDiAJReeI62eXW+SuOPeq3vqsc60Akh9vwe3aGCby2NpR9s5Yct6b5nImWa9ERGYL0SBbGu0knNZdwwD+xJSzoFB4Nd11WLohvxtQC7N1vzmnLMqw14Br5RXT6GzRkEsJpfvTcvVuv3jylZCGMKR2fJYDMb3yc5gQReaji5QPArNdQ3lFttC9fTj4bYae0vDG7NmXN97u8VJtWrESiekfWoXos00Gjp1eiy88UP/FdQurncaONyeXRNeV+QORTiejTQaPBRz55pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoQLOxVTq4QsLKg5BuiOv3LMAQlI8vuekEdnf0iHiN8=;
 b=a3ixhHl9QS/0R1t+CfZSJi94PjGm024xkYw1enPFx9VUnbs6FuVG2gb+mPHOeQuZVnThYHCibxH3kVfic+dOVtvvKn7fjvSmpi/5gm/OHZNfVdC0iXh4UM8v5nA+krpVT+8hFHUQSBHwsg7Q6ImhSBOcz4FNTPOZY+EOemhCEW6wqC21iYlSJID73CESRtNpYo2l9x4uRpHXK8qsZIKztAOzY8B0NLTCwNAUhFzt/wwhK8ZkdAId9aR2/Cwu+7EBbmjlJi+BA0Xa3yyWwZIYwdms0wZq1huCCyu5XzWJim8TGUg+YSdlA7IMM4YgXi/TOJTOM4dyYK/TrPkafO9aKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoQLOxVTq4QsLKg5BuiOv3LMAQlI8vuekEdnf0iHiN8=;
 b=EAh7G1Ku6fnxUwbGpkK/vodoT+yLEmXHS6KhtsB8jilqgxv7vkQv9QHepqdn0PBaetm5bgJnjgn6mf8hnTj4b94F8hFVgW/JUkIC+fUvlWR5GnU0ZYkyo1/3VcF9UoP3uyVbN9CEHuyD32eCqUhOqA1/UHCWUZZl3HvEhViOYeFZyxhffrtktovLjnoVrih2s7G7IIWpzoFI0FSWmjDSOlYQqDMB2LypFZtHVryc1QwirpJ3BzTv0lDseVvgGDvc+ebrLbwku9inurhPrqHz2ym2s2RxeobjeetMx3Bz1b/U1r0Sde/Gw9iNLbKg5dPLAbLKIFGblnBTR9c4N5XV1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 20:14:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 20:14:49 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] TQMa6UL[L]x[L] DT improvements
Date: Wed,  2 Sep 2026 16:14:41 -0400
Message-ID: <178838007684.2143077.5680462366581742471.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825070418.2072708-1-alexander.stein@ew.tq-group.com>
References: <20260825070418.2072708-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: c104c272-c5b1-445d-d7eb-08df092ed709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	86Bf3ULSqvzhOo6Wk6+9yNGeotL43PckCIg8r+LUzNN3/aH2A/qi8wmafJQ383ZugCM6wn0lx0vMoHcDRGQLjB79oBDVxJXwCrfwB/+lKSBgcgb40Rjx4jjHJJHDrhXXNLwxoe9bbeB9OO07cmKZMhxsI5JQu84CM5uXBjWigK8LmMrOW2kD3Jm0xHP5LtJ2p1RNX+4LAA/8lAClXYgE7xlH4SYkbw8yl3kizoo+blB40cSXDJLKI+sSKiWzZwKZWAR47qcWXWGHlfnW4JzB7oWH1JrsyNKsbhu8KY3o4FzgVCxaiKOFp3goChqj46ckseffJFYpT9o8pHvnjnxemsP+bLIAVDSC4CZVa8Sql7EAiw3CMQzwv0ffZsqfsAJAZd35RWK10HaXToq7SjbIKiG6E80dWhwIqFtueRlfXAumvTlr4utpBZjRaQ63vaYnQ5A8m87+dtHbmpZp9PL+PuuUAkb+QgzeGAuM4pYee9lCyKs+VGlpaxHG0wO2X2HBoU58i8TKHq8p/l2NdY+JO8pPkaevM0bcTiuiiq037L+wddqT7It4uijG8Sle4BZcWPGGO1yFstfJXj+HiSMBC1MaOCZVDVn9tGGjfeU2OVR/7m4DfuKQVnLTGVoJwY4A6NiySt1rf1bIQPKe0NZ97MNSxf/1BvrBmK9UOwtWWJQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDJ2ZWd3K2VmNUZiRGpFSm1odWNmcDZoclV1MFBGRSt1TTczM1AwRXg3aGRN?=
 =?utf-8?B?U1lTOG5xWW9yTGJPRm5pU2V0YzFlMUNvWUk5djZDcHJBVVhpNGFLN0d2NWNk?=
 =?utf-8?B?M21RZWxORms1L2pzR0ViTkVZQ3pNMFVFcXVETE80WjhrVWVJeWFGZDlhTTFO?=
 =?utf-8?B?Rk9QVlhkMnVYTzYwbzNiNWNOQkdJbFhCTjdvWG1MSS9FZEpvZncwZ0tid0sv?=
 =?utf-8?B?TGx1YnJJbjZjcVZ1TUNOREFQdnNVY0h0bWhDck16ZUMyRWZ1Z0oxVkJmR0lj?=
 =?utf-8?B?MG4yQlpiUW9HVVFzTkg2Q2FKVVBCVUdFUG1ya3JXdmdMcnJNM1ZkbEFQNk1q?=
 =?utf-8?B?cnFLSmpVYlRHZUNNN0FRQk56Tm85N3B1QklKY0hYZjJHc1k5cEQ3aG4yQkFj?=
 =?utf-8?B?YXkvcTcrZDZHbmg3TFpuM3Z4dGc1M1F3YnJlUlQ4TFJ0b1l5Qmd3U3NiYnMr?=
 =?utf-8?B?bTlQK2sxWjVkN0FUTDJGemNsYTY2MTJGYU02NTRheG03d0F0bDJxSmYyLzRp?=
 =?utf-8?B?MTF5RDF2Y1V2TzczbWkzSi9PMUtLcFdNUStYV0paNXZsb2tkUDEwd0NKb0Qx?=
 =?utf-8?B?V3hFK2VOZmpVaEVqbVprbnFHVnl1M29nZUJCbjZyN3lDOUliNHVXZFpvck5t?=
 =?utf-8?B?YTcxOUQ5WVVmMTlVTjBHVG93emMvSkhyZmZ4RGIydWdsQ042dG1laFBvRjJz?=
 =?utf-8?B?QnR3dVVuZ2hmZ052QXBTczNmMnRYa1BENkx0bzdrSW1IckxhdW5MUGpIQzJE?=
 =?utf-8?B?cnBmUFVYT1EyWGR5QkJYaFpGaGM1TVpYZE4zTUFHUnhJYmZWaEh6WjFJK2xq?=
 =?utf-8?B?MHE2M2s4RXJJSE93UE5QMXlMUmplY2M4T05TR1ZLbUQzUTU1OW96YVZ3cEJi?=
 =?utf-8?B?VUxzZE5ZbXVoYWdraXYycFRYN3Mza1NSMnVLNzg2T2tWaGdTb2dqTyt0d1pl?=
 =?utf-8?B?TmZQZ1FBa09CVnQ4dTlCSGtOTkMrUkpHckw3dHN1UXM3NmdoTm05UVR6SERB?=
 =?utf-8?B?aG9BM0FBbUtKL0tVYS9IZjlZYjh2MXdRSk1oV1ZzbnhReDhDVUE5ZzQxOXl5?=
 =?utf-8?B?U2MvUXZiK013M09QRHUwZUpQRW92T0ZaTDB6UkFEYTVmcEJsMldZUWtsM2tm?=
 =?utf-8?B?Qlhob0ZRMS9uNlp6d2VlQVlOQjNmSHd2TXpmMkNNS3BmTHZ3dzVsK05UcDJr?=
 =?utf-8?B?NVFYcGdJbXJqTjIwdHErOEhGVWdyZEpFVlJsUDFWQjk3WXYrTXJZZDUra01V?=
 =?utf-8?B?VmJ6b3ZSblNkWitmVkVsaGQ1LzFQTzVTYUpLOXBzSmtYS2cwRmJYejVwUWxZ?=
 =?utf-8?B?MXRKWEd0L2RaSjVUZnd4bjUyU2NDUkJXTTZyUytpMTkrcG4zY1I2dXdyOFl0?=
 =?utf-8?B?WGtGRG1HbXdQMWRpZHczcTAxUE9sZXFsOWl4UzBtcllpamFCM3Z3WUsxRDI3?=
 =?utf-8?B?K25ucWFHVnl4QjNwVlFiOGhsRkZRL3RzZ2FBWmlFaVRKbG10U1ZsWURkQUE4?=
 =?utf-8?B?VEZIM2xXZUwydDFGamNFc25Qa0RNdjhlbHRqWFBaLzU5OWl0cVhQNDdIVHhi?=
 =?utf-8?B?RmZwWDRia0NMVTlETmJyaVk4UnBzUEE5OUcwK251WEtGVStBKy9zaXgwZTYw?=
 =?utf-8?B?QVAxL0NoRURQVnZndFgvTFRraGZqdGNEZDFrckdPRmoyTDRnWUM1cW1KUnFB?=
 =?utf-8?B?b3o3ZTdlNGZrbVBtNzFxTWhLMVlrTkZJZEFsVllRYnlBS3VtYVpWZGJyWDBi?=
 =?utf-8?B?QlVrVXdQRmNmcG4rc0pxMDJ1blpkVmN5eVMrWjhzQ1p6MHhBR1FDY05LNUtE?=
 =?utf-8?B?VEJJVTNEN1JhRnpUZHVYZUp5RysxTUZrUUtId3BHL2pMYWtmcWtuaHBZQm84?=
 =?utf-8?B?cmhPZCtTdk1uN3QxeTlUQWIxRXRBSld6eUdqNWRobnQ5b3EyR3ozNHM3MnEy?=
 =?utf-8?B?b1F5WE9JaFBZZmtpNElocG1yNUM5dnM0UllDbXIzODdrSzBlZXlEUTVYdUdI?=
 =?utf-8?B?R0VmWW5jcFcxZC9EVWd0OHRrbCtaeGE0UUtMQ08wb0VITmRHRWw0SUpOSFFG?=
 =?utf-8?B?L0o0RHF2RHFSdlYrNFFRRVgyNlArZkhaV3lQYWJxSWJtZytlaGIwZnoxVkxI?=
 =?utf-8?B?RU9HUStMMWlJZk8xOUVPTjlaUXp3SXRaRVl2aCtXSG5mQVNuTkRzWFZZOUlo?=
 =?utf-8?B?ZWZqbldXYkpZMDN6QWpUbWlncHE0V0lKOHdUWEhQVTNwQVdQd1hseTFVbk9x?=
 =?utf-8?B?TmVZYzhJVVFBd3draVZzNFNLSzRmMVJIWm9jckNSZmRSMUorOTVBS2lDNXhv?=
 =?utf-8?B?dGlFbm5uRFh4ZHpObzQ2WXM4Wi9Zcis1a0ZNbS9kN2RGMm5MRklGc093WVhw?=
 =?utf-8?Q?q3Ay0381JzvWsmYxThodMqf9L++tqP8G+WcZY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c104c272-c5b1-445d-d7eb-08df092ed709
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 20:14:49.2608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cjnm2dagAyYEokJ7uQADuI9tHg/MP5Z/l8HubAW18ssx3gpvHfllB3prQbEK6a6CozVF53dZdKGgsxCxD7hSgUKcU2otoUnKi6CikvsYKhgVh7LAZwmGPSnIJ6gx4BQN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051

From: Frank Li <Frank.Li@nxp.com>


On Tue, 25 Aug 2026 09:04:15 +0200, Alexander Stein wrote:
> this small series improves the DT for TQMa6UL[L]x[L] a bit.
> Ethernet PHY IRQ support can now be added. And the on-board USB hub
> is explicitly specified.
> 
> Changes are mentioned in their respective patches.
> 
> Thanks and best regards,
> Alexander
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
      commit: b7efad33a8d172a80a718804aebc1b2ab65802ba
[2/2] ARM: dts: mba6ulx: Add USB hub node
      commit: a637d2791eeb77912a7b48f30546ee5b6e16f5e9

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
