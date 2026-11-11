Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794387044;
	b=Klosx5Kfvjvuh+Ij6BE0xS7fukxoTYvFSz/DCjYFIHykiVmx5YJH99RLo1AuOZ32yrHF
	 5rYSSegrAGjDT7J0rDPqONS1kms6sBNdq81j3hcXc5oTIR06OUPAZ40Zs0mEViCB0fzq6
	 Uw3Rkc4ReLbwxctPAMqHJvOFkPX9kG/WIbit7vjvPTEHcEUVdWkQEStVhj/E7FudDCpLB
	 vrdDzZnR9bPWo3SAEhUT7I0Sc3z1vfqXM1E4yBhQIyryYX/7H3YcVAM+Cmr8eF/eEjb0+
	 GPSwhgdQ1CC/yXDrHEu0GOLN9Qlxx8dKtqREhaysHQuKe/h8gdYExa0xC09PvJ9sSJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387044;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=86Xy7tOlMZQlOZmnjDzW/q09G8pEnwjBFLfG29MwE7Y=;
	b=Zpsr8qWuymncapglrJAG7AH7B671/AUWP1hVM3HEnmfTQe7DPSSBp7OZ9+1T3YR8uUoJ
	 ozipcrKA50V2UZMSpD8rlGNS/XTwxH2x7PN45zo3xbuXcM5t05mZ/rNmt0FYx7gigvq5c
	 kwOfYijJoxPBSq72TNCp9lHjbPVbWxKFWhLaePmK5paqLdqYw00Z4yUmdaDPFy6YkGKY6
	 at7XreTVafyWuGV/WfnGMqs+eZPpVjMWbHHzkg7MyrIQx7Q8oktEhfbScn37W5gk/ky0j
	 u2p5EoY82k6Syo+skDwq6t7DYrNLgZeTd/AP22iKSZVO8dB8GCzRaFC6q7CcskB8ZlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AI3F8vqM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.33
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF6A606A32E;
	Wed, 11 Nov 2026 08:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF6A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AI3F8vqM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcJ5VHulTyweJxn4FbO96IQCfjm6d1/7Rt03UXSDIhdVIT2JasHIicheIS/B9/rLzCXn6vsTIhwMv/ompSO86wCgTkvB0MkEFfqtI9ZBTiU3EmcxINtady2CVi5nBS98WGR8qHxG3u3/U/f1zkYv69ib3gNpZz7DYYOcKpvrfM+CaLG9kfMLbuT+7kwAa6CujACYpOOYsaNRh6tLtvrJZDRZLo1Gjk5VLmGO+60Tby0HYTBwL35ZH9FkTvnwjMhIh4PJeY3JI9scNWAXhL30hx96mx3sCDu9Sn4LqL0SusB9GcbODj6KyKdf7vTr47sANIkd9QfK9yTmmEOyGCwGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86Xy7tOlMZQlOZmnjDzW/q09G8pEnwjBFLfG29MwE7Y=;
 b=NwlcnzyUYoLDrnpMhD7fcBiNOLhv5y1/BwpTwrspq2tUym6dYPMR8/W37KWeIvdEbt3jlcJ+feaq0pkuZsKjCe3PUee/CZnEnuuR/gT4knJQGxtUtONTr8cWf0TrOi6MqVM4XvYYb9yfYOPfHwamb+Rcsl2qnSgSzBn4K3sFIdMTm7L99tQmw58KN8gTXr2PDfqtlSuuUrFyteEGKLSb/c1RjEcN2CjkRL/YGPyMDk/tNkgB1oPZfoUPdZ7bZ6vvmeYM52pokHnx/2whiFtbH/QyiBnr8UNOPhmN8Kg83YqsOe4TPqR0r4A0YmtCfA0GHrs25vqGT/qulaF95Bi1AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86Xy7tOlMZQlOZmnjDzW/q09G8pEnwjBFLfG29MwE7Y=;
 b=AI3F8vqMCtMzmhtx77qzHfmwvp9lBGgX+hjT4LlUklPJP13O632KCCYU9bP0yOiNrBqypkw6/lbeBb/3dW/0cPxSqIX5FHFtyi4hFAma2gUi4IxS+RzfQX0JD0Eu84NU1AFy2IHX+TBxMO57noSpL/dbTR9yvoymyUy6DSP/2yslyYIWO1iG7bnBqjI9/DJFnqqDmWED1v9QEmPXJVc6sy/2ugNHFnspxePCGcxiIaIp/xEYCsL4D5IGgY6PwYUNUeSHUmblGsE20GNOaaHdJdNgvm6q33aqoaxz12gaDYbI/XzOU80O5DT+7jqcyuZgj6cUJEV3QUgSQHtq/LxbVQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by MI9PR04MB215858.eurprd04.prod.outlook.com (2603:10a6:290:ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 08:50:39 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0592.012; Wed, 11 Nov 2026
 08:50:39 +0000
Message-ID: <4ab5696e-dd7f-47bb-8025-4f9104c9d0ab@oss.nxp.com>
Date: Wed, 11 Nov 2026 10:54:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: freescale: Add device tree definition for
 Cloos CBASE with i.MX8MM
To: =?UTF-8?Q?=C5=81ukasz_Majewski?= <lukma@nabladev.com>,
 Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110150546.1535950-1-lukma@nabladev.com>
 <CAOMZO5D0Eq0FDJq00x1aitQe1HoSzXk+DEfMo2Qv=nJB=Njdkg@mail.gmail.com>
 <20261111092653.0df91d0d@wsk>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261111092653.0df91d0d@wsk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::9) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|MI9PR04MB215858:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ffe532-b29f-45e3-a455-08df3fd0dc91
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|23010399003|7416014|1800799024|22082099003|18002099003|261009223027099003|4143699003|11063799006|56012099006|10067099003|261026121527099003|261022113327099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	ohtv0IDFARRl4kU7kmK+PPd1lNj8t5zxIGupVFbA01U3d+na1U8jMFvADsvNxFFvCZmZmum4OPVS4u+kMwnNcFYfV1vgX41nC2BNlzJ1A4cJ0VxfrdgnBvDfV3fRkAq4LpvsrIvmadupn1Lr8Nv9A3jFRM6P7vyyX5dYD9jIx04c78RtjX3OPMFDRhMUzacJLa9GWCBMUkQ9Uq9Q4EiP49r17cl/SOYeyifutaoLYzlUWabfacHLMVqZiIFiHlNA/b+znp8oioTC2seOpUOG+2jHtwUxy6esU93HzZsEteTvvssM0WBnamS8WSQfV72XREzDEvSAUWNh7LouZR41i/MLckF34FiBrs/XnOvnLT1oVCpNpg7C3N9b7Iy/2qPppFec4z9NNA8nMa/AXTRSS6J46j43HWQLlPLiwjtqsUl/PUAfP/ENILuEVxbnhsyr/CNNtwJSuBv3plDnUr/EFCVIPyjcAyDBAouNetBg4vKZChvNpdw/Mnktpm02QjNi7uQhiWk1i3V6jHVBY3K5XZ4YVescuo5TDL6FkoBQWgiMU/s75zxtBWk9/mimwBr9cpwTDPaZhvlDdalAqTm8uo9ByPjTnKztdssiZMaelX0F+00BqewNT9RB+2kTgjYq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(23010399003)(7416014)(1800799024)(22082099003)(18002099003)(261009223027099003)(4143699003)(11063799006)(56012099006)(10067099003)(261026121527099003)(261022113327099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHh1UlJQZ1Zld21nZnNEd1lsR3hxNmYvRGJYdm5wNE9YQm0wTXRzUWsxZlZM?=
 =?utf-8?B?R3BhS2phSHc5OThWOCtsNmQrdCtPaHNmT254UWIvbHlqVHNXOVhJdURlVk40?=
 =?utf-8?B?cm9YMlZoL2NlRHNjdi9DZ3pkMU5zbzVuU0g1YlVwUVlzaElaUExDNXBIT2NZ?=
 =?utf-8?B?dGZ4ZXZuNDBJQ2Z6TTg3WURPaFEzRkVzN3pOYXA3UEVFRTJLVDRvMi9mV2My?=
 =?utf-8?B?QmtrOWxFQTJjekQzM040RUsraWdpdFhLbUNxYXBkNDJYa0RYQ1NwQUVpMGMx?=
 =?utf-8?B?QlRjckQ1TjNMc3pGMDRhS3o4dDY3UGo5bXVQNTlTbjMyem56L0ZYZXV0Umc0?=
 =?utf-8?B?bHZHNVUvbXZUQlZDblBoUk4yRjRCNGF3aFRPVnN5cGdQT0NYVEVMS1pyME1O?=
 =?utf-8?B?SlVTOHJLdDJTcWo2WjlEZ3RYUGlHT0JkRU5rakFXRjFzSWo1RVFVUzcwTFVv?=
 =?utf-8?B?UU1jOHpnenYwdEgyazlTUTZRem1xRDhYWXVaMU91MjluSGROdmVMTWdkZDhZ?=
 =?utf-8?B?MzNNZWVQbk1RMHhRamxSN1RWUXlwZWZGV1oxc09sR0hjdWtDcGF4WFVVMWxP?=
 =?utf-8?B?Lzh0L0N5aHk5THdWQi91VW9tdlZiSkJNd3QxMExySUZNM1g3VXFwUkRKbmQ2?=
 =?utf-8?B?aHpzMW5EaTc0UGthSHpJR1RUSWVlS0FYRG1Gd0REdDVaUFFZY1NUN3lyQzk2?=
 =?utf-8?B?STc3QTVVenhVTDQxWjJkM0pZT1FsdDk5Z08yQyt1VE9ySW54OVVQdElTS0Ir?=
 =?utf-8?B?dnlkenlqSGVSdWo1MXVxbE4vd1ZjbHNlZHlGNnF0Vjh2aWVVTW9PMHZaNkFu?=
 =?utf-8?B?bjJURGdkSGFQc3Z2UVgrN3pFRTFlRUVIMDlMM0paVW9Fc0E4dGVLT1JSbEJt?=
 =?utf-8?B?QjVkMi83YVNNemh5UEJnRWNkYmxTSUtXT0dtVVVYS2dQVGpMZEh3MmFObnJD?=
 =?utf-8?B?WGxmT3JrS1NDK0plRmw4UjdvdTNJYkpzSmhONTBLMWp0bm1DN1l3aDBZdVVC?=
 =?utf-8?B?Q3FYNEI2NHNIcEVaMkNRRmdJK1RVTHRpSHFMR3FRZUxIdTg1cGdVWndMQ09S?=
 =?utf-8?B?bC9hbm5IRUdWYmVYM1BnTWFodmlQbHFyakFYNmoyc2ozR3o1U0VRQzZheFpl?=
 =?utf-8?B?VW1jTWR2Vzk2c1l1ZXMxb0NBWmJxZWR2bEo5ZXhTK1ZkK2RobW9ITjFhc0NM?=
 =?utf-8?B?eGc4djdZbkNLNU5LMG9GeTZhdGlPaFROTjBGSUJUbDYzK3NhZjlCQm5NMlZv?=
 =?utf-8?B?ZlRCMmtSUk0xWTMvaUZiNXhSZ3hWOE9kWEZrbUNCTEtwTnlqcmxSZ1NuTXlM?=
 =?utf-8?B?VDBUZXpwNXVCVHdFaU1HdkpMQXVkRlBrdHZHTDhFVHREZE5nUGsvWXpSam5y?=
 =?utf-8?B?UmRKbFFmR3lvQ0ExUUpYMGlGWnB0a000aWxRU0dkK0I5YWZnejVOZ2hXenYv?=
 =?utf-8?B?ZWhWK09SbjZwcFh0bkJTWEZHYWdCU2pldGk4QTVzbHczWmJ5c3dsTFAybHhn?=
 =?utf-8?B?TXRFbWxEeEYxQ3NVd0liUCtaUmFtZXZnTXdZd0UxU2gxSGR3ajlpdEViNWxM?=
 =?utf-8?B?MWZvV0JCd0w1MStBcDhqMXdxR0NvMUIzdnpMUG5YTDl0ZVdVNWQwVHlWYUR3?=
 =?utf-8?B?SlArY2N4eDZHaEM3VWw5MGdEaFVNWC8vYmpJRzhJb2UyNHkrOTNsK2FsWGQ1?=
 =?utf-8?B?Vld5bFRmODFNaWp6TFEycy8zSmF2d0tOY0REZUluaVd0QlZRTldZeWRSOVNH?=
 =?utf-8?B?WkJRN1NWYlkrWkZrSU13SmVXMXd5cWpBT3d6YmFVazExSmZmUGhtTHdKeDQy?=
 =?utf-8?B?K09vRnRKa0cxZHlKL3ZSbGdmSVFndWU2NWhKaExvTFNnUzYrbjF6QXpreVlt?=
 =?utf-8?B?anJxN0RnZUk4VXptdkN6U0s3WTBRcWR1OWxCUnVWY2doWS9CamJhNXFURENE?=
 =?utf-8?B?NXBPYWJ3WnVBNTNtMENrd2ZtTzczbVBEUk80L3lic3V5K0ZtVUVybDVjTDVh?=
 =?utf-8?B?d2w4NVB1UTFHODlMVlVNeHhsUjh0dkFoU3FZYWpiZk52VE51eVJkNXlwMTZz?=
 =?utf-8?B?aU55RUg5ZXJadGRnM2h4T0psOHpER3grOFlxb0VZQ1dtWUpiUmtUd1Q1SzF4?=
 =?utf-8?B?ZzQwTVl1K2hvdUJuaXBoYVlYWHVvMTV4dTlURWM0anBDVktJYWw4akJoR3RM?=
 =?utf-8?B?QzZwNVZYMVRVdTltQ2hkSFJDR1VqVERHVEVYTGl2UWxaM2RJTVhzMFkrQ1o0?=
 =?utf-8?B?STBsWnptVWJYekt6ZHI4U3h1WGxnUU9uKzRQOFJDMm5SazdVRzJSZTlITjUz?=
 =?utf-8?B?ZTJUbDRZNmtYMkwxZU1la2FsWndPSFpHaE00SUNVbFo2RHVrZkIzZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ffe532-b29f-45e3-a455-08df3fd0dc91
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 08:50:39.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqUfW0YvmKFr7Qn2Qy7vbcQGDVHKeNvpLtL7mrmq2Hq08IjS9V27x1Yeqmkw/N+A7d2b0PsT/ZZ2mURIII/VHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB215858

On 11/11/26 10:26, Łukasz Majewski wrote:
> Hi Fabio,
> 
>> Hi Lukasz,
>>
>> On Tue, Nov 10, 2026 at 12:06 PM Lukasz Majewski <lukma@nabladev.com>
>> wrote:
>>>
>>> This commit adds support for CBASE board, which incorporates the
>>> TQMa8MQML module.
>>>
>>> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
>>> ---
>>>  .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 577
>>> ++++++++++++++++++  
>>
>> You also need to document the board in
>> Documentation/devicetree/bindings/arm/fsl.yaml
>>
> 
> I've sent a separate patch for it (the same as in PHG).

Hi Lukasz,

As I understand https://docs.kernel.org/devicetree/bindings/submitting-patches.html
the patches should be sent as a patchseries.


