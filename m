Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C7144BCA1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388802; cv=none; b=AYO1Gkiq+Mwy0+7uizXpQiENqq83NgkrF+Iuwm9yliRRAagDOgaI+9EScR5ifPBpB6sWckNLrjjYfUN8rDWtLAxQ3YwdUwJVSVYQDDIIWq4lWpy2jQb+1D5PJ/FX36rFAUfKhHKqBIWWrzGGFZ0Ok/dHKiVeO3a3XGP2H4SSGTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388802; c=relaxed/simple;
	bh=j+hitAAPFMbwqsPEZqXJrefI8wl7jXzr76x2hUOjwDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJjCeCnhvuBO1QvtXOzhLd5RqWZxtv3Id+MiGi5uo8C+XPZyZUA0yGZhF2mhnHZv2r99AZMQNGq/WhXQAsrIMIrG8eswz3YGQYsnHQEJ92RPv/rtbSEtcx6nNBpCvJzKxJ9eFfuQklUvLI1jsE3u44vQGuGq984oGDqdSMByE48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENS+aZQy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8dqLSLl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENS+aZQy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8dqLSLl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm0Co727564
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C0wOq5GoQsN/HmTgA2Dti12vg5sL8g1wEttsUmVswGc=; b=ENS+aZQyUZgwESD+
	sH+FTSLGIUnstA2I8fW5OGA2dDlXsVl5ueHVVmYf5AkNc1IghAFvGrfvMxWJJQT+
	ja/6n8tG6V9ziV5go1sKcOqHHlCqn2Kg9YtMkjXSN/uXh3NY9keL37UVDYh1vzNI
	Fp1zq0SL0c4qw0MjURIexfJYw2dvADhGAES3wu4eUuN6byNVtC0Ksg4nMorylqxC
	HZYVvsAmsdB1eET7IZL8m1GrteL7OeTj37QrS7khjb9b1AyVnyZnHTvHcomPRW7g
	46Beq9HERQ3ZZN3zYn0wWlVIkZE7AHxGIBCUxK3Fr1YPUMq6K9b1EyU6c7mHq/t0
	pLZuNQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rv7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:40 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c665139c92so115501e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388800; x=1789993600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0wOq5GoQsN/HmTgA2Dti12vg5sL8g1wEttsUmVswGc=;
        b=T8dqLSLlMEBOl82YKqEvi2+JEQ5bGyj/HzDyx7Iv8rqy6QisMxspjw86RJvJjGdCLW
         vujNHi0v9yPqb9TYVhkP6MQZZUxz2tHp9cltP51uB5V3TTQztPalJvm3RYZEMLIMTHuN
         f/PemZEDwWjZZuIg8blmHpIJK0sTUCSAKEMVTcva3qlLs89uMJaeAaa8Qay1YrJe49Uh
         DJ9V9I3DpgXg0IdAgmihPz1KQCiMEgOKzGGKRnqUhm8jJ40390K65pGy2CG3vxw+PSU2
         B2Za7Ibm9gppKp8QtcNMvZby5X5VNjNRJDBXP57ca7gcU7st5W7g7o6Vl9gobkfCm3t0
         rI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388800; x=1789993600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0wOq5GoQsN/HmTgA2Dti12vg5sL8g1wEttsUmVswGc=;
        b=ZeT4mbWo3Dh5AFw0AQ5uhgZjUReWkTkksb7IhH20LYwDDe+xIKDEBi1tB8F63bSb9M
         D7hxV88uqjbr/R5hDp/V2YGg4tSs7eM7HIzZTQBhrf+vmL5f6/ucsaGDGd3XscMAPs43
         5V/V4BWUfPldU4FO1+UZWqaPCUWuLpLtGQht2+sBqXHvvJ3rVZkKVCjUuN6s0ZHw+bhB
         vPXsCCXPnGM4359Dim7b8cVgBfb86ajy7O4tEnYcBIFS4A2zB8TCt4OgQ4DIRGN5Vm5O
         8Y7epNqYd0jHSoSbs2DUKsmx0PNCzC+I9T861hwt+LnRDhHFfNqEfMHj8VZtmmq3B5qp
         gp8A==
