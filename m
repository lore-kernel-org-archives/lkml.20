Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8337E3AF66F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790823027; cv=none; b=UaeFjd5oQNPFP1GgnEpvg1jbLT6z6aOLEDlBpqKNbkCZ/sQKMEbFt4i1YZZXC4XSJDmajQLEg7zFEUwFEZdUDKhV+Lhe5xpAMmdt+zxMyxMSRWgeXAL4+pUR+Nkt+mQ1GDEQiE4iNVcZZAk1vTdtLRIrtUdcELmU/CtmnDZTPdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790823027; c=relaxed/simple;
	bh=4WuyCuLQaT95cSINr7wk5/blLuWzFiAraBb7+MrxSIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzhiSon7q6YABckWwIjVTVtJE6RPZ/bBi5Ia8Tljs2qwC1UZOnJQeEs782b2bXB1PN66H4MdRlj4NEI2BGg+Wt5cVNcQLoBodTuO3/SoSFJxiSjY0SvN5irqirhj3qWkbPomAwYTAzx7VhllDhpHiOdvrU14A7gSAG9iITnfF24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJhyWTby; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZlHVUn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJhyWTby";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZlHVUn3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910kDcp720140
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 02:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xn1eHsIfFrbIrU2VWkWaw0Rd
	lkAyIl9bNfmyYQyox/8=; b=WJhyWTbyv499wJmgzgNJMqSXaS8BPSLaH+d73ccN
	dqnrjaT6W44T0ffmxyr+dsIRUpSv+Cpve8Df37qMEEjPxqJsnLUaDH8ucnrYUIcZ
	I99Mcmg1DyK/3cTITGyl4qcuGcF22GLS79oNVkHxl18+8hWBrmCCI53H55pra//T
	+NSHqQX5BmBxr+wpWcqZ8DqEtpyFFkI1HQ+Nw4W5Q7fet0NuZ9QHfrblUFAFIm34
	/pOS8zmjGFtu8UGwBKGfV66KefqlS8nA+Kbk8XPiiG+VDyb8aiy9lN51Vf1xBvpa
	nRLx8XN2ix6WiyQLE1YPDn8rSj9EKhZquW6Hfr6MPSngoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188sse68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:50:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cab33cb20so207486185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790823023; x=1791427823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xn1eHsIfFrbIrU2VWkWaw0RdlkAyIl9bNfmyYQyox/8=;
        b=PZlHVUn3ppR5Ip5L9FfqTgvGjquo+bCGA2FQAa+hDknDi/CM8VwUUo2D1xlxdr0oks
         /6W+kpEZaXZH/4uX5+L/hOStiagRAiBogMjqOw+cv1Agb/kVynD/rH6ypzV4WoSSRQmC
         oRq8Zy7GLnMsMxf/HpwoHHi0AtBcT18sbKZPZ0iIbU1JP9ThJsYkWx89sBL7Rz+5XAD6
         n6TvCz0cDi/p///iMRem1TdN5hITgHLwF5cmHf3JenHKbP3HG0NF3KQwxnLyI6+3utEv
         4wjns1aXfmqnpfcafDpmsiExB7AGWVM9XSow0/ycGcHkyogO+zj0iWvKOKkKaiIRP4Lc
         Dt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823023; x=1791427823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xn1eHsIfFrbIrU2VWkWaw0RdlkAyIl9bNfmyYQyox/8=;
        b=wjcJfyYJQT/5W1j8iNLtweHjaYhKPUArU1+f7Zn3x0Ylb0PPgAtMhvjFdMpsIuSZIo
         gPjnoDMa3AT8eEWjpS+pkGUlVIUimV+FgyQ4w7ga3SHtppalY7OllCVb1d9GLKXO7kVG
         nO9a7fj5jlOci1Kj7/zqVc9bukaPXEYxW+R8O5zYjbZvZoqAhBXCTYcI2zZ4XoaFfUzd
         4IUE9m3AafmSmb9uOqWRVdLZy12fSb/+kzelFvqFYFiSKw3HapE4OVIF6wcM0V8npa0H
         9UjiG6AA3pDraHmbpQ2zk3H5Bs75gDGc9xQuY2vnTHz8+oJsWOg03YOVRqKDazbaPf4G
         omUA==
