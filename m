Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6521E37A839
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238822; cv=none; b=u7dq53fTTmemliQ756ztFavXXaPGLEiWVo6+K+vMHhOoBwX18QqfgNF4dlFJ7lw9PnbKdqeisaGvKSmSv9EVDSOQU7cwvihCeG0lRdTuJjzg/RIoMwLtgUm6MZBdbTgouxF+CT8TUSqOPy2a6zBr3BdJvzEotYLL7eEdMzrPmJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238822; c=relaxed/simple;
	bh=RGaH6Ns8soI1O6XvE/ZtT5mzvPxocISi7t1y2n7q3fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tF/43erOQs+MaMSx2JDj1fiamenBPzhxSpwicx+LUNC7ig93h5aYNeoFXtvFo5LyeWodphIXhpRgWo/Jpex+wOqn08FAh9341EXuP/1iNZ9+OG/7VbUEWdfjUswjRs0zOOzL+cwlbye9HiH3kav39YI4fEAhSbgkBRGohJoNLmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxtJkaPI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVMuV0rP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxtJkaPI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVMuV0rP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6812kNPA1312578
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 05:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7xzSqDWZbiKMOCqOSW/oG7o+6cCgnoR/9wLnm0Qyt/c=; b=fxtJkaPIF4IJ4iFm
	IdIHoouMNasbpw9sUgjgb9B67gzmXtYJZ/v/QExaiFyoeu5GbiP44CgQ20UJbDg9
	RLMBNKdBKCvHfQz4tOzwU/7wih3zQoo9YY4e2Aaj1dqX8vL4XZrqQBdm5JkjNl1o
	/Y8CAqELnpxUC4Ih8S3vmMuh1g3vP4FMKY16e1FlTOOjZ5zURb6W4pQdmo5X0nDB
	YAnsxggO/hvR3IAVgE2NLAUFqSYBGnd9qQZD0le46PecsGFDaxGwgoVVP14C8jZO
	x2/8+WeVuynzyz3/uy8DUl3ZfFeNc7C0tdMgm0GNVHzYilBxK6OMWWi5lQZ+m5Ip
	a36cow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c8frx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:00:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so8073448a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788238819; x=1788843619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xzSqDWZbiKMOCqOSW/oG7o+6cCgnoR/9wLnm0Qyt/c=;
        b=UVMuV0rPEzJ9LcOAPUfsR+jp2ibogvt4xjOq8i4N3vyb1NwmqhJZWEfqpO1ni6p5oH
         ZwT1e3kBR+nZnkqFVORpJUwtg/tXM1hUcOsuZdJVuXgvO8LDQLHDb1OqHyXPJsaFZ63v
         A2YFxKy3e4tS08Fw66UjFRnsGi9FmKiBC7fwMklbZMYXrxlL9RBFjNuPO3m2SdMvZKZg
         CDrajvWDjjNlMBPrHJpbcempk1dwTX+R0W1t4etJztmXDe0GxKtxQ07KIoeuvfIriSX2
         bi/mdisvolwhzIAcHWOEypAIttL/Mjqu+u/oG9SIW3Ye0GNeWnO8og5Enqp2sW0ihDHK
         BzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788238819; x=1788843619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xzSqDWZbiKMOCqOSW/oG7o+6cCgnoR/9wLnm0Qyt/c=;
        b=Yya3yPHUamQo4DcBN2KNIVAZdm6oUBQRKxm7XLC/vHuwROmZExcB21oE9f3ER96PNN
         GHby+KxGpFIIF7/70l1HUxdNM5ju2rN6WullKnQQ1y2jZfjbpx+JPsmi2DQqzA0XsnlW
         jVujYq0TaHF6oyypz4vlFR741kbqgUF3nzX8/2Qy2mHaE12dCAautOXjeMZALq6bX4+x
         Xhu3+8LoT9PV3UoEZBFqvByhtJ1YWJ3HG0wmL8BHc/oaaahEv3L6iajIaXVcx9Dondzu
         Hn7JEMtwUGhrajTjKVvhBB5+N7DdlKZ+d5xPxrFLYN46O0hzn07wUP14hWtx9M5Yvmu/
         CuNg==
X-Forwarded-Encrypted: i=1; AKwUvBz1GT5MmHMfaiEqFM1sFuie/WMNNTZILAmDCbpGwQpbZUB7PemcTT7OMwZxTyRYpSU3/QVVmxEsMYtr9iY=@vger.kernel.org
X-Gm-Message-State: AFuF++kJaMuCyuFbobgGweUT9BtZPLxpxntPGOh5M4o6Wi0Uws060y28
	y3aFw2xScNv9Nr8JHFRYGTsYSa2cqCXxFreW7j8kxY+AfmgxKbuN6cHVkPhKER7Ka6vhPjPcyYX
	q3UPgi308Bel21VmYUOAnomztJur49D95eWmg2Ka4rf2xLxN/uUdTZVO+5qbZJfLSFjZ01OCmLq
	w=
