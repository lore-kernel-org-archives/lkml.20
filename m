Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082572;
	b=iNK06gyjlmFvX0wCB/TBzQ0M6/pboF6fxnKfZsha+D0p6fLPQ3diWe94h0wNddtvFwE5
	 vEAjKXTMRgZMZYLRA6nKWlSbhzPro9Retdj2ivxCHyfkXm1aD9vJGH40TJRuOMs9FsW2D
	 8kDwDsUfI10nIuUcbQjX2DKYkLTYQGV+pPgxoCJWIhoP6ueAafmpIKHEnPXS4fPpuMh58
	 dHXrZPvBftiBGOs7Ih8cjcel6ESbkWpSbSQwmwdJgfeQ+wvQ4CoHl1c3qcCwemPiJ3fXH
	 9Ks90AquP9g8fJe9hc/NSHx+agBoAaVdxXD6v8ZF9AIZI4LEWAFGWrInZrpPxv3HSAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=;
	b=FO5wim0hA6Mm/Fkal/6RguOmHYd5183LsEVuc3/wphQKdFBgIrpwKSFDZx0KnUIjQgtL
	 JGkTB8M8G4j6us9RFaRTMYicDH+bYrwLhb3H9zzPBC98SUShhStSgmNVomyGrHQuBAWBw
	 4Ihe399qxKGFqnSjN5vSLwfgn8KPQx15S8zPFrpYBdR8+i+koHY8X8X8/eeR93Zo9cbUl
	 hMll9A/RMD2wzZNPsJoA/nDWg3s7RZAgNfxIrk9jkkm3usv1Hs8SdqLjxBtoO+9hXGnyv
	 HESpSge4YNLNw2q1k6gzhJp9Q3W/AWdCSrygPmrC++UWfbR0m1vfpXpiolbz5zV07wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bKbobUZK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nnld3526;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23324606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23324606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bKbobUZK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nnld3526
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5iIDc404169
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=; b=bKbobUZKdgeegorE
	Ynl1GjUhN9ePA5k8f3olTI/fhso3lM8IrDZIsXt9GWQqv/muihJOiB53p/glZMZ7
	Q52QQdKM7HwrqaLNeW6qUBV1Re024YbU/EqT4UXU3/KuEucujLAqppwB/2eqd/9p
	G7oLoAKqgUyp7OJJmloruE1GiL/9NPAzhvMmuXfdtgfeYCBPk2XxBph/D+7Hamh8
	bFch8a0jCohJfj8XZPzoaWCAp89JmllPRzu6QsoCkrLIT6b/KGfijSopJQ8usTGi
	uPAqbh879kGzTfR/5J7NpcJ2m0eQXuD4mTw+w82p/s4RUt4ODp2ibiGg3osBxWeq
	966rSQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t84u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:29:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso3633140a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793082566; x=1793687366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=;
        b=Nnld3526dJYvZg2D0po+GwQiiq8RqPGhpH74W6AoBCgxZVAhf+9i33BPjzr3J8N6Gf
         bumB6iyvHwIhzWbEs6+iqz3svoAcVALECWookEdY1WZMAbrpRbmcx9K1Yg2nE6mkH2HF
         aLHuuG7Q361NtbUEridVBM3HeYbFLSlq9cJhJGFaWbeYaoHxMRp/KkzDEkHc3mDO58kj
         WQrgqASq6lUG0uVV1628ovWMXydzJJMFkdPKsCpX0lBQ5SjwUzilm8HfRicQiegg2aDI
         Wt+ivf8AvVCninL6PqKuKDly4rtOPcJdhexuO61wzIPwipqHtgjNxFgZUrpc+SnSoQRi
         xxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082566; x=1793687366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/rKuuC4wm2T8RjQTJJIR0IVY5eIr/Dxakbz4tIixkc=;
        b=yMuhR8DfdiG184OTO/tUf7PqHJOMVVvr18ge46NdiLhsup2xphe4E9UmCF9npla8yT
         X10FXKL8+ojN8pIM3e5q1pMFnKbs1VgpOU6BvTuLRRFW9O7HAxs7KyK1FiV7dU3bW+qW
         q08vmEhbJW2VP3cCyHzKT+kIUtle3nvYVMFeaGMwZpzDAiS887U8gDCn3UDUleb1OfQ0
         fOTYB+Wd4nE3ywxkojI+yIOo7iccwoKo06YuZtBWZVphI+TnIMviCL3gfz5MgGNojjKX
         MXoAnSCAyiIMgr/aunaRL1kPAwyIJqogtYA/l82QAqd9rJX38/6ACx0D5cy2weecwOL9
         o2qw==
