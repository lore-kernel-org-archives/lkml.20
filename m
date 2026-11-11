Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367529;
	b=a0Ka1ZO07S/3Cqp8Aq3Ke89qZGJMJCqOt9kvj90vfFlcdQ2H6TcLI44XTAM5PXuszV8w
	 sv7P78tt9i3mQO8ETEWAD+t8n39A4mgiQCoChHuxgPTqRCbV30a3yZSr4PaXZ7RcphXy9
	 fJFr8cg/JxOO8wKBUWlZA7FO3fiQkK1Z9wLjUuDyrmg3jjBUQDuTJl8BTlK4UvnUATmm4
	 MAyMQNSDmkjlYw5flqTDOrM4NWgiU298Kj/zhBd+dhQxMOgqfgzb2kThXm1MRNgMs25yO
	 yzJDEj2RcQlbZHBd9O6i57HzRtpleK9/qoMxpiFUZrPTI2GOv56dA+QyxeCjsvvUoOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AomCtOWxOdmlR0sUoqk220RU7FjG0HPHL1G9AKXfbu4=;
	b=pBsl6VbTXXL0m6pAQb3hzkKWnH/6nvqhadGB7fhaSwYmqv9FuKh9hzjp9PsfT0Jv89Vw
	 ceTeYqNH8QmUTkllFUhCvfEqbVUEM+KO18guOD7YBO4hmphtjTbQ16WSi6CCT3q+w9FoI
	 pTFvxsxwgLDfQ0GOrSMDAq6K0H9AGnb0q+GTa6HjOt8QhP8DjoXLM1CRcQqeS/+zA9mlV
	 u7ZlyGTH5P0BBTQPMqm7TRRuEkN6tQmosLKPmG5krhzfa3YL7L4NWGqqyFlgg4lagLbkD
	 Rp0HCQTq2Gm5kK4SesuXYcLH5Un81ljc2uDKqo4z53U2mQmrF+v7Dlx+O7bsd9sjv5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fb2KX2wd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtZCG2fg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C63C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C63C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fb2KX2wd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtZCG2fg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tPWR3515868
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AomCtOWxOdmlR0sUoqk220RU7FjG0HPHL1G9AKXfbu4=; b=fb2KX2wdfJiGUbio
	yo0qBEH0nfT476LGmDRJqeyj27F88zaeuEPSAD6EICAl73s5DeOo3s5UHciGejLg
	p3yD6JpZxhTa7M0WWrPWx7ZAOJnznldjCpmo1hjJQ1W5zewJVvGuyXaEgDsi9SFw
	UPVhOjYbBJuutWRklCfXt+pMJsiGFXkwQaQuE702RFtZrkaSWNFl4szxoq6dfQGu
	A33evsCYMxR5lTxjRVkASgxaiS/WvblIFxI8B5jujsZ1SsdMY1WwSDQwQkLYmORJ
	hPDiRuitXJdbNAcK3ruijNkKV7F60gczmbNv2LrN9s4PBZUpe6ZFpF3tJb6RYwV5
	vwcu8w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b31ke7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:25:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1496157eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794367527; x=1794972327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AomCtOWxOdmlR0sUoqk220RU7FjG0HPHL1G9AKXfbu4=;
        b=OtZCG2fgn0UcbGMApCWXw0tou4eHe2j6hlP58WEU6Z6wZjWWPnvwyONvVzI6S6yFdb
         IaHPdVDsPAGb7dU68pZF9PaOW2feDML2JdORWPmVszLzyu4DIzbO01pXxc7IACK0tYVg
         nP/ZBka405mEoo3xftdNu5Bb0bbvJ/l3z95HwxZTV5D789IlO82/x+aGew5JcbjzUVPC
         s+neuq9zCHPCGvJSE+Z20tdKVaPMvMCbifPquuLl/6MG+BAzZW/qOtNbHhe7jllL4Cg+
         J2vkW/XBXFOnon0CTZIifuk2pceP+GHWPUIrzmz7lYyexq+pWiaUP441ourHC35XqpQZ
         0Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367527; x=1794972327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AomCtOWxOdmlR0sUoqk220RU7FjG0HPHL1G9AKXfbu4=;
        b=XKcnjQ+FmTuuzX80iCBcbT+IhZ9qErpzr036mpnz3LkcuoJ94GAUugyMPiD7tVGYzW
         ZalCVLvEQK/KjhGTJX1u3QJZ0jQ1MIg1oLWlJtN16dDpOoKQBHbV+r9WqszpRq80YOxG
         24xBWPvWgSB0gCMrGUNCHSZrq835Rk8GhbtgEZGZ65WOgGaSIsf6CJPCgDKnkdHHCHZZ
         H39jp5mdXtEmRmACXplSWddIya4rnJoMqo5+PglV9th5yp63N1FJk3U0HKU5E+MsIOvo
         LQLVjjCWvxECZzapq2+dFBYxHU+u9Au+y5WtCK8EIq+LojRMidYQa5D0xPpA4MKKct32
         masw==
