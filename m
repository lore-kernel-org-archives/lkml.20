Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83195457E6C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795080; cv=none; b=H9TJB+dd1ZGk6E1fzZOf8kPNL0+qaQIk1AbX7Ejb0w0VZN800EuYanAGtArCy/xSBLH8E3HoFffXMC7KZMCAkA5OnewME6aZdJj3oiCivart8neLneKALTd8wxvlSUkKOeLD0YTuMjujjhlRYR/Z4+7MHrsYVCE7ZWW9w6hLLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795080; c=relaxed/simple;
	bh=IhehL1JeMkRhS5Eu2/Ne5OIAFgFNXt9XFZgZOXC7tAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYN6CsRlaTZVPCiSOM6T3Z4j+7xNAxz8c+8aZkvOr/6KjiHa0WZVa3qtBrSyyE2CFDyjp71WMWZkWJdGb0XRcU0hakcivGxXQpDYgsiGId2ii1kHn0PDb888uVgsCjHVV06j6CK9NWWylfxDOCOfAQkUEnS5ezMHszcggei0GtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6dbgPlZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIo++zaU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6dbgPlZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIo++zaU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KHCI1779399
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IhehL1JeMkRhS5Eu2/Ne5OIAFgFNXt9XFZgZOXC7tAU=; b=B6dbgPlZp/Qidban
	ahTPC4eeXy7Vypmh4PrzosA02kgY0NB5ALirfOyGX+0NqwhTcEuKO7oh4jVnoE5R
	mkK9rcvfdE4UhQ1zsNHK88goGYFY5gv4NSuI7qSvjwwwygUiMFMGs5SNKmvpCR5c
	1Gtz2i8DadyvxCZVf+VuRAHvHUKX1mk2x6Fqb1j4INmzepTzd30jDmAZ/fTDwH7k
	efRSXz6WqSxeLUkgDeaHc0ucCGpGJaFpu0mRcBMhvVWQ13Me7DpUGgfPuU2UMo3w
	RdYc0C/lkF/BtF8yeW+tr83b5Df93Mt2u0g8j7W30CneMNI3kCKqVxNtiK3Ex0L0
	9/fjFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq09m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:51:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5352eb4510cso2743961cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791795078; x=1792399878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhehL1JeMkRhS5Eu2/Ne5OIAFgFNXt9XFZgZOXC7tAU=;
        b=RIo++zaUyy/AWv5DwTKhu+FCy6TDC800yPg/zenDIH85SyMDcwTq5Kp70ceViaag5a
         pXI/34hK0TD/qIArY2vnDV9qnW0oOGcXR5UL0jwz/Wcm+uMxYoVgpi6NIC5uDasbkp2W
         qWjd19WX7PrMi5elk6DE5tGZZ2tnbDz3ILy5reuxeugBbGVVGl8QYNaDQvan8U5a9YF3
         DJIxOC5WTCETEgDkZNomKz2a26ZIL/nrnyZxkQMnJCQ+bW99iyth8Rj2IVtJFTBNsRh6
         4KkUTrcYEkpEg1Vx79GJLbwDunCtgi0HnxAEa1Y0+Eds1n9VMjp7rN0CvjFcFMc9ao0c
         FC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795078; x=1792399878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhehL1JeMkRhS5Eu2/Ne5OIAFgFNXt9XFZgZOXC7tAU=;
        b=f6qurBGg8arrdBf+DpFb4mHaGk4xYWHB/ojLHybnkkPrdc6uSKPqv5d0D85hWkDndu
         lAg/stTT5VdAafiujmlkqZr3suJ+TjfcD6GkCu/5egoLJYO8Nz23wbUZc3fO6TnxOb7Y
         U3vHM0kaOf/M8NT2xEi/wsvgZmUAR4NQgYYmFLOB3D9PRB++q4WCetL+SxAZHp6fyUD9
         H5YGACAM5er7v4AhRYKTOsnUIhUwL9xmAuwQD1BJ0onl2o7FzX3F2DJlJvS+qRUNGoMC
         VssLrBE6h9z6ArdbPuOPL1zhS/59zA2ORxVl7xQ6IOrDJEfQasakhKuMBoNcoBtzgfCv
         1yhA==
