Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA132F39B5
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988446; cv=none; b=l37TYhBsmH7WHOLiVlu5xUcJKWjV7e1Ka3cex4Bgm+dC/cRyIRSIl5pD+FGF53qV0fy7nA/D/OG4hnxCtvy3O0k5Hs3/t0avPXlm5EHp8tCvxLDBkysARIYKCiyfauT8sil6NuoXggdjDnyJJtOYPhyYKXGSc3TCHKDMvf8rQts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988446; c=relaxed/simple;
	bh=0o0ms8dJbOwJRaKWLVU8vQyHuX837gIUUcVr38XClQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCSz5TWJ3BkX6tTQF9cbRFKcXLk8/+9/di0u+W05rvl7GwdfQT2p2FnmUltI/pPK3Ecmj54yCN3rgZJMtYaJnIM5mbYIXy1auknARqfmiCagDB8a6N/xkkdRbIMZZ8E5UfgKLHIHxufRD40Dk7LOBnLbR7jfYy8HDICyCfQ3/jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrauKjbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzqISB/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrauKjbT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzqISB/4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NetBr3338722
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNKPeOeJtdaJwaskI61OzrmziGwa6U3Z+vrqhZPHVsU=; b=VrauKjbTTwYXqkVD
	TsdUCpjaYl08YKzc+LMrbrTusxasGKlMI8KZEjsZEMGW6hef6LdA+Gh5jdKQyh1N
	ILTbVCUZaHlFqJoz7BISXOIkRM4crqQoXc2otqT5r3LEGss1jmAn5zX9sNwUjp77
	Q4kxSQdoyMN59H4FrwGMsIZFjvH0LcgMvGFCBfjyDuzERSdsh/T5z5bis/Cf60Am
	ilyfbaczWYfgAxmLW+Ediub9EQ8nsKFBacLoQBNgtUxykw27gV0EQ5g0K4Pxg/Mg
	LM8GdioevVYJIFJXWZV2veIVcwQt9xOb/X3yGuySmIQ3SVkwRHnKT85YCZafrlue
	gS82Gg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj034d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:47:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so30998285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988421; x=1791593221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNKPeOeJtdaJwaskI61OzrmziGwa6U3Z+vrqhZPHVsU=;
        b=dzqISB/4xNIp+BwJengjOd4On3pjUJCuduimeBbNAR/RBrbyVxDeDJ5BRhv5t49+12
         l7/YUfzPyVl80fhgnrsRS25aydFVvpxzr//JIpMA8ikVTqvOE2x7Ol1JlJl+aliIGjHH
         usUOYW0P0G9fSpuKge+DOS7NGO+46yqrKEfpZuXbKehu5g4tg5QgnmPeEhsF6YsVc2hZ
         fZuFFJr4rgV3IGD9e/LS+OB1QRf90txodGSd5krY74uLYOdYy27KSqCqQIrJYxgX3+Dg
         w6Et1vzCw0ZHUo8+/qSwBPWI8kSItqIJsZBxaod01kWXPu0WPp6TJtbrITuNENz04jGd
         sVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988421; x=1791593221;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNKPeOeJtdaJwaskI61OzrmziGwa6U3Z+vrqhZPHVsU=;
        b=hMn9HdUt2lS2dF+vHp0ayBsUlNbWO4U++65mSWNS2usp9pA1KmQNTVAcXroiIi3E3D
         Cm+gcg0m93f/C+dWMlAyKOH1kJNiTNzXkWJV56cSFctiJY4bMxoqLLcQr4hFX3GUI28T
         oh9ihhp0vyQ2qZ+pN2X7YovevIBU216gurhY/VFq062HMFxJk/Ngrk+xt12VGsTfvGyy
         cORhvsylHkwSqwI7t6iKIU0a3Trbgo1AWSKKu9iwPseOiPD9Y5ft8EJeCdfc1q9jujK3
         GhFZTVMmE9pm/F625ydlwBzq4c6x9NIgO/eRs22/Zd+Juj3tMaF+NyeynBVctoTMZ3FI
         4RPA==
X-Forwarded-Encrypted: i=1; AKwUvByo0dGXPopSVFN3iWSQfYA2NRkBT7XuvmmU9JkcJuwXj6AA1BF150fnhFAH2Jl0B2BV+wPeQXIyikJo1O8=@vger.kernel.org
X-Gm-Message-State: AFuF++lo0BR9vJ/Xs1JHPsnU9fMpUZXhVjfXM6xVf/zbCxLeO5W9EMxP
	hn0zDT6wZcXkcgiSfbIWicUjFpvfDj4/Rpurr4Gt7TvsISNxrs5KT8FVhILkAkpGVEDF0GOYFpL
	g9xfiZvEulQhvyNnP0l65vJsrCWLnLZAAwFIpGGPS+ISxkMymbtWVfCZ+iKIUHcQ7K/k=
