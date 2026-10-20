Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792523892;
	b=cSMpr7UuHidygJRO+PKiSZmNvDfC2eGmZrTPBVJ8aAj1mj+gcHlwxNSrt1PjQKB+ocqH
	 QSJx73mYBIYj+SQ0CNC4Tks4WOTjRl/n7VhEa5VmZpcasS1dspk6AToedEx9/lohLvCkP
	 npotI4XdDwLK0pmogovQCFebhZ84RtiZ3KuQUCAKKuM3ikgBTdkSeO4qqCMZHl+1RMqLJ
	 QACSV1TZdIQdaJH4jqjvEnMC4LTvJFwJpDDbpCqGbaSlt2IwigUq0jDyAP1U78DsOHccZ
	 ia/BNPg32unUdeOuuokdqQoVFKxWsVVDsWXqlslP120igBWcPghx4jGaWMfaA2N4fxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523892;
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
	bh=UUcoqmX4hXwg7fX/RU9LpuDKn2H4TkLNp6HUMl+WQ3o=;
	b=Fo9Ylvza93IV66pKm1QvNBxETV6qy4qR91+rT8VdwzLmIlf/3ZRxEuqevw1ZmTYusSiW
	 xueKT7rg4cPLFdKUZGSBE6svpOiquIOIc7zGdCWd1MwT5rg1eEmpOW8Dn+9dpX4EzGyPu
	 WdQAqT9vy7nULZ0lIBdLXScOSvgLFSQVdTyLAUY7+EqLxbAFeBc79iQ6SnPnMmAqlQ1+m
	 g2k6FpRwSx5nFvhXWUsT/2tcAKaP7S/0OM+aHtohXyyyYuKARUHihHU+rGcjwAn20wu1M
	 Z4GPzR/cMjfECSc3S5klpOiVUD7TByUqMeB2yFTbnyw88YMEhWcrxmZaCDWcr6z2gyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rcgKRHcd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.14
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44081606A31B;
	Tue, 20 Oct 2026 19:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44081606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rcgKRHcd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjVl1QoKoavEV+pj3ipEbSIdf00gRFa7lHFjcDzkZ/Oi+2gBo1OacRdP+qoQTsh0s/U6Tb7P9iuT9FnfePOwJKiTRAKOo6y+0/hVr+iqlpBFMYgaRPM8+/kPnjD9eAecLodElGbgJYzLx+VdXQZ/bFWse8vWFY8/WmFdtCElLk6mY/v9M2OiPgSKqu3WD9Hr6Oco0l7qCcj9OdSBS8ASqPdalSSehVa+InKUuOE4FJdRe91ifgioJZZFYPCuOW4JvjStZPKN7ebPOC3KsmM0mGd2EZHvNl1QykaQ6RAKJWaOg+boKZv74zK+3TH43yQtbxp6klgAJtd6HEpeuKeKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUcoqmX4hXwg7fX/RU9LpuDKn2H4TkLNp6HUMl+WQ3o=;
 b=BsQ3eChQEtVcBbK2aWnfOLoq3yLgDZMe1YH4ayzTpzIgk/GU0Rz6e/OvIoM9IETnYuEq8FPEOAsZs8jVMjQd3PMCbKfdFlQVpEJuc5PCE2uNu73fcUQdEYS1BffNXwVcGAUPjIl2HnvKFV4ugFqUmUy8l7xPsSDTmdYlbVGepqPGpi1c6A1bfdtyM8k4YTWpN6etTnc086z+YQwHUgqGy36PF0iQdzYJLiYYM8ig8yR38pKnePoHVIlV8c72ouhWd9Ea2ogAJVvIcn4y9lWrFCsUo0bPraIKLNtUt79td4eca6D7BLu8/lIEi5ldywDrR4TXnKcrhLk8oifRWy6+tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUcoqmX4hXwg7fX/RU9LpuDKn2H4TkLNp6HUMl+WQ3o=;
 b=rcgKRHcdcpaq4JSHIp96GeW4nJU++mfhIdy5EbLYTVCBufGPWD5K9G9Uqj3mXddmaK90W4+L5xq662qECF9F6clnO0BQOc2/ZPOi7M0BMvb3gBW77V6t/GwfBR/lSyAosxwA4cpe3gahdF211o5IMq80SZklU2rUqNayPbxQUnU9IQiaLNCOejmo3Xh7HWF/IFexQfmPZRbiQeMphi6iO573jOtJFgLppry7150eXFusctdwtO5jvx2qrrwQORs+ltK0qUEf+9XsUppUzFiCuOw3rigR5IWvBL/hlJewmk4jKW6ddBfMjOEVdf6SRz01DiC3+pBh0MwHNOfz72YlQg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by GV4PR04MB11731.eurprd04.prod.outlook.com
 (2603:10a6:150:2db::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 19:18:08 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 19:18:08 +0000
Date: Tue, 20 Oct 2026 15:18:00 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i3c: renesas,i3c: Document analog noise
 filter control
Message-ID: <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
X-ClientProxiedBy: DS1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::7)
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|GV4PR04MB11731:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0534e1-4c3f-4022-e7f7-08df2ededfb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|23010399003|11063799006|4143699003|261009223027099003|10067099003|56012099006|22082099003|18002099003|3023799007|20046099003;
X-Microsoft-Antispam-Message-Info:
	8a+S7bqMNUVmZfnbD9vrCGn2LKokBaixhqQr81l8fTbmmdV7PnYQLXSUYefW9zv5+6q+mSgpXaXR+cmBss+FI2EgWFsS1R1SdGvQeusadooncWlcxbPr6XKAPEwQDF/As6JbpiMR8JxBwvWvNh7O2Xg1lhRptUWv/DwBlc5Bqx5m99aQwgEVYBFQS286jefbM32vviDCZWXf9ChDq+e7SVv2SURRkE77B/si9FMSDErrFyO2vxhcmnJ3q0fjSDvC2I2mAfT/YTtPq496rkQvxq+EbrFJbgPz7SiBLMnyiEihxeI/Jw4IrBNHwAlrYPNPtdk7QLsU8CCAkA/rky/DmX9lunUCWVGpEUMspfLr2iDyNlsWwqPgd4KGkSkBdb3PyBpDWzmalRef9aeLQHo7FiQHZ10bc7rWTMpNtHphrSN+n4u9ZqNV9NTSIsf0NFYa3xFUm6edQqVlN5uLBH0sVwEi4M5NUp+UWoLe+3FK/owYwhHT2ZmU7Egsq0EuHuKbRTiEcLXwzLs2ae4Fhdu9ML6HdwKxfgzVQEMcIhl55BBJyv3ViS5ndkCOW/7VqZMzDNhLY3wgtI4kr+d32gF9X6d6wbU+k4HNjig1PEviiT/o6T4iRXkKHe1wKWdPtO/a4ZXDAJY86O32Qr7sovPlAA+tTf1opmTbUfvLmtjP5NE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CrcsSE2TCjaYd7Ziik5Vjmvg2bi3cqKL+VZ9r2FL+7iI9kAkxCoMdg5Bp2Yq?=
 =?us-ascii?Q?ykN/yb4Vz/U2yDviUOnwB7FORuLHOOfh2EnieTUFncKhId8JJ8PmSLMivI1d?=
 =?us-ascii?Q?VX9QMGvGKSeuqaWiC2IdlRh6Of0mLeA6uhk1X1/5DUAjqTRQx5OSdHNDcCeI?=
 =?us-ascii?Q?Lkl4pLoXe8VMNm4B9LTATRrghTC6tcz+2jv+AWzb5k7JXLWUgv8S9mm7S650?=
 =?us-ascii?Q?NiuRgF93Tx8M0dbfD49tAv3AzQyOAx+lXqyNpE3EXD/pvmgMcZxGiARwzJ09?=
 =?us-ascii?Q?g1Q0UKjRs7S9CYPV65gYq/iBr/whwecchB5YXbsowpJZAUBPTi90+383s3w2?=
 =?us-ascii?Q?7va9NZeHdveFuyPnZlRn3ulJrdc7ZJJHmTqffa11lwaFJSX9mZElsdSuy13f?=
 =?us-ascii?Q?srG6mRQKnDUHnuEtlDhV5xWyOtlvu2jixdISEuQrYG3EVdffruzJz87dNCnr?=
 =?us-ascii?Q?mMqXxx9msv9nsmxGGYjYbq9ZF29IrfcXFS9BSNADfcv6TE0xTm3bWlqqVBVx?=
 =?us-ascii?Q?xWk9Bbjd11w9actvqXGuHC/YR/3Z7xD9w+JMLbqGOCTBAmVASIrnKnuyA3N5?=
 =?us-ascii?Q?myW36OAZEc8MU/FF3G3KmgTp/ip6MDN3Jz5Y8BEZCWqHPOrMoYHz/qtnPyzX?=
 =?us-ascii?Q?036m1e5Ly72292gwucxsTmfgZjP3noACsStpcXz4AWAo74gtzPwYSegJPoCh?=
 =?us-ascii?Q?SPOewQqhwnOsNxK/g1UYLZL5mBkwRfl9gZ/ojzQPtLwGpGq10Bfgct1Ga1ag?=
 =?us-ascii?Q?iBWJwxTbZQVNtu6HeAiAvgAU+niyYtzgyXS6mWxGZxeIDKAcb0qTS7B6uztn?=
 =?us-ascii?Q?f+02VzNYaHBcgvhhg48jDhjBma5KLMB+/OR9JGNVkB6EVFwLpGjyrkuci4oo?=
 =?us-ascii?Q?I62ymAHeq/6Hk5BQsDoSOEYyYS/1UyEme1EN27rNH5kqd7f50LT84TmzYQNz?=
 =?us-ascii?Q?kzxSsMB1ny8qChXCjJWfhh8JH2ycXV9n+tAVQ/Uto0vKqeYwsDyVFdamEZOb?=
 =?us-ascii?Q?4cpbKK5bgGie31x04pvf763Xn6DxxvjMasbA3zMlPy+D/Ybe5NnPFydiXkcF?=
 =?us-ascii?Q?xuFi1P0GjWR9ZVsEOZIr20I1VyaTdEwcuFVcIo1E9wdE2w1BEFfrGZqMy1Oy?=
 =?us-ascii?Q?RkMNH/WdK+btXox6fXmsb7cb3aiWcMsZyVw0AJtFJ8CzjwLRZxB84JMC9GVa?=
 =?us-ascii?Q?+JxtyA1Jpvff713L0tyY2NKzYkYZlmOBXqjsEemO2bxWThS4+8jfhbOrHbzc?=
 =?us-ascii?Q?m5nYZInt3H8sVK2eLloYC77PgZaRtIO82OEx3ViQQ1C0s8qEW500M1PCUBXs?=
 =?us-ascii?Q?TzK0yj4zXfin6P7GVyx+1cS8nW2skIjSiNnlk6Q8ZedcbehiICcG0ygjxJHa?=
 =?us-ascii?Q?eEsIDKVmwZXHBOj3tIMIbU3CCqo4e9O/268CiAT1uZ/0ux+U1fYg3b4RR959?=
 =?us-ascii?Q?X8LzwTV1wEZA/YulEt/iYThF7MHrJqZb0WUpkPwjtjzuAy80zzTVf1mARU6Q?=
 =?us-ascii?Q?0ZqzQtkUnBiW3LbxsJ7AW6rD00ZP0RezXNowFu4c6S5mYCBBOUTh1IZQX99G?=
 =?us-ascii?Q?DOi5JPeHRDmLxXAWDnfcvfaPyuVrNfpGc7r6fdgexl0LUCbFTUZY9lvYO0ul?=
 =?us-ascii?Q?nyrtGRQ21XEJCsGvC2SL0YUywhrNImdWTELjmW6R/FVSg8fuZBrowPObRUqK?=
 =?us-ascii?Q?mt7Z/654IBRZzQEsrgOf07dvVCiRrFX8Ds7bJeB4nDH9ko1+9Wu/wFRKI+Au?=
 =?us-ascii?Q?LD1jQqVsN7Cxr1K9LgQFsCN0ipaAgcwHNau7qe6WRM2iuXFX22S2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0534e1-4c3f-4022-e7f7-08df2ededfb7
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 19:18:08.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rUShqWqPdk55oAofzehlAlcHVzM6OUnoAIJ4lrNVeK/7fwNCNo4qnqkRl+Hnb9RhM71hZ0HbAqf5W8oPt9IPT11pAfhkR0q/YchZ9V8wUzKA7TC3w8U75kyLpgQ6XqC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11731

