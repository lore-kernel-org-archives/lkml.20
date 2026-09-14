Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975C637204E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373651; cv=none; b=O8AxOfSWvenDylB+QXBugILBAeOnYm8FnDzWZhdg7wgd8LmcNFHmbDwLwcM42lOXBpWTyncZV0WAa74hpIkuqZ+y4kAyzPi9l/FsjYiK78j5ZujYqOcgNJs/DzQ0JrYwk4UhMrl9Y+D0iA5f+1PZAezXthp8byLvJvBtkTjxWi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373651; c=relaxed/simple;
	bh=y5T/F7vrssXPrR0h8cK35gqPOkp5meOnh4qAw5/OTjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UCOEzB5+5vbixna5QlIcNMTfhyTUmL8X2yyha0rCw4fiKIeK3nfIvthUT8GAVfh8b2lbHyv8cVKAUA/osVL27ASw3OBsJp8b21NJcOhVSbHTt6uwleeBzeoSbJDxxb1fzvbs0Iq+0uTr5Y20W/tOr1BFbU6YUoV+bLHjPuk0hQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dU8XY3+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jb6flQ9A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dU8XY3+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jb6flQ9A"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j4hO063755
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6slG+PlxKqF6Q98TkEjyPj1ZH9nSMFFefO7QrlI6Ul4=; b=dU8XY3+QUzdnFCrd
	XDVzW3ItUiB9RsOrZ1WDsqBO+rh3UuBRdhGY4dFeIMNuHRB09bsT4yKHg7d8mH8S
	IoP0yKe1QhHTyvix+X11/IER18drswGDVcvqUbVvripoKm9ZinF0yBivsBCEWiAZ
	AL8+ZjQtIAQ8CaSCsy8SuJJAW9nr5Fp7SHjWqcTwhvR9ZzNDL7fMDgedMZQhXuq9
	B2eRh+4wMsEEBqyWOvbwsGAtmrUrotF4CtH54lTFnze6FiJ4b311mAtecjYH+kBi
	zSOqCJJfJ/U5F0ddYyuDhab+OIG+TYwoChMyXSptzZz5yyc2zAOKftXoVnuotxzk
	xTUAlQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnqtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:14:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso51670285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789373648; x=1789978448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6slG+PlxKqF6Q98TkEjyPj1ZH9nSMFFefO7QrlI6Ul4=;
        b=Jb6flQ9AuZ3AGzGREQ/C5vAMrps0GMVSLRbB8/7D7wSogM9hmjafchHm51+UiI4/yl
         GZ4oe2Ut+FKXmwf8MmNnOE+pLtqpJk+UR/f6tVaskGMMBgdwPvY86om55aFAExcvO67K
         +uz8Vn6NlX1+blcoIaK0WVrVk19h/m+rsm7+gf5H4LsVJAB3JuPGqEB+raGW+6AFn6Ak
         WyCRTb3CgI4BL5TRn85Ypkkc33MrwdFT6X3FKcagx6Xg6ctM2/10M2Al1nNdWpx2L6ZA
         dLS2RAQyhCQAdh8/cxXE2AHzLP82TwZnF88ofhSw2rzaI1DlOL5jxAZJs1bhit3/UPuV
         n3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373648; x=1789978448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6slG+PlxKqF6Q98TkEjyPj1ZH9nSMFFefO7QrlI6Ul4=;
        b=Q7TJAtaAAUV/PIaIAZ3MXS47Y0wDE34iSPQU8ckA9Cvg3RLlOzkCt9RzdekKyatf4G
         906AVhgzellFVuYf/YTxW3jLdhWzRt8UAUPp4oyD6hUUZwf8pMTZrsiaZB/n/R7ZwAxH
         5aIsyrWxfszQxtowubcKfMTVC5S8tcIbGnVGPsy3VvjaIxW3H63uMukB3RrLg8sBHfjI
         tXmysSvo6UmIRIFp5f1aiI1UAYYBYymgZRB27w+OU3pS07QC+Lhub49PvrqdG87rYNdz
         Yhjyco5RDEkIfU8MY4JKCw4/LvAQNviNjk1lVLZnhyuTEpXEdmMGgi9obp31Ovssa1MC
         7GZA==
