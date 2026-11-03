Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699732;
	b=WfawVRm86u27MSsjkh563xDDqhJ9dpy4uc3tow6dONt/+ICqWE/T+B66qGqcAyhfne1e
	 +1uRRS5izxWobuI3s5INibRFAuuy0sxakUQJrEidkEzt1TN5BT3VLetZVQU9ZaKvFyr8i
	 UqWIKtpqIJhAw7xQ1Dmxr6Wrzqe2Cht13ruZ6bFjspk2Q898yhcAj+CDhXfJPO2Sf8QiQ
	 EPxSSjyGLV0XSP1GlyUnP82qPqpDgfyA9uMRfYna0r38HnXQW1ncaMk+aJ4BkhwfRJJn4
	 GwQdEDyplIqQE4me1xjw5jnrz5203nPcZZMSlMjO0DICzWTN91i5Mi956KhhAreQJwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
	b=srpxeS3pP+bEscOU17ZbKUx2wsTrsZQe6Q0Ge1+VGAHeSXdlWWZE7o91Jyx1HzqtUXV1
	 neP5MiU/be5iZewzZq6+JmoQrrLxpGLo/rRVweTjpRMhRFtBh2du1CiRjKHjCfLlkWKtN
	 OmMttboDVETh1jdZLzXj6rM7F0X0qoCJ56rIbEMHm1NvyepO3zdcZJAjnv4fBXXSbo3Jg
	 Im4x5MlHJfDRlqWw90qeDlZn/iLk3srKH9+5rYgdyE5r6JeEyadoJXIH0Apucwi4ijgz7
	 dkUPtFfY3RgsGf2h3Wq3jLTNS7ifsgSKZsR9xePUVVcAGEwl2G6T8Ntjh57fay7RHIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glhrtAHh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ty7n23cr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3DA60A5BFC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D3DA60A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glhrtAHh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ty7n23cr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352k8v2449000
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXjhq80fJFnA95T4d1bBkkRW
	6z+GaA4781tkMP0d2VA=; b=glhrtAHhzZLRW+IrXafw84382U0f16rTqbiYh4Vi
	7+Sf/7CsEBqESU6eeIHRCPw/ONkAz8mYPo4gx2DCW9rLkzxiYRROihFQlNpEMffc
	hUAYscpA/6kXrZ7stvW5lVYHR0sd0IUbt8WX8gaqyth3dB9IHiwy1Z0syKzU0IvN
	EmoICur/+6RJGX9LhsXhlDM8QT67Yuqkhaw7arPd/H1iQ5JltRZMgABJoos+hNJ8
	WGWW1ZqNP2iZHZND0eS5t+IYKVi70TIGkH9dulJcS+5wdwaaBmpi+y6+qB24A4C4
	/r3iNfBwUI3DEEh4jV1CWr4YmpNZGy8lnQ0ahSOiNb5TXQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cs423-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:55:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso432935137.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699730; x=1794304530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
        b=Ty7n23cr7OYmfDt+wk+54hQv28oea+opR1DYhddK155zuu9PX/BylhjCEKxfDOIYjR
         g5Ia1gxe/vFsIDf3epARfppXirgRu686Jc+GG845sU4yW1WUA76qHw1sMKv4JfFvWZ50
         5S7gx4oNzEa/jaC98UJN45AgzY3yp3j0LOIJlpN/alTBOOBK9gf+ruqI27HVLzV3LxY9
         YZhoEQRDsZWwup5RTeBPelfvmI8fgCF0e5XfFmhL12zi52UUuiFZBSItEvAkY4f3Qt+U
         wVcwYwbrIDMdXVJvu72wslJfeMIDSnYoKdzh1rXTMWiIorld6WLS2xUPI/nI20h79+dQ
         HAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699730; x=1794304530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
        b=1VGT5qBDFuCES4W4W6vzfxxVfehu+tnG+8UVuv38fcVW5vWKOLZHYm9XOi16n0XB4S
         A0F2QNWMA3qjB+khhGqTUd0neQSJYX0REkegT5yIzRVhmls6Xyv0/JFBb78UfV8OaWVD
         tU+zK0zKOiDUFdeRf0XdcMi8mjars5amZqHBNb5g1JaZ29qFwcvvcd8gYbNECs6AZUVh
         AuDl7rY+6QhTft6WWNc2PQZ5r+y1qhXUUaLYBkQPb6gfE49cZO26hMfU6aSXM1JQHP1s
         3O//aVjHpha8qK8JAhe6L+76wGyHtEAG9YiqjNiQTf4USC1IUMaWqYKEOpCV9ICv8E4W
         Ll7g==
