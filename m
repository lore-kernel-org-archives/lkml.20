Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660321;
	b=TwWTfmLlDL79rklemfUeJFkqJWZEXACzRrWdP6COt87LI7yj78eC8EgM9Fswdm3M5doX
	 we9Q3phoimeN8hMBTj2K2OE0SDPAo17kLq0mcAeDMmVIMfPRGfdyh88m9xAG32IiPYtNw
	 805MpFaHXzQxVI4gtavIntuBIln0dyuaAK4Ae4bqzIXL//rI17w0LXvGwHywy7XpoYohO
	 d+JVIJ9Ugcro0jRPIp2fcOvEDPlAlJDQbOTMze4SufiPiHw/AFcrzGjcY8eJ4noPEwWqc
	 CVWKxv2YQqZhmlGwHpzuVQXdkQDLQOSD7auO2adTgcLZlpxXKXOHvmrzOlduoaU6B4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660321;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a2/oXuthUW0jNB8C0Zfw0YNuEEx3T/Taw4GTzJx5fD4=;
	b=oDeWv82OhX1NGAvmG6DlfE6JBKXHsttTdWsoZpG2kpPKeuGIJTf8gJ5I7Mk2S/viAZIu
	 pR81oZrO4znjbzsMg4AY0KzltDhSlySg/DDAwh5483Y21W6Br3BISWi2eTHlqD5eJkkTD
	 7UDp/n/cGpxtivsQIxktYOvpNdh2vLGN7NmUJ+GdktJUGtJTtoJN591ya1xOIVZWyfeJk
	 HagZhNdsJNVtZibT6V1LD864Yekw3n1BVMtj9GcDpjL+MpaXfA9La8+ASXg1ovcHaoQdx
	 uhAZVepCmgtG11aEdUV9wRnElZzB2nnCVbEVpfSFTI9Gkev3ROeMJD6kSeZe9rqa0Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TGp92Z2q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YON45gN/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EA1606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10EA1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TGp92Z2q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YON45gN/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M706K34136656
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2/oXuthUW0jNB8C0Zfw0YNuEEx3T/Taw4GTzJx5fD4=; b=TGp92Z2qRiuIw5Xt
	2+Nf3o/13TUS3DacfQ0+o9enLx5g4jF0/IJ2Ov/ohrdAMwer2R0hklk7BAWDO5kF
	AIXe+E82f+ksId8kQU0KUInLTYuJjwZCVnEwJ6YpzxT2ULcDpDmbwNubEbKyMXA8
	KkxrD2iZ/yJgYvlFy2Vn3fNIu/+LXB7CjyPYOb3p/zi50Rfy+RFT76JChNvhoUMX
	aKbYCqp9LFWJJtVWhfUcTkaPvJx0f2DXWeJqJsMzuvKsUNbBB5Mgybr+1uBw0YnX
	dXP5OoYRxqnILRz8NWnP8+EQzg4671xD0FoyNAqU50qNj0LlUYMOf4ytfdFPivx0
	SB6cMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9mgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:12:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so37091685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660319; x=1793265119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2/oXuthUW0jNB8C0Zfw0YNuEEx3T/Taw4GTzJx5fD4=;
        b=YON45gN/DeicUfBqI3hZ0qHUz/ossG1rPYMsdlEplnTbez74iU9c4sTe5JKfjyodgc
         6rWqL6rLiPi5S7QclMh4XNLQkdK36iSLW3BH7MiZN6YDS50zUiSXg0C5FKX40eaOZOqq
         2OoTW7c9mvrikLJ/tE11sQLXjHcE3UJ/gPR2R24ZrXfqXTBQ/FnG+A1qn8rfnhdZnPx+
         t17TP57o1dIJsmRvXJJ2qewo3XhcXvdBUxjqjp57crR79q1luGWLMvvZUR7gxPxsB23u
         YD3/NeU34TIvr9byCKwgU1vmB6V8hP+n2+nEsYhvUI6Tv/J2wGtuwVcczH0wsg2JvCgw
         RJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660319; x=1793265119;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2/oXuthUW0jNB8C0Zfw0YNuEEx3T/Taw4GTzJx5fD4=;
        b=Ly3sm0JvNdnGLrxjJWcRSUaW9fJWBFPAkvhFIxNPAcQfdJqwVtUMhVXGwsrH22HZfB
         zNs78Xh0s6zDdWuxPo02G/oICcQ5H/9NWpWMo3wXivAvhuDEYEerZf1lJ6rKw3jwevj/
         IXKD/l8G6RvH+FGmZZHTTdzBEylD/StSzfo8yOLQ22YSnXvgSdOe2XgVAwgkE2LzdvqE
         t/He7YPSJwf4sRF8vcTyRJp7I4qcOpcpy+abWKy2aGcJ3yZf5MDOsZ0fE7D5uucQeY1c
         bPPSQ/9NAHBuf10ifkDtmUxeftCOyP4h7yAJ+2yfTNZT1/0KS8RiDG7rdNYkrnS1N7is
         8nMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1euBmgebT5NHOvIkARC1nn+ValMWJvPAIJUbmzuuD3OIc5laVz+ZNrgFSQlTVNkCO5DTrje66nOjOpiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4WOnRRjvgbYuGHKbYh2Mns7QtmEEWRMXVu+AYUz+sHhKvLCXL
	QqW+Nfa7cjSAxkAbsdOtFTR8+sIGgRvc/VVlyY+JOgw0gCPOBb4woMtQxBAxCIcxOF+8+EJc11J
	hE44PGnqJ53UQhwlmeJlSubuccD+mI6H293nJwXHCnJh4kARQZHT7kBjPgEJKRG9wOhI=