X-Gm-Gg: AYBFou30OhnKHGvGhLPkIG0qoxcKo+aT+OK7chIRceM7Kw3W1M/p2JWKj50g9nQhC7e
	0YVhB5ZZIbiGNc83BCPnBcvhP5octsvPDzJpRUTe4hP+UV5uToO62qAl6JAZdkMOtKaWnCvOhcP
	x/ykPqtxYH+EjUW4u4mzf7SkG1E3qyDkEMyIDVexKGy2pzz2hmazsZA5mi89YrkHRisBvAuKW4e
	PcXOk12ZqQomZRohT4stKAJXsZWH2huvWk2amZ3MxdZtjzE2M/aGAG3IStckZy2jH1iDbQY/SMk
	Itm6f0a3YCn2gfsiP5UKQxFJd1Dq9M9DK0aZc6OMzAGpzpEgdpElcveko/1+a3BtNwwxULIOgiC
	bqwgfoOeSAc20gbuE/OI29jIMp6pgYudAPacAK13gw1xYlR/01Yu4jnW0YFCOxjahIhsjkN499t
	TOqt8aP+nXGWSd
X-Received: by 2002:a05:620a:4397:b0:93e:516e:a8d2 with SMTP id af79cd13be357-93e516ec2f0mr203569985a.4.1790988420933;
        Fri, 02 Oct 2026 17:47:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4397:b0:93e:516e:a8d2 with SMTP id af79cd13be357-93e516ec2f0mr203566685a.4.1790988420385;
        Fri, 02 Oct 2026 17:47:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:46:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix GAMMA LUT for sm8750 related DPUs
Date: Sat,  3 Oct 2026 03:46:53 +0300
Message-ID: <179098834067.3641559.16830029168243411653.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930152645.22194-1-robin.clark@oss.qualcomm.com>
References: <20260930152645.22194-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX51AWGaN0MNTf
 HQmydDLRPGqSF+37Y+cnpnjmhDDA/YO5HhnAaaump9ayK6xZRB+lKw2ews58Bsw+gLqzskMrWqX
 EFvChgYZ0a6CBcPFUhBGwnp5tCkUZ7k=
X-Proofpoint-GUID: Oed-PMDF2NAtKVaU_oJ7LWjOdPG6NZQi
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6ac05085 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=9kEJn9js-EPfIvdKjyYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfXzWhZaSmM4HPK
 NoVlw2KYL1tRtpUmP7ALa3bqAkD0lusNyQmU27MghD6LX43WwJ/hsZzd4CWsFNEAGpdQLNwpyFL
 mKs+ZiPal7TPkY3ch0a7lirqRqHvNQTfkZpkkG6eVTvUouzHQTIhl4NjQrfyc25CXaSEy8B5jkf
 Pdlsd8KdISdbMERuZEGwsXxeNxPrthj69V/uf9GQTffKaq++GbqIR0VyYK+ALzChJaVsDQMngVL
 BPwFjMYaGsK0FDBnZdBVHDMjsd6g/zSH6ipP2ANoYjEK/RE7VUuAqjmIdfoeoyjFUCEFKUuwYxQ
 hgBIXIZ/P5lm/AhvM2LvB/GQTXadEumO4NO+yBErsGuZG6ldigDyK6wYc8Zd8l9Hx8ygrf2PbOZ
 8sNovbXurBiTeg/SKsV4R2KoA+RAPNW6kUlOUzRiBGHSIEb27BIZmAeii+FlHIjaMTD4yKe+wcD
 Mxm8WEKdaXV/OZr8k+Q==
X-Proofpoint-ORIG-GUID: Oed-PMDF2NAtKVaU_oJ7LWjOdPG6NZQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030002

On Wed, 30 Sep 2026 08:26:43 -0700, Rob Clark wrote:
> Add missing GC block.  Fixes GAMMA LUT on glymur/knp/etc.

Applied to ttt, thanks!

[1/1] drm/msm/dpu: Fix GAMMA LUT for sm8750 related DPUs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3389406e6a03

Best regards,
-- 
With best wishes
Dmitry


