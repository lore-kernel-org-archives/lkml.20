Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884635;
	b=1fJASj435Yts95GneJkNftfzS2KIik7MDMQwe37tj0Pzc0C0ZPoygVtniIMt9wor2JrU
	 79pDu/tP5FEHfZAoAmYM5veIKPdjPNEB/QCoavE3hrEE5aEn6ZYVNzbOuXrWSairrzq1q
	 Wz1mcjCzXlpBxuooaNUSrRRbvq6Kaq8rmZWKqyO95R/Ugc6hgXy18eRB6PxRSwUH86/Tu
	 u/dYLOkjrt2QOFmfKOPtTseKmg3nkgkQdQ1M+FlwGDdFrq3YVfHW4+1XhcvO2rPm92Xfz
	 wISuWNv/WaMoArkn42AZdmhYXWsLVmadN59vCoHWJoqTDtWAjjP/FKKNYvwEXRZnkYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884635;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qc2jMiL6eFsHz6iqLjg5VRSuJjQ4citqkfgQCMTvunU=;
	b=YdelU84Z3E4OoL8ruO00BQtj5pVw55shd+vaRf45cLYLCV9S6WM95werqF46MVyZIAph
	 +trKn1UVh4MoOLNeK8fvx5zGeCZ33oX6MmhwuZjaxYAsCscANt1O6+e5X9DD5ydaCMHKI
	 0w2nQbA/yTeZYvKtcMqzoe6LIwzTUN3+VwB3e3Cm5l1P9LJ727fkJUP1jaV5woWEEjyA9
	 gze9zXWBTnFOVl4dBWBhZcsD5yEMF+l5yrFwCrXX4bdP4misog9pCZFlyaDp5Xfi1WnDK
	 fXD+rvMKk/NpVGrmXJ4t/kmDl6CeOqM/E+L4c54q5+pnb31s0txXFKT4Cjkpn5jxJQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dbi5h6Jl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnvtBTG2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A2606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655A2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dbi5h6Jl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnvtBTG2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tJFL082993
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 13:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qc2jMiL6eFsHz6iqLjg5VRSu
	JjQ4citqkfgQCMTvunU=; b=Dbi5h6JlWjaYOfWrjQOqoghNj8LtnOidFwmRK8Tw
	WQKoiSsm0M0HDqYhlm+SMdoVcX8lXGD31qAlQlyNi14mpK95Y8AZfriSb/O/GTUw
	S0Cfh8SqnH8Wk34PlActYR5ETtWPhz23Bi/+7dChj9pwPfBiJydp+ThP7jKO0m++
	F6fg6PHAu6qWSrDU9gl5XZjUKlQwk2edaoohKu4CKpru8PvEvHf7Q3JggV+bBJZP
	6mWyYQvARxIHiNUe9gRcWTUzXa2DdIrxE+8DihXH7+hIu4ZUD/KcQ+yWFcgXzUNw
	TDFF/GkRXID9Ahjwfv8tgDPyanV/eqb7ioX0qQIa0qe+FA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p0yee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:17:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c6c1e082bso12480686d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884634; x=1794489434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qc2jMiL6eFsHz6iqLjg5VRSuJjQ4citqkfgQCMTvunU=;
        b=jnvtBTG2ZqcxCjaqcQJbdReU6OQmGF88oTtrZZyiPJo/yUXZQ+M6HpBiePY06646Rt
         YxFz4TyljOTNekaBUx3u0eAxCW+rQvt/k1YjlPSvKfKXgAf56YRl3l1/VECTcfXxvALw
         Fb4OKLv+KC4rb7rDHaN43hTFPUFOPinWBs2fV5KvvEEvU4ktmNurddMt7f/YA2seVQXd
         f8kxRwKVO6kYk31WFTlVUnwIvSlcsGENq5vE+y//7PBT3GQX7Uub5BNgiWtrnGecvFAS
         8XxCZV2t6z1JR+Hc2f2izm/+OaxYeVP4O8PZ3vdviP2QsCs0vTUNuNOOZAixN6bGiwl2
         E+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884634; x=1794489434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qc2jMiL6eFsHz6iqLjg5VRSuJjQ4citqkfgQCMTvunU=;
        b=YgB0/MsLFfMZShsuPllhLj39MYJHJInJ1oO62s14roWK9ICE/2qsz8b61FCZOVmHZz
         3lXlh15rKKbnE5j1TRfctmOBfudy1r/Tu/cMzu/10MNUxmva8zmZwQTbWUMXfaDobLog
         51hgepR8ZiJF5u0+JLyBjh+ocn7ZuniEA/jkIg8h2P8K7bmyeHNtdUg4CExG8KhHmIVz
         2bGheHyBUt2iwT5+ZG25ItBMVntYnOV8WcKGPZcIKLdyAkGY8q53ZBAlX1qsjAOCKzDv
         8z2lxRAKSCy/vjJZb3h+e8EtH6WNvCrAYhVt//l1BQQCNSYWWg7wVUR8wZYJDsJEyD0Z
         6owA==
