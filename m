Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90D637C0F6;
	Fri, 11 Sep 2026 19:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153912; cv=fail; b=lF7lA0t7gphtzZJ4DdNijb/Qsva/KooiHNXjVXiXkLBAAd/Ga/2aUHJ2EGHgAkNVeadd4bAFyEWOBAnDoj39WmHEj8/WOAmdaJGRhnpTE5E7SNSnSXy9RhrUraCIKG+XEkks5B8euzumum7jEZ9SdiL7zxIKBKADEJdGyLey6LA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153912; c=relaxed/simple;
	bh=Ra9aCmMuJAMdSjbM/rZ10V+vUIPWg7MxtIq6zuU5Q4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aAvEUA18enZNpXorKUkbQf/sPTqYepIapI4IPghPYQBn6UZfYp26JdDgeMBVkj27kl9PpBok9sQ5qdtOqFVJjV3/6TgIUGPJyEdQhF+gZtWWF/WSQtLlBGf3ItJjmQ5VtiAAL7cMpA/JUtoyzL9xm5zm2RtIznFOk1uMRe6rauw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=auZ/aa5x; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="auZ/aa5x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8BbOk823/hRJEm0+qJGLEaeKo7gAFKFjchAnjeiC6lL0VdYloGVgPoJmuxRUg5Lr9uPTbaCIwk62paPFpgImhSpU961aoj/3XkKHF/8lIR0XXJZkmj9icE9OIC24dq0kOnX2eJFKxXz6u7t0QWJUVuFR+COQ3lvOVNehp5O3G3Y4mrUCX47GcVH0jnXAniK6ctxFN/r1ungSOfQJoQOvNINxSldxgCqUaCaj/qVBvHtUNeO+vk4AFrQm/E9Vl5qF+XcVef7N7zbs2AKf0Ppfl0DhwLudOxYsqYa1HUvjr/5e7e2/D0LfWNl2MOkLe5mTXUKe+6QTX2YhLbfcxRF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVfuiw2IJwckYpk5Orz7zN5u8QP5Vbl4rPIuTtXXLuM=;
 b=JMgMNF2db3LPzWq7bXaFJDsv0y/9u+4MZSiXKgNEbIKCA5xfKdhvEItXh0QmNpNn3x2gqKRvmq37GK0MLXSgaV+HbbZ2W7LPXlIaLkbbIyWK00svi8kahp9srfVuvDPPVEM91yL9kQG9HCoODf2E7PC+POG9zSaoWp8Kr2e+BiPRlhUMzstJ0XBiHEcb7wmirizJTkJh2m9BkEsvPnF6zlPzxBR6cyKNdShBKHeW04cSmiWjRJRB6MbRbcyFo/ClSHgotq8BAVc8elYwNRiei+UMFxCz/Y7OvNkgayK9NOddcJMXcZ6yYAAQ/cysYKkIsPE4Dn9Tkw6Ft82XV7f/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVfuiw2IJwckYpk5Orz7zN5u8QP5Vbl4rPIuTtXXLuM=;
 b=auZ/aa5xTrL4HzYkI800yq+W9TMp9BOuqQdms/P/vkx7vSdf6LBs/YUwCXhDt8SXXImmTmV/iPpXdQGZADkg7H2Mai9JoWqfvyCBCkatK1pN08Fr4nPJfuxbtu52+EVBZcTiEcf1ak3OFtsxCvZiipITLx03RiaqBehjo8JiKPs+yNw92zEG3nMUpuxrRpgJACv3EtWEBDv8cxGTXOPxzxi1ou59FaNhpIghmgFAPoyBuexRJ4INet6PRhfpjjNkbIQYL+Psd8WQHyj6aA6rnaUN1dg59c6gNUPrrvUUo1IX+Ar2d5oWINcx/Kq3rD0U7WTCQ0enHtzO6lSsUXD34Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB7083.eurprd04.prod.outlook.com (2603:10a6:10:121::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 19:11:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 19:11:38 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH v8 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Fri, 11 Sep 2026 15:11:30 -0400
Message-ID: <178915388268.2931591.7036499750607052249.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788184274.git.stefano.r@variscite.com>
References: <cover.1788184274.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYZPR14CA0020.namprd14.prod.outlook.com
 (2603:10b6:930:8f::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: a78a5f6b-66f7-4f00-2176-08df10388164
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|7416014|376014|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 dSc2ZmC0vblrRxeLTGMXMgePJHhhC4P8RrG4osm9h2vPDAG6+5Dt66zFta2qg6pKlUAHI7mF0kdGRPjpcCfkLFhm/PDV4OqdhYoFQa9/igDrDacL+YGNS0bA73fqvow+iCt4GBUMeAZgckgIsJRyUrNcsaN1fm0JJkpBO8R90VtU9LIT9qtCRGgHWsyEJJLRnWcuAEpUpCvuNGFm7/kf1c9nfLfk5uRJeJcTwT9t/Q/AY3l3GVkkumG6wvACZNa+jkxmaW4lTxeU5+DXRhT5CQ2f98A00i0F6cqj/mI66QPYmP4TyQiJecDMHGnjzV844MrL2knZmfKlp2xSVF/oQcalFgWLicuUC//1+h8IEozFhFb2eUYtvOgJ2+BBxGKB3nr+yaWUwepqXNfddkLg93RgfOwbSX75UZmMbBtOClKXTG3MqvsYlC2WAIqhZmTltLeeIW0etpZa3fiacpZGo4EHWLoOifAM1KOjKGFyoCEa5RbBjiTlK9vR4iTH1l17yRnhdG6gAxsa8dzO/xGbwEb94XmCaAAylNMlh22y8+bfEWqNnNsoeafAsOR1750+eWVIm4l8rZ/MRAUJChOcJJxSd3/Fh6h7Z8KmwiXT+hPuDjDhr2tr64LG3n1My9X62mXYKWjYUBSEvfnmXZgoi5lgEdbktuCkh5dJbdSVhHI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(7416014)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z3I0N3oxcmhGZ1A5enZmcVgyeVlKazVYZmN0RkZSdkVLMmFKMm5rUDYvUzE2?=
 =?utf-8?B?Uy9scnBOdXUzVjFWRzluaXdSUGRrU0ZNRkp4dG90cUxVTUxsZ3Z5YnFhK2RB?=
 =?utf-8?B?cFBvbitEMHEybXRoaDBYeFoyNFBrcGM0WERobVZUN20vcTkwTUcyWDZ4QzBm?=
 =?utf-8?B?YTR2bHhkdUFlbG5CRXZremwyRXdOdEovMUZBMnptOFYybDBzVnBldHJDQVBv?=
 =?utf-8?B?dnJDYmhPanhCMmlGanNwRTVRNDdVL0RzY1o3ZGtabU9Oc1Z5Ujlwc0VJWmcw?=
 =?utf-8?B?SlVXZ3h3VFZoUkI0YlQwR0tBTEk1eHFqZXpiYytsa2lGMnFuUnVib0swNHRL?=
 =?utf-8?B?ZWVHTmJnbmRXbU4vMlNEblZVdUZoY1NHUTFoZVhlcngwTmhmWWkzYkJ0RCs0?=
 =?utf-8?B?NVVWNlBZajZ3cytua3VoUjkxU1kxTTVDZE9HNXFOY3Jpdk1RMnZ3Ny83Q0lC?=
 =?utf-8?B?QTlCOHBzM3l3elBWNTNTbzdia2hORGgwV3h1SHQ0QmdoN3JIUkorbk03MEps?=
 =?utf-8?B?R1JJVmtXeU1SUGw2UUdYYlJnYmljQkhobDdNZWdFQSt1QndCWjNRdmpNcGVF?=
 =?utf-8?B?RlFLTy8wd3BLL3p5U3ErTjFWRUFvRmZPVmJVRktoWS9PVVdnT2V5YldUb25q?=
 =?utf-8?B?YlRETXJzV2EzOUEwRFN2Vy9PaEN6WUR0Q2VCQ3NXUURuY1JlNmkycU9rUzVn?=
 =?utf-8?B?Um9VS1pPWFAvdlVDcWt5dnNKdWZaVnJDWWY3WEtKZmlkTklrL042ZkhVTnFR?=
 =?utf-8?B?eXdwdDJSQ2ZMWGVNNWEyeURySi9pSGtYaEtpR1lTRDlPZnloYlZtTHFCdzdZ?=
 =?utf-8?B?SUVuczVnMjRIaUt0KzhxbjI4M29tTHdDYWdlWENhSndocDdrRWlyaGZiODF1?=
 =?utf-8?B?dWlOZThQR0w5S3VMSUFQMTkwZmJodk5qSHJBYTczOHZNUXUvc3c2aXRsMC9U?=
 =?utf-8?B?WHMyVXdRWWl3dVJvTDhxM1hMMzk4NjB1Mm02UTZQMTJmcGZHK0JBUWV6ejE5?=
 =?utf-8?B?OTR3T2Z2aVhnZVZlUkMzVlpFUzIvSEhDV3lRRy9yTEcyc1RZd2JWZlJvbnQ5?=
 =?utf-8?B?U2pDT0hRRC8zU2wvNVkydktIR3lPbjFTVVhoWk44amdIdHMvVlg3am1EaXZH?=
 =?utf-8?B?UCtxanlaTzVTUExycEZxZUhkdWdjMjJoeDZQendGcTRxeHJuZ1pIU2VieGMy?=
 =?utf-8?B?SXdKeFdDa2hkWThsWDlBNlFnd2YyQWErWkpWQjJ0aEtBZ3FzTk9TM0ZISlkx?=
 =?utf-8?B?c3lwYmgyTS9uRjZNdEttUTZ6bDlpNkhsYlhqM3BNbXpJcDV0UUU3NzJxeXZL?=
 =?utf-8?B?dGdMU0NnWVg4SnhNQ2VodFEvcm5XOVVZV3ZoVFpjaWVjczNsL1JtSmc4bUFX?=
 =?utf-8?B?d01kYWNNNzJtTkxNcWZpbThlSGFQSGIvcEJBeUVNU0luelFoc2VtNjBaQU1O?=
 =?utf-8?B?NndZREhxWjFzeS85NGIzajA2Z3QwVGVyTWV4UWt4cWNRRUlyVWZUdFpMc2FF?=
 =?utf-8?B?RFM5YllWTllRV0lNTmFhQ3BxMzJRMWdvTmlUVUJySjA4Zi95S0xmWmp3emFh?=
 =?utf-8?B?MjlJMjZ0Wks0dFptS0tQK25mdWdzUGFDYU5xa2ZkSW15OHAwK1pTb1Q0cjY3?=
 =?utf-8?B?SS9mcHJwdmVHY0E0NS9oM3ErUHlwT1VwVzFyUDlWWkh3dkNNc0IyQzZudmRY?=
 =?utf-8?B?NnZvUW05QkRRdzBYTGVKNjFhOGpCV0JIVVcrSU5YazA0Zkd0UFBWU3VkaVN1?=
 =?utf-8?B?NlZjL1plQjJSOW5hZlYvWUxuK01sdnJYblc5T1FqT3NNQUpJZGovdW40eG00?=
 =?utf-8?B?L3kzZnlsQ29Td2FGRXdEQkUrc0c1UWZRY09wOERnQmtiY0U3WVFjdWNZSmUr?=
 =?utf-8?B?MzdZeWI1QnZ6TWpUWjVzWDNTQ3RmdTM5U1lEN0pBR0hmejNEM0p5akFSamJG?=
 =?utf-8?B?SE5OWnVnVXhHeDlHR1YyNG1wYjlmajZIQzBWSDBQRUhCekFBVThudW5iNm5H?=
 =?utf-8?B?VkNqYnhOZG4wS1Z6YkNlWEhtMXdndTdDbWxCbS9SMGxtZmRPbmNJMUcvckY3?=
 =?utf-8?B?cldna0E0ekE1VlVIUWtXdTJWamsrSFRmaVM4dXFHK3kvaG90S25PZGlOR2I0?=
 =?utf-8?B?N3F6Z1E4eE1saEpFdEtFZU1nWGkyL0poZU1LdTgvQTVFZVF3U1grTkFsQW9q?=
 =?utf-8?B?emxhci8xaVRwU1FHVktKQVRLanc4UUFKeFB3S0lGcS9lMFhpbld3Sk9UZXBh?=
 =?utf-8?B?UEpXU09acHNDRTNFb1pXV21wejVTMCtXVEFnaDQ2M1k4Y2wzSHdxUk1sM21o?=
 =?utf-8?B?SXZ6bTF5Zm5mUG1CaHhtOGtCYW1reEgwdnNta29SWGMydDJkZXBuVkk5aEFl?=
 =?utf-8?Q?zCKjY3rzVTZE3lLwmVNOV59pGHmbZfhb8kfqi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78a5f6b-66f7-4f00-2176-08df10388164
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:11:38.8939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHTimoJfAJX0MpSid44mSCK5EZPzgiT4J6uBF2noLN01+jt4Ft2w3tFv9CCKxVpTpEob+kBwY4iTblXKTB0yzuRruNXxn4G/GvgAZgsge8FSBnNw+qd40HmNKckqxlE5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7083

From: Frank Li <Frank.Li@nxp.com>


On Tue, 01 Sep 2026 00:55:17 +0200, Stefano Radaelli wrote:
> This patch series adds support for the Variscite VAR-SOM-MX7 system on
> module and the MX7CustomBoard carrier board.
> 
> The series includes:
> 
> - DT bindings for the supported VAR-SOM-MX7 board configurations
> - VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
> - MX7CustomBoard carrier board support
> - eMMC and NAND storage variants
> - optional WM8731 audio codec support
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
      commit: 9b58e80264d87f8e0faa80029248b48290bd74a3
[2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
      commit: df2c7ea04c8ac239daff1c5c78cbcdca550f8e62
[3/3] ARM: dts: imx7d: add Variscite MX7CustomBoard support
      commit: 40f1b207d21530e10f05b9eaf892b4358a1f1151

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
