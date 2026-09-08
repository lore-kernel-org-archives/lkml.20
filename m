Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63626548569
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872579; cv=none; b=sD7falUXV9SYR2sCcKVuiwTkpkdpah2rSMTfRw37O8JPiqIA8Tm0nipA4dS6raqQ79nqejPEDmgDlgQesc8/3lPxpfblU102ShI8+ha7TdiP6i9yCY66kgMUlcdTQTtnNSd1aDmWmInhKLKK5X6XT4zocLQCqPEKWXebpkGxPDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872579; c=relaxed/simple;
	bh=XX2epvmlLQo0RJnDrbcx87SCzNk+zSmVWGjPaOcT1bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5vfxIroSi20w8FaAzRrWLCAyYWBhg0sgV2F320SQm4+gnX1qPmwvIwwf0ZItpkuQo7dwzGAZgRNFwaV6mqZSmncNFV0Gdd9tet4Z9v7JXzU7/0mccgjde+zwLfAObfGXVvYG/xXecsasehTNRGyodZCOyDZiRv5qHARt9R1f4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R28QCqYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XasFuaGj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R28QCqYH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XasFuaGj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkouH2506772
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 13:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9od1/mMLI/E6Yx/CZZ9c+b1q/L+qRxzvRW2AXWCxeQ=; b=R28QCqYHddbxB2eq
	gy9q2fsTl+7J8OqbPuykazYU9/7D9Oau5u+2kfU1rUJk1qHJO9z3R1jEuKrbCiJY
	eAt5ISKZcWOp7GvXRSBrAitpX98MtOHf+YlCsRJjhiX3hbPdoNTOemvUgfhnwlcx
	iCvBo2uHhlgmAgpKX1Rg9slCTmrbObYodstgoa7RA6P+iANLhQoA06F6GTQqgWo9
	RHVEMGrywjj/D5hKtNQFwT0+/8sWnRslPEVWd4A0AwfWwtDDeLl5Pm5rn163/BrR
	mO5Vxis+2ji3uF9n4OjRzHQI9xbGfcKciJmT+A7GSNVOM4GGcC4lbN0xg9P/V9MF
	t3Si7g==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvuhkkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:02:40 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-800d0edbdfeso9115a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788872559; x=1789477359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9od1/mMLI/E6Yx/CZZ9c+b1q/L+qRxzvRW2AXWCxeQ=;
        b=XasFuaGjtHl/qVPBZrPdsvjtTA7RAaOPrmvyzLJXJQK9CFspnQvWHPhU5rVj6EjS8N
         tgopwejtNJ/KGTYbgfz7XxKcigiqzodBNb4RlPBV9OyE9wyLShWL0P9t1Kv8IAq4es0M
         cHDv8tdxt38sO4jB/QZ/CHi/BizzM7HQGciX+PxUk2JDG3iXoO2G9yb0P/TqZFrg5MnI
         4Z2kflJd2SuwG42qL0dTSiCkWFFTYjZRCT+nq/E2CdR0KIypzqOUdRx8cvShAJJT4IQY
         FZ/10V9tM2ut4NyY6+fr3/N3m8gSXfdSZa6qDQDZSsOsL70ZfNr2ToYGmxMfPbiilLnv
         0Efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872559; x=1789477359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9od1/mMLI/E6Yx/CZZ9c+b1q/L+qRxzvRW2AXWCxeQ=;
        b=Mf05mKQR91wdnEyBF5euqSWSG6TGmlYNxQeJV1eK9JSUGjFaqHohHQDziJ6bAkyDF+
         736FYRR+b5q/C8bgTaEcg3f0GXz6OwAjcVWGjatr5ztJuN6KJ+nP4/T8DM8NUs/Sh2Er
         RYOJj04hfzDswuGVicR8K1BgIpELzczRst8NzSNqU07P8jnDDK7Cco/88veRsCUBwwuf
         pjftpjia1/3wuo3RXw+GiDE0r+38KY842aICuT0YBLvqBKsf06hPcHpySQY7QyjnZ0Uz
         +hxz7/YKSxPCsGr8ctiU/9DWL6prn9dC59RHgUtq/cMA35rQocsIMgLTgpnCAfyNtZPR
         YV1g==
X-Forwarded-Encrypted: i=1; AKwUvByaEKe8czjU4LRj3OUf0rC5HyJE2e+j/DAM2PKfW+tgvcsweqJLsRblo2qPJXrKaTvyjE3+26+QLItlgpM=@vger.kernel.org
X-Gm-Message-State: AFuF++k4dLwHNoKikI7MEqFAWGl+t1OcEcoFo0iaQLJnwMZmsOl3p16q
	KIT8+QYXxXq4OYfI+S61feeDiYqUl+rOhqN6ywIREF72YDngvI7k9nBZE9LP5RL9ZJSfRtIMOWz
	ARTzSf92hMfVsmzS4KsW8emo3aTRvVcZGRdQ5DNJGDoSW5v6pAfd6ENhcyC7B3Eafc0U=
