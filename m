Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA420568530
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191479; cv=pass; b=bsbsw+pseWMiDJicWSRp8WPUyzPw/lhXYFXdb1SwMwdNNksemqwjje1QN+aTXNvIYmx5FwnlPWWCCSTxd+KFe2s/wSMgCFf+U2ydPDUMoga/LK/GReZPO3fR+2lYKlkscqwVKKMCAgcshw8HRmNnl2GCrws3CPBnVUG94DC75VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191479; c=relaxed/simple;
	bh=qrPdumNOqAnGYg4uJA6sSaJAWzPE1DQsa0KWSX2NE6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ke2dtpWeYaDAxIIx0SBW2LH4BBPZQyMSgBlWcCUmn/mgHR/CduiMjz4VIuZVNtoBkIUrrNL6QZurc87/tTHVn5jN0Zons/cUN0A97o7zLPEd8mAf21M0QwwNkDnttXs20/E5ginWL5yMAJTXOivuk2AryYGYPg94q158wWBssc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XD7S3HV+; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XD7S3HV+"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed444so24292a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790191477; cv=none;
        d=google.com; s=arc-20260327;
        b=EomU18t2V8KWZSNSN6UZTF2xJKU6ndG1Kp4/yB9JNVPgYBJkJC08urOSrEWsycvtPb
         I5wqoMQi7Topo5VWzgaoqPeq6JHnRtbYGs4qC3x0IBx799SQEtpTa2rJC45eMrYm0gXa
         jlFs1y5N07xQDxLyq2yA6DiUEiTRk9+xmVObsA/R8UuUxa33T1b3tHBdVAKXb4RfoKVD
         dGuNWEKEXugjVoEZ0femu3hdgRJ6l1PMkOfCscIttuMtnS4dQZitnqzhryRByJbanQAt
         FJN1ry9U1KmGjKuPR/0FAEUKSOooHqZkbg+x3lCwPF+5CchSt+Rx3rv85PxBxDjERSJs
         /Q7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0x2nZQroxHQRc04e1jt8isM+CH3x3G89bDQEzIpEuKE=;
        fh=QWx0O60K65cyr7RVazQjN4715FqctA29ugNbknqLSvc=;
        b=TCkVQNXTNw4xdoIINQrPG+6Sp3uhFZO6/nuDjCm0WZLeHtDfy8D22zjpjl0tBOpQPx
         1wOZM5ionERvyMdUb028wODDPvVUoBZW7anUvLvHmKY2gfgVMagvciXMg1TmCQVuu4bg
         F2/DggsVIJfILmI0ibiSRBRUqbUgVHTBi4stgsdhzzcaKBBZqVXrvovZkJIEEln1Ab9j
         493r/bWr1xS841wLbRZhQulxWF7YdaRcYaQA0UMrIUxsggJvg2AlpKYu3qUBsi7fRFUm
         0+aQiWorm/6BkPknpcvF4yH4+FVYXQ5EGozwBD6kU9RzHeiu7w3vSFzBW3AKms9sq2c1
         t6JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790191477; x=1790796277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0x2nZQroxHQRc04e1jt8isM+CH3x3G89bDQEzIpEuKE=;
        b=XD7S3HV+3Gplqc1e6sI5yMPLhAUtpMTwgD6Zu+vQbjwvqqvETWsqk2JB4YwGQkrHmt
         c8xfdt7SCETCJFrXkfju0ml3PCJq/SDNFiDLkOAeCISp9835XbRfFUKiWieNZzmrMQOM
         AAFuXsOMBvXkOYMSrMMVnfsFTizYC3beLEIvCM3VlmvqB/quVk4RPQxtD/qlcOklCSxw
         0d57BqmaILbFD/smu7r8KK9RIXX9/Gr8guREO0gxuWHaGZ9Z+HhY2hrDA7CD6dRmJ+Yg
         uRrZsywbobkhgZlasSLSE+F8eIsbQC6s8ZS328kGEEcn7zeak6xfb9jU9jMkcREBsEOl
         ALZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191477; x=1790796277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0x2nZQroxHQRc04e1jt8isM+CH3x3G89bDQEzIpEuKE=;
        b=AJUiNcaZvkqdTW0oxKXr5CctFltrAKXBkGZBaYupwerfS0TYUvdnjtU+cErP1+rZhk
         id0lxqE3ykWxiXq6Cp24oPQ1N/RCpOadrtkSL+jQ8j0BCIsC1Hi6APUkSVenyWDDwBLy
         J7+uPkJiQEVSZCUs/GcDheMvOANMfKIHhuphvjjN7F3wQfldUU68OGZRwyKS57571rBG
         Sl9oCQY+foWEcrYpHTe9j47fihgiATsV6MCfNPzu792QR0/E+FXDKARQEThNLmSqFj45
         Cm2DOYXWfSkD5CFWQuxSZzQSsUDy7WIdfKavdkJBHAXaW1Xvi6CvcrqSnqZCUheePIpd
         0Iog==
