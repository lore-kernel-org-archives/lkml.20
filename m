Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C4317145
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227336; cv=none; b=ntJ9JeEwilq6IQGUhkQ0IZCKgmRdSUwyy93QQnmk9TTSEcEYCA4P1xuUuqkpFbfl9rMNw/Qk/7laUcXjXlFWiAh6qlR2AFwjH0AyhCRScmuuCURjuiewpJfqM1m7bjUXLhoz4sjk0GSgnaYSjItuo7H9jCgpzOZLvAgBciB2V0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227336; c=relaxed/simple;
	bh=PmM3GuOb4qCxP0wGBV0CweejIfEC62Lw4X6JO3n946I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ov4WKzW8vRGUfXvGB2zWGEhRuUnEGS0J7dxO8GEq57PwWQM8gKjemvg279EmFiF/LWYm48Cc6eeXXjoTjB2Axd0dD4sOWi51B9ny6f5tXHJqJG/6zzq5b3lBcaXnG2JfONMDhzsfevzJ4lgF7yg42RXN2LP1g1zjRYunay/S2Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wj7XlrGu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzAaZWFD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj7XlrGu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UzAaZWFD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEf3853645308
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4qI7wGsc1uSi/6ECowdkd+fJ
	KuFNHH72PcdaBvULfX0=; b=Wj7XlrGuGHnIc8Ed9CSU3mc1gyiHMJHlIxhH6vyS
	RqK9aaUdtX5VrxLKQZNxnoDz/6xHMkuaFYr1pLqHPQ1JFK4DkoPDr7eEP97jLmYy
	HuuQA9gLjnvCXD/yD7kVE4H8kb+lkhr8YFcba+g6t8kRD9fgyyfYuiAGUpge2IWF
	H5AHtAc0gvGT5A0HZB2F6kKld9klWxevqc36xdt4BQkuObTlLAu8AISszhcdW2A+
	qdxHXlsc2HRWttiUot154Ic140O6tCw2Hl3xe9AlLBaUaP2M4DOYpdWehV+7K82U
	yGms54+OugQ3GWYP2eAe3Ti39metAUo+ZQKZV9hpinpPOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dh9w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:35:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso232879785a.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227328; x=1789832128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4qI7wGsc1uSi/6ECowdkd+fJKuFNHH72PcdaBvULfX0=;
        b=UzAaZWFDEk47ieUS+YuegD/8S/65xElp203IYqhkiQ27AidIxkU8HRVKshr9IWIJX8
         EIK4eVvjUpSokb2Mu/vTqOs7cPQ6MQerVG/MwC1TaZu5Xi5hfIHYogcVdpdQnoG+5y2M
         o5804f1qhYr82AKIJXwiIABRk8zjTitk/f7omGMhfiSLwecZe7hHSXYI+V0fRLZV3w4i
         KKMr8K9fFncBw2WJsTZF2XWdrWJlrf9YeIGHBgt99vwsAi7teyRHQuLjWBQeT2jZIhTX
         LiuO1t0j9Okjy/0Q5MpaEOelwjHXPC9nEJSvQmTA6UtYCgLqG/sDKiBYbzCiu5ovsdzh
         o/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227328; x=1789832128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qI7wGsc1uSi/6ECowdkd+fJKuFNHH72PcdaBvULfX0=;
        b=AZJIcx+q7/aCbhFvhOdoIKpjEm6lI8QOtLtC8E5e+y8vSTO9zEAQssOWZAEzWGxW8u
         N+K1vQ1kqSG+/VW0MgTVHs815yoVMwZqtomiAe96zgZINv8RLxeXRLjS1qFYNFoMfeJx
         M/jQsH+0LfTZMcrp4LOBsJB/Kscw35jGS0bcp43a9ksFoiSpR5544mu+ZHuRZOU7+q7n
         Ek4+KOSZPbz01p3XXY7P6CpCv1dEYkDwesdxS1+xrCVU6O5IxpCGHDJSBvt8obh/zK+y
         AhodEPlfDNehMkKf7mtMpWvHcpbtaveCV5LlgoxJmK1OsMi1t9x9hvM7XiebWppdyqHq
         5NWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaWUF9uEdPeKk4W9KekoTdJa7ubFKjLM8p7iQyd2zHq5sgNlqyjQJ2sE8XjdF9LwdIeWmVLUyo2KBSKE4=@vger.kernel.org