X-Forwarded-Encrypted: i=1; AL+hErGaWbjNwxbkXwrOlFN7XO0nNutVrGXE7kjYwiy99UD+vWbhHgau63+T3hqptyZ/ywL7JNdjKzfM+oppvgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gDJDQ7uGLXIiGDR3fILFwdBx9jzIpoIRCTRzbJRx/e6w7btoA
	m5WvKBaQLX99mrownDAw1pq9NRcTJkrLdjZd/FM6BJWArseinJNOihJCNSEEPQSK5WIJqRB9Pei
	b6bUgGfNNwT2yG8/WMfRoIgR6YYyL7KVyImvB8+b2ALTXBlH0SjBi1ZWJAdfeeNJSYXE=
X-Gm-Gg: AYBFou3RS4Zh2WTyb+8Bjv27vzw0pzZ+Qw874BKRd1u+VoopMV6YO31fFjjd5S/kNRp
	xue3T/Ab8GJKPltyoaPXDS4nHAcjIl4NqVLuTzRj4aiT0JPlvcn2XrHnj9rGqkrCs5T6EohpYFb
	sUkdCJ6snfp/IVLfCqsiWhiu42UX6hEB50eZo3n1reqRQXILCQ7udIiZ3oLAaMvWsak74JrEGwa
	Z3riP4hNllU/DiFzV8BFWyTdPU9DMHQwYPgf7Fz/Y0I8M4KyIqUPfmVqeiMAfkLfuPTI3irjHKP
	ieoMN+yx/1iLdrD6Os7DU3QA8lwgU+o1zmbklI/+bJlLRci4Xjgn5nmpwuoQsa9NUA8e3Zw7G1w
	MFQVgL0r63lOT9jb8Cpexp5aGE0SSaiCdRJKJi83QxsI+/3KqFxfiLnKay9wNOAyWGm68iFyT1Z
	lB6eco
X-Received: by 2002:a05:7301:77c7:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-376ce6aa7b1mr857765eec.36.1794367526773;
        Tue, 10 Nov 2026 19:25:26 -0800 (PST)
X-Received: by 2002:a05:7301:77c7:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-376ce6aa7b1mr857749eec.36.1794367526185;
        Tue, 10 Nov 2026 19:25:26 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm12427852eec.21.2026.11.10.19.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 19:25:25 -0800 (PST)
Message-ID: <6eda82b7-c617-fdbb-9fe8-adb0f1206acd@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 08:55:19 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/5] media: iris: Fix use-after-free on unbind with
 open sessions
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
        stable@vger.kernel.org
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
 <20261110-iris-handle-unbind-v2-3-86d5f6f1dea8@oss.qualcomm.com>
 <ee2aedde-6688-4cfd-9f92-3703b081247d@linaro.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <ee2aedde-6688-4cfd-9f92-3703b081247d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af3e027 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OCzWoR2KFpuGU18DyrAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX8Bg9Xrc89FkB
 CNW9tNWQrlIW+yZB9oIdRb8Vo4wQEHq8TxFFmyChb1lMFdRAvZmvKmKxrbreZf33AtHQgZ5Gm7g
 bcJzESvKuKqZjLlwYc3wQsC/NjuBRWkBmgX/doybh2Ud6vsQAgXuYKpTyncuYhunZg0KoXN30oG
 XwI+/g2al1ip9YlsB9CxrWMoKeR0rMBQrGZUVcmuoxPx3oEJbYYDWXOXOK5GAv3c5cravPl/ZzZ
 zmEND84yWcSuRfG9tOQl6i1SCeEFZQWdLUEk+4f8zNsTsDxR0XjvcNwTktAqh5xqTbVQJwgkzGp
 UjfDUL40UhVdMwgiw2pKXfONSn8rTsGHa9X2z80/pPNEsE2Bht64uWjnj8zEdbJ17f7vj6afWY1
 SwG7NRrnR3XfkyfRql0gfzdziLlpAlsezqYK3KIpfw3+PBPZRljBoByWsM5JL5OK32U3yXNo23t
 Mk+X5QN+f9KrcCBNKow==
X-Proofpoint-GUID: umaHHaIbD7xxsu0FAILiAxHUYceTpsVw
X-Proofpoint-ORIG-GUID: umaHHaIbD7xxsu0FAILiAxHUYceTpsVw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX+/y0GRjJZXrn
 bE+Wl9o9O0fpe44dYpQuxgsmOSrS6FYjaMnrfAEw70lJihYX6od0B0YAcmk5O2enkq7+xCm3Khi
 fExXoVTd4BXFo0EftSg4eLKsvEvhG28=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110013


