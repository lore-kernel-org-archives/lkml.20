Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793201851;
	b=vow3WaQXHwxkyShlQ74bIzlmHV5Z3zwycZIdSdCkOjLj+VTeopDKCoXer9qYluh1Yf7/
	 e794KAsU4riGQMJr7axNhlDorOopQctlUFJFzTCrcuHSiBBWQxwevZH//1zxRgskQU8p0
	 vIMh9vsVYMpGhajaY/g0QzkIamMhFb99WLcO5TvdVT0DP9l6Hes8bdxDGZiBJBXD8uLBC
	 rwcYGbf0dKX5paMKFjk9Sr9Wzd6nwxPPr7ohE87QLB/EDLDn9qpb4yDojCLUHOuRYnQze
	 /RDKDoPrI/NJdfINW0F/Mmv+Z730tDGhWE6cn1Z4It8NUB1ZZXlINJvX0FHeX4bPu0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201851;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=DtuwpA2GosNvvs1C23fB5WCk/SHO896HIFQfASxd/yk=;
	b=p2cq64VgZjaAYeZHU75VDFxq4T18r+vi+/FaDLI0VTkv1QEzPPPWgG3Ni6exAdzMVxv8
	 dNna6Rr1rgOAEUg1oQlt4z6Ur2yEPQqWUEnw9dGoAa60w22QtGzNAbdq04iIOG6THyuj3
	 1NbZEkCus/zgpeW/GIVCdrU0Ai1Rnr34n31nH3uFumrgcRNL39NKaGBR1oeEJ4jZrw5Gg
	 iUEBg7WLmMW/QSyD3MgAiWNIcvzTVQdwy18yug+4igD9HgZLX1hL/uZBJ3PRQI2sxrZWr
	 Saf2LgUOTMdkxcFpYhsOb++qggBTn1bJLp21UkBtYmJuFMk5HgM6e+9S7wQ5hs8oLCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tvbx7JUD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.68
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4274606A31A;
	Wed, 28 Oct 2026 15:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4274606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tvbx7JUD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQYP9agL5WaaR3mQ5ifh5Y3MjkNN4tSQ8y7eeL1kS5zfsNznOaIpbK+jk9ut2w7epv8HC5WR3bXDATaR9kbBJrP/WUYvFUflC3IV0rP01R3SD9CnJI9VIdDG1qq9lrPQWeBABa+O5BdHe+suJwLdjPKwUrjWjZPZ3zV57iWHOIPFDUw4pkvY36K9idzkpy+hKO3CKO7sfXvRX/vv/KeHvevZMVgttmZOLBYt01KaU+hFyCXLTZAkASNcv3heHvG2Gqzz2l27JB4mquWH2bTZ9UO5nPITGoPoBtvb3Gk0a9RjWIokpB7FMai9v4lnwztuIivqgK2Ib8aqL+GCP6rXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtuwpA2GosNvvs1C23fB5WCk/SHO896HIFQfASxd/yk=;
 b=Jwa+dBy2DuNoWR4AjXu8IxvHagbtfBDTsy0CRGKK8zJVn/fYP5X2cPTx6D6Y0H5cgojo/+nFn/9B9Tw/g+vkh4xtiLNDDp5R6JhYJukNp+QO5qZuEQvuklfpz4JbuRHTgvV5ac0LBDwXYS5Mx93cZjCHL1FwuJCvKSeektOwH4L11arnjHut2qYQS01nc7lT2WWOzcyc2bE+6gHum+btfWShcCzS1RGnol0kFIAU+XoZF9LbbJlUkVh8C8ytWmf6HLFd0b3qQtMLtC6/YBbDP6Z3OE8Apl+rMS6VqIB84KpA0o34FbbrS0t824qSWwgTN0KCdeMfdDB+S0yfAj5Ucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtuwpA2GosNvvs1C23fB5WCk/SHO896HIFQfASxd/yk=;
 b=tvbx7JUDkkp9AhaqdrHNpgAB2269TCUgwn/pnufBHUVPBPBHxiE8U1ZzKRr2LTyV/3ZXvtE7YVpE8S2aR9JCkFgk/eLdda5SQNnTxE//oVt9PFQNc2Diqy+mba1fbYlO7nj3cFzCjUuPXUFtxWHci7Cx1FrpmRVtXySiiMhaLJM1/IPAZ7qyIS6w0ICnapOtSjRUoOwh9xhTex2cb8RtZ6f7hB/z6NMYWxluOLI3UYlEkcsZFN07Y2wOQ8axgmQkl+/qyHrg3RY3VoSv2fBg0Nc2mJQeEUpodbrBT0+M9vq1NCMU5R15IcVvp+DGXhzJsClEwxom0nAssXFlSREeIQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PPFE2AB7D582.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 15:37:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 15:37:28 +0000
Date: Wed, 28 Oct 2026 11:37:20 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	gjorgji.rosikopulos@oss.qualcomm.com,
	hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
	jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom-mipi-csi2: Add support for single
 power-domain SoCs
