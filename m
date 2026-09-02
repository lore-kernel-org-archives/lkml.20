Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599A547DD4B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351969; cv=none; b=QLE9RaFl+KPhv9IKoAhs8HVxV0HaPkUWjJiCODDJ4NoHdv0kGDrvVGK4eyYFPuK9CjzKkt04RmxZ/jIpyAstpDCRvW5r4kCK+JRyjguwROaDWaHb+L2It+KbbZTcRNfTLMocPl8K33dESiskQWp/LzEkVo/hU1XTbsf8Bgg/YAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351969; c=relaxed/simple;
	bh=wb0vLYYjrxI4Ji7bl3tZXz9vZg4lkyGywEOrKLgapag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=le8ktTG8ghJK5+qaApz3OslLN6qcPOhtk/bEthT3hfJuU6wYHu7yAzoIk6hsQ/jGJQDwGA38OmBhTCMikeEY1VO63xUuv2W77ENlpevd9bYH4swp+lKviOAvhQqTLQ0I/w67oG07nhrSlou2RFszWNqjPyEUni3HSvOKENheJbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igcl313N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OovEwBKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igcl313N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OovEwBKp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682AR0Sc1287110
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGyThIiBGfLnwyz/LCdNG/BQbe3qARBZkyuI34SEcyw=; b=igcl313NJiQKztO6
	nuuMj9yNZV0NpvtpwDu24+o9C2sd2oWMJQhaJNHheLGpgYSylithQwDJu8PWNlPX
	/YxTgR0Vz9nSucanFhyG0PYiuauk6uD6y2CHeRAjlerNXZYR795X+949ibTHLbmP
	OtPg2plSRFp6yDEXb6yUNPI+ar/Jzsg9Auw6GnhGVfqqRpHht3h17FykkvtSsAlm
	2mL+g2liiXRTb4ECnEgG6zDFiYtSo9VXvzDd4ytJoDaNU/1OJfPp/RzwS/Q4SLds
	/aEQID+x8bqpwbd/tJp/SVIUcKBGBv2tiEOHsh/xv3QVSP+ie7QByfrbB7DrQCz7
	jguYsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2c8drb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:26:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ef13b61bcso247844385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788351966; x=1788956766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGyThIiBGfLnwyz/LCdNG/BQbe3qARBZkyuI34SEcyw=;
        b=OovEwBKpEbHOH4+pZquUlClwC0CKyyEJ9cjTTiq5bn3f9VKLJbZSkC8MyULZm/Xy2m
         kF+rvqsvWonxlVtyxc7tvpyn/IiF39Mh/SwykIyxlRnSsN4b9dF8mQeqd5n89coYhivH
         WRbmN8c1d287Z/eoeBcxH7f5j75v36LmTnXwYZHKqkkc5S/xI0VuLTZYqfYbN1kKn2Sv
         uAUVGLlFu9NHKM2dN7zq1PHmKduc4CUjBncuyiYT2O7CbCNnnRzIen0yWNyIQ6Y5GjB/
         2YdaZH41HZLrj+7Bf50MsOM9axEHkzzm5YJ1ClBtvZzCQgodPOAz+Ae9pC1oP3V2++wW
         lEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351966; x=1788956766;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGyThIiBGfLnwyz/LCdNG/BQbe3qARBZkyuI34SEcyw=;
        b=RFL3oSNEH2Ig879GDHBIedMi1sdSE2WsQdf+QVA2p4pPWpK5Ce0BqlFHfXnBYPrjBk
         e+KGF7haf20b09aUUcYxO644GbLeTGeAuVfJgZEv2aiync1NLvgvG7qIqeeUPsBOzOZs
         Nz9vPaq3PGUqRUVY8MotGmnNSJJleAcxLmMwbm0/DpzVyzARL6ONZAVVq2/GiR3Wtuwk
         9fmuE9C3CtFRDQm1GOAl9E74yoJk/7pXqrYimx60LdgukuNPGOVEB0XxQk8oBXK5QXVs
         qpXabVa+daDbt7VF7bDoWzBhgKcLFa18ZdYBFp9NQZbnDdha/UKBHpT4WVy7oPiEAv2D
         /t7A==