X-Forwarded-Encrypted: i=1; AKwUvByNe3MOqIA01f4l6IChbsUl8/UPi7/O81nF5jSyYTjeqRoACDlV4kD3IjgaWn/IE2yneNPcXWuRnpnu7qs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsCkVBVyMrAkq4cujf19yeMUrXtqQ+HPGt9Eo6fmttE2ilE0A1
	VjQRH3txOzxMNPr4sVAf57Sur6lW0dgj55KwO6dYrpa/FH4QaEtrIXmV+/BwXEKMzKA9sjXknUs
	RFblahqaWduDiRyMdd7WzVDQpcOjrU1wkhk8AYuknMSYZZwXOovUw+XS9HQ0bYC0SEuA=
X-Gm-Gg: AYBFou1nCKYFVDqzxDopYU9MdcLjLaM5P9nZsql7inHJ8+leT7P6hvM51/j5Jtet/tR
	dsQmnGfMkMj/CX5Obki7U0mae8rAOhTnCBiMprcbf/kfgRV9orIUUxsmA7UrvNFJtQsH5h2JJBt
	5S1O35Nc4PrtNNY/CRaj/6mJS4+Nvgp8CJa4MUtRiklN9hQEL6Zz+dVCp9Vo+f93Te3KyL7aoMa
	wiuJiVRutQhMczmYSoacwbYpS2ZFCeFkCPKZqxVmpWyg0Va9D8l6R2EL6q7B/mosLJ9QhzFpIA6
	bGaEQVBenYPkiLFrB6ygCR/FdP5YVd+hxnV8mW5790lOHpsuTKsZ0/4LYihvQl6kenfgHASflw0
	DlfQ/pl6i51I6oqTYOLPgrQ==
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr118392631cf.1.1791795077697;
        Mon, 12 Oct 2026 01:51:17 -0700 (PDT)
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr118392331cf.1.1791795077211;
        Mon, 12 Oct 2026 01:51:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c338d5b170fsm206754066b.75.2026.10.12.01.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:51:16 -0700 (PDT)
Message-ID: <cf17e2ba-0510-4189-a590-00d10760b8d7@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:51:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC
 driver
To: Alex Robinson <alex@ironrobin.net>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steev Klimaszewski <threeway@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261010145519.8370-1-alex@ironrobin.net>
 <20261010145519.8370-3-alex@ironrobin.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261010145519.8370-3-alex@ironrobin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acc9f86 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=DEWFPxdonW-PBiXaBDYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX0soAQQn6s2Js
 gGeBLwjarA8XE+rh8H60aTqjI68uEEmUa5k4hVggjxxXJ1o0/rPit88u7Vr12+cV+L7xw5mF208
 FOKjnEt4SzhcsubvMAOoQ1lrZx4xwbI=
X-Proofpoint-GUID: nYvRnLqg2awkRNPhvsA1h7JFE2BuDXSm
X-Proofpoint-ORIG-GUID: nYvRnLqg2awkRNPhvsA1h7JFE2BuDXSm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX9zQP6oSgC6PH
 QtXVrEwspTlCixh7kWjvWgEhvOTirAEaLsbvoczoFlB/x07oKLwWz9LfizxyJqrv/G1K+VhUCB2
 5pvCgzRKXPwWAytDdLfqZ8p0FghGanBHsW5k6H52DsPObr0unofWM18v4ZeI2GZbOJ1/Zt/SvCA
 cKQU2wAsPT/a0rPTPLYXG6DC3lL7hFwpRfZOCg6iEQlkCvC3ajAng64Bdts/9/T+wfdmkgQcUoY
 KisFPtf5RKx3MpHg5VQNok9CoTjGJCd2253ZsU5X63gCrHh5+b538VBQ9/KqPs8a33wnX8z2coJ
 oWfUKMPP10MMKjieg4wFztZUDcqF4nqHe6foVmOXZnuzoB90NetT0Np+w4AYTYhIGDtRkeVSeLL
 e4av5qmz15ALuztUw8qEiDiqNhPfzKsieHdjlknXQ9d0MLb9KvLEqD32E5gSmft5Ql6HGHcChbo
 tdhJG9/JOGw/SgE5qWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120035

On 10/10/26 4:55 PM, Alex Robinson wrote:
> Add support for the ThinkPad X13s embedded controller to expose keyboard
> backlight control and firmware-driven brightness changes when booting
> with Device Tree. Its backlight, event and power-management interfaces
> differ from the T14s EC and require separate handling.

I think you should poke the agent some more to get:

- privacy keys (cam, mic)
- fnlock get/set
- thermal sensors
- thermal trips
- associated irq events

quite easily

Konrad
