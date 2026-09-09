Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF44F538D96
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954001; cv=none; b=CJT//yobxWzSW+n9rQG9Kz57KqOP3ivwF/AdRoSAhNmP5NzZuY45YIL4BGV/YDTlBZBOyP4PeUWZl3Y7DOTxMjwGWkvBOBGp1uOGaTBfxcFKBRSocbQ1OYiKmuybz3LdYByzOt7NhR5sWML8UJl9UJCryQ6wzTZ7hswFR88EE7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954001; c=relaxed/simple;
	bh=jyBRmYpXCpDJbVY8rOr855AO6lww7636SkJgGsvfo0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKSBnqZOew/wWaMNoPf0L3E2nDOLiYUq5R/Q18A5lqJZjnVXyuoV9rGFdfjZ5YNHlcc0WVkOLOZQLtvKRpZfmHc2n7H777rYOBbRSpN/iNRPzDVXxdLFimn0aqONhkmpNZisxnic2R5lTylNc3jEDSte04QgHCnoBwO/2f8w1Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnxEkMKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RsTfX2Fj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnxEkMKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RsTfX2Fj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUFia2376136
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9m4Z66gMGNnKI2MZsthj98sX
	oGQbEn+eH/Ga1n5jBmo=; b=cnxEkMKV9Ekj+H4T1ait1R5G9upQEYnuWn9mGbJc
	8IrGEHHYOJ31aJ9xNnF7C66Y32YIQbWb6vmbCYAazDjacrVrhrAVz+sHfryRnSIY
	VaW/kLAnZ9OaisXsN7RfMaRnHom8OVukQGO2Z4L3u1ck5WLbFZ8cOhpoLCudDnBn
	oFV4M7qgSp0YQIqpObCuC3wffTXFRYVGwv4bfcethAM5mq3z7Ch8gvGaut5NlOPc
	e3bnyGfG1gdiDdOFGr/qtKe4R1I+u2Ke98gPIILGJ7BG5ATg/M3J6MgrvG1mC5Lg
	nw4Ux/0+FViOb16JLflu4n3f26bEVrixornVxfyJ1ujaIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru07ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:39:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so10004498a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953993; x=1789558793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9m4Z66gMGNnKI2MZsthj98sXoGQbEn+eH/Ga1n5jBmo=;
        b=RsTfX2Fj7KnffWLuKwAPt0bmaPLSq7y4x9zOovz0rXBWAEizlJATNzzl1VjYpKFPUc
         zotwYuQxNRYxccBy995QhjkutCQdbnRck+cqjQVG79Vlh5TevadOctKQ5fci3ra4uIbZ
         qXlOxOQwHG4ZTD6tdm71PbGPKI7nf61X8vmnbn7+yKD1Z5gAR6UFuwZnAA0uwLwD9Vif
         t4m9XgOw7L2iGJxoBWLqvgIeRovxdqNDNgJutMxoizKRxumTketrv+iI/WFw5M08A7Ga
         yr6RCOh2H7a20XJG0V+3qq6bB7hUdbz0bexLaG4lAVUkAqCi5n+5qdN+G1GLYlkk//+J
         OJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953993; x=1789558793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m4Z66gMGNnKI2MZsthj98sXoGQbEn+eH/Ga1n5jBmo=;
        b=gGKK2CqHbMFjysOTGnbU46lPDFD0Nh8+QRKa2QPXECJmRwBr4qsiJtFuLZRuaCMIK/
         wFJetngLGDgNhwce1Tpd3UP5jc9WCBLF2+NOFtgE7azgzKzZ8fD+EwTlc5RCpxu6KByS
         ArJkPxq3O8LZGhlo1Wgya8wnQPSnBex3SIQ9TQBy8ar0BBlNEHqj0VOYuZI6ZdMnKKR8
         k0N/L+r5SAcuZZXE4m+DtqJx/g7Uf/ERrN6dmlK5OTUGxENfjj0Vs+M8ko4TnN4jechm
         j2rjRdByj5O4JG8Eg4/ETcU5XJB12gpBK62Kgs82EDLOh/h3GJdLwMf4mYjf+jNDDMQt
         Nx8Q==
X-Forwarded-Encrypted: i=1; AKwUvByE0BqyHaOgRV3BXPXbOrhuQiQOcEA7Ck9G7vk+t1AEvwEXAgARnZoOQQsMLIV6E7a78RgI2AUprUutDaE=@vger.kernel.org
X-Gm-Message-State: AFuF++luSP4D/z8j0Q86+Uv4SKBsV+RdUQNASt0qY54tWDPnuqe5Up34
	mkJqh1EFOtIzUBVxcclnaqWmTQQwhSvW4REJqW8ZT0QY+oRjQmkCuWKd3dJbbAH+UczqWcwZ5ZG
	d3RbkJdHL6pq21ECSVqIaJ22rtIEjvXSlIjimhnE/++mlnA7tMjxsFNc+tusqz4h1DPg=
X-Gm-Gg: AYBFou2y5HFtdqYqv5WwoYHiDaVVp5EwsxOcXzAyBnbwE3JNy1inu3BjCFbwah/trnq
	iBa4PM7R70y2LRnx3pRvmja1JqKN6z+td/2iiLkR56L21i5OtAqYRnOh8p5GGanNTX3LrFqYjM8
	NBoXORLgDlmowN894ITsXSEtPolyE5xtznQK5OSIqMF4kTI2oFuU02red9XkwOnvCnf6U7fOfF9
	epleS+V/g7x5flxBXd8bsHqTa05k40jn6g4tF/UucpT7hiHyRsT7ikXBbZoB4cHNtBpE5fRZpCs
	rDYRH8rwQS9V0rqoGlpjt077zhTb8jm3yq0/8cTVRtRxAK3/iyTtJ4BHI/rkU3uMazW+17SGlJr
	PPtMj6DsQ4cLqwg==
