Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618488;
	b=RN6PcGu3svtgEcg3hvurnNGc3ILlGg8ELbhAW51zcqhmsd0KctKlYfAr4wTUg4kxACcr
	 6pFxmVri1iktPWjyEx0wiDsNbDAoW/1KnqwOpe1BKcHfEctW9M6Xn5PFfZmCIgWt1dMHR
	 MRX2yYtOHpO1g1Uy7rWv9rGvFqA6UmFo3V/SIrixHKtxzG2Uqev3ntOjht8O92hyTUEFd
	 nYi2jKQlvZWSDK0VDa7i8BzHYWgr3SbSEwDMyXSzevpkpee3DIhGVf926GOazXILQ1SWz
	 5lSETzjD+uvgXfPBi3anGeh4oSmkB60oDfvOppDD+zabPuYaJhHUwodDL5HxWzG7FnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=;
	b=1z2P/KcDg9JyKdAFhD8rCFJ0lrybuFnb1U8Osr0lJaKy0vQhkh9s9S9PVsyHVLApLjsM
	 pRC0M1wA7wGLUoPx2/IlSnQ0w4okO/gdEEqPDStU60rsqiJVPw+8Nkp3R3WHhX3yZLH1u
	 E1/X3MUebkkdhQ0Nk8maH2ymMFQu025vaZ0sbXoQWdiMi294BuCZJH36YBBCBCt7wbisr
	 Sz2ouOQ+WUr5pS0POrlj6II47uOyuSbw1Rpv+jgvbjbYN/uC0Fi+3HUUWQ/slHKsyYwEo
	 Ur+otPks/UvQcl5bYPGAB5sk5RGA7UkrzmicNMNdsUpGdjp31kEtXXE/u9sRN5jtaqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5ES9IIK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NmbfcXGk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A06C606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A06C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5ES9IIK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NmbfcXGk
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6Bq213998
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=; b=S5ES9IIKNcnmiLF2
	D4WY3xX8TjLvsvqzoRrYT7+2OlHiOzLmw5J42N7BB+OisyNGIXj9c2FGyLTqN596
	8hrr2Z46JCYPYOOcyTYXy5BpTUDmCmN7Ha7+mZoiqlHcb2B/Gjifx5mGxFfAz6Ta
	TiHpS/kEUpcFWAFDWzHAfk0IlUHEVlEdbJCPoJJMlnJharZy+L/p3435dD8REyny
	kzCWM5yZ5Q1ieTE68rVyZZR9y7CmjxKqNcbkbeGbUQ2eGwFy17RbSJwvHMNtc93d
	0k71iYPvoVP+n2z0sxp56+1OgyF1soHjZEkcsRNUOJLVtu4CIeI1j3phUYfJEw8i
	SBJ7xg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sb7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:21:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536540909e5so8456131cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618487; x=1794223287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=;
        b=NmbfcXGkR7oPxeXBtyW9llbNn4f1LuGBjWFcdSHJfgVXJdRqnusO7b4LC3gGg8Xp4E
         bEebv6UIGg5sqAPdE1ufpHWsXqwCsI7yYuJ1LMJXJoyJiBsysg4KfLqbZYTeqdZYXd28
         NeP8XAyADMA8LWaWOqlZVbA1Uq6dTKybDQwYQWlaIu8pov15f6SN1XxNoPD3HsI2U2tR
         dbrwaBwgcdItfHpNbFY2KMlvLWKQEFFtBomPbydVqmQZ/8tMN4pi/lrQ2gqH6VIsv+eS
         u0ACUkyN3YvmT6Ng7IexF93acw9LF/q64dnkmRkch/SMoHb8Wx15qFKmzTV0yXts7UQH
         UHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618487; x=1794223287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=;
        b=kRCApJ8zQ6L9aNY4R5/d5rfw+acjXi4vxjPbeBF7ogmKkkuAtuG3mxjIJe8VFYWKJj
         8Q1J1u6JyB8iOtnfOlqpopCGHzx4zI9ID4TzVuOsbIMiAzROflwbLPJbf9LTeCjjhbqs
         Ko/azcFpi+C/p9isK0Wb+0HhSlKVk7++AuiEuAhXmdJy1oSKOhVwe9dUwpEfXtigL111
         HgmPbVB4l5ZilTLr+EKyiIS7QoX9GThwlS46HGyBK/mGjI/Tz2A4rq1f6Fi8xBngKBvk
         vvNpxzh1HNNpoe+LiqUwClCx4wvFsWoXMSf8/anI1/0PF3NSgin9+lQjIEP5nUIneiyA
         Tvgg==