X-Forwarded-Encrypted: i=1; AKwUvByaPkm4xWMHRER7IhnEjkmCLoJUuKHqnqePnQjYWmhh3f1eL/ue/OCkt+84eO3kTmXiijYL5Aniyow1gWk=@vger.kernel.org
X-Gm-Message-State: AFuF++kGmj+WeWY1+PlvbcZBl6N+LKYec7S+CH5dOwy3lbxnX3i+TzIH
	TrxMEiHtx4OqqcfrlmK7FHgx7Itp1zSlEkgnbVmcZvdvtmDdwTd3AhUls/3n1I/Dq5zGy2+byES
	obl9GkXgVmabfCi61BFE8oTJrOcvd+qGsBw==
X-Gm-Gg: AYBFou3R0tprW6p1CTAkzj0kaRGFEXwqQuGvgfbwHDSJK+RQv/xKgw4aFLqPaDy517d
	dsCdnJ6qB6Dq/RQ9T73oSULDN79waaeVKlvH/Zu999cKVLBJN7cVhO1Z1GwbkGNqK40vEtkeaGF
	n9XY21aIOM3PUFA3bgdpyW1192tcFjPdmeqCNof5MLZundvrW71N2shaqYp035mHh2w0qqhFWh8
	2+lfAo1CJuuxpcx0llOuG3aot3jU23JVoDZmpf0Z3MvcUch0dvMz3CJmLJwdV2H1Z/6cm6wmv3W
	C+JvGgjgOcOipzM7FT4RsBw1eTw6uQaSuO1YyVUYJcPhJ7AsrCN1cJ0lPcg39p6cEShrpW6Z5we
	eIPWmVDVTKsw=
X-Received: by 2002:a17:90b:254e:b0:3a0:238b:db4d with SMTP id
 98e67ed59e1d1-3a098dc0266mr188923a91.5.1790191476700; Wed, 23 Sep 2026
 12:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 23 Sep 2026 15:24:24 -0400
X-Gm-Features: AcwNN1VoBofGVm8cbejsfh35C-7w7BgK4tswB9hEES5ypKbcuahQ7NLIu-ocYuY
Message-ID: <CACu1E7GndBnSj75ZVqic9NxdSakZJL3ZJOuz7D+RbVWA4DUqTQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] drm/msm: Support for Hawi & Maili GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 6:26=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> Adreno 850 is the next generation of A8x GPU present in Hawi SoC. It shar=
es
> the ADRENO_8XX_GEN2 family and slice architecture with A840, but has many
> architectural improvements. There is a new block Matrix core (MALU) which
> helps to accelerate certain compute workloads. Also, there is a new Bx ra=
il
> that powes a part of the GPU IP. GMU is now powered by a dedicated GDSC
> powered by MxG rail.

If there is a dedicated rail for GMU, then
VK_KHR_calibrated_timestamps is likely broken, assuming that the GMU
AO counter is on this rail. The AO offset logic in kgsl probably needs
to be ported here. Has this been tested?

