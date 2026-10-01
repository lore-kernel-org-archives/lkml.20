Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF9936BCED
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822473; cv=none; b=gSsueWH9c+BHkRJLeRf39A5o7H6NsL0bRCLNsCObdlJnuS0J+eGLJqJY+JhN9hep7TWoTFozLzBrUA5yS7SQC3JIoB9Fnwd1vPnrwP5RsiMqJvS8lv6vnW08rtilQsrYdYwG2mM1p3gBJnQPuqGxiwBqIS5kuWw13gm14NLqeak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822473; c=relaxed/simple;
	bh=N1mv8KavMEDnX/BXxl0wV5Vb5d7h32365RgbMswEy/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geAfbkGEfEaOKAsJFFPpk2Jv1Aw4EW2NZK7o1WH1hMpV/wN5VCNW5RlEnnI+jsng58cHU3RWhZmjs5xhC2T8KUX4PpU+qlktf3be2uXHFWFBhUN9mJhh/lfKuarhDGlTcTEc3vOzQKyIxdJymaYWKXM+W39+ayg/hogfdq6om0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvRKvfY/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIQSzfRp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvRKvfY/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIQSzfRp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jacx1141489
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 02:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ghkjprac1hGwE2HrmUj6yg2z
	I5ZEjbwo3mW27+l4U7w=; b=PvRKvfY/1bUonhpvDd9QQ/hrqKiYaxUFb8gHFmFB
	ThPOeFz4qpeTor4WGlUrdwmr9QzJ5IREGcnVnbWL3Z9lX2mthrLxN/4uGIPXvoUI
	mxMYUWday3aUaOW3YCjSK97Hdy1f86elKjKfp+Rvr7vWEh8x5Ny3udRHseCPPT+j
	/0qiB/uAqWkWD4jSngjM4gLEyLrGzjpUUhoojPNTgFtYWHod44GH9d69yD463h4p
	FOKcTsDthSi5UH+6R1PnULwBYldXQdqnd5gc4OPEgfk0havfZi08GyG7C3IDvsZM
	PmZztik015SRYUNkW/6kYIeiC1TmBgTDhA6eBnoyPj5Hng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh58pmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:41:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0312937eso806461485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790822470; x=1791427270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ghkjprac1hGwE2HrmUj6yg2zI5ZEjbwo3mW27+l4U7w=;
        b=NIQSzfRp2zHWeg8jg8MEIYEsmT5aRuk2EGexoMdHVXhkicZeWhGEBhfC65PMbs+p7L
         7AL+6yMai5u/BKdVxv4U5BC23nYNs7jVHKKG2SBXiZnPWq38mQbrPEfzpY+JAk+tgMA3
         n3cDUDaMBywJ0PXRihi3H3UO5dvkEuDQjAZ75widFXQ2SYZsAc8e15V+3WeTkovJyuQh
         jCHgZK35ffdw4QhLnYj72HCIY3xdsdspmNZGrLcBwgZqg8yqjCOiU/8sj0DflKS4VaAV
         d0uLZmHZJOUfz++FHzaOKhg34C8JMnCfVAqoBo4GDdYcUv9cpVyD/ehbjlslBhHYnnHN
         t2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822470; x=1791427270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ghkjprac1hGwE2HrmUj6yg2zI5ZEjbwo3mW27+l4U7w=;
        b=OSXmOSXiISkG1Hf9trGtlC1r7Uxzb7/nvqXHoG924rNp5GJ9/e+Jqa2yulei5jvM/4
         4aU9hgOtVjygeOiYC+4hxxntssJDuosWXu5WrosU/GT3KBIyYAQWjOAcKYXIjek0snEY
         UX4cxZfBPcyYOZZIq8V0l43DD5bA6DkTpuEDdMFm0FY+XqhQ5n7V/B+h5/acgFy5rp4w
         ShpXx3622KOwZWxvFgm6e6CrYJ0/bjU/sWTGK9/GRywnhB/y71NtVDkxlYYeF+VKy49v
         OTq58ry/BNivhUudqjDqEG65evj7n1BSopobxpb0T2HZ8f7qN6gD7UcFLp0EeS5FlJpY
         LvQg==
X-Forwarded-Encrypted: i=1; AKwUvBxM0sqZ9dIkolMnYVWD6s+WzvfLpkmoD4Vgfv7qgOTQFLnkwSpDK7BT/plz6JknyNcGav6vBfNAzRIoeHE=@vger.kernel.org
X-Gm-Message-State: AFuF++kkV+rh984ifsmWWLhj0lyYH6z8+IZDMO0TJnvC4EemxUoTfq2s
	UvEn2NYXtge/JmUoDIvL7fetMXF78lX1Dhtx8GMt0BuXNpP+wUtImm3rHH/dSQYPJAEldksFb+o
	03wsgF1vnwVuRQKC7umF6zKYxSgQVmctkuQN02aj4E/ew/nqUbE+DhnycFJL4XO+nnc0=
