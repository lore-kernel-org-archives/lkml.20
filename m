Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0B477E31
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480108; cv=none; b=RlGPoVpcDZWdIQ7qeyAl3ir7zpEjMy/ElsFMu1EzNabomcJU1IHaV9YkO1O5WE395vjMosbeXyGFtYuSA9ei7HuZd/1tJxx4yi16JCF8RpnVdIFgLDCk/POr9YNgT2AsmGl6MLA9zWyg/bUEOfgIh2ee6k3emoOLXhQvMhG15QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480108; c=relaxed/simple;
	bh=4eKyhswm/4t8PNCpNSn58PMTddZyn+n13tIZCaGth5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGMtKq7uNL1BKustHScnDzQdsUdzFdhRaWPLkH6vY1ZRVNccxPHyCcJLNW5679MwIMbvK3Z9EtDLWVnAea2Fai8an/2AthoyTGFO6Y1bysL0vq0oF/n0h8p9KLYUssTCpLf8oEobI8nYYDL15RGNyj4KMmHa+L1sqUZQu3S68QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5L1smna; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKJpSmxA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5L1smna";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKJpSmxA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0YFE3756876
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JrIpxB6rXC4YQU5JBuOmbKCLgyAWZtcf2l6ITQl/W9s=; b=p5L1smnachr/d1NE
	L4RZXm5Cxn2WnlTelhvrx2hRVfzVugygvCHD+L8ogsbD9J1cgB6gvUabDTlmrCUT
	04RUkkA7KNZs3okqum9FAKrnA9r7JAwTcMvAj7agTWnjsWpR2ZRpvS5shX++slIs
	FOjLU5NPqXh8H7c+eOkBAdiLX9uEvs4jcoIM40G7p4Kg12cfkRWQNXRwe3uApKqJ
	rEjcXcCIlOfPMUmDD9Rn4Xq1SbF85cgH2NqnycaeFqokasYN3pV8wQp4wilOKj40
	xK9rQ8SQFxG9DgRdCmvYpk7OgkbC2k+PBeKBnSqWDZi+SP/jV2jh9XQKE4LMYLnj
	NZ+Abw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e152c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:48:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso103385535ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789480104; x=1790084904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrIpxB6rXC4YQU5JBuOmbKCLgyAWZtcf2l6ITQl/W9s=;
        b=EKJpSmxAfTm00g9qnFWYRb+YilViXE+fKUjfXPAM0VoYRT3L6vsiSoZr9K1h2VKtHM
         7ILxXFUYpfCEt7SzaYF1qseFh28EFoA1mWoXv4PWavswrVYsYYwMoL80eG6dDSc+Jj0N
         Ezd07s7DZZXsnjNbsEODsrnW+45PQyR3vEaSyDhrTGIY60Kj74cofhTCJH9BzdPGxWDP
         eh/G7Q27mLqz3TSaR2AsPBzhJ5T6/sqzRyyESsmD2fb/44PI9NXfmTs5ANXPditn/mw3
         ECbdDBqbWoPB6E0c5eYwK7jbuppStaiLy0ynDf/zgVTWlLHZlPZUop4nfGEZzuUSEs7g
         94oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480104; x=1790084904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrIpxB6rXC4YQU5JBuOmbKCLgyAWZtcf2l6ITQl/W9s=;
        b=lQGnKt5bZFQ04o7yJ2KqwejR5pW+0QO9nUh1I28FyJfU7JlRdrU3VRK/SLTq2RXVKT
         y2b6KbhbQ7VmH1/duEiIuozeBVFIip8cwJHdROaarVLibL4XhHw4WCv7z+LexKfpuKoP
         2km2JfLbRiQWZ7MPaDFFV8RmZWLosMtqma0l5TtQ/NPWwn8XTj/HvlGnzYRYfeVHET9j
         1OfR6wJBKB9nBFSCS9i8uhSpDScC4jp9oJZhvteXdwbmHBhbc9QD378P8Bq1T5ty6FYI
         iYBIn4TVBxwZNxDJIjLAXqRuKyItSnGKwx8KOUg5w8z/dCEhcvjerbcEe3xwRfuI+Wlh
         odQw==
X-Forwarded-Encrypted: i=1; AKwUvBwEwv3wZmwAQkhF3J4VdItZvP1kcUh6dXOY0mIAK8sKkUAH0VC9/ODca5sfUu20lQvaXho2iW09/H7wrvE=@vger.kernel.org
X-Gm-Message-State: AFuF++lS56SkMGJkBfWaZJN1E3N0VsTyvHYLbMcuu1spA9z2oR/GXRjP
	wkF1MCWrdcjGvcWkssTHDsAfW7+d6k745uwIlYdxp2B+wvQjtTFBloNgYkh6ig3MCzOqphoRmFI
	ZvdjCyOwzE6eCAfHXom+WcyP4VIEYGdy6ihpfe1PsmqFER1VIRDIeuRFQ8FnBz6P4Dx0=
