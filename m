Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626183D565D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388779; cv=none; b=JUGOrNeFPsd9tpVCBTLUo0oGjTwqzbJheoS4/AsZWyz3rmvORoi6iUyJ49Rso5iVhsevCmxu6FsT0YN3bvtAgNarKrgwRbeBVK6gLR9FmPVwy04ieFaMYzMh/S1YevWkz9kZDZ2lj2nUYKKnG8L4HT25aRHt1Oet6DmceBfdCBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388779; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFdXa3v3kzMRsAcGBc2RlkVGj0EB3YLldMjdUA+cHHAU5kipelne4vPr2YRbMYnDlDnoNWd9NBX6eiCuuJEKcL4G8osTY+kN8eihftlNa6K0BozRcrNAgieCQzXn7tQKN/fO7IeKytAJPM1CI02FF4Gw+Wk/nf5cuNeOyinuAOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrP3BJj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNvCC8lI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrP3BJj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNvCC8lI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlw4Q1460505
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=VrP3BJj110vimTQ3
	c8H8MYjqoWuEJZz90FbLkiKt6ycOs38D4SdQuq4D01DwnMkbslGGz2Hoao5hpg9l
	Ga/gYA3P7S1W8qTgUVXdQgtYXHyjyl03m1ElfX2ZOU19o88EYhakk5KhFRy+dRXe
	iCqqUEvKitUyM+jWI3P5KnFPSL9bt/TGeJ3OtUHXqO+vj8Kq8AEtGQY3VtjkwC1o
	OelRbTadjSpMCmkFWQ5SX9glaRGTfz7WDNw5CaZlqHxB/ZkXMqdCFQ9SE8favH4Z
	M4H9u+/pcEAVe4dw6l2zuwuOkxHxqLmpJZPGL3STErLI6lXn/ozVf0x49fx/jh3P
	hZcxLA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8mx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:17 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c665139c92so115469e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388776; x=1789993576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=UNvCC8lIDbGTXqDYee/o5Ot1+ABJRhD/5Dkp8+EgL7w8Nk4K/40ZO+mc7xCSHfyF8X
         8yqNNkeg8a87Kcl8KLIbL6Sw0nUpoj3pked/qCklsS1M5wD9g5mqSKxMoC15MvMwiKV6
         N4vtjND9O16yx9bCYwyvrfSJwPCYEMnp982ABO+bxkhiv9bh3GlCFv9EkYlVo8Y6Be2z
         sx4A2sPHEEpd0jepuoZJoZa2fDaNOLB/Bm3sYdPioB2Wa+ZPPSVvOdPya4K0Lp19/GfX
         xFsPZbf9uDTl5DlQ2iX4jvWcv/2eF7TqoRe18/37VX6hxjx9aeqQ+1cPfIkArKvqBz8q
         T2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388777; x=1789993577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=Eq1l+MDj2gWhqnmCbBSdI+oOjP0KhAF5UGXtQ2kpaMcFal0mgF3KHl1eLskQgBcvu3
         GN2NrnJym4aOJuicWC8aYbBBkEYpQlF5hUuyP65ye7yrD+hr1+TlQl97PNTEFhp0jO21
         4/i3jzu0EUTcUGsp2hvde0Sxrl5TpG/UO7LXraR7t74sahLN/q5bMNf2XJztG0iboJz3
         1/iiSQ0WV1NMUtbmRdkmcsDunb8ja+M2WB55mah4glT2Bv3hr9jbgzAcf1NgV+w6dbos
         2Ag44IWPIwODTr+FoDuuDNrK1MgXGJx91uI5S5EiNwI8VfoWBF5Cc8ZO8D7V20B4f6mP
         UoCg==
X-Forwarded-Encrypted: i=1; AKwUvBzB2pEIySHsTqt8FJ4AOXcyBjnUYbLZd70uW62RRAP4F/89VuNVfXMvBLQGoA2McQMhG8yrhkYydlluLA4=@vger.kernel.org
X-Gm-Message-State: AFuF++nhZrK9tx85EJzg+fU6Ui8FrOE0oB2ghzlW4209YInvzOJwgjsW
	kUJTLusg64Vq0o5XxZ1WB9mc1iaMhNFoabI0Bn4yPrgfPTrQGKuqXPAuPg5T4ZB2g6UBJjvylky
	jbQrk+Fhuc3FH7nUjBLWulV0yTEIuAfzDsaV/uA+svSKUTiZlxvMs2mkbpeQj6ceL2FsPbD0r3Q
	M=
X-Gm-Gg: AYBFou2XFxntPd3uIFekEenlw53DvZFg+awMn60JEe8wq1xWAoHHc4nqzykvuo2YeEz
	BzzUWfBcW2YwQW7FTlIfF6nFlw9AEe5soPrNt494jv9TxjD9KTvBWT6RHTiMa8rPk1UT/DWTObo
	fg32y7iM8kxex5wo305F2lRvxyr8XllnEP4E02cW927camelcmR4mwBcv1C5dCo9Jx3Y3T59/bQ
	wE3SQZHoLluQ5d7SKFeqMhSNzWlcied+WOfIWPnCnXBwOtmOolfqaldWqcsSGt8I+WtoE0KAYeC
	AbpZ1rpeLH/KC0Sx1BsxWpx5GkmGB+04tLf2ljWAvOXsYLqMNdd/zTcvKwy+Bart2y83zJC39kn
	9yNBeYjj07p87AdFKSzvh7Q==
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr357629137.0.1789388776594;
        Mon, 14 Sep 2026 05:26:16 -0700 (PDT)
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr357624137.0.1789388776224;
        Mon, 14 Sep 2026 05:26:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0472d02sm2502050e87.62.2026.09.14.05.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:26:15 -0700 (PDT)
Message-ID: <b13be329-3cb4-4e1d-b355-a63fe23fc091@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/31] arm64: dts: qcom: sm8550: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-17-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-17-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXzSUR625jusXj
 46iHqhZ8awO4CzGAtW4eFslY/LilI2ifsUhOaq/ClwaD15QA0cz3eLIMRQhxi6V4SC40uqke7t+
 Bgd19j7IOjT+4Q2atkgZVhfMnG7EKq0E5oLcOuTQmA5YzTbdIyWnAy9MY1T7OVI//XIgiaU+yVM
 HT9oNaUKllrVeuBXdJ7mwN5Vw6T6Acem4Sezz9LyteZvEzkHWr/ns8V/EgxzqzbX/wM3RHOmJbO
 bRNpgwsQxbrH2SKc3Z0ief8LKAC/C7yvvHMF7r/tX3+19SxcdL+k4Y8s8Ej2uX1bdHQNQn+eYC5
 iJwsi6hOymGnQCHr2a+R+Hamw7WTSq+3rmbtNmUee+V28J/TNyfmDLvvNf4OlDT62w4wufnQ4DU
 svKg0wDomxBlOMpRxanBeBujs863VimMKLvQmwOPbKs2JHWoFExr3FiaH5izqFpSim0UBSk3KJM
 aw1eisvFra1yMT+eRyg==
X-Proofpoint-GUID: qkCI1rXKwZkR4S5qXKkO8LcjYbHOeh_K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXxImGbw2pz2O/
 8R7syvmo2HWxa/d6HuelxbZSKc5Myi6z2QlX5tGo2Azq4y23TUqW1EIa3C9aQtUF9HPMzJAVw+P
 8PRYcztU7iiu2+vOQ3++2rSpDRzgffc=
X-Proofpoint-ORIG-GUID: qkCI1rXKwZkR4S5qXKkO8LcjYbHOeh_K
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7e7e9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
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
