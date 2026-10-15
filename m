Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0898552BE5C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073211; cv=none; b=LmfQTVYPzfOTu8JyvfWfcs37Et1GM1awZrarWwST7Jl6kwOH7GJE3HqukH5Oz2X21KNYsEvg7ogA9+cvbpHbu3bKeWejsAVPe/YpW98Sl3e85Uj/E8wv8rwuaB/m35XbNbI+s+cixDfDUu3Zm1osQi3bDJsefPZK+BdVsK+B8A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073211; c=relaxed/simple;
	bh=uJsacMW6Bz3Nv3pvumPMN2VFItWY87v1HYxtmx89e1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8U3iFi/tOiNJR3ojIuC0rK6HdXBmz04OEAX0XR763VnY249o/i7ETO5GPcXnt3+NcCUL3RMlMRqyRgWwVbRgd/5crG0TGoYCJZ9iutWYwhWjKFKd/9lt+PZq+MU1A/T2YEGaVZiyWIWNSyskTN9kOJ2904bZn9cP0irwYoGfsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXMcu0Gc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ppaym+Y/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXMcu0Gc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ppaym+Y/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPuoY1596368
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7nQZ/e8Knzo4MzaXh2frFTin9XEvMhbWwFnpxEu8qc=; b=RXMcu0GcdXKOOA09
	Ox+7zsR0qqqB2NcJAo32kaQf4xJ2YnaT6FGZzOISloAtoavxkhAI2cIWhqYWjDAr
	1AgqgFgs7KdV+HepckEazbH1Xk16pbcTGSAA5Ub0DWXbwg4rI/ovC50q9OyFK/+2
	gXPX66zTSnl4pekoNOrv/29tqutRql8O6xvoZxn9FBdN2dXQXybcqcrBxMbvZDYj
	ehdxE7wCr3sXAxn9zwF3oOe0h76e1fSZ3eyQ++bYU59h271IZcxjLgh6zy8fi56j
	udmKqxsJoNMm+lVajZatb0bifYX2jutEDLnQDh3fnxT0xdimwbEqBGAhjrCqK7G/
	VzlOYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v8ug3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:06:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb1091fffso43191385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073206; x=1792678006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7nQZ/e8Knzo4MzaXh2frFTin9XEvMhbWwFnpxEu8qc=;
        b=Ppaym+Y/cwrHEOAiRDmFDp8gHm+emtR0oc3+ykEn/GvV5aSWv5xOrW1ISLP0oaRdfX
         CSlDPLuBtZtCO6dPZu+FpRBEJFJ3HZmM9U1HSpE5cyTDxe66aBqk161HsqUZr4pT8SuA
         4eJTZEbfVIoEeLdeFUs48MpXAO0juTaIKbo+0A0oEgUq+avyMl0DHix1fEOg0bd8JJHT
         y52ZtydQHyl3SAO67MkO57Dnr79L3b0iZkGWJw0bpr0Q0gndvvSb0fV6c1Z464cvSR96
         cTjWY1oLwVomyWu3WTahWX/mzWm1EObodaYSTrjLC0ycKe3DXjLiDYxi0g9QHV9PT6aF
         C/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073206; x=1792678006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7nQZ/e8Knzo4MzaXh2frFTin9XEvMhbWwFnpxEu8qc=;
        b=TxMSaMG0lSolSWBK+qqGbFOb5je6Kw5Jk6slMuFcZaf8H6yOExYMn2Z/G1OxJ0Qzyv
         cpsiHvUrbt4Ri8e6HiUWUmdqOfTgEyi1SfaaQY83ebH6cSBbEin//JtuWpiZZOZPiaXz
         cPsIB5U4sjTcz0Mut34YGTvFEJXF6UUDy42fXUBT8Yx9keQ7njbeH+Fuwf6d3wMsPlFL
         4mZkg+ioo3nYZ+pVq0KjHYx8bCsQYYA3+d+4lfrkprtsLOREMrphja/8VtgOCnCxV69B
         ToCSZfNL16wr2N4NfqGuLSELfX+4HBbuagaC79MTx3qlYs8ATp+GFnFO5mJ/D52/l8Xy
         3omA==
