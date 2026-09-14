Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEFC4A386F;
	Mon, 14 Sep 2026 12:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390321; cv=fail; b=qfHH7V5VrpYfVR8405CXj1qZu4qVl+rFGinaFJCEhLoPRGwa7eNgq/RDaplihyG4gozpll2yfjXKcCzM3Aeugqoi1HwCiVdHQBEVv9aKeqkAuKkCyoXd6WjXWJ3h4uhfDqOEz5qIu/muFc4oNjjeZWrf8F7WjtJ0vb5sBeed6j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390321; c=relaxed/simple;
	bh=y0BrY5uiQ+1RNmoozimA9anxUY4D5YCgTggZBZw9pGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFP+8TP3ye70vhAr1BQtR52xE3m/FGl9mvb05oeL7hev5FSCkXhPt367+xim9aCZwYaKT9BsffvSNioABVXOIarOQGIAfzsd0PPw+3jajOfJZBs6LzahOBRH1tStSvUFsjMKaewJhG2g0lxHfyIOiDG9waWoF5Vkgh6suu9sS5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PrcPMkCu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=K+dlQrRJ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PrcPMkCu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="K+dlQrRJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E46UWi782710;
	Mon, 14 Sep 2026 07:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=cwVzM5Y59kPkvuafkt
	KkhEVcRjLZRm9/COqcmsqJOGQ=; b=PrcPMkCuYSeGAxKzkaIW3rBH/olzzkQubw
	UbixEvDZ3Dd+gn4QwbFFmYVIwd1uYpkqpHz9x9yUjgWeSkhCZ9AVrdXZJ6kI67sd
	SjcUNRrwuv4dzCIsj7eiyqKfFQd1/S9sTO+e1f8rHz5lc9xlAoZaLAdcxP+hnJE5
	NaUxIthVmQnBNtrNjDqkHIlbD5KT9WBCG7QPjWfH4TOILVlpvMiYPmFoTPvbkhAT
	pxYa0VsJznO3FktHZBJw4U3UGa7dnr4xVpa6CeNlzLCITXAy1UbKcpuQ3g0mrklR
	CdfMhc8XNF5MSfFbQxW/ofwdSJUwxCr7Rxzo2E6ae88putWLJRGw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021111.outbound.protection.outlook.com [52.101.52.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44w9tvp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:51:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKGsdMqFStkyF1OQto8WKDeS3h91lJhPmgBlANEOhAH8mgkk/Nk+xA3p+B1ihe+5E4sBmOrno7XNQHeuy+72qP4mZKzhPBkZGszrCQsqSUKLhYYFQNnGktafR1afn7LNecFk0bll/1to6qp78LjWmvuPtOCqkAUETuiNoIJ7sC1NMoqo+8k1ZZ8ZyhiB6STd8xsh40SFWScH49DYsa5r/HwonoOVp6rgiVQuUbEc1s5qk3+dng3bLVnq/2vGT4aK6zdYbOjSs0MbTqVp32Y8EJqf+JGInYUsejTtxoPk9i6ruiursmfyvanGfzMafaAgk6tQHrTYsztzh1Eo48WHjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwVzM5Y59kPkvuafktKkhEVcRjLZRm9/COqcmsqJOGQ=;
 b=mo0W1dKcOn2IYUuY6/Z8YJLOE9V9tL/0vb0I9T7VIGvu3n+2Wf/kPxfnfDJ4ECctknyFtMUcarlMNadHaB0BCqJBm6rmhWtxUDwn5+VfciVsdfH5SJ/ekHx+jtM0mHyNTRISvU3MrIT/IvtY3vCPL4hW62MUbzApzRb6IuON4fBlLpIE0iDPAL5OQmCR45GRzf7QP8mI+eAkJY5pd7OvT/Dt6bVp7ujNgwwu87IEUyhaklpH+7/64EAavK6TBtF5YXPKZQpjE0WAcmkigkRlXpWwObR4U/QTpfJr+SJ4uVeVIr8SuFW7k/9Ro1Lm9stPbvYIzJVNmuAWbPeuD2bLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwVzM5Y59kPkvuafktKkhEVcRjLZRm9/COqcmsqJOGQ=;
 b=K+dlQrRJtzVTznrETwbkzSmIc0sv9UEJ7XgrITcABN9jd96LLFrtMgvHp+cOckJA6Utw3vh8HLNwA47zl3XQvADzGCdG2wL1OEXZ242elaBDB2/Hu9ZL6+5FUc6zPua45X8OF3q79QjvevnlOmBedLX/Yw5uhp1EG+iigMxb9aE=
Received: from CH0PR03CA0219.namprd03.prod.outlook.com (2603:10b6:610:e7::14)
 by CH2PR19MB3783.namprd19.prod.outlook.com (2603:10b6:610:9e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 12:51:27 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::9c) by CH0PR03CA0219.outlook.office365.com
 (2603:10b6:610:e7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 12:51:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 12:51:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BEBC140655E;
	Mon, 14 Sep 2026 12:51:25 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A572582024B;
	Mon, 14 Sep 2026 12:51:25 +0000 (UTC)
Date: Mon, 14 Sep 2026 13:51:24 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] ASoC: cs42l52: Fix beep input device leak on card
 re-bind
Message-ID: <aqftzJeCiARDtRiS@opensource.cirrus.com>
References: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
 <20260913101531.2787654-6-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913101531.2787654-6-chancel.liu@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|CH2PR19MB3783:EE_
X-MS-Office365-Filtering-Correlation-Id: e41a7795-faff-46ce-f903-08df125ee3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|61400799027|36860700016|30052699003|16102099003|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	9Rsc7PW/ceIwkXC2ILNAS6By36jhxOEjBKBHobOXBAlrhnd3xKQl4giruRuRoy49l2kgVy3/vkEaZYJ+fJsy/4fLzvgai1t3lAma49voYytSaPGxsKVotLmuRDexJAr35XGwYNAiCigOdPwn/l5rrfCkREwqJHCyvJl0vgZaYuB3XEWQ8IzuKldlIfzN4MyDrKtxsNF2IHOEO3ERmCjuhxgerm0iBl2eUl8fQB336IVmf1ahPOJYPapMmC4HWF0ksYeYhz3yNS4yRgNtyNDVeUmxYIg8DMlPErK+Fr0+Hp72v0xn99hCiro3Dboo1E9iAawPn54SUEJO1imtD/nWmqacJ1UPRhygtYjpOYSQMMZYQbemOwF7jjkPGu/DGk4k1G4aV8rmJ5tpxZagIqXSG1/q4yL7o69zbz/j1YIjy3utbhotytFn/qWYGn38P5eCq2b5kL8ajLhmI62iGiaa5Auv0bqK7K7KB2sas39/Hyb7ZzpgFh0CNcl8o29ZS/J9QpcMT+Fq2GLUx0VtpJhhYPdTGsRt5MT73krLvfSWiLZ0fJdznnFWZMfGgHlM+WF1I66g8piBU72A6nzVNnbjuiX0nyFywstoBnEJyRNVVg7PNOHGVqd3bD1yoRPispkbe5ses08cW6dtGIcJYiV37gkC6SxiOYV/Wh+iC6GQCoet/nAIFuQR6SScX2dD4MvZBDlWPpXAi2o3rnNQFdcEpg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(61400799027)(36860700016)(30052699003)(16102099003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/Djr87Z3g9iwWUGpPVaycJ3vX/0pQ8zN85XcJVaFddbzbqXVYnTacoxWfaDmeIsw5fIdyeMAecqt0H2aszKNOx839WNbFWcrpEKINr8szrFH+jImcWpiJO+/IDqQIEY8Pz2uwHfJObh71rLh7AvbQJEAUK8bRIHK7oaHOpEXuN2FSJwjlR64buX2NECwaHBYBm5Olte+6XHDHA4rVxoN8oplJqu5YxCsQIZydNcJz09HW++4cbQCGOfofnfx4Nt+Dgugw2wswbo5G1c+rUA/rQRYzo2QFbQIXNccVu83Zo4SRssq7KNGmFRTU9kKnn+ZVHE6PS6Dxb7vIvsTRQn+pi3iHcKHpvgTTXUekugbZfCP0Z79+fkKGSjNPVgeNP5fAz5msQYfK8z0gOrM15LfqmeJVGlNPpZpWQhYTueZiIPLNll/wf6B7ZNR8Uz8VKr5
X-Exchange-RoutingPolicyChecked:
	GrKS5AwjqGXtOl352EryEZuI63bVP8hrWvkSKwY+trhFnGdTh+r580IutPGVzZsov+SiPIwOva3n98eXlCYVV7XCj0HEh4KfPOLv0+vpgH+vOhuguXyRdk1OTXEYeu30Oaw6CtWP4To5JIpbHTJ9avx7kFI1PF/mxyQ8IRVuT9jfAu02CSl2iqZXdCP6Xld5rhkzRQLSoOkLyJf+NfY/rHCvFxnlQr3Gg/MJ4rUQ5Ls7rDq1SNgA7nc3qTfShvXW/9bdSc6KaUiscdziU5RMw2lCOnpsr4tGLUXM2tqUjAcO6ECzam7zDPtGdV8VSU0TyzC80oivCRHOympqxFvdkA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:51:26.7514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e41a7795-faff-46ce-f903-08df125ee3e9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3783
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aa7edd5 cx=c_pps
 a=OyM5tLSvZCi3BtZZ++GVBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=8AirrxEcAAAA:8 a=w1d2syhTAAAA:8 a=IEBPCIGGTSWFdIOY6U4A:9 a=CjuIK1q_8ugA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX9t9RfxosnLjo
 zB92UECUf03GyOvgpnYM9fFcPUYHsPW0LBl+/nDFV5hx8J8ibUEaomIgVTrZhHvicR/jw83KFJZ
 WIY3mg8zNFkZOf9rYVdbXoF/KfiW7SHuPL7N26wdRSJNv7CHF8IqY0PInlBuBZbbhmMat2jmHU+
 mcji//7/f+QkhLbe0owT50uw+J37RCDPZVYp851OF9J4zsP8IpRvVAeeDTyul+68vix9VYXVz3f
 MZBC0nEDrj8yZ/KqVD/6RsZh5827s2I8PuEbmfvFp03ArgG2uKoDzEyIutBzU2Q/1FTJdxnrLyb
 AyicFS4Sctl9Z6wSoTHYKNBAsjWyVE2OSkVreGpNSqcy2SnKz7ahKRliDg714ke0exYxuY9ph9Q
 uxng6w7YZjpCYJkl/vMsiEaK7ihmVTTSRWYuHjDpgqhbnLsDe5hJYRE7y3Y/kF61FrnG3GjxQHD
 WTEpPGqthHYoiRL4MCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX9DGKuDqIae5G
 s+EW8xdFnV73AVJCEZ5cvTORy6wnqGAchcv0HlIYQroD9wxTWuGDf311ZYWTBaY4+L0KJvf7hzy
 lgPB4lyinD+WugRoQYDSZXz62F1FNoE=
X-Proofpoint-ORIG-GUID: IXnLAVCZYuLwqypYNRk15dr3w8oAW2Ja
X-Proofpoint-GUID: IXnLAVCZYuLwqypYNRk15dr3w8oAW2Ja
X-Proofpoint-Spam-Reason: safe

On Sun, Sep 13, 2026 at 07:15:30PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> cs42l52 allocates its beep input device with devm_input_allocate_device()
> from the ASoC component probe, but the associated devres cleanup is tied
> to the underlying I2C device, while cs42l52_free_beep() on the component
> remove path only clears the cs42l52->beep pointer.
> 
> The input device is only leaked when the sound card is unregistered and
> re-registered while the I2C device stays bound. On that path the
> component probe runs again and allocates and registers a new input
> device every time, leaking the previous one and its sysfs/input node.
> 
> Allocate the beep device with input_allocate_device() and pair it with
> the component lifecycle: input_free_device() on registration failure and
> input_unregister_device() in cs42l52_free_beep().
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
