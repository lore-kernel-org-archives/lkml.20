Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C125B2F4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476105; cv=none; b=I1H12gTW17jkIc4gukWitHNhb0Hs9TPPNoVfmjWmUnhYyI5fCgIxVcNvDQlnUCcTUE4Q+J6ZsP9Tm4LM9p+MgivNihuUbFuoXCHSanGPNxsHxXL2FzLv27k6w/p4157SQh/DgZsXArkfctTc8Mjhdh+hpKlBFajiSp9Zw9wHEFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476105; c=relaxed/simple;
	bh=8xJdsPUuBUKshmuBeGFPsWIjoL0uo/tgR0qCDPFQCDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmoGhEz0evEK7mw/fuIeopCptTyKY6UC+4htiWkh+krEWXQ97+Im0gSbzfEOfzSx40mg9la+RjcBJKm3/Ho5gh9FNEeS6h1yDSeRleBZmoBE9QCsnbCjq99+2PqsZqleAFkHJeBz5hR7VRNnBS2aHUFSi5Yr5MGj4M94B5LpF54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Udb8LRsf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aym/sRZm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Udb8LRsf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aym/sRZm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gunL275469
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5gEgvPvT8xWf40byy7jStKrUnMKLHbVboNPicag8Xe0=; b=Udb8LRsf0Zsvo9HO
	3zKGyrHpajP543xw6UZ3/hhjHShb0sn9l0WDXdq/TSEZzxnGECoL5pS9bV8FNqfR
	6rKi1Kg9AsXiRehLR+OVr2OgwbHZeWRDx5eH2lH0rdfXLyNu9ye/VPOiVP43sjtK
	g7PSTNYfrHkTJOr+rEEo89ye5vZmbJIK0JHiPDKRB15/I4FTnMy1i9g4n3MamBlG
	Bfb0elnmmcz5RNowM6vqRsO3pdt+CyEI7perLJ28WTqtO4X1Cwckx2NOKn9nB0Qx
	6vE4bZU9iw1G8ZrlUkLqUiKP+JyuHNTcb4NwhFh7XTRpjLwhobI6FsZEfL5C3K/C
	5P20Rg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea1sw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:41:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so9840685a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476102; x=1790080902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5gEgvPvT8xWf40byy7jStKrUnMKLHbVboNPicag8Xe0=;
        b=Aym/sRZmOd0xcPlOURepMZWZZxpwtbYQT3unhyJn4WpgPGtD829JRqK/dEaM5VsDlY
         XrB0ByynO+i48yuyPMJXamr6cvstevgOsTPU+Bx9Ty46NhSHNBJ2EiGcuhnegwBgMQ/s
         KUu7y+ho2foKmnpfmiEu69FKyYnxKCJoabKYzVB1xp5TDA7Ks3fHUXb+0htzMtJ4CKRF
         9US03KVsKtHzGaQ1eGI1vWvEpgmoONMmPopf0FHp8ahVLd1s5p16epMQhArfmFSgqTuY
         WfmS3CpAEXVWsNpadSffJeVjRwio0hHBy5Y9IksT/j5HfI8srJ8VHKFLHSsgnY8q0UuM
         XnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476102; x=1790080902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gEgvPvT8xWf40byy7jStKrUnMKLHbVboNPicag8Xe0=;
        b=x1lxlfYKkUBYelO2qdckEICwpa5Mgfs/kG5Es1iveONjYEWvQXj0ADe+WbNdr9T0L7
         7FxhdDQctCSLPJYixCh22wV5rqTi13yDI72fslY7mpx1u7Ee63NmYlO5N4hivqW7mzVn
         bkMfFMs2smMRB/RleRfHeB/yJZmeQqIM5LPhGxJRwKehDQNqRyl/l6i3Hu72x8UMxpem
         6W1ta72GZd6Hs0IUWIE7gRcwa8nv25Cs/PAKXF6W2gus8jgBTNah/5seIJWcQ48iNufv
         4dvMHu0USNHhtV26IWrjF4JE5H+cvi0/ZVVmZIWBxAsSajM7Tb6o+O6gmqHMwxqOcDu+
         7j8A==
X-Forwarded-Encrypted: i=1; AKwUvBythDw9sTMxJ39JRofDBpuQqUOb+/hgZEGQXnlnDpefTgO4o77XguGYyzf2wf0vFnk5LFp918hgxNoPMTc=@vger.kernel.org
X-Gm-Message-State: AFuF++lM++4sbLQz1VTyeqs52HZS7oA8RcG3c/Kz4Dq4olnrbwVbkqwD
	aFZv+uCkgD0MtPfsPYla0975o1mJKH6HPgR5E4+FhoeAzz1slWJibebfWKbozcPjnHMSMDI+C5Z
	4Ic12GcUuSAnotgeijwhIqcVjEBWq4tfKD5qP1/K21lCZlvnhPo+1cpXtfZr3kKg5o5M=
