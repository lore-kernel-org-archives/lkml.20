Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C9B2571A9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143547; cv=none; b=u3pZ0/uRXOIkiffGXnOosiirtembj3OGCOS1cDjks2cULJZ5R4TaxYO4s6w+s9plrq3+L8wBXXkZV5GoWwCSbecJa/ArNZIbRdp76z2JQCfOOxyIpOt4CR3jcE4EoD4SmtxRsJBtRyqg452qJmAKi6M7B2PuxUV5Su7YlG1EaTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143547; c=relaxed/simple;
	bh=d+rXx3ryMS6H5qJLQveUmLfiQkANkRc6ykJIp1ZlrPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZ1jjxegtrT9rLGZfbaDoWefDICtPUaJFoasj+P0q9mp5nNJ8Yyk6NWl2sV/9rWFyOZsDvb67ZNr1ztLrcH9oUn3sDnui/dEFqn7Q0aa3DPpPK0DDTU1hCRdMr3lL93jrfW0wECDcguXo0pyqBQnZ6bBZrzN839rHNCtl1LqWwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQQsj3eD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsAp4/un; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQQsj3eD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsAp4/un"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iKbl3250347
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mp4QIRtSu1M/C1bdEc3SYE7h//9PsiDKc6JNmxteTMQ=; b=KQQsj3eD6lZ0ciij
	Ep7JqXJgTY3DbRPg5QTDL7NZ49NQitdDQL2LZF91rb4HMPFmzxiszAx6rpvuT7nP
	w8Iqo/HIvzi7fugctEDMTnAI/uqYNZKHsDdhvtLyaV4c/+W6jWiI8wVPTRh/z1sx
	KsnIYwVLhMBx+QMjAY6ayGMhiUL2kQ5zZ2gCUIXZM40xzdrEI3KqJw36JWvNdEwC
	w9VN1pYSc0DwUqJ0zWrw0W5Gz5OKLUCSxJXxvRDanf0oURChtO+eEJ1TK2NhPj1t
	3OzyPdaoCuohGzSydayRlmukuzXWjdb1eO7V+2tVTRx0gYpCjiiTU0GoGkFky5TG
	g+0k4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c2r50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:05:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a05d645acso138267585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790143544; x=1790748344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mp4QIRtSu1M/C1bdEc3SYE7h//9PsiDKc6JNmxteTMQ=;
        b=OsAp4/unBeBzzz21RHjfwl0amnn1JHLNxnO6sz+MxHk+BBCl7MD6pU3q7mVlkcUVqE
         0/thXdxQqWS235i2saO+N5SGGqDf4AZgMB/lxEk2jWXicjmSFs5wZ4FJHQ8j/02bXVhE
         KGgjYlHOpkm13ijK39X8UH5TFz1B03NychCw5B10JxSxmXCflTUrJ97djEgVyRmLCsic
         RuLOIUH8bT0WRgcZCAUitXcdnA6Ca2+lvFylaOu8R86gBDRFpfk81Wtd5EQPTVHvh75H
         zsAgSwqwkP2vPvSuOX0pZyhG0jumVYodJeRlFbPwaj5PaZEeRY2FbwcJJNY8jYkMPT+b
         5mVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143544; x=1790748344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mp4QIRtSu1M/C1bdEc3SYE7h//9PsiDKc6JNmxteTMQ=;
        b=bBzKT0PEv7Ahtgl0jG1J22iH3MXQ2Zpxhq6DZsTEhSxvcUECIO4G2bzo3ZPKO934Im
         5lLvGXWDYJhnRo0pOK+f6HWnhyj5OrXYIFJGi/EiMkAN0cKUmBkbnpmce3KvjMKHTHvN
         UuMevAlMlDXNOSIqideTU12fBKiOrXN2oo4ga7Q9bLiWd9bN1zs0L3DHUr+/kcFdmg7D
         Cra1A7yj6vKwM3kmtlfYSnP35NNAH9pLgxP8/n3+rAX3YoHI2/Aqk6STHB4FFdfd1ATj
         +ASRfOSHM/mao/7I2f4EYKMVqExnPs8HRQFu2sygATfkCI2NDNf+tK/fpY5jlHBoeOjv
         3zJQ==
X-Forwarded-Encrypted: i=1; AKwUvByBjOmShDmnqxjIfbXimUmCKnyGqezPQjIAtAsJ+btQQ1ZDd50ra5KAzN0G8sZlKRR/wQmKWOeQ3V3bccQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mTJHHr1MmayovQDVssvy0Ft17QvY0XmOcqBpN8UuiqRkQjwFeK
	Wq4Wwy62LFIulNYxTyX397xJxLqGkDRF9/b+ZYR/QCT3aHrhE7UJm1kWgxfIATvqlGLkJqM5HzZ
	pDYywWAE243nL+lWDqGEPz5Ufg2ixvK1HyR3FFDccPRKGvafd69B2jkFIT4NSfJmmnJo=
