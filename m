Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6537E3C3449
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507457; cv=none; b=Ir68yE8pGzaat//28KNM0PEHnqbROPWu7FE46AYsnklNfajpwBkkiFEnyb8y5j205LPiO6J0ZR99UebHOozCOm7feB4X2u2Yzt3q0/D891J7N6KjS9OvUN9NBzLGWPUyKK+eMn5MzngDe76DtGeJRLuGGiVvMCHpYHpIdfgEkvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507457; c=relaxed/simple;
	bh=yy3y4J7ZfHsuzJjAQbenODv7ZIpL0T92jMWOauDhI5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdUyz3NQyVouAhYHFJuSQut6ctHlydSuYrsfdox8ZVvskSY/0LpgoKbXnDiB3r6QY8246DrbE153XcuwJd6lGdueJMCm3wZa5aivaJ4pxEybyb2qlL89lnTcIUn1tJbiVwugu7tv5THL36svi09yoVA2g8i340afOMF43bEFXiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxO5jmp8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEV6iBl2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxO5jmp8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEV6iBl2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462RPp2750605
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 07:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtsDQSU5VHlQkD6IyBO8zq6EWAcPowQCqqnoACC6TYk=; b=jxO5jmp8Cd17CrCW
	oBbiI+f6jxmaFnqyN/KNkUO6XyWHFZcOGyEWPgcV2jnR2f/4IarE0PaHz2MxsI4g
	npQynGCi41ZEg1NbWURD2wfqWPRGAzdoDMlEWJOYJjPPK2WtnHvoTV3RHdWPwZTM
	a/WUy/6s78IS3SCqx6bJZJpg96t/54rq9JcW/NykDteYHpITyFb9NcQJTNAdV33A
	ZF6lpqd4DLWeAG7Tn9G3w1tRp7iPI4dlwBcrMXQ0dUP9WeBivEB20HIJ8YEn//jz
	D9ybA501YqSuDYyDHAJ1DLiIVjmbmMO3hs74VVRVyqBHBw6UGBxlvhcxPjRSTKGF
	NBjwCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxjjg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:37:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so1507441cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788507450; x=1789112250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtsDQSU5VHlQkD6IyBO8zq6EWAcPowQCqqnoACC6TYk=;
        b=UEV6iBl28oSjkHVXPXGMK+LejcKDPieuGKp/ngEBxjMQr7lPif+QQMSRisB2ERX1r8
         KE3EYGsB1CD+63tTbzl2WlX840TAxbTDDV3ImEK9s3P1KKt7xkfpEI4auVO6Tg8HZYkn
         G8w7bOeNIRLN7txuuMaznW1swqJX7fBvc9hH41QVl/tw8Lj7Un+7/Jrn+ct0ETXxjwQD
         y6zUxcsDSU9bhVDU2Wr58lmqwix8yW4vXyEjoK6WmcDaYUuXrzaR8xyL1mSCAuRvHc2Q
         F7rkzZNoOnFg08rBtvUmf8Ro4Lc5SY8qPQ5GcRxzq7W9z5qKXJ317X36cG8ZnAuzcmYD
         tzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507450; x=1789112250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtsDQSU5VHlQkD6IyBO8zq6EWAcPowQCqqnoACC6TYk=;
        b=A/XZGN1tuue86hAJJ9ZMnDhiVh5YcpwhAxH9+Z7ztnezDF8Ce0j4nkujx2gup3OGwx
         pE3tkdMwyZ+5N6W9CXocp3moa6VnpSJoDEnUgLdlUenn0fAqdMt2F9Gcc1SWxDR5p2EG
         FafOYIXNGvRNJ0Zn9q6Ov7h9SHIHJDeNyfsExB68eYoaXo+Xtu8B6Ir77ozLpqQURaxU
         pXiSH/1U6ZkNzXweYwsQxe3orYI13tp/7iosgEHAi//d7v1ce+RtDRFs/MN/UAsRpQO/
         N9XsbRF9Mlg+KtbLG0xh8E+9/G7RG4QmyRAeE9O1RiD5vD0s0vu7ymDwVf7UnDHlHvVw
         DRKg==
X-Forwarded-Encrypted: i=1; AKwUvBxZZNPBfr4+EIxwET3Q4EgW/Svq0MkN5W84malU2/zu/19WwBR0BhCQmeQFmKn2uepm2k3gV0zllFWMOaA=@vger.kernel.org
X-Gm-Message-State: AFuF++kh/Olj5xkGTG2mhUSU9T78SH9aZcjvNoE5B2EIAWS8b9eZ4Fbt
	YCQEPMNmBCvyH5+egW6ADd86UZuRpCzev0WwPAeIVFte/dhPh9mfpZCPlttDD4KP1nGeA/qE06g
	IBXDPKOMmL+Ub2P38gNuPUFtvXD9RWCKs+y/l76Jg5hJ7lJDAu3txrejipgoRMIbT6bs=
