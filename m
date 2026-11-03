Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740774;
	b=qGDe+vmkvO+I5hq19WsGyHoOLyCVF2QRtwQWPjZdopua+sCzD8+S59nu5HV8GwZ0AJfM
	 f0xXBywypbJ3Sp72uEY6JEbmEeviFDfFHPiDiPjbc3jE4rNif69jFSGSd47JbNvyVHfZI
	 2+I/FCxjtzS8Aet73SH/nH2U0EYcNhqLayPmuJvFVhR8KX7EW16FfnhdNkrXaBX6Dw3qM
	 D8SHS/fSifW9nSunQPt2+MgYMPwKLXcmVtZXtoum25C/UxMizTAPmQhrvp6YOA1hiT6Iz
	 f42/H//qMzMJMWefP5DSNPAg5m4KY1oIea4CAr28zK+3DgjYq2R36Ak2CEfz6umBXVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZkt7uS+y/UjSaYN7CfYIFrgAG4ofvw8jHIhoApP1Es=;
	b=y9NSVhmovrEPBAvDYZRcmfZEa0xOmgpQpKBiabAIewuLnyQ2VjElHfBI1QFBnF3iZlp2
	 /O0rukvdhnJZ6TkqQh9yXZuQBWM2zBS01JsZpMffuTplPoogFj/PGpeuWPEfvhRLL+rQL
	 QD+HlUky8GgWSAqb1y79QVqJZF4/3asWHWqDTN6gVNCIQoPVZJgj2o6klOI3gHq1Cq40H
	 4/zW50rWkUw3quh4VcD+k95d1hq99rMvUU7kLzfvAv5NbSaYtrO3qgxB3yHpM2QBa1+aG
	 teOSMFFmSaxaMpKAxQ4Xe6VTbd0eOZXiOkSC8DW3uCmC3M0iZcsTLbB28Ioo/QhstLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Ow2HtnhK;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=zyZKUCNi;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6EA606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6EA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Ow2HtnhK;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=zyZKUCNi
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HZ5A3077645
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 16:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=DZkt
	7uS+y/UjSaYN7CfYIFrgAG4ofvw8jHIhoApP1Es=; b=Ow2HtnhKCnyq4c0wDPZB
	GlkyPQ31VKZZjB7nN7dczKkNrut+2y3q7Eflamzbe4RgybG468jbSb1W1XlvpAuY
	1vVA9ZUkCo8RYsL0B73bhmptw1WqcpU8o8NrzJa6xDOJaQ7NnK66vxgKYZ4CF1LW
	bF2lyKIK2KLj7O758S0q2FnD3dNxMDW9JeRSgUkGx7s0pTJVs5VEnXCLLU6u8nm2
	nLfpl7aM/lrH7g5KG2McX/Tx7RHibytQJ3V/2YvmZKu0Q9gi8m231AfY+CqQX8sc
	DTeOFDe769H9hUvQ7oJYQ8wJ7cStcdh2pEciccwg+9/RNVfpYUQna5KGssCmuJ/B
	MA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hqem8vfbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:19:26 -0500 (EST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bebff9fcaso2456106d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793740765; x=1794345565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZkt7uS+y/UjSaYN7CfYIFrgAG4ofvw8jHIhoApP1Es=;
        b=zyZKUCNi/xm+FhF6tkQ6PyAHESpY6ke1QFV12aMey3h0rGyrcFenClO3ZGsBINNJyL
         7XqeSE4Qg27RQG4qpHsTmQkgV1JAVbiDTNyVi7+/EodDSBNtuoVpelMK6AFKKqOs8+7C
         eLLm3ueZ4N5AUbhE0X5KvsS8gY7wFKTEj7s3vP0DYjD84CPrwmlZwlk60J0GD9MkJnAY
         Ug/AqEcTQaQqhwbLI7nwRq7Lk4lDcbiRcZ0PRSYRg9Tm6mus8bHRqqMgKgjEuh4MDFaB
         SCPfOeswcHQF/rOYTqkMJ7kR0HMnMZznEn0pP0Qz6YIFcEwmU5gqVjEJZ37If8RL89RX
         blkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740765; x=1794345565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZkt7uS+y/UjSaYN7CfYIFrgAG4ofvw8jHIhoApP1Es=;
        b=CjN8tSE9FT67qgBws0udUnd4jnih4qKbm7YAINzE6ntYfrJFQuH9TlylYfN0DjiX/n
         vWJ/hAR8tFVW549+qmxsBw+kSThLS0R1V2VIzIH4qIbILIyDhJ6nCYk3FT05IRmwD0yX
         gV8lpOp/TQpcgdkJ12Z6fNPCb6E+05wpalv8YTGfwsrBrk+11F+3eJL9iSk67BjQzHtD
         1cW1jIB2H39aoSEiQhPd3RJ/tj3hsx6hzeo2t1tOFWsE4azaw8R3NAe+vePSTNdScYxe
         ulGhhdfNEqZATR0vG9myYcJQhhX0bkj26FNqHmmtuhXpKHcZkkcupecTtjT+svDmFt4v
         PrrA==
X-Forwarded-Encrypted: i=1; AKwUvBzDhK71qtFSJtuIY9nBVFXzfAfW8Er9Q1Qn0XIMRni4tioy7eeuoUZBxKzq1WjPLstAGAIdeiup+EHP57k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kJqcMY4z+zY5VcVT/9toFAVnXG2y/FUjC5AW4CdUkKoY9DVYj
	3H8kLnT3UDFMLexzoQWrwJhowYRtyXllhkRp/6OIV1IN9wbyA/wzGMvIgsNFXeo4xhYtTpYnf9r
	kxTH4SBAGJPpaZ+eJq/QOXXJe2O8ehKrdvW3i5hsKOrU95xaV5Y2O5yFDN79Jiq+1BNBTAQ==
X-Gm-Gg: AYBFou1QaVZpYAAu8JPnuAIz5Fs1lZ//+NkLcU5Wx0jRSEoGGFf5tEmlqIVze10Fxdp
	eKq6r5AeHcP+DLP0/AFIlmAs+kdI+i+PMm8LBkRxgETrIfWAlzUuhMbLC8Rfo8kOca++Vd3PYM5
	XwOi8e9RDmNmU25MaoNqYp4N8Ma6hOIQ5bummCdd4+2mVOc3s1HI1f/8oYjvcVt12sLgl2Fn6Pe
	2vElxJm0vzY/tvF7ySLtGVBN8KQg7tBUbFU1sIN4uKUoXIP0Nl8XpuNZyn63Nnyhvdh4Lgoxygz
	JaSvvpDaSoG4UgsER4S2JmwfU+BQiPmtzcwReb+nONULyRWoyJy0/Ai1CpzgfEOq+6xOeCgY0Rm
	BvW4f+p1MiMBpbOyBYhVY/GQJL5W9uNyrOAA21Oo9VFWiWijupDzVzTBYgXPBExGKs7O4wzD/7Q
	ExYwB6t7xiOftXBIXCu9oKnb/XWlczajvYrNNo74+Bbjy1HbMe/saLu+89cSuPMrAIryRpERnWp
	YaJKBenSxmrowoVyzUBsuKuSmJSd7OkT9S3cC15vFQSzF0lOFzBcuDcCVG4RiHp
X-Received: by 2002:ad4:5c8e:0:b0:919:5a10:ee4f with SMTP id 6a1803df08f44-91ca4afe20bmr246420456d6.21.1793740765232;
        Tue, 03 Nov 2026 13:19:25 -0800 (PST)
X-Received: by 2002:ad4:5c8e:0:b0:919:5a10:ee4f with SMTP id 6a1803df08f44-91ca4afe20bmr246420196d6.21.1793740764838;
        Tue, 03 Nov 2026 13:19:24 -0800 (PST)
Received: from [10.206.225.113] ([129.236.228.41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfbe832sm1091056d6.14.2026.11.03.13.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 13:19:23 -0800 (PST)
Message-ID: <cdbb5dac-210d-4c75-810f-2f99e22675ff@columbia.edu>
Date: Tue, 3 Nov 2026 16:19:23 -0500
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
Subject: Re: [PATCH] smpboot: Run the thread function only once before parking
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu
References: <20261102-smpboot-park-once-v1-1-920282635d20@columbia.edu>
 <20261103151525.Mu-hc07d@linutronix.de>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <20261103151525.Mu-hc07d@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NCBTYWx0ZWRfXw+j5mbqQWgRU
 /4ZVWegA0JlpA7z+Ga/DiuajSS5Osa3oeYrNmFMJSugHjDwB1SJD9fxe3XgBPW2dn4CulteMtB5
 6BWW97zGwmbFFyp/ilsAs4UXICRV7a4EZAVWZA83vRpplbEj6cyi
X-Authority-Analysis: v=2.4 cv=VYdir1p9 c=1 sm=1 tr=0 ts=6aea4fde cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=hEunIlkDQR9riCPXO4CBGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=NIk7q2_eAAAA:20 a=f5T0G7mIw1Y_cTdEXoQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: zjjtSiatXbghXHLTdmxVZv3ngUonitGK
X-Proofpoint-GUID: zjjtSiatXbghXHLTdmxVZv3ngUonitGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NCBTYWx0ZWRfX/ehQlTT6/oqL
 /xSxpFRa3zt5vs2tv9OoVGj6KwVuTnrdiD1FfX1PQvPkEYEM4nkTZ39pKkZwoS/xI77LpqS833h
 FtKAH5BXheRLgToH+Pp6XYkg1w36pG1PdVcgWolY2wCcTg1jjm2xMhoA9CzAojmKWGgnDcioq/W
 5QwRkTJ45bnlm+5rjmfHFjCSuk0hHLe3P/MQcxug4Z76X9k4f3oNrYMdeQMfheeoJTJTRT6Wq9z
 evvBlYx3sRbC8pOIJKi5Ou1mjah+wy9vJp7dNfYk5KCfM7y122ZF1yzQZ2nzUGNTRyubk0eFODo
 EhRG+LWZy4aj2p28T2Ss4IUwSlN40q78TdpoFx6Gj6wIxGMzC94RmsqTioznDqtWO+i+g1nJjLl
 JNhAGpRfs3clA+xDAL6+uBB61k8wIhCqzM1wKwivAxF7tFJjMCRZZuJ80s6oeR1cdEswlCw1kQc
 v4wgoNdI4pO3Qx++AuA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11955
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 lowpriorityscore=10 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030084

On 11/3/26 10:15 AM, Sebastian Andrzej Siewior wrote:
> Is this just the net_rps interface or was this used for a reproducer and
> the issue is different?


It's RPS, just because it was the easiest way to keep NET_RX pending on
one CPU from userspace. The issue is any softirq that keeps getting
raised while ksoftirqd is asked to park.

> Would avoid it. On the other hand networking has HP-handler which
> ensures that the queues of the offlined CPU are handled.

True, cpu_active() is the better check there (and the RFS check a few
lines up probably wants the same). I'm happy to send that to netdev
separately.

It only covers RPS though. A NIC IRQ still affine to that CPU, or a
tasklet that's scheduled while disabled, keeps ksoftirqd busy the same
way. So I'd keep the smpboot change and do the get_rps_cpu() one on top.

> My original issue were queued up irq-work items which were not handled
> due to the park request and couldn't be handled otherwise.
> 

That still works, run_irq_workd() runs once and takes the whole
lazy_list before the thread parks.

> The suggested change is okay in principle restores the old behaviour
> where we did not care but run the work at least once.
> 
>> Fixes: 4a3b51aab6e2 ("smpboot: Don't park the thread if work is pending")
>> Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
>> ---
>> Reproducer: https://github.com/manitofigh/files/blob/main/linux-repros/ksoftpark.c
>> ---
>>   kernel/smpboot.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/smpboot.c b/kernel/smpboot.c
>> index 3f60e8c6dd30..a2ddd10a8577 100644
>> --- a/kernel/smpboot.c
>> +++ b/kernel/smpboot.c
>> @@ -119,9 +119,12 @@ static int smpboot_thread_fn(void *data)
>>   		}
>>   
>>   		should_run = td->status == HP_THREAD_ACTIVE && ht->thread_should_run(td->cpu);
>> -		if (kthread_should_park() && !should_run) {
>> +		if (kthread_should_park()) {
>>   			__set_current_state(TASK_RUNNING);
>>   			preempt_enable();
>> +			/* Run pending work once, new work may keep coming */
> 	/*
> 	 * Run pending work once to handle queued work prior the parking
> 	 * request. Don't try to process everything in case new work
> 	 * continues to come and the handler has a hotplug notifier for
> 	 * everything that was enqueued later.
> 	 */

Thanks! I will use that in v2.

> The thread_fn should only run in HP_THREAD_ACTIVE case.
> 
It does already, should_run includes td->status == HP_THREAD_ACTIVE.

Mani
