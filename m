Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E733B4E9B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822400; cv=none; b=lpdKvhpbzOh+LsljX6/rDXzit7Az2hxCxbkoRLflnLdC1+yEobxjLerwsGkLa+VhroqIyHmUe5erpjYNaLwHYTsSap45JMDoz3vHzlAmT7HFqqm0McFBbGIkxDbpArKSoqXYJgraV+ST+lYgEGkfqsSxt6m+NZ2o/Km1WeSqgWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822400; c=relaxed/simple;
	bh=AQTbNMnp7jI59zx3g6v4uJ72Ia7b6VauhiXnwjKup54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKSGMBV9HuALMt5zgY5diusQU+jM1qIRfcsqMZGJBso9KN7aKJ2b3L9rT3Qyl+2itPn2kQynei/9lliCDDlbYK1BEczlcH6xppPj6WCQzJlAHqWVmX6iHQO5WmdZCGjYwmSXVhwqyrfwVkRE0pbQ16iYSRIv4b5UKUY/qEhHA30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ok4GVxs6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJm5TiFh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ok4GVxs6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJm5TiFh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910kjpS1144515
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 02:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yV+S3P5jvvM8EKpEwldy3Siv
	yc4WzqDSMEhXoGR4RgQ=; b=Ok4GVxs68iJYunI5nhauD3cKd+DxWRTgTtM/HqOe
	/L8l7ACxHEdeJEzjwfMEc+yPFkbYf+W6N8jcm3hEEmBOd2c9yqloq9wjoRWebz+S
	Krcd/U4PCAJaKSsoobkOzLI/ZGti3m9A5BQw1u+vSE11DPebiB8CUCtrg/S5kkTs
	tdgjAEtvlQmJfY+awzNBtsO89oFC2gUUziMo/mHYoOqvN2ZOUBSxBgdD2bx70HD8
	fslJzdps4R+cX2PukniSVGmao/sj274pgDHLSDvn89Qy/TkEzyy1ebCWaii8YxDl
	wojPtJN2a+rZY3yUjRTUVXA6Avj/Wzm8XYlIEh1BZ3NCZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bkbtay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:39:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso1108354985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790822395; x=1791427195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yV+S3P5jvvM8EKpEwldy3Sivyc4WzqDSMEhXoGR4RgQ=;
        b=kJm5TiFhQ8A8ic4tAHXXhTvlAe8dhkM7JczrwX/CyYdNTb6qzqdpOBWIihRyNwj8xY
         LQDu//dgi2aebnyECulsGPvIP6srM1orL6EXd5S++YcRnr2NYeyQyyOTyeO3kQ+DUVib
         hkUGSkyo06mCEbkuKm2pInkoGkE89Plh687FoC5wwab9s7xmny/6Qvumy9za+qY5Mnfn
         nHeWUc8fmmoR3mWdpGkgnjd/KQM9nuL5QY0XZz/3qvOYvFrj01aze8qcMky6BuoompbG
         wx5kmGvrwHqTm/Og5fgJLdN/MZhseQ8ENHVF1E7q/dyhNo5xS0c2HsMaxhoX7lab8M0D
         UQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822395; x=1791427195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yV+S3P5jvvM8EKpEwldy3Sivyc4WzqDSMEhXoGR4RgQ=;
        b=N3GL4WFjqm+1sk99gHG2/YZNZbRT6TdzXsmd7NmdIoJQXfPMr519hzxPrej/8E5fGx
         X2amabtKkva3T/p4Q/bvZe4qf9BEIdnUpOzxB9KeuP1pwWTnHnudSZ1DE0VtF0+TB/GN
         AexZr13v9gDw0BaWdvSGzqJizmHF4ykM9GWh4ydNAuZdZt8tgKmnzQPsH6jujX+Rpxx5
         OiyKHQBr4CQmzMvLL9FXcJtb3DE4P4nlJ6cyVjsl9XSeHgnPaCzBXBUSqrsSnOXus9cx
         vkdH714eATR/uvudwgRNQr6A4srB7p+eCSjbSURQAgR5UALJGP6ZVIjpeCWQvCgRhsvi
         jyNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBFJoK1PGQe+LH9uCjr8bdwR+NeMQTKRY7NELG3Ck8AEoTvP8Xhyby3GcLMSVnNfjabii0anT50Qs7GWo=@vger.kernel.org
X-Gm-Message-State: AFuF++n6NkqpcQNdFn2F4w00oWlLQG12s9D+0U2cojNaTT3IVn4LkmHc
	CTOpkMoNmXnCu8OJR7m+yB+35vtVSX8dYR9zKP+PYrGXu+iywUXjE9aBZXYx5ba0SVJqFvfqd3C
	xL4wK7WAgPhYqu17pYEu5pHPG9ipzlQ294yQe7ighJy5EQd14AXayhg951YCUZu2C/6o=
X-Gm-Gg: AYBFou0Bi4MZkCZgcQfRDThoxqN+dp7WsHOMKif5P2AzowpBnDNT48JTLwXxAj1KDRP
	bCPjfKiQG9i9dVqeHOdAKKjOGZXCkhntXR2YtWW0K0XWaQoe/wyASxX85Hx1THD29y80Xfqw5Xu
	TEmdWGMYI+w7BGGtN3I2gGfa9ACQIiRvS6qPnSGjxemlC3VxgmSqwiEnf224SPYCTjZUyF33+n0
	PnUkQP8TqcGtCo6ca+3VWdUIux8V8km0TkpjiC5U0PzHLyWR5OVUyKmrS5gcCsyjwSOwP2+7JK2
	ukDt4AHVIL9dmKppyJry0ZPgbgjDQMjia0jeJA6Z/9quvyBC9b98pz5HhrY/Sipln4Nk6X/+ScZ
	ADKkJfL7JO9m/XTCZjJRGl/Cx4FpCHO1AeHS2MSbALpHnzitcU1ryLEeUzTHKqNm9QcIO5LE1er
	kz1/+CAdkdnEua
