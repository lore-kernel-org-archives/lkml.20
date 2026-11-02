Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628351;
	b=RL3IpnajHLNLHdDRVWBD7EBA0IaqNmhLY1mWNHl+tu1pQSvPyA07wyMn3dTL4cfOo6AY
	 ZaQWzXdcFFZcgiV76N68nkb1Nmxye1rNGIAo2odYW2wL2eecNiTvg4gZyvAO3k2kK3KSD
	 ZsKM6w688GSa/zQQ/b2RXcSvKI+1s8OQkaP+oZGWE9dES0cSoP035+Wo2+vT4AP19juEG
	 TGYZNOdRRm8L7F0ZKEAaZThSabEyi8arSIh3ziqQ1fLt30TLHW5iwt8yErHz81xKR3jgm
	 6DJIVIEmXt0OCvDedsndV3dmQXV2roMLFikutQz328kcbJUnxtGeaOVoZKr3kwGaWJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QdycHGg0fUIiKpM46/IUqKDZojkpKRQQ9ApR9IX6+0I=;
	b=ypkZeYiIpx8wGYKICblt5gBei3KpI7Reaz+vBWUvJv/ZrNKyTFbxGbVubZNu8x0/w5h2
	 t/tNN63mRtwAFCiiP4tXBDSkTyezFeBY6E6mJdLbr6BtXpZMnIgbPwrC7sjG4pgVCxYhc
	 7lFjl5du/jcuaTfwOn4cUxdJu/XDq8igWPbxs1/wbKEbpq3N+ixGfS2Eh+y7W6bisw3lH
	 v290rpaNyDbFg5VCsU6xXTWbXKs77DIYp+Lzsk5Pv/OoTBn0gNMOrk6klIHVRwU50kztj
	 mDCHNU+VKt417HJ99nu4N2T8powNl1+x7QG/Ppf77Fak4rc4tjjPDxRq7yJlbas3Dcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G4iInmTl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XxFT97vm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC76606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC76606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G4iInmTl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XxFT97vm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpIEI2991833
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=QdycHGg0fUIiKpM46/IUqKDZojkpKRQQ9ApR9IX6+0I=; b=G4
	iInmTl27oP0kQNjx9r3lTd36qOUwWh73ZLrrqYbvjtyt1xTO5ANqWItkUMg7Khm0
	+jRyGqqGngtZJBSVNIEfxp3ZjTboIBfryV56FjOQRhABM5OyomY22Ofpz/51JZGQ
	/2JxB2HWrqYrQT5RSdIAcr7N2AIzKpQs8rguNWV+aU7TLSGUGxa/10hgh0khWsI9
	xLFNAN+7ggvB3tSGQ5W85XYDtfsNC5klA9YWXxj3Outc1p6m3P/pw2RSJ0WcT/fY
	LJbwIE8XWn0rycZgRJWo+AakWciCMsqUQALH9cgzta582AxQgGsk7HB9YfXSkYcw
	YUdhGmlLM+9OtktS0O/Q==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgmxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:05:49 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-70b97cf79cdso3237092eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:05:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793628349; cv=none;
        d=google.com; s=arc-20260327;
        b=JrhurWZmIdl789NViW22fMQO9HK97V2+0fJFQIIqDmXPacwui2ariFFkwCD1dYpvJu
         x6GAb8AMPa4aVLocMsCdFYu6JNo9UxAhaWv9nwgGGR28iy0c87lnyCTftSg7TeNz48TB
         430ClMBCwInqVvNTDzTz4Hsy/2ODVFbH63eWmdRStSEp5fG47/MVlyNa/66RU4wLEysp
         N821DmcWLLZrsygCw9NyXZlXjgk9RflNL90NNQwvxkY2guN0Onqy66xXjDaTobZ3zJea
         wCYPeArfCWKe809EBZeWBqi4Ov6boisjQ9ghpMCzo2XuSt5y3eHAwf659GF8o0GPUNx8
         j/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=QdycHGg0fUIiKpM46/IUqKDZojkpKRQQ9ApR9IX6+0I=;
        fh=rwbtI6pJTPjWHCRZWNBVUuB0YlcEE/FZcJJCQs9q6Gc=;
        b=FpsIZ1xprDC4Do47g2zGMwKCnA5mZg9b48l2rgj0zXYAUDffhwTgIbf2OhnV3mOo+3
         ser698NfDRvtj9ANUEUreAzHUPEjSFIYQFqyQYzg3DQ3p2k077ysPf72xQifmX2uJrFi
         MOBfMXKtE8VFpf4pPfmwla6qr5dnthfhOal+Vp3bL2irfi4AF8siGkf0lUuKJn/Rm9E0
         oN1qIMSxWeYRtZwktbAS3oLIfqvjXMFrUcaUoV0MBKoJ7W18iCLePHGeu4dCSJcWoL7q
         aJYCCsDEWIisdJjBrV3Y8/Y8udGap+8QUS+iD5DncuXWhkxmSmAAxvfWbGN9L+JPVNLN
         m8xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628349; x=1794233149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QdycHGg0fUIiKpM46/IUqKDZojkpKRQQ9ApR9IX6+0I=;
        b=XxFT97vmFQW1O/kwYuILItEa0hceT6yCYtIS0guc79CUtpwtXbWuyTnmQlZTkAa7R8
         ZkR/Khxa9FYDFhyvKGt3iCYcFW8SvOQk0f+vu7Jb6DTD5Cazademfmxj7GcXDQyhZSes
         0k8RWqFKFM115zSQJwppuTZ0ASeVrlZ0/guMQVLnGyh+4plHyRdAOcrH2EV/D0AMACqA
         0VlXKUlN/C+pld/HdNeAnd/41thU15uEd2tMTkDBAGrckalqjl4OmqxVsHNqRTFNGdUh
         zVHc4vHrLka0lTT4/pd01mgLrRFbqYeoc7mMMGzshA+keIzpaIc8x3QrXEw1w1IRpm/6
         VZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628349; x=1794233149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QdycHGg0fUIiKpM46/IUqKDZojkpKRQQ9ApR9IX6+0I=;
        b=WyXurKk64PF4hMMucxXFut0tc1inP4cbCxctj20vLxKm65DnMhUr/JZjRrtC4gXNpo
         nnBhNRgK1d5sl0rq26TlOe+B8uPYOItPc5kS/3IPDIFn1Gyaa2ejVKhnCF2b8+yhsK5c
         u8JhTOOYRbRVqGyRYJzSg7IsZEYLHGMtbJK6gilfLWv7yxvQ1Kd3Dwqf4rGnmuNzxI9N
         N8uWHyy3z+RMbbt34DyMAMX9onXZo28TZq1aNKOlnqJiOxKbEDU+KL7Q48wB77EKUSn3
         JCo2/GpfBolWXQOpnrm1rjUrvo5lJ+C9LX5JFPVj7KksCwKMy/if1yNSgyHYJkWnwsnJ
         36tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTYxtgNJpKI12l7HscwZWawfKp3ypbj7wYtzmQTdorV6jfmfEh8E3mNII/siJpa14D0+We7xji7biWRfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdz0o3g+8VISaKI4+6kJ/Z3nH6Vk43FunhiroJCI/wx4M3ctyO
	Xlh0KiljcOh++9NENhNTK33vAP+WEYO8ceaag7YU8a0BBEBg9cErw4fVJOMpAf6n7M6fGD9nRjI
	6rzF+q+/57IwcziIE1Xf+uscdhlmRT1O98SKkd5HVbAyTB4QeHcKEeXCiE8BQmnGyOJ+ZKvVrK6
	MJQdkLpAWX4RQKZFuywJUkD/2jl8r+XMKPTqvI7iuCwQ==
