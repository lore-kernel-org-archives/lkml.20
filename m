Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476695616AE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961064; cv=none; b=HnOSwYFAvAIcL/sDiBcY1kSAD3jrXIt+49E2kt/F2dNmPyJcax4BcA4L047H8StS6wks1lltlZwaOryJ4Fh5TMirq3JmN0a8Fhdq1t0DEYOypuSVkuNNQS36b6uZUlpaRv1O01DJUpE8bENSlSWTE+ViS1/xOitGRYFKVFjPSsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961064; c=relaxed/simple;
	bh=O7CTYYww6kbvbIlbWW7DJQj/nWqn1Zl5VNdZA+L0TkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzWv+7LuK53sie6i8GS/n1T5t5W1WHVm1T6cSi7elPtYiXeOyHhEFevGs/Vg4R4aam80lx2QdH+3v6RGQpSOiNsbYPpOdAWOx5B1NgQ5GQAINN1eObeoV2mwD+6bDrOLAkIVrUDSnaJ+HHAtDTz6HtSk/P4Lseh3AkGahIxPGGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEIvFy+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPGTUVvy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEIvFy+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPGTUVvy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2rs1810053
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iygAIsZQGVJ3KWkHRH+o0viu20ln2A5UI2v41yNoOPM=; b=hEIvFy+hGRl7UivC
	xvoY1NvSocAfvPTKn4kBVjpF00Z8wJRPupUSQWiGz8ScOW9BGZMRhiMDZp51p+2n
	Quiaf3dlVWvo29BI6iZIVHARai+8W82J0sbLJLJcfCN1z5Z3TpZT+vaQTxkBLSBD
	7eQndcMbdFpUYyIU8+CxccwVY8ml9nMCR9q+2yJi7TkRsmF2EjKzbLKm3DZgYSqq
	aD8Dzu+RYfvUIMgIs5OP55YkGCwDXNsoy37UMsmy/XdquisOs2onEXa+KKKkhRki
	se5nqvJQkr0c4svBQWiCsqfkZAzGPRF6LT0RsWVwkSrH4nRt1MUD1ttgFM8SuiNZ
	go/HNA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj0wnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:37:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c8328eb979so12086e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788961061; x=1789565861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iygAIsZQGVJ3KWkHRH+o0viu20ln2A5UI2v41yNoOPM=;
        b=gPGTUVvy6lTfLLRIwhsgGpjP1XA/hcf0+bUQaVlIyVudGuXRP+QmqYZin6ZyJRvA9Z
         Zorgpl4xFcm48NzLslKVZv0uDT6QtWIg8Z4zBd9btb5QDsFSyjuTL5Gd5ppGsS4fL7as
         ctIqidoWF1E+N0HadTKPF0YrhuFdHGy3yH9wu9frSwT7lKfk4qwTxu9dBvRBHjL4ZxJI
         e+NBer8YAIFvP2HD6AFgJ6C4d6vE/XW2mmy5dQBtXUkV7Icgvmyo3twOu5YW2OQmVXQ5
         vjk9mWFpOyo2NfAsfn/s7z4nB6xwGbrJGSRlDrq0sBpYJ4oV/nW7ZdWltHwdAw4Z7B0l
         +VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961061; x=1789565861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iygAIsZQGVJ3KWkHRH+o0viu20ln2A5UI2v41yNoOPM=;
        b=SvYbnfTI10v9DYIqyNTaoI5eKnpiqEfaaNQlMIpui7QlKSmGqpd7e6NGccdlXgClgh
         JAPwOr468Bu97eeBAW/En6creQLxhFkqh3ih1UGOMFPl45NNBgJythjuhW5jXSKY/1lU
         knwDlh8KAU9qF+cfj+Nlyb5tvz49xgVO4NFSHimAob6DnzMnFykb9fe/o/r9zUtEehiq
         afMq9Ws8R6/Hl4FhFlUoKLd1LNlCfx0kVg64OrqGcL8G8fIrF9nK3wL3spyATulZ4z3e
         qwDiWONE3PTkPUUjTAj5vqxvTv1/EZkJM1L+Hn0Rf0RkauqKdQyExvhoAljFk+009qxP
         NQtA==
X-Forwarded-Encrypted: i=1; AKwUvBxkjHxH/x9OV9DzVsiQEuvVINbsyMCmN9JaOi8aXnacdKDooyxhChkahXJlsZUdBRrGu1l3k2Gc6i5fuRA=@vger.kernel.org
X-Gm-Message-State: AFuF++n8f+/Ci/1ek48Z+zGRoPPQExW8OD4qwc/3jElNGZjfYs7tgfL7
	WxRxXBXhJou/S7nADwsUnlio49YVbXyDhg0u9hPRYwvNcSYm99V/H42ItvJgcGf00Rs27ozx9+K
	ey2J7QwfhjLHvuCHm183WA5Sn99BBnd8VVMXAFMBWqbpMRzCpeQvNG6j1w4pH9Ixgt98=
