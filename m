Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5854078E0;
	Thu, 24 Sep 2026 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243408; cv=fail; b=lgJ2ZxCMN8nrqyw9OryIucQilhE7gDYabed/crDOONZXMmr23DGR4w5Yin18IOpdxxb9SwUTBfmFldi0F4itt6UZfa+Khl/Jy1BlpJdWmKVGdzMAQ3n+4hGf1dN0F24iRt1MLGwN+qiGnvMR9Knatw57UviFvqKFzyRSSun+Ch8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243408; c=relaxed/simple;
	bh=ziJsJqqQggnqWMar4X5Jx7xWsdQw5iFXyshaOW7eYO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwjG/AHvFUFx3uSAazmRJa7PS9s3RqEuKUsBJz5icXG7zS9kvzYJmSaVaWAUJmLmrUaxMyj8Mj+E25pLVNmf4+UP4Qi/i2iJI9gqQw0R/RlCI8YOiXdUE9gVKdk3GqypA4ytKqnbkaOPjY0VupoZ5vxEmgfk5YyGfL3sT3cT1cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZuL0ckTH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PW7pz5YI; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZuL0ckTH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PW7pz5YI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O4knPS3655094;
	Thu, 24 Sep 2026 04:49:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=D9cqYfgXgenRdt6dHu
	P1/jiWMc9LnoktR87D6orwEps=; b=ZuL0ckTHS522ebZzTw5fiTMk9n8iF2G8om
	RtDScu00lHL0UiBNjyiIDnUk28gSZhrInyHoqqf/WV1d+4mdIl/tK6+wWciTDD+H
	YaZMIA1aEa4xXbP45w0U0AYpLymgKDeb1iJfMxPMpU78HzjsCtEfKQQx5JUXI0nn
	JzcR5Q4lXYEbgRk3ckV2OuDmnfI58CI3JyZmWu89N8nCmMJL/uP+cKM90HQYNWw4
	l+DE/hhlS9B6WfGuY6PdXV85o1HqsVrxOkKY4Zvz74cDn+t4xbCS1CVsSntOyJOU
	zRwhi4IIZblyxHsQ8PqZ8btmQSo3aW3lNuuBovLMVZfsEHqHHBDQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020122.outbound.protection.outlook.com [40.93.198.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gsptj72tm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 04:49:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+NEHPunDL/miU9i8ouIZUrB8Xh47Y2jUJWT4SsPIkcXz9YFpXYk+4cg/HlRHUrDd1FBYnLNvC3q/bv8DkfHyao9meQrwR775WgVN4UtjTmoG2GnKJzZhpuz6iHZId4WvpzL0kMtNRAyz4swXupAt9BL1XwJQ2l/od3cvxJ1GxjiScxc8n4eL1bjofxqJhuMLzz0mslnDvIBcOKholZyeos9F62iIaPrH4JdNpfaPbUnCRbtUsXWpKgX140rmSVAhCkg7AivSCQPsn0svNgt1gikJvnMCc0bvwZf3fDIx5gikJ+6dnr9ibAuwX9erBUal+p2jWYZSlJXxzlEdozAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9cqYfgXgenRdt6dHuP1/jiWMc9LnoktR87D6orwEps=;
 b=ssdUM1f89KvN/Kn2uhFiQjB4X+WAFBIKIRZshpBVBK9wHafTypiVWk1Bjh1l0k+9SiimecdcAM16gA5Lc41QYY+HNBxbActW0VFOMDgiM5FE+lZaOjfZpT4Tv4i97GwnvVbqVQTvr7AOvc/r7/k2aEFXhf8loc9a1fmcgK9gtO45sp5fAEIx/DyN9Wd1RuQeY92GrzPUtT1y3vezlTTUD9Sh6JfO0wsmOIhJDvkNDGAtpSJ5kFj4pcXCaR1IjdOg6FdO72RLa5hCRJAZunzXML7YHH9PDbP2R3KIjElQiQlT0n5RbVSQtTzFiGw5NwxlVZ65fbdyH7GrnqaevEws1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9cqYfgXgenRdt6dHuP1/jiWMc9LnoktR87D6orwEps=;
 b=PW7pz5YIEjuBgP6FE81lFmWAvBAFE66xXHw1/NuoKvYszUf6I9tV4qHlUyBSVVOKhBg2ObnNg9NRG21S2Cyktuumdn54Lr4gV+EBIMH/5m+oV0i31qdCbty85tHQ0M9jVna3U2ydG4qPurnHlTJ8b1C1Toj/Lf0G5RBfZeOsqIo=
Received: from BN0PR04CA0120.namprd04.prod.outlook.com (2603:10b6:408:ec::35)
 by PH7PR19MB5824.namprd19.prod.outlook.com (2603:10b6:510:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Thu, 24 Sep
 2026 09:47:05 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::96) by BN0PR04CA0120.outlook.office365.com
 (2603:10b6:408:ec::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 09:47:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 24 Sep 2026 09:47:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BB3CC406540;
	Thu, 24 Sep 2026 09:47:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 985F1820247;
	Thu, 24 Sep 2026 09:47:03 +0000 (UTC)
Date: Thu, 24 Sep 2026 10:47:02 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: use regmap_assign_bits() for conditional set/clear
Message-ID: <arTxlkxUFjg8EOJ2@opensource.cirrus.com>
References: <20260924083420.461715-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924083420.461715-1-peng.fan@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|PH7PR19MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: a1892166-c413-4ee8-c58f-08df1a20cac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|61400799027|23010399003|82310400026|36860700016|56012099006|11063799006|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	VAgU9JkSzcKuYwYd+oYJEg9ZMkwGJbyhENY6rUnwiHJuBs24OmXaOkPII8D1vJMhWHalzhedSCpedVwH82F88Gqv9lOBr19uJ04bC9AzVQijrfOzf4oMCifJCMKb+dv/qsVovG7fczIdG0icmoLKbXqxlu7wTDrtcGy/xNq0GIkOybcelh/CwUTmmiADV88QoF7BeAqktvUG15Eiai3koAvY4YgTwFgDFaZ7dGRPBSr+ZJkV+GlwecWyN8xZj0VB6WAH1qYgM6p8kD31GnXF3XpG0GL5czLUzMlctvFldGXVo54S+xMV0DRj8XHZ9oJ2W779Nh3Y43n+AC8NMp9Y2nXFaWOOQsesb6yX9xOAmkquMhvt/hEM3wyWITTSndAcaC8corPJgJpR0G/SYgeB+B1hS0y/Oeg+dpwfaoBOFKTUATk7yaiiYM0Jx8OfK9fpkgjU4VrDLps/8dRdOP4R6oeFT54lwKQYJ2CaAtS6Z8TTft7wxaN3f9/Nefd9DUZGWMTScAW7gwHSs3A3XR1zzLElafsfUCt2pXAZu0Zu3Ov8zcT5JY5Ofz48VyJZkKCURU2lRyruxRazfx6ohqOr9wv7FBGUvC6hyXx0WXdCcs2dwZDkQxReDUfnMukSGUeDLN5OpcXFr+GH2CjHHTlU2ZogkgwMxrCXcFCAUCHQKSwfMS+zRiKNf6MOMINjmTzH54CWj/3s2jZBIwsdRgt2jg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(61400799027)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x4mHjOrR4EEdhwOCrJ7DlPC6R/o2qc3VJGeAhsZebZwOMNsceh+M2eO4nxHtaRyy7Ke273lgy7QxtBM30mOObNeBWRJbx7GupoCWQojKn0mEzqj7mQiVw/6V5g89HIW/5/IOBtkyzrOvlgltE3mNb4gFHiu8mOYMApzBVLFFGY5QT1wTs0EeNJ/kd1g5kf6No139u2j5l8qZ4Y2rbiOUAIBIXLTlAI5jnvGVO1OUGGqgUErB5vKmBmIl+ZLt0T7/u0u9ovrzITmAflsJ7VhevJKdLVmK6UC/YowZPRIkR8LI5s9C+XE3d+gjpjvDAOBRMYGYn8aDhQDOiP8h6cIP17pH2oakZDLLP+5CKx9euiYzjN2zOTRP+xgopENz3o5+jyjZvVw9lugwMqK/oHjXZc0fiZTP8c+fwGngIHCBmdfBXf4a2th86WXUM8zYxasS
X-Exchange-RoutingPolicyChecked:
	4xKiFU3zOQZ6HfWioBvpQVEfLp4b3Qd9tkR/mJUWsNQ3Vt7IW102XibJeOhTollpBUwCwg/sqqnN68SRFVZmrhGgP1moXbqTEHdL/d8Qu/PL8L3jZ5jhcMl5S0BKC/gFjBluuWcKA8KGjEhgNIUv/Vf/9U7hCGd9uYniONVvxwTmws2MT+3Hm4czO+q3dm74tLmUXGV7wchNV6HY7oXvSMfy3uS7idLC1i628HbCtXkdt+R2e3QSqOZ3gpE+hQ3QQaEuL3G1OO3UljiDeEepFMCaizvkgVY/qT7o15OIVeChPjpuWjZNq4Ljv3els+X3KRPJkB6IAP1rQDF8GHcrAw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:47:05.1255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1892166-c413-4ee8-c58f-08df1a20cac9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5824
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX+uOogqyZI4YF
 JOK10dVkvrJv/V/gGTHhADaLwplv0/Ceqetuh/qrgfawLQYRnZhIo3b/ZSk2zlqx6jiku5iNPA6
 QbFYqKjUmAWb0CkIks9v7MR2owbkkJI=
X-Authority-Analysis: v=2.4 cv=fuZJ914f c=1 sm=1 tr=0 ts=6ab4f21f cx=c_pps
 a=NDowVQyA5LMHuT8sjPEy7w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=8AirrxEcAAAA:8 a=D8G0LqYh6su_qwcmSbwA:9 a=CjuIK1q_8ugA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: xtQlRHgWKddPLpFU-i0dS9vLuZ_zK_SX
X-Proofpoint-ORIG-GUID: xtQlRHgWKddPLpFU-i0dS9vLuZ_zK_SX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX7Edec/H9Rmm8
 SQ2wjG1hFCckqEsh27FoDO4/wnA9eyqWs4WGW9kFjlrOBZ03FHgt9eNsWzMQv0YEMD/jsA2hpkB
 9kYRlBqROLjIf94Mn+xMXF4yWwZGZf/mYPgQlbnyLex/3QxQQhS4puE2PDPXKba8nPy1x7uQlRr
 qNRExMQtL0auFU4fT0GCMMNhBqFLdDGGj5mpEL/pfzgzRUM3qLlzT1i3GpLZZiZfWcj7DPivZUg
 gOYHoVeJWpf4l6ieFO34rCKqXmfLRsOCI9ZPqn6b15Uk1JBAPWWjqNmCQNPJkwGyZNgs3BhgT0w
 OtWupRUJ19G9QxvtNgX2YRtSoLrAcH8u4rxAXI0c2Ap1679d5zLzIe1Nf0SnYf8FZIpgSAnYHZ8
 OvtKb8QCxnwu0tvtCJwUGpqY4HolJCVOGUO2fXxoOKJT/CYkjrydUSObU9B14KOZ1fGq49cXOw3
 8X3pPFTj7OqQoT8WyAQ==
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 24, 2026 at 04:34:12PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() calls in the cs35l45 codec and the
> mediatek mt8188 ADDA and DMIC DAI drivers.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  sound/soc/codecs/cs35l45.c                  |  6 ++----
>  sound/soc/mediatek/mt8188/mt8188-dai-adda.c |  5 +----
>  sound/soc/mediatek/mt8188/mt8188-dai-dmic.c | 10 ++--------
>  3 files changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
> index 0ab76824f00f1..9eef7c8b1837e 100644
> --- a/sound/soc/codecs/cs35l45.c
> +++ b/sound/soc/codecs/cs35l45.c
> @@ -224,10 +224,8 @@ static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
>  		return 0;
>  	}
>  
> -	if ((bool)ucontrol->value.integer.value[0])
> -		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
> -	else
> -		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
> +	regmap_assign_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK,
> +			   (bool)ucontrol->value.integer.value[0]);

This doesn't work value will be bit(0) but SYNC_EN is bit(8).

Also would be better to split this patch into two, one for the
mediatek stuff, one for the cirrus stuff.

Thanks,
Charles