X-Gm-Gg: AYBFou0PmKAW7gLP+GBuPMvim0PjP+jykaPBHNwgvvmsW9uD6jQFw/vNkFpPxJjm9bj
	24q1sXhYa1nVMu/zD3qx/cLB/jgTjDc+DuN/st0Ce72jv4PG5IIpCj66AJ6YeSH/8BjTyJv8JDK
	EGcu0RaFrIzixR+pZMW5ar6rxeSMCl+EnRUDgk/CHjmIpETdnKi1Vi6F+TRw==
X-Received: by 2002:a05:6820:708c:10b0:6da:453d:7cdf with SMTP id 006d021491bc7-714f2a30724mr3699833eaf.57.1793628348508;
        Mon, 02 Nov 2026 06:05:48 -0800 (PST)
X-Received: by 2002:a05:6820:708c:10b0:6da:453d:7cdf with SMTP id
 006d021491bc7-714f2a30724mr3699745eaf.57.1793628346684; Mon, 02 Nov 2026
 06:05:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101175553.53746-1-nicoangelodelacruz@gmail.com> <20261101180508.66598-1-nicoangelodelacruz@gmail.com>
In-Reply-To: <20261101180508.66598-1-nicoangelodelacruz@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 06:05:35 -0800
X-Gm-Features: AclHuK_tAlZOM671p6g-xOcfl-LxahyVIOmGtH-YZjrNdgYN2eW-woSkdRiVpCs
Message-ID: <CACSVV00Gv8V=V-gdwMqsvaE63Wxmw29aTS0wpX1jjegzJU6mhQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/a8xx: add a memory-only GPU crash state
To: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NiBTYWx0ZWRfX681jlQbGvv31
 mvd3n/T91qmirLyc7rq8QlUcF+JIE9IQpEDQXTBL+6BMAUl1qmKueTPSx8dNnGFjkmwuZUes8Uv
 Kh1HdSNKvoOA7p927Jv5xgeCW0uyBAqsaT0ChSMtstA2lXPJZKOueZSgi0ruuHjJ37yF+jVhiCQ
 JzelRWkWjFSv4huWC2TiEfu7/Q97b0R1bsH3q+iwkkjZ0Aa2rcbZ5PxmTAI/p3PvBJq3pSFwDHh
 W6VdzmYG+PNZvCFYdtRncLzCbd53vFgndeXAueOOESgM8J+puzAGKOVSYJbTa9JF80BdHOz/ofp
 TAgoLxjWEYuruBntECCFwp2/pQ2rfDNffFvidp/GIWsPKztK66aUhX7tV8RJrlfe/9SlZSUirbz
 Rz+TaHinE3FiRMSXK7mmYJlfgXW1752A99x7Wr1LnilIMpyQlh+Hj6abxGHk6cyjLCmdsWH96VI
 JlRCuZyNt3d7ORON+oQ==
