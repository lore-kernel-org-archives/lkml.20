Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9492B4825B6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726115; cv=none; b=TCEiFsWV9av2PcQnEbZeffVAn+bwXQPAEbzaBUY/uu4cZJOs4nvn/F88EHIg+juUO2Ulg0ic/KwtgfVFtS63D7SEPCG9pxZAekAMhh9E05ufzwyyVeoWapOscDOEyuELkn7ZcmKK08Haf7YaanNVrKTPEWclEgCEUTzDZKg+ZMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726115; c=relaxed/simple;
	bh=kszFDuclNdfq0CP9WFG+uE4j4V4VvM+PcDa63yU9FKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eioBo8fusuXltid4Idq8QjT5a2hZ12Hocu6EQg3L70BU0Gm+L07g8LqWKht1uQI/+E/3V0NHqU+BwuxISeWeOlqJ7E+7jdSukclb7YdBlr7X71VYkmCrvBg/Zy8QZy7Buwkjl1GsIcz9dMyH+U7mOfh6nB1Yy/IdyPBdZqo9Zlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sg7CSuxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrL+NL6U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sg7CSuxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrL+NL6U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dVvU3916171
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY+tN0E6aDJtS5LXy+Vf5AHguWRqlBrG1L1fZBB5kOI=; b=Sg7CSuxGrw6JEael
	T7HUYkr4BHbFeBuL1Bi3Q+NinEXgsnulsj6Ply8n9QgHj6+J13bDAx+ONpEjDpSm
	KXOJrKzTT2Pn1ALcjt2228RrBWz+79y3p1M1YLFffyPzl1EQP6rTFTyT/TkiCqei
	Rlrb4Bco2l5a0nFwI9L369cFMT0umyGond96Qt7fN5xYVGwzPHLfhFJjAmXPLY5M
	8QymwDYDbC+fSPF/WgCR7o20nzc5Obs+HMr1RPftUM30i+bFjcMpJ+scWpBkeILx
	kq0N9GtNUDKZYQoZYtdvHnkTOUKY+gDZlHMMyq8kwhCelTRHKUj+LyPP9OFnNFL9
	A66hGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdtkxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:08:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9392788b3f8so13528985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726111; x=1790330911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yY+tN0E6aDJtS5LXy+Vf5AHguWRqlBrG1L1fZBB5kOI=;
        b=RrL+NL6UcKyLn6YlPfhjSrVQsHh5YiItiXUNvo5nNP/30It2XJ0D3o/bTcznJiEpAi
         ch/bQ5nZOFUYN/MRyVAYg+qB7uU5kWI1HCQ70huoA5+kYYbB2ERD5/VqrOo0Io+kG0rH
         WgLQ2iTqFOq107G82jjdw32LIcI1Oh+evNe8QrnOJh3PA00Zp6lBeegYJCE4FXhesT71
         Yvv/AifokuG9EKgRez3fy60uB3wwt1h5Yj4Bn/BKwpa/4OtJVbexL0khYJbsnoytxlCL
         Fd5BkbrtblOGf3ltIqm5Eh/ksFVtvRh5x4+7dQjASGqwyTdKAGp41aautrk1NO87SA5z
         ItIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726111; x=1790330911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY+tN0E6aDJtS5LXy+Vf5AHguWRqlBrG1L1fZBB5kOI=;
        b=NArIEF6d7K7HLVJ3LrVGggGLGvwRerD/VcFyQfsTM3is8rysD28hQxKFMORE/n5U8f
         omAyRdU4bnkQIgAMD410VKsjbElHzAHmuQFU2ODL+ljfuLlwfbaeCtt+pu+mnGoEkybj
         Ffe02rWGA3ieHsb2gl8FCetkkZL1wLOrfd3CHYeY2MCaMnLBcT0lq1gue4zHhTiu33iF
         EhYb9otjJK7tEx9SIRmUnWFKZIFgQ6GSntUUmV2zBsPpYrKTDq/H58qK14v9pzPWnBvw
         f9SwO+c2xInrw4NzA5q5oqOwGrc1xGK1kwo9zCAbr1CZQ+Qj5GhFS/OS5pAzxn2MBewm
         kIsw==
