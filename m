Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9464D6C46
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.104.111.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221650; cv=none; b=S0qBDo5d8EuQz8md25wvgR/pFy0k5xcpcTbu6cemQwqBbN3/dSUogOJhTA3zWWc5EzofhE9b7i+/0odYnxgnGBGP32i0sc3vfbC9J40mLkf6sJvlBRt8WnZVy2m01+/AQDoGS6KJGuWD388tg8IHR1a2SXd+HOAD5kvW6Y/T7lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221650; c=relaxed/simple;
	bh=M4Uj5MEonCB/vj1XCdqkFUIcJISiYy0mUruXe5m1bQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=MBjFMMKjGHEclMyAKybYwf8sPlGGi3xggGmn9mUhP5su5bC4xmJYB6GKDBabmv79aT6pqvPUxSVsg/a5AKP842jiLw0djy9cavIZlTtLjXmr4JUDLwA/9szzA//SnqeGJLwXldEDHU7lLSaQmKLqO0NjUmEISeZ+EgPN8ZbMi3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com; spf=pass smtp.mailfrom=toradex.com; dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b=X8mzQIqf; arc=none smtp.client-ip=194.104.111.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="X8mzQIqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1791221646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONuAfwO9E4ixY5T7A2NxatSseTcwUzIRgeJpb2V/chQ=;
	b=X8mzQIqfmG5dfSbZh5t7k7thtzadz+Mc/l1uPjFt1n2EZo7/hmei0z42ZrtT4DYEAl9EIy
	yCeWbtRFK5/VmW6/hTIIs6ADNZcb5Pc9T+OlxPx0f6sw0qY+P22sEHx61dwYZdbuffK8Sa
	wubG8oy3QcoZUCbHQXb6eKxMelniwx4=
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11022072.outbound.protection.outlook.com
 [40.107.168.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-44-OEOBfRwAO1CkhYLQ2X3ayQ-1; Mon, 05 Oct 2026 19:32:53 +0200
X-MC-Unique: OEOBfRwAO1CkhYLQ2X3ayQ-1
X-Mimecast-MFC-AGG-ID: OEOBfRwAO1CkhYLQ2X3ayQ_1791221573
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR1P278MB1392.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:98::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.20; Mon, 5 Oct 2026 17:32:51 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 17:32:51 +0000
Date: Mon, 5 Oct 2026 19:32:49 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: imx952: Add GPIO5 lines 18 to 20
Message-ID: <asPfQZURHvVzbgVU@francesco-nb>
References: <20261005172622.135725-1-francesco@dolcini.it>
In-Reply-To: <20261005172622.135725-1-francesco@dolcini.it>
X-ClientProxiedBy: MI1P293CA0024.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::6)
 To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR1P278MB1392:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fef649c-eee8-4d5b-6a28-08df2306ae8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|18002099003|22082099003|10067099003|56012099006
