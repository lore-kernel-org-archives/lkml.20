Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA104B1D10
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587733; cv=none; b=aTTaIzcoieplIzxoZFaos+eW+RIKEKQUPprAN5eD/3T91NTnalM+2TY6SC4BGfar3BGtJjqgmO8S96A9ZPYR1lr0CBLjiTCco/Ppt6vn83BnuCmxnbvjeYq4mh7rbi+LSnmQi9Af+7WAqHjnJltJtw0vV3w4+PcsL6zXq/VMG7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587733; c=relaxed/simple;
	bh=Dnc237LIK+dq38YOjzWu9j3d1wYHrJ3GApeY3U2aFec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyeYsFWakgANy3eXGSMVRutop5p3N6AOKbttHk9iyQwmR3veBpEfZxuT8cP/Xhczmru4SfAh6W1SSHGUaHXqcBpHPn6tFVB27zg3/oQBggQiYeS7R8C1KPXS6S/FTmndPpwDOkJi9/zeg5BXul90IhFoLyLbw80LMTOrAmDDBIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMmYyhGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLOEBxQK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMmYyhGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLOEBxQK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GHWeWP3795358
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irXsHZsnq2RJrG3HTJ0y9LXBcNkU5BE62K/lbfYKMow=; b=XMmYyhGso8YkV4VM
	fu/IahjwpGRkRkM6s1OPr+xa83UkQrLKEqEx/ph3PFBDcSAjWEO8o6slxUtSiaIs
	LmUJjTse1lUlxaO91G/eoVKpOi9qL40qliNU0DH8Qsnu1gyEkz/i/hVb/yYyuV4c
	3M/b6RjS2gDGHE9hxA3Nn8NHYJ8iua3nRHhWH0gUKDP9dbr2+o7Ng2IAQ2WiuRLx
	2j+h0k4GlB4yUUQ/FUtpoyhXNbRQZCRoZao7RiEBdDLXGlZsuV1sSpoSTlC5KCFz
	UNp9MnAiJBGgvxh+xcN4QgntV4qSVVKyupH85DcBHXdrd1Ei/SGTuPLJYgC5wY8X
	W2zTjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxay8yth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:42:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso100003a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789587727; x=1790192527; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=irXsHZsnq2RJrG3HTJ0y9LXBcNkU5BE62K/lbfYKMow=;
        b=BLOEBxQK8eDcDB5bj8E7qEakRfrGmLaj5Tkss0+Ezuv74xZ1VqJozyOSLuCBe/Uaet
         Xb9X9kHktZVQfHV3zKhymG0UACf//G5Oa8+I49cDAKQ+iQpOgJXdrnmvgWjn0Mu1F5SY
         JxR4/t4epgSYn0ojjG2n5qg9GCkvY4qLdLPIfRo3qYTX6A7zV8HBCCAKh425w5wyYz7u
         5UQ4RMPNgEUpeZFdD7Xf/JEt1P+rLlxOedWaBSReQ2GPq60XrVYkOmS7X+/xaQnlJPE3
         qHfhPt/WFK4IMOK9JdprPd0Qs86ynx2mHt15CW93DPNymydGDT61Dzr79UDyeEsDkCDV
         pU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587727; x=1790192527;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=irXsHZsnq2RJrG3HTJ0y9LXBcNkU5BE62K/lbfYKMow=;
        b=SW86LKsgE4X0SlMiez7cQhphlR0ZTjnPQcacsDuondHGAH0Afbh0eUoUSyx70SVA3r
         udA25j7ttA2FaVBNESz5p+TMvPbbNnKjf0dgCeHAq42LYrsehuJ2LnCGeBlqMghZ7Xgc
         yWA44Xe0fUmUwRCbim0rNnsg6j6bv+GQdCiOaNd+xX6oCm5CM39Jkq4aU2RfrjK0NeUx
         ulvKEz3cfctHmuuAA5y78M+OiYmjRqi/8laTs5kEQjcSFF5jveiIJigCT5HA6vukBuhs
         L9szRhIe5b0lKhv/VSSZXGeFFrYi+dW5I1Tcp4waZDhNqNU0tYISjBRb2L5nr4QUaJI1
         e3sg==
X-Forwarded-Encrypted: i=1; AKwUvBz0bPtP6TuexQLKKADFy80bpkIgQagFWrrzPPbLAuDYm76E9Dng+DxGgMII5p2+6frZ2f3mVmi/4pp3a4E=@vger.kernel.org
X-Gm-Message-State: AFuF++kLkQrRpgqBziuXVvDTpXEO2zr4GunlWJyQjsYkxxA9XnqTn11i
	7G25Qg5OU4yKqENLkWzfRY6nw4pHmr2DpjOlgrBi57oFi2euNnONgKTssAOKZD8qs8j/DhvFGOH
	MflES/srTaq4wZmnU3gxryc3tYYpgtnrUV+NjvHkNBr4eIi3l5qLSF3IsqcuM8iaCDBI=
