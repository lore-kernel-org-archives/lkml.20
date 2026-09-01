Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566F3DA7E4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268361; cv=none; b=CiX4hXhus1zUfbk9AUxDDJBgEw6s7eBuH4uX7BALT/yXOdABy1kXqDfEk76j+xi+hHOA/2zLR2yEjp5B00O5RdkN8hX7vkMicjjlrTUAjN4dOkp5/tilx+ziB1CpGAxYRZchkS1/XwoyrSP8bb7h4WBaMpHkMCM/ixV6viZjWe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268361; c=relaxed/simple;
	bh=zon7jp5adl5Y2eAG6oMwJian/v+Jmhd9AHSeiXrsZ6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pn6ugAonQqtsr7+Ia2z44Ir4zd4UkmKm6CQkXSSx+q8AZsdG/U9P3k9fGPcvGHRqwAGlsa1dFNJc0D1I+RbFwcGD65xLFOMXU/zOFJ6uZBNnRcflIbf29E79evg5IGP2KS+RyPBuXcCDJibmGlP8W0Q9BHnpPkVSWoHCcFseTRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcohuhmE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+aGBt6v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcohuhmE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+aGBt6v"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJb9I2406403
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 13:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=; b=DcohuhmEjpLNEsP5
	+fXbY99VV61e7fZNptdUJbAuWi/YmvyDnnevc7K5Xkr7CEj5X4aJqdB88d1+mhW3
	HdYuZLQ+sG6fViTl6TYW0Qfrfc+FKq7PgQUA+0v++4qsHAHE+V4s1cKtMsCGi0Nb
	KjpAcNsSwoyJkpVO3bfvwSpPn5RcXNvzUxlwViTtydQwn5VFks6sv7jzeMm+P6r1
	hDpzD36D8r55NIWpK+RLS84IFhwrqSFhpPmyA4BgGwBk8Px4awb5XSi4XEFCVwa0
	o2uPwGAO215NpiTe/jaEKCqcjT8LzlCp/JM6HHRaV1/SPH3GY5IE50ol/ZH6Tfik
	ScrVFA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r2eup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:12:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so142979e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268358; x=1788873158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=;
        b=L+aGBt6vJ12MxVnkGEFWFYMpAgeXiPowDxYiNzoThBJ3SUGX61PxoF5KDOIW0n0K3Y
         Xa+SKnnSoXPly/dZBPyrp6qMWwqA7YCVnhlYhUwee/fX9D4LT85EUoBN18aOX1t1DFJ3
         oYNcrIHd2moEYkBJP7KO3ZImwDXiAdThMhf1sW3FRRV5fAR4FCfO8YV2DY+uxTDgtXMf
         GsLmtAFwSzrfkdQqLtEQsw0FJLYuh7TDO6u8r4XOL6oG8t0cIyXvZiNskUrx9kMUNH9t
         IfSgfd8TWsKbadL5/QyZVgrwO/DUDgvIEL/wLaIiMQpZOgh4M7oqVUidnniHivRwyZoI
         dAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268358; x=1788873158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=;
        b=bF5fe+ahRHkhQwzeERKcD7JntOzbqaONscgghA+onEAYVIey8/c+kGPbCMijVpZijH
         LLjBC2yy/G0eI65F5uAEnCyYlJbywkmHcf459PLWyfa6HkwqcpOtrW3tEOE6/hhp7PuI
         7AP+ggGpeaKUCAaFfuvURkiCYWMriyyefGmKzC5ql5r+Qn4EW81tES2peVo8ovLfYSvl
         k+ad2tjVZ0farHWvubab2Pt46WcTmB/OayFXEgKBbjS1aCUDuamqF9sWfmujKhQ88RaM
         GwUEuy7+3zxyaX6VxyMKmJjGHC9Vjykd/kjM7laRVlC7EfEwJQ98LYAO5L0iSIOhYvIv
         6ryw==
