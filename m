Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4711EB5CE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790820542; cv=none; b=KSpaCZeZbATYv0RGcQU12DF71MHkO6Yi67JWGh/KIOyZCvHQ7IdM9/1bTE2Juxg1Rv0o9eHHp9vi+ILP5n399gU1JOEWdGa90c0hOw92e5R+bldusiC6oK3PvQPFOKJj3bNZct1OHACP+NXUVRyXQTjyPhMMOKPP6cNkyxtjNAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790820542; c=relaxed/simple;
	bh=nvqJHCANIoXVGxHP1HmuzW8LNYQ0bTNEIhhzUGY8EwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oi9XLkymh5EaB60bzEHa2ObHiJyk4dv5cz8yfdBbwNL03Abe7N5GwhxR5muZkwiolN9H7pHnRxrtzheEstXjmSusRebNHI62inxBkZYs7kfVIdVcXXGpy1HPGyfrLWbLQP+irfpEJ/0hD48ilWnjbcPZvfBl3yNeClFPuojuneQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElhKTu5w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeThhjuk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElhKTu5w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeThhjuk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jxl1868184
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 02:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=drdQJSVNiJggGHjwRXuZScgG
	pNHIrvBxG/h8lfRLgls=; b=ElhKTu5wAGzVyNoOMxsOnb0v4HyhDDgfaTmsZ0QM
	SHQblSGrjm0e56ZcyFeIU6VBH9P3sgpU4T0uiv2WnTEoMJM+l9bRs1SKx7sSwrzI
	Tbj0RXjAZFDaD0+UfS2YBNq0OIQE5EBBwiWxd2S19V6SmnqcNUSZHsx9QBt+5EOO
	wnki1f/InzmriZik0KuQ7moxI5Jy2qkyJPQIoBNNzEsa8olz9zqCWh3Dr5VdkiQG
	1Hxg+Y4biFVl0D1/C4TTEalds9kzm1t0lHptfEJWXVl4VT4j6QEEKJDKWjazQ98v
	ErWtyFbPt/GfDEU2KcJKQmURDRXIx3OGUCRGb7dZu4zy6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pj1vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:08:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso1216777785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790820539; x=1791425339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drdQJSVNiJggGHjwRXuZScgGpNHIrvBxG/h8lfRLgls=;
        b=HeThhjukrjN9h8knoxESVE7OpMvYKto+avVw7WeTGzeT7CY4Sm4wI2nVthIi2bCXeH
         qALdmourns/fe8dtnIpikkpObwGheAw0Kgf5ac8/vePHTum3wW5VcRqGA2zplkSVexVk
         7KBHMCWxW5b+laejHaVxl5oeWcQ5sgTU5swy67561c++6siSNp2HzbFE6+rDZv/JHD3Y
         lwuytWlnX1yKirC9GARtQSaNOjURLFfCteElfxTzpIXaakRKucIOEZhQ6R9LiZdHPHKb
         qgyS0q31aM2DPo3hGldILPHgzIl5JkuFBtPyFVM4T1/lVY2pKw+Wo8nK0QVOOWKllGEQ
         Z5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790820539; x=1791425339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drdQJSVNiJggGHjwRXuZScgGpNHIrvBxG/h8lfRLgls=;
        b=BjOdwiZOqVhFOgtSFGxOIX7fgMbWTdC1hkD+f2rMskXwO/BHq2MddRdq5l2ulwUvHG
         6BLocnTeAJoABVw6TbEjOVW7NNiP5Bh99kLHuSp0WdQ1ATFrGatcNSqeSf6Qe09dxxuv
         vlW3YrTxeCdQbKkqaRnj4ete1t52XBBv3zGBP/sTsIkq7i42frOF8ut8dgHxifA59Evz
         eLCTIhtkCtjqagnpkIBY+nawObQ7+/yCHOfPGK22XXfutdOp7k7sW/YnU+W3t9/Hr+2E
         KiLRIqPQnAzJC6C3fwSTl0H7Fx31BrmesxbVPP+I4WUvrxxAw1pvuWdEqbBeMqwJHhKr
         ddrA==
X-Forwarded-Encrypted: i=1; AKwUvByd1YmSTTgSXNu8/z7CCpeiWcAfWLPIS501RvcC0Al5uBKUcJLhGbsX4vBlb9Cogk7WKXnvzAVRfCvOQPg=@vger.kernel.org
X-Gm-Message-State: AFuF++lGrObDWuoxA8If0iMpbYZfjCdRu1vQSQFaY/SEkwZBPHF40bSd
	tmOCLjjrXLjsO0SllPbHtFPZ7asV5+hdjJxIToGeskU5eGDw0X93XCglCK0UCQoYQIlHUMmDBzk
	E9kwwhXUk0kCrSzyBkWCzt/c+RNVn4/9rbqbgR+5LQsw2HRuKa0t6bpbeB+kZiZpCqYQ=
