Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDDA392802
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787806073; cv=none; b=Zy6uSv/B3UmBHBABivoZ1ryBBqNKj1gCpEleJ0LmvSEmb7S/VjW/Kafn+dqHlF4oVLl28tEtllK97QeD1+CCLWfVLopYkKclLFrPmB2RHq7Tef6wayjWe9+YcO17dZu9cnTCjhUyJBY2XE20lEuc7wLGu6Y7BoYUJgXAZn+6WzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787806073; c=relaxed/simple;
	bh=whkmzIgATLghAjS+dZqnmco9LN6El2bw+H+bgLvXnTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a45nZzmvoDwFlVLfW53gf+x5tfgnF2nE6QlnoDpUbh9THbPh8qkk08Sfcxj5DD70I3iq2wrE+TrtpTy3iquJQ45rtaVcHsDHedZ3ug0bMfZ/U8DP31tfnLq8LIqE9IsgVdSpq/VeMll+6Y+bf1cYwtdFGpUHPQQr3rCIXEjqDYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gf3UuhA4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZxGfKHd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gf3UuhA4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZxGfKHd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3J1121665995
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPlz28rXtMlg1Kp2h9H4NYbLW5TAfnVvvysMiDKahTA=; b=Gf3UuhA4ULhWE2wa
	2YJyp4xIk5U9wNTxxpSsPW8uyPyuR4Rod35TI1+avd20ATKdQrTPXMnS8FE44uFt
	ycxiIU3Xvc8FNGFOOOuAzHc+t5xsJVJ14mbEWse9Vm2u/uXC6wV9sF/T9HQ/tISp
	+oCU/kXLjxorO4VwIG6cg5K0v8StoVWMn5aGoqU/DKKNp/oLj/JMG+W6OBcDUdWN
	E1xp1z6hoqwHVCO5RHbxT1ZEeAZIcI0lLKRADA6LlDDnwQ3K+YTytGgFdbWezrm0
	eGwE/hLVM7WwyyJXhQYPRMBGg5VqwiLP9l5CC6YgTKHRDp3pDl2xOPHebRnuPDED
	sV8bVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaa3bgth5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:47:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39640eebc57so3896592a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787806067; x=1788410867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPlz28rXtMlg1Kp2h9H4NYbLW5TAfnVvvysMiDKahTA=;
        b=CZxGfKHdibWAapZQXh1LzbFaQlFWwJ3QKL0EwlzYpJ7469LS/zSt/Tz/LXSXRlVq50
         MiG6sXUYOaQgj4et95Mjv5p+qsNEdcWNX4mN4d7x0w9t9cyyCsPOo6e3UF3vp5PrsRmR
         EEvSYfBGTYtDx74cosapdfCgURCr9TVWQdT1qGka5ZG1lGtgllgPSOcXKuSzA7/cSxtG
         Y6E32kwxa5SbvLWqSFWbzUBN+FTUZc+/Fqs/EbMdt22sZWJEYFDg8vaLe9ey0vo2Ja4v
         vJPNogWIjB4MmyNJcQj9SQ1q1m9cqk+8NhHCqvWbjvj5RPvgUaPVB8sGYOZ+1Nxph28g
         yEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787806067; x=1788410867;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPlz28rXtMlg1Kp2h9H4NYbLW5TAfnVvvysMiDKahTA=;
        b=tSHVwj4qX9LqcqCLLtflUzv+2lPHX4zjBDvaFW1j09RL79o884uYHxUEjlEepvlip0
         Vdpj6yCOrOPzLlu4VscC+T/ajpUQqu/KW20KZwJ237M8HNMm3mS4jPwYx1al9XYeQaQ8
         AxQ1JNEW0WbM1/1+3x/rd6KWznzt0ZZB1a0xL/lNea2c5NdLZ50PbJGqVeUD76w+SMy3
         KqarnoVtMpLT1BKUnSPIsRM3bv8PUM7LkNERncUH6jOnLLU2YFkNzR068NzTIp+Jm9By
         ZPMtcC4h+nXdFW9v7CWLxskOf1udcdyi95vFLcIH0UyfkL424lQvgTyEzs6hRMussEcm
         ToNQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5PS0aa7jdAhCiJjZGvDSjNipkRpZdH1+6rhtTUGP4kkKqbUmdiebT8GPYYCWuAs7XIh1Ls9/a0G6XvH4=@vger.kernel.org
