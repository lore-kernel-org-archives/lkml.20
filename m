Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793008249;
	b=HhT0gRFso8urmWSuZD3JHIEDCePTuESujUk0N8AD8M/izsUNcrbItiDXQX2p1UC0bsbT
	 Q6Dbr0kRw5Cj1QKFwau72GjmxGx7wFE54kOOFlDVP5GQqo/oKZfocTdJB6KPRnuJhUNwi
	 llU7ZvSinIQql/tm6eAfDsEFtmksEL78xk53M7xLEjty0QtL6KgB37NgaXmlt5hL9Ok1J
	 jT5jBSsQ0xDjm5GDBvBwRKut0vPz6AXKVZcGuQMLUNBjn0smF81weCrgcr5rn9tI4IoNC
	 ID9qNshgM2rvwnhf5oh4t9dlEUXWp+IoMqMe6TFt18QDkpmi8SsDvlRpF1jjVPamv9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
	b=IEFmGm+J3/bO5sFDNAFE9k5T+jtISFQh8DEE4HymERqqbHBLRAEjC9GWZVGzGkv0EApx
	 7viCDQmujIAqZZ0lptQ6t9hI/+lRoY96OuG/2szdwKATPVtHpzWBzrvXE6rncq5qnRqFf
	 DA7znx635pyccdzyHW9HXCpYSummLqcPou1L5ThadT2SIMpW1C5uPZ0YKbPKKAnD6ITjL
	 4oSPJgLU3cJ2tdKn9E0bmV/O1vvBsdC9DL2P3+Lo0cj/+wHccjXY2wKOS/AyDeKqbfonH
	 1t1OmpgmnsnvHOvY8zpGvrfLEmSFkUW8jUZXF8+I82zOZ7KcNbRzfLn9/DBmyD08JiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZzhkrMU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYHdcNSr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEEB60A260D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BEEB60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZzhkrMU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYHdcNSr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aqnm1181756
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OM9NA6+9DRMy/5K7XlTQer+g
	WEHVhhYXBGhL8vr8CDI=; b=VZzhkrMUsOLBiooW/QzsjtbJY/FF/BNqFiImpKD0
	fwr2m7fM28MoQIFGdoW7sL2Su8o950QtBmXq1vWRdkcX4sHhDtTRmHy54mMjWleq
	Ga5ShmvhNjivtWu39ZtJUqs+35VJNw5eoluHLVk7LpbHl+4aXeCMNRpzCEThq326
	otYkUxiE0FDo0zFRpGgmpkpZ/OTNrqHDUf801l8feaREka4P1vzSu5Q5Beh6J1xO
	xCph4yUZNhR4byoIUho1Zlj0jcD2PL7KSISsnB5WvS9TPIYQ5bryWSm8RxwuxAGO
	xwgfF7e4X0C8vtOH29M75scnnO5b6n6TLRWGzEw2rqqPsw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27wsqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:50:43 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99081ea787eso2727467241.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793008242; cv=none;
        d=google.com; s=arc-20260327;
        b=XaFJ91Rdc48GKsF2VgXbXmHiqXcBT4LKKb/aRup7uYuYk0+7I9+pkjE8d37Vei6Y1m
         ppIgLYaf9BPIcfx7d9Q2UwvOTQEqjf1zTCi1NeKg7996shBeQOUjfgNmxNnYMubeOfHU
         B8A8WczmucAvbPUfpoY0HsxMAZDNSvU3KZY8Lv3fuh7WEd2lK1ODxytir8lBgPDJUHXa
         iqNMzU2KUf82FVRGa7iGvAA+kJ/uWhL2dGmvIUckmQ5ISfu3hsjl6ldokmCmx2GunLjK
         ZQGmAUaubQ78XXxIca8zIkRfCGDp5eil8qHkNNsMqyuDsf1jzkrG9DlVb+fQq4W867CS
         Ma+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        fh=JXOGF0fpLuwNG6bPWeNI++vm2FukUAi60RqLm7JzGKQ=;
        b=H5IbRU0hGmgj4IEnZAYuyRoXlk7OtspXQuV/x+mz5M4EchgNUPE6fqV7x7VryZtprP
         gthbJFTfysunMz3LO8h1aoccuJAk7Um7g8GaoeVVhaZS9df53Eb7QTWlhiZ4asfpY8Vl
         /qnuBjQ049c3gicdYsi5woj3Ex+fyUJdmKn3Bo3A0ep2xW9nC9QX0SFuC+x7jywlN33N
         VpiWZlVW1pRp0Yv+cMbtBrUkSy7/6jzpigSnoamDJ95gz6E+QM7UZb1OjRbk1Zx1+VpT
         EF93sufmaQi3t0IL3zi6nd5SMle+gFx64lGjlj9p2PEc89WSVrUjlJ9KU9RHzZk0cyqF
         ynTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008242; x=1793613042; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        b=GYHdcNSr34P5rNbw4vS+cM9nkUtxtGfSIjaRf1D3cG2WvGgCDE5FrNLau3B40MPNc8
         WVNZoSgibs8GMgNdYD/8nlZvfhzGLjD/Dyxy9CVakNbxiD+UtHJLhOe8Xnb5k96E6adS
         SGknZJXr5a8F1KnrmdQ3FjqNzB3GmuohUBIgVe7VIC2Dfx05udguKArKg944XX1UQcgb
         UJfnIvQ9wjCjZGY9jH5i3VddB6n9rWbKhMRFrTHGR/NYTadc7pNT0G8+vN5Ma6nLTHgW
         shBR5a7YTXyEBr2GSqW1o3yFqAXwqbVRguG2IcbTiwFJpueD7N+co5JcxVd2EseJ5kMR
         2IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008242; x=1793613042;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        b=s4gMyraShbOMvEAc86TKK9x9NWfV4KkZLvTcvRCerdThbtjjHSDELGz3AFw35yfHof
         Zcf19Vuct27+NeT383v1LYr0ChPeP++oWuJX8F7rXVzp8nOh+4tTRWiTLsuWVxYbYx62
         MIffyzEmLjMHQDGud2jgowzjYnGiInd7icVd43OmupE2hVBnBcuM6TpIU23neyY/SsBj
         KEcEXst0yDL7OWs/8aJ0ioRC5IZNkARP7+zcFcXxl/EWSgMHEu1WsAcRfzFkxuApC+hm
         SrQZsCtdn6COezCZCRED4fL6rVsHp1SJSkHQAOOOOYY9lNNkLbxM5vgIuSWPeLBgEAw4
         MYkQ==
