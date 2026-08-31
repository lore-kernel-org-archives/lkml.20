Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308E13B4E9B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150603; cv=none; b=rNh9JVEhzXHW9jyzXU5JZX6UqlU7FgWabmuRZQfl0hLeZkExK0mH4CgTtoaatWTeJr7sA/Y+evVhuL4RQEePUpi3OPU9P1jy6z6agCA4oKZ5YFamqnLDHiBncBEmjXLcQ8+fhQzD/R1neGf9XFU77EhMx7c31jkiYzXe9Z9DxLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150603; c=relaxed/simple;
	bh=G47t1WaiZyuxFvj5UD6cxbPfeaZsmxcFBeayYkSs0dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OeLE3QPh1LYjbZzVS+YJcYSLxPwKv1Id7y5Ftwfm39q7hsFtLfGQv/XnG7FYjvPyYVF0+v/l92+2iSlUiBvxwJ+JCM2iMyg0VJLMupZh9OLS6Tz2BdJ50hvHfXtn7HaAvTHMyQ12eVpHLikNkE/6NEhtUNX40vDJg4YE2++6iVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdFGgYk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EcFAs19r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdFGgYk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EcFAs19r"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bY4q1621759
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YPc6BHHIqrzDqrM+olKgR158+qFYNt8PhUYmPCgHuXs=; b=RdFGgYk7tlYg43GI
	tzqP8l6MzG7drd1R+bdSfCFCsjDWjxQxSCCOosSqsaE89awZ7LquOXQoFela2pV/
	3GGXTJ1IWBbTjvY6gWYq9KRvQml8cXK2VybJZOGrLebjV0DJZaPzNU48YXF2SHa8
	OwnQl5poxsMJx6h0hcsOUkBLYvIqBW073kWY3rdVP8OWzZDXy8mC8dP8cWNbVH/a
	LTo92+IJX0UuMR7HIZzbJ6FoV4mL0c4sbVHMkp9MlOjfeD5NnV/iUerfyjc48Ywq
	D/khoJT+DEJKLm/xkewZl+RZeVdlU+F+arl7RSmyZVsyaSGTXKVCODvCpJMMmELS
	LOyTIg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dvdym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:30:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so5638108a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788150600; x=1788755400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPc6BHHIqrzDqrM+olKgR158+qFYNt8PhUYmPCgHuXs=;
        b=EcFAs19rWhrjyRWOfgz15CgAK/BSambO1J2xZf/Mrc9UuGxKJKQt7Zy1gQV/tDB0in
         a6Q4AgguvIva65vuRO00t1ZEPJsjz4XzXFeFQfbOxblRNyq08mk5xsnnFhe6kka12cos
         UaI9Vt5x3ZcHgSP2DbesJLkFjcz4d+93tLx++uW7Y662Q4hpp8RK/wWdXSuGOFsTMEnr
         D2+LVbv98kLnF81BRgaalzo0H3OcsrukXqhd4JE6znSScDeUxtM1w/Cxrkj3b5N12a4O
         3fg2qUaL0TH1s2HIjHQ23gtip/fkl3OPQYmOLBKAQF8CD9cQlWnEAZTdz/6z4K7+6L7D
         7YMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788150600; x=1788755400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPc6BHHIqrzDqrM+olKgR158+qFYNt8PhUYmPCgHuXs=;
        b=PeRLyhRSs1jNqmOnvs0Nkd7wbtJAcGMwkdNT7LV++e6INkWumkqv3cY3ApeepfRJGG
         4UOGSftEHWEyGmls4AREGxPMeYMhXYxVjRXWDfDqYIDNmReBeruZwxBc+56h6vk3t2Ln
         lPLJQM49CftcA3priDeacF2Jgz3La7fcetH33NYYFlqcerT5T57oUr9A6ZkVZvuov5W3
         lqNi2P6GvjvDgbr9z8+pUg6a6YJP2sqAQ9kApOx68QW8kT/Hg4D8t0Jlwq+Rqw3xg1OV
         AdB+EOzvzjR8x+6jhGYAEdLoTuAPx2NK7PHe5mC7fd+mAWfO2UixZ+06IJXb0X81EIua
         GkRw==