X-Proofpoint-GUID: AfIUWoRPOL9qMiKiTaHmu_fVAqmwPjJ5
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae898bd cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8
 a=dnCqE_r5BN6qDrZ5i3wA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NiBTYWx0ZWRfXwxWp5P5SgHzD
 MkFONyvDtqSvlzuRfiPIdRPs1e4oPnoLZLwud4U1k6wryuoxl3JHw7nfkB8eQmZY8OJE9V/TdUI
 tj5K1f/3g7G75hEEW52TPW3A5uTAjXo=
X-Proofpoint-ORIG-GUID: AfIUWoRPOL9qMiKiTaHmu_fVAqmwPjJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020056

On Sun, Nov 1, 2026 at 10:05=E2=80=AFAM Nico Angelo Dela Cruz
<nicoangelodelacruz@gmail.com> wrote:
>
> a8xx had no gpu_state_get callback, so no devcoredump was ever
> produced when the GPU hung or faulted.
>
> Add a8xx_gpu_state_get(), a memory-only snapshot: the generic Adreno
> state from adreno_gpu_state_get() (ring buffer contents and fences,
> with rptr read from the hw_apriv shadow rather than a register), the
> GMU log/HFI/debug buffers and the HFI queue history. No register is
> read, because the GMU may be wedged and GX powered off when this runs
> from the recover worker or the SMMU fault path. As a result a8xx
> dumps always report "gpu-initialized: 0", as a6xx/a7xx dumps do when
> GX is off.
>
> The shared part moves out of a6xx_gpu_state_get() into
> a6xx_gpu_state_get_gmu(), which also runs adreno_gpu_state_get().
> It is a pure move except for a new gmu_regs parameter that gates
> a6xx_get_gmu_registers(); a6xx/a7xx pass true, so their output is
> unchanged. Reviewed with git diff --color-moved=3Ddimmed-zebra: apart
> from the moved lines, the new code is the helper's signature, the
> "if (gmu_regs)" check, the locals the helper needs, and the call.
>
> Tested on an Adreno 830: IGT msm_recovery gpu-fault (6 of 6 runs) and
> natural GPU hangs produce dumps with the ringbuffer, gmu-log, gmu-hfi
> and queue-history sections; capture takes 1.1 to 4.0 ms.
>
> a6xx/a7xx: build and pure-move review only, Tested-by welcome.

If you are interested in a8xx gpu devcoredump support, may I suggest:

   https://patchwork.freedesktop.org/series/176505/

I'm still looking for someone who has a830 who can test it

BR,
-R

