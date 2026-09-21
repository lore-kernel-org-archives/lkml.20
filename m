Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38A148AE17
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004476; cv=none; b=s9r2kDRV9TdElutj+QmDsrN9A1KO49ijlK3jhGkqDXoVl3ef6x62vysAD/FqfzbCj0TEojFsDnB5LiRPDRwzdahvuD2JIJzV1duu/tu56cSCI+1dYYgY2oi3tJ1yWzCcS3btZoiOyrFF5aIreX8uA0c9tTrQhi5rZAT1cjIIZHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004476; c=relaxed/simple;
	bh=b/RrYFb52+NN31KVA4CU7JSurMY1CDQm1wHwE+xJGDc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t2ik2If8Nmo9vwxhMoPc6QQKQRT17oN63oxrRfh7mByV9lHqx470R1hIigj6KqT9GCcx/R+yHxOpJX4wRBEEOmygB28iQEiIn0Nas54Pq4dg/pqh8SH7oUOZNgkN2vEqaFRhenHEAm8fYxZuqmYgfU6PMBLYr7n6uhrf1RWCzvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtQbCU94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRwxPDyj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtQbCU94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRwxPDyj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA5Ft827697
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9T9nmSNz+lGc2TpGZ+uOXDjvim3gmJy7ieWolSYHfGA=; b=TtQbCU940JDHIoya
	0GFpaaLovwxdUWrEikuSgG0/v1VEPivczA0ZXckRwPnjRX/9cGQYM40/1ZbSciqi
	64dxPTkyAlIvx6kMGEu3MPHyjSe1moaSbNozv5ELxM5Sy5iAtBu6j0iVmrk5JjIP
	YdUGkn0HH2IzMtmgj+ql/VltmQ9Sruuggft6/nhd1a/EOUEgO/psA9rA16gqeo9G
	KmdrWIpPIVCfaIfimwLHWGivmnVHR8VczJSEQhn/pHGl69P3VTeW+bn7NkqBZjOF
	Fu2yNzgaPAKJmjA3OO4snwsNouqRHsjFZDLB+2qLQTEJj/Qy2q53KUAbD6UVlnAi
	GZ1hVw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gspak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:27:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso51725835ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790004474; x=1790609274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9T9nmSNz+lGc2TpGZ+uOXDjvim3gmJy7ieWolSYHfGA=;
        b=XRwxPDyjubXiIsvxBvpo6xIRg5TYQwzKrZs+IkV+TjMDQ0JQjmBmSpAuB0Xelas9Ro
         RlSilCdUiYDf3QK40LbT4RwRcn+rGDESefd/IzG97XdV5fnN163cM8mWv93Axfl29Vgw
         c9E5if0EWmbDNDnDviRMXxPPHsg3eRgD/X5KtGGd1eecNMVkab9sNTCs6YSgpLSYRo0z
         EhG6HzAKqY0xGBOOD5OX34G1U2ywTCnP82/ZVeujYr7R8rUMkMEyfutSULInzyRX3APp
         zMlHGM1No5Vq/tDXym9B2x+740fkq5h+PDZe4aLLXBHyNlFoC/1zap28vVSDu5NvtB//
         Vr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004474; x=1790609274;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9T9nmSNz+lGc2TpGZ+uOXDjvim3gmJy7ieWolSYHfGA=;
        b=qZdWMITD8jaAVjfNgoYMiDl1sG0vJ3LhnICZ7i+gd5HNi2XxBTjkp7dU26JC01Eaeb
         YZYoFSXQqP32+jGvGtLRBk4o5OagAy8MxmTQvhzX2DrQWRiEsqpPROSG5iJ4vrFWmjzG
         gvDMF/PEoWfgRRNs+gFEEU/2UEYWHAfHQTQORaoBh59szcm5SikrE92rdXX0YbCcccHM
         vJWHUpxhph4rGX1TT1Y2C3Fs4LiAXupejMKpScbXnJChMbH691t3NDFT+y5JJl8lnfbI
         rTll0nD+ikxoNk8v2vepJyEzUKl59eQjdaSrG4kodYh/2pQVFPXLUbP0wrPQvCd6S1Uz
         hk9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFBc3DC8/nMwAr+a82o+UAGKVtR9YEsCzWr3QuKot4cV1zXwsf7+Ak6xZ7iNkNHR+7PPa05svxUBYkAb8=@vger.kernel.org
X-Gm-Message-State: AFuF++kX8geVsrqNcAUvgvlexmKRSEr5NHeTmZDMVo2cAu2FRf4rd8dS
	yGejgj3u5Mo57pkQ1ZHgVor11JYYXZhnfvSgdLv3EMiarnAAMVwn43HWLcKkIm0djPgx42Nw06T
	g0zPLdDVIfY9Dfti35W5j1rA3dk5gsr7XyxwmN92NakdrPsHKtyA4nnZ0+SiUWOe0IYE=
