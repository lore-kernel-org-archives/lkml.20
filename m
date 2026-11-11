Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416137;
	b=URPwZaDOOohngNOKAw9yIzga7G1BM1a/EcVsmiEyUWMPAsQL9j205JMouGGH1jVEeugH
	 XTXRzQocU78cv4t/6UMOEGyqM/sNg/aXoXX15mliM0zZTYW/Ao6C3WqXR9N+n+oiFWr4u
	 kxhh++PcTJzN4jnkrIKxgZnugfgjdxMV7xOF/PelT0+YooCa15Osf++6KlVRkZQew9Vo3
	 TzrGvCZhfXdneaNhEFQ5145wgNXDa5TNrOY8XQQZKyKgaQQJ0+Q4PKjR7MMhrWHz0Fn7z
	 nrwqq7Pa9QVwxxDZ6plIu9a73P8WlP6XXikuib2+sZC9WXzLxNfgChvNhSWPHkzijMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dtuAsIkr78INIV8Z/BdZHzuIPXa1ZLTXYhrmp5rxHFQ=;
	b=Hq3sXn2GWHOB0KTfoa8ZE4uDX10xm01/0JBYxjgM/GF6ACDHMPfGJTPTGyVOOTryPfE4
	 lDmFK6i/6xf5qvv87tBfrx1bIhg9BC+VwqR/lpA3EwzWicaD41ZKovSatwJeXnsiodCCN
	 PBVUg6kALqcLdTkbwsAr7JE2/jG/aThzH6jaERc+afcqyMuh6w+7gqun4I8RPUMTs8N0/
	 ALTkJl4pseuB79KkJNwKRE7QoLvBUyuiIlrtu8RZoaQIZBvO15zhnwlCM78ptfy38pwCd
	 FzZ/x0G7Do+SPCSPIpW7u7dk1uUufMXGlBo2LHwMXytMctG5IdHwqH3169yDebui33g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d4EZw+gQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRifLHnd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A74606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03A74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d4EZw+gQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRifLHnd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0DBr2316068
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dtuAsIkr78INIV8Z/BdZHzuI
	PXa1ZLTXYhrmp5rxHFQ=; b=d4EZw+gQL5DGX2yL82ISR0t9g0drEtP6obCGwdLG
	kV1OOPl8npl1GABt09UbhmK55gss7ZfLf0ZTcBi6XIRw4OwH+0WM3jlNGw5BCDdL
	PflQTMNzhigl7sx9rmuIBVIu9bcSeI+YWjyTWPwPDNHCZ+xDmCPDQXnpiD9qCZl2
	QsIDpT3UdI5FvihPXz042kU81XnnEZSk7rBfKHj0FOVnhvtrMbZShLWmat2f1196
	hNxDx2zyZUmmEQRek0q3pAAjItYImCB9XekENwJOcQ7cVoPCeKH4zv6H0CkJ65ua
	v4GRskxC21h44bX24S7RAF8bb4sWUlQ1cbio0pxxgtnQNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh3skr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:55:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso800304585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416135; x=1795020935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dtuAsIkr78INIV8Z/BdZHzuIPXa1ZLTXYhrmp5rxHFQ=;
        b=WRifLHnd3OPqy/4e7H4grgLpwvTWMXvPxYLM7TObsnKsNqoR3T51ulctqjYfCNf8Cd
         vGCzNzS78FIwtesmJ/4jNr78cil2ewxFRaV58mchCec7c+ztguMgJnvpMW9A3WNMgJLp
         OE/pJkYJjk2rMeuOOM/BcWfBXxb29lqWkPnpsP8pd3rRWW6cxdaO5zVjSzhE/ThYzKSZ
         wr4xwmYTGsLowRIGksCPkb2j0C9sP5YduJulk7ZtRw0TLlPyUuDj2R5ngmXDS1FsVCV2
         oaw81VBK4rqVFRjoQW6foExxAk9D3GXM47XcRngZ/ozcx81YBiAgEmXtmEQrqJweouRo
         U+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416135; x=1795020935;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtuAsIkr78INIV8Z/BdZHzuIPXa1ZLTXYhrmp5rxHFQ=;
        b=ZU2Z9LjfhbL5CSScWHqSiZt9FlDu1x3b4dfBF/ywqJr2GLunOPN1lu5TCOMVea1cYG
         MHHOQCFigNyEM/jOOaI+U4GW+1tpjKvLCTwkfvJsyvgswR3hHKRWxbrqbbKNp+aKujGe
         QlOx0Ug8v4f73L9adX4m4LVP3PpQ8hFyVXwbZiic3jiMiag1EkQTxnnL43aKnJQHP5ym
         AOZD9JEjAN0ajpU/QVGp1a3cyJIVtymiaF7fAoLdkT/LTH4K8xsvvALofQDUBsHGzewr
         qpRfXdBRR781tpAGMgjp0ol1Fij1AFW1jFmVj0/69ftaofs+EcXmheqVMFtkBOd2i3eU
         Q1BQ==