X-Forwarded-Encrypted: i=1; AKwUvBx1ma82sdkUR4rgekCnGhhMjW6qIVMTJJbJOnAki5r/a9nenSm/N+K5OF+DvlNGeYahZr7RmwHydQPTNN8=@vger.kernel.org
X-Gm-Message-State: AFuF++lJFuEhTABW8315+T8uBnSvItsy90IighjiN7PXSf9RUDRZbXBj
	N2LuLbROjHFKPUCeIQSS/wLwogcIrPdnD7JqEYnQPyV1y+AaL9LUFaoW9sSS4p+H2AicqLZDHBn
	ow9NbZpJTz8L1TUxSmVUVLEaENUeNDRlL1QQL4OUMHubhr7YoizZxytlU5G+wneQuMwU=
X-Gm-Gg: AYBFou1UjJASxkU6EvD/G+n8q7umYi/tyKxN9h/xbL56M6F9+gzU1oxCke7lPtLtfDn
	89k20DUZEnSCLonGJEyD0D0/3xtFLOybBxOEtpKaG8D7QqshODondKjrbW8W0ZlsubzR6UHbCtN
	UfChHDFr7gNGBdlXN5occ0LBP+aWoSczdykRN09Fi4xPW5Q3AiDsAZpSvZjMxYtPqOfKgIWLXsf
	38AoUgENAXVP3Uvp8BlPtxelH4pAduBwWm5fR3siR/UtGQmRN8M3mA7byWnOZuHjEjknG970Tsk
	oC9H8eNYkYmUcEn3t6XLQnGwnNfizrrfQQneoMz7ghFfPfky9Y7LvtYa0gaDdW2vUb4IYaSZvs4
	rDWK4wSH2VuMA5quiRj8NoQ==
X-Received: by 2002:a05:6102:c54:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-79b5b676f93mr331109137.1.1789388799633;
        Mon, 14 Sep 2026 05:26:39 -0700 (PDT)
X-Received: by 2002:a05:6102:c54:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-79b5b676f93mr331102137.1.1789388799225;
        Mon, 14 Sep 2026 05:26:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046a417sm2363884e87.51.2026.09.14.05.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:26:38 -0700 (PDT)
Message-ID: <550e3704-ff44-43ce-aa0a-2a1a0727773b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/31] arm64: dts: qcom: sm8650: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX7rTVvLhzmokg
 xr/9iWN0YSPohqB54taEAgkmPjb8aLicivKQgwVxLXu+rOPYgeToRkvZ9Yhuz4k3MBeDhYSq0rM
 712Sk3Jlp/Y4skMAwPT5sSuShqNhqhc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX1+AHGaCvn9yw
 X9knhaPcjxDlMWjg1OFYgOkWNsnHRKBCJ7Tbgxs8IK9sNRHCXSEcEHsSNka+PoZqfBT4StZ0rfJ
 LqWM65swUlma1lWwQ6C/5BJTNJPr/kpzIfBCxJN/V0NfVszS92k3BORe+rzFaMECtByY95QPTb9
 eqdFGfg7nQotjFctzP1DDlBRog1+E/60hOpA9CoWx3F0qZl7Zh9eJQIm7ZoWehj487ssFHzwJJX
 01sfRCeHysQdkcfJlM+WVshhUK75i9sDxOEDUY3gyhRpNpDkW3TtCU8trP/jyajljwNFBkPAHYs
 HwXtHs8yeODR7SkghpZt0FEXx7Yb7Bl1Ge6lZDURNoIgrztGhT50OeZdU+Fc5d80Jiue6kwyiYv
 hUVee0xFG5F7bL/Unepds2EJKBwL52VjQdWzF93mpKRiv5w449INazXh3MKelDyH5hfyEUzr2cL
 OVx57WlFSBSJXFME1yw==
X-Proofpoint-GUID: nQ3LQcLbfkZPa-kf4FR6Vcu1IYzDu8-t
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7e800 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: nQ3LQcLbfkZPa-kf4FR6Vcu1IYzDu8-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
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
> Use little, big, and prime CPU idle state labels for consistency with
> other platforms using this CPU naming scheme.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
