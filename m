Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792437954;
	b=p37ytMHC7Of9aljmmhkJ8zZu8G10aypXvtFj3uzxi1L4etbXf6DrGXt3DqVXUsuqW6oG
	 CvWYFZyDyLEen+LH6EpZk9Hhj+G/DHSvSOvob7x9LeGuTsQL0xqNVEeF6D3fsmD4i4koH
	 IE3UzMf6dadHYaanrlNu//xFw5y+iNnfPPIZuLVnxLlz4+dErUwY6f94uqJs2Qk7nKWHo
	 XqdtiZOD0WvtxKtDBOV67FgVxU2/sn3isODgaaH5uTzT0rux0EL8QqL0hN9AzNWJtn7qJ
	 eAhbdzv5Y/NWrqrMoAEkuJZLgSjxHCS2hNPulrJmaECRPV9vXMqBEsmutjOCHn9g7Yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437954;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=b1W9iqUpKXE15L2AZCsufGSTZfeG4IVKBg+0n6MzXgA=;
	b=k9tfyVAPlPzGGZLqEqH7rgMX7WL7058eVXf43aFNKtez0/MNGddbBbWBYyAcku7KfH6Z
	 wkVWH476+ETlm/IRjHOtvEcWI4/EvaRcpzhLECdvyniuBmrwOb8T1MWjtZO1ijKgfdaeh
	 tbhvPZQrHLyI3jowUUEwVGzZjRYgtK+A50pQFGU3LmWucHutFz0Yc6SSB+Lr/w1qwvlId
	 CFEnGvXEJ7QqyfqylIhbY9pLahv3NZu6AfWD7XduQqxNchsX3i9P+aZO6tow1h82IBz3s
	 ksTrTJY2i7yjjRYPtkjKANXilaqoTHK4hl55tllpxUNYM+ttk9sEro8IbpfGWG0bVew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ucg19Lso;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.19
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15528606A326;
	Mon, 19 Oct 2026 19:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15528606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ucg19Lso
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhH3sJ/sBt+jz4slqNkQt8r2oZo1OQuOunTt3mJfGvcA+HmWJT14O0MNhnQm5g7FlGd04gtzT23ibmaGZxPz7+xFn+e8WF8HxjCcD4/wCMZ0Zd1sJO63YIN0O7L3K13k5mYJcuq7I6jrQ2s1P5jkSLuTdVcUn/FTimqjYwiyCPW1W/6/wWBMhi6dam5iB1/8ISSltFN/1DEGHltcSuY33tcYZNM2N7IqYWGdGvij00eJM3uEjkhe0C9gNQOrJKYBWIAY+g9HcidNJRAI13jOqFyhP+w3yOqi5/qyugR6ScTfxOEw078jsWEeNIbYLgxiFMYkBTE1MN9iA1By2Sa00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1W9iqUpKXE15L2AZCsufGSTZfeG4IVKBg+0n6MzXgA=;
 b=Idq2Meup2mmBT+5E/zT5CfD1T7sTcvVR7rtdchxu9p8qfI9kwEVofl7qCRXm9hygQw38asGcoV72RwMqCRg43QJQAbeQwUNOycRK/28jUC6lOKR9EVjPC0v+4JJg90BcDYyFP/TkQhTpaWLdm4DTm6HZ8WBho9O/3MC+D+Rb9KstVfRa4mO3acpAzeaZcr07MH90qFC03GnLpw7TaEWvKVLFzgsxHfLkkdNANFFMEB7agCHRGNSFvBuStFlnsh86LuG/4SbV3CTphxrRf1uxMVZOiYiLAqVVCqDub83Nsw9iagdweZfU6EDo0FFlFy3hzi5o7s8+qufQb0V1JNgfug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1W9iqUpKXE15L2AZCsufGSTZfeG4IVKBg+0n6MzXgA=;
 b=Ucg19LsoPNpvWl3TO7HUfYrE4M4os1tBS1W1/UkPsxxkMt0pl+a04k7HzVeaOlpSPoUUjLfyeUkTIe4yjd1TS9sIOW24Ex1k7qdFgsDtgRh2XB7iMGjycRt0hPejunK50HOB0kTO2AslFBUrbC2YxH+18uVBvoWEtjcKROVraMUDbsZbWdSisFEVuqWf6zNGHQVcB50Q/hIb2Y+Ps9M2DD7DSYDFaEkq3CKQEboXO6t8L1kFMumbiQCkjhnF8Wjo9dvpEZuq3fzEh54AJ4XxXgvWTFkoWWUWqaJxahO5LPYKE8oSMdc8cVGuSEVlqoENJvlIQVR3owk+y5qqrql2BQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 19:25:50 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 19:25:50 +0000