X-Forwarded-Encrypted: i=1; AKwUvByCS9EuJhmjMvccGWhP1Wm2u3qMSiwGA4yxiCdyFKKLjK4j7pgYH1WcHbnlFubvBcZfN/GmTlDMTuOhPps=@vger.kernel.org
X-Gm-Message-State: AFuF++lQBJ8nOwwKBXNx3bNx5s2E0Jrq+jE7iLq9i1Q8XHfBgyMkmUhd
	8lYJfHJhMfWu8svUb1l4EMCl576N8v19Bf7tF5dJSkPH2XHDEysXR8imwwf8c0bCQQ2ps5FrNV6
	nX3n86i/kFuqR1FjWtd0y0mdPG1jwf7mxeAZsgaLlnhWBzvZCAAeSgDgfhk9mU/Q4b7M=
X-Gm-Gg: AYBFou0YmOKc9FkJSkpYEFg2Kx2uCc3UViJWNpeheLBG3IyZgHtiQc6E8FPRB19aNeJ
	+95NE08sEzXghjhM82kipWWosVGSlqbK8qN54HN9iPxoDuDdz8/LP3m/ahjCP4jTCZQqpQ1YGt2
	J/kRcDMda34iSJTO+84JdrqbCNDJ0tDcJN4DB+cs/YAaSi8c7sHZ4BRHdf+gNDwcSnsOONN/EWS
	EmAHR6zguBepzKh/tkqvLZUenIZRPp2KLKT/050Mhg5BqGOqmnrPzkpW5HWlb8Rm2IJ0xudUSST
	r9u2bU1ccpfiv5Ne6+e8hl5E6ynnx739coMchG6RQ7gjpYeSzrW+C+d2O9EWfVqvnHkm91G7SgO
	WQWsYXbVSdAep7063z7NEvg==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr167360985a.5.1789373647748;
        Mon, 14 Sep 2026 01:14:07 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr167359285a.5.1789373647409;
        Mon, 14 Sep 2026 01:14:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e1ffsm376092166b.7.2026.09.14.01.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:14:06 -0700 (PDT)
Message-ID: <a66a9afe-f649-44f8-ab13-06455f95ccec@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:14:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Correct inconsistent indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNiBTYWx0ZWRfX7SHnh4Iyaz0y
 qu9OYaDWgaFOZC0W2FjcKHv4yx2rczkiRONIYIeDeSxikeyEklQYjxc+JTpHR7hqCxdjZm7J/uc
 OBAXpMYwyjlZqRg1tO1+XGDQbwJOdT9z70mLyPmsydUND/IHA6HyzdtwW3vcVk8Cm6YlwI3hfBD
 O+rb2R+YLgV+P396brVXrJJKMBOPbOqEKYAlLXK/SU8FcPE3hbenL/gF8vgpQeeoNRinxND26k7
 otcqHGRL4emABpbkBIaB5eRzzn3N99RIspoQ6f2rvHzs66w0s44tA5cD+2I2EY/DR0KZIvpdQu3
 cgp+EoDtUrhyU08jIz4W2XjcW59/ePfUIWM91fHNe2xWoGYwkxKtW79AO6DVunKtLfxcT58AqVC
 cNUWi2IKehMYDJ4ZiM/YBgp9DwONnjqLLZVe5zBURJssIfnXDlALy4h4xYG/7e75VicMH2AOA2o
 qi8dHgJuskDIHovL2NQ==
X-Proofpoint-ORIG-GUID: Ip0Y5yAFnlqj_V3UZ0gzLrWVv6N0TJkh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExNiBTYWx0ZWRfX2/g44b0BP6iN
 9mJVGBHybhIWr9VJE/2dZgIlkkhEea1pSND/nX7s+vxFZn5Mr7W9FTGvLdrFeMYLL/YnJ9iqNT3
 KbQpHW1t+uShS8AJwnLcpGqoqmwx8Mo=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7acd0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tPLuR_csD6jfBswSsDEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Ip0Y5yAFnlqj_V3UZ0gzLrWVv6N0TJkh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140116

On 9/13/26 4:14 PM, Krzysztof Kozlowski wrote:
> Fixup mis-indentation, e.g. spaces or tabs mixed with spaces, to fix
> dt-check-style warnings like:
> 
>   talos-evk.dts:39: [indent-consistent] indent mismatch (expected depth 4 * '\t')
> 
> No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
