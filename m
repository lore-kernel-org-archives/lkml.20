Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477881;
	b=oVb4zg9kRS02RVm1N/FEqIiz1ZV9EN5xETTrJl6p2+x9WnafPbYz5TScs5RJpsEWxiLf
	 MhNKdjuu5e0m1kqxLnM4zF8Vnbdvw9jnAEdrKvyFq0ottiaFyD4xSeMES28e7xwYfQbcD
	 EAwXBa9eKfozyIhDtCVJsua7OfJ4F7MXZ9G6cpmGD+o4pSbjzgNH7IbOOQI7qo/DaVR0v
	 bvEjpmK9OLu04puEeLQrmxP0DJ5H8eldKTP5NvnC/l/fybwKP/fctkSaUOOn9zHGuGf8X
	 cRNPrq/fDheqwMpgtWwkMsBmDk44rlF53Md1kAyUiaXHqCo+TO0OnBRSu7NAgPgQLWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
	b=izpG39HTmpRTsRXVkHj24GfrDCl3J2qKLyxETPp2dpn/NoekXMqWkVO7cjfvgnig0Opb
	 Z1MHkT5I9wOd8Q2mH/uuTteqUydg6/yXqPnQrpIWQi5eMPueW2DmeXzX76PJ6ZVUOGycd
	 hxmsIbS0hcJ80sdZt6WZax5ddmNqwtpdxn/ipLSw/laLonungedpCNdkuMvHEhPm5NEJU
	 eqfJuHCJNadKQMgAS50vOU5FUhqO8GUxqWx2LpyBm985W5gzF52HhZv11iOBC/fNjpSqh
	 NW24YdZZ1Cnl97/RNlBRwiGJ/k6WmK/WyMtHiLcfg6ofRFWT/x2U24BoJdRkacjhJiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZfoH7RQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWjDz2O8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3A5606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3A5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZfoH7RQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWjDz2O8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K6SaG41418742
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=; b=CZfoH7RQmv8/vtfE
	gNKgogaPsrwkO7jBSRgkoIZ1WgWVsfNwRrHe/vbbHApbFlHyp6jqOtDU1hcbJ7FM
	Lh9iQFSavTU52kutaAeP8QPhQZL5aX03wau9GBdndavqtstEZ/Dvnaf41kXOSaOQ
	Uo0YYVjmexQU6r6jjUyDtoWg8Hgxl2X9cPjEImE+Jt/aeVX92aHWetM27rgoaMrv
	is6Wnrki+WKvhOPa6l+osIkfNMbz3XWYbqk71qnqWDc6CB6lN8lv1ohBFkbL0j2c
	KSy9zX4eP/epdIU1Sw7bUG97RgRRo+U1QBzF8W863ygpl7AT4cO9o77uCtEgAopu
	ppppng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ph7nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:31:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53630cded29so10424801cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477879; x=1793082679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
        b=KWjDz2O8HU4SbDGylmcQeUUPmj1Qjp/+45EeNyzqA/GY4mq9BXXuf1pcFOphyThsny
         HvA6iOpDbixaGpWOrdrLEoB4YmjwaRlZA5Y0Wxa7IjZGleXEjUnUCQBqnSIroLyYfJCP
         NDRn1GTHuKmjoPjYJYRAJ82xA1vNnTdpfWkkYOSlDpPioFaseYqyzgOFMItJWJ4eqZ/j
         /8k76A8npyCNl2M+WaI3UK7jD+xGQ5i8tz1iy9wmrF1QqRGGkaaYfIDsv5ZkMmtWe/MV
         6vqgVYw/j+N1qRQn4dHYxVybR68Qg7XYRdHQ9l58gcUdnN98b860W+rHWA5U2bZ+UACT
         lDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477879; x=1793082679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
        b=22ilzlMPAzxg4i9hEAZM14G4AmfwM5emA80xUrG4gDbmpPWjzcYUy4uY1tlc4l5iZa
         sLXiyY14RX/f8+kHT/ZfEWu4oI9ldAYUfaQeNMdMOS3CV0eEz2DEWr6ifwyXZdNzsE5j
         oLPAwYgszmaNLSzGYPLx8aCkkhCzLUms3iNREWMQc7QYg98PfhWxjgvUzTZMDN1rfEbu
         35NuXl6/ttXf+hTx/1JtMMjeidZrYRq4gionLc6ESPxXm3HpYOBSDcy5EkKq1eOVDhQg
         XgBbmgBTIRoMEuDk9QBFqtWlp6EyHF23o0gOYaQwK1ICfkuo/NWW2BUioWtUc95WYN8v
         Wd/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwINrKhHtFhq1TgN1oEoiRkwyle7P/jZKQDZtSMzST0vPjqVHislu0BYVXsTuenV1Z4IOIbd5DXtfdoZf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIR6FRiNxeo3jwOAler1zGU9ytWXcziuWVlCyV19Zc+F7utEKb9
	FanM6rdbY+T722qFDxII1HsyweNE8l0HccpI/W0bN0eD4JBsJ5dZm8lhMlBP9WBOZWnc4T6VjtJ
	dJK7PUlx6R3nudYyW0y0Hb48Ji+AdESpJX3ZUsA92eu6ShOb59kc5qOfwVa9m+TBBP5Q=
