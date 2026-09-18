Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DBF521222
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761352; cv=none; b=R/3BhxO0mm4hyHV+NA1utWEkxJT3sLOKn+B6VrpF7PxBqPI3jupoOEGCWjxF5MnslgOTICJdLkO8tVIEsxCfTzAoK/KNR1yjAYMLLa6K9aEo+FaF3ri/BMcFhK2EvYJJOdUWfbFvGiGzkxhiAlmpuSTDQj0GbaUQRW+AOxCfYdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761352; c=relaxed/simple;
	bh=YMWjy8npfAa+E/wV3UL2YF8bCyiSn5obCw72+KqphjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MiBEz40hztctkZl3kkywxYP8REQ96Za2ZHkXUSYJgyAVJPUPKfGi2JF9opbii1VM0T573S7aHktNjiSZ8qGuwNJdItJXT2bxWUk6ab3RsnNi6+Hj9cM/koiltrvJEL3YBazGNXvjTUpbLx+o17ROoOMNy4PzZ84AUiphJO6EuKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvNY4cmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOwZmkLz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvNY4cmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOwZmkLz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IGoFFL4103568
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdBIY0uUQqeSgElDaNwdALJQD/ybwZDrWoGNgtgXY68=; b=OvNY4cmxvVfPVYZI
	Je7//cTN1kMWGH18ml4TfkNLffwmAh237zpuYJ+qHuLZPDmyWoLpvfcKn/tvsp0H
	tjZaK8+9fWKk4qFQpHAX2nkebRM3bFr279n2KGr39TjS+5PaOiC1EKzNUiJ4diVU
	OATphmxCIeWSmvxhTbrBFv8hhZF+n4/isG6v6weAizv92WbwXRJ7NtVGOlgZWsnD
	5u/i6Gg+RSKJxEZCt5/daH9ggQNamFbe3PqNbh3yDejIR78JDSUWQhchpxQDE2bl
	Ij11X0NWOoFp5rNzhFDco8nmgc0ntb8VLyKCVnzzoPWfeTpVYpYBH3lmsNnfth9o
	hDUcgg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37djccd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:55:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso1875363a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789761349; x=1790366149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdBIY0uUQqeSgElDaNwdALJQD/ybwZDrWoGNgtgXY68=;
        b=gOwZmkLzVX92DOBvSYfGxklsPMy0owXT2B+RR8Zp1wOQvqu0LFfpMauZ2FikxCJ5Zs
         KhBLaQGZV+ULP1tZFuEy4UAB97uZgJybfImrCaVEkrBU+2XDKKS0sk94JGmI+n1E+tn2
         +kc9MATZHvvm1o+bvkav6L0r40cIh9QYdX3vRQfiZh4+uyokEqOVBq0FrPrhIl+svhe+
         f0PGcl9SFsX+VBVYlHJOdxczbkVJp5Q2XBp64G7sTFD7EMn8nlGNM6yWCH0HVwPG3Nak
         hkdkaIwusmvMkEcrou2CuNJ4/TAIIF3meoT8ZY5mhM1GXXhvCmOOSyocBYHt3F+Wo9Tr
         YeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789761349; x=1790366149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdBIY0uUQqeSgElDaNwdALJQD/ybwZDrWoGNgtgXY68=;
        b=TpmBwI+iy975685UDF7QcQbHim+VgvWVH+paa0BKsxQrCPEQVGoUZ9NGA/2VS7wVvZ
         BxAsDnb/pxCwsISToWz/u5BxuVHthzKuotXSpzsT5kLmenSkG99MKza6kD9NTgOHGZdZ
         5JJ0OOx+WLf4XJaOPKBvuQziFjVVcGQNHAEx8gcpbmJqMSbGvXtTjdi3zlypB0tyL+ra
         tmvA4q8leUFMCHlm2L4Dpo5kyNZdqhmUHuP+V0hXsY+NehR7UZ0XF31xiypYzAc/PaC8
         mfGDQlXW0rpSWhClXXyU7oanDdiRV6YmMxviXoboRWIgm3z/uTiD0qPAjUv6UlzdbNL3
         beEA==
X-Forwarded-Encrypted: i=1; AKwUvBwUB5xOkH4LRgIRCZbEVhCupUdGN7XzNFGsy21VRYK6eUFV/YlbjZQ2YG0dbOT7rzFqdl0xOhuUFUpSRxI=@vger.kernel.org
X-Gm-Message-State: AFuF++lA6auXnu40IV19cw2kVXSLf0e8GPiGa4d9fscC7OsLTGZko//H
	VALplGyt/rujJVBfQ/jhTS6HnG01jZTSrTDZQQK3xRLGw4wC6VUIYkViT4I7gjp6p75dMqLQWNh
	zalR8Mjb2G4m/0lgim4knsZPOKoFrwJp6SOAz+YziM0C5TBbqcscUDygk1NbpP/56qp3bo4TCYM
	4=
X-Gm-Gg: AYBFou1lLqTSUr5SkCiW7yaaj6wiaCLGv1Eawv+3zpLUYK9IsEta9JcwJC9rSbYJdmD
	OS9rSgewkKrH6qVM/7PUY8QC+B5rl5/9OOl0lwceEBoPg5SBh4XNNXgHGFY56O0MBMAcpjGHpjG
	pd8rHLlfcTL3oLAivO23yztDG94G75jIo0hrLnVSsAsSpBNKSAuYDVojSr095sB9OxM2Nsb8nx8
	O8AEom6ZtITYFrCLRGLytk1Vcwd/MqM3KusHJ8T1JjEInww/1qDi0YjAlgMupOMnJB9Y0JMmIz9
	O/ObROq7Nf9NFERBT9AVOW7db2GPXMI2WSiZaTUpRcku9QBSzsz40B0U+IqAZ5ZKpNuUpwB3uQC
	nt54xsLiu3FHvb5STfM/5zCOcfOvYYfeFxNAuK5gZE6bzIYGj6Ca2tN2xtQ==