X-Gm-Message-State: AFuF++mJBcxLHt6809SXbWc4LGNnG29W2BPJvqTOlZcbMS0QwaV1Ac8l
	O6VUQnhIPFOmkfphwBXB+UZytO+95aNbulWiu1pDmg79bXkyEN3lpPBEX+L2fGcPr+xbeZyRBY9
	f1+b3nsWfyiQV26pgE3p5+WnAyyjX+NAc0p3pdTBwYQq+2F+l50s/CphD+nt6NQtcAfE=
X-Gm-Gg: AR+sD11+o4IyuuesBaod0WnmAZLqmAip+Tr2P6RErsyFqrWK6ktX09PyAO/Q/6y1m9z
	TxvIlr2GZe5kP7y89W+pTd+Nj2VvNYZErZFj7f2pWEqWzwDfJgwNllz3SAIg7uXApvx8zpjC9H9
	KkFd5woZZWjm4HEUgaR3ZCnrhd8AH2hxuN/PUxTsgv5pwoJDWt7aJj/rfwQx6MRN2Bb+3tTiN5y
	GDIRrhBTFpnLp5GzzkFzTSWNUWfv9uWVgvKtd9m4OfDbWNdO/GYqQfXWu6c2sKQXNOzuuJsLVy+
	3gR8/9KhnIo0qKIe3SU3S6GmDq8rk5KpzR2oK9JUaFVbDym/fKIoypJ6WFenr+Vfeq0AiLKWhZg
	Z3hgOCkT2okUgePwmo/OnSEslgRXqcg==
X-Received: by 2002:a17:90b:520f:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3966d5f8f84mr25950790a91.9.1787806067072;
        Wed, 26 Aug 2026 21:47:47 -0700 (PDT)
X-Received: by 2002:a17:90b:520f:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3966d5f8f84mr25950680a91.9.1787806066524;
        Wed, 26 Aug 2026 21:47:46 -0700 (PDT)
Received: from [10.219.57.226] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d886256sm15864903eec.16.2026.08.26.21.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 21:47:46 -0700 (PDT)
Message-ID: <3ed4cd48-d54f-4bc7-82c8-2c2143f8a211@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:17:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fastrpc: Reduce log level for DSP info and reserved
 memory messages
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, amahesh@qti.qualcomm.com,
        arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260514062825.50172-1-jianping.li@oss.qualcomm.com>
 <dcf8d925-cf9e-47d8-ad79-0b5e641529ee@oss.qualcomm.com>
 <f78bf297-e676-48f9-b2e8-565a8758ac6e@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f78bf297-e676-48f9-b2e8-565a8758ac6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDAzNyBTYWx0ZWRfXwmZ54PGBdYTv
 izJ8WNzkqa9BdKbVkxkt/W+589vPJ4w7yPA+gXaDA1njXgFIX+MNChNB49RYLwjVW1SyAv1zsaj
 l8upI1GOd6uRmooXtmnMcFw9aGrN7xgotN+UR0vxNPrOGskIP1FTA1+qBGHoVnTGiTZgv1Cl+zn
 +d+TsCAZOli5Ae61f/OAst3B80xdeJqtNODyNFdYgQ9IkgoUWAuYP7PZhGSpDv1yx7Ng2h6R0Fk
 c2jlOn6aubxu5J8lXrbv85bNy/zsJq7iuQmtn692epXfvUi+CZe3LjZrwQfhJNlaTrl3BrBb2Hc
 o6zRJSRdmIz/c5wiReuJKsUlx6BTuCJxRZyAkucYPzFyc9jW97kKd4+HF1AMAlYWbWyvtscI2O6
 FzkET23fTMA60eKTFVcjMpyY+Xt33XUWlAF92wH42VlK1cRDxNIEkomWvhRsucynufEpaeUxXnS
 ZfyENfz0mcGOekFo00A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDAzNyBTYWx0ZWRfX7BBjL/jkZvzp
 f4IHqe9IKSTZlbdfWRtNHUev9HS5yd1qef43EzQ19EX4tyhSETKQSEdqGLwgWzhWJytrarrlyOX
 B+siSs4AffoD3noRSYIIuY6SeVOp7Fg=
