Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DE7348C6E
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333613; cv=none; b=V+XH0goDs2sg1BkRJamu3yUbx2Ac6LvJa9VVKa8syxzHF7HZZhlk2DjLxzYQOTaiwHNZ8wNBF+tVsZsXBz3B63Yn7CkV4agDoYHicnLG+VM70bnHh/Whw3R6ORkoiazSmGMknrAokKSt04Z8Ck5Rz0lICON6CGQDMntUpOcxSRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333613; c=relaxed/simple;
	bh=Rc3rXnon0EQSw8KwGfyrwFTj1nXUy4ld2WfIZRqodMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9Yt984eM8rIs+jQh7bp/CevZqPzntmhfU2ydsBmMe6rZHYR4MXu264n9oMA4XkAx6OBFB+98RT3GmrSFgtZfM9iczhKpo3AfYu1jVzQhuTQN5yn6qHENtGVTnsLFhsXK0klTxIXNhBBIX513ff2kfO4DrWcZQyAU2RYZb/8lQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUJA4TFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYMYlwGl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUJA4TFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYMYlwGl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxi2M2164353
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CuOZZ+1bOWWW+56MFTScBnnN
	4DrpUl8zDP2tJWpYYOw=; b=IUJA4TFabIVCWVLJ1k/WNtI+t+aNF4Qx/N+NuPlV
	68/LKjTRHsxloRbPMOP9GROn1MsxIvCQ1y5nvma6lCKtf7fzdgWpv1Um4mzXF6Lp
	vDgBaJX6lMidWRDmOdD6xYM6Y1KG+tVTu6Vm6+PiG4nApUNcMMpJx0Qw3+/o7vE9
	AZf9HERE6fg7jIDNVYOS1KXlGSHugVq+a5dAI5+iEOj+fMrdiIomtb2LELvBXz9B
	r7UUwg90f2kNKp3gYNVEVDoGykOu6t/W414oHG13WMIlXeu9x+aPUdulM7Dz7GCo
	K9zOfaNb6rwR9aWEwP1uPuaPwvkFjyzg2IENHs/MkcctOg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd460t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:06:51 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7961a79fcd8so166784137.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789333611; x=1789938411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CuOZZ+1bOWWW+56MFTScBnnN4DrpUl8zDP2tJWpYYOw=;
        b=VYMYlwGlODQiHcVaOkR0bgVwtdbSc/YJFi263TF6WZH9HIwm0IMQD/5wPJdzEa6FlA
         6j06ssTMOSNiWphGb9enrecP9GHW7ONK/RnSRW1F/TbNcL0uW+94m9GZm134/Pvi+DTd
         Ztszv7Lzx//GKh+mjcqbR8hON+v6s14dFdSw81heEThdnTicia94Yia2YzGkC07p73dE
         grb6lgxr4Hslrg4M6Zgfbv61KAxhr8l+p9aPh9ikMt4iOisqXaTB8Dy+qYQGhC4TNiMj
         8zCbUCu+BbrrP5mhpnqTP5oDuiLX2CExchKxxzWPYc6GKvftAh0Hw3sfQLwy1QkEFn/k
         i5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789333611; x=1789938411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CuOZZ+1bOWWW+56MFTScBnnN4DrpUl8zDP2tJWpYYOw=;
        b=eIKm9w2G23MOY8k004OU6GT7S/4FY/OXAmdKKOAwMgbsLI7TTVuxyExNLgPMTOdzo6
         nYH8U2KEovKZUY91vnFwYRk6Ghx+Ff5PkM4qb2O4HCQ5zm4BxuUiDPUvIZheYKsMEdqh
         L3ws5a7hoH5K6t431eQnmitRsekeboOdqkZVuStpkqAJH5I/QasJnKEFwlMFNvkfJEoz
         FfAFrJlK0BoRbYNbwGoVX0c9AGCUKs8jm2220lGvwVz19Lc4yEPVw4pgSa6LeI+cA8+M
         0kFvb0lLFRHkTIYVCz+2C/gmwDGsU1YdRFj7dzsz/n/SdlsMY02RjLRjtCMVsvEqusng
         HI8g==
X-Forwarded-Encrypted: i=1; AKwUvBy6Ga1qIWeIkcR/1268bsfozyB0opKbijwHsXJ/S4RhDiKqwoALrnjLUh+/ch8MtJ6z/sAl2ZaFkaDPgN8=@vger.kernel.org
X-Gm-Message-State: AFuF++l7Iciiv3iGCiTn1b3uuMuxlu+lzyA6/GsI0G5V+m/ATQNi/CR0
	5NGshOoxd050SGbvudh+oOqanEPhjzFuCI46v2UqnPlmxr1kn3jWn/pf5+4mtMIwjSr0LdqRvbw
	Opc93G7GlbAY7Uzxm51Gq09XgUUT7/B4Y4xM6RlYgJwbyEf6KKalIdXZt8CRP1nyjAJk4peUX+n
	g=
