Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234F944A40A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388810; cv=none; b=ACjAw7cUj+2QvAEPiRr7C7ej7tkIp6RcpD3Rx1Qr53+Lqr74Oq6QVHXtC2GdhlQUdE2QkfQ9m5FAXNQJE2Gs0RfRFEVcjAENU46EoAuriUQ1Xf9xpZEX6Wjb61z7S0GhYP2oFy75lJtzdf0UuCYeGFuZbXMYmvbuIPnh2BMusug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388810; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4nDsYD1luvdBD3Us4o7jPoI31/fXvrtp95zxDmBzXhKDAAm/CdkEjarHI6pVSLmjXIHKUOulv4U60ktFYfTvs/kQd5WTUTKWUv34pm9GL2ZSKqScwMdTbP0/K1EFDykIGXrWNSzGnSgLchdrBPMQcYP4iBTmSX0d9BsJ/DxDtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ip2yDfeC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hp5A9/yq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ip2yDfeC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hp5A9/yq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwJj3860377
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=Ip2yDfeCU75+4C6P
	KefBum5gtJk4+gMuqAyktfSWM4mKwZZ65dRwMcQ9Uh+sE+9SQO0Ww1rswWC+algF
	TgAoSZdQcg3UaaCNNxUw78JmXTWXRyzXcn/aaIEILRGUnRB140tY7CC+t0KmW7Rr
	FuJBXJLcwO2gFixC3sPYzkuIqaxD0Nc9odEYW1A1smxv+sHUZ1G55E0D+yjHwwQ4
	LRbCib/iOJGX9n0CGTaUezmcVRu9vK+N8JDqzNtjK6gD132pHB2aeCGGqnzIxcWe
	HM0+nlzKTMqJAVMTj8wN+yKin+Q7Dp2+WlSDH77Wk14oJXP6v8jeDM6V1ca71qow
	OEbE5g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0xxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:46 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c665139c92so115514e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388806; x=1789993606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=Hp5A9/yqlSI4Tp1NB1rdk3aQTCVST0fTPk2kTCxTOq+rLYWkeIyprKHuBTVwa6QVyB
         Isg3T+5b1cxoNms//0GIgP2MrRXmH0E4TR0KkNS9PHQDCGRCcLegwnPj9rb+37/XpU03
         hb8Kk0UsY59fQSejIr0BeqZwE337a7glLBfZkuRNMJXMnwxWqinSuFdN/xmfVoNI4f3j
         Ma1BDpbWJcgWxnPV4v4X12jO3Ra2JVAwqldq4AtbdqdqHEPLQ1YnQzEelYaFwmtu010x
         ixDplz6Z0JPnBQTgWZ0aKvc6C11FJFkhGoJO7Xu2hvQw5Tpv6ClQjdUgggAEE/uQ0Y6N
         FaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388806; x=1789993606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=mStDOsBgHyacyzMnFhPUcJYI3bqUsQPzwbF3b+E43maWREupf8sXToYEPFBiVEhDJi
         FSDd42k1jXxzozpv5StwAm0hVTTejtpkZAUu9R6oe4kkMyVWDJ57om4XXt7JQ50T4mxT
         3gAWbwN1TARtAN8NnOkp7EEIFVsvzOkQzykcXFGtJzICbNJLfsYj0sRjjyO/VnZ59NSf
         phRgxlkFY+peMYVxogRq9aHlpugJI9lAIHD0mEsWJbZnvvgGbork928XHUzcp0CRLEhI
         vxEZuFh2hsPJ1ptBU9hXKsCDe9J2Lu56QI/alfsREKoMMyDsVDjqLXogQ2bfJS8Olx/t
         qciw==
