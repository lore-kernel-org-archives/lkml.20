Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479470;
	b=xKQaqSU7URys4OYURgxmbu/g0pkYqYXoicC4MIXVWvYCgcHjKO86EnNST4jryrh623Kx
	 xewucOfsBC1LjlmjAEGdPeOPtb/fFJRNCrsDHt5vw4G2Udmh3NwvnAeyosNDadvVLEdiM
	 j0xuGsYK5QGwJ9YT8qbbC6kcf8Ut96J8YEK6FmXlsy5ttrCbzF+ZJEuwf2HVLenDoWzgY
	 vkc9tYzV44VtA/Med89QbYmQnKSfX1dAMxg1pUI7NC+pAAG7jhQqHuMUVVOOOmV1WJ52T
	 qP8rzXKY5XAciOCQQQohZZZVUwYTXao2ndOTo3H15Fd9nb9aSOW8qKQEby2S/MQQeyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
	b=sA0/hkGzClFoSdxec8j16nn22/7TNRgM3u/U/MBtb5pRXer9tF8LDblF1r8cNyPBWWtw
	 zODzEnbvOtkFp9oi8O8Wd9vPRg6GNJW0D4BTyT/063rAl5UyqPd9FKKQKvT1cc+yMrdkj
	 odt4TKN1Sd7/qT8RG6LTn7HaOpzHs7biylcY99Edk/LueWbbzGL3tmrVDiTS+djq3Ge9p
	 PrA/X6XU4/lBD7OBRG0lxvWfcvM6eQiT2kcBHsoSe+aKrtLvH+h4MY8xx3sx42OnkMv5+
	 DFMUmS1CoRTyiMTumcVkrXOhKoSEW4VrhrDnrIFVw1E3rrVtD6ugvO4QzX1o1mPvlNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TsMk+zH2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/dBO5I+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999360A382D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8999360A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TsMk+zH2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/dBO5I+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tUPj2878290
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=; b=TsMk+zH28Jf1GdAt
	qoT/9lY3gFvz5TLeqhj1zhjWRu8+FqDdFNWulTwLsbYzVQfTU6IDshTW+IeTyGJ+
	kGSkRSxfp9vdnpQfA6lqD7pcxLR68OI70Mt9465AN5Y4h+WHqk31V/iCoHYhjYPe
	eCAqYmFn0QatzSGuVb+N7sL2joz37VzaG9jN73cTO2yhVnPnwDLHfYnAcUWsGj8H
	oHsjd1ZKOlveUSCrwbVhWnGMpzM0gETFBOeSfWHbnwjx/FM9Lt3ep9tXd8VN+iCW
	V+KQjGhQGEdjHvwomdCdKqM16NSmWCMWbPXigbxkYa77AvqIE6TzC90koYj9YjEN
	1Zix4w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ps8rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:57:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536708d1a3eso4938331cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479469; x=1793084269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
        b=Z/dBO5I+dtbYNTgmYzziHAI8BMH1JX0OrFqcV96d/B1CRKjF+cR9VIdJGPYUCBg2Ee
         NUkRp1QCzFpAdSPXPuPZXXpqgszMIXFsy8+QhRD9HQwgPyD3PJmbIRGaThnG0xJLgyY6
         H7uf+gbrFexPSvORE2cJJ2cmCFCaR9PC5xKvkvhDps6zmbNo9PNcdwMXWhK8T6EMq4dm
         y17E6nBcfeh8bFIHwOntr0ueRPXxf/r9Kfl7SygQoBurdiITbjGWWswaVucls0QoV38u
         JlW9AUX5UItVg2AVqeNgtu3XRhNu307ViotZ8EpGh8BRif1TOy6ehgV2DdMmDXkpJFcB
         otfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479469; x=1793084269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
        b=T9kIgI/SuVwKOJ8upXsNlDPNDeYiv0AOufLvPJYKsrHoGJqxkchNdCu6v5v4JVT2vk
         iYEm7qZBnkP4h4VYf97W0Zw533XWZvjLssuciLuYgUiZACEMguI7bsLRJMfoyjt62P53
         26biOhwWEs1c7uBSO2ZAPU9I/Z/gI181vZ+O26XbhPD32Dky6HsN+wa5apjgSzN3z5Y6
         OLu7d0E+A7UsLENIyq+hOJC4L5qh8rx03Wvm84dmVGeZuxEGI/4jSAb2Ecgu1+WpaEeQ
         DsJKVxgqNnv7fjFeSbLDsEcsGS+FVW7k49DnUKV5+/eomA2v2XhAK8rR7Z/paSwEm9d4
         hhrg==
