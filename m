Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A5B494805;
	Mon, 19 Oct 2026 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398364; cv=fail; b=GqjSGU/Mwur0hBVE+xGb17ZvtA7CycOllEqiid2D9E/NdWjgMhdHIGiBVBHmYRv91B+Cba9hPgu8PGwAU69kst49PV/wtbJy0yovW6UStM6o0J7L2JcZgxezZ63epuptUDoFJr+vk9tOSPbK5Ey0STmGDa4GqMDp1hmydzHCSew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398364; c=relaxed/simple;
	bh=aln+pPK1V8SUB80+R8pugXDMSoWN9pgfQgH4qzA+KRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXu2mrFtpuzMRXnXTiwGt85nrds8JT0mr5SXFK7m/mvc/t2MgeMuuNJU6Qp3o4OwuCp26m0uywjTEtMiP+ON8yBSNK24+VXbOuoYNaAzRLuQpjDUht2z2/p6TB8K4Iw4Ys7R5I6BvILCAeKTG4TbzApvinEo25jpIKWWkmqHxoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XWdyfleN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tLg0a+ZX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XWdyfleN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tLg0a+ZX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J0Ysbv966900;
	Mon, 19 Oct 2026 03:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=jBQmpWDxr5t9SUYhAdenZGHufsC3mvruoyEJAwFdRCY=; b=
	XWdyfleNPVdEcjh6R4RzRVwVkBnGo2ZPHyQV+myVArRsXAQ11SWYhIg/AoaCPFSA
	yom1xeXHzorNCFHFQ8bPn3KPHzK/xRyIuppqa86Vya//f0qfXIFAPpbKmosAtQBw
	RNlXokBgb/S+IZJpRUn226exIsDV43Z9fscdS7Y+aJb9C7ns/6bkSdk0PfEC7I46
	+OzTjhiPajGBqynIvla5BjvW7zPXlQqyoHZ9QyOhzELrN4gPrhXjCiiesSRn9XoJ
	Cs81bVPGP5FrJONCb6F6/O/zwUV+LNeAxuVNLAqUMCkeVPJVeESP8MrgrOvA2q/+
	qTRS+KGJrZcVacMf9gJvGQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020104.outbound.protection.outlook.com [52.101.85.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hc5ej1sv3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 03:25:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mo1p0QTJgZNLqnDm16CS9xMDozp+gx0VQXJaxyZhEPk3Pbfng5j4yFtDVVqrmWr1DLroIRCKC+dUD9fK1vfaNk25VBnY+vXa/v0A/e/xjfDR6dQAxYeu2gCBaLVhZ7cnpyU6wITEesZbBNylpMCXkEudJ6KTb9ookYE1f1+2SjVX6RZUa592yaD8typkfO1iRxtnlM4N1rl8fEL+ZSf+RVxpldu29VetOPVILB24Yw3Jo8S/5UvnvOb0UmN14izg7XuSR1EmwrkgT4f6360/Ct3BQa1KEGw/mnJiK3JzNpHE/VWadLBV4U4DqLrub+56RkYyjhql2k/buyksaxPqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBQmpWDxr5t9SUYhAdenZGHufsC3mvruoyEJAwFdRCY=;
 b=PUn3pznJ3Cqtj87DbyDlpSYVXqtobePts4b2blkFWyu4Rj8OPWOm2lyVK4yNCEhlSYHpCzeeieC0RrYnnjGbjKwCnIzutFVKA63jHCzY4hqp6z7cG4DAi2TnBUY5vkfhF/M8KTiSwNl40rEtWu7e1L0XhnSfHoMb+K8L6gTW4+M5V92mpLhMnIofQ0rARUPiWzep+Ox0zQs5gaZmq3nkQTnB4HAGLZr+XNiQmAtWxNqqOyidRq4ncRy/CKQ9pqffSIbgElNeTkiNjRW9UdLI6wdtG4nSx1Un1uIqY6r0DrO+V849IZWRsNmhIwP8szv9SRWlQYoqX2LDByKclGvCiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBQmpWDxr5t9SUYhAdenZGHufsC3mvruoyEJAwFdRCY=;
 b=tLg0a+ZXCRtQnWyl4cl/lACLLWIgA32Vwe6+xROKNdTcQSVFg5LGq2Qk3znziwkt8bP3Oeb3YVm/yN+h1vzng0ymXVtZ/DaLbEJ+9jwMk40KDZXRwJZjX0S3O477wci6/W5BGHLXWZIka5nESFS00eJzJe4CLggh6z63PvIO3OY=
Received: from SJ0PR03CA0382.namprd03.prod.outlook.com (2603:10b6:a03:3a1::27)
 by MW4PR19MB6577.namprd19.prod.outlook.com (2603:10b6:303:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 08:25:12 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::a8) by SJ0PR03CA0382.outlook.office365.com
 (2603:10b6:a03:3a1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 08:25:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 19 Oct 2026 08:25:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2E9C8406541;
	Mon, 19 Oct 2026 08:25:10 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F27D8822557;
	Mon, 19 Oct 2026 08:25:09 +0000 (UTC)
Date: Mon, 19 Oct 2026 09:25:08 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
Message-ID: <atXT5AwBZ2ROs23Z@opensource.cirrus.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
 <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
 <sd9fj8SNRAmGisFuRJU7rg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sd9fj8SNRAmGisFuRJU7rg@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|MW4PR19MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: c517bb4a-90f3-4342-a1a6-08df2dba7e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|7416014|36860700016|82310400026|56012099006|4143699003|11063799006|261009223027099003|10067099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xeomRlBC4DBmOJ198MfK/jieudNvoSoZIkl4pT4xzXRJjYCPc+aJigJqWZ/uCXlZdgFn83s3yrD5wIzwNSfLv1lSmxGYboUf5EmpBLWXD6RQM0oFbrpeyiYBCSqS7Fgqh8ughg9QF5VifPbFJSpLeZarmc8JnZMfWVgVFHWKO1Pe2b/uAfLYUCjlriTeJqt00zdYV6VId875iEy+UG0ixm3GJnL/u2/OFQNHi/6ykTwTj4j2Dl4sFZ6x+zwGvtkcVQ6WyiyyyMl0Smg0JpAp/gO4FZ1z3mOc2u72dc9rg83pXF1IV5lTr/t8mJDcc/DKbMDUlK5PcJ3/z0bvMLY5eoYNzCDJ045VMjiHRmJyHgexS23ECwe58TgFe2wuo2ZpRUUOfZQxfJMbBFNQp8pZMrH0Qvj6FruOWQyDFLue/zwk2DLKDClbixJsmA9c9+DcqaZc8dkkXU6CtRTVw9xXhg5GgIyhvynACpJu0wx0aBZ4FKqGvafKyXvqra6H9iGehb5jcJfKCYQCETj/WE+bZGRaugKZ1zaHCZFH5g832pHZXQqPzUQjk2kiUVyFBK3JShuuItOo1LUOZGltwFLJjc3yMI3whZg6a0EVQ2eJVTDpuvhfdgAFsm/UuZBHjaysqx9ArAH5CT9LjRtDKklnk2zglb8Tvxi8CPfIeaOg3Obj9l2k9QUyPuYl8EI6iS7P
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(7416014)(36860700016)(82310400026)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Al40ETBIiBl/XU5T6pQE7rop1c8cm+07nfMQlv/XKsDLI0OcFHsAJ4GyQVNmbSgIZnCaHOP/dyYhuAhQgazcnTagEHPUFLMqGB9pH10skZwxHrB/QhvbVtNAr+m+4LYiGrVsLjAULpAt8ZjcWTzB6E2rNtzuSKftJmX2FewQRdOAKfGZ2R0m36SWOymVYjGTe+BcdFD4jaU4pWaNp9XCfohHFE3T4Z0P6XSAakP2tFCNBOjOp0J8XM6Ef6sFnannkc9wvNcYYlcKHlfWR4kRvrodzGgpW+xHvx3ubgw4SI219fIn0cSTT1XSFYTY7zn1nr+/fLiL3Ir3tX0j7CRbDi6syPQRynDNdIauJBN3GXh/hdGCA2Njve1C/EX6fNyuOYQKT/VCfCtmtp693Vqxn+jRQ8MNbS+ONG2L091EECxTKCq/vgtsCdsqRvk0phWu
X-Exchange-RoutingPolicyChecked:
	ElHWVGpeWnRCs8MsAFLqD0SI4SrNmjaV+XRzgPFUQ+UfY6yW6bE4P2MFE0KKXxB00p5B40FnKAFH4QGSIW171UvecGyR+/9pA5WfU1vpiThEH5sqRL02qEQ3yOJpjWp/HqJp6vhMlxwTh3lJBPthMUYrrC+4iNevityW/4VD4i1NJ8z265uL9vTCYBlMks9dE7kcPqtrICxji5TkypguAxLHMyfNRPIYUSKQ+Fdi5U9bO66sGvqxhqA/WK4wCQXhgK+xO0iItii151tTtveW6pDATcfxoOZ4ZnuX4cyNplRLb9t/6g+t3QsAjTIHVa6EMLJRKw2e2mSPahP6hr6jYw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 08:25:11.4892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c517bb4a-90f3-4342-a1a6-08df2dba7e6c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6577
X-Proofpoint-ORIG-GUID: LmkQHzN6ro7XQh91d5k8bcZZPHsJr0EU
X-Proofpoint-GUID: LmkQHzN6ro7XQh91d5k8bcZZPHsJr0EU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfX4cx4URvniOsS
 ZyXL2Bcef7mYT+OMv4dO67f2TVcHmL6nhzsYqBiB9/uUX5IZk6F4b52S+ibhRN0pb0pAXPdZPTl
 4cVzY33IuvUeaoDnZ3uK4KwKnZrGZtA=
X-Authority-Analysis: v=2.4 cv=KrjYSmWN c=1 sm=1 tr=0 ts=6ad5d3ec cx=c_pps
 a=YeUnXQYOh0peJx5dC52sgg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=NwbpVL58AAAA:8 a=pGLkceISAAAA:8 a=mPtHCIp1d0rDpM4fcCMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNWvAHffTtQgx3ZTRG8Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfX/tnpJaP0DUhc
 0sQgyNAejtNDStyDdmxyuMztUl7xACwj8Td97+byh0XxFW0cQht4QO32tPBJ1QsG078MvlwFLL9
 sl/BIRGq8gawHcOXBgWtRDrdprWsXcMrPnGfweJYzh2mJq1mZud9dp3v6Uk2/wvU8W+lzdZy9DT
 RxM8eFAj3JwEXHO2q3h2iPoznajC4sMOpXZ5agROHXKOkgsIsr8QQDnyCPQA1m9vhAmWzToegyO
 cBpUTkPmvjFq52/Z/u8gitEMiZLauDBtrQrKKHwU5Pk/E+d0VU50/qP+EDPLOnz4haWjba+kPnp
 JTDx/n9YuilHqOvZcNIrFHCCf/cR54hTTmqbBd48//TVPTTrJ8s+s50TltdHHDV9oCkBbLRoqup
 /sEWy7IKwSj8MEaxoEyZ73g6scoTZ6faA1fucM4VirDPtkNFdyNMoetfkongBj1lDaPSkmLOnDr
 ie5FT30VOQQyuI051og==
X-Proofpoint-Spam-Reason: safe

On Sun, Oct 18, 2026 at 03:47:54PM +1000, James Calligeros wrote:
> On Thursday, 8 October 2026 12:23:42 am Australian Eastern Standard Time 
> Charles Keepax wrote:
> > On Sun, Oct 04, 2026 at 04:03:35PM +1000, James Calligeros wrote:
> > > From: Martin Povišer <povik+lin@cutebit.org>
> > > 
> > > Let the 'fixup_controls' card method return error values which will roll
> > > back the half-done binding of the card.
> > > 
> > > Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> > > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > > ---
> > > 
> > >  include/sound/soc-card.h                 |  2 +-
> > >  include/sound/soc.h                      |  2 +-
> > >  .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
> > >  sound/soc/soc-card.c                     | 12 +++++++++---
> > >  sound/soc/soc-core.c                     |  5 ++++-
> > 
> > Fixup is missing here for sound/soc/sdca/sdca_class_function.c
> 
> Unless I'm missing something, that one calls the .fixup_controls on
> snd_soc_component_driver, which is not the snd_soc_card callback
> modified by this commit. That callback already expected an int,
> and class_function_component_fixup_controls already returns one
> per b8f71f16134f ("ASoC: SDCA: Switch to fixup_controls callback
> for IRQ registration").

Yeah my bad, apologies for the noise.

Thanks,
Charles
