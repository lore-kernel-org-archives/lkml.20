Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DA245C717
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388900; cv=none; b=Q11Qfm2na4I6ysUy5QjxVCAg2NRHZ0ziCAxZ9VCf+IlMevkWcLdo37rT9CuTjvktfo9Q6lcJbeHwHV+h+Tc4fKogle651Dgoe7OMFAa00UyS0XxeM7pc9WShK1MFbUA81/l6d43OeuJ9xZKudqc/MY1Pgi3/SyRMDyirmA3Qi8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388900; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onJA3EqTJlDFt/fI3dbGjWuSXd8jZFCFdiuYo5XyNOsfZk1cL/hV0mFkOvIIeM2X9hzLWKosChClKGssMPpkMeoNd/qjx0U2+0dV5knQoN3PGYFBhZ/HnwRth/+3naWm5wms+N/1US/QvC1LE6dlGKtMPo2nr/+aH5vCuvy2u0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htZvU7Dh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pr/o3X3s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htZvU7Dh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pr/o3X3s"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm4Y21216187
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=htZvU7Dh0d/hRKb2
	eJiMky+eLQ59PhiG+BQbShGy8LGs8rQ4ljFOF378fgv+keKvyvq2FaW3BRGsbqPM
	AGj3GCXL6CuGsyMhYoEWmeNI6NS4DHBexPu7+R2djlmDCR3vyCDKG/3RPxk96H06
	2cI127QaazWiTAhO+yYtS8Vm3vwPJ45hiXxuRV0Ek86st29z0rNOI2y508yNWGBv
	PcgxGrlH5iwBf9luMyIAq2gjqAVnMJ05RAUAwEyIM+Fwx++l2BOODuSqfbppJLJ3
	k7VyW8oB6zhQfiwtDe5rzuuER/N9QdWWrU0Ak2SjIu5s0MtF+1DissO6vxOURF7W
	y1NlQg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0afcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79812f74f7dso23871137.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388898; x=1789993698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=Pr/o3X3sAmEe0LnInneUtYRyXTnXo9NQBF2Kmt+KF/ijoBuUsOEQhofIeJQhbfLdcE
         KEY+SfNGL7R/5/br/weHRtwJW8JbRSKGQ9FnupofJF8Ygtxld070hR8uaWaG0DGSjX83
         gk1DaM87YvXLxj8KGUn+zbzMl3mFwRecx8j3HeGjCqbD+kjlgbiIT+dBd1aqZEO8P/xI
         XhxPeNxyt/9m7RVqh+yIlSaz13jj1l67gemVxKoW3vAf4SHOY8sbZPjq5JS0mubbL/mn
         toBzcgPtag6I90DbjYUE94sqwzZE75Pfci5cbeyaOos68+m4Kex3GDgAbgJlso+tRi6G
         /Kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388898; x=1789993698;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=UT31bHSS+RuxO6TcbmqC3IkmVU5JlO8lZLTExHQGcIZYKNHfWHiYrthqqdqKht73dC
         ti26qs2xViqqL+2hYZGPv+q5qiCxUkeNN/fjVGZ94evCR8Wx5152oE0F/CdRlSIc+ser
         k1SkORXs78T1rDnj9TY94kA4i6AzZuUxxMK8XzfliSaYhgD3ILpTTZp5S2/EpszHCIwk
         b9rQM+XtpVJIcffIa8xOZ4tIaMnaoQAK6LZbWKAnmX/olyvcpuf4X7yeiTvvZpzZ/CM8
         MAclxdWV+WtqSbegd7vU9cUiKzmUSQj1r7ApF27768NfNB++K6X5Xdk5uV49bc3PrpjK
         JEYw==
