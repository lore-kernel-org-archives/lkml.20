Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636E49DB86
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436614; cv=none; b=SUK8GtlDGdO/Xt4n849Z/6SUQQ+1OCJa6nSSAREyxA7nSTnLTrXm10D+EMf9ZwGf4mtt/jeH0CTfFR3qxfeUEXbuLl9BjFWydnlVZjN0RMmVrUV6x281otKKp4IEelJv7vbSjafrwQsJ78nVyg41IPCQZzhEBY6D/Z+T1DpqdH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436614; c=relaxed/simple;
	bh=l2mBviIzjsxDrCGYmNf6Y/ZxROvtLAzlD3i0LYSPYDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ar/hGUk/G23n5r+IfQ8a+GP/9WcEQ/8OyEuTqrFeZthApNDu0E1HtDtmU5WGFW82uwFRegELU8ez2Uv1+SCNEpn70E/GOHgDTp9PTDrhMKiRkRTLjPBEdpdsG8MrqvNmCH9z9sDHlOwawsAhtWGPCZZYiuHDuJ46VO+FqYK3imk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/Pl7Lyu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILzmJBHA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/Pl7Lyu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILzmJBHA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHA6c935180
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 11:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10SeU9Ko5vWjSXjWQQR8N3iT1EL+d0CVdPeApdvEE90=; b=V/Pl7Lyu3cX9mZzb
	8uTCS3kaV5siO1pTkeEPItBh6+P23hiW0JDfw7kKeUTcy69kPJdnZXRkqsYtDtV6
	ypQqwuz+LH44O/RS2BVCUbzbrvpf2ykxZgtzbWUswKHzVpuW4OSuGaJKcinpfaOQ
	RJKXvjXlYXtXAajMLQr1AFysd8cegYUTVnzSqOpyl5S+MoQk4CpgOj/VMT+UefwN
	xqH4K+jI74ma7JSqf5ciHrpSkv9FPE/HNNYmj68TNB3UA8NhUOfR9b1r9t3yLhQU
	tnAXpd1/iZrWQQRMNIemXi51NguX9axokjeT1h5vjPSMQJBn11r63glTI6Mucd0H
	S5oxtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnc502-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:56:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930bd2bfc45so63892885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436606; x=1789041406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10SeU9Ko5vWjSXjWQQR8N3iT1EL+d0CVdPeApdvEE90=;
        b=ILzmJBHAeLLDw7hSPJ3h8HWvuWy06/ncNoeiqEvBAAgoR0FMd1cDd3MnRhu39Ocp6B
         cw/yz3JziOr3JAG6BvAYi/0/wDUiFGExCmKqXd7pEieUN1bkxNmPPtCE3JK5815oIOwk
         ed6cGEf5HW2q11wcXHTHN8zvEHFMmapb6vdKgvEhRXfqdmlATcpr9kuNeD7R8PRDLjeE
         7Z/Log+I6peX0I8fJWK4kJgvGDjnBpiWq/ojXZYZETdaRwBdX0AABlw0Dvto9vcipaEn
         fyCp2D+IW/6+uB786e2eLvzWkbRzC5oWnvYNDUVdn96ESA/66lB/I4GrddmOjYOiOnka
         X4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436606; x=1789041406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10SeU9Ko5vWjSXjWQQR8N3iT1EL+d0CVdPeApdvEE90=;
        b=FmdpXn3OjRfXKH4E4NebGfTo7dnRKz3m30HK8W9AZ9fT43KwD/1zNcR8303Mn2VUeI
         twILfkWz54Y5bYaLTkSyQRH7TDPvmfQTxPBZyYNjnUlKoGYCY5iDEHdGN8i9UZwH5qD4
         rjq7/v9DGzd+SCEykfJ2vXLOOD47O32s0g1UFNhyfKzJ32WHtqUDw59vCsKF5cFPhaIe
         M+WIPxb3svC0EzZCOHmmt0OJbp4C7cLpZz6SsCudVkY7SENpxbZNM3ayGYjIAnfiJohG
         iX/zrpyQGsGYn/sw11lobdkKDU/WKj1N/DiQfDuYKTk1zcqnClDdpSADtNoO/i9Tylol
         u9+A==
