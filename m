Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793828949;
	b=C/R5nPzp290CtwRrlQ2SF7aELvbsq2eetd88IjmYuWJyJDG++kNWxCM9fdybfT+TDXUd
	 V+RzKNk+v+czVwmwhS9OlmqCAFH2ismOjp9k7KGTyJm/NuJFke2j6+2bgphffaMs4zatU
	 ZACaxxtPN+q05IZ1faiLbohxal7cc1I+0XWy4KIHtmokpGhD/oUP3N1S9TvIHCFxDv0f1
	 QgAJP9Hp/hDO675LsmfsV+cZv0QfAMdsIxzcSneCsc1IZ46pT3l4wVkLz6+ka/8DlRlV/
	 5hpGLBmxdU847IVkC1FAHvbMFaKfHTNvcAXBABL5fl6GKBkIp1Cgb/NZ8FGljo7CH2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828949;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=o02RppXtzj5ZP/CB+tarR6dUKY8G3u7TtACjFok5RGM=;
	b=4NNAL2whE2IExvrx5yg72El9ngXPk7dr8CY8BQDQJAhTzfNASI+PAq1cAHr6OZAppLjO
	 KkPqEWZMwDIWanTl4KYOrv9ipwDg6vgZ1nUcJHWLH7M7c4jxHXuiGKzEDevwrRzEuFvBy
	 hU9ueYUpd73M/i7C+yNG8QP5rwHtg6cfmAQKYo08CIiVd6GxbSThAhRRKxyHjGsRXYF0S
	 PMoQ8pvypOcnhD+FvDprHTyBvAWEpcB4DvCK4hBCgEyOEV5zu7EGMXxizO734RXtuKBm7
	 nTA3fZ29RftOipZFV9iDnuuPubyzX49VYNu9cGsoV/FKesAPX10+nbLhTl1ZHR/SUQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bjMiEa4A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.49
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010049.outbound.protection.outlook.com [52.101.84.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DCE607043F;
	Wed,  4 Nov 2026 21:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DCE607043F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bjMiEa4A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyrp195pIouvAtEgksHhTkT9YLZZ0Srb2C5xfBHK6pYy/5jCNXjScKZh39r5fdnRQjNOE1yyENfDRlZvyO+MlxkjJuwPmQ8murkClyMABoxwylc1tKvUAi/3g1J7HeOsIw68H77kvVz3n6S0J15XqZNLRDZ8ZGU8/G7pEJStK3oAWfSeyhFyQsC3Rv/nwQslcRrjbasgZFpQnzXZIhsogzYPNDGbiVqW8K1fuY3s6LBByaJKvs3qIWucDwhlYEUzOdIhVuM3+SDS5ck2tVCCyIRWc4uwQvDldW9gXBeJpe1q40bdPIfvMBo73WkS3pnEwuEGjge+i7TeQN323DDM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o02RppXtzj5ZP/CB+tarR6dUKY8G3u7TtACjFok5RGM=;
 b=A0bajMEpEQQEZvcL3e5tyKhBfIfkbJIkYJIHl1gFuFqt03vIPoroie8L0wBR6c9ygmFB8feKJFOHY0UVFqHK0vT/9oXlBIGli+dLlXArchkEIx1o9wmuJSB2eEMuNlVMglMsQZKvHCDQydGz1iYeSBbf6ErFx9ebhALwyu5IUUVQLKwnwhvHEWPGGRt6lCS+r31zwvDNYkXxGgTblyKNVnfXq7MM/mPYWoVY1++R7lHl72qLe6RW1RxfMol5A/sF5+SD7zHLXcpYGWf33IOdn/T2/6+RxBbYLw70Tx9u+ASvZ7jSd+kmD4FHV35v0sXrdRr8d+2SmfTgw+QpTi/Llg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o02RppXtzj5ZP/CB+tarR6dUKY8G3u7TtACjFok5RGM=;
 b=bjMiEa4AQG+VaJNCOQl2YXepAmG/oqnUbBIDv/TKMvDrmobu9gaC5yL7ie2dyF/bgTFRgtMBRW6FxO9EnoRQ9M4r7P2dgJlSwRDAxLcNDEUvl5xsUgjeieegCepQRmTRxcDHIqwXOcaS2OY8rssarRddlXSnBEVndyAir9R2nbbx9DOiE1jWBNLhboBucK3yfs3QCbO/nnTnNyMwa0ywC2wBB+mFAsAKtNGO5XdXWfsioRG/w3m7JGY0dkxzJoh9bYqdwGzi4cE++54aj96sTHwfG6D2gIXNM79gDwHhPZHCLSNUxUF80/mn5Thh3y5Kzndfv5OFMQj9SP0l4d6KvQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB8PR04MB7068.eurprd04.prod.outlook.com (2603:10a6:10:fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 21:49:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 21:49:06 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: freescale: Share the Toradex Cortex-M UART overlay
Date: Wed,  4 Nov 2026 16:48:57 -0500
Message-ID: <179382891946.3873353.5995743404513054080.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB8PR04MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb20298-448a-45d3-300c-08df3abd72c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|19092799006|22082099003|56012099006|18002099003|10067099003|261009223027099003|261022075727099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	rSnBksWU+x6O/p2o5FY/f/dsBEwLuLsO7OPGhrXKDUe92tr1Pf+aO1BLWyybsUpynzTqYIMuT2QAk002TCqlhoYsKfyNckfWt/UkW5E1fcQtzXCdEqzZR7xJqWNaN920Fo62nHf4nxtMnL/cHjvQ1fgZZIQmDvSMyHtph+Ak+5okDtDJC5a0S1s3iYVxiQnRwTTUSKrylF5g7MpVsCRdmu1ErtqxqmTkDk8hd4RypVGJwkj4OuSYp8j813/ngbqZBxqgwRjrND9uV5NQkLLPTI4gfcgnBTMZGlhOyBQQ1V5V2VUEqjt6nzWCFRe8cb+gUz/aFM7r187iSHmoPAsHaIEaX26ofuZV5aB5rvvVat6W4iag2CYPObSVy83ZlNeDE87bPjSu4VuP8PsEdOXsnQ+gAfkFpvRY7RPQLx+FtMdx8VsJn1eefzanPgfCFVtKWAdFoD3H6wkdFh4HdPV7ABzNlQ34rIHvs2l+ndSBJMxplJJS2LUlz9A+3Urv9SUHVNDm4hGABWdgX0q3bddzVeOpaScXF9VSTrz3ktp+f5MOOMqQ0qmIXo5DdARtbFiNl3Yyijfh8Ka1gA2uCBY6Ah5plsYLv2QiVTmpGq+VtjXBAGHa7NK0VuCt0g1frKbc6Qh3IM/vcXHApYmm7FV9RmdQkOIUXUU50RLfa0U/Rlg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(19092799006)(22082099003)(56012099006)(18002099003)(10067099003)(261009223027099003)(261022075727099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2kzNm5JVzVGSDdnV2ZWcXRYb3JrNDhyeUo5Q1B5WUZmYTZEY1R6MHBBUkVp?=
 =?utf-8?B?YjI1V0dFV0ZBelhzVWhjTDRzeTB4aUl0U0pPeXcxZC9oUEFPV2J2SnhjekdI?=
 =?utf-8?B?RkhqZ1JNeHl6UGRubUVsZENsZlRaVURHTVZGRlBFVGcwbkE5Sno5WjBxL2Zk?=
 =?utf-8?B?blBXRW5aYU5KdCtsbzRCZE5NckV0MytuNVVjV21yYmZNZXR6N3ZmczNJdjZT?=
 =?utf-8?B?dzVQc0tsQW5DK0IrbXU1RnJTNUlQVkRBaHdkM1Jkd1ArSWMwS0QrNnRTMEdQ?=
 =?utf-8?B?UDJKeFhRWGlJdUR2V29yR0daNVNZOWhGMEZUQjRzUUw3U2hKaCs5N2VNV3Z1?=
 =?utf-8?B?QjhoZWU4ZWxjWXc2bDRDNU0wREZXR3pkQ2lLV3d6Z0NsQlB3QXQ4a2NkNmJU?=
 =?utf-8?B?ZTI0T1NwN09acmhlWHdkUjc2Q3dmbkVkT1NicnZScVppMHM4OVo4UWE5Z1BY?=
 =?utf-8?B?Q2hIQmU4Q0VJWkVQallZbVVqWXdzUGRHU3BoTlBESS8yRGE4RFVKMWhCZGl2?=
 =?utf-8?B?c3NQdUY0Z2hYb3l6bzliN1B4d0pzNU5BdGhYM21pMXowa2R5VlRGSDY0eVRO?=
 =?utf-8?B?MDNQWlNyWFZEdjR0RW9odlgzUDVIY1NvcmNZSWVENHF1UGlKUlBISDlxSkYy?=
 =?utf-8?B?M1NXSUtGbzJZbTgvUkNuVVMzQUo2YkdkMW9iY3g2KzEzajJoS0pIV05XYTQ5?=
 =?utf-8?B?ckVUR3VUemk5V2FNSEpTTk05RjV2dTZyUXNzQWErSFl0aGp3VEYrcXNwZUtE?=
 =?utf-8?B?QW4vMSs1UUFsVGpLMkhKT1dxNVR3UXFUbncrcEFleTMrQ1F1UlR2MFhiT0Vo?=
 =?utf-8?B?cW04UEhGRGphN090U3Fkb2dzZEIrZU56dk1RUEUyUm9CZFpIb1hQUW8vUG5U?=
 =?utf-8?B?ZVU0L3o5cGZWYVJBM0EyZFVIQ1pUbi82d0JVNlpkZFRyOUtaNGZDTGxYckY1?=
 =?utf-8?B?MllDRm0va2tKdXJjNVBhREJPQ2xZYktQNEd4RERsbmplUXFpeVlaRTdyRWxV?=
 =?utf-8?B?OUJkek9RUXpKOStWTDBibWxQZ0U2UkQzc0ZQUEdpQXR5TVVtWTkxQ1VHaUs3?=
 =?utf-8?B?aWFsN3BSY0c1NE9LbFo2N0wyMHJwWFpna2EzWWgyYnMrYlRTZXFFOUpDNGFy?=
 =?utf-8?B?cStNRWh6TXk5a1FWVDFpd2t0ZW5HWExPM1M5bGhzMnhSTWlsOW5JZXJ2Qjgv?=
 =?utf-8?B?QUE5ZlpJdGZya1B1b1hJUm1qTk45TUMzSDlTK1BGNUFGOGZXMVFyTlhlNURE?=
 =?utf-8?B?bDNuY2ZrTjZxcFdFWEFXbHVSaktXT1VyM3ZTRkg2Mjg5ZjNYUnQ2bUVUZlJk?=
 =?utf-8?B?WS82Y1YzYldYMkNaYWpyUGFUYkprSEhMTXZzWkMxSlJCQStjZ3lERkV2MStF?=
 =?utf-8?B?WW5aYWQ2SnVHMU5vcnNQVDZDbEtWUVY4MjBCRWxsZVhIaytFeFVqbjY0UU1u?=
 =?utf-8?B?Z2FGeWZHQ01zOXFLdW0xdWZYS1g3cjNTTVBiZnRaVWZIclY2d2ExNThYM2E5?=
 =?utf-8?B?VklaUjFuOTNScXFDVll3a1dHL01rK1dVWWFERFBlK2R6VFhrblBhR25qRk4z?=
 =?utf-8?B?WnVhM2cwR2dXcXVGUEU2R094YWZDRWFVN1NxS0hhR01VV3VpQVQxNmZ6d3kw?=
 =?utf-8?B?ZFY0Wlp2VFVCeVVZbVRhZStrT1J6QkxHTm96cWtNNjF0TUlpU29uYlQrRm9J?=
 =?utf-8?B?TG53eTRZTHBoWSs3bE15K0tTUFhkRGlsTnQxTEgvdktWRHhIMEFqaksrOW5w?=
 =?utf-8?B?Q3dZbEprNVJLWXVvdm1CVTNpcW1VdHZlWDJwS2VQZ3FjYWpXakpsek5TcTBz?=
 =?utf-8?B?ZjZZOEVGZkZhSkhCWjc1THNScWVDMnllMHRIUHN0bWgySVI0ZGZwRFllcHNW?=
 =?utf-8?B?NE5laUZDTHN2VWhUbHhXRWNXNy9hYmlRY3FmTmN0NUY0RkEwcFoxT2dIZEpD?=
 =?utf-8?B?YjEwL3MvNktWWFE2UDBoRFFMRkhmQWdoMzBrQTJZdDlDN3g0YXA5dzZPaEdB?=
 =?utf-8?B?Y2tMeU1MenN4TDJ2bzh3eGU4UzZHMHJKeFFMYzJHWm8yV25hQktEb2pZZGhl?=
 =?utf-8?B?ME1ianBPTlh2dHUzb2M3RUVOY2FUd3RpSzVRb2UrREk3bnRrTlZtUWZmODdM?=
 =?utf-8?B?Z2hXSXZrbFZEdUZpZWVmcnVtVFRHMmo1VjhJK1RHWGp1WmFXV24wSmpYYUth?=
 =?utf-8?B?UlFuR1FvcGIxN2ttY0dMUUlZVjdjRm9aQTlsMjFxVVBjV0E3dEc5MHJEUWJF?=
 =?utf-8?B?a2x2clZuVGJuaVh2VW5yNWR3bkg5VXFYNzhnb2NBSnRPUHNRekVvd3pKZUI1?=
 =?utf-8?B?V3k4UnkxcTlGYzk3RitjdmpSRjVuQitrWkFCVm56Nk5uRGNwcDFYamNhZy9a?=
 =?utf-8?Q?vBZ3MWewe3H+eRVWgamGXq1ungvxijW6x2Yma?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb20298-448a-45d3-300c-08df3abd72c2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 21:49:05.9335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vF5E0wK2zavpZzZLUMU6X6Pz8AmRJjvnChwNAodVTEIKFmfiatIWtfnhjvyy8S99BJBQKGvLKcsV/bn+LNZ8JqEjQSyJB3zLoJSRqasuji+o88o2P8sFL4enJGFXjPX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7068

From: Frank Li <Frank.Li@nxp.com>


On Thu, 22 Oct 2026 16:09:32 +0200, Ernest Van Hoecke wrote:
> Several Toradex modules assign one UART to firmware running on their
> Cortex-M core: Verdin UART_4 on Verdin iMX8M Mini, Verdin iMX8M Plus
> and Verdin iMX95, Aquila UART_4 on Aquila iMX95 and SER0 on Toradex
> SMARC iMX95. The overlays reserving it only differ in the UART
> instance.
> 
> Label that UART uart_mcu in each module device tree and share one
> overlay, imx-tdx-uart-mcu.dtso, which reserves the labelled UART. The
> merged Verdin iMX8M Mini overlay becomes the shared one, and the
> combined Verdin iMX8M Mini DTB keeps its name. NXP's imx9-mqs.dtso
> uses the same pattern with its mqs1_conflict_dev board label.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: freescale: imx8mm-verdin: Share the UART_4 MCU overlay
      commit: 7f34bc93e53d8da8da41036c559a939742a11a98
[2/5] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 UART_4 overlay
      commit: 5ecd302cce02d37c16fa07b046931704fafcfae8
[3/5] arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
      commit: caae7ffe2eef7cc8ab18645a80f6475f95949c54
[4/5] arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
      commit: 47538caef980a833bebe531e066bb15586d61a52
[5/5] arm64: dts: freescale: imx95-toradex-smarc: Add Cortex-M7 SER0 overlay
      commit: 728250c1f81a6065d3313116ede752269cbc8d00

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