X-Forwarded-Encrypted: i=1; AKwUvBx5uwaKq1aqPzRh2bGFVTL3wbOjvRKvgzer9jCpK+ZG3IgDx1GZERuWTacoBa3u+ZsdjwaBaErGJFnKU1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NL3nKlDXRiVymUPGKvfvCc7mgPN3pWcJzHvWnoW72Qi8skAC1
	dfFNUGNbiEBabsw1LPbF6Zc9KuFTujhOXFv/EcHJI1H9b+/dzusUDbbSqHVJcFmDGELUkDVqssz
	AkNCkYer7+bO43PsGmM54JumE3v5v7wX+n/MmIE6yjGrZOafk1b+nF3/h69y5AQWYO5U=
X-Gm-Gg: AYBFou06epLKWUYrDTMjYoH64CSQEz3hIESOWDY5Fme1OI1QCHTOdv9s0xyaPVyFmn1
	Ruy6gUaxu40hSCejjkGohGUt0mE4eJxE9Akpi6kEOziqNqJYIJ+vPZviT5uKoioV4d7VR1wK1ru
	n50gM3qIqCidArZPfcuVGq80IYT7FHfIZJbfFM3HeIqaX+6RnS/YWPxab8gHpJwFhKgX/Lx+6so
	/AAe4Wei0drlGjZPHK8xSZ5vpz7pA9LL41mOjQyWcK+G/gJ0z2NQ2hoN86aa2EFcoL6Fa7gpLhs
	bFofCD0NXQVYRumtU8jS4tMM2rNRdmcy2lMlmI7TbhfKWKQwHG+7LquRrvECPsHChSApHeO0nO4
	gKnVOQxmtxX5zuORZcgRJNyC3vX45fvy9m+n4Fb3AFT1Tw5yYDm6sV213Ha0Mq9A=
X-Received: by 2002:a05:6102:4b0d:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7d0542ccbc4mr4873291137.28.1793699729873;
        Tue, 03 Nov 2026 01:55:29 -0800 (PST)
X-Received: by 2002:a05:6102:4b0d:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7d0542ccbc4mr4873269137.28.1793699729142;
        Tue, 03 Nov 2026 01:55:29 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm23166849f8f.56.2026.11.03.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:55:28 -0800 (PST)
Date: Tue, 3 Nov 2026 11:55:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
Message-ID: <k3pobjkp4kzshfftvszrzc2jfdezsd7hauzzbhi72gfmyisyji@a67eggd7tvxk>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9af92 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aa2JovKfeZIn8VmDcRQA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: rgLtUR63lmRN1TkBHWp7OqMM1jPGiUR3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX/HzLfDxPCf7A
 xh1FVfg/2HOqmV7HespENARYhyDD6cIrqruVzxWQ7567b1tWnjUDobs3e2LhBak8jNSDdmR3dHb
 1fw2a0k5aM9ZhtmJD5q02HwH5FRdHOoV9Vjd3hTVJ3hUXeMSSZQoYpvoNVy4DcWuDgE6p+ZA9wy
 n/Xnxcbrp7ac1Fwu5QK3dV38vC38VBl8vvdwlVavJTtaH2aHFFDshm15fo6UsPXva5wGg0Zv1n9
 pHjCrs+v3d7Ai71YYrs+Ii9psBTSg8uY0QymozbhdeLE/rQJ8z77imdE6trOyZpN6gurnZdTX4j
 6Ci6FMis/pNG+5k3X9wB2aHVq5agv+5urgJbHbIn9gLinHPoT3Wo6AuZsTSyAy5lqO+WN9HfO2P
 wlLraTpYhoD2/RvYIq4DglyuKEKrgfpb7AdTQoFKCXP0J0i369QMcjO6i/2TuVSmC3hZXEya5FB
 A8GI5c0sV9Z2QuGpByw==
X-Proofpoint-GUID: rgLtUR63lmRN1TkBHWp7OqMM1jPGiUR3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX0+AWiaqmmeRV
 8NKu3pfn7HFCyd0rlvTaooTUTkvrPVKdUaHQJ0cVWH36VsKdhEfSJh/feFjehcUKcUhLXRVlijT
 xV/dwetxeDFDAShWGomgp4kMeawowx8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039

On 26-10-27 23:38:26, Taniya Das wrote:
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

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