X-Gm-Gg: AYBFou3gLsmh89x+0xc0HqVgNMHdE5j+JbVcFM3Jm1NOHUARVLJgUh9PDPki9rgnPVF
	8iZf9BA8MmhW41HlR8n/f3RHB1Oj3LrTh9FLMM6yC9UeBzCqcRnDUiJCPDpOZCgO9lfql1czI3W
	+LUFnfB79lSL+P+SVU81KRHAkJrqOYXnSvZP+gvVPRUwRiljFRMLAMyN8bAUgIqiv3Z0BsAon/d
	qkq4xAW/nKvN3TB/4Z9ac6cnD7wtR4hXFdYEUHAl3OZIrI90CzbWUlFDpR70/tmRgEJNfKiPKYB
	Ud9k6q//zvY0EDEIznvnA4ERdb4DfUr6GLHJ0eSoO7cC/e+TRew4uk7sOOIGrClXpKPah3+taSU
	jOCsOYOHccV53KNk/qiDtVA==
X-Received: by 2002:a05:6122:6b14:b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c8148141a8mr3923753e0c.1.1788961056438;
        Wed, 09 Sep 2026 06:37:36 -0700 (PDT)
X-Received: by 2002:a05:6122:6b14:b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c8148141a8mr3923741e0c.1.1788961056058;
        Wed, 09 Sep 2026 06:37:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b7673bd6e5sm438764e87.22.2026.09.09.06.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:37:35 -0700 (PDT)
Message-ID: <fcd7eb6b-95ab-43eb-91f7-f9a0ffe18ead@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:37:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Stanislaw Pal <kuncy7@gmail.com>, Jie Luo <jie.luo@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Georg Seema <georgseema@gmail.com>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b58e3f64-1a5c-4db4-a51b-7138fb3609da@oss.qualcomm.com>
 <20260909132049.37611-1-kuncy7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909132049.37611-1-kuncy7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1MiBTYWx0ZWRfXzJPNB3hBUjdk
 Dm4t93qA5Sd+vbjjzdYb3sjW9DEiCX1nn/zXkkSu5EPnYIMI1A8BcKLb2S/VA33X20jXnMLRrnm
 yBztGmq1chlzvv6fmy9GLJS0ArF/wAo=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa16126 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=oVlbBDgyKwfZh0hzoKgA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: tqtyFnmHVtldi9HaA58q9hOLd3ooorLJ
X-Proofpoint-GUID: tqtyFnmHVtldi9HaA58q9hOLd3ooorLJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1MiBTYWx0ZWRfX4sZDyw8kWzt3
 /S8zQckcWI+dbMnVxi5Y2j6fRpyHmbPsgN4jxNzO72x/4w4X2kB6/eS9Ho0KvXvFU6aBtVJA0ea
 1Fwabaq9lYNN6KMQt8nY72vHeSqNwfg7D/nIawjyBI3Ay3OSqqtytFj5kmWfGMuewC6MwUb9uqE
 TfJfUwf62Tb/aOSzG65TCj9it4qOc0FBWVSLqRwNYisZ+6xh1jI9dG0HsE8+9fAfrplHuulhI/1
 1esiPDQ8lP6WopMvVjSm9wD23TdcrWamI2FsFrWPMv2pdSPTiAtsKqBGaQl0XSyfkA/woTdHm07
 bd+7S4l+2hLGACJU2vJpv5I40qZUAxVamPSP3NoUemFwZyUT1laKzDCXpDTF0P27eYri4UySZao
 G02fU3yNce87S/t1YhpviQ6jfRFnw4Q5fLSCYPdQXA+p1xk3Fsaz+8B0jC4xubbpvY2G3JFI+rp
 g1AfppTn/tDLMlcE/ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090152

On 9/9/26 3:20 PM, Stanislaw Pal wrote:
> On 9/9/26 2:12 PM, Konrad Dybcio wrote:
>> Is it only the UNIPHY consuming the 50 MHz one?
>>
>> What consumes the XO clock? What consumes the sleep clock?
> 
> Nothing in Linux consumes any of the three today.

Yes, that's more than clear :)

I'm trying to ask Jie about the platform details, to which I
unfortunately don't have access at the moment..

or maybe +Kathiravan?

[...]


> I would rather this did not decide the patch, though, because the
> failure it fixes is not a later register access to the CMN block.
> Mieczyslaw's summary in the v4 thread put it that way; the mechanism I
> measured is narrower, and it is what the v4 commit message describes:
> 
>  - gating those same two clocks on an idle, fully booted GL-B3000
>    (runtime PM autosuspend, gate landing ~75 s after probe) is
>    harmless - runtime_status "suspended", both radios still serving
>    clients;
>  - with UNIPHY0 disabled in the device tree, so that no uniphy driver
>    exists in that boot at all, the board still dies in 6 of 7 boots;
>  - stretching the end of probe by 15 ms, or by a full 2 s, still ends
>    in a watchdog reset, 8 of 8 boots each.
> 
> So what hangs the SoC is the gate transition landing amid early-boot
> bus activity, not any consumer's access afterwards.

I would be more inclined to believe it's racing against some other
driver enabling/disabling something else, perhaps a register that
depends on a clock derived from these two.

When that crash occurs does the device enter crashdump mode (USB
PID 0x900e)?

Konrad
