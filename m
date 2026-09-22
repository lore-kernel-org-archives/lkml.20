Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011037.outbound.protection.outlook.com [40.107.130.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39A8563296;
	Tue, 22 Sep 2026 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094348; cv=fail; b=Us+PoXq7hvWfVuCiCJLNcy4Hy4g2Qx4cUrQIpodyjYNC+Nfbeg9NUW2Ryq0MDTGcNCUAxLTKMyd0j0Dq3dewgZrxt+Eo5iXRdmZjJVA58L5S7Ote2j/ry9FX3GHBtMDjLogkIQYyhizGRM9EeDF7rwEp7gCEqv9G1zGYONMuuZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094348; c=relaxed/simple;
	bh=4KOXFulsvEJsrfFhKPZ6LaTql+Xb7+2PnLAcn61JjWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KdwDYCRheMaHv9KN8/8eCDbLfjmUQayHV/Ie12LXagCYq9IDWGR2s4SeXizm3M+2ZX8mXsMNT4cGWAGlVvhPXsonPOpXJgZ4j1Mmu4UmL+SHRAsuyRyN4UnWKqWKT8ZdJvw1tw5bc7ZnnhrJlIqmaozeedxNfocbG60lszKNvQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R8IJNcCq; arc=fail smtp.client-ip=40.107.130.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R8IJNcCq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnRGIsm8uII7Q2wlPXlxt07FeAZf8Kk5nCByLOohsnx0AkehmfgyB2ypt1u82bShbAEQjeLReHjpM+nqa0pEOqDsTvld9550PmNWKK9KT1fJJXEbv5OJNXt2mQfGKdT80zs1vDJQ8v2ULsGvRuZhe+NyLTC7CrgXl43FbSXZjV9nC2IQ5ZyZ5jB9hMpnxYFeMkXvSfbZeZyTQqsbvQ5cepEXjBBiHVhy8UG5jDVV9ZIzIplHRh+lJ+Mdg0RMdlC0Tap3qfc2ja9tex4VoPsX3KFFogGm32knPSU7sDwlRg00aZQ788WQaU/nGnH04+ktmNmN1GZ1+ypWwbQv/fZqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoqMtBCn7ACzz9iDkC7DrGrGfyCeXQ0ZLhXmE5kvXrg=;
 b=y9vZpl9sJMh/KAf9XM9BlLDx98AqYpQRDLR2lh+VWv6LOm1nFqHuDlMteuk2ccMjym7EzIxwdX/dvlQkS11Wpc+WofxGhv4lp288t3nFVcDiOWFurs44nm0bLjy2QnIQjPM8i9rkzmjZhann9ZRuCt9s3sCrvDrRHlI5VaSr5nTBhMAJ+OB8TWWKiH6zPplDmxTsERAh2nE7mfDJKA15WghU+mA7GKQEFU7MkDQlZ4nxT8T4HKu6yfAXgC/r1XHEkF8GWAM65vdkLwLgolv1rZZZQdBdOKsGRfgS8AwBsNzHxfskWD1icBFEj8qomTECX/eomw4VU+FqJ2ax7BHJbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoqMtBCn7ACzz9iDkC7DrGrGfyCeXQ0ZLhXmE5kvXrg=;
 b=R8IJNcCqtPwamLa8kP/NnyVEvzihWrysdAhNxUrWRpwoIgWsJn747Orv1rK7GXkuyN55w7/LZqF8agBDvJHx3usRF1Kbv+gX5sBFDL8rINCjnftqGyOdc7OMTDgb5N5v9enXUryUif9KdTTAWVnoIByux1UVx/iGNfYWlfI4X5y7Az/89gQwDPNsJv2vQ4bdh2e11o8EU3Dy1STHDyf75CaTiWsgajKYTufi0uAU2q+GKtvMJBN0fmB+qeyF+LsXBFwawqqOIodo1uNX5W4jBQYGal7fq1yTQ6DlYX1AEFuDFfrv0rp8fEA6pGFrCrwCev0aMkd0lBiS0R5RBVDWtQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BESPR04MB12561.eurprd04.prod.outlook.com (2603:10a6:b10:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 16:25:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 16:25:39 +0000
Date: Tue, 22 Sep 2026 11:25:30 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>,
	alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <arKr-oapsl5qzo_E@SMW015318>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
 <20260908-groin-undivided-0af701135404@spud>
 <aqGHlWpQjpHEft3j@SMW015318>
 <aqKWTT47S_zPzvbN@squawk>
 <aqLQaHndX4t1kKLG@SMW015318>
 <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
 <20260922-bullpen-reprise-f62e01922d88@spud>
 <20260922-immersion-salvage-00450539f1ce@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-immersion-salvage-00450539f1ce@spud>
X-ClientProxiedBy: PH0PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:510:5::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BESPR04MB12561:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d949a5a-c3ab-4b9e-365b-08df18c623b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|23010399003|6133799003|18002099003|22082099003|3023799007|5023799004|11063799006|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	agCaKYORswC4SvGyKPKbR9vDxvoqvC5T3/UjN6XaeqgeJOHrWf+pqHg/3Qs/8Cp4Ytbgci6xFkrIRNoOCyUFPHj2eJZv8YNC/Q3NsT3zUXu2JSP2VY2sdMVElfXb1cR1v4w6uDUKfThdI40pk0KWo63c+DIENxXj+m9GosdYqTZKlb0QpRsDdusDhlIN4guenzAOAJ/NETTSUsdCbPqsvMEE5byEhBdj2tLu54JDtEY7Oau65wArSjaDmDOAXXyU3IZb4XI41gVeXQP36cQBVRKsH7/g6RrXDNBJ48UwJgnFm6VTT4eHtpJMdRbCnXrZL+X8NsU72OA8aqQJJ5k5J48g7xeoFXK9jR9wUmlay8NKJ1XxHe65aRhZo9nLYJUoQ1fPhXxoaQ7EvZ7+kLf2Pn8HnRhvPn2Lik/nXpY2MDdBqdnt7UMd4lvCUqJy8+NalHg3ufEvtaWxUUcbLVMymoippj+9PR0/Ke/A4xSRbEPCwma3YVczg2XQ+yQMJz2gOKEII1+D/373ACSlpNZqGkZsibO7oDG2tlyjLDkt0zYNrKe1WMVT5sO0kPCt1Ji1zG+joZjvRl3ap4MqGMZ8FsQHWkIfmJZabMU4ieBf/BaTvMS2s9eUoBli7zCgjJnv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(5023799004)(11063799006)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ljBCV981ZJls6BGFs3GmJ9iPuw94Je32/Qk2SDoehzkxgN+TV/hApauNaRc3?=
 =?us-ascii?Q?tWP61Ngkc/8jEPiSvyK74hWXDIZD9l5EC7j71KDZbm5tlHjtPPIPvOq1isTF?=
 =?us-ascii?Q?hpS0viKrExcX5VOHR6002HIWm7+OLagtx+gI6gWZmlkAxDgIZwU4/b5aYjxz?=
 =?us-ascii?Q?++fF/rH/4OrkCHQnFR99uSjRimobkmAN6YsTo/1kiUIZeQAhus8I7VvNdajp?=
 =?us-ascii?Q?hD2IJ5GgSs0QhkyuLWJF9rnKXJhaIM1Cl2F348PSxbAFrXu1eYangCFTplpp?=
 =?us-ascii?Q?xrJ+X2mjI5ppGpWX3LYoxQkYXUGsTMCnNTjeMUtTbMl54NCJ6jZjyAoTYIwu?=
 =?us-ascii?Q?WXzVleeIHKneJsCqMhSO1wyWINInRLsM4I9ZzyFW/3T0IKDpltmdhLbgshTH?=
 =?us-ascii?Q?OxhLmmj+6phZDTLvtZoWuvRmuFz4VfPQBLi9YChAoDB3JklaivteTfhw4sdV?=
 =?us-ascii?Q?hxvByHH0mbpJWHES1tCI43JFnBBAGmUMXB/DvzfOBUVdSE9hNIlSUKCVxmoW?=
 =?us-ascii?Q?XputBZ/kPnkAgw2s6Jbx8TicfvcTqu9FGxWeHEEcdprr5hHLK2ILfp1wkiJZ?=
 =?us-ascii?Q?danqMkC437aweW0WZbfXfTZ/AWw7CQQuf/NXBPI0FHYPqqo3u2Vnu/EHI84v?=
 =?us-ascii?Q?fXjZGiTfJKjVJr8j975RX6luKg5FrCkqkCu+pkywyVRcl4MF3BnMabEH/qKs?=
 =?us-ascii?Q?X2SlGjoKJjjUaBidqdmiZncGJI7v12T7a/3p9wKXig5RAa5Xn42auDvsEhj1?=
 =?us-ascii?Q?+7ZXFTleDLKwGrxl4W8GEyFT4oEmjL20/pA/RxeyvNj2tTiyAuaK4gHNDR0Y?=
 =?us-ascii?Q?JFD6iVHQfS2KjxV5Ev0WO0EGlv/iS00LzzjvwBmThmDjTZwFDsa89xH4Gn6r?=
 =?us-ascii?Q?FvW+zgp/9tsGMQtUjqUpfBs8DAnM5iSjWOHsm5HDIALQDLaSVQI17f5kv4Eb?=
 =?us-ascii?Q?baZYHehsplFv54BckcE2mH18XgzKKzAJYlAfBKaE070aHWRPNLhXdfmH/kBQ?=
 =?us-ascii?Q?RHVXKtgxL3oVRnOpmwL7ZE6BQiGRbO/u+mUe/Xq9qaKzvZbx2UlYbH1VffnB?=
 =?us-ascii?Q?F51+qLmnx0ol1C7ij1vGRwWNsgV4pQ616589/aPmSgzI0Jyi2WTr+yOoyOhe?=
 =?us-ascii?Q?Ih2H1u1zISHqNV82VudEg/HYD8KrKzQ6xZpXfQeH6QPLIjQSikCtjAmIIJ2v?=
 =?us-ascii?Q?cVINA19caZsqooLsu29fNpbjqcs9eNAjlyRq+NcGl8H2E3zwsyoSJdwSLvfA?=
 =?us-ascii?Q?SJ6B0sXjeSm2i25a7S0rCJRpFVpEBwFLSOQkhrrUCFA/iM8Y8Q6NTNTGZ8oa?=
 =?us-ascii?Q?vhGeckjBhqjejXL+dA+ToGCBD8u6utb2pRCP4hBsF14SJWlG6V0H+Rkc6JdG?=
 =?us-ascii?Q?HKmvbuMl+7EggbbkNGY+S3ZF8OZVqk0lvaUn4T1KX+NHOOnM/utiLVXPyuAw?=
 =?us-ascii?Q?k5uwams7VcaDTf9VPV9CO7m9IRV3SCzvAYS7O0seI9aqxhkkp2aInUh4Ze8e?=
 =?us-ascii?Q?oDJpCSpwiJDmzQG+DXWchKq3GemBqHmhsip2Q2TOnnp+hIeX4FPIMlQu0U4p?=
 =?us-ascii?Q?UdwpPPLS22oaEiiljkuIGC6My/5PcKvGeL3oOzRc1Ej2haDeJNwD6hjZd1DX?=
 =?us-ascii?Q?yR1B0LU8xi3x7aMhOXAJ/6AOosLg309UKo7Jp0M/OHfg65fjyn12GVRcPCJr?=
 =?us-ascii?Q?7OTAn+GBS+fibegp79YMT3eUK3TT2E+IsvafTEPnd4dqSgx2f2ux3j/FBiuh?=
 =?us-ascii?Q?ragRCOjnzIvKNKMnSzyvWMC9h2PGICvWcw5cnLmag59tZkk3Ztd3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d949a5a-c3ab-4b9e-365b-08df18c623b7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:25:39.5227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmuwTGpUuKcLEKBcOcFKMLaTWQhXgBnPgoo9y1eHm4qzB7KmuX1zywiylv5Ukyzsk8enfF3rGw294BXP7TOkRouUxpzCbyl7MmsbiTDvm6hqVoZGsXfvZMsdz1DqKz76
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB12561

On Tue, Sep 22, 2026 at 10:39:23AM +0100, Conor Dooley wrote:
> On Tue, Sep 22, 2026 at 10:38:17AM +0100, Conor Dooley wrote:
> > On Tue, Sep 22, 2026 at 10:33:44AM +0100, Conor Dooley wrote:
> > > On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrote:
> > > >
> > > >
> > > > On 9/10/26 17:44, Frank Li wrote:
> > > > > On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
> > > > > > On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
> > > > > > > On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
> > > > > > > > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> > > > > > > > > In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> > > > > > > > > IP. Describe them with two boolean properties.
> > > > > > > > >
> > > > > > > > > A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> > > > > > > > > capable design is always IBI capable as well. Both events are reported
> > > > > > > > > through the controller interrupt, which is therefore required whenever
> > > > > > > > > the capability is present.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > > > > > > > > ---
> > > > > > > > > Changes in V3:
> > > > > > > > > - Move in-band-interrupt-capable and hot-join-capable into the common
> > > > > > > > >    i3c.yaml schema and drop the xlnx, prefix.
> > > > > > > > > - Keep dependencies in the AMD binding.
> > > > > > > > > - Update the commit description accordingly.
> > > > > > > > > - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
> > > > > > > > >    binding [1].
> > > > > > > > >    That Acked-by is not carried here: the names lost the vendor prefix
> > > > > > > > >    and the definitions moved to i3c.yaml after Frank Li's comment.
> > > > > > > > >    [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@spud/
> > > > > > > >
> > > > > > > > I disagree with Frank. These properties make sense for Xilinx because it
> > > > > > > > is an FPGA IP and synthesis options impact this. For other devices, this
> > > > > > > > should be determined from the compatible.
> > > > > > > > Please revert to how things were done in v2, especially as no rationale
> > > > > > > > was provided for why these should be common.
> > > > > > >
> > > > > > > It is common problems, when IP intergrate by SOC, which may defeature some
> > > > > > > part, It is not appeared now just because IBI and HJ have not enabled
> > > > > > > widely.
> > > > > > >
> > > > > > > IBI and HJ is optional features of I3C. Ideally it should be indicated by
> > > > > > > some registers. But not all vendor implement provide this CAP registers.
> > > > > > >
> > > > > > > IBI and HJ depend on some slow clocks, which monitor SDA line change.
> > > > > > > Some instances of IP may not have such slow clocks. Some IP's IBI and HJ
> > > > > > > use seperate IRQ line, but these irq line may not connect of difference
> > > > > > > instances.
> > > > > >
> > > > > > All of this should be able to be dealt with by appropriate use of
> > > > > > specific compatibles.
> > > > >
> > > > > I understand compatible can cover most cases. Need variance for property.
> > > > >
> > > > > >
> > > > > > > like previous SPI vendor customized property, we takes efforts to convert
> > > > > > > to common one and also meet back compatiblity problem at convert. I don't
> > > > > > > want to do it again. This kind property is most likely as below.
> > > > > >
> > > > > > What SPI controller specific properties are you talking about here?
> > > > > > There are relatively few properties in spi-controller.yaml, and none of
> > > > > > them deal with these kinds of capabilities.
> > > > >
> > > > > num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fixed, but
> > > > > some instances have not route all CS to pad.
> > > > >
> > > > > >
> > > > > > >
> > > > > > > default: 	decide by comaptible string or hardware cap
> > > > > > > force-disabled: force disable for some reason, like, miss connect irq line
> > > > > > > or missed some clock, or IP bugs, or board desgin's some level shift chip
> > > > > > > broken IBI/HJ timing requirements.
> > > > > >
> > > > > > Of these, only the last would be a valid reason for having a property
> > > > > > for it. Missing interrupts, clocks or IP bugs should all be dealt with
> > > > > > using device specific compatibles.
> > > > > > If board wiring causes the breakage, the property may be more
> > > > > > appropriate at the i3c device level rather than the controller given
> > > > > > that wiring to some devices on the bus may not have the problems?
> > > > >
> > > > > I3C.yaml is for both master controller and devices now. I3C is bus, which
> > > > > connect many devices, if wiring issue, whole bus can't support IBI. And
> > > > > if any broken devices happen at address arbitation, whole bus can't support
> > > > > IBI.
> > > > >
> > > > > at beging, I suggest 3 state,
> > > > >
> > > > > [default, enable, disable], but now I think IBI_broken, HJ_broken is more
> > > > > reasonable to disable it, default value should be set by compatible
> > > > > string or DCR of I3C regiser.
> > > > >
> > > > > And some I3C device may be failure to work with IBI even DCR of I3C register
> > > > > show it support IBI.
> > > > >
> > > > > I don't want to appear two similar property between vendor and common, like
> > > > > num-cs vs fsl,espi-num-chipselects.
> > > > >
> > > > > such as IBI-broken can be used for controller and devices case.
> > > > >
> > > > > > That said, I think that problem should be dealt with when it arises,
> > > > > > rather than starting a trend of adding capabilities properties at the
> > > > > > controller level when I am not convinced that there's going to be other
> > > > > > users in the same vein.
> > > > >
> > >
> > > > > Understand, I3C is realtive new protocal. 'IBI-broken' is more easy
> > > > > understand,  logically equial to in-band-interrupt-capable.
> > > > Conor: Any update on this one? I think this thread is stuck at this stage.
> > >
> > > I didn't think there was any need to reply. I took the first sentence of
> > > this snippet to be acceptance of what I was saying.
> > >
> > > If yous desperately want to have a generic property, the negative
> > > connotation of the "-broken" is probably better in that it'd be more
> > > likely to make people set stuff by compatible rather than have to use a
> > > property with that word in it.
> >
> > That said, technically this platform could be both
> > "amd,in-band-interrupt-capable" and "ibi-broken" at the same time, since
> > one describes the way the IP has been compiled and the other wiring. I'm
> > not entirely sure whether conflating the two is possible? Depends on if
> > your IP's programming model changes if the option is enabled even if it
> > cannot be used. Not beyond the realms of possibility.
> >
> > Also, ibi-broken doesn't work for your platform, since the default
> > before this patch is no ibi and requiring a property for no ibi would be
> > an ABI break.
>
> The perils of FPGA IP I suppose, and not being quite careful enough to
> document all of the relevant options from the start. Been guilty of that
> myself.
>

Check impliment code

+       /*
+        * The interrupt only carries IBI events, so it is only described for
+        * designs synthesized with that feature.
+        */
+       if (master->ibi_capable) {
+               xi3c_master_init_ibi_ops(master);
+
+               master->irq = platform_get_irq(pdev, 0);
+               if (master->irq < 0)
+                       return master->irq;
+
+               ret = devm_request_irq(master->dev, master->irq,
+                                      xi3c_master_irq_handler, IRQF_NO_AUTOEN,
+                                      dev_name(master->dev), master);
+               if (ret)
+                       return dev_err_probe(master->dev, ret,
+                                            "Failed to request IRQ\n");
+       }

They can use master->irq is determinate if support IBI.

Frank

>


