Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1307B51CF70;
	Wed, 14 Oct 2026 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986142; cv=fail; b=Ynkrk3gQtFcVjg8IQJqlxTFzJICyOEduiZ8NsB+AAPLw1FmTPiS7/FO+XwiE+96Hw4X0N5invJpX413XrEAmS+n8FWXcpBq+LCjvRI0+aQyUDL+GUSzneDVmEzUB75gyNsnmLtmDoVgpSdf2jPfNGqa3Lda5auKLwCsOnQUvc4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986142; c=relaxed/simple;
	bh=S6+HFYIg+zdxGR8wAF6TgRU9CRboh0mEUiNyGvxM6xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e5GsdYMPG21OppQNWVBbHk1KlvD1SjlNUYg3UJSst0jnAxXcYaMMN1jtHKWqD8lStYMsALNhVUnO/wyTaLnk5meuDMcD+EBuUzzIH2IbXToJrr231EtJUau0EPnycngAztt8iBFN8aXdVSOTvla9dSWPYDvyOzruEEBxO+rsV3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E0gBbP0Z; arc=fail smtp.client-ip=52.101.66.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E0gBbP0Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYCh9qEgTRe9+5YfEOB67JqIHGWLAejjRHGpVpPR0fYmyLYdjcwl7ab5jon2zBnqB6E6VjXExtwcaexWxxbIAqSQn5xGyA9j8S2a1lrS5sYrlx6UyJZ90KGFr1iqoC/4yKAW6pJz/2N2f9hU6U5tERiTWaaQXyL4G3nikCYGYwyM4FyCONbS0NDsNCzDcNCynM54wx0nn9i2hv/qXQv7Pos2avP0ZvSAksgBvH/z9zlSRfuwG0yhc6azSttlqRZpCyWCnDSTe/WkPROpNDIKVRNOFfS74906qcwC5nztfh0UqP3/cHwYgmQ/yKaVd8Nbie8l+B259spLnPpvFs3reA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6gHCLzDRSqYLaq085ZlrN7eR1mwVP9CFMv/OS8W9YQ=;
 b=wOEUGnKsAIi/fbgqctZeAQOrdWctaSqKMdvsbdO/yMhI4LEGmNrIBpDMDAd8OZqNxboat/OTXaDjWO1Nd+DPZWK2UrQ4nnwWwewySL3dyGiGz0cm+L84slm17ZRInUgeCndCE4MxilqvlbqK4sZJhrkNYKdp4UGhvebUtpXrv55/goMqApwZcAH5EnmtnRg9Hhz8CXSYalaL0mRVZ3XiE+usLKkiDf4Y1z/eb84+xGNsbZUVeN1X2iH/9s70pDLvYODX8ZThTtluGCjyyDfihDCK4I1dRm3WLjbcNXpmEJS0dqIGKvT603WpB635uDfVqz86ZBoUObbkFjLitLAwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6gHCLzDRSqYLaq085ZlrN7eR1mwVP9CFMv/OS8W9YQ=;
 b=E0gBbP0Z0EZK9UZXTSsFdIQO9/47nksTWwfKP6dyMB9RTNYnfvaEOB4ZoCN21WVWWhBMcUeQkrTijfLX1XqevW+FpTM3AWsElvkK8NUIMqVq62IgVRxZl+XbdZ4QX6McliZz8K4aDVA9sYClqHLY2mKPGOEE5mngrVMCvF4/3dFDGihF5cwON9bMq4rS8pvNYk8+N7iCNwp1gOoMLvXHbkxCQ9rtKKehseDA6kFH/b5/ZJ1Z9WxYLDnBMUGMfdmplxhdfuCDoKZMw2HodNVZJC60W52IOLTnTT4Heys/XbBjs292W3WKZ/15EYIeZ29SyQQbOM/9hMay/NrCYeWa0A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11901.eurprd04.prod.outlook.com (2603:10a6:150:2eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 13:55:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:55:33 +0000
Date: Wed, 14 Oct 2026 08:55:21 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, Liu Ying <victor.liu@nxp.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller
 subsystem
Message-ID: <as-JyQG5vgaPYLeH@SMW015318>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014071657.118378-3-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH0PR07CA0116.namprd07.prod.outlook.com
 (2603:10b6:510:4::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11901:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a3d3ff-0752-451c-33f3-08df29fad0e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|19092799006|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lZuARZEQjkJ22GoJzna5z2jXntiD5+Y6FmbwSA34l0yvSFcxfxJnyuusVDiM9YDnuod3B1uOjCT241Q8kwL7Ljl2KqnSSy0G/rtPedlyC3KtYz8jnp44j2fSUgcj8C8yRxA3z1AEBsDEvyr4k8xfivzC5keIelUfUf/AoXWhmM8s3JC4X3T7hL2exU1A3AHXPduwvTMYCUfsFH9pjvbbB9Zu6uwks9q80BWJ8X7Dw5MRkUvakJ+qfMzNQwpeKVW7nPIllBmHKz4uW5OGY7uYQ8kSOMu8SNb2r/3ocped4Tv27P10N3KyZX0jLZkCtKbVkFCfbWXx+3GXPJZEgKqT2WUERwk4MVKzrKN4A57NlEFJXfAIsIjfZu/+MoNE5+wzR8eWMmqxmYN3Mwjg2zWN6J5BNR+wkW40TXCmNSmKoIKW7vGPUlupqg6t742AWQey9+mG4kdU1hBxUir7X+92GcB9Kf75Xoy1ktakOSua6gYA748la8yXzHVwTUxYMLrR5kLoHKKTKOopXCub357fcH7GrY2PcC3edLJSNHBl/WOqOIYTpAs+07Z8af3AqAd0WRZ76dFIbz1EgN00avTWwzwfNWhVZOgl0NgwOTRr6dr74VOK2g7OcVcPmVWIfzstCkbHmv7JosICm98lRmnWxAs+aZo0KHfvu/s9B9KXxT8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(19092799006)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YZrs7EW95Zs3wlvzGy6pz4+ICJCJEc+DOn3UIG/1lu9y1E36S1VYXZDJx30T?=
 =?us-ascii?Q?MOcLG2S0d85DLixfIFpQza8nKp+8m+wb39/+t56YKZ6gnTp6N3R6NC8CVrgo?=
 =?us-ascii?Q?dPWCRVW2Os0uBmgYl1yGVpY3f38yC5DsmMUR5lBhGPhWQ0NKaVuZBfgylMxD?=
 =?us-ascii?Q?y3lGxXcVlAHg4f47qwk7SzDtptkFTT0jURMmRNzTltBhWCgOGu/fAqMA6JWY?=
 =?us-ascii?Q?4TpVPxcvCd0pneB8I+muE7FH8+E6Njt/pYKDTeKuoFK3186BGrS5zl1cVi+5?=
 =?us-ascii?Q?krJ/twNrXsTOwCJVtk3eQHMy3WlJcNThl40bDNeR0rs3y6yG6Iw5phMd2FDe?=
 =?us-ascii?Q?6b1WkbLexkcWf2qo0hUknY5JgUN+afN7d4udvD9WOjBQ8Tp779TNKP21FKJc?=
 =?us-ascii?Q?RjPRked/K0A+f7WsJf89U2yg/B+m6ZbMIv6TI6/4pE7WzUoRQjcMU1T2GJdZ?=
 =?us-ascii?Q?CSV19UXL2SHMstWbTw+neFL0SDRixvtb1EtIm1dCPOm3ZAC8asMURu0PkuS4?=
 =?us-ascii?Q?lG6eLpSISu0fP2YW+XrNb+OrrIz8KDBKcXyw+EQ4xqrfO+ri337ZzTtDA+SP?=
 =?us-ascii?Q?e8NyqzUfx2NHzDQNY0P3Xt3dTjnutSpDAs2K+G92tOAJ7PCcpDy2/Sv9dpe0?=
 =?us-ascii?Q?c5Qatg1at5cKrfGYlGFSKEXSlWGsGzYjMf7VZz6jYfYQHmUQ1fNIP+f6AfgQ?=
 =?us-ascii?Q?ts04X27LNslOZNlz+6iawXGLKxqmRP+CO3Jq0DiRyl+nunbGzDnFl7H9Ynz+?=
 =?us-ascii?Q?PzYqE7CzxMpMH9N+XA5lC2T3cRTC7cB600NKVYAIX8COq4uIfJ/iob/C+AdT?=
 =?us-ascii?Q?JrrxUEYLFNw+RXV6WyDJ7l3yhKstvdeET7M1iCvnSLuEdVpyaZcYWfy2otqX?=
 =?us-ascii?Q?197jVFGqk5QOTPR+0u8skXlE1pso9Cmpp3gUHy0wUcl7rxzcmEwahfz584yI?=
 =?us-ascii?Q?FFPWgCwf873m0QCTleqXDgGCjGnpEDNarq1jsxu305FDYWn+oYJC8PFfMT+W?=
 =?us-ascii?Q?pK9BgUEKwE7B5WJ7bAuYoR2SmGFm3ATmjWsQn1FsdVcbHk8/iTsi5XdcjiaI?=
 =?us-ascii?Q?8gSEGGF6TOlZ3/431ZcyLhfXGNDoItcLx47zPmdUflV80+zaSvi1KreUIeT3?=
 =?us-ascii?Q?bWs1DdWN7ltrilEJh9KbeMS7RftHd1QiscDojpPE0k1wU+dN/skb/fPM8zn0?=
 =?us-ascii?Q?C0CtAiVPZadnDKBeH+PexvM5uc111V8F7Bo3zkYxDYyVVWaJndRyftgi2O/0?=
 =?us-ascii?Q?+r5Y1SZDp70nGEMNKZCHPgKy7mxvpmzbXvssklsMPmnojw5Gu+4OmnPP0jv/?=
 =?us-ascii?Q?eO5kzSRaw8jQfMEJF+KaGh9zZs2Cw6g09jRYlOu493AUOlf2Y8KixOkq11vD?=
 =?us-ascii?Q?pEMfB/s/K3VnOpNWETqAcvPLB6I5mWIGzCqva+8zjFLqKgrDMJH+j9I7TMmv?=
 =?us-ascii?Q?1XK3I5yWKgctFqvD8GWFUI5mWwiLpwkhnwbYCqZr2kqMbIzCSlcs9FA8fmES?=
 =?us-ascii?Q?vCWVAbQEoVjFA9YxYceClthVabqy5I63Q6+PsMHUSzHYEltmw2zxvXa+s0v2?=
 =?us-ascii?Q?GNqqRe1ZQ/muH/JJHbJjnbu1BOBhwmRtPfpfGUbkSGYrZDtutJIKWk2Aq7Xv?=
 =?us-ascii?Q?/SK+T80qNj2K18r/prKAH6kr6AbvfRd1z/qtx99etkSNGTeKSkQXCcvSD2qp?=
 =?us-ascii?Q?PQt+ktonYKzraTqckR/qaqS3h9WK17ARV5LTO5oby11aquBZRRIWr4DB/i1w?=
 =?us-ascii?Q?l4gmo+VPdrIGsz7opBEIJk0FSAsKHr5pGZSK6KBscSsTqC4unN4A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a3d3ff-0752-451c-33f3-08df29fad0e0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 13:55:33.6126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4yv+PqziUTSvATlwY7K5zTWfJcAjGk+RltkZCJgtBq1zlPkyS+zZETfz5zY1fOTWWC0tYQ7fZHPeDeryoxJ52ZjXZxkrFb+V7sL5ObFV6Fl5vcBQ3jx5nZBKhNRQEzY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11901

On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:
> From: Liu Ying <victor.liu@nxp.com>
>
> Add display controller subsystem in i.MX8qxp SoC.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Remove default compatible from irqsteer in generic DC .dtsi
> * Add imx8qxp-specific compatibles in imx8qxp-specific .dtsi
> * Add power-domain to irqsteer
>
>  .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 ++++++++++++++++++
>  .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 240 +++++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   4 +-
>  3 files changed, 651 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
> new file mode 100644
> index 0000000000000..e94fbc6eae07d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
...
> +
> +	dc0_pc: pixel-combiner@56020000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x56020000 0x10000>;

reg should be first property, check others, you can use

https://github.com/lznuaa/dt-format/

Frank