X-Forwarded-Encrypted: i=1; AKwUvBzegzfNPuHrJoQmi3amew+LmFecvQXfLLiRcSquSXa2ArNrfrZ//DXVLWfNlvG4xcnG7ho05CW3L+QgsCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qksXWc/Sp1xlMkm99AiOiJyOsym85khhxWHJ0rPPhyQuP9GBD
	hKisJjLC0LEHkhO3/xbKrUxRsGZDSGBhPiBw4F+GFIyUMldzvWtjtCEedfHLJMdBz2hd88/B2to
	vfy99mSARwMqRKUn8YcjNI8ifaeGVixJMvPxk9qYnndQbxpSR4qGDIkNaSF3yzWYop80=
X-Gm-Gg: AYBFou0L93IotZ8lPJqL2HvrpeJHSDRWgPWGPJAZkUbx1Mk7mOOWxi69AhyDQCyox0h
	uNu20YsTBirkLE3LQC911/tEuLU2v2xg2nqDVFEYURoSGDdyFcLVbHZ+IJdbcTRMaTnr6JZcNM/
	gqpHGDy5InHK7S69S4Os/B3eVht6Qgy2koF4M+2SnSq1uuR9+6+z7o5VSdH0gTQtH4yBbH9e8kk
	V0wCMMCLp5awJuHIJ6UZNJg83WksRpqunK85Osvabyulw5oPtjWkhcn96gJtgzFSVop3pVXDJVa
	Z+NIfYFAOqJEjXwZYP7udhO/nsblk4GMXBmMKh47L6rvHFvD5uOteSjyB0Lb59SsJKWzPx6NXs0
	Y9mynyngraqBjp3tkT2KzNgj41AOu7lz1jdIUiDx2tYmDpcZlh6wDgknVoL3p3ks=
X-Received: by 2002:a05:620a:7102:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-945e17e2cbamr398576885a.39.1793884633385;
        Thu, 05 Nov 2026 05:17:13 -0800 (PST)
X-Received: by 2002:a05:620a:7102:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-945e17e2cbamr398571085a.39.1793884632740;
        Thu, 05 Nov 2026 05:17:12 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm67759415e9.1.2026.11.05.05.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:17:12 -0800 (PST)
Date: Thu, 5 Nov 2026 15:17:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Correct number of TLMM pins
 in gpio-ranges
Message-ID: <rotiram4b5ah7luhhwd7f5hzhoz25p5qwz7yi4m6riu6spvxep@y7hwfdbmtcp2>
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec81da cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EGeSfPnbYMIGY1KhdJMA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX4ettt8gNurGg
 8rMRCAWxZ8dVE52FMFwNYfHJoJz1Wl7x6UX+X+iEuUnR437fnlyBQfPkrZ3f5BLK2dTGXjYxwIx
 9FLahtuTt56zKnXjQ2M3LhDVJc18ljpkJvtB1ziWfqxsO9Xw6KXOOrg5qUDFD87m1zgf65FwDwC
 jtSfHC2wk9B585EMkE5aqreRNK4LfixYTZZN64yWAkDHupPDOmrXW5Ql/yMndpZbm/bnP4fzNp4
 M+8zx6PIhfR9+B/ksg61t4cijtmRLRDb+HgnwO5+hsGP76jFSZI+6gsqZ6Xbu3/7tA+somBiLPY
 RyWxoefyQCVwRSoQ7JNrnpmjpAJss7CksQs7/8tkq6L533mUuLGLQ2snR0B4d7URCVY8AmZXbeX
 eyFfC0I3JyFfY7DXrHhqjQWrDt+W3W8iHBWgOTXlzV2634vjOP3eMu0KG6hxAy6bmYf+kZ7w8n+
 xFUzDsq/LFG6wxuD8dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX8sA6cOG2HwBh
 1su8QlYzIa3jzaItBW84olV6iz6CU16SYMHdYlqlgfLxOvI/txzx28XLGWSD0SQ6S4znUSwqLAh
 VyUBPXWYR0hupaWXFxK+E4RxIx1QOVY=
X-Proofpoint-ORIG-GUID: tjnpJD-xpnO0CO0HRu3lFBCY06l7Autb
X-Proofpoint-GUID: tjnpJD-xpnO0CO0HRu3lFBCY06l7Autb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050052

On 26-11-04 20:17:02, Krzysztof Kozlowski wrote:
> TLMM on Eliza SoC has 185 GPIOs and UFS_RESET line, thus the last number
> in gpio-ranges, representing the number of pins in pinctrl, should be
> 186 so the last pins can be configured in pinctrl.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-0e88535a-02d3-4a42-9f3c-ca4f9bdd3b11
> Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
