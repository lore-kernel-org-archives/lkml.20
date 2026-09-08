Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9352557D222;
	Tue,  8 Sep 2026 16:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884599; cv=fail; b=YCj2SCXsg2dAR6JVDJX4Ut9c5UEYMknmW6yPbeZm9b3Nb5qQVaNSBeqd6hYXxfxrM3TmH1j/n7IXfbU0pvurV8a6rtX2b6BdCHHijpZu+jB8qlm2EHSC5IYVygjmCn0kQ84cHIIHDITBHNJCCfXKHDWaLTMWCC8m31gVHuKudlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884599; c=relaxed/simple;
	bh=Wjj9hacrnDlgbpGyu4dLbCovdUQpv1gQ1nfxoyCE8Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjzuuhibzHP+d1kZdlQKtOrdGu0TIWG/NJFXukySbuvqmczUWgqR0u0k1fcPNdh+OZH0WK9mlvrzKFunTx+omckKwLIpJu78ClhsqBvLuh7X8HXZDNeFFTrOhSmJwnjjR0DB/eZB4CpstnZoIJeeSs3IicKTBc2eu+nu3PG91gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HWrfdXxR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=V3YjCaRF; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HWrfdXxR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="V3YjCaRF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fagjj374475;
	Tue, 8 Sep 2026 11:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=i5VYEjo6tkWskGep1F
	8lAzidL1ogX7Blc7x+za5IaM0=; b=HWrfdXxRrdb41PGwjhrTauirl4ZPuEHHsK
	B7oJTTK1y78SN96JYJZms/cI5MPlDal76DHIaPGHBgIq6ZO80yZAPjTNp5GUXrD/
	O1ztkxnPFhbVVAw1v7aKiveo9kcJlbN9nmyPBn5oVtMsC5Fj4WWcHo6N90Co0IzS
	R8thSdsHH1Qr8l3fCCfkQKsLCjssilusNR1aPIQdCKqzeFXleh4D10bScj7gJbKb
	ySxIpKS21fLYS3drl8u8fuKZNeA2SwxyhGgFBSe1avwdQISj1eYsCHgMEAb15FZY
	1LHQg+upXlvr/Tm3TL0dlsyxQO4DEQYckrWR5XCN1Z5a4s0+QGVw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020091.outbound.protection.outlook.com [52.101.56.91])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gggfwksxa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 11:23:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXT6Hmwn/GPtp61AOkiPU19Jg4Dfn4zIi8F8jLg5U04J0CPEXG7+6uz2Lj1a2qzbHEdW8El5RslLj6U18A909G8FUIW1SMhSEUs6CBQd3SjnGNKfBD+HDNqtbEQlC6KPj6fvmeKJ6BKViSwgLZvRHto1LUVAUh3YUqjmu1J44AJRBOLqIgTjn6w38HEHdtpbhDvcd8Uw+V/lAKMpGASGwLnkSAZG4DdI+KptomIB8/L0qtx9auWEfoboVHHmjx3NL+O6lRC0XjO1cj3toCOwrGRuuLFHFDWb7j4CT0j358i030HI+q3iWHHXZkYoGH1OXF5ssOv8CLrlVzDk6BuP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5VYEjo6tkWskGep1F8lAzidL1ogX7Blc7x+za5IaM0=;
 b=Kbg3fj13SHWOIxUMHcjFOrN5AF1DRbq/xr+c0g5zWKvgOKvHSt7LNdCuX1O0eUZ09Ceofih1vjuz1nma3YUnW9Vzpd4GFqPkRQOVyr5EA5UQElkZmcNUIsdIwAF6uBC0+B73Z4RUmUQzLrTHRl4ctEiLu3LOdCh4XvsssP5R/bIpZU1DRo1pOl8mEvvDQabp5aiW+TgMZ168tOKWiQKyZysQIar/n0paxLdTck8RtXMw9MFnUPhI71NzvycCypbBM6Q/tXmGBAW+cjgYHOQV63h+3gaQAaGEGFoPn3khBWstbweUnpsrfdbxKnz7SJtmRk1fnSBKYeZOIj/pc02GBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5VYEjo6tkWskGep1F8lAzidL1ogX7Blc7x+za5IaM0=;
 b=V3YjCaRFUr95KC17qg/uIB1fjsSg4Ftn03KLu6S6rB91L0NM3D7yfHbZnUTZ7NupaXuZ6Xg23LyXoxE9CWQzwZY04BWUxu4RvQ8TFNTlVSk4MjG3IrbngHRzi7JezQS3n5beC1swvxmFIOq5BEZ5Vnkww0RGjwt/oQie4WIawZY=