X-Forwarded-Encrypted: i=1; AKwUvBw6oYrEUwcOhzquJA9Hn4cZX9FRDLkEDDb8A87IwT+rViCKKY+y3FNbwKhhSq0wQiixucuzoJ5u9js7Hqo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL1e29X4fEB0PUSxhL7XUU3dOaY5GinpXOjcmJsXNZ/8KPBuGI
	Dcs1erJfjg9rtOQfSf0TOZjT1N09GW4Fz9UWrvq6moepI1n9GOT2qg1rd1PocoVWQ5Cin07TmFB
	0gVgdsuQy5UX6zz6mlVJRL1MkIwwMJShw98G3iu6B9csTlt6CaSIvPAmHv+RbHxu/Ngk=
X-Gm-Gg: AYBFou1YSYHV5IjtU9QREbNe12C9ZMNAQj9+nap92GD5pEVXqhhHRunTTXARtq876/Z
	tamGlLsSR97dUCATIa7MoDGBlAUg4R+jnfklVl2xOP7z7jbSsfSOH6CK4O58bHKuUjOlE8eYfit
	RSOSp5Bl0VpVQ/NesXnwFsRBFTiMPgEi4h1uvLR2GaTtDoqSQiNMAI2Z7DXURM5UxKzByTOFhNo
	8L+otF3RgsdtHKQYG5Vz9DVJ5+CwQUqQhXxgO3CcpZ5U6H31jkKVGYm/+BsndCvVLnWyJGWisel
	cqeeYNH1XIcUr0beJa1Q57NHjq5ueQVcOwhbv4UHqKwMwyt2pdFxDiDuEnH0kEEIVc8O8BxUmts
	fmQAwFnRqxufSGP2JgrI83w==
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr179117371cf.5.1792479468628;
        Mon, 19 Oct 2026 23:57:48 -0700 (PDT)
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr179117151cf.5.1792479468091;
        Mon, 19 Oct 2026 23:57:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm453415966b.27.2026.10.19.23.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:57:47 -0700 (PDT)
Message-ID: <45b92e2c-a310-4bb0-ad8e-2fb5b162fbe1@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:57:43 +0200
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
Subject: Re: [PATCH 07/10] clk: qcom: cbf-msm8996: program the MSM8996 Pro
 post-divider
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
 <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad710ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RnTLsUR5sZSAZyuXL5kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX+nudlTLgZUag
 hgM4W/WKZ0E2hwMOotek5q9is36mI/EYK+qdiiRCIoGiyyjSPH7H8R25Nh1ofS8OwKjgaEPdmr7
 y3/0LIbOWn1ZsPJjidSjqbe1M8GNzpt3jNzSFMrrFsKsUYUdOKBvn8E8of9v7sOiVRzE98jXExs
 E8/6+FkE+8JDTMhCVb8Lz3dBBBUEcCPWs/MgiX1FaIHAh6EUeDdXSzj+jd9HFYVtTwd/t4J5gN5
 CW+6PF6HtjvbnurnRH+IAr/gju3XdpAxNKRO8+krn5SeuQcHnz1h+a09FN7Us2WtmWfiGj0K3cS
 AS9l9+LyrjqwBi2KGUCkTXS9iRncB0bZzEsS7WZZ2cRjX2Yf+DMFImBUM675o2nyY6RkFZg9R37
 lEZrCCeGqF6bTxm4rMWRzrg5goEerCgEG6W0lzfb82dHo7xprQ4ieclnRR17wpBCzlondIE9Bfk
 AOsscCA4BkfDKpaYXtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX/5odrWz9BKhe
 rpWuASZkUB6nQxWcJsh7KOrFCuiTHWHgrregOgYW75pgGDplqRUv6HqiRZC8L8iymSc7SroWjtw
 +/6dCf+Agf15rCw8lvOsUU12St3fKN4=
X-Proofpoint-GUID: q3lo8UqrFRYgmGENRcgAFfsDDUImOlDV
X-Proofpoint-ORIG-GUID: q3lo8UqrFRYgmGENRcgAFfsDDUImOlDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> On MSM8996 Pro the CBF runs at twice the requested rate below 600 MHz,
> at the voltage of the requested rate, and the SoC hangs once the fabric
> is allowed to scale down. The Pro post-divider of 4 is only set in the
> PLL configuration after clk_alpha_pll_configure() has already
> programmed the hardware, so the PLL keeps dividing by 2 while the clock
> tree divides its rate by 4.
> 
> Set up the Pro post-divider before the PLL is configured.
> 
> Fixes: bc48641a68dc ("clk: qcom: cbf-msm8996: Add support for MSM8996 Pro")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
