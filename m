Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BDE5AE43E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421551; cv=none; b=McEYVEBnTKBaE2dXoZBVu80dg4Y+AnxrLxWbKFwTMu838lp19NEejX2KjMyD+mMAu0zxc1FKZVeaB7NLEXWnXJ8a/suhf7IwgvRxAHVjFvQq4ns1LaY9xUDSuxSPZBhYsls8JhPOC19bpIRHAQlYYw6GfmlHtnr2Erwlv/Msu+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421551; c=relaxed/simple;
	bh=1K5H105kxuN+ZVKT6leBzx4HfbQpcRrSq0RyZndHnM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgAn8EHCRNkZqqw1LHJPKetQFiBpkr+Vuxp0SBi/H9TdO28+/35MPLcX2AyNE6TrSAx2TUERTjrWbpWNwXn/hc1aQdMqUqzwSzWCrtkKhjdpXT/r7pcKT7r/dAY/DdxQaH4NWJ7jkDzQWRM1yZ8uetsCBxPsZue89d9Nc5R3sZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcj4Pdhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a0XaDEqi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcj4Pdhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a0XaDEqi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0r0x1457494
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=; b=bcj4PdhbvwkmQAwO
	asgKt1TDvUmcXWN6CUn2RC4pNw/poL4hDAAc//4xFP6t4HMQwYLiyVGlRkNg88u6
	IN0YTl/lfyBbes3BBjo16WuQGXYLHG3ZWB58d8uzu3j5M41WR/FlRQkXHTfKuW7X
	aeoG7seNQzShQ4PomUdkeR1Vj2PXqizfentckUQh+4ml/2pCy8/J3GWptU9f7n3J
	bVFb51EvsNlj6eIA1j0OVWt7wSgYXCByyP3Wex5TRK4PrYvY3qF8ghH891pMBZ1L
	NU64Aakiune2ofifbHeZ/wAi4rjSWkaWbw1mNiiIN4IAIan65qhY4LCpjlAwvAIh
	PFXPug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65hr7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:52:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso55327485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421548; x=1793026348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=;
        b=a0XaDEqiBJ7orIjLFn+08ohxZzapooO4lmjz98MgLPa+X8OdIwcnkk7XBtdqOrWTMC
         IhJurdx7cJhlQkireW7A8ul9t7hKd8IEP9F1c1C2g6S6wfXzSOOsjRBlqHA2oYzCETSP
         1S7vbTd/weJGOSCUI/tL/ErJZjZ/UMuomt9XukarmwOj4fKrlqv/bRnSPgcOKRJqLTLC
         jIY9faYmKN2Ckfqy3IfnDzmZ/hUzRUcG6u1eybizybnG8sGHYEz0OxN7GwUziXe6T6qA
         I46RHjLLpmQ328jcom9wtHuxWcscQRe8j1fvyqJSiYpvYa0h6lqDVVtfhopybzATLYMy
         Ffvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421548; x=1793026348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JinI4suoV/PemBqLc4GnyUwlyXTR/Q4HYVrbGwhNsTw=;
        b=AQEE8POT8zQkFi8VGiWQ6QxeusVGr+c/2UcRs/hJLeig3rqag92mpRwCMPpUHhKDmb
         xnuN2niD3oHg7HFZK34IgS0CW/fMxhQarqCLZ+fqoLxchrk8VS1Pxy+idqQ08Gis7c+L
         ixrGC4oY930DvjWek5dMOuxz6UpQvTXltuV7ekPTfNMte16RJ/6lWAm8pNBjZ8tQTg2E
         ikS/71mi0djERDYeRbMX+IELNr6Y0Vg7TlQQ+iDP+8QhkoISX+nfVdBkvPZQL8cENbT0
         9hK75RWZEWql6zSFc0T+G5IPJhcG/DwZ8XmZeVKyZJlQGjLbhqFa9uymmdtB+jJ5R10a
         fByw==