Message-ID: <auIWsA4gTWzwFGVo@lizhi-Precision-Tower-5810>
References: <20261028052047.2738893-1-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028052047.2738893-1-anusha.nandi@oss.qualcomm.com>
X-ClientProxiedBy: DS7PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PPFE2AB7D582:EE_
X-MS-Office365-Filtering-Correlation-Id: b7506c05-14d2-4506-1373-08df35095f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|19092799006|1800799024|18002099003|22082099003|11063799006|56012099006|261022105027099003|261021121427099003|261026121527099003|261021123027099003|261026140227099003|261009223027099003|10067099003|261028144727099002;
X-Microsoft-Antispam-Message-Info:
	08LU22ZG+9KS5mXpbqr0DMP+w4KdEDe2iCovvMmbRrynPlWmNwDE9xvO3tLwIgfhDvLJ3M/xNU7xrEgQv7IMdD2RWxtmqH6p9PqnQ7xXWYntLpZj/+XtuQ+vZ3UcxwgIQjUPvc1cl2T9H6SFYlgI/W4wAedQ87FR68NSFBXuVtdutTuxyRIh8KNsw5Ig46H5AzRClnbH/xccvdZm5eNkhu0HONC4qBaOC+Dx5Opb69o18wKEWa7x0QjInkw2Py0U8kyrGTQDn+V+TCOZE3oxoLCdPH7OwiXHf5gZ5ctCfr0c6DQtZwXUdlhLIs9gvi7VfybrjRJ51vV/69iunAZ9TI915va1uQR/y4ucu6ALF/uMe1/NEvDc12Ld7lMVXiD5hOtg8hmIfIAaDa9RtSb2sH2Bwvw0M7DBmLj6z7CYDgkJSsZHB7A9SwZ+M/EAwCINiEtllKlsx/bBNEOSuoRCA3g4nBmQL4rr3LQrZtj0acbbnromZwQwZ10lgtJYsmaD/OOJqX6x56fSp+ejtNkw8d6wTGHLidZQryxMPj8Is8hN1KMwfRcNISR+Pq2GK+yIRFk8UuqzxzNbcep12MyKlm4Q+ux1BMzzCxpym35wnkxf2baMQ8AomJ39XyaEHW/fh3RA0GG0s/N1GnTeycKQVUnkwELBh+VeDxlLUYjSge4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(19092799006)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261026121527099003)(261021123027099003)(261026140227099003)(261009223027099003)(10067099003)(261028144727099002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0CcitXSuYf1f5Bwc7F58E+abBRmO/FnDfHMuyJML+kxkUuf4PHQzCuaD8XDK?=
 =?us-ascii?Q?3Y7V286088hflyFS4IeAxMM21hjsVVan79VGf9YPQvZHco9sZnQ9wxemOH1+?=
 =?us-ascii?Q?uB/K6Zuc/IrAZ3eZv1QQR212fGZ/opuj2CZJnzhz2BlpzeHvD7zY0eLnCBlG?=
 =?us-ascii?Q?KsnSIqIHxV/UIWFSagQ7Uqnrp6Y5iNC0mrAfF/3oY/XVnhmY8Ogad3uAlqZS?=
 =?us-ascii?Q?fBZI9pDrxEQfb05cmpX+lQXdrdGtADlIopQ0SSAvj1QQmgEBfmeqO3U9Cjmo?=
 =?us-ascii?Q?x1zQQ/4oJsjjvGX/n7rwTAL4giPmhF8dmtDjw86DvRl4IPJajwJK1BirlIJs?=
 =?us-ascii?Q?brxsMhZxe7DPqkYQCTJBnsBNJ52LkYwZaoWj26dvU084eQSeyJtBCZPXNway?=
 =?us-ascii?Q?iGyFj4GlunsY8muZ6KQOzlko9DT0nBen1uA7S2CaVfaqsCfEkWBvBiDfbg5o?=
 =?us-ascii?Q?jH9e+n3bLjk92eSFDK9U5NYQZ+dXc7MklNZG07rYMxWPie5jLUgGsEBOM2hO?=
 =?us-ascii?Q?hZilh1OrOVYJDQrQOT5z3PeSqFgK2TgAWLUEWMAWmUE5ekPOeRa7oCBm9BrG?=
 =?us-ascii?Q?AOOPHstr8BbqaqsdLkL7saWEj0GymFR00+drYcTqJpvHvSCSliHiiQoeajEA?=
 =?us-ascii?Q?qD3ivVujuqsvbea1kEmDc6yisSHYjjP0GKq/rgOXhhyOhpsbS610+FnwRYh+?=
 =?us-ascii?Q?tv4vt/8FraaZef1KKheWK/tCxpFo8pCfx4mdToaEBFA3E+PeaH4SQ0NV5w1q?=
 =?us-ascii?Q?3sq6XqjC0DT8VSCy5EhuJfy8GPbhqZ+VgbT1AR/vs6H22qj/cAmevjl0XQUx?=
 =?us-ascii?Q?ks9Y6QaOSy9FhTdrzlkgcHgIIQIP0bgxD47uGFUE9jviRvflAB3FNo9JSd+d?=
 =?us-ascii?Q?i/mvXj/Wf73Kh6waxEGwSXDwuTqes+v1bwYg0tbQX1ti6kTrsa19+rebCv/r?=
 =?us-ascii?Q?V5SmJKx5GSNGXShy5F7aiWRkHC3+tGrakYjh2mWQ8BAiFWI58wwmuiW64KEY?=
 =?us-ascii?Q?9T2usBKbIawkEBScVN0hjjE4c6rL75cpi21dWEZ/6vAEFb+T4I2GYBmHLMUK?=
 =?us-ascii?Q?fMBUFIOELErOfzB15+AqwppqC+8fj29NNF33Vx1K9r+/U3JyIDP7TT3T9aI+?=
 =?us-ascii?Q?dTEJvLIevGa1JZxTDgSzXKTmc2GJJGOK6kt1vhLw/aO+jwXPA/DtCewubUEf?=
 =?us-ascii?Q?wHZemotoJpxicVh9Y1SKjdCjPbnF5tgAXxKuTJDEhtJL+JMC+qxTCRvqHv+i?=
 =?us-ascii?Q?kLckXGO0MzTn8GiV5iDlktTeoqqsFYpsD5g1bwmcXhoPtnTco8F+Y7Z5RnWT?=
 =?us-ascii?Q?oivFzVnGulj8BW8UNmxKXWiDk4fPXpWkG6kNRy4RM6tiaOeP1tydsPQDzLOp?=
 =?us-ascii?Q?j2GZ7tyMp9t/0U4/cNQ4EHuiPeO14ec0F/lqhfhgVHpE94F20f7qq1BygUSt?=
 =?us-ascii?Q?9IV5nPKMG+D+WEAIxLLv8EsNSqO4uTNHgFjHeLSembB4joBv+7xIBUpVBFiL?=
 =?us-ascii?Q?UFxPrecBPqK4VaOm/wNTvIuSxX9GLhLKdj+VovHrzaty4rPQrV62baBndCVD?=
 =?us-ascii?Q?8GYA4G3p7Q+QFj0OEpU9sbOm6SieQK04uxrD6a7C+Cqs2BFK6sFrvryMvkDq?=
 =?us-ascii?Q?Eq3mQDoskmIijdLp1dX7oBNQxB8+aoboZColO+SNffNAVHGc5JoG4A6uhB1u?=
 =?us-ascii?Q?Iu+7nKaT/hSea1K930YAegO61EuHcYn66fUvAZwcCaNH58/t08NNCI8AUvSq?=
 =?us-ascii?Q?zzmztx21/fuxo/YrANwTbAHGQF/Wwvy7r2894jJKbrQzO4D+TE90?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7506c05-14d2-4506-1373-08df35095f74
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:37:28.3047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rQBm9Mxk8OSE6phzXuK7MjBZyINak49JqGGWxrtaQmfNXVjsDo4Qk9QR+IeE5mcXYUUkX2hSriLhmZMQSpGjZpdym3zi1575Fszu8Sv9Nf2N7DgBWKQu1i06fdCrtKl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PPFE2AB7D582

On Tue, Oct 27, 2026 at 10:20:47PM -0700, Anusha Arun Nandi wrote:
> sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
> on the CSI2 PHY node. For a device with a single power-domain phandle,
> the generic platform-bus code (platform_probe() ->
> dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
> before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
> unconditionally calls devm_pm_domain_attach_list(), which fails with
> -EEXIST because dev->pm_domain is already set, and the driver treats
> that as fatal:
>
>   1. qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
>   power-domain list
>   2. qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
>   failed with error -17
>
> x1e80100 is unaffected: it lists three power-domains, so the generic
> code does not auto-attach any of them (auto-attach only applies to
> single-power-domain devices); the driver's explicit attach is the
> only one that runs.
>
> For the single power-domain case, call dev_pm_domain_attach() instead
> of devm_pm_domain_attach_list(): it returns early when dev->pm_domain
> is already set, so csi2phy->pd_list is left NULL rather than built up
> by hand. The three call sites that walk pd_list for genpd
> performance-state scaling now guard against a NULL pd_list, which is
> harmless since scaling is unused (scaled = false) on every SoC that has
> a single "top" domain.
>
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> index c0a4fa20eaf0..ac25e1e5f1c3 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
>  	}
>
>  	pstate = 0;
> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>  		unsigned int perf;
>
>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
> @@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
>  unset_rate:
>  	dev_pm_opp_set_rate(csi2phy->dev, 0);
>
> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>  			continue;
>
> @@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
>
>  	dev_pm_opp_set_rate(csi2phy->dev, 0);
>
> -	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
>  		if (!csi2phy->soc_cfg->genpds[i].scaled)
>  			continue;
>
> @@ -233,6 +233,10 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
>  	const char **pd_names;
>  	int i;
>
> +	/* Single power-domain devices are already attached by the bus core. */
> +	if (csi2phy->soc_cfg->num_genpds == 1)
> +		return dev_pm_domain_attach(csi2phy->dev, 0);
> +

why call dev_pm_domain_attach() if Single power-domain devices are already
attached by the bus core?

Frank
