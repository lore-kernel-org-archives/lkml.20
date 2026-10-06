Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A568B3C1088
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330818; cv=none; b=kgnxKH5OqEhNiPMu5UlNR06on5hcxYPeyemU+ezY7lyQ28oo5qOIAFMOeC5MPIvGKMw92UvmLKujamdzRjfWdnMeJl9L7lVKEu+KnB4cLaYlxtx6QyEsu6K6PwTTAZa7M8hRy5G9N/HmZzD9Ldk9CeztzzS1/P9/HxpvFxKYUFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330818; c=relaxed/simple;
	bh=xf167AZzu0nvnTcAX1Xw8R4tyYv+cUzmt2UzRs7bslQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imh5BvVqMqAiyPy6GhtAyteTRL/AFMK724QKMeZ+LaIQmQbZQguO10WXtDOjVW21aDKO1VTmbjOqaCNuPF/fJrwGGZLSxI6Fv2SNL/YwQGlhksIQd13dN7hFIZ/89F28LiLH3UHbj+qmunixmonnSg1XarD3tNlSCcQKw7Teh3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkiWrAzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+z66KUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkiWrAzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+z66KUC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeUEl2049528
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 23:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFp8HdaEfTURv3yOkfDgaxZg9EFYUbB/frsyn4UIA0o=; b=KkiWrAzXJ0cWLYsj
	DWrvvW6RLnt3U7oadPNWuvLNs4UbwqMb8BQRas/iqGSO8pxrAF8kzD78d5B/Ltuk
	oL8+9fqfkFcty1hY9Sg3iWS91ESxCx0tej2TAhoUoFuc3sHOIIl8aQ1MheovAUDh
	Ax+ArVACEAlkOwleqh9YCYjDEMAJVoRkh055+d1JSzoE82U6W5dLfau66blM+hDn
	mvaOsS6YbEjCM7ZzId1oG2s4lfaaKPqi2I8pRFwKPcnzGrBTYgNCoa1dj3G5yCow
	XcDAkZGhMgqdjV5tWVaZdkm10tuBqqhsJ6tOMhtTQB1mtx9eIq2a4CBou4P8WPmT
	ErMHKg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54621pyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:53:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510a481ae9so6564300eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791330815; x=1791935615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFp8HdaEfTURv3yOkfDgaxZg9EFYUbB/frsyn4UIA0o=;
        b=P+z66KUCVaVdG46mJGBGEu5X1yP6CIlTB8KEhhLufX14Vq7SkRLBU2EDXVLBwUYMq8
         DT4ZlSb+O0gjvnQuJVTqr4elpS7JLns8f4erz8+90Pt3qshRCZyJLYBRU2bhj+B4lQJ+
         kAZc/fpIDQkNysIfNDXB+pYt0JQs4ucgyzROgdPkkW3S6NHMxQv/rwtmYntJsmtUj5a6
         FmgcIw0sABG9S5SPYl+cmyobYtVz7Pbq5hLlFfDtK9ZsOSTG58/mC5yJxwMNOGrVH+P8
         gFfRH+iLRUOKmVScQAd5L95o8iuYnbK17LE/7JW+krkqqovmURmRWD6ZVrr49YEvuGtz
         Mz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330815; x=1791935615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFp8HdaEfTURv3yOkfDgaxZg9EFYUbB/frsyn4UIA0o=;
        b=z834ZmU8alt6vG9CmTsp86kxxLjl9XsoyQEZghkYRmcIiuccReRRYYE0mjGYmz6xE1
         d9dlRvXaD8l2CbCPMHhQSLVVbzOiHvsAoXAYcGmK3zDIzUIIuR44SrJC9daIqxitgLEM
         SJb9trT/f5M7ovS8WZDCvfdnxJh+o9sklXokuEURFraFJVpd2c1fUoSzusFw5JptEbxT
         t0dJy40uf2QdtQA6j/bZRPXHjwo8mKKVdqBQpmWgC+ylaYnS/9ZD0ztinQ5j8yLjTHkI
         QWWf41aCoDEbtaeyrF1xOkaW5Qjz2pkOZAN2hf76OpfZusPeXNu9KXh/hs1MGEI8xzTB
         vAvQ==
X-Forwarded-Encrypted: i=1; AKwUvByO4k+khtaxUcL0EVxIAa/uAf1F/t3brCP3vqELydBfqcfiSoFyavA/+Ffdf2nsDk7Od9gHAYleJs3Pa5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJForI/82qRj8z5Kisdnjvk+veufCLTajK4fD+ojNbW0tTH7W5z
	xl98ovdi0AdYOzQ7V2EABrSbA+ViTPJKJkc+BugeA80zAPS+kB9sAKbL5IUogxYvZfHSuCIve0s
	he8YW6qQhcO4R5tza+ilFsWGiZ/buOLSSQQ5/y/wlf02I/UnE/czYThBwI2PGnmzhRUI=
