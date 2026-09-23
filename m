Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0655539773
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172407; cv=none; b=EVan82iqNL2uFquTRWmYeeJu9WlcNRSTlaYa8OlcPXHMp+chfW6L9AATWIiaqKWRtHLmPQ/GDXaGKhxvPELFpwrq0lxy4RYz9r2NR72YXByzqcensSGOCCeoQebO3g4dRuDjJq1iSqZaUAQCR3BiHI6NNf3fgPqkuVxpV9XvwTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172407; c=relaxed/simple;
	bh=W5NN4WE/PtSRSXtIHu2m8oFMP7RB+f45+NtyKYO291w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvL9rWTFb96GjRe9nSEWCqJQXB6c+xrXFVsSTqgYzXUBdfTq5nXbwmrMmoFsszCPN6jFjZfVHFgOd2K1wRiRB0brJo8gZ1shbEoPqyG2OhLqUx8QoiIUoj3z4U+ipEzq8LnGkLhSM/067zeOTajdQA+67CG7H9V4ZHm/ZXRRNpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAWLQl5A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J40AC9QA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAWLQl5A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J40AC9QA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKp7K2056298
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FUHxnTvO/EI2l9mO7u+RQT2gGjJxCIvoh+QjMc5MdA=; b=fAWLQl5A3BrA3sQg
	RTqfA7hzstMWLo0BbO8cWY/374Uuonh1jwMGdtexkcP0Xrl/jIrcXoEt+c7Zc7sH
	9X6LVsnP2gr5Im6Fs83JlE3cBtQ3mmSmEjfSTRrj71oTE1kAnCkqi+A2gGhrzOtk
	83g5vkpBj4EpwjdIANsyLmq2NA0tt1Ce8cIY634uncSF0/QYi2n9QrQyBeXP5BCQ
	6hl/2f0thnysdWZRtWv87I7qdBBa/Oigrhl12TuCBK5jD5+AxaGqCQZaUOsBJwAt
	o4tqfF4VVA5692N1nnLFTMDldPanJSEfEqFAWjdEZCna2RKNtyDm+erGjCyeOpdX
	T7urCQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv06gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:06:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-790de8f0cecso286216137.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790172403; x=1790777203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2FUHxnTvO/EI2l9mO7u+RQT2gGjJxCIvoh+QjMc5MdA=;
        b=J40AC9QA5qKhnbD+A/WvKWNY7ie+i6ah81IGis8aomi5LPAzmJvPeZpwTE9sQhLooI
         LQmCenc6lVbn0qpWXPhfukiqgzuzYt5QuCXUu7NnYVodY3pE4Ift9R9PVOPjjSgu7kIy
         6PtDvcmeQMf3Fg0Lc5HSp1zvqgtPq+q4UDBhY3POwS9wqfZ5GFaS8X2wx9qPJu1mIeVl
         /+c2ErLys+HgyI1t9xuM/bgFPeCKS/ErS5NbOw3SBu9ZhljOZlSigDPy+3WEeGWaVDlS
         G878/+HXKSKIOKbP/y+hKLsMxRSI4VBxjI6Ht2yY283NpOOkKciC7jJlpNPEVoVAcX8n
         rB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172403; x=1790777203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2FUHxnTvO/EI2l9mO7u+RQT2gGjJxCIvoh+QjMc5MdA=;
        b=f8jLwg+YCXPe4R4M+ULbxWF8E2nUj8gVMylK8/TjI3zhX4+beHxewsXyfIOprnqRnZ
         M5kpX+JTSZbbBT2CAsxuZCSSYlJUWdatBN5PQYIZeAxUrALnlrOfCUCPdalKcSMDW71v
         bFZ+Ij7WsKoVi9a1A0rqzYxxZ39MmUkO4fxt5Z1iM5vG75dtaHUnu3S1VHyutoY0fLDq
         IZEJvcIt654DudIj3mld+AvV3zW2BKY2JPDm9QPQOwqaUq9jwBH6wkCuyUpgQlse5SF0
         zrD9Fr3VNbQLFqZeaAMun6CvyoA+VV/3oTuII72O8lghhz/5TwFdtXWFqz9IJ13H0XnR
         ngdw==
X-Forwarded-Encrypted: i=1; AKwUvBzok1kZwWT1jcVNTSfOAE73XzC/N9lcLSYU/rQAYxY+vmMz9xTDBKB56plOUO2I+Rrc8HBs2LhiihbquaA=@vger.kernel.org
X-Gm-Message-State: AFuF++m4WyiErtIrI0F2N78AIuQiE2skea75UuB0Tbs4bAOjgys4VPLz
	6pDXAcVNnB7iYWsG03gDcwE2JE0xwNbu8OXppcFUp36ncHPJggMnO0HzIwu7sQdqwEj0ng8RoA1
	TNaXYM3AmWTHogHVSKUA2O2SOg5Efy/GGWyvxPWDQDncUI6DAFI3CZTIsLxofouZf3Jc=