X-Forwarded-Encrypted: i=1; AKwUvBxJ/YlA96zSmNLG4zq9JvMZHPDzNib4PrSycvCrJYP129H56cYM/P/v18zaHwHX3nJnzn+qGXE+bEHQAOg=@vger.kernel.org
X-Gm-Message-State: AFuF++lRXgZdm6pGAYiH+2n19TDn6x3XdmKAJ/C0xNc4dIAExUGXUluN
	XWknOyGG8Eje/+L1WBnB2ixwgdAp1ynPzBcJ3VEa+cxBoPqROWOlS/E7t+7wR1ZfkHjAfDMKbgY
	Ua1gHP9bZffTxwpicLY+J9EmoXpHndeFiOrVlf1hjndsOFB/ewCkenS46fAdqDXAbMX1EfmfPT+
	E=
X-Gm-Gg: AYBFou38K7otHAORfvAkdvPLCtWmJkVa/ojoxbsj6dIBNjV/cK6Upfvwp+Tv9jy8v/j
	Ex0oPKt/6qzJEeO/Y40kfgW5lBUHYmsXtDtWXh1/Vl/OY/Z/4VegxYSY8mGOzfv7pZXAQN6GIi/
	xFOOMpy/0imSHJwzXsDt8WWyYCJmz/M+hVzwn4Y9A509dR+AaM0NhG6jEiJfXT9rTBnPCs9hklZ
	csOwvrzpzp4md/mm3diH+W04zmrPELbuEtrNgHrm0XDW7BpgoNG3kKnVFK4aa/7mY+vW8eCNQPP
	HtSskH6JSddUUkER9r4aUYt8ScTC7eQJNksGGeMs3V6F0b6yNTd2cQp5yIafV1g1u9maeoMjQZq
	0T3vyv3S+H6ty6HEiadLrbg==
X-Received: by 2002:a05:620a:6cc4:b0:939:c7d1:7471 with SMTP id af79cd13be357-93be0998bdamr169259685a.4.1789726111299;
        Fri, 18 Sep 2026 03:08:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc4:b0:939:c7d1:7471 with SMTP id af79cd13be357-93be0998bdamr169254685a.4.1789726110714;
        Fri, 18 Sep 2026 03:08:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59710fc0sm648914a12.13.2026.09.18.03.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:08:29 -0700 (PDT)
Message-ID: <ef3beed3-e005-4643-8f4b-fa7b9c017e08@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:08:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] arm64: dts: qcom: sm8650: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX2lKToT++oE0Z
 nHd7vqcfyqN5rgl0useqJU/vL3o4BbBZJkAyzMBRYdef8d5hMNIbp1giIM66WdKhFWz4k+Honq6
 KfFz9HeySR2QJoVaWZ2eJVGMYzPAC9XJClHd0kYAJd4yTaX94Ni/s1B676TpRfRIHy9cncFiTF8
 lIS/vOyMO1f+uG64ku7oEvcqYoi+0w/8vXJBPHowYN4fpb/62k2fjezu9TmuLcZZ+omil7bN9nd
 mGY3LQec936x+lle50FBiWkRNp2h86bKMos7soVEgkUuB0dgbTvriJ5vI//Gfi3l9TyiWoL5p0d
 IWcMcHt6UbfEf0GoiUMue/5IDVwOt5NwTee7d0srxZD63n/gCmRlLz7f3R3QkgVMw8x5SmvpShI
 Hmztx1NyDS14Rfsx5ryd547CHav87e/0JbgCTVExwaF6dIf3WD/B8VmpHt80ud6S0U9aiKpMabP
 hYpnpj33EVQkSdtPTnw==
X-Proofpoint-ORIG-GUID: xZ7iawogd7P8SAv2eCllO5Z13MUk0cA7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfXyjg8n4uVFOzd
 SxRBj8r52l3p4O78mVljh2VZ5ix+PL1/033CQzg4dcLS2W5+LyUASHyG0PLI5ClCp9BI4scySGG
 L+p8/7PuYKNFJ3GNvjFl3H5WVIWaXjc=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad0da0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tTWuevluKPo1qLNzH3MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xZ7iawogd7P8SAv2eCllO5Z13MUk0cA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and pcie1_port0, allowing board-level
> overrides. Move perst-gpios/wake-gpios from the controller overrides
> to the respective port nodes in the board files, renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

>  &pcie1_port0 {
> +	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
>  	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
>  	usb-controller@0 {

ditto

Konrad
