Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFA045D5C0;
	Tue,  6 Oct 2026 13:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294429; cv=fail; b=NrTMq27ADsYBQEqYJYJuCqq6R4kSVURkZTqx90BrHg52VBJcxkOASS04qyTlGNkgIIbem1+iIEno36Gqxj8qw+kNvqW8WVzwY5cjKQ//JO7xO6NBbxo1jSXGF/xPp7yeWhMAw/bpq6tOiKxeb4ltCFAVFlOVoIsNJftN9No3rUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294429; c=relaxed/simple;
	bh=1OhPqlKnWbocAaoaueQJYNIim/fLfNuQoeR7zK9oT20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W5W1TVduJOCC0YAHV6ozayR74gDQKeU4u1KfF+u9pOEgoLbqMpKlT2k+ilmQq4ZITwMiliVsUyFWsgiNMZuJS4D2YjQTXuizC98hzA5BmNATGMNzxlB82Ox4FFBV+swWvRCobuyjlOxLFwkJSZniT3rh6sSJ1I0qldTYNcQU+EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MEY2h6/s; arc=fail smtp.client-ip=40.107.159.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MEY2h6/s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUyuFZVaIeoC+iqusCKCcwzVtrOB5pEUrSC5y6HbaU5gGXUNXnAjV2f/k+Jk3X+n60L+X2Nu/kMIwcBTPF405eqTlEoaaAcYDlQVlKVLkp+fOp/NlwOsTaDFfDFau9hvHDQLkb8MTEpvn/Cg70lmVYiF7hQ4vzaSh1bJdLkzvGja3ktaT34CySpNV6SI0DXMORYMVkF29wE6BhcPKPxFk8chGAiI+zTUx9dTQMjvrzczSpEfyfZIpyKspGX3AEQbZrD3+f/xTe5FWJKnucoSTqIAY8LUzjvADD5xBy/TbPQrBVKkYj1CRuJCcFZQ3N/5hFB7UnjBcP8X4Dw7Ug8VNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRB1byXlSoxxvb/Shfmblt1xWcP8M94O9nSNM1jZ9zI=;
 b=knMdZR6YPe2rf8Tn3GvwanFkxHoRNVbFD2VsIaGzj+tAr4cNTC7ZgwonCVMdlRbyz5Ew/rgniYvfr4Ca3UnqRo6b/BcacYCD0QGABDYl3LrywxrIDCBvWXRMY8f8GYKYY0b64cDdHcbygmdx8xTrtCe5vcv/P8xJ7RUIBwhCp7ZciuVyIBzDsYMf1MUrU2xvnd7D6v6sx03MYAwWlFG1n0luBqUej4JnCXLzMPt3WTB2GZeB613lCsmwOjBkrPdq+UwLw6vTcbpvY3bKaZY15cX8JnP1/E4RE6WUQUu149k4mPLv+/tuPJTuZy/fMjqVJM7geTjdgCGtYQgWsi6Tdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRB1byXlSoxxvb/Shfmblt1xWcP8M94O9nSNM1jZ9zI=;
 b=MEY2h6/sOhD1vGgTpHdCHerck/oeThzYrz2YJHLdigevN+URC4/z//w6tW5Z+aRD48aevwH+PZfz/eNSobEw61SJ0OY1Ux16wJWYS8SPF/w1zaqhNHIl7HGRupub/8HoGQxbMn5f71xfqCb92vCmnXqMJBpO1MYAOyE0Dhp54P2qvbxvwTd+eGsanJdRPfQc0y0IPrTShljZf1HoXwv+PvPV53Um+fqqH/H874EfaPQPuDI8GqceE/w6vw7yRSu58IXvI3NuxA9PR3sHIW9XhA6fKJs3zpyopT/yjg05AmHsrBuqIDocsuPnrOBeBdm+jEpNnRIDT2un179TcihnNA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB12310.eurprd04.prod.outlook.com (2603:10a6:20b:723::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 13:47:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 13:47:03 +0000
Date: Tue, 6 Oct 2026 08:46:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: restrict clock for
 SPI-NOR flash
