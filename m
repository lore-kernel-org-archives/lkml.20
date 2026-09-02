Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A691466B4B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345752; cv=none; b=llGkRjU11GKE2eT5ovdKl80GwEJo7XE5AdVAbgvkzZQNoYZ3HSaSNJP8VOXMf5sI/C5E/1Ch6mbe+ktviewNbnfCtHTioeMa9rMxtrcsUi0GTVXVEsz8JsdSNNmYJSLjPxGYD6EkPhur20Ct0D/bA0gV1mm59G3/yokYyHy2dhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345752; c=relaxed/simple;
	bh=v+f50awr0OZ88U1G2v97y6c01J5BI6TU2HpExBJ0wcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tphty/NJBwZPOdRUW3tlC0ja/wJpuuN2+iRTE4lqXu9+VE0In9NWkXwq3LHpSTpK1wIy/qIO3biXD91MxzaAN6MvY2r2tl5fgC/5V+kR+t2gwQrbPs5fQhnEsY5j4lry1ga2uuoZp4ZFRYSVCiMyT0dYQMTSpE0LQFQuNIdNSFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaYcDduk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuMcHDN0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaYcDduk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuMcHDN0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NGtI1239399
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYnQe34KhevnSS7u4RCPgQ3k+Cl6PwnRX6FcYBLfRUA=; b=PaYcDduki1gBueqR
	igOujD2fG2GonUhNJfHusEMnYKZUWfVzoCm+OXuxB6nWOzQr7IB1mN8ADGWkf5BH
	y0aEx6vJ5nSSJQqK5/ZOHLiJnV0ePNnrtF77hhx0bfrxHyljLXKDHoxayBf6xAlq
	gJAN8sIKG8ph++pdfVThh08gyCvTBaLaKoDI1hVrdDd5ii0pF4DCz0812e/k5j4y
	d12XuHtZu1OgpKEk4oo1gBCBcF8Rft2ei+mYxok2VBwClQGglWFmI29y96M1/WML
	AGPf+WcHkJ0lfr7WWQJwWHgbcgQrBb7+H48yUsvAZrp+BIGEMjFGqrZf9Q2ZLkZM
	kmSERw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge38w3e5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:42:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cd9fe6336so1756276d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345746; x=1788950546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYnQe34KhevnSS7u4RCPgQ3k+Cl6PwnRX6FcYBLfRUA=;
        b=IuMcHDN0lL21hZ2xHWUVZEynHyN7aAWp3jjpBVlXiJdAunElqj2KDq1ACDOtIBzBlb
         rHZaOUFv5ThNpbhEvjTaBPrsgQmx2KbVUMMAl0D/48dwsG96d2WmQI3D65/FzLVX/fX3
         r4ExQ8GfQNW+isfMIiXxaVLjHv71eKWGJHHCpqJdVMv4+oYJ81n24mQV3bCfdLWER9si
         m8+NaPjysajxq5cj8ijl3TvKqnE9mRTQuqw/iumcSN2eg8XPMDFMv7PXH9KZnkNNyqaY
         rQFNFCQcfXtpNWn7Q8X0+5a0XEGVYwM9MOw/HPOx5/ugNj/uW1SqSSCg8w5N28nYwjNT
         al3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345746; x=1788950546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYnQe34KhevnSS7u4RCPgQ3k+Cl6PwnRX6FcYBLfRUA=;
        b=SxYzWjgoaLYu53WBYY6g7hx0Jq5UfMfafrHU+UI2kJU4B2h0Ldtab27H+KcW8g7WHh
         VDWMM4/Fo+cYbtUnebNMQLZspcpOhHUH2bpzeVyzY9naZRzlWJmkdxCZGVSMhEzj2cm9
         RsU0duzrc0KPcur9fXYhVJIpSzSmFmuIzuon/ZLvtTwTSI+j24PtdH8+UcSOSm7yBC1C
         o0poJirRbzneRVZIHTUG8r+Yt15Ll6Eql6zItNpDxqsZHpd6N2oOJbrfj+jIQOTcu/Xp
         4OL+ceQCsXCS5Uo3b0zGBwKu3nLEpo5KdqeoUMpATGxphtjPnu5RHLQ3OvUF8BtFtiYT
         PbBQ==
