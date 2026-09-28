Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7871489892;
	Mon, 28 Sep 2026 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587996; cv=fail; b=E17+iDyLKvH3dSe0BXx8l75LJp3ROmEpqL1vjB4Fid6MboC9B/r1i8G++bJJoketsofhJiEtj+W4nKL12ao4N0nlvU9jl8wn7Is/idV9xNz3pvmoubMkQdPrpcP9DI9hGkKBCn8QgS7yVH5v3LpqFQ7qKsFCYdPFQp3E4O78lhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587996; c=relaxed/simple;
	bh=st2ke7FkDR5AYuBSc+uLvK8dTUvO9mR0W8RGAlzB0l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9/9Z9tNp7Rl3NjfDgRSnu6Yg304JbBqkYwPN2gbF5zMV+DOa9DFc6h9ECCVf/lTG+ThRTec5px3z0fUbWSPAjz88SQ4GD+foSBapnkKuT1zD9FycyvoGfEU3N4q6ImcZrLFxzwL7j6pW6hz/4l48MC0eP/PeFs78oe3ZaezdOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dFnAbFN0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Lh62e5vt; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dFnAbFN0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Lh62e5vt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S82FiC476976;
	Mon, 28 Sep 2026 04:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=JAvv9Chd3IOc7ehIpN
	wHDT6msUbechaBnQyUkak5RWE=; b=dFnAbFN0DRJAOw32th3ysJSH3C/Naq3IY1
	C89E2oxGsN5h2fGmtKrkp3oZiHqwP/PHuUjVeRFtltHzWlGo18bGFWyeg/bRqghZ
	AOxgJ+mCca74yCEfiuZFsqy2f2w9fO/jzTs1tVMvYQrvTfuv+fQZagESDEJHOBsl
	v5gONvDCl1m+9HauhP7mu7T4e7DkP9XStPhERdCqW/hS8G9Du1IgK7UDVEIlRiDX
	vSM8PP/E0z5P+s50ftG0HPSihCbXUaQqNo6Zkys8LYorDSDNvWnciVRy81eyCxnY
	2HO+/P4W1Gy7BYqzUsk2HE+ihtGJ/DdkEKuzqiITc5Ix0Pf3U/lA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021082.outbound.protection.outlook.com [52.101.57.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gxbf0htex-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 04:32:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eb0/468fQBg0XyJrfHh2/aWp4vA5ECVI89rSdrSk+Aaq5UJbLC06SxRgUbuOAU0ME+1Xb84xvRw6M7+LAEnroECCukaYSfqj1imLyilpdzxNiYzBW+FgKdJkXDMi6M6/I1l9PBb1HQNuaj4QdxIxbfDwld8POs5XIfEvbEnADvV9HuoQvCqxrnJ9856tTGhwwaRXhbnvXDq+gq7S7GhZXxxDhG2dIVkZVGXEHLLOry+g6hUiF0dVE2evlTt97VyjoFmWBpEKtnf8QidE4S1C3hVGQqdg4urbKGwrdLgbhxSk7Fj+AmeFTVt/Q5+qBsyZgfOn4zB/Djt/DN8BzAMKlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAvv9Chd3IOc7ehIpNwHDT6msUbechaBnQyUkak5RWE=;
 b=IJ4yFkguPyL2JzdsrKuZyXtYqPQqa4iKGJlSebI4RvSD9aeFdBuHIY7mzqccjOZ3lWm9x1JORrcboRkAbsi5oYJHZSq56irwyLRaAkBHqk17ltxHRYXdEYFAVkqEGugxBEYF1tsEYiSzQcNcPImnPl5RKZjV4u26sV4g0eLZ79IymPLSoTIHBTfY40NbtR2hH7jxPx7aJ5PLljv2i80hk3MLcBjvzoZRB3KAJVHoDOgc2PjJWbG+jrCPSJxhUIex6Rx2tuwOSMiMk/A1gfz0xUcsHbXjiNQ8tZkF3fOZHCR8p8TgV6+O72ULp9aHCrnINXnLy21fkv963eZSRSZxzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAvv9Chd3IOc7ehIpNwHDT6msUbechaBnQyUkak5RWE=;
 b=Lh62e5vtND5d7LSNzFUpH7HA6yx4clYaK27Oyp48ueJVPqBw4Ii2n/BsprCB7lUEAkflR1/3YM48gN5i2k1NI0Ah02SQ+G3TKn+rjlhgmwoxoDSFKby2w2VZIlfOOid9lZldAom7b8nXZufHg5rl1/VTB4cS48zHtRqNG3ONzkY=
Received: from CH0P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::29)
 by PH0PR19MB997630.namprd19.prod.outlook.com (2603:10b6:510:121::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 09:32:38 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::96) by CH0P223CA0012.outlook.office365.com
 (2603:10b6:610:116::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 09:32:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 09:32:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8DEC5406540;
	Mon, 28 Sep 2026 09:32:36 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 747A082254B;
	Mon, 28 Sep 2026 09:32:36 +0000 (UTC)
Date: Mon, 28 Sep 2026 10:32:35 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 1/7] ASoC: SDCA: allow building without ACPI
Message-ID: <aro0MzpmRmNDmDTN@opensource.cirrus.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925161049.758913-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925161049.758913-2-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|PH0PR19MB997630:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1dea8c-b6e7-4479-f809-08df1d436f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|7416014|376014|82310400026|36860700016|6133799003|10067099003|11063799006|56012099006|4143699003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2J13V9mUg7XJB8ilhhFCAX/2S7p7MIJTYeKHipMm283OS5McfmuJF4JQc2dFIBHVf197FFE3wJybfgSHEEImTfmDTT33QBR6XIBfxx3gqU2hzhJqqZxyiNgfbO4ZEXeBQp8Zn5mSOCRGJRvnSjL7iWTySz7+n4Vjyw4Yd1ezBuKfAPSt96rJKe/FXIwU28Xdz9sd+r76pJjfoGnIttJqadq+4H1e49Ca+DjCRBVNc5U+cmepL1oKeUk+q+iGuTC/wEfBJAS3bsMdGQ8M9JaZK4cpFQgLIk7W8VgmqWddQbZgSRsAM04fyDRQFnWFEGMOGbypqTOdSq8H9QCv8cPe2AyF/efwQ7fytZVSUr7ch+jYYbzpFv6hxvwwsVxvUsyQOAuwR27rfGQVNrL0X3xjmtLOvyZh3pX9gP8cx27JnU8uzKZlJvdDcl7ugrVZylt7i7YmFXyXSEJWPNV73GbLps2/eeatfXq2Bfbw5meztfg/Gky1MGGiRpEvyIhwj86zFJKRuAjnPMC394xuMdxlIkL6GdyexapSx2Uo8lZE/MkBJMtwAe71Su6ETtRJmEix0IpsqTAh1qripVLa6v3d6PBWWCcQSQc7IsPWWVzvMWCGS24gevkAnZcYm3laGEnk48jAAbfqEla19iUU7pJnqiurtyFHRhq+2Z0FK600ex3jS30ueHlhOMTxDgdnYYf0IAKdQbc4JvhfmLQihp3bXg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(7416014)(376014)(82310400026)(36860700016)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vivL0ks4rolMeLJ5NPlangBQBLhPUu6tODLu6P78+B2P9lJIzipGNSz44Cjb2yzCQISWsW29Kq3F7mMenHQTz+VYMZ9y4Cn7qXuiK3f6SLvi4EdRd0hnmEdvta41EFW4Aiu3iIY8Hp6ucdD4uFtE/UF8Bg+Yp59/okA53Ot5ytk6Y0LHcOILIwPw0ONlyCKdk9m+VfakXM1D6kMEYwtwmY2V+yBhWwiOihNVyvLci50ogwhxAW6EdyVasJlX+Q1zroMvVyXWcKOvaqxyJ17hnSleGN6hkYVNS0w5zLGfsLQmL8ESWcNCR+PWVWhR4x95diMcSZkLd4zdUI4hfTl3aLGssO+JETwY/T71DCKbD39i3H0ZIUI8sNlcBw4FDuxHmTDZ/DgmXxh3+F/SaPZctlTv5BGcKOPnSamYEZEB9n7sLpXaLXupPPCkw6AGhVWB
X-Exchange-RoutingPolicyChecked:
	GgFBcQ5PTBApsHodTyxIRbcUrNeT+/QT0GUKQB8Ge/3j71AVzEO+mmD+g+iUU1Ww7wDIBekuzzTzg3Kt8YsL+orbq0hsyrSbelovaIGoRb+5tSJiQSoUXAVvBGDo9hltOdgG3mbVU/UaO/IwGf1ZrtrOUb/HZhzu69iYr5m7RMMFK79P3fExVMxE/zrbu76PxOFv6sN8oYI+i/AzVHhzhFHqLtl039A9ATbbIdYNDWZuT1uMg8GgPO6EgJHTxNRjarnH2Aljn2sFPoQmdNeeAoLooehUrwl08Vr/7htVyuztIzFo69Waf1vEU2o+hgSWCCV78H7KAXxvofMluVljWA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:32:37.6370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1dea8c-b6e7-4479-f809-08df1d436f66
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB997630
X-Authority-Analysis: v=2.4 cv=GvLXaU1C c=1 sm=1 tr=0 ts=6aba343b cx=c_pps
 a=ub9VQ7IHc6Y/4yCKmbqoEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=pf9XO7oGsxipsZtEEBIA:9 a=CjuIK1q_8ugA:10
 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: PU0Kv-PTWHb4wt08FtwMZkF3pXsUiblT