X-Gm-Gg: AYBFou3RPae0oZVORA5gKVMTCOqKEjn7oINBqx+/3ODKtHHkRWfOrGl2E6p8qrVaNAv
	Qco51JQAj7p4eaCDbjULgtnr6Ur2ZxwH1xxa0FqwP9FwC2hlODmeyRoaiXoLh92xistrLO/3cm7
	UN/Os9LZlSI5KvhqoahV+aY0RWXs8Hf37nj5ZFdF3Yt5U9kiE8ZTCpvKpTruBefwk+Ubj5ZayJ/
	GJIgh6tws9HTMnGkJrTI8POKw72KAaomfq8DJu3LlzM+4wwOjF4kJrcWmO7KJY1L5TjAhv1gV9n
	FgSuMchkL5LMMPaTH1XnZf59aUSijXqSyy8PXRY+Llbr0V2RM5B8KBhJyjCuPY7nYIlsKzwQ/ll
	4O30ziq7klvKSALFDptTpuNtNiYcT26Y=
X-Received: by 2002:a17:90b:52cc:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39907e0f90dmr7530404a91.13.1788238818376;
        Mon, 31 Aug 2026 22:00:18 -0700 (PDT)
X-Received: by 2002:a17:90b:52cc:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39907e0f90dmr7530078a91.13.1788238816632;
        Mon, 31 Aug 2026 22:00:16 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm33198925eec.23.2026.08.31.22.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 22:00:16 -0700 (PDT)
Message-ID: <b86a9319-9f25-41c1-894f-8c2222854446@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 10:30:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom-geni: Fix port_ida handling for console
 and probe errors
To: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260831-master-v2-1-0032ec7fd1ca@oss.qualcomm.com>
 <5bb31efb-3855-41e7-b011-1a5a94fee59f@oss.qualcomm.com>
 <5be318fd-5413-4d6e-a8c0-f1b1eb35393a@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <5be318fd-5413-4d6e-a8c0-f1b1eb35393a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a965be3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YIEZSTQrAp2OycWmQxQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: i8VDQASypQz2kLPm8FVWRgufSA25YU7z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA0MCBTYWx0ZWRfX66C1E3MojtkE
 DhHTzZ3X6iw1faSfDTFOiFKmfVogqcvrZkoJNbBc7irq+Yg+vpD3IfPo/WJq+f5wUelN1eCDxDt
 E5dnqnHuhuA4TKj2ub4hxkGjZqurbWw=
X-Proofpoint-GUID: i8VDQASypQz2kLPm8FVWRgufSA25YU7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA0MCBTYWx0ZWRfX2rwnvgH04xC0
 N87aRNHjNWKRsAAhBqX0H4WNEfSp8AdCOs7SrbdSQSA7oi+pvij7tlUedLJlY5FYkzM4iCJp05t
 HexN9WF59qCKCoPIXd9lSRPS3jDYNaGMEtgALKunjSRoxClzmdhL8DykTC4x/C5AIsSaHWK/Guv
 sHr3HiYD0OcQsBE5vEqS48eXiMTkPO1mIh+c9/zUlMOXyvn5MgAABwrlMunCJ2g6zSkRrAi4CeH
 fJTIzMgCt/UskZ2wFtOxMSnGH1Z8SZ072OPnwolIqGc4ThrqZ179rJH0Fn6IoEN62DVn/WcsQXL
 FMW39sojIWIePpjGMd3sw7m2Wet1K0uy38bnyvXGpqAopd/PDrJ0RVx84KfMncrzrOv9X5nTI7k
 4Skks1IvkhDomq+CbVUyLEgTDEG0QKXnT4yFU8juG2rEy571s8c55AHzcs5K7E5H7tuoGI9MAjW
 CALqxHlVGGKRg5O5aeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010040

Hi Aniket,

On 31-08-2026 21:29, Aniket RANDIVE wrote:
>
>
> On 8/31/2026 5:08 PM, Konrad Dybcio wrote:
>> On 8/31/26 1:12 PM, Aniket Randive wrote:
>>> The console port uses a fixed line number and is not allocated from
>>> port_ida. However, qcom_geni_serial_remove() unconditionally frees the
>>> line number for all ports, including the console port.
>>>
>>> Skip ida_free() for console ports so that only IDs allocated from
>>> port_ida are returned.
>>>
>>> Also release allocated IDs from the common probe error path. Currently,
>>> IDs are freed only on the wake-IRQ failure path, causing leaks when
>>> probe fails after a successful allocation. Move the ida_free() call to
>>> the common error path and guard it for console ports.
>>>
>>> Route resources_init() failures through the common error path so the
>>> allocated line number is released correctly.
>>>
>>> Allocate the port structure before calling ida_alloc_range() in
>>> get_port_from_line(). This prevents IDs from being left allocated when
>>> memory allocation fails.
>>>
>>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Route port->dev_data->resources_init() failures through the common
>>> error path so allocated line numbers are not leaked.
>>
>> I asked GPT what it thinks again and this time it found that this
>> will cause a double calling of dev_pm_domain_detach_list(), which
>> will mess up the refcounting..
>>
>> I think the fix here is to drop the manual detaches since the common
>> helper uses a devres-managed version of attach.
>>
>
> Thanks for catching this.
>
> Looking closer, this appears to be a separate issue from the port_ida 
> fixes in this patch. The dev_pm_domain_detach_list() problem already 
> exists in the current error path and is not introduced by this change.
>
> Since this involves power-domain cleanup rather than port_ida 
> handling, I'd prefer to address it in a separate follow-up patch to 
> keep this fix focused and easier to review.
>
> Is it OK to keep this patch limited to the port_ida fixes and handle 
> the power-domain cleanup separately?
That should be separate patch.

For this patch.

Reviewed-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Thanks,

Praveen Talari
>
> Thanks,
> Aniket
>
>> Konrad
>
>
