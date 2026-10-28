Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192522;
	b=NU6O94nhQd4RTw831hV+WRPAHbp1B6tniVEEIXR/pLqhfmr4RMf/1DUfOFrwXqicCzZE
	 irvM5Kw0MVdgpnLaFZQCeX+jk/ulbrSSYEgyfOV8lJ9Bwe3/EBdRx7rSw3Pbi5Gporx9u
	 Cj+0h4w4mW6A4ZkSDhNSXQHY+uW68IejWCFS9bNc2ZAycvRppYe5yc8yVjuVg8xveRBg9
	 pKD+mgrA8cwHnJKmBesNxj1Zb7HNW6KNbxMeNBdW7V5eOSDray4Ap36w9TpKVc71MsVII
	 YlN2H5+fb8orMne82DbZB7uf89XD1ncgizbOblewr3HfO13IGE+ThRCJ/mzhpn4WSLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
	b=dju9/IDo+cuQ45pL9eTjoZgNniJp/RTezstkUTQOyCfQ6/D8nqTfI/Iq9V+ktpwK2y+b
	 f3n7lKtRhCebRxSIyodb6HAIT2Bd4Dlg6y6Hix/z3Em2kgJbTgqXl1ZKIFcdthmAlh2ff
	 zbHocT7yn6pYIRTSwS4k8GAFnSa/aV+Z8jxJGGcYFOda1OPldLfi4OgCWaFg+gwLXSSZ4
	 5NBFwDgq3UHS7UQGSaCSXVB77Rj+tPSbvc6xjA+srk74OZ/JR2Vn0aAhf4vLJZJ3zCwZL
	 s7QDTlQOWCxHKtbLdR5BBZdRMsMcTHi6xY6wUR1pAzNybn6nrqa19ZwxCJUrLCNo25Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+FumsiE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Wr/5bDMB";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACD6606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ACD6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+FumsiE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wr/5bDMB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe3VD691873
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=; b=V+FumsiE/zr12OpI
	DFvA1swVDcmHoCFSMeuxf6gR1hYAK3aJg97AZw2yDP8OeufhK62kJmBEp+gboxx1
	Xi8hsGiR7zyDrktr8xN1m+uBKHMwOk0wsVM4aOMATdrICf0ZBxCkne7RMXAuFAel
	1VqbuFP5so8wBEgNwGEGTT62Ja/jZflNjlLHbbs3hzqsW1EnUosHDzGsRCRCTegy
	lQEJAimnmTgBR3b3cY61BBkHS69zt7vwihB1XmsBSxJ5+ZO2Il1k5qFEQFIBDRU6
	FV9pQGaazuPUkMWvLM4kNU+rv1EWa0FWnbLxg1cUjm4II6mvSE8yAjrkmjcsi5yH
	96TlTQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be2hny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:02:00 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so82417e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192520; x=1793797320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
        b=Wr/5bDMBtcG5FOGPCZCv3yacZws4s5vIGwSfWsnAMNSXiL8MfSAoPDdN68AqIqzz9N
         EWn5GVTHf9rPTdP/SOxizX/2BGU8T3njrpZvHx6+XRD1MaMP/oP54Njc1fcBsDs6toSc
         iAV+XRYNwWtm9WckBmRbey4ObNvVkgPuxvxryC6NZaHAFiuKJ30iCsC9kxhqogtXoh0E
         1eBW3bCbRbAktrJQZlqEcczrbCsaOTMAJ1zJ5xAaHdUM+qL8qSFwLLPxLv0Th0F1ikwB
         VcxxW7NQQJt37/a8e5gAVj1By20037rP7fS3euHyva3iXKFtX0OcUuMfheZd7GMZRCED
         AMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192520; x=1793797320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
        b=Thc5QvWtwZd44pN3q/QA3CZlzAiYjp/hEHJttt29pVqdM4bZEngIlFmqCQemJe26Gt
         2p8CN8Mjw0ISOGOMlD6sjD6gMBX3tqfWfs9AnGBpM0EIGkRnNzfOSZ7Yt1wW3QmvBT5x
         be4tLEl9p3NpX5zjT69IND7nhKXKLL1mhZFqotWHhmptPFF+5C1xvKqiq2RJKF3d2ehT
         ZJ7yPV9Vp5OimRQslUq4e+7r2mr0ozmdx3jpEA1kMPpL/9RfJJz+HmgSoi3viEuGcapb
         tmxpF0Jgqw7Es+rvMt+c3hd+fVYJAmD+7V+hpe9ok+6NVdqbPlqBGTeEZv1HwgZ2E3UY
         RHQw==
