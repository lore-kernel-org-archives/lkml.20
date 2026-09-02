Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAFC1E1A3D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788323457; cv=none; b=fwk4kCgX2LbYvW7Pb/qmjcp66wav3p7zWsEL9JKfAZxoS/yFExiItMMIaNaiXL82uKaIRZESiu3vdhM1QnvqM427i1zbv8FqMyoC4dPVhikZL4iGdHkFYt656Z/b73G1ObMzThBwZ7f3Lk2gHSNkAftuY1fJOR6AxhSNquCHpbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788323457; c=relaxed/simple;
	bh=w6PyGQ2uPOu0Esq/H+Vxfjp0d1XNjwm0X8KwlSx7QkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ep8rCLkonRbESytFK+rdAks3hsjxkZUpxQP4uuyL65ECgPXo7MTh8ZGrcgY+MBhxd8fffbNeNsSDmIr4bYCqxADj05Qd6C3jSiLESXA8Y/+UsLsvhwcygbF4ubR5oVas3Mn9Ya+iJxkOWEFSuJlYvmlyi1bmrlVt9Akn+yT2rL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7MvdqsJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/dl6q2Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7MvdqsJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/dl6q2Z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTWEq3048762
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 04:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ud9saGnEUiaPi066PcmmDohkjNWdPAj8p1Y71AxMxXQ=; b=l7MvdqsJAj0KmQrt
	atsXu4ukatetYPB1J+T2ghBiFU9aeJjypZ4kUzrXSHU40Z9BupUd8p4lD3+ElBNC
	lLQtFntUZbEtuPJdYbM8Cx//vAzjOZ6Pg8cuEVTjJvJAAvvt3SY+Rk9oiguuE3OF
	hD+CArD2GApojftGhszRu0VOnZ1cV1Z6pm3Q2vsCxVFqbglL8atHw5p1JNos4y5j
	3hsGUrakv9Oz/6I1B1PPs8IUlpskZnv/1MxM9smmSzoyuZ1U0RpEAvnBJmiGyi+M
	nI64LUunllZJIbt53c5Tu/39I8mOFZy0owIUthZp+1nui3CjzKTxHuGQrSJIEjl2
	rdrGWg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397a40d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:30:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8544b721ce9so883673b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788323454; x=1788928254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ud9saGnEUiaPi066PcmmDohkjNWdPAj8p1Y71AxMxXQ=;
        b=j/dl6q2ZCSldqdHEVVPXK+n2q8izZQnq+qDnlcR4QykDM02M7GxgLDPOwR5THlS5iO
         q08UTq6JMlCM4WHLgwr4AwvOcRv0cWjDKSPmHyvS4UYFKsJZVe6CaQGhRzwzf31OWk02
         51xwQUltlq9IJRRplsvfcbdb+y44xPHoP4+WBahJdZl+LnwM4lzniKOLPC6aeve08bvh
         l4hfPL3PRC/N6/MyEIb/56l54tKTW+8JgG7qbGoDMdIDIl30+zn0++9U3CuTXmhnjchl
         0SapgK6RMPWcvZWsqsZTcLi4h3SwT+hce/sFoWIAYoVer8d/R7VhYKpfNfpQ/3XzSLS3
         rX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788323454; x=1788928254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ud9saGnEUiaPi066PcmmDohkjNWdPAj8p1Y71AxMxXQ=;
        b=gpzZ6da14gdMPV1xIHn0WzN23jK6v1QO4fwEs8xEfXoTf6H08xgt53L65/qso4EDFC
         2eg1j/7FxUl641kmhmvEl24mCSZvLujMH9/Fi4R1SnuYugeqia2B2eoNquZxQq990VLr
         OLQUZdV1gEo14AOA8qqF+GRz1sIRsttYgLWjwtF3jQfWcRtCzCfkTFbCrTWzC+4+Na5a
         LQt4Lq7PHy0F0Y8DBHE4tLTprQG1WQSoyXzwGEHvog6bRwSYJU/sXzJQbo/+yofkufUY
         3rR3TR/V8ZZ2WW3+nSoFd9nZQcaYv6iwdH21xfmnsSKTn9I5cpGMDpjF6g3LyyclcfbF
         2zTw==
X-Gm-Message-State: AFuF++nD0GZ54FoSsbcXRiMdTkGJf6Eh1BiqgiH9Kk/hNXmVuILZDC0G
	tB5Bx8doJJmtdPQpBKAN6vt6G2GrCNtexU3F7KFqNos5hSvoWhCOiq7x6+7g29h8kRgZXMdjfoz
	rk+B0lomjhEtd+MLL44xCy6+UjPVeHgNGCvSHtAylQp7tPANGMvO3TN+4BRSwMCtsxJg=
