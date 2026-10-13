Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D434C2278
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889039; cv=none; b=Q4/PpSnG18YgvGP3oMUOwx7D8pDXiXUPa2Maey1rOqGSMSP7IwTJU7fOKy5s4tzL8Am1jLmisnsFirhr0afp+xxkTyHekptUKKjer5F58L3/K416jzuWLDa1OxZM0u6DQP1jV1Wk5Y/1OGVavP3kGCGEHzcCDeOlDuqRQweItm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889039; c=relaxed/simple;
	bh=oFzLmBDZ1BZ/S7//QkibmaQqya60kfws2K20oEotJMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdAl14Z7d3OZeugeR2FzcfxNVWA+kLZ80yNYMuHgWgjOjTmq/TQAW9SJsPsgNx/C9nMIiaismIRLVSBhAEdeKAnBQ/k7bqyRggiExJctwMJIwaHJRyX1WcI7RJtKK8zqHY8tp2c9WqZ6FbHV0thGB83YzcIR2biWffmxl2lbwyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH1HSja6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIizeg4t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH1HSja6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIizeg4t"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OWpj015194
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riNBUs4T/qm7wz/92/UFK8rqhKXsDLbF3jstOsmwjno=; b=RH1HSja6OzwULZOW
	n+75njZxui2mLMKvE+9lWApKRd/Tbf6gBy0ROetmD5BGOaF+zps+guwsEVsPnybd
	4rTQ0B26ue3XCBvmnV39dH7eDhT/rK0hkfufv+DvNDkRDqur9nqZO3Li63raOBJo
	81lLepfchxAxTEohy25WIOJalI7hi/cIEU0ZNStvge34Wv3NKmomoIpJDn7DKYh4
	bHOknMC6Pkvu3az5oF5c7BaVlxRsRbxUu96oHp0QiMTCeQ3wiGx7PCI5RhLbUD6+
	xTFij4jZYcdfVlQz6IhHOuAOfHjisVU0b/nTTmCkz+tVyRH1kp6nskL8DtAKKiAp
	emrhBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugvuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:57:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so48935385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889033; x=1792493833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riNBUs4T/qm7wz/92/UFK8rqhKXsDLbF3jstOsmwjno=;
        b=SIizeg4tosgM2abIM86c7IDwAnVkLhauK59bDZfCmw4vwfmHdOP/fw7y/DAYerCp57
         Oz1lPBWhQT+vCdFpNd+oOrJopSKA8rybsL53emIs0DnxvJq2C+FqNt5V/nvAr18QcKJA
         7pixrShYbXkY0QYT+JPHy3IIJdBv2uS/QbfgIxXrBmljMntLIZdmD3ZtYpsWfSLyobbh
         +8nHBg4ma6jKX2tORKvMupbI170UVCeDJ/x3mB7sTE94FkI1wVTmaf19HWbtzJXxflRI
         9iIXfBYUcbbtH4lZ+jh0NuG8cEmpmjk16PxAmOTDYHkMq0Q9Wju4fV9vt9r8kXCuASVk
         tn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889033; x=1792493833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riNBUs4T/qm7wz/92/UFK8rqhKXsDLbF3jstOsmwjno=;
        b=s6qPg4VCtRHQyTFUMeF0sKZIe84KTABYK2eUav8oWUcN+JiVYNttprHPmQmpixLmvg
         wD4CkXo11QUcU29hjKb84sZelZtF6EaQWfuUFCiyj1o0S0UuVa00RYQDNpkcnT+f7iP0
         5y9K/y7zTXe5IcmfO3aaHRJpQQzxidTucHAMmnx6cYMxnIhVs9wb24KKPimw25XD9nHn
         niHEB26kR9+FQ/Gd8+TvokheX3VcAaQG1F5dVp4EMRLnITcrZD+LuQbAonxzTIJ4peDx
         ijcrOwAYX9msXMI46SgVLrOykaBp17OcX6MbYfdasi5OTY96L2v201i/Rb6FFYictYvo
         FgLw==
