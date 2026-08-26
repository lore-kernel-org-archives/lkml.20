Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F72353A86;
	Wed, 26 Aug 2026 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760170; cv=fail; b=Lv6JrNMxMp4NDqdz6JGBT5mm9rb8GJtwvxzuxhlo6yKIFcOsWdMSiLpwP2jgpiw6PiE82KwVSNM4BpfOS2Ag1HcFPmgaeLIhEXM9lNLWnfZfCv5xVDsWQ+Wt4qopwsd38wg3aHMPlxsjPwEmwK+e1TYI8F0Is3lpl/4/LBQgHeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760170; c=relaxed/simple;
	bh=82tTSL+dN2sNHIfb3fn0s+xevlKMIiLrSkTqUG9su+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iOxEcWg2fKq6ZTg0hNKjYdtfph4e8eCOT/fDgGNp0njw1B7T1gC+Nvdye6PbUOWT0NF1uKgcNJ+6HmWPQYYNkD82E5UEDkroDlJFeONIRVX8/R+d5PIBp/CqLVP6ILIzgtX2cTaxK7cgwOFxmqFTpnYWiR3q2Uw8vtJmTlv8zMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qQprHYFI; arc=fail smtp.client-ip=52.101.83.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qQprHYFI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8/JIpF6RvAkwQuK8AShQkQ9bMgiBgGXpqyyexi4VKd7nQGM13J667gIXshXQyLy0aD13mg/o66Et7z5Yhg75xWiU6ZkIphTGi+fTx5IPcty/rLV1kuKWBsz1RMYOxba2ENQkeSwH3vn+qnN9XEqvCEM5ymUL9fack5AFDteK9ao+MqXoJGEmCDrBIZ7oFiZWqw+OQivMpJZLDVdaf0QA130gY5u56I6y4aVVbqD7Q0o1YPVcMWzfTPnQiXmkUu0OzmXDCzzD8TMeT8G0PR7dJAZptSvXCj1UduBtjjoua0rBfal1qhiOWEEDKIStEnelSXHPW/i2byWYNFurGgdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUwd1ucOG8ALhtfYz2gQ98XnGLfH0YB22iC2eKhBmoQ=;
 b=RPtEKaQhbrj9iWzQqIowiWdtZ5d+Lnj8TYgPNSPHswSNKNFLujL6PJHJn3I24UN90uezQoUdsD4u/p/98enNVyX2dildGX8ZGeh249KVnf+1De0rFGQuBUfa+bWuwIzo7FxyKwO1VTSsjvFjOSOlR/lUJt1lQLaRLB237nvneF2bAa/QktU9sLfaI6B4JopZPraNBhiBe8lS3IR621gh5OLRB/CzcSZU5QL6ZQOZfuT1QF1L/FbXC6ju1j45Yu7JnNIxjF2nejQRYEIoPyh7MMlWTglwDBEHRHiePI27sFp35bL90wnL4tGrxbU050OfgIVQCCcxbpRb7GLlbJlSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUwd1ucOG8ALhtfYz2gQ98XnGLfH0YB22iC2eKhBmoQ=;
 b=qQprHYFIHBf2KdZwtO+ZCN2vPvPC3wEYO0j3yCTM3PioT/TS4q6l/7iVzksMFv7zvbO6/JOcjrFrjo+mC32lZDRlb/ci6P9d5/XmsWgg49YlSI7EebHvx7B8EGz70v9e3tqPFPamMJt9uUQcudSblaAy50aPt5kKzXVnWojWTN+9RuKPLIaH/uv9AcoDnGbESdK1VZFx7mXcCQyJDiyox/vkxLv8A0O5lponpVQ/BFkXU6rUH6l62Aag3zIVIdG2V8PWbq/hxKARCFDXneCxtABYzS+1faoE3aWrARYwMddIp55zDAaSk55liHW+h+iI9EtkX9RPlOmr3C7YDDGGDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10201.eurprd04.prod.outlook.com (2603:10a6:150:1b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 16:02:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 16:02:44 +0000
Date: Wed, 26 Aug 2026 11:02:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] media: imx8-isi: Reorder mxc_imx95_data to follow
 mxc_imx93_data