On 11/10/2026 8:12 PM, Bryan O'Donoghue wrote:
> On 10/11/2026 14:09, Vishnu Reddy wrote:
>> The driver can be unbound through sysfs while a client has a video
>> session open. The core is devm allocated and freed when remove()
>> returns, so the open sessions then use freed memory.
>>
>> Only the core structure needs to outlive remove(), because it is the
>> only thing the file operations of an open session still use. Allocate
>> it with kzalloc and tie it to the reference count of its v4l2_device,
>> which every registered video device holds. It is freed when the last
>> file descriptor is closed. The other devm resources (register mapping,
>> response packet, clocks, power domains, interconnects) are only used by
>> the power on/off sequence, the clock and bandwidth votes and the
>> interrupt handler. All of them are released with the unbind, after the
>> core is shut down.
>>
>> To make sure nothing uses them afterwards, set a removing flag at the
>> start of iris_remove(). It makes core init, new sessions, command
>> writes and the clock and interconnect votes fail with -ENODEV, so a
>> client still holding a file descriptor cannot power the hardware on or
>> vote for resources that are gone. A client waiting for the firmware
>> only times out and returns an error without touching them. Runtime PM
>> is also disabled explicitly in iris_remove() instead of with devm,
>> because its callbacks use the core.
>>
>> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
>> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
>> Closes: https://lore.kernel.org/all/20260926064921.976721F000FF@smtp.kernel.org
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_core.c      | 10 +++++-
>>   drivers/media/platform/qcom/iris/iris_core.h      |  2 ++
>>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 15 +++++++-
>>   drivers/media/platform/qcom/iris/iris_power.c     | 13 +++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c     | 44 ++++++++++++++++++-----
>>   drivers/media/platform/qcom/iris/iris_vidc.c      |  3 ++
>>   6 files changed, 76 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.c
>> b/drivers/media/platform/qcom/iris/iris_core.c
>> index d558475986ff0..bdac6b8c98e44 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.c
>> +++ b/drivers/media/platform/qcom/iris/iris_core.c
>> @@ -43,7 +43,10 @@ static int iris_wait_for_system_response(struct iris_core
>> *core)
>>       ret = wait_for_completion_timeout(&core->core_init_done,
>>                         msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>>       if (!ret) {
>> -        core->state = IRIS_CORE_ERROR;
>> +        mutex_lock(&core->lock);
>> +        if (!core->removing)
>> +            core->state = IRIS_CORE_ERROR;
>> +        mutex_unlock(&core->lock);
>>           return -ETIMEDOUT;
>>       }
>>   @@ -56,6 +59,11 @@ int iris_core_init(struct iris_core *core)
>>       int ret;
>>         mutex_lock(&core->lock);
>> +    if (core->removing) {
>> +        ret = -ENODEV;
>> +        goto exit;
>> +    }
>> +
>>       if (core->state == IRIS_CORE_INIT) {
>>           ret = 0;
>>           goto exit;
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h
>> b/drivers/media/platform/qcom/iris/iris_core.h
>> index 3e4cf652bf39a..379f0666a42cb 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -62,6 +62,7 @@ struct qcom_ubwc_cfg_data;
>>    * @iris_firmware_desc: a pointer to the firmware-specific descriptive data
>>    * @ubwc_cfg: UBWC configuration for the platform
>>    * @state: current state of core
>> + * @removing: set when driver removal starts, blocks core init and resource
>> votes
>>    * @iface_q_table_daddr: device address for interface queue table memory
>>    * @sfr_daddr: device address for SFR (Sub System Failure Reason) register
>> memory
>>    * @iface_q_table_vaddr: virtual address for interface queue table memory
>> @@ -108,6 +109,7 @@ struct iris_core {
>>       const struct iris_firmware_desc        *iris_firmware_desc;
>>       const struct qcom_ubwc_cfg_data        *ubwc_cfg;
>>       enum iris_core_state            state;
>> +    bool                    removing;
>>       dma_addr_t                iface_q_table_daddr;
>>       dma_addr_t                sfr_daddr;
>>       void                    *iface_q_table_vaddr;
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> index 545bbe75e1740..e0cfa5107d1d9 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> @@ -128,13 +128,26 @@ int iris_hfi_queue_cmd_write_locked(struct iris_core
>> *core, void *pkt, u32 pkt_s
>>     int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32
>> pkt_size)
>>   {
>> -    int ret;
>> +    int ret = 0;
>> +
>> +    mutex_lock(&core->lock);
>> +    if (core->removing)
>> +        ret = -ENODEV;
>> +    mutex_unlock(&core->lock);
>> +    if (ret)
>> +        return ret;
>>         ret = pm_runtime_resume_and_get(core->dev);
>>       if (ret < 0)
>>           return ret;
>>         mutex_lock(&core->lock);
>> +    if (core->removing) {
>> +        mutex_unlock(&core->lock);
>> +        ret = -ENODEV;
>> +        goto exit;
>> +    }
>> +
>
> This locking scheme is looks racy, what's the point of this granularity ?

The first check is an early reject when removal is already in progress.
The second re-validates the state after resume, since iris_remove() can
start while pm_runtime_resume_and_get() is in progress. Without the second
check, a command could be issued after teardown has started. Also, core->lock
cannot be held across the entire function because iris_resume() also acquires
core->lock.

>
> ---
> bod
