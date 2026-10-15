Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F78403EA5;
	Thu, 15 Oct 2026 18:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089246; cv=fail; b=Rnxd2R/GCp8bDMQzxCaD4ILzX2VSstQAkPHcaRymToJjoBK7jhlcbr5zQYiiwKYYcO/2kBLrmGzHsBpsDyKkiQImb4uF5NJxE9sSFf2jL0OFmQK2k8QEpTgydemqfwEokJ1iutjbXnEWtccyFCvMTLs8xTdshfT5ALdz7jLQEWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089246; c=relaxed/simple;
	bh=Ta7rM7YENTemrsGFjILlJw4rtrc77svTPZskuhgw4yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=asyKvD4Pl0K3OT7QyEZzWTYeI18N0EUeSFBl/w2g4meuCFEA86DuY8RfcDNQmki4ywOKhmLZF/UNZLwfZw8ZO/prDDjHQO2c+RW05NbuAYBCq8vQ5/GuHGn98lm7HhxAxmX2MrlXuZ8NQPdQVwyMpKA2fAfHMQQPi0Z/J8iwZCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YcVJeSwM; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YcVJeSwM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAZfEoNsZw2jfg+Sk2HyyOtB2/bTsMYQB1dTzkNoDKKuxUVz+MAadiYEvf5Wd0q30Ry4Znj0Q7tnEsjKJZs2sd+QmHmWFB7KLq4WcvL7nQJ4eIKhT3vkMpsZP2NsuF9ODSGO7Gi+sPiEXwYQOTp4eVOlrT2yxeep1m9y5k19ATqQO6tJEuopTTfA7gWvz6Rq51Smo/BKCDdL89u65wkcOFQasUonGz2jeq3G2VB9JOA1mLsXd68o5GSMhB+7DXyNEaVN7X/XWrEf4Ke43mWzrluL4j3m41cWUM+tcwY3Uxn/I1o5W47cWriYiFdIBSd59KdshUlw53aSmXaOv7V4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jV1QkpQvi5xFROUTCJVBSueJRcHlbbQtmxP5HKm6q8=;
 b=cEXOBk/Nt3trZ37ZkH05/e6YfvoKy+ZiQecLtdo6/KePoMPDO144htu+oV9s9pZtXZzyLligWe9cA3H8Fp9uDtqTuezoB4NCgkL3vWNrgIxMkA9Rge/uDHT+eupUwNVI+suV4HjI3uE8CYW3XS/08EB0rD75ko+iFJhDfyXpjG0pwMs8uCL1/SjJzjsG6Ze7WwMUUscPE1lStHF/xUea6cD4cKqxqGXyI4vpg5RNNKM9IYWOFz5wRZMGD9xfKtlpT8ETPl2L5vMKWFJe9LIo+QviLadRH1xEf/fMIVjv9M9M4HpMUPu295lk5CNA/SwiFi4lwaP8Cs3FweObKv/h3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jV1QkpQvi5xFROUTCJVBSueJRcHlbbQtmxP5HKm6q8=;
 b=YcVJeSwMD74Sd8NhiWfY0fwXaewlkdszArE4azkt8fajXY9u/Ofx8MB90bT+VCQYzv7H5hrVmHqX1t9qens7Yv6XeCaSW9/jArwacuUEkVGiFP8KKN6h3JTW52HLcwnV59gseXT6Yiu5sOsmSfn1ItMQ0lnqna3jiS9P5uwUJYT30sAYmJhYAWEKTam760gvhipiKTRh6Pau8REoRe9uWK+fTrsipK0D+i+JZu9RNp5Hivkgy3Qxdgo5P1ye9msRUnjdnelGaa3UNG+sAnMxQYi+tVR0p0Umc9FI5EyVyrXAeSB0KYo7Rk43H8v8CduEliP9FDC3g5dBTuvaGMMr3A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8600.eurprd04.prod.outlook.com (2603:10a6:10:2db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 18:33:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 18:33:58 +0000
Date: Thu, 15 Oct 2026 13:33:47 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640
 camera support
Message-ID: <atEci_KwxUdvAekv@SMW015318>
References: <20261015162301.63838-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015162301.63838-1-stefano.r@variscite.com>
X-ClientProxiedBy: SJ0PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f07b792-5322-4458-4905-08df2aeae052
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|19092799006|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 DpPsKWBgcsu6k6O49+GBMPvONm5vibrT9N2VSUnHs8ZslKL6CUOmGw/dTX/h8c2rRNNOqrFtEV8NKm/yTB+WXCq9O+RgIbQyqXyBZTNojEIMjD/UxobQt39lOPUciZFscZGZdnIR1F19eh9iUbOB8r55OFRuBH9jxi5yY3pqzWFBSJbKAk8mdvdEb7c4ui0Myb5qQXo/4ZVFaxsHknRL1LBrlAkT4nrQJZtw+Q+DyFWz/Qrrq+UhEmfR8RGPHad0br2ff80JmYLAlsg9i8crTIoXXp8ldBs1P5O3c+kZwEY+UZwcAciKHS0AjpBZnJlLK9MzBWPDRbjYl/RyzwzVXceYXVym9TT0/MdjAKyPmjRs49KQqcxU1iY5HdQCIK3cCOv0ErEwFvQUyapDm8pcGgSvI72lyXE/faIAnBgpejYh6bgaWnnK2okumUcne5fmUdxLYQDtEZloOmtPMpfvTHUp9T9UVh7f7C79aY4eZzE8UcpQtkD2f5GFK3pjJugj1vTUA8QvraWXag7qk412ROs2yqUmU2H8Vsc3OWWvmY4dbckZdbfospmsgNh4/YJXGij7uRB1bKCfOKP0+03oBT1COFFRVqpmd1SEgnOgNq37bLraYh2aOLOKcLrp/L7ocJVDSj5JhGLd0AfGL6A45Dj8pswHnGFz7B8l5uITgos=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(19092799006)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?JySTtqmJMJ8ZWUVt570ZJpqT8+mscCt9EMl/5Sq+lj6bd1TTGxt9757do9r4?=
 =?us-ascii?Q?zh7hdkTdnO50mq1W1PBl7jea8h4kiOXDQ3P1qmk/DCmyUXohI0DnMRnOOrSq?=
 =?us-ascii?Q?l54UdxhlTNk0fmKG1yzpIeQVy2p7JwrHwwtmVX9ByNh+eojKrZ4mMi+ATWOM?=
 =?us-ascii?Q?KyuAutf6o39bvn9hkmKk8/gSlHdpBD4eK9uNcxdGJ5ytxHNkwCirXE1bJ+29?=
 =?us-ascii?Q?74yRn1ktawEAk647PZYkmQtaqzE57lgx+0mSxfpYY1Q1JM0JpxKDsz93IgHM?=
 =?us-ascii?Q?dToYYuT6SNgzRG+qSw5enaLihobPB2tA7gROZDAKL/tqSoVz6p7I+zOiUihn?=
 =?us-ascii?Q?GKfnb7/2JOFeLJ3F0fUUAVRVLTUnHQP+wVN3ARFTWVuzEybzfzAWxtowR/tt?=
 =?us-ascii?Q?bPF3uuNp1L7gFnY53Qp3x7ktqJk8tL8GoLewWgMi4/lFU24+0XMdfG78bSZy?=
 =?us-ascii?Q?sX/wfBGNP3pMH09Cbqdbbe6Stq2u8EJK60jySOFDvQJUHXuwm83VcrC3t51/?=
 =?us-ascii?Q?fA3PLx/bN1MqfMbgyKYjXBN6169hZxFNPA2mHIgWTSGmJWMpSeYv0Jl+v34W?=
 =?us-ascii?Q?qoPXYkPEo4+Yz+mYn56xmpq2rkJ2iahbSLyzxy7IRvW9vW2Xq5r7srMN5USa?=
 =?us-ascii?Q?/vJscwOVQuQfmk0Skj2U5WZlYo1dXM7AQ01P0nux9aR2iXdduvzzeq5HCgs6?=
 =?us-ascii?Q?8IuhJc0Uuw0pxtWm/2CJay/0cF00BBpwv9/gHW6VQ7c6RYkw/zpPCBZR9d10?=
 =?us-ascii?Q?gVyLYdP30JyELk5+4petoZhdJe7nAPxgla7aVE3JdlmTIriKfLFJ/jt+A4/c?=
 =?us-ascii?Q?KTgjJMWH6CQmponHt6QuWIrW7eG1hN3t13T1nMx3Z5rbfxusZXC5aLga7M0r?=
 =?us-ascii?Q?BuDBHugxOf7yyjoPUyU1/IGL5yd3SjzFpH/WE+O4yBLb4rqUueXc2MyPkoDd?=
 =?us-ascii?Q?L9PP+27cEErolGzeHwRVlrbCWS0wmlDvZ3XJza87aSXu3Qx1sRFbL1DklXlU?=
 =?us-ascii?Q?7yUiKpx12W/8s1Ug4/FrEtcdYkjus7KDeM8CRoXWbgmP0j+8rVcGMVQet2kt?=
 =?us-ascii?Q?kJQ7Vm6y39XMvoqXrCK1N3z90P1xwXTCSmz7AEYfaaN9Rwz7NKwm9nYcD9i4?=
 =?us-ascii?Q?PhX2w7SGPPpc3wBGBNygxLyWxZhp65l+qV6GWRmo4hZNeLpvx9o+su2pUuBN?=
 =?us-ascii?Q?Poiy2JZ6FmW7/IxY8YDOjYXZG3miMfZGoJ3OXHYbG72Ui85SP4FOIL5ExlBJ?=
 =?us-ascii?Q?QS1Xydbhv7Kgo/GI6e7wcdkaQRGDDxpc5YMoPREvhzp95PH50u6PGUxv2gCc?=
 =?us-ascii?Q?dG8wfyTenWI3Xb/REkpjQQyWI6qrNRYty6OcuFRvIwDDJs29Y5k0WPgZrrbn?=
 =?us-ascii?Q?W0Lj7q0muXWmT68kk/836TSfZ2EZBAFVebuJ5R/ckcGvllgaUowtV1kvrOVV?=
 =?us-ascii?Q?z81QRqCPBQjFD+Pm4H71tEbPk3pP6q5bmplRnljvPomaDbYL/GVxn3/KQVm5?=
 =?us-ascii?Q?wPLFqpgsTIIVoaY9SbhY4z5Jq+jxmVpre7/GyHbMh4aqxphOn64JChwdoOTJ?=
 =?us-ascii?Q?YZTrXbxRz+X4Cncwf7E50FiAlPQ+uH2kbh3VdObIOQX77SvJkh82zP6DcLGV?=
 =?us-ascii?Q?VmMqf9Mw49NuaNXjeuHLyfpPNLAw0ADxNVpF2Ul9IVuu/87aTohRxJDDJ+xi?=
 =?us-ascii?Q?xnkMqCMSdywiGGg5yRHP/SLG5/Uo1ki9fAQfk2+gWQi4M0lILfdM3VLImT8z?=
 =?us-ascii?Q?64h8GJY+XgacAm85XRiGxxPT55bEoxhXD+aOcjDZdeZwFc96qYGO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f07b792-5322-4458-4905-08df2aeae052
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 18:33:58.7592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHP4ZqJvNFrTBQYMcNDpYo9JMKaCabaLzctKlZgBrdhYGL6lHr8B9nvP8OnXDIeDRZUp5T4eS3AnfpiuUacoBSZAmPFoxJDjPxNWWPizRTOqI7qGqiAaHXqY1AaB7ZLE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8600

On Thu, Oct 15, 2026 at 06:23:01PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add support for the OV5640 camera connected to the Sonata carrier
> board's first MIPI CSI port.

Does this board only support ov5640 camera? Suppose ov5640 module also use
for other boards.

Can you refer https://lore.kernel.org/imx/20261011-expulsion-frivolous-690de090cf9d@spud/
to define connectors?

Frank

>
> Describe the sensor on I2C2, its 24 MHz reference clock, fixed supplies,
> and reset and power-down signals controlled by the GPIO expander.
> Connect the sensor to the MIPI CSI receiver using two data lanes and
> enable the receiver and CSI bridge.
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  .../dts/freescale/imx8mm-var-dart-sonata.dts  | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
> index 57d29a5c3821..427a255fe8ec 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
> @@ -75,12 +75,39 @@ clk40m: oscillator {
>  		clock-output-names = "can_osc";
>  	};
>
> +	camera_clk: oscillator-cam {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +
>  	pcie0_refclk: pcie0-refclk {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
>  		clock-frequency = <100000000>;
>  	};
>
> +	reg_camera_1v5: regulator-camera-1v5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "CAM_1V5";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
> +	};
> +
> +	reg_camera_1v8: regulator-camera-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "CAM_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reg_camera_2v8: regulator-camera-2v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "CAM_2V8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> @@ -95,6 +122,10 @@ reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
>  	};
>  };
>
> +&csi {
> +	status = "okay";
> +};
> +
>  &ecspi1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_ecspi1>;
> @@ -200,6 +231,26 @@ ft5x06_ts: touchscreen@38 {
>  		wakeup-source;
>  	};
>
> +	ov5640_mipi1: camera@3c {
> +		compatible = "ovti,ov5640";
> +		reg = <0x3c>;
> +		clocks = <&camera_clk>;
> +		clock-names = "xclk";
> +		AVDD-supply = <&reg_camera_2v8>;
> +		DOVDD-supply = <&reg_camera_1v8>;
> +		DVDD-supply = <&reg_camera_1v5>;
> +		powerdown-gpios = <&pca6408_1 3 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pca6408_1 1 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			ov5640_mipi1_ep: endpoint {
> +				remote-endpoint = <&mipi1_sensor_ep>;
> +				clock-lanes = <0>;
> +				data-lanes = <1 2>;
> +			};
> +		};
> +	};
> +
>  	extcon_ptn5150: typec@3d {
>  		compatible = "nxp,ptn5150";
>  		reg = <0x3d>;
> @@ -263,6 +314,21 @@ st33ktpm2xi2c: tpm@2e {
>  	};
>  };
>
> +&mipi_csi {
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			reg = <0>;
> +
> +			mipi1_sensor_ep: endpoint {
> +				remote-endpoint = <&ov5640_mipi1_ep>;
> +				data-lanes = <1 2>;
> +			};
> +		};
> +	};
> +};
> +
>  &pcie_phy {
>  	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
>  	fsl,tx-deemph-gen1 = <0x2d>;
> --
> 2.47.3
>
>