Received: from MN0P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::18)
 by BY3PR19MB4947.namprd19.prod.outlook.com (2603:10b6:a03:36a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 16:22:55 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:208:531:cafe::81) by MN0P222CA0013.outlook.office365.com
 (2603:10b6:208:531::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 16:22:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.0
 via Frontend Transport; Tue, 8 Sep 2026 16:22:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A6A30406543;
	Tue,  8 Sep 2026 16:22:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8E052820247;
	Tue,  8 Sep 2026 16:22:52 +0000 (UTC)
Date: Tue, 8 Sep 2026 17:22:51 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] ASoC: SDCA: export PM helpers keyed on
 sdca_class_drv
Message-ID: <aqA2W+hSCjLVIa2m@opensource.cirrus.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907083727.733705-3-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|BY3PR19MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: af6be60e-9f4e-4eab-fede-08df0dc56f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|23010399003|82310400026|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	VmRcLq/VDGoSgTRqqd3lup+boJi0CT9br5O29xKr7PykgZEtF9xUOIX+PZ0tsnL6+Qc3B8+TF5rzfW+/Zp6IIPl+lHzHh8x+KtptetrtEes6BPA+IsV36cL7A34msG5TZGduckyGBZvCfx1QpvNeOQtgnlGHt0dSi3Ql8TmOflvRaIlHkOQMTQg7XxcwXAZxRC24ZR5XOPW9YQs/vdU0T+Ly1xye+8OKcdn2yqZTlWX+T73l2azLbBw8e+jtkpOU6obkY8+3S7okQVL0FMkuyv+I1UBiRlTubq5rpARYUlm2b9PbtEIOUECLRj19bgmMHAMB7CqP8KKrwBV6ZK8Pkg+K2WbAkEvE9hO0rxGDkR0U2OvGtPCN9gVPhjMIMRiJesH9GcG8jBFAdCIZFAz34RGHpMAu7D6x+OFMpjt1KnKXExeuxdeSelsvFdqBgD/s4ZVOhzM74gw9dATbkTmkTZ155VFVd2EWwzcpGS1GAvdz0R+2uE6/sx7iJrNJ9hvZHZuFpGSfPZFj+96J/ksYz8WxjT9j8TfvLOa433m35SeFwSdzhGB2p3fBK65YuI5GPr6ar6Nho3eqqx3RgHzo+th2COtiN6Kg2LPI3FDrEJitWHe+Oy4gy9QFLohBvu62Li6x7Y922DHu9vRxFng1dAaB1N7V7a7VuUBxwU3g8Oi8u5+z/eYCQ4ZXARDrMHfUNBveXU6FVP5NXKGPS9XtQg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AElWpWxxrQkvGqav9RXVNTD4JKh+T7cFRefQAbWJAIbuAz0raTZLR3w7xLlN8YO84qx6mpc8Pr9beoNrLMJDGfa9jFVCUEp4bJC2PSY/DG1jKnRWqKdVrxyOvFV79JOR27DDqhp6yUJy4VlH7WDiDmFeVwjqwTOcZn01IDKGnXl+DaPAGkOhymc7ob0FL06Lzd/+WA5stdlIiq8Z0f2tg4zrewL8d7AzODjKun5GNBVvrUZSWD3WwGdn35ZjUpFv1QFktBePlYHkkh1/Y/swQzIFbHHod/VHwMk0S5WG2yN5VjqxHmbuXB1vmW/Uv5D130s6QPPOSg/DDZdIzlZBxwqcMqgzVe/ZU5ByyF/3qvG6d41eUfd1lMSN7GD3cEBetKqyHQzEdWFsviGVQrgJPlwOTDACKB77y1sPtQ03SgxyQXf8clrahT3Ul7hyPI5J
X-Exchange-RoutingPolicyChecked:
	ONfrmeeLD+RR6ml4j0xhg1LJ34bexQKd1RKYr/dbUf6fbr7h+phJYIJH/2cv/kEOmwK43eBxskycOgLB2ofgHXaN7uABZXG3sDXrOnjB20KJLRj8QG1soxGGV7zNEbXsAesqKZvQ2OXspYblUlLHrqnOgkiUFX7CiuhEFguGZP1rETjq++EkvGvSHfJCh5T7Cf9rqu3dhXclBYJ4NCIQMPxgpJva8dE7ArI+Ub+IHTuY1Cr/hbLzOz2qdf+iG20cvkuhum9a5i+Q/kX2x4dy1l35sC35pDjIERGyVHHZQCo7Nv3dpEsGNyQXnEzCnEQi++FBu/QDxPP0Ari0Vz01bQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:22:53.5002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af6be60e-9f4e-4eab-fede-08df0dc56f4f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4947
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3NyBTYWx0ZWRfX9KfuCUG+y4if
 HH/TT+Pd46zDDW1eOUG3ML4nWlvy3OEs6xnu0r57QOJeVqDhXkP1h/8EfYksitgSD3CEIt4hDRV
 rL8ndpFULnILpd9Kadka5GNapLQ6UOM=
