Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793821933;
	b=1RDp3sPQssVBE+drkzST8MQBojjsx7bR3ZdzEdNAcjsptllGHppHbZGXrHXi3Cjyoopx
	 d/cwoMDg0v3Olbee9Q7u4nVnU+QHhuDd0ZyNg9CKuHOIpXKtHAFnXxjEznYXpInx3PEx6
	 XQI2htaEPEckpxBHpo8U8CHKbSCAzNjYOfJgJiyu7ovpBg6TtXMUuNp4zk2qSgtUxDooD
	 9OYNaNdaxvPYQ7Wu3ImibKQMn93amAPpLGIPqH/PSaxkmiCeY175GmaJ2zkw5plJxHzZI
	 kk0N9FwKnvaqpfzkIwpWbzuQ8BZbJs5CEkN52K8RsilHW6r6X536AMIZRhBMXELjUaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821933;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=7rtvtp1jOVa8rWXLpDFCy1Hio64PNzhe6mwYeat+c8Y=;
	b=jzNzbUVutWuXNjfV5VLJzFGauTRjk1iw9K2PftBd1hZaBwgRe03At7I7mb5MHnWbTjn7
	 ZLLoRXuSh4qTkh1vCMrQuMIJcnWz/Wrf6GRFUlUSkBPVEfAy3DESzkZGamJASl1LHAwmb
	 5gaqraIV+v3P6W82ldrI3fII7kcYoSz/qp1rj8027A6iMGFEBZ9DDyTjpeOW6T3X4RXd2
	 Dm6HETORKA+uMB9EnV6HujwtX0N4UDwI0UwiSa8VhyYDgiFmFsd3gXY9k5ehwKHEytDiy
	 pKGwDLeibpoNEPkZqu+WyncO4kpyVyWB9/8pg1HWCRv5KjGu/11l1fRZ7uyScjoT3Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="Q/8hv09k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.26
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DD060D6F02;
	Wed,  4 Nov 2026 19:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99DD060D6F02
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Q/8hv09k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRt1QYFMW/g9qoh2cSxvIXvj1lMvecb3YpBrR08P89MXI7rle4Ld00tbenzfNdFEBBqCnVC4+RlGN4bdDx+pck8UtwahBBXSX5tn+vtoIHI0uIYdtCq4/yZdeHCAZkG823e/VEi09kFT0w6+pC5wXeYA4RNvXP+BqVCSChkNctUWHxPmoQspD1RUNQFWQm0cTRs+K/9zOKVYbmkWFCaqiMWboovddYLZfC0grSUFpphWwOyqsjSljcbaapfPcRvo0BqE3nYJpxgdOX0GkcuuFYx2fU8O9FElLjXiNq6QwOtVwszD8r4XRIbNqWKlISS0DqHYGEd5fPwmD/2uA8BvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rtvtp1jOVa8rWXLpDFCy1Hio64PNzhe6mwYeat+c8Y=;
 b=xs+2GgoHBHyVindYhdXJyDj86VCSuexg2i1nIDE4w2zX7jmUT7rh3qhfa0cc/27e8Voy4CfLWTAR+kyuM94XOpTO9yH7ZhPfzpM1YKp0aK0re2yaIv28VJ0hNenhFtijed0jW60169u6A2CX04riHXuV7O8N3i8YE1r/kF5TX2SQd53AZ7j7JsOS0AtQQiH9ve91+6aLVj4o4HYujpMXiCYb8L17k5Jr9QVYtosKp3U7bk9ad8YRAhWVt9kGXodofQXtA5qBTE4SVIXKHH4zaIAxwGV0sobMzV6Fy9Uzz/dxCE7L2IvsotTY3u39DhIk6bLiC5Gsfn71qVIIKttrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rtvtp1jOVa8rWXLpDFCy1Hio64PNzhe6mwYeat+c8Y=;
 b=Q/8hv09k35P3JVzQt7DUOG7ZiQiIQtRGFsE8l+Kw3iNcAh62ubxGaIrmpZSQVBP4KbedADK52nl8GUahR+oePIRlVx+0E6uPux0nkutzVOlM9hmaSOfbN335eRDcr2IhyF7EcHeKKkP3YmGQf2yG90QkVJfd99GjC7i59PWGnoVGvi4w7nYaTYdhpOobmLS7y5Rb/i5+PuOQKd1ntyD7z2WcGby2AjqyvJjfGl6dxiqUdsik650jSz8GoGxMIggyAY+rExH0eOzA6QxzPyALZ4w+Z1sO9MR3HjtFnvNIb/jO2mTQxScFWXbb4pF4qbXOmgQLKOlKYSb30BWy8nC7SQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MIWPR04MB132055.eurprd04.prod.outlook.com (2603:10a6:290:ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 19:52:09 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 19:52:09 +0000
Date: Wed, 4 Nov 2026 14:52:01 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
	shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
	manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
	wsa+renesas@sang-engineering.com, konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org, jyothi.seerapu@oss.qualcomm.com,
	viken.dadhaniya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
	praveen.talari@oss.qualcomm.com
Subject: Re: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
Message-ID: <auuM4d7kPFr7sVTN@lizhi-Precision-Tower-5810>
References: <20261104122155.3789346-1-mukesh.savaliya@oss.qualcomm.com>
 <20261104122155.3789346-2-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104122155.3789346-2-mukesh.savaliya@oss.qualcomm.com>
X-ClientProxiedBy: DS1PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:8:44f::8) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MIWPR04MB132055:EE_
X-MS-Office365-Filtering-Correlation-Id: be91ee9b-18fc-43e8-54ff-08df3aad1ccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|366016|1800799024|10067099003|22082099003|18002099003|3023799007|4143699003|11063799006|261102123227099003|261028144727099003|261026140227099003|261022105027099003|261026121527099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	HtbbHf9r+9MFSwdToUz5VpuNLQVTqnpPUIqho0b2D0aPWRhHjUct2quF7ApWw3IXNyO48rgov34KRdjTMvgBDBaVQgiSQMyRUXxhZu41hK90sXL+XsCKacyI7glx9qCwvJ397dSjLBTElJ3wHHkGZPSzSjfr3GlfkdH4x5vS5H4SWBO8bfV/Ytv43UDynGfgbQtZ88qEmAVh0LaUS1RYaPE6uCj7uFZrPittCJYlvCdpT8pgVGhuJ132e2svFr+gUyZc0AiF0/97aUaIzLhTArJT2oxeHPpO7gF1TtFLkc/dHDL0gwd3Go3fjFJwdqtlNiGQLtuhr0cXKZeuk25jTqP943lRVdhk94dLXt6FsB+rK36rV/s1zM/5EmHo6byjZvARQbAZWM3x0Zzv/PArhe3DN1mYS3AtWsHDJNkPkIbn40bf60K0sUbO47zsKH1IXvdO2YjU8k4WDFkdKQiYWIg0ZD875PO9ZNj51qO9s2xSlipMfWE9YT79CVUWTutunbjfY5eDpIu5dq8VeofLyisVca1HJ1Uj3DeRGZU2FsdDDkVb5EeeaLL4m9jYPLGrAP2UxUagKNEk2KowlRiH4tvh2pbJ5b1l1DucHuZdnR0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261022105027099003)(261026121527099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?np8Lf0MejhmF+nxhNy05t/Oj6f58M6frjNSVxU2/thAhp024s/9gKygAMvVh?=
 =?us-ascii?Q?c0t4QNxZ+fvHxh5jPWCxJTcim+GcyiD0Cb5emR/zF3twA1fK6/b4CXlxzm/+?=
 =?us-ascii?Q?QT30ruYQj7tr43M0ZvBRtESfyqDWSMZENpWvRpuBaAlR9mioES5YEdDSsm6U?=
 =?us-ascii?Q?zvG/FNl3NnDj19qCXeskiMdBeUztZACh+Dt7cQY2F9WSwhOILVWANiqgKoUs?=
 =?us-ascii?Q?vatf8aiKWe0UvfarN1/f9qPDWUYhyiHHHDZedySD5ehJG+IeJUua1ZFZNQd8?=
 =?us-ascii?Q?mqqkIFw856zWOmhJZfLje82aHnIlKOIzG5xsrk4/p0Xk6QxoRE/YAGbGBr1N?=
 =?us-ascii?Q?/PMaDaVtt5YLlUfQtcQrgaUQ/b5bqHZHTYVLysFUvLEnKvlys1zJkWYPQ3fr?=
 =?us-ascii?Q?Npc1qf+cctg96/fQ9Kik9o216mW+70W1plymGQhlep34At63c7W5PW0aLkV0?=
 =?us-ascii?Q?HqyNX3XwuP33MuebK6X31AFvx1V85f0W0KnJPvQ6YbkUi13RxbiV7EMR0MdB?=
 =?us-ascii?Q?3zM0BBdRdCQF/+QKGt1CbXiZge6c/04lUdWqPTo4ltREbdYlEqARFyGkVY0d?=
 =?us-ascii?Q?K0dlMdHSNIlcHvZi3BkACAJZp6oivhgfWGQjudlAxpbf0Mzgth3qm/gc7FGd?=
 =?us-ascii?Q?ECNwZJB7yFleV/OSEKhkpr0BkN9OI9hPa90hgLD1LuptVd0GBKOJEztnkO3Y?=
 =?us-ascii?Q?9LgiGBEw6ORgK2XxTUgbD9xe40dtvNhPuqxp405pZt+AGH1/6XaropWgBjfe?=
 =?us-ascii?Q?KBq+745qgM1qum9EYwsKJ/6+QzGjOPsRMrAfDtH8NusFzfHQrKRqYl6u8uc4?=
 =?us-ascii?Q?6F77IJKfjtg866n+hncZCGjZtmvMmQ89zhrMAB3P1rRmJ3VmpD+wQfuTE1mu?=
 =?us-ascii?Q?yuny2PMQ5MfFCZk6E4+GOGwAbQyu9GaEoiGKK+6BC4342tSJBU+fsGYQDQ8Y?=
 =?us-ascii?Q?JqQ67wTNyR69EfG82bRdJimjN/bpCr5VXF2Yxu4fnFOvbh16PUkg+hsBjnVP?=
 =?us-ascii?Q?yERCpP50q6KhmwuhzYTgUtuHtsmHttVTYDQDNjII27xfIKZzG6rPxMN8XO3K?=
 =?us-ascii?Q?SEEsRgomnAL+JfBVWT2hUe1McgqewIyEYomOrYcCSx4ULjEJjvHreMKYUVq7?=
 =?us-ascii?Q?45G5lGG359zIGweOYCo6DUr18t6njeJVBtL0W2iaUqPR5ypU1YS2iZR/1xRK?=
 =?us-ascii?Q?AnL/wCL1mgfrIEfVukyyHdGycrG9coXHsGy8/qvw5oA5o2bfnZRvvETUDNL+?=
 =?us-ascii?Q?JnaFEDCsQefv4qhybfGAlWG9Y9mNN249V+zglzx8ouxuCJJS8CtyHGx1vWhB?=
 =?us-ascii?Q?HgD4f/N4nM6pc/ZNCsypAPMmPSs79cdn+rboLynv+Zmtnbt4Nf0VWtMIvUor?=
 =?us-ascii?Q?H+JKu7HeGtwn0pAr5uvNRSkQ4OuF0K0+7rHmW5ooVp52J5o4ZwTbIF48bPJX?=
 =?us-ascii?Q?5JmQ7FCME/v483spWn8IVVEuh35bkSMqnoMx4nTYYoISxc1zV+41lF2AU+Ys?=
 =?us-ascii?Q?vcIDQuP8xHE8q0fsLgz/soQzpUKMOczbJQXH/VZOQBvvRObRGazquiuzwrZh?=
 =?us-ascii?Q?5G3s8bdpK/yuhLGAjfYvAcQM/mdOlHPGMcaqe9zufVuAfTI7/SV7hdJbeSHb?=
 =?us-ascii?Q?kjc1e+hxVxIdTou17pOGciapeSVM5Kdjm16IfL5eVvXar8fJT1HFPBlBhobw?=
 =?us-ascii?Q?z1j+w+tKlewNLCamD+R+LdztDDYhLXcgaph9v5x5IK6BlXb/42gqLwSCZKiH?=
 =?us-ascii?Q?udTnXwqZoOvL8cQMENVXcC6ppdpT1Uwp+UgruzKOmVwoLMhb1FZw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be91ee9b-18fc-43e8-54ff-08df3aad1ccc
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:52:09.7800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCy50QYZC1jcRGT+eDq0e4I+0lEF8jZqNDJagI6t/d9XvyrDKDZLQvuYSTh53gNVjOWt1qnn7dpt/G9a/rwbcxqp+X6YV13teQedbov1dQLud/UN5vIjI/aS6zLjUv8o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB132055

On Wed, Nov 04, 2026 at 05:51:53PM +0530, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm GENI-based I3C controller.
>
> The controller supports I3C SDR transfers in mixed-bus mode with both I2C
> and I3C target devices present on the same bus. The binding describes the
> I3C controller instance along with its associated In-Band Interrupt (IBI)
> controller used for handling I3C target IBI events.
>
> Document the required resources, interrupts, clocks, and dependencies
> needed to represent the hardware in device tree.
>
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
>  .../bindings/i3c/qcom,geni-i3c.yaml           | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
>
> diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> new file mode 100644
> index 000000000000..bab89aeee23f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Geni based QUP I3C Controller
> +
> +maintainers:
> +  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm GENI-based I3C controller implementing an MIPI I3C bus master.
> +  The controller supports SDR transfers in mixed bus mode with both I2C and
> +  I3C target devices present on the same bus.
> +
> +  The controller consists of a GENI Serial Engine (SE) responsible for I3C
> +  bus transactions and an associated dedicated IBI controller(IBI_C) block
> +  used for Hot-Join, In-Band Interrupt (IBI) handling and management of GPII
> +  resources associated with the I3C controller.
> +
> +  I3C controller nodes must be child nodes of a GENI-based Qualcomm Universal
> +  Peripheral(QUP) wrapper. Refer to the GENI QUP wrapper binding described in
> +  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,geni-i3c
> +
> +  reg:
> +    items:
> +      - description: SE (Serial Engine) register address space
> +      - description: IBI controller (IBI_C) register address space
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: se

generally, needn't clock-names if only one clock

> +
> +  interrupts:
> +    items:
> +      - description: Core Serial Engine (SE) IRQ
> +      - description: IBI controller (IBI_C) manager IRQ
> +      - description: IBI controller (IBI_C) GPII IRQ
> +
> +  interconnects:
> +    minItems: 2
> +    maxItems: 3
> +
> +  interconnect-names:
> +    minItems: 2
> +    items:
> +      - const: qup-core
> +      - const: qup-config
> +      - const: qup-memory
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: sleep

Needn't pinctrl.

> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interconnects
> +  - interconnect-names
> +  - pinctrl-0
> +  - pinctrl-1
> +  - pinctrl-names

pinctrl-names allow 1 items, why require pinctrl-1.

Frank
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> +
> +    i3c@884000 {
> +        compatible = "qcom,geni-i3c";
> +        reg = <0x00884000 0x4000>,
> +              <0x008c0000 0x10000>;
> +        clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +        clock-names = "se";
> +        interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
> +        interconnects = <&clk_virt MASTER_QUP_CORE_2 &clk_virt SLAVE_QUP_CORE_2>,
> +                        <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_2>,
> +                        <&aggre2_noc MASTER_QUP_2 &mc_virt SLAVE_EBI1>;
> +        interconnect-names = "qup-core", "qup-config", "qup-memory";
> +        pinctrl-0 = <&qup_i3c1_data_clk>;
> +        pinctrl-1 = <&qup_i3c1_data_clk_sleep>;
> +        pinctrl-names = "default", "sleep";
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +    };
> +...
> --
> 2.43.0
>
