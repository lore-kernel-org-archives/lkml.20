Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31974052B7;
	Mon, 19 Oct 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400701; cv=fail; b=IxNoHcDYqqRDOSuAQm/ZpAnb5pjyG3Ht6cXP5m3plCNOQUEIRbEcAymfbwDx/A+VoMp3oIyLstjGLlzpG9E4VTFtn0OM7L8wr4FDNbtGgib0snFV7ZYNtIpzrgIk2E9lng7wtwxQmn/XkoUD5LAGhjYsLesrZ0RFd8RiNi/dbqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400701; c=relaxed/simple;
	bh=OjpJgk6gO++1v6OXV35wGWWFjR9aWXEVp+yvwDMw9z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=io/ZSMAIgn5lTtvOyDWwFDyO46AtcmE2SyDZ32zSbD6QM5Ay16tjdo4t+XDDkUVtU8u5B7+yH/8xMjjOS7gb7K3sa8knyYztqDUIZ16+1+rZxJ0HXJeKrzsSi8hZ5T03bSMP8TyEALlDMbz0VY4Fc8TMs99B0apW2vkCMEa0btM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jKlY6nN2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eXLIFplq; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jKlY6nN2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eXLIFplq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8uYdN3513983;
	Mon, 19 Oct 2026 04:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=FgjJwYKAnk1gQn1+Pm
	NhmqWmcbWDnD9IkBZwuAdYRJU=; b=jKlY6nN2mWDHfytCQl3yM8u1CjeTHitOkU
	yA7joBbe6GP3etW+rCf0ovEuSWDq7sEWdYTrsjCDL6LVlh7pwbWR27xVtJsB9/nk
	rmwzev6Fv2a4ngcjyVN4Tmp9KgpsP7NlLmT+XsxuB69H+wLWtD+Aj3gTgBFWSpkc
	scZme8XK8ZTp+bktLCWGGLx1ugc6mA80abTw6KpCEKOgofrjW8EoRM63dMCPvLku
	gA+4DIUczO9Xf+kV7PZ6IJfsBewKWaba6JmsNupAzpwqAXsNwl0pokclawal9dbK
	h9WRp7gZ066OsgQuHEciVL8CcpHiscaVDB0m6SdGiax27zOyWNEA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020132.outbound.protection.outlook.com [52.101.85.132])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hcpts133u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 04:03:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Md2vEuYGqWpT+Q42rNPW84+AkfKHH5Aby3cg6Kics5eHtd8NwnQny6DBkuBWx3sVV9VydGyZCFJH/FHUOYsfBFVQl15LcIVh/Kf6Y12ceJtqEfO8BafgBfCl2TuVz15aZYb7vXuZyZzdgg87+SRmIDD/TIA09N2T8H4lxCMZEGejiFX1m4/lUMChUXbI+jl9QeS2+kzBBrDSOvwLbSrKv3ImUenjJb9rkKzWv69v6z5QWF7g6OzPPKtwcua93d/uyE8DfCp9Hkg4Y8PrIFfbPKcN+ImtbS2sdC5JbzYJaleBFzUZFblJJAQhZLAHoGbP62BlNdDmhevqZ9NtS0LfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgjJwYKAnk1gQn1+PmNhmqWmcbWDnD9IkBZwuAdYRJU=;
 b=yROo3imQj++opmz+aO1x+VHqXAifNP00lO6+YIV8QjnsmO4/UdEAcm8uFBcxaIvg73F1uZFzEY2wa9lg5sxzNyYbv9OUkZd10vr440zJ2PPHytXK6KZRkM4JXq2ryQ/9/L4gGlcvyKw9HPnsAq0oe7Hb8GVdd8fEGWS/QJnsKU7F0b5DZkF+FYDRFwOiHz+hrZnC7jmNRmRV9xYFdN4mwj/KqEuGPijIYbov3b7KcdB3uxIJ81R6JtWNKve5Tps1kSzeo5Eyxvme4PpV+aZJdVy95P5J9FyEAfEcyYfdbq2SzEqmJH3ZdF9Uajz3Bi7z0rT3DtYmkZV5r7/Bn/slcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgjJwYKAnk1gQn1+PmNhmqWmcbWDnD9IkBZwuAdYRJU=;
 b=eXLIFplqSY6N4BeqJa6DKLBpe/fNQSt7PM13euIVA+I0yIPCqZj4kBKxxPrfbCqOcAZH2wQ8HJozqVA4Dzi3E5t7MLK0LrLCaL7MPX4lOrz5LtSLVkziBagrVpM8uYdHSQFs1bmISw0Tsj+Ogi2cGJYzUy+1TqdQa2p2OQJLgo8=
