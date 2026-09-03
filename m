Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251FF3F329E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417531; cv=none; b=hiNkGWNQ0IHv0RLBfhC2eJ7SKCWd14lOgAIl/YI6fryB3yhrTPhTG3s+EVShaOUcdL56Assbk5hYK8g86l0xUeIXrXdboC/Z7veT+5gwenEh8HS/9PnHgulx2uqRqWlvLSApFyQ5gPcItV6tdVXs0PkfX66dFI9wNBsbOrmloxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417531; c=relaxed/simple;
	bh=xr3EdbHecvtb48ZZz6jAzMvFH3J4sYscKx5MxVg6XRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFn84T9YtGFab8xdeM1i6YPNx327ogR8P07WMj9L1NvT+Jq1YpyMSuz/QX9zn7/yFqwOs3cvqL8KtmnsomM6q6ytS45sNaMLY/1BSa5hklnBKRl9VQJvs76bisxezjwP4sY+hMxwhuwMbmMqtagZR/XSixOZgc4RYfk4qPE+zpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CG27UCLu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdQ/riQT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CG27UCLu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdQ/riQT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lQAv2596699
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 06:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=; b=CG27UCLuRQNkzumh
	I6Qoqg5E21BRxR4VfC/MDWmPiaJsed6D32s3te8LFDfyXyiaagK6NrCYj/1PGT+l
	0l9Twpearm8Cuf9T43Sle87YWFTWiXehgqyWThvqZOvr/X4+PnczUW1sQQjCuJi7
	HdcH1aBSU5r7Nn1Gdicrv+1AxVgDm61MHC/TK5Gd+kIlehnmRpYytTKAj0aYoUBL
	CAu0ZrXQ3he8Jz9MxPJRdd+y17mb8TabMurRKW8lij0Ypnz4B3V0ozPDl5DN5sXK
	wX67vqXSixWzvdSUZNzNSQRfF+aTyd1YAKzxFvAXTHN3PFXKhzZ4hMXQwwg1sepZ
	c+aT/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja3wwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:38:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9349ba88188so44496885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417526; x=1789022326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=;
        b=LdQ/riQT2eT9C0pMhHQmohtxPKaHmDhC2JVjUUvvo5O/RT++QsUKT4QzHuzcuETLQ5
         /JhK40Eip0ZkJQKtPpaVP4jNc92OAC8Fwy2P75ArZvCLuFJ3xg+5jK6UoC9n2S+3ESIX
         WV9OtSo31rziG6BwddMNIh97N7jQDryErNOMfWdUehzJGYHse6ljxjoJ1WHr2cbgMV3D
         Lerr+BGfHTH2vrxfG4ymd1+JaOlzF07JM2YMkfYySiYYcwTI7YIhdjYP7wNvWzqbA34S
         Uc8WwoURqa3JKvtdwU4JVpinccv/dwwsO/R6edUh5uwezNZLcBscx/BXWHGoNzURGvoc
         wlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417526; x=1789022326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q21UaDH1Gx0zZRcuplLYEFLHbV5BirdWzzoxkGKL2/s=;
        b=ISZ3sV5O8f3iMVZ4IwI6bsdwioF4/Wah+JfCTfF5FZg03isLxKyIbYqoVn4mQx4Bjf
         EeTXFz/4zE9zGQOT7O7DIIPAiOMMGamK4/v0P5hth7bQH4+Nvs0zqULHC3giA3Za9q0q
         w7VEH3he/DnMZzLgf8gIbOykgS8UWPznl1pMz33gz0ddJTfr+x/Xln7HYnHQ6u97OQOS
         A99Xt+3091J/8w+CM9eguv4UTM/MVx+7Ds6yKlFOkZgJqL4xABwXjkUk4LZW2vGOzsap
         qFjawlqcrOBIA5C6KokrLRiqUPXHCjY1Rte20fbayYjnRmJ1/FjVH9dPdD5bc/J+QavE
         ZdMg==
