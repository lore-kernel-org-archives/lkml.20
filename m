Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E384842BE95
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789445404; cv=none; b=UdBjkcp+YLtRZHEsIZQppwDdqjYzZyyXUaEsQjvsA7hJmvYYuHMWoq4bAbkl0q1HBQmauwA4L1ZikGcqo7lpP9L1UkosYOwBsRHB7hOK0OxzA5KwWa896CozYnVBZO/y3ev7Hzn3tc473Osq/hPTFj591T0ghR0YFr1oAarBa+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789445404; c=relaxed/simple;
	bh=5/UEmGyvjUelTNLqKGyOF7yi6ipRpSDMVbVtq6GQUXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fm2I42YiUeIoRytYrnEbJnpu4cRFiu6aQvfucq28H/GngXIUhSdSLnJo25lUnAkHcbOxmNx9LWRACAF2FKhbLoF31B3y7mpD1HIGfhCTus3lEeX2C3A/0AmO8rdtkE8iJC5ggIXOqUQKtsMQ9BtYw0G9OYafvfr35a3NstceP2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1OQ6dZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4NZurCr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1OQ6dZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4NZurCr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F3RcZJ1758504
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LNC+AUAFKHA5K8kSQtbDlsobu4uabDN4gJV60Y9KxbA=; b=Y1OQ6dZF07CH00Tf
	hprHuvIGb4bvJNQDbcMVkh3LpO/AbGsD/eg4JcNPVi43fOK8BoF2Nai2sAp8ixGl
	XBv3ITxnkADsjS1YZNs0QIWWRxcxDS74HhL96xc2b7q9qUbFUQxtoN8pt6ZYcyoX
	/Oj6MjecV3QLpc7dB7mjVg0ncu62Rz5AJv//o85s3KNlOZBjm6iVy/ySztLRyn4e
	kuSP4Bn8crR1/KQLWqGz1/OS0tQzurWDovjSUL173zLsZ1M5QcQMMP2I/YwCqB/e
	1Okd3Qa/copeUIc2seHNtH/hUuNBdPrZRnXTTfNhoy1/ZaSCbtAoOgurcC/6rQ0Q
	KoCiqw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s84s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:10:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso4056971a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789445401; x=1790050201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNC+AUAFKHA5K8kSQtbDlsobu4uabDN4gJV60Y9KxbA=;
        b=b4NZurCrctj+FJ7Md9oXWISEpd+v6Cxx6ClEwKTeChmkC0QUPHZ8c7HEy8fyNEdiD+
         DvEzagZbHkOFt5ZMvpzkfNdhueQBMJ4xoLc5ZwNAMKJo3oB+QfDKfvsPRcfTo2cXgBiq
         uQAP8fFahb3ES81N5h89Z+betxxbMfNMtikkZohhYgpeJh8PeJZ712gwbk+W4XdsJViT
         0XKS6lSNrPdUH41Rtxjb/dsP+LITWuT5KXhkSO8aPh9w1kZABeipoN3F6Fhac2GBJkSb
         BG1vdUINP1gOLfNbIrIMS7CvUzyVegwSmddsEcFx/fMcAKNYjkEXDm4xLLcLj1YwOqEN
         wNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789445401; x=1790050201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNC+AUAFKHA5K8kSQtbDlsobu4uabDN4gJV60Y9KxbA=;
        b=ekdUqWvsd97nJVdnEmEGilNLu6d3HiSjzcIqSSiW9YDB2xlGA9DXstfNQjFAbBq1UN
         cfsa/aLAgmIg8MVUcj2RFo/l5RhgBwgQ3/B1egrKXpNH0Fbx/apSFfDiZYCk7F3KGZzH
         b5uPmE1UjGzqf6lWhgTCHonLcQfk8PrBfFE88CuJZarmQ06iB9NANFsNUPDL63btgMzm
         m/9IKQnhiul/1Br9TJTDJkCv8yT5CfU2LO+EKCR2AMa71UuMlTHDH4uZoIlrX5Fy86as
         aztyfKsp70iiwMfkv3ZCpcORcSGNiJ235CEJBex4MbOgNB1IuolthZMIi6WqS1zNkqyk
         URIw==
X-Forwarded-Encrypted: i=1; AKwUvBzcYEgVvkGmrkoQTEWWUXSlIB7DJWm3zOcccX4Gt3YgrPq/S0ihjkHiayCbvoATxY1MLAgEsuu2umCi8Gg=@vger.kernel.org
X-Gm-Message-State: AFuF++mbwfhDxcXrEewia+X5egVo6Zn/gFmhVa2hDohrjTp++SBMztM7
	o7EkegwCi7N9zWVmpk/x2RPhvY+khwcVrrq2mRr4SqZVnvFkez05ILBh/lbhzXfOyRjp/jSX/fa
	5QYwizA6l03KMNxQGEum3/Fm3HzLHHJlq0ym35O0ElJR2gyFT7AFmX1qlhl/flbYcjB7b2UlTuy
	I=