X-Gm-Gg: AYBFou1d8JeNvwZAhwncrzXTceuh4tgYvQRmMWxHKDjy4052XlgNMUuJU4xSJCpEfAG
	GXxIQ1xjEFenZSh9su/a6DdwnGo4k/ZneRrwYgVfZyQ4LjTgyvWiPv6PArmhKvx8lZMY9IHn41x
	tvuublU3hPOS9DZtudSWItM3ZCM3HQJRmlitQDn8z0+S+vQSsQdtRvVn/ENdldmmZahswU52v9F
	SrwIHTgQDlbZuoXjNaDj7KFk/r1oqzlBy1cKLq/Z3pfuo7tY02s8sEM1sq5WAcJjcOJGk2mrsNI
	fAGG6RACaVzzd8gxpVTWFDPrk5BmRg6NAo0wMFKH3Ibd/ulrb8zne27WAsJFofCULDcd3gZxVNi
	7YKvBgQ4cHAiEIcEULED8nru3qxS6HNxhjXds59m0pjuwOsC0cJAB48CYtHcj0aI456AoOXHMDf
	kxqIY2CZSHBcOr
X-Received: by 2002:a05:620a:1a21:b0:939:2c5c:7977 with SMTP id af79cd13be357-93cac0bcacdmr602120385a.20.1790820539152;
        Wed, 30 Sep 2026 19:08:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a21:b0:939:2c5c:7977 with SMTP id af79cd13be357-93cac0bcacdmr602115185a.20.1790820538481;
        Wed, 30 Sep 2026 19:08:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb1e05sm351568e87.30.2026.09.30.19.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:08:57 -0700 (PDT)
Date: Thu, 1 Oct 2026 05:08:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Roman Demidov <roman.demidov.nn@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
Subject: Re: [PATCH v2 1/2] drm/msm/a6xx: fix use-after-free of OPP in
 a6xx_pm_resume
Message-ID: <dnf7zmshpgt23eaom6pxcatxusouw3e2yt2kix7xkl2f2tkl36@f4n7yulqgctk>
References: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
X-Proofpoint-ORIG-GUID: UButSNFGzPsgF7taucaOReU5Tb1ZkFkG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwOCBTYWx0ZWRfX5iTdX96fJtdL
 r3zvUeVvc/ycXw2rlH4KuxVg+8QrCeGqnOCA7fR1GEO1iJGljKE7r3peLOC2EMzAscsN4xaFnpc
 UHrlhd7rOdmqMvfUNB/SKCZJMov2HKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwOCBTYWx0ZWRfX6iKzd6FYCruM
 JDQ0JJ0dM0bzbtKZYP4fKP9lr06pFyl1fUlVpMtUB1YfS++JKEf7qgy7u6x1wmHa1oZPhfCiC8+
 W0IkSxmYqCJ9/QJ6SGewOrVM8RFJx92jXn441yRiPtina1S2MImPlfqO1abxifXHbX+04z20+M8
 HfmGEN2QKNh04Hof4bjQzeje6yY4Xlw+2thKgEE+gL64nIIxpEq5mkOutIOyvYCqQHxK8oI+0Hv
 xyHWL9EfuphKZmKW1l6PEdPqLJcjR9VK8BAB2F4za4TJNK9GhEae78rDUtV6hL1hk3BgIVvfz2N
 WKStdAKy/PirMLmFRQMPidFp4V9zwX2Lz+nH2+VduMR/icAlzwZMP8qsFC1W2jYkqU48KGwlc5d
 2CiAhU7H3DeSZgkZjsB8pvYsTQfzCKp9uwLwBhSxZ806Ubu7zTjz4N3HJ7fdEIKx/6ToOg6DNdP
 hlsBfl2q/F+cZ61TIrA==
X-Proofpoint-GUID: UButSNFGzPsgF7taucaOReU5Tb1ZkFkG
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abdc0bb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B-1eJkrdMcac_h5ztLYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010008

On Tue, Sep 29, 2026 at 05:20:58PM +0300, Roman Demidov wrote:
> The OPP reference obtained via dev_pm_opp_find_freq_ceil() is dropped
> with dev_pm_opp_put() before being passed to dev_pm_opp_set_opp(). If
> the reference count reaches zero, the OPP object may be freed, leading
> to a use-after-free when dev_pm_opp_set_opp() dereferences it.
> 
> Fix the order of calls: first use the OPP to set the required
> performance state, then release the reference.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> ---
> v2: The dev_pm_opp_find_freq_ceil() function returns an OPP object with an
> incremented reference count. Dropping this reference via dev_pm_opp_put()
> could cause the object to be freed if it is concurrently removed from the
> OPP table. Fix this as Sashiko AI <sashiko-bot@kernel.org> suggested.
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
