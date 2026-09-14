Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F393D3CFF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383451; cv=none; b=cgkqzDtXwhFtNbHoOrFsxwBnxYOgMg1e7YCaYfdeTTiB7uctkWYvt296mpDf/u8ahlQRdh0SrS41q6gsWB/XrJN+XzYMRFJkblDKWSTpGTzkzVyHIktW8OcV8TYXp2Ut1/Vp5zjZRgTuXEYtknUp9+nRcG5hPgcEOuhJLHtZpp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383451; c=relaxed/simple;
	bh=KziHKxbNFDfs2CIWf9u6vkQUwcOAf74I8pDOVwGeyhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGJVGzH+U+Qzp10NPwcagTxUisVkBLN3j280PjRS7szlgxs2ipBEfQb453tz3LPR6r2luqmFcMPh9T92yrXa1imlmATUk7CI37eQCy95sNw2u8+nQZgyT4hzsX3QDS7FeqrNqEM1bwHWQsUfx+qppdkKUWlG7nRiXzCm5SwUPQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKHVu9T7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpCIGOao; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKHVu9T7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YpCIGOao"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm9Ym377867
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AfpbxI5qodFuclNrDqv+NkaqyrNe7rAen2jS+miRfik=; b=LKHVu9T7ioJox7QK
	uYGG2N3iIj7T+VDU+KlblmtX2XvUkgAm1dYCGNlrvM23gVxX2z165EDNWm1c6zmP
	VkU5/UXZfEv/GkRmDvRe3X2v2C/hOFylf3MhR2YgaOggHIOPg9cd3Gf9UGEmwmRu
	BGNpOzHd6ggohcR+UT5UJ+b9IL9YOt5DTLQf9IiP/jQ8bQi87pROZ7XKFRSSkgdc
	xrbjYD33pzjZbF86e1kaSVCawpkGio2bNc7iKcY0lMQNSeSoNDtEvbE5yxUwA8ai
	7UPRGCfcf7Yux00xkO+aRJ9hW5KnGvM8SJvNjhDddesgBQQsDby4+2ZuXMGxdmAR
	WLY73g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8b65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:57:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso62791385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383449; x=1789988249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AfpbxI5qodFuclNrDqv+NkaqyrNe7rAen2jS+miRfik=;
        b=YpCIGOao7sFGjdWySw/Nkfp5WfKdwccZcYIssOVTUmQa7zigMT7l1SOKlUVir/WF60
         y0YnAnxFNH6WP/Kqqc1+loQzbjB+KBdgxhzo0P8kYczmsuY9H7GbwcuHynCbakjUdnmU
         uIszRuyQxrCQYeBTlmWum9F37eHoUgHNfp7Pu+U59ZcSTg8RipP8j0cRVvpE/wnc9yE0
         X8kD3y3rR3K5wwiCddkDKmWpiM6vItzaD+t9ttZ5z06V4151X7FyGMbbQK/7yizAj/s6
         B0zCavHe8E6hzTaJTUWZOy/nVOkB9mVUaBzmPyWXlyd8dj8LoDFGExfvOjo9B8tUiPuM
         Ip9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383449; x=1789988249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AfpbxI5qodFuclNrDqv+NkaqyrNe7rAen2jS+miRfik=;
        b=mxGApvkmMru/brxyOybt9iHNa7+a+mutPUdySywZZCKkMWPdOA1ExGf2D8zjSyg7N+
         C4qmX8FajVhoewCRPGBhKy9NzVxOlWUQtej1SkiU2iyLJo6PPWjYlw5vqFihq0r44wQW
         /4Xr/EsJCL06UEGS62QP/x4lltkek7IorJzV9LcOsEgB1m0gn7eS2uxfCMProDmzvff7
         M68CA9KUdMPJ5mqC/PTTUYFk5OdNe1ZnHoEGvqXH4J+STbCuJOprq6oYnadLXjYNHsWX
         uAtqhjDCrxmmd1e9S6SWP7M17YYUDgim8ue0eTJ5Pwc14Wf4fXgDPi3+hzTqzwVRWmVg
         GR+w==