X-Proofpoint-ORIG-GUID: PU0Kv-PTWHb4wt08FtwMZkF3pXsUiblT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX+BgPOD8zkSji
 u5D08xXeWep+yZ/nLw2N1Vb9KJ3xn8xDfqnQ3srRXvjCSGDQ4h7N5csDXx9byNSTayPo6TJ9Ufm
 FIkDxqlwXdGzLUYThHReM92TWr2UCFI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX3NxKj3hfMFUl
 8qn+o7d8q/JAkvhUyZH6ju8c6fLBjXnQ9S1WQMsgyzwNjEHSBesUzTjjKVCQua+Thu0kzHOgxNf
 s95qFVyq/Ah0829FG0OMU8quuHqrEFnvyOAOII3JQdwBO9hc5Zov/alB0ZMxQtYZQKCZTdd2wQP
 couLZKUxz12KfpsxpRYN5ZGgLNa5OqTJrUhNZfaMlPQ5ECE+hQhMgbgyD4CDJbPQvKt1P5fVe56
 D8D19TQ8gNTNLVtCPo9JeYq88qR5RLExFGsNIYG6YMZrN4HVjrIdfrGn/fduyQFTwRGBC1paK6+
 SaMTKAS32/p2qAu6B3PbmVWr5XVANxQomSeJdGP80b8YWdfsFEnT3lZKOkHWCc8bOtu51GFF202
 N7s61vbuw/zVCGz6bbupkhBh+MuZwrrmOW3z4bobcikvcIq4tj5OFE3t+8eLZ3Zdnusg2cEcOpy
 SbzV3skFXTE8TqphdIQ==
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 25, 2026 at 05:10:42PM +0100, Srinivas Kandagatla wrote:
> The SDCA class driver is useful on non-ACPI platforms where the
> topology is supplied statically via sdca_class_ops.populate_function.
> 
> Drop 'depends on ACPI' from SND_SOC_SDCA and guard the ACPI-specific
> enumeration helpers (sdca_lookup_functions, sdca_lookup_swft,
> sdca_lookup_interface_revision) in sdca_device.c and sdca_functions.c
> with IS_ENABLED(CONFIG_ACPI), providing empty stubs when ACPI is off.
> 
> The fwnode-based DisCo parser (sdca_parse_function() and its helpers
> in sdca_functions.c) stays compiled unconditionally: it uses only
> fwnode_* APIs and can in principle be reached from any firmware
> backend that supplies a matching device tree.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
