Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880477;
	b=nz8j0AiZsObdxlNqidulVxpA4ek8wGHTaF8rMAu5ycZy/dniFF+3QVRG6lJhlfvvgpXC
	 xST/RFaWbNrIRnYvJKf5WHuK4t6dnO9cC5urB8lsyIJqBxw+mTIN7F+XWQ4/mVGjswCj0
	 SjHVQEvnuojeSjkLVKUKm+97VeQAHTJ+py6cvNnn6fTZOAbLodMOAxY7VGd1pVo9+FX10
	 pNl1f9p8YJipZ+opB7d2Sr9noAbj/6gxGOmAPNs45Oz5UTvyQ+fLP0Dkzw+8dvNTWHnJd
	 kerU7UaXFKMx6ivzBOS6TwlGx1jNyu4ZfUbsjq6DCIfiJY0RyxGUbhw/ymO3ZUO8vZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=;
	b=0SInBWb+0yhJGr/6ij5YIzYJBNfzy5kNLcZupRXyQu82zgqTkqJ13NdKvU54vyt+Z9g8
	 QAxL0zx7q+UwF3UPZYXVhyjXA5bU4eYqTCRBYFog6mBU8lkOeKMgvq6UjuIGjgMs8lCM6
	 KBLGX7BEwHg081E2Qbqofij+Iz6mtXxF3Lexc7jWvQXA3BKC33qt83FtLIHb5Pmos7iqz
	 MmcRV13zdYrAgzXmzqg6KzxbF4s+ZE/kMOzjrxs48r/G9oSugfPZFjv1+e5Z33ocCKxl4
	 I2uzPYv/CEHqAocVXKALKI4PMqBgR2KwSk9KtAfKnvgzDuw1Oan1fPa1dwWqEVLALDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPC6TXI5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKoCkxAx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F32B606D806
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F32B606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPC6TXI5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKoCkxAx
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Ai3vh1583132
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 12:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=; b=pPC6TXI5k5cu8c5/
	euzX6JjZXtNTvGDBeZMbjIlmHSE1P7u6icGrgwzL5C1ANqc/YaRy05NDQs0zUER7
	jHHAxcSh7FChS4GUGbJbbrCnPnurwllr8KoYXeHgzuukMNPp+0ZZ7avU993oEDrd
	ykui36jN6sTvOMM98+UBHE03QtlWYho4lpDgtzEnKIZEZBi4+bPK6ZpXspofOiV8
	XIBSxgvI4c5KgR/8RIZGT9Pbm4VlVzA0PTRDxQG+qw5zCvSv+V+Dld9d4Fi0QRjW
	kf7WUo6rOdtr8vUuVLJcRezBde6yfkWstlkL2JQ2bFl4PisExp3g2w2bzmR8o/G/
	DYTShA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraarbj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:07:56 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso129745e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793880475; x=1794485275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=;
        b=JKoCkxAxiX6vkb6QBj6oxRK797XS4OSI31dQDId+QaSLCgtYm7pQ5Nsc7OvRzoyjII
         hmxsn1b/vhXFltb2y3QJ747Z+5iaKjkXWpfmpATVkxTQXM0FUWPMErasa0N1hExne+KN
         m/C527VtkzpKeIHpqxyDXB+tmGRCyAOHNM6MjZu7VNQR2XbQfnZlOR77F1zQhyPU5cK3
         rIVTCrzvQsf4V5UBAaMEQBnH2bC1w7m9MEIrpSnQIYsYU4IpGxZ45luVEgdKZ6QtVmHg
         lm27Ppp3d1c6QY5GvBgLnlJ/S5tB8kDIoHABEY7ma5oZBHaf9n+kjdIFHsRYWGuWR3ap
         8p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880475; x=1794485275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=;
        b=0z0TtvSeFVlP+TGwMAZv1Ph/130Dw2hiuOO5gYVr4omYyHUuyv4d3FTx/dp9LOCD1z
         YExekY+KBGnUQtduOEnj6XdpjHfwlv5fl8Es+7+EQyg/QpEMfR0PG9mAY9PFjUxFP6tZ
         xWY7zDzdnfo9Ve68MMTGwQCYOb3iNT8ljT9h526wigXcg3HYr5bW6FL4MhGPAhTydR/A
         hsNVWChKKR8+KpVgnkGi6gLcAIhsQO9YkslBth6YWKQwd9zz4kEkV5A+j0xaoRP9HIaA
         qoujH39DHDB+eTb1glwpiN5eGVfUFDK5uJzHwxul2DlJ/rx/kE8dxkZMAA4vluYXi18a
         0tPw==
