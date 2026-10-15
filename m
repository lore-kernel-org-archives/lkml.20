Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4034AE10F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051255; cv=none; b=rP+jCtViOgDeE6jTQZ6ws4VkGEs9gXwH7kyf3wgCCh4mREY50mg/ozE8l2lhjz+qubJvMlE637hYKpsAcOh9GSJPzpExKJ5DrUooOleN1gVNDy3g9T5URnoknIK6+49By1LRKshkl/64MsrVqaHbq05trzLcDrGKgCPlPPGJX1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051255; c=relaxed/simple;
	bh=TPM8vV1gQRN8XJNOlZ+IplrwPVMUQQzVkBEfIEJ+9VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NruJJ3ZAgqm8k3/rqiqjSiBxRioiYCXqzNFwEsR+LI0E+IhaxINEVlaS6hFNuJ5WlCZqqMCM63kQvgeaPqguR9T8grfPhoh+aaY5fuNgPmQH1lOJWB5/HrKD2k+uaadjeGb8wMKX/kyZIJfH1oqJxo+m3J5EPRkuc7UCyDFYscQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FS+kVGG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqhfhTCh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FS+kVGG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqhfhTCh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6E9ug500299
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QbaMbpddYF5G4M9nlH6IkfXgYjjKMVVez32pIFxAdeQ=; b=FS+kVGG1XCEMD6WM
	vXF0wtZKd5kBwyLLp/PcXY8KPaac6MgH4yyxlcGdBN5l0sbxoT47xZbWtS9CY9vQ
	jDyR4PRWZcsnyrDWKqszPmApWndQhXmMZAeTW/CEqKDor/1Zw5T8ed+scuYXbH5k
	uIMdDilaSlzeX1sqmZWBRdRKeyZ+P0TNt9MnXrunYBxoLFgUuzH5qjXdxUhFtyG+
	jeII7YSwVcbSeWdtG5rJB48jijsHFlyTHAO28xzDeODVr2LNUrP9yMYqCFYm8H1E
	5PeNHqJ46Ugk/PDa6aDU7rqFAXjK+hFBjAFxX+P4OhO/BTiTo1oDwRjP9934Q/Zi
	nOmhMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf3www-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:00:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so81697485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792051253; x=1792656053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbaMbpddYF5G4M9nlH6IkfXgYjjKMVVez32pIFxAdeQ=;
        b=VqhfhTChHDA7UZblIciHT8Oy7HFnZWFjp3+ywaORlDunWAblAZYi/ae7xRTJxy3qBJ
         YN/TJnn/9jg4VTzJQOFPoUiKivyktalvo35YNI5AI/4ofgdlzbt9oZVAHw/WD0NuAhB+
         DUbeNWrFqEXF7aajXHsoIxqf6SatImg5iy8xXgO3VDDVmSBSnFTpXbZ/AhgvFuYDkyTf
         NyB6VE2wN739GjFjo8EeLtqhaAZRcPA3veM4tZeK1cd+URKMWFx3UJh1FojbBnhD1cgp
         Jwz5aEkcM7l+pRmhRb5wOt/GjO0hyOimWT/VJls33lO6kfqeuAnDUPvrxRanRqvhHmTs
         XCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051253; x=1792656053;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbaMbpddYF5G4M9nlH6IkfXgYjjKMVVez32pIFxAdeQ=;
        b=vaGEomVog/4bRYNEF30ENWGa3LMVhIjy8+Qy2GQt9OC6C5V/KhllkGC42B/cvIKwnS
         0iJa9VY6/Ff0Vc74V+CMQ3GYH87cFflPIJl0K5gZ3mArXruXsauir4O/f2RbHsaMUf0Y
         Ua4zpXVcu2MM6A48Yalidp5v8USpSCiEFzeiR5iLST5s367XIcZWAJPQOvdRihuRNhZP
         t1o+/4019F+HT4FNWNnbFHgf/lD72RlRlmrRL2Z8YVvi/OKuDRsonBhPgRvaUcp3cawB
         a3am4rC5/b8AGfPyqjLExHOkbh8yTXSpHa09ofBOvggVKvHFBdkjbQAs/IEimmNcg0/Q
         Hy8w==