X-Received: by 2002:a17:90b:3a0f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39bac34a3c3mr7585784a91.15.1788953992499;
        Wed, 09 Sep 2026 04:39:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39bac34a3c3mr7585750a91.15.1788953992067;
        Wed, 09 Sep 2026 04:39:52 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm36764429eec.6.2026.09.09.04.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:39:51 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:09:44 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
Message-ID: <aqFFgPpqsHG2N96X@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
 <4aee70eb-bd1d-4320-8921-e55bb8e0d176@kernel.org>
 <98602703-4a1c-4e91-b7bf-934bb9894eb7@kernel.org>
 <aa6ec351-70a3-4edb-9c8d-a1cd2565fc29@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6ec351-70a3-4edb-9c8d-a1cd2565fc29@kernel.org>
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa1458e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eU4lnWU2jQs4ucgFyO4A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: vxCKP3iH39Ngx7nL53CNQd_1iRDqcTnB
X-Proofpoint-ORIG-GUID: vxCKP3iH39Ngx7nL53CNQd_1iRDqcTnB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMCBTYWx0ZWRfX74CZ2LnIoNzs
 finBXo8AX8ex0ZhiHDERQ4YoXCYX/Qv3dvguxEIrqSTMumYMvcd0mNyJ5vDw4JIF85/yq/fuEx6
 EO6ayMbViaM5J3OtsN+Dj+zSjHiTioE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMCBTYWx0ZWRfX/YP2hJBlZL/x
 ZQImxnZ2vyc9oSXmP+mzdpGXeIdSY8GPxJ4t6hJEUDCqyfRaMtZKSub8Me0oOSSCUPxFy5ehIvs
 7vjiTgappiRqU0D7QKgc/iJh8LJnD1bccZWOn82b9zUyR4I3WVJv0FfP1Xqh27CPcR9GJP4U3jH
 +gvWsq3OGi74mYmBMb6DJJZkjdwp4i/biqX1RhYPZFFjZ2SOuN/t9jOgsabQbpfzK+ISFYnDAna
 aSAR+zKnn0ciws6NVvT3yN5ed0WBJjgtw0QJy1PoTkSqsnYIzBB2CsmNCo5jBY5nPBCvnzzI7mA
 Gk6NByhBVEJcrR9wbM+foevgCMsf+8w/0TR7HETO5ADDIVH/nh7bdwTPqKPT7XI/AUEM0nvEcXe
 S25x6ADhe+B5SY8FXBynE8qsgvBri4wXponPfJmjRjcqu/aURtgPTPpEHkoXO5mWFn/co08AY3L
 eVN8A88SIDo0MPMiWcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090130

On Wed, Sep 09, 2026 at 01:33:57PM +0200, Krzysztof Kozlowski wrote:
> On 09/09/2026 13:30, Krzysztof Kozlowski wrote:
> > On 09/09/2026 13:24, Krzysztof Kozlowski wrote:
> >> On 08/09/2026 08:23, Mohd Ayaan Anwar wrote:
> >>> The GPIO mappings on the IQS variant differ from the CQ variants.
> >>> GPIO138 is connected to the RGMII1_RX_CTL pin rather than the NFC ESE
> >>> Secure IO pin; the latter is connected to GPIO49. This incorrect
> >>> reservation causes the probe of the second Ethernet port to fail:
> >>>
> >>>   shikra-tlmm 500000.pinctrl: error -EINVAL: pin-138 (5d20000.ethernet)
> >>>   shikra-tlmm 500000.pinctrl: error -EINVAL: could not request pin 138
> >>>   (GPIO_138) from group gpio138 on device 500000.pinctrl
> >>>   qcom-ethqos 5d20000.ethernet: Error applying setting, reverse things back
> > 
> > 
> > Apply this patch and reproduce it. Is is possible? Didn't we talk about
> > this already?
> > 
> >>>
> >>> Replace gpio138 with gpio49 in the reserved list.
> >>>
> >>> Fixes: 779aead2dace ("arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm")
> >>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>
> >> This looks duplicating:
> >> https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> >>
> > 
> > Ah, no, mixed patches. Duplication is between other works:
> > https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> > https://lore.kernel.org/all/20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com/
> > 
> > But nevertheless I am sure we talked about this, that commit msg and is
> > not accurate... Cannot find the thread, though...
> 
> So here was v1:
> https://lore.kernel.org/all/20260612-shikra_ethernet-v1-9-f0f4a1d19929@oss.qualcomm.com/
> Where I commented that code needs changes and now we see again v1.
> 
> What is with this patch versioning? How is it supposed to work:
> 
> b4 diff '<20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>'
> 
> ???
> 

During the RFC, I mentioned that I will split out the series after
initial feedback. So the RFC (after incorporating the feedback) was split
into:
1. This series (v1)
2. Changes for net-next (v1 and v2 have been sent out):
  https://lore.kernel.org/netdev/20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com/

This particular commit message needs to be rewritten as its not breaking
anything in the current tree. I will fix that and drop the Fixes: tag.

	Ayaan