X-Forwarded-Encrypted: i=1; AKwUvBxWGkMvgncymxnfaPL66UgSyr2XvdfmW8Z9R4vm8Ro9rQpfmIITR88YZyiYdv2H2FA7v9s+/7pLendc4uc=@vger.kernel.org
X-Gm-Message-State: AFuF++kFjAcg2SVH8tGCjQKV393z+2/RG4LoTOs8C9/y+oWm84OOR+gk
	DNzuMjkYKvJrpb4/1x9MjVVHhZFp1P0LfG0dgLr8983WJ/l3W+PgLY4tSoKjrM/hU6CyK2OmDRF
	7v1TJ+F+gdWpnD6JkgB+QoEbeRel44WRnX+fzmbcTsDc9Tw9T/UCfG4zI2d2EGWqLuHo=
X-Gm-Gg: AYBFou0qDmKNIKKDwBVjKIB2Tn0fVkWRHbMp5TjJKlfLnixTZ7MDQ2AzFLHhNfuLpZi
	JlDUVSHbZgbzU4obFXDEt0Qu5RqwryE3jZ72eGsILodlizUfhM7KoQoNvRNswxeFzrpR/vbkfDH
	6oPy6mMTVnn4NSmY6czhYKnW20VJOTjm97pwcjhPjqm5Xcz3LoHO9KFwju3gztvHT5ce/2Z+5Zu
	35TK7PfmKEHo4kqT2iBck99XhoI9A08hcBdjhQdA8bEB+zMTppbZBTJaPLHRB8ZBB9m/pNsvcY6
	nuwbdlKBpkzxb2+RBi4HBJtVYo+3sMs8N06C0PPZ6RDQqviKzlenGrbGsRdzOm03e33yFgTOAX2
	IluIAxBTaBNO4TJkCwXAzPwKebO4ameuexn9aNcASiflb7JYGv2dAXeIOIT5Tt3seknTj2iMY9Y
	DYanW0QNoFZrHA
X-Received: by 2002:a05:620a:2719:b0:93c:6e7d:da68 with SMTP id af79cd13be357-93ca9512ff6mr525949385a.3.1790823023145;
        Wed, 30 Sep 2026 19:50:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2719:b0:93c:6e7d:da68 with SMTP id af79cd13be357-93ca9512ff6mr525946285a.3.1790823022570;
        Wed, 30 Sep 2026 19:50:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb8616sm367486e87.58.2026.09.30.19.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:50:21 -0700 (PDT)
Date: Thu, 1 Oct 2026 05:50:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: stop the slave video interfaces before
 disabling a split encoder
Message-ID: <rzfyie7yah3c5ymterw2nkbyex4xw65heszybuqkrtvmtmmx5k@gcgxglxsfiaz>
References: <20260929174819.3855-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929174819.3855-1-26rote@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMSBTYWx0ZWRfX8Akz49wGA6rx
 qiftWHzmUZp0yc+TxUZ5Gzi5a60OznjfBNGZeyESozng/au6kMiVlLPPcSgBa1uaE71ri7LHgun
 4dBU3rv8BOcEtkqCqOd9DAwYlOD6U20=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abdca6f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=gxmXS1c8SbOTWsDyRUkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Yy9Y1O3DS19mwS6vztS9LDf9HNUy1hxV
X-Proofpoint-GUID: Yy9Y1O3DS19mwS6vztS9LDf9HNUy1hxV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMSBTYWx0ZWRfX42k+/mKmfyoy
 xRAtn+7u7yauGBhqIXrhgKRc//mPQpTnKZ1NdW1JiAbioFGHstBAWGW1AdypjfntB4ILCPtmGXy
 T4tOO322y7tVi01sb0s+oFBh2/U9lL/3Vo4PbpTwJnFj/6Pv/PsLHbjdraUXFAD613YJy6DHfA+
 WvXd8GCvHETcjeNTCI0ep7KAe2D/tCWPUHf1BWC3wV3vVx8gAoMCZqHll8BVyCxc8OtIFhsbKKO
 86yP0tsbCAIH9UlrIK/5kE8NwpBSP5l9MFRQMpyoLT8GoZA+24jOY4loAdqEfcUZfZAKjJlieOm
 Y8IUtDvXKKv9+shJ0njqF5jIbQ6NoMv5XRtEP5NVQOaLNcWMZu7k2vrNEmhW/oPQPPhGaJWgL2C
 VcT4aiNu7iuLdSKMEOw990ccoVZp+res8JAJZj3m0uTxDv3egQ00Fx4ccqCD2XCZ2WG6hAmYA74
 AYxgFosAxGQtpAoq57g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010011

