Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5C949F11C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357472; cv=none; b=AWEc0Sqio+BFvmveo8GynMYtS2wIZ5BTYh5ZHShv5cVJmre59Ajf/lINYZ/lePefLhhxp4Ih/eFQNXFiHbUzvBnxeHLdS6bQ7yb3sq3qL0VJj93itw/COsy+dKMTlV8RoPvicZQoMWD6094MSh1AskmL9yAqyY3+78qPawMYPKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357472; c=relaxed/simple;
	bh=mbPB8TJm0SEs/kNNc3al0XqMbhDTl/navwPpGCPdZA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atRcs4ufYqCYKNYjUMHNjvp2r1J2tYScYF4ogV+whOoD/fEGeAbjEbX1uXsKr+xv9bpwmHEGGrfSpN0E4s3bk1r6Cgu8NEs1kH6Qb44cJQeiFNuj5qh9dqp1vrfMqCoq+E82y3r8xjUn0BR7k9qsbq+swQY/+ZjDHw/y91Da9WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwHmFP64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyKdyOkc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwHmFP64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyKdyOkc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CREZA2001685
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 13:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihOODbYYBl20K7j9RBcJCe+Yb2VmHVhiJmcPvuSo0v0=; b=iwHmFP643AT5acfS
	hqqwU+mB/Tb/+WOAtCM6VRZhTk4QkyeuTfyrklIkCVu9DgwzW7BRJHe6pjFj/PgB
	dl6I8kyNmVsVRHlOIZV37LQZRt0fHhMAh5C4dK4t5zY/Xr/qYjHkLBhNHzzlIfji
	AzcJqEMRbW4CSX1ORST1RIMboKKqQqcNe10gGqddmzm2oykjOjJIkhpcGX8r3GEV
	4WZ2LzbhI/YhbWupToBjrJl6u2mXpZACj7GBYAPRmzr1YYQCtCFHt53UOxjIXM3F
	7GEfg34qliJEKsucJap1zuLW5URY3xGjtpWeLZJK8gOJkDh04mseGGwgsLL0kXVs
	lNDKKQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy13gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:57:50 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97bf9097592so16111241.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788357470; x=1788962270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihOODbYYBl20K7j9RBcJCe+Yb2VmHVhiJmcPvuSo0v0=;
        b=DyKdyOkcvb61nRWHcT0mvCWRFWOg+YfXagYKoueEBTr9AZyz3IbQ8U9JnsKcN0WhRj
         Ct7ayZqThm4Nhx1GvmgTLixYzNm2v4/M1qS5RdE8UJUdFNpHgxjMC+FZfTlikWkwKIWU
         B3sxafJuMaluYufghc+HH4TXKmO0ilAFMtugZlO1OGwJ05mi/fe+u2VAWXg3USDuXO9L
         vrxJcMkR3a7xiX4nAC7QFY/F7ZdWwq8ZRuC05BGm3mrM+8DyNZ7ivDnUHkNVelyh2mT9
         Skkb2e1G8z1Y8lXKiCarMdPVYUMsPIse/1Jb0sHw6sV4whS84sKxgzQLm6CEsQgZy7GU
         l9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357470; x=1788962270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihOODbYYBl20K7j9RBcJCe+Yb2VmHVhiJmcPvuSo0v0=;
        b=TIV7g5TSKRmxvFZVsI/IdIGtnS0qGnItcXeGGKHC2qBoctx2RjyI/XQg38ZZnKHxQp
         XA3zRndYSerEoesInBOX1Pe7OBtHGQhG9AUyRWCXa6kUtv/P5Mlh77BVpChXvhXR3dQ/
         6pbZg/Mo8WxaifaeA4Ji5x1i+Ff4vxHxRj+LptCjW2zCN3Fjnvet55xZV7yFaFm7UzKX
         Yzc0df3soadPk1ZPpblsJsBBjKgpx/V4VUDpGB9vUZU2YPBHZ8FU/W8zduH8eJUW+BzE
         KX1A/HWNyjPJt/wvW1/kYrA5ZwVu/NuZ3qBRTQdxtrsuqbIS+CHURq3y45RirFnJXlIb
         vp2A==
