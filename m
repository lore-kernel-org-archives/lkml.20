Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DA04F5DFD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774789; cv=none; b=gqWf3ZOivH/ef+2I+EwlA3+DfQDU5YTbTzC3AqApQTwJ8MVElTJln8yxld8DUg8SDl6nRsuuEAzSfxQOSw3UOsmv80eEDDOGKi6m2cRJkuYYOY/StIbhcYpXH43hMVJyHXbCmd4d4+8jHLg4ZAqcozlhqJJT9JuGpfArJoYVMlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774789; c=relaxed/simple;
	bh=lGGYfVR39+XE5qDJGewyTnZ+7AJfdihwmk4BGewdxWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqCXVdJs6heqAqjb2xU3uu0o0STw/GQRozbKJh3UuqwNNsRsIBsRhZNTm3EjUXhHxl/qzdXigNaj5WxUnm50I1/BiovQFapfRU/A/Ca8+G1/bRQMT9FSC0LSNUD9Uv8j95R19+jsT7DoNLpqLH8Uh4qI53pc7vsQyRPb5pJhZRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f75smee+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxxUQFpP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f75smee+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxxUQFpP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7r6r3136462
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rTFZ+94GSRBJuyoD+wrNMMpG
	yUNudG4vyWgC2Rkm6Ck=; b=f75smee+50t5q3IKcnQ/mg+gxjlx4ShMRjry0WZu
	u8SHcOF8sna2xcAlgWACllk4qaXzy4K1QAxvOzYDA8uu81buftR67xrmzpMz1RNf
	NPfjdsTb3ZRBiHpw/1EX0tHEh+zGk87WdFMlPBliKzcksYoKG/gjAOEdcZ2JpHWs
	quOMf3jTiAZvD5EwOOL1kD20D51fD6cR4NoFCcoST6Lk3RuHLH+bEVz8g2p+TXaf
	tTNaIZJln9b6PhHN30KbqfcN9yVKthMYNQLWYpQCowq4uMCZgm2uLU2k8R/xViby
	l0Khcg52yyyI7O9KzIFrLx3YLdwTyhUITquQz9Or7LpCMw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27hknk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:26:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980c3b71002so4157008241.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790774764; x=1791379564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTFZ+94GSRBJuyoD+wrNMMpGyUNudG4vyWgC2Rkm6Ck=;
        b=YxxUQFpPLgkPc+3LRjdxcRK2EjAPDBejjmwgOvyGfojSCXq8eVtfYfBYhIYbsHkMYG
         BgFXktE3FEiZcq/TOg+Chdu9pPsGmoshN5LJMQPYjwtmwSOGUUMYFIwoW0luqFM06fMj
         V4uN1BH1AaTijbQXchs1gxLQTMr5W6Gqt4rKpJGY2SX0K/vKzIkGHTLrQuc1M0GBux0Z
         PZfdVuKNyD4RKyPA1Fh38GCOq3doP4d3H2tdHfcZ/tf9pBmpE0cPrywrhBzEH6RhauPX
         pEWy/p2Y7eEeXIdGPUHhRDpG1tWV13jt8hwlBPGVoFxxlQ9nOLvbyplUlG4Noxu855JL
         zWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774764; x=1791379564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTFZ+94GSRBJuyoD+wrNMMpGyUNudG4vyWgC2Rkm6Ck=;
        b=A3QXBVVzV/CvLhKrjMhPpOjpZi93i4JBN8BaYjf/t/E138DaOty0nB9NPs6wkcn4si
         rWc9S/T5F5Vl0gGPnVcNnel6M+qBz3UMbQbfPSFhBdkN/K0ITadJp/ClOIJ8ls9e4SQt
         bSz7BTS3NhL52xDVYhB91rwFcy++2aMwvxl9/vpHRIY7ZlX6zdshVZBiTK+mDAoRGXim
         Tei/Rrg2/5+nUw2AgcmcIX6+9ZPgvTGOrNOmcdYHPwhMVZrFwfqyAdkPypP1z35bkEHy
         Blrz1xBshqaY/lY8xSUyOtpuP2f0bsFvOWShKdLC4/gSm1coiqI2lmf2u9y+gwO9XXpZ
         RBQA==
X-Forwarded-Encrypted: i=1; AKwUvBygoM78aOslitosjCdeEE/iR2ghZyU+VQqj4ZguX7UnHI6Hwk2XVB0aRrglXN43sIX1V8ykp/WT2lsg5Xk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf1AXoYY1qUNPoZQ7p6hrALsh96cFwJjs5PrQz03/dY2R/Du6V
	OLpUD8QuPcef68zJ36Q/sMeAD66LmfP8ESzjBGfe+iaIVVPTjFfnk8eRK8L6SXpKEL3/NvTss5I
	hYoJriaomo2wEmt/wbx5eLyq21XxBkwksYiyhjjd5/eWUDu3w5V6zpMzD/EGtSA9En6c=
