Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782D6412264;
	Thu,  1 Oct 2026 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871712; cv=fail; b=eQ0KsBcETmga0+ACRbFX0V9p0Bsn2lD/U6k2+bM4a2xlmCtZgHI0SnKwCpIKVrg/bE5Yo5/NTlBlPRZSx/l5igBaFONytg0qmw/prlOg1P1VwGj1bqRqw7kcI5ik5f6qO5w1jm0vPvbu74s4ZzOA4Zd6bTaoCQctNo0eVruMUUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871712; c=relaxed/simple;
	bh=OphHspHcRlWZ24obVzq+iUWnxSJD2/FtvfoCVtw0Qhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J0Ed7hZKqyB/cxTkgyuR/axXhZYOUDwZMpY350OA9cCnuX8Pv2VMTd8gnWEnl+xtZ3dsjET9PEZ5ntWYOGs00dRy1Qmwgyw2hUhIpfanKYw2TsXWLG4PjSD21sK3HKn9rbXKy23kViqO6XRUVOz5FEKJ/AwZe1409vIQ8xncwHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=osaipHd5; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="osaipHd5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpFh7UATOltrM+8wnnnno0haMWxS4Xr3Lvqc918silRH7JQ1M/OBkyWx/v40Tux+2e5StFNM5kVj4sta9Z302po2UPy4QeV9BDcF34aolDBVDAAxw/LvyJrFikwJWTFF3s0YDjV1lgqGeTuzl3CFOQb6UmxGPCfIg5Pv6hH8XMC/TH8IDaXU9Tfb/hKiTNx8Fi3OSvr4biYTy60d9lmvhR6b9kAVXE8/T8o0NVisyw3QLn14vZy0I2P5/mwVIRWUu2AgXJzRGMQKPSZThloe/NDt8Esze04wEr7wWk8A4ct40x9rJNCy7xzhBE+u0v3HcbD552HMf6JNI5so8vB+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5mDUU4uiGDtUy1EhCFTUpTSINDWQJ93YU/r8WQP5XQ=;
 b=wC7sP301aROD+8S6h6bpsusfd5mVaXd/qp6OXEy3FRQUNoYFWn6WyW7jahGc1fIvaicly2JAfQ9Masbrfqh6jSRuXidxLczQWUrowaOLwgkZeGo1qTcPK4FRV4r5mJu8TGw5To58TFUGSCo1RF8fIgmlAZ+IyfDio8wBZSEdBon1pqvpIg2Vc8Ultrx9dRl6Gmx/X2b+9ZNuGDcTJI+w+NTJeYJkuSk6U3tRGGcStXbMhmZmDQCyMZR8YjkIzda+C42fToMmIKsl5T9cxwDglYvKTtKCpw9TEJ8CusNNR/sj9JCrX0qDZHrtLEVHRcpsAF12En1mTHskwaT1lKcoEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5mDUU4uiGDtUy1EhCFTUpTSINDWQJ93YU/r8WQP5XQ=;
 b=osaipHd58545QkSMaTRy3NnrILVUbrPkcUDEZKCzdM+sbBZaSTqxeSIY8beZ8o5JA4HhxN7dqXQr22b4XZmNqzByVwE35fO7PnE87sfgm4ELGvLiLQ/3H1xArFmaN6WNHHHJqzTumuQx5/Rwi3MNPYJlYb2OTaVfEM8hNqwasnU9bdlCpUEzWCIs/d/2rH94jqbBSVWvxefuJnzU+hWuhPim2prGOGJMNto1eEYb8rNw9f3H3gZ2d9GlhiuQugr9mOarVGx7l8sSmboI78wSA+83f8GsQWOOOZKY/S26D/g5GIPejBPSFel/Dnf5T0HK/PnpYCX5HClEDHFNGH2Kwg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB558091.eurprd04.prod.outlook.com (2603:10a6:2c8:47::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 16:21:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 16:21:46 +0000
Date: Thu, 1 Oct 2026 11:21:35 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com, hvilleneuve@dimonoff.com,
	marex@nabladev.com, stefano.r@variscite.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI
 Cameras
Message-ID: <ar6Ij7KJEPbIa2uT@SMW015318>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-8-leoreis.costa@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001155412.3177428-8-leoreis.costa@gmail.com>
X-ClientProxiedBy: CY5PR18CA0034.namprd18.prod.outlook.com
 (2603:10b6:930:13::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB558091:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff8f366-1215-4592-fbec-08df1fd8163f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|7416014|376014|22082099003|18002099003|13003099007|4143699003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	wQx82obHBrjXD4Fdc7QNtvFTxI52tJpqlqYsWbDA8eAN+9jx36Sz3IcbQ64YMD8mf9smg/UjBVoaKf3gxyVw4OKgqq0BEHGccbV3L/AHC2NLBXw4PVwqI2asT8m4Vv7zOpYnyiKh06PrTEweKz89ocF1abqXrOJmRJnU66Mb9yglgc2PQ0BvcyG3AfHlDyzbOteL5ctFeALoE3XKGfJIGj/9Y3G7BtOiimTZVp1AG3CQp+kLWzzziyKDGl1hN9eGGjPf4b86bVN74bfq3DTZECh07nY8tHldHKkSQtr0D880LqaJS/2VVP2y7+m35nCODsAaGfeBKJ7+ixRuSlKdLpDofkKXt/nUOArIuTnG91C6a37jPzEejO4PERmGetNuAO+oH7BJ1JdAEETHCz6l1/IC+e6Yt7tkucHlCIqsdvpxjAZ1syDSupu9/xGN/7JTj228S5Of3RHgMCZj+gnPM1SKv3YdM1NAdeqmTFlhAfRxB0KOShdGTOAoILeMS7zeJ2x1obZ/wOqgvWWN6ZM2aZy/4HX/BEnQTe3VhKCpxuEmCrXePY4DPY9WePOyBW6oRjCVUcl716a/CgRCI66+kkFHZk6D0GtggrWXTEIGytk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(7416014)(376014)(22082099003)(18002099003)(13003099007)(4143699003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GagtblaN5Hel3Q8WOgnPzqbmqey1CdUKhd/GvQ0+uy+2DSqFZYTossbGYOBd?=
 =?us-ascii?Q?Yv2QHQk2ekm1k1/an7+w6rTRcLMiiKmDw3aTX9zjGEnX413BeDmaMXAI1Q3k?=
 =?us-ascii?Q?08vtV08tHK/2RriKD8oau7fXkYbvgjmoDku94Hfa4jiyoW2s7uPZbnKFJTnU?=
 =?us-ascii?Q?VMGPChiZ7Dgbf4t9Wq1lMNeuQiORlJvcpiWx0zTgOsOaaHWt8w12E6xKwRYD?=
 =?us-ascii?Q?+W0QedeY7+eWqwalhUq0rohx9bdur5UFUOuRD4GHOiNKMTErOiz2sX05GUFU?=
 =?us-ascii?Q?QqrgigNCQzQkO94YIjCUADOpbEySrdwiUQTQ3ZTrX0/HspCWr3GDc0ZxGuGN?=
 =?us-ascii?Q?Ve/p/yOyfq4WHylIpvuOJCO74h1Lx1mW5N0T5QXKQzhFrO8rCL8PAzbwzVCW?=
 =?us-ascii?Q?9Qtwjc/Ydwv6FHFAKHSkZHZ6eRpfO7BsxT+w3LgDdfuiG84BRer35edbA73A?=
 =?us-ascii?Q?S9YI/R8p8Iew4t5jHFnK3pxis1zVW/ijVldzbc2dlxTZvbDHnI03u54PgZY7?=
 =?us-ascii?Q?4D46bd2VO2wkkYrU7Dd15JF5adxkN9rf4Bs2yRIxTXMcTfNUxsGGT2yBnM5V?=
 =?us-ascii?Q?JSTyWYMZpa0rBjwD20XJ+Xx0iQRm1UljIVNHtIBtM6vARi6lKiK8SEiW1nRe?=
 =?us-ascii?Q?JUDUP81e7cRaPmCdJ9UgsGouiItjm40nsIG7TmGxwtZaVcuFHTYLB0MfGJpS?=
 =?us-ascii?Q?XTWYwMZ9EVeFcXmDhUbRr+sgJSHauxPcQCwxv6kUpvW3Gby+MW7ZLUwrlzir?=
 =?us-ascii?Q?PQzrwrUTGjQj1ZVEVJ2Se6DlkIeQcidlYuF1fA6sYXkWHeU0Ge0DH9pyMCbi?=
 =?us-ascii?Q?S71lnZPVTVw1br+DidOK7hzyjhaMLi1QXiTMWz0Lc4BGYZjkPmz2V9VXYdHF?=
 =?us-ascii?Q?M8y1a9eHkjP7Y817nBQL+/pJQQ4y/B2DR5Gr7+7T+F/WglEOJFAX9GX9KM7v?=
 =?us-ascii?Q?m8hiuHqvTo1ugtnUZCP+rdqDFaEWKVnnC8iRCPxL1e5c+j0CExoIzxMIk0lu?=
 =?us-ascii?Q?G0gj8m3YE1HYTAG5spJI7YLL0rH/4Bs979u+wvTPh+DJ0V+gGg3luIlM4RVB?=
 =?us-ascii?Q?2QTTst1aym9jr4XndMoGD564RtzxYjB6yroaL84GgDB9dY1C3955IdLhw5kY?=
 =?us-ascii?Q?qjNo2rG8D8kJuMtRvjMKoqRU+W11QH407flCUpFl73+ZGfb8E71EmjSJU5Vw?=
 =?us-ascii?Q?HY9fOYswFu7CCTfLbzFXdHCYv9D3Uo1fOOa8vStz8iTelX/p9I2ZULCpaW8a?=
 =?us-ascii?Q?Wd0y06/5qEYQzvpSg2UKdYMusWMfeSfaJfrNEab6uq9ijV+BbauX9VFZ5srB?=
 =?us-ascii?Q?F6i9OTC2sfoLd0i5pYi3YnGOnQ/fk8RoP0piVghy1/3KRPF8nZ+1TFPB/AcM?=
 =?us-ascii?Q?mdgPTpoKS3j3v48FtU2Ch0+nAyiTzXWTieM09GFRe8sXQvuRj473UH+6hZtE?=
 =?us-ascii?Q?iYFuZpJj78CYlJOZ0+cyp6lf4mxJ4Kpyetc9pRq2zhiTZoUrR7Vg7Z1huYOR?=
 =?us-ascii?Q?zcMcELcf3u95FrF+a+ta2TdwIEm9BJ5IF6aP4CBbu7T56x7AvLyay4DuZg+a?=
 =?us-ascii?Q?xheup5zWvnTsburRc4RG2nQOYnhPFPET5TN1TRaVsPDdoi9NYedL03pGKXM6?=
 =?us-ascii?Q?el9AnF6ARZJJAohIEysJiry3CSKv8CmvlemGX9/D/X/H6ygHLte1JhsIeZte?=
 =?us-ascii?Q?ZeDVJ5GjzgLvBYqp46EQijFH0f06igUS76iY0CD8U3+nZtr+y0758zBH5w8K?=
 =?us-ascii?Q?2Mwh3aO3q7afH2HMH4oRB3jpYR2p8tZX2rujNW1idVi8HohjSMUL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff8f366-1215-4592-fbec-08df1fd8163f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 16:21:45.9547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6w1gkRfHDa7CON8gvQPAn8XM3s5DnHfUcSfMEUZo4fcnQcoKHlsDvc6vdqzoAPb8HiPJUUtaJHawOmibMdB68fUMgYajmYBiI81w0IHlCI/fbJPQZ8MtJufzF6CcTbL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB558091

On Thu, Oct 01, 2026 at 12:52:57PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
>
> Add device tree overlays for the Toradex OV5640 CSI Camera on Apalis
> iMX6 CSI.
>
> The default overlay describes the current CSI Camera Set 5MP OV5640 with
> a 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the
> legacy camera module.
>
> Remove the ov5640_mipi node from the Apalis iMX6 dtsi, as it is an
> external component that does not exist at the SoM level. The camera
> modules have their own on-board oscillator, so the sensor xclk is now
> described as a fixed clock instead of the SoC CLKO2 output.
>
> The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> Board V1.2 device tree to provide a ready-to-use DTB.
>
> Link: https://www.toradex.com/accessories/csi-camera-ov5640
> Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam/
> Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            | 12 +++
>  .../nxp/imx/imx6q-apalis-ov5640-24mhz.dtso    | 17 +++++
>  .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++++
>  .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 +++++

Please use nexus connector to share one ov5460 for all boards.

https://lore.kernel.org/imx/20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com/

Frank

>  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 73 -------------------
>  5 files changed, 115 insertions(+), 73 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index cb2ad0756e7fe..9bb3bd9756d11 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -103,6 +103,14 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
>  	imx6q-apalis-v1.2-ixora-v1.2.dtb \
>  	imx6q-apalis-hdmi.dtbo
>
> +imx6q-apalis-v1.2-ixora-v1.2-ov5640-dtbs := \
> +	imx6q-apalis-v1.2-ixora-v1.2.dtb \
> +	imx6q-apalis-ov5640.dtbo
> +
> +imx6q-apalis-v1.2-ixora-v1.2-ov5640-24mhz-dtbs := \
> +	imx6q-apalis-v1.2-ixora-v1.2.dtb \
> +	imx6q-apalis-ov5640-24mhz.dtbo
> +
>  imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
>  	imx6q-apalis-v1.2-ixora-v1.2.dtb \
>  	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
> @@ -250,6 +258,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6q-apalis-ixora-v1.1-hdmi.dtb \
>  	imx6q-apalis-ixora-v1.2.dtb \
>  	imx6q-apalis-ixora-v1.2-hdmi.dtb \
> +	imx6q-apalis-ov5640.dtbo \
> +	imx6q-apalis-ov5640-24mhz.dtbo \
>  	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
>  	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo \
>  	imx6q-apalis-panel-res-touch-7inch-parallel.dtbo \
> @@ -264,6 +274,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
>  	imx6q-apalis-v1.2-ixora-v1.2.dtb \
>  	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
> +	imx6q-apalis-v1.2-ixora-v1.2-ov5640.dtb \
> +	imx6q-apalis-v1.2-ixora-v1.2-ov5640-24mhz.dtb \
>  	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
>  	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel.dtb \
>  	imx6q-apalis-v1.2-ixora-v1.2-panel-res-touch-7inch-parallel.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
> new file mode 100644
> index 0000000000000..3e4bbb11ce203
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Legacy Toradex CSI Camera Module 5MP OV5640 on Apalis iMX6 CSI.
> + *
> + * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx6q-apalis-ov5640.dtsi"
> +
> +&clock_camera {
> +	clock-frequency = <24000000>;
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
> new file mode 100644
> index 0000000000000..302f1ceb6a102
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Common device tree include for Toradex OV5640 CSI camera on Apalis iMX6 CSI.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	clock_camera: clock-camera {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +	};
> +
> +	regulator_camera: regulator-camera {
> +		compatible = "regulator-fixed";
> +		/* Apalis GPIO4 - CSI Camera Connector pin 24 */
> +		gpio = <&gpio2 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-name = "V_CSI";
> +		startup-delay-us = <5000>;
> +	};
> +};
> +
> +&i2c3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@3c {
> +		compatible = "ovti,ov5640";
> +		reg = <0x3c>;
> +		clocks = <&clock_camera>;
> +		clock-names = "xclk";
> +		AVDD-supply = <&regulator_camera>;
> +		DOVDD-supply = <&regulator_camera>;
> +		DVDD-supply = <&regulator_camera>;
> +		/* Apalis GPIO2 - CSI Camera Connector pin 22 */
> +		powerdown-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +		/* Apalis GPIO1 - CSI Camera Connector pin 11 */
> +		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			ov5640_to_mipi_csi2: endpoint {
> +				clock-lanes = <0>;
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&imx6q_mipi_csi_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_csi {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	status = "okay";
> +
> +	port@0 {
> +		reg = <0>;
> +
> +		imx6q_mipi_csi_in: endpoint {
> +			clock-lanes = <0>;
> +			data-lanes = <1 2>;
> +			remote-endpoint = <&ov5640_to_mipi_csi2>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
> new file mode 100644
> index 0000000000000..9cf7587c263bf
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Toradex CSI Camera Set 5MP OV5640 on Apalis iMX6 CSI.
> + *
> + * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> + * https://www.toradex.com/accessories/csi-camera-ov5640
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx6q-apalis-ov5640.dtsi"
> +
> +&clock_camera {
> +	clock-frequency = <27000000>;
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
> index e52b55a386f7a..ce160fad5ee06 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
> @@ -36,12 +36,6 @@ backlight: backlight {
>  		status = "disabled";
>  	};
>
> -	clk_ov5640_osc: clk-ov5640-osc {
> -		compatible = "fixed-clock";
> -		#clock-cells = <0>;
> -		clock-frequency = <24000000>;
> -	};
> -
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		pinctrl-names = "default";
> @@ -116,26 +110,6 @@ reg_module_3v3_audio: regulator-module-3v3-audio {
>  		regulator-name = "+V3.3_AUDIO";
>  	};
>
> -	reg_ov5640_1v8_d_o_vdd: regulator-ov5640-1v8-d-o-vdd {
> -		compatible = "regulator-fixed";
> -		regulator-always-on;
> -		regulator-max-microvolt = <1800000>;
> -		regulator-min-microvolt = <1800000>;
> -		regulator-name = "DOVDD/DVDD_1.8V";
> -		/* Note: The CSI module uses on-board 3.3V_SW supply */
> -		vin-supply = <&reg_module_3v3>;
> -	};
> -
> -	reg_ov5640_2v8_a_vdd: regulator-ov5640-2v8-a-vdd {
> -		compatible = "regulator-fixed";
> -		regulator-always-on;
> -		regulator-max-microvolt = <2800000>;
> -		regulator-min-microvolt = <2800000>;
> -		regulator-name = "AVDD/AFVDD_2.8V";
> -		/* Note: The CSI module uses on-board 3.3V_SW supply */
> -		vin-supply = <&reg_module_3v3>;
> -	};
> -
>  	reg_usb_otg_vbus: regulator-usb-otg-vbus {
>  		compatible = "regulator-fixed";
>  		enable-active-high;
> @@ -690,30 +664,6 @@ adv7280_to_ipu1_csi0_mux: endpoint {
>  			};
>  		};
>  	};
> -
> -	ov5640_csi_cam: ov5640_mipi@3c {
> -		compatible = "ovti,ov5640";
> -		AVDD-supply = <&reg_ov5640_2v8_a_vdd>;
> -		DOVDD-supply = <&reg_ov5640_1v8_d_o_vdd>;
> -		DVDD-supply = <&reg_ov5640_1v8_d_o_vdd>;
> -		clock-names = "xclk";
> -		clocks = <&clks IMX6QDL_CLK_CKO2>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_cam_mclk>;
> -		/* These GPIOs are muxed with the iomuxc node */
> -		powerdown-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> -		reg = <0x3c>;
> -		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
> -		status = "disabled";
> -
> -		port {
> -			ov5640_to_mipi_csi2: endpoint {
> -				clock-lanes = <0>;
> -				data-lanes = <1 2>;
> -				remote-endpoint = <&mipi_csi_from_ov5640>;
> -			};
> -		};
> -	};
>  };
>
>  &ipu1_di1_disp1 {
> @@ -743,22 +693,6 @@ lvds1_out: endpoint {
>  	};
>  };
>
> -&mipi_csi {
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	status = "disabled";
> -
> -	port@0 {
> -		reg = <0>;
> -
> -		mipi_csi_from_ov5640: endpoint {
> -			clock-lanes = <0>;
> -			data-lanes = <1 2>;
> -			remote-endpoint = <&ov5640_to_mipi_csi2>;
> -		};
> -	};
> -};
> -
>  &pwm1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_pwm1>;
> @@ -933,13 +867,6 @@ MX6QDL_PAD_DISP0_DAT23__AUD4_RXD	0x130b0
>  		>;
>  	};
>
> -	pinctrl_cam_mclk: cammclkgrp {
> -		fsl,pins = <
> -			/* CAM sys_mclk */
> -			MX6QDL_PAD_NANDF_CS2__CCM_CLKO2 0x00b0
> -		>;
> -	};
> -
>  	pinctrl_ecspi1: ecspi1grp {
>  		fsl,pins = <
>  			MX6QDL_PAD_CSI0_DAT6__ECSPI1_MISO 0x100b1
>