X-Forwarded-Encrypted: i=1; AKwUvBx4Kxq0F8aXrRHv8Y7UWrZgyzx1/1KaoFWp8UB+FjekNutIc4C8eufkkQpznAQ2c9iiP75aXwG207oRUD4=@vger.kernel.org
X-Gm-Message-State: AFuF++k6YNA2yHJvLLQ+0IKGLM+ZNSyQdwBwrbmYlw5+j3tpOd3jIxqH
	nomw/jSk27B3YKjXpUBtx8mt1QcTELt5wou0yX4ZnthrAJ32eX5KOYRB74YbgCbkWvyLhpk8e2i
	gOx37/EC67Idjo+sQ7X8zUDpUnZzsdmM9ZGkk40LFBqY2Ykja9dF6iCkbWj7WIc3bHFo=
X-Gm-Gg: AYBFou2BvryMZQnBLubEM9Q6ANQmjn3zBb1YfaWwiXuuV91pqpimHOHr5RaiyPXGpl+
	ohut4hKzfpTUiZ7QHM6C5Dj3l3R//Lmgl+xs+4t5mvvkMxAoZmneGCxMNgzEYf4FXhWEggaz/Zx
	3jdrwB/+PDd2255yVK6+HV0KVvQviOlyKN2m19vQrPtbphNbMox6XOdZenoMY3JSChXsByUlfQj
	VgWVSb12Yjw9BCd91v0sYfOEAx2ANiV5hAxOubyq9IyisbJNYwHS7yitecbRz67xVcZQoPsCLVo
	c/m0A7rUZGudhuv4tDsjmr278ZwNHL0eGDKIFEl2wSEOU1oLBO1wOZd+gvVzYmMUZndNIIJkN2A
	Zhb0+lG3FTr+7bDPGCmSe4g==
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr362287885a.2.1788417526035;
        Wed, 02 Sep 2026 23:38:46 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr362286285a.2.1788417525612;
        Wed, 02 Sep 2026 23:38:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f6c2a8f6sm40501766b.35.2026.09.02.23.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:38:44 -0700 (PDT)
Message-ID: <ec4c4c56-f976-4e6e-9b62-127952e839ea@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:38:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm670-google: Add NFC support
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260902-sdm670-sargo-nfc-v1-0-bed1cbbffc46@ixit.cz>
 <20260902-sdm670-sargo-nfc-v1-3-bed1cbbffc46@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-sdm670-sargo-nfc-v1-3-bed1cbbffc46@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JeodZ3dj2x-9XfO17tJ8aQYjw9r-pA11
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a9915f7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ROI8ggJMWDmTJZJ5NsAA:9 a=QEXdDO2ut3YA:10
 a=Ql4v02ufxVEA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX621D/vm11T8c
 x5uQh93hwxVnDh/kKcNU/VP0YZTKy+oG+f3+2KRczJAxAHy1zMGfMEBdhWdlO/hN1ZHTM/+LBAH
 XYyZiGll0YMu8SmqwD0bnvwMirdPs9Y=
X-Proofpoint-ORIG-GUID: JeodZ3dj2x-9XfO17tJ8aQYjw9r-pA11
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX09DyKlNzMz4m
 7gO6z2KWIuRe7v2R4OZFV+JSPAJswAE0O2qn/uRTmLUizYxPQdgdMW3hUxWGQAcqc8fBxfWRCrA
 hjhVfLTUmQkfIW0X51LumbqfjdKpKFYunvX+xAKVWkVqxl/CXeMXwPIbvler+p9RPoUa5GnPNAE
 LuVgJ9WB3tzVMcStdu9KpbvEK8wYKIfwps0Bct1i3h5nYkPhpCTF/RCp2Bwi5OYTUNReYM5AtV5
 i7l1TgNXvcSB/JZHQGfqjPrCXwiG5p6GQezSTiRNMv4U8e3e71kO/2nC818G/CP2f0/ADyOFxnT
 80qavlh40Nv97YfJe0235Ft56Avjt07PJJYSZHH28FXSdeTcaDhhmToaRGv3g8bdd28wNFLOLS+
 22R8h6TstTQJ07zJHixHtER6sbt8QCEuTkEQUXhXSUZgjsqc0bEXuNxbqug+09c7FLly6E0ynI9
 EeFalIx9YQx2dUCmcgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

On 9/2/26 10:59 PM, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> The NFC driver can detect and read an NFC tag.

We would hope so..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
