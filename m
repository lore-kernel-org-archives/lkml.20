Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906F64EBAF4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055684; cv=none; b=WHr8TDwANA2zekM13uyEYP96V7iUmBwPs+goZm0yERgFAneLQ/9VvgJPJBy2GhDLVp3L27tGxMycZgm34YWNwxEm28dmXfLwRXbjbP789i+8wVU+hDPj9U9lU0RFM257xIv7iczYPWOGWesKPWNgek0axIR1QML9xKULIIIyQuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055684; c=relaxed/simple;
	bh=NdMk2ynksy7sBjLxlWYdSSrqCkDbJYPWnxILUrgM718=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3nrLU6MbaTM0/JAVw3v5lED35TKZ3Z6EJtkpbzu/PFhZAlXGonJVcH0lIsx2WyXdKCHqzFZ1a7xjY1HjkEh5bOpzptZaDIUwMqhgctOq4xCt5KBBn9XsuYLoZk4nAuXVC8piaNYCnaPcEhGK2yoALEebesdjmB0rnzkL/WiNUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aoFaPHI5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCyn6DIr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aoFaPHI5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCyn6DIr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F82B5r1707262
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8kOE3ZIjhCz0Hl/N8eiEpRWdz6o88GEXiYS++yU+cU=; b=aoFaPHI54vkSpmpD
	a1Y6KPj5BeUeWY3unHT9VmZYPKV11uJlgoWgamUUQ1lCJg46kSfwkeL5kl74rFkE
	6B2wn/JhQdtGHCJUCeBAls0cFWaYnbvG/ar5Sqya+D88iCtKtAtOEKZLkI47WpwU
	9lMtlwBPzPp3YvBEy50OQ1xqScyFM/wVEqaPrukX6XfH2efEArOL83M7/CZY7Acu
	zG7LpGcQw6+UWQpbQ6pgPf+is/sStmsOo0Moo8JlLqAJWdxaBZL26Y0Yy5YH1yzf
	aKNvxikL30E4J8jBFTi37uRNToib/G0k5cCVa06LFP3Fxuew8qgSSNeJjNGx5n/B
	jsiQqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54sqtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:14:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338d5d0509so11031541cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055679; x=1792660479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8kOE3ZIjhCz0Hl/N8eiEpRWdz6o88GEXiYS++yU+cU=;
        b=CCyn6DIrTXr9R6EX0SYBEF7rgVygdqCXkT9jWy5L46KgJ7f94+4IkwyUN9imIWDjs/
         +fZTuAy+Hh3PQaQiVZzg0ODf+S8Vq5dK06SJ7yVk5OTVS9nTdPhHzOaHkOWxlasJ9sp2
         tf6l26VlW2PWGi6ghc6Ev67q7sPbNjvmOEI6E0wm4bLMRV8jQ12yNmbDNMh7vxl8KmN9
         RiU8Gpo54VyoRy6u+WuLPG0Ezq6i+LPNY9uJ5f7VNSwLsDfewrCj+jyv3/a9jU1wmY3v
         0t1Eu/yO6VCo21tajOSDOkbkkV4JU9qIQbnWTEsJwb5H/zgoVya3l3k6d9sSvNRy7wVq
         U3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055679; x=1792660479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8kOE3ZIjhCz0Hl/N8eiEpRWdz6o88GEXiYS++yU+cU=;
        b=lecUNgxCdxFa44AyH+W/QjFfvMZoW8qvACuUpp/4paEsMKuqCtvOn/t68Mh3WVkn/L
         z1kAArQiT6zwTw6BNiCJiFW825jFd3vomvRCdKFmVhKQccY8qZ4HFzhtAzR+nKJ6hcVJ
         Jv3ygOGlnOxiF9aErhtOIDeGPxYRI1ZI8pSRK9zM8EhkhvGrjUmV3u4Ky5hj1qNWMf16
         tvuCoyZER3c9ecly/H1iHrYz/hzE9nL8kpSaJUc7ca9vI5zju9WSdPM4mpa/wxl1Gcks
         Vaiy/OYOcnFQMEQw77/dfweXKRc98C1i98ARlejAF1Vi6r4Z/c92FciB1vJKB21Tf8qH
         aATQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVMAAaxolH8epV6vDfBr2ZA3Wf9dVvqdeij6X7kiQ5/SM6mmQ/JUxQIUqMumggfOfA98ITM99FehHkrJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTj2AftwyWygR/NmoYzrVjubxxSWV85XAt6vMnxSlSd1qLZjcU
	cahAx0Q3yp+s21qGZT08qFUaz2Pj+LtmMqDaLbkr2nTJmIm26++wPBI59F30hsrdyxVLsPVZgMD
	NL1UVbE7ijkQomshVf6xiNxtK2RDPJRyStOiG5l33goIEFfD8aBQ/cfv0zILPxxVCEPM=