X-Microsoft-Antispam-Message-Info: fpZQYy0uB+OV1Dy7JBgfXyfZKI1KOdMki1LbyiwxObWoOHy3sb1kC7O4gmKeiA5by/lPvqjO33kdMx7XlwtvSKATtpmAq1NVHP93TQhOSRTApxsKaq7KgCXxBP/t8NzLE4d65R1giz4bVIieifYaHOhsXsM8PFku7L2crb2agUH13VbzJ0BUl6dAMiX5cL1YzFI7hx5wZi3KoIBb7zbP4JBX4x1VFFT7tPlRylODffCoJTveo7Di9QDSV3ZojvnpdjubfX97r+rAXxDHjp+185wo1ueSvPtj/wphICII9Wzz9ClrgcTBigiJQ55AZfnoPXRrynBNATVVqveo9StmVwYTN/OWwUCxcOovVVio4xoYQHkLDz0Yt9gtTg73xAkRYFx2YP1OMLMjmJC/rNnHXDV1vO0wdYSYbeBsM9bkuj2chLtgBuuQOFEqUgKODO68fSpbU5koCyQRpB8cKufj5gZqzwWB2LIoSgPcZH0GT5FNggcN20ZGK89h9n1VnjoHgJ+cJjxCp/ED3Zc0Uql37dhgI9iSaxCzJI4CXEPElHFabK7ZbyrJ0LcMHeBEMsy+WDD+VRU//qGiCF1t2E84dukyFalMx0IcKs2S+4S7Wml5eHq7Ul5imfVmDWD1PC/0W+Z9c/daNVkWTcuVJBdfPepL/aot7tXhr4Zi0NLOxTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8n4rX/IXV1mqL4GVpPc1xTWNFSugcejCz+0eB9eI9oDgwiyQThT7mpkDUZx1?=
 =?us-ascii?Q?VnUjtI43xNWbrP/M+Pyux9/mRqRudvDyVSuQuq8bj2m5uuSEHxOwauhDlZHB?=
 =?us-ascii?Q?5b2GtCvArLMBHqI1Rt5tx9+A0eUx+kmbqEAtNPWxZ+Oh5aQfylrDBHvVJ0xP?=
 =?us-ascii?Q?pmB1+6BqPVnH6Qa95/xWRyt5rhvT4aWe+TL9BQKQ8mgs2w9qAvXjOtdm750D?=
 =?us-ascii?Q?lZYwdRmOzsZXIPzkRmUUcUr+dim+zUgsbJJ7/o0zuFEBnNyiFqo634tfOCEQ?=
 =?us-ascii?Q?n2l+x0kgWCCxmLOLfq18U5R7VNqdDgfieM00JnLsb4O2z0SVPxDKcM/yZI+9?=
 =?us-ascii?Q?Ow6f9KLfdQ8R8BZaV4xiUG1aOgMW+1svF9Bdr9khuVgKxVSpd32fiomDYo+k?=
 =?us-ascii?Q?ndZySlUTqTXTUR+F1mzWhQ3nblzQp+KBUajVc40d6qmkRPo9FW/Q3D1ntda9?=
 =?us-ascii?Q?bMVCRm7+QJ3SdkDvNoCSYilSbf1rUi67j8WaWRKuVUO/mcoJVKukG3jEwIVR?=
 =?us-ascii?Q?Bj+/BXYtKnAr3Uw+d147Yui4WqqPW2IEkoU6Ny2EalCZ0QxuSsaFCDPvggIU?=
 =?us-ascii?Q?qqIggs9GHKG8jvZw+RyH7cR6IMfrOgp9+halmaKYMC+5i2jFFVArWlzW/ru0?=
 =?us-ascii?Q?gI+LPJwV3/V0Ek4vvh42z2L4faLJdTK1PUH/fuYuZ/736E3NP/1zFnrLMBhr?=
 =?us-ascii?Q?/Yh5emV0Qs1+AkHj/YCC8j/dhAUO5pht6oHuL56f+lipM74lNFkgRmOzB5h7?=
 =?us-ascii?Q?jPy40T6dZuywNOvvn90pihxgpZAuSarAbFQyfkE8LazotOZfZR66LUHDQBlG?=
 =?us-ascii?Q?iEH0X2cWA+mXGzNAtog1Gh0CPqGN074HJLr3KeXQcsroLAsphiY3ttO4n0+8?=
 =?us-ascii?Q?yZFJW4mhS+ORe0yDjN0nUXBMndAnSz5cbGAtfUpcsJj1CmZmJqPFQXVO0OTY?=
 =?us-ascii?Q?zMqCNTY7u5PUO2f3mNIpTHpkhCQMC3XydnfGkBMfQJjc1VLG0RS1Oe7Y/Ojp?=
 =?us-ascii?Q?oWIpGOaZlHXwYVKdRHDYTa/qu9RK4rT6L1635nKavpL7Sve+e3YJ2P69EmTB?=
 =?us-ascii?Q?OEmiEs+MkLuYcGcs++/uU4NSqJcu/SGcFMKGevT4c0WoEUVoVw4a1v3QcWFI?=
 =?us-ascii?Q?H164Jej6YyM1yx72U4qeB4GfCCPQL885nsQYh1MwS6lEXQu/bwfOXI0BkRD9?=
 =?us-ascii?Q?lQBxxXvwG1ONjw49tsWXHO3otKIrZvc+/gHK4jaVYvi280O1+Ym89CbS5FQd?=
 =?us-ascii?Q?bYkkuy1Z2zytnXnV/5fwIIYVCH0ojpDtcsXz2hBRIKDOxVU6fX/KUg0bjEAd?=
 =?us-ascii?Q?GgvFA8dfMfI/CjMwLDC3M+0XV7Ko4OSjfEOs0jEOIxNA4oVtqXLf78GpZEmU?=
 =?us-ascii?Q?TmcdzR3be0A1Evh4HF5dgzhSl09SKvECm8nGxCDRdulZc/gZHkkvgqSAb+VV?=
 =?us-ascii?Q?Tn5IkW834EI2EFBTyJXnUjZ1QY+5e4OzNKNNy9swuiMBm7tl0hUFjb6Fpzj1?=
 =?us-ascii?Q?LJUEDCXaKz0QcEdprLfrq7Zsn9dgKLwmk023KCx51XJysFsoFYdCWSjgdmb5?=
 =?us-ascii?Q?xPjROYUxjRal53jhWz4suflOsT/HbHDnG2m2wF+rfDIejkXDH0Bkt0uE3+Qo?=
 =?us-ascii?Q?oG8ZfKmQ35HqrPHobgAgKZGIacFepJkZ87RNDUCGgSH8rZQW0VK3qNRR0ZYA?=
 =?us-ascii?Q?7rfqEjfQFSAGGGmV3iJ/rLXRNyEO3qCUZHQVyaBsU5iEs71pcXFrAJyZO8Z0?=
 =?us-ascii?Q?lRSqroWOOPE65dNZTWYSehvfKpeasJ8=3D?=
