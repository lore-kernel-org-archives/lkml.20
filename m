Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749832;
	b=j6lXsgyCyT52XEagD53FvKO+8lF4IpXkycVe0r86eysgNWpRngYCS+Rh42DGNOkkGcIM
	 dBGbWTRR4QP4uXV1gqEyrGPoWT5W3EcCPFhX+BS9btNtUO3nO7blzf+z1ahyaTIV2VEnz
	 zEdwyNl4Ln9Jpx3WmZeOyKDq4EOLKrflAV5JoEkGtcQ5HHRNMB1cLOpSRYj/7qv/SM0a3
	 YlWiblQa+56cJ94VkpsyBlMh7E2bc16TzjRyp2/hS7Ouh7PxJh96++FQEGyB+MMBDhMGs
	 hBccMfu+uiQth7l0pXrBtrtyXUOXcTn0BsLgv4QFP5EeubBswYU6kqSZQ33cAo9iG5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=;
	b=RD5Qq8kBITdnPbuH2BFH64ikLCMZRPpna6tsS5mL5cwRvjjj0oXb7wtfByf0aNBA02PB
	 0GP7sjGP49kg2dKrGtWSoFlh0GAw1WDhPqAYo0tUy+t5IEIFua6TsEhi/rvxo1Bxs2K2A
	 WlUwlP7UoFTcTLxpoc0ocqK4jhmk8OvysDtApD5X/uoOYY2ciMA6/jOClG0arinJOkxEe
	 FNdddaA7TWsQzZEII0fVij2YzIXV9Dn0SJw0KlVPNHLibuFLV1LTOHJ3CyOo0UcDsISVT
	 rX+b5a43P9Ki+lBD1Z985OdB2F6c97Zxv9ptQMmoI0KnqvX7R87jPVB0LtgRwZGRepA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLGHNjZ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R63aZJPA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759D8606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 759D8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLGHNjZ7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R63aZJPA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FPIm3168401
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=; b=mLGHNjZ7FQaMcyGK
	8pqEg/gVX+Wy4nm7/BRD3lOKUrlxq2WiiPV8ys/NiunCPYvy/Mn9sPrrffm6giKK
	HnAyiR4XJTPFLMe8e2ghwsz6S4aWt/EEf2yT+LjaC3XTJr744+PminRBS5VeEbtK
	vvGYEOmcfmNJtMZtfXLRuigFeVUJPCvdJpiYXZR2qw97rlVei8Ln+fRx6k3BeXg+
	nyqPFlZiQSYWT1w6QnToNc6r5M+YN2QzU9aT/HATeKmqnaXDzg0VJtt/n2IBxU6y
	8CNcYSmIJkgtGv8Q584mGiBbc3DCwIP6FNHxWCQi2W7fA16UEgB90CojchPgKq0o
	AZG4Xw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpb3qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:03:50 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eacebedc9bso12513e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749830; x=1793354630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=;
        b=R63aZJPALpIGd2XJtTQYWdxWBctfwSq7+ZTYIbb3C/FErv4w1Xark+Jrv6fZKTv4Kg
         /0kuAVgUkmjT1xoh90WbHA6UGEo8ATHcUEMMkgeYnNub0CqddrKynNzxuWhdkrbW9Egh
         kUrVrsGE7LlRSVK5yz3vC3Oq/mBYkps3d4divtAXo1h09PMxrBgUnCz8orf2BjjWHedg
         gMchj/VXuC03/BsDIVHB1ZyMB3Ev7nE91lEC+WkoAj2LjI1XU4Az1P2q1nzWbLna5rzM
         vh7NeNzeKG2NgQ8pWLP1dtnXEsakRegDKY0gOW96ha47XaoMzucOqgDlPM+uVWc7y7x0
         aZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749830; x=1793354630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOomS8sJJA+g1LuOJyNNfjwxlhWVKpv3aLO7udUuLI0=;
        b=cakZU4FWb74CHOxUsIhAshdJyYe0itTRHCrPHGNFeNIuz4/QyqbD3tQUQ784hpoNr/
         hS+l1xvsfOsSt1JbXierH7RS5drlgILMrr3G/lRGADKjrxAu0tJWJbQCy8r42FazzirZ
         otAreewmW/fefUQNROOe7DhY382my8yB9FHpf0eIynoDlj7e6TZC21nX0s88HMU1zfPO
         eCLC20T+kfanjEOg3nyi6WL5rbgeRIA3sExnX3I24FZf3NL7G4ATJ+igToLvIIiWpFbJ
         nPN0xz7ExWESJvfPe3JmPmPogPUntcIke2IUbsFU1IxzrqqkXRFfbQrTht60jMUAbTM8
         iQdA==
