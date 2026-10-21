Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602143;
	b=bgP6LR/Q32hvY1VmS2U4h0XmHExEHNZbrOkHjwz0x74b4Y4VBwJgPEiIqttk3E/Gvtmf
	 DGNbLmM82ZvicMX8E0dCiXR8bkfIORI5SW9kqeC1TUGZ5WM/+p4+bEt/rlNsehYhl9+m+
	 ZynKTqEAQ6d3CUvX+qjp39nOFO94vjsbJr0gpwsqCm+jFMikdHzGUEwGCfJ+7lG28n4aC
	 8WMdTDRSPaoBPme5ADY+ZJdZIByq6GgkHbzPLhSyqqrNom43ZRnIvPGglH+oDIhOOZYEb
	 2r54c3fHwlMSA/+bqJbpMaqAnDpD9lUAEtvWalaFH8x1aOT1BmDaqpwfWbjrDRD1KFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JO67+OIcXeQPf/uwJoTBgKLwE1a0IHP5ujFdDtZzXDw=;
	b=4po16dJQKTcUy4v1vYrefzNgdYdcx60Qg91+kDgkkzSAlXQaCMY3sEkTIIrRHyt4ws61
	 l7BdvHkVJngPrCl+k6yqVvj6+iclWVGYrAPVgM94H512twK7EgaQKpqQqSXLCK/64vicC
	 RFK3I1yhAqXIWLgyIN7Y15BiyqPHlKj/14nwOYOBAK7LMxCDMcBl5lP2RjD4BXKzrdJvb
	 c2YgV4A8CoL49Cd7g4F9bMY0Ld6dq4n0UfNiTZGxxAdrio3wHlQKjtfPIuFQIhOiyj7Qk
	 p7sMEToPOA2FUryuxMqscTmc9WVZ/pEWT2hcD/oDvMmd73u+CwqVZr/YBhtooI+cXcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+I843v4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WM5Qvf2P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287C5606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287C5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+I843v4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WM5Qvf2P
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTupG141299
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JO67+OIcXeQPf/uwJoTBgKLw
	E1a0IHP5ujFdDtZzXDw=; b=G+I843v43+HBH4lmw/pome1OWWsLsu7SuBeUV0K7
	bE49B0CfEACYI0pGiwkDiOWIWiDss/UrloBVPIF+lhBI4IRM6wQ9senMfVLkdFeY
	8l2aYNLzJy0uC4ScWL7UX5j92QbL5cMVXrsrR/xcN/akyrvP4nRbPIaYdbvODqtY
	8TQgDnMreOPJGzC2lgKh6CTwrg7ePWrFyQloBLNcPe9nKgb6kVU9VxHzMCmqCYuW
	12EjWCprv9qTU2vDwcBCKvqNjIsQytC6ExckhyxBskv3zmCKqq6OuNb0n2AdgS2V
	tibC+v5z8Ar6OCgq3vVvdJbpE9N+j9KkbT95DlnXhmacaA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5891h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:02:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf5c02f7a3so115937137.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792602141; x=1793206941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JO67+OIcXeQPf/uwJoTBgKLwE1a0IHP5ujFdDtZzXDw=;
        b=WM5Qvf2PyXMvuRbB+7EukTsIgTZQnTK/59zSEaJdMSw9AZdvpsNmfuZnnAnHyYxQeg
         qGLNZ1OnsVW6rdzt3CwznvpjGYBua/5+My7qpXvECqKpHR6Hkl7Bmv9khjTKT5bzgetF
         Ew6mGjcVWDK3FHgyi5CPbRFQ2Wx5zbixxyOD3qvPaKCGUDACzDf0eKuHuvOTyO/dmXDl
         Gs34p+1qzmMQq+My9h76Ni4q3XVfAqwpw9k4/D9787LOQbrFaWTjBNg/rK9jz3kAosUh
         EsMzOEsPulnDqBcW/vTocBUSQls9soNDWB+ra9jgHzITCpWlMdk8T4TSvc3/aX3bS2nc
         rpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602141; x=1793206941;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO67+OIcXeQPf/uwJoTBgKLwE1a0IHP5ujFdDtZzXDw=;
        b=Av4okSJ1ZgIZBKfouYLvRU8GjCfzb2CaXnCkmU1Z1Ql7Ial8fhP7Qc4V9ZHq27z1TD
         s94mkALf4cQpoJlsUIroZRm+K/SMkm1fNuHF2hKjI6n2lZwRAlxQ3IoPgwxq8vey7rp0
         xqYyV8PwmKRIrEasxuUh5VeZajHK7pN1We7wYUU6ViPBP3kFdpVf2IRJkLvIPWx8/2KG
         pPLfqam4VxfcJAQgh6K8MbFma/VzIapNxJeJlLoecb5/oqhxguj9ZL27shNasz5y3K4l
         jAAhrUw3EDIqQxgUHEDkprEnzMpfTS1RASbTAVfgSGuqRjhEVrADNUTJ8vJktYGSraOE
         9w5w==
X-Forwarded-Encrypted: i=1; AKwUvBzZWVD4By9COW1IfjbWlbTetyO8ImYLCsnqG3QXIRlBqnjiD0KzUU5M33pGeUxoD9knD9gmuk1P9/eiRhw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvOTCkZnyfAiCCmqqOd1Sg5j2tFDvD2NmoQ6uxTF0sGT/3Kh7z
	N4Jnzypz3CfJboS4g/4BW02O4nDrLCPzti1bgDdMWnG7j52X180EfKKXysfG0GVY0mMBFeTlKNi
	jk9EAPolZSajosGvNCZS7JiUNYinPr8SEqUYcx/XC42gOQIMnBf7/AxBaLiDiLyaRg10=