X-Gm-Gg: AYBFou1KK1puOItzoLXsOUp4uSatAn6hIT3PT6T7BVPZlVoJF0bPYQuOu+3t2h+Fd1p
	8wnxxsOkkbTxI6iyEfoZl3hggpM2keQ1EP9g+EHBCpElg953cedkAizLDj5U0F01csYXGktG6Hf
	cEKvyUFxpH9iPGsK7i6wikzRsCtmXU4BFdoa5mvrRarUP0GHwh78Zz8dSsStXPS18+uRiRfp/XG
	jn/ME7Vz+dkPjCVlUczLW8L7X4w7nt2JGKDRIufSJ6I4MeK5+F2clfMI9q6dga5WgWnOnzoSOAq
	q5C++GM8wDWTwf1bvUeDQEz9X35Ykgek9c+x/rFOEHjRXDZOeY0K+NZxhHAqc2K0nsbZ97ZqLm/
	L+wrbNj9Qnr/BxrDFCsmEyg==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169134551cf.3.1792477878564;
        Mon, 19 Oct 2026 23:31:18 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169134161cf.3.1792477878105;
        Mon, 19 Oct 2026 23:31:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm447200266b.54.2026.10.19.23.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:31:16 -0700 (PDT)
Message-ID: <d1070a58-98aa-4a98-b0a1-96e974be5abb@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:31:13 +0200
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
Subject: Re: [PATCH 02/10] clk: qcom: gcc-msm8998: leave the MMSS QM clocks on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-2-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-2-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad70ab7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ldyKz4HnRpUghmHhsoIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: iTdQRsgeaGvI6ja015uTEjfA-XMtFyKG
X-Proofpoint-GUID: iTdQRsgeaGvI6ja015uTEjfA-XMtFyKG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX51PzIOJhAVkj
 XO3JISvKiX9b0Z6H7lbyuM1yN3z6hLLfywOmSJuInAP9L+e2yBT6dqEXjCVickozAaDOMqjTNMU
 7MMHuy66cYpY0sf0L2U+WDZkAF1e9/Y6kQFhoQ1bZi1vDgPIzFdmDu8J5pMM5JGE7T1orv5L/O3
 /xxGF+TV6SVq6abzj/76NhOi1o/QSygt2/LDXndhyxeinQt3x5XC7VkSJr150258gTupLodO9nA
 6Nyp8+qq7OVajDj9wiOVcasXsMJZofS0yTum9aIVD97/eXUF/NvnPnTh8DxIt40+3TfpounMkv3
 Pw4HG0/WQ3j499rfMbzhFsDj8K9pDLchcsFXb+arL0N8/zqnIv1FUfDhe5YnVCwhJcWgUv3xRGD
 8XC3qgjwQHAvDK/Nqi22MdkDR11eEVwFw0jQc34KG/RKl5VTgY0YFoEp04JhCkGIQgxo8+hte72
 uFxdnccET0Bch4+0KJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXxqe36GnytQYn
 CyCx84XG953t7jamJx6hKe2if1rI3h9djZ6ncxsFhiGFrHpK4LN42pReJCTbWPwwikh/naFtfKU
 x7AvBh3psBXIrkJ+Fo/a7B+nQ63qrfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Booting MSM8998 without clk_ignore_unused, the SoC resets while the
> modem is being started: restarting it in a loop takes the board down
> within a few dozen cycles. Nothing references gcc_mmss_qm_core_clk, so
> it gets gated, and keeping just that clock on is enough to survive.
> 
> Downstream never registered gcc_mmss_qm_core_clk, and dropped
> gcc_mmss_qm_ahb_clk because XBL controls it ("clk: msm: clock: Remove
> support for the gcc_mmss_qm_ahb_clk clock"). Treat both like the GPU
> BIMC source and SNOC DVM clocks: stop registering them and enable them
> at probe.

[...]

>  static const u32 gcc_msm8998_critical_cbcrs[] = {
>  	0x7100c, /* GCC_GPU_BIMC_GFX_SRC_CLK */
>  	0x71018, /* GCC_GPU_SNOC_DVM_GFX_CLK */
> +	0x9030, /* GCC_MMSS_QM_AHB_CLK */
> +	0x900c, /* GCC_MMSS_QM_CORE_CLK */
>  };

ideally this list could be sorted

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
