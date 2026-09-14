Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D935C68D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371516; cv=none; b=Mj7tgjaYm8G0UWeHWEWbvDxv8VhzWUI2Xs2LcLcsg65UvhOoUULUzI67kLLpYqLvJHt076F60flKUkX4fvK6hP6MiiViudxjisG8K/nZuUjzzbbmHDrtH6gw0KeRz8BevVcQhvcnOHW/cqQiNKtJJMTGv1iXoGrYuyfa0XWewOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371516; c=relaxed/simple;
	bh=9lhWc9Q0YUdhC/rcymm8R0voA5GEGve0e7eHh6Z1qqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qv/vReWg5hpFSZSmzsV+DsKLVQLg6fylXK58sxcCbk51rG1EsIZRGbTe2CzllADwDFB5gBW0h/GMyT6sDINw/z+AX+od+EGcMKXHFPITx4REn/cWLz17T2+eZRBvzlo/9kMgTDTw+dAmCRoUx4fAyzdt3TsvvEGrp95eC/5n1qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVALo1y3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W34Sl2Nh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVALo1y3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W34Sl2Nh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jE0I063938
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0tTsNx29CoG6/4vw/G06mPMr
	5YxJX+XX7lhbZ+hijuw=; b=eVALo1y3fejK7+uPWF2QkjP1WZhAe73qN0dyxw7m
	CCGaKZtRZXayaF6abO6B1pOSMvgpMmeUnwJR4Mpz7Cyqn0pXcnED0fKzBBmpvDOC
	0Jcs4dDMVyZh1PtToH5C2ZNuO2KI0gEDbqB1smE2/OVrdqX+gNGuIF8q6jYIl11u
	agO0xk2K7Yky+hVxd9eNUhjNGatF89qOIS7HOC0sYH/HjIEN6cQwjZEMdITOnEvq
	xX7i9Lcx6J3x1ExtqzfRriAI5oCrLJDif/HHaGnFoEVlArRTMH2iq0fn3aVXm4Ny
	qkPi9F4GhTvmd6We/ack3mYQXH/+PluKaTLgqt6BXH81sg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnkxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0c7126e7so241348285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371514; x=1789976314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0tTsNx29CoG6/4vw/G06mPMr5YxJX+XX7lhbZ+hijuw=;
        b=W34Sl2NhkinmUGoV3vKquormnNTc1vPW7IBg/wivfZml3lyU+LlhOviAOTJ4gLxJXv
         ukaXiOEdMRQSDuz3xaBwyLZjUNcVFKbM+1a8rX+KUnJzzbCfmxcB0VcFt7KMZ3Gchw+Z
         clDXX0Zieq/Qgvl/dy9pQqmEsWPiEbezbsosXu5itOTQ9LqsddDbtw4/wnV30ZA1fwIU
         E8lkqYXCFK5Sw+14/hPKQg0zgsI1frH6ogy1lkEgmIpsoiaVJSub9MiBZMAjXmocjWET
         DpYEPFQQA+kLpNvtd3EChizqkSPYxLvfW7Im+lo1m2PrTb5zAjovHY4DQYp5kza5xP4m
         WjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371514; x=1789976314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tTsNx29CoG6/4vw/G06mPMr5YxJX+XX7lhbZ+hijuw=;
        b=SrPKz+SCIPKYjHAppkKsAdItOlM0xgaDxdsRISau6QKi/EqFsTL9rHGg0pybwxnAAi
         tb79/jDYms9jBi0dxeJRCTQdorrlbL97NFTvqrIM4qRPJC2e7ZMMQSArc5QjA6L/uS/g
         Yw8k3WWLAqjVAedghutA6beNQiBxSwZMFIEOcWeqqoKEoIMdmEckFFHejeABwLBeijCw
         g7FzeCTI8WGuiz24GHUZSRcaYGePe5RmNmTeIlj8VzcdepHFrFOdx/5HRyh04WZbU4j2
         sbMOOFtOwt9nCUR4xQboNlI2vOlRyQExKsdt3vwaKiXyiHN5qljP64myxtpLtvK0uboU
         aN5Q==
