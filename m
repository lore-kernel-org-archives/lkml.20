Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364733;
	b=SatsQlT1TslMS0lnTVOYVHZ57Mik+355fqUUjzOgjpDWSyuWe8WA+ssPHOqA/+bu8YDC
	 UnyFM/HeNkPV9VKBo/NoRVR8nh7rfPrERgJ/DSYicHCxxIxrJMmrS/l20Hj6IXuN77QLN
	 Mzu4PRWGlzawk2pawwzf0oyoektWMtlteMA7GtT3ZZ0yNXYv2wNJsDnJcGAdlKBpCxWjd
	 2O7EsrcR0JboCoIinzxzY7N0Bs0rUnzZqdACiRXf35u9QDV7eR1JjzB/0oWG/S+zrY4sI
	 v5b+qFiXFVKIOaRtVW0Kc9FgANcVL3qxk6A8wsZVCsd6Zdbnz9xqB23PMSMI7Bd+GgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=;
	b=uiP9GU/FOY45fJHfu2qd2YZsh8Tk7Y2UFqkEsveFH+7nJSM8LG9D7iPlHAoHaKb4BART
	 30l9skb+oI74c418qyfFprFhEamvKatEatM56eLfmghY9XkJcG8p0hTZwxd2ssov4an2E
	 S7Xe3ALxs31RLfN+D67uoTIm6esSYOy0hSLeHgrl8xHt91NCeSN9PVRVkjBw46M9YGgBS
	 YMftO8EtVzPlZ5talxJLSwVepymeDzUWqFMhUGVrqrlyppTUj/8PmvthBJMpdBMX0dn5f
	 UT70mV4HQO6D4RQ6nxMjZDbC+2oCUOS8YYlpnJzb5FUnJuU8XGHDJd9tIj35um4F/DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWUR43P1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAaIp+51;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C065606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C065606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWUR43P1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAaIp+51
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG8Cs3719535
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=; b=lWUR43P1ZeIlVjK2
	ZmSo7UQW3RomfjXI+1t4RPr9mK+JvIKxVWkWa/OvIh8QCTchqU8Y7n8RxWIm0IXK
	cB0pH7uY/40livhE6OmRU15rWnO3xpa8fiYrJ/OCz+AgExMMpN9FyRGgWVvQdqJk
	+sX9Vv6Ju6iDz51mzXc2LGx5xCBL/FrWlsx01+n3BurSVU40cT99Ss5659ydJT/v
	tHX3I3XEsPhOcTeHmNoOWw+0T9Tql+EiWkXxxxh5spClLxlbBILggddVpRQO5uvX
	KfIQs4iEexSsVYwVomPzDd13dLYPWPkm0gFB9gvoRPYSNnlujKemx5OdQmRVE7/O
	Yj73JQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qu2bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:52:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so14190285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364731; x=1793969531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=;
        b=bAaIp+51QYPfhUTFtuDVwmRuHE1CHoepbTi3j2EDvCxhvEJAcsj20BY8eD+LIpgJGf
         rZGZ3GuC3AeVuYB59GyuVuBXeMApFWi3qMZT4IuLaO3YhrSduxT008a64o8fy7EMVIFQ
         vAZqJw652juOyJBUHpf9z7ed0P96gTf1okoIxg+wPVOH+7ccQQ9Ljj2LUUI2aTJWIu07
         WvYso7/S8BieLtX/6cov2XpTB4CVmmDbv5g/x8j8wdpqTn4+bQkQdBHwYNGLajp7f9b0
         JVj5EVdqpuncj9sqXDsB9R6zHBVqj5g5vC31F9SW5Cfnq0fAxkZURbnVfpEdW+g5s2Qs
         lWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364731; x=1793969531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXgN4VGBA+CqgwluaF0PyMeXWirAlkzjh0u5pMn2j/w=;
        b=Gbg0YuI3raIV88svRpKN1qekXVOGjxOuJnKQOXcupYNqwhNNzpqHcjrxS1BNY4iTG9
         9VuNMj+7ARMviONoYNp7H/2Ko0NspOjwxfaEmxleO47RLz4bQe0bGYYTMyhg454tOVAQ
         EXYKKKmZMn8Qwy3NXJdGtfzniS4QROrGhXl+C5NB31UbOb1cixyccl9sAfsaugdJmy4a
         upcKsNeDroSIhXFhiIeYWQAgF/Cda5520oHH4ekXiotfMnTGnmfg4TQ/CLlmT6QjeS/c
         KesJH11OryNzLukNBSqmrlOzH7vPSArPtNRd6wCncy38F4fNFDG1p334Ihv4aDgXmQY7
         fIOQ==