X-Exchange-RoutingPolicyChecked: yluifC8fWzNqNph+stMVZ7TRPkk2DuqR5kQR7qSrEXWojWPlWxdnr39QRGXc6eHXz0mChKaWNKPzc+PH3hnLH6UmffsJWjW20CcjHLvCC6Ox2hWcnXipqcO9RBDQyUNjbp+Q3JRTcbfrUF/0CZbzMVK6sjBlzxkz5KdQjm3VRp2WyzIMp+F7lhjApGSGvwPjqRgwyAfADUf0upFUhgxeIlo4jNrDuHJ/FeaV9z1LFf50j/Zzq7ERDn0k+f2gW2p3gWUdI1jA3qHpHNjj2C2I0RyGWcKlsGpGToOa0u4q1efXmWsn7sPSRycRfjVZoVMiDev8jV++2BoF7QdZk5aiPg==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fef649c-eee8-4d5b-6a28-08df2306ae8f
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 17:32:51.6415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6I5rZxKHBFG76ETuFEvLw37j5I51KKp6Hvitf49fk0AUHlgDlpQiAOI0+NYVh1ykJBVKdcldakTg1GJwxOtFAK9KiSVt6ip5djMDJFlXnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1392
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: squejkY7wjWw7bFVKYMI7oDrSVvaM8hX5gvmpjqJ448_1791221573
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Frank,

On Mon, Oct 05, 2026 at 07:26:21PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> Add missing GPIO5 lines, GPIO_IO38, GPIO_IO39 and GPIO_IO40 are
> GPIO-only pads fixed to GPIO5[18:20], their SW_MUX_CTL registers have no
> MUX_MODE field (IMX952RM Rev.1, 2026-07-08, sections 33.3.2.44-46 and
> 33.3.2.184-186).
>=20
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/imx952-pinfunc.h | 6 ++++++
>  arch/arm64/boot/dts/freescale/imx952.dtsi      | 4 ++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx952-pinfunc.h b/arch/arm64/=
boot/dts/freescale/imx952-pinfunc.h
> index debe6ede2d70..72cfe7893af8 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
> @@ -307,6 +307,12 @@
>  #define IMX952_PAD_GPIO_IO37__WAKEUPMIX_TOP_LPUART7_RX                0x=
00A4 0x02D4 0x05B0 0x02 0x01
>  #define IMX952_PAD_GPIO_IO37__WAKEUPMIX_TOP_LPSPI4_SCK                0x=
00A4 0x02D4 0x0568 0x04 0x01
> =20
> +#define IMX952_PAD_GPIO_IO38__WAKEUPMIX_TOP_GPIO5_IO_18               0x=
00A8 0x02D8 0x0000 0x00 0x00
> +
> +#define IMX952_PAD_GPIO_IO39__WAKEUPMIX_TOP_GPIO5_IO_19               0x=
00AC 0x02DC 0x0000 0x00 0x00
> +
> +#define IMX952_PAD_GPIO_IO40__WAKEUPMIX_TOP_GPIO5_IO_20               0x=
00B0 0x02E0 0x0000 0x00 0x00
> +

Frank: the downstream kernel has different names, that seems not
correct. A double check on why you have this wrong naming on your
donwstream kernel is appreciated.

Francesco

