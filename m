Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D1F3BFE5C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142055; cv=none; b=Ho683w3Gj1xdiWuhxiBhMpTrysVUFLm9dwUe/fTEGRwCAscrbIUsYs+0DB1RnL05CrRoGrNyIHNEJj1QoEbek+44OGPj1UMqsS7mKHyzD/hnl9ArQELaJuK/jR6auk7pviPbpD9/dOzDYWi54gPDL+U6nCgzn/TicisXq9za1Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142055; c=relaxed/simple;
	bh=OJEq2jEr53ZPXKtp/Mi680q8DSbM8duPldM1a9SdK88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsfnrYcyukO0ZTIH8tE8OQ1seRoPr/iZmqz09jdhLSO9HptrHO6oSf4QvrqsY/HU0PmNyDfduzLKb1UyxrF2RZoDBo5psh3J0kASw6Ned+dIw/FDLIcql2/h8A1ft3aupJs8kUJDpoRGlRoFQOHrrjuaVMy1pFACxBiEMQMDVFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdOlJQdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYvpOr5a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZdOlJQdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYvpOr5a"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lwiI2219137
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SrmfRoS479RGoNTAm9ZWMnLNQHWSSZ9Tr8xg5KM9gZ4=; b=ZdOlJQdvAbIjdPSC
	Vy9+CDU/vIr143YD59EQ7OMYrTupZmxkqtPLmQ3L13bVy7NXmseGptjs4b7cXz2F
	10NunXJvNVFeMM3h2ez0N5C282oCn+bW7kooesVDKJB5lqjhSI+E/3VDDrHMDDuO
	o/ZO7U9nO/LMtzOFhqSE9qo3NtA4BR5DBErNiRVzHGgWH/vraMkbkNPYlC0rLedp
	f2MkUKAMOfc7u3B/T3sSdPee0Po+Dq79CwF3U6jLe6k+RSfuqVHWZMhtLfiTQ2ag
	rA3KmCXNqh9o8tgGf6LXBvtVpZwCiMLMPrwPIwE0p1jwuxxo64WciA5imK+DhPEf
	1hXe/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3q41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:14:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-535d44e2c23so11047531cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792142053; x=1792746853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrmfRoS479RGoNTAm9ZWMnLNQHWSSZ9Tr8xg5KM9gZ4=;
        b=XYvpOr5a1q+omb8/LPqgng6WoFPkoOv6zqlTAHMy3TFOWiKpv2Va/EhpsHRlKUHaWu
         e4sObi4+aGjBxhbp5TlFX4uXTGIK6VnEHktoKL1Nd6fPqJENFo04LMF3hnqR9b8rJfgl
         gI3SBY/bAQzOkhelHWDOYUf6jt85JN0k96NbnxCxL9CstRMCmSBCk8jXb8gghU2dc3gV
         7n8cecWDdOLixbXymCNELQ5+5J/xzl6V0Ol1uwfGfLZI2RQRdzucyPjWPpmqLcMk2eIC
         8C4GVYFqH9osiUP7jdwaRCGDbUbaguCb102RQy7lx2yR3xNe/4RI6lIupj2iS7sJ7R14
         DE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142053; x=1792746853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrmfRoS479RGoNTAm9ZWMnLNQHWSSZ9Tr8xg5KM9gZ4=;
        b=FbHc8UWgbpaHQptyDQA6tYbhdiWHva5V302STrt+mQh713uqH700ha1S6uBVVxhj+q
         NrPoC/sX4iqX+40hvdLiOjzC8VlTrbc6wU3eCk3AOyxupimGApXU3zWgroZtL/ZKjvjH
         odvvs8AOg5Z9/bSC8a9uwiM+JLKZ9+0kI9yMnVvvSLBaX35ll+R+6usT55l+uKZf/VcL
         /G2j4FWDhQKOqXEoAnJj4oWfZGcrULRVANzNJ3eelN96N9JLR3iTrG42ij9RDVAdk3PY
         Hp0j2qq6arfjFd7i0ECvyTrSIyIS0CRsFyZ+BZcuEc6OepQ7WqLAksyV7LJEY06jbSGt
         rY7g==