X-Forwarded-Encrypted: i=1; AKwUvBzii70Mdv1KoQNoCH4wJB3ByYgyraaB4tK850KZgHP5Y025ZmjfPfFUx74uWXsgOC7LT7RYFKBY1gEiGOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuAmkQWrZbwVJ62s/cX+RXjKs+sAY/HohQVqtRq7DQbHlY1jLp
	t/W+9nVlc38q2eaUNaMs5EMsMnqSeUY6tH8Rw86XfJCz1NMXmq2iUV8jHfVEkNREn5t3pRnNSEC
	If/qUEY8PibtSidmcJz1+3q8q6ZmHX4M89Z8cORx9aKZHy3ry33JmowpihqyLZLR5/DE=
X-Gm-Gg: AYBFou2hOq1WJjzxJdYsWLc7zFdmUrvpiDogeJu5kIbvOnwQbL3U5U+eZO2hLuljA3l
	0WA1fspkqNVmg57k5+QIhBkGgeK18knypMruhx/EcVvnNVa8Y4MXFFcacJ8+O5JxGbonPweDOjW
	lexdGbU5xXEytWta44+I3MbSj1HPpIj2zCwS7YD7sGAsvCwj9QhOY1B3R6/OgAQtxlvy1ho3/Gd
	z2LDXhKdoiKAElsEQeKIseSjVIMKa/31TvRmT43EKDLTR5OO1CYS6hH6LyFn7uu0sv7U1PH/Fqn
	EoRxXjZ+qUZLbbaZPzGk2464qF+huQnkocoaacU6Mj4kIyE9JRfTPasgJI9emJ3BI7GkEMcdXRO
	JU1QL/q3cOKPTQajIqVcgrg==
X-Received: by 2002:a05:620a:40d2:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f299e5cf2mr1473238585a.0.1792421547756;
        Mon, 19 Oct 2026 07:52:27 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f299e5cf2mr1473233085a.0.1792421547217;
        Mon, 19 Oct 2026 07:52:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf335sm373853966b.29.2026.10.19.07.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:26 -0700 (PDT)
Message-ID: <2aea5502-d9ae-4df1-abbb-9c5ae812b80a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXxUvd4xPpIKMT
 kI50NlbLia5TF55Scqbu26CiaiL9py66ar/3kVy+qePOclo/DhU20X5z9lAVcoJbeUW4/iC8jSR
 bUke3i4q3az4vT0T8r0k7Kc8dcXKt7A=
X-Proofpoint-ORIG-GUID: YJyMiMYNX41_R0AxpVI7Mj0fOaLnjZ9E
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad62eac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_82NC3t17uPQdkoQo54A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXxMc+zIJbP6wW
 43mF/zVUo4jXP4OquA+xwKy6RFUw8qwLCTDhFVFU5DzFtrVmcXz9v6JIuG7kJiGChdfh1DSQGMj
 hmZy7UQiQnN+ofes2yVpaN2DWy+hxhV/N+f280+jd9JcNx9v+5kgDJAzZ9QeH6AHNPQ2ytttZuI
 /tK5gBihgAOhPNosusn+Hk0vPx4gq/St658H84U6dBBWSUC6sJ6hVZjbGBM8hZsKvfFzcA+VOV/
 ZgIKzVc82mBveKRenn1BNgpwpxjC+t6bE0W9hqwEnODVQh7vvDPJqZ7JEL4ELbP9xDFI3GXKq6N
 Hky5yOZukw2quIuSKGgBUJt7HbQr6CF61PhzhTfaTse4SBJAxG0NwIzEEOzUhSdyz/B2aXpkL3e
 x4BFFVVtu+hbE6Nn1b+yG19yWJ2tQqhZSNpGhQlj6gdWKe0TZ1bVeVXf8V8BlyxWuHjR8YSu0zl
 gvs1Ph10fQ92igAv/+A==
X-Proofpoint-GUID: YJyMiMYNX41_R0AxpVI7Mj0fOaLnjZ9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
