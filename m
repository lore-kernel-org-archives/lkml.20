Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D7466AF4;
	Mon,  7 Sep 2026 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778079; cv=fail; b=S72RXpMq60ew26st3aqetFYH96AhNyR3Lvc0eBaXYMlRKwuQ2HLzSC61JV+vRCFU/jfQG7zH9uB6fXioh+HIrtLkinYtQpc1DZ/SaM9Zrw62yKXRyQVH2T+3b9M7o1Mm+fxYNVLF9vmfmFqxvkh2CulqNaXxske/BHcUgm3PQKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778079; c=relaxed/simple;
	bh=1olOQg9pDhN2OhaXlqPqtBJvZFTzwwhvpJn44o1RCBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0BoyxulnWHombCwNQVy/sj4UvFfOwbDni0hinuHwkc6ySjJikW3tCa2A0LK5Jfv9IyQHuKrzUdG5SOUbRfqrdIiQCF+kF4m8BsnVF5CCyOCaPmz+uOd/j62baZKSwGh9ZKSuq1+f2PbUvdCpodPPmFXP9WjuuT3naqEWS9dbwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cT0CbxeX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oqo+HaBr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cT0CbxeX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oqo+HaBr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6870gLAs749455;
	Mon, 7 Sep 2026 05:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=t+gFN5dZNsFTmrkV+w
	0wCk7QhH4LxCCdvDT20lnuYF8=; b=cT0CbxeXzPz56GOQg0y+1HQpPX5nDTulED
	DNgw1zZOKSwr/+l6/M4IhubrdUHKRe7dT7PBscH2p/u3ru90qBpWe9+TJs0hIK78
	NfB85yZNBS7Sj4R7asaqi2pdAZKiiFDgZXemzkQp/xTA4szK+u60UTDBzBpK7O31
	lnhjjULCpmChTZRnvofw7HSYY3ZJSEB6WEL+udWIGmwF918MqDA9ICVwnFedFsN/
	1A/hFk6N4yGEiQ2wlA2RoZcCuNPNxJ7nug8+sWUYc59l43OfqmKykyjUbYINkGBq
	ZljfO6vZVZakfV9+5I6JfPQhrgQ5GgdO7i7icAFnQJ/dNOMH3nvQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazhn15012019.outbound.protection.outlook.com [52.102.137.19])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gggfwhx0v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 05:47:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWCStTJzvEx7YbnHOsKHOnAFwkKabA3XqEPrabjRTXimsoufjUzOE7OTVFJoqr2bksjJvnimAzA/i/z150BhP59rKSfpF36mFn5lSHYBuQE1BLBdeX51FKwMWGy/dQQS8Ie3LdNJMYog1ZSBeuQPqNAI4jNccsBQYUMHp/zk+nW5oGHDv3ODsOB5Dh2qCR6D7BxvWCWlIB3KlZ/sURR9A2caDo134SCKNaMS60gUsy9H/OFxYnjFg0jFS4Tv1vXNPEuck3Lz6uS2IF1leTjoyen8UXaZ0gTqZUpGtISkKC+wm2auMXZPQBShqXBI8fzc+0RPvNdhAYW0U/eK/Mk0vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+gFN5dZNsFTmrkV+w0wCk7QhH4LxCCdvDT20lnuYF8=;
 b=ZMVR2jh1ID47WMHITnkDKoOCGW71j4gY35NKvtw4giLEvVkJFbVnEhruYLzkVFkrTwkKSCg2XOst7jUWjv3OCQKv5RiwbUlzQWCQMOY1aVhBXm2DIXjCUrmaACQjCpQ3UCbaaLwo6NGtLVcpz74i9PInSSxxCQCU+GhEL3EqvJPdKEaPiEm3b4dS0lIEJjmZ4i5zkqz1Y2SlMC2UBtS6KUaLyu+pUtkduPTktI4AIUZVJmwh7cjFt87pd0O1yIB/Rhhr9WNaUH47VLiH6ytVNK/9Zy6UmIDKVZbkhYNpYMb3Ly7Ywl7CMDFjnCnk/06T12vd2FripgZ/qtjZFi4e0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=163.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+gFN5dZNsFTmrkV+w0wCk7QhH4LxCCdvDT20lnuYF8=;
 b=oqo+HaBr+zxx6qOsj3x2wbwra/cjtw1x9y5zFxEkK4Gwq9A7kLedUXitbj57Z9J30V2NDGHB2IBiz16w0cs1vi3aP+9QCXABxg7A8KhydmsczuV5kk72iuWYKDPywhvdZQ6MeLcxUPCRdVBZAPOsXMhWHpQW4t4c+t9UUj7YV5Y=
