Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B977B4C14FF
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955469; cv=none; b=g1pXjmOmUMtwwhsJKb9n8Nny8oSV1Ke83Vyv05gSf0/XRvBntvxnczhiVJfshhjQGK9PowV1ZBxnyWKR63kkSiwvUrs7CHUjgb2SxwzFVbjGsflwBZRSVzwxexQ56uY0vfvgQV2TM7euFtIUcn4hIOA8jdc+IO6tootsQfQNgNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955469; c=relaxed/simple;
	bh=3mPmvOl5YltUT/eb6mhB7ODh7fq6oO65Q6u5/XaQK5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcZsDyEkLmQPR0N35yHC2wCP88bcK/DHzCCjAh/1Ztcp0sY/Yz+qYzzr7fDueqVrFUKraCjd6H9fnlan3Aoj4iefDza+DH0EQA6IOVozBC09OgDYY25zXseJ4okOgSZL0V3zuMctLAMyZddBWNJZZTXUHJbAflX5SvEYi1HDWx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ho54ubB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1Lekkfi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ho54ubB3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1Lekkfi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGpET1246238
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 15:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h4g/WPviei+C6SLy/mZQbFaJ
	FBkh7Ho9Q8Bl9QVgB5g=; b=Ho54ubB3Nd9JwBssip9zGOvC9VCZgXFbNytV2Hh7
	DdH7Vo80XXAL+1X2naRzDljJvgK5Q/BJ6mCT1ToE5Whq/1FPKn4NWxXsLOYt2nIf
	CI2LeGV4x5aGOdfpQ7/9Kfs4pkKOgvJ/u1vWU51+AqtbHwg5Z8diGBIwRdgbNtlF
	2int0ckx/qSIyil0xqf9xVdIUrHnugtm7bIvbZ6wuERg1XBYXhIke2CiHAjgQPg9
	09SikmLLncLqXO/u8tqHMtkiXqY9OxlEQxJteb6QtosgweJUodLQC1ZB4CibbA2V
	PS6gi8w4H5CCizcgtuxWgCfq1QCoSyEfWK05OFT90CQkuw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3d8343-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:37:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c124d17880so202667137.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790955466; x=1791560266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h4g/WPviei+C6SLy/mZQbFaJFBkh7Ho9Q8Bl9QVgB5g=;
        b=Y1LekkfiAgvUFsiaLZL73/n8CY/Fw4cOaiwlA/1LnTdU42F2jgd2Mxq9sJZrl/MVvy
         3Rxbh56CXHwSxepcqbPY4bRD8sFUxrhg8/rPpy3j+donsn4c69kOf2X2AYu8bLl3GTMt
         Iwfpa2lzEpclQJ2Fi6MOWK3jwPz5/tPZDxxsBgX4kjSDucK7ufuaH6MI04FsysmOLC/8
         CBwxJbY1qJmRR8ztn3YHXRxWRnuY21QCyOcMuZd2j93tZ6kV4kxvQypd/6KQHLkk5C6w
         LemCPLHWHMHqpQh++l0IJqsHV3El8K/ROum1EBssOYjTpBLnU/sqop4t3mCNAFL4yn1+
         hFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955466; x=1791560266;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4g/WPviei+C6SLy/mZQbFaJFBkh7Ho9Q8Bl9QVgB5g=;
        b=POzGAqeZlfZMs36kdtKEaG9Gs4TGxAN5OP4XJvbzc5rI1KWx49DN3Z8WRf9wwqgVFZ
         dI6ZwVjfy0HIe8lVqzFbHJJXACi4AcPkSjn0/62xA4O9gC7741mSqG5aKYXVATt/Pxeg
         ysDqY5tNhb+4F9ZSNKAsr6gQN22A7h9488c+3xNlgkWuBqBMndZn/6fY8oWsb/JAZ76c
         VllirQXVHBJeNKKy3vvlCQvMhZFX+Yx9D5ottTCXyaGH9mRdKE6KrbH4dH4zAE4Du4cz
         ERwnEkjKFAaftTnYBFvKiSYMH1TKciwOoQqJ5dn1/vDAew6qF30go5lbtdVnXzq1HxIs
         cRLQ==
X-Forwarded-Encrypted: i=1; AKwUvByVrY8eg6V3uNjef9Id4z9BHRS5/Yiy1FqyGb1AE/09/tRPf51YrgVtVIexWDW2eQSQJbv1TDmjtIymivg=@vger.kernel.org
X-Gm-Message-State: AFq9FYItvUxeJKsAC+BddfUGqpoyGty326EsIkrSmvce2GIhGQLCcfLE
	6moaqFViaT99LUEt5+SmIpML11INtZ7jEz6KzJi7HYY8MzerUvae/E9E6dpdn5+yt2gOvlILpot
	TkBuyUOzXim4kRxgaLkV+fCu2MceGa83gJsb1C5t4H9DiKlAwPGpYXlqC6ApBesF68aQ=
