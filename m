Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601977;
	b=OdoN/4yc++Isy+Ao/QGU+ESgjovzNpJqOD8hwR6Y+U2xOzG3Rkm84ewGyOa7Msnufyk9
	 bFC0Qynucqu+Pf299S2dHQd5B5KiBA+aJ3xkje4wW3jKI4n+o5uYqdtbZHOmHHLWRdmV7
	 2mfmwPxkSyclZbKn4lRePzleYFAEJ6gbg4backD/p8b89CN4hSXDxqiBw5pzJLxeSQ+WH
	 PkvfHmKwIOrLdUPGjcl4O3p+7kkg1WngQGc9j1b+gyS3gQprj6mmalvWNLwgc0546g/u1
	 qwageeCu23PNhft0jEoYrHWcyFU4BkgP1rL4rsUJgi9Phqz1hKHhuQiBY89d0IrZl1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kvpaENdKCnnkQmf53UEghOPimyZ9+7YOOkdrXXfDg88=;
	b=AAWnPkF0lIJmaRhro+wOmvO6OiBGM5sfvo21EJxy2REvR7f58wjhg3PgHDy+HGONyXam
	 BEHaBrwi+sI2MJz7mzr60QsJkBqgoIhGc8sUcbVyiUe5EWeA6vmci2fmhLFuhx//ScwsF
	 2DOAjyxBlmJLVRg7IN2yp4enXXndgJzEJgMbF6CIHEWREIZbh8qI3VpXCYZRLB4SHE/my
	 ibP2KrbcuvxQagHsEzl+2Qi9xzp88yvuGIRUJqwwjdog1GMbSMsqaExbr+JCBVWsVCGRg
	 g8DdHRyPBnRG4hcWBz0IXPeo4w8Kh/CuollX/fXUlpEJrtZAXa0y8tJozdA+0FyBOMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dnASCy/7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jkIrAuGl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C3E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C3E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnASCy/7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jkIrAuGl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LGG6mj1095451
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kvpaENdKCnnkQmf53UEghOPi
	myZ9+7YOOkdrXXfDg88=; b=dnASCy/7EH0UDeGsa0W7Ssi91Z3ZvpExgD2rNKUR
	I0RbWjFoJgqR6Bogy6MgisEdQTYfTplJhVR9M+o3ggRfQEHqg/29sHPQdpirdN8V
	wImMxzTTWfcsxwMqsn7+au6uM+taaAPXPAumj9+97Bw8cT02VvgKtMq0y+VLlU/j
	cygHY4qBl4uxsitNV3j2tRz5d99UMlJbMB0vOjegHpjAaRvzSAJr/qyZdh9QGg6H
	VuAuHo7MhJyaOZDGDjqBPSXhXh6YinFLskGJ44c4rRyekLV+GS7RuDcoZPrDpr1b
	m3TVEgGwlbSHoxXP+rLt7AJa2h0TCuOkU4fEx1NqyiVvTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r464e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:59:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so215668685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601975; x=1793206775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kvpaENdKCnnkQmf53UEghOPimyZ9+7YOOkdrXXfDg88=;
        b=jkIrAuGlMpx0PcU2czvYPbcb+vQSPzeBXEK4FLb60DmYyvIK5LT0x7BEc3nIM1zzOT
         bIGmiyZpNxYwKJoZWanA+xux3kglo5tcA4mHb54fXpN5JjyxkxAybG30NWe/dVFg0JMQ
         GaQ49KPBDurl1uhddTK7SvC7HvSUntHcVUJXr9H61HYMvO5rIWfhRhVgp7SBL5JRf1n9
         3RsbM1pUZm6egIH9zSjAeiC6grZDdy/7YLu5gA8K3QhFXUGMzyZZS3cYgayYBaTtGr4b
         U415G5pupHKO1ddve32rqEH0j+VCGjWSch+e2POCNTqkm/7vbs8g6Stb5a6JFFD4I5GK
         EY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601975; x=1793206775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvpaENdKCnnkQmf53UEghOPimyZ9+7YOOkdrXXfDg88=;
        b=ofEf5Mg4DlGUzgY9WJ6e9XTu9suFyavFGf4qZZaXrfOTce9qDNk6m0egu3xHWEta80
         YOHoDz6Jy9ul6zWhR4KUXpHSRatrAif7ZuI2geYk8SpqgMCU+xZrcHpqW29JSReBep6d
         bXhOi9XqDWIV+sawy+PoT2I90eseZ2wriVlekjOSYNigsXmnRR5XlFJ1JlSP7Z45EYO4
         1kvWP4TIn/5AX/OG3lalwUed56+NejMRiugExK74kL4TTTGq69ka3vQSnJJSzLlbBdcr
         SVXsDlSWyt5ZBONw2w78sAqLFU7kqBDcbEZbXYc6k29aZHkfV85+IgeeBDXIfSdfi1kv
         o44w==
