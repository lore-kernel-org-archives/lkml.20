Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481754C6811
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070391; cv=none; b=rG4oSM6TcSgAStjkbcuRKczde/qH/Can0vUNBD6FGy84Ngp+IHhCNSJ1jwZo+92VpgrQAy8pw+YGzArrAc4SHKXlV2upvKCzmXB+JsulRTLj/yo1HhLNl0qcdDFf2DQfrgdlZvUBmWlxPzEkWNY6Vpn1eVkAV2CpwrtBLPZ0VLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070391; c=relaxed/simple;
	bh=C017S+WPS28H0KBmmCJHn2yw1QbkE42J+XEXfHlj+SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E53Nx7X9lSPps3mku1ojJ5lA7uxYfIB7z1OQwvYOkPuYB7qew+qn0qt0V6felOSZFvg99pD2AHnsDqOyO6Qjtb9d1KJ4MT77CQXZR0595a9sUKQVXap8bFpeGMc8MJw85LlgpgWGK4aHU568oEbBgE/Xq1/cwWrIN4+SFpT15SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+a9BUsw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwtbOSxU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+a9BUsw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwtbOSxU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7k9CG3712854
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wH+m4/fTa19EiJ6UA3g/PzW4QR25sui+i0TbH/t1//Y=; b=O+a9BUsw2VXm5ong
	k+YXzFo/6TD7ZlJefX/7N26o0qNhrLtg7TqWaVbvd///Fb/j1+V2TE67UNiTTxBX
	IJKR9mi3iXHF6HsIld1g36yKAENTjggviowO8uTA3EPXhY1pVM4h/f60p2rt9uKE
	rCiEdEXkcBXqbUAHp6IWbHAvJCixGG6EMpvVobEDgioX9j/SoM0T+1FpeSVPjGGb
	2I/EUfgm669VGXrEcYsVE2lv4xV/D0b//+TdmTWsyXdiigKRdMl1ozhbPj9MO3c4
	0sAbrZUIg/XAUnNb5JyZvfWgtfbw7gGH2C/C0Nyc1E789u0SEAamHyHSa1JeHo5t
	BLg3kw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyrhs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:46:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so82899385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070388; x=1790675188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH+m4/fTa19EiJ6UA3g/PzW4QR25sui+i0TbH/t1//Y=;
        b=NwtbOSxUhk8vzHwA0IxnglgEPOPKBhyZhstzaR74CH3XeE1qqD6ab2bXXWU9rxfMnD
         aLfQ5eOwjKxPnPN42Do+drjHNf3K0cCGtKZLf/G8q9wYGmZNsgcEMQ8vG95wtCZjyemc
         g2c/q6vcbHh7Ax+lat6ecQK3dYm4TTixnUgAi7Odhnw7VRL/R/5mZJcXU+zXstm7oXwx
         SBbTr7nhohR9haiSJlJWBwi8jmm4NnuZHKStuB2ysVdP4tk2cTPuEkmFvMk5ekb74Y+/
         CdTrwIsD6KTO/+IrlQvn/92DIyAnM0nUO4+sc29JDxkh4mVmGRWCrni+KgAvrx5FVMlD
         eeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070388; x=1790675188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH+m4/fTa19EiJ6UA3g/PzW4QR25sui+i0TbH/t1//Y=;
        b=jdg4VkxTywOSZ0HqgwDcqYAlclKT0d34L1rd0ub04/rFKYzhYjsuk5SoakYPupvojv
         BsKjmK8wEQTe11MSLs9lxEHSL/K2aXvPBHGcEpYsvylpHffLYCngU2iAla/SzMWGFa7c
         MHwW8jC9qGnwAwBE4cNj2DPSyKHHM/2gxaz/uGwXJCXG5ZbWiHt61BUvOUb5TZwcmrUF
         uCKq+J+rpWNk81+LJ7rkEVeh45aUtw/cspXDwvbs/frYUzqQtD8mWXyXnCEIR0lFfg2F
         P9r45vDWOKHMs3kXff6WUwHkivMKnh0WSs5SDTuRy1vipTne70MwhyfmuTf32I0P4caZ
         v3Ew==
