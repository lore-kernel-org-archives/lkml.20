Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578585;
	b=XvC+Ub4li8xHjjCmo04tNEzIzRHhvbph1IhrS0E4YwOAmlnyW71rPdT5oggvt7uAPXwY
	 JRvNLFjUxOwCBYTdEr09n2SOsWqFb6y2gQI5L8W+09BaCBhkdn/9XYQKfroo9a+JBP/PU
	 S37inqrQiWEk3SidsZWaTRaxmXqICXr20W92L1Hxi0w9uoOeT4ljxG6fVdeoI/9aHPQ/o
	 sixkowYxg1ETkMrQK63D0K6MX46pZPjo2DVMHzV9hY9cxfMqbuHnka7uXBWfuHfDOYcvU
	 jCAHzvrZW5/ENZMIrMeCSeSS+YY+jOs9l1494O6kVOSHM1hcQMVwRZR38GReRgDk5QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
	b=0YSW6EprOws/PQ7hE9Ld0oFl7UW7EnwIEaSnqbpuhPozZondHaOrbeIbfElYL0NG1q2l
	 F006HuGDI7i8B62bBbF9tNi/WHD2re6BY7FG+IYtktP3RmsXwpxtoKfthezdBMLTZPrx7
	 7eUPk//wz08m5tdRpAdf+1Ed8nsiyqA3FHFM1U5oJJ5iHu+ttw3XkFtUCwmxjE1+qVsB6
	 zqCAl8HKQfIjB7Ee3UgqAlSujzkN3hsBlqH4/k69zXgDB0CNvfAW/XBmCnnr4YC1V4AJw
	 gDKIw+0bXLA7sdBaUxl0Urj4VWlFzXjZHHjTrE9qLeaNXUWHopJMMeqJW1khUxXXNeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KD0TTfdf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdzmc8vI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B36606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B36606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KD0TTfdf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdzmc8vI
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5Yck335128
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=; b=KD0TTfdfaEkJ+Yel
	xsoKUVDsJoAGY8KnexfYH+f8Jv/TrEWvYh+k7bA+RhvgyLbR71zh6sWA8dHmswDo
	FCf+o5rV+NA0ZOROJiYVnAqNm4qPWg128eE0yICi0VKaRYBliukjgOHvlsHWeeeK
	70/jpNo/5wjEmOknYkaRhnK6WLrNi9N1AfiJSRmpwvdyRg+0sIsz53KhtLU/G/KG
	Mu0848esElpWOWpMJmdyl3Vw1xQLbNCGsmEvbMuq/UQa8tnaVJCVSaix/P0FniVF
	lWdLamL8lFa02RNlh3jBhsSl6DUGA7RqG4BYw1ECZa/MIeSG90ShUmxkmh+qaq0f
	tptwvA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj4897b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:29:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a04d1cb2so1751726d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578583; x=1793183383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
        b=bdzmc8vI+fihp5UpEteY8hfq9tnQR//8C7bL5AN1cByjAyeD5ilxmkdxcMwwGnGJKj
         aqWNI1j/Q5SkArF7YkS5eHf06AZaPiu1KrUHlXO79KhkUw1pqaBqpR2jUhxYkYHTuVv1
         KgMab/6XABFuSPxBquwocXOY7ZV2rnuloBQyE1f2ShGUZtk4AWT+/lUlZRqwMFWn8Iu3
         fUBFQj2Q3Bf0yyhFzzZrbeC7H0WY54IjJzql3JQ3HKhs9GkLeuNS8ZdMX4O5g0xHrdQr
         QuKacvFOl4errF7/+M2zaWvajqt7JBfyJvR8ChHaNNss9eMI+zwjnbIB4+AZOKTGyRCO
         7R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578583; x=1793183383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DA+9lB1827mjm1K1LsKgxeLWDvTL9wvtJA9r/c0C0I=;
        b=blgr2I75KKywEJ3cYiV340o1+AJ/VCAL4ASxVSh/vQIOMT3IzQJvKpAzvO+KuEjIAQ
         Dy4wRr9w4wqhivP4ggf9fr1gCFlCqM4VGxcsQsWlfhnXxlppnftRPT14wAj/Fch6n1AL
         uPXrJCHQFCcGNBKQUx1DBcbzV8WwLrcMCaZenZ4lVVjRS/DL+x6Ot/Rqr2J+DCw07ul3
         PaL2XWcccVZKZ5x+x5oJRByRyH/GTgwCrYqvYTdwPLcie16S0RVZN9w2h3h89R/6M5x1
         79/YJg/6rl8pbwvCFssl8XbG1Vh/kBKnYC7YB/uZXF0qJJsgDZO7pMlIy/cuzjvXwhwv
         BCOw==