X-Gm-Message-State: AFuF++nfqnSq/XA8i+qs4yr2kzNJqmfCwsHHo7Uk5efOelcQvdO5fsr8
	8dTWb4/Bfg8UjbdJr5eQbyzBc4lR5lJ8MjTZ1VNYVpZwvyk0Qi/OE4gk2+V+ZEIX8gV7QURhUhP
	4WudAmDW41lg74GuRVuSh8+mhSl6UamSZI+BEXAIyRbtP9jBc/F2JGeWBw+NLydtqbrmt+wbPOH
	E=
X-Gm-Gg: AYBFou2pk/4I/Shfy/bJOtF8GISZ+g7v3xNftdnNZGi+onXQ/ff0AGUjSYRC4M1ohKE
	mlSJhm9ELRS5J6+KkDB5/WvJrDqtpex4F+T+f2LkHKlFEM12arFhX5UrIIhMUBdGVwUB0dm8EiZ
	ShanrmHTNABqcwOPNgDw76ej/sw0UWUcdNiT6u0/jXyF/U0C33uX7hsDw7XPz1AGpYzQywwt/Cq
	HTdxLocsqt6s2SKi/YLSsTx5/UAVPbdgf6hzmb0iMuKgAcfla2wNkhdSp/Ea5v2csvoSuTyvVEC
	ExeOLV7+1d/kqHtk8FsMBkE/aRiEieCuzVbeq7+qpMz0crZWZTtyiP4h2xzTJ3FSWj4W72qszsS
	TsKNexw6PrkD/0nI=
X-Received: by 2002:a05:620a:298a:b0:93a:824:ac8d with SMTP id af79cd13be357-93a0824ae72mr390521885a.27.1789227327893;
        Sat, 12 Sep 2026 08:35:27 -0700 (PDT)
X-Received: by 2002:a05:620a:298a:b0:93a:824:ac8d with SMTP id af79cd13be357-93a0824ae72mr390517285a.27.1789227327401;
        Sat, 12 Sep 2026 08:35:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaeefsm163445925e9.12.2026.09.12.08.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:35:26 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:35:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Message-ID: <33u55ckzcs55fq2ioem3sagostq6c7qnrqjjsuapjangrogopk@est27ed54xo5>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-1-e4b2da5cd55c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra_adc_support-v6-1-e4b2da5cd55c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX/WGt75BVvyP8
 LqnH9rF/IF/7G6nB/RayfJGcS914NPmhcFKHrx7o3FKrvYa0WLHkn2yu1ciXruflYHyeBt8syuO
 uMoLER2eeTmpPFZzGOL6eN/nJOgpIy2RSvZLjCinIxCStTyKScao39cJGIreValps7HeZSSxdlY
 NEEonjLf3to+JXeofcv2A06rfByR5TtziAF0tcC2lMWPf/n8rD6oGi8eIwxkQdgLvyIaFTVjH4h
 6ia5ZA3wyCZr5pQmlSLO4RjTKn7DBlkN2/jzDO/jI/LFecRNPUlKGzLH0srWEpSgUMGZ0jW8w8h
 bMdECOXUg67FxedM/E2YdMc4TzP8ilV3VSqeqE+NEk5k//kjY4HgmlrGsVshqSfpfC6eU5A8jyN
 z1ps8e/UBpbf5J4JIHV+QNizxzhysa3WdDxPNcz7DIzsnaxddjJNq7HdNTvmAGYnARCgOkVxFd1
 URzIV8udzClbjeidoYQ==
X-Proofpoint-ORIG-GUID: UrfNUOBbN37rFYmfXi5f3w3ZHrArvGXM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX6JJoxKKjpv0Y
 8T1/gIiyIunjA5R64UyikAi1UzLUyEzQO6Y5JveeF7lizCF9q5DdAPunUbKakVdp1usKiRXSz4+
 ED1L7d5rJYyS/6xiBocDDXIB3QlK1+c=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa57145 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cnYp6-ZCE4NPyVZBhYIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: UrfNUOBbN37rFYmfXi5f3w3ZHrArvGXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120226

On 26-09-11 22:10:39, Jishnu Prakash wrote:
> Add VADC node with some channels under it, for voltage and
> temperature readings. Add temperature alarm node, used for
> PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
