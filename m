Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478166;
	b=QBtuM5VqMI6A36xJpook3x/z50f8VRW4VlaE+m50GTVPyQz/EqqORS0MACmIMfjempvB
	 hSXzPyeJlqokeaBEa28oYUt8azDtTVivnmZgO/4Y2WxUAAgYA2ElBdHszxR2IFLzfI2qB
	 s802gEhm/cbYg+FEYZI0PbbNZGWQIiV3UXd1W+A6bDYJBOkf+hD4Z9s0HkQD5xw2Lzlrb
	 zkUjf4e67YO6FgwrmB342Mw/EH83SN1S7X9Lo6NbCpzI7prHCa0YaYx4H30PyjisDnsvp
	 5HX66/6Oow7pJlzssg0FEzyDIMhGMwzRE2VWOLrrovqNwLJ6Rbw3N9YPIO7EKzE28UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478166;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O5L90x0qJtQLjtO8wu1AzKm3UqP/ZRrsRFZq7AMcdGQ=;
	b=3YEIiuorxsagGmN+WrYWLA3XZtbGgciGfJY01PiKqeV4JJWMfHznrOHmPJ1ejUaYPN6w
	 tE1cMrlkwRHRytJoWFq/JfsKCXlBeymOQVKg8MhZUPND15vg4g/8L8E23kvg47Zs2CTDo
	 v8MxiCU+tqwxD6c73rL0zTH40UIsC6QI9r7ZdFP/5Tk5Hb66tpm9z0G0BGRWeSKI/nojx
	 o+2prReWU/B1pNOyY6kbXh6z0GE2M8HutFPX48c0duR2REFneZSPsx8ibZ6dlDOv4n6m+
	 tnIXplTwpUw0sfBMZL2r7mH9YxzLKWHxPewca/99D4AiW29VMJ83Ru2FYKmg4Xyh50g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+mVmidC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bhHQXAO6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B02606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B02606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+mVmidC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bhHQXAO6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53pdE3477100
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O5L90x0qJtQLjtO8wu1AzKm3UqP/ZRrsRFZq7AMcdGQ=; b=Z+mVmidC5pU/7H58
	ppN+5gd9fW4E9aupzUBR+8n3m18WAywMq22mlqus8et5Jj3bsd+QvVj++p1MkI6Z
	mtaufojodvfS074+xpddYk6YaOWa0dq4QZyvNQrGUWY9XwcINwFHXbEPhEUFFJG4
	hainEEeEQRmVfkhV4/dF51kPSxMkKkd88tj5mmMZSa+Z1u3sJ5ASONY+6P+sGfm0
	LBWHZY2N7camWy9NzgbhjlxYlWG39pYwSDAA2LAL/aDmVHoEksUbe2CvtRVsVw6V
	7NvKNKZ8E8Ny0cteehfuu7o6dGIMZyzk/gfKKFIURz96JfCw2wfDcMNWn7BCKTLS
	qGRWjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuh20c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:09:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso3094788a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478164; x=1795082964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O5L90x0qJtQLjtO8wu1AzKm3UqP/ZRrsRFZq7AMcdGQ=;
        b=bhHQXAO6YGRe3KAn2gun6jzd5J9mEP4cRt4RKjF5Iycvz0K46hLE/j2tIPkM6yv1LS
         q3FgrcAfPHZ3DTjhBg6x75aNBHiYS9GCqZ7HJfZSUmq3hgjMivPqC6N8xc2bV3eVMWDr
         bONhe5w23Rd7j01HSFDaIInuMrgkBx7qF0eMhrxDTs+65j5B86o83lLtX4uNoa6cyGGN
         /1lhrr52mLvrYcHDY34l+poUqWzXRww5llZtDgLWWYBvyGOuWqvarjXiM0Z7yqu5/3Pi
         SvRxgMXG426K39MEbfW9kglbQNJ77QYjPU3c4WwZ89W/uoHERXvDSz8z0o2EheZUpPNS
         HLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478164; x=1795082964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5L90x0qJtQLjtO8wu1AzKm3UqP/ZRrsRFZq7AMcdGQ=;
        b=rSsVRD2JnfIOXiEiBUCSKdjRNvFjv/m/HBmZ4f849tqIsG/2VCUarqaBPjg3LYeAI6
         68viwefKrWGWRndOkVz5wHGGtwevhNz1BSG8wNolsu2JQp74G0Xvd+zlS09aQXmKbXdn
         ZsMSgfGrnyZisXhPDeAfTuu7NwHWkWZlJAZjZLr87ZbAG6vJZop5+kaGhunuKQyFbrTo
         xOLlfWHue/Y2/HHrX9KR8JLzDNoI9ngQGhjCDiKGfuiUVIY75Tte8bhU/e2L+Jt7AfED
         aPErz3+KYNqiK2oqh/HIXs/M/W4Uee7zw8Bhl4LxBlKg391pUithfM9qcbovcw4x9CFR
         p3UQ==
X-Forwarded-Encrypted: i=1; AL+hErGYlG+4rBww6pzxK9gli2ccacRM6zbHWPdmWyCrfoOfT0PDTwYszUuIJBEANHjborEdtTBxpQBROQYLLbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m35O1cZRZsycyfW5FlBB/J248eAX9l70/YmYwuPvigysn46im
	UMGo6lc16xabZBLRye/gET2myIRG0poEv3su2imL2lkiooxuO4zqskvZp0VbqW42VmEiPp/bLUS
	AjqVb/uqdV8+146DxVmfI+g0Y8j05oePbfUXug+43UrHCPUI5U39zMdy3w3/VDEvlA2A=
