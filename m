Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCB53A3816
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755798; cv=none; b=Mz9XDnjF+KflYX9AWqqtE1vrTThbCUy/sBtbp8Zv1ADVCN8OZAsJaKq42CDNVrjttBTVJuIVucyzRjSyMV8bdzeCFy7JlFWlLogain5hvjjcQPFbEDMtDnMpHmJmVMWpSoUgidfWj9HRjAan2mnKOVwA+ztdtb4EyCwSyarVszc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755798; c=relaxed/simple;
	bh=vBd80ETfLcFFXqGoGb7udPCzwY0bSmTURW5OMWDvbpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6nNtvvCek45nJsaPIyMX5q+D4POny4OQDr0+V4teyatJ6+AgeyiUh6+ZzCj3u95jGFHHz+JBQHBB8c97E776BoV0X8Lqi34kLzmi2SdVYxMps7er3QAbGa7cDS9NpLbFqH8EStHF1qTgOd3Lv41kuDlNJl+NW5Nw2DG9hauoOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiTczt+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iL87P3M8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiTczt+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iL87P3M8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dP0T2213529
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StfWU5Pc0lPpSLan0imL9WTqO7hrmam8Bvlpeq16QqA=; b=hiTczt+QL84s81SW
	TSk2vNGmZpEVDN9Ta9A1dSmbbaoHIwB+3rDnngY0yniDaItvwsPbJbi9qpGJys04
	YFS+x7AH9LlbdwtLnLYnC3qxyLcHXuzopu+3hukQdAGoYxssRLtNbmk8T5+VUkjW
	esG3nR1TmmlDA/BmmFkUkNk48q3PA8MTBdrSFrnf/2Wdeo/ksBeUcERfgJNwzqn9
	QZ9sXOzAYM8i/ektU5Gs031hlWbUbuJUTJ6mXoG30u7U8JsVOMRKCuryx3m75ExM
	WxfzuTv7t9Ch+/Gi6JARf+J/J+n8GcMPk0WByrUtylKKKh6mj2smK1ltNbAZVx9q
	q6nWWg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjhcha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:09:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106bb33cdfso9294776d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790755795; x=1791360595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StfWU5Pc0lPpSLan0imL9WTqO7hrmam8Bvlpeq16QqA=;
        b=iL87P3M83mUZZqMluirls43x2V59PY3yrTkFgtlV+6oiWA377fuHJctQGKpYprsay4
         fWsD5AqTyevEhUUN9Mk301QNHnc4EKCbWBD5fnOaKtsvGiw/pFSK9UNNoiCPiRlSRMaK
         Kl6QqcibbDUWqs7/3R/Cy7dzY7Td+oufrVj+0ElBjoppA+nwHOVG6gFKYPG223C9QrWt
         cQ1qHrf55VRp18L2WuIh1lcly7KT0gNadZBYjS8MeLd50fEp9HbE9kf5oRSAPVJKwtvm
         UPa2l0b3FjW7ol8cNpKDLyMI5dBDNdoZv456XRJtaTO8L63uh01Mnzseg1UjcP+/6rwB
         9rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755795; x=1791360595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StfWU5Pc0lPpSLan0imL9WTqO7hrmam8Bvlpeq16QqA=;
        b=OPp7dS3geHaAfTtI8VB/v/lLnQIZb2UKcd5ravcvkHnCPx7b3zB2iKEnETexKgFJl4
         5F2fNf0sOwUdOGPzmmN1tfrkARg/ga4UMgszH48kHqHw7BoQvQPhNISeuQFIUq3K+Luf
         BMbHGbu+btV/wKpEbGr9Zv25oD7EtLRkAVQmcXSP+4WUWFnqDvrjzwm8o2eaXu3kTA4j
         eM7pPyN6+bbGV7OJKx+kBmGq7+rfbSJ8eSkV/sDXKkMzYO398hebQTd8R6Ks+K5TY1bV
         JNIK4SIZqtr/f7L6VHq2/7UugABfNsX7MJd/E1YUjG1pnex9oxLQFiFgKOrxixgpGSkH
         XuKA==
