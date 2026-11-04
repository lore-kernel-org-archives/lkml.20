Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793830006;
	b=i3D6rbfTPW4SZneYWPaMiZnfU0Lmk38DlWZvsibVcs9RnUmCxZ/mP+9RZONd+mJmhdCb
	 vqhQRtG3jSpUGnPLfW8tXMEir5pN09sAfC3yTmaIbpwHovBENGQSdcZ5qcH01l7annCwD
	 ndzHob0l3mGgGqdTaf5VguZu6O3G9pgCe0J7HORLCueFtcAN1DTSqLIretGEDnZoZEgt8
	 kGGqmR5tuN217Ic2TcvPCh15+3bpR8EI31FUj9v74codz+pC7jJq/+0Rb04PGWZGbUB/S
	 unqVAJtu20BkUvoXfTtbJRD2sGAtvNi6PdgUS64ZZ0p7xJ0icCzBgWl8gjOJFk6NKtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830006;
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
	bh=FfK+EaLlfdX1tscNQzDj2eCu9z9s7fCeCB8RqVMbzfc=;
	b=wE8ELqFPmOCOev9P9pARc2C/cio6H3Z8j49bH0M3wBgIuOGCbNd1+Wc9PyI0OBqUR9/Q
	 HMddRdWTDuP1j48eQqBU+/2ZemThWfbq4RxIBEzPAV7Bu1iR7ntG7Eh5ngORqhEyN4QpS
	 fV7Jrzw+4bRoN5AHIV46D5cyYZmA0SC351KRyzCwdIEzP9zggHOPvTCtpT36lxSt4IBq4
	 TSVTelQp1lHZBjzxWWiIPN/3P/lt5KOfLBBMg9KXRSu6F+vMsiTXsXYsyZKr/+7b9XUPv
	 /ZaNQnY6zXgacHtHiFhXDMRBzebD7VRSKxBE6ufJ8+EoWukbdtsmvbF6fkAqv+6SfyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cIGtOA+H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.42
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010042.outbound.protection.outlook.com [52.101.84.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53712606D824;
	Wed,  4 Nov 2026 22:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53712606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cIGtOA+H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+4Re47ci36M3yJAhubapE3o1UeK09P8hrdqKS8ou9udAjDdNfnJ+kOqI4c3WVyHwCffvdjTxgHH+O/zrSOrpUjqq8toSOAG9nQD20j4S+/LLuw7KOv5e6wc1CRBdSY/fDFWfigGaexraT2qzVZaNnRc3SUgU2MUVTt2FIG/PIGFLGGuIEmUapE48MnQD9G3ULUcXcVZcrkJGUG8tqnspgVjgPv/CGceVXZDZFv7ZuhDuMgyolNFZElqy38AwhDg7vQJRmtAMLovhMsd+69ltib5HS19elSfUk2tGua5lCbr+nldvWw2TSPJ/od7Q5BQjeEBcw9diRSNqxozB9AYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfK+EaLlfdX1tscNQzDj2eCu9z9s7fCeCB8RqVMbzfc=;
 b=RQ3crpEn0TAABzJ83Ny0i7Dxn1t1uj1+tn2d7X3+Jew1ihJ0AMuuHlct/wY8qmIGwSRCZYFNhHHrAS9EqmVEa+AWj35aXuYNOU/DRFMwabHHjhPvvtpPP41nBdyr/8oiwjutHBbwW5FXRAt1Inc2tcG1FB0+v7f8XYSoK/R0k7hSPXFYZQVlFFNyvCMAybCMQE3rqR6yNWlXSpcbraDyJmR+kXMUyaTFPo/XrxO5ZhbQx72dV4S8b9VR8xanuamw4GbkhNLBkF8pwyjBe9nm86/OXz3lPaBNaQSzRaKpXW9nHLyx5+mIbZblL2Y2uUj3vuGaDHziVy6/FPHamPDIJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfK+EaLlfdX1tscNQzDj2eCu9z9s7fCeCB8RqVMbzfc=;
 b=cIGtOA+HN7I4HmT0Oupd6YTTK5L6qG2YSScSlpjxSZLLBvGYFbMq0EW+y11rmeeeIWBtx6eYsgFiGfFsYi80o5Y7CSXBVhHecMRNvThmKcW2YlZeeeCf2Trhmj5fk1i5haCK4cgsKtOaRP73VV4kgYrui4g0PvDIyjsxvBNnVMlLIZpCMsDZVH2I6CjT5spGZyokEYJvsWcuGthkudeEcKkht3wovu7a4sO3ptTagDoEYqeOP1cXavvuISO+542OVWMQ30Oy/K/cOXa+sGVCJ9DjrzQN7Csa8esND0PFy1bEVyqNbV6Cli0lRr9PBAPgeXD2ClIDvGkPOfLnJqI8UQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10776.eurprd04.prod.outlook.com (2603:10a6:150:20b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 22:06:41 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 22:06:41 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kaszubski <sympthicode@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
Date: Wed,  4 Nov 2026 17:06:32 -0500
Message-ID: <179382998972.3912318.16272070383640645687.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021150403.71569-1-sympthicode@gmail.com>
References: <20261021150403.71569-1-sympthicode@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::6)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10776:EE_
X-MS-Office365-Filtering-Correlation-Id: 6611ccc4-562e-462f-5419-08df3abfe799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|22082099003|10067099003|18002099003|11063799006|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Z8vvNaByXuyZbOsZWVegO68U7PSBpqp1U3GMcmpYwmgwuHxaoJSh0zyMci5urVCGIGlt8nKi0SA0EB9FvI+honB4KckMaAZh3wErLwkhzd88FO4Ts9XwKSlWfni7ONY3veLB/c/xWyUVmJ6sZC8peIUAD/+61qJ4DaeDyhh2deeAXxPkWc99gkflCsFOlUe8rgWqYhtz56PkEeVeSURr0Dxmloce2CeR8XW9zPT473Njic4U/Q2qtQgtdPdYkwTW0OhUeuyrDxeS427ADT5R4g2zta0rXsH0S7gluE8Ma9C+QKtsZ676xTMqMbprPm42QDbJXqwxbFHQdAqkWYT/KvVbxHcLb3Yl+JbF2i1z+Yv5yNOQr/bhVRw3Gvf2pO3jWKi4Rtuur5YrmE2RGnKHhbi3D8fosjfK2Zmd9iyL+VOtLj3Fg/hvm5anNLb6tqPW3+jreakxu/+Khr96wO/EIuZKbOwc8jHhaYOpyRx43X8fiv32VFv8Aam53Aj6LA+zeplCRfVCpg708EAbJ4gl1sEaS6xAFy94EAn1ABkcDNBYx49LRaCSvLSe8XK70a0oMIYu4n8I1E3Mp4AZ3gWi902FEpNmtKeqXoJqhYXv0AEe8ahxSUZ+oFHKf56zHlF/FQXAp6QDhRfDH35SOMheS4PrfgodujE4L3OaC3CPOQ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(22082099003)(10067099003)(18002099003)(11063799006)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXIyWUUxNjQ1cFZaVEJobDRjS1dxVDFvU1FvQldXY2xWTTdZREQ3eFZnK1pi?=
 =?utf-8?B?SVQ2cWZmOXZUbEljMno3blRtNHVQNmlWUVc4d21xOG9RbWpWNEVqVFc2K2hu?=
 =?utf-8?B?TzJpbkdIeEs1eS9xR2luTHNNUlE0L2orSk0zSUJUUUYwMmxMYUFpVC9FNUZH?=
 =?utf-8?B?eEZiNmF4KzBsWGViQytJaGhoeSt2U3RCM3l2YkVkTHNoN0VWT2I2TitSM1dL?=
 =?utf-8?B?bXBROHVVUWVJL2pKQVhLdnF5WHFlVjd4YzJwSEVrNWNnZkZxdW5ERGk4NDlm?=
 =?utf-8?B?dm5KQlJVSkRnUXZLY0VtV0VNVFkyMlJMQUtiZFFFa1RLUW9kMFRudXNOVWth?=
 =?utf-8?B?Q0RZaWFDTTBwYXBNa0lUTUxOaHlOc0ljUmZGU3RmT0hpODdBU0xSUVNYdld5?=
 =?utf-8?B?aHZlVjdQYXRRdHRPUVl2L0dyZVlweXBRRDFyeCttbU1XUHNJQjl0alZ6RlpZ?=
 =?utf-8?B?U2NHZEFUejhtM3ZhWXFEMjY0SU5UaXJkcjBLQWNnS3l4Z2tIaWRMYVYzK2oy?=
 =?utf-8?B?T3NKVTJ3T2hlRGdXdDR3bVBxVDQyZkFTTURhNWNkL2JlODliZW9xaUJaZkc3?=
 =?utf-8?B?REhnNDU5Y2Zvd3gzTG5MTjM1VUhSRnQ1cndNZVRnOTRQUUR3MlIzdnFzbVVS?=
 =?utf-8?B?NVJ6ZndaaDlyNUgwMFdEZEFTd21GSHp1OEc0T3h3ZW9Ga2pXaCtpUGtxczlL?=
 =?utf-8?B?eUFWc1FjR2NPR1FSbUI5dHhRYXBKTmVRWUpYai9GQlZvUnBoTk1CbXBDT1FS?=
 =?utf-8?B?S0NvMDB4akRhWWo5TWxheXRjSlhvbFJqUWJNWk5aZTN4WGFJeVVWeVFDVFQ5?=
 =?utf-8?B?RWRjQnhsMk5mOHFYRTNxUmZrL2FuL3V1MGNRK1BoQkMxT0hkZnpZOVFhOXRP?=
 =?utf-8?B?MXk2Vml6aExsYlozRW5XcFNZY0NuNVRFSnNaRUhMSGxxVUZwL1l2TmVpdmxV?=
 =?utf-8?B?QjlranZUMjFxNTIvMHZzL1VpWTlURk8yajV4T1I4cUJvanNXUC9Dd1FwN0l4?=
 =?utf-8?B?UEp3cXh5YXFFSThhVjhlbTJncW5xeDJibTQ0OE85S2M5dnUvMGYwVDJ3UTlr?=
 =?utf-8?B?Sm0wc2xNMFMyY0Y2NmdsUjdLb1ljV2lHRmRRalN3UWk4YTgvcmdSNUFvK2Vp?=
 =?utf-8?B?bmdqL3hkTGpuSllaTWYwSEVqZmt3aWJjKzU4NldURjBkclN1VzB1ZFRHRzFG?=
 =?utf-8?B?Rm9YdTJXSHlURGlabFJyQlVNL1dpNUZZN1BFUUdZeUNPUitNMnAwa2tzbERr?=
 =?utf-8?B?dHpLc3YzdHpDY093NWFjYnRnY1VOMU1uUndnVnoxNGFNTFl3KzU0azdGb2Na?=
 =?utf-8?B?QUFOWkJKYlRCVXVGdHByTys0OUFJL0tZYzZxdWhqU3dFRmpXcWhNeEplNDBw?=
 =?utf-8?B?QUx6OEtnbTdGd24yb0dHdmZzaFF5M2VtRmFBMGxXaEtvR1dld3JTQWlaa09v?=
 =?utf-8?B?QUsrUFd3eEJpNVZDUStITHVpT0t3UmRhc0sxSzVZcjJlKzlFNXFPc1J2VHN2?=
 =?utf-8?B?dHp0Y05MSDJsdmY4bGJwLzNoN1dYS2o4WXlHclZoUmR0VzdiMzA3NnhZQmtX?=
 =?utf-8?B?Vy84WmJGbGJ4ZHhOUm42ZmdFTEdBMHJwK1JkUjFHK0RpUktrQlI2dExjZmht?=
 =?utf-8?B?am1Wa09IY0lPSEJmVXFtRG5zZ09lUXBRZHdBd3JJOTdib3pzLzhFb25VdW1V?=
 =?utf-8?B?S0s4MWo0SExnUklHbGVUaDJ2dXVNRHJUS05rbnlDcVg4dXEvMTRpaFRraFNE?=
 =?utf-8?B?VThmUS9HbHdndGI4RWtxYXI4UUVBVExWTk1sTWl6cktDdGVPZFpsdjdsb3dk?=
 =?utf-8?B?M1ZWY21YRVE5WU56ZlVyVWNvVU5sVmRxeW9QSGVRYWtxTjRyZUJvbEdtbHg4?=
 =?utf-8?B?b01FUk9iWTVpbzhmUlJCVTY2NUZIZG8vTEFpZWY5enVGZi9YdmdGNkdFeXFa?=
 =?utf-8?B?OWpyWUpaMlNQSER6dEhZU0tWMU9RVXRBeHhjb25BVks2Z1YramZPTmhOVXEz?=
 =?utf-8?B?cEZQR3g4cE95QXl0VjBqNkZiNVo2ZVYvTVN4SDgraXVPcnZ0SE13NjZOdGRu?=
 =?utf-8?B?SjVrTFVYMUlvbGJ5ZHRhN2xLWTRUclhQYlFjK0JCSHZKZVB6aUpMMWNqTTdR?=
 =?utf-8?B?NlpiWHZRTWJzMGRCbjBLZFZpWXVhSXFESnJyS2R2TlBnU2FyU25nRUZoWTBa?=
 =?utf-8?B?cGxFa2dubDFBMkVzcHlLRitOWTdJelA4T1VQalBxbGhEZTEvRUlzL2VvbzFR?=
 =?utf-8?B?YlpBUFZYN3JySWp5QXhZOVRvbDAvM3o1bmJKL3JYL2dQS0xpeEdHcGZTaitV?=
 =?utf-8?B?YUxJaE1yTVVhalFCb1QrMjYyVEdib0p3bk9QZWNhSnRzaUNjTTZCY1RzMm9h?=
 =?utf-8?Q?vBnGG6hXNLgicKkKn7DGJz+lbLXQuCzbXkmbd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6611ccc4-562e-462f-5419-08df3abfe799
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 22:06:40.9299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsCHaIAdspylxRKZjR9A1mVW00T+yS6Txmf9I2drKFlIsicy61bvSUhx1Xt89awnxNL2EiJJrh4AGIVyaVKkhWHDovkohfBOhk5qmHkkl9mw7rSCyeHRmfwkuAPJgliS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10776

From: Frank Li <Frank.Li@nxp.com>


On Wed, 21 Oct 2026 17:03:31 +0200, Krzysztof Kaszubski wrote:
> Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
> node to the i.MX 7ULP device tree.
> 
> TPM6 is located in the Application Domain (Cortex-A7) at base
> address 0x40a10000. This enables PWM and timer support for
> peripherals connected to this domain, such as display backlight
> controllers.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
      commit: d00ea6ec73f6288cc05dcd9b66d35b078c2149b1

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