X-Received: by 2002:a17:90b:4cc3:b0:39e:6a7f:eeee with SMTP id 98e67ed59e1d1-39e6a7ff08amr2505543a91.19.1789761349487;
        Fri, 18 Sep 2026 12:55:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc3:b0:39e:6a7f:eeee with SMTP id 98e67ed59e1d1-39e6a7ff08amr2505480a91.19.1789761348865;
        Fri, 18 Sep 2026 12:55:48 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54af4d5sm789458c88.2.2026.09.18.12.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 12:55:48 -0700 (PDT)
Message-ID: <8420a701-1cd6-442d-8a24-d10d2013b998@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:55:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath9k: reject short WMI command responses
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260814075837.20005-1-pengpeng@iscas.ac.cn>
 <8c2dbacf-63ec-428c-b283-50198579cb89@oss.qualcomm.com>
 <87cxucuugu.fsf@toke.dk>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <87cxucuugu.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI4NyBTYWx0ZWRfX6L5/OsmheZUB
 aKCwal+6UMSDYGuE4Aj0n5sPmZXn8f9BnJMpMKSuWU1ogivCqcVlMD0LEOa22ycnTuc4itwKn8k
 sUxGTJqGPbGPQDegv4bU90JieAQz7d4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI4NyBTYWx0ZWRfX3ZGs1zyZ67lN
 3mWOdY0W/5gQCEW2yEuDarva519fnYfpvbfPGFIzWLVn6IvIfo6uFy3qE9kmqZKojexF6/iLoVA
 9RlrSrbUaAqcDu4XQ9jqrsxt8IDWiZpVAkN9gjco9Qa68s1Fbb9aez4v61CBUPLmu195x5jQ7za
 HhxTh3IB3GxU//Q7PIc9yiDgjp9K5KhnSyjXYft/teRjsmn3WnEsqVQnm2i5idxdLINeCmqVmDK
 /yxgdra6g2TiKWHFQY7NIs9IRLjX+H8VduXdD2A0Euh7uj42ezTxWCWou+Qm7XvzjFGPejv7Bgk
 y8F2djUI8C7BLTtid1R+AE/SnoX1dCsh/VY39bgTA/Ld1vPPB/DrJV0TOXWPOYxx5IVCVNJ0fp8
 SWYrJOj6U3wtQOUVJNg3C0vCNyQNWE/73IJbTjWfS/0Q/zLaD6EzrcCAay9yKROEVKNnzLm2jA6
 lsmvaQCJdetSvIOSjcA==
X-Proofpoint-GUID: qDBr-8QJ7YJ7aC3eOsd_p5OOsdF_QgAJ
X-Proofpoint-ORIG-GUID: qDBr-8QJ7YJ7aC3eOsd_p5OOsdF_QgAJ
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad9746 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VskdBMQvDhfuwUIC9LkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180287

On 9/17/2026 1:56 AM, Toke Høiland-Jørgensen wrote:
> Jeff Johnson <jeff.johnson@oss.qualcomm.com> writes:
> 
>> On 8/14/2026 12:58 AM, Pengpeng Hou wrote:
>>> ath9k_wmi_rsp_callback() removes the validated WMI header and copies
>>> the number of bytes expected by the waiting command into its response
>>> buffer. A device response shorter than that expectation can therefore
>>> be read beyond the skb payload.
>>>
>>> Record -EMSGSIZE for a short response, complete the waiter, and return
>>> the stored status from the command path. This also prevents callers from
>>> consuming stale response bytes as a successful reply.
>>>
>>> Fixes: fb9987d0f748 ("ath9k_htc: Support for AR9271 chipset.")
>>> Assisted-by: Codex:gpt-5
>>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>>> ---
>>> Changes since v1: https://lore.kernel.org/all/20260704011405.55089-1-pengpeng@iscas.ac.cn/
>>> - return a stored response error to the waiting command
>>> - retain acceptance of replies longer than the requested prefix
>>> - recheck callback synchronization under the existing WMI lock
>>>
>>> The WMI callback and waiter synchronization were reviewed statically; no
>>> ath9k firmware fault injection was performed.
>>>
>>>  drivers/net/wireless/ath/ath9k/wmi.c | 17 +++++++++++++++--
>>>  drivers/net/wireless/ath/ath9k/wmi.h |  1 +
>>>  2 files changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
>>> index 284e8c13b043..06d9975f9717 100644
>>> --- a/drivers/net/wireless/ath/ath9k/wmi.c
>>> +++ b/drivers/net/wireless/ath/ath9k/wmi.c
>>> @@ -206,8 +206,16 @@ static void ath9k_wmi_rsp_callback(struct wmi *wmi, struct sk_buff *skb)
>>>  {
>>>  	skb_pull(skb, sizeof(struct wmi_cmd_hdr));
>>>  
>>> -	if (wmi->cmd_rsp_buf != NULL && wmi->cmd_rsp_len != 0)
>>> +	if (wmi->cmd_rsp_buf && wmi->cmd_rsp_len) {
>>> +		if (skb->len < wmi->cmd_rsp_len) {
>>> +			wmi->cmd_rsp_status = -EMSGSIZE;
>>
>> my review agent notes that if this path is taken that there is no debug
>> message alerting this. see my suggestion on dealing with this below...
> 
> I think you're being pedantic here. I'm pretty sure there's no real
> hardware that does this; merging this is meant to protect against a
> USB device pretending to be an ath9k_htc and trying to exploit the
> kernel. So I think it's fine to merge as-is.
And I'm fine with that.

/jeff
