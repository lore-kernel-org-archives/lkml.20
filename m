Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177BE3B0585;
	Thu, 10 Sep 2026 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056282; cv=fail; b=dXF9AD9EHbVUQuT9V5KGoNX3l9IhTSeGQNwnOP1zhxneCK1oZaJ9bI1bbOJ7T5TLlPVCmtNL+uhUxmM5U4t1Hav/fJppijmH3w3xBgNriyBikt4x0vbdyeAHzYpqsTNwC3cwoxZqmPvG7yLv6GNqGpJormq3GGxOt3mX+jPgMQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056282; c=relaxed/simple;
	bh=yIPlbqJDKXIRz2yfii9idDU6vqy+9vizVIB0xlwEipc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QVLKnavc67elQqPNvXZWPgbNj2l7U+mnYtoZBW/h3+1PG2JhOgwBFF06Mjg5pa511Mp7cDPJ15lXpZfmB7LhsPMj0I/Vzb9ccMQ70a6Erstna3eCBj1uWKyNkworO8ps8TvBBQAbnoRqXBEIQHrkvlqYP0I2wU2AxISPuWhQdbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mOd7Remr; arc=fail smtp.client-ip=52.101.65.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mOd7Remr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7uUdRMgPrsKRGqBVep/d6zDlzt4cDBGlX1DxrevNSkC0OM5rdPItWOXGctSKIWpMFcE/mSaimUxBb8ualEVGJOm8uHj40XLT7XnjGtOkOKfHCrvMjA1RYYH5oVSdCOu48eOVpQFcN5snZ+Qa+2vvTWLuBi806+x7uFeltZRI10NfZY/Un+rEEgv0/wmgHGl6OBrxsU3c1hKXKgwq8OsO58bAw66yn9u5VHvs5Cmy4sXCDWmaJUCThronO5tbz7QMIB7wC96ccCqF9AqanKUmUyUbgqMm3hW/jcTiCGHp8YDrXafYX61gfRITe0jrzTM0ZpMg4ejhgu+syciAGd8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdfkYMAJxZLxxaDV/2+TAAzHen/DNTYlSU5a9GCg0jw=;
 b=yrvAGVv+Ua/f/Jj3B2LWizaYpt5dwWXSpt4JmSrSh0/6vdUcWY3oa2xNreDoURRsb3/NJ6CuiHJVmRQq8Sf6WtqPaE18jp19iILhgcvH5h/Ocbn9Agu8UeXVDlB5DxBuDYyluOFSaLOz95V0AwiczteFvMje79SOVfu8go/Vsf+HOjYaNR9/8woZ7qdau6ffNMZFUe+bso+w92k8tbRjzmtxjgh+XLMuSRPzchlTZy+5BsUYBdPVmd0kpna7GHw0DeWd3faQfJionPgM/ufEctqN27KNNzJde8gKfjLs/QUwunecODPosO99Mz1DNlniUZc8t1xBsTkNQeJRIVZqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdfkYMAJxZLxxaDV/2+TAAzHen/DNTYlSU5a9GCg0jw=;
 b=mOd7Remrab/YQwjrFVbUGeVASkHomC2In+cGai+P08U4tAi3GQWMpSnD9nPRWfZDEtrK/nqiTm/j5YrDG+XMIhM/2ypzjYMj0PaJP6KBliY9u/tkyWXIIaIGaPVurm2831JWsgctEy2giM+qtt7nV2xkHhoooC5q3u7vDA9ghFDnvs7QIvsNMFismzmAQWp3El0SGL3/0kQd+8HhuTDd3d0cwpAAgwsuJexO3OlUmyIuEZTEfzUPxbr77L2MJ6ZQn4cMuN5TMiwzxMZ5Bry2zSJXPNY/KDQ0RwkH1Ir+xfI8TC7aNLSz0/YhQsnl+rbajuYmcaQ2msD46lDw4pXUoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7563.eurprd04.prod.outlook.com (2603:10a6:10:206::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:04:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 16:04:37 +0000
Date: Thu, 10 Sep 2026 11:04:26 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v1 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <aqLVCq9NMk67fqPY@SMW015318>
References: <20260910101616.139270-1-francesco@dolcini.it>
 <20260910101616.139270-4-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910101616.139270-4-francesco@dolcini.it>
X-ClientProxiedBy: PH1PEPF000132F3.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::38) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c3dfd2-2034-4e51-33a9-08df0f5536bc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|19092799006|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9EB22bCD7cZGrRU0XCcQzyg+IW+x+EVX4uFkY0i9gLGRpLZQZsMKLtgXNnVw8Ya+QXT1kkmZUfU0W484CKC/Zp8ze+eJmMGKh9BjrEe4KRzVP2hEdf4X98Bhpl6oKzQ62O/lBIZjtP3ewK/YOBjQ3UrArf96sQ27JtoV+dTjMi6fsH1sv47ZQuW7TEY2MRqJ2x0MD5meeWR4UNdVoE4klV2858o4c5bOoxPdIWGKnIiJxyGI28A6Y6ta4JYHyYiS4yF4N6mKzG+mpGG0V1w9PCriJu93O8G0fWFV1UhvJHH4aGXpv514vXssSWRtoWlLxAsZh69D+x+Csaa+0guzvEy2XsMK0nlmTQ1sj5JPoLR5uP8noBl8iwOXqKc8aBueOcZoUpO4V/C7n8Myv7owjInTrgZ2S9TrZ/5OrvyRSl/ML33TL9N3s5uOlcPoJJjBEojGExgfHw3XNcEYcmUAPePbm3ZBTMJX8Smzhkhe4m3k64iUKtAhbiI+W8wg8+stvp9XOUq2YkRtbHQoqcaUzt/l45kKDp/5pnZrRnLfY8yx72Dz8qdJlvuC4N5jAvxKS5RiFOrMmnrOX+dSD1nIgD3KrTTMzlsEQljZrwhQmK5awNYesTI4mcuIp2jJurayvUZGt6TYoQ8w5+fzXDHJbTBeSGpGKI6zeGBmTdisQTg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(19092799006)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J/P+puQ3VSElM6jglDEezB1LdSKHJanEKRp9avv9yauw8oie+c95tfT0NiE9?=
 =?us-ascii?Q?5DjQy+8+1X6EeciUh5UYEeT3m6jq0y47aOkxqXpHbrqI0adtDtrr6MHRZvzj?=
 =?us-ascii?Q?5tGuC4GrKGKnXz/kaVryj6qCCz9CgC6WFBtakURhi4jHvgRbNHjdMdEwD8Sn?=
 =?us-ascii?Q?fEFU0lfcP2myiDu0BETmAN0BF6B/5gpFFWW00mF2df2kQHCHPWquWv0JmpOH?=
 =?us-ascii?Q?T2+SzFLSERJnTbcyzM6neqq6caVWSYh5PyqB7hYz/3Us643xqfwd9Fx5V3sI?=
 =?us-ascii?Q?K60B2SL6Ept4e1oZLQ24D8CCarGkid484XywZw4DiSP6QUyefT0UK+wpAlo+?=
 =?us-ascii?Q?DtxkXpmdum7jARZ2Kuv+4emDr+MflHsIH1UeW3fxjdBElkCi+i/zpz+0LQy0?=
 =?us-ascii?Q?flH7cC7bIi39sHyBIyLBO7sITqIZ46mu6k0eskI81hU8WN+MLn1cT0IQ1ETE?=
 =?us-ascii?Q?MktF7HMYMzdPQ1SUwOB18NsnIV6EO7j7VGiapHYQ+1/zkTEcOTqxRGAIt2CO?=
 =?us-ascii?Q?FBx5QZN45wiM1XBMtoHvw3liDk1Fo8QS15wL70uq9PvNDhbbHzpJJh7diyo7?=
 =?us-ascii?Q?NerjTGCDrq8iEXorwq9v/5U0f9+zDnODWrBRT4t1xSSpzJY6fBbN8jmSsQQn?=
 =?us-ascii?Q?WqumnZ9aC6//0Wi8nSSwinOWAN4NncP7YlHThGtIhw15XiMhlKETyA7VofBj?=
 =?us-ascii?Q?heAIfoo77nNyt8VH51hg3JANhgkhyD9u0JMISSDmvL3BUKF1rbEfuCy11bmO?=
 =?us-ascii?Q?bx4CGvRqCTmklY9ZYq1DQRe/IVIMRoJpGlkFhPU/CQiYumL3aHj1kPfuQ9u2?=
 =?us-ascii?Q?gisJRU5remReo042aHcJeTuVHvfF1t4CrQXAybp61xrzWn81yuAb1Noj7aqn?=
 =?us-ascii?Q?/Pi6lOss6qGDQWL6v0wl5Ct2mvnaTXqPnMKMFj3L3PwlMrNB04XrscKEqZ+u?=
 =?us-ascii?Q?eS5jlAniAZbVPjQ3QkuU657EgTrke/ixP496mVWhHPyTPA7bYovm5Bav+t5q?=
 =?us-ascii?Q?myRVZcak2bPclZKBFGacKZsO1EBA/d3vBicvzSUmV2O4Ad+Y2phmvq99kpIa?=
 =?us-ascii?Q?v6loCWpGIMIwWkVrmwbrgTfP5kTps9qw4QbzK3qcOyjuqsyzKAcuMwGgt/MB?=
 =?us-ascii?Q?lZePv5lGQy+2bc8ofB+JXB1r05bfxd/u1iSwupZfKeTcLPwyYMPDw4WqG0+v?=
 =?us-ascii?Q?Zd5MjDDDFDzuRTPTF0K+TXsElpv9b8Yi6cewDGBxZ286xt1Nndt/+CSzgczp?=
 =?us-ascii?Q?YJqpf/cyf5VwzYJrDzuxrpQ9ftcYAuBfAy8yp4bqQajbM0emv1etYRqesBAp?=
 =?us-ascii?Q?6pHJ7saZhlM4mr2XRqUgzHv27jtlq5ISMUBvnf+sk23j1N5f1GDZLMocxSXX?=
 =?us-ascii?Q?cS9jewxCf+M8m1gEcCb/d4lbD+9PZzq8v1KfjVoE7F/exPp4nyX3K9IxnoYx?=
 =?us-ascii?Q?bt9FdRMbf763PhKc3fHaJmKRg03ahgWJVC+rxNtS8advDykny4NiTTqIsEpD?=
 =?us-ascii?Q?5H2cmSosjXhwwtWYuJajrQrbif4yrxyB2dSMMNKNWPFox4mtQ74uREHGLe1K?=
 =?us-ascii?Q?zBoJHq2lWSNISAEwxtYC8Mqzd+61ho8Scfg2LaaV5lGkUv8ewYyD0jsL4nor?=
 =?us-ascii?Q?o+DQNWva83TNlxN+Wtbr+S3fBoBLgDaK/8ESoR+06NjV8tPCbGr4PHWtxfSY?=
 =?us-ascii?Q?XQL6cuYaKf21MD7gfEQfAXjsSMhupduRDSO8Lwmx0cv+Rw2JqygE09btXt8j?=
 =?us-ascii?Q?s4E7xSMzBcglNB94Z1P4biZ1j0QwCqQmz7yBLK5E351cspkSnM5n?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c3dfd2-2034-4e51-33a9-08df0f5536bc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:04:37.8779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zP60Kn288XhUDSxpn2gGKJ+BAvlsdgTiYvywuiYTQ+DV0IToYZ/XnLPuya51EGQRkgRv3yNsjHrjyRx1irvQ6KoD1LcmiIwEBIEp0IvO5zLxBjEHRmiA6ZKmqg6+i1kX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7563

On Thu, Sep 10, 2026 at 12:16:09PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Add support for the Lino iMX93 SoM, its Verdin adapter and development
> carrier board.
>
> The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
> the same PCB (the two chips are pin to pin compatible), to avoid
> duplication create a common dtsi to share commonalities.
>
...
> +};
> +
> +&gpio1 {
> +	gpio-line-names =
> +		"LINO_P18",
> +		"LINO_P16",
> +		"PMIC_I2C_SCL",
> +		"PMIC_I2C_SDA",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"LINO_P65", /* 10 */
> +		"LINO_S18",
> +		"LINO_S24",
> +		"LINO_S20",
> +		"LINO_S22",
> +		"";

Can you wrap, 4 pin pre one line to reduce LOC.

> +};
> +
...
> +
> +/* Lino I2C_1 */
> +&lpi2c1 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;

common dtsi should already set #address-cells and #size-cells, can be
removed, please check others.

Frank
