Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624801;
	b=0eWZjwPll/5wI7uTFuj2pdm6noCHcGzJ6yhqcnQHkq+Hb6zod1B268/7kUDM5KuKyey1
	 i5+hXmjTHBhb4Ed7Zx0htnD2K9V3cEuUNea+ExZ6rsMgYx3v1qK6kQKB0Hgti8PebJ7Zc
	 1H1sILBv2BsDLHU3nWZp5cnjBD59VsIt5qT9q2nTJ4ezdL1mVmT1BbKVSIob4T7r0+9Ta
	 4kFIG6oVlBuPN9oCignYfqlfmPQ27WlQCqIdsjreN8unrgERO+D9JdO5+psyHssXdZpc7
	 uqzeA9ZdjHOlmR0bN1hLWAB3/h/dJKUk920HG1/2nCqI1VAfhuZ34HUbdVYETStWUNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=;
	b=egcy4tkbXAL8JgxFQxY6Knxrw7TvtQFcccKtXu2Yb5GKdECEHFRU/xw7em/FRuNR0L0P
	 NMtB8D+ijTyuxKDueSiq/ro7O11gNJ46Z6Q9DgFZsJGXBdhHxJgJiTYgNuxtwEKUvuvA0
	 uBOixd8YcnFt/aWgjE4rWyGRE8t3d1fv4xwJ3NiI55h7ilrbsBwi1kaFjuOEoGi+9LqVN
	 zJ6vsRz5lAizCfrPBTKLY08CY5Ni7TgbgfdqCQzrMJJHOSQSraJKew+S+ltaL4/7ji13u
	 hiL9tRjGm560SfDkTKLMCOHiiTUShInYuRSDGo2yfOw2pK28F4IjvXfgDEQpn2rYuDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDsGjcbM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SoLL5IEP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E117606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E117606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDsGjcbM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SoLL5IEP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2D0Ea33958628
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=; b=NDsGjcbMTbk37MeD
	3eYr8+mo7g5GMNTPToIaxFw2Hy5u4l39seDueMZLJadr/3jcK5nlP5foqSXQa6uc
	vQtXJvr8HNGX0AwyFlixB86APMLmugNthXbAJkme8YuE9CfRKZMGu6VtyCXWAGU5
	lKhkyYDeYiC0H0vcGCrRVzAnhXyxtPaZcqeXylcHO/H/sAVriOrlwB2s82B5Gucj
	JUnKQeaM+MhcSjBfBXYvtIfPwnLF5kyQFI6T4zjEBeDn1y+6AqpacCnypG45rNNa
	nVtQpyPAd/vmTum6JBd/GTslQtsM95EMSvcaheO7t/TGlhhIj6nyWTSB2ftEIyU2
	mbCyuA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5gaq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:06:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eacebedc9bso59745e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793624798; x=1794229598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=;
        b=SoLL5IEPUnLwrzpTDYY04f+MyhLMlp/r4mn34xGwENGK25YpO/E/lj+8LWHVwfT/Ly
         mh8ipOa1pmi5HEYrwP5TQyYbRCEWnMGqj9cV5mzl03p+36zpJk2xlofNaM3KRGlne13p
         BPOgZiO3NvvUv+ApyVClYhXWEv/vlxZaMehqVOac7rTJ/KMS3TqBmFXlfdz7fnNF75F5
         d4E72zOvUC+gYlxNs+htXdHrfaicqaV+3UkSTWkrUBOfXX1p9xjhS+FBHKgckyhyGSzN
         rn8J7edw8ejc74B6vPNIAIkOuVRmHL+IEBAXmctoB6ATyQfYKnOiQppxsWALaBAAX0Tg
         2xpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624798; x=1794229598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=;
        b=w8XSIuJjpavneiKqrhXl7xP1zod6I9RG/RyOzjQ6T/zBFXrWs6Nq1y26a4GIjShdz9
         m8CoZYzvoOiJ18yFXrb4PRfiJ4n8gFs5keyZd9xpQE/LwQ6qZ7ELlN+l6HQ9+rAYZzsh
         nEbXgsCDb6o+4T/ZohU4G/wL25BxuQ3sHkM4zCHCiKOfc9E3vbUKQEFjpOy80FMyUBQl
         b74nPd+D6rAEy+rreant+56kG76B00I1sMwjSKbCdlqQ/aBIRU+6NgBtBn5NfCPHDgeN
         upqFkhASHISsKnCpJ39vcBAurMZG3dP3H6DrD0e3ntvqwk86fA2jR0eA5m0HgvUTJPmn
         Wkmw==