Received: from PH8PR07CA0001.namprd07.prod.outlook.com (2603:10b6:510:2cd::26)
 by DS0PR19MB7671.namprd19.prod.outlook.com (2603:10b6:8:de::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.19; Mon, 19 Oct 2026 09:02:15 +0000
Received: from PH4PEPF0000B60B.namprd21.prod.outlook.com
 (2603:10b6:510:2cd:cafe::a2) by PH8PR07CA0001.outlook.office365.com
 (2603:10b6:510:2cd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 19 Oct 2026 09:02:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH4PEPF0000B60B.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.0
 via Frontend Transport; Mon, 19 Oct 2026 09:02:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 32E7D406541;
	Mon, 19 Oct 2026 09:02:13 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 07606822567;
	Mon, 19 Oct 2026 09:02:13 +0000 (UTC)
Date: Mon, 19 Oct 2026 10:02:11 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: SDCA: class_function: clear sconfig.bps on PDM
 data-port terminals
Message-ID: <atXck2Ef4OllKrAA@opensource.cirrus.com>
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261018192359.287987-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018192359.287987-5-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60B:EE_|DS0PR19MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 2166d7ae-0e93-4be6-90b2-08df2dbfab6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|82310400026|376014|36860700016|11063799006|4143699003|56012099006|261009223027099003|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GhXHqFM7ndO5ODNawHJzXT1AsFFgsASgcAXrXeHNlj/sVn3kt3tAP9RMImgsmDevQvU8StNm1+yD0QWwpshLsVd/29kT6ubnq0iBsKaiXHGn9EmZwEIEQtgSOau6mojWuKXCG6bVx65VY8hfSOmKIq/TWBuRSOZjWKA5sFleqAB6Gpdj4NGbz4T0wAR3va7A2+8LWoNPVlrV9ryHWZc1ESJ5jSLgMRNJpg+Jmi1RyuDJ8H3bA0UHuNppMykbDUK6GeFOlnPCluGEuGz7RR1nDprsn7cOx1G4XcSxSmFaP5AVwmwc71nxu2YFAb3DHdYjtakOpoRikLX3fJ+wCpovG1nKja2ed+FINqXc7YBouuC3OSU0g0AE9b1UNxJc2M1OfegVvf2dZWf3USiYBlCZJgrUkLPRzvLn8UIocOyhq6YmB4MmAMLIgTng7TDKNjVPHshwvgZVngGoDJszgbrMizVvajm2A68vFCGNTb9G3/TKagaIKQd0I7+WXhrDgfOO+LY8pcH5TyRJesoMSz+48tw9q7sVAhKtiV+XScYBBoTMGyz+MrYyCIU+bufYX/eo/4XulHDM3vowSFHqBpkpyltbDb0K2fz5rsAfiYGW20EV6iXlZUr3JBP1FuuhEYo94dZPUaBA3f46INsRrNyvfTsE43cYqOp+3r8EJHRdt6c5e4wBsbAFhKJe1HV10U462ZdhMLY9/ZuEmqImHk96AA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(82310400026)(376014)(36860700016)(11063799006)(4143699003)(56012099006)(261009223027099003)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RZ26xMybV2wEvI8iXeanzL7HO+L86K9GrAdeJJfLxzyG3QDiEWUtLxxwGsgfbZnLCLOFBDBSZz2iXHLQh9taPv2Vgjo9QgfNp+iLQy4YV5WEB+15LoIcSD+MiM1Iq20n10XEBzaiGBJvBCbvQjC6sJp1tRfrAmwj9vmQ41rDUJ4ECqmX2Q7IAvTweOhXrtEpCmslkbSxLQUwTJ3UvaqP46edj+rIpi9GF5gVXD6BZVDrsnbsrc1YUB8LDZQTMNg/8/prymzxitifRb2xdfNB8YNlcT2/w+qb+BGAy2b0N4M2MF1VStWObxgxMRgUJ+5ellm0GAhX8QXYQ2er1eip6hG7IxeyPIPL7ITHJNTRkf+DyH9l/6MnJa+0ngn/FZVpWPSBs9uL59D5AY4hoAYZP7WBKv5Zj2D+U6Xu8OLYJ9UcsIFD3ie2wjjVqNixrEu0
X-Exchange-RoutingPolicyChecked:
	zgjEoKalJnKApACxsEYyPu8Q/n1pCzZDZh5iif3a/DXRSYMJYGAnGwpya0Yawe4datBmWXCtPLv6wZGMGMDbx13pweNwfJEv6gQhS60A5ru87pIbgZfyPwdvHcYKY4HcJXgIxdEghAMzuyOeNpcThLdJpwlVWc7jJONmf1zvqXetE5xVEeywmnoE2ydvhFRFqfOp74LiESTwFuQMR3DRbv5Uo3tiNJnQqJ3CNjkPO+MbMg2fckGsVvpO1UDiNHnKPiS16MQYeISccHdGxeDrrabk02Vr/ygVnuYtKba454p4aBMB9ICJNUPyMP5kpx7Uu75LKPAYRHN9z00ViDbrbw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 09:02:14.4744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2166d7ae-0e93-4be6-90b2-08df2dbfab6a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH4PEPF0000B60B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7671
X-Authority-Analysis: v=2.4 cv=QM391QLL c=1 sm=1 tr=0 ts=6ad5dcdd cx=c_pps
 a=49z8yXsbOF0P8jZAR4etzQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=hSbs_pWNpfqTcWyVFBAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: aQsblfu9Vu3QGplc4aDtkFlljYyF6oDW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNSBTYWx0ZWRfX0c3myKdjXYe+
 leF1i0R+9mWbX2Ot+Q6UkAkLMRWNEzOlnarcY9vOPv52XzdArq5cPNHKOaznpe4IKr2XLmS+g5m
 2/tGt8CkKqsVasRADZdqQPz6nJ94mkA=
X-Proofpoint-GUID: aQsblfu9Vu3QGplc4aDtkFlljYyF6oDW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNSBTYWx0ZWRfX1bpOSAL4n6Vp
 MP06Hm3gTxFn6sq7LQa1E40xjvNvU8c35fF06teg9YuOz3D7+4efmgSacM2dVT7FpOMjsN2md73
 8yy2eGAa+RXeGgC6niRFuwtmH5XVcRIXi8/A/y5i9dWzq5RPsTo+xKQsdyuCcz0PjLimCADQuZT
 yTFBsomZsDWcItsYHVBUHUdCqTBbv0g097Y5KUIWHECFfFMN1rJEhiiSLRlFQK4E4z07FruvCKh
 tm2He1CERczhbKY0Q+0eskV9aXDKA784PBS1R5IdF0Qy2G8qhk9thClCKVXbzC8bC0HvMXLkoko
 8yxR1ODzATKKs+eTyZEEpsk5oJSgmRAPuABhWjAS3nTvxS5g7S5TIofu5CojU36d6nswrFlYRDl
 zxMXwnKEgjmI1p03dC8nbWOZKmWAsn8bnwCXIemajm2VjKSAE9csTVYTt/TdPRjXoZBPgRmElQw
 RyB5hyUKewhXiiqRSAA==
X-Proofpoint-Spam-Reason: safe

On Sun, Oct 18, 2026 at 08:23:59PM +0100, Srinivas Kandagatla wrote:
> snd_sdw_params_to_config() derives sconfig.bps from the PCM container
> width, which is not meaningful on PDM data-port terminals and clashes
> with masters that declare their own view of the wire word length (e.g.
> the Qualcomm SoundWire master hardcodes sconfig.bps = 1 for PDM).
> 
> Clear sconfig.bps when the DAI's SDCA terminal is PDM so compute_params()
> or the slave silicon drives the per-port wire word length.
> 
> Assisted-by: LLM
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/sdca/sdca_class_function.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
> index 13b70f0f0dbf..acaadd12432a 100644
> --- a/sound/soc/sdca/sdca_class_function.c
> +++ b/sound/soc/sdca/sdca_class_function.c
> @@ -126,6 +126,17 @@ static int class_function_startup(struct snd_pcm_substream *substream,
>  					 substream, dai);
>  }
>  
> +static bool class_function_terminal_is_pdm(enum sdca_terminal_type t)
> +{
> +	switch (t) {
> +	case SDCA_TERM_TYPE_RAW_PDM_MIC:
> +	case SDCA_TERM_TYPE_PDM_RENDER_STREAM:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}

I think this would make sense as a generic helper in sdca_asoc.c
probably taking the function and the DAI as arguments.

>  static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
>  					     struct snd_pcm_hw_params *params,
>  					     struct snd_soc_dai *dai)
> @@ -133,6 +144,7 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>  	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
>  	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
>  	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
> +	struct sdca_entity *entity = &drv->function->entities[dai->id];
>  	struct sdw_stream_config sconfig = {0};
>  	struct sdw_port_config pconfig = {0};
>  	int ret;
> @@ -152,6 +164,9 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>  
>  	pconfig.num = ret;
>  
> +	if (class_function_terminal_is_pdm(entity->iot.type))
> +		sconfig.bps = 0;

I think this is fine, as you say bps makes no sense for a PDM
stream but I might need to spend a little more time working out
how this all propagates through the core. I guess my concern is
if other drivers don't handle PDM in the same way.

Thanks,
Charles