X-Gm-Gg: AYBFou10ykglNfGXMKlyOpF3kOj7/pAjXWhghasZAIIyfWWSU6CFR8LA2Vy4+bHT3V0
	4cYOhEkh+73EAaH6X9luRuhu1telSpdViVJSIDhRB+b/yOq9vLHnFVe1IoCqT8AAaLvBiLtIZOr
	9ZUZCxLmPTNYuGoHOU59MDgxl+4iYhu9J3hK90ZCdK97EX8+r5ga8r1Mz6G8umye0HlE/pvsLqF
	DZqBKFhCVx6Q6eHxi4wdF2CxUhleYQ0coFt66hcTg52s6qI4TXFS2K044s5KHum9SzpnrN3eaKJ
	ShHNIILRW60QOyJyWTkLUAVX+VFVR1iPgt/6etMH6tL/34kIqoJZxGrlwrfh4sSDmRGzEVoxnsp
	ECs9ih28JrLazjsIOOXaFZQ==
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr1042851485a.3.1792660319162;
        Thu, 22 Oct 2026 02:11:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr1042847985a.3.1792660318782;
        Thu, 22 Oct 2026 02:11:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40317024asm1565099a12.37.2026.10.22.02.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:11:58 -0700 (PDT)
Message-ID: <4de4af90-ea39-411c-8bdf-999d6bb94338@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:11:55 +0200
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
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add support for Xiaomi 17 Ultra
 phones
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261020-nezha-v5-0-04898d6b5f80@mentallysanemainliners.org>
 <20261020-nezha-v5-2-04898d6b5f80@mentallysanemainliners.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-nezha-v5-2-04898d6b5f80@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXxwjIXmeAr0RZ
 WCKiyaZJmBvWnMNN91BW0BKwXhkFs6951JXFGoTT6/5ACLoiH1SkjROwnuT8UI87paGqLpXIyyl
 mYi0+SIkQskHTxB+RRi07IQ3Q/b4Wlg=
X-Proofpoint-ORIG-GUID: t8l58Uu17GuBhVm1Kqb3xQKOIqm5oic6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX8VbmWOiA8+Fu
 IcgvzRK7z62qK7NVTcDomPh8/50axBLe4xw3O4BdwJjeiXxUjIbEju5Rgf8kk/ZntgkT0aM0L8s
 Zfp+VAicjkWpJeP7vLsYzSeEDBnTefFGicxLuOlCUS6Mr4Dhg19mNJLR3VRDU+YVO4q1EIKZhZx
 j0YfWwysgQmOz9o8UA1b4icwE/4ZwAVKFoZq/eN8+U78RXtK+BfcZGDydrmZflLwx+n+OAd6w45
 TfUicEr7yoSxGm/CCjobzqnh1JzM/aY5Tr3QZ7V2Lvq/3oujdxUJJkDqkZtogbJnTgM55ti0r/1
 fTm99PpfneU7+rIqr6BR6w5bgE3VwEM10UsEWKXvYnpSKLImCmAMz+uPwVzfT8GHdIkLooVC14Y
 g198P7MrWE9EmYgckg+H8oW+8KsLBb1X0CNtiaPx1mIh3Qu4PnuJnvalQKynWdc4HfCRiiwzvMb
 Ah9qAnDhF+RilIsYTsw==
X-Proofpoint-GUID: t8l58Uu17GuBhVm1Kqb3xQKOIqm5oic6
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9d360 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4I5MClDQAAAA:8 a=MDi8V2FcbNEfkNi6ntEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=1V3rjZ7Gd4_ILS_TCx9Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/20/26 4:19 PM, Igor Belwon wrote:
> The Xiaomi 17 Ultra device, codenamed 'nezha', is a flagship mobile
> phone released by Xiaomi in 2025 (China)/2026 (EEA). It uses the
> Qualcomm Kaanapali SoC.
> 
> This device's configuration is based on the 'MTP' from Qualcomm,
> as is also referenced in the downstream sources. Apart from the
> usual differences (i.e. codecs, panel), it also uses the newer
> WCN7860 (peach) connectivity chip, which is why WiFi/BT are not
> brought up.
> 
> The difference between the EEA and the Chinese model is the battery
> capacity, notably, the EEA model has a smaller 6000 mAh battery when
> compared to the CN 6800 mAh SiC battery.
> 
> Currently implemented features are:
>  - Booting
>  - Power and volume keys
>  - Storage (UFS)
>  - USB-C Peripheral and Host modes
>  - GPU
>  - Fuel gauge
>  - ADSP, CDSP, SoCCP remote processors
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
