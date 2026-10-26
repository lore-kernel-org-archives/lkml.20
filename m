Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793026449;
	b=uqS19/wv+nq0+FBmj4ju+wLcZQqOVIvRqPtMzmFK40jkcRkcdEZU47qgQW1v7vW0fJTW
	 xCM4fCGcN04O3m86556710ylC9KX7c2bPN6mokauvoo5kR0biX1nTapIHjTZIkyBSPq77
	 eVDQQRNfYJ+LjrVO6eTmbeZ0geQlm6WvVvag+2Hcea11eGRoDO2TQEfe8Yqu9Uv5lo05b
	 6fFhq1QqITKXNEITbs+wjzAC+Cd/xdH9xiwh5jkS5tf4R32a7p9ehkPeoB73D0LsZ78b1
	 GyhJrlT7wHPYnIg3A7XI2OpeI/yX4SU4QsL3yIk0xCx6Bv+69d8wLO9B/4IJ3FgbbHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026449;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=uB4hN/ju40U9NfHsoL2r3sOggHEF6GA4+yAwxRKbkbU=;
	b=4o85Ptw0EssNlXd0ZVYPveKodVkJKI5E6T/tVBxOu5HuvGi4I9ruSCjZJ3/rWQv/ozvl
	 abgEtrrbeVPt8kSojvW2FbRiQLpjqidPGN3Kh2V2DNFjr4058sIbYX9Q1xhYaIamjegEG
	 zsre8ixLT9AixJ9KIjaDKPmoLVZTypc8QCtCj1ZboDkTs3xDhRg6Ot7cT7ItwyT+vtAy6
	 C2T70ruPqc5AYcesyJWAIjcOKU0CbWOl46SmUbA9g+8DTWdeBnc+QKR/dZs+gQhnEQxKc
	 pzISX+tfRFaLQZZN3B6kepfpCczhPrklHDthzRLEJMVhKXgNrWtewU2MU5b7R8LLx+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TLjPVf0P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.55
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A9606A31B;
	Mon, 26 Oct 2026 14:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D6A9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TLjPVf0P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzxeUN2DExM3/qSC3mwcSRIbtQ+C5JtvY4/7k2A1ByZAFAeJOi34R2J1LOlJqmx1IN8GF2MOFX9LOW/EOmhKfOehzhy1/A0lHM85TIsonADlFMmti9JvqYA94XOyra8LqUqTh8wv19fagEUSQ/BtQ98Ew9yrqR7Bp//lXvk9qCMhKGSycTGx7bBv0osh+xDykNaPhzskoslIJoZpzieppyFOqqUepgRMD2/x6GgJQuSfnA+vZf8Tim8B3DwcEvavKr1fiy1P7aheH72THCdkb/Elz8EuA2JSeTpTmS4a2ssZK/hdplStl09PUc8sSr8VNMCwRKgn8aamurR6809wCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB4hN/ju40U9NfHsoL2r3sOggHEF6GA4+yAwxRKbkbU=;
 b=cskT5l5cf497yCDxQ0IQjwvwvYxMUpVqgNdJjA9jTBbIQ2RxfEwFj8SMXecT/ILq7+MOFOXUi0l1Rq2pljg/m5exdeO3fYDqGTGCAAxfXRn4h13C0mSmF1mTu8qW48tkphRKXgYZVa8DOBBIRfkfgM1y8rvS1MXmjdDUD0WnGOy4edN7AGwOk9zfcdglhaTMXr5LVgMrYBYlgDoLtsk10NDc87R5RRwNfjcwWjGlJiypyKy2MqaCfezXYvGozGEe0L4DOC6FVdneLuWZUGtqTroMLY3iC78klQgo40tKyPZwbAi9ZbA5/FfSb5Vz7vbfZGgBVz0kzegX/KK0ajLDdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB4hN/ju40U9NfHsoL2r3sOggHEF6GA4+yAwxRKbkbU=;
 b=TLjPVf0PpxDtUL3Dyf9Jv6A1QSCMBYoSjy6D/z/2vBPWn+DxmxP6t+M60RaeYRPCw7S0v5j0v0cHxv3mP9u7t46N6g6aayik1+fBzJq0M/UcmJLzT31yYfhQ5BTAqgeHuHiZ5XV7AoNiAXMH+PmI8TC/eLrkCMUjU/bcUerSJmDbea+mhNNQ6uYOh4Cw8aiiKHFD4QPkv9tsIyb0Ms4p57ql9Z6IrzKGDGWgf3kTvU+vczKl1PoSXVWM6PmaKUTLi0teme6VXG40dAl5t6ORCV0a+PuuEd7tDWwo1yM4QOtTf8Q6Y+udLszP7IvPy2aCjhv5jq99wNNQ/6tH1oTRqA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BR0PR04MB944139.eurprd04.prod.outlook.com (2603:10a6:2c8:46::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 14:54:05 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 14:54:05 +0000
Date: Mon, 26 Oct 2026 09:53:54 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Leonardo Costa <leoreis.costa@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com, marex@nabladev.com,
	stefano.r@variscite.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch
 Display 10.1" LVDS
Message-ID: <at9pgvFmDPI9oLrS@SMW015318>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-4-leoreis.costa@gmail.com>
 <ar6JnZp1jBvlc8bx@SMW015318>
 <20261002081824.GA7222@francesco-nb>
 <ar_bsQbD-IbvUf86@SMW015318>
 <20261005075319.GA7692@francesco-nb>
 <ateZGwrFGfD1j-i3@lizhi-Precision-Tower-5810>
 <20261026111149.GA46946@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026111149.GA46946@francesco-nb>
X-ClientProxiedBy: PH0PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:510:5::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BR0PR04MB944139:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e39276-fe45-4035-0a9d-08df3370fb39
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|7416014|376014|261009223027099003|261021123027099003|261021121427099003|261021135927099003|261022105027099003|261022075727099003|10067099003|56012099006|3023799007|18002099003|22082099003|11063799006|4143699003|261026140227099002|261026121527099002;
X-Microsoft-Antispam-Message-Info:
	gOgpMVAe5yWTOQOP+4lJagxfmbkd+M/Azxy8E988FMRJkXoUrvlNpuAqQeG/rs5FbLuGCTlanEU02IlRwOQKbobEoMic+pxn5R0KvS58DGJOIBEGLigaGWpOBSCokTQH4T/PdDFW5CH1q0WGg8jXlX75nQqAXsS+wVbe8jt8NX/+jHhLPzm/902SFYNbQLzXBmWMulebH5D/M8e8oqUE/rn5lyQAhwwGo3ktSKaNyBwB4hP4XVZmnOJaLIojZV6zKoMaC2S90DjxdiTfR6mNgX/Mk6L2CXX4Ih3H9QvkXu3lNdfDggN3a2XpOU3Bs/WLV56lGTlGHERuTr9khjPPZULG6ep6R6lZKZzMVPP3hePdxh5txrWZxZGP6/GIqa7i2xvPfBfw520lli5SkBhPM3AMIElnneZseax7BoyHuRNlvAIONwnTlgbK/G2hvvH7kQQyKln60ipvF6ocm8dUUPcauw1Dga0mWECIaX8aaRDPIHysCRPCc1EYa2Fz4q3LWjGPRVSi65+utcmxE+LdCKp/N1puvLAEiwcGCK5fOGjZQ0q8OBoJVKIxN7PUtFm0G4hrCZTwmVTTv8KyqPDigRua2sHBjMZE9n1Ie5qjjp52FiE420hY/YPOnGa8JRsO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(7416014)(376014)(261009223027099003)(261021123027099003)(261021121427099003)(261021135927099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003)(261026140227099002)(261026121527099002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+E9KQusI5zDsyWKxC7KtAblRTJQczSaOgeAAGJ6ktoS++itv2MVdD81ku5/y?=
 =?us-ascii?Q?bk5SHMLPdmeNKdkHqv+zruCh9fQBZzqTXTDsK0bohkmA+VOfJ7ux0IKDEjhm?=
 =?us-ascii?Q?HFGi00vW3LH6FxiA9SCr7sjGBtI2SxiEIuT6oRZysySnbAyXcyhZTEBZ7/jp?=
 =?us-ascii?Q?krQhX5urfqjgU81UZCixlVG9y51tcO11oOL1U90sdeHC7VZtX+1+tP0kk9/x?=
 =?us-ascii?Q?aQGdccy7kEAqsHbSe0GLH2mmcVohqmU19SiiDvt9wCO8PCGG/1YY0OsJ5hZK?=
 =?us-ascii?Q?H1eTJ3+pJVmP0lcS4nnKvQfUZA1Vql6APtGkWAcIl2UNDZdMZssH9eNL7meF?=
 =?us-ascii?Q?cvcXl9YgHPqFRqJCINJBncQaf3ph00RoTH08gyxxFUjHOlsTR+Puk35/xMcG?=
 =?us-ascii?Q?F2e2nyltzs3u9T1X4F7rm20XTeMkh9pPYZ90j98NWxOPJqnYGXjvR55HiME9?=
 =?us-ascii?Q?3NPdIWJFRX6VFDWfqDDS/nRXHFvApax98DKFcLLn8prN33sDYV4B1Rey8nEi?=
 =?us-ascii?Q?FDTD5kUeYoIKaMYm9kmqAaaffuOlYHyKab8tgKzJ8MVkP7XY+vNVxvS6ga8y?=
 =?us-ascii?Q?Hdvw0rcpEnVjdehXW5W2SkEiaYW6ejjIQbH//xbZSTV5NzX+72wSsP5K3uCL?=
 =?us-ascii?Q?YVaiK+h3DqYb15VQVsAiNrFgJoed35inbyrbzgSXJbGaELykelmDcNG/xJoU?=
 =?us-ascii?Q?Tntopz9V/2ulNHhromOTz8eQrr7w6x0bmC/94Y16PVMqFiG2jIqr1fmlXo63?=
 =?us-ascii?Q?QKyrQNAFQv3c3XuN+OHbA0h4Z4cu+bhdJ+qPoU8TWXlPiVSxLj5a7lUIvBYE?=
 =?us-ascii?Q?3leD8+xPNYmqTpAQB8uRJwiWOQeJWKCSkBsXskHzY7hSued1E65PNoMtxSRp?=
 =?us-ascii?Q?4qLoyNCxh9zLEPTJi1dHzcXG8YTDblIUVN3S8YAfg6lNJxT93255LB8aI0TZ?=
 =?us-ascii?Q?aYvWxgsgK0CAHhhXwDnNH0EZYeyLRL7zTGy/S2V98flqr4AqMC/VHSYTk4bt?=
 =?us-ascii?Q?B81CM8+5QlewkBn+GTFusd6fPx5DycCi+hy4/02Ma7/XBmJ30ET4axHyScIv?=
 =?us-ascii?Q?ycvzWA7x6TWkJnCGbCud3FPMA3f1Es5HPIJWt0uw53CYDgZxg+csk6zD7Sy8?=
 =?us-ascii?Q?awEX6Dyj1YPXZFbBMaOY0LRHYqA1CZtQthNLgGt6wWmxxwvWfMDFpNo08exv?=
 =?us-ascii?Q?vOn6lUdu7GVfi8U7gDFI5upieE+dDA+7P8AlGHqtlCnaUDwmwEvFfecbU4Ys?=
 =?us-ascii?Q?vQ4l4uSncDI42Wo9sJ2kUJVHlogeLKbV85oQf9TzdvX2UpWducllV9pXzNB3?=
 =?us-ascii?Q?LBZgGZVVQMOyzHWHk6TNXSZuE8otUDV3GvKJF9Pqe9fLx2TuQDJ2MWTUzb6x?=
 =?us-ascii?Q?Zt63RnraXNJS8hJ2Occ74QX113PhfpdOIeg/D82nFdRmNNr99QyVW11xb31W?=
 =?us-ascii?Q?DrQjPPCc2AJIZEtQ0RiIpjVJ/XGusBk27YYx0B2ACHjmVYROvvXLeD4mvNMr?=
 =?us-ascii?Q?/DEX9bIBINcEcRDKUGNW4rs3pN9uYpd7Cs+qlbbSDRrt8HvCwYc53JFsiPVw?=
 =?us-ascii?Q?nwLgGgNQJ4T5/NWHcvO0hATAzEVdQm7s68w8Oyv6FrvyMjtiOA/XG9VbUzVa?=
 =?us-ascii?Q?HRl/pIragJW3jhdY8jv5SvEJJd+N6Z/GUs90yhgmxwucKjKJknIwy77v5KhS?=
 =?us-ascii?Q?WbedeA1ZcM4e5A4EzLbXus7JssUlxbm/aLabV4a8pN/veHEI3kinF4aswNsH?=
 =?us-ascii?Q?b16Tl3szxNnzn70URHJOjj6JhKj1h6qCC7/nWjmy0D8svh40GhTX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e39276-fe45-4035-0a9d-08df3370fb39
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 14:54:05.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQJ5MrsF5APFP0ooYC5kSN4Tv0HaM7Sgx7Jy5NCuwsW+F4pun0U2ESQZFmDXdtE7J7tlcm7hqhvyMdGhI6MEPdMh9uA+VFrJ7ciuyKSSNwktkCzsKQ7bAEvRlgvjfQEP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB944139

On Mon, Oct 26, 2026 at 12:11:49PM +0100, Francesco Dolcini wrote:
> Hello Frank,
>
> On Tue, Oct 20, 2026 at 12:38:51PM -0400, Frank Li wrote:
> > On Mon, Oct 05, 2026 at 09:53:19AM +0200, Francesco Dolcini wrote:
> > > Hello Frank,
> > >
> > > On Fri, Oct 02, 2026 at 11:28:33AM -0500, Frank Li wrote:
> > > > On Fri, Oct 02, 2026 at 10:18:24AM +0200, Francesco Dolcini wrote:
> > > > > On Thu, Oct 01, 2026 at 11:26:05AM -0500, Frank Li wrote:
> > > > > > On Thu, Oct 01, 2026 at 12:52:53PM -0300, Leonardo Costa wrote:
> > > > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > >
> > > > > > > Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
> > > > > > > LVDS connected via the Apalis iMX6 LDB.
> > > > > > >
> > > > > > > The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
> > > > > > > touch input is provided by an Atmel MaxTouch capacitive touch
> > > > > > > controller.
> > > > > > >
> > > > > > > Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
> > > > > > > external component that does not exist at the SoM level.
> > > > > > >
> > > > > > > The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> > > > > > > Board V1.2 device tree to provide a ready-to-use DTB.
> > > > > > >
> > > > > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > > ---
> > > > > > >  arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
> > > > > > >  ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++++++++++
> > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 13 -----
> > > > > > >  3 files changed, 59 insertions(+), 13 deletions(-)
> > > > > > >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> > > > > >
> > > > > > similar 7" case, add panel module name in file
> > > > > >
> > > > > > imx6q-apalis-lvds-panel-lt170410.dtso
> > > > >
> > > > > This does not work, sorry, the current name is the correct one, for
> > > > > various reasons:
> > > > >
> > > > >  - the product is a display made with a specific connector, touch
> > > > >    controller and display and more. The actual panel is just part of it
> > > > >  - the current name wholly describe the product, it's a public product
> > > > >    with an official name, all of that is clearly linked in the commit
> > > > >    message and comments. there is no ambiguity.
> > > > >  - the same toradex accessories are not module specific, they are used
> > > > >    across multiple families/carrier board. It is a whole ecosystem that is
> > > > >    building on top of standardized interfaces and connectors. The same
> > > > >    overlay file is available for multiple boards and in multiple SoC
> > > > >    vendor directory (as of now TI and NXP, soon we are going to have
> > > > >    also QCOM). Having a consistent naming scheme is important, we cannot
> > > > >    call the same things differently every time.
> > > > >  - there was a situation in which we did a new product revision of a
> > > > >    display, specifically the "Toradex Capacitive Touch Display 10.1"
> > > > >    LVDS" there are two versions. The official product name is the same,
> > > > >    apart an additional version number, one is version1, the other is
> > > > >    version2. They have differences, and it's not just the panel, more
> > > > >    stuff changed, so having the panel name in the filename will not
> > > > >    help. v2 support is already in [1], for reference.
> > > > >  - the toradex naming scheme is not encoding the actual part number used
> > > > >    in the product name, for example we have apalis imx6 v1.2 that uses a
> > > > >    different touch/adc than previous apalis imx v1.1. The product has a
> > > > >    different schematics, different BoM and so on
> > > >
> > > > Do you have schematics number to identify it?
> > >
> > > Why do you ask specifically about schematics? We have schematics and we
> > > have a way to identify a product to the related schematic. The way we
> > > identify schematics, whatever is a number, a string, or anything else
> > > seems not relevant to me.
> > >
> > > But yes, answering you question, we do have schematics and a unique
> > > way to identify them, and it's not using "numbers".
> > >
> > > What matters here, is that Toradex products have a unique number,
> > > and we have a way to trace product revisions.
> > >
> > > So, for each product we have
> > >
> > > <product name> <pid>
> > >
> > > and <pid> is 8 digits, the first 4 digits is the end customer product
> > > definition, and it matches with the product name, and the last 4 digits
> > > is the product revision.
> > >
> > > All of that is documented, see https://developer.toradex.com/hardware/hardware-resources/general-product-information/ordering-information-and-product-identification-pid-pid4-and-pid8/,
> > > and this is what is used for any kind of product traceability.
> > >
> > > Staying on our LVDS 10inch panel example
> > >
> > > Capacitive Touch Display 10.1" LVDS | PID4: 1212 | PID8: 12121000 | (version 1)
> > > Capacitive Touch Display 10.1" LVDS | PID4: 1212 | PID8: 12122000 | (version 2)
> >
> > include  12121000 in your file names.
>
> That would result in filenames such as:
>
>   imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-12121000.dtbo
>   imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-12122000.dtbo
>
> While technically correct, this creates a usability problem. PID8
> ("12121000" is what is called a PID8 in Toradex product naming/number
> scheme) tracks hardware revisions, including changes that do not affect
> the DT, such as passive components or mechanical changes.
>
> A user with PID8 12122001 would not know which overlay to use, and
> duplicating identical overlays for every hardware revision makes no sense.
>
> I therefore propose:
>
> imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
> imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v2.dtbo

It is okay.

> >
...
> > Ideally, rpi-display-2-7in.dtso should reused for all boards, which use
> > rpi defined connectors. Now exsiting these combinations reason is current
> > nexus node is not good enough. but we face to this directions.
> >
> > And anyway, rpi-display-2-7in is not good name because rpi many produce
> > difference 2-7in panels in future.
>
> This is an existing upstream naming convention, already reviewed and
> accepted by multiple maintainers.


The existing doesn't means good enough. That's reason why there are hundreds
patches each days.

Our goal is making thing better.

Frank

>
> Product naming and versioning are the responsibility of the manufacturer
> (whatever is raspberrypi or toradex).  I do not think we should
> second-guess those decisions without a concrete technical issue.
>
> Francesco
>