X-Forwarded-Encrypted: i=1; AKwUvBysExipeulYwBgWJBkcxW85OcQWSY1tn9e/7kg2RCPP+xdt121Hll3elYS34vG6LizV6BJ8e3wu07N01xE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCYWbzDDXJ4zWCaFtHm4hlOsN0ZSQBT+uXbkZF9057rPyAXTtj
	VEG6kijI8f6Ro5gBr12SXCA8zlyV3LTutt128uQzkWZgZSzcg+qA/pRLnR0hTAKCpgwrhQWOa9J
	PWgzTHYQD8KI2SMEk0vM7adr12NHXMTVzeh9SnR2XFIMsVZpcsPKWcvgPmvtYxHuhNHw=
X-Gm-Gg: AYBFou3hUtceh9gWn7TrG7VZUPih3Djk2Cu8TqF3eaqYFMKSfHPaLRIw04UxSr0N3RS
	3Gr5FMIqhLkzH519UYnNyITWb7ZktDxj/4Y50ZHdfNoh6eI2E3WMePlJbc5EZ5tzdE6INTvH1HR
	xVVpxk8Cq1OLcL9mwJxvzSq+27tKsRboVsb5m1/RcfLvrHgTAJzHyCe1sjE6L+S7RJIJ98DrCWs
	TICh7U30kRUJ3LAWcptiMza4JQJRObW9OVoLy4pP/kQ3YvvExx8IqfPUpAIj/vSuBkrVGnNolXm
	rWKl9Amsk5fDP/pEq88o6Ef7Zgs3kG8GunYbmHeW2BwE9NUDhv56B+QRBnOG9/CGRkOFNFc/+mI
	DK8fRtLNfCfaqFOfD4WP4vQ==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3560053985a.5.1792073206084;
        Thu, 15 Oct 2026 07:06:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr3560047585a.5.1792073205506;
        Thu, 15 Oct 2026 07:06:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d856a2sm1370965e87.48.2026.10.15.07.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:06:44 -0700 (PDT)
Message-ID: <a504fe25-f798-4077-9625-70d8fc4a957f@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:06:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU
 nodes
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20261001-milos-gpu-dts-v8-1-98b14721b7e4@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-milos-gpu-dts-v8-1-98b14721b7e4@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX7x+qI3j/9hhb
 wJLswg6wqcBdI7WKMuLUC2pIqsGOmIEk8Tqtgq2S5zuq7TUNlvY5GPT+njgofjxo8hrZhl52vNY
 PjQh53lNr9g5WEN1Vl+Rr3Boolw6AtY2HXkRWOE/sXJE5KVHL5Hia0f3unABdv4EGS2q8s9aEoM
 /U6T/N/4gY2+uVd7v/Pu4uyQlDt0qI6bxCw/CSZ759hXIP8yyiYdL8H3obgSVpXCi3KgrY0YSvC
 LDOXD/eF7mR4E6PIhwEF6UdJqMbOQLOWySvTr5j+QNNphsJXJfMYKCCoV/ehuxn+dBlldiYvWz+
 s4YtCaZgvxmsTT6Qcv/Q9ikXc3io3/PwnEQmOrig8881DEvO+9u/OUaX6/aEZjXrSrX5sji8vy9
 Mcc8xrrO09xoSr9JrDPUq3/UhioedB2ObewFHUagebojBzREYjgFkF0+JLW9Y9Nxn7XBIowYt6P
 msIPVCtnBkXIF2i2vCw==
X-Proofpoint-ORIG-GUID: sVSfaieJpyhRjKHsWATpxbSHGlq4Ctfg
X-Proofpoint-GUID: sVSfaieJpyhRjKHsWATpxbSHGlq4Ctfg
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0ddf7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=as5TUAiMO9X00ovHkSMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX0JGhdJPYhqiq
 3bkdDeCznvWJD4Fq5hes62QCBHd50JEotSoN7T1o/hlqDztawNyKGWIcaGEAO6t6RuUuYjCocO2
 1jeJePC52j0Rq63souy+vUrX+6Az6jE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

On 10/2/26 3:33 AM, Alexander Koskovich wrote:
> Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> Qualcomm SM7635 (Milos) based devices.
> 
> The qcom,kaanapali-gxclkctl.h header can be reused here because
> Milos uses the same driver and the GX_CLKCTL_GX_GDSC definition
> is identical.
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