X-Gm-Gg: AYBFou3zlxZuiVj108LAyFSamjvxJj8cc9o93BDO4tCEYIkIQ1VyVY+NYSb+AQmUjFR
	3nnbl6F9+yuGKQK/STMm1Q7+T8jeDyeYmt7/IuoPp8LT7kdrrLQFU/jNMn+KAINUpM1LM2/krsX
	B/7JB90gkI8zkXvbVn876V55aCecQ3fLnHtEPz1yKuptWRaDYsdCZaw78iILc3ji1cv1Iyi7Yjt
	Ha9MWgUAdFjbxGXMlrGDyMUk594NGIvDFB2DNeUXCNTI66Y/tonX1GYsp9kwPuCxHrm05urosYt
	Nm95RljK6fWxG0U+IeCRu5+zg2x2EQzkBrfxw+ZhHZho3dMi2Cb3oVK5y0p6KljeySVb0joGh8S
	NBkneWb7PA894QW2ACB8mlAfv7cWq82VTYnIOxQc=
X-Received: by 2002:a17:90b:4990:b0:39e:ad:d31b with SMTP id 98e67ed59e1d1-39e10e2d518mr1366180a91.6.1789476102402;
        Tue, 15 Sep 2026 05:41:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4990:b0:39e:ad:d31b with SMTP id 98e67ed59e1d1-39e10e2d518mr1366120a91.6.1789476101955;
        Tue, 15 Sep 2026 05:41:41 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm5508609a91.0.2026.09.15.05.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:41:41 -0700 (PDT)
Message-ID: <14883b46-c632-4f00-b3f2-89568c4b8844@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:11:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] ASoC: qcom: lpass-macro-common: Add LPASS codec
 version 4.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-3-fdd2129c696c@oss.qualcomm.com>
 <20260913-illegal-quartz-raccoon-be0d06@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260913-illegal-quartz-raccoon-be0d06@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q8l8N6ZPmXYTm-vjlZMwKukcFavmEigL
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa93d07 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZrgDs7hp3a_oj-6vkJAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: q8l8N6ZPmXYTm-vjlZMwKukcFavmEigL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NCBTYWx0ZWRfX1U7sCVA57w4y
 7saOpcI6nXD2Rp0n1ZAYhw2QMmWcGspxJBXVMhPrDkrHhnby1x0joCtiCmi1M7ivPnCSb5v2kBi
 RT09r8clX1nyF+W3MXWTjc4MV6kb2tI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NCBTYWx0ZWRfX4jvZKYRlsSEZ
 EYM1E/y3Uf80e3VQXmdEyUaupLFJI4oM7S/Lko+F0AwUg4LOn9ZitJ7kzQ7NNCGwi3dJ4kGQLO/
 Uf5C9csB7jBTWlrmY1klmX/Ia5tjRKbA051J4Zm28ukwHgzmTik90FHhSGaWnUpvK6Go9wWAYLB
 wPg4gmMqNXImibI/W0HvZ+rzddeXYGYZZNOQvYJAw0oBUwMM0gS7gZ4fgZs1A4xqr30iIeEg5Lk
 4ij6Byb5P0rxOvFHwvM4LSZSZwBOfGIBjBrRhBnrQTvHAiurC0JG2Pnj9ofRUUcfZRiKi5u0egC
 e1KDFLpxsDNsrqJcAdhwxVIoLzDxhnDcVXql6gumf95Gk1zSin1QVrxZMTJ10tpIBwBOPZu1+ce
 ddTGMThcSsLmik7jzlEy0Z1Wm2iuq9/T0CK2YpOEsVm0uQ67Y0IYsP0Jg90eakujZ3vqpjY+j6R
 FkRNywXHgEoyYUSYOXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150184



On 9/13/2026 2:16 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 10, 2026 at 03:16:54PM +0530, Mohammad Rafi Shaik wrote:
>> Shikra integrates LPASS codec version 4.1. Add the new version to the
>> codec version enum and to the version string helper.
>>
>> The enum stays ordered by version so that the existing '>=' comparisons
>> on enum lpass_codec_version keep working.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/lpass-macro-common.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
>> index 573b2145e..b52665b11 100644
>> --- a/sound/soc/codecs/lpass-macro-common.h
>> +++ b/sound/soc/codecs/lpass-macro-common.h
>> @@ -30,6 +30,7 @@ enum lpass_codec_version {
>>   	LPASS_CODEC_VERSION_2_7,
>>   	LPASS_CODEC_VERSION_2_8,
>>   	LPASS_CODEC_VERSION_2_9,
>> +	LPASS_CODEC_VERSION_4_1,
>>   };
>>   
> 
> This commit no sense on its own. You added dead code here. Add this with
> an user of that version..
> 
Ack,

will fold this change into the patch that actually starts using the 4.1 
version support instead of introducing it separately.

Best Regards,
Rafi.

> Best regards,
> Krzysztof
> 