X-Forwarded-Encrypted: i=1; AKwUvBznjKQk2Acr58oNIthG/icnO7u32aiEEZHVnXnZ42AiOthE1ppYZkQGO3E6hhGLfSRoFfQeJ0LLX7hyNfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdHFGRTls5o1OKc+ABtn3mekr4TuBluJZYB10AyWysFrK3wvwn
	66Qj0mZLEXdWQwPLHeriFOMfYT3/wk9eeuxKLvN7ZgqM+wfmgkHa4v/Xjcc1InFXwlUHphZHV83
	UpgKH2JCTDavMHAOSW4mzBXKYhBqxYmGgRZU80djZmrB9lGrJdClWhmm6qs1Qf7VB8G0dIH1RDr
	D3+d5uNbmPwHHYQg2glZYXh5gg9LRxC+tMKSfd3saWgQ==
X-Gm-Gg: AYBFou3Pv+QoNnXewngKZFbp+E9UF5aQd++slVX6dkG7sQ6tA5Lffinl+sczke0whdW
	zCVy2tN7tYOFWEjPK45VydcNG+JMBuumFpkLuB5RSD5JB0xxyE39LECEoMgStQCOmZLe+F08nd6
	qi9wr4emSQIiTA0YbZg6cI2S7eXFRk6H84OynIz7IEFiX7dQZTui9PL8vRbOGC0rh/MRA7Qr4wc
	/pXN7weLrc63ULSAg==
