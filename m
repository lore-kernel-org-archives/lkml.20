Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530722;
	b=ZxS98ONYn2TbCTNI53IfKkFNxFPnR/6boqz6VRmDz1otqlkHedNfnKJq7knDioEESYah
	 FUCFN7Tl09ORweIlWOwVt86jSgu/PYgPQpynqOUK1qqQT83cfsHEapd89rN86tTXoE8sx
	 3Mu7WeJlnS0fCrZ3M+Z8pChSq+nJwqi36OE3EQ59ybuJnjE401nIXgyNFA+g8NH+KihO5
	 4K5pgrnNkL35ccfMc0bHkcJbhleYgoIc6nOZKK3+nwsyXs2Als3bpgxJNeK8cLer2+P+h
	 oMaPAyHrbYI80w2GHHoRg0FtEi9Sr6siIg7tyakXsYko2DZQznCXFW62oaoweccYMYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530722;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V26Rxt/dvQi8UJT1RGBvNKJzELhSQFEnT8mAHiQZZLw=;
	b=laMoLflc59J8vTvSQ4XQoKV5wlJYV4vaxEYLBI2HSnhSI3cgS5Mn0uL1wuBxl46Whmxn
	 6ss1cCoL3j918vZhcK7ShUJD+gBeed3UFiP18/OHzc6h3kZFWdtt/0vHme/X2ogCIhmuk
	 yQd0WnZNlMHTEQdW1S4T3y07yjY6SLQtjgDPergF3NN0Ppn0cWYG5GZD5ekC5a7HmvdVF
	 WOJt8qcT25IItkdky7MzlNCjD2w6iVtFJBBPOKQgSa6pyH9aLkT9c8+6b95DNCbJjr+ay
	 W3aQffFIF1BPF5T5xB0uHRXuhtE8sDJO/h2Ai/qpEzddfL+Vl5kezPBdnYzdGYuONzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cbjp4+2E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5HuIFvr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC13606A332
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC13606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cbjp4+2E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5HuIFvr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A18KliZ2930201
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 10:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V26Rxt/dvQi8UJT1RGBvNKJz
	ELhSQFEnT8mAHiQZZLw=; b=Cbjp4+2EQhHPRe4vPcA3aMWtw6AnTDzXXsMkAlkP
	NSvAZTe2toamPYew41bCKmT4KDChnIS1gKngGgUBhdjsxtsNIqS00CYsdIdaJmH0
	OF5YOlJsIyUujDJLmR8dCOTpgrege3HvmDNrcwcviJGmfg/39VGIbzgeD7Lu5uRL
	KINv8MNjjuGoQEw0CqTNyvSlSEqYM+QPUQZpipu3NFNEPAGEkV7HbCbcXmmYbHTY
	2IOb/70CtbgBZ1Sm8qa2PL6yWKBC9pXYQwlK41+oKbQCxoZ7jBFhj/rYrI6Vb0iT
	wBvPXBRHGFahrJxOVOX8NdBhpc9+dAhjFY55MB5VOgy/Vg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk300r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:58:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so425232585a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793530720; x=1794135520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V26Rxt/dvQi8UJT1RGBvNKJzELhSQFEnT8mAHiQZZLw=;
        b=B5HuIFvrltXt3DRLKTE71NMB3GmaZLifzUlmU+JpjOu4hxO7j3X70Hj70eNAmlYuqX
         3feDbwewF6pmCBH7dTGLqs2/4xQknowoOFtmo5OISHSqMZpVcL45NPjyeQeLmOHEmsDX
         pQu2C0cdVkG1N9JM6ENODOkg//0W3Ca2R2IVd7i9OsoY6Uccpya16ydhQO/W1FGIF7Ab
         ampc7/T9y0vJi/eRot4siqqswvHGZQToVf+rO9rmQlf3LJWZCZnuez7KCgVxVBl50plu
         Ub3mGwULxC4eIQDOKu0XfA64nhjjkQFZJZFRPxGrJ/rxS3iTSg5zeqtvjTtFDnHIkmDE
         OD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530720; x=1794135520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V26Rxt/dvQi8UJT1RGBvNKJzELhSQFEnT8mAHiQZZLw=;
        b=UMurtAAdH8Os3shOoLIWrkEMi/jb8eLxxQMc5hM/u9ckwpw4P437NsOHZc1DRptbnz
         +2ASJvzSYTRi/Gja4uJuooeQvC27/nd9CpUG4BPvFujmn+OkCnlrqN/Nx4lLIpwfc/pR
         MHg5DL0Y92Zae1+3pCbFzAskc46/4szI83j7AMQXXWYmdgJwvVQQS66HDxEMuz3gmB5E
         JEC0/3XXlzZO4CVtgzPe9cRPwaw4y+WF5AOXNmFVJxjtFpHHl4RkNXKXPr+dhFQooHfR
         whOoTMLhPmMzEeCUxj/SaoWYzOVYYgt4rxYOn8QdCH3Fq3h+xitc0qSsVbHY6aQYHlw2
         xbvw==