X-Forwarded-Encrypted: i=1; AKwUvBxSNxDCVG1dPv47Zs8Hfg4c0cxpksL0gXkZNEgXFse38Yx/wHfUs9FxY/R/LPPcG3l7eYyHC9inxScyup8=@vger.kernel.org
X-Gm-Message-State: AFuF++mnTSlQ/jG5zwu5DawmOGOiOPCQ4v3IAqMGattPMaIHODIV8qDj
	TCPXe7+oUi/Eb1SthtXbj4jyPD4av18cm0ci6WqSbiUtFZqJlezzEsKSsUqDU5Dzm3CNk7hO9qg
	WnHePclhpPsk0I33EdgWLBXFGLJ2m/koswjL4pKNwR36OWjMYi1qZAHI4CKp2b8T1Zw0=
X-Gm-Gg: AYBFou0I9MShUgzEExgvQkZ/ZQihdxWN7Xq7Rs1ctGeT82yCuLC7AfQoxa9Ugs4SYn7
	WJaMBiE4utebBJfMMRiKQU0EV+hXeW0GqipEA7P99d6tCqdaewqQ1Ie5XwUcssZ0Xbm3YFoJXNh
	BgZrb2jLHPLeQPm1uJF0doHU4RRGTUUzjUtBJc26GSrTBsd6+Z7kLpC3dOkMo94DJIeVKZAVnm8
	nPUWJ4tbCXR+CD+W4gy31swXIhBGgwi5mMSk/k/OTKN8yVRdcbnWjKGxNCENqgoxtffP3Kfstvl
	elRgT2bqopJ3E5bUK3apUcvKErpIhhsaUwANJspXiATYd0KlfePbBr6VNASbUXJubFdg5pP5/+l
	KMqypkowKiDOUlWAei9cPjQ==
X-Received: by 2002:a05:6102:5792:b0:797:925f:2563 with SMTP id ada2fe7eead31-79b5c8ff6dbmr318639137.2.1789388806097;
        Mon, 14 Sep 2026 05:26:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:797:925f:2563 with SMTP id ada2fe7eead31-79b5c8ff6dbmr318624137.2.1789388805506;
        Mon, 14 Sep 2026 05:26:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046a417sm2363884e87.51.2026.09.14.05.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:26:44 -0700 (PDT)
Message-ID: <a057e3b7-1973-410f-922b-df1bf13b72e6@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/31] arm64: dts: qcom: eliza: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4qGW-5MCUOzItPCJLuIldxUYrbSfwVGO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX9pnPlmf9NNIi
 MGkV5B5xwNx5uhbU40RvlrvFH25xf8lcnNsIRbPJOwoedObQz9tzvAPOnBmx6w1ZNE2Kqc6hhfa
 egAIqiPLO3he2DrAQxFUButdPmYOzDE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXyOjuthgOySFf
 ojA2qyPlPtIIgIFWekOGRGFJU0o5WMnw1tDrO8Yp0UzYsy0uv8Nqqst9kyS+7+IAVWso1Sk+x5C
 /Q8pJtIpMpBjVHiBfIJR7SP55S7FW6gIKIWGe5RNQbTLnB/kr/V7fqCg20aChBRMKYFJ4s5LhRr
 MVSjYA7ipfEfYOw7T5weXaIMd9nK6lxxl6cfiPsX229qAWbrZ29Zlbbv5LkTRdL8suVB6qGjamS
 1W4+/i23EEcCwHurqwHY8JOzLETlAaqgzjo7SJMXpBKpntVe6BHtB37xgeg47vMq2e+b5aqNuJp
 fjngnKzJo99H93K51Y+L/8c6yohDsaNlh50+XInP2/bFQp6KYCQEwyI2mEhdDEMt1BuS4OhRTKt
 Otk9/P/nJeL7bQRbqAqgrD0O9C0H9CqqOuzmhBK4IMOIk9j9uJIJZ5kMVb/mqxJ6num3y2+5pAR
 23g+1uGzbAkSpt0W8pA==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7e806 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 4qGW-5MCUOzItPCJLuIldxUYrbSfwVGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

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
