Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794845275;
	b=mmPsnyy9Kz2Bts7O0l6he1nshd7Ti2vm74VSLAqqT8hDhO0gSbwXPEpc7aYQeebpQH1r
	 p1CPlVYTM2rFZpXYLRTvsVYQS57OaDoeZ9SIUpq5Kci5Qqs7Yh/sEPP4BB2bZlorKXvkT
	 5mFsRTqiNbIb9rK9qW2FHquh3Znzv68mo3G1i5xIETJgAZccRahaMxKrfvGZp+dJZar7I
	 JBxyFkXCI4ccTGHRBnqLp7Ka937S4EA0GNfvoBxJLPGn0B84vdZuKODvlLnukpjr+FobG
	 ahTJoL/E4U7D8XWAsdhuSLAiXWaBamrOzdciupYVFQE2pgnjdkPNJxB2sF+ggWfsY5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845275;
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
	bh=228y2LRA2i4R0O8FUn76zl6sZ6/tBQQWTfVZBjVirpQ=;
	b=qsbJeG2lXHikiRNFbZnRoZRSaqc/fgL7cFnDtOMIxRyqe92phxxIjheGW/POARL4NNu7
	 w6wHihWslvmfD3UQjL/l6BLMt7j9Cd2ei21F8qrSsXvCQalQBlg7sqsTPwV2Pf/h3HLly
	 gp/Bz1OCvMvxKz9gM2mniJUhL2e3RBSf9qr0C7d61p8iJnBZkzDjb0EOJJG0VKAv4E0IR
	 3FbJWTwbyG6992fzbbFhdY8fXBOeF2AskYgoc1Bmu3Q/WhRTepHHDH6TAyVJfyuewewyG
	 Maz280RUEjA/WMLFIPmx/4zsvMGgqsBP0BeEyvA34qNKqlrlU8iaEUXh0W12rCcdyLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SBT2i8B5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.71
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967D5606A322;
	Mon, 16 Nov 2026 16:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967D5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SBT2i8B5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rh3v3a633H7WqOxrXchEGQs1lfb/946Mj61BJMGSHMzg/aIbu1Kb96mjEGbRHnq804fbOHJyXuzGLlX/CBz1gotea02afbCl+MrZ3sa8FAABZtL959oB+DnE9W1B+l05hZ+hBKfDBDKgQMA5mf+LlEtURCbyU4cTV/ZC3QYpfqpqSBrijefFIU82Z7HjfGsGb6vJ5dXO8A/X26zSF2Y3iGFG9EJqiuUuZQxsj2xYiDcQjywaBKhbwr5JOywvGJz9LFjsutO0+6AzIyjqlzLrZ6BnFj6DfUKoJlNLxLrl69X5JzuG3cw7O4e3krnl+mEyY9nfEPvp4LnpbFBLsbCz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=228y2LRA2i4R0O8FUn76zl6sZ6/tBQQWTfVZBjVirpQ=;
 b=V8yHn6vAuD0elGdpbsM7P1iPvd1j0AD/Kr4a1Bc63bIxtqeVtsMw+TPTPS51JflUzPbcwZsipM2PE/hVIRhUAakyxj+XR7xlBY+Bq0ZlJarwMlMhxL/oFN+YIrY36pA8+RcjpVDEmL3V09gtFFMAvPk1A3JL85xvZX30n5S3qMwVuaMVs+6K1jsxlm4OylB9jrgatonXre700OoiRwcdUoEw/bOklMMFC0eeJCNmGmnqpedsHDm04SVcZkAW4H16jCASDfKuBwpHNBAmihClXoeqWbDPDkeHtHga7QBPPSm3OGTYnSgDkx4JIvJxA3n0/dj5zw9fjF8h5OqWB9VCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=228y2LRA2i4R0O8FUn76zl6sZ6/tBQQWTfVZBjVirpQ=;
 b=SBT2i8B50yGHwFzPE4X14DAvKMVhoN998+OcZVeOtOIGygboNsMFzyfHHATl0owiIa3VyIyQXWoLb25wdqKgYK+PnRNMCN4JnblwS48YHB2wTW6m/PUydqKn41kSy+Peh5netWYRioIP+OWb9p3pJDkBR/sUjL/d45yT0oq53mj3C52C+qhl8NYh08Ne4gT5E2bMqLNCBxqWKVqzKYJIJkvWGCVJ4R8UcXiRYQiAZnxyu5w9/OpjMWPkoM4cOo8tuDq7b7hRuaaUF33dYUBnc2rjJp44hoMMygQtfxbrLCc6SQtRZlgkJ16fQstSDlTFGPzZdhW9cb6VBpOR287RgA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8068.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:07:51 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 16:07:51 +0000