X-Forwarded-Encrypted: i=1; AKwUvBygezkhXTckKU9j2f1uz1yOiMureLYUcjiZovDxdYhuqoz/RyqiUXA9mnfrOx9u+0I43xGM55G3cX7baT0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+ofGVYGz9JAz++wI6fbjPAHzRAjVRIZS4ICkcLC8+jQPTeKF/
	VDRrPrCF9nEDSYTr5Sbd81UWts8QnZLaw8wKFoGKRIbEbL62ol33M3vx5oBqYJihEJcev+W17pD
	pI1H8zHY4m0gZQwhdeF+DJnCsexN+JXhE+yuPwoJUaSGEBPjV329Psjy+nFEmHxLqaaE=
X-Gm-Gg: AYBFou3Jzm4Yv6pOxVv5CV2vvmye/tsJJemOnk8HPlbqQZ13vaBAb0HcWh2yF9rJ50E
	MOD69xiHbpH11tQUWfrXLHl3GRnfRcByRiSnGYz1j1P9hA4/eTsCgkYRy6aB84w79DoPLsOn6TD
	mDwdjZd+HRQkjlyungZ+0YbG7wOSPao4RmxL8DlE6o/e5ou+2+kJ3hf5RFlXhyQp9vpj10tInqw
	Bcr9OQQoEl7SYlkvrwyHTUsZBfmVodhkYOnqNGYNmxqtEWof9EVLEVAl9KXhrx0p+Zb5Gipp53u
	IUKZPaxKGSGyqtsm96c9KTr5NBjhhH533vyIPlhUx/xTkzkyckdTj1afcP+fwgtLWF5StO9kXei
	qgmx1HIvAgGzxIttXav1d1RzVTkansUKeZeplRfObHSQBQMUxLdzQi0hA9InKuJkv3aoJQAU=
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr372729385a.1.1793364731304;
        Fri, 30 Oct 2026 05:52:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr372725785a.1.1793364730769;
        Fri, 30 Oct 2026 05:52:10 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc05sm62773966b.24.2026.10.30.05.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:52:09 -0700 (PDT)
Message-ID: <466f2126-4890-49f2-9e6e-679a4199f324@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:52:07 +0100
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: milos-nothing-asteroids: Enable
 panel
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-5-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-5-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x7f3UO5gygS_fR5w1EDu590B-ZsF9Fyg
X-Proofpoint-ORIG-GUID: x7f3UO5gygS_fR5w1EDu590B-ZsF9Fyg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX8Xrr6Y37iKmN
 j2AodBC1ZLdkSpLTQyrQxsm0+hRqJXL8fph2hXZzV31R+T2ltEKvbytE25LC5u0KZ/48ap9bm/M
 2QnFcoUbwo0kz2jNwgxY54OO8iCjrsC7zeiCLGtjQWFY2Gt/LpHdFA8GRBYLq+tANKTwbMHPQ9V
 HCEKWVv36iONweBgeVRRAfbqHWfQaslP7+pceaZQONqyK/SZ4TnqYfTZQvxMj62XJPLMQLNbRvc
 LyqCYHUkVjD+unbjRwvRC9NiljAN0QUKzPEd6NtdFqbWIygXcTgDgvnDmwNDT0MW1OzxhuO/Ujv
 higg6eT5UWAoBTFRHj/yysk3T1tGgS7rYI3147tbrEaZazUZAKCb3X0CBEmy4MzU7ZoX44oVtRZ
 Adx8TbYq+Er+oiaU2fkjHRbPlLq7RF6IdX9GFRmE4yCOj+FRRC6ddS7pQovzxub8ueqB3w8yViT
 5KwzqVleIGHmGeg+Fbg==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae492fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Q4YwZ6-Wyup7NEOylQYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfXwmsTW60/ERF9
 1EXC7r09atGETtftgttWMLOHad0lP+UJyYzeb6eDD8yrL5jWg34Cm23c5QWh2lUQLFLSyx5wepo
 54Eipe8m+v0TZByovTUPYD7LWva4mw4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:34 PM, Alexander Koskovich wrote:
> Configure and enable the node for the BOE BF068MWM-TD0 display panel on
> the Nothing Phone (3a).
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
