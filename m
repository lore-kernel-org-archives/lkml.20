Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094577;
	b=c+mpEHHj1RMNJmMV1ftEygqI1It2MenJ5FLG2Pg9DSh/XfrCddtzowJdmi90AJ8i5q35
	 8eWCq6pIbvCK96ZEQzPmHmO1CALmAAXZSBkukhEI3kUxiugpZ4/zbrBl2HaVQY5f5XcHU
	 DCSldhukGysoHYuAfwu8SbUYsCfAlY9UTh1f96Aw3joLpJJoHWLDu1zchG6R5qhD8jsCU
	 Vv0P3zXFxTWfW2mjiV9K+SmToR5FuvUH51AC2GkzmixokMC0OgksurPpofwX2TQgOkKDa
	 8v2ZDnrsinw2LreX+LFp/j67F4OPV1SSvZOGYKF3Y6oAIl4yaE9EchjmNg2gfnMOkjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
	b=JZKWvK8BW2LP9uHS6UEBxzsZAJO8V6kEXUuVo9j1+zmi0nls94yZvXrBEGEUY2D4Cybm
	 kl6/rd2tiukBsV9WnNDxjYndWBnYvEfHfSeB4qQDjUPDQPEEH53Vh5JMGxKF4fILwX0yQ
	 2Ap1EaHOJYC9gnjTOXu9BCF+qYSrPaNVvg4qkCIy7u8ntPHVk6lZSZqG8nkjT/ngRLJV7
	 DaMoED2HZH4hqwkjM0qSZ1dpce7BLDWb9Nv6e/dO5ASZkEperM/ReVk5RrZ8ZQxfnwSg7
	 Du+OhkupIN4u0cN0eWnVm+cLmpE9Fv51m+02jDBzyJiQ3TAxJQvpdd4SLFOgQaa4hHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FP0sJ7tE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl6NNdQy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE12606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE12606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FP0sJ7tE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl6NNdQy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8g7522761026
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=; b=FP0sJ7tE4x9HyrGl
	jFkxQXdqYiFLQzzSGStG49wobrGZ7NF1p3Aba6esfC4PTOoKrQSeksTrz8pogcUc
	MToInCj7y3yt7Xe8gYyPSBJKbII2eGYiaG69direbwkZWcdtSJvXYsRvw6J1Intd
	87Buv7yDvfQnwlU6zi1sEo56b918cTiEvsRu5fI5p8/w2J3OV8Bqa8miV/LQWYad
	LyuLM+zow5AupnviLSNuBIBLHv5IVh+7YamG0+d3wai3hpZbWCCcyMAP/LLkHDpJ
	HLXwMcfsoFBUv5KZMZFNEgCNdJgRTq/lxY+kaeKXDkZCrME9qWfcF8R+gj3MRhGl
	rOWZGA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh919u4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:49:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a030e0f9c1so4543902b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094575; x=1793699375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
        b=Hl6NNdQyuH31wKXzChGGoe4LJOAFWnl88VpMkQE6yB1fNU+UZk+choE7EhbjIL3VO2
         cwRI2gE354XDtJBbspbOdbe+xZ/Lox/8Dxwg/kOhvoNnxcW+KqS/pr1OZZN1xHXDDuZr
         YJgZpGMM8Fc+5OoRGfWuISeX3DsqHTJi2XdM8nCJV7lpjyPibXrKLCmg1ZBQfdkujO2P
         mXof4GFBMYTLwb7jyJuGSsgkuTxf1MkQP3kI4iiu4DKhq88D5RGyKttsjMTZoh0j4f5h
         I86rTFbqfwNreZWFUT/kDcQ9rRpyAiFmntZNOZMa/PuK8DtmxO7NrYU+oedckilAo8I8
         vHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094575; x=1793699375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
        b=KK/NF1HapXBqijYFlCRpT3U/mYGCNJZ5Syf9F52Q9HTQrViBq3hdNZLLZUxXdELfGF
         9tvpg0FHZoy5hzK2Cdo9dxsmpogQizzQK3uRbeqxjfGeop9/sa1WdXeikjwV/nlNA12V
         RPQ5O4iNbEGWSYgpc0YZJW0fJEbzyp9d8bXFfjI19ZyZQuMJfioFEac86JVLJJqE5Bx0
         UF+WEIFrrrtE4OMAE1vY8evvZwvjclNh2tLoF0/+NwkewNZbLziXfQAUwOTO9XGbWXiR
         efWOnlylxdndv8fTJvsklA+n+x984BOA1UHqmobWQfm9ZHE+bRJzJeMKownWAHuwMKMj
         pTOA==