X-Forwarded-Encrypted: i=1; AKwUvBy4lsRTYWNf+EG1n+P8WixjIFe62y9X4mdBHy0CzMvSilbWGKfUhYBtcxQjGLJIti6lhkevUpaY7U+4QG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3HzKDlgZiGHnu+WSez7SCuN6vKqbe2FKMJWeQBqlFE9yU064n
	VAbAlz/Tx5gsb0GrLis1suXyKKmdNojy7ZH37In7/UNJ2jWcVepibplucQLyvFhBZcc7tp1t9Fm
	1+iVtOP7fIRFN7gDydCaMvaK35Kq0zPQJ85Nf5r2OXNPcd1/jbrkZHnt3w2jAU9djJLc=
X-Gm-Gg: AYBFou1b4ueBIKHlBAWGVTq3RSXqTduT2RJaZbkgO5wWxjI9Y7MK5Z+8InLagob8UBJ
	cHFdDYomUbZd0c/MJwQBoVkprC305hz51i+zboqPUXfr/d0sxvY2kQz84hNJFnMtUhF0r/pGu3e
	+T1aovlpI8NrtZNMqBBIeVf8t9MlU0sfI5JB7A0APeqyEc/fxbOBuqogYE0pwlSQl+UI55gE+5E
	6F7iuqruZfAx2U9QQs503SsChA5bhsGF1QQBKKWl7lEzJU+QxnhAUd5ewiEo7JtHPwwPTuIHqDC
	xp3iSfooi2kqgRcbMDF6W0Vy4h8+6z3T2BaBXXOWMqyPa1bbbPb6Zq0Ud702Eoc5YPTU4lyFaWs
	ZzEjxTnPWyMmI+Q2BwW+7qg==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3603727385a.1.1792051252297;
        Thu, 15 Oct 2026 01:00:52 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3603715685a.1.1792051251455;
        Thu, 15 Oct 2026 01:00:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda044aabsm91788766b.57.2026.10.15.01.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:00:49 -0700 (PDT)
Message-ID: <6610c1a0-05fa-49e6-8c17-8846afd312fc@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:00:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: glymur: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-3-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-3-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX4KbuMANCnT8z
 cukGkrQZNvTRitHq7mEXQznwCccUx/RRdxoJ54U/kWiRylDPjbH3aURvPm9eoasdTWNwmgCYTn+
 nKk1cXoCKsHZMBYJpY36POyNTayJDREDhAJOxkpvVBnB6vDJVAYsn8+ttiTBZAk9dxycHdLQRbd
 A4/qawNpiCwcZ5yu6nNJIv5wnRMrzekEzt82Pj7/BLlWFTOZsX1pdgzPLPN+zI8LSedZXhCu1Qx
 xrbjsMUfRF7ZvJYds7WPmE0+psr6I9IJWV1LxuWU3KTmym8HAQ2WBBKkhMH5BltRg+Die/k7iie
 TT5UooR3HiFGHIzAO8stuWdSjjqHyEAMv0F5gTfIZ/gn0FzIf96aWrnxjIXaM5++Sh4inpxoaFa
 UHjxZIh8QuwEl1LKFVB42HKU0Km/YKfgDV3649i8n5M8B2vsu/j+IUm0OEusAdls/xai0gd5hHS
 UgT1/8KdtSXKYRrovZw==
X-Proofpoint-GUID: amh9Kr4gzz_QSb1qIY7Ymyml8mi-SL21
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX3HpbNFpu+2jM
 t3qxEee7vRmzYiaK4GrrOg431cNhsfYDFNiCO75b62RyqrfaYSMP9Ys6eYrP9PxWDQ4a9rnXQxj
 03EigUX7VFdYDjT1jWyMq54qpWnadz0=
X-Proofpoint-ORIG-GUID: amh9Kr4gzz_QSb1qIY7Ymyml8mi-SL21
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad08835 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CjiZw0He1JKpzbGRn1AA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150031

On 10/15/26 9:15 AM, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable shared DMA pool.
> Allowing the kernel to reuse this region is incompatible with handing
> the entire region over to the DSP, as HLOS allocations may then access
> memory for which HLOS no longer has access permissions.
> 
> The same configuration has caused synchronous external aborts on
> other platforms when the kernel accesses pages within the ADSP remote
> heap.
> 
> Replace reusable with no-map to keep the region reserved for the DSP
> and exclude it from the kernel's standard memory mapping.
> 
> Fixes: 67641246eabd0 ("arm64: dts: qcom: glymur: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
