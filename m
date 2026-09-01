Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBFB330301
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264151; cv=none; b=jOybMapRDnFPeI9/JM0jDNO6Y9o17FW4F1VRhaypyuzjow0zgTk0LzHyMQJ/qeydgsaWXFvhPfJAjHNOJXXb6dP9N031+ju57l9yootSf4y1gf3htyebePP5pPvl4DuTHVybD+lQYeTv5FMGFl9XtoHaPWoqRN1czpyAXVdRKu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264151; c=relaxed/simple;
	bh=Y+YY7fuD9LrO+Sd+3rCyEQKeYw2Y27X6Y7IIOYZzetw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqHcVBHWsupnwdIIKnUxuqlkoofq/5NCliepLkCHlhUglQ6aj9FcDSc5MKvIcYtYIRDgZ+vAdvOta0bQisnb01fNeZDfVpnM/mlqylcWfPDPS2ePHVcn2EDAbHoEEaXyfNmsEu9OBPVm5eIxq7dTYfeEdCcXN6hT4cM4/0qwLPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZESKSub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jL6srgbr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZESKSub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jL6srgbr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJfvK2494610
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 12:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xrSaMuuxA+xEooVjCUF3b9ip
	BwSv1171iBrFkM/JXB8=; b=YZESKSubBWnr1uIUSJ0VB+PzUVtwyreIdwksW8eY
	5GKXgeX8Pf9Q1pXkm8eosFuu/5oE3W8SrJK+W1uIw8o+vcQzmqNa4hHf8qXGUu2d
	DbYLjKLlXjLuq0ajvWg+NeVnBHy7sovuCWRe0ar/9myDh5zr2gHscS8/nAyTcDmN
	Xf7F4roMl3S3/INTqSgaLJNmLMPyGkEXw+eRc+KbENx7NRqUSI3FNIOEkS9+IS5G
	dI+mkMEIvq3xm9R3mDVuORyVeU7DRmeU9sTuN3/AiiVpEeLB/DOfni8kks0eJLK1
	f2n//Og94CFv/ejIr89i2IinnEDG4ucyQ1cOP2mXg/fd7A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh1xe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:02:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7866c4ed349so617408137.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788264148; x=1788868948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrSaMuuxA+xEooVjCUF3b9ipBwSv1171iBrFkM/JXB8=;
        b=jL6srgbrZdcpF9yQn7H5BTtqP9W66sHooZVpB8GeaIDFx1JxURoFShpshPnShqqdYR
         vC9VG3FHB1mlcxUlId4rSd5GXviE/+RMGcfOuJ4mx5+70QSxvx6QgZ3xXpQX+G/m9RiC
         1D4GtsBNwj8f/YXPjoqvr4kCiKF35RCB5mTrgELvrzLOxt9J4NRBdiJFbttjbrwBbLaX
         sFwAalfe7bQ73P+VmkNEmuPMutn+fhM4Rp5pXG9ShSyUoyUxYADeSRg63HRdDlIu1tw3
         0UAevfJtbSTDtTd+U1O9lp3ESVQ4tdDLKOaENhm2jgZI5oBm922ejO2niU4b+GdCvMuf
         ZNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264148; x=1788868948;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrSaMuuxA+xEooVjCUF3b9ipBwSv1171iBrFkM/JXB8=;
        b=qZZBHqxoUGYOZ4XYSHgGJpJaIH6FvNjFn5/hxC23Cj/0w75fD11kYWhfiWfhWZitB+
         3ePt2ra/4qOv5XWbuhpiudfjX5Ijfp/sVTzdqkvsQ65qiLwiqKmvAf1kU9jpzPehYwUn
         VnXxWgw6JdX2UmNOGGyt7dKXhpZk9yhVhfN2ngkXE79n1Z69b6lqF0Ejly14T6Wi5Ju7
         zaH+FsRPXJFaDM5Mm6uswL4g9CZMDStIGg3IdKtGouMRLbxGex95mLLHste5CvDdc1TX
         w9ngFxumuldALRTmMEnrE7CTU+JRKrnBJYBcdbkVbz+qZDAdE9tYJjsACmFVzfAkono9
         noRg==