Date: Mon, 19 Oct 2026 14:25:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Antoine Gouby <antoine.gouby@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Antoine Gouby <antoine.gouby@toradex.com>
Subject: Re: [PATCH 2/5] ARM: dts: imx6dl-colibri: Add Toradex Capacitive
 Touch Display 7" Parallel
Message-ID: <atZutHmYt1aNWTpP@SMW015318>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
 <20261019-colibri-imx6-overlays-v1-2-e4d028727382@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-colibri-imx6-overlays-v1-2-e4d028727382@toradex.com>
X-ClientProxiedBy: PH0PR07CA0091.namprd07.prod.outlook.com
 (2603:10b6:510:4::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI1PR04MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: 28dcf0ba-d499-452c-cfd7-08df2e16c8f0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|19092799006|56012099006|11063799006|4143699003|261009220027099003|10067099003|261009223027099003|261009221227099003|261009221727099003|261009223327099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	+uvQW2D0P3KxqbjQ0hBURojz76Jm6lanG6AS46PRIOiK8Em1zmvLFIHpzlHHx4WpM3HzgeWXPyuncDMJSSXAE9trs7mmiSrbeLoZjioJAuj0OXacTiOxsPCc/PAGDcO2byXNgJZT525dnd9VBC61mQplftY7IqcER60fUoGClDOIiWQNc6vNS3IPTrvHV2svSh1JBTvVNKOA6Pe1pfVEhgwC4i8Rn6rEWjw5ERpq2WfhtuAodSYCKu2M+UOnqJkWTVqmIi8SqZ0KXj9d7BLh2MDq3yrkWxz86SSDoJjTZhsSqDt9/UgC8MY/wQSzbpCP3vmTjPebESq7hcbvkpS1e9+wAQWVeb7jM18TmdPmzORntC8QIa6VpPp/UWRf2OwmWM9b806y/0DBuAY4GxdU40PRWpColegzrtiD8SsT7oFNOShXeGL5uKNbhpOrpGJ81AcVPKp0vGnFSpZCwBJrEGcnaqI86qis9bB/aoJKSBoauUqBd1svywhuQv4Rl+hwNzeb1due9tk/fqC6L0a9h0lqGsXCwPjAR6EtXbqBnQA9IG2svr8/mDNzUi4seYzqVsnjrholy/5WO/DKsc22Mkmrki2/L09hSeCMuj4i3iCdOknP4jIq4iunSQV1Mg7J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(19092799006)(56012099006)(11063799006)(4143699003)(261009220027099003)(10067099003)(261009223027099003)(261009221227099003)(261009221727099003)(261009223327099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+1kenMPu1RWaSUNbWL202JQgT8bd1yVAXDubzribYCQdFyvVve1hXrFhAFeZ?=
 =?us-ascii?Q?uHwFSmpf6EadDxSXjdOL1+n5hNsRnvOM4fZce81UWWW6DlBBk1zKQpXLnsaw?=
 =?us-ascii?Q?VEiaCpACh18OfdYYy3NamZUoB9fMootIby8JInO275qiqZU/lncnpfaZjSMW?=
 =?us-ascii?Q?BJmvbdg4HObt/6ar0k1bJfyFALwTjcyv3zl6GtWrxVpJcZbryqE367bCJPYV?=
 =?us-ascii?Q?FFYtMiYviBiz3DYN/BU7RTUcRm+ew7fIbs5jOqatCNlga1MXsQMpx8y7SCfi?=
 =?us-ascii?Q?B+gm5G8uWqgrMfVy0KnKoRcozERxzO3A9OSll150PDzTFrsYTsOIlt6Jh4iq?=
 =?us-ascii?Q?Ds2i/d3vEjkqpicj4NNEbHYo3zFAXXWe05lf8/w08qD6ktlecMC07EnnpCdg?=
 =?us-ascii?Q?A1RQ3Q1hWuhA3TmCaXW3+ziGIMYtgEJWAhjN242PW6OtgDcnea6LroV8foNO?=
 =?us-ascii?Q?xDnJ+KvttBsX92WdXCg9p6uJBxgQ73R7/fbyFC2QIfsHpC1vnIdhqXz2SoBI?=
 =?us-ascii?Q?Wl321V43A4Py/6wjKh9Ryq52F3WlXep5A9/nkXSdKrwn8OdtXGrZzGO0W0df?=
 =?us-ascii?Q?tuYetghUx6I7VfKEbwgjNzz2y1z4EXdqxlDuEIqFzoxjRabuWWiACBJ47C0I?=
 =?us-ascii?Q?CSWltHgsKbT1HdV7/dbvVu4c6BwXenMlZdgE6pRUBl210QleoKW1L4iwxtla?=
 =?us-ascii?Q?QaNiwKziik4oKVtoufwsz0OC5qv3BJFvxW1Fr0eyTz3OwP55blepMC4FFieL?=
 =?us-ascii?Q?E0J2kJOdm4IhR/UdZ2Wt4ZghPF/8eFGagA5qkOdlq8kUROJoJOB/rkh9KijD?=
 =?us-ascii?Q?oOXq7H7Lqb6KVSdJ50O/ungIH4skheFeexcITyIpFAbRDPj1IC456FpORkBp?=
 =?us-ascii?Q?+gHX/Ov4CV1Af6pd6gYv8I8+BInXatOVQkWVji0m6+WCN3NI2RUigUqzveLd?=
 =?us-ascii?Q?lxpCl0HGhO5klym1mByJASQe+MEK2uZlScybkdjjcw3N/uhw/x2Tp7lUfgMp?=
 =?us-ascii?Q?FZ5RMgrpnejCnob+R5Tv4Ub0XhCScF1WHhTkNKklQM8mQQXdjPoireO8FXiq?=
 =?us-ascii?Q?gBycXSOn0K5Bzy/OF/9ygMM3ygwBeXo95guHxAB8DYZMi/egWgZJoZXJXAji?=
 =?us-ascii?Q?pvEYx/XwZ8dNHSixtWS8qVEV/yUEkBwjEf39UrfpsrhGTdMsZ7kuXvj5BiWR?=
 =?us-ascii?Q?6INdw9LxCW7K33EWTf8LCWUGTsrPneojAVbWuFzUMNxVm62kcWF/dknrL/fs?=
 =?us-ascii?Q?3zzCRjhnRmBEbZAyhrI99TGxDfS+ObeKbZvvvDLPr7VaxIViOlhs7GMINzGI?=
 =?us-ascii?Q?2M0SLsLbaFV+cdmSkXN1UImhj7r4DklqXBAmHHryEutImdBaV41ThcwLkPU6?=
 =?us-ascii?Q?KhVKNEWhkRlQR7ZBe9xW9UbUCfDCKwMwTh+kMeIHeXPlfM++uIaNSFKuYngz?=
 =?us-ascii?Q?qjFwEsVh6HCtH6zDI7kiYjfzwruoxSRv0K8Cgib+d4b3Xje0NoxsU8yYS/N4?=
 =?us-ascii?Q?46ZJ+4CUm3cWYnkvX6jGHopxU8XqOcK86n15Jtg/+SoyRgXku+oNU9vIffif?=
 =?us-ascii?Q?9rwtKd2Ck6tb6UPIduiaprPEce1jwJhkctBlg1+ZkFRx+zy/Mc74o9tcjOsn?=
 =?us-ascii?Q?JGks8yguewJ7HnJgCWjQvwOy/RgrX63TwLI7b7UqUtZX+OE/Grdmx/VIw/8X?=
 =?us-ascii?Q?a1MXy0FgiZovDTuAo+GWcWlciAsKVeqnMCyqZiWFP+dGQayoyBL0itxCW630?=
 =?us-ascii?Q?saOBkE5HwLR+AZxPIp3QLD8tJsYXp1tlFWyW02yw4jOqE9F13ydU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dcf0ba-d499-452c-cfd7-08df2e16c8f0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 19:25:50.7323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioeTwFGMK7+K4ryFmB1EhZ81aAt7ZMmSj3w7e/Cxhr5sj6dAcxKHOd07YhW0fYfbbveMfgmfBD/NxFMp/P419oQkHSLCNLarXFX+WpqA3uEdo1jed77dTyaTY6xwr+ME
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On Mon, Oct 19, 2026 at 01:18:31PM +0200, Antoine Gouby wrote:
> [You don't often get email from antoine.gouby@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Antoine Gouby <antoine.gouby@toradex.com>
>
> Add a device tree overlay for the Capacitive Touch Display 7" Parallel
> on the Colibri iMX6 parallel RGB LCD interface.
>
> The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
> and the touch input is provided by an Atmel MaxTouch capacitive touch
> controller.
>
> The touch controller is connected to the Toradex 10-way Capacitive Touch
> Interface connector available on Iris v2 and Aster carrier boards.
>
> The touch interrupt and reset signals on SODIMM 107 and SODIMM 106 share
> their pads with the WEIM nEXT_CS1 and nEXT_CS2 chip selects, disable
> WEIM to avoid the pin conflict.
>
> The overlay is also combined with the Colibri iMX6 V1.2 Iris v2 and
> Aster carrier board device trees to provide ready-to-use DTBs.
>
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile                 | 11 +++++++
>  ...6dl-colibri-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++++++++++++++

File name include key componets, lt161010

such as

imx6dl-colibri-7inch-lt161010.dtso, like others

	imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso

In case you will add more 7" panel in future, panel is quite easily EOL.

Frank

>  2 files changed, 49 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 76e2ce85a4d3..7897d9dbdfac 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -80,6 +80,10 @@ imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
>         imx6dl-colibri-v1.2-aster.dtb \
>         imx6dl-colibri-hdmi.dtbo
>
> +imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel-dtbs := \
> +       imx6dl-colibri-v1.2-aster.dtb \
> +       imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
> +
>  imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
>         imx6dl-colibri-v1.2-eval-v3.dtb \
>         imx6dl-colibri-hdmi.dtbo
> @@ -92,6 +96,10 @@ imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
>         imx6dl-colibri-v1.2-iris-v2.dtb \
>         imx6dl-colibri-hdmi.dtbo
>
> +imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
> +       imx6dl-colibri-v1.2-iris-v2.dtb \
> +       imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
> +
>  imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
>         imx6q-dhcom-pdk2.dtb \
>         imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
> @@ -132,14 +140,17 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>         imx6dl-colibri-iris-hdmi.dtb \
>         imx6dl-colibri-iris-v2.dtb \
>         imx6dl-colibri-iris-v2-hdmi.dtb \
> +       imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo \
>         imx6dl-colibri-v1.2-aster.dtb \
>         imx6dl-colibri-v1.2-aster-hdmi.dtb \
> +       imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
>         imx6dl-colibri-v1.2-eval-v3.dtb \
>         imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
>         imx6dl-colibri-v1.2-iris.dtb \
>         imx6dl-colibri-v1.2-iris-hdmi.dtb \
>         imx6dl-colibri-v1.2-iris-v2.dtb \
>         imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
> +       imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel.dtb \
>         imx6dl-cubox-i.dtb \
>         imx6dl-cubox-i-emmc-som-v15.dtb \
>         imx6dl-cubox-i-som-v15.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso
> new file mode 100644
> index 000000000000..13b4888e07db
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel.dtso
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
> + * Unified Interface Display and 10-way Capacitive Touch Interface connectors
> + * (as featured on Iris v2 and Aster v1.1 carrier boards).
> + *
> + * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
> + * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
> + * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&atmel_mxt_ts {
> +       status = "okay";
> +};
> +
> +&backlight {
> +       status = "okay";
> +};
> +
> +&lcd_display {
> +       status = "okay";
> +};
> +
> +&panel_dpi {
> +       compatible = "logictechno,lt161010-2nhc";
> +       power-supply = <&reg_module_3v3>;
> +
> +       status = "okay";
> +};
> +
> +&weim {
> +       status = "disabled";
> +};
>
> --
> 2.55.0
>
>