X-Forwarded-Encrypted: i=1; AKwUvBz+T9g9KlAwtZizNdSxvte25PsnS5MZe7UeJJztBFxvP66m7Mk4vwhKck1uwdbfrCzuK4AXPgGRYoFZWMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYfnHf4C4+qfWkIqqMEerTEtieelnwP7sxyiI+CUGeHG6kox0/
	6oHYLl7uEKlBuAdrwpwV0zZf5YdzNuomu3mTalMy1PagdcD/Zo+4ar5AGaBq3X7PSDuaKdfjGkf
	5e/uoc4RgKLTLEioT8ufei9/wVOj6wjqqUO8NECO4csNyEYO3FnZcNji5s4OYxwDHQho=
X-Gm-Gg: AYBFou3Tgd3QvBxWDnnVMvCL9OIzDiHnr3GCMganzpkuE6c2WDpgC2fIjCoOJ8AqFJr
	VNxNzaiqukvJsF5bceD+3uHubI8oWZc5Hm9DlXfHcKFgIinQj7bI6VDqOnKJMLRWZ5xYqVLtEz8
	QmDqr8YZ3ypheUeo3HZ8k5HyJOARhNPZ2o8cmeZgsfCuupPwwThLLu6qs9LBKFPr/j0lfZTPsZ/
	CKRFPgKRk8iW05XvAY+BEKrbsK798/8sXn01MjRLUaUir6q4VVUhLrbqdIAuXTnZk6UGaBIWstx
	Hs2nGudMmPIJHAoshdkRwieGhAKjkYr/wvq8o0wbNJlOzz+znI3cg1zB9YLxXKd0nFzEkgClT9J
	rFVY9p7PGpY0xnQA+BqgMeg==
X-Received: by 2002:a05:6102:8648:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ccc3313669mr512066137.3.1792749829604;
        Fri, 23 Oct 2026 03:03:49 -0700 (PDT)
X-Received: by 2002:a05:6102:8648:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7ccc3313669mr512050137.3.1792749829147;
        Fri, 23 Oct 2026 03:03:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfa594sm84380366b.80.2026.10.23.03.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:03:48 -0700 (PDT)
Message-ID: <70d5ef70-00c7-4265-b2aa-3a784d4f0d1a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:03:44 +0200
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
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
 <20261023-msm_gdsc2-v4-3-40b6a71d4e3f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-msm_gdsc2-v4-3-40b6a71d4e3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX6OMY7RrDP+lP
 qPRwciPhTETmPckPYDeJrmIIYLhBIwu+ROZmXOJI3ik5bAGFtv/AfZJ6CYbORRVC9fRKaoRiZqt
 CLBMFIN8Ijp9uWsJHXLb8N2iwm96OJg=
X-Proofpoint-GUID: kxPYpzHTHoBtsWjUAM1a1e8zQY457OE5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX+4ccNjtd1ANM
 /OAsxLKu+9y/isisuL8zB2P+kPHoxN6Ki22kDP/t6ObG3x4meUfR3lwztvW04UyxIsWuDZPm2MZ
 Zmw5vVZz6iTj3Sv2c2CyDQIc7mjqGbqSpJj+Gh14VbtaGtqzCY9WkpO+oDHwdUnrnNflXHh9eXh
 H/oJeKmGujDh2yrAlmq9IkuJSCeM60VdIV+/gosnOF0NpKkwworT3HcPDY1jAy/BXMFuo7F5gIA
 p2kRnvJ1trRy5clmhh7kY6SqNgPwLsRWskwlRoW7dmQ8TcF5opiF/8czDN3Fsp/u/bCnSGG894D
 8pWxlCgA9ckmI/SeYsyiBgQaYtIG+/cwM2yoBiyv4enkaMj5ZPwZ34UPA4F3lc+wz1TbOYDI7Gw
 RIPx4yGfAs1B0gcwTS0x/9KSoO1qvE7uAuPjhzvIEQ5HAnjdzRKTpWlGDSLIG23b2wyTBz6hKIq
 +Rut36ip/kUdHXCAhug==
X-Proofpoint-ORIG-GUID: kxPYpzHTHoBtsWjUAM1a1e8zQY457OE5
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb3106 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6bGC0mKcvBxu2wzPFmMA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

On 10/23/26 10:13 AM, Yongxing Mou wrote:
> The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
> source pipes. Without enabling it, these pipes remain inaccessible.
> 
> The DPU is supplied by both CORE and INT2, so describe both GDSCs as
> its power domains rather than attaching the DPU directly to their
> parent MMCX domain.
> 
> Keep CORE attached to the parent MDSS device because it also supplies
> shared MDSS hardware outside the DPU.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