X-Gm-Gg: AYBFou0m70o4lF0VvSAJH2gCvhbnTHIWHAmmnEaiBtJv6sRJKR/2kwnURwPzZOmqh98
	iYfE3mdVA4xEkUyxiClj8jOWlcDT7KjfWRXCwn9ar3ARwVaw8ROx5TMoOejmjlPE9fQHIRTERCx
	mF/3pvHlRBB5pZWIqlrytjBYECxAObxam7VQeKyN6+4tbSbKe86eGa9v/jQB/7N0qW0WeB32M2i
	NhHKsFlDqnZDCpzrnb3XHbloHraRfBKxrqtY64xJE0qsaTKzxQVyN6O6gvvdciyIH/JMSswzqd6
	CmY8uTN46rdJqrngJI+pBZ5fb+TN3bn9pRe2c10HusOKL62V+6pF4DTGSNvPFkBdw//5vl55hcq
	v4JuWimm0W4x++psqHZICmcTS6UcSpkhRUFh8eQ==
X-Received: by 2002:a17:90a:d646:b0:39e:3554:4d0c with SMTP id 98e67ed59e1d1-39e35545ae5mr3665560a91.2.1789587726577;
        Wed, 16 Sep 2026 12:42:06 -0700 (PDT)
X-Received: by 2002:a17:90a:d646:b0:39e:3554:4d0c with SMTP id 98e67ed59e1d1-39e35545ae5mr3665448a91.2.1789587726046;
        Wed, 16 Sep 2026 12:42:06 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5af6593sm9174704eec.25.2026.09.16.12.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:42:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 01:11:57 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v12 3/6] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci
 ICE init
Message-ID: <aqrxBSw8OupqItDR@hu-arakshit-hyd.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-3-09271f583dc6@oss.qualcomm.com>
 <CAPx+jO_Ltc6Q+VdUgOs81azTiM5Vx12GH1z+CXt6NW=M601THQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO_Ltc6Q+VdUgOs81azTiM5Vx12GH1z+CXt6NW=M601THQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI3MiBTYWx0ZWRfX1nKV2fA8+R69
 bN3ruredYk57OvKhEUgcx9+PXPzBPoTowryhHJyIZR2z3Iq4ca6RkJ6+gCAHySrLvc/q3uZ8B/I
 r5AKQmklw1asAbXPBT9x1OUhTlnZg9Hw8EzsQdgjyEa17tVCoM8J2eG8nH8ue27+lGtvD9ZaykK
 7hsf3L39tU18YZWdItxzXJ0BCXhEUSW9J8qRX3C/uT8HmYc2KanxqbpJd6Sd6v9H3VxYY1UHH6c
 x7ct11t2ZA+bvUesTbYNfH1PQXJzrOnDcZpafUqTAWbr038CYBFlPp1JWW5AEE9am98ytdB2TxT
 bWwlXkAzJcTU36vAGOvoU8SOi4bNPYSFemcxMa9TO6/7QjF965pG/jNUT7hMt+7mfUuYMuP+++k
 fB869BwVEAUEYaDRQ6vDl+YaerU9GBGGGcMXKvzYM/JD71Tyf2r9O6TdT8BI3aCs1QpWDiRYmDl
 TYPuK7MnmuwnwI5siNQ==
X-Proofpoint-GUID: aykVrjm1ynNZP-l4_4-5VYMTmPBNRpZd
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aaaf10f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=M7-gVhU5_WYnB0XQLAAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: aykVrjm1ynNZP-l4_4-5VYMTmPBNRpZd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI3MiBTYWx0ZWRfX2DRd2clm5ySt
 z0sOS+kEPUEgk5IuqVk7Mtc4dh5R3FywNgNBW8R0acECVA00GeTmcsNVG68xsnA0p/lJNCGIMts
 /O36AaUEKmJrbZH7LZ1OHVvJ5j98TK0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160272

On Thu, Sep 10, 2026 at 12:17:46PM +0200, Ulf Hansson wrote:
> On Sun, Aug 23, 2026 at 9:48 PM Abhinaba Rakshit
> <abhinaba.rakshit@oss.qualcomm.com> wrote:
> >
> > MMC controller lacks a clock scaling mechanism, unlike the UFS
> > controller. By default, the MMC controller is set to TURBO mode
> > during probe, but the ICE clock remains at XO frequency,
> > leading to read/write performance degradation on eMMC.
> >
> > To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
> > to align it with the controller clock. This ensures consistent
> > performance and avoids mismatches between the controller
> > and ICE clock frequencies.
> >
> > For platforms where ICE is represented as a separate device,
> > use the OPP framework to vote for TURBO mode, maintaining
> > proper voltage and power domain constraints.
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> > Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 
> This looks good to me!
> 
> Although I have a question - should we never drop the vote? Like at
> suspend and runtime suspend, at least?

This point is already discussed with Konrad on earlier patchseries:
https://lore.kernel.org/all/d1232243-2f23-423b-84ac-4463eac79f9a@oss.qualcomm.com/

Since, as the device goes to suspend and power will be turned down,
PM runtime will drop the votes and hence having it in suspend resume
is redundent.

Abhinaba Rakshit
