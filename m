Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846AA4DA540;
	Mon, 21 Sep 2026 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008131; cv=fail; b=DKzYRcPVVo6hCO83yy/Patf8JaGJQs2OmwHRDv0bbX9TEZBrPxRJ5jESWDFH+GTkVCPEzRTjvEV/KEy4bfChqIBvjP4mJtw90YpNw4V6aHJE7YgQkYWfWXJs678u4ywtswuvDaXhAiG4YpaheHhseljV3Kaj4q64r3FZtMmvc/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008131; c=relaxed/simple;
	bh=wMUITZscgz70xkhPySjnWKYeyGBBAFwGGe7yZMmH624=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjwjcLC6Lj3y00Km1Y8Dquc/j6dmZoyCekwlASSdEhihmXoQ24mxyAaoCx1uW2K17Q6IK+qxQ/Sq2apgWfSDDhmkSVKiY9gJrQiTWSt0UzITlD3pHBlDEC4zbc0Am86hR3N4ustFNY3YwsBF/LGflQUqg45hU2MG/Yx9DjoGiDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XLGsAhAA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KrjDxNVR; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XLGsAhAA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KrjDxNVR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEi4sJ1547342;
	Mon, 21 Sep 2026 11:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=jxtAlA5GlDFeVwxGeacOQGp9QBx7wcRm9o0QdQ3l7Jw=; b=
	XLGsAhAAye+xZ+3/mF33xMWUYDSBiBViUJbDZ2swUMo5WyfeR+IAupFgB3on+2qT
	Z3gMsStXvebwTVP7JzquQvXCLRdmYENCZykEaoj0H/1W3zjIZxvUa2GWLB9VWI2m
	6lOUmniD30K4B37UsmIys1mOqUEcJ/4ut/rdZhWEwLF/lCWmn4fyAPVLIuIYQB/g
	7PMYaO42TTZ+HgtON8Fu7XCmODGw92SWLoP9IqyD7BkURqd+QCMWzAvvGXNIxN9h
	eH73brPIUdLsRgXGEnDI2Joa+iFacUpSWq4qWA0IkVz0y90Xosg2KaG0W4pdI46A
	EBGgbex3ieTmIdn/Pg6i8w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020110.outbound.protection.outlook.com [52.101.193.110])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gsptj2axg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 11:27:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeVjXYL/cuhG4GO4WDJj0NwV3bi+GB5FRVjYvZknud19DkCNW8yViXGUYkMqaf3ZPNKnMb0j69phNRoUIh7LmzoKzvNpmdQXm1JVgOK1HqfJzxDxBgEo9HDQYCpy+5YjRyJDlK8pptNa+e4YM1g5sP+jamWKEM+NxFrHGswIMKG68R6cPPqiWj1L5WHsjtCeyPh8bZz8SNoqgBxI2t8MgD7kZKdfX8Z4e3Lr7a/WxXBBDkX5U96cJ4Z6vH5mbWPL8GQo3iiHxwh6kJwGuWBb2KVFFL2nbmwzVDgPOCcAGK6DMAJH4JpzRLrQDV7Ji6wlRk922gHPT7amqCKZlTbZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxtAlA5GlDFeVwxGeacOQGp9QBx7wcRm9o0QdQ3l7Jw=;
 b=WBBrqTlof/GyR1hxRpvjuoHDsUW8VWChTvrR43WiVEJFL9Bwco3ZhoUW5W8d0vhd99WikCFvRM/IXbex+8DdPF0tntuyVma+paObJKhxM/pOEJP4UyHA46RF9iWevpagCAaNDAaECT/dyFwDyyaTq++ahSv1t40ki54J2TPEU6EZ5Ail/iVsfmAaaUp3chSMQVY+4cALJIp76Zayw53k74Rbv9Iy4a5wIBTgIkGX70kH3VaP0YwKKMXOMS+apF4p7JkuxCq+QokCMQf3+r63VYOjAOjPXKGOLteTkKEpxU77+sdTOxt9vm+17yrJ+7x7tv5VAH1IhZpy5fQ4f4Nhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxtAlA5GlDFeVwxGeacOQGp9QBx7wcRm9o0QdQ3l7Jw=;
 b=KrjDxNVRcVU9BzWKrCJNvOopQ4juRPaB5F6m7drUzzSVq5mToVKBPsq1gbobyFZ2EWS2d2KF2MEazRF7wgrgjlj0hWrzIYdn1WJsW7IcKMxC8Cqm5niaqomUPQdBb3o20QCqGs+DcWJf74h9KMrXLS3qhrRlyCo18w5XTHgp9aI=