X-Forwarded-Encrypted: i=1; AKwUvBwm/EKE8Axfz/HUgDTVs43ixkzL3XY01LhhXcoU9wNqyGRQnAW0T8W20BycjRa8tqBSqS+jUH+dHh/C2Q8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR41gWypDGC3tcylLjkLftHaxZCJzkl2BNrgY2eKtEfrwQohA4
	Q0GvLX8nYjdKTf9EsW+4pqCLzwHniVqIhRizQ4z5i196DUaiCianhaG9Cu+HcJKAYb9aP2Gj7l5
	Cl9kptK6I61KtreavBQY4094QrAu1Lhw8bVqqNToqlBlfseLvAB/5kxGXEvBGQeBx96U=
X-Gm-Gg: AYBFou0s46gZR47vW03s5MmbbFkUYcvWnSyNCdGwQR+XP1YTG9Q+g6jR36GyM7YytHB
	ep1tcvrDMXf7dEOjB7icZUCcn/9ks3NMUHEQx8GQYAUh04rC7BIwEuzlpvsFlfRQ3U5jkVg9HSr
	facT+NV1ZajHgHP30oY12GnEC3pPGiErYcCMR/oIFedkPdkBSOr0G87+Ubp7UKYb2Qd9lzmPO8g
	3hLxj+lg4dKDQqozMf+kzpRaFiZtG8E/VIWEz4xLDe4OMmco4Qy18nh3OuWFiustVZwaRYCOwg9
	V/7Nc/oqPtrjNnfHi/5ZyKrZukelCXyR0q+adL6vHF/C0fSuAzgTmKY+Cm4BuqQmaxtYMjzjOuq
	k7f5GPmjDpeSNwEjjAbFKZGEp+7+s85MhcMBd5HipYg9GQjvBgW0RK42ILjFdg5CZsAqiZ3oq4e
	LyctpEkV4TwV+ReU01Pt91Zf0UU1WlQ18EdcSgeyttExRhwxCWGCYWzKuVdUXx
X-Received: by 2002:a05:620a:4724:b0:93e:c12c:43fa with SMTP id af79cd13be357-9442171c8a4mr1167597785a.71.1793530720209;
        Sun, 01 Nov 2026 02:58:40 -0800 (PST)
X-Received: by 2002:a05:620a:4724:b0:93e:c12c:43fa with SMTP id af79cd13be357-9442171c8a4mr1167596185a.71.1793530719592;
        Sun, 01 Nov 2026 02:58:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07541b4sm1027580e87.81.2026.11.01.02.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
Date: Sun, 1 Nov 2026 12:58:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Beat M. Liechti" <beat@softbase.tech>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: don't reassign resources on color
 management changes
Message-ID: <5jypdookmvfmrdaef2c54aab5kfcpjvejc6f2jyxvbjhwpqgzd@ipvdiwk3zxvc>
References: <20261101095754.33840-1-beat@softbase.tech>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101095754.33840-1-beat@softbase.tech>
X-Proofpoint-GUID: 2mdsxeiuZtU6Ka4Y0I3WO2qDI65NVRgx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA0MyBTYWx0ZWRfXz2oYwFcXg84+
 I1R+qYpD7iW6iNz/ePXGaYQ119Ks+0fmqBgfKTcokmMYPhlGALMpgpNrhC4SX3hrkQH/wWdkUmT
 tcJiXHUdp40QAephNdOe2lF+QruAaSWB95XxcGfkhtMehMZgQIncJyF/KUeg+6SRKUyuFOvVTm/
 Y4WS5xaBzzPnZM70+qtUw/8kA2Mr+Zpamx3EbPJ2Y63foKEv9Mu3rEtemerXKlc6uJUjxWhW9Ey
 kVLwpwwxP3zb7ho6Pe/S9SEbGQ8T97HPFXuvN5sbvt0Ep9txm0Z5vQsbOX7OfvXsyF3N66kFOM6
 W23s7BWNQhJJFmddldKjXP+4CAMxoE7yglN9IkJpRzk8xdaMopDFpb1eNFI67pKRMK0vr90xeEu
 GUHW1+wUil0pUONK4hndBSBdVs83/MURu15ZpP3xBwMyFdCiqrQ6iw8jk+NbM50tHYISkRbDgOE
 0HWaYlfJyKat3klmlEA==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae71b61 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=Ox7JqDZjdXA0ESHpvBYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA0MyBTYWx0ZWRfX+Ow1v6qiHlQn
 KwLKEkeTBVRMMA7MDVzE6FvvHoQfGv2jWrGIwMfBVVuYgF/a5WnS13D0FH86/C7at1+e+eQBM/v
 NkVOHVjgFdKqrkOYjjoC1tKUx7jf2rI=
X-Proofpoint-ORIG-GUID: 2mdsxeiuZtU6Ka4Y0I3WO2qDI65NVRgx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010043

