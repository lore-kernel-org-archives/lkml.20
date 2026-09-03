Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EC640803B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423500; cv=none; b=ZXszFWAxNRqDixBwtmiuOIw+IuAjRDwrkKdhQk7LRRgGbCQXAiJ7nZAXyvSL769fCVcmqNmIyLbDr9Famqk/SZzBforcn0P26yBaue6ash7LdEyrgx3LzQKtwD8/enbJNFC6bE6P3dRAAdmfluz9dBo/Ixh2HBaQm6eyy67ddXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423500; c=relaxed/simple;
	bh=OJPoONQm/fqzkmqO5WFzMXs6fGooqSq3sNVBu7SNsXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLE7JCw/oMCcjoZLpSOM/TBWSAyFmKR4KsTmn2GfwmeaC5itCMuSE2P9C87oO8Ty+lfnKwjjP48z6aoaYi7lxLSsZ/HITOCefbliLiVcKzVLhJ7jj04UOyRtLI363vHji979Yv6jeUIDnqgDM/L4Xn2Xq+QhBgIQrR93F+WY7MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brEbegD6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8KnVGzh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brEbegD6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8KnVGzh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6837Lt124124123
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 08:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7q3lzG40vOdDQkotL1Pw6mndO2bNuNBDqu1ukd2D0yA=; b=brEbegD6nvOBG7mn
	0y9YvRaLwW43cRv7CmQzXnnSm/kOphpDtKMSj6dz8a8izdanE6fxFGifYjM+YAG2
	fuxMFxaYuuI0kX11qv6HFeJXEk7paY2LG9QEHI/jkTEiLu8RKkeNRHdWyDBS9d+i
	tvSq8aIFlrWFOdA0b4K0tKUB4IHHiAlk1CMx1vMbHzbdZZO5clwlKBkGaRJb0sL0
	OqCEaFXNP2G2fCfzCAhvESBJeabk4ycF2nRM74jSA/TCRp4L2ehzhag09oa06Wgj
	gG6lKSWNOpHbxa9QxaiEEUPxqvpJ6KmvMLyAeU+WbY5VilwXOI9tLjlKzo3A3Ufe
	Ha6Z1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekg6wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:18:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso47645785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423498; x=1789028298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7q3lzG40vOdDQkotL1Pw6mndO2bNuNBDqu1ukd2D0yA=;
        b=h8KnVGzhG4PfaODjRznetUN8M+Oe9WzPEbW0ARkb5S/Dw17QoCrYhMNpiTnzgzL3nG
         078nziLQfJjzZtaM3APLXHpOOgm32jI9rEhFZhrEtPU8EpG7D8Prm5oX5IcS6WVDD7NQ
         B0kr+yhC3XzyeQQ1OUc6uwv42ZOLhk7Rpj2Be8rWoBvbX7T4sgHEtjYrrQH4qoNYEMEL
         IEvahFLVhyTbtfr8UcaFAY/A1C3RDvBZYLUyv/ClDMsozIUX/Ce6lnQz7m0eaFB8LY62
         Jg1hjDRCnh9s26crkIuRRJZZjK5DLGKYDmKvW1vF8sFRasuS3+fuYH6UlVmZw3fLws1Q
         n15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423498; x=1789028298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7q3lzG40vOdDQkotL1Pw6mndO2bNuNBDqu1ukd2D0yA=;
        b=DYfz6p1KHiesl+dVZQeSHm9BkfCBhnrUWk81qf93caGMTHgrD3VdFcsWxW2eMG1nRS
         VDCNjpppwHUjNq5vwnAVqR3pZ/IL1X+qDKfJvlJeluyfaEt8cR+/oiMrZ0FwvjvWCjDk
         k+a3JmPvVryiRkhEzwAjQgVJq+4QwTm7yoihv2puKQdqM6mIpqJtdv5NPRFsfImBbxzd
         4a2GDa2fNRujBhgq+CcWcnxjCsJqiDB4TdLZzUnjSBg9k8Uh53EWrptMTttJyGMlguTr
         7yI68jeMdUAHMKtK20DYOvfgbtIJLzBEsHTaM6GkplLfsr3YPZ1vuZmaNdaIVdCAAkUw
         EWDg==
X-Forwarded-Encrypted: i=1; AKwUvBwNOPkbOO8zZ8KcoeugHGzKnCzzJqRuD85NZU3Ed+p+eqnm94DPDXoe68XyQ1mUQOz5OOQswy0XXVDS/pY=@vger.kernel.org
X-Gm-Message-State: AFuF++n8AJZHw6gOqghtocuwp2BubaFcYkGch7qWz9x8FcIQ3k1V4VAD
	rY2Rq+b3orkUJQp+YymwZ7gA8cL/odR8xc8LIAB9gpWfVdzRoWgJXLnqVEx45w8mkJO9vb1gZJZ
	BiI9Udcr6+FwUzywppyHPeSQsd9rzWSSN3zjoBnYaOoEx6K1OyOxZb+VLMBvMoLLsly0=
