Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364660;
	b=w6s2yAgfhmCUvFqlrFd4nARAnQzrC/hs/hexSx/NZV/LXnYIBAWxM+JQ9DEd/4Ud+7Xt
	 875ZSQ8ocktN5JmvqW/bvkzeSPmzndM0R4aa00vcIeOoZh3lJROGdsVUmBw79l1LygdFF
	 l/QtlGhowq7A6fGtydh26C0bh+BeqPHHrZKsE31EcDxi1uFY3w6JrtCgQr1/7IxJngruA
	 l22Xq8yULZZwG7q3OTKszr8V08MtPhdzm5kgNJWps9BvsgtCYtBR+++wmRp9A4p3bVoWK
	 1XKcmSO9ST7FgEVq9TxWrdeTH7Lp4xRdcf4rLkYO8NhlCy2gDq6qCnRuaUt5LQ7uOcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=;
	b=l6FKt+Tgj+VCHUmZI30waX4YT7Dq3Edk3GiRTWqDmzn0RQ1eZRTXeCK54JBTMY0nRiFj
	 720Uo8SyDvyPtHpRHQtyYWmn3knQrPnwYjPsEcjoB6eUoa/ShUlml5cqSei/f64Fbao9U
	 UsKSqPtfUk9MwMqE37NnubvPGPx654Ks2/k9yBe6mUk/23gDIS7bXl0XaEEgDeQoFldr1
	 Ho5/MVskgRWxoIgwAVF9FLmWHXHcAybV3b8ewROJfOgu0j0OwWQy5IqhZs+Jb8AA29371
	 2Wo7iqHWnStzzHOgDsfdBVk08ShunVc2mcsAQ4PtJvmdr4hufDt/dzFeoh60eAyz4Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uk1XQeTf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbjxLpEN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F21D60A2611
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F21D60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uk1XQeTf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbjxLpEN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG9ii3719582
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=; b=Uk1XQeTf5VBuY6rY
	ERww9IO0Xx9JMZCsG+b6ToAoehRvNhRcgWEeSCp3bcY8iTD3J4Sz109t/9GQbYCD
	6pJnsCExKblc4sH7+I3I7dwz5xvpS/qUblktApuIoMV6L0EcI1bskoX1o0pHQXD+
	bubrU36IbjVn7vM9UoNQhwU3jEsr0aKc5a9QXuHl4xcuhuOiJZ8bPgctyCajg3TJ
	I+QAGDNKvIV/XZmy6fwSYbCqabqH0DCgcVJtJddT8SB8y625/GhE9X604Qj9NujJ
	Agjd0K6gDffoD4++126TGBLJLS0LtOj+vKRzMc4I5DPt5LlRWXnoln63MWKdcxt4
	dDh6cg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qu268-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988ba2453abso16968241.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364658; x=1793969458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=;
        b=BbjxLpENK6NROq/blE54+pYHDTX47+cg8DB8Bzkr/qplFdBR0o1EEU2i0oPC0tC8Rs
         +y+ewt/jSODUnda4vjkiROZ65NinpuJpdkEUAHLLJGn+JjKFo12C1l62GqjvK/9CBxdq
         cVwGcK3mFJYCBV9Zmwfqr3N4vdsZ+7Kh6out5vp7I3ysO8yEbff+ec9u52rdiOZKokMS
         HjaUf+hvojfDovycByIeXHHHlQ/FfPZYNCnYPOX4y88SmBhHNU+26GOaZ1MqLANQZXep
         Pk9v6DU4/tbTwFikQqsNGDVNLmdVmge+494sJZqEjEIiRwahFsZckTq2psbr7+mvO3+p
         K38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364658; x=1793969458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=;
        b=L2ZuDZorCHtIzMssiS0Myc0mEajHHRByA5Xrbj+c3oYTQid4E+hhb3mHjvPHnNyhwb
         bARpsKZm0S/EQrVR5z1XKPm+sExUXTjcg6bdB16sJKWHBWq65rSrK70xPBi7+BGD3WEI
         5JotIuPAKRQyjnUGfM2Lz+wSeUUV2qr0LVCjO1puT7AlQ6JrQgaJ1aflWdiwVMydujF7
         egLGU8Py4ePTThrQY5IMIVurCiTfL0GA6JP/DT8CZJtCDAmQfWC+9ToOlVPI/mutj1v6
         se0yWlzYYPay5UJ9qZn/5rVeq3QBISfIE8eKZXiWOv4yPkgi7dgLRvoIE4tBmVwe+XZ0
         ssiA==