On Sun, Nov 01, 2026 at 10:57:45AM +0100, Beat M. Liechti wrote:
> Since commit 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide
> GAMMA_LUT DRM property"), dpu_crtc_atomic_check() releases and reserves
> the hardware blocks of a CRTC whenever color_mgmt_changed is set, not
> only on a modeset. A commit that merely replaces the GAMMA_LUT or CTM
> blob of an active CRTC can therefore move that CRTC to a different
> CTL/LM pair without disabling and re-enabling the pipeline, and the
> hardware keeps scanning out through blocks the driver no longer
> considers in use.
> 
> This is easy to hit with GNOME/mutter on a laptop driving an external
> display: closing the lid disables the eDP CRTC, and in the same atomic
> commit mutter sets new color blobs on the still active HDMI CRTC. With
> drm.debug enabled, dpu_rm_reserve() moves the HDMI CRTC from CTL_1 to
> the just released CTL_0 while its encoder is neither disabled nor
> re-enabled. A few seconds later the display SMMU reports context faults
> at the refresh rate and the external screen fills with garbage. Opening
> the lid again leads to a stream of "vblank timeout" and "frame done
> timeout" errors and the machine has to be power cycled.
> 
> Color management affects the topology in only one way: DSPP blocks are
> requested when either CTM or GAMMA_LUT is set. Handle that case in
> dpu_crtc_check_mode_changed() by forcing a full modeset when the
> presence of CTM/GAMMA_LUT changes, as msm_atomic_check() already does
> for the CTM, and stop reallocating resources on a bare
> color_mgmt_changed.
> 
> Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Beat M. Liechti <beat@softbase.tech>
> ---
> 
> Notes:
>     Testing: ThinkPad T14s Gen 6 (X1E78100), GNOME 50 / mutter on Wayland,
>     LG 4K60 monitor on the HDMI port (DP to HDMI bridge), logind set to not
>     suspend on lid close while on external power. Without this patch every
>     lid close reproduces the corruption and hang described above. With it,
>     closing and opening the lid produces no SMMU faults, vblank timeouts or
>     frame done timeouts, and both displays keep working.
>     
>     That testing was done on a v7.0.14 based distribution kernel (Ubuntu
>     7.0.0-42.42). On msm-next the patch has only been compile tested (W=1,
>     no new warnings), not run.
>     
>     Open questions:
>     - Like the existing CTM check in msm_atomic_check() (see the FIXME
>       there), this sets allow_modeset on behalf of userspace when the DSPP
>       requirement changes. Rejecting such commits without
>       DRM_MODE_ATOMIC_ALLOW_MODESET would be stricter, but could break
>       compositors that toggle GAMMA_LUT at runtime (night light). I am happy
>       to change it either way.
>     - The RFC "drm/msm/dpu: Force modeset if new CTLs have been reserved"
>       (https://lists.freedesktop.org/archives/freedreno/2025-March/036824.html)
>       addresses reassignment without a modeset in general. This patch only
>       removes the color management trigger.
>     
>     The root cause analysis of the drm.debug trace, the fix and the
>     changelog were developed with an AI coding assistant (Claude by
>     Anthropic). I reviewed the change and tested it on the hardware above.
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 26 +++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 42d0a529b..3b304a896 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1516,6 +1516,20 @@ int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
>  	    (!clone_mode_requested && clone_mode_enabled))
>  		new_crtc_state->mode_changed = true;
>  
> +	/*
> +	 * DSPP blocks are reserved only when CTM or GAMMA_LUT is set (see
> +	 * dpu_crtc_get_topology()), so enabling or disabling color management
> +	 * changes the hardware topology. Changing resources on an active CRTC
> +	 * requires a full modeset; otherwise the CTL/LM blocks get swapped
> +	 * underneath a running pipeline.
> +	 */
> +	if (new_crtc_state->enable &&
> +	    (!!(old_crtc_state->ctm || old_crtc_state->gamma_lut) !=
> +	     !!(new_crtc_state->ctm || new_crtc_state->gamma_lut))) {
> +		new_crtc_state->mode_changed = true;
> +		new_crtc_state->state->allow_modeset = true;

Having allow_modeset in the atomic_check() code was a hack, which should
not have been allowed in. We are trying to get rid of it, not introduce
new instances of it.

> +	}
> +
>  	return 0;
>  }
>  
> @@ -1534,9 +1548,15 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
>  
> -	/* don't reallocate resources if only ACTIVE has beeen changed */
> -	if (crtc_state->mode_changed || crtc_state->connectors_changed ||
> -	    crtc_state->color_mgmt_changed) {
> +	/*
> +	 * Don't reallocate resources if only ACTIVE or color management
> +	 * values have changed. A change in DSPP requirements is turned into a
> +	 * modeset by dpu_crtc_check_mode_changed(). Reallocating on a plain
> +	 * color_mgmt_changed would move an active CRTC to different CTL/LM
> +	 * blocks without a modeset, leaving the hardware scanning out through
> +	 * stale CTL/LM state (SMMU faults, corrupted output, vblank timeouts).
> +	 */
> +	if (crtc_state->mode_changed || crtc_state->connectors_changed) {
>  		rc = dpu_crtc_assign_resources(crtc, crtc_state);
>  		if (rc < 0)
>  			return rc;
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
