Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD9C3D669A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192004; cv=none; b=Nxl19Vwh//lQ7n6mGzJwWbbpJN2bdeaaA/LbOvHOx4W+gTR2fSQVltMCims6Yhmf9zl41wQ+rKTbMW5QIm+JOrFXRX9oweX8T7L2OGKqypPRH/r4t5HIWVG+OcJNxh5iZ/ki5FxMt8CjbhqZUlj9KLKp+48grhbhfKBCP5R24i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192004; c=relaxed/simple;
	bh=C2HsrkAsY551zyQVjhc/uoCKFo+qO9kHWqJMqFvLm7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G86yZAx0HGnZ6nJFusvuo1+Y9bvRIFwXSeVyyaAR3zZRICNK/ehXcM2eCfIClQcakt2Tn87s+SuS049spEnkTXDjTEO24kSpeGaa1WZ39BPjPFavrpSSU4mmTV/832k0JrbXOfO/qyLPtOUyPAwNXvfUllPVE3t5dMJSNXf70mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WA9H4rr+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzbrXQr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WA9H4rr+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzbrXQr5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFprH93989255
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I76VLQrz2FsEqHBxgl+gJTgbNgwv1LFzl20Eqv99Pco=; b=WA9H4rr+fNwvKyra
	gGCUywkf0DtM+OjQMqc75kAqo6KISiN2lHaiZhc00deAZWFCVycXI9uXpsGZLfPc
	OEjJ/YMfKCOSO87Jk60/wjDWVAPvWdy4Eu1U5aBwZYlFq0GLyFU4yVjy0E+LzTwP
	bYsc5rgo1G9BsJbsP1/epknRev6ghsbqu3BO6oqKpezojq7Ob/UPRHcTW21JYN86
	ccrm9R+ykmX9lL4g3l31Xs71gd5LmFdKnR8YhjfjKG2wt26V3GMKA0e1YOJdF546
	3gu/V0JJvWJyIJd0sDL+Ey0pFBTho2bpEtvG1NHRacjdWTZfNUzoWyFxpS5IDVUk
	bVD6gg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wbm32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:00:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so5938806a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788192001; x=1788796801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I76VLQrz2FsEqHBxgl+gJTgbNgwv1LFzl20Eqv99Pco=;
        b=DzbrXQr5/AysCz/ydddu5uqDrp5Ijpjz3AF9eyMnPZ6uUI+YplU79TNfj4m1R/UMiz
         oPPNAb+59DCmjPuoy1YfmYy0elBnDeBCLdk2gVN/1GL9LCMaZjjsuOUIvRSmaToQbCGv
         4NQVhRkt2R3wffdqA6BtVBiYkA6rphI5duenc2rFKk7UTg7Uzm5aosuNaXPeGnIuwib8
         AsWvrxnSDbOv76Xuk+b54nOicxFd4ST8tSosJlTZa6/UOLjDT8HH0RgQ1AOdBtbIB+CE
         6xozRLWJ/dyiB23CbFk4dmMc5dZtVbPm6XIHLPKhMLENYpO4tLPntRjLw+NOdDWCVRj1
         nXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192001; x=1788796801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I76VLQrz2FsEqHBxgl+gJTgbNgwv1LFzl20Eqv99Pco=;
        b=g2zdIW/1Z2xpI89EK64Q4+uFK/Y2OTT8RQ46HABJsxITbodsmcmpHudZJSXg3NxdDV
         dW2SuUbr5Hc/6HNDludIk95ODLR0LF4LpXyW3Iw2AtdWtGunbGEaIHnc9b+dSMCqmp1O
         I+WgHKXO2Qa6E8DZBMlJPyeQHxRrZhUt/UrbhNNdoSwBLZoawVRrQJG5tjfOBCy+62tw
         /CEzGxta5fPz3e5539MqfQAzI2mWKbOTO06UHchYJ0AMScAnIDytIF3gn3ohzkI32PYr
         GNkMWzQ8N32VacodHOIahiHjn2E5pZR79kdKW3Mtvz6NBcXdPeVhUibUup9iHeuTrmPJ
         lkIA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1DVIpuOcQm4RLP4wfDhvuWjNLNYyDcZ8H77ykCDI+P7V3GkfMyoMiU3BTIrfSS8uUzMnxsXDI8LE5IvE=@vger.kernel.org
X-Gm-Message-State: AFuF++lBK4I/OI3KzVE2biuRSFZTdEnV0Ha5HQYP6REov5cCTW0ML3W5
	/Lp4+ZFwspVtKSjumvD/APi6uD+Xa8Hme+qUORSXm0k4Ma+ErUhIU2bivFw6TKY7X/0HcpqRe25
	ME3bfXmU7XzydbIsaSRLOJZ15bri14AiqCLXPRumWALATPhceBXZmFSakcIi4n5+KE34=