X-Forwarded-Encrypted: i=1; AKwUvBwYaaNXy8wxm/dgNwJ02R4uMzHm8sPLimznrrqyG3ZtTz/JHpe2VP1npnBWQhkUJnCThaDWo7BO+3BeGe4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNKscHx2xoHN0kXW+NwWwSHtqvVJY7hhQEcTTXqOM4yXBiiPmf
	hS9C/DQoIuTp2AQ9hReVG6CWZyVhMACeuTRoXwomO3gn7N7V6+9lOKJxmGp9AW8Q7bp8RdLkiNW
	C/9TqqPsZzxzJ+HyQn9vV2XoHx28DkeXxAjqa0rNJMreBPIdOJQrsLWgkhDD7+tzJiIk=
X-Gm-Gg: AYBFou1FM7Em/MAA+arqB6TOYl38Cow3g10zjs4z+FRG2RyYNpTcQ3Bjm9AsG7YzTDp
	umqfKBEDypRJXOvlHfCapGrmW3hHAURZ3bHOa1NUYmzXwnFrOI3jg3Ho0mTYtP5p1PC2wBn/YfT
	AIIp6+rwuvLxXKJmbKIcg3HFPc0hzBWh02pxpVsSt2VL0QPIL55vVMBE4B6U1hMinq5qh70uzgA
	QEVcZAuQp4fm2jFZBAiidUb11yQrHoiwUHEWmLlHormJ5GQO9oWZpi3065+XXBtIPjsS+r/UtyH
	iRqN+0IJBk5XXyNhdzA5lS8x38TOS93X6ipOxXTPnajX8Xeswxf0P40abgzosKcx9fDivnnub7r
	wFL1+KJxTvV0NNbb2MD2mDqxDF8Bo/asBrCMMmDVyIKGnGN6ZH+MCe8UDprg4//1P+2zsd40=
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1736508085a.0.1793618486719;
        Mon, 02 Nov 2026 03:21:26 -0800 (PST)
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1736505385a.0.1793618486284;
        Mon, 02 Nov 2026 03:21:26 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1915csm374500466b.7.2026.11.02.03.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:21:25 -0800 (PST)
Message-ID: <939bc61c-234d-407c-8300-638367d4fec3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:21:24 +0100
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
 <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F_CMhwFRPpr1bScPpBNw9rrj1uL-GZ2o
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae87237 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jGN_E96kn2IweV2Cx-wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX/HDpQBXEQJ7v
 8ktSMGXwCsl21RxTImuGhRWjB2sQAGLJFI2br3SjX+3J2ukzQfC0fot1s2nVjZ4MA8A+OURGEx1
 RX12zJa5VQLIB43Ba70mZ6kKVBg2bXFcYXEeljOI92jkYR1jyTEFc3G3Nqj2GuZzMbBjtUmmDXq
 4U+EIFO5X46prZunYu3igTcnKWcTBHFhTx9/WVr20tpunNy5EAq4AI2/jwQKH/McEdn6GSc65JX
 qbWu0tDbgILikfOtrsIkBf5+bF6u0oRGqQAPIWhTsmzE0NDKynSRSbTvhuGjljdQPDWLNwXkt6m
 hOF74IH5CQtPcB0Fk8ocdDOYSztrtGMCKjkFNNt/szu5vmW5OeygVsSoSWadmvAGSvNm9vgyGdb
 bnMEDtrPlAUmQ+p36S5+vvn8wjrPF9Tyyg2Y/i0+yh0lKWtqhyXij3CKPX9chauXUjRHbaio71A
 xTrYVGrsBAA57uVvw7Q==
X-Proofpoint-GUID: F_CMhwFRPpr1bScPpBNw9rrj1uL-GZ2o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX+u0H//tUusma
 oiD803q/0YRJ0vWKBFPcOxS1di5H/T+yAdGfiVYafkRLkaMHq45wOY6MXXAR+BrG4IaM6ZMpcx9
 QgqzSWRNThsV9N4te4c1eDzxlCA7Ch8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020045

On 11/1/26 9:02 PM, Jason Pettit wrote:
> Add board support for HP OmniBook Ultra 14" Next Gen AI PC
> (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,omnibook-ultra-kg0xxx" / "qcom,glymur" compatible.

[...]

> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x10000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};

This can be removed, see

https://lore.kernel.org/linux-arm-msm/20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com/

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
