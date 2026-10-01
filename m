Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D6D51AED2;
	Thu,  1 Oct 2026 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864318; cv=fail; b=Cbq/UeT6QsOl2BFeZE5t08E458guSuc3nZmd04fLHNETTMJVrrpO1toJO+4crsgKqXEZYIxzGioRlbX2p0aCWSYYG4TSUJjtHbQut39eoSduiFNUVBMD8eYvWgyQLAWOj/UABmMXb8ULg6G2k8vZHtPEc+XNlMqfh3HU27qGRBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864318; c=relaxed/simple;
	bh=no0WSaMoZrp8XtZXhq3/G7C9RUefi+idZDJcf6K3tmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qa2zLmT3BkohsGMj20Uu22gNtZ+amyVBe7zAzyDKeDVWZxfNuoI7/ilx9SdeoDnEq6ascqRJvABVIAy50WQ3LswkTBGEALVvot1Gtl8Q18HGSA2syGfU9bLWj+VfcYUPlsCgE8q6dGVxczstUR8KjglOLyl1if87aqey20kGoaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gJaTCW66; arc=fail smtp.client-ip=40.107.162.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gJaTCW66"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rilgxz4RHTOk4/8A+5AdKcgy3U2LghF1YEwz2xuZyO7XUGaCSJzgLqXnz4WNzUQXhAMGuTU7426dKS1yAnTzLV1tgYEkXWZwMG6NHMNH5RFZZvZzHIamtA6SXxnAZws9wyg5Tmldr28VDBK75pB2dlc9+i4tvxBPvLy4jMBQTHZG38+f1/03dJz0OGWx5xnFYisyCaletRpyin+DEbghjBbLWzU10C9cJgIygyAGBnm7zqHry/AvHHfRvOuJJarKjS2dYM6n6eHoPLY3WnHD7AFeOJykMqnXG1XeXdiHbiNSOpQRl8Z4j6Ot9iTECZ+K04nsbhn5cAX0VEhaHzSBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njnJ5QLWujUfXPasUdapsiYUjB9Ks5Lxax5Hst1di4k=;
 b=rxFnEm9Chc65H+e8h7x1XkFGdWkSh6uRp41Fk+wRRL0VhJClS6uoq3pFArTYomLFVwaljzTBUFx6xyhf5g3VgPHqtj9qSf9NPoOcsWmE3t9cIcLVJCMnQWmXqH8Y0ZmF93HhR86LFV8+3hkVvIR8hlcnF29IIHtkBSHOVkfWuGxnM7G0jo/iCRU+h0WoO+LDeJigLPbFtodtvZ3FDAEUSogtBno26n9Sax6POW3zwpiowZMbagfSrvkkXmUznX9+uNianiELvaobk5ej9wIvEMjTlNRiK8YlyHKRDdWDUUyQGpHmFy7O+0dBupQb+/Y3A/AlUeVAeG6T+9QteJalGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njnJ5QLWujUfXPasUdapsiYUjB9Ks5Lxax5Hst1di4k=;
 b=gJaTCW66vNNstnvSBsmAU0EcJol/NqHgaZqwaTQuzZ3XCdkR3g178WXoApn3ju4/bdIDW/hqTjVwdNoQA4Poh9MqyozfIQT8Y5q13yAHkyuX+xJaJ4yNU1lFa3ctSc/mtb73PCHxotB9wmxYBsQPUs0WmEfJQPUGj8VdyE1vX89ZfKhx6rtg24vcPCTAN8Ij//Gc3TnbM7Ua0TZfuBDC88pe3bM6+9eHfrwV2Asj57ma1SsJLrqkHttuXfaPvxouDhjMEAE2xml8h4j3wbwCC0tepZZ55F3iYuUijf/xXf5PFkQESMlTCW3IBhY2+RP7YXdDGInw0GMlh38dTlUDZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB671332.eurprd04.prod.outlook.com (2603:10a6:290:b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 14:18:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 14:18:34 +0000
Date: Thu, 1 Oct 2026 09:18:24 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: freescale: imx8mp-verdin: Add
 Cortex-M7 UART_4 overlay