X-Gm-Gg: AYBFou18W0rf3ez2n9nCfNmXgPxuQI8+olAZ1ps6B/MGLnTHE3xIzajWzkRVdRNYIJL
	ogsWGeXxGwGHHyslfxo6KFYlgGU6c3hW8IErageh0B6h+U69g8xlGAFtBZBJ26+mHhCuCPzuahb
	0LNO6EezhoPDZj/JfJ8iZ6rRV9pXNo9yaq0YgcFeEL+WAoHSYkR+0IVWCV4XUR3OAY1oNpI2yGh
	jEE0Ai9MpJOueaQCKuWxeawvCi9Md2GFPR/aUaV02rOUgrPZSR+19VTnkxOipnek/wsGb6GDcuu
	EAsghR9x7d4e/HfLRI0kbKnsT0Vk+ZqcN6Bso6fDcP1Ep36sEYEIvQQrk928hzLMXTwzLmITx/v
	U+MFV8zrKJScK2h8SCfhggaLQpmNoIBj8ZpIsItjS0k6e27RPLJnkL6b6paxJ/JM=
X-Received: by 2002:a05:7300:e5cb:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3515d86f096mr371874eec.3.1791330815313;
        Tue, 06 Oct 2026 16:53:35 -0700 (PDT)
X-Received: by 2002:a05:7300:e5cb:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3515d86f096mr371852eec.3.1791330814702;
        Tue, 06 Oct 2026 16:53:34 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afa61e8sm1972503eec.22.2026.10.06.16.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:53:34 -0700 (PDT)
Message-ID: <4ed3f09f-74fc-4f07-8897-5c773fbde0b2@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 16:53:33 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, axboe@kernel.dk, rostedt@goodmis.org,
        mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <ar3yt8Kl3WUV93lP@google.com>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <ar3yt8Kl3WUV93lP@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4kcr0rcn3gtPjp7nya7EhZM9BPHOwh2l
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac58a00 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=9kMCAbyDuj7LhItxiaIA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfXwsEsxi2G6Nxv
 3h9nxHPnSNB3W5Ub9O54wF5VpABOOGhfPBpWi4uJVyvI7RJbJbtAHG0iK8/iPOTuqorPUmeulEN
 V6bPZxTAVdNN2Z0zy2GfAzu9PpBtLZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfXw/H+XrCc/m9R
 lh66Ui7oYnbUrhPEL8KLy8v80aF+XLgxo6PWZ26ORWjWdb6okgyoE2ve5clQgHtWVEEZeCIFYad
 SUMJCgKAKUrB48/9S7HH3aP1drQ0nHKNPcf3BojdKe5XeMcF7UwQnhEHtajZVFxOw8kEJ2NkTbo
 W17+O60ldCWayl0WmZyRsdA8vr4H+NzEJ9FRmK8+QCxeF8/6K2Ucb/UtEME+fRFKLJUMhoD7VCC
 wgt50Kj3nIFoUFD7pB+ffQQDBJ9GJH5+o8nCndgc+JLYAtqwwpJxcnNXwM68q7Hb9nihup9HR19
 mbw4ixXg3oyRg7hCyNMXM33bPNQM4HhgYvxjcMyxeiVYW2jaO4vLDfrnhFJFBZYEZAerSmhK2Ef
 UcVRP/cjorb55wcfsBqwhnNRpTeCzKA/VVMOrUTZsnQ75L7thKgN14J3pUXfS2Nvlk0Uc/r+eXZ
 g/WBGBW0paKiu1r9enQ==
X-Proofpoint-ORIG-GUID: 4kcr0rcn3gtPjp7nya7EhZM9BPHOwh2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060095

On 9/30/2026 10:43 PM, Sergey Senozhatsky wrote:
> On (26/09/30 07:52), Georgi Djakov wrote:
> [..]
>> @@ -80,10 +87,10 @@ static const struct zcomp_ops *lookup_backend_ops(const char *comp)
>>   
>>   	while (backends[i]) {
>>   		if (sysfs_streq(comp, backends[i]->name))
>> -			break;
>> +			return backends[i];
>>   		i++;
>>   	}
>> -	return backends[i];
>> +	return NULL;
>>   }
> 
> This hunk looks unrelated to the patch in question.
ACK. Will remove this.

Thanks,
Oreoluwa