X-Forwarded-Encrypted: i=1; AKwUvBylLekeAFVg7ZbXsQcpyRr+0Q4quQlzwXatG9rqbY3ISBAK0mT6k9WIT3J9b8TC73uGs2s0jQpAmcLIG1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ7J1xlPc+HkJd1ZANNE9+S4PZNaSzD9qOeVYK/tiecwOzIc36
	ZToZK0d7eJJaZRlCF9Q1fkOwib75ttr4FrX2+a8sAvg+Dk4ROexzSXssE2YL2igREsU+r1kzz5B
	7mTe7+F379J92Km5YPcy+aSEK4haseGZdy1MboWK7nLJfSwzBWrTB4vR9vs/0/WaTyWk=
X-Gm-Gg: AYBFou2k7zgLmlwMkOI7GC7VwaNttTSF7VhEC4hno9GhiGurULPBpiELZykfBMxhz01
	k5x+EJsfAbJe0CWeH8dY7XvAlZrMMmkZV+Gaj4tMBoEQyTqpiUGAPGZj5k9xxCAitqBcPKLyIKx
	wRIk01Szz83tf3+eAeUQzMDB7RCwOGU8lJV3ZUYpTFHCWuZl+h/D2Kep/na96mEjB+0mL37tmVd
	NGoH5KjsQwocj//OHtIawpAOYdsXt1hBFtIRKtduC5YtCDUNsi6THlNGw7gpNl8bnpQ//Lvl/MO
	vkIE6utw5q2EcxzydWHEWyKZeJTDmiGh9ZYP5/umtwAxQic5kJdF9us0/bxZSo4DBq3LrxUcFgf
	5yzNZiFatNiRtOcJym1xWgm3sUSAMIz/3hv9DYwRZitIEc9m9HhPBilgOkQPWnHxpAgjlOEC1U9
	8=
X-Received: by 2002:a05:6a00:1382:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-8a366f6724bmr7261021b3a.25.1793094575107;
        Tue, 27 Oct 2026 02:49:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:1382:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-8a366f6724bmr7261001b3a.25.1793094574626;
        Tue, 27 Oct 2026 02:49:34 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fdfefsm2076232b3a.50.2026.10.27.02.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:49:34 -0700 (PDT)
Message-ID: <b63a7285-88cd-431c-9d66-98abd3ecad3c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:19:26 +0530
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
Subject: Re: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
 <7a6ef006-cb76-4e4b-bd31-886af708b375@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <7a6ef006-cb76-4e4b-bd31-886af708b375@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dfQFPZx9mCvmBystGL5qdI_EEsgUQOIG
X-Proofpoint-GUID: dfQFPZx9mCvmBystGL5qdI_EEsgUQOIG
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae073af cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EDPTx0FvkmN4Oe4_Fv4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX4OJMf0AcoGXr
 XdnIhCLnbjrh428vZRITQa/CDZOmh9OZCtacsb5dFdUo6SnfUi9NAcCOo8bqudh+iNfdzl9T3mc
 xdyprFXJRz9byVMZISPP/iqWnbHnENVZ3BRMf6H7MCaPHIzsKmF5lpqgRmY1VQumSmDXPys4syc
 R9+mldaYq7ONcQi9Ehi0ne+s4IkbBdKA76KXntbmIvW/UFOOVGC3UTOYXoVtgml7zt2AOynWbke
 S/ruguH/4KsQZM7dDaO3Kdj+Hz6YVzzEbvLnISrVHxQhVkItDRHEMhcXTmT1eB2ZVqugD/uBhlS
 WinqHmFSnMsPJEg0AuJo3Npu3h7zoGF/8aSEG/swVM/ezy3AnLRvvnrckgVG/ytYwPz3A0CW/lc
 bd1/7Vqia5vae3JqnTUZpQWdENuIQxDU4l98v3l+zNfqDJFh9lyVvEH707QPhgJMrdL4KloTco4
 LnWHnAapeRoVBnrNakg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX2iyB7Gc5K0k2
 UWeSTLNxBcu8c6X5ZXFbg2D9CVaWlLc6rq4Oj8Qu2KuPeGj5Th39Ipoi7F9MTgBRpD03mGO1Txo
 JQP/Qcyh5PRyvxlct7BSbkcN3reJKU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270039



On 10/15/2026 7:51 PM, Konrad Dybcio wrote:
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> [...]
> 
>> +	/*
>> +	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
>> +	 */
> Nit: this fits in a /* single-line comment */
> 
>> +	regmap_write(regmap, dprx_1_dprx_cc_core_aud_div_clk_src.reg, 0x13);
>> +	regmap_write(regmap, dprx_1_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
> Hex should be lowercase, but preferably please define some sort of a bitfield
> that this value is written into and run regmap_update_bits()
> 
> You should also set `.use_rpm = true`

Will fix in the next patch.

-- 
Thanks,
Taniya Das