X-Gm-Gg: AYBFou0fgDQFjs4AaVYXqHMyRZTU2ctYceMePEzkYpSJR4QSqQdOHzh4TVAB15PmhZA
	N4Ba8LMtgG3c730V7UdpSvC1cpNjoipAeioOf75mnkVePVmwh90zV1UlgKga9jxzaBzH1hBMzEG
	fdIyRZFdeCWdU5WObrasPgd4rEQTNnj2gwPseqZdlMJJTYYQaYShyUrxwxYnTYVUQBDo6ExyG04
	NRzuLZ5iTIem2DXQtEDfevOq8a+SKqWQHj6JqR5dZGNJFh/kbHzkxaoC/XevzfwXxmqjqRxEz9f
	sEFrG5r+0KhTf5lqsXymGP/qQjfBlgfoVPPu0gKHEFD04BtGcIPExEeyTjpvcGtvJtS+CYtdkkU
	VuzcazbyMmP3GbpgYetlpzG1w7w/CMLSXnrj2yG7SV3KHx/SO+TPj0h+UYRE3xK1yGTn0nuGq
X-Received: by 2002:a05:6a00:1d27:b0:857:7337:5db6 with SMTP id d2e1a72fcca58-85ed98b54fcmr3799442b3a.20.1788323454272;
        Tue, 01 Sep 2026 21:30:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d27:b0:857:7337:5db6 with SMTP id d2e1a72fcca58-85ed98b54fcmr3799384b3a.20.1788323453791;
        Tue, 01 Sep 2026 21:30:53 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11f80bbsm689504b3a.57.2026.09.01.21.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 21:30:53 -0700 (PDT)
Message-ID: <86e3f919-869a-40a9-9691-7090f943e2b1@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:30:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: iris: add firmware debug logging support
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260815-media-qcom-iris-fw-log-v1-1-c8a70eb08849@oss.qualcomm.com>
 <80a8ce4c-cebe-154e-71f3-d12fa88c9de6@oss.qualcomm.com>
 <c169738e-33b0-4e06-8c9f-587f5c1afc46@oss.qualcomm.com>
 <594345ef-4e64-4932-590f-02dfd6d96349@oss.qualcomm.com>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <594345ef-4e64-4932-590f-02dfd6d96349@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAzNyBTYWx0ZWRfX7ibGCZNdrYNY
 bLMV/gix/AEbexX+MqsoXKxB9HeTAEZojZe7NX6UcbDM9uotGm/qiuXvTN5gjqMNboH+ZEPbkAi
 TYDMlFqZAZ0C+VprRm+276sSxPEECBrhdES4FfaddQp6I04rlIqnM7hGZy0oyNHv0KLR0GaZJHy
 hTMd2rsRHcNkquP4FLVtF04ElsUyc3m01YiR64msR36vdy4buUMkZTmH6i0b/OnRUuqh/1OZY/A
 WJ2uhDE0aEH4o6sZogvCrFuGdslTPHRO9D69z7ZN/CivMt5hKCSFUQzBETlnJm9L4PkCaSdyoQ4
 DtFB1gSymKQRLQz1QSiVZvRABq6u7uMMRk7GZ6FtHAjz3C26zVI2kx8J57Y5U1Vp2J5+a6fmk2e
 41O8+1wGHeodYG5s8DCqyWbulDgnRzv2+YmXELCTChokSjdmrM7RrEfqA1MI8kerRRKgy17WupG
 0/nUD6Dt+B4p4eem16w==
X-Proofpoint-GUID: iKsm4SarF0hhDodPy7ubfjKEay59Ch3P
X-Proofpoint-ORIG-GUID: iKsm4SarF0hhDodPy7ubfjKEay59Ch3P
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97a67f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7yhRQfLDYlHaR4BYWSUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAzNyBTYWx0ZWRfX80b4DOw3vr6h
 b7Yu8RxmqUShzrpWkMJEN43eHyWosynhq7oALQpO1a44huosxEMF0LeagBg2A1hYr/lw/R/hocB
 c3Xe3yUDaGLwqpnyI+cwVwgMc6O7zX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020037


On 9/2/2026 12:15 PM, Vishnu Reddy wrote:
> On 9/2/2026 9:32 AM, Renjiang Han wrote:
>> On 9/1/2026 12:13 PM, Vishnu Reddy wrote:
>>> Setting the firmware log level to 0x0000003f may cause hardware response
>>> timeouts due to excessive serial logging. HW_RESPONSE_TIMEOUT_VALUE should
>>> be increased accordingly.
>> Yes, but this patch is for fw log feature, response timeout value is
>> performance issue.
>> I think we'd better use another patch to fix it. What do you think of it?
>>
> It's better to include it in this patch, since this change can directly trigger
> response timeouts when high FW log levels are enabled.
If this level is not enabled, it will not introduce any performance
impact. Even when enabled, any performance overhead caused by the
logging at this level would only occur during debugging.

However, without the current patch, the functionality of the Iris
driver is incomplete. When a firmware issue occurs, there is essentially
no way to perform root cause analysis or identify the problem. Therefore,
this patch is necessary to ensure proper debugging and issue localization
when firmware-related problems are encountered.

-- 
Best regards,
Renjiang Han