> Signed-off-by: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  7 +++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 47 ++++++++++++++++-----
>  3 files changed, 45 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 92e8c8abb..0f4b0af0a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2918,9 +2918,16 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs =3D {
>                 .active_ring =3D a6xx_active_ring,
>                 .irq =3D a8xx_irq,
>                 .destroy =3D a6xx_destroy,
> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +               .show =3D a6xx_show,
> +#endif
>                 .gpu_busy =3D a8xx_gpu_busy,
>                 .gpu_get_freq =3D a6xx_gmu_get_freq,
>                 .gpu_set_freq =3D a6xx_gpu_set_freq,
> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +               .gpu_state_get =3D a8xx_gpu_state_get,
> +               .gpu_state_put =3D a6xx_gpu_state_put,
> +#endif
>                 .create_vm =3D a6xx_create_vm,
>                 .create_private_vm =3D a6xx_create_private_vm,
>                 .get_rptr =3D a6xx_get_rptr,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index 79912a33e..03432abf9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -338,6 +338,7 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_st=
ate *state,
>                 struct drm_printer *p);
>
>  struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
> +struct msm_gpu_state *a8xx_gpu_state_get(struct msm_gpu *gpu);
>  int a6xx_gpu_state_put(struct msm_gpu_state *state);
>
>  void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, =
bool gx_off);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu_state.c
> index 26c17861c..a3751358a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1629,25 +1629,19 @@ static void a7xx_get_indexed_registers(struct msm=
_gpu *gpu,
>         return;
>  }
>
> -struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
> +static void a6xx_gpu_state_get_gmu(struct msm_gpu *gpu,
> +                                  struct a6xx_gpu_state *a6xx_state, boo=
l gmu_regs)
>  {
> -       struct a6xx_crashdumper _dumper =3D { 0 }, *dumper =3D NULL;
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
>         struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> -       struct a6xx_gpu_state *a6xx_state =3D kzalloc_obj(*a6xx_state);
> -       bool stalled;
> -
> -       if (!a6xx_state)
> -               return ERR_PTR(-ENOMEM);
> -
> -       INIT_LIST_HEAD(&a6xx_state->objs);
>
>         /* Get the generic state from the adreno core */
>         adreno_gpu_state_get(gpu, &a6xx_state->base);
>
>         if (!adreno_has_gmu_wrapper(adreno_gpu) &&
>             !adreno_has_rgmu(adreno_gpu)) {
> -               a6xx_get_gmu_registers(gpu, a6xx_state);
> +               if (gmu_regs)
> +                       a6xx_get_gmu_registers(gpu, a6xx_state);
>
>                 a6xx_state->gmu_log =3D a6xx_snapshot_gmu_bo(a6xx_state, =
&a6xx_gpu->gmu.log);
>                 a6xx_state->gmu_hfi =3D a6xx_snapshot_gmu_bo(a6xx_state, =
&a6xx_gpu->gmu.hfi);
> @@ -1655,6 +1649,21 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct ms=
m_gpu *gpu)
>
>                 a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
>         }
> +}
> +
> +struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
> +{
> +       struct a6xx_crashdumper _dumper =3D { 0 }, *dumper =3D NULL;
> +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       struct a6xx_gpu_state *a6xx_state =3D kzalloc_obj(*a6xx_state);
> +       bool stalled;
> +
> +       if (!a6xx_state)
> +               return ERR_PTR(-ENOMEM);
> +
> +       INIT_LIST_HEAD(&a6xx_state->objs);
> +
> +       a6xx_gpu_state_get_gmu(gpu, a6xx_state, true);
>
>         /* If GX isn't on the rest of the data isn't going to be accessib=
le */
>         if (!adreno_gpu->funcs->gx_is_on(adreno_gpu))
> @@ -1714,6 +1723,24 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct ms=
m_gpu *gpu)
>         return  &a6xx_state->base;
>  }
>
> +/*
> + * Memory-only snapshot for a8xx: no register is read, as the GMU may be
> + * wedged and GX powered off by the time this runs.
> + */
> +struct msm_gpu_state *a8xx_gpu_state_get(struct msm_gpu *gpu)
> +{
> +       struct a6xx_gpu_state *a6xx_state =3D kzalloc_obj(*a6xx_state);
> +
> +       if (!a6xx_state)
> +               return ERR_PTR(-ENOMEM);
> +
> +       INIT_LIST_HEAD(&a6xx_state->objs);
> +
> +       a6xx_gpu_state_get_gmu(gpu, a6xx_state, false);
> +
> +       return &a6xx_state->base;
> +}
> +
>  static void a6xx_gpu_state_destroy(struct kref *kref)
>  {
>         struct a6xx_state_memobj *obj, *tmp;
> --
> 2.53.0
>