X-Gm-Gg: AYBFou16pvSo9XoPnspq4YCoQ3xZvJnYCC0pfiqKiBI65GTR7gDteumj6k1qwCRjjj/
	M79lHPauewOR6l2IiWp3gdAtPWzOHeHNiAaNDXPyxpqmYwPBX+lkKVkCBxtSqMYhw9EPzQDMfg+
	QHE18vyADNOkG1EB2FD//zBr7ztFCkHhLwViqZdiyQsIlvv/Kqs6J1AOx4mb1hurJi2ln/zqs8T
	4J5rUua4/YGhMx4Xy5L//yTQu5nxML3zeQnoxfPiLlctnK8o7i7hLOIjsYqzwv3YPCWgcDJIY/F
	U+ett0Jk+wLn0vJHWvAh6inimA/NnH6AxSH3Ryqwa0lUa3mUk4/k6s2kVXSKUQJOpFfs1Ycgyko
	nGtJjpsCIGDufV3STI7dKl9jpx50L/mRM4wEF7hEXC9iP24LAfQ3hlvAcaEcT/Ba1BgQsbL0Qnx
	Z0uG6Hs2TCsYPx
X-Received: by 2002:a05:620a:4448:b0:93a:824:ac8d with SMTP id af79cd13be357-93ca96d83a2mr651723885a.27.1790822470147;
        Wed, 30 Sep 2026 19:41:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4448:b0:93a:824:ac8d with SMTP id af79cd13be357-93ca96d83a2mr651720685a.27.1790822469619;
        Wed, 30 Sep 2026 19:41:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a77192c19csm12699581fa.29.2026.09.30.19.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:41:07 -0700 (PDT)
Date: Thu, 1 Oct 2026 05:41:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: compute the CRTC bandwidth from the state
 being checked
Message-ID: <5rpjfokvikv2m2bayq72ar4z2i72esaarwzsui3yrceh3urvil@fuopy4uqypyv>
References: <20260929130633.977-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929130633.977-1-26rote@gmail.com>
X-Proofpoint-GUID: RJo40uccEGQO4CrAFzWZNdUPoj3qPXIN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfX8OKNzp+XHQw1
 duZUU8VlLHh9r4F+e6VXcB0tGKBvXqCdl6TAfqGKwoGAjslCoyaT5BhPfh0LtavY3hpHKIS1Hlc
 h8bB8GwOz6j5d4MjHr9Vay2dFH+Ik0k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfXw9WuANKNfME2
 N5sDTrq/DSFj/qAIXWaFmo4numWCl3+40TK4p8DHw3UabgLdyAZRziM7OD+j6ylTCR2nDWtLwKl
 EueFR1FXGZ4YMFCjOJq4ve1uKAR1pAVK+nwszGul6Lco5f0Z2OuepsaYcWCA2N1+AtYz5ZnsQe8
 VUebYYpn3a6xhEnPgn0/fh6i4AqU9gUG8oP4aYJx6+TNFHSxCIJ/gzxombwpz+x+sSG4bDiS8io
 /UTuWDGqY4eYru2MgYJ9sUL7h+T3bKapcQTLnxmwUcctwPt8hdRrsqLHaPW8v/5BgiZfcF/8zmH
 Fqv6cL3xdrHTuRzstm3VTpwo9K3cmoF/aaSYhGM43SkDCZfk8K2K8YpPf/wI9Uc5931qqa6fN7T
 1uP2iNZ2z4nIVtN+O9TShNHtAakh2H09QjquNGzAzyqfbwaSJGHEtjksI1c+HIvAETqFnJgdKn+
 vwFqU4RZHLYZ5INkI9g==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abdc847 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=9aN-E-HqI_eRP4b4jg4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RJo40uccEGQO4CrAFzWZNdUPoj3qPXIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010010

On Tue, Sep 29, 2026 at 10:06:33PM +0900, Joonhoe Kim wrote:
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
> _dpu_core_perf_calc_clk() walks the planes the same way; it is not
> touched here since I have not seen a wrong clock vote from it.
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 24 ++++++++++---------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index fea173e37464..343c41550637 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -54,24 +54,26 @@ u64 dpu_core_perf_adjusted_mode_clk(u64 mode_clk_rate,
>  /**
>   * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>   * @perf_cfg: performance configuration
> - * @crtc: pointer to a crtc
> + * @state: the CRTC state
>   * Return: returns aggregated BW for all planes in crtc.
>   */
>  static u64 _dpu_core_perf_calc_bw(const struct dpu_perf_cfg *perf_cfg,
> -		struct drm_crtc *crtc)
> +		struct drm_crtc_state *state)
>  {
>  	struct drm_plane *plane;
> -	struct dpu_plane_state *pstate;
> +	const struct drm_plane_state *plane_state;
>  	u64 crtc_plane_bw = 0;
>  	u32 bw_factor;
>  
> -	drm_atomic_crtc_for_each_plane(plane, crtc) {
> -		pstate = to_dpu_plane_state(plane->state);
> -		if (!pstate)
> -			continue;
> -
> -		crtc_plane_bw += pstate->plane_fetch_bw;
> -	}
> +	/*
> +	 * The planes of the CRTC state being checked: iterating the committed
> +	 * state (drm_atomic_crtc_for_each_plane()) summed nothing when the CRTC
> +	 * was being re-enabled (DPMS on, resume), whose old state has no
> +	 * planes, and the display ran without a bandwidth vote until the next
> +	 * plane update.
> +	 */

This again duplicates commit message. Please drop it. The patch LGTM.

> +	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, state)
> +		crtc_plane_bw += to_dpu_plane_state(plane_state)->plane_fetch_bw;
>  
>  	bw_factor = perf_cfg->bw_inefficiency_factor;
>  	if (bw_factor) {
> @@ -131,7 +133,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
>  		return;
>  	}
>  
> -	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, state);
>  	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
>  	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
>  	DRM_DEBUG_ATOMIC(
> 
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
