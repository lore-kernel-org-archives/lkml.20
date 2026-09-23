Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0CA45FFC7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150411; cv=none; b=CvW4UcYMKNRuV0ejqAkVZcJliGyzh/knb6L+77H/w2wzlGNMWXH7q8Gc4ribZdR5nP3Fa0XpUt8gc4JFWmaxof8JOe2aPBSQ54F0dc9JKHsnzMGfhb/l2/u9BYT2KYnno0+LiyKPOQhEqvIXeYYb8zFoxpMAXUo0DMrQ8VfwFoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150411; c=relaxed/simple;
	bh=VEqNlpxOEe1fMjABVwJSU8ejy3HEKdIzvDohBBnBmiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XjD+uZubIyfuPMMxreWOkpqEtOKRAnp78NtPHW60iyHmhp+IBXIlWWudtHhDr2/MFkj+boHeK8bQlxsZw0DqZ7hBgUxM3NRB+G9Cwdi8/t1hmvDGPmOuA0T00l5QUCdmW0VToQC3rG5ania9x7vl3rlzYhHRJZrqTknOtRRzZUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+qt93AW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cvg6pAcy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+qt93AW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cvg6pAcy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79Uaa2819157
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=; b=k+qt93AW5iBoxzIK
	N7HtfLFbROkpz7ZY3ck0/fD5KMHOkgKvY7ByiMsfRo7m94M1jShAkrgIqHNUaLEH
	ObxhLW0p0iTru0LrYyhPg1clg2YT2O8WeRTai78t3Od9Vk6DB6viNbMUaJGyNxt9
	0cjzJD4CyeLWGoP6LPsPLP5i4FCeFttw/YpKw8RYn4sFFjN0bmi4FZn0ub+ibS8t
	XzUZBfTbFfYyMxf4+p8UUZkfnFAAg9yM1M+MfWHqxVaV2r2NUneFmj5s2MwSMKdo
	eazMyuz1XHXdjgT13gSgtFKGm7l/0U7q7fQhie/YSx9FqJBk/jA7GzAbdE5wIWp+
	kDblKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n0v0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:59:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so16033485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790150379; x=1790755179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=;
        b=Cvg6pAcykhv4csACJg1e6xLS3IkSmDDzTkSfC3dFPFGS8tP6YPoQikdv45Kft66EjY
         gmdWx0vO+cxVEbY3aywHcCOQHfo+BwDZRzJUBtTkGxMTOz330b4CZ2bogPx/KRsLtA7n
         Z9xiYxZKhgcki9wH85j42ecCo5z5FpY1pU3JN66CD9SNWogcKaQ6zWQ2NyQ75KrKtFr6
         MxD/k76hOsUrB/vhSNMGtt1iupbcAAp+NPg1RywsgNMJOparZ9IWUHfWGMYKDHURZJue
         qALLEItelV2/B2Snv3ao3EpaFLejiLVuShZjSRogNkZjcpUCXJ11SaSVi21p2TA0goq5
         8UNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150379; x=1790755179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=;
        b=tadKe3nUhU1dYmUkWzqaiz0r8y8mxMsTKPDGZiDF9yObZpj4wmcsGMpXiBGy0jP4EY
         KDKPO61vop/AL3hwwt9R8FhYEqvsAlHcXZrct1ZAFcFnHVMR/IB+LguOLTsSxvNgSBhD
         0g1mKP816ei76nrqBQiIRxbM05GjXnOvOmF1UUKnN2yc2ZnDcuqt2QvubRfGAkrKnXh0
         Z30S0qY1ydbvYMCXHcQUjC31rG8Qf9dEn06F/sxEF1KObvdgdYOtAVlLPBSGGABhQiqY
         1icB1dOAttWefYWQTTqvy4yoA8fK6P1OXCDvqQUsVQQ2kK5ETo0Decm3tB9T4eC6pn1o
         WQTw==
X-Forwarded-Encrypted: i=1; AKwUvBzIRwslxV3yypZ529mlthPOF0l5D7XIbbpI134eisKFlwlPTFBi8qGwYGdDGWxL97D4WElnsT8V+3Rhw44=@vger.kernel.org
X-Gm-Message-State: AFuF++mgIaTbYUPGba6Tv5AGHt5VVQK3oAO7DYwtKdKPvpnJ2Cl81o+A
	GBWPl5C3GwDlx7TSEwkCb5+H4SoKtNQvz5SRopobFOrDjtH4uMnjcGsxPq+xb0uYmGvYS7BLxfA
	MFyvaGYKk7pcQf8xNRumtJ37DWt5sqZZ5sXkDmiFgFoAzelCjssnVx3baXRynyOM9ZWM=