X-Forwarded-Encrypted: i=1; AKwUvByz3cnOjKEfawpMe0FItsDzcXv4jMy4CJkP3V2MPk1QIBm4TMM0wrrR3O9ci2UKBdkx9mbmkSRBbZfCPDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nTKGRLgLpLCsjOHToyn520AXiGoLtZ9hwcVP9wGRBk1Y0PBfc1
	WuFHdLBpbSSkXpXMwScreG1xRB72ppJMbcoYexNAVEr1up5lSS/IpiWMzflP4YOt9unAV7My9eG
	w+g/jdldvGm8FpMELqLkAwHHhAzl0Wvq6IwRFYmyr5JK9DaIgRYyK4YXp81dcDsmfd04=
X-Gm-Gg: AYBFou33Yzmgl+RaPwC/y+aMMciVrFsilwuv2hG37B1CYXL3M7eyKKYwbodoqDgr2BY
	IsIz8UvvCbWAzOkTPKfxf3g4l5wkvOr0YaSEttiPiHmhn7QXEjtAVKGtNmEQFH9cQOd8VAax3Z5
	ZS2D/H14FaPUDIQIcKWmA6GimgzdbqmvcoMpceSaMFtPprNZKvln46l3id2rhRLtjhl3NahU/AF
	2zGXEv+H0SLURGEIzUXLBE0yd9T9ljIIzzeL+F+iUlZm9ubJQDpAm0jMPsRwRDHRcGYl9DH+qsf
	mAXyb9LXT1x5g9gAadjzaWDn1CquVIHd4lRAx4y6FZnfUXfqkyC42/Ax3UAk3ZlQE4ALdwKnDQF
	x5S5H2s/b2u+0Bqx4ZgjK9Q==
X-Received: by 2002:a05:620a:4006:b0:939:eb09:4458 with SMTP id af79cd13be357-93c15f34b74mr512911885a.3.1790070388509;
        Tue, 22 Sep 2026 02:46:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4006:b0:939:eb09:4458 with SMTP id af79cd13be357-93c15f34b74mr512909185a.3.1790070388166;
        Tue, 22 Sep 2026 02:46:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9f1895ddsm40279266b.9.2026.09.22.02.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:46:27 -0700 (PDT)
Message-ID: <0b5ae4d6-13f4-4f48-bd25-65cffad0fdd3@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:46:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add PMU node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tf_A1ziDFuf_AQAzPV9gyrYHWrhkasG8
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab24e75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aHEHYAZx7hSDT81ZUAAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0MCBTYWx0ZWRfX6wNdMWj5fNfj
 FVeLUYpf/dwmKQPvNDiNFPPm+kLfLpPks9aTUjOo+C+oh6TJWNRycFBW7zPcBPXUf4HxBxv7CYd
 +bCvvUG6MhBP8JzdCZ/P/tHpvoBIbXglfSX7qcuYeIuVNoLjI4HE5cZRqEsNO+DkLL2vsjvJUM4
 RJv4OorErRlqrfvRDL9cH4DzZZjeLDxXRn1Ll92b4rb5O8oIQOuLRzAG7iWguD4b2RRlhRiew58
 +xEkq6oz3Cb+nNkZRxGsDRis/JeH4G4rFxcsVsbozelgpXp29e50OE81gD7Lqv+dQZQiw10p1b7
 z5q0I61XtJNXCGVseoT3uF/ftLwO67hVwIG1F6zzNp6Qmc7FOhrOtdh00qStFoJ/mVkBVi24GCg
 9fDhjPSxP7i6/2QlJ+yNGsQiRAwQiH+eJxPJPILj9cntXoZO3W2U50vnbTljNO+Z9gwbF4mlY/M
 a5atVk5NC+wmkmNTvMQ==
X-Proofpoint-ORIG-GUID: tf_A1ziDFuf_AQAzPV9gyrYHWrhkasG8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0MCBTYWx0ZWRfX03ZmqjAa+2XT
 1LZ4zk0nLw+70xa1FpuzECwa5k+p1Vi7EKlZa5vQBhN3H/QEeniQKQlprF12s9Akai74DN7FGwD
 y8oDvM6RXSbe6+W2pnRacYC8zKImbGY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220140

On 9/22/26 11:34 AM, Shawn Guo wrote:
> From: Anurag Pateriya <apateriy@qti.qualcomm.com>
> 
> Add the top-level pmu node so perf events can be collected on Nord.
> 
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