X-Gm-Gg: AYBFou3azyY271moWhvt/o34OpiHU57kCpizWZhSjqWIrySXQndn7be+hGT5Ao8Ladi
	hF2Tbktz/9JzlVAe5NvEYR6kI/3CjcW0ZGHJ+FH69INwJ7YiBxO5s443UE2s5JQpRtT+NXBQiav
	N9if9X8lXurmt9+xunv7MaxUphC0pIAEafcYDkTkrPWoQc1EsZH2rdJPN+FbO4lcplWv+Y1wRqg
	9vgrJpdWbi0/Yl447xlp81AFPAC2nOO4h43yTfTgnWuXwXm3Gll53GJO+Iy9wpGRURzo7V70YdU
	dVbwuK6Br19U6f2ggeUqGHLnMuREv8W3hmwEPJdrfNuiR5DPEVyqxu7+qsu7evRSKHltWxUL6y0
	rpeOl0Vfp/MAnKbIjMd5Yfn0Q7oqstKKh
X-Received: by 2002:a17:902:ccd1:b0:2dd:40cb:a04c with SMTP id d9443c01a7336-2dd8386925cmr21452845ad.19.1789480104498;
        Tue, 15 Sep 2026 06:48:24 -0700 (PDT)
X-Received: by 2002:a17:902:ccd1:b0:2dd:40cb:a04c with SMTP id d9443c01a7336-2dd8386925cmr21452295ad.19.1789480104152;
        Tue, 15 Sep 2026 06:48:24 -0700 (PDT)
Received: from [10.218.4.101] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce92e99sm67934895ad.25.2026.09.15.06.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:48:23 -0700 (PDT)
Message-ID: <467c19e0-a4f8-4e67-a750-be695db34c05@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:18:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
 <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
 <ao7vB8cDufnJZKAI@zenone.zhora.eu>
 <5c6b120d-f791-424b-a41a-6c82de73000f@oss.qualcomm.com>
 <apDPu_uJBTT9GPmZ@zenone.zhora.eu>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <apDPu_uJBTT9GPmZ@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8unbbFT5SddJXJJPJZJ4TNG9UItmnBVz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwMCBTYWx0ZWRfX1umxqtkw/Nzo
 9+M4MmORbrfdu2u0DC+d8SXjPKoZS1175aVh7DBY1/a27lWWbh9G1+XKvp3wAz5zMiLy8yWm7fa
 UJCm6RXQMzTkb0K+Pik/IAQotnGABns=
X-Proofpoint-ORIG-GUID: 8unbbFT5SddJXJJPJZJ4TNG9UItmnBVz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwMCBTYWx0ZWRfX0P1rHXIM4cT8
 b2q525OpbFeq/QnkhBmpAvfh9va/zidJtcLNZ9Up3wcyr36NNO72DwoaSy40be/G2oU4xfVYUT6
 J4BUbKBoFk3cFf7Shdw2cZhSlH7WlmYbeIHINVpGuvT+ogQLA+IyCh+E8ACDD08+nwML8gPDZZA
 zm7V8y/S8XJTLP2bpW7pOloDklaI65uDLQBt7rHYBN3aOvSXqgDbVwMDMZ45b9mmH9XOUYdAySW
 ZtLqflm73aeRWwPH4HzK2VOgaMluKXDbhV8Z/FSFn9kZzUD1Vc5Z03qtog/KQPd4rtxSUhfzwEv
 zTcpggYXTP2mIf6QKTFR3Et23ZnG1WcEeuCTw1sfCfXgDt3VmdJUpEyKH0QcCC/AC5jjY2cQy74
 amPs2tFK6IJUwDgA2UX86jC2gszWS8C3vA9/DEn1TJDFQ9eJqTELZO2/tgDnY03udYrBLmjn89K
 exzCD4NVvNCt8PNfxqw==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa94ca9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=5oCPkDSuF8hkarQvZ6UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150200



On 8/28/2026 5:32 AM, Andi Shyti wrote:
> Hi Viken,
> 
> On Thu, Aug 27, 2026 at 06:44:21PM +0530, Viken Dadhaniya wrote:
>> On 8/26/2026 7:27 PM, Andi Shyti wrote:
>>> ...
>>>
>>>> +static void qcom_i2c_target_hw_reset(struct qcom_i2c_target *target)
>>>> +{
>>>> +	/* Clear error bits before SW_RESET; the reset may not be instantaneous */
>>>> +	writel(BIT(ERR_CONDITION) | BIT(CLOCK_LOW_TIMEOUT),
>>>> +	       target->base + I2C_S_IRQ_CLR);
>>>> +	writel(SW_RESET, target->base + I2C_S_SW_RESET_REG);
>>>> +	/*
>>>> +	 * I2C_S_SW_RESET_REG is write-only so completion cannot be polled.
>>>> +	 * Use a conservative delay to allow the reset to finish before
>>>> +	 * reconfiguring the controller.
>>>> +	 */
>>>> +	usleep_range(10, 20);
>>>
>>> This is also called in atomic context from the irq handler.
>>> Please avoid using usleep_range(), perhaps you can put this in a
>>> thread.
>>>
>>
>> Thanks for the review. The delay is only 20 µs, so we were
>> thinking of replacing usleep_range() with udelay() instead of
>> converting to a threaded IRQ, to avoid the added complexity on
>> all the normal fast paths.
> 
> perhaps before sleeping you could check the context you are
> executing (with an explaining comment).

This helper is reached from the hard IRQ error handler, so it must remain
atomic-safe regardless of the current context. Since the reset wait is
only 20 µs, I will replace usleep_range() with udelay() and add a comment
explaining why a non-sleeping delay is required.

> 
> Thanks,
> Andi

