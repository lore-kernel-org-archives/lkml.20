Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C28645FFA3;
	Fri, 16 Oct 2026 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142394; cv=fail; b=u0M/VwER+Cx1ByML7k1uao5MWFZLDmH2zyl7w2W9JBvMGCOaNOi5BvhrSOu2dattlq9r0Wac5Lx9/hTR4Wf+iipuQlAYXN7HeOKi+JcV6kEkS2CSXlSlCRZ7+HEI9SJjtMe6YOcTYVQga3na0BsSyWYrQzhRb24nfBHgHrJmtok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142394; c=relaxed/simple;
	bh=9Gn93pIhjlNF2GcIS4zKKVIek2/flFBMg90d10jqKuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhJn53qVGeUY1hP2l4ur8FcpUQ9E5+zyxGhOo0+NC8O7nMyXNR6YXgVCxhftzY0wbogAMJPZVl+wEp7Aw2Mz30SBJlPMs1JgvePJKicdzbAUxZaBduzzkoeFy8JbYAjdG9TvcJme5cuaribzCH8G/xFmfCiSeqFAdxLUL9dIYwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dWIA+cT9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sPFl3/Jr; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dWIA+cT9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sPFl3/Jr"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G586RC2580533;
	Fri, 16 Oct 2026 04:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=nZXiGlWdDFGO0cC6N4
	MG6NRpfeJx2kG0/b8ROZ4+Y8Q=; b=dWIA+cT9cIdrgGf+sdMrfpf9sf9FTSV5GA
	7acETkgjzmKBciOz9DDn9BsuUb80+gjfJmay8P8JXq7ysfHbVZOglNaVYESCvmmz
	weCuNRDXY2ciewY+8Ea8NJDA+Lk5o8ga2p3ur3Hz1j5gXuR+mM051vBRGTkGauwx
	3MA1W1ag34aMzHgCSJVio38+9ZhSEHxEc0+p/8bbdxtZhBGovb0v54kXrDr2t0wL
	xtFaqJfNUt1yYRON78gBjbuV0/xOY74mjDLaUGVBX2swsutlN8F/B8jNnVBvDVdE
	wLVHrnOr6HwpVkAdpCiRfB0iu0oOFAAipmgVkA97etC4uk2sa9mA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020089.outbound.protection.outlook.com [52.101.56.89])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hayq6hjsk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 04:19:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afT8nfNx5L6LLJ4zwPCshDamnk7LmwvCOv4vMD+KJvaDBAmfx1teMuVR1IXsOuFXtpxikdKk4dhB8bTWnGX0OUooL1FLEQ+Bjc+zNQXMoamualFk64a2Iu+ywv7EJLOtlJVctRyFjErWYJ0EP/ZpAT3g9wCDcVqekTqIz/pCXDbUWgXZjpsBud396A9LSPg/oEcpiHVwe4fP6NyVhpMQj7GGlDValc+TI+IiPPMi7T3oIZFeEtG1q5RvN86Ps/o7Vhr8eUxqy0CR2620JZdJlmoSv7L4lrsPGiJ6WbEdzi3BgxZoLgWvAHca07r7MeQK87mEVC/iEo+zqV001aP4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZXiGlWdDFGO0cC6N4MG6NRpfeJx2kG0/b8ROZ4+Y8Q=;
 b=SQDrLrNboljzoSH0w9y+Xoh1dZ5HUxUiVI2dPTJSdNBlpWHytmwJp36hrhT8fztT3UeDCBn2U4Ua1X63dlC6U7U8MOJCztgtW/MCykNFuSI5J1QbBdFzUzmBrw5JgCbAKhvb07Ix/GluuefM3vLlLZgn/e77MOl2nf5+4PP71viMULFwNNZLa9n09MGNHDuG4Z6ByHTbmDFbU6EO38imVCP5Jy5cEfVGCSHlhoGhPN8dccJ1gkfPcyuH3nhprdCG4pqsdB76dfaFz1fuJkuizlq2nw7tykJ2z8pjFqoiVEHpvFqpzipa5r7W0ziMpupW5o2dynzY3LnnSEAysIg1Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=perex.cz
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZXiGlWdDFGO0cC6N4MG6NRpfeJx2kG0/b8ROZ4+Y8Q=;
 b=sPFl3/JrQ2Byh2FntkMCf2rsqY5c3ks11KSibOAKnSueJkMyF34J2ayJ+BX+COubq4I+T53UcMYioSh526/zISfMuhUhrLddSR/j4nCODsRP87vjWSw/snNnrTRh3meg3CiXpDdfDzJt1GfJYug9a97vk9BdOjuuXDtLn5KX8/g=