X-Forwarded-Encrypted: i=1; AKwUvBzhdZFsKjC/2ZBr8mxxyG6AXQTZr+LGfBihJavfEIbI1LDZiUQJQdJhF+y1rF7MPIz5voeX9lpSLVw26M8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWqkfqvDGmTe5udHqpc55MPk7/uOG9LdTSfGaaAh0/25TpnFU8
	FEhGy/2Z4CAFBmkoYfUoEUNLtfcy7w4xvfMyshyL2oyF3AmTIUEHxhoIF0kR/MWbtr/MS6WIr23
	y3EB923KIMBL0l5BdCIR15NS8SPrcLZzDq6RBFI0EaOQkFoFj8mbayVCZk7BfIW7HscQ=
X-Gm-Gg: AYBFou22/g63v8i+ajX7XODZOZgzA4PMPKjp4YxP9tTLlRdliZhaQa7zC4Wm0Rxuv/C
	opnVJFBKaZ0CzXhVlXqTEjUQA1L37lzbQMkotv8sATVRDm21y1vzKze6UbZ+KXZNtxAJZ+QQ4pz
	qMl3YZS9RQnlBdIyS+9t2wrQFeBICuSO94/a92LPyHXpzxGEUMxBxvoizZ2OKYr38tUgck7PquL
	22PZNc77N02I1YfaSxNfPxnVX2TsV6koeFdTWbLGpZytcI/Zjpqz9MOQM58eQ37BVMuOWd1WzKh
	cURM0dFKXlpL1FxRsXiY5eqs3IO31szs3Aj4UXZp17hZLZYZaub+ppKose6EDxBwSSM0ne/A9nz
	5GMbB5/BsyY1iLmJKM+osYg==
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr420037571cf.0.1792142052875;
        Fri, 16 Oct 2026 02:14:12 -0700 (PDT)
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr420037111cf.0.1792142052249;
        Fri, 16 Oct 2026 02:14:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c1282sm53264266b.63.2026.10.16.02.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:14:10 -0700 (PDT)
Message-ID: <4244177c-2ce0-48b2-9a0b-d63f1c420f9a@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:14:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] dt-bindings: power: sequencing: qcom-wcn:
 document wakeup-source
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-1-linghui.wu@oss.qualcomm.com>
 <20261015041241.2186521-2-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015041241.2186521-2-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1eae5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=R5NHEjnr-bMx3tpQEQMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 3532yy-nWc_xHdIXVTwGc9JhEVcwGkrz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX9kPB0FUd6Hkw
 TMnqMjUmtXqBt6Z43hK62GomeA6g8cf1d8jMOwAQztWxKuWmLtsAPI1jQJO3a6CZ8m24X0RQBzA
 ZwcANuEt2cAds3exFmltVxEFnptbRrA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXz4lsSpuQyKCm
 IaU7Bv80BvWTdA3wYzzhTcjPz8E5azfSRiMue0T+MSWq6pbMbEn/YbJXTISz55ipqVplbyIXJSU
 4m02XaHyeRZV/msWfdL2UftQQTStmCeuRe8ocoRzozzjjx4MuETS//+MPyeCbxISBBsZ9aGqKh3
 3QhyTTuerw1hv9J7BLw73RVBg3CKzLvVD2N45a1HAbrH1W0kAl1TL//JuD6yb9Urp+UkNgrP6um
 44H/SOqy6BqMi+7I14/pjbF/hzq2yVZGAhlMwtaOSWqmqnr5sPFBuRrXUJbSI9sjU8ZeNQQ+Zur
 XLue/jKkr2NA5MLIVyExM/bqW4ZZMeEk5KrEUihVTIjsJwADWKL6bdAoYbEW3X/ApAuzXmU9n2D
 Ltyb0kl2gXlqUbctO93n5n3+D7DpK8ihjq3an+lpXeysNnnFTco8lvp6eTwPb4R1WJStttlo83Z
 8I1mBMsJ4NgWsgCJ6eg==
X-Proofpoint-GUID: 3532yy-nWc_xHdIXVTwGc9JhEVcwGkrz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 10/15/26 6:12 AM, Linghui Wu wrote:
> The SW_CTRL GPIO can be used as a wake signal on platforms where the WCN
> device must wake the application processor.

"must"?

> 
> Document wakeup-source and require the existing swctrl-gpios property
> when it is present.

It's a little strange that the property lands on the power sequencer
and not on the WLAN node itself - although presumably it makes some
sense given the latter may be dynamically discovered in the general
case

Konrad