Message-ID: <ar5rsOuGAHdqDfKB@SMW015318>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-2-7d1343ecd3ec@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-2-7d1343ecd3ec@toradex.com>
X-ClientProxiedBy: CY3P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB671332:EE_
X-MS-Office365-Filtering-Correlation-Id: eea8a6db-57a5-4638-04a3-08df1fc6e065
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|7416014|376014|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3bJrh1Gz9qwg8YKA2C6MGvkDSe95hiqnKsS70VcH/r+/zC4sotzlQjfNo7+h8RDBJxZBAdFSPIehHt9/JXBHygyVcwh18zCGx3RkHYM4NYLeaxHm+SwpNv0NWAaTrD5xC9u8C0twGvUNIC0bNqKiVJus48NaY0O7B5URuKebw2TkODuFVkdqHxD0ZSpcxfKq0+OXsNHFpugO7i3RELicsag7+Wy8twzxaZsROtwJxV2On/J+VDGlR1I9xMw8feqVFm2lqGVeyEr1x+uinVA6KrA+ICm9eA5lNTjVR+qWQ2gtECDG+n85CLYBAtWUBvZvXTOYMpHNrn8EO7EmXxqEMXplqvfueesq3164U6aTTGMtM0jxDephENvmQz/P/eFyMeFBkS8AMq/IHWP4kKH0RTOo+DJGDSePGfDUCokAI62e2pvCyW9tH+/zzo0dLq+/jb4DpCT/uDZ2srLeqa5YvzanRAjX0Bbej6Hz59ZlgzLMw/T8Dyxn6BFAJHgjpNdNZW7XfGTDa4H3k2ntb1br8+SpSBrfce0hIlB/ti5tGkOl7RsZ9gRflvDQ50O9WOC09Orth0qNfRaxBQuiRA0cDI6uAh6XczWByRGZcPqZYy1exP6OXJ5tkAT2KfLl9LvP7Hkx3rme1WGKAyQZJ3A65ruSMkjF/qSKJphor6pLw+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(7416014)(376014)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nNHz8GT2R1SbpFzIbdqSAY7Ik6x7zYah6jBo5nMTkAjq56eh2UIQgKZdl2AW?=
 =?us-ascii?Q?nDI2usOWE8e+R3UX/VzswiQY64j1O5u8KmCyf9Sa6CzsjqQotXls1u3Ipjl2?=
 =?us-ascii?Q?FnTULAsRzjEqFAV0Jqj79sa4mRpl7SGbmvtAIvxreO6Ej6S9vtjolRSYS3xb?=
 =?us-ascii?Q?0853FsdBwlT6Juz6twvNdLatDF+Ko+p6JZJ3rNOUfV20YxkeSpbLiJtjlBKf?=
 =?us-ascii?Q?vo/wFATxTY04/221fwCHsOq1MwZkkwtC3EcKPiMADEmdH+ehe3jSQzN6SOMD?=
 =?us-ascii?Q?Ip19IL4xN9YoZFdjB8mfXwwUCQczdSHrNXgmsgxILWDWeSpOiQVolOfOeVbB?=
 =?us-ascii?Q?SBJ0RkjizuVrZXQfBdNf76B1jLnvvYAWxLixOl2HC0IAVUpDVejQX83SMM48?=
 =?us-ascii?Q?ZOZmObdmrapnXaSawAi7bPaQCk+HbY80MWFFWPMpMSssnzt9SRM+Jg10cERj?=
 =?us-ascii?Q?1Kntapb5fqo/92ktWrpXSAoUhqp6GzcvhmAD57cU4LTq3T/X/gNuOHiXEy+2?=
 =?us-ascii?Q?6wVEXeDfMCJa19TddEU4UgyK1GUCrLSDG1lylyzGMGNEGXsSk+q+Wxsb3Sua?=
 =?us-ascii?Q?goD8XCBddPll/GAulJe1yoQ46ytP/4eBy1kt5WJJ+H0Gf2K0F8AmwQzbzS8k?=
 =?us-ascii?Q?lqd76VzNSgSESGAPWZAYx+0Q/lZoyuxJj/RyXu8xk31bV4ZLAPiJnO0RiFhr?=
 =?us-ascii?Q?8+xWG0Fl5SYfrirFhrkbvrkGJIRByWsp9BwBV/WaAw/DrZlLRb7m3/DrGuo7?=
 =?us-ascii?Q?x7e2XOseKcePvuK8tzjffs493jfv8UZVmezT6UMuCJigIfSjw4GVLRNKHUZ5?=
 =?us-ascii?Q?QiQd+Iy8+Ycmp6ngt/2JZ5Wh0Iq/yVT+G9OJdS1qr6eTMPSTda+kSnjjBmv5?=
 =?us-ascii?Q?3Vzj/lZ6Jau0uK8kS3z7eYAN6VtfdYdZiVcJwCTug8vytbNHDLdgzmPM99MA?=
 =?us-ascii?Q?WhCNzxrGCsNU6Az9fsrWayUp1IH1EZxEU8s9GEyI5ZjBpd03AS7sbykDvQdN?=
 =?us-ascii?Q?RwYEd/c+T2VMDkigtOYhFCS9D5R+3iqUULIdA39BbJV7RCcXBmljKUYshu5X?=
 =?us-ascii?Q?jUva+9XdB3g+rX8aDPpXFY/Z7AlF1rKe055vLJVCn+pPXqlk7O4Uul3d1WRy?=
 =?us-ascii?Q?i+nukh7WUf8+7cbbxm04agpGnDATMZtLAT9UVKztrJprBMf7/mSYsax/vgzY?=
 =?us-ascii?Q?bDQemPztwWA5ibmCVZhhLhhWrm/Uq/o7Q+T4xErBC9OvXsLJ7V01DH6agRT+?=
 =?us-ascii?Q?ZoCzv+HQqbe1EbfgjsCfzjhkd50FH2RUPXqM0LgNl5PKCLYTc5GT9yEqxqQj?=
 =?us-ascii?Q?wrr8oTwoSKWtSeVGG3aLpjMluv9vzSfFLfHa2Nio13noVXPhrQbDpgB6TNTU?=
 =?us-ascii?Q?Dr1bP/pQHlPCEhO1L4tF89lQx9jyqVG53w7bVThXydhyeppLSr8UQQLZlqsW?=
 =?us-ascii?Q?9sApIldI0aD0SboPaCCKEAbKMwjabgIQgFEHkFdZhPtMcIEZuH6lOhgxpkQt?=
 =?us-ascii?Q?eXo2EhiH9B3gtnqTmYVxvCgyynOC0f42RTH69YVkkMbaOitp9jq1Rypmh5PU?=
 =?us-ascii?Q?AJKuVoi6iVoozvmZ0jf26zetxtImdAoUeRQkUNrUHQw5csLQ0PHGGvE9VRln?=
 =?us-ascii?Q?Gp4ak0srgvkIFpBQbLTFdv6QtvoisiAVvu6LM/Y248qJBhJbzlYp/yIV5j34?=
 =?us-ascii?Q?GbbSmKJ65J+2fEsYY37hpNM/5MVHbVTMFce5lXYUZQXbBuvCTFBbcU4jFfsH?=
 =?us-ascii?Q?Q/8+dLxfet9JdHnj19nYhRSxZ7EHRFmcOXWiR9OVJ8vtCMQlabJV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea8a6db-57a5-4638-04a3-08df1fc6e065
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:18:34.2200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7g0Q0JpWH0TbXqx0Q4IqDj11zj9ia1ZG6EAglJ1Po587p9Q3COk2vy9L3pBY/dr9WWtM3QC4G+IOla3NKrd441jN/yA4jv6U3VbyW+oakzgZk0NDxGXsdsoz2CEf2or
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB671332

On Thu, Oct 01, 2026 at 01:44:10PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Verdin UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
> that marks the UART as reserved so Linux does not claim the port.
>
> The overlay is also combined with the Verdin iMX8M Plus Development
> Board device tree to provide a ready-to-use DTB for the non-WiFi SoM
> variant. UART_4 carries Bluetooth on WiFi SoMs.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile                     |  3 +++
>  arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso | 14 ++++++++++++++

I remember at another thread said, use imx-uart4-mcu.dtso for all uart4
case. It doesn't affect ov5460 part.

Frank

>  2 files changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 23e2684d6923..649be5b6aab4 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -736,6 +736,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
> @@ -744,6 +745,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-uart4-mcu.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
> @@ -761,6 +763,7 @@ imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dt
>  imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb \
>  	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
>  imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
> +imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-uart4-mcu.dtbo
>  imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
>  imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
>  imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-dahlia.dtb \
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
> new file mode 100644
> index 000000000000..74d90b39faec
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Verdin iMX8M Plus UART_4 for Cortex-M7
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +/* Verdin UART_4 */
> +&uart4 {
> +	status = "reserved";
> +};
>
> --
> 2.43.0
>
>