X-Forwarded-Encrypted: i=1; AKwUvBzcxln1zRI1G/wkl8hfKJvE1DIwVXfrI4ENNASieHiypik95klR35/NvSvQUVaBBPR5p9dQYmZcjsIIXhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2l4c8vSiIhAtEQ2spN1cc74r4vPDur0erqH2dCo65n4oNHHBu
	PlVSI6jelAL87Obo3PNTKeKRez5njcFKNy3p+UOub8AShXdjlP2/YUJd8QNCMAFhWMGrxhjJpGA
	oTYvxpuiDwMXn1LDlyynIgv22AinfCrb2dqvukLxQX/Jb2ip76xi0aiirCteuYnBSXlA=
X-Gm-Gg: AYBFou2Z3MqUTaKLU9JEwS7thSkq+Xq7vtjknS0GtNVHQ/ZtKdJmzzE5HABB1o7bbv5
	E18vTGr+Y2VBfA+9jAjTrMWU69gzyxPJOdkq18a/GtNiX7E7qqOhupYd5pcWgRtfMn7cN1EhYok
	FY647HXB0wGdpugjMALP2klY3dQVwK8ermf11vHY0M3WbmIcmh7lMdFrGYXX/0q8vUV/YxHNL+/
	xuz/4c21z8Td5n8N7zcmYR9Yz8PlnQPe0XF3uy9OEYaCTOR5USMmrbJnJCweDw+ybibAhceS83o
	ns25PYg9qepdsiNBdkb5TIoMefyhQKaQN809Od/c7svoJamhqIKl4+lE+Ji3my35Brjc5UksWt+
	502JHw6p75evesi2LTueli8X5NA==
X-Received: by 2002:a17:90b:4406:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3adeae6d6ebmr6442709a91.44.1793082565734;
        Mon, 26 Oct 2026 23:29:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4406:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3adeae6d6ebmr6442693a91.44.1793082565262;
        Mon, 26 Oct 2026 23:29:25 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404ddf1bsm2216463a91.2.2026.10.26.23.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:29:24 -0700 (PDT)
Message-ID: <34a17861-771c-485f-ba41-6bb2d539ab3f@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:59:19 +0530
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
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae044c6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=X_4YwSRDM6R9hu7WxWMA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: pwxyFxXNGjUIeDbKbbp9S7fEzUC-fZtO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX3v0prbxiCE30
 5VvhFmIG87gdvidAwnk7v3gvVcN0RDPTWTSkPYmaYTJczE0jLmONYrKWWVDSByIQ+cm5khqS5Mx
 udOLRlxqcA0idi+dnRS7sGwASfj0hLo=
X-Proofpoint-ORIG-GUID: pwxyFxXNGjUIeDbKbbp9S7fEzUC-fZtO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX2aspVnqMGgz1
 9sSmMOPTkp13j58fc74gNhBiJIcCxIxQO/CNzM4pyPV+s/LEnCkrJYEhu+LatPJtKad96upQtgf
 QmQlXzeV1MsYyQ4LjlSjsgU+NNuruVLPHkS1AMg9XZPJs+bMWPJETQWg7cD1mLn4tZnvBHSTE4u
 4BQqMXf5LzaTekSikDM3FelL1OoTitMio5bFWihCeJrT7Xg8z8gtDiy+1OzfVyxBSbGR6Ce4gC2
 JseoYsl6Uj+24SdkWLLoAtgL2cpZoaS0y6Jae9UO7bJf7fMgDH3ZyWHFCAXI+odybYcPAnnBITE
 3gPzLTGjMfoznyAvfSSOGINGiXlk3ypzR6vpah7ZeunUURzFiOZl6hQuM2vdjl2fOaNXPNm1hso
 use+MwLTVQdttuIOqHLBSL6FGctCNeU+th9PW+K2AqkQG8XexT7foETBQDSTMMkyvqLC7BNSlti
 ebclaE2VchWd/IKn1fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270025



On 10/27/2026 10:05 AM, Ishu Brar via B4 Relay wrote:
> static const struct qcom_cc_desc gpu_cc_sm7250_desc = {
> +	.config = &gpu_cc_sm7250_regmap_config,
> +	.clks = gpu_cc_sm7250_clocks,
> +	.num_clks = ARRAY_SIZE(gpu_cc_sm7250_clocks),
> +	.resets = gpu_cc_sm7250_resets,
> +	.num_resets = ARRAY_SIZE(gpu_cc_sm7250_resets),
> +	.gdscs = gpu_cc_sm7250_gdscs,
> +	.num_gdscs = ARRAY_SIZE(gpu_cc_sm7250_gdscs),
> +	.driver_data = &gpu_cc_sm7250_driver_data,

use_rpm = true,

-- 
Thanks,
Taniya Das