X-Forwarded-Encrypted: i=1; AKwUvBzHoe30I5QC9qpsxjZV1i9KCWhmKPzqfD+IrWVVWMUsSEJHB2Epyn2cmY6KGxKEkt8//s0X57gnGGRZuNo=@vger.kernel.org
X-Gm-Message-State: AFuF++nLfJ5Eubvuj0Cetc82i5BFdGJ7V3jwLaxVvDp17dcbzRozrkIv
	Uix339lYWMm/X2C2hwHVtcceIC9HLQFlxPsC42OmKZUfOwlBRtBulf28umoi2BvEPTuuXxVy3Pm
	2ioayNPfwdzipNf/HV8b4YiIqTQ5INfpELOG4MpWtA/NpJVQsX1hukZXHbJ4WMI1ZERU=
X-Gm-Gg: AYBFou1gK2r7ZRX9/z7rLIpSDxU66m4lbWucXF4OIzg+Xdos9BjeOoJRXmr0ntbV3Za
	w7rtVIygzuHbW0VXtaT4r/4t2S/nGrcFI/nb67greXhYe6EtgPPlPba0O+A8kXkfvlQLBtrSoIZ
	QS1kTvzdDzFMYfvvQuRX7N9MGXSvDLWvSdt7FVA0zqKJsDDs2ZYBRF5n6bTtc8G3DXSTiO0Abfd
	X5yUfWNpg6TV0Tuvv6Pl1fmooCSAKJZK8hsv4N0+jX9oY3DY99QIsSaiBmc6v1SEiIA2uTxxaWu
	dNYUBSEH65TtHeFZOcOw8xQLvz/jIrk1AwkBEFVr7nC0vMaARL2RLEOqshAqfojMCrThLbu6RYX
	+f1icIynToxpDKAPx8UBdrw==
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr435187885a.2.1788436606038;
        Thu, 03 Sep 2026 04:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cb:10b0:939:6b7d:9941 with SMTP id af79cd13be357-9396b7d9994mr435184585a.2.1788436605551;
        Thu, 03 Sep 2026 04:56:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41a104fsm88275066b.28.2026.09.03.04.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:56:44 -0700 (PDT)
Message-ID: <9e6a0e54-d16c-4b8c-9034-1e682a420e7c@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a99607f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QFuAlUpucN9v7rsm42sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX7SodA2OMTt6B
 ckW5sAl33KZ5Y5dbTkLgjcqEDAtGiiihDd3lZZHh9rjeOp/jcl6shq9e6Qx2xZzvvfS/kD+EmNG
 TUZvZ9UF0oDOb+lgFfFrdwJ2Ll31WzE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfXzKL5eYSKolP7
 7pPyoK36XY0K3HB+9KGDNurZaFLPwb/mvg1AJ5uhAhpcgTnTw5TatNUgiMh7DnEZi43H/LHpsq0
 SoefJwpQMHAAFVACKhPkAcTXAxcS/I/uJbLXlQXHHiejc3IaqFAqRjQIUG71hf6VGJFEwBDH253
 Jy9uk+iOdF3EfY43CM+pxknQPlMBeFuP9KM4DtlwzFvC+g8ESftP2E2uaZN5OQG1pbcXNznj4tm
 c6HAbxfHN/TqjbxapHo7lXH0bM4LsTz1goilL/1MUIu7qd7jTyuUHEJlcHho+Fn1n96yfbDkuQq
 wqltVcaFaDJzjkQN4U8KEux61/UImhDviPfh5tSahF92WXE6JTjICzXkkVCW8Z8snSvIEVOr6oK
 GrsdR0YAcqfRa8FN8En+OZKf19lkl0JXKskqF8KKrWt4Yzk+OA+mITOfWPThCUg5Yz+QfTR2z/K
 fBuGFC0dNvAZSNjhqBA==
X-Proofpoint-GUID: m_ZAvFd7D9raw2fBMU21YW6UQtsYSKKw
X-Proofpoint-ORIG-GUID: m_ZAvFd7D9raw2fBMU21YW6UQtsYSKKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030104

On 8/14/26 2:48 PM, Luo Jie wrote:
> The NSS (network subsystem) clock's parent is cmn_pll_div2 (CMN PLL
> rate / 2); it is then further divided by a configurable 6-bit divider.
> 
> Register the NSS clock through a new ipq_cmn_pll_regmap_div_register()
> helper, built as a plain struct clk_regmap_div instance instead of
> hand-rolling recalc_rate/set_rate. The helper takes the register field
> mask and clock name as parameters so that the upcoming PPE clock, which
> shares the same register with a different field, can reuse it.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

[...]

> +static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct platform_device *pdev,
> +						      struct regmap *regmap,
> +						      struct clk_hw *parent_hw,
> +						      const char *name,
> +						      u32 field_mask)

Since we're doing clk_regmap now, you can just use the clk/qcom/common.c
infrastructure instead of NIH-ing it..

Konrad