X-Forwarded-Encrypted: i=1; AKwUvBx7R+BS8qqsejXEPfmAQ60QPoR6m8HlPTv/BSGBHZuXOSktYFN2yUgXckgXcaevBXk+0NgKXl7He0ssnxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DxMXFo2V/Y1AMCD5tr3k+HdYpRWt8IMSDntSEdkyv0LIREmQn
	Zs9FlMjAZzKnUXPchnHrqz47XbWUxPr/nOzgwGUl4HawLUbznAyAoNo5eeMWFOMP+rege6XOnVS
	JE2kf+6d7TU4XWpEbt51g5rHQXKQI7AmQNUkDbTDhE5UsWma/2kxzMiPAXo5DMkgAcxI=
X-Gm-Gg: AYBFou3evIIS6NWq5d6aDHHxZdFAEPZr35XAlplp1UpW/KpxbdeMGflTT1ofaARgwJW
	FFGQD3RZbhriBjD/4oH0tVkh4vX3kMNuJdGa073lUO252MxT3UqXLYyCKL8SyYDYKzxfoGs91H9
	v1AeWvUEhlMAWAcDmCrIx0g4aCjxnlNNN75FsBywnZThV7yrlSigjN6KHFUbuCg360n8CErJ35A
	L5RuYlTUbFtMfFWjGGNSfzDRGmhva9UGqm6NhnbUGoP/FM91XKv5CfHpeaMJ7e6Owl2ylaWsw1O
	oYPrX2wYYsVsEtjibMBUltw6ISBv50MshsAgXeph29FqYpFvIYuqvpbYqcWEoeSaHUhLXPseVwW
	ydxzSD7L4RHX0MxoFDA6kfh3gkUdy4MBH6hKmc0jmAcyducoSnPgVC/WmMnVLaakq+zGJ8Ds=
X-Received: by 2002:ac5:cdf2:0:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec6896c00bmr3914158e0c.5.1793624798460;
        Mon, 02 Nov 2026 05:06:38 -0800 (PST)
X-Received: by 2002:ac5:cdf2:0:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec6896c00bmr3914116e0c.5.1793624797996;
        Mon, 02 Nov 2026 05:06:37 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe2d6700fsm1540121e87.29.2026.11.02.05.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:06:30 -0800 (PST)
Message-ID: <8ddb1fcb-5d16-4a58-8279-a8f574021626@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:06:27 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
To: Raj Aryan <raj.aryan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae88adf cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7vQ31RHkpAPUYO8WQUEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: wk4bMVWLpB0T8HQOesgqXs1LfUM59aBT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX4lLx7gk+MvO9
 OaRZpsTMa7NC+trudWX6X9bOK/Oa211I5TvPuNSpqqxZkZYuD1qVwttH+P7u/2Z7uuBYhav5gfv
 +9m1TNkqI1+b6rVA5KCGrygSe+aLFkHqPKKAP7r/XZynr0Ga9Fu9cBZaAyu3QmMZkFKK8u7xUbZ
 zy8VuaFLNXkLt5mvZzeXXvEj3R7JahF5XabrOSndrNvLAx3qQV5Ix5iwMBsUlpbvYhW9N+v3B76
 h9qmTHS3OvdI9+7CqAZVd/u92Ae2DmpgP08w4EbT7/vRBzl8Y0RG+4o742NqWrolKSY6GOQ4SJe
 wmnN6xMGy2vi1jBfg9LMy0lh1mEwpTKgQeJB8S/LBXgRHzy5lHqcTz60U9xw0qbVcN93bScs0rR
 FJCsuLT6rerb3w0W3davojaIfAs98YSugLW2vAtNsQyBhSaAzhzzqi2rRuraGfETRlS5PZwpkSP
 Zkt5zgYOUZk1iKZ+JXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfXyFCPBr0YG/bR
 Go4vmLY2BEiYTZjkrH3rW6dD6r50OMmMgO0Krswl2a2QH6rHHJ+VeqD9OvYahSOh+1JiIyZVddv
 xWHjsXeI46tV0dytJ1PEPn0RcHnd6Qg=
X-Proofpoint-GUID: wk4bMVWLpB0T8HQOesgqXs1LfUM59aBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052

On 10/29/26 2:47 PM, Raj Aryan wrote:
> Add ADC channels for msm, quiet and xo thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> ---
> Changes in v2:
> - Moved XO channel into pmic DTSI file. 

You only moved the channel, not the associated nodes, please
complete that.

Konrad