X-Forwarded-Encrypted: i=1; AKwUvBzkU9nlZWWbP4RCxhKASH6CnUCl4Oo2zaGCbpixJlpsj2WnSlvOtI38KdMKE56XwV4DGb3kaSdEmpWkuKw=@vger.kernel.org
X-Gm-Message-State: AFuF++lprxK5EKWiXkrsWnTCsUVFxaGg6vzOJIHLcgfZOMsbFIJf4gaQ
	haI6StvudzfriONAGSSgbfliSqnCjkKZaa10PIxjLxGnJzDheRPFfQ8eSIK97N5+mgL9pWF/Hth
	AFgOXydAgLW3bUUL5frSIDlIgJgkb0EaL/86u7zwnwEAKvao2K5wb70Jlz7suiuvjY+M=
X-Gm-Gg: AR+sD12POfQ0ovA/4wUA+y6bn0Rt9dH1YeRlJY7VgXZ2pnxq7PpvWE3GGp0Dbv73E4z
	zw/sieMDIIAlNHlkknHJX317pgyuPTHVOKhL+qL552k7xjyiU++dle8d/0uQIj/2YizLcPKpaCs
	gHqALp15Q/eZC10G19h401/uz8JViSpfjBEJ/HSw1E4K5+6BtJFrXkxI3hAm41B4oEKwI430NWl
	/81hn+8pdrlILBrgSermwFue9reSkK92L2zD+/2mMkxnDmc2+fTkFFq682TP2LskY0ShaC7WsIS
	K2n2vADcrYJp8qkwoKOd/OkbasRvRyG0VD9Ye4ZW/ZN8vCzgmIrgt//3vDRXhG9vxyD9R6LcpoN
	Nb1U6pAg7bLVXTvX9I1zuRStmm68=
X-Received: by 2002:a05:620a:4888:b0:92c:103d:63dd with SMTP id af79cd13be357-93960fd4678mr473481785a.39.1788351966460;
        Wed, 02 Sep 2026 05:26:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4888:b0:92c:103d:63dd with SMTP id af79cd13be357-93960fd4678mr473471385a.39.1788351965792;
        Wed, 02 Sep 2026 05:26:05 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-484492cdbfbsm6170014f8f.33.2026.09.02.05.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:26:04 -0700 (PDT)
Message-ID: <3bf36ae1-d771-4ccc-b306-9cd19f626462@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 13:26:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-9-srinivas.kandagatla@oss.qualcomm.com>
 <anNfCj2e5kPZhaK0@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <anNfCj2e5kPZhaK0@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExMCBTYWx0ZWRfXy0W7/3LFI95d
 2qf5mgJ3nIkqrIsLE4y0OEY4JBtdetzXw91ci8K8gwyhpL/Mnr/qkGADlDqEyT2IAN9yCHjmYl2
 S/opuNKQ3wFcdMtBhXWYO1JgH4K0fEw=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a9815df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yAM9Myk8PYjSjg-1BfkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: psfQoOwgmjxv9tTrSwveZ9fRxV0ZldHs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExMCBTYWx0ZWRfXy3O31FDvBi0/
 PdY4MPS0yxcgKMHm008R1nQ5GHnWZIr2NBVdQ/Giwfe5DtUxy/LwLBMalfxOQ78It8MkBtRS38L
 IGFSUVk/9myBObzYwmVbD32+YTuTsevj1rRNtTYfG2XWuZBdbcYsfU+rwVy3wUjVnWkYfzM4I5l
 9CrTkBPG2FEvS6TRMvDklpcsGkK07Ji6RlMC1UXjj/8OYEUgvTEqTPTuzKUS9qFsy1woWhhkc5Q
 1L+afjy+j/t/joYbVXMw3NKaDMRPeJcLPwHTqT5DYjMH+9ONdXXqs7VbjroVUDzJG8WT5Khrojm
 RY68Nb4Zg5GuWDu3Mms7lLqmuSIkzBXe/zNF3dJIDPyyaHDJrYqtjA3/1QMa6cHYparXdMjwqRu
 k1YPJoL/OSIG/GtSz1S1op2S6BHfGOI8EVLV0zRYYwyNp1st8CDuE5GxNOMjwhtmFA+vKHvj7qK
 YBJGnvffhn1lctYnRJg==
X-Proofpoint-ORIG-GUID: psfQoOwgmjxv9tTrSwveZ9fRxV0ZldHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020110