X-Gm-Gg: AYBFou3DLnWO3dpHXj8W1NJwHKAlLTdreMdnfu8z9XkioC9Fy7okCQUPMju83P3WVh6
	ymMf4Om8Mh08zj6LbgKBavXRVx73Znl0ZAhNCPkQ2/79tzYIbGW8y3qFHeSSOWDU2wfVFHtLqxY
	uUanh48kQGt+KgGUkolILVndA/D3hmJ5kp8KOn5uQ3UFgjfGkTe9kgSoEaNd30LC+sCjTLnJVBL
	Dky3NeS3CLP3Kw6e1e5MM/CjL7wK3bs+d7sB/iq1QqAY5SRSe98rMcJeHILN9nStj28ooo/Tl/7
	uTI+ReX68IiCZfuyXdUpSWmM7tRXX7yZL8N3utP3hxBogG6lKdn/ETEjRJooxZSn3TG6S+lsl+f
	p0slis5IqsdRnBXR+liGxKj+Dz2E4oMpyi+elUpHO3n+T5/4kUFRoE/xv7OL+YJvowJo0ruXSS1
	dvcndzHeipkZnF7g==
X-Received: by 2002:a17:903:4687:b0:2dd:ad73:c983 with SMTP id d9443c01a7336-2ddb1ba30a3mr162452415ad.27.1790004473585;
        Mon, 21 Sep 2026 08:27:53 -0700 (PDT)
X-Received: by 2002:a17:903:4687:b0:2dd:ad73:c983 with SMTP id d9443c01a7336-2ddb1ba30a3mr162451965ad.27.1790004472847;
        Mon, 21 Sep 2026 08:27:52 -0700 (PDT)
Received: from [10.50.54.45] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17888a8sm37128495ad.26.2026.09.21.08.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 08:27:52 -0700 (PDT)
Message-ID: <2cfbbff5-fd79-42f1-bd7e-a72067f54fbe@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 20:57:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
 <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
 <208b9e11-d36e-4376-9836-ce9ed3c81486@oss.qualcomm.com>
 <e66bb3f1-5dbd-4857-863c-99c22367bfe3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e66bb3f1-5dbd-4857-863c-99c22367bfe3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vM4Y-9celx23ISgQTSgI_Ek-OqG5lkCT
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab14cfa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=STkuWaXuNg38iv387h0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNSBTYWx0ZWRfX/XAqgWI+LHMm
 PUT54CoPZPFP+KAqY4/qlOmXwMyh3wSMUjkuc+fMMt8XsSCVzj+/cL+upAymMZ/alnpTx9Uc9Vn
 Pb/R8CvctITAZebkA1m+7BSG+z32NzOgW2sskGQ/I9omiAgDtYVlcwonrSbI+xvVnuvDyR+CMc5
 p40WUxMV8cdQMxTj0GoaVbbbJ1iF07OzEVO5ozubfDwiQDAtKFjPchMVDmG/S+Y15T2TRqcqfHd
 5/ZgcPpweQX1ZOmCpPCjgb2UHJolMC4Dap/FR2oyYfWoCiaM/1POm+kVdYLrtfJLyEuyGwUTwwi
 Vh1mcPBcSZRI6omu+8X0VzC3Gc78Wq6L6c759kxlk8Bv7T0yH+PFPGc83tG8Vbk7lUskteXJIjj
 D9WCyZxLzYEFtZ+GSzE19b0/8ym75IZiZ5oy8rTQw5oV1sImwDXuJpwqYT//DR9CaoJ16xVy3A0
 cBnmFWktQAHtUZpDeZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNSBTYWx0ZWRfX6lMnUnEiQJn0
 B58vahLny5KtnsMWKBySH1g1E3ufEbLgh/2F35cSe8LuhZG6jYEymEMVWqHlQCMce3pJ9H+irO7
 Kc4WJ0NYWSsiOTq+/ciLL+4TBGORD7w=
X-Proofpoint-ORIG-GUID: vM4Y-9celx23ISgQTSgI_Ek-OqG5lkCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210225

On 9/18/2026 2:04 PM, Konrad Dybcio wrote:
> On 9/15/26 6:09 AM, Navya Malempati wrote:
>>
>>
>> On 9/8/2026 3:33 PM, Pankaj Patil wrote:
>>> On 9/8/2026 1:43 PM, Navya Malempati wrote:
>>>> Add SMEM items for four NSP subsystems stats which are present in Nord
>>>> SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
>>>> id. Add new entries for NSP1/2/3.
>>>
>>> For other targets as well is the same applicable? NSP and CDSP are interchangeable?
>>>
>> From the stats point of view, they are the same, we used the name NSP in downstream, it looks like Nord SoC remoteproc is using the name CDSP [1]
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20260904081619.593602-2-shengchao.guo@oss.qualcomm.com/
>>

Downstream conventions can't be added upstream, if upstream dt entries
are not named the same way. Please revert this

>>>>
>>>> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
>>>> ---
>>>>   drivers/soc/qcom/qcom_stats.c | 5 ++++-
>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
>>>> index 06923408bfce..91f2d1293124 100644
>>>> --- a/drivers/soc/qcom/qcom_stats.c
>>>> +++ b/drivers/soc/qcom/qcom_stats.c
>>>> @@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
>>>>       { "modem", 605, 1 },
>>>>       { "wpss", 605, 13 },
>>>>       { "adsp", 606, 2 },
>>>> -    { "cdsp", 607, 5 },
>>>> +    { "cdsp_nsp", 607, 5 },
>>>>       { "cdsp1", 607, 12 },
>>>
>>> Is cdsp1 not the same as nsp1?
>>
>> No, cdsp1 is not the same as nsp1.

Please explain if the dt entries are named as remoteproc_cdspx then what
does cdsp_nspx correspond to? Subsystems are common across all soc's

> 
> It would make sense to explain the difference here!
> 
> Konrad