Message-ID: <asT7yvlCeQl1rfrS@SMW015318>
References: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
 <20261006132512.2246196-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006132512.2246196-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB12310:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d99b33a-c9cb-4dd7-9fca-08df23b04d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|23010399003|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YDb7tlbsBh64q3d7/iui31qaAasz3I7uaU+oYay2FsDSxE3qOe0/8T63m7CU7Eo8Dq6LKl5NOlLJuNkQAmayxuhV8JDFBKHTtE3qEvxVz5ClmCyP8g2sAqvolRKghj3EoDki6eCLVZrgjkHJJgFuZJmRTS3KbgTE8/+Nz8PAA21bbwAxzj2U3Yk55W4sGdR7OueQ2HW5QdD3MwHbrU3YZ5soPdofP6X/sumu6mmcIQx72yO7ArcU7sws2fLWhnp3oh8SOwVhtskCLWXbwq9N/hEIhVPHE8WCMkBBWQGnPFGz/5R23AEUtGgBS2kMapdfJL/RhsmGKzAq2dm9XkZ+u8x5kgZZvStOmnrECJZxFwXpoA8N4lR96PBPx75RXCdTgq/QVUQgLREaPea2esg2oeXH4GnvhOluRlDuiXABAIHXnPpelgwQQxlS8xGDcJX5/As7q3hEmVHjXvjdrUCkPxJFYX4QF7iTqnD91xhfDf1a9q1pTSBonG7+6ePPxeVzGYFPPEqchPBW9Rj51bcSuI4uQTWYP00ARhzjcnJ69GatHhBek1ahzNtf5meMmWk01LNgkWkjd8ErmY8b8sQ3AWRZqXplgq+EMSCzPcCyTJFXff1MUVyN0AjuRtYAAPdctxzxLLnztljCS/wQeQ7Uj92CHgIsCZ8fTXP0NGDxVmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cCi+dB8pXlGWdzjVt3X8NX6cpKPEutbMRxyk4Gg1PIl8zLkdAOATqy4ByxLp?=
 =?us-ascii?Q?mJj2cB2AxQL/0i7HduFhRXwPxD2ePEZGXq2YoIvWDsFhuxcgiLUO0vbwbMvY?=
 =?us-ascii?Q?nR5rBOnk54LLzybsYwZaiJ9RA3jl4TlNvxEu420z8rEe6EslK+62u3Wm7nq6?=
 =?us-ascii?Q?wgUK7etkCH0pQC9exbodqKq+mnhpOnDmSHK/5gpeXDKjtLPKbNIeh2vRnaqF?=
 =?us-ascii?Q?w24Rm3TfaD+ngaXjW8w6NqNbqckBsJkaq8U37MLfXL6aqb4DfIn1mLniPxAe?=
 =?us-ascii?Q?+oYrHG4J/aZmJNjm4bRpk78ZWZroanQiIwLJL+Q33eKh2JkcHS1JeFZ22FrG?=
 =?us-ascii?Q?vOwxGvrtKITovJNPaCSUgVTMuj6Fup0bN51MLDLQRfa+94+AxZUmRRXM8zrv?=
 =?us-ascii?Q?4zLeDv0JjJleqFWLzXrYFZEDH5XFNgajh9UNhS4xZgWv0L14s93aW91YKLib?=
 =?us-ascii?Q?Kzy3FyYcX5KPlPFQhAjno3kCagsPoXNLx0nv4kaoKULuKXLEA44xHl4gZ5T7?=
 =?us-ascii?Q?fwTb/0NgrCsvwmHCO54mXGk+EPQXatz433fDYoQfB7Wa++bNdoyR4W3qpLAr?=
 =?us-ascii?Q?4/vO+XMjuSVcaDoFJAsvT/g3Ga6Uc8Y3eYuLZRVBA78Rl7wjZRkXmoguwHzd?=
 =?us-ascii?Q?DA6uT5Bh3sey29Ejo5tNqx9evzpYqcu1smW66b5+8uYgESLeiAqKC6kw8faA?=
 =?us-ascii?Q?GXbqXx6XVRowHutOVPdRTvL7mL4YcCe1v9ouve1F7BCSev6OtzrD0lJ/I9Xw?=
 =?us-ascii?Q?drB+GjQosGSSGwcHIy1JvVLTxodUyctMnRxPd02LOOmKE+IRZCf+kpGVOhTy?=
 =?us-ascii?Q?Ng8E3qunSUXNg9V/LFblwWLMfM1D12QBV/UCdAA2OfPDgvVemtUcc4e596vf?=
 =?us-ascii?Q?qa/nfjeVDCj5qhUOnfMi8bsoheia24d2JfhXNQKSEU9A6h+ySB9HBb7UPNGn?=
 =?us-ascii?Q?nQxjdbYdp/ybR1eLsyJ49BeCW8qak0u0nmhQeFVFP5+OV7j8hqwocmWuyKCF?=
 =?us-ascii?Q?txQB07IWXLPCGBnhNmbjJ5z8Z2+eAG/+2kvlT1NMrZBmCpEhM6m17D3Qg5cP?=
 =?us-ascii?Q?kbjtOEDCy7amGpFb+Y1ipoq1ezlqZvInRVNfav5t+kXTVeDWo4cCL44IOh8A?=
 =?us-ascii?Q?AL94/KZZAXu2kmvV11xL1MgXNSBKcfreA8Kroi6o6447HVH0YK8Pe4zuTpyU?=
 =?us-ascii?Q?O6beO5gUDdDIy8wEB3eRimq/jMRyQnKKC5MfH5iG/muH1+aE4Yzngt8DcFGF?=
 =?us-ascii?Q?yhQe584zr4q75vhC2JdwWupWqAXe0WL6hsG7nbGEn/lFtHgQBzrtYuJrgW1f?=
 =?us-ascii?Q?caOd9UUDG7W9pEQu4OM6aZza7GVP6qKHVlPjhxkLE1HgW6Id8goppqm0zQoT?=
 =?us-ascii?Q?l5YXQX/pdZohEy4ZXQaGOy38RUhnRRHwDemoszFit1Wa1v6wCY0KJXeFiUdG?=
 =?us-ascii?Q?XoRYLgLzEOWauQ99K2gTECwX+lqM8qZH6bCb7aBCvofMR/+aAsM4V1QkUY6Q?=
 =?us-ascii?Q?qjc4ihXg9u2TbwlhLZA/SEEGn52+cQ8hP///e4sP8NQgwtn9XP4baTv40kJF?=
 =?us-ascii?Q?7NWJAt4pRV1FZrS8onaBg1XaJ9wh6yUzWBUAbiGwOVjV3erTXwGriR6fqyiK?=
 =?us-ascii?Q?lB0SZoOfC311cilSUbqjNz/iuWJtn2y6WPjngLYok6Ej3ooBohnx0HZF+bHj?=
 =?us-ascii?Q?cs4qDkOILlkdXODNdmNKCkwHVODsdHCqK5N6J18jj3H2IYTXCSjp6w9OaRi9?=
 =?us-ascii?Q?0ARpUpnqRWz7K7Y/Clz9P/fKR5AqlNQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d99b33a-c9cb-4dd7-9fca-08df23b04d90
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 13:47:03.4950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BiqhX2N4kW0sItMV9DPMu3W9U5LIYUN8bz7R6R1sTlssUeYjB+/PCa/DkXjJ2l+rSS1Yp63w8Mgy8DJGX8p6N/CtB0E/4i3hySWEYaPPoz2/NhD8IjHubthe2gaki6v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12310

On Tue, Oct 06, 2026 at 03:25:10PM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>
> The FlexSPI controller uses quad SPI with internal clock recovery.
> The clock is therefore restricted to 66.666666 MHz according to
> data sheet.

Which datasheet? I suppose NOR flash datasheet, can you provide link
here.

Frank

>
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
> index 48a687926aa1b..c88d83243097f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
> @@ -63,7 +63,7 @@ &flexspi {
>  	flash0: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> -		spi-max-frequency = <84000000>;
> +		spi-max-frequency = <66666666>;
>  		spi-tx-bus-width = <1>;
>  		spi-rx-bus-width = <4>;
>  		vcc-supply = <&buck5_reg>;
> --
> 2.55.0
>
>