Received: from CH5P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::15)
 by CH8PR19MB542767.namprd19.prod.outlook.com (2603:10b6:610:31c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:19:31 +0000
Received: from CH01EPF000BE949.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::3b) by CH5P223CA0015.outlook.office365.com
 (2603:10b6:610:1f3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri,
 16 Oct 2026 09:19:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH01EPF000BE949.mail.protection.outlook.com (10.167.244.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Fri, 16 Oct 2026 09:19:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CDFC4406541;
	Fri, 16 Oct 2026 09:19:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A077F82024C;
	Fri, 16 Oct 2026 09:19:28 +0000 (UTC)
Date: Fri, 16 Oct 2026 10:19:27 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: phucduc.bui@gmail.com
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Andrei Simion <andrei.simion@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
        Syed Saba Kareem <syed.sabakareem@amd.com>,
        wangdicheng <wangdicheng@kylinos.cn>,
        Chris Bainbridge <chris.bainbridge@gmail.com>,
        Linus Walleij <linusw@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Hemanth Selam <hemanth.selam@gmail.com>,
        Md Shofiqul Islam <shofiqtest@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Zain Aboobacker <zainaboobacker33@gmail.com>,
        Sang-Heon Jeon <ekffu200098@gmail.com>, Bo Shen <voice.shen@atmel.com>,
        Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] ASoC: codecs: Explain DAI startup return value
 handling
Message-ID: <atHsH/hROH3ZLB9/@opensource.cirrus.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-5-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016040946.521195-5-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE949:EE_|CH8PR19MB542767:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf9dcd0-5ec8-4c43-df5c-08df2b669590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|82310400026|36860700016|56012099006|11063799006|4143699003|10067099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7E6p0O4isWc4N++GPPcmL1cWMp+u6lZ+pfAxswIxOECKFf3jUQKxob2S7H7Vyp6kNp9nK3cLWxAxnc0dAMtxH8PW0+aIsuyPXkxnnXQkoglO68jGzLK3vdDRHNm7SbWtNuJM4Drdcx12qomiBpSF7EPjhWY1X++rpznUyiv0pnbaALnmhu2jazBbexb4iwAtj6EOHamu63PqjlmFDa3mxsT3C+BIIB9o6soCm3eKGFMlhrdKFXqIMRTAn2V8jBGmeSO5FS25+Jp3h9UxsANZVeDsUbh2XeXNdoxNaGjXghy46iv0jlips1nri/Pehv8+GC2OZL7TK3bjq4ga1Lxj86KIBdTzZYS0NKYCFpwqHDWh8VIP62fLDUHcW09n+QCnLWO3g48liH/kys249A1hygrY2DlU2XnpfzjcivsrXRIxcQOSFBu/ZDlWa52P7bl+nqIsVQqqnNbE6QeTJRKWiDz0hvdtFOgt1V6dW2KEXXpDN292Q0tobxYMGReA9kU1NLSVjTUlQ85c2NfRNY0d9czG2Z+9n5XPBjNsoRgmDu1AN7sAXnVZf982CB3BdVBSfF5VfSwbK2inkHzlbxWJpkVEt5cb/bTlJpMd8o9BoyXqvyGOMmQ+9UmSCY8ZNG4tA+negkp5Hecyxk3XSTX/ag5t408+uP8g9GJoNSLbm95i+z7AsAdW1SITjHpZF1d/V2sMwOF/OE2ttpCPrE6Fyg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(4143699003)(10067099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aDTaAo2k1uhRj6f0gB3kRc4NJ+EzfocZKUIMLkIVIGv+wjMyjQdhZ9dL3GBY+Lj8DoYwfFHsypcBBh1viAh3YtlfBu8+qwRZ9IDUb5SxHQ7YnA7tm88CIxlMdKcWDOTMHYgPYYCAqE47pZh4BvpAhLQT9fl/geCqzzKvFe1T9XKoHJiMoiI86funByEshXP+pNaNPI7TjxldP7BsaGAIX++Q5kiTD6cV+GFeYFvmReeSl5koxx5RFkxKEeyrocJMD7GrctWS3fiVZfJBaYsx6keFzkPabDOhC6MHDSJnsIAbNXpqiCgsGPTdr3rivxXZCJH2yJU+Lbnol0y6vhNo4ERCz83q3ciDFsHqdz4znUFdwVG40JJDONZKk/xpWki8ExPmCovr564OdUfFF0Pmr99DMKdh+ksZiZjtSSJqrxbJPtOaVBWPNGSe6YcV/u1I
X-Exchange-RoutingPolicyChecked:
	Rb8vQSBGTLOoXXM4ATY91M7R0gmJJOYRU+c4JjNQ3FRsJV5UmLSZgs/l1zc2LLV9fGINwFX3Qrv46tF9hvzeS2yWV2y4fMFj5uwft5tthPG08jF0g8SDZXbpprFbizuBWM2PJgiraWeNumAx2bf8h49GtyEPcJhJeEKfj2F78lLu7dvUSM+w2WKUJ9OfW2S4luvnZesjArvf3Ct6Co+Atp00bvl51e4ZgqC6Mfi70IpV0ojmOZYXmysGqtAb7Ym02VBNSb0AR/U25MHpvGE7H/QwFoaAYOFMOuAqHI1NiJCHLozhF0ScSbak8AofhfvWNu004BFVBgYah3Lokqmd1Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:19:30.3493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf9dcd0-5ec8-4c43-df5c-08df2b669590
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH01EPF000BE949.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB542767
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX7KjPCszg64CX
 ET4A26SwcwEVkdhKHn5zo15gDMF2MXcjGbTrl/5CNSqqzaCJWYCIwaBfwihw2kfxnBrmVStpL7f
 OaBDLrOIsiSHxKWa1ACwet9HVsh0Wd8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX8oqPoTLUQyVt
 Wga4uwkDEHrB3zPlMFooeckucRrq2pquPtl8/zmqCxZf+qhYWEHteelDG6/y9AXEAeVJTlnqId/
 UNp+NEDJFWWZM8f0hdth/PLy3vwRY7D5uILzNiKqtMPXD1g6B4JEhIEPSVMFYoomaDA0FHvaPqk
 kIdVwPySwTjexJS/8XnDlWtFjPTjKGXBMrdoBTQLI1dtxqkGbCLlN8EtNpsTvBVDhnv76hwcLMc
 z6/TSFlQsxKuVhx9wPKLToiHr8KZgmPogkY+4w3TaWjZkAKwjSEkKeuq7gqapHbyUKzK1nsHtL1
 YapHGQo3pRNFUVo0MyOM+aiE3KQ/GhPwM0fC8NJaQdSuOg7PrpjmAAWRoJHDdywphL4Qxkf4xfe
 LuGHAeGd6RCihHVjfO/LtaFL/kP+573EuafPEzHwKBuLKwiOCTAXmh297IK1qJnqrqami59w4dX
 DZ52O8LPOboQOLlX2Mw==
X-Proofpoint-GUID: GX3PBmVj5lcaOqADcoPeiwJc97Sol6HZ
X-Proofpoint-ORIG-GUID: GX3PBmVj5lcaOqADcoPeiwJc97Sol6HZ
X-Authority-Analysis: v=2.4 cv=UuX2pOwB c=1 sm=1 tr=0 ts=6ad1ec27 cx=c_pps
 a=BKqWZN8aUWREUN+CsN3l9A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=nCq7GpDsCjV_zRYe78AA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Fri, Oct 16, 2026 at 11:09:39AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Add comments explaining why the .startup() callbacks must return
> 0 on success to ensure the DAI is correctly marked as started
> and prevent future changes from reintroducing the issue.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