X-Forwarded-Encrypted: i=1; AHgh+RpUk87UbUCqBDNrv0cfB2O4QaYFZE/9JRX6t9ZvOsFBpH2VFBo1nJ++CRKsVwEOL9i2iSNZHtP1dg2IRcY=@vger.kernel.org
X-Gm-Message-State: AFuF++kE0tl4RTPVD+OVGccAtLtvgk5ljTP6BpKhAN0MNGK23+wxAsCB
	A7sppYrbnWAorL4vb7tEVcigMwtMioxpxnbBpL0ow95zhVN1e638JVsEqBdD6udV95rsV+jRqaA
	huj/Sam+1VIW4SBXJN/fTH90cxxisNVivcXC/SuUvBGdTwojt5DDMWVsGxttwP0rw6uA=
X-Gm-Gg: AR+sD118boOmzyuy9NEmR629Fe97xed3qrSg+Uk4fhMLsUiZsRyklrgnx/NQ6ekzWld
	JlG9tz5yyILZGcY/Kd84ISl2gUCvvtbY2M1HsgLAag3bL3LbFghrCYgqdkj2cSmEy5jRQmyDSAV
	0BhamQvE/3LWTmO482QJm6Zr54T2DntAgeI+F5MS0IEinuLaWpllsgFgOzCbhSl6PAZazge6IgE
	YeIFjgD8oAvKpJikxStkl+ytVuSYckEXvOrwxixTf49kJYc9kBPpmjQdCXgg6gGKJVajwFqgq7F
	JcYjmcuRzVDsAP1E6NZdVluJlhj7aV5ZI5iA5CtqiRQ8423CtKmTnRvQoH1nshmMxaTBdO5URG2
	4TjqK8BGhjbNT0ZY=
X-Received: by 2002:a05:6102:c10:b0:77b:28c1:210e with SMTP id ada2fe7eead31-785967c8f7emr12106820137.1.1788264148112;
        Tue, 01 Sep 2026 05:02:28 -0700 (PDT)
X-Received: by 2002:a05:6102:c10:b0:77b:28c1:210e with SMTP id ada2fe7eead31-785967c8f7emr12106780137.1.1788264147437;
        Tue, 01 Sep 2026 05:02:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce18dbae2sm18891085e9.13.2026.09.01.05.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:02:25 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:02:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        radu@rendec.net, taniya.das@oss.qualcomm.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
Message-ID: <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfX/tlZz6ngJ3BL
 MwfJsWo/r7lZJQZviXQkkTAJ74Gy4WGlL0Y5FmTIYTnb57lKtZTibD9ozoP4DDQZ3ZwQmsYqPJh
 AdbbPFL8m7Ibf6XppfcRRZ0e9SaAULU=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96bed5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z-QAWnQ1IDuNMEsj6QcA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 6YWmICfz5lGeAzdGP6IB5EqdJhN-yX11
X-Proofpoint-ORIG-GUID: 6YWmICfz5lGeAzdGP6IB5EqdJhN-yX11
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfX8zHjdcBnGxrt
 sRCXU4Rw9hpeBd66KANUtxPl8ZuoCIJxH6oRIAgcdd/gWXQrnXPVzImS81DdjpHYpdd9IhK83tB
 C0unA8YlnFZWht+a5q5q3+2SUykVn8PEqCaNy8svYbm6abA3SFY5sy6xJyHt6w0x1TTM/ksjmfl
 8zaPijzy/hUTjh6QrVMVdCa9/H20DNv1mTzhTSOCvPJh0Rq20CYa//oX3j0FoAohoHaamTvunUT
 Says6rRJmzm91/po4Mz3XWIAf+57utB5/VkGw6nGG/mopneVFMHbgzMdpyPhfCfewn1OGvUeHfG
 W52aCgJynl833PqYdQxICYD9n3V7r8CwbNCaNRA+9HsYR0EcluVvGOSIYWk1ADg3CyZzOTdQeoK
 ZoTTgVl+EeGrKBvxD5rpDnjDn3rHI7sE+IyQ+WkY6zx1LV/yY6JahLFXgIEe/661/0TowouwqHM
 bHAYyqHxg9fqP63hcqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010107

On 26-09-01 09:24:35, Sreeshankar K wrote:
> This patchset introduces foundational upstream support for the Qualcomm SM7250
> SoC (internally codenamed Lito).
> 
> SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> and 6x Silver Cortex-A55) and Adreno 620 GPU.
> 
> This patchset is organized as follows:
> > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> RPMh clocks/power domains, GCC and cpufreq hardware).
> > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> interrupt controllers, clock providers, power domains, and reserved memory.
> 
> Dependencies:
> This patchset depends on the following patch:
> > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
>   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> 
> Changelog [v9]:
> > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
>   Make all clk_init_data instances const across the driver.

You sent 3 versions in less than 24 hours. Please slow down.

Give a chance to the reviewers to have a look at each version before
sending a new one.
