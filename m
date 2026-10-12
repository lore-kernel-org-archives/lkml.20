Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6415948D893
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819314; cv=none; b=T4yAMw4Dvx967FAYE0/D+2Wv+ADjtDcLiZpWR1DJJG2C2Ktrw8240AX9WECrqUvuc2mB39jnTUgZMhXCLIgvUeTT5Rm6TtZwCDpNJ7FcTUC2Zh/6CosgiZhdjMtxxDCa28i1VTqLjoxPxs8X0422QeIMI6f9qN6RCJjrZfnGhO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819314; c=relaxed/simple;
	bh=w4lePotoXe+nX+H6NblvvDqxQcCb6RktaTtqvtH82EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVJ81x+3qlzJNgfI8guVYp27u3d5kYiq5ebVPjoyd/dQrNIYcGGqABBMnne2ZDR39ROfjiKD+O7E9pzZU6jgpqiXeafBoF6E9eoNYUDbnQI/v+xtFO9/iB/bv7rtvGaD42MBdcTb8EMMfL+MXQi5OHa7PEooU4OYAR4MSJJN2F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SygvHYei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmpzixQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SygvHYei";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmpzixQN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC04oW3365243
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1cUO/H/Ma04E9qAVityxFd6ti5bE3hFLpDa4qT5O2ZY=; b=SygvHYeiQ5snGSw7
	BZ9iQaRIJrMLonFFtuJyJy8krgi6JS4/BUu82Io77+2FSvz9qKrP5n5RVB5V66hO
	eXu8Hcnc7KwsV68q3fL4CyaWdRoFNVMsWh6bOpnrgolt04Iog7+snNZmSTAS4Jon
	SLbLOdfxnU3qLTFDOl6l7vbAOsMQQl/ULMbFrYOKY0w3gWxtXCjCPMP9A1Dw9GpP
	bv28YcyXkCXfZuIZQVcl7N7CCuULDC/1jAsMsM4kT94PNU4Nmg6rG1ApiS184zRL
	ac6qCj6TLxSY8QvsE+XpD1D3CAowwGoK00Plsbd6c4LfXO8rNLBU4QsTf1h5Gw3A
	iotksw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9f4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:35:11 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1665200f4c2so2855072c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819311; x=1792424111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cUO/H/Ma04E9qAVityxFd6ti5bE3hFLpDa4qT5O2ZY=;
        b=EmpzixQN4szYaN4yM828VeNo0bViGvnnwOP1QFKzElzQlSBut4YHakfjtfDj8qp+Ly
         2BEKEbtA8F/TEZLN9GFln2qQp4R5leTZKNQJyt6OHsLrv6/bCUKeD0wjq4sajGLyhFWp
         goVm7jt0ziK8CkDTlbJ2jYdiasO03FvD8899R81k0SnKDpyuhY/cjcplluU10gDL3hVN
         ufnfT5h9VEPPHCxRp0pzCq76jsVXTMjaG+dQ4bD1YrnJXuaOTqcJsXwgOUBaZ2JwhNzn
         dG752kkjtS65Q+FhVYyrJyPjTlQeFw0ukf6D9QIU6XpP9Bzy15JzTAths2Ey5dfJrNUl
         o2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819311; x=1792424111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cUO/H/Ma04E9qAVityxFd6ti5bE3hFLpDa4qT5O2ZY=;
        b=ACW6vV7acjDIRoMeDMAySXCtiLqJUlBzYBwmItHIceKbbYwvc8aIdfGa1E90zNnfJ4
         EovSlM8dm7tBmGQCt3TmbNtvfjl8fOod/MrBVOoqYbWhjBGGvDu7KYlpVzvx2Jc7osWJ
         MhWK22CIo+95Y9oNVpQVGBDcNfi+zmlRDTW93ZWzMHuEfKEJqZg1tqkT5tj5BdZBaTUd
         RMVOYjG+nu7BQySvQOsFfyAL5Ufjp2w8pDTlLUKdZb3J3ELGKGc5/uA67yEw183fKFFy
         zN1B6V6D172y6009iKyx0pdn3wPytK5HoXdva5vCyCX0ixfkg7j9yqdY2MgSnASAdHyf
         iC5w==
X-Forwarded-Encrypted: i=1; AKwUvBzTm7oZErNrynwNY+UMnwKHW3tqSwPfIW5DphuN9d7e3X7DD56lrUm9WvO3C3eYq15fvl6RmxRuhufFBoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdWrYLS9hJPXn/epqiPoVHnGv8DfTeQlnAd8H89BsboWTM4IBY
	CT7TD3Vr3uIkod44ZEoa3X+N+dqwfyjDgCFOdgXdaUHz5qbcKAck7qTyDjsMrwnrb04qBY81hE2
	fhRqRmQm5uqvIyNzfC5JE5ogMqCjH9Vw412HKlSDulkIx3rQEoax+VJ4RzxxeoxbSV2Y=