X-Forwarded-Encrypted: i=1; AKwUvBxZoMfWnX1v4ZCnti4ytTLQrpC5pvioC/jD1lBcneXBwsB6aNI1PZSneB0GAgmV69VolACXQxH5K2+TRUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXPYwCMrbi4yAiDLjE5r4sJQJbv072jFJeA5OjlvSPyej6q29o
	IAjlJPn874ZVBtKilBAkJtqxpkpK298wyHzGljurNkln95jyetJaIvkQNH2KIku+HyE4zKdiMO7
	9w6/Lkw8EEF8xWemNKqW92wK2rUjdghsa45cExqQ9+zv8NtaoHCh9CHYEelKFXbyJjGU=
X-Gm-Gg: AYBFou07GfOXllg2gKumHsArWp/O/JCuHDYhvCGci2rfFzaWpyjfqdXurXXjkWYDdUi
	9Ro0oHyD6uGm49XZlR81Ovqkf1Vjt5uZd+1ngI98YKMLDO2t85rkY4PfIVRlOmiqMmWtETTw+Z7
	jNbIBUisPq4b48o7AkRPMz0gcxKJkk8BTw0X1w0xcSMNTN2WwXFI8SZthkVgiN9tXZvZGlYmh8w
	qVm65YX4/FhCCuz2XEmffS0gT1zeIXkBSzeFPSzxjsfgw2Y2L8lbE/pwso2l8oT1C0DWtgulz0k
	ZzbI01yLlSjW8olP+bpcqRHmRdpqUgsGMhPxQIdwFnkcd6rIhlEVHFU75ig9CbajKY94lEkxTdk
	KDM++b4rdBM0y2Ab80fV5B5aRGq4P8B65NV1RFNcqeIRzdXtq39HE70if7DSYfO2hrkAaACo=
X-Received: by 2002:a05:6123:420f:20b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec6894e305mr915231e0c.4.1793364658179;
        Fri, 30 Oct 2026 05:50:58 -0700 (PDT)
X-Received: by 2002:a05:6123:420f:20b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec6894e305mr915216e0c.4.1793364657717;
        Fri, 30 Oct 2026 05:50:57 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm60694766b.64.2026.10.30.05.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:50:56 -0700 (PDT)
Message-ID: <2f3a14df-4443-4c61-b479-c0402636b737@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:50:55 +0100
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
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos-nothing-asteroids: Enable
 WiFi
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-3-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-3-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VqJLqOWNpADTdwE-qfYPK-NTFWmGeNKV
X-Proofpoint-ORIG-GUID: VqJLqOWNpADTdwE-qfYPK-NTFWmGeNKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX03PSea1/xEdG
 bbse7d6/OjieTWzjE5TSZYuL3GgemhVu2wvJxZLDHjdFOCeeY4M9Dz0V8NIXKsHDLFQwayUIPmB
 OFColP+XkFbRCn4/5Ef5KqnCXe1GdjzskIMMkpMUtVyO7BkBPH+9iLqVy4sW1Vs7khFsFqpkBdP
 1kuIrjw894mT5byg9REOksDa+6ovqwVpkeevlIKDkqJQwpqg/A85s8bZd1cr/qpxnAr4IRtkvZU
 2YGS2rNWQayEj+gdJc1LiAoG+rzmw143HoOttkDWiu3zXByjvN16gW81v15nFJvo6yCf/EMj9Mk
 FpPDVm+XO3xApXb5I8pBBtKf8pFeCK4vlu/6sCGvr3lpg3h4LvImlp2b2B8Jaqqe53vN4a0zEAJ
 cDLuDVd7moNE6yrmTaLfyuxJh4btGtNM1+VnAIq9h9YSHQPt7cF9tAwb/QKpItooyNzpxsog6ss
 kDvWcx0Pg/VC8OrxUqg==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae492b2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FBJPXfl-2ZM4KHcT95oA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX7aoHJnmNCkEt
 7fo8aEg8zNomf3BICpXcRwN24O8K7s/zUS0YXBOG7+0hCB79CRGJ07qtShfdSVXvfilTw7l7e2P
 T26hStJqc+bO0gTWvT7uQqQhGYxEruE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