X-Forwarded-Encrypted: i=1; AKwUvByU7ZsUUtWT3B148zAmI40eftaAByFehViVfCuIyRUchjnXvrbDpp5F3SeAlOBSSaAcH7K2C2ZajgugILc=@vger.kernel.org
X-Gm-Message-State: AFuF++l6Gcpe4D+mEW+15BkSVT9hoNCwholc34pvwlYV5iq4G7+MmO4y
	Ym+4qC0ARRTmKUl+/LNO5pY62jBL2wUz1o3l3FIb0AX36IHAmpWSBh59vFWtIatl/9HBjo0p1ev
	gWmgvELigHrE4X+k0/rOmXTqG/CG6OLqOGpYJXCOHfB1MWMMSQdCQyxyUNeNU86WGz7k=
X-Gm-Gg: AYBFou3rCDSuHusBKSEYYhLtYg6+MP/SVM+NzOuTpUZ48wvTUlE4ws3Vlx/kD4RpPX8
	vdZJVsJ3Wzz8B5xBqV/RBgJ0SLdEP3+nZYA5Kq+pcOEFeISQz8i9MvEgaNiaEeyous79tapBevH
	9bkj35LyPI/kB3a9YmAe0rTuqhJZMtTHcoCBZvziPg1aLZI24Mm+yoKsSXbgOkLp9M/YjWWvVE6
	2fjth9npuznfnzumkTdRYlGUTr+2jSD5MJov3d9WxLqE8CBiX5cqP+ET1XSOD9TzTAxOT3c3C3W
	q3ZQgvvlKNVtzsK6rQVeUZIS4NsGAUCT4EUQUG3D3qlqWFcu6M+ckuA+GTqhZB+kHfallEHGKJx
	vJfykhlFSwEjkoMj/n5mw8Q==
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr84678885a.6.1790755795551;
        Wed, 30 Sep 2026 01:09:55 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr84676185a.6.1790755795118;
        Wed, 30 Sep 2026 01:09:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9b38sm465136a12.3.2026.09.30.01.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 01:09:54 -0700 (PDT)
Message-ID: <00f06039-3b07-4c3a-874f-415b836976b9@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: geni-se: Drop unused icc_ddr parameter from
 geni_icc_get()
To: Somesh Dey <somesh.dey@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-icc-ddr-param-remove-v1-1-61223714c9bc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930-icc-ddr-param-remove-v1-1-61223714c9bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzMiBTYWx0ZWRfX0xecxZn8pcnT
 8P2YOxuKLZ6y1VY/5mFJEVkWu9ELlQYJz89pXuM4BbtCIcNEtdighm25m0EEzxuv91CQHYvIbkf
 gmIAZEDBKtYOfzjfoqRgUsNqJYCp+r8=
X-Proofpoint-GUID: wtO8nQi3kU5ssdBjH6Gh51NPrsCHDYlG
X-Proofpoint-ORIG-GUID: wtO8nQi3kU5ssdBjH6Gh51NPrsCHDYlG
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcc3d4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MFSh-5WjxefZ8lS1Z5gA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzMiBTYWx0ZWRfX14tk5r6IFdLF
 Wyxwbe4CUY+7S4Zk242ezqkmqGCpJmMVjkkX8OrJxYjn2qdaLV9kdKbLtTXKbvmunYlM+iDeat+
 S6GzUvPDqpVq/eR5foRzL8RjJLwG6nucs3SIliWzzK+dNLnrfmDgmNSLClz5hiqxuhXjlttfECF
 1WSMytpF3ax5TEoPpxXocim1wldRcQ1r6fnB9oNZQ9uq8BJfx5wu+ghtsVW1c1GrKl7cROVYo8h
 XfJcul10OkSjHx4Ra1J0C259YYBWtDTkgTSRlJzjJirgXBAt+N6KzNHPm/nW8VH/DnPpkub23DO
 +JuhrT77eb33Nw8PI1jo46tgOYMhCwkLsTND/bSoETrlvzYacnezAnK6x1aXMQhq5iEtMPV+VlL
 0bi7k0k+Kqv8u1S2YpYaiKcfKsJ74PDUZNw41hqWDMLpkQyvUkhP12ijebqp+Z4xnaYLJNAsofd
 2saY8rt59m5pmfRtOjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300032

On 9/30/26 10:01 AM, Somesh Dey wrote:
> geni_icc_get() takes an icc_ddr string argument but never uses it: the
> DDR interconnect path is looked up with the "qup-memory" string literal
> directly, and the sole caller passes that same literal. The parameter
> carries no information.
> 
> Drop the icc_ddr parameter and update the prototype and call site
> accordingly.
> 
> Signed-off-by: Somesh Dey <somesh.dey@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
