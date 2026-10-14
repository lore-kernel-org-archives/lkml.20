Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4BE4D0A0A;
	Wed, 14 Oct 2026 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970024; cv=fail; b=ZexU+TPgMqE7yrRYX+rciUuX7xzWHhnJBL9DdDGGfyVcdpOxrUkHvTkLxFD8xwdZM3+m3Gv+cPr8HYFqpOAClozc94PCFHNsderYrHg7dPOWXo1oSYo7pL4At1XO4ySySlmr+HyiV4wZARrzpYAPa8IZinSYm660rqlxXbf+hEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970024; c=relaxed/simple;
	bh=danE6UvpetDvaKfLAYNqdGXfPMXJBIdWteSkFXTRvhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RL7rzxqM2bYKpwv3W9tb0Ke/0S/NAhFKHrYF1KbD66e4X8NL/Swx/lYLitlHUIn+P3kq/5iaDLnZuqgUcyLfN8U8+zvX7/G40JyBy4n4NzaFm76WzaeRwttdFJ7AehCxXPPCBTjQ8MoWydXnRR55hBnJcNemnpw2TtA3eP5yzQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pcvb+Yk7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=t0qrD7WG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Pcvb+Yk7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="t0qrD7WG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8mLK7287713;
	Wed, 14 Oct 2026 04:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=GvQpDhaRmH3HBjW4Zm
	BoiHijMZXY1EvGDGMqXNGOdxA=; b=Pcvb+Yk7ijC7RF8ohJbIg7gkChgi1ezO8P
	vGHkYWMpDHDwLZR7swzQpw/pxcAgI23U35FMT/pjMfSoYCkmun4d9NI5gbLdyKYV
	Gj6LRevTBiNm7YB6i4Ax38pyHZ/pe3Bt2FdJJnSYoC5MK3zE1iGvpbqCqlxKXcGt
	lIADJUOjqh+leAxwxuD+nGpTJkK1d24ObDBuwBOPPgmce9yCQpx4opJwUE2nMKad
	uZYG6ZcgZ2rVgFeUr8kn/pSH4LNC1UQcmvfpyeAiw+Icwin1WMDol/Bph2CH+X3p
	xT97+zgPGjLTms6H9RZ0wJNjDgC5svQU7tmpTtLXlNanRfbUgFTA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020124.outbound.protection.outlook.com [40.93.198.124])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h7jrxdbsd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:26:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhN8wq9nu+tjiDPMNuEKUn3cuJdxbw92ToKtUQ1xuhzFTnXe1Dg3ieDcTBK5H7tx1JTxcvqvmY1fyV08+56QvXK8WZ4M5MrLk0/Hftmq3djIzhKKr0A07N9EgjPf6BvVG+yD92Z8cZ/G+cqty4IONHXiNI9NuH3VoGQkcQgYh6RsdxlYCBCwGRFivQXTtyCW/QqQN8/wCAxg0lZIDxUaWwDJjjhIPaT/PpOPsyUKCOCyN4lWI2SvbUHmTGGhRwoNWm3EQI7a/q3ySxA61LyXEJlen73i05CMLPUSBGN1qioDrfywi0r9cPCUKGr3Eegy3WUwNhql5Ggjg/MDfqx9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvQpDhaRmH3HBjW4ZmBoiHijMZXY1EvGDGMqXNGOdxA=;
 b=k6HZdJqNZf25f00cxeP0fssy886X13C1c+jyI29M7ankX/Pn0Uln4KdMbTJhfwutvTA4sJT0Vwa/UUcrfaCsLXv6+TUgc2haDWw517VJEDDR7ZufL/MwLvrCrXgVQmXsCeXyUR1lS0Gpj+z7A0fzaqoKEJZ2IdnzANXVrr7GN+KSSFomqrKQQhCb5WcPGVFuAeD6VNUYOFg9N1P7hR2V7kHt1xTkDYIo6UDpC1BuYCDYCDI/DI2mgOKWlt0hECwQhky/XedA/nbPxoUbu/G8gfSKocEJu+CFM+gMCvxQMlxHwiF45KR5iX4fiBYjoexZ+v9fXjeflyRbn7m1i1h91g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=163.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvQpDhaRmH3HBjW4ZmBoiHijMZXY1EvGDGMqXNGOdxA=;
 b=t0qrD7WGRfHHDlesMSkvbdxn6zYsqiXM0lInlb6CtUJZ2cuLMgG3W9SAgl/1VqYRep8dIWchXC08Owg/ptvkRRdDRYDW8Hba+8AAPntxul6dSiq0etJD+Z+fCE0VqMhsKzwga84uHtu/xErSkxXZG0NMdzmb3WXGWkx47cU219U=