X-Gm-Gg: AYBFou0eKGhrU1Z/MWhLM8W2cxm0HZoJluqWE+RT6NSsBW3Z0yRFMOQ8WAdxtXAIuPc
	wstzGtTKRX3+8yWH6SjWkf/MiRMmVzc4xAEuW9KXH44xMGrTa6+K+3t4uOqvFcHtQMmlp+hWZup
	EylyBlQsy2aM8OUt87SXpKnkKX4OeY9bFR+YivQ7fARpmHjcsVUE2c/mLmjmT2V7vqp6kslK3ON
	Et4i+5B8TE4N62OrjHQI0VEqx/nvJrwgRWAVhbzcn5IvQfHnE+tRq4YqsP8ExpF7Ws/0BSzj/O3
	trGh7nlwcxjb6wTtRtGvIPl5ged9w55JOPMTqK3Kf9s2ahBKFHe6mII0EHHme4x+ziQiI65JluU
	7TcuYPRXgPlWFXktPRRqxnH8MQOq3dPwc9kOpmPpVrMyOXHsUlpp1pezV4MSxCHHR1hbiP7XmrC
	9nwnyZzbqWvxs9
X-Received: by 2002:a05:6102:4426:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7be7408460fmr369592137.35.1790774764276;
        Wed, 30 Sep 2026 06:26:04 -0700 (PDT)
X-Received: by 2002:a05:6102:4426:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7be7408460fmr369576137.35.1790774763763;
        Wed, 30 Sep 2026 06:26:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbf2045sm340399e87.35.2026.09.30.06.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:26:02 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:26:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 01/13] drm/atomic: Handle max bpc properties before
 connector state allocation
Message-ID: <quiwrspvimu5piokdswwqmaovv7arkr5swndnwjxhsgmipp6zc@itciwqnrilc4>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-1-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-1-dbbf8b2b42bc@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MyBTYWx0ZWRfX9q/Uvvh/agUT
 2aqxIsKIyO49QuVixqtQlT/qDqcmRm3xGM1/KlkbvWydi2/o9Mws3mmalndFPUiY60X/cnrmVka
 gjxAu9l49/EdDYiKPaWQMk1MohGo0JQ=
X-Proofpoint-GUID: FeqPHfKlxlwICjtGkqxFrQgTigho8mGj
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd0dec cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ksxQWNrZAAAA:8
 a=A3JNbwhL2pmTzrpOqxEA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MyBTYWx0ZWRfX5ryT1GXWfR22
 geTdL8eXl3/2wqf/dhc3qM0XMJ8zh1uGKy5H7mmwH4/U490ADfHKcsltwxn3x7vC0NH+qV3zafv
 kif5gCwsQMUmj4OcdlyJp+oYp/gvzgQrFM+pPx1Oo6bBSTuXxRtEM8Oh5u+SmbrptnEMWxE2pBP
 lKKshrJRhzhnorfSyAYYKzYPV/J2t3rg7GZJ2OZR+3NDkyFJdx51GYFIr1JvitLnQeDB2z3lwlW
 LSi9jgpBnTNDZjwMFe2KngYGmugmxarRLtYwEgn4P6HVdlrV7lJi1Q2CMZmpARDUN88azFkF/2l
 XRhixafsUnvxH1uYjzbDBb8b+edMKlqFz/oAk1lTXSvwH+qyT/s0M55YRdxj2spB3his1bLpWeO
 fx5DUceoza6Lx1Clty+z+Hp9YRSeO9hd0+8V6dLYpOpgA147FA07OCbn+vKJ4diAsKGfk1FCLy4
 NlLxwvbXrPq32wcd5uQ==
X-Proofpoint-ORIG-GUID: FeqPHfKlxlwICjtGkqxFrQgTigho8mGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300053

On Wed, Sep 30, 2026 at 08:41:45PM +0800, Xilin Wu wrote:
> Bridge connectors can attach the max bpc property before their atomic
> state is allocated by drm_mode_config_reset(). Unconditionally updating
> connector->state in drm_connector_attach_max_bpc_property() dereferences
> a NULL pointer in this case. Adding max bpc support to MSM DP and eDP
> exposes this during display initialization, before a framebuffer console
> is available.
> 
> Only update an existing state when attaching the property. Initialize
> max_requested_bpc and max_bpc from the property range when creating a
> connector state so that deferred allocation and subsequent resets both
> restore the default. Avoid leaving the bit depth at zero after reset,
> which would otherwise cause valid display configurations to be rejected.
> 
> With MSM DP max bpc support applied, this also restores boot on the Lenovo
> Yoga Slim 7x.

Hmm?

> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>

Can we rather update drm_bridge_connector_init() to register this
property in non-HDMI cases if max_bpc is more than 8?

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 5 +++++
>  drivers/gpu/drm/drm_connector.c           | 6 ++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
