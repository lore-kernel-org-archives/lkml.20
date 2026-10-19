Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456AD3AF662;
	Mon, 19 Oct 2026 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401910; cv=fail; b=mogfJIOtLHyaVP5cyEFGmLrDcouH2zxSgS4EFAg9k6fWNBBOJn9oMAQmb3lqMk7BGAv/261XjWJme1Spc3fb1+2u0gLlTdWKaV8l+1/dnAx1BvejPkdoVWPWsrC6b6q7rHDw/1MYeDO7oAxCRrNqTTdJ+rwMGQBGiuh/SjwANg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401910; c=relaxed/simple;
	bh=ifGxxgFl+cuemZUBWFHeYRndYoyFoLjDiEgfDnxCq9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KENO1+LGD1XHXk5BC+bKss9LKEJdYZ99udWxKbXfEEdkIAvgaBQic+dvh18Pjstg4da9ctK+tsYcFczhtja2owuBJLdt+GWRV2xZWhLI+KCuu8t/E/cRQgLoJ2hDsi7H5eJhpcdhgQzi1FV8Xcoy+mHyZLzToL7Oi5MYUDSgm9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jNp5jVqE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=h4W/Et0J; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jNp5jVqE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="h4W/Et0J"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J5qWBC3213457;
	Mon, 19 Oct 2026 04:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=E3QIYINI62JRI0WMw6
	Lv9UzQzj8T9l5y86dtelN3DDk=; b=jNp5jVqEGUBiPCEXBMl9G/5Cj3phDcjgZl
	Il4jezs8zzboengdoGOabarOd75GdsH6bo6tXQR89JTWZo0Xp31KhMbulmaxuwnY
	CbdBRXBrYrjIH4d+kRKiPcvlxp/sO9Vc64fsdbDmX/ZoILULEOm6Cy4tSBIGa+xL
	Af7bkr/n14RoQ6MkRzkJVhQOxi30z87ICDm275sJqlmnyDlofNXh7fpgWksqSjif
	IzJofBzT8J97VpkijRDs1veQpDVXG+CidtmhwXz4lsY85TYN2UR/hcQ3xh7u7czO
	dEiQx59BJ60kepBMywJt7HWVYSDZx7W9psk/1c76E6ejUcpy88vg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022079.outbound.protection.outlook.com [52.101.43.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hcpts13v6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 04:24:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c94DcEBpEPpSRsawjqkdIoDUQX+cRsdmP/3W8gtN4IiGVWF2SpoJ9s6rcc84N3PWxrFTkPZvnwqtxThjZccTOs2H/0AEPcR69dv065G75gA2YV7tVMCR91sJYFkEnMDkkrbXaOVT62vsX6zXej0e6V3UaU5930AMaRBJqRIHkKztHj1biwWac6QFqG/53AZKOMT81Mj0hB6F2uWDCoeo1CFmfGMKYSdIsCWOFzOd6yppZZqQN75bl51cufOoUxTihtXiEYSZXwy0asD1avOpXmRt8e9i8sTjRh8J9J+tlqG64gbstlWkNdrFcjXSGvNkXA55LhYihYeOCqJ9bw8GYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3QIYINI62JRI0WMw6Lv9UzQzj8T9l5y86dtelN3DDk=;
 b=gVvlaIiSqqUQYd7DuZMwTp5alyuvhbQf4L3HOz0btkqwkjr6CbaW1Au5ZaFWu5ZNKtxmJjLfhDkXSlapG3AcTM32eNvO1DeW/xgWXzwiVIImcykgS5fOVfzzt2PRU/7B3Nbp0g0T3CxwtYwQ2LB+Veu3BCHDpq11d2wPLy9aXoUixpDXCBnQWblYom0mXZiQhNTF3AcjD1kp8/5ZRwVlW2ua0WbmE7/ShMCDwYcTLOfiMCmiVhJMMm7Uqd8DSkTY63M/6hRyjKE+1p7fcYvpsiIvLgC3+DD3QgWTcGn3ZAFWpx1w21Ij97K53EPbRYuuVZaCXSClKmmrMXOBcn26nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3QIYINI62JRI0WMw6Lv9UzQzj8T9l5y86dtelN3DDk=;
 b=h4W/Et0JYlAlKBQY76iVV6k7UW7oHDfyewAP7sGyvqESby5KMBSSmVlDu3yaVOXVQmNOMC9Rn2oAaDEbVdVftKugKGjqqoxoQeGuJ+a7W17q1NPxDdGpt+em4uvXWcjJcMIEcJWEnZsXatGw0b/MnhkOdutiqM/pO69SNoCUT08=
Received: from BN9PR03CA0937.namprd03.prod.outlook.com (2603:10b6:408:108::12)
 by IA3PR19MB8544.namprd19.prod.outlook.com (2603:10b6:208:518::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 09:24:47 +0000
Received: from BN7PEPF000000AA.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::3c) by BN9PR03CA0937.outlook.office365.com
 (2603:10b6:408:108::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 19
 Oct 2026 09:24:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF000000AA.mail.protection.outlook.com (10.167.245.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 19 Oct 2026 09:24:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C7CB2406540;
	Mon, 19 Oct 2026 09:24:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A7C2282255D;
	Mon, 19 Oct 2026 09:24:45 +0000 (UTC)
Date: Mon, 19 Oct 2026 10:24:44 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, Zhang Yi <zhangyi@everest-semi.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: core: Warn about controls whose register fields
 overlap
Message-ID: <atXh3Br+fuH83S0q@opensource.cirrus.com>
References: <20261019051321.2973771-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019051321.2973771-1-sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AA:EE_|IA3PR19MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cbb63de-a868-49dc-9db9-08df2dc2d19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|36860700016|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|16102099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	H3Mf2jfgB+qXHH0/aAeYC3u87cY3bq+QFLO2P5yA0WdRR+TdxhhP8BKmBw5oIiGRMY6vpwninvdb9j2xf15o1ey+2aHsKGShRYPOmJrUeU7P/hRkFRn9y74H9CVsA4hvJ/g5W10E/HSlx27OJ6ICYKtxaxNetQkYO9yTbiROVotMa/vhCbmGMhMIsRHUarIiyHR1Y1NQSa0yMPUJFSd7UNg75BiWod48Mp0C+LAqqclwiV5fKMJ/xNYQn4yYPE1eV14+229GMC+yH/nLdxjMGugMUMauqKMUC79R8EAUmtWc4KUy+4YjrEw/IbMlqCjlTHF8HCHcbhihLHlMSTePiaS+V+nmGurXpNK14Rg9LM/p+W5QjfD7x/telobpGqM6XGmantPXov0c4vwvvZZa3B1WSbTfZQJNkTbodxfbqTNPtoWaA+xyWIvt1H+Y3Rg1DEC6p1YyI5sfQL1dCeGiDZ/hlXA8xT6MZbhmDYbXNk0ni9O2U+bZtBnGuq2hw/y70+B2w3wao3uWXtPIUYusIo0egiLpLfB2o81tbZN67EU0WGOPk8rEHz+m4dEhsc/dvdZnqtPqODM6IAyCVI1kh1ypnzxGZaJVSV0V0dIVp9yvp7RLS0VtT7SRGEzAtt72SlsFq3yLFu3hw4ZAM4wnIA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(16102099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JElEJcFsegbxYBeLNYjt+FagchLAXLI41zmFwQtvQEjzD+UIrJ6QiJ5gmvc+aW1FjD7UeqcDxJFEW7gPKq3JHnvaph6n2aRPTC1O1BW/U5y0okjNoayo0iYW/txns9XHWXu6NWWz1cGUKnWyK9hMUKYmsqbaTKoQcNsa6j956P7vfhr7+AbXWuf2uqI1NQYOvWZFni6osrWCAkm19QymnQuZrwdoUH8oPdgOKMHxKg8Jf64zmOJTytgCf8bWXksOOEygsq0YzEI6KTqcjfgE54CcMzFjaBFr3wMA/QEIfLY3hpOU5mvcP3JV8FQgCmQlnf5lN++GHV0QTJNaMcfRZuED5Vb0rMhU1ACVCANS3a2mse8eML2COJyzWJgwh+OrsjnXeUjsrRTc7RpFxbyV7O0fRyQa81H/pMeT8WAiYIMNEic8uX+A0JtFG3rEZHqu
X-Exchange-RoutingPolicyChecked:
	ZaFrNHXEWwq+CoGAHPjSbix0FTSQvKQWudR4LwAE6PBLUjt8cNjwVEWUgHGk1hneZcgtC4qCwbv4r2wjtBrFYJQbD2TiqYYZ189/tHGPsjWLKS0ih4053+X1VjVeS6LLouffzL/KNemo4NvefwPbp3eBLvcncVFe+752/hVEcqq94tsXEKm9QfiVt8Dr+do0SE8bcF+WpXcFfFRmGDgktKHrtQL37bVGuwBR3SfBOe589o5J3IWTyQUfLbhKunRAkY0ymgYTEyUqyxwOLNXm88HLnwnZDYCIrfcTZ9MiGLlOMII/vveakAZI3d6ulz1R81683HIDKf88nP8+qw+fUw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 09:24:47.1376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbb63de-a868-49dc-9db9-08df2dc2d19c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF000000AA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8544
X-Authority-Analysis: v=2.4 cv=QM391QLL c=1 sm=1 tr=0 ts=6ad5e1e4 cx=c_pps
 a=floMify7oDVZ59GUGiBMBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=qNABUOcEAAAA:8 a=pGLkceISAAAA:8 a=kN8MVBHoDUu0j23ZBggA:9
 a=CjuIK1q_8ugA:10 a=Ytm653ucTKQjCvbzLygB:22
X-Proofpoint-ORIG-GUID: DSRj_DO6xBSw1LkG0-cY1IEKX6aVgct0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX6SaTYxaAu4Pd
 2fjgfM9M78+VQckuKA3Khl9+/qOn6RkonNw+KL6h3zQcw2tmKWrhN9anNKEdvwRVDBg2F90wumr
 MFfpUNZKEi0qxdLrBGtqy8Y0lf/GS5Q=
X-Proofpoint-GUID: DSRj_DO6xBSw1LkG0-cY1IEKX6aVgct0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX+NxgzG63ecyf
 FergoOxyP4Efm8DseXGHyZmYOk5ymtWWRpOavMvMXSjWYj1E0icK8bkYk2fp1Z93BQj1ElF/Hy4
 iCvJYdQ9laMdjolWtSdVDp99Fj0r+qeGkBJv4CqRns2u/paFmivfthOJG+kwatvVHG6/pIA27+z
 YG3d3cwAFNmilvSAt1ahB6z57h+F8zvKnbY9gV3zBHvZLcUekMu6DQrebzXT2yDjZ8cu7cy47uh
 52pXSPli8IvITbfdqrdTyLqKuIhzLHzI29jcwJNhhIFGpYVqsu/LqtpgomeNGtz96mTz4qs23qe
 Z+xBKmng0Pw3f9w0bUvQ2VEHYqyxqsa3pPVcW2BPxiSAoU/NzKwaPHNgZDpUPrd2tDNG91RhGg2
 JHpKygq8AnlL0iZ4fiNwMDPD7ZBi9aOrQ8OeBxAzMVAVx3nSDjGeJNKuWTi9ODXOb9E4Her8vqm
 J7Y1gg42HqUm9h6IoLA==
X-Proofpoint-Spam-Reason: safe

On Mon, Oct 19, 2026 at 02:13:21PM +0900, HyeongJun An wrote:
> A control that writes part of another control's register field also
> changes that control. Usually the bits it was meant to own are then out
> of reach. 26 of these were fixed in codec drivers this cycle. Most
> dated back to the first version of the driver.
> 
> So check each control as it is added. If it shares a register with a
> control of the same component, and the two fields overlap but are not
> the same, print a warning. Identical fields are not reported, as some
> drivers expose one field under two names.
> 
> Only controls with the volsw, volsw_sx and enum_double put callbacks
> are checked. For other controls the bits written are not known.
> 
> Add a KUnit test for the field calculation.
> 
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/all/0fefbfe1-021b-46b2-8945-15956e75e37f@sirena.org.uk/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---
> 
> Notes:
>     On for-7.4 an allmodconfig build gives four warnings in three drivers:
>     
>       cs42l56: ADC Mute Switch with ADCA Invert and ADCB Invert

Looking at this one I think it makes sense to drop the control
here. As the control doesn't currently point to the right bits we
know no one is successfully using it, and really it is simplest
to have either automatic muting or manual muting not both.

I can do a patch to fix up if you like? Or happy for you to do so
if you prefer?

Thanks,
Charles