X-Gm-Gg: AYBFou2vcj2E/BKxnuHntXI7VDb1uNPbR/TylgAsX0Z0uKN7mxJu1995n51Yj3BvwgR
	fbBHLTTF6cFQ/tQQQs5NpiyrWPEPrmfJc0J73Q1DMheerEWmyJ63bPHqJ1srghhhdTI1p/KXRBD
	nSHxZPuegtjSHkLeChCAYyJnCTNSEylNcv6OQK7sosO/1h+Hdx58vWOjsLFyW9Jt4GV+KA8NZ7X
	XNIhGuWPA9ZWHAwYjxH8jG73VrA3p/zmD2EipftjtSZDNAURmmiWzfzs+w7OQ1REu8llqU7Eg3i
	hoGn4aw0xrKDgt+8sirwGMNeIGnyGx7p3nT2p577pA6wg+swPeCJz5AVJ67jP55+D32SbDhiMGk
	uFhWAV5HxGgQoICmbUdgPZg6LtVrCDU5Vfs73wikneSdVVXxSTbwRKlYi8phWaTFwdm455UL5bL
	tyfKSK+yOQFxE=
X-Received: by 2002:a17:90a:e7cd:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b182f93b3cmr5126599a91.45.1794478164027;
        Thu, 12 Nov 2026 02:09:24 -0800 (PST)
X-Received: by 2002:a17:90a:e7cd:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b182f93b3cmr5126569a91.45.1794478163557;
        Thu, 12 Nov 2026 02:09:23 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm4005578a91.9.2026.11.12.02.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:09:23 -0800 (PST)
Message-ID: <27de4b46-4fdc-493a-abd2-f28f22ed6c4a@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:39:18 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 v6 3/9] ASoC: qcom: lpass-rx-macro: Add shikra
 compatible
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-3-2cda302237cc@oss.qualcomm.com>
 <c1dc47d0-676e-4b88-b904-34d193e61808@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <c1dc47d0-676e-4b88-b904-34d193e61808@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _eeqs9xD_7s-KiQhvZHZyhzSBxUrAYmC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXyfxMZlj1XTo5
 PdWzpCzOicoWoCitfeOOy88y/Gnbl0NQ/YWdyOBlycznH0VGcL3ejtfp6oxzNhPyblj4qBzE1C+
 6DWAp9eXASE4vcn/mi2hamh4bFkbhC4=
X-Proofpoint-ORIG-GUID: _eeqs9xD_7s-KiQhvZHZyhzSBxUrAYmC
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af59054 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=71XsD3E5Q5-dLC-WrCUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX4sDNkqvc6iBa
 KsIVwyxLQnSCUS45Plo4KHYAVRKS+Y4QTLHX5zSLnw6ehs2WhbH/hKAJztUm4l6kdqEEqR1tTkQ
 mPn+4HBacVbRYaw6M96Z6ZbhrRooKl6piiUnCpL61gmMhM5sm7qbQwYFT+wQkZl8fkeh6w77Oea
 ZyYaS7caxpBWZ9cbsM6G/+uOiW8U7o2yOex9q5SSGJu/qZ5zbVxYYmElYJaDR0AOlN2nXB80mcd
 ovrRyUwv61wcwQMgxrLzyUrxSNiP8z4tm+im4ybguDpn6CTrXTw3u9YcnfrhV8OSneoooPmHflz
 27DJloqmDxRm+FExkYD+BRAp8KbbVRN4Xf5UQh75cKE6bqWwn7YrdWMJNHl1gXD5sVzsofsYimk
 RW4UtXiQTqiSLLYgrv5+mgf3Gug8itw4GzFTiTouVZwELEk36eMCH7aEkIYsSpleVEtQGXu5aom
 +XNzcVYmcArmuTdXCqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040



On 11/9/2026 8:45 PM, Srinivas Kandagatla wrote:
> 
> 
> On 11/6/26 12:33 PM, Mohammad Rafi Shaik wrote:
>> Add shikra RX macro compatible data and hook it into the LPASS codec
>> v4.1 flow.
>>
>> The RX macro register layout of LPASS codec v4.1 matches the v2.5+
>> layout, so reuse the existing v2.5 register access helpers, controls
>> and widgets for it.
>>
>> v4.1 additionally requires the FS counter to be bypassed before it is
>> enabled during MCLK enable. This is a property of the codec version and
>> not of the board, so key it off the version detected by the VA macro
>> rather than off match data.
>>
>> Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/lpass-macro-common.h |  3 +++
>>   sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
>> index 573b2145e1c4..b52665b11e35 100644
>> --- a/sound/soc/codecs/lpass-macro-common.h
>> +++ b/sound/soc/codecs/lpass-macro-common.h
>> @@ -30,6 +30,7 @@ enum lpass_codec_version {
>>   	LPASS_CODEC_VERSION_2_7,
>>   	LPASS_CODEC_VERSION_2_8,
>>   	LPASS_CODEC_VERSION_2_9,
>> +	LPASS_CODEC_VERSION_4_1,
>>   };
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_1:
>>   		rx->rxn_reg_stride = 0xc0;
>>   		rx->rxn_reg_stride2 = 0x0;
>> +		rx->fs_cnt_bypass = (rx->codec_version == LPASS_CODEC_VERSION_4_1);
> 
> This does not look great, can we move this to of data?
> 

The FS control bypass is version-specific rather than SoC-specific. I 
initially handled this through OF match data, but later moved it to the 
codec-version check since the behavior depends on the codec version.

Best Regards,
Rafi.


> --srini
> 
>>   		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
>>   		reg_defaults = kmalloc_objs(struct reg_default, def_count);
>>   		if (!reg_defaults)
>> @@ -3951,6 +3962,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
>>   	}, {
>>   		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>> +	}, {
>> +		.compatible = "qcom,shikra-lpass-rx-macro",
>> +		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>>   	},
>>   	{ }
>>   };
>>
> 