X-Gm-Gg: AYBFou0l/mOuyNZTKIgFV0xoAXq475H9KolN59WIKVVzHUrPiIk6Z+npoqj6AAX6DnH
	s0ZfmlcK4wXWkZ+GbxSpfC8s3J1RK69KTNE3N50DCDm8Duj/E0UD5irr6b+ZZlFGQ9ccCZrQ/Q8
	NE4Om0CsJkH12Ef7vVD8JwbzzQVHPAoi9D+SOzeLuJ/5nfUD74YTVWg5Tpcx+4Kfa5p7jksKFcn
	eQ5P45cJygYB7+blYQYAf5k3JpxfDcuLDQConLHJtymDA759eJEYeQJHnPH6Ihw+0tzvH6hMLnO
	m9EbvllDFkztrZIdgJnNgVnRk6CCO8eyRa5dyoGt5sSjryZq8uYAr6+ax/FxcONnGfhTSwo3wkH
	VYln69AS6jifDAbmvFwXIOZWdlk3CBlg9BjXonEC4yTVjs/QtBSLUf8oXuPplrA==
X-Received: by 2002:a05:6102:6b0a:b0:7a1:f7d2:e83f with SMTP id ada2fe7eead31-7ac1bd45ed3mr2292154137.15.1790172403320;
        Wed, 23 Sep 2026 07:06:43 -0700 (PDT)
X-Received: by 2002:a05:6102:6b0a:b0:7a1:f7d2:e83f with SMTP id ada2fe7eead31-7ac1bd45ed3mr2292132137.15.1790172402812;
        Wed, 23 Sep 2026 07:06:42 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a913:ba43:96d7:743c? ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d978fsm71645165e9.9.2026.09.23.07.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:06:41 -0700 (PDT)
Message-ID: <90d07176-9550-4abe-9670-c7c0c89d968a@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:06:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] powercap: Introduce generic hierarchy helpers and
 selftests
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Lukasz Luba <lukasz.luba@arm.com>
References: <20260806110159.69690-1-daniel.lezcano@oss.qualcomm.com>
 <ef124b64-e7d2-4c9c-9890-00685e34f314@oss.qualcomm.com>
 <350caba2-4a95-4945-91dd-0be89b2d3e22@arm.com>
 <71932f61-5721-4363-b163-427432fedab4@oss.qualcomm.com>
 <f1019e70-f3f7-429d-90e5-c74234dc5cde@oss.qualcomm.com>
 <CAJZ5v0hcqkeGzuhar7e1zdcAEKO6Q3btuSjF9tM=rXv5f5xZZg@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0hcqkeGzuhar7e1zdcAEKO6Q3btuSjF9tM=rXv5f5xZZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX34ppp/AuGDJX
 gHbX3GjOqlai4ECgMQxbiur44aUlJSf1ZPwYmKEhC/N7/UXqWYTlDbSg17lkGcHPHvrbBamn1Kl
 xCg0IVJk1OdtbELxPeYBJPpt3G1Ko1oM4hVkDCL2dUJgVkUncYkw0dZ5yzhi4j6U/wH7yx+Kp+a
 9+mMJzuoNcjDS9raDewbbPjr0HYKP4OpMbs1kt17J1DccAwWggiUgorqv5EL+xov2e3SJKg6yac
 so5/9dscTCI2dp4TKnJBst5Zc9AULH2gmLXVfSy4cZ2XazulH4YZW4BxBQrqaWvaelSAhSLDfC5
 JzboFkLUNoW/K3q8ngJrYt+So62QotLwEr+ehVKFavSFJVJzeNQfSvCDCG/fx/0REE0vkRJKwbC
 okNwUdL3biKrdzzp0HVwLgtEgY1f0ce7v8Dmi68eIpTyQauIHftnoXH7FivqwTi/JFy2hme0sSo
 wFtTJdko7s/ElSgM+Vg==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab3dcf4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bBP9mPAd7I3mHMJdqGMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: MH7JUVYBPtzRo8pAJX_8v33-q5qxA9KE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX78OqhxxDQEed
 PiC+XjbAvWxPbWWwB5XJXZOwTahomEnrDQsjWQDggu2DIOv79RGL35ucpFrzDlteNuA/swLPuTx
 sZcIH4zZzGv0TEqxJkZuhMte3UQP7h4=
X-Proofpoint-ORIG-GUID: MH7JUVYBPtzRo8pAJX_8v33-q5qxA9KE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230056

On 9/23/26 15:58, Rafael J. Wysocki (Intel) wrote:
> Hi Daniel,
> 
> On Wed, Sep 23, 2026 at 3:47 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>>
>> Hi,
>>
>> On 9/15/26 12:54, Daniel Lezcano wrote:
>>
>> [ ... ]
>>
>>>> I can see some potential improvements there.
>>> This patch is a blocker for more changes: DTPM, powercap cooling device
>>> and SPEL drivers from Manaf.
>>>
>>> It has been tested and there is a selftest with. Is it possible to
>>> consider these two patches for merging.
>>>
>>> Given it is not a fast path, improvements can be proposed later.
>>
>>
>> Given that there has been no feedback so far, would it be possible to
>> consider merging these two patches? They are currently blocking further
>> work.
>>
>> There is also a selftest covering this functionality, so future changes
>> can be made with regression testing in place.
> 
> I'd prefer to handle this along with
> 
> https://lore.kernel.org/linux-pm/20260819165605.1398880-1-daniel.lezcano@oss.qualcomm.com/
> 
> which appears to be the only user of it.
> 
> I thought that Lukasz would send comments on those, but in the absence
> of his comments, it would help if you combined those two patch series
> into one and resend.
Sure, will do
