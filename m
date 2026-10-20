Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479177;
	b=2I+ZNpsMacvJu1BMydhYBuF+IQbxUx8ND0miHKgUu/baXyuOyfATPcOmPFkw3uTU1tJ8
	 8TuWXe06HmFVdPG+csq0Ij9HQU+MzQ+PCV3CYBfwk9IsONOD0CqfB6Qf9ntCxiTNpGqH8
	 zcK2IN5VHtV9+j1VcggVa14JuSAukIButQr2t6acH6JCDegFbQzR8a/OZXbmRaYUQZZy1
	 AoOz7BlElpGsK1c/BjYaflLtpYiIdxQGT8zVhrEx2eDu+Mlv1UyiA6idWUyTM+2igUdtJ
	 Pf/9eYfg1wRArZAtl6oTcnFT0rPc8Itb5KjiEp23nRH+W22A/uuqZn0oDmU50VKfTeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V0N1LqszfxjpvXwsaDnQpJ6iNycJfBfQHLhhQK7bbK8=;
	b=c9jMLvRXW1nzh62n/i1Wi8YFnIKp+EUykI83xgEonsjWcz6w0EbFSgTB1orhizgTAWMj
	 quYnnyC6C+H6BvR1Cce59gAEMBAt5MZMSuBhWlR0Lg6rX5FlMt15GmOMo+adJfsF6Jw7T
	 TJA/4gxhmUk/4amtPpm2TlI2Ggq43HcE20q1RCpCxuuigdLcHIokjpxABzNwo3l3cNpUU
	 vsZGMvZsXsI/bqI5hJclBwKK8e5T1z1T6vEJ1j1nCFPfQpNpgVDK5rqucsvSgIrugtSJe
	 XQo1JUF8QAfXtgBwVdF0JQS43btZ0OaNr2cyZVf7/3MF/lLlXbH+8rNoNEwSrK7uAmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kg8f5YXN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IztpPkcY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F15A606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F15A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kg8f5YXN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IztpPkcY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t7wl4177751
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0N1LqszfxjpvXwsaDnQpJ6iNycJfBfQHLhhQK7bbK8=; b=Kg8f5YXNqPlZctcT
	2C2MypGDK7FAYjVts0I4tpyRyeFLGCIET1qLxjOKmcD7mjQB2qm9qIYIiVFMYAef
	T3vSshHREANE5aLF7xvdo+YqEMyF/VOL1wpYjVIAeEkAN5yx487EEA7CWt0DjLLS
	Ca+l1eo9tSLrRc85+25hiSdCDzG2r281BSk8G2SQUwZG/DhcqFme1szZ5q6ogq+F
	Vrqrvz+ni88e1tWOL3PBKClWlzV9ZQVoQ9Au5GNObKrvNMhSpp+Kt7p82nGFsKB0
	XShL4e9JcxsJfItyg4obWhe2zHb6D7w4RiEJaVhnt6slhfweW7Kwtl6VVF5a58uI
	g6UeQw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n17ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:52:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso55414685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479175; x=1793083975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0N1LqszfxjpvXwsaDnQpJ6iNycJfBfQHLhhQK7bbK8=;
        b=IztpPkcYzlEEg+lvnUPWWSEAiRolAxeiRecV7L4mBqKIgtoSPnBogBA7SWFg6bIFKD
         1m8odAEE6UG0MqmQNHyymsWpxtcD3Bxy1tbI/L+YIYc9nX9dc9t7R9885SWJu2zwvqUa
         hKR+iGGF/PnBxzIgaQwFqeRp9H4126eGzLz9zgNdnrJN0RvUxHtBLCRZiGPyW7QlVn3Q
         zxVFYi/YLCVDpzKvXDqMpbmf842TaEFCFoF4xrYMq6YhFgESrrJHs7OEHikddqsULjZk
         sW3PKSCkc5rr4kfyIgZ3xQi3mB7TvW2uP/ytHlfEMCllX1UJY+sCtK4J/hXvyvAakcne
         HlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479175; x=1793083975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0N1LqszfxjpvXwsaDnQpJ6iNycJfBfQHLhhQK7bbK8=;
        b=KDJM31daYdicONDWqg+q3ewM/weob6/SKguiJ8oVOZjWft+8cC6KcWSeV9RJhs7RzO
         3du8PJBx2IQrKqeUlaV02AzwMcy1KZGulKif8d/oJfK7e8IAH1jOgbc7FR2X0Am7IY0S
         hkv6W+OeVc45TLscPeTLUV3+u3SEUbk/0LvLnoFXj6Lo5mu5NbsI1dr5/IlsrAvi0qaJ
         dqqnVC+cZDU82Gmr4HrH2hXPcLnev8MigEQ1G5DjFSEBpFDFlh0aKJaRfKFKiOrgTb/D
         eafdB9hbHtUQ/6RL0x5MS5Y/QAGj1wqp2/B3UZhxptdCH6G/V1DtWq8rh9fvigXiIIrs
         murA==
X-Forwarded-Encrypted: i=1; AKwUvBzRbaWyI1OkCjJG2PEFQTNWLjot/a29LQNDMAHlG3pkcx5NLRyIBqXUfE374zlNWC67lEtj0UnxNnD8+Vw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM5Zwufxf33XmLkZ30FaJio4RjarwxKfZ1e9+LyvYGvBnpUIsH
	05hGs5tYZ0DAulZckZFhOlvKMHB7PEpS8FPRHt+c6pLGNubsmNM7HboxEAhh1H2EeI8uTX1/JLA
	dfnTKNab1Auhio9scQYo5AmHu3f5ibboMTNLHWZE22U+CmUsmlyPcN9yKZF7pUDBjLew=