X-Received: by 2002:a05:6102:2925:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7ce5cc37a74mr1922777137.8.1793008242535;
        Mon, 26 Oct 2026 02:50:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2925:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7ce5cc37a74mr1922772137.8.1793008242146; Mon, 26 Oct 2026
 02:50:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <DiH264mdSk9atz9YjnNUImra2MISyqRZQN8lEO6HpzVBiYU4i_cNONZzyW0DfvCXJ5aGIrBbDYFXRbTBYLyjBg==@protonmail.internalid>
 <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com> <5e1cc716-22d2-4d1e-b68c-0c1608890043@kernel.org>
In-Reply-To: <5e1cc716-22d2-4d1e-b68c-0c1608890043@kernel.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:50:30 +0800
X-Gm-Features: AclHuK9VMGCfWrLZ5or5WCH1QYYnG4gicCOANcYBpkmCFj6xw3eUiA1tUH_i_Q4
Message-ID: <CACbMrhqvfhyejKqsbCXRs8p9Kizeh8pS6qBygKDwpghPqrGzeQ@mail.gmail.com>
Subject: Re: [PATCH v22 08/14] media: qcom: camss: csid: Add support for CSID 1080
To: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf2273 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=XVB2PD5oAi8qZ-TPs3wA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: trqb4nDevdVF7h-bER7Ct5R34nzipPzO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXwXKnMlD6oRe5
 DxnKlF8/T5ABuiO7knmNz0hotyw+O9CSORGMCHBmL3CZeWhK0vG37tekrz+/LpFcLcnV0J7UDod
 vXH0ITLlV6lhhSq2IfYBXVkQvS5vB6w=
X-Proofpoint-GUID: trqb4nDevdVF7h-bER7Ct5R34nzipPzO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX8c7W/5VBHMYz
 NmMg3jKB/aG5GrMXs0OF/R0qD3gWGGKv91H7bwnZfrnYWi+/2t8PTZ59qUVVImJ+bfkp03NTrdN
 Ga/Cq+8R+aNYd42G29aZtsKki8qCBJAN2Bb38uIR3tY3K1lEy8tKJH5T1Lv0bvepClzjPVU0TGv
 nXUx1gQcwHy/VyyNVSER5itV/DZOa8AIvKMxqAU0MuRcdBw4KTw8ypUfZwXAg2oC0pAZneQAjfO
 W0+jE4pgNyHHskaAlSIQh5yn+jzFndGmEo6gXVoDCCYjiwCCFHT+GsUqxHith4XIe6fK1GxMcwJ
 Z8RzkFWxlS5BmzLR33tKkxFq/a+JH0v0FaqUWXUyCjHjBQQo3rW42+lqiQZzBDC1MeCKa2iFn6d
 FpimMgjzkr7rTKXOTt+WEagrT+i/5O8+VBrNHkpseBwZAlPSpJUMdN0mpQ3aThlJq6m3XzxU2z/
 Is2L+Kt1pHeejheNSrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

On 10/25/2026 7:15 PM, Bryan O'Donoghue wrote:
> On 25/10/2026 03:17, Hangxiang Ma wrote:
>> +#define        INFO_INPUT_SOF                BIT(12)
>> +#define        INFO_INPUT_EOF                BIT(9)
>
> Excellent thank you I forgot to ask for INPUT_EOF too, which we
> obviously need too.
>
> ---
> bod

Thanks!

BTW, I'm not sure whether the current addr_update design fully meets
your and Loic's requirements. Since we're still in the merge window, an
early review would be greatly appreciated, especially if you have any
concerns about the design.


---
Best Regards,
Hangxiang