X-Forwarded-Encrypted: i=1; AKwUvBzgiq01aKeKx8IM9gTdCU/FJCUwQCc6ExCep1joHEKUGlEX1i+IpBlffEUeeH3yNHtvMRcNDIC1WOCpipM=@vger.kernel.org
X-Gm-Message-State: AFuF++k0mA05GoK/YiUZTYrG2olUjtnDu8byjV9r1UA20EYwKXUMUE7v
	YlG5k8ITugOuhFBglZPHIqI+4Ph13spAaKADw95SqdiLuJbqs0IL/Sas8QEkSZLQ1+Zerd3ZbE1
	3YYdx82fd3Vb0ISuaV/tmNTTu0ggEISs3SKwHajbY9DQcGZXGfq4c/oSKNFIDNoQ6yyc=
X-Gm-Gg: AYBFou1SNSqEQEm4VngQ/gkr0XO89wJZyPY+5UhV+85eFuzlvLVyVJflIpG4WLFWUc/
	0pereru5HVDIfVW1XdCiCEf8afopAnFzTFnpngvZRipZ4LTpGy5uWIIfY2Qfq9IIzAWjI2pT6ji
	76o+nzMoojSKNcuC6k3Mub9YqvazRlFlYiOPJcnBm7BnVQdu1FovNrR8wNxs2MzNF/sbZmXVKST
	wQlstL7hBkg8Ay61r5YRgroRme71ZUg1aNi1IB/J7GQq3QyYzXUPzEIct1GYthM3SVo7J0LvUry
	/2Uv5/IA3fX+DWkWjFuYZ/u6Gw5k0vjPYSXWv6Cl26RyAMb4ideAGNnbrbepE6a0dAlXgjDBszD
	vFlE4NX5Tn2LM1zM6qUTwcg==
X-Received: by 2002:a05:6102:54a9:b0:797:bbf2:197 with SMTP id ada2fe7eead31-79b58c77125mr326078137.1.1789388897721;
        Mon, 14 Sep 2026 05:28:17 -0700 (PDT)
X-Received: by 2002:a05:6102:54a9:b0:797:bbf2:197 with SMTP id ada2fe7eead31-79b58c77125mr326059137.1.1789388897215;
        Mon, 14 Sep 2026 05:28:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047fd4fsm2360273e87.82.2026.09.14.05.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:15 -0700 (PDT)
Message-ID: <28a63387-12c4-41a2-96d8-639471a89d56@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/31] arm64: dts: qcom: sar2130p: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-26-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-26-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX/OS6Z9T51pSl
 6aGVv0LB7LXRxBNUhQuDXAjlLpBuW+K2GRLpTKMTsxkJXOUDbpoGUyL1XgNDKhAZBjTWmHu3/8r
 gMA3I2HjWBK1PsAWCCmH0c+41w37NJA=
X-Proofpoint-GUID: iGi2gczD2sUsRg88kuEN1l8GhG2EPUD6
X-Proofpoint-ORIG-GUID: iGi2gczD2sUsRg88kuEN1l8GhG2EPUD6
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7e862 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX8Jf9JxzBC548
 C9jZOU9dCpI/Q0eJqC8MKaKEUvBQjNUieHHOMYHHmRDrB5MlvTnPOLx9XZJNUE12C+rFlAFny+k
 TFUe9Jb/7U1P2GVdwJ+Lz7LeCePzv5lKHc6VDkU/nbo3ZcaSyFujxsLRi/l4g8r0+3TBvOvUfQ9
 2J0NWZnZa5KGQLOYMPXkHC2cIFqjKDlbdHZCMDPCW29NyXEjxvRMJoFyrMnHip1jOhovnaeTShx
 K+a437zh48u4qD+dcUwbwpEGN8LlLSZjlEq2gAcG1bQUycHWazdTAs4PLYYoSUgHe688kwcZ7k4
 RavlnFdAHMQjK8ij2f+grq3GXsRBmAZOe7wnZAmk/yhq2rb8mkIDxwj2wR0nGVHoDI09LpBPiIG
 vxMMNjmpw03BmdaK4wR7D7iINHPAgSlhbVZmeiqGceceei7o+VVhkH35f+UxH+Bf+HEVgg6fqbG
 tx8Nu7mV92kHpfe7sfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