X-Forwarded-Encrypted: i=1; AKwUvByN5dSJ9/xCFUkspXnX3L6Y/o7Gy1ZmzwJszPzQJVERBzPmq9ZdPwtjVKYR9hGzXOvSyt3PKh5z4ec+9vk=@vger.kernel.org
X-Gm-Message-State: AFuF++kysH6AD8PYhbZmUzAe3W+Jor+HkWvgydI8ZkmD0az2Q7yp84tb
	HKWlvHdUljUskWTJNf4JBnXbItzeM8EJZZ7bCZduDoCDaTyL7anT0Qml9XNjj/4nsRX0CeyWqCr
	diVwJ/7/Ha49K+4cIBR/VzqiDotBaYJedvUTJCdWmmrJHHvxyDkwSCsVtMRg9JSUkq3s=
X-Gm-Gg: AYBFou0CN96iOOasYaIpYVilII0pLjwqbtji8SEiDoH4Q60hrxqhZlaGAJvkjZ1K8C0
	8PdxEkrJ4MVTCQ4/bqCAkbIYgqDDOQWuv4l0OFKKGMRiCAoVmeAZ3PHJE/iLoJS1amajQ7P8CrN
	E8OpVpGHjutdbpn8ER4hC+mrMo5KrjEsZNfCo8i/sMtuEb1gAOwDkMw29kQTUWMXApvdl7oVf3E
	/ZefbxUCosEJQIja2nBKpplpxw4XyZiYoVGR61UU+PImdhruO0IoZZI9Vu5nTCyLRcwzUDhjXh8
	83CCLJNntBEYIBVUHAf9bDP5gl/R7Uj9BJMbi3Y/TvBtlQUWJqtoFFN3+v7gpz2st9YJ91lZt4R
	Hx3xBiHThvL6mYw==
X-Received: by 2002:a05:620a:1983:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93a29947dc7mr176227385a.27.1789371513547;
        Mon, 14 Sep 2026 00:38:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93a29947dc7mr176222385a.27.1789371513008;
        Mon, 14 Sep 2026 00:38:33 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm440823315e9.3.2026.09.14.00.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:32 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 11/31] arm64: dts: qcom: sm6375: Add domain idle state
 names
Message-ID: <yh7ote3ijg5vlvdd5v4twoa3yumuwc72mlckjimjqdjohaikjt@2il3lgvyhhst>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-11-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-11-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX5I6K+IaEOEey
 0tvMbmgm92ZL7mY2HafNzg7lml7Tv1aeEUKnTbswrTO6vDwQD5TzbM14BNYAGMFB4oQ/cXEA7wP
 QcFstm5UgycltreFTiTAIdOL51I/qi4g+RXCUJns4PmGjXY8Z+k1/f0mZ9jmGzQGA2VuHRyhV0R
 i4RE2dYT4IROcWKibcAWCzTzh7UsPql+r+hwO8zBgbA40DIU+5v6nUg+VKYWyE9LiJbtt58AT0r
 LjRoDR3nvcwfo136YRs8SYSlzp6NESA4bP5geDFZx9LLgos2CNTAovJclc+oU/s7fcgX08cQFzA
 CaAjWk4iPz1ivhfDczmwhMGmJrp6yZ1rIajbQELLBg5DlAwcahsc0PbFMFYqCVrYkCmL2dTkCnI
 EPfZJJhsVdCbRgNKcUZozgD8e0qBlH7OynDXBi5BSbgZ2RzWLJVi6Eu1EsLVbsLInJjvoGRgs28
 /nb5SEPuPHzzGSdI4Dw==
X-Proofpoint-ORIG-GUID: 0WBBooUt_p36CumaMv2WlKRjqveglUxX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX+pPKPdERlSbO
 iBQL3rOFe/MClwkYAAR0+tDk4oKQ9e0ycCSn+IioLLHcRGeLDPp+EvE+Ga1DYssk9E7AGF3KLlt
 vB0G8qi6uQvjZwbzDAVl02qnxcTNc9k=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7a47a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 0WBBooUt_p36CumaMv2WlKRjqveglUxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:43, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