X-Forwarded-Encrypted: i=1; AKwUvBzlHtdxSbWzU8YM2/OmCNhfJ4bN5fQrpPKyyEFni34poNvOgpFX+FCFnBK7Y0fYt1moUXM5HWR3FI04nGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnV3k7BvTJT7GJq395xH4jcZ/se7v/YpSiv8g2C5L3PH8PBwbn
	59klWmctH0mKyACbiTR3T2gKPvuUtxGiHnj/swt4MwTkQTDtfdUGlXS2IxS5rutrG3yrHjHyJKW
	df7NtvsGxRiaqIXMaEMgEzxzvz4AGFVra3tDCXEO+CXvPt+SRVACbUoOVErU5/95gD1aeAWQkmj
	U=
X-Gm-Gg: AYBFou2EBGqAKIgmC0G6Xej8UsWv/Ijn1b83QmlJrhaswB1K5Vx8skNW+dC+o8iAsVc
	x/L9iEH9Q3MQu09e4ia9dlnNBFyLT0qGkfV7E13AwHrAFrPwoby64EsCAsat3fUsD3Ld4LrF4mf
	8ltVBhCLK551iLmWHZ84rA8ByNuArYr8DoHecaJ1EV1jL5AVJfy/8tliHNfCsPycYpALmgRrSve
	jarG8PosJ+EoJfsQeUJTCe7KVcYwfJ8FhMXDRVtWCvGPo9v+pehuU0bMDJDHqYK8m9b+jwNoOfk
	ExS1B0Jnodpf1+yapXlABdPcR/Wr6sOH6TQp9l2nC+IWdDMYbw0qphkvOmlRUnsBbPen8hS4CwZ
	W9lbOVafkESlfu7atKW6C4w==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2382464485a.2.1791889032621;
        Tue, 13 Oct 2026 03:57:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2382460385a.2.1791889032022;
        Tue, 13 Oct 2026 03:57:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd395dsm6278732a12.17.2026.10.13.03.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:57:10 -0700 (PDT)
Message-ID: <5fd88970-e8fe-4dc4-bdf1-f0e9447f4462@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] phy: phy-snps-eusb2: Enable AHB2PHY bus clock on Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
 <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXwnZkkJcG99Vd
 Z8shjzh8KsHu30A5rWpaTfpehPbBqIGEAdU919wNO0uoTOgiEKyQ3bOU9cCq6fpBR9Mgvbw596I
 ujVXZzXbLoh5krE40EdLpMo7+8XhzMq/HbdYypZQvwKMGN0UJ4vWZSqxQ92gIYYhMF1ZapcBM0+
 1h221m4oL1YWbM3Dg1SX/JaZke53bWu904xKbJs8qHQpQTl8v2t9njHvd8qalJ2QFbgZgtXpaxJ
 dTCC4FKwyouR/TrKr2S8ZoZolZJstc50RFvqDb5HojbAI0yAzUMzwoEBeO4SPiqqqlqa1u0eVmq
 4GTdEP+Qr/QH3mAoKl5oeRnhq1nub7kqOcCLTBNsxYtbhJu1bqkcxe5AkV7rHTCMqdqCl7AZa1O
 U9/Jl92ba0tl51tABRPWrXGykTgPDnQZD7FSIRy3bIP9IAarAHAb+KzpAXy5pBV9rM+y5GF3zKV
 zHtrTQDp2qyakEfA4GQ==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace0e89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GgWLzTfdAFqkLYX6_IEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cPc18w9y3tyZwxG09-CdJRXt2JjR6teL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXxnElOyOJYlmg
 ZdtRElqs9074pQXvEabyBXXEK303TT5L21+D7H/MvKMbfW/2hVI3Pq2/4xCeQGOwOMET57Y8IUS
 oghSqJg8OtBHh14MTJRatBjIIraTgQ4=
X-Proofpoint-GUID: cPc18w9y3tyZwxG09-CdJRXt2JjR6teL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

On 10/8/26 3:50 AM, Shawn Guo wrote:
> On Nord, the eUSB2 PHY registers sit behind the AHB2PHY_0 bridge, gated
> by NE_GCC_AHB2PHY_CLK. The Nord PHY currently matches the sm8550
> fallback, which only requests the "ref" clock, so the bridge clock is
> never enabled by the PHY. When nothing else holds it, e.g. on boards
> where only the USB20-only controller is in use, clk_disable_unused()
> gates the bridge and PHY init accesses go nowhere:
> 
>   xhci-hcd xhci-hcd.2.auto: can't setup: -110
> 
> Add Nord-specific match data that requests both "ref" and "bus" clocks,
> reusing the existing Qualcomm init sequence. The bus clock is enabled
> and disabled together with the ref clock in phy init/exit.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