X-Forwarded-Encrypted: i=1; AKwUvBxoK8yNw6rNdDK8zdowBvFM4S2zLZYmLubOMj6KG+I1db07jL9Zoc0Mza+aS3XERFIXsCWNIAe71GCwlUM=@vger.kernel.org
X-Gm-Message-State: AFuF++mB+aLXWLgdvsL6CTDH6DddY2ZYg7+D7LpVivLkXXFmeJypZu6A
	TOWfMz/whKoqwKiRQ8yz3pr9c8+lcqObfDzH20y+8/a5BAVTl3U5/MM0Uv6mEA4GpXC/23fdHz0
	+50Jzu2s0nD9qGbiJlscJQpaBVzDbf6dagLGwlVzD6ofTtJ8ZkvuDqCzskq2e0T+v3pI=
X-Gm-Gg: AYBFou0YG6sGcabaKeYTACAH9AvR2FTGNA5am6EUprk64f2N59uyrM12CBArQIrgsFQ
	kIhikXJg3i19WDBBLih3AkKCa1bje72sBoqERjfN4OzXr4ACP/cqYL4JBdy35F3uCQ8zJaZulSh
	qAtpkbe9ASAF6Chv8LkMDiHfxfK9jNrlGjDzspelPS2J9O9srn8kcY/WGAQz2ahEtBvXN4Vqrzo
	OVD37UQtD2uk36Zx+8MMN6vreN9YMtOe9qTGPI/0CdE8GxlTKMGts8na44wqbRffNy4nvMKe1g4
	3GhxLo/S+uDPfHoNWzTo3h3AImPPDpOXQg8bbQuZOubeoMoZJT1xvpnWr239hpkfJ3+t/3LHZ+r
	AMGbYd6S5TRSYFbBbssG+WJsVkjuI
X-Received: by 2002:a17:90b:5804:b0:398:9bd5:490f with SMTP id 98e67ed59e1d1-3989bd54c38mr22484411a91.22.1788150600369;
        Sun, 30 Aug 2026 21:30:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5804:b0:398:9bd5:490f with SMTP id 98e67ed59e1d1-3989bd54c38mr22484364a91.22.1788150599959;
        Sun, 30 Aug 2026 21:29:59 -0700 (PDT)
Received: from [10.217.217.192] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm31624353eec.16.2026.08.30.21.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 21:29:59 -0700 (PDT)
Message-ID: <43c19b48-78d1-4426-8f25-d4b75c14e40a@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:59:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock
 to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v2-1-bf6746a849ba@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260826-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v2-1-bf6746a849ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAzNiBTYWx0ZWRfX/FcHLRZ1oA+5
 Mj2zC3uJYHhNUzqT6VJjDWdjxm4rovWESxQpTLM/zDZ0f1K6I7ITdbkDe07UD4cH4vVGXH6cRSL
 0+YnsXOtmrbYU+s1xv1yh5+QI8XIceeMdNQnw4lypTPO1Q3EabCJBPvtVBsrhGfs6JTrBKTsEbr
 Ezs+sDPWOpqc0nu6e0PH/2iMmvQ8zZXVvIX/uUbQ5G6ZBAPVMjqgr1SmFDaKIzjLiO9hHj4sTSy
 yvOugzKgx+RbuXTFZhBehxgPKBj9kl1nYQD0pR3ulzyeKUtEtomuZ+DYeiAGCzHxhxCyKZ9XD0d
 waFxopGZpF8YdX3l5aIkuGz0RQ76dqtfB0auanxWrtr6wZm+BtH8sjRwFCIjxYaJt1bG0hcPblq
 RyJDX5x5EnbzOTRMitvD2DGfzdsS/XIqC6lfotxONc9fZY0OUOKkz3rvAuRZY/4IHQBHuVJP/j0
 ISIkCQQaO34q8MB9EHA==
X-Proofpoint-GUID: nxNDhVazJz5L8t1SesQJyBp9lgBEqRxf
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a950349 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2CJPG24AF_AVZppijzwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAzNiBTYWx0ZWRfX3DaudDAArj2u
 /FtpScv11VmZMD3OsrWuBbfIuNMhNchNMjpJplbuAKzjmRUXWBoUme+plwjtqg1k23RPoV6Nuan
 7HlvcLTIkIi+lauiOyjPtS2KhWZwOWs=
X-Proofpoint-ORIG-GUID: nxNDhVazJz5L8t1SesQJyBp9lgBEqRxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310036



On 8/26/2026 2:05 PM, Abel Vesa wrote:
> The GCC USB3 primary PHY pipe clock is sourced by the USB3 pipe output of
> the USB/DP QMP PHY. The corresponding GCC clock input was left as an
> empty clock specifier when the USB nodes were added.
> 
> Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
> propagate to the USB controller.
> 
> Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das