X-Gm-Gg: AYBFou1spOpYKWJnnsp9jdVROrYhq7kxgbaEAN7OCfVTrM/aKPEngYLh1G/xW/JchpD
	y0wACH+F8161xC0LkDjTbhYAj2yw1eVbrFRg2SM+qGDCGZnkoI1+hLyNjY8w70KZZM/sQpTQDZx
	rgKzeaz+C7ylms0kJIem1hBWy4gGxQ0TurlS1c5/xIdke+2Mj7EWNwj0ewm6wdP0wlS39DMCANM
	kbPGMXCTasc2dQHi3I1gBGidzAO2JdPnlJtZFs26cOCcWn3GnjF1lwmeQiBiRNGgwppBE6VQTyC
	JUErXG6SZYM3m924vZ2rzC2kvBQPZY/Ic9ue2f0W3JQiFwb8yszQd5xgJYaZx7NXjcuY8aY+FwK
	ATH9w7cwl1g3HMzOgN0DH5f7sULJlGPRqPrvI
X-Received: by 2002:a17:90b:4fc1:b0:39d:fce7:f63a with SMTP id 98e67ed59e1d1-39dfce7f7fbmr5244338a91.6.1789445401405;
        Mon, 14 Sep 2026 21:10:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc1:b0:39d:fce7:f63a with SMTP id 98e67ed59e1d1-39dfce7f7fbmr5244291a91.6.1789445400986;
        Mon, 14 Sep 2026 21:10:00 -0700 (PDT)
Received: from [192.168.0.184] ([49.205.227.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm34800663eec.0.2026.09.14.21.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 21:10:00 -0700 (PDT)
Message-ID: <208b9e11-d36e-4376-9836-ce9ed3c81486@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 09:39:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
 <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA1NiBTYWx0ZWRfX72sv93clgOUm
 WOouQXTNqyltCVRPsHDxfoXwpxtiI2pT3sD4cq7/q5zb+VdInNS922tml07PgmbBohqXeFOzhGS
 kbGNYWFUzySD0g5IT5Y9QCkCxbQyCHA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA1NiBTYWx0ZWRfX4wlwhd0c1mcQ
 QAhvBRHIdiUzpjCAFmvkY1NEwm+B/hFa/040iqtRfEZjhQK0fyVN8NcZV6MmiYLQbBTFXOVD7f6
 nmjS8ny6EShjd9clLUZ5LmQx++Lef775HNAbvRx+J3ZjTCny1Ow2zPOdtfAuDpxNHr6Wt23mkAN
 InF1UzgugUZBcx1jKKQDZVoUap0mQPgtANC8r5+GtlcL9qDJkVXXET0iwxkT2+H2hXzGtA20ah7
 1HNaLsnBEIkGlshBc5VjNhirHS9o7o7T2JuT0uz0sliy8tQJ7hDKPRFQqVXT9+Ig+CL14YVIh2O
 dQp22yacxvCdzvIVljV1rlMaWQeWfiB7bKXiJKXVDVSIbHBt5qXPaj1wAq5fKJi+W3NUvISiALx
 yngYNoGSPJOrAFNLV3XGHn8dHCav3Hy/8JdEThhywo+BTWnJI28CL58ywiBi01DPZpyIoxfzSkI
 ELHZRse5YnFK5t4uPww==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa8c51a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=liDgL1ZI6qKGmvkE44Npcg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=axu8wqy0O_QUbl4U0P0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: JNivFFSvALMSbQ-PAhINC4Yea_uyEm5P
X-Proofpoint-ORIG-GUID: JNivFFSvALMSbQ-PAhINC4Yea_uyEm5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150056



On 9/8/2026 3:33 PM, Pankaj Patil wrote:
> On 9/8/2026 1:43 PM, Navya Malempati wrote:
>> Add SMEM items for four NSP subsystems stats which are present in Nord
>> SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
>> id. Add new entries for NSP1/2/3.
> 
> For other targets as well is the same applicable? NSP and CDSP are interchangeable?
> 
 From the stats point of view, they are the same, we used the name NSP 
in downstream, it looks like Nord SoC remoteproc is using the name CDSP [1]

[1] 
https://lore.kernel.org/linux-arm-msm/20260904081619.593602-2-shengchao.guo@oss.qualcomm.com/

>>
>> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom_stats.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
>> index 06923408bfce..91f2d1293124 100644
>> --- a/drivers/soc/qcom/qcom_stats.c
>> +++ b/drivers/soc/qcom/qcom_stats.c
>> @@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
>>   	{ "modem", 605, 1 },
>>   	{ "wpss", 605, 13 },
>>   	{ "adsp", 606, 2 },
>> -	{ "cdsp", 607, 5 },
>> +	{ "cdsp_nsp", 607, 5 },
>>   	{ "cdsp1", 607, 12 },
> 
> Is cdsp1 not the same as nsp1?

No, cdsp1 is not the same as nsp1.

> Adding cdsp_nsp_1 is very SOC specific
> 
No, this is not a SoC specific setting.

Thanks,
Navya