X-Gm-Gg: AYBFou04qTEYcP1hdKxHyaxII6uPEuL2qgVo0+nctpKLSZutkJ/0ST+QfcdJlBCOulQ
	JkJYE0Fv/DzJGqEHOOU1iBwOHPbgJQBJ4uYHb/15qefQ13VvCas6rya0kBbEnNd6si3TsvjLsnP
	VmGtjqDwsL3HBtCNa4Lzeq3JeEuzWeJXs1ZVP+LnOPRKZKxqWWYNlSWWqe9XWF8oXxkAkq8eTbU
	gV8GzipFNR4cDUn9jpfYneFR9HA/2Tr2S4hp9k443aAYqI88qnvJPPoWF+BxgHOsJ+5OF1RsYsm
	ODMz3In41vvMOSs51PL671lPKO8U8I6AuUj7eUJtkkOP6KdY/ewBzUgYcrg/Hce6EdJOf7tJBZG
	nkXtcUSctES+VWWYNuZE1eLRGT+pdAgStY1Irtt3lAWFPxJYNA2hceresRo912Wvw2wCUqBHjl3
	Fyq4sIsZCzn5tn
X-Received: by 2002:a05:6102:3fa2:b0:7cc:56a:58e0 with SMTP id ada2fe7eead31-7cc926b3be7mr876290137.21.1792602141425;
        Wed, 21 Oct 2026 10:02:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa2:b0:7cc:56a:58e0 with SMTP id ada2fe7eead31-7cc926b3be7mr876172137.21.1792602140671;
        Wed, 21 Oct 2026 10:02:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa28347b8sm471519e87.9.2026.10.21.10.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:02:17 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fabricio Akio <fabricioakio@gmail.com>
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
        Paul Sajna <sajattack@postmarketos.org>
Subject: Re: [PATCH v2 1/3] drm/msm/a5xx: Reset the GPU when resuming it
Message-ID: <qasf66vyv2t56x3o7bipzdvgrlglartfxqxm5ezstnwmlczfur@yi7cdxxqvwut>
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
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
In-Reply-To: <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX++fCRUp+NEqc
 Tol3WaObn7pSOE9BaEA/n683UQkeKZi5jc0nmA4PoeLBNwu3Pt4S8vJLgEByP2dWqdUSjtAieDg
 qq8aAaeQxG2dcstZt3x0RMNub8D5Xow=
X-Proofpoint-GUID: Y8xnzDTk3xqd4QR1eZJSdlLhdF6SpN3Y
X-Proofpoint-ORIG-GUID: Y8xnzDTk3xqd4QR1eZJSdlLhdF6SpN3Y
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8f01e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=Gbw9aFdXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0XkAg80coZZ_RUxBgWAA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX5PwpYCrJNV1l
 0FLETj+RmJQ+P4gQWWOjXjOmDqem0mLhYZ34b08nwB5KaqrSAqw6l7VTpWyyDCOTiMANw+c/ZB4
 PNBMBth3qDT6o3ipL/2YAAEXxLaBFQIQhu6558JjHso/7bfrdEUgd6+o0SUAKkHuEwAGskhJuZQ
 1IMi+HAnvGZ1n2NoFSwmf2NG6rLZplQXQ3BYU24hV/64mCmhtEWQ+yvYwRQbAc4xVWMhqg43iyo
 hyKcwDzPWhytn+211BwePoeaQdrY1Y87rK/KZOA93IAmJ1OMpAJOpKqt2G2e2iPvis8wTr62ZSr
 iXZyt17ZOeUkPzZN92EjQ619urxPJE4APsgFJCM9Q1VTX8uUViB08e5y+PzBggE2mKBjlJRO3Xb
 hSLaMPxZrCdyBgSHjpWGnroNvxgRN/+jsSc/aHtKfD5ssUTQyGLLn3DnZsnDNrVB4OTGpr95Hdc
 r99RjT+LSffQeWwYIsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210067

On Mon, Oct 19, 2026 at 11:05:08PM -0300, Fabricio Akio wrote:
> On SDM630, SDM660 and MSM8998 the GPU's GX power domain belongs to its
> SMMU, not to the GPU, so GX switches off only once the SMMU suspends as
> well. A GPU resumed with GX still on keeps its state, and the CP keeps
> its ringbuffer read pointer. a5xx_hw_init() then rewinds the ringbuffer
> and writes CP_ME_INIT at its start, while the CP goes on from its old
> position, executes stale ringbuffer contents and hangs:
> 
>   timeout waiting to drain ringbuffer 0 rptr/wptr = 23/C
> 
> Soft reset the GPU in a5xx_pm_resume() once it is powered, so that
> every resume starts from the reset state. The downstream driver resets
> only when it finds the GPU's power left on; resetting a GPU that was
> powered off changes nothing, and on A508 the reset takes about 2 us of
> a resume of about 1.5 ms, so do it every time.
> 
> The reset also clears the busy counter, which msm_gpu_pm_resume() has
> just sampled as devfreq's baseline. Take the baseline again after the
> reset, or the next devfreq poll subtracts the old count from the new
> one, wraps, and sets the GPU to its top frequency.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Changes in v2:
> - Take devfreq's busy-cycle baseline again after the reset, which
>   clears the busy counter (Sashiko)
> 
> Tested on A508 only; the reset runs on every A5xx.
> 
> A stall with the same signature, the CP's read pointer past the write
> pointer just after CP_ME_INIT, was reported on an A509:
> https://lore.kernel.org/linux-arm-msm/20260308-adreno-ringbuffer-drain-timeout-recovery-v1-1-985a33faf108@postmarketos.org/
> This may be the root cause of the A509 stall Paul Sajna reported there.
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 15 +++++++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h         |  1 +
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 17 +++++++++++++++++
>  3 files changed, 33 insertions(+)
> 

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