Message-ID: <ao8OGo-B_alEb30X@SMW015318>
References: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
 <20260826-isi_imx952-v1-1-cbfaaa3f0000@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-isi_imx952-v1-1-cbfaaa3f0000@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0084.namprd11.prod.outlook.com
 (2603:10b6:806:d2::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: 1113565a-ff6f-44a9-1575-08df038b76d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|23010399003|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m+9biFZnWdDs2TKzbV4hP+A9dTVvdKFV5ej18vUSD3Adl0d9L35xIpWC7v4aqbLWX5GZZGQ90KITLRUh3WkWVOytS+Tpr5YeHGHEm4K27zT3Shw0+A63lsp2RvTXOIqJ1D7bZfL8HlSWQRIELlhAcLLGJ1iGR1W5uCMf5U6zvm9mxFW7KCcGzKQMlCYGZS0h0k5FpTc88Kf/pr6pfR19kL39kBJP4UZvsY6CHi8PYzxwrZBhtpAzceOYcKOL+YEcUOx4ds9BIrrlL+NoyYtC5QLjbCaWQw99iHdxmZjxBMSmQgH+hoJzQtjLIb/CYG6NDyXnUnTpDP7J2tpY1Hz3pzBLZ8lPbDA6xFO2vBL8T4HDYRGimo3KRS/vlMCAyGX7FzX2AmpxF2Dhx9kJPOeC59vW4jokgbCttTqnRaqBSum2Zamapv3MPapjxnLi5YFVLC+/pSt++Ul4ozc1LAAREhxIJl4XQcoIl6qv71QYuETWk2glBxLUitm+O7QhjFqXRadEUPlol6wPHHhgSYFX/yrr1Jgb4vj/uM5H0XEoyX/WyKw7XIi201AGTR+moA9A/caqP3Mr3v6Rx2bFwkSkbYNpAtCovT9dTF61F8za0fSiFYdlCdqLsmE0njzSqgjDyvSMC0xNCz3vhCNUHDaBaSUxtfjR7gYAuRuMn5zE8Jo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fsg8THqoqGejSZRZ710jhQD+TX0/tNCzSgRwEbbM4KRFKG15qHcvOpjxznjH?=
 =?us-ascii?Q?IW4T4SceO0MZYNgcwjUFzY3wa6sNIh7LHdXHkNOfLn5h6GlosBWxPBylxkI/?=
 =?us-ascii?Q?virgnKhOFsH6/Hw7sGl0POgYzs5kWqYNryWUvtru/OqXN1pAmlkf6+Fdyt2X?=
 =?us-ascii?Q?0VBC5QwiH449jDmMfuZUWu5rqP0cm2IYZuwvuoycW3sDzQIxCV9YQfIEauSZ?=
 =?us-ascii?Q?HWuJsZYDWkTXGNJnpJmj6XNICgXDVE1QoAkk4we6JrWr13cat5IdNYQcXwes?=
 =?us-ascii?Q?7J2u9ax1plJpSkBBx0qP4OmVF0g2qdKtw/3S9GeWASkvjtjXathWBPrLBGAd?=
 =?us-ascii?Q?6OnpcFMNJ/+nJE2kyRPUi4uVU0pU+Y1L+4bfDf4AbLFJK9oGff3PvbKqI3Rk?=
 =?us-ascii?Q?KwEXSsL9oNgNfSBewK4+eNw1yegoFdr3ey45huXEylyqdugJwFddPIfqoVxh?=
 =?us-ascii?Q?93KFBarQS6YehhdLOS66KAl7EDVg9Ufk022/ZO1FrsR8xf6DYHi4XQlO5tT+?=
 =?us-ascii?Q?9tuZJxplfiY40jcOP5uLNLEClaLOcyiZ/s7RHgBELj4TiKFD7oHPNKUAaQLW?=
 =?us-ascii?Q?5z1vUVVp449hkRJYIP2WMJfzVnj6OSIoSNLXVJMe2HhSdzuT0KTz0C9IjJ9C?=
 =?us-ascii?Q?KBd4Axfan4BK6mXOm6nA5IlZzQA7xj4aQGMMhcq7VRQ1CDoaZFxX795SHoJf?=
 =?us-ascii?Q?fsXtmZuAQ8P9max+OP3D/NSienn6A313yVwzeAx8rrpf7efb7rtKn9VPkAP1?=
 =?us-ascii?Q?uA8vRdcw18mMs3xhwmhi+jkRn+VnaCJ726vvLEVwOWbq4jljii3vosevhuY9?=
 =?us-ascii?Q?mPgMstyKlXMy+6H0XJYN2ECgLLwWzj33u1v3PvG/ySS6ARsRqr8aYqVXLXYf?=
 =?us-ascii?Q?aifFjeR9wP4era0ScMB2eohnYWGsavKi/2E0W0w78788CYyGA7vr2LeKFYUp?=
 =?us-ascii?Q?rjdLpcjsea6XlBv5KEMkSvfXo1N5h8C4CbHq/AUq20qrWkwlM1Gmyfemka32?=
 =?us-ascii?Q?00ZxVv83EUSR9CZHQA9B0UFVH2OCX9NJyLCcJ42vLI/cDGpmf+e6vXCRYJhT?=
 =?us-ascii?Q?wtNeIKOeUnI+QB7+024wB6V5VDyxzUptMbbL2NA1g/uAyUkQDzEGAbY0J/cM?=
 =?us-ascii?Q?IHal5IVgHD7PTC2FBUwJCB7I+PgV3dXCEkE3o5oxKp9y7KSTGpfeMXQHU5p4?=
 =?us-ascii?Q?aLyMWYxrSoOs5CWqlLQbnr6C+YDgxK6I60Op3DkfRwcn+Vtyymy7nod2AGiM?=
 =?us-ascii?Q?8rqkoJAUwYtIaX+B1DjwE8VLlTkogZw9TWE/2+ueKJ9JATbqG4l/EiNoQsHW?=
 =?us-ascii?Q?UddOS1Ghqi/UKs8WKutSuvfR3Nq2R9h5SWn6cCSLYVMl4ahT9IrD1Rfe70Rl?=
 =?us-ascii?Q?ssaO+yM+IoIP3vwgH3Z6e1Shz6/YIbM4cV9h2Pw6dcR+9F1PyLvVRsZunDn3?=
 =?us-ascii?Q?A36I6g7m6KgjG8iC4xTpgIwC4yl5KL8k4RH4AKQJ7nczjfrgdPOuF+aeAEbG?=
 =?us-ascii?Q?8SJUTIK2NYxISloLxwyfxziHnmln/fUZCynqueVCDCyzu1SHqDtYgh9ONZ+J?=
 =?us-ascii?Q?MX1mSwBYYGx/C+iyH1TrdnmkA7GfyJCkz2DrUy2aQj2d2A+NEpi6SilDaTym?=
 =?us-ascii?Q?WKYOdHa7DYZS3CTeah+fYqM9N67v4gsPrLXm6rlAm8lkqJNmlNsBd1IYxMzb?=
 =?us-ascii?Q?2e1fhDTd/EUUD9/51vA6GB1Cu33grCK9PmskD/Ya7kNfbSuodZKes/0fj6QP?=
 =?us-ascii?Q?oAK2ccfalKyMzrKi2pO+Q/DkrD8WhSSmLsobCd7x7RosrKxCHg+D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1113565a-ff6f-44a9-1575-08df038b76d7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 16:02:44.1864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOEtwOAN1iFKaya7SELrT7S3Ykcn7SqtbFoL4JQGjBFV2KHbIl9Rb6+ucGdkprNUGGNIBRmgEb1aNetXzKWnoWfgDNwfnH+3hPVrxSNoJVfDe4rTeoIhMMKO1jwgJ1yl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10201

On Wed, Aug 26, 2026 at 12:55:42PM +0800, Guoniu Zhou wrote:
> Move mxc_imx95_data definition after mxc_imx93_data to match the
> order defined in the of_match array.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 0ae5f35e017c..f2a8eb82fbfd 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -314,18 +314,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.has_36bit_dma		= true,
>  };
>
> -static const struct mxc_isi_plat_data mxc_imx95_data = {
> -	.model			= MXC_ISI_IMX95,
> -	.num_ports		= 4,
> -	.num_channels		= 8,
> -	.num_vc			= 8,
> -	.reg_offset		= 0x10000,
> -	.ier_reg		= &mxc_imx8_isi_ier_v2,
> -	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.buf_active_reverse	= true,
> -	.has_36bit_dma		= true,
> -};
> -
>  static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  	.model			= MXC_ISI_IMX8QM,
>  	.num_ports		= 5,
> @@ -384,6 +372,18 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.has_36bit_dma		= false,
>  };
>
> +static const struct mxc_isi_plat_data mxc_imx95_data = {
> +	.model			= MXC_ISI_IMX95,
> +	.num_ports		= 4,
> +	.num_channels		= 8,
> +	.num_vc			= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= true,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */
>
> --
> 2.34.1
>
>