On Wed, Sep 30, 2026 at 02:48:19AM +0900, Joonhoe Kim wrote:
> dpu_encoder_virt_atomic_disable() disables the physical encoders one by
> one. For a video-mode master, dpu_encoder_phys_vid_disable() stops its
> timing engine, waits for the frame to finish and then runs
> dpu_encoder_helper_phys_cleanup(), which resets the CTL. With a split
> display (two interfaces driven from one CTL, e.g. bonded DSI) that CTL
> is shared with the slave, whose timing engine is still running at that
> point: the source pipe starts fetching the slave's next frame and is
> left stalled half-way through it (on SM8850, SSPP_CMN_STATUS 0x10030
> with the fetch and unpack counters frozen, where an idle pipe shows
> 0x10003).
> 
> The stall is cleared by a power collapse of the MDSS core GDSC, which
> normally happens between a disable and the next enable, so it goes
> unnoticed. When MDSS stays powered across the disable -- a full modeset
> within one commit, or another runtime-active user of MDSS such as the
> DP controller -- the next enable of the bonded DSI panel scans out
> nothing: the DPU keeps committing frames, the layer mixers produce no
> output (CRC 0), and the panel shows black with the backlight on. A CTL
> reset at enable does not clear it.
> 
> Stop the timing engines of the slave interfaces before the master is
> disabled. The master keeps stopping its own timing engine in
> dpu_encoder_phys_vid_disable(), which counts the final vsync before it
> waits for it, and its cleanup then finds the slaves idle.
> 
> Seen on a Lenovo Legion Tab Y700 gen 5 (TB323FU, SM8850) with a bonded
> DSI video-mode panel (CSOT PP8807HB1-1). It reproduces without any
> external display by keeping MDSS runtime-active:
> 
>   echo on > /sys/bus/platform/devices/9800000.display-subsystem/power/control
> 
> then DPMS off and on from the compositor: black 3/3 before this change.
> Every full modeset (e.g. a refresh rate change) went black the same way.
> With this change: DPMS off/on 15/15 show the picture, with no "wait
> disable failed" timeouts. Only tested on this device.
> 
> Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> Changes in v2:
> - Stop only the slave interfaces up front and leave the master to
>   dpu_encoder_phys_vid_disable(), which counts the final vsync before it
>   stops the timing engine and waits for it; v1 stopped the master too,
>   so that vsync could arrive before it was counted and the wait could
>   time out (Sashiko review). Subject updated to match.
> - Link to v1: https://lore.kernel.org/all/20260929130621.943-1-26rote@gmail.com/
> 
> Saim Shujah's "drm/msm/dpu: clear pending flush state before physical cleanup"
> (https://lore.kernel.org/all/20260826182459.1506522-1-saimzst@gmail.com/)
> alone does not help here: still black 3/3 with only that change.
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 33 +++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1f20695f81e3..2f8b6204c93e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1380,6 +1380,36 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>  	mutex_unlock(&dpu_enc->enc_lock);
>  }
>  
> +/*
> + * Stop the timing engines of the slave video interfaces of a split display
> + * (two interfaces on one CTL, e.g. bonded DSI) before the master is disabled.
> + * The master's cleanup resets the shared CTL; with a slave timing engine still
> + * running, the source pipes start fetching the slave's next frame and stall
> + * half-way through it. The stall survives until the MDSS core GDSC is
> + * power-collapsed, so when MDSS stays powered the next enable scans out
> + * nothing. The master itself is stopped by its own disable path, which counts
> + * the final vsync it waits for.
> + */

Drop.

> +static void dpu_encoder_stop_slave_timing(struct dpu_encoder_virt *dpu_enc)
> +{
> +	unsigned long lock_flags;
> +	int i;
> +
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +		if (phys->split_role != ENC_ROLE_SLAVE ||
> +		    phys->intf_mode != INTF_MODE_VIDEO || !phys->hw_intf ||
> +		    !phys->hw_intf->ops.enable_timing ||
> +		    phys->enable_state == DPU_ENC_DISABLED)
> +			continue;

I think a more correct way would be to follow the enable path. In
dpu_encoder_virt_atomic_disable() first call disable() for the slave,
then for the master. It should fix your issue.

> +
> +		spin_lock_irqsave(phys->enc_spinlock, lock_flags);
> +		phys->hw_intf->ops.enable_timing(phys->hw_intf, 0);
> +		spin_unlock_irqrestore(phys->enc_spinlock, lock_flags);
> +	}
> +}
> +
>  static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>  					struct drm_atomic_commit *state)
>  {
> @@ -1412,6 +1442,9 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>  
>  	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
>  
> +	if (dpu_enc->num_phys_encs > 1)
> +		dpu_encoder_stop_slave_timing(dpu_enc);
> +
>  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>  		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>  
> 
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