X-Forwarded-Encrypted: i=1; AKwUvBwttpl4eb36wjHwIoMbkXL2DlVFxw21itT4WGZqnU+Y52htuKJJTzis64mE9RJBzyXZpL6EyiH2Svl++Ik=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/JnGtchz/8CQW3nR7Twq7JJYcHuppa4nRieaPOlf7X7Kr3IMM
	EY+S+V1jY/SoEuKOhc7fSCAl0YortGqEEKteDx5A6NUGhcjRZgiZdJQZn0FqJiobKsE0Kn7BlTu
	kYXogSeXhJJ7iYNroaiT96IPhQrEe1JVkvPRicXlUjlsKOyT4SAUohyTzfm0qatJyrYY=
X-Gm-Gg: AYBFou00rEtMVjG93NX0jg5sttYoO3rvyBbxSKPZiID4JZiUyga3nnHsz5rzNJZv2Ii
	HYqYKbeYrsCu3yrC4QwdzAjoE+dl6+PSWjZ4eOWlEiLu54rWt0VHQGFKaEwNwUU9uqDyreqC9zS
	D08DINyYFq0TGSwc/gFJ+k4m/DCKom68zQ7g9PHGNMqIVbRJJiI+kzgJe/bNvP8QZn8mJxD4mEQ
	kgpATdYUyEC4lxy97gBHdZ/Shs2VNBL2hLlHk/ZfXIcpSqNTaZiFNr4mEn5MUheY5tW9ZkX2Qyc
	QNHHnnA6iycj7N3GRv3/wpzKsxxDQkub1AutbDm+TnGIOtiBeF404ktNE7jlHXAUkGZqyrnSOtC
	S7fiL7KJNd4IPaIrB1WtJ056nEfMHby7BpqhDcuGSCCQ20XFjAn/hWXvk8HmMGGi1jZthuQj+Sc
	vpsU2GkGVziCFA
X-Received: by 2002:a05:620a:4443:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93f57f06a3emr520454785a.2.1792601975171;
        Wed, 21 Oct 2026 09:59:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4443:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93f57f06a3emr520451485a.2.1792601974583;
        Wed, 21 Oct 2026 09:59:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1233f91sm627678e87.72.2026.10.21.09.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:59:33 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:59:30 +0300
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
Message-ID: <rbbosxqd6dverme4gr4lzcsj3cjbrxioxxrrkjbn27gj6a6ag4@7ajznwvses2h>
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
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8ef77 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=Gbw9aFdXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0XkAg80coZZ_RUxBgWAA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: myTzH8rtVn86o--nZ3kCRE1TP8u5rUp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX5eosjIPxbgOv
 F4hdR+2w0ZcsCb7VimqQ1XdIDL4/6GxwsFrvG/jewk/RputsniAJwUGv718HCERNZfUjNiTLCAZ
 UQHuxZurTr6xaXAu1zzFyj37gqo1gkDZYCQO5D1KRDTE3GYWvaCrEKPG/DZZe+4R0IdDpvnghaJ
 X//Az5RH76kfQCZ5mMBiktES+GumVCF4kDUf2nLHIF90XuVCIUkyP2yqb0c8ZCiv4XwQW/oZCuC
 VqDY0faIlrP6/hwaSU0fCXMjxvsIAkdDiDBgLPceEgPX58I7xAjP8Ravcgs2/yTGq/kYBqc+aKl
 ooOIdyES0gxETDUGPD8Is7pBzut3QIlWLqUOb8hThYk0tdzo8NnbsbOr1U33LExMsCCZoO34rH1
 phiXNlcsU80HA6PvY21/+0RAc+3p5ow5gdSmRsTHqIYsOuKCF1wiN0sGFiOzdP4AaXdMtdlDW6D
 55zw0whA5sr4agTT4lw==
X-Proofpoint-GUID: myTzH8rtVn86o--nZ3kCRE1TP8u5rUp5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX4Vmz14+AEOLp
 4Oi/fJ6LFPRWMPuhfDmV7xtISGPZg0A+dPFnBsuLaC2wAwuI2Pb4bdzbft9yPqXZvrlZaGgm7r+
 jN9DtUKGTivesYS2j1VsVxeZaF5Os4E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
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

This matches the issue I had on MSM8998. For now it's:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'll update this with the T-B once the board is free from the previous
set of tests.

-- 
With best wishes
Dmitry