Received: from BY3PR10CA0002.namprd10.prod.outlook.com (2603:10b6:a03:255::7)
 by LV0PR19MB9496.namprd19.prod.outlook.com (2603:10b6:408:321::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:27:41 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::5b) by BY3PR10CA0002.outlook.office365.com
 (2603:10b6:a03:255::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 16:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 16:27:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 00777406540;
	Mon, 21 Sep 2026 16:27:39 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D8FA3820244;
	Mon, 21 Sep 2026 16:27:38 +0000 (UTC)
Date: Mon, 21 Sep 2026 17:27:37 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: James Calligeros <jcalligeros99@gmail.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 10/28] ASoC: ops: Accept patterns in snd_soc_limit_volume
Message-ID: <arFa+frv9QcL4b36@opensource.cirrus.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-10-741cc20a74e5@gmail.com>
 <arFM5QGrJx1aYhGK@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arFM5QGrJx1aYhGK@sirena.co.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|LV0PR19MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f9fddc-41bd-4cd4-9b94-08df17fd41b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|61400799027|36860700016|7416014|376014|10067099003|5023799004|22082099003|16102099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	WEt2hcz/03tIBvyp5dvbFm4gNUUXpUXESpxFIrKSeD8tS1Jzy4DNl/I92fRUVE2UjF8N3Wv+IIUMZFsg1MQr533qgvBzz/uOVAAQR04nXcoMWuo2vc9+TrOHsuJatzCrb+HKFIq4sFtWTkdTqbsXXVk5qPBgLb5EgFka/4FNO/YVnIuYG50IdF/0e6bIgOi6QOfy1c+UiuObwgy0jpZ1iEzSuxMr8ENW8vSxlBwXNJvBxyhmkVy1pvnjZObnllZDZ6A6Vro2xDVYZg7ektdqhO+GqZb4q5jqZnHcMR41xrC+0aN5Ud1Q6z/4Hd91MZHuHpA/wniALc5zWzAZTQ9WauH2r0sCMiAPSbRiOAouLKXKg6knY2NHUUAZzevfRF600rFfIAsu90IB7aakRfGOBvHibTC3xGu4dZuCxoDAsiu1vhLfcSF3cqVZpmL+K+EHzoPn3Hgh/vMBPxRAIFW13AYNEflzA/Uy3b1g6sAr3zb03n9wQDgdO0BsoWSI0mNbntZkbOcGAiwUEmEm88OtmfbKkEDpJ3FrgtMg5mLNO9Xe0rS4fC7aVvvDFbVVzt8pFdbC8KPuG4rm0I/Fm4toocw2IPtH522pLkXplOyJdMMDCidRLwa6X+Ct/M2AW8J6+WPoiNLZjFLPJm2545sKo7QhfA2M1BDFc37oZxMx2OAuwzTgkjneH3y8r7s+e0s8mjnR6T35nS90GISd7asTpg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(61400799027)(36860700016)(7416014)(376014)(10067099003)(5023799004)(22082099003)(16102099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qKV/o5LUfpym/rFkK6QuV5/U6VWw4LhJSuFmQn81EyqdFQl8/Sj8e7pqkhUjpSwfU40CHGcf7knnE9CZqIIShUVtOaFMruAQyaB8YdwicoBlVvKEOTdxEMG/uxVfZoUbgEk0qtxYJxnuli6/R+mfefRJaKs6W+8dPuPk/djVCZliulKx4BYCh8Uxg7iLmtczz43hdteI2tKnLQ7ZK7/b/azCXyN96hXNCuwsbmDkCTDuKN/V85+bJpS1afAwi8Oep9xDBvxfkeOEpxShC2JRS5oUps9gPSuYtRz21vXWVqdIfdPAm6ON9gJY+AwNsGAEiNEgvKSfbszke+zke5mCy227f1xQySAVVsWw7ZNK8Ukx+cDOz72e7M+zRH/rasCXsiTfJkRca5Y1iPedCzd4Zz7keXt717mzPjp3MP4o8q0UV3Iy34iuqs6e1qMclahe
X-Exchange-RoutingPolicyChecked:
	S0rtAnkfmxfH/KvAABj1sTAFUinw2TT8HFFQ2qyofuUdvzJXvoOhy63pJINwU+ty+1GleS6vKtI6MFCUyR6q88BjBBnwwE7miXUfAQ2N9o6NTGw68/d1+zTl3Kqv4aEiqHMNIf3+8rdPt79lBVoJKfP94zdJ8fEGEMYnajTqZD9AsTUgSUylkGj0hnCKCIr/e2kH+QT0n0U54wgJ0cBE9/kKrB6NX7VeOJ87MtCExGDnhQkNdaCk9CRNY6st+sqC06tViDPwFQff6cF6yCFkwbiY1K3YtKtiUvgVy1YxUXZlKNYnhMYEwc46n1Lb/SHpZnssj59y3Go4tmyi1VQ4NQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:27:40.3659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f9fddc-41bd-4cd4-9b94-08df17fd41b7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9496
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MCBTYWx0ZWRfX/GPi3cPUZWej
 W/xSIdKZXY94akUQEx+GhcwSXGSjkqXpI4bnhbbqsdzafVftTZ/S9Lx+zGcZVc2jAreaGOeve7W
 HWxfp7vHvqux0bIN4gMWsMcqNTaTDRM=
X-Authority-Analysis: v=2.4 cv=fuZJ914f c=1 sm=1 tr=0 ts=6ab15b02 cx=c_pps
 a=pY+kOdcf8RAo0+yonGAjpg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=NwbpVL58AAAA:8 a=2jMZWftWlEQurTBL9HEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNWvAHffTtQgx3ZTRG8Q:22
X-Proofpoint-GUID: daj2nYHdeRL-jd2F9FSBK9u0q0ldrj5H
X-Proofpoint-ORIG-GUID: daj2nYHdeRL-jd2F9FSBK9u0q0ldrj5H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MCBTYWx0ZWRfXy1P7UpMmWDcm
 91lDuP926PhllMe9Nng6XDi0LlHab2LmWvQdLWFUWSUBX2odOXw+tWNr94IOTF/ySsZmg1a6DSz
 sbVfQ5NuMGvWeBqYWAPK2CZfYkqEmzp2xEo+luOwS6qzudy8CgQacReZSnubJ4eY4ykAOHkpJfg
 i/Igd1XhgPHzWmj2PYNsbc+Y7cQHnTxyNlfNOPmKd8isq3p4OpYqEbg94pwBg44fNGeCTCrWaAs
 KU4qbMwt8ZqtlXwnX4ZfqgnLVv1Tk/YwC+zm6IDa3Eqdtd67xxcZi6190pQVN4uj89T2mKVgduI
 cI4dRRAFie5rUkkv42dTpVGgJS5S8i1kSGIZUCiMIm6D0rut2T2cjvyMeps36SLYtfogAYsq7U/
 DsvHxaWhNvLUCLSzW8Mz2cQleks8aQ17y3KpJeSPDg4c9TuxwBnrACx3NWsIRZjj+v5+2aw1CZn
 0I8POgtvvPtqrqfcT8g==
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 21, 2026 at 05:27:33PM +0200, Mark Brown wrote:
> On Sun, Sep 20, 2026 at 02:53:49PM +1000, James Calligeros wrote:
> > From: Martin Povišer <povik+lin@cutebit.org>
> > 
> > In snd_soc_limit_volume, instead of looking up a single control by name,
> > also understand wildcard-starting patterns like '* Amp Gain Volume' to
> > touch many controls at one.
> 
> > -	return soc_limit_volume(kctl, max);
> > +	return hits;
> >  }
> >  EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
> 
> This will break the existing Cirrus and TI users which treat non-zero
> values as errors, most users ignore the return value but they check.

Thanks, yeah fixing up the existing users would be greatly
appreciated.

Also are we sure this wildcard approach is the way to go? Does
make me slightly nervous that you could get stuff like a driver
adds a new control and it gets pulled unexpectedly into a
wildcarded limit.

Are you using the wildcard mostly to skip the component prefix
stuff? I wonder if adding an option to match without that might
be more explicit.

Thanks,
Charles