On 8/5/26 5:04 PM, Charles Keepax wrote:
> On Thu, Jul 23, 2026 at 12:42:18AM +0100, Srinivas Kandagatla wrote:
>> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
>> mode over SoundWire.
>>
>> WCD9378 ("Tambora") is a low-power stereo audio codec used across
>> Qualcomm mobile and compute platforms.  It integrates a headphone
>> amplifier, mono earpiece output, three analogue microphone inputs
>> with independent programmable mic-bias supplies, jack and button
>> detection, and SoundWire dataports for both playback and capture.
>>
>> Assisted-by: Claude:claude-opus-4-7
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>> +	if (entity_id == WCD9378_PDE34_ENTITY_ID) {
>> +		unsigned int mic_bias = SDW_SDCA_CTL(function_id,
>> +						     WCD9378_IT33_ENTITY_ID,
>> +						     WCD9378_IT33_MICBIAS_SEL, 0);
>> +
>> +		regcache_drop_region(regmap, mic_bias, mic_bias);
>> +		ret = regmap_write(regmap, mic_bias, ctrl_it33_micbias_vals[0]);
>> +		if (ret)
>> +			dev_err(&slave->dev, "IT33 MIC_BIAS: %d\n", ret);
>> +	} else if (entity_id == WCD9378_PDE47_ENTITY_ID) {
>> +		/* Announce commit-group count for the FU42 writes in pde_post_pmu. */
>> +		ret = regmap_write(core->dev_regmap,
>> +				   WCD9378_ENT0_COMMIT_GROUP_COUNT_ADDR,
>> +				   WCD9378_ENT0_COMMIT_GROUP_COUNT_TWO);
>> +		if (ret)
>> +			dev_err(&slave->dev, "Commit_Group_Count: %d\n", ret);
>> +
>> +		/* Let the master's WR FIFO drain before PDE47_REQ_PS=0. */
>> +		usleep_range(2000, 2500);
> 
> Feels a bit odd using these callbacks for commit groups, really
> that is a thing that should be implemented more generically. That
> is a pretty serious task, so I can probably look past this as
> vendor specific thing for now. I guess my only points would be
> can you live without the commit groups and just use the current
> values? And if not, are you prepared that there is a good chance
> this gets missed when someone does implement commit groups and
> this breaks.
> 
Mos of this is gone now in v2.

>> +	/*
>> +	 * Unmute FU42 CH1/CH2 and stage 0 dB volume via the _CN (NEXT) alias
>> +	 * so all four staged writes activate together on the SCP_COMMIT
>> +	 * below.  Writes go to the vendor slave regmap because FU42
>> +	 * addresses are outside the SDCA class regmap's routing.
>> +	 */
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_MUTE_CH1_ADDR,
>> +			   WCD9378_FU42_MUTE_UNMUTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 MUTE_CH1: %d\n", ret);
>> +
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_MUTE_CH2_ADDR,
>> +			   WCD9378_FU42_MUTE_UNMUTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 MUTE_CH2: %d\n", ret);
>> +
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH1_MSB_ADDR,
>> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 CH1_MSB: %d\n", ret);
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH1_LSB_ADDR,
>> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 CH1_LSB: %d\n", ret);
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH2_MSB_ADDR,
>> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 CH2_MSB: %d\n", ret);
>> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH2_LSB_ADDR,
>> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
>> +	if (ret)
>> +		dev_err(&slave->dev, "FU42 CH2_LSB: %d\n", ret);
> 
> These should all really be part of the function regmap they are
> function controls. Also would mean you have the MBQ so you don't
> need to do two writes per register. I assume, with the commit
> group stuff, these are writing the next value rather than the
> current? But nothing here updates the functions regmap for the
> new values, is it ok that those two get out of sync? Or do we
> not define these controls at the function level?

These are now part of the core in v2 which exposes them as proper mixer
controls.

These work fine as long as we apply the mixers after the PDE transition.
Which is not what user is expecting.

This behavior is because the codec seems to reset some registers to
default when we transition from PS3->PS0 state, volume, mute and micbias
are going back to default values, leaving the stream in mute.

I can try to re-apply them in the codec callback hook, but in general
how should we handle this in sdca core?


--srini


> 
> Thanks,
> Charles