X-Gm-Gg: AR+sD10xQmgOnT4pLwsEg5XWWwPanU6EU7s9ZQhaynmbYsbH7GgMeX6OYKn/RRE9yuh
	9q7S+I2X7wxPnev5Ap2v6TRvPEoPhgE52MT38SgK6b+7x7i7Fu0WGHYvyRqpEgyTAokdzgfswAH
	0SsXGdS0PUSBbHxRSkp8Ecr3QTeRHQ7/8V7oo1T5XDiJ+kzeV0gdG3uUL81lZFEK2+AOyUuoXzf
	ASg3OU+T2hC496hyS+4fIKDqSwP3Dvcg4e5e3oEoj9RA+OwZZmXOTkTzDpR/C+ZFawvf6ZnyqDK
	gvG7/7UfrbDdV0E0Xs44g5A5yZqbxaPOawdIQgVh0REhXNnTL8D1WO/61FDMfUAdvl29Mwu/IO3
	KZeQjGQwoNKRWfktXIm+RcpNyTABAOr1cOA==
X-Received: by 2002:a05:6a21:4593:b0:3d2:2afa:d85 with SMTP id adf61e73a8af0-3d7af82fb8amr2661669637.13.1788192000728;
        Mon, 31 Aug 2026 09:00:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:4593:b0:3d2:2afa:d85 with SMTP id adf61e73a8af0-3d7af82fb8amr2661610637.13.1788192000244;
        Mon, 31 Aug 2026 09:00:00 -0700 (PDT)
Received: from [192.168.0.102] ([183.83.143.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm31401770eec.28.2026.08.31.08.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 08:59:58 -0700 (PDT)
Message-ID: <5be318fd-5413-4d6e-a8c0-f1b1eb35393a@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 21:29:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom-geni: Fix port_ida handling for console
 and probe errors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260831-master-v2-1-0032ec7fd1ca@oss.qualcomm.com>
 <5bb31efb-3855-41e7-b011-1a5a94fee59f@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <5bb31efb-3855-41e7-b011-1a5a94fee59f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a95a501 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=XkslMnuk+fwelqvQqm66dA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t_IBPTLT0seuTEbNzfsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzOCBTYWx0ZWRfX2WvRP4eJfoR+
 mnVkyQiS5u8R+25BkwrOUWHOsYKL4VldHL9oEtKgYNpVTLNsUPMKJZvVNFtGNzltEhAOYHD5VOk
 0OCQZdvXasJfedsfnyuL4uti0XDpdaU=
X-Proofpoint-ORIG-GUID: YMOfSef9NhofgJA04MfsU2CN2yJY2jFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzOCBTYWx0ZWRfX0vFiVlBFFdd7
 vvcN23PmvSIrIu3sDqpCk24NtRSkbcoz2hSFLCxjaFvHX6PxTabNKYmeXgFcr1MgfwlxgeQxGzm
 ZwzjLP/neEmEswIOCDEjegspmUKe7WOTOvwRCB22pw4aGeLUkfNY+QfiCX/Ar1BqisptVi5Smpy
 GdUdf1AiZlcJ2Aq2pZytWXEUoqYDQyADUjqI+ovmytbIZcURLh4XygPz1JiKMBj9fKBODLrcCUM
 LMueqrgXuyav1A7ByeCEq3w7Nejs+t1dAtKBPJNdBv3JdzeDS2D9DaZe6p37aC3oqDxvTZGuzfP
 jZ/WnYSiRoFGqtQybHPSE0w1roorcLavpQsp/58Xfk+mZ7AeTAd250hPotWTVKpVODRqdarcb46
 zygUWP7HfCbt2GybF0hgXFQ8k7TaOxbETMKlQcObUqyq7SCDoZqCTQViprbWhqRwK5IGJMlCoDG
 1KGP9sNLUeE6Gz2BQtA==
X-Proofpoint-GUID: YMOfSef9NhofgJA04MfsU2CN2yJY2jFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310138



On 8/31/2026 5:08 PM, Konrad Dybcio wrote:
> On 8/31/26 1:12 PM, Aniket Randive wrote:
>> The console port uses a fixed line number and is not allocated from
>> port_ida. However, qcom_geni_serial_remove() unconditionally frees the
>> line number for all ports, including the console port.
>>
>> Skip ida_free() for console ports so that only IDs allocated from
>> port_ida are returned.
>>
>> Also release allocated IDs from the common probe error path. Currently,
>> IDs are freed only on the wake-IRQ failure path, causing leaks when
>> probe fails after a successful allocation. Move the ida_free() call to
>> the common error path and guard it for console ports.
>>
>> Route resources_init() failures through the common error path so the
>> allocated line number is released correctly.
>>
>> Allocate the port structure before calling ida_alloc_range() in
>> get_port_from_line(). This prevents IDs from being left allocated when
>> memory allocation fails.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Route port->dev_data->resources_init() failures through the common
>> error path so allocated line numbers are not leaked.
> 
> I asked GPT what it thinks again and this time it found that this
> will cause a double calling of dev_pm_domain_detach_list(), which
> will mess up the refcounting..
> 
> I think the fix here is to drop the manual detaches since the common
> helper uses a devres-managed version of attach.
> 

Thanks for catching this.

Looking closer, this appears to be a separate issue from the port_ida 
fixes in this patch. The dev_pm_domain_detach_list() problem already 
exists in the current error path and is not introduced by this change.

Since this involves power-domain cleanup rather than port_ida handling, 
I'd prefer to address it in a separate follow-up patch to keep this fix 
focused and easier to review.

Is it OK to keep this patch limited to the port_ida fixes and handle the 
power-domain cleanup separately?

Thanks,
Aniket

> Konrad