X-Forwarded-Encrypted: i=1; AL+hErF3s5bAXlkTqSL8HR1q9LLoX6YBQ3YxsgwrefWlXYsMDs3KFskInZfRiF8E34guaRmUF1cb9wHaNLADwwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d/mLUfwPZR4CWiSCCmMja59rVu6hjS6oj9EQfCyc0MtAAPhGG
	3CzDLx55tlwBYdAnfjsystdDVOk8pva4tx3aBNHDepn5WTHhcpB/ypmIh7GrK3hxkrInrrE8aGo
	enn+mLDTcogBFY9tLycrEMVzFNxpqr9vRbEF+8z+Pl8a08gIrLCbmh8O6qYtIC+fzepQ=
X-Gm-Gg: AYBFou0JuLbmZ6LzXsT1mn94qGFs6np5lXUawHZ/OU8GseDSStuBmXKzoqu7URxvP0l
	VfOFE2apkGuitmyGFNUf4GJhBlirQQMlV+HeT33iJZhgjZMWDZZmwTuwAnFKewSaxU30F9bRPSE
	WKIqNANbW5xtMbHI1mZ6E6BoATLgLeTrQYmbnY2YpfWc6Vys1wciYz2E7JndVF9P8htzNrvtVtX
	qFEDYY+B0Up0sOan//gGtKKbDGlrwx5Cp7fibn7kGldRKH+CXs6UTy9QlBuK9CQtoXoCC9NyDzN
	3WjZiqNLqShK5IvlWumDRIjeSYf0qFiQxTfeXKRuV2FXjUk8aOlyqJrmauH1naMzJhDnNiKkSHa
	GrNXRF5Ei3i8JxkYdb2XOcCBonfLAfOnGVrZyjXCpev2/FJsYq8+eMPw0qvAqhlDKoJd6HE7tdZ
	mK0MHMzqla6KbuDGaQ4OwKafayp3DmgAbndjzAYCXY4hl9qOTFbgFbtFFf9O7xlQ==
X-Received: by 2002:a05:620a:710c:b0:93f:2eaf:64cd with SMTP id af79cd13be357-947b004700emr479800785a.50.1794416135075;
        Wed, 11 Nov 2026 08:55:35 -0800 (PST)
X-Received: by 2002:a05:620a:710c:b0:93f:2eaf:64cd with SMTP id af79cd13be357-947b004700emr479796085a.50.1794416134544;
        Wed, 11 Nov 2026 08:55:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0923c164sm12879141fa.20.2026.11.11.08.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:55:33 -0800 (PST)
Date: Wed, 11 Nov 2026 18:55:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/msm/dpu: program the source split order for
 split planes