X-Gm-Gg: AYBFou1JM1d49DV9ayGPI0UlgaPjkXfEL2TU1E3bTCKOVERtVhQZUT1nA6FCCSRO0tO
	bCOGTs8r5mzL5aBN/2QG7IJ9cZf+yKXcgQjP2XqVxWjWVFvcwOAPa3SER4lhviXfRoVA7ymsj3s
	JWl8WucyVj1K4jSjKDxocuw50EKqYq8RH08umu1iGzqScmxihNmnX20ST3GwQL2xo6uhD2u9XRs
	cHuY6hOU29CX7y56Hr2MHZZMja0PXMBF0s4Lb+l2mTTWwQs1IPqCS9fUN6pp735L9I6Rif4ffpQ
	iCwFW1tgkXlb7waUN4O+iYW52BOkAV72RZzHrgTRIMKyW/23/1p+UfZ5MVoUgbpnOI0JF37fl0o
	dlLVEp7Un5rZ0tvO7GQeOeQ==
X-Received: by 2002:a05:6830:3c8e:b0:7f4:37a9:6df9 with SMTP id 46e09a7af769-7fb77233fb0mr13137955a34.0.1788872559147;
        Tue, 08 Sep 2026 06:02:39 -0700 (PDT)
X-Received: by 2002:a05:6830:3c8e:b0:7f4:37a9:6df9 with SMTP id 46e09a7af769-7fb77233fb0mr13137846a34.0.1788872558370;
        Tue, 08 Sep 2026 06:02:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a88b7c04edsm726386a12.15.2026.09.08.06.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:02:37 -0700 (PDT)
Message-ID: <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:02:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6aa00770 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BlYFBzphh5xgekHqNzEA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: oFjPvWy6V_gY3avOiz2qgjVt4cQmWwIK
X-Proofpoint-ORIG-GUID: oFjPvWy6V_gY3avOiz2qgjVt4cQmWwIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX8Dlpiz1yQW40
 7LTA6XGUJ+4qB70HK1TCgOlxm0od+jFToeXpPx8SnI6Oqj6ONekbv4D4uhaKzgRZ3rY1p6DsgDg
 vDHC+aFSShCT7TQnGI2o66OdDNvPPgFl+sqho7Y+kXZ71iVj0IOB+Oth8/Cu3qzB3ta/+/PtNRi
 4XGhc6nk7e0FzICGJp3MA0Pzlv6KIT90fVcG49Z73XK5INSsJRxVrSolRIJmj2ls4pl69DBY/Lb
 3Cjl513+v7p/UIVs9RxEs22fXYLK9MoGgOZHgemlXKASeF1yJyZ01KIpe3OGtH13WaP++tEjkQi
 nFDzI96I5yHXfasxKPWGgKdtDNRNSId3/j6Rg4Z5D3/0NOhdx6GF3LtILoCeCVViYnfIZMHfZx5
 q1YTpUbyPkfacyGxEWQfgw5hm6CGPndg0SIvqH8uWU1wztiWmlyILTrVq2LE41kPxmMOuymmgyA
 HWuAx8RAiRPiio6tX9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfXw9DKukn6n5Jv
 +Spb1tCMGoJ1fnBlfL1XqfL1y5d7DMStnUm/8A1rCvf6igFLAdSgCEXxEOgJmU3myetDT/wHLmA
 ws8jXmCZHERFZDdOplHrfZ2hcjb7D7w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080140

On 9/8/26 9:58 AM, Karthik S wrote:
> Add pinctrl driver to support pin configuration for LPASS
> (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
> on QCS615.
> 
> This IP is an additional pin control block for Audio Pins on top the
> existing SoC Top level pin-controller.
> 
> This pin controller has some similarities compared to Top level
> msm SoC Pin controller like 'each pin belongs to a single group'
> and so on. However this one is intended to control only audio
> pins in particular, which can not be configured/touched by the
> Top level SoC pin controller except setting them as gpios.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/pinctrl/qcom/Kconfig                  |  10 +
>  drivers/pinctrl/qcom/Makefile                 |   1 +
>  .../pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c   | 185 ++++++++++++++++++

This patch produces dozens of compile warnings and is not split properly per
subsystem.

Also, it looks like the data you provided here is a subset of
pinctrl-sdm670-lpass-lpi.c - is there a chance that the block is directly
copy-pasted between these SoCs? Are the extra functions present on 670 also
present on QCS615?

Konrad