Date: Mon, 16 Nov 2026 10:07:40 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Message-ID: <avsqTMh7YjMHeO6E@SMW015318>
References: <20261116111337.15740-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116111337.15740-1-stefano.r@variscite.com>
X-ClientProxiedBy: PH0PR07CA0119.namprd07.prod.outlook.com
 (2603:10b6:510:4::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 496cf1aa-5de6-49de-c7da-08df43fbc3c6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|19092799006|10067099003|11063799006|56012099006|261021135927099003|261021123027099003|261021121427099003|261009223027099003|261009221227099003|261102123227099003|261022075727099003|261026121527099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
 st4RYAvqIdlqMQ83Bxfj1LicsvqUWnm06uFfG1esuWdxwwkwtIRXU8yrRr/LIO7bZaWm4TPKpgFLGxenqOgJEKJi4R1JslYP2XdEHEhg6DP0Mu059PsLrzD5XrCkBn98ZdPaVdDYyKfzNrnLoLVCB/L0xpPvUua/4MRyfe2Tz/2gw0OOPBhWOhFsH9UXfTFlGwJYvDcxTcAcKZ9F9wRbMLbm4SrObzG2IgS/kU53EYrs+E7FNoR4Rt+Flvz6nnjOhynoX+/rzHBDNFk9kK+moTMz/NBU3oA8DsbSTDmR+gpernbcHPL4wRoQ+z/Nem7eLxkQr1Cnr7p8bfQ0I5XJhet8XmoO9oKj+llXyzTkyypsgj2dHezdPoK+qL3HBqM+/4l1qXnKo8yPqQyvtZvs2vh0Q0Zdr1UD9ysYBDUsiXctSc0Ppm/Xdv961lqa6HY0gR7a/s9pI0uYaE+jyt3sxUV3YAuOx8uPqNv9ErUePv6qGMTlHmAN7lKfprLNxaxm9qXOtZ4qjjN9wubGDVe1Lr6whWjA0Qft3etserM1u8Kdplv3Twv29YS+Vo5NPb+/GJxDQy7X8XQZUhJdozcbRYw5+pOwcdyBzMXWA163Adc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(19092799006)(10067099003)(11063799006)(56012099006)(261021135927099003)(261021123027099003)(261021121427099003)(261009223027099003)(261009221227099003)(261102123227099003)(261022075727099003)(261026121527099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?8b5C/9l9xKrtz/KJS1yRqgCIWlJGGYqiGKJsaZKiv+sVjxipTK+u9OCFlt9+?=
 =?us-ascii?Q?KLKNgPr51MOtIenbv5pNe3MHb4Td7NoZXe+rwoQopWdwYPm8otID/rXubH61?=
 =?us-ascii?Q?LSVfArttaeBfuJ7Z0q+lWCbIcTXKoySA8fLrmPAqwN6/E+kVpH8UAFcZdSan?=
 =?us-ascii?Q?lMbFhRyQQsYQRDqtUCH8Zp65wY/vSHXF3vIbV/LuIBISyYkSvN/d3VvNT9Lx?=
 =?us-ascii?Q?sGUblgxSOnkhM8zoc2aZrC7VCCYA3gCpLA3LRVDSTLH3PuvYMzX91Z/BKSoH?=
 =?us-ascii?Q?vQO0KaXfJUSDzQkXvZ2MlrG3G4nsbSyD8l5b+1OrSO7ueu+WmXf4gIzW9dO6?=
 =?us-ascii?Q?bYWf6ZhHRstHpwJkhwOtH8h/KJyDJc/Jwx9ZX13j2gWk1eQRpd78ANN1sRib?=
 =?us-ascii?Q?mgGGwnKEyGeTQccGJLtEZ5MPMnJ8fPS7sIrijgXRfzMGYdpIkGNXNTFfYOxG?=
 =?us-ascii?Q?awHdC0kDdVYy6kecqr2qK9jadnnuY+hOfsMk60UwrRYTHXNeiBLgea+0Hf+v?=
 =?us-ascii?Q?hJyy6LlBg6QQYEKOoT4rGTOne7HWOBUG4/Tqdqu0KHxhcIfsCjVYrJNntXHm?=
 =?us-ascii?Q?g1DMozsqYsFG0pPNBeOXzs5jYODhYVpzNa3+Jy521YXVwNdUsiDXETQQkci9?=
 =?us-ascii?Q?3Ft/Va/pnrnJnrYUFr8FpjIBikH06N4MIZZKU30N8r27MDAjYpj5N+kbWsbW?=
 =?us-ascii?Q?9hOj5M6FOoHm+Y8NBaUa2aLrkBb+jFI1+PMlgHor0/OERL8rIz2ohxm0Clzo?=
 =?us-ascii?Q?4pUpNbNPR+v+m2mi2Ya4plARZHH+zZJBBQpRTmjgSZSCXlg1GvXkrj3FtD4Q?=
 =?us-ascii?Q?ohzaKnFOHMIpSfmcmiaEoYFpQhiCfIjBIlrhC1cVkKNrSrPLj8hofGmCe9aX?=
 =?us-ascii?Q?vJGAIw2rHueVqFkAuJ3PACUtmOT6hIJxNwWKwwYOCRELJeo47u7zX2x3CCCc?=
 =?us-ascii?Q?wSdqbEMakO4vWX+p6oQI7KMxKf+OZJpSAVwZAYRxwM0hpmRjR4Oayxdx5ci8?=
 =?us-ascii?Q?2N9c/5Fz4gcfjYKe05uxeYKrQsu084ZqTHGg7Q+LNgmRdovRfDDm2lbSN8qD?=
 =?us-ascii?Q?e2qNHvim3AxmWz8DI0wM0KM/OgfmjRcI4k/opOP9TdjC4DZ79haCR64qBOi6?=
 =?us-ascii?Q?u4JXjPp/ibhbZZWm0kW3/9PTXOuSi2wtcF4o1F6mFlfWQa1I+uRc91mjXBae?=
 =?us-ascii?Q?11q3Uq5C8oKCqUnPhas8JDHo7wZAWBxpY6lPEEKgJEix6SZjNz+EwQDEAaky?=
 =?us-ascii?Q?tvcRBYgwdZ6oE/zfO6RFFgVhsXxSE4r3aCl+ZcWLS303OzW76HAVRS5m1JlQ?=
 =?us-ascii?Q?gNI0cv4cJAHUllenY4D/c9kaMa0wbKF3oD54gS0g71MbJ1pHETvb7BvFAg4/?=
 =?us-ascii?Q?nBC1mlJI7sfBd8cB2gNegPnesJxeIKn5t8ZyMGb0/NgNPABULrz+xRYIbavp?=
 =?us-ascii?Q?BTi6oIM2hLlVVJU2EGfZ+u+MZrsnuo2gax8ZdQRQIIrmFqJCsfGUAe6zMXhs?=
 =?us-ascii?Q?sbTIHVBC9ahGJiQ495TFCeySg+WrS2q4UNgq3utEaLveD+gcze2zkpAcunJh?=
 =?us-ascii?Q?sQgXvPAugcfatdWELrjw9BJ6HW8VEfnsc8dlIBsTCseohjM+VW09DrGs43WO?=
 =?us-ascii?Q?/PgPQ+CnfIGUTnGvYWjfm+7Sfk/X5S3U380v/UqNwUSa7SqFox5IhE0mHSIk?=
 =?us-ascii?Q?GDEw/+sp+SOkQ4dNBGTERHPeniM84r+gCCT7c/I6GD84LL3XtBQrO0wvMhOJ?=
 =?us-ascii?Q?XWHQDjH+77HtXBa2PTNhvvTRS/hcsHzSvbyK23SMoqQ5OiRdN1Z3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496cf1aa-5de6-49de-c7da-08df43fbc3c6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:07:51.2459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFDkugIu8hGYLDP5gJBcsoogAmA460EBUyt0hmqH35PFx44qRcqTI0EinfiquiFjae8LuFL5a7DL+n385OWX9bkU8mnvb+TyTpsTUwPF4zxzODTTvr968Ogpc5t9YWSf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8068

On Mon, Nov 16, 2026 at 12:13:36PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add Cortex-M4 configurations for DART-MX8M-MINI on Sonata and
> VAR-SOM-MX8M-MINI on Symphony.
>
> Share the reserved memory and remoteproc configuration through a common
> include, and add -m4 DTBs for remoteproc and RPMsg support.
>
> Reserve ECSPI1, I2C4, PWM3 and UART3 for the Cortex-M4 firmware. On Sonata,
> also disable the buttons and PCIe, which depend on GPIO expanders on
> I2C4.
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  7 +++
>  .../dts/freescale/imx8mm-var-common-m4.dtsi   | 60 +++++++++++++++++++
>  .../freescale/imx8mm-var-dart-sonata-m4.dts   | 44 ++++++++++++++
>  .../freescale/imx8mm-var-som-symphony-m4.dtso | 31 ++++++++++
>  4 files changed, 142 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index cfd548284358..9574763dec09 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -245,9 +245,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtb
> +
> +imx8mm-var-som-symphony-m4-dtbs := imx8mm-var-som-symphony.dtb imx8mm-var-som-symphony-m4.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-legacy.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtbo
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw71xx-0x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw73xx-0x.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
> new file mode 100644
> index 000000000000..98790a28694d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Common Cortex-M4 configuration for Variscite i.MX8M Mini modules
> + *
> + * Link: https://www.variscite.com/
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +#include <dt-bindings/clock/imx8mm-clock.h>
> +
> +&{/} {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		vdev0vring0: vdev0vring0@40000000 {
> +			reg = <0 0x40000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@40008000 {
> +			reg = <0 0x40008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		rsc_table: rsc-table@400ff000 {
> +			reg = <0 0x400ff000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: vdev0buffer@40400000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x40400000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		m4_reserved: m4@7e000000 {
> +			reg = <0 0x7e000000 0 0x1000000>;
> +			no-map;
> +		};
> +	};
> +
> +	imx8mm-cm4 {
> +		compatible = "fsl,imx8mm-cm4";
> +		clocks = <&clk IMX8MM_CLK_M4_CORE>;
> +		mbox-names = "tx", "rx", "rxdb";
> +		mboxes = <&mu 0 1
> +			  &mu 1 1
> +			  &mu 3 1>;
> +		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
> +				<&m4_reserved>, <&rsc_table>;

commit ebb21cc5d1c0950a8cb35f5f2870593f97724973
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Date:   Fri Oct 23 15:52:49 2026 -0400

    dt-bindings: remoteproc: imx_rproc: Document memory-region-names to avoid implicit ABI

    Document the optional memory-region-names property.


Please add memory-region-names for it.

Frank

> +		syscon = <&src>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
> new file mode 100644
> index 000000000000..35e3ea43e5ec
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Cortex-M4 support for Variscite DART-MX8M-MINI on Sonata-Board
> + *
> + * Link: https://variscite.com/carrier-boards/sonata-board/
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +#include "imx8mm-var-dart-sonata.dts"
> +#include "imx8mm-var-common-m4.dtsi"
> +
> +/* The buttons use a GPIO expander on I2C4. */
> +&{/gpio-keys} {
> +	status = "disabled";
> +};
> +
> +/* Reserve the peripherals used by the Cortex-M4 firmware. */
> +&ecspi1 {
> +	status = "disabled";
> +};
> +
> +/* The touchscreen reset uses a GPIO expander on I2C4. */
> +&ft5x06_ts {
> +	/delete-property/ reset-gpios;
> +};
> +
> +&i2c4 {
> +	status = "disabled";
> +};
> +
> +/* The PCIe reset uses a GPIO expander on I2C4. */
> +&pcie0 {
> +	status = "disabled";
> +};
> +
> +&pwm3 {
> +	status = "disabled";
> +};
> +
> +&uart3 {
> +	status = "disabled";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
> new file mode 100644
> index 000000000000..f2a1618edcf5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Cortex-M4 support for Variscite VAR-SOM-MX8M-MINI on Symphony-Board
> + *
> + * Link: https://variscite.com/carrier-boards/symphony-board/
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx8mm-var-common-m4.dtsi"
> +
> +/* Reserve the peripherals used by the Cortex-M4 firmware. */
> +&ecspi1 {
> +	status = "disabled";
> +};
> +
> +&i2c4 {
> +	status = "disabled";
> +};
> +
> +&pwm3 {
> +	status = "disabled";
> +};
> +
> +&uart3 {
> +	status = "disabled";
> +};
> --
> 2.47.3
>
>