Message-ID: <fexhbxknsxgpvgtziubvp3ynoomwppzy7fl53ycynskebk6q5h@hxzunshclscj>
References: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
 <20261010-pipe_order-v1-3-9d8bd29fd78a@oss.qualcomm.com>
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
In-Reply-To: <20261010-pipe_order-v1-3-9d8bd29fd78a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX3okJvWaSe4Rb
 L+TFBCKR2P2Bg82nBtC8asDskoETm8+AzZsmv1IWXJQn5G439pPr/7dLmSABpd3HruLm/LGxmz5
 8gnKqVdHrARxqs/7TCej8JJD6AMd12Y=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af49e07 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rjQCQlUSGl8ILNuVy7EA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 6ToEHputjxLq7t5xwJAS6OVYSTdNhoYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXxwyUFCbSpsZK
 iqALoI6m1qcW9HrIsWrQ+8EnyaLOSpbecGYQhfpVmmMgnlR7uuLpSkZTHRBGRP1rG7iwQL/Tfim
 KvWhDvNaZnugYqB9mAPhK3wTI8Pq4rzi8Fl2r0YlAI3yFrgPZhz+2CXUE7UKesaR/f+28YOlhnl
 5xTl8NCGJLgFTOK9zQHOQpzEVhXiE+lHwvyahWT+iBuV0wQAW4j5teeyPZdNOm0WhCfqRgyMqoP
 ELxmmjWs/C7UFvA/kEynjV5DjzRWUfM1/moFtTVeuT0q4ERMu0nePnHGau+1GRyghxULMtpPVN0
 s9r758pvh98ceUXU7C/iUWW65EYMWOc3e347H91Zszlp0YdnLd6HpxQbyH8hkt5dvRI+u1rhZZr
 vw5H4KBPysCA/QSXrKt8BmZzAWGJW6AAozgSBFfGu9Xp4Ci9B26ZH0hHRXY4ikhA0cVhCZPqCfJ
 PA4wChglsFmmxDCSXmg==
X-Proofpoint-ORIG-GUID: 6ToEHputjxLq7t5xwJAS6OVYSTdNhoYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110067

On Sat, Oct 10, 2026 at 07:08:23PM +0530, Mahadevan P wrote:
> Virtual planes can use two SSPPs when a plane exceeds the single-pipe
> width or clock limit and parallel multirect cannot be used.
> 
> Program SRC_SPLIT_ORDER during mixer setup from the pipes' destination
> X positions. Set the bit for the right source and clear it for the
> left source or a source without a sibling.
> 
> Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 77a2d1f6700d..91152d937ba3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -434,6 +434,18 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
>  }
>  
> +static bool _dpu_crtc_pipe_is_right(const struct dpu_plane_state *pstate,
> +				    unsigned int pipe_idx)
> +{
> +	unsigned int other_idx = pipe_idx ^ 1;
> +
> +	if (!pstate->pipe[other_idx].sspp)
> +		return false;
> +
> +	return pstate->pipe_cfg[pipe_idx].dst_rect.x1 >
> +	       pstate->pipe_cfg[other_idx].dst_rect.x1;

We know that the right plane has odd index. This is a total overkill.

> +}
> +
>  static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
>  	struct dpu_hw_stage_cfg *stage_cfg)
> @@ -443,10 +455,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  	struct drm_plane_state *state;
>  	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>  	struct dpu_plane_state *pstate = NULL;
> +	struct dpu_sw_pipe *pipe;
>  	const struct msm_format *format;
>  	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>  	u32 lm_idx, stage, i, pipe_idx, head_pipe_in_stage, lms_in_pair;
>  	bool bg_alpha_enable = false;
> +	bool src_split = test_bit(DPU_MIXER_SOURCESPLIT,
> +				  &mixer->hw_lm->cap->features);
>  	DECLARE_BITMAP(active_fetch, SSPP_MAX);
>  	DECLARE_BITMAP(active_pipes, SSPP_MAX);
>  
> @@ -475,6 +490,10 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  				pipe_idx = i + head_pipe_in_stage;
>  				if (!pstate->pipe[pipe_idx].sspp)
>  					continue;
> +				pipe = &pstate->pipe[pipe_idx];
> +				if (src_split && pipe->sspp->ops.setup_src_split_order)
> +					pipe->sspp->ops.setup_src_split_order(pipe,
> +						_dpu_crtc_pipe_is_right(pstate, pipe_idx));
>  				lms_in_pair = min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
>  						  PIPES_PER_STAGE);
>  				set_bit(pstate->pipe[pipe_idx].sspp->idx, active_fetch);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
