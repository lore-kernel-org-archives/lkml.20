Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792504564;
	b=v/eN4hsBfR42+y0h0nUYPGJOKbg3wylMI10AQhwJp98Wn2uuZ3N3uhrecTRz+wKpGQD/
	 l92xgw0uBqKmw6kBRwe3VL3apbmXBurhGBip8s7zCOwGNJm8EIjhcUi7CNpszohfZYjir
	 1weJCljZO8G1G/yrnLdKqkpzhNvWXaE/m/WniSgkDF8Vm9GA0LvK6OP9UEUJuA4DjN/1Q
	 98HO4fNBzPcmTWdcO4w4N8kW2A0uOYR1EtfwM2HDRgWIDHq5ilCRvHghse3Uz6QZJ0JqN
	 ALpjbCAYPSa/C8CsYbz/j5RGh9VP6//geXSDGnwre3mKuu3amrLScji+XNV91jCMhrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504564;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
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
	bh=qY0lEKaO/F2RWst0s3IPh6QlZQo84SuQmxtDo0LHH1s=;
	b=0xUkm2IcoTnJkBZ/yRWIb4b2eTBpoNF/SEON00MMe2bFVQSkWpIzanIHy/EHWXJEzrFW
	 XySKGkgDwMhFEeaB7PedLaK2kzYZERcXIIjDnssOBzNJJ8Hpxyx9pGXSI+G9hgt7WCCZv
	 VSLkWyESowaAPcZ9TdI1Qf1m9nsfA+sdYz8aJN/zUDmnFHBoSw2EwAE5e7JbQpdLjqu8+
	 wnoz1BvBwO5PVRkAs/4V8xmI2hoek20sUAN1/5E1tD6oofQDwTLbfuWXA28kWm8DeWaKq
	 CC7HkEDvs15Gp1+G66b6xumnyCN0r7ST+9wP5UeIkGBUv1jkCJLE5nqlqg7xwvQi9Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Rw46x5Zy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.10
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011010.outbound.protection.outlook.com [52.101.62.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7854C606A31B;
	Tue, 20 Oct 2026 13:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7854C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Rw46x5Zy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNDyuW8j2bSNG/PddM0bpz1jOx4fePwmXnid4PG9+ghXJUEYik8xZc4zGWCXE8AxkxLwEEJ9yp1fRs0GxK0R6lsyiQJW7lpRNhaQjd/oCOMthJaOfWiTsCIhSA0MMRet8WlZ3DBM9m65fglKPQZgVlvIBiGZ3gAiDbG/2oW+itNruo8nH8ox/YAd/0WDMW6V2D0D6G7thrTjXl9j3Ysn2+TPHTfxXzujFZhyHdmApTjaa999MwbGNMwkt+e7a+4ZeQa0aqW0xU3ahNeUVkSWVzj6CN5pZvQ+HQC8rOSqSXETEOOhEsk29fJeWD4NGEd2zx3SDdHzdhv5+MCCEejbuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qY0lEKaO/F2RWst0s3IPh6QlZQo84SuQmxtDo0LHH1s=;
 b=SykIV2tOuSrGwTKkiA4hOrHsBvCEG4JDa+OqdEyu8pHmVwrb4AuX6I2TRs03P4bV2r2nNkZ9CgUHvbEBGKka1MQ6DUlGikW3JpLI05gEnSbkQxAs61aq/1yQ1XS6+hxU1VyBFHHyZh6qAa522/ODWUMqeDlzeyGW9eyqalb+XCcqsdernKZ+1VcKp8n9WQOhenFM4c7oPjRkuOALFmijVfXRioEx+87igGSE3QgxbrlPfVPRh68USwzccQnbp2gp3hcaEEqqIqD62NulwFnfGFmSvlNkJKBCMYhHtwCRS6uKrF+RClw9+u/djssNv5hXvBUoNoquhiYxxKJGzcaZTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qY0lEKaO/F2RWst0s3IPh6QlZQo84SuQmxtDo0LHH1s=;
 b=Rw46x5ZyW+jB/E1QlWHztMi6Xdx93j1yo6COJ4IvVyx8syWLo4ZdCghyrIOP3fhmcXQzFXx8DUYTW8obinox9w8GqjRt4WG6uUR2azROFMAX3ogCOOaqkFoi8KtrEizmDd2h/UB1MCQIzXfV9jyxV2B7SoXuEuvOwTpsUVv9f+8x4NOQXNC54/V3NamVCcwz3KAoDX9kPSyHfgfE6q+s9/cM+DnjZsqFj8bueDRNxOB5R7UdWK+r5ILCJ3RlVlbCvzVeZ953EhlxGpS1dxrTTj0qvFCJHRfCWv7XrIaCwHntRJlguIB07qt2rV8L0L5kNyfxnBXoT+qWvS0xvo/J4w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by PH8PR12MB6866.namprd12.prod.outlook.com (2603:10b6:510:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 13:53:48 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 13:53:48 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Corey Minyard <corey@minyard.net>
Cc: Donald Shannon <donalds@nvidia.com>,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH 11/11] ipmi: Add NVIDIA LSTP IPMI BMC driver
Date: Tue, 20 Oct 2026 16:53:43 +0300
Message-ID: <20261020135342.2963044-3-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atIYDWk8CNlWOUZk@mail.minyard.net>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-11-aambrozewicz@nvidia.com> <as1MyFx8Ih_I9BGX@mail.minyard.net> <20261016081917.1958681-2-aambrozewicz@nvidia.com> <atIYDWk8CNlWOUZk@mail.minyard.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TLZP290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::10) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|PH8PR12MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8aced4-e35a-4fc5-a824-08df2eb19084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|3023799007|4143699003|5023799004|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9Kl1XHF+QfvMLGvQXJXYPehPVoIb7XRG5YVC09mQrG8LavhnnTwsFBbfTOQQ2GUo40VeUwL3sUo7aEw3aoH9YGtnfH/mRj6rp0AazWuOlxA4LN096AdyUZwNagloElCv6TtCji56CuAGcEd79KZQVFYZLCtqpjFgaf37DaTctIvlcfmocpbH9N9iDIyP0CrnWEYjkgPtv379CAc5aE2IB39Rmvi8mWMlmOme+E5T/RHM6F6JfGDqly0W6+Rr097svGA6zJE9Iv69C4o2yjVk0IC1Dnh86+jJnP6r2gXeDLn477wCm7nfJ+7VbENv4qCIQx5nBOH89UQg9vh8SyRKCyrvAIozmpDAIIzhFWs5MJLFB5Kc7WiOETjHFn/EJok9w9VOpr2ueWVSfSGRiNGQLPVMN4CY51Oj7TBa8NmuYbA/hdG0SLOHz7E+M3Z6j7TWxrMfZLOcDOT2i5ChknVArwq8AioGaWIK/anko7SbgjbM3zR6dAXRnvXhQ/dC1c5p6lKa+BGLPyAdWjMl+20FEwQRxhgldrBgCmZX1HWyFVi/BZPaFoq8J/DqYm4/42KsgtEVHYZpx6YChuvY5uLbumPZ2be6NioIvu8OLLe7sl1BukTUBJksKsOPHnoSiEjfHBv73iThIi4m/vHG5/nntEazN8lhSyQMUOZ/AjpGfMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(3023799007)(4143699003)(5023799004)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rKBVUDtec/EYcpqPro8yJfzgYPzT1pUveaVz5KeNAJwbTJ8uTCNioTlVfFcJ?=
 =?us-ascii?Q?bFg4+K6GilwHOsXX90KjstHhtwHIgpTcQhBhllO4h+D8ZkkXIdkplcj9rX60?=
 =?us-ascii?Q?F9/ylRR2cfnMGZQ9h2FUthiXShBZCeakFJx1bj74Bz67woodE0qqx0nwfFKL?=
 =?us-ascii?Q?ecwlVbEYtkCAUEfYOEjpjLlYSrMkg3pSGShaUKWPvF5yIp3RcUQR8yEIHykD?=
 =?us-ascii?Q?MVPVv8TWbrcbarO7M76bJPlYNm+juw4Hl5rypsrBoX7j0MuYPJmsZWnEFaIW?=
 =?us-ascii?Q?Cbyeh1vhCDu//tvMEMtOo/WjYkB521TfYEZ1eKg2mc4ylidE4WNMzgqIekyn?=
 =?us-ascii?Q?CfhJibwRQWEcymbxI4+32MDO4VEBRTRJu0mCZEYyfO6yKhDAs03BVcj4vnsB?=
 =?us-ascii?Q?/fPzggrMWBqc0xgapymqqA18rvPavRsEmHyuf/uH+A/7T6SKC7Ili8t/Kp4H?=
 =?us-ascii?Q?NtPoyK4noQR3OWU8stn5gOTIhn0+EoH/UmcriU5YlpWOFuboAmzCHMiiqelL?=
 =?us-ascii?Q?LmDmEYE/PYVmHaatEjPpFzEsI2M31i6b2kGCxHyPIl2bDj3VHWaOTKZ6WDtc?=
 =?us-ascii?Q?0Du1x5/WSsi5gTjzBAykf7pnda9NtiEM0fVj1n64JEf0HYPnh+MOBdJLKT5g?=
 =?us-ascii?Q?nCzYM3MclN48+LSlPJJVqbRwS8C4byGoxrihvE/tye6Gyi8MiKrEuZRbmnwg?=
 =?us-ascii?Q?9hVY/Ll1npq0PEL4mAXhoU6YXVIHOtLiBrUDRxct4BaHBTOn1ve8G/lV+ENQ?=
 =?us-ascii?Q?D4xna7xvVdQFUIYtAFpC5LV7nU+oGG3BWLl/1rAb815Svt948+yrnrkOmaxy?=
 =?us-ascii?Q?3UUQrpL/LLc3dtxmnWGZN6DUXbsFv8sAKJXRS/2qaefM3GWoJVeVhBBK+tGc?=
 =?us-ascii?Q?fa/AAH4dzdhuZS73mLqwE//1Wn+HoMTst8ErBMZcWqpYcu3bQWqFzkyrrmOY?=
 =?us-ascii?Q?qYUCFilXFf6q9jTrf4zl2+esmKgyXn/LDyeHyGnpqGlBRJQGSaqtFpfq8N3k?=
 =?us-ascii?Q?MW5/aqejqHMIXrRGAdjOs4AjfArtVASw07ukMps6c3xaMyLhvTbFei+icC4O?=
 =?us-ascii?Q?GsEX7SlsPa98Cq8sagd6AMZvrNLG5s9n6PIitr89s12Q/9I31pHVV0OFWGwP?=
 =?us-ascii?Q?pYwWO7Zq5mH+OT1L0b+2fSAms4gH3FihfSVtvK1d6rmPUDrXY5JNtYhyM55O?=
 =?us-ascii?Q?IogVCMdJdSjeeom3owI3Q+Jp12BRFBBMctTN/huxgCuItgHGV+psxzB0fP8c?=
 =?us-ascii?Q?S0FYgGMrbmcnVwfMNOsyqiH4MIOIMSyshum1w36npVQA+D7WsSlkikATwoJ1?=
 =?us-ascii?Q?Vwhs0GXCjrWEu5+FZYoNO9PaMAewNTWqddJ2oHYmKZf3v/YY9hSSmAHj9OuX?=
 =?us-ascii?Q?ThPgx38KlwgYEm/2kNq5KBTw/NaSjkRxs5nkYEeJ7C2+mqIyi+AngRxKZ/f3?=
 =?us-ascii?Q?qKzP55YYD2CLpzURDeBA0CCy/P/XwriRSPL1jBqB+jcTio52rMBnyS97l9Ti?=
 =?us-ascii?Q?07197hvScPbG2xPLJlEpopTwrX3pd+cGhvsGpciC7YTmqGMv7KdBBf8veTxj?=
 =?us-ascii?Q?QQOcRoXxBlIIWmihez5NLTvCEu7wmgTZHD5+qexm9Zxk3C/YZkJVFnRRHKtL?=
 =?us-ascii?Q?lRxzq3AVz82RlLxTmFaGPa5C8NFJSJP8ry9SJNZrAoSnUbexRTgJjCY1p87g?=
 =?us-ascii?Q?g0IcrzqB2smNf/pVlnHqLpKWZDPG8MoYFbfB0SVGMXAsZ9g4fn/qSFHlhMpU?=
 =?us-ascii?Q?2+yIHNhOyw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8aced4-e35a-4fc5-a824-08df2eb19084
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:53:47.9625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIorSRLUq/FNuALogTkx0ov9YflObr23JhhYxiHqz/trHOjWhiQ6GGn2n8VbFv3O9qaY7z5PQMZuu8om/WwZRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6866

Hi Corey,

On Fri, Oct 16, 2026 at 07:26:53AM -0500, Corey Minyard wrote:
> Going a little higher level, I'm wondering if there is any advantage to
> having this in the kernel.  Since it's USB you could do this all in
> userland.  There's no kernel subsystem that this would tie in to.

It could end up in userspace, but there are reasons against it.

Existing BMC userspace is written against a BMC-side IPMI character
device. With CONFIG_USB_LSTP_IPMI_MSG_NUM disabled, read() and write()
use the ssif_bmc layout; in the next version I plan to make that the
default.

The IPMI channel shares one USB interface with the GPIO, I2C and other
channels. Those have kernel drivers, like other bridges, so userspace
stays the same when a board is redesigned. An interface is
bound to a kernel driver or to usbfs, not both, so the IPMI channel
cannot move to userspace alone. Even if it could, serializing access
and protocol state between kernel and userspace drivers would be
inefficient and hard.

Thanks,
Adrian