X-Gm-Gg: AYBFou3vvrSIpAoXOlAJpqT0r3+H6tkWX54GgxjJvFqxUBOQzwoQPRPb0mMe2NeTNmE
	VEq87+NXtuSGhMPl+EK9KEgkg2q7PP2Whyn24vGUz65oSRybrHtPd3CfAuoHW1HNjANwkzu/zFP
	EHZINzfr9fNE6p1bidpyGV1CNlm5sCmGMnWWIVeWGX2uxrRbCRIVAKqoxwrHjdYimyQ1jMcPJIP
	t4nCzMN9SD3XTlLRjB9hqS0z3DEADsTM8j0VZYGKsTj0i2KaIkJaYMem22lL2U7MNtGxpjyKEVF
	a7vVs87lrqPV5X3alskNp9a7vWb5rBK+ZYhtxrLnxDXVYftXzjqS9a36TzmLWQ4RgidQs/Nbt8c
	kx9cmyHTaWb8VyHRa8nZbjQ==
X-Received: by 2002:a05:620a:410d:b0:93b:d79b:9a5e with SMTP id af79cd13be357-93c2524bbabmr244270085a.63.1790143544582;
        Tue, 22 Sep 2026 23:05:44 -0700 (PDT)
X-Received: by 2002:a05:620a:410d:b0:93b:d79b:9a5e with SMTP id af79cd13be357-93c2524bbabmr244267385a.63.1790143544201;
        Tue, 22 Sep 2026 23:05:44 -0700 (PDT)
Received: from [10.111.131.92] ([212.136.9.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf99df60sm33095405e9.1.2026.09.22.23.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 23:05:43 -0700 (PDT)
Message-ID: <960849ac-e359-4432-a89e-88401440fd88@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 08:05:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smp: align struct __call_single_node to 8 bytes
To: Brian Cain <brian.cain@oss.qualcomm.com>, linux-kernel@vger.kernel.org
Cc: sid.manning@oss.qualcomm.com, peterz@infradead.org,
        pierrick.bouvier@oss.qualcomm.com, linux-hexagon@vger.kernel.org,
        paulmck@kernel.org, Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>
References: <20260906023905.2517725-1-brian.cain@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260906023905.2517725-1-brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfX+PRIWS/xtVv/
 UM8wzBYoCOlj2lNgpNLaS7AsQATBqyIlqBqSOKyafJuJm/1aoZjQ0Rk4o4El6+jCxPzl3m7jclL
 JczPDHuDuHSKGb5sLRdtSnvotBG/qDIPFRHFYRhtZyjkc77vC1a9BmxdcTgulgKj4iyQIQ8ewmr
 5ApGwHzPJy9+s7iYyrZqcUjiBrRHJ4PXJWjBg1jpSl7bP57Ss940398c+jI9h4Fn0D3AUZYunzE
 4ZVZXJSAdwEWYdFrcwPedGmWVs/oGboYG2M3ymO8cYR+A6YQVeO1z8WOtpaEAfbLQnBFL0gOGk+
 wtuMIdvI2OiVmMafvWNRilcD2L9KH+g+oN5wenaobnkm0okDpfY07JZLcRXvDVvzieMf2MuQ1j3
 iq2luiMNj6EzthFxaYk/5WV2jZ0PQXOMeO/hfss0SbtoCbgH6wn/hSeOAnXcJDDmSvQwPI56jrn
 Q3ifSz7F0QRpqk4OSiQ==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab36c39 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=eCNQ9IFXc1d5q8r-OqYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: Jw1eUYI1qZZvKrVmWRV5no4nGNQzacJ9
X-Proofpoint-GUID: Jw1eUYI1qZZvKrVmWRV5no4nGNQzacJ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfXzxhmRB5qUzMN
 CqqsW9mzg/Zn8tVXe3oK+Ee/RZ1w6mKl2TU15hvch4HYoMcKHmmU+PLInYp/kIJHBrJY23Sd2PS
 8cDzUqOKnYhNmaSmw0Y+pD6Pz254XVM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230024

On 2026-09-06 4:39, Brian Cain wrote:
> Consumers walking call_single_queue cast each node to call_single_data_t
> and, given that type's declared over-alignment, the compiler may load
> llist.next and u_flags as one naturally aligned double word.  Embedders

"Embedders" is not easy to understand for non-native English speaker,
is it a typo? Regardless:

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> such as task_struct::wake_entry only guarantee pointer alignment, which
> faults on strict-alignment 32-bit architectures like hexagon.
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: linux-hexagon@vger.kernel.org
> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---
>   include/linux/smp_types.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