X-Forwarded-Encrypted: i=1; AHgh+Rpz+Oi0UbgX1l7rnySI7J2Zb3HCpNQQ3P7QNomjBzqJIsI6bz99685VRpH1XM/ORcoYkQag9HLUV+N08w4=@vger.kernel.org
X-Gm-Message-State: AFuF++n7QiNlxoLo6/wBax+mrwlC3Zc2wW3//KDBlDliK32TuttinLym
	yzoNV2aNFZcj9w1lhIkNNJ2HDtO7BEulQNWDCu+siwqzk9wg2X2Ft2kbMR55OO2F9/V5sXnMfj1
	rLj5vV/89OHyuBBWWlxwZCRTBVE4woZpWz3BA7+izrXSmwHajAhUiZp4RxVmIvw0h5Ns=
X-Gm-Gg: AR+sD11FY5A606XfcDlUKlTCCvwJpdNb51CiX2LYiCNAYnInXr6xXpcqmEUL8XKHhq3
	5o2o5zutJnbwPgdR3t0u0gvJ/EOegK4NxBQbgViXbk5PYgM89iePAqnYqATRgI4JH0DYvdz2jPg
	dyIzJBIeJG+X7YBYOfjv4qiNJQQSeD9mrkPcB9fnntc6Qj46osPhErrEI4NJ/4WKjq5GjXnQLYP
	D4CCiVh4If/mSOhR4vwexl2ZjUus22IYICrHunJ42yB9vPvCZLLVmJidmtQlm+yy3gtKwwwAZfX
	7wHjxjkcvii7Ez1SVeEPUD/zaooxoOVOvupOKjGm/CnlNL3P+KPc9mYXxOcis2P3QJxtalpn4T3
	51vAzQGC/8YhpqjqfnTnSig==
X-Received: by 2002:a05:6102:5044:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-7859956a0e9mr4248249137.2.1788268356883;
        Tue, 01 Sep 2026 06:12:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5044:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-7859956a0e9mr4248202137.2.1788268354886;
        Tue, 01 Sep 2026 06:12:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b605b1752csm32498e87.81.2026.09.01.06.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:12:33 -0700 (PDT)
Message-ID: <8651e227-5038-4684-ba87-df74b89bb903@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:12:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] phy: qualcomm: qcom-uniphy-pcie-28lp: Convert to
 PCIe/USB3 combo PHY driver
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-3-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-3-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96cf47 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=1f8iOkyuOCog2pG1YhQA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX7zRd2neitn0G
 lTWKzMXGJ2Hv3lUOVaSugozcnKy0ahUWPF/RTQ3neinifM9oFm4nnW1T0P00IPLZapwbIBCJjyU
 cG07jrD4Vfhm0ag2eSEgnvxYwqsXp+2Wu55zW2FwII8XRCjPkqrEis0mH4Nr6kotJBCKFOGdfMb
 lsArLs+TGSwrNw5PMrp1C7EoWUdbkOLkMFTx0sSChXKDHPkQ0F8676TfG3qsPH7k13ZtWlM2Ho7
 XpXTDd4qMKZiFrlqR1aD9Kg223sVXVnztOrjlM7oXNXf05F5IPgbSDD8eEoFFF7TraWLTkAnbbP
 iDWi3skaaE5z4rc7GX35VWZJebxsPZyV8WXT5U1uYv+vYclkuxjiaKjI90GWy1o4pJ0bYh8N4es
 1LFbnJqIadpq09f5KLzKZrAmtmWMk7n9yeITHN49sYSLgt5ZJ2jUL2s6L/70n4fCC+ZKGuWNUyJ
 qeiitb4yJn52Aw65+PQ==
X-Proofpoint-GUID: D88Zl2Q5eeRe8ZOK84lhtvR1h5cFfKjT
X-Proofpoint-ORIG-GUID: D88Zl2Q5eeRe8ZOK84lhtvR1h5cFfKjT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXzr6gx1zbv6KC
 TS/OEXVzPZ0codxC73hnQinliIG/Jxk1Rz7SNPuOANJq3EmTsMVLPkhVgd+uGbZcKZrgKZhob9q
 lLdWeH3WP/Oz5GFNprZ5DozUWMkfVXQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> This PHY found in IPQ5332 and IPQ5018 SoCs is actually a multi-purpose
> PCIe/USB3 combo PHY. The driver was initially created for PCIe PHY
> support only. As such, rename the driver and generalize function and
> struct names to reflect that it is a PCIe and USB3 combo PHY driver so
> that USB3 support can be added in subsequent patches.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