X-Gm-Gg: AYBFou2wEsiF7/AaWBqz5taRn8pptaswUP27crA0stxflRPBFBC1eE6LY8JTyVB8mOt
	jyaRh7dROy6lzVnAqav2k7n40o2g7WHmpnffOKyqs0G16Wsbvaim0SHceC6SHIrLwAFeyr3WBt8
	9IQ4ggmqU11iyBfxZe7D4WOSNX3OaXHOYNO+Rc6YspTtOWIxpc42KTcwjETlxP9gSkGovn5qMrd
	kCTTgoPXhF8rENaMq+RM4P8EXe5o1HPktAdMAOR4Ph5IbjE/uim0/ySLYEPA/i+4OqYYmZuwdNF
	T2AbzXQ7rUVImmMRWOxojqX9znb9mbxCObjN9tn6OCHqQX56FlNinhsDSn4SY/T9ILnrfuYOBwG
	9RChHtmenfjr6XKK+Ij2o+P+h0sK6omoYiZ1R5F+SrIBX5jN7e+X16SeH4pLmC47VTBnjj8KpGF
	Q0eXjdoaaxXScl
X-Received: by 2002:a05:6102:8607:10b0:78f:5bab:4761 with SMTP id ada2fe7eead31-792a93b4e87mr2736747137.8.1789333610782;
        Sun, 13 Sep 2026 14:06:50 -0700 (PDT)
X-Received: by 2002:a05:6102:8607:10b0:78f:5bab:4761 with SMTP id ada2fe7eead31-792a93b4e87mr2736729137.8.1789333610333;
        Sun, 13 Sep 2026 14:06:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a045f6f3sm1914073e87.35.2026.09.13.14.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:06:49 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:06:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: fix autosuspend cleanup during teardown
Message-ID: <vwnlgp3ysnoimdxlx6gowktonakwpita2ted7tcdfd3a6vyjy2@p3slguu75r6d>
References: <20260808131624.2854412-1-lgs201920130244@gmail.com>
 <e5964398-cc23-440c-8c69-01353b5a5ecc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5964398-cc23-440c-8c69-01353b5a5ecc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7106b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=owhB9EOPmpqNCIfoPYQA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwMSBTYWx0ZWRfX6a3l+REc5Vjv
 SLuFiJ1WQ8XgHNgqtsHC/uIBwDyDEhsADQAfc5Bx4yd96eRco12+wUuZd9NyTJ36jt4/NBdDUhN
 llGXb+ivUGZAaPV3uLnFrnPj1Dy0SokuHX0aFoO5AjWdP//PAJWp8Yoa5jxY++H4DR3GpJJ23Pc
 eMsNQKdQ1DuGXjMXuogDrZOeCMdoyR34+G9q5zSkjtPj1mkMK6qdkFceom91euz0OdZjxJJo7nN
 nk10tWrCIiwWCma45AenfVONMTiaJddrZRQA7dfa0U8JLkTnukDA1Vvmd+H9oKVuSlqEDH9KH/+
 UC3MDvDD19GOIw5EwhjRdQBjRckcQZl2EM0D/SIgLWAQBnh+0qoGgfjTm/3mLEGzR6HLtfEAkP8
 a+Q3+M0n32GqN9RsT8B81QbdrRGfU7tDfjTP4MnjkD2pU9fFOq7rkM8u0jK1kGiuCs+k+5YWNS0
 CTKaY/5A+Ovr3wx4S2Q==
X-Proofpoint-ORIG-GUID: 9Xnr2YlveB2xlYcWazMfIdU1-at921s6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwMSBTYWx0ZWRfX3mNc4JWD7EzX
 /22J1M04eYkZxxx7HzObiZQif2BlvRFNKXtvU05/JRLxAsyuEz9qK8WHMGPgX71g7vQWD6AvuQE
 M4pn5L/c05eCH3Cpllo2U8ICO6unx6Q=
X-Proofpoint-GUID: 9Xnr2YlveB2xlYcWazMfIdU1-at921s6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130301

On Tue, Aug 18, 2026 at 12:40:27PM +0200, Konrad Dybcio wrote:
> On 8/8/26 3:16 PM, Guangshuo Li wrote:
> > adreno_gpu_init() calls pm_runtime_use_autosuspend(), but
> > adreno_gpu_cleanup() does not call the matching
> > pm_runtime_dont_use_autosuspend() during teardown.
> > 
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped and usage_count remains
> > unbalanced.
> > 
> > The documentation for pm_runtime_use_autosuspend() also notes that it
> > is important to undo it with pm_runtime_dont_use_autosuspend() at
> > driver exit time, unless runtime PM was initially enabled with
> > devm_pm_runtime_enable().
> > 
> > Add the missing pm_runtime_dont_use_autosuspend() call to
> > adreno_gpu_cleanup().
> > 
> > This issue was found by manual code inspection.
> > 
> > Fixes: eeb754746b14 ("drm/msm/gpu: use pm-runtime")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> 
> I think we can use devm_pm_runtime_enable() instead, which will take
> care of cleaning up both the autosuspend and runpm halves

Not really, beacause the driver's group device is DPU / MDP4 / MDP5
(in case of a merged display+GPU), so the patch seems to be correct.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