X-Forwarded-Encrypted: i=1; AKwUvBwO2B09Qd10Obk4wcqUDgosCUuFsBbsHyRpCBAh8t3Q6D4KGCJDqbwmCIn5aobOPTBFtUBPpqN2TvIkgxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1gayWqJCI3AMBfSJ/v5r1vF5JReuwiXGTA2Sd/oz6LMEKseF0
	5hGscHt7PrmYYR2TSlu90tYaAVLl8cqN4z6tO0Q5ZPKgb0iD3d13hACK1urEovRV0npAkMA0rsq
	0AgFgb65om414WOsO2PT8QI56gyy5hKfdLcC3pRSYddrYUWN6ilxZTd6pjBNxRcON0z0=
X-Gm-Gg: AYBFou0LQy6Ik18WlqLEKhWky60DZwwdYVJ0MmehHF6yR4Bd2HD+Ko4159vrmOhLh+T
	3/AzJk7LZUkzXgiiv1yaQQW76YWVoHdXlUIwrbAYv/AdKEXqzqFCvGPrE+7dQrcFp0NmPXlGH6q
	j8k8TTs1DQOio+kDGMyzYBgvXXJiSS5QzQoLmvPakgMgLqLOy8rViWlN2BM5p44veVY6ILEhRHl
	ESjwzcADerOLhJoTwNguD0DdZlmUxneHmNz2IQ4bWKpc1tNMFIj8VDk17yjM0k27Mc8RiOI9Z+8
	zo430ycqaa4ir6TS5+71I+zRUP7hmjViAsBFnKJCwDMRsoXZ+CcrxziWZvrNEDcQOMsQ094IsJw
	5zPE+oaeGkFQvvVOt7C2KJjATfYEWiVh8OixcRWlo65ZX9JyfRhg8K4/OWpRxpNeDphh3n+4=
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr883487e0c.4.1793192517367;
        Wed, 28 Oct 2026 06:01:57 -0700 (PDT)
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr883211e0c.4.1793192515300;
        Wed, 28 Oct 2026 06:01:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4eabadsm610575566b.14.2026.10.28.06.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:01:54 -0700 (PDT)
Message-ID: <4b373217-d4ee-494d-a5a0-244fc9181b75@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:01:50 +0100
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
Subject: Re: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m9mcVOfiFYDcrNnaokvKURnQPEm0s52L
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1f249 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IYGMUUFy9tKC-wNfIDcA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfXxHmH1wdtoDYp
 SdUpuWJs5psyOJ9IlAuzlGw/tApH96WLDe9R3PZc/+tvNpZQRpwp7bDprxwCkYHnK/PlS9d9+m8
 gll+6ps+VYpTzpaqCZoMsBUlLBI80b8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX+MMGsPyECJMG
 ppZPA6Oo9fWpl0+BrsgN6eNtpmMWN6AsvhT7Pfpp39S/M5Wdq0GVkVDmyyTp/lMiwMU5mevGfzo
 mwt+zI7V4dOu5LDo+gYL6MBJZO4hgKuNtU/rL9Vkp/EukA/qjif9Sc8yVyfqUNR8OL8Fkz1+hJM
 p/N3nR6hgGdN27+p/CbO/xi9xPuJGRZ5y5ZVy0BSpNKeOiyZrXlkSEKpGgvxKp5BuhGoMx5qgvP
 3D4HOEHWxAQQ18l4FitGREdtB1tB0rku7g2Vd6JjoaSduu3mH9eJouh1mica01G+SZzq0tcIkuC
 WNW+KSnhPMJw7YiiZXdrc0ULhGPAw7N5cVarxpetMsWAD6Fk2kjDhTaf4293nfnJqg9YgNpb7qe
 V/b0/NpzlWmZQ2jlv01PJtOVIc0zGSLDL6mOgWT6nImx2Oj+jt752I6S2/dkklc5Wihd5y1keEz
 oO8um2X37VznYK1HKJQ==
X-Proofpoint-GUID: m9mcVOfiFYDcrNnaokvKURnQPEm0s52L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280051

On 10/27/26 7:08 PM, Taniya Das wrote:
> zonda_pll_adjust_l_val() obtains the integer quotient of the requested
> rate and parent rate in quotient, but writes the requested rate to L_VAL
> when the fractional alpha value requires rounding.  This programs a
> nonsensical integer divider.  For example, a 1.2 GHz rate with a 19.2 MHz
> parent requires L = 63, but programs L = 1200000001.
> 
> Use quotient when calculating the rounded L value.
> 
> A GPT-assisted review reported this issue.
> 
> Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> Cc: stable@vger.kernel.org
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