X-Proofpoint-ORIG-GUID: 32FNkxqwxYAlvOD6fZYo8NouKGnTS4P-
X-Proofpoint-GUID: 32FNkxqwxYAlvOD6fZYo8NouKGnTS4P-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3NyBTYWx0ZWRfXyOov8EmtP5rl
 TQUtXXhEAQTIkOLLoEvscwbkpo6KlwgZIzdd0AkOSgNSOp9JTEKOTEYoxOYStyofq6GkKiQxXFb
 rrTgT0+1vzlCEK118M/sGdY/Yi/4vh9pkSYIONOmp9cBzOCO+diQlAYkmEOMr/1Nxk+g+65BUmR
 cRLwP6P3UTL4CtnbKm5qNpOYV5+Vkl+3klH1YjG9f64L4RCsr0B88784aEB30wOvZvterTjpTBU
 7GTEjvKam4t49DikGeJgzD40sthzRoEaLpILRVKRncYnUm7FqACk82hJUIfx2Ms1MD3g6E6nAK+
 wgZSkD44tI9JtU2iU+1Sjk75Ce2lNuIrwYLe2W0O+0mS77boI82THr1kTtFsJ6bM+tPgoYigM2g
 BnShwHCXxi2nlZHbmnh1DdFaoMLPW9IhVKDMcfzNGBTMa/+i370AQBlY/hhz9vgBbFQLmvEjdPo
 ZfX+KnYKZT9YTxUOasA==
X-Authority-Analysis: v=2.4 cv=fK4JG5ae c=1 sm=1 tr=0 ts=6aa03664 cx=c_pps
 a=DCeSEX+nBJmE/I7rcEuDsA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=4fkmI0CuGxZhtKRg138A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 07, 2026 at 09:37:16AM +0100, Srinivas Kandagatla wrote:
> The class PM callbacks pull sdca_class_drv out of drvdata, so the
> built-in class_sdw_driver owns the drvdata slot.  That works for the
> generic case but blocks codec drivers that want to embed
> sdca_class_drv in their own private struct -- they need drvdata for
> their codec priv.
> 
> Split the four callbacks into exported helpers that take a
> struct sdca_class_drv * directly:
> 
>   sdca_class_system_suspend()
>   sdca_class_system_resume()
>   sdca_class_runtime_suspend()
>   sdca_class_runtime_resume()
> 
> Codec drivers can now compose these into their own dev_pm_ops without
> going through drvdata.
> 
> For the built-in class_sdw_driver, add small dev_pm_ops wrappers that
> fetch drv from drvdata, wire them into sdca_class_pm_ops, and export
> the ops so any generic SDCA slave can pick them up as-is.
> 
> No functional change: the built-in class_sdw_driver keeps the same PM
> semantics; only the internal plumbing shifts to operate on
> sdca_class_drv instead of struct device *dev.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
> +/*
> + * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
> + * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
> + *
> + *	static int wcd_runtime_suspend(struct device *dev) {
> + *		struct wcd_priv *priv = dev_get_drvdata(dev);
> + *		return sdca_class_runtime_suspend(&priv->class);
> + *	}
> + *
> + * The built-in class_sdw_driver in sdca_class.c uses sdca_class_pm_ops
> + * directly because it stashes the sdca_class_drv in drvdata itself.
> + */
> +int sdca_class_runtime_suspend(struct sdca_class_drv *drv);
> +int sdca_class_runtime_resume(struct sdca_class_drv *drv);
> +int sdca_class_system_suspend(struct sdca_class_drv *drv);
> +int sdca_class_system_resume(struct sdca_class_drv *drv);
> +extern const struct dev_pm_ops sdca_class_pm_ops;

I don't think we use sdca_class_pm_ops outside the class driver
here, I would leave that internal unless we have a need for it.

Thanks,
Charles