X-Gm-Gg: AYBFou0+L+brldiDtpuYpLBGMnV9fnNrDbxc6vE5PnlqmaF9LwpE+d4MtIDA4/NJ1b/
	fnfDmGVLQtNsBvJ+HmC1YznAU4swBZWnUUxtO81Kz623frnxq93ttWAdb9xjlTeeZQ2gfFdSF5M
	+M2kv3n1nMQEc1B5JZ8izs43bZfROny+UHrXA2RpVo2+rPhXNrz7mgBhGUlVWYlipolDVtbTgZJ
	MxWf5z664OLZDHFzasNOO4h75NQSVkX9S6qnjwX3QLYH7D/i2kobRnS9EyGev01pMzaChVXkfBz
	mlDy4+8Cqd+BX4s9Z8qPtaXl+9H9rt0UvnMgq07JipNBhS7QT88xZgwHv6+LwmGNJJPDeFH+rz+
	zlW4iDcOaUOjuNikdlR8s9g==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1890993485a.0.1792479175319;
        Mon, 19 Oct 2026 23:52:55 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1890989485a.0.1792479174823;
        Mon, 19 Oct 2026 23:52:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9db0sm4984385a12.33.2026.10.19.23.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:52:54 -0700 (PDT)
Message-ID: <c3ac769f-59be-408a-81c8-9d6a2693d3f2@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:52:49 +0200
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
Subject: Re: [PATCH 05/10] clk: qcom: cpu-8996: move off the ACD leg while the
 PLL speeds up
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
        devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-5-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-5-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rhZrMlxU1nsuHSPrgOSeKcxvh4Suul3N
X-Proofpoint-ORIG-GUID: rhZrMlxU1nsuHSPrgOSeKcxvh4Suul3N
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad70fc8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-GkAsrVB-0cJHUZqiU8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX2G/pkHT8rRjj
 1lJrguArPcu4ihSUVm9fahTWZncJyz6oNlP8h5TGZqUVDIBAAtxPFqYYpnOr4A8ujAUwi/m8ER3
 FuauXyyUvc+x2wWkVanj+saoneJdKpFRBrTL9h0AAaCc3rVSNbLEyOiPimAm2/Jl3g8+jPWZn7T
 5FrW92jwpDIC5FLZYO2L0Ss+pgZEdvg6Myvn0yPAkT0hNfJBDzsVBYw4Mbb7U8yxYq/IW9/djb2
 C/hI9MQVR1/N6fdxWxfXfTxI3yFpmLkOg5x+lVH9LwAz/2YMk3FTxQGdu+85DoH82Nbp/WYDRJK
 CR0BjrJgmUKeB+6DsQANJatqLalyWztzMAxm/JrLFl0o8ae3HvZ1TSt2BnzSlc/PNxaWa1ZRbMz
 MUY8oT/H4eelcFq0WaX73EqyCRR4C0qs2JfZZFYSV9+42VaqFfeGZl14AIkDShMd7CoRuuI/m94
 OEI8uqAj3uXSoqOIYsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX5ZZ57G2HDA0Y
 jOxzEFC+54+UbAm68drc6KDpDjy190sTL09nMbuokbJU/PAcWgov3GxuIJwlkLUM6Wngd3o7+1o
 WWMb8KAYois1BOl+/gtyFz33INjchDY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> The MSM8996 CPU clusters sometimes run at half the rate they report
> after going up between two frequencies above 600 MHz, and stay there
> until the cluster drops below 600 MHz. The PLL, the muxes and the rest
> of the cluster clock registers are all as expected: it is the ACD that
> latches at half the rate when the PLL is reprogrammed to a higher rate
> underneath it, and selecting the ACD leg again clears it. The driver
> only moves off the ACD leg when going below 600 MHz.
> 
> Like the vendor kernel, run from PLL/2 while the PLL goes up and return
> to the ACD leg afterwards. Point the SMUX at PLL/2 at probe time instead
> of XO, so that the cluster does not drop to 19.2 MHz on the first such
> switch.
> 
> Fixes: 03e342dc45c9 ("clk: qcom: Add CPU clock driver for msm8996")
> Reported-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

LLM has the following comments:

For old rates above 1190.4 MHz the SMUX output is old/2, which
exceeds MAX_PLL_MAIN_FREQ (595.2 MHz). Downstream does not do this.
clock-cpu-8996.c acd_safe_freq() returns freq/2 only up to
1190.4 MHz and MAX_PLL_MAIN_FREQ above that, and pre_set_rate()
retunes the PLL to that value before the increase. The comment there
says the main output is what keeps voltage constraints satisfied,
which implies a 595.2 MHz limit on that output.

Up to 1190.4 MHz the two approaches are equivalent: both move the
cluster off the ACD leg and run it from the non-ACD path at half the
old rate. Above that they diverge.

Either clamp the SMUX choice to match acd_safe_freq(), or explain why
old/2 is safe above 1190.4 MHz. The second needs the hardware limit
for the non-ACD output, which is not in the patch or the cover letter.

Konrad