X-Forwarded-Encrypted: i=1; AHgh+Ron+O2m8eYphI/tDUdVoz4Lc3xrLBZ6VwPS7KNosNfAipmn4okPNH3lolouxJr2GNR2OWbIDWT6iw8Rg+I=@vger.kernel.org
X-Gm-Message-State: AFuF++kwbZ9EPNX7lDHdqr8RC6fAd+GaTKrX//qhEErSAI9dW+0PHykH
	TNL4Luf1WuqPOpH2Z/vH8G0HZ6PzvfRmKWIZWkTnJrau1zCmgI8Pbh7WTw46lEe4qADHEcASa8a
	qL7gAErc3n6kA583RoLsEMOUdHXK23A0REmFYS/raFx90MHLYjDs6tWypjO+2TSYvEhKr0x5NuC
	w=
X-Gm-Gg: AR+sD12dMbN81huPvDdatrLzrgEPUrYYbv0GTAx3nn0JiVJKarb1lZ+Ejqq3hngohsr
	q293zKIDzs93Yum9TS52c0FLlv+RJKwvQKurDKyrP/5Au8LvAQBem64ZL6vJcEESfp6uyBl6beS
	XnqXfPle2wpV2yYRgKnaMzrO8j2oFm2+OIHLwGJVhpbIRQZtfaMqIAtHjs48mfHsXczOZDBL6fk
	YQSYaoHQeBCQyReNOXgH0xS0eD7orYtAHTIMcKTq9pbLiWG0Dd8nzqnzSS+Hl8QPhG1Iy0E9kXa
	1uaRA8k8YsNHqhkhy5rjpXkmGyPOzAP8ylAGzNWJUVjIizdep5LyXOt4q+ViJHjmpZv9BjAMuAO
	AVI1ikMmNcfxjnlS+6503tw==
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr257849985a.6.1788345745889;
        Wed, 02 Sep 2026 03:42:25 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr257847285a.6.1788345745514;
        Wed, 02 Sep 2026 03:42:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d0089a0asm111279566b.28.2026.09.02.03.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:42:24 -0700 (PDT)
Message-ID: <4a16a8ca-ab62-4248-a9c5-5362765ecd0b@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:42:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: ipq5018: Enable mdio0 for
 SoC-integrated EPHY
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
 <20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629c7bb05c44@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629c7bb05c44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TDt5ttPkmNkouKEbK-mo7xyr709AvrcH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfX+TsfM9dd3x7E
 xDb06gJ/8yi5/fpfMT8sSo4bgx7PJhBa7D1BhFeIyJC/MVQBsr8UzL7sfb8DSC0vdofWFICw/4O
 ZtbVqblgDGl/MW0v67mtlwhsm9/AW60=
X-Authority-Analysis: v=2.4 cv=LOpWhpW9 c=1 sm=1 tr=0 ts=6a97fd92 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Ey681UiW4vGkVYvG5ZoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: TDt5ttPkmNkouKEbK-mo7xyr709AvrcH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfX6J8BH1snM/Wv
 /YD4AFibBIAFR4rCtlWQgFPs7ShdIMm69d8KyjkW8LUgzxRq22x6PSIE0W9FI9coGuSzuT/ipfL
 7//Hfh88Mb5ndup3JJdfXpW1Q3q4EB7bPlsHwq4Pw9t/uUotdvyV0GsARKaq68h5idkoj48KifW
 UsGINMWdQ3CTskUaWHx4JqCVaCDwxKqsfCdPYhCjTv2a/eitunxD0JDcQp0/JlatJl5UptaAs9s
 oSH7SeoDToJf61yVg8Yy6zqgYvsHFGemIEG+9yPP0tb0zGDO7TK+4HNRBr78fQYYqWKzcPqY1Zp
 VjR6Rdz4WnokdUY/uBokHDaQRLC+Pc6yYOUc3KAj/UpIefycCe3258KlCplaQs3XQizBmF4QLM9
 hgxwNPKPMZ9T7hfOZQ/uMUaVLDHNwBxPF7v3dcepDNiyMLmQTCam5puOgKGs9HsrTMtUeydn9d2
 CIG18b+Wd6/0g16pJug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020094

On 9/2/26 12:22 PM, Luo Jie wrote:
> mdio0 is the internal MDIO bus used to access the SoC-integrated
> EPHY (ge_phy), which is present on every IPQ5018 RDP board. Enable
> mdio0 with a 6.25MHz MDIO clock in the SoC dtsi so all boards can
> reach the EPHY, instead of enabling it per board.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