Connor

>
> Maili GPU (Adreno 845) is very similar to A850, except that it doesn't
> have the MALU block.
>
> We will post the Mesa support and linux-firmware support soon. MALU suppo=
rt
> will be brought in separately along with its support in Mesa.
>
> As there is no display support available for Hawi/Maili, validated offscr=
een
> testcases that render basic triangles, glmark2-offscreen etc.
>
> The driver/dt-binding patches are for Rob to pickup and the DT patches
> are for Bjorn.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> To: Rob Clark <robin.clark@oss.qualcomm.com>
> To: Sean Paul <sean@poorly.run>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> To: Dmitry Baryshkov <lumag@kernel.org>
> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> To: Jessica Zhang <jesszhan0024@gmail.com>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Jordan Crouse <jordan@cosmicpenguin.net>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
>
> ---
> Akhil P Oommen (11):
>       drm/msm/a6xx: Honor perfmode_bw threshold on A8x
>       drm/msm/a6xx: Fix secondary rail vote in ARC votes
>       drm/msm/a6xx: Fix RPMH dependency votes
>       drm/msm/a6xx: Factor out RPMh arc-vote helpers
>       drm/msm/a6xx: Add BX rail support to GMU dependency votes
>       drm/msm/a6xx: Clamp MX dependency vote
>       drm/msm/a8xx: Add Adreno 850 support
>       drm/msm/a6xx: Send THINMEM config to GMU for A850
>       dt-bindings: display/msm: Document A850 GPU and GMU
>       arm64: dts: qcom: hawi: Add GPU support
>       arm64: dts: qcom: hawi-mtp: Enable GPU
>
> Bhaskar Reddy Valluru (4):
>       drm/msm/a8xx: Add Adreno 845 support
>       dt-bindings: display/msm: Document A845 GPU and GMU
>       arm64: dts: qcom: maili: Add GPU support
>       arm64: dts: qcom: maili-mtp: Enable GPU
>
>  .../devicetree/bindings/display/msm/gmu.yaml       |  90 ++++-
>  .../devicetree/bindings/display/msm/gpu.yaml       |   4 +
>  arch/arm64/boot/dts/qcom/hawi-mtp.dts              |   8 +
>  arch/arm64/boot/dts/qcom/hawi.dtsi                 | 336 +++++++++++++++=
+
>  arch/arm64/boot/dts/qcom/maili-mtp.dts             |   8 +
>  arch/arm64/boot/dts/qcom/maili.dtsi                | 309 ++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 446 +++++++++++++++=
++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 231 +++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  25 ++
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   1 +
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  16 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  21 +
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   8 +
>  15 files changed, 1407 insertions(+), 99 deletions(-)
> ---
> base-commit: 1e9b8055458b92f9ebab6f39d97ade5265a0b012
> change-id: 20260811-hawi-gpu-05b4ecfc3c4c
> prerequisite-message-id: 20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qual=
comm.com
> prerequisite-patch-id: 239c169e15da44519b2dad09ecd92f0052757929
> prerequisite-patch-id: 6c586be864944bb1eed773e8c211b898bb1289fe
> prerequisite-patch-id: f3d8748ccdb6760563f3e07f701a18388a9408ed
> prerequisite-patch-id: b1639353868bed10fd3cbfcd01cfb88b7e737ead
> prerequisite-message-id: 20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcom=
m.com
> prerequisite-patch-id: 36f12c16bf9cb0411d8be2f396407c724162189d
> prerequisite-patch-id: 28ede1ab83d4b5b56423ebb09bae74b6599b3bac
> prerequisite-patch-id: 6b3e28c55c07bfcdca8bfa9219fa0c6c763c6f6e
> prerequisite-patch-id: a2007fdaaeaf2981860c54ae5514f5a6f06c6bb3
> prerequisite-patch-id: af8aa3c630647336bdaeffa9c88de3650f1e49e4
>
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