X-Received: by 2002:a05:620a:4056:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-93cbdb43333mr28831585a.60.1790822394800;
        Wed, 30 Sep 2026 19:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4056:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-93cbdb43333mr28828085a.60.1790822394239;
        Wed, 30 Sep 2026 19:39:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb2970sm385438e87.41.2026.09.30.19.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:39:52 -0700 (PDT)
Date: Thu, 1 Oct 2026 05:39:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: stop all video interfaces before cleaning
 up a split encoder
Message-ID: <tcpvnconbaogukmtektdvzbmz623txosdpvlmcemmirekzc4pd@jf64s7vwfbvi>
References: <20260929130621.943-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929130621.943-1-26rote@gmail.com>
X-Proofpoint-GUID: DYIm4W1C01CZ25lqZwvAKrPNfqC-TWt3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfXyCJlne6nfDAu
 8Kwds/fgl3v37KOoBS89SbB6OXxoAxMqQAg8cdju7kpSUVwxHN//PJ3Wqpvg8O+yUiNPP6ecGsY
 0NQamhIHPzFUylShX7lfOWhZKZv9mxWGfcc/BE6C5K1PHYOveicp5OF9BqbwGdhXHzf4zyNnS3j
 1Bo6NbaHG7+sJZMFxnSVHDbKPB49DyO0dxrd/LaRtCzr4vqHO6Ylk97BJLEwk4Xaujp0kWqNNNL
 4SBPt45BE1F8N1QCtt47LZlErsA1ijhdiyRgrvkllmWjUFwLe6Zi8A02CKM62CBevKb1JXdP9gs
 QdMMzvHf4ES63k+hSq74CYm+WCpg6/V+EblVZuYBWEIMc/FDOJSBWTd7YuKOh0hTWRheM8/2bG1
 9XhJTBk0JMvrJWZCXDxtUD2CeJ9dDmgP7/eOPfBp8q5n+KGVBiXzrlup8PBFhUSLgJXP/jcIlbo
 EAGA03JrlidWdebwvig==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abdc7fb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=oWT2rLAf9-omjay-2P0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfX3Ib/P/hpPkBs
 53LeMCXYl4BFp0qT2xp1l6xEPZ/MmCPJc4HrhfKPGiAUcnhRD61oVcR2aTS2vCfBpzLGkOohOS2
 RA43DGoV30Wr7F812Dbh6rfZa1eAanY=
X-Proofpoint-ORIG-GUID: DYIm4W1C01CZ25lqZwvAKrPNfqC-TWt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010010

On Tue, Sep 29, 2026 at 10:06:21PM +0900, Joonhoe Kim wrote:
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
> Stop the timing engine of every video interface of the encoder before
> any of them is cleaned up. The master's existing wait for the frame to
> complete then covers both halves.
> 
> Seen on a Lenovo Legion Tab Y700 gen 5 (TB323FU, SM8850) with a bonded
> DSI video-mode panel (CSOT PP8807HB1-1). It reproduces without any
> external display by keeping MDSS runtime-active:
> 
>   echo on > /sys/bus/platform/devices/9800000.display-subsystem/power/control
> 
> then DPMS off and on from the compositor: black 3/3 before this change.
> Every full modeset (e.g. a refresh rate change) went black the same way.
> With this change: DPMS off/on 13/13 and full modesets 4/4 show the
> picture, and an attached DP display is unaffected. Only tested on this
> device.
> 
> Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> Saim Shujah's "drm/msm/dpu: clear pending flush state before physical cleanup"
> (https://lore.kernel.org/all/20260826182459.1506522-1-saimzst@gmail.com/)
> alone does not help here: still black 3/3 with only that change.
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1f20695f81e3..a14156408126 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1380,6 +1380,35 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>  	mutex_unlock(&dpu_enc->enc_lock);
>  }
>  
> +/*
> + * Stop the timing engine of every video-mode interface of the encoder before
> + * any of them is cleaned up. With a split display (two interfaces on one CTL,
> + * e.g. bonded DSI) the master's cleanup resets the shared CTL while the
> + * slave's timing engine would still be running; the source pipes then start
> + * fetching the slave's next frame and stall half-way through it. The stall
> + * survives until the MDSS core GDSC is power-collapsed, so when something else
> + * keeps MDSS powered (an active DP controller) the next enable scans out
> + * nothing.
> + */

Please instruct your AI to stop generating the narrative comments which
duplicate commit messages. Otherwise LGTM (please respond to Sashiko
though).

> +static void dpu_encoder_stop_video_timing(struct dpu_encoder_virt *dpu_enc)
> +{
> +	unsigned long lock_flags;
> +	int i;
> +
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +		if (phys->intf_mode != INTF_MODE_VIDEO || !phys->hw_intf ||
> +		    !phys->hw_intf->ops.enable_timing ||
> +		    phys->enable_state == DPU_ENC_DISABLED)
> +			continue;
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

-- 
With best wishes
Dmitry