X-Gm-Gg: AYBFou0HScV/QUnylCJ+LhVOMdT9kwievauB47bcubcRHUKHEiamMX8WjJYzK/2MrMi
	SVHQt8LD588vM3IAI8XTVj/HA0eJ/DQpHxgO6ZDWhyFYVt1bb6lNXj70RqS8q8wP1c/1XW27Lbi
	j0rk/FsiP1rG5gAD3Hop6kEqJAJGIcuOwbOdQ6fsHPoHW4OjdrNXVaIjmIgnFuD5rY529Y7RwQe
	LoC2vPVdM9XiVvtWd7g/vzNFr2hf85LqkKPmB82yXYeYTXDGYMfTRBWMeMW1qvyFAV9iXVzPK+6
	I9CgLk7Ong07rcTuHwgsQ24nKHpgzfd07tGlg7H3o9q3zLr8998Z3WD6w/4OabYs9fir9CtH7VA
	zxo6VLQU4gsuZdLLOOv1N2g==
X-Received: by 2002:a05:620a:2b9c:b0:939:216c:59dd with SMTP id af79cd13be357-9398073dec9mr313333585a.4.1788507450140;
        Fri, 04 Sep 2026 00:37:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:216c:59dd with SMTP id af79cd13be357-9398073dec9mr313331685a.4.1788507449683;
        Fri, 04 Sep 2026 00:37:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d559364sm67121666b.35.2026.09.04.00.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 00:37:28 -0700 (PDT)
Message-ID: <cc02e4f9-9e09-4d9a-ac9e-4e09c2402704@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:37:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] watchdog: qcom: Register pretimeout interrupt as
 NMI
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "Kirill A. Shutemov" <kas@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com>
 <3de593de-6851-4a53-8309-a6bf13e9a8f7@oss.qualcomm.com>
 <CABz7rdBv74pZe6jDRifTKRAKzGZB6L08n81_0gCqF0g=s+FEcw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABz7rdBv74pZe6jDRifTKRAKzGZB6L08n81_0gCqF0g=s+FEcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tOH1vexrH0DcoBRDm75acyby_2ppPf0s
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2OSBTYWx0ZWRfX8Ml/pjUZCqLD
 o+7QZqXy/2PFoOmhBBKUO3aG8WsMPcNwID5kNdCAIxwuTfC3XHYoCv6lXgef0Vgj8lTaaRJ/X5o
 EClSsQt3g3sNHUudGUqAaD9Toukx2hY=
X-Proofpoint-GUID: tOH1vexrH0DcoBRDm75acyby_2ppPf0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2OSBTYWx0ZWRfX6dHhis2SWl54
 w2rTL8xHDwFD4t/JpSpV+kznJhKW38MML4D9vqJBoMqokwHLOyGb/DRq51QltioYgGaprPHej7V
 NYeTRLa/WYilCuMY2w+OEZqgr5O62cWfMd/N2pwvG6sV3jtk/RkoCLIgJSBai2IQ8BrybhOtOGS
 uVhCaCMk4cqbSIW7fODgMLoVXM3YI7OhS3qr9mTHQByJG61r54U0S9FLV5nA+4W7YoNlTuZ21md
 K5JH7vbdvU7HoEbx2KjwPtDxiKwRWjOOsaB8iivSKXSovDMr5n2f/4a8IlqwfztJmdygIVZTYxD
 1VMPSAzN0eug1sCpHgGylwEEm7qZcrM767hFw6UybRWp4Iax0onQr+QWBTAJzmlRLDv6AXRxN/x
 s6eThgSRfbFD3/fQp//h3wWvR0YQcQkhRZCqiKGFWMdsq1gZDCIWhtGAZLVb73I+XdDpMRup6RL
 Whlks4nbgbI1F0ZntVg==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9a753b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qgheIKeueeX6PycM51gA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040069

On 9/3/26 10:58 PM, Mayank Rungta wrote:
> Hi,
> 
>>> When a system is completely unresponsive due to an interrupt storm or
>>> deadlocked CPU cores with standard interrupts disabled, a standard
>>> watchdog pretimeout bark interrupt will fail to execute, preventing the
>>> pretimeout governor from capturing CPU backtraces before the hardware
>>> reset bite.
>>
>> [...]
>>
>>> -                     ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>>> -                                            "wdt_bark", &wdt->wdd);
>>> -                     if (ret)
>>> -                             return ret;
>>> +                     wdt->irq = irq;
>>> +                     irq_flags = IRQF_PERCPU | IRQF_NOBALANCING |
>>> +                                 IRQF_NO_AUTOEN | IRQF_NO_THREAD;
>>> +
>>> +                     ret = request_nmi(irq, qcom_wdt_isr, irq_flags,
>>> +                                       "wdt_bark", &wdt->wdd);
>>> +                     if (ret) {
>>> +                             /* Fallback to normal interrupt if NMI not supported */
>>> +                             ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>>> +                                                    "wdt_bark", &wdt->wdd);
>>
>> GPT noticed this IRQ is requested but never enabled (NO_AUTOEN)
> 
> For the NMI path: request_nmi() requires IRQF_NO_AUTOEN. To balance
> this, enable_nmi(irq) is called immediately upon successful
> registration in the probe function:
> 
> For the IRQ fallback: devm_request_irq() passes 0 (not irq_flags). In

Yes, you're right. Both GPT and I were fooled!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
