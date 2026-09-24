Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DB847D931;
	Thu, 24 Sep 2026 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251884; cv=fail; b=XRD6MyQRvKfn1su266IjA5wJrOsPvkEGvtAvITXf1VC+NdPup7Fn0d/9wbpYl4F9WKxjPFVitjOrHXENyGmpGpsAhFXVFPhkkjiITSGrtdVdoRFobSafeelykcIbw4b+iHAa1ECJf7ewsN9nJ5kB/P8vLtoSN2wtft+8K/oJEro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251884; c=relaxed/simple;
	bh=acsPx/2VPFjNjUn1jfnmE79c4Cs7flJOb98G20QY8/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4g5nKo3sZlRc3ZJf8KdiB/3tXe16HM5CVFAh0zjEg0Mfqyk+cnBHShVk7ZizshH4aFHI4MEEoVAYY8RPL6Ssui8m/TqFXnK07Oq6Qf/orOEnzoL+/4BTk9qiF0oXPKi4WR7/eRSy6c43X7KaQ/qIWLqbeYdEpg+LizP8jCGhP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mV6h5AWE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=A8DCpt7M; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mV6h5AWE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="A8DCpt7M"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O4ktdD3655109;
	Thu, 24 Sep 2026 07:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=LiJrhdf7orjFMrpca5
	AIEVefRfjU3YJraJhQSlc0dMA=; b=mV6h5AWEufiIA1fnPjZxFO9CwYj3K3swoV
	tqJVNZNKJMpZmo0iBPHSLWOa7YYZIef2m8bX3SKiHiFEiCmV/RyM0cv/ASyPpUYU
	Wf8cveXMdtvH49VeYW6C7Uw0zi/YsvQMSVSeLn/oy4o91H+VlFZkg6wEnLryieaH
	PUF+rBlvQjToiTV5PwaktYtmu/Bffi7j0xw1AgYiy/eUZ3GAMRaVxJE0LJjbLCYf
	5w4UpGU/Tu3+uVYo6AwMCj2rILWMA891YzaV1QkasWtfgbYeh+QKycYkZr/iJCAD
	XKGu0bl3OCUYvynO+q1pItgyfSMDK4bxyTrHfNfQ+l+h/mJ8NpjA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020091.outbound.protection.outlook.com [52.101.56.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gsptj783t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 07:10:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3KoYWgETObZ6JAB9sjEsWH+a84xHgpL0J832KOjEkDCjJefrdJHcmANEnxnvxtow7W7pC1UJcWzgEX38hxpeJs7IEsYBDuC96oSbuu0NNY1tDISte6QAkVV9ru6YISyumJ55kxOw1QmQLo54XFCx+8RNckZX0SuMS5tQEzs/MJ1OTor+oUiwva/XlRuk4P+y8k30R6klrLwFHNM3RQtMhdZsDdiNJa32G6Jo3BGKaLKD2Y7RJlxOIBvgiNEPfw4jya4i9Ou5eS2j1T/25cUUhyWbKXu1C7AkzbzE0h7DVA8sCfAv20U3mla1uIYiBueVec7fJShvT2GfHau4V2gww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiJrhdf7orjFMrpca5AIEVefRfjU3YJraJhQSlc0dMA=;
 b=I9tzX9La0YQnpGKTYqJ0MnvKOva4U8h73+K6G99mB5jWc6OduI+RyuRd555DMNKQEvAlEzoGdvyzkOEnPyGX4quKjdt4kVs6SvR/Fcnpc/U1h+Cjw4UJID4613tsQH2y68ioWmfrqwshhrnxtMZYXjkDLM51t8YHDRakhLboPv3jz1XgPKhe9QtUfssJqFGU/Y6otKE0EmW93cSch7PgQqTzeFULcN77Ul5zKVPcOxDM9HC1za6FbL+6ywuzZ3ymwgas/Qu5IruiVd53PTWpVo8Rg7oVuBD67ZL+YN4U9FIadDNOtkSAeRY94M8+tmIGWpfX34VywtL2agOSO13e2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiJrhdf7orjFMrpca5AIEVefRfjU3YJraJhQSlc0dMA=;
 b=A8DCpt7MtO4uKIcB2K9m10izt3zIDiWJXEagzMQjWDc0ljOSo/Geu550waNHVDJiLNzyrTcQA9P1zUmyLiqFJQkgvIiKMRKMTAc69GGHfxCxppUY+ofQxWPbL0QRoQsUyLPHW4jrgVu35Y6jo8nprDHO4aXb7U7XzORPZu/8Z40=
Received: from SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::25)
 by DM3PPF7C2EA11C8.namprd19.prod.outlook.com (2603:10b6:f:fc00::73b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 12:10:47 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::9c) by SJ0P220CA0009.outlook.office365.com
 (2603:10b6:a03:41b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 12:10:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 24 Sep 2026 12:10:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2528D406540;
	Thu, 24 Sep 2026 12:10:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0BE87820247;
	Thu, 24 Sep 2026 12:10:45 +0000 (UTC)
Date: Thu, 24 Sep 2026 13:10:43 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: use regmap_assign_bits() for conditional set/clear
Message-ID: <arUTQzogoZ1TJCh7@opensource.cirrus.com>
References: <20260924083420.461715-1-peng.fan@oss.nxp.com>
 <arTxlkxUFjg8EOJ2@opensource.cirrus.com>
 <0a1eb6d0-262a-4e19-b947-e9c810a79261@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a1eb6d0-262a-4e19-b947-e9c810a79261@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|DM3PPF7C2EA11C8:EE_
X-MS-Office365-Filtering-Correlation-Id: f1409f45-fe7c-4999-66a3-08df1a34ddd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|23010399003|7416014|376014|10067099003|56012099006|16102099003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	YZ4QuQqr5IwMv79lGLiJO4ihK850jxumBZuBo4dlYm8kmyMbIQ40H0GsJ31xv3EKsHqJG0JL/+ey/rqdkTnDIg5cpzpMshuJUQGFJd26tCuLiAXjdYHb7e3EVwzGTZM5pWk1QwoQy4xwaSHZU3nhNOFBSngqn57TM/hpajd2v3/LRvPILYsrf5ghQ6L5un3nqATLaOFMMvmckjS/SFE0qZBPAzYqki3hn1OA7qiijPQjast+sgkJ1ASzjoIuJlnY+ZUA4I9angi0mJszuE1ZaiKb+2/j10gnbW3JPdq+2bOy+sklQ/jNA0YvHp6MgK3BTHJHAuO1ZiAF4Y9zSfVJSziNXPKZVFBIofZBM0P584mekUY0MubJrxSbfkkBRoq+QZKZn4fqPy2oZBFHHF2PLyzzYRfmHsV6rSnB+bYDFr7JxSzpfVqcxQ6Pp0JRq4N3Pqke1Js+2ibRi8HF9axb91Ner473q/g1y4qXGae47mbQ6ypUYNnuoLAJyvrPgZo0KpuyaVbaDo9ryr9xYZ1ZTaG5/kZqjMqqaHMVHuXwBuREOH3xNPGsvp/br3ZlZWBL29RGnGKjBijn1vftyv/U2Stee1u/YNHU2/fiTI3wEKuz9YVsaGTm6LNCPWdadq/mu1P9lp5mq4BFDS1gzGfP58++VVIxMzD8oiwTuUSgaPINJud0/rN8ptbOSwxWtuMI3eh8a7i3Pgy8dO4Rapqt4A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(23010399003)(7416014)(376014)(10067099003)(56012099006)(16102099003)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	12zDWvMN9T7teCIQLVjgTWWJznpFNYz8OoaD15rtVAsriZmeWCTaa0NSonXNERc7u0IfJphPQyJabnephtvUCc6BSHoujqv2BbYm6nwE2jhglDMfOl+bpGHiJ3vPyZL6wz4AjVAhBm3rRFi/NyauWqJk9ZQQTtYQdUo2bsxC92INapuppydcDCMlEoSFuXaJI2eNbc3IrKs2VXBVbu4amfTTYUnmPa1iJMAqnBfXtTmP3AKs/v+4jH0k8Brlm+8v5eqnO78OdHgJeZm1bkxSN6PpApN+qZdJRyQ7QoHcwLKrZgUExQBtusbdFc1vZcBMycMHxXN2Ou6sz4OKi78ug5iMEAwe9DoTeGpfrvnPVtC+aV6A83qLW2E/ASTxeDxSy+xFEdk4iIPm1/hu1HqCLoObl2jAuOgkVEk591DeYZf7A4mHLZr1kwSDefNMJ9Cr
X-Exchange-RoutingPolicyChecked:
	WMpi1jEestbrQhA1oX0L/aJEardRgpDgtfXGDhKl1Jo4+q6XhLJGYIimtNRzAw2pIyCRB77J2hku8amxW7MLVorQMlTwZGGM80MDGbuuYCgrRPmw5vJCi15AjCPNhpOi7kkruHE6/8lGAgeKdM305EmJA8wDkqKpOg5xtYH0LMyl2ejrUzjJRDjs71Xlvu1uF0Tf8zhhuaNoHVDAUsKKJvdAIVK5ii9hmjey7jYgL3jajylGJVLoNwhmS87bANkUuHE+D2fgykxhIA2VZh0M5EUFgesH9OZGzqCzwSZWmfMClK8soEzeluAdTFIrv989TqxVROKM7HuLz6YJN7y8TQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 12:10:46.9250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1409f45-fe7c-4999-66a3-08df1a34ddd8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7C2EA11C8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXyTVR/x10z/AN
 Bzd2sN+2/MGJ/EMGCriWgkKTrbw+NpUa0zSwvXJYR1lbRFw8NKEW7N2jy5IE0UWIi0A5wj7KxQX
 7hKh0j388rOaGD2kbdg+l3Hqji1/KU4=
X-Authority-Analysis: v=2.4 cv=fuZJ914f c=1 sm=1 tr=0 ts=6ab5134f cx=c_pps
 a=DCeSEX+nBJmE/I7rcEuDsA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=P-bQNk1nBDSioH3yHm8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: nvIBLbVWm0sYEfdSZH9SKo3DmOELgT8k
X-Proofpoint-ORIG-GUID: nvIBLbVWm0sYEfdSZH9SKo3DmOELgT8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX3C3dU5m7ZlJG
 Cxia/FidQ34ATftvaspsh+WI8xP8Ul7Dsmct0wGeBmm6+jqReDXBszljeHe7EuqNeZnIcwu9diI
 ZPd9CAOofQVc1YJq4AeiWuDYhTz/L+E8+btHGoE1m1cKmnzmRiTduOOKwaiy9fiq43rOBFYHM5o
 KSNZtqATWd2B+Q4a2czan4VZhmEEXu1QPqYfHcSRUMKT3B5dW43uH9ygUJ72LaxR+KDJjEwLXKf
 bRGhLRW14d5KLkFHUS05mxkIgsT7PCmkOCd2nWQRjWCpJ3QQr+loOH37QgWGqN1kV2LzUdoo9KM
 nc+CYSRtN97FT3aZDNk8rPhalEUwTDu778stOTwCqX8ZLYzHJ7/w50xGvUIRn0TlF0yXgaAuy3h
 APxschu1DqpGH1YUgWa15kJeCED7XiS+wlS3sTvA/pRgCkFGtPymEjcx+R7MWmPPl8uWq3jKdXX
 T4PgCQkrDQEQWsAo55A==
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 24, 2026 at 01:04:16PM +0100, Mark Brown wrote:
> On Thu, Sep 24, 2026 at 10:47:02AM +0100, Charles Keepax wrote:
> > On Thu, Sep 24, 2026 at 04:34:12PM +0800, Peng Fan (OSS) wrote:
> 
> > > Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> > > the simpler regmap_assign_bits() calls in the cs35l45 codec and the
> > > mediatek mt8188 ADDA and DMIC DAI drivers.
> 
> > > -	if ((bool)ucontrol->value.integer.value[0])
> > > -		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
> > > -	else
> > > -		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
> 
> > > +	regmap_assign_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK,
> > > +			   (bool)ucontrol->value.integer.value[0]);
> 
> > This doesn't work value will be bit(0) but SYNC_EN is bit(8).
> 
> No, it's _assign_bits() not _update_bits() so it'll set the bits
> specified in the third argument if the fourth argument is true.
> 
> > Also would be better to split this patch into two, one for the
> > mediatek stuff, one for the cirrus stuff.
> 
> Yes.

oops yeah, thanks for the correction.

Thanks,
Charles
