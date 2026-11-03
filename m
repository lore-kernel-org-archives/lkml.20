Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793710411;
	b=dXh4zH2e2avxS0FZG7llR2vFUehelyaGuBXSziM4AhM/0TcvIaNl4bUQosfDh4DkMIu7
	 +i9zGk05sd4lbWStzWgMggQAwqA0wDhNdd497DpymDm1lstaOjqRAMx0cqMi9z6hqNosP
	 FC6Mix9mBE4cigjTcFfwFp7kzChN3qG02Gb+1nacAJqqtf5TF0J+LqRmCvNXAmW4L8jNx
	 A9fThx5f5wd0OiMUsR6Jtgh2gDuO9QD3K5ioTjCEYtrCOhsQhP9+2eenRiksO5wfwdnP9
	 ToWZ1WpROe0kYeZTAX3W956abNuhVOmrXfurEmuZPSYZq9mtZ8zxs5sh+f8qPLJrujQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710411;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2m9BC37D0cC6JLjtnkbhTgqeydVTbhSp75xNBmi+5Og=;
	b=V2NwFidoi3MW5tvEiVaLNNQfw/n8npWCi/f6M7S1I6HgTfoNRg5oCVyayNTq16xflF6a
	 QUuccJOujA7rL/ik39nQM8dkBNRLhUdJJff7Rf7SN6m8PHvgBeGxwoHcnI0vlhRXQell5
	 /srpQFGmAN/IUUA01gfHUX8ImeSM55OxMwUfestM9un08sOu869Cu2QdbBVJQosaUkvc0
	 nN2dsP3iNT7QU5TV05uAz1eZZvX3AxBqNrx4n0bFc19EWDAVyFMGIRmWneOmFAtDg0GWc
	 xnj+G1QzEz135E8BcmLGJkw7YIskS91n2XbHTuZwjx1I/V7Lg7NqXU1jeZ6rkVQxBmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZQ+BFoKI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.32
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D0A606A328;
	Tue,  3 Nov 2026 12:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D0A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZQ+BFoKI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDE6hou5wOnPMhVze/mXlDQFZJlD6q397E2bqaw6HfKtaPWKCL6RbLXOk7AO6ITazHv+Y8Dvh4fm3phTXv0rOIZDw2QDZJP71Ly/dupIzusYFCftFbkqL6CurC6mUOm4xd824REaT6E6ldPElHg2hu7i/BlFIdoUBKZffriapEPy1C50UaQRNi5k2LZa05mz8p3J0sW0DgxgWXhvuFA3uUEP00zgyjGxxxuutgFmvxnNrPXnexkU0HMprX+kZUVel0mO+a6HXNuULk1EmhiUIRhT8ZQxkD9owCvM5nLLt8nEQ+zG4qz7rpAFbbjGjCMrsJmywl2aALttQRA1hznRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m9BC37D0cC6JLjtnkbhTgqeydVTbhSp75xNBmi+5Og=;
 b=UszuqVgie5ZZYjdPggk3K9wnl+qVQOKwBYqJXg4magocGKvAnO+G1IHMadedkrDIiHdP6Uf/hadaHPylxUQEXMSSyEpJSdlbyYm6UPaAzWxolcPj3sY99bpcfVvhy7ySKvu7Q49yx66rebQtrr/udLmnYeJZtmrmlGPHalY9nugyOjnVlS2FW//QHEWwGyqaMfNBXBoZ0FJGikPm6fcr9rj3ZperSaedKxN855+HoK3LBg8da1L5dAXWdc+WfjvJo53iDqmn3crsnzz/n+d+nWGBoWv3AFd9G7Y07/6ioEuXfSMpIUMA/9rKAQovw/x4jreMs3YxMTjbInwh9NCitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2m9BC37D0cC6JLjtnkbhTgqeydVTbhSp75xNBmi+5Og=;
 b=ZQ+BFoKI7kyggYD7FZNZQrpbHOdRTA4gjh1DXJgBrtgI4JHz2S9d4RPwsU111YcDkfX0KKyRenXpQvUoO/XEfCWmhIh8u+S8kyLecpyKBW64ExIOF2nHfK6aZIfcxpSOSYHLnDNccHQdxswOzGKbeGrF6fn36W1HbE1eLsorfI0mG9PEpg+0ztjmgWdrBwslyganAu21/2kPx9IxCf1mEh+z+EiMUgypAyPmEkji2fdHwHafKOdDAmBrHoqAW+mc5xaffQSyUiWW8Na4NhkMpoiayB+hrzPfY9oODLtLjQQAgZiSwEESnIE39ZCSk6V/gSYl4Sfc6Rqx2epaj0wc5A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by MRWPR04MB12355.eurprd04.prod.outlook.com
 (2603:10a6:501:82::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 12:53:28 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 12:53:27 +0000
Date: Tue, 3 Nov 2026 14:53:23 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: freescale: imx95-aquila-dev: Keep
 DP_PWR always enabled
Message-ID: <aunZMTjvTnvX9HIH@vm>
References: <20261103105323.2394012-1-francesco@dolcini.it>
 <20261103105323.2394012-2-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103105323.2394012-2-francesco@dolcini.it>
X-ClientProxiedBy: AS4P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::10) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|MRWPR04MB12355:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb99a66-324b-4e2c-5ce8-08df39a9748f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|261022105027099003|11063799006|261026140227099003|261026121527099003|261028144727099003|4143699003|22082099003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cLRop2/XvsdMRZFj+OVMej+y9b0MsHFgCnPRyrkrUgefKNvbohZDlcZzNfbPWw6poAK923G6wECCv/qPloBGcC/gmbJBTapzfi/dqhU/hIeLB0HZ2ooAqB3tqv4YswiSGX6crp7uVR85CNPML6mmea0Af4dbMkJXqUt9Xq1BeWcD5P0tQlB64jX5GgeUejvCTA7H6vNwEbR6t3RzwfpUABx4eGKJK4Uo/cNkuVifDEFCEqK4kda83VAmqHxoiMd75CxbBqF2vNkXsK6h9z9moTVoycfHT4mjsOtHz3G3y6kx+FP/NCOGZbVEHcweTODc06LzM7OPUsmktmRQOQT6VDVVdeTinSUVhVaeOmxWo7zSnDMyFr2DTRJzaFhejW6jiz8zTUYqNvKrhS3oaFvQ9S1XLU/oCfAksY3jZUJmJWOoo8Eh5/aNM0K9T6rUER5PnQy0Nn1q3uHHbBE7r9c/Vbb/GxFXc4c/c/K9UhW18wSlcnZ6a1HZb6Jrj4btyYgrov5/VYHPNyyMSnfEr+lvKdPl9nKsbTL3r1qfkeFjNIgEDYkugxap2vuBqo66JwM+McqrnbU3wpe4QlxXaKi+E0zb2xEYfLlAR8gB+sxVrvlSaSnuWudet4D2s1pSQf/jG/9DqnFrJahWf7CGPB7TH5vOkllmFkn0iAcmPBOLYTc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(261022105027099003)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(22082099003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iRWfPx5vf8pckXUE6OcBdgqV42uxSacbNyzJ3sMcMv9cI5Rl8xhDER1AnSCY?=
 =?us-ascii?Q?g+H4rWBmCaPdNVnXB/2S45M519hxcMDazlj5C5vDuMDjA+d0noW23C3gM5CU?=
 =?us-ascii?Q?KJ8bP4a3LBevvbAj947dEnBWZm0HJI0CjPr/id3g3y1soQoHTSxxkXxGGyCu?=
 =?us-ascii?Q?fDXNyGMm6olQFRyf1BvDQ46DwP1BuWYTuWjxX3f/FkrLd5Pi3t2DENZTXU/H?=
 =?us-ascii?Q?D0mOAZvz28xRmARYhk6dctgwbiQJsM4xanUrk0uMtOoJ+RHXbMh/Ii25z1g8?=
 =?us-ascii?Q?BgkvMVv0UvsajbzO7zhYTjkk4P/oPXgV4r8dWeMR8mVc5lz14u4mWSFV1NDz?=
 =?us-ascii?Q?b/L18Z3RWKPJb4ZIV0nA8EDrPPYt5WzVU7ZELpX5UlssP8mkHdKq3yANS4FK?=
 =?us-ascii?Q?TqCDRMaj9Hm5G5PKQk+R70isTGBrch6I4R4TfaIWk+D93uGXwRRz6H014Elj?=
 =?us-ascii?Q?Nlo7jEqwOkjNDIJo44TAM2NBZs7XOGM2jOsZyV8t89sPhbbt/EL2U5qQK7RP?=
 =?us-ascii?Q?+r9LhbPV6eZt2p6lNYCQyieupi44KmAfL7IICIZnFWE7pK7V2/P2pivXQTBh?=
 =?us-ascii?Q?M6uNVVqT1rKoAEPwcFqmOUSqK7UqWGFQ3nEAcFq8ps6P9skCm73a+C8kaXvt?=
 =?us-ascii?Q?dBmu4XRh+Pb9CbXMidKKW1/zlcNVKsB2Rz6oDA2oNG4Xm9rXQ7fD/qaWi7TQ?=
 =?us-ascii?Q?hS/MRv9VGHTiae7lHia0603YqtlwI/y9s17LQ4/mEt9ht4k9RNBgWks0hIGS?=
 =?us-ascii?Q?V6k4yhtREzPRj6jL9b1bcsGnH0sT7NXq+M4s1mgWoCfdo31MZfUsdA1hqebW?=
 =?us-ascii?Q?Va0BtBGM9nOp5EWaVAnsCTUNGGEaI9XIY15sl4lHq1D3cGxeue/ui42LVmim?=
 =?us-ascii?Q?LRNC2C1tGZzLoiqH5dJe1t60O5RNznnPsSJiEArH/ckQK82LUznI88FWAU2l?=
 =?us-ascii?Q?DUEn2QNHpFP4Lhk1rnerzRO0naBJoPrxZLfsUbvJGW4RZ2vXieJbFzwngrIE?=
 =?us-ascii?Q?g2gI5b4FCoPPgw7rg3i3vEekFETdR/UIOIuCyjie1uLfT1efzHCD8QuIrk55?=
 =?us-ascii?Q?B4KiLHnc1CBZ89mOcdzwXB8bxImEZfeCStyVrSeEsHnZfva+xEVTPSilJkV+?=
 =?us-ascii?Q?8frgcXbTlv+JTyknfseMJLxRB4GXWGGnE7ZpwGnNnLlIN/3vgWb6gFCuWOvR?=
 =?us-ascii?Q?4TyNSez0beDw7eohGFP6giru3zkroQ28BdMgnn7mZY4TjDIg9T+XKbOdK2vY?=
 =?us-ascii?Q?B1B6IBpxGU4ycx+tdCsUaUW09vWBstLm2JokIuUPVtA7PfDfbFqqQIv/WAIe?=
 =?us-ascii?Q?sjUrHjQJviQUNyLH7BWGjQySbmkrziI/8FRLNtVwmuztd/cXHQqLJg8jVHY3?=
 =?us-ascii?Q?1OoVdeWDtOkOdrgBaMkb9kI4lV+PBJy15hxCGAzlrcxEjWAK/akg6h/OcPRU?=
 =?us-ascii?Q?Yq6sRlN352RUfPZXwl6X2quoZM5hKgeha987fTgG1IKYIGVxT1FxsSaec3+g?=
 =?us-ascii?Q?77waprboU3+PFQgNmxlcQV+/kiMoe+WFawF2e2028PGrUuR6fPDEcUe8r56U?=
 =?us-ascii?Q?6/AlbjBLZrVAnhRemLGGcCq0/HF9jV2u52etF18GhvXxfHUWbMTwKTwrnx5F?=
 =?us-ascii?Q?LVi4SwwfVwhumCTu59qE0Hfww6/qF1G4zRd1s7SxokvPdttlnpoPTrHpIyXc?=
 =?us-ascii?Q?PiQBu5HKuhhgZ9TEVDRL0vYiuBp8mzBIUmqNu7BLkhYHDuybmaeN1Nmzl+pG?=
 =?us-ascii?Q?2mG0HWrHc0+ktp0F6iiRVkJzrUffNw0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb99a66-324b-4e2c-5ce8-08df39a9748f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 12:53:27.8987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWCv8RlPFwQSESu32uKQqGfG6y5mPT8w/EBJ87KOLPwziaTuM5Q3CxiILg7Oodn0hvFH0vu9Wn38MybdurfnUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12355

On Tue, Nov 03, 2026 at 11:53:15AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> DP_PWR on the DisplayPort connector powers active DP cables and
> adapters, which do not work without it. Keep it always enabled, and mark
> it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
> whether or not a display driver is available.
> 
> Fixes: d5c082ba23db ("arm64: dts: freescale: add Aquila iMX95 support")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

-- 
Thanks,
Laurentiu