X-Gm-Gg: AYBFou0qcRranoA06BNxWOGf1Fk5xZHtdmw2/oXnwKnfahniUFvU0QnILezfPXt/gKp
	KBab7XQ3sW0YAvNgpemOYT6Z9kx6OZZdG+YbwRgcLKzuWLdYKr2mr51AjBYtPUMdxZO6XDam8Vc
	cbdQOrA5nxuB88pwP14ChfFlNZwClkLqwMU8uok6MqVC3zieVpmEkDkYDJHv8xJZi03axmnjf/H
	j1esD/Iqr2jgzjhMIHJnMKubcmQVuUzjXnF+vIJAjzZvkxsvsyMIyJ1u4Or5HeJ3EKv0BUfBI7G
	Sx9BKKAif78SdRDzDoqN+C/+Y5TNtK+VYqn0J8cPpEwoV5AIgxU97P//lCjVcx77wvP/dR9IhYN
	l6n1Z+SEYEkzJ/64UBcTZ7A==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3283604685a.4.1792055679482;
        Thu, 15 Oct 2026 02:14:39 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3283601285a.4.1792055678894;
        Thu, 15 Oct 2026 02:14:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab11d7bsm101640266b.83.2026.10.15.02.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:14:37 -0700 (PDT)
Message-ID: <8c375f13-ecd2-4ceb-8bc8-949a90f971fc@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:14:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: regulator: add Qualcomm LCDB regulator
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-3-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-3-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad09980 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OJYj8EsONSIZtexx7k8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX5oZnQ3qaiG6x
 22jkqYF8NXC0jcT1NWyZrd+/B+WHXCmrtWmKkCnOPWCKRbfuUzwj2U6P8rLjMtU+etE8BKpmUcV
 jdmFSaAeXmyu1gxqsUj1M9oxmdO8E2KUO5c3NCnfug5Xht/wbGlt0HjcFGQkHv3P/E8VAEPj+3K
 9cWI0K3mdf2EXKtekFEOSGr+M1QgJbI4Ad2+jqwU/G3WUKOAm04qilmQIMjsN8pWIqwqLp6h8CS
 cielv+LijslPEEauObBtixUdUdXFHAoteuMZ83YPhXmkGwN7TDWPfDpm5D/ZC15dsfqlp1mCeMM
 eRNO13kt6eG/DafqxLM8wAxzrhi8c9PK13elT93sDY6pRnm8WI3v9TGL3Y80o5A5htsfHjmGJtK
 4QyUTAHXlzIsXPmShRaOuObvD7XY8my/PgECtciSfDgOWbPOIZJOsDBYHoXaMNescfqJQU5VDUx
 Rj8TAQkaT0utKakXw+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX73R11bB779Dw
 h+D7K84WeuofhzepU2e8Nbx5YIaPfLvg5IyeGnn7KeItLCp4IyA5eQ8avEKAgxfL/TxixOEF9g0
 h0XuCxaaw3UF9ypbjMljtI40RWdPSCc=
X-Proofpoint-GUID: mQshlMZkuQYE1Gctvri8ieqmtAbcNBcn
X-Proofpoint-ORIG-GUID: mQshlMZkuQYE1Gctvri8ieqmtAbcNBcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> Several Qualcomm PMICs have an LCDB block providing the positive and
> negative bias rails for LCD panels. It is not supported by Linux, so
> boards using it either model the rails as dummy fixed regulators and
> depend on the state left by the bootloader.
> 
> Describe the LCDB regulator present on the PM8150L. Use it as a fallback
> compatible for LCDB blocks on PMI632 and PM6150L. PM660L has a different
> version of LCDB block, so it's not being covered.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +        lcdb@ec00 {
> +            compatible = "qcom,pm8150l-lcdb";
> +            reg = <0xec00>;
> +            interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
> +
> +            ldo {
> +                regulator-min-microvolt = <4000000>;
> +                regulator-max-microvolt = <6000000>;
> +            };
> +
> +            ncp {
> +                regulator-min-microvolt = <4000000>;
> +                regulator-max-microvolt = <6000000>;
> +            };

Let's tighten up the example to some specific voltage to reduce
room for poor copypastas

Konrad