On Tue, Oct 20, 2026 at 10:36:26AM +0100, Diogo Ivo wrote:
> The analog noise filter for the input terminals (I3C_SDA, I3C_SCL) of
> the Renesas I3C controller is controlled through the SYS_I3C_CFG
> register of the system controller. Document the
> renesas,analog-noise-filter property, which references the system
> controller together with the offset of the SYS_I3C_CFG register and
> the state of the filter: 1 enables the filter and 0 bypasses it.
>
> The property is optional: device trees not providing it keep the
> filter at its reset value.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
>  .../devicetree/bindings/i3c/renesas,i3c.yaml          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> index 08fcea89a015..381807844351 100644
> --- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> @@ -96,6 +96,25 @@ properties:
>        - const: presetn
>        - const: tresetn
>
> +  renesas,analog-noise-filter:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

I don't like this syscon property, look like it is one kind pad propterty.
Is it possible model as pinctrl?

Frank

> +    description:
> +      Analog noise filter for the I3C input signals (I3C_SDA, I3C_SCL),
> +      controlled through the SYS_I3C_CFG register of the system
> +      controller (SYSC). Three entries specifying the system controller,
> +      the offset of the SYS_I3C_CFG register and the state of the filter.
> +      If not present, the filter keeps its reset state.
> +    items:
> +      - items:
> +          - description: phandle to the system controller node
> +          - description: offset of the SYS_I3C_CFG register within the SYSC
> +          - enum: [0, 1]
> +            description: |
> +              state of the analog noise filter:
> +               - 1: enable the filter, performing noise reduction on the
> +                 I3C_SDA and I3C_SCL input signals
> +               - 0: bypass the filter
> +
>  required:
>    - compatible
>    - reg
>
> --
> 2.56.0
>