X-Gm-Gg: AYBFou2LFXsCODOKTtzRlAkv5jQ30OgM9oHtpCmdkrusW1gNpK78tVtBTJ+JthReWb0
	5Qi1Zqvpj7u2dZwdL4K3hsKzW5gSJZ96wcd6DnL6N9ibfuPO2QrCDaliDeEx9dz8C1y/RthH82I
	rFNESKgjso1CrvF2rSKD1Wgoq7IHi3wI7WpRPmfVoWg3gZDiAZbdrWJofjtsenQmrF+nsXFyP44
	BYLwpzvPxWrTFObb/VwLCUEOBiKC6g9Fx+VdsWJaV+1/G3+3dU9zQTFxCSudfPN3YoKbYIGF+PC
	QzaBx3Tcwox+zOLFn8+LPQLP2Rr19GMSGKbF87b4swDvN8AL+22WY00OWiTPPE4hCrUsJHKhZtx
	PZzhqOodseODpeotkB9K414qcIPL2MEbRoC9y5Fh5dHb3kgBHH6AZ1ZDuB/hp+YeE84EXfc270i
	0fkZaOH7HInCo5
X-Received: by 2002:a05:6102:2ad0:b0:7af:51a:de01 with SMTP id ada2fe7eead31-7c0f4c9a360mr642495137.19.1790955465685;
        Fri, 02 Oct 2026 08:37:45 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad0:b0:7af:51a:de01 with SMTP id ada2fe7eead31-7c0f4c9a360mr642478137.19.1790955465135;
        Fri, 02 Oct 2026 08:37:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7abcbesm825562e87.63.2026.10.02.08.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:37:43 -0700 (PDT)
Date: Fri, 2 Oct 2026 18:37:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: compute the CRTC bandwidth from the
 state being checked
Message-ID: <nixnxmt6flxt5wlibwi5bkb4l5yggh4lhgmfvib35lzx5jqiwv@3jsm6ydhxxki>
References: <20261002130656.50577-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002130656.50577-1-26rote@gmail.com>
X-Proofpoint-GUID: yfW1qLxqMIZBzmbRKx66dVZ5lqSGZniR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MiBTYWx0ZWRfX67eerN+Jx16M
 U6rBevtWpZQUM+LzrcwMby4PKYmABMttYVh5GEhBc13rBcY+y5otCxMPLtYYaX5QRzNRRk+3h/n
 SGYZWXXNJk53z8BzWJlRsmFM3qPRa3M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MiBTYWx0ZWRfX2xY9W6qvyKku
 tBfrqWF74Hmjq+b+INSGRJi+Sqwu9Yd//BXLBxdYlbGWxu2tDK34in4vKPrJfbitUoE1CaLdeZU
 3qL4VRjnx/PCFXr3aUvjY0MDB0xkBijJ1sT7ZjcZ5HxIoafYki2yixe9Txao+Shjyh1GbpEQmkg
 M4nwCUNbciYLkEXg2xR+7Y1EwEHlvhhFa3ikMQEcYLg2BvuuXIFQYrpdrvG55QbWaajsaDBdZxP
 2JoxRL7ZkNjideT9RqJMzTNysLaeg8+zX1eC00OSz6MQqvw/I7AVLr9Z0S0yRUKaljz7BaSpYbA
 fDMVbyAgH9Wujy1ylRNM1Nau9J+4WHABAwYm7ttU978qbhDqfcHkR3OLUKUoxrNu6om9lvxfKrP
 EN5FaRF0ImOF5m2WFkwhENHJ2KIyc4L0yNB/YAmszmtX+/ld8oH81M77FnEAJ//+eN49aAsERqF
 09wuj776O4lbxtjpj1w==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6abfcfca cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GO0EqH_1EsdgCyMpDf4A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: yfW1qLxqMIZBzmbRKx66dVZ5lqSGZniR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020062

On Fri, Oct 02, 2026 at 10:06:56PM +0900, Joonhoe Kim wrote:
> _dpu_core_perf_calc_bw() is called with the new CRTC state but sums
> plane_fetch_bw over drm_atomic_crtc_for_each_plane(), i.e. the planes
> of the committed state. When the CRTC is re-enabled (DPMS on, system
> resume) the committed state has no planes attached, so the check
> computes bw_ctl = 0 and the display runs without an average bandwidth
> vote on the MDP path until some later commit changes a plane -- which
> may not happen for a long time on a static screen such as a lock
> screen.
> 
> Seen on a Lenovo TB323FU (SM8850) through the interconnect and DPU
> tracepoints: after DPMS off/on or s2idle, dpu_perf_crtc_update reported
> bw_ctl=0 and qnm_mdp was left at avg_bw=0 (peak 800000) instead of the
> 3728793 kBps voted before, until the next mode change.
> 
> Iterate the plane states of the CRTC state being checked instead.
> drm_atomic_crtc_state_for_each_plane_state() falls back to the current
> plane state for planes that are not part of the commit, so the result
> is unchanged for commits that do touch the planes.
> 
> With this, bw_ctl is 3728793600 right after DPMS on and after resume.
> Only tested on this device.
> 
> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> Changes in v2:
> - Drop the code comment that repeated the commit message. [Dmitry]
> - Link to v1: https://lore.kernel.org/all/20260929130633.977-1-26rote@gmail.com/
> 
> _dpu_core_perf_calc_clk() walks the planes the same way; it is not
> touched here since I have not seen a wrong clock vote from it.
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