X-Gm-Gg: AYBFou3+mecs0hIfcxzCuTU0rzi2WWPzAlAIDGASmZWQOnK9OqtNyUqywCgWhZfY89t
	B1pfmxWD3pnA3vTjeL7BMMKQZnf9qtP+pStPuwjwnEhOaDWe+QNg6R+R/Wqo66QHkr6cr6oLaPB
	aYuTfCBU/2BVArWtAlH76HitG42paH3Qu5iJrUcJalqO5OCZ8dsbFBkx7SvfdMkicO9Vpkr3kr2
	dOXMybdM5ePPheb9aAzg996slKI7q+88XRfxppKbzd8daJ8wYfAmvNImMZJ9ah0sd+xF30DAw/0
	pyhua/vutdOfUC342KOTl00ELU2wB053K6bJMmDcjmb/yF46Mx2r77gpjLtYivl+yMpvktYDYeo
	Qp4Jbz5PdcwqrxiQa6Ap0e0hOAnNtN94=
X-Received: by 2002:a05:701b:4553:20b0:14d:5a09:5cd0 with SMTP id a92af1059eb24-16a5ed3d9aamr12748826c88.42.1791819310911;
        Mon, 12 Oct 2026 08:35:10 -0700 (PDT)
X-Received: by 2002:a05:701b:4553:20b0:14d:5a09:5cd0 with SMTP id a92af1059eb24-16a5ed3d9aamr12748759c88.42.1791819310129;
        Mon, 12 Oct 2026 08:35:10 -0700 (PDT)
Received: from [192.168.1.4] ([122.178.59.3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm31244885c88.20.2026.10.12.08.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:35:09 -0700 (PDT)
Message-ID: <18353f7d-d9e0-4e2d-aa79-ec6be0275e47@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 21:04:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos: Add EL2 overlay for
 talos-lyra-evk
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-4-dcc9316ebb59@oss.qualcomm.com>
 <9fa51ba2-5707-4d39-9038-c0983d138893@kernel.org>
Content-Language: en-US
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
In-Reply-To: <9fa51ba2-5707-4d39-9038-c0983d138893@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MiBTYWx0ZWRfX44Wz1vDmifQI
 cCG3KrBK6ilvvrPUctnRvW7KQBHy1CIhQQmyyeoWcqgiZGw5D8Irq/mdlX3w6gzcZJWeRi208kS
 cyu7o4Eux1/sySTG0B2XFh6XrsOlIL3VHlWstXDvsbkTXBPLhzk+o8QD/nj0Wo1rBCUKJTM+i9q
 zhiZcrPaqS84Bc7Pod/cAKphWex7EV5IqXlmRzUQMI1muXlV7ZMPLW/BAJVMEQdERcBnaTZttBw
 i1G66xN1qY/1SX9yBcWbsFDep4j5UTxyhwwQ8KUV6itCYc9Tg1B4pU0SrNtFG2c4URsUqK/dvfz
 Q1eBQ644ZwNrLflzCjmIWy0mBSMMK5cuRJ0rnFYgMwLENWOl5Zy6v9eMcEAxndskwASAuFnbOPG
 MxQnnzz35yqolntFANUUfVCS/S9gHN7E1SbUtAlrzFcprny0x7Zuha3CRsVvv+kMKFZqv5afIm2
 gyGtOVEGvX17TLZdHiw==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6accfe2f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=n9yIFlGNEsxdxEAB/oY+Cg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KqQ6fI0hE-5oTRIwU9AA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MiBTYWx0ZWRfX3DdtM4jSepji
 juSPRIjOCAjIQpq32PmGn3ACdDdd5aDiqMCIUIgy/J06/Xn19wX61iu7/DB7FHtSzc9sI5wz3sT
 owemiiOsgsX0BdzryPrlgLhyaRDR7OQ=
X-Proofpoint-ORIG-GUID: 1ZA9IJEUfUZZoQEWyDQxNxmvC5Glxbll
X-Proofpoint-GUID: 1ZA9IJEUfUZZoQEWyDQxNxmvC5Glxbll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120062

Hi Krzysztof,

On 12-10-2026 16:56, Krzysztof Kozlowski wrote:
> On 12/10/2026 08:16, Ruchira Revdekar wrote:
>> Add support for building an EL2 combined DTB for the talos-lyra-evk
>> in the Qualcomm DTS Makefile.
>>
>> The new talos-lyra-evk-el2.dtb is generated by combining the base
>> talos-lyra-evk.dtb with the talos-el2.dtbo overlay, enabling EL2-specific
>> configurations required by the platform.
>>
>> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 2f25575e6efe..4f8ca3112fed 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -458,6 +458,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
>>  
>> +talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
>> +
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
>> +
>>  talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
>>  
> 
> Makefile changes belong to the pathc introducing the DTS, so squash this
> and previous.
> 
> Best regards,
> Krzysztof

Thanks for the review.

I'll squash the EL2 Makefile changes into the patch introducing the Talos
Lyra EVK DTS in the next revision.

Best regards,
Ruchira