Received: from BL1PR13CA0413.namprd13.prod.outlook.com (2603:10b6:208:2c2::28)
 by SA6PR19MB997387.namprd19.prod.outlook.com (2603:10b6:806:450::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 10:47:36 +0000
Received: from BN7PEPF0000009E.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::16) by BL1PR13CA0413.outlook.office365.com
 (2603:10b6:208:2c2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Mon, 7
 Sep 2026 10:47:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF0000009E.mail.protection.outlook.com (10.167.248.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Mon, 7 Sep 2026 10:47:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 82707406543;
	Mon,  7 Sep 2026 10:47:33 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 67B21820247;
	Mon,  7 Sep 2026 10:47:33 +0000 (UTC)
Date: Mon, 7 Sep 2026 11:47:32 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pengpeng Hou <hppiscas@163.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] ASoC: wm8978: stop resume after register restore
 errors
Message-ID: <ap6WRKa1ty7CQSYR@opensource.cirrus.com>
References: <20260906034321.86080-8-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906034321.86080-8-hppiscas@163.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009E:EE_|SA6PR19MB997387:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cfb8f3b-2db0-4b96-05f9-08df0ccd6d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|23010399003|34020700016|10067099003|56012099006|11063799006|22082099003|16102099003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	Df2OHixg+I8Lu30v/8V5PzkIzvKicS1W4iFSzXlU7EXdWY/i6olPLV0ZHqzsgBGNFMklbh9MwtYc3VgIj4Kjx+xNe4DUaxwH6FXeb/hceObBmmhC/fsai6IyqNHBUqYIizSFmQ+cWqmoxE62M8U1UcmRYE2aadkqey1H4dv4kx5cpGIXQHELAzfoTep4nlWRtFB3lK3L++PykvvO2Buo7PjNO4p1Fr24AvM+4yWo2oTBNSjwf9gRAILzfOfhLHYvVxvSyXwhUPp0M5q0TqTkpamfjtNezQLgUTS67v4l3qCUnKs/h5EmIyYv/6Q97nH3qUII2Lj9N9V4skHtTmUK66/SrnrHXSwGye5BwY1lIQu7d3JfdWmgq8BEvsUXi/nV8QhLct7Z7TC0LvH1a20ESIucqxn74dS9siv4StwTG6Jk6osbyey2gjdLNYqDG0ZDZbrKrKAgwCnCl4RwkLV7iXsi0Sa2PjytciHD9hJ6psinEtmrH0JLNjuM9E1Pp7uphjvYQRHV3PV2aljFVKUIPGo/zqUKIMZ3sxYDOxTadEr9Zb2lyt2OsO+KHnPPuoYHlfSZzb2V1oxEKt7vLwWe0/QotA5tqzIO4WkjSGSbcqRR6l9by5V5hoh8JrD2xDRPHYtJfbqwG9RqM7QeD/1evJ07cV4SdHs8RVwuQ5XkGJ5K/BYL+G5DluCT3SaNjoqcNIFlA64za2bsz+nn4o+RFg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(23010399003)(34020700016)(10067099003)(56012099006)(11063799006)(22082099003)(16102099003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jQhPK/40+7yeT5FlZnEMQnwNtbeGRE5PQKVMycGCjcUeDgvpfFSLEOS/qvdBNhouqNv3vyhz+OjQBWZH38tnxWGFrsVvCGyP1J33jgz47oA7QmrEp25Ziz5hs/LqEIUoWItaflM6Ueq3lc5vAFbH1/s9KRczC5mgT4Uo0FiboRiwvcM/YLtDr5ZIJJ8Cp61CvVs/mP0aNGRrkMqaPM1dYZ3AnfmQUb0kgZ5zJzdKW4DQJ42nTcNH1WTu7R6aavf6Clf7t+2vYY8Vm5mu+Aa9E8iHr07dNzcu4CaOS4Xl8lo9BOTwleLFYooKVqtIlJNmshL+bF957zo/q9151hbUBTH2yWSZwkdsz7IUsJSTZiJH181nIdg0xZ0CnqovTL6BIumVkGzukbeZxpo0DKakx7gms7xZTWxF5l5vWtDTt/WJL01tZg04pOOUnG4mV57d
X-Exchange-RoutingPolicyChecked:
	Ubend6NXWVAD+6jGyqqUIP4o//U/enc5lr9PY3cyTrKsV9IqQFk/Sr1g8zSV+2BH0Fsl9gQJfysIm+DFQh4ljrqI4Hnq1vefUDm1SYIxvdjeHyFVwbagfyqnxytPS4z5PCnEAkY3KmhYHi5rs/P8aOJzUm1ncshPtcvvMI4K1MAO8qjN98qqA0hpzLbFwaXwmlmiFOGp22izs/8qOhfuCW7HsEH/hfrOL2ME/ve9w32qV3l8ayg47RvYtVYR+vH5ue8BKmfuo292P90s8YfacQJ73W8vEmB15gOReUi1jqEUZxgyXMh8MerDPFNKYB0dbgYLZUDOnr6zOAPV3ScvZg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:47:34.8179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfb8f3b-2db0-4b96-05f9-08df0ccd6d3b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF0000009E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB997387
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX8UtBMeRDHrNn
 A2uN3DsRudkVA70TmWi8cS40TkJo5AN4OPGygU77j5NzfzLHaX6bOA0Oz0EH5v1vwFN4Geq2aA0
 uW6sfuesRL0+h6lJUZYQAH3WN/O37bA=
X-Proofpoint-ORIG-GUID: WqcroRG8lLCVdvMRvhHbegLBUIFI8-ci
X-Proofpoint-GUID: WqcroRG8lLCVdvMRvhHbegLBUIFI8-ci
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXw7OgHRGa6yOV
 uAhRizByUxdeChiCIEXuGOihaife5/lgekZbcC1+i9G5H6RkwZdru7oy/TRlNQsKFHX18+Yacds
 bQeT68v1hzlWxWdXIWNt0yoURwYD8FW+s+T28iWlxxeurgJE8SBx3RSYSvvtHPwUQXfmPRcBe61
 dvpRtMDfHR3gV5ywCKJbGYPdVsJu5kfbwNi+FAWRSBmQEvMowBqvOZF6YW1ycbYszzBk8TqXSSv
 NJLXBxygLW71O/p4RCQE/ZVvbFRvLukbTRxH/8j7JeUQbO8Yblbu7fa/zuebDVKJyaW02voI/JA
 CzpySs2GGn2BoRjX/tlNsE+TAcjuzjFXLXV5O+ExvEsnMBJRGEmQyAFL3zHUw2eYa/4f4Y60Tot
 7YxUGwiCFpLHm758fVmEo/QjpFEf+fNq3WT2wGO7/Tuys34ObXDXvEWAHgoJRORh2Er3oh3gi/k
 872AnSuDtEtNwbBUQXg==
X-Authority-Analysis: v=2.4 cv=fK4JG5ae c=1 sm=1 tr=0 ts=6a9e964c cx=c_pps
 a=ObnOvm1hwMDIe0S4Rk5MvQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=Byx-y9mGAAAA:8 a=yESDaHWyXSF986Rt9jwA:9 a=CjuIK1q_8ugA:10
 a=jZz-an6Pvt0H8_Yc_ROU:22 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-Spam-Reason: safe

On Sun, Sep 06, 2026 at 11:43:19AM +0800, Pengpeng Hou wrote:
> wm8978_resume() ignores failures from cache replay, bias restoration and
> PLL re-enable. It can therefore continue publishing later resume steps
> after the codec restore transaction has already failed.
> 
> Return the first negative result from those ordered operations. Treat
> the positive "register changed" result from
> snd_soc_component_update_bits() as success, as required by the component
> resume callback contract. The ASoC wrapper reports failures and retains
> best-effort card resume.
> 
> The issue was found by our static-analysis tool and manually reviewed.
> 
> Fixes: 0d34e91596ef ("ASoC: add a WM8978 codec driver")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---
>  sound/soc/codecs/wm8978.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
> index ad8064bbaaac..241d17d81ecb 100644
> --- a/sound/soc/codecs/wm8978.c
> +++ b/sound/soc/codecs/wm8978.c
> @@ -940,15 +940,25 @@ static int wm8978_resume(struct snd_soc_component *component)
>  {
>  	struct wm8978_priv *wm8978 = snd_soc_component_get_drvdata(component);
>  	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
> +	int ret;
>  
>  	/* Sync reg_cache with the hardware */
> -	regcache_sync(wm8978->regmap);
> +	ret = regcache_sync(wm8978->regmap);
> +	if (ret)
> +		return ret;
>  
> -	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
> +	ret = snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
> +	if (ret)
> +		return ret;
>  
> -	if (wm8978->f_pllout)
> +	if (wm8978->f_pllout) {
>  		/* Switch PLL on */
> -		snd_soc_component_update_bits(component, WM8978_POWER_MANAGEMENT_1, 0x20, 0x20);
> +		ret = snd_soc_component_update_bits(component,
> +						    WM8978_POWER_MANAGEMENT_1,
> +						    0x20, 0x20);
> +		if (ret < 0)
> +			return ret;

What is the thinking on not pushing the bias_level back to off
here?

Thanks,
Charles