X-Forwarded-Encrypted: i=1; AKwUvByJPeJdEEUNV3/AkhOvKG3BluKHW40i2QUUTiSuZsEDDPQtZlGVW2MQd+P89+nUE4NQjhwKo33ExQnPN2U=@vger.kernel.org
X-Gm-Message-State: AFuF++m4cR2C33FkM9bAFcZrGpsC8I2lysafX7Fhl9no36TQCm5NjdcA
	DWZ/gr82TUdtb6z89S0CQxzOIc13RDLQfbuFVhRaEUQ9mkbFszI8iYMFz7X7wZ1iZ5o603NfigW
	cQsJ7s4/vy3U2hQjddUU1b1oOy0M6YrfbhxAWKvaEbAZXvge3tpydo1TC9iR7xZvI+iQ=
X-Gm-Gg: AYBFou2wRT0XcxUOGaSE5w5NyIbW4jqV8DJQUunCNSS7uz88wiz3rGFOpYnFDFBn/tg
	B1KS8Pn7DHxgL49/YsZk8l6Sk3NgocPV41ENW4ZzpfXrjJPo53ellUiyxjv4cg9W1z7kQzg08ov
	/558h7N1r+xOQDzot5DYEsP8EgcKLVAzOmrcIzzN3BB8SmSXFVoHbdflrw5ocwUeguOj3En3awT
	PhAcEdB3UZwswUg8vGvzQghnQwZYj0Qq9IkYyzVeO6o38++xp9eEKF//dWXvHYHyCvdc/Zva2GJ
	4cQnXZ3srhAcKSSiKif/+xQfTimq/kEp3hpb3kq6lbRF9T+d1fSogC5pmYR7xw3T/JMh1heHqKM
	GAK6hfYfvi+T2MuJDK0O7kQ==
X-Received: by 2002:a05:620a:2b9c:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93a29a24508mr220426885a.3.1789383448952;
        Mon, 14 Sep 2026 03:57:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93a29a24508mr220424485a.3.1789383448454;
        Mon, 14 Sep 2026 03:57:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966024941sm411467866b.14.2026.09.14.03.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:57:27 -0700 (PDT)
Message-ID: <1adaf787-1219-4125-9080-7426ef53826e@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:57:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] arm64: dts: qcom: shikra: sort /soc@0 nodes by
 unit address
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
 <20260912-usb-shikra-v7-v9-1-c7b507a0ec27@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-usb-shikra-v7-v9-1-c7b507a0ec27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NSBTYWx0ZWRfX5EvULX5gCuxh
 kW0UkbQIiY5kxXJXO4XYQhJmwUYqZScSv9D94MfbUwDUdASmpy3WIfNDQ6Ciy1jnueR/obzgBc3
 E8YJhmulTyD3dril3/FQuUr5MDJ1RtA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NSBTYWx0ZWRfX3KqwmPrsMw6b
 69+q00MmWRl5HBpJ/fan/WNQx22GXGbjW8upWz6nvYju9Sf+y6Ng8kM5u/tIfaJwC7tZ3rW0XuG
 tWrYbr036ElPgTmv6A2axw2fOyDSIeUL9sbECOjtIrnSEgN2XtTuboWLwHRJY3/Z7uuh2ywJSRG
 hmqOV730GRbexiOxxZy0CiRJjivVxMDIXhz1JJ42HZOLI9fosAWnDVStRj3PgtdXLmZwCihiOOp
 d8mIihjtWpdS4laDtGGfui80JAySMXjzexj06988btn6zAW95LOrDzbJu+mzRJP/kQP3W4o3/SG
 ZvxuNj2xmoshhcg/cY5z3o0uVaFfgjjWXqbYeVTL6CZiSfEyOm4XpK80OJrgUeCG/DLjPvyeNY8
 PII+NlLYffg91BzUxUILc4Ua9TpEaZv5Xu5mOsxM2zqgZ+0ByMakAHjIY5HsJTrGSmWTHbRvFKS
 w2q/wsYPcfA9aWQUu/g==
X-Proofpoint-GUID: 2mBShgpx8Z95xQIdKOodQiWS0JlBF4Og
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7d31a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=99Sh8nnqGf6VeWgbmrYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2mBShgpx8Z95xQIdKOodQiWS0JlBF4Og
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140155

On 9/12/26 4:47 PM, Komal Bajaj wrote:
> Sort /soc@0 subnodes in ascending order of unit address.
> Reorder the misplaced nodes so their declaration order matches
> increasing node addresses.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