Received: from SN7PR04CA0182.namprd04.prod.outlook.com (2603:10b6:806:126::7)
 by DM6PR19MB4278.namprd19.prod.outlook.com (2603:10b6:5:2b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 09:20:23 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:126:cafe::95) by SN7PR04CA0182.outlook.office365.com
 (2603:10b6:806:126::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 09:20:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 09:20:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7918E406541;
	Wed, 14 Oct 2026 09:20:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5FA1B822551;
	Wed, 14 Oct 2026 09:20:21 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:20:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pengpeng Hou <hppiscas@163.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] ASoC: wm8978: restore safe state after resume
 errors
Message-ID: <as9JVLHuaVcEavOb@opensource.cirrus.com>
References: <20261014032452.13456-1-hppiscas@163.com>
 <20261014032452.13456-8-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014032452.13456-8-hppiscas@163.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|DM6PR19MB4278:EE_
X-MS-Office365-Filtering-Correlation-Id: 70545101-cc35-4a09-9bf7-08df29d46016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|82310400026|36860700016|56012099006|5023799004|11063799006|4143699003|261009223027099003|10067099003|16102099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	LwVjgFqJ2TuRGaQKN6WmB6TWXfRg6ceI0v819M0IWG+KWE8PAYCdUBR8QRrlSlIB2uhcZ1obYFWE9ZpAzKQfbwjSwuvbdTOCh4WtnjMUiHFWvWDdxnqLH67zQ8K+Y78trmse0imrZg2+KU+rpGih+Tsy7R1L3Zd4xvSWJjUTDGLPMBBWYpUK9UJYVvw3ZvQcP+nM6gTrBKDt6TVTrvlHS08NO6UdJIqIgRHrDWL+iBgKKQRu/p5gocZiQFrab5haMl5/Ym/a/z6HOEbUyU/QJrnnfCLpOux+2heD20xxjRlzN62+QEpHeceMqB1zxmSyD4pMOJE/5Z4G8Bxg+0QMNzy2Kvk+uBszfvusRekvwAE58A723htQa7hKqHA15Q/PSclgr/rsTYKuMuNWbtr/+FN2JrpAtICYX2krAuJzoDOkcADS5Yy7h5y+tp8xp+gS+QLhMwrQFJjn5EsUN97fYFWUoADWlxJxuIGoj9OcKhIwxTRrwdwcit8vHXdZpNZn5KKdx6MZ1l3cp0D3Q+r2KEtgdk5XIC9kps9qFdbUV5/1AiBpoLExm7tK1D5JQ4ds+KpeSXmte3ltprcRe+v7h1ZKZP7H6oDUFEz+Oaotdja7pZJnE/1FitV1406DsLG8oQIRX5MaCkasJnPeE4zjV6bK44LtJq2Nop1WJU2BjeA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(82310400026)(36860700016)(56012099006)(5023799004)(11063799006)(4143699003)(261009223027099003)(10067099003)(16102099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oAKsvJbyHaTrkEMYE/204L5C0XgORDecBT1mtqrK5ED3PZqOEK7RXxvu5EAO3T9E9mYFu7AJP0E7EYQqJaGzixFtflxU2AvxDYKMx/r9OizWpOOE5g72Y8ptreZFTjY4wZCl3/l+Wx/KTFt4O0TevgsyYbY3jcNYCaHCHkkPEtXjYQS4IZUh2BWivn9uMU7X/+Vl/1cgxh+dkLAYskJEJqn0wTrTyfgEGOdyxlVkZuiZqxMRLrjdeOx+11s76/L2cX6SLeOfXtOB5r0KbJ4FweoX0//RhGnAn2XkFXdXIdoAxDjhej7wj+IlMKM9MDqJsShnvm6NjNRTn3eAiBZvRS0U/c7QmfiT4vPa/TxxK2ErylXfiMy8cpnnP3NxZEPYDU0fZxnBw9UuT1wNrDhRc0HJ4umUSvoXAd3+jOjKFVqedjBs6YNNdEzj86Bzjx8d
X-Exchange-RoutingPolicyChecked:
	wXqic2B7zOI0G5IXaKcLQE+F4snvSDSSMx2zCvzkqJpeW3COufLmi62ydXxdX2RNdMT6+17A8ZDvJeEENFcVGQYVXhLPKDhrfF1RS7+Sna2ZI9hTF2NVoJN7iu1WW9Ryg6mGMZKc9zU0Q8RYkM5WQRPov5x9l2IDpRUIyI/g0IfTn9DwbKr9GW2aivqhvmxEod4s6t6S8E9A2Qd9vN1bhoi3wzqTT9DoyeghXu9GTnmBGSTNXIcZrc4cbVENq1ryXYNIL766/0ts0YYliZ0fYdwAAODbCHd6wN5ViUUICiY/4WkFPlaoi1bYYg/UQGD++Nke5QLB/8/VYoIsTjwDDA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:20:22.9020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70545101-cc35-4a09-9bf7-08df29d46016
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4278
X-Authority-Analysis: v=2.4 cv=A/n5rKWG c=1 sm=1 tr=0 ts=6acf4ac4 cx=c_pps
 a=nZATa2kLtWKrFGnilCG7Rg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=DdvJJxX2UseR5xsWL84A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: t-dHT_WPZRZv6J_WMcrvvz6rzksxyvOH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNyBTYWx0ZWRfX2JiM3Ywg8I68
 8XakMIJ6OOdljlcrpd1XT+q33Mfsv65sA7MhcH5iJI7cNjv8u6NtMgJPf9jQK8B9/EkSfwGAwD0
 UkNUiNs+VY6yIY0HDzWpGVFjkFgX+pE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNyBTYWx0ZWRfX/qKaCaAc9eWf
 MBNHNq2p9Nj+3D4K6lgRtuHmYYB2cRvo3N9auP3gD10pRvan58ZPUv5QQ0YzaVZkZfiPgoP0sZz
 fqYCobv/DzUzslKQh6Q0x3fGOemAtEM7IkKiu09HV99UYEBV30xwn+ZbjRltXpemoJifuC1V5yJ
 iBDu6anC+3aH7/dTXjykCRMLjmOwcirw7wb3iVdpVHkL+6ujuoRtWbP4CD0f2NHXhSKUmKHXRDj
 E97U9FdZQlbgKHDi4cJ4TdpTIthBMnbpD3cuz5iN0iaiFZ7nelzQz9zEEKdGmAr4W8v/pEChkgc
 U0m10/ZSay0uQ/2kSmLKDAn6p0sr0jGWxNp03+mulSLKfMc4h1Xm9FPJwx2vrAJwvll1MTr5I3g
 zH1vU/WJA/ADddsIZLfcXU2p8UmqMKcsc7AQ+8WgG6tEH8m04Z/uZHoAh0C1LxBYL8uXohDqWMF
 dxpDHwe2MHPIQz2BHzQ==
X-Proofpoint-ORIG-GUID: t-dHT_WPZRZv6J_WMcrvvz6rzksxyvOH
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 11:24:50AM +0800, Pengpeng Hou wrote:
> wm8978_resume() ignores cache replay, bias restoration and PLL update
> results, allowing subsequent resume steps to run after a failed operation.
> 
> Stop at the first failure and request SND_SOC_BIAS_OFF on the error path.
> Bias OFF intentionally preserves PLL power, so also clear the power
> register as system suspend does. Keep the original failure if rollback
> reports another error. Restore cache-only mode and mark the cache dirty
> so later accesses do not write through a partially restored device.
> Re-enable write-through before a later replay attempt. A positive
> update_bits() result means that
> bits changed, not an error.
> 
> The bias callback currently does not propagate every register write error;
> the rollback is therefore best-effort, not a claim of verified hardware
> power-down. The ASoC wrapper continues its established best-effort resume.
> 
> The issue was found by our static-analysis tool and manually reviewed.
> 
> Fixes: 0d34e91596ef ("ASoC: add a WM8978 codec driver")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---
> Changes since v1:
> - restore cache-only mode and dirty state on replay failure
> - restore bias OFF on the error path, as Charles requested

I was more interested in a rational for either approach. But
probably adding it seems more logical to me.

> - also turn off PLL power, matching system suspend rather than bias OFF alone
> - preserve positive update_bits() success
> - send as one correctly threaded series, as Mark requested
> 
> Previous series:
> https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/
> 
>  sound/soc/codecs/wm8978.c |   31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
> index 258bc9f88f520e4de034393d39317e07e731d1ad..f5d3f26cc21790a8dfc4bf909a5fc5d56ba8f577 100644
> --- a/sound/soc/codecs/wm8978.c
> +++ b/sound/soc/codecs/wm8978.c
> @@ -952,17 +952,40 @@ static int wm8978_resume(struct snd_soc_component *component)
>  {
>  	struct wm8978_priv *wm8978 = snd_soc_component_get_drvdata(component);
>  	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
> +	int ret, err;
>  
>  	/* Sync reg_cache with the hardware */
> -	regcache_sync(wm8978->regmap);
> +	regcache_cache_only(wm8978->regmap, false);

Nothing ever set cache_only true? Surely you either want a
separate patch to add cache_only support, or to not do this.
Although given the driver appears to only support system suspend
I would assume there isn't much point in cache only.

Thanks,
Charles