X-Gm-Gg: AYBFou1rrR3/9jYreVW4QeVSuVilSTGjPYIoaMh0sYhQazGAqSeowK4UfOJAoQ8fyzy
	hrpSpO8lO8bm4E/PbSibj8s/LatAtCqYiwhs2PjCxiBxTwscqvJRBc42hZvwKYKqj+lSSI4f7m2
	f2D2pWyi4WjibnziExjhGbslDC/OJ96iKBDWi9S8UQO5jX43Ph2oxrBrPD1hV6MQeP5WCMnXzS1
	zMjyo3JVW34j15pNIJ+aM132/bgFMiTdufbnh+4sdlVP8TNbFvdsug/2SQTzd25G0nYpYfQSxH0
	45BLUmSlhIIjygjYemW0JiFtEU/9ynR+vixVstxnTQEn3TRmgkgrKZeBxxU0wAMTPwR97qTg4RN
	kx7PI1vM/yHI1HOsXL8OzQw==
X-Received: by 2002:a05:620a:44c2:b0:939:eb09:4458 with SMTP id af79cd13be357-93c251efb93mr285628585a.3.1790150378883;
        Wed, 23 Sep 2026 00:59:38 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:939:eb09:4458 with SMTP id af79cd13be357-93c251efb93mr285626785a.3.1790150378530;
        Wed, 23 Sep 2026 00:59:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38bbd28sm1087675a12.28.2026.09.23.00.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 00:59:37 -0700 (PDT)
Message-ID: <681ca16a-7452-44a1-871e-81a5db82c036@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:59:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus-common: Configure MBHC
 thresholds
To: =?UTF-8?Q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260922-mbhc-v1-1-bd123e7fb899@adishatz.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-mbhc-v1-1-bd123e7fb899@adishatz.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMSBTYWx0ZWRfX+dUNZPQMTDZ7
 Hao3MfiAwLr58UXHur8HJqoSELKcaltLE7zWi8ufa5DgpevJwbCUOWAIVVLS9Ou/10sM86XEU3V
 WF6eOlTQPhrJjKCqrDsJBN2xXzESggQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMSBTYWx0ZWRfX2kMfJ+bJY1mq
 tYJyQv7auVOM3LbOQBsTJ3y1j4+7e98J5isVj+bSyZY+NibdVNvCumfxdJKE2WIjdUwj34Tx3I9
 /4oKetiFXX2vR72IQ8/3qTY+STzzBSWIJdBqKI8Woq6TB1FrXAb5MQ4dp+Tbo/bHX4Lu+t+iYMy
 ZNxCv/anZkt5pBigr0K392tjO8mP20ekwOsnA5tlwkORDV9dphYKxaXgcQ//DgXiN7igcy3TTK1
 P8/8BR6lupVPmtQebA2tdP0qaE4cyN9BlX6TGEJ1gZQ6AeOUd/1m0gPkL34HbiAQ4eR1GRKZXnk
 UeZxsBj2UJhk1pkYc9OkdstD1H9QDP6NVVHJMLF/2E+bPQpYPYU+Mg2rng3GwxWNxxqiiF96EFK
 MjaHuykdrWwDHWVqsVLwwZnjosda8pt4/0cZoqzWUiSuPSyO08s+rBemFZ2cIk5rCYsmkHwAr9z
 L+lE04IwMvJU5s68wFQ==
X-Proofpoint-ORIG-GUID: kMONIMTIoaB6SseG8WllodB5zfEVbShW
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab386eb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=LCWlJkpBAAAA:8 a=EUspDBNiAAAA:8 a=C9R86eXXc2PCoiogm0UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=z1lahxahPt366DkPXCx7:22
X-Proofpoint-GUID: kMONIMTIoaB6SseG8WllodB5zfEVbShW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230031

On 9/22/26 9:48 PM, Cédric Bellegarde wrote:
> Configure the Multi-Button Headset Control (MBHC) thresholds for the
> WCD9340 audio codec to match the vendor downstream calibration.
> 
> Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