X-Gm-Gg: AYBFou1kFAn5qW5UpxZtnRjOUwdBefsFoW2jv6A1lfcQGyDYDvjqLcdxphNyaWlbgPk
	/X1WQNMGZqEQQw9OUdFDnbQmVFktGiQfVWumWQrMzSTNQHste/3dzEXbMaJ0pF/ZEmw60rdbuX3
	S2vTSretzvLpD6dP4/n0hGykDsHgyHXqPzs9uhBq++NCmhoxlTk78vaN84WXEzCccte3CIH2gNC
	+GSm/LGLYIMkGtXmSd926NCcUAkpBJ+x23gnpp2bgFc+Ie0zlJmTq4R004gQeWs8wYUzWAZfqv6
	lmcjzZ89tcinh9MAO6b90v30IgU9xqkRTVuPVC1wohd/r5bKZ3tYc31QNNKne7ASHJc6YLJ4gwV
	ADt7cwqyzgmqQTkTrrJGtEg==
X-Received: by 2002:a05:620a:2622:b0:936:6e2f:a34d with SMTP id af79cd13be357-93960faf11fmr778710185a.3.1788423497584;
        Thu, 03 Sep 2026 01:18:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2622:b0:936:6e2f:a34d with SMTP id af79cd13be357-93960faf11fmr778708285a.3.1788423497214;
        Thu, 03 Sep 2026 01:18:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f6c2a8f6sm50161266b.35.2026.09.03.01.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:18:16 -0700 (PDT)
Message-ID: <3de593de-6851-4a53-8309-a6bf13e9a8f7@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:18:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] watchdog: qcom: Register pretimeout interrupt as
 NMI
To: Mayank Rungta <mrungta@google.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, "Kirill A. Shutemov" <kas@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SEJKnJaTlOm1ECHj34oAj5vQKRBkYjjy
X-Proofpoint-GUID: SEJKnJaTlOm1ECHj34oAj5vQKRBkYjjy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX6o5yqvfF1twX
 q6+H9RVbT853V1itn/vnHDicrfMpJiBbOozhGheCySzPFztyCKJY0zDhvGiHV9TIl0v7BxuRwih
 HSdc6ESnEOChfAlQjDqvT6PXRpb0L2LsvlAMFV5rt2VlRQooo6g7wEG9UwmVcY4hgst7HRCVFlE
 eWiW/O/r1azNmYvV8kio4/kVBX884T1Q9VecYNRHqgM0bnOuxRjZCK7ilg18k55iZimGPbR60Sf
 2qZfukOpiO0spPJb9oSJSGWUH9Ur35B7jwAVNlP2ut3XTlPE2YYXLhdoKaVwXFJaz87XNf4NJyf
 IPc+PBE3PLwP2aRP0BHqn9tN5B885W7omej+JJ8aI9i6QMzKtbroXbWShrS421uHQ9ZES+Cn8HF
 feV0zs8jXThaRBdSC5DlMrDGKjhSoRcJtHuK/FyrqixMoTvGxotYEkY3l86t/3Cp+zU/4tKZBKK
 Wb4ipMu64M9PV7tvrLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX8ilPr5Ej9DjG
 7aQ0T0VEpwnwdrOmpx1qONF4umipJpmyLiAr+dN53it2NHT5+hNRkJarWuFCX9MiIOhjmnxbBFl
 ZcbzqZ5kzvlQrt+vFM+yoHNjnCTcamI=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a992d4a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=9ANM9Gnv0aYF1O8oay4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073

On 9/3/26 3:54 AM, Mayank Rungta wrote:
> When a system is completely unresponsive due to an interrupt storm or
> deadlocked CPU cores with standard interrupts disabled, a standard
> watchdog pretimeout bark interrupt will fail to execute, preventing the
> pretimeout governor from capturing CPU backtraces before the hardware
> reset bite.

[...]

> -			ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
> -					       "wdt_bark", &wdt->wdd);
> -			if (ret)
> -				return ret;
> +			wdt->irq = irq;
> +			irq_flags = IRQF_PERCPU | IRQF_NOBALANCING |
> +				    IRQF_NO_AUTOEN | IRQF_NO_THREAD;
> +
> +			ret = request_nmi(irq, qcom_wdt_isr, irq_flags,
> +					  "wdt_bark", &wdt->wdd);
> +			if (ret) {
> +				/* Fallback to normal interrupt if NMI not supported */
> +				ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
> +						       "wdt_bark", &wdt->wdd);

GPT noticed this IRQ is requested but never enabled (NO_AUTOEN)

Konrad