X-Forwarded-Encrypted: i=1; AKwUvBxh/78mpIXghiiyDZ5fS2x1i1C3DgAisg6y69BuIkvQlCqlQYNgmnDFEnCdvJr0CH2lWY6kQYyXJ1W+TUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7xPW+9iAelrmnHWGRZG+BMOuZJ49bF7g6z23R75lQ4X6hEE7W
	ImX4YE/z86/DHJW+2CI+hQwzgf8ne3vLFMmHF/AQMED1/wXvJZWlmysSKE3Cw7kqbzcDXHexbpC
	TK1Hpe05lLX0JXCSO9Md/oTU+n7xeHjrJdRHQZvm1alBPCxfFQnl+FrIoo6cy4F/PsFc=
X-Gm-Gg: AYBFou21oHSdx2RdOV6a0r19OrNnWM76BYoQbDyHqj8Ikj1HQXOzoaqveGwuxQTq8NY
	v+yTpkNEJI/jsCPxCPeXsRR/59bekHVoM5F3kmsLopUjPNnLLLS3uifRPXY2Fp2oM7uKHqxxyq9
	0StKzdIbA8RqBjLzQyBzR2tn5gmyFaZ2MNvNWlK5RerQQaYAa9unUurwClV77x8SA+mItfliR8r
	d0QeF2c/XXQ12KlqPszmdk9FUcXJiDlu2NmtjWMSKbt9TcpWLbnsURrXKTc0F5qksC2Ql9zRr+A
	HiVnXiLbN5/ddDH6ZbtymBpy9CCLZvPsmuJ7RsAHu+x3G0dUXI4+u7Ly0nJLI5JHd4exzkUvKHV
	+xeYr4LWiqeY5IXN6AxvaLQ==
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26734151cf.5.1792578582630;
        Wed, 21 Oct 2026 03:29:42 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26733781cf.5.1792578582113;
        Wed, 21 Oct 2026 03:29:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679009aacsm64407466b.78.2026.10.21.03.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:29:41 -0700 (PDT)
Message-ID: <9e60b65a-f412-4026-b84a-6a9bb8b5d42a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:29:39 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 gpi_dma0
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261016-beryllium-gpi-dma-v1-1-76ade615c571@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-beryllium-gpi-dma-v1-1-76ade615c571@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6f_99lrAwWrbjnpPDlTKZgaRFHuqrVMM
X-Proofpoint-GUID: 6f_99lrAwWrbjnpPDlTKZgaRFHuqrVMM
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad89417 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qbaKm5uNP53N5VyfHtwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX4oZUa6d3ZW5Z
 F0bDUnVi0pZvjVg0nFjhHgnBbNGmJHx4PaRcrF2ugJ2yE9qMEKYuS4Is+dLn01R4uvtwBHkrDlt
 P6nxwrRfAzbA846GJRDjd2hdhpPJnQlQrW3XiPj/gTzFutRkoKztuWFH8TQZEBsaJynQlTRw8+H
 DJO4SaCG7FYIPJ0T8ALR2xXn2LOCKeHA7G14LNv14U7eEh+9FRQR4ArFqOL015VNajk3lthhjOs
 33hJxxyO1yUoDUZU1Kth8iU9ihT0ZDpzoyUYBfynA5lJm0lhSNbfP3SvOCBMQdbGVi/z01ffZSU
 FOa61XdPxGhCgN2Jd9rSdXOgcUTi5qpGdSeCRAfiKB1kyAu5gPJt4o5RvCJd75s3kD1JtP3Wg4J
 XLvsyluHLUGbY5BBIc6Qzfl23UZnP0vRxUUDk+8L3P3WZLcTXeOIih86uKiZIzy7VIYAZs8rfdg
 xbUqP6TjGbjK6KkycRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfXxRiE6SKdbcu0
 dcOoNunb5mphIX0cLS8lUrTmepSfa9pXQ5fvfOQkT6d6E2PKs7CNPXUTLD2IzXxqo67h5KYq6OL
 SBiEe3nn5LHax6M4HDc3J6aS2a7ZajE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210041

On 10/16/26 8:38 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Used by not yet introduced tas2559 codec connected to the i2c5.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> We don't have upstream tas2559 driver which would use it yet,
> but the gpi_dma0 is confirmed to be used, thus let's enable it.
> ---

I can't stay this patch is wrong, but I can say it's not
particularly beneficial for both of us to go through the review
process to offload 4 boilerplate LoC that don't have a functional
effect..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