X-Forwarded-Encrypted: i=1; AKwUvBy0PrDeKHdBI7plMqZDQ+l3ur7zM6NzSYxvhLH34JTPRGBMas4hHYTxUwtThD1XnbVrwV3zOWidTJ4M8PE=@vger.kernel.org
X-Gm-Message-State: AFuF++nH6h7voCJ40wkoSb4FUtrNgI8RuFXHcwfuM7sdM16qVxIxdcMf
	LWq3dHaA4BUHBdSeMQSyTZriQIORexTgPFl25yLppQjncDvp2uRx8QO0al5Q6bjYZ25wiFhXsWM
	xs/tPk0JYWycxRVpdruDggjTpac5YBk7tnf+FxchIrFGuHGp1VV/mJKpFmFUp0zNR0RU=
X-Gm-Gg: AYBFou1Z2LnXkXw5B33gHgcmNriAlt9Ml/snbxM0Sn/qd4LShbFCwtpsoCgYZhA2w14
	wUAponVY4P/zLMnqcknO2uZbaB97UOgaJavBUn/4eJ3Q+DD07DM0y/kRL6x2FbCUCWjTePhAtTD
	T2MY8kPLV2VNIaHOig6soF67qSeRV+PXdPjkuoAEyxkzI1xUGUu/T089Wfo7eYF8/u9FlE8+BLe
	zb2BsxmGph+Zb3bJ2PvkhX7TPe+duZbk33/8CDiPwKNLPRPGaMT9c/JJ2xwsIhseET3O8Mtsx0g
	+ou4o4VVlj1zgSpCMtQ+5+UDW/3kbeOBpe/lq8TyrLpmb9ow0TPA60SLSUOB5yfdWJmXZGc0FGe
	7q5LDQzAyZ4AEc9ade8wJkw==
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr637207137.0.1788357469652;
        Wed, 02 Sep 2026 06:57:49 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr637100137.0.1788357464435;
        Wed, 02 Sep 2026 06:57:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad006e0sm5819851fa.23.2026.09.02.06.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:57:43 -0700 (PDT)
Message-ID: <16304e5b-9be6-4f4c-85b5-c03a7ef67d23@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:57:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a982b5e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BVw2MW3o-W1nHbPf4OAA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: mO7y7IiwBkSDa3JwqrRdayT22-EkIzAo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfX/jai0qX4sBn2
 zuj6JKcJHSOJ8Zkk7/05O03c6QYFK6Yoq07WxjDe1+17WOPd/QW8e1aAfrWV4PFKrg8rKbEnc3G
 6VqiFXji6nfLkF2D86xS/mlfBMvIrZo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfX9pLCy2UXqSnx
 xPYo0CU6ociWVKkvFbdQYXWrfGtoytzEj4FfOh6tXAc1Taq03OGxgWtdNqhZ2whRDMZRHrSymH5
 mA9jE8rlGlzQi6faghHQYUrLYDxL7wiaeocnIspbtQ5P2j1zdqrH4agHauTqPGBXpn2L6zwvA02
 yGuf3t5qnY22T8UUxDcYUZajcx+CzTJKfzyxqvshBEgET4NYjdc8fYRPXiHiUr/6NGZjGI6hZBb
 A3WWve7cSrRl/AonH9gq7hEjPcM+tWIdR8XAC5K1we5Wulh4WJUi2xF6D0KmLc58HhXPDe8tsLf
 dsvZfPmjoFiFMP8OWQSkueABtpaZ753YSPlzr+Fst6jf0b8OmnuUEhhnhY0Kv5yjank2itgcCkt
 KPy+VaYXdY58Y3dg4JqGC7Iljq+dRSydGHZi1S6ya2e2HlINb0no6zEM4mVT9FIqkokHHpq2Hyu
 tGGVzvdOaoobFpOnhIQ==
X-Proofpoint-ORIG-GUID: mO7y7IiwBkSDa3JwqrRdayT22-EkIzAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020123

On 8/31/26 5:21 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the SPMI PMIC Arbiter node for the Nord platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Indeed there's only a single channel

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