X-Proofpoint-ORIG-GUID: cGhfJulTlCWYtC26FVOHUbFbSJhGUjoL
X-Proofpoint-GUID: cGhfJulTlCWYtC26FVOHUbFbSJhGUjoL
X-Authority-Analysis: v=2.4 cv=KbfidwYD c=1 sm=1 tr=0 ts=6a8fc174 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=oM1uivv5cwll7WPlF90A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270037

On 26-08-2026 14:11, Jianping Li wrote:
> 
> On 8/25/2026 2:47 PM, Ekansh Gupta wrote:
>> On 14-05-2026 11:58, Jianping Li wrote:
>>> On some platforms (e.g. QCS615 Talos), fastrpc may temporarily fail
>>> to retrieve DSP attributes during boot, resulting in repeated
>>> "Error: dsp information is incorrect" messages printed on the
>>> console.
>>>
>>> These messages are observed continuously during boot when metadata
>>> flashing is enabled as part of RC releases, causing unnecessary
>>> log noise.
>>>
>>> Similarly, the absence of reserved DMA memory is a valid
>>> configuration and does not represent an error condition.
>>>
>>> Since these scenarios are expected and do not indicate a failure,
>>> downgrade the log level from dev_err/dev_info to dev_dbg to avoid
>>> flooding the console.
>>>
>>> No functional change intended.
>> misc: fastrpc: >
> 
> ACK.
> 
>>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>> ---
>>>   drivers/misc/fastrpc.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>> index 1080f9acf70a..05ec14c07fd0 100644
>>> --- a/drivers/misc/fastrpc.c
>>> +++ b/drivers/misc/fastrpc.c
>>> @@ -1802,7 +1802,7 @@ static int fastrpc_get_info_from_kernel(struct
>>> fastrpc_ioctl_capability *cap,
>>>           kfree(dsp_attributes);
>>>           return -EOPNOTSUPP;
>>>       } else if (err) {
>>> -        dev_err(&cctx->rpdev->dev, "Error: dsp information is
>>> incorrect err: %d\n", err);
>>> +        dev_dbg(&cctx->rpdev->dev, "Error: dsp information is
>>> incorrect err: %d\n", err);
>>>           kfree(dsp_attributes);
>>>           return err;
>>>       }
>>> @@ -2361,7 +2361,7 @@ static int fastrpc_rpmsg_probe(struct
>>> rpmsg_device *rpdev)
>>>       }
>>>         if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
>>> -        dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
>>> +        dev_dbg(rdev, "no reserved DMA memory for FASTRPC\n");
>>>         vmcount = of_property_read_variable_u32_array(rdev->of_node,
>>>                   "qcom,vmids", &vmids[0], 0, FASTRPC_MAX_VMIDS);
>> Can you also move this log[1] to debug level/rate-limit? This can cause
>> dmesg flooding in case all the session are already getting used by
>> processes. Some discussion around the same happened here[2].
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
>> tree/drivers/misc/fastrpc.c#n1786
>> [2] https://github.com/qualcomm/fastrpc/issues/383
> 
> Thanks for the pointer.
> 
> Agreed, that log can flood dmesg when the session pool is exhausted.
> However, unlike the two messages in this patch, "No session available"
> reflects a real failure — fastrpc_device_open() returns -EBUSY to
> userspace on that path. Lowering it all the way to dev_dbg would hide a
> genuine session-exhaustion condition from the default log, making such
> issues harder to diagnose in the field.
> 
> So I'd prefer dev_err_ratelimited() here: it caps the flooding while
> still surfacing the error. I'll fold this into the same series in v2.
sounds good to me, thanks!>
> Thanks,
> Jianping
> 
>>