X-Forwarded-Encrypted: i=1; AKwUvBy2tETZakYEd3ueTVaCDlLPxSjCTZ0+Pq9t2YSonIPhijBqt/S79WICAPC1tx2JEnZ8A+bTjW1r3hS0cWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z//UvSawdx5IBO9bNzs2o3JhWPRVjkTM3S6X2xMWwVhXcpfIzjo
	HSActIDrRzN1UscEEH0/xfKg6PQaOub+omf4HyXSKA11Ih01Yccg0F/CoUqQLOjnZ8EcZx9y2wM
	z2KoRgdJogw8VyhYUL4ZsPqlJQzL61XLfZ9uBjq8xqucgi7tfRh42tOaE5JHz9LJhhaM=
X-Gm-Gg: AYBFou1r9T1ZOv608EfMMHeUHfZ96AgUQJst+GWoI8Corg1gtXDmMbmB31CJ9dziJ+i
	N8FGG9ajPTliioyq8YxwoS8OUNdo3IyKBE0LQnik1RLyfwMg7A1/5Ab0WcxAhsiKFKhy8H5Hvai
	YceFsMS4RSIqelvQwrETCKipCNrWzZGbl+F5CrY0YM8TdwMBEH/LDLmyLZIqQn7SmkoJRFLnt/Y
	10KBa8BrIxMi7sGwgIDIb5dtmdgT6CyKbenXC14DQHTwqjh2gUj+x6xA8Wiv8QVu/u1j9282zcV
	EqEI++N5okUer4IFaZ5dw0OEOZKjac8xwLlF7+lk5KhhDDgmmkAsCQxqxuuE6yDHKssE8V6v6K5
	YEZmGGXBg+7Ylg+P8Lw0tnsVWK05O7mDFREiMv2Vzr9zYszB68wpu/LFv0pGdf3Bdv9v7
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr9586245e0c.4.1793880475383;
        Thu, 05 Nov 2026 04:07:55 -0800 (PST)
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr9586231e0c.4.1793880474981;
        Thu, 05 Nov 2026 04:07:54 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e423a48sm170533566b.27.2026.11.05.04.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:07:54 -0800 (PST)
Message-ID: <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:07:52 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
To: Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfXyc+KZgdPfLmW
 mRa2SctzYzpR1GViqnecqnsvfmSeKnhK6gwqGOdJHoXWefDjKt7tQiIdeS1hhW2miNJghJrLQmF
 DZfF3vwJAvk8NyOIkPMf31Tsj6K52jQ=
X-Proofpoint-ORIG-GUID: oWMEgNVUOfD94KdpC_CbTwJrQJA00R-y
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec719c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=IKU54Xh4PqmdtQSvpVMA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfX7uV0y0QvQuc3
 Fq30vtSfdkjITOVZbH4yhapuveRsjrXgxyZ7Sg1Y7NmxfB9Fn76yfmTFukaIBy9L8079FedcrTD
 Qy4RHGS3rP59owkM1Ip3gOye0veJqrZBRxWr6e0xYulkydVr1OEiQyHKuGwL006paar+BHWgK7Q
 9MK9rPAOUyTB43cajesok/7bpGYKwMfGK5yT7Jtr3qmWY8zmKznFiLZZHoNWrGg2YOAO8NAnFKw
 YjIdjvja7/rPORffIVtcrKKUOmsxzV8aXU8ygUaM4IqJQ2BjR7Q5dS84IUAVTMPhMmHgoaC8J60
 36umOtRmiZ3YT1O0TCsIB4bld1HsVgGFdxT2XKPtISC8+Q+QU+Hez7mjlCIZT06j1FuJrZvE7bO
 B2aPrMy3RB5RMCCJpN2nYbHXYKVkJ/Lyf+5pmc69gdPzQAWDi6BDjkkvc0Ui9riVezcee/6xqBI
 6EmqQUpZAThSkfKbDzA==
X-Proofpoint-GUID: oWMEgNVUOfD94KdpC_CbTwJrQJA00R-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050048

On 11/5/26 11:46 AM, Chiluka Rohith wrote:
> Add a DAI link for the DisplayPort RX path so that audio can be
> routed over DisplayPort on glymur-crd. The link wires up the
> DISPLAY_PORT_RX_1 backend of the q6apm ADSP to the mdss_dp1
> controller, with q6apm providing the platform (DMA) component.

Why do you think we should only have audio on dp1?

Konrad
