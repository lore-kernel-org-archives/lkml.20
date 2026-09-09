Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381773B1ED0;
	Wed,  9 Sep 2026 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979576; cv=fail; b=sVnQ/zeokWAHg7f3jLFyA1JF0uJK12jp6lQHUSPbPttF3xtth8QUDGob/k307A/vrKfFMMwO+vwUG3+uRApruhciod5PvpuAGLoAkOxUUC8w1UDAwD/KO+t3FalFwWV1iykdEEFB5S37LUWhkA4GZD2x1Bkxp8FRhhHCOP0ew6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979576; c=relaxed/simple;
	bh=B9a4GIbBjXxuAVXIcgHTB5EnUNGZdhRE2F43vtnBzl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p2CuK0nYzxGoavfIjPXMNoIPcF5bIKONxlj11TJ8i74DP6AMU6f5RSN0R1tDZib91rzrgcF816TrzWZ/RiM8QzPpkPDPPL8xRM7TGoMopNLRN6YHoeM9MtRNa6LXZa0e7eB0VWVHltlIJS3KGRh91wYw++cpfeOrlNS10KhXOxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q7icaDMN; arc=fail smtp.client-ip=40.107.130.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q7icaDMN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpdV0a9Z8iwDBWMooOgPOeZMkRjZVYDQaNqrFimw25F9s05Ynjk7sjDg39ZnE/UYlPzpNrBQZjIz52oeWvxrP/cjOQypHVkz2vDnrRGgtHJ7MiWVrCGw7TpOu4KyUwlTYIeyu0VAYK1RC7gmxfxUj4Ar37OVy3m38ButWVIBumZMO7uv8OypCx5JsY1V9ffyxm5IiG6CdPjstwCIIZbtuqJvWWXyKb6lLZubbnWuJ6ArfUgFCvk+kB5MGMoZ/ArSFjk0g0ND7afLlxzsFGlqaA1cfHPFgaRxM6RcbqI+DXDCdnVA4ufaWDro/SZ8fokUlj7V9PR48VEDCDX2V54T3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vk87k6181RDoIKjEI8BKYjwNFPWaZFl5Iq6t/6vxr+k=;
 b=zQVyvQ2Uh81DmdxfMrgLn8GVq2oA/8ptsOEux/ntoS+uK4QTxcpbndp06Y0jf2BealUbRSPj126Ve581pj11Z1CxoiuyZkm+FDuiv9xOFkV7zEOFupZz91PkbAwpucU7vxC+G2QAmS2kbUoh9R82oiPTppG/vmufNYDpU8l+n/FbZrenWr+NL672RlNjfoRYPaqBKgo3mcMsqy/CuInvreV+/uqLn5ZunPYqqQqioCAMTumiMK/1Hh8G+4geWk7n3dNAlqkat/vJWArEV3giNK0d3dpbS58e/VnwVgfL6CPu1gRgb7xphuLhhq+rpAn2YVckpkFE5k/EWQOYFScmVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk87k6181RDoIKjEI8BKYjwNFPWaZFl5Iq6t/6vxr+k=;
 b=q7icaDMN34SQh7gporuTsQwLTxtZI5Z5udZO4NKl11fXUP52xTIU13zXEh6/mXXvnQOBqqZDeYZrTutc/2lSIAjP8ugLVXWQzDZr+DYoGC/URJaMqpLw0zr5e0k63L4wRAqcpS5OYDlVcLokz/csv+lR3A/WKhFsWvFiA/FiH6w8fRLQRPhejimzsRMgLpcUaotKa5ZOih0kqSsjbg9Ze7JEZlY3rUiOnOfuzkng4uVwS7OFzcYLUIkJH1fgd+RqM3FMIpy2NUPDrv+cXwso9dII4/Dh48eqo87Qe4foWJ6pGIGOhzeYuZ2lwEOIJUraE36rxWoApyHFJ8fuRVbRsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM6PR04MB11268.eurprd04.prod.outlook.com (2603:10a6:20b:6d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 18:46:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 18:46:09 +0000
Date: Wed, 9 Sep 2026 13:45:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Eberhard Stoll <eberhard.stoll@kontron.de>
Subject: Re: [PATCH 1/9] ARM: dts: imx6ul-kontron-bl-common: Replace UART3
 with DIP switch GPIOs
Message-ID: <aqGpZQlbFHD_-hVg@SMW015318>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
 <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-1-4d0e8a75db79@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-1-4d0e8a75db79@kontron.de>
X-ClientProxiedBy: PH8PR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:510:2da::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM6PR04MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da11d90-382f-4dde-59c5-08df0ea29d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|22082099003|18002099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	HtSeCwd4A536vACWrzV/+LCJ9UCSKlHDgQcBjfMyAmrQ7SBPAmR5tzWxhFQJCRVlNPQXZ1r38pWTPquQDnJb/J+2ZHgKm2zm7zx0Dt0pLYPTliqjOkKuYQS4DdWg9lmWyYt+uXvo8zri503xT4IcYZ+aVeyGDb8u+Jp/Cw+LbmxINdVI+jxofPa+Y+ossI0V4kC5KOZdDTOTmHFrXrqxEqJD4q81fnDX6M/yX2IBQCoWymCM49Poti/DEZxlIgHdMMfwOhwPBU50xrJ2Nl3TDJH0yXUgfdGesl6+dxASlrWyZgP0mJtbQj9L1pgw/sRKgcyTvKmRn3dS0Zh0RcWXRgU5LQI1+eUQ6vjvANElmzJdiIXcgWROMzQiSQuXYoNDRxk4l7ohMsWoNjF0m4WrfP71I1Vr8yRdn5+HRt0RhOCKyKuWPeXZOhdijOTnZ72Y2WZ3lN5sVusQU2tLpjAbvWelhJU7zLC6bckZbjtprktj9eFYwX93XNCKcbpM4CFgT+1oJsS1j7x/mDtO1PORrslR9y3DojH/4z3o/T7wLcLbh7u+UbdlpEpGmXnmQ2XoPKL8JfSs+sBuXuhWPD/h/erPqYSJ0+kuEJwnQnMxLeYn05lTjlA7lRgJfEwh32NkR0bGbSp/11zVlUGoh0jw43zxYf17bN+/E+57I/xkoVA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kbPyK1upnUS3k6m3len73SfIL1M/NtpCCgeVPtnDIKX71K1Nb95ZGgEURuC9?=
 =?us-ascii?Q?jZLJh9qAvg6hOlrvpKeYykZs2y1O//7p4O/tFt9DfW/aJmwPhGLgYA9ADvG8?=
 =?us-ascii?Q?y364MMZW95kIc6eos9dcAPW00oXThahKALtMfyf+dizKrKh9nuRQECliXtLi?=
 =?us-ascii?Q?RZcktEFsF95tXFCL34K8RaUIW2AGqRhO4CbdNJLy5/kGHq+jkFlKFdbNB3Nx?=
 =?us-ascii?Q?MgAZawdVpvOBzdI3tpN0inNkReVHn//ax7JGH4mNCQNFwyFQUBSEaiWbdqXf?=
 =?us-ascii?Q?yoZM7NM/uZtnZthB836HIKQOhu9O1GH5RQkbmAz6iGzCKt3PhaVcfYOzFi4/?=
 =?us-ascii?Q?6nZEupNPDpCs/vzC06ohhn6jNFvPQV9SuOvdxcOtrjnLA3HxQK/Knd/BXmxv?=
 =?us-ascii?Q?pFecs8gU7+8cuayU69odYmLxnM4OMPeM6GK9+jLlUz8go/lmUytNRMxSE4sk?=
 =?us-ascii?Q?nus4HD21s/yjPSIocoZ8UpSlW20e9FpTOc2xbuiuojlxb6OaIxaBG+Qdx3n+?=
 =?us-ascii?Q?y+S9/I1oymHz4XZC/Ajgj0jEndDgRGVhDUwVAGs9wgTvnqapU+PFxobaaEYO?=
 =?us-ascii?Q?zCNYMO/KtAJs5stBF3Jz1C/uk9QFt+hZrSnwqDC4ZmjQ6ntXPePOKlR8JT/C?=
 =?us-ascii?Q?O73cu8K/OrYFZzJau6MZYNMSlIXF2Rf+abeEG4lfdlu12UkTyf4r1RgkjpsU?=
 =?us-ascii?Q?HLTw709Zjsg6sitmOInq/HlmkOBoTsbiAw4N6wpxFKgupApCvpMDq7HWt2RV?=
 =?us-ascii?Q?ASOSnSA4R7rbBN8UFHAufDbLgJGVFVqy+Lc73khiKvYJkfpo+iW6wmzntA96?=
 =?us-ascii?Q?sExfZ7bh0XEn+ek5Gf3v2NWW7KHlLNMkFP9m23wiMndjt4EEXJbrSQfYvoNx?=
 =?us-ascii?Q?2H5XwBfplcbAjQqVqFcHuHNLYvnIgXrTYZgBD4lcsws6NORk4QE1WCma1oLM?=
 =?us-ascii?Q?1VME86UtLiHJ2QcJntv2pBChzI8/dzQcYXJizChj31tgEBcBfpYecswpWajp?=
 =?us-ascii?Q?4T7WsGVjeXNr8q13pwKYAuloncgcnxTxdlvv5LHvQ3+6dkoDTA+WRjToa45e?=
 =?us-ascii?Q?KisIxOmd4dRhiErtyGjnVuMB2WhEGhhJaW8oGQJsMLp+v2WppTH+S2IA8dbB?=
 =?us-ascii?Q?E/cK6yzspW1lm4h8rHBUtbvznyImBvJZjJS+TqwQoYyDBc+J14So5JuQ8qrs?=
 =?us-ascii?Q?Tqx0XnSx5J6+K8Ag9MKGAN5hdZPyFISd1CZlc15m3GtT95HpHqmqEOnyxO2H?=
 =?us-ascii?Q?SpI8ChTmHn0vraftPSdFodVB1GaaTdkFYmkBcswiaQXH/iAX+gv699t9nT3t?=
 =?us-ascii?Q?GphB4I+YjtUKy0YBCfEKUchNw1B/ImQeJXEn0ymiwiUEt9a/v8bjkvw863HZ?=
 =?us-ascii?Q?XdGX8i0zSwKw1xbHNUXGnoSzIzY5QH5gdG9GmQF8VS8b/wGVDNsPVHyZ8sP5?=
 =?us-ascii?Q?UVvqy3oFRF+4zDS2bGX7mhb/Yg8ezTyizZzA9y3zHxQKdX8M7UczFXeRhChh?=
 =?us-ascii?Q?WA5bJ5PZHSDvtD59zRDGu4a3pBcvOBWtmy4mzuYpgTpS98osxD0MKZIaTGGV?=
 =?us-ascii?Q?/trAsr4aHnuI6FntLVwJUdq4q0fAERZ0yBNk17KOwpiXCRbAKcTDGuDn5Lm0?=
 =?us-ascii?Q?X9ejuH1xyGM4XWkr/ncS6BGjAnIqo++Ke/G+sy20tG+AUp2rxAGCdAHTOwA6?=
 =?us-ascii?Q?9iIEQ5yNOoZMvw3/Mjk/5hg3O5E9Lvddo8okhaYkvb1eX8YJlLrLzkU9Du+L?=
 =?us-ascii?Q?huWVixRySmzBB78Kzr8sUC/GqCfJT0jaz9gLi0dn1oJb1QMiYCXW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da11d90-382f-4dde-59c5-08df0ea29d13
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 18:46:09.7498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbpneEe2Bg49pvjH/Vx84+Lh6/9OYyyjoHvNNG4k5+OHQwfVFT9ox681qAbq/fv5zXtpVgIjqCM5Wvxn2l9q69+z5RbMpyT5eGCtzofYCcmT+jKpkS5mIBK3pEWAoIZd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB11268

On Tue, Sep 08, 2026 at 03:51:48PM +0200, Frieder Schrempf wrote:
> From: Eberhard Stoll <eberhard.stoll@kontron.de>
>
> The latest board revision has DIP switches and lacks UART3 instead.
> As the old revision has long been deprecated and not maintained
> anymore, drop the support and reflect the current state of the
> hardware. As the old revision hasn't been widely used, UART3 was
> only available through an obscure extension connector and we have
> carried this patch downstream for years, no users are expected to
> be affected by this change.

Remove "we have carried this patch downstream for years".

>
> Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi  | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
> index f4c45e964daf..a71669bef7d4 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
> @@ -172,13 +172,6 @@ &uart2 {
>  	status = "okay";
>  };
>
> -&uart3 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_uart3>;
> -	uart-has-rtscts;
> -	status = "okay";
> -};
> -
>  &uart4 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_uart4>;
> @@ -283,6 +276,11 @@ MX6UL_PAD_SNVS_TAMPER5__GPIO5_IO05	0x1b0b0	/* DOUT1 */
>  			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* DIN1 */
>  			MX6UL_PAD_SNVS_TAMPER1__GPIO5_IO01	0x1b0b0	/* DOUT2 */
>  			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0	/* DIN2 */
> +
> +			MX6UL_PAD_UART3_TX_DATA__GPIO1_IO24	0x1b0b0	/* CAN_ADR0 (DIP sw 1) */
> +			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* CAN_ADR1 (DIP sw 2) */
> +			MX6UL_PAD_UART3_CTS_B__GPIO1_IO26	0x1b0b0	/* CAN_ADR2 (DIP sw 3) */
> +			MX6UL_PAD_UART3_RTS_B__GPIO1_IO27	0x1b0b0	/* CAN_ADR3 (DIP sw 4) */

supposed header overlay or real user should set it. otherwise, the real
user set it will be failure because pin conflict.

Frank
>  		>;
>  	};
>
> @@ -334,15 +332,6 @@ MX6UL_PAD_NAND_DATA07__UART2_DCE_RTS	0x1b0b1
>  		>;
>  	};
>
> -	pinctrl_uart3: uart3grp {
> -		fsl,pins = <
> -			MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
> -			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b0b1
> -			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b0b1
> -			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
> -		>;
> -	};
> -
>  	pinctrl_uart4: uart4grp {
>  		fsl,pins = <
>  			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
>
> --
> 2.55.0
>
>
