Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BA633F594
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922327; cv=fail; b=JxKvrtQpNetiGIy8IQ5EmcjRKzWS/fDC1oNLIv7Eb61wH3GGyCokr9P/WX5uI7Knj1eUMMhIMeGO+PfEjM7wRRA1h50mhrfPuQKczUUEbqLHy/Ty4ssyUYiYqSSunze1P+l9ceDOV/UaBwMWQq1mj96s82sNESpdbZi12C8AKWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922327; c=relaxed/simple;
	bh=O9dKt7R2Id2ENzwWaaTyP+kWcJtlIhfyw5zPxO2m/bA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eX0VthIPtONpCepn/Ezccf17o78AvsT+1wOuRaqlXu/dv75pI1HGUjAdkCYVCdef93OrmpQgeuwpFGxkXej4xyAee3+R2PrhGIucR5GH6kQ/RP4mrEj60qX6/L1IzpygVwUiB6Qb2Hj1qo0MN/XPRKkFVJC8dJha5dP5eZ15Mh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jzv+ZHlm; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jzv+ZHlm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKMT4GNO5o69phJedZ2iqZoBHkJOAlj4W4ol+O6fRpn91r+ubZVQ5K9M7lDTjMjd/uTKF0bQpbt+kPPLr1CFDdlRiSdMVXCJDsSdoyRAWkv/3OBBzzea5i6/NJe4F1oJzmfEPIZpYSTv6Q8AGvRfmO8V6/9ct7agU2OMtHZqsuh7eBmgrRKVQL6+wMgOGqlSfzftCGUd3q1o44Op60YZJ79U3ZBlDWH+wHr4pn6sJ19egoeDhK/AdmLkC+y+oKydBl6y/fU/lLbcU+lFq4LXxTswJIkWzbzkT2hs9328zXggf0kCRtN6nfjl1v5BhRMdFqVAOyenQtTN8t5SaSCu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TE5ihiJfM2QR4WieX7mxOFEEbO7aRRq8TGQzYfLcJg0=;
 b=ei9fF5ClHtU+uH0FGBjyODh9IcJ6Nd8uchwWKXOHVC2MzwDAhvCT4/c7nkgSvOgRUOaM4+UNCk7SQWXGNuKTR6tCDpTZAitJR4pZ8KtNDGfeyzBM0ioPigMgnfzfP5SoksqJtbxEYQWO5MJdMeyTatfyhFEhJ3zvliZeZvg4L5yG/uK8fl5V0N4TYxj1ToZbZ5yqZRsbs142n6EbBPQnGdPObrD0nsQ8WmASl2pgoeqlan/qecYxXW3apq7iGH0y2leQUIYmKyujgxnOw78i8qaqCcN/u74Eqi3aCzGg2uFTEiNEBMlmOky39CGANH22hlRIr0fcyRpzeEqV9FOsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TE5ihiJfM2QR4WieX7mxOFEEbO7aRRq8TGQzYfLcJg0=;
 b=jzv+ZHlmuK6cYtEN6d+Plk/TVqkI6UvadWJebZPA1r8joCg6Q4wNbtkGURuUw+1246NI+rk2yhvWsH7P+clYFwq6h3Sz/m3lvQg+fKjVgv1GHdVEmLzbn7BK47TqpNTk14D/FT9UDqzWDadPBE7VyaufccBGeYcPOMjVlgcC4AcfTgyJK/m2SoHnvA5yF++B8a3c9MW2umaWcbULP3YXOclzlcQtqdtCDv2xIOKPZQUwGu7DKLVAcpi9WNjQdU2zyPUaP1bQU81GOI3tU2sis0nNLZB2/708VKkrcxpdi8iDiMLHa/dr5zIkGYJbtuvAiZIi/2Guea5sqIY4EinGQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DU2PR04MB8904.eurprd04.prod.outlook.com (2603:10a6:10:2e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 02:52:00 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 02:52:00 +0000
Date: Wed, 9 Sep 2026 10:49:41 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: ivaylo <ivo.ivanov.ivanov1@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Subject: Re: [PATCH] phy: phy-snps-eusb2: fix FSEL_48_MHZ_VAL definition
Message-ID: <ogfpkqixf3xkyvh4bbpvui5ybfaro6g35g6u5kb56k2jsyrsmt@jm67at6cpksf>
References: <20260908085953.3315953-1-xu.yang_2@oss.nxp.com>
 <aaf8a5ef-2abe-4269-804e-4d2dd1bc4d3e@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaf8a5ef-2abe-4269-804e-4d2dd1bc4d3e@gmail.com>
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DU2PR04MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: 4948ef4f-809a-4128-2ff1-08df0e1d5223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|19092799006|10067099003|18002099003|11063799006|4143699003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	7v6tUc2va9UVQ/y4hadNK805LuSB3o53IUp4M1YgwBC60omz29Vh4jCTaTvSnRmjhZA0gBXkGHBEFHCsCGZIdrZnSLE99pjxmvDGY7lZ4qJqgc7iYr/N+wuNt2tpRlsuSJCv7ucX80/y9c2Fin7wM/zNXFlRoT8a/b3m2GJfopCBprPaQM0dlP+uwc6q3jB4lExPY2B/lbiYAU4f6X1fKqKSJ/d6IJvzZnpbd/kdpYwplYDhwLKE9BYheAmBuzL1LbHWXGyOOWz9NR3BybVEiTY3QSMo3P3SDy219O5tOxbvc4ax7SJ7qo0fmaGtjpyFOQD1sfp833F8CvFzW7gxgOYR7sE2HNwjfh03qWvnkzQ/pf0J/DdDdfymLR4mA1hRq+ypcLqHWhYhUphF6rqKCiPLry/hxjc8hKnNacBsJa809pL3EA/KSQ/I7Xyw1x8PXwjaI5fOIP2PpsqG+mJ8m+/f4OsSO0KU4t2yC5GtvCZb0CJEmY3a+/HXbe1f1NUx3nnK3Tzq00NnZGbE2NbXpbumAmnDLYrCxo4ZEI8TYYYDrZSWr5tG2+Aqw1HBSJl6ilZwdmCVpfIY4et4VtzvK2VIHDBdfKmc93cYuF4zzQU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(19092799006)(10067099003)(18002099003)(11063799006)(4143699003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8SW24ZzNTiHESs2noWqfBZt3CaIAvI75ygnDYwI5tTxi5mbX4lXIF5xDz6go?=
 =?us-ascii?Q?YinTHWBiE8FZhOz3SlMq7zKNd++yZxsTL1kvXrM5UgWOak8hxMaH9xEm8fuE?=
 =?us-ascii?Q?8rjDCJeVKQ5ZMWfliZ2GPFz1Cqe5nhOhAjMj7QSlbpMemtPI4cJJdxwDFTN1?=
 =?us-ascii?Q?2IYFUSwTEGMl3MAMCYVPew1hGYapnKcGEKx5fFuOfRCrIWVWUElVXLJJyAif?=
 =?us-ascii?Q?A1QEwo8b4Li4ELwtWCRPMGK2UPsQySFETD16LLmUE4piC2o0f8UJCL+v2tBj?=
 =?us-ascii?Q?/uVGtHVHGZRTREy/s8XH1uuiutZGqZYkUPzEpJ9vtX57FbWRXI306AEcHe31?=
 =?us-ascii?Q?iUX50Bv/bmwUJc+Cd9SPL3tbk1Y2+19Ns8yBkqEY8TOnU1k2hqtFZnE2MwSU?=
 =?us-ascii?Q?ruzX0S12WM8EFQaQpI5xh4hx8D1ojEzmBKRtwLBpCl7R2eEcvmSBaCGeWjvV?=
 =?us-ascii?Q?OzPhGiG38cyzCcYO+VZMoO1x3oMsgBfQBRBTEQ5xDhFOBQduStPjEWT6uVFN?=
 =?us-ascii?Q?RRee55R5Pz17U9v6DrnkK4YoX1AHK2KivuLYspxmTSa7WwV43Vdtgkn48W5P?=
 =?us-ascii?Q?SU/QFP/qvpw+heCQaEoX7nFK+Lg4d31DoRhxSyzylNQfjB8fAUQM1RQr8ikc?=
 =?us-ascii?Q?qReGHIuaIIHD6Na47LQRHeg6rRApflJ/FUQePFUyOIxFz3ikSsQEDYhYjmal?=
 =?us-ascii?Q?Vj1E2At4omsN1UnHVs7AYDe3XTZbnMtKOJpY62xfIpr6q1FZRFkU6uGB7UnO?=
 =?us-ascii?Q?TgPieu2pn/FHX5sJIhmL3Pp5vfGt0b0SwJHhdgXujN22ksgimsyhH7xqQy5j?=
 =?us-ascii?Q?Np5uF8Egtn1AZcm5JUgb6Mmlnbw5zaHJdhKxbgJEpIco1gP3xd8Liz7DThoK?=
 =?us-ascii?Q?2gGNtlvH5fAMi2p3GiDhEmJkGiBhbkX2Fe/NPmKE3P3cMtQ1fEA8OYA9YK3U?=
 =?us-ascii?Q?RiOB72spnpPheW/jAnHSp3JR2DU545LnT/qRCeygYcJ0ti74fNnV+vBI0OUt?=
 =?us-ascii?Q?DM0HWPy1HX+FkF3fIoPodA9p+l72KWRbKhKIgxESZPERbt6Ln1fDYF7vMkWK?=
 =?us-ascii?Q?TxQCItWn8siw4NFcGhSu5hMBEWNbpdDsggI5z7AGC48eIuEzcNxCjszo9tG/?=
 =?us-ascii?Q?CtDRxuks2AJ1b9IxSvWVGbpC7E4rWMSf6IDmcUPJnQfHT4JCY0Bug1ncuF4e?=
 =?us-ascii?Q?3Q84NlOwimKzby/shyqtlsvVm/dlS32GZ2nM3HBO+p/vVM3ZiNYB5HauSH/V?=
 =?us-ascii?Q?wfa5Q4dEntCcjMmDfKdt1uXOMxYcoZU5BeKElfuSf6+buIPh49PCL4umY3cV?=
 =?us-ascii?Q?RnqehRC7mKdnVULW7MBOdEPuiMI0ZP+HaBvg2BzQFagA4obrZkjoMKAcAJJ8?=
 =?us-ascii?Q?9MGl/Z2Iahyd7Vk1AY6vO8Z71eVe7JEJe7rUjk/NJwdaOoDWIbu91+jOiSVN?=
 =?us-ascii?Q?d3wCWNGOXBkXgNpRymTCrMMKaxXDb3aOoALykMvUpohCV/ONcIPSVV7XEQ5f?=
 =?us-ascii?Q?2l8dKmsdef8qh/54N43G0PisejJGziVGHbkIndXvx/TaduRYwdHToTvMcX8L?=
 =?us-ascii?Q?xZil5kX88vPwKdqXWAhDj+Ph+pJruyOTOwA060/u0kk5grtC2SX1T4q7oa9O?=
 =?us-ascii?Q?MleWtEzHj+i1dcKcyvPMb/O/vcS3YZYWTyV0LIZ5Jc7DCi/wA+6kFOvMvjhE?=
 =?us-ascii?Q?opbhl0O/HaUPyJgBV2IgJPvDTb9nrvXKfyfxCAEwKceqtOUy5eJj0b9GidOJ?=
 =?us-ascii?Q?nJQCHk5pJ3NVdQzQRj3PH29W4unFX4fVOg3gn+8+pWxk45xO78Em?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4948ef4f-809a-4128-2ff1-08df0e1d5223
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 02:52:00.7524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVYxx3vLDR33Bc/uvtSbao8YPAMZG/BHBGvPYuNw1RaksUKCE/wOgjWzkWFjVO6RySHcuWbafMWFoDr+0+r3y0IUQXSOJNlSDYW/JtfUiebCXvVSeXB64rc2NrAquwjT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8904

On Tue, Sep 08, 2026 at 04:17:57PM +0400, ivaylo wrote:
> On 8.09.26 12:59, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> > 
> > According to Synopsys eUSB2 PHY Databook, FSEL_48_MHZ_VAL should be 0x6
> > for supported 48 MHz reference clock.
> 
> I don't see this as a justified change. Samsung's implementation of eUSB2
> differs from the generic Synopsys interface, as is visible from the
> differences
> between QCOM's implementation and Samsung's.
> 
> From what I see for exynos2200, the FSEL value is 0x2 for both 24 MHz and
> 48 MHz. The differentiating part is that the upper PLL divider is 0x0 for 24
> MHz
> and 0x1 for 48 MHz. The current programming was taken from the samsung\

For Product Code H483-0, it's 0x2 for 24 MHz and 0x6 for 48 MHz. The PLL divider
is 0x0 for 24 MHz and 0x1 for 48 MHz too. So it does seem like something mismatch
in your side. Because the FSEL_*_MHZ_VAL is common definition in the driver, this
means FSEL_48_MHZ_VAL is not common anymore. But if you have confirmed it's simply
like that, it's fine. Others need to add their specific definition in the future.

> vendor kernel driver, which is a reliable-ish reference for the differences
> in register
> interface implementation when we have no other public resource like a
> manual.
> 
> ..now that I look into it though, the 11_8 value should probably be
> field_prep'd
> instead of just directly passed as an argument of
> snps_eusb2_hsphy_write_mask(),
> because right now it's essentially 0x1 & 0xf00 = 0? I haven't tested this
> path on
> my hardware, so it might prove to be a regression in the future?
> So:
> snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
> EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
> FIELD_PREP(EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK, config->div_11_8_val));

Yeah, sashiko had reported it:
https://sashiko.dev/#/patchset/20260908085953.3315953-1-xu.yang_2@oss.nxp.com?part=1

Thanks,
Xu Yang

> 
> For this patch though, unless this change is tested on real hardware and
> backed up
> by a technical reference manual for this particular implementation, CC-ing
> the
> change to stable is unreasonable.
> 
> Best regards,
> Ivaylo Ivanov
> 
> > 
> > Fixes: c4098f3e6134 ("phy: phy-snps-eusb2: add support for exynos2200")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >   drivers/phy/phy-snps-eusb2.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> > index af4fa17ac6cb..3cb18d6ebc1d 100644
> > --- a/drivers/phy/phy-snps-eusb2.c
> > +++ b/drivers/phy/phy-snps-eusb2.c
> > @@ -21,7 +21,7 @@
> >   #define FSEL_20_MHZ_VAL			(0x1)
> >   #define FSEL_24_MHZ_VAL			(0x2)
> >   #define FSEL_26_MHZ_VAL			(0x3)
> > -#define FSEL_48_MHZ_VAL			(0x2)
> > +#define FSEL_48_MHZ_VAL			(0x6)
> >   #define EXYNOS_USB_PHY_CFG_PLLCFG0	(0x8)
> >   #define PHY_CFG_PLL_FB_DIV_19_8_MASK	GENMASK(19, 8)
> 
