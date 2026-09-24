Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEE037EFF3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258811; cv=pass; b=I07HBgqH31lbQMZGIqvfyV8q4YvM7ur4sRlW9o9gp6U5UADan561eN8llIumwQx076K3spy/NsU7wT5RXWtwsLcwr/AuvmHAun8eUAnWqpWLU0XnTrBWv04jYKe0ztCGV7geI99rHclodu4Re6W9JNGt++qlUOKpbkeKuqIcXZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258811; c=relaxed/simple;
	bh=U48nhcTIb1O9uC38fXHDr78q+i4puswp1WXXMZmRwIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUNcFj6FXt8wLfdYKcEspicj3hXNkV/wIK1hbz2rbntgEfKFZ2Pyvd8t8hz43TRGcN8GXqdNKB4Q/CyvSy2L2wXW0NJGES4I1+yarLrOJV6EhcWBGBK2p9ZyeeXv2RY1r8gkDtObot2QXGeRlTic2+xBlaSd/JV9OSUdKeqant8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQH6OqI1; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQH6OqI1"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39666bed444so128006a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790258809; cv=none;
        d=google.com; s=arc-20260327;
        b=AjvVE1KorqtR7jO86ecku+aY3qCErQvGb//q7kcnbD+7DTzkdTAMgmCQtGNKUU2o1c
         EUUlm/dc4hd8cmTm+a0OdJBnPXMyIA27DXeJ7r6Emaza9Ptz44J3fz2xJZYORsT19VPw
         Y72P4jRMDgJ4oT7xLqUZ5TNo7pPCD0JtwBfjJW6m5zJdzQvX9TNzT/Y7ddWCrsbjC3U1
         q7UP/5rALDDNfjG5dgZQdwIFE99v5WY7rHL/F8AiH7HkqezLptRHAZ10JXyMeFLrCRLj
         2qCg2v/S1MGZz5FYPz8BitkgpMNozYdQj/i6c/1hxz7VsGfFnDOwn5eErcL7jk+Ecs5U
         y+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JcTZ3ffRCO1EwcSB6GSlnipqVfq4JrFIZdul9BjBkvw=;
        fh=QlgHgRwA6CwFZb2ipOuBCVVIey7bsfwAxfjuht8KuyI=;
        b=bA9StD34WTYhtP9Mxx+TlT8VHmzZOQdwIBxPPgg4htBWxq12zGoMYzTicjrmmhP7XU
         ZS6yOkkVvfLVfBuM/vFDOtUQ1S7l2QNnb8GgXxNPoQogErENT2MVOtlWJ8QjOcnfKJxd
         IgETASTYi0SyStEg4ztWPTjBJbgbMJiuqxPX/eOpE2K7HkLJn6XhaNAWRrPIFi+gy00I
         RFLeSQFu48lLVQoila0L/sUdi1V0fjl62DHMh2u6+rBuD2obDQc3NxzdBns7oGNYzuLO
         y+k7UeX3TnZ9Gukd9p/dKWPENukpqrBa0pKO5M0U7lqjE7GIrLjqrSQYDozxaIsI504t
         syYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790258809; x=1790863609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JcTZ3ffRCO1EwcSB6GSlnipqVfq4JrFIZdul9BjBkvw=;
        b=bQH6OqI1uKKUqJodAQL4+Vo1bm3i/t+uSx0+Rx+0Yy61zEDmpRq+zehoNaDbsAsan0
         LPL55fckjP6sPsKS/vgUMEmuLw0Rl5dZQ2udDOvniqbaacyU4xFTj4oTXe3tN4BwUGca
         4/Jn7OMLFB49xiOXAUyfVrvBodvhQg3fb3KlXGuyO5Fdz5WIulGjW1HYN5UZL3BCESDT
         ms7Efa95WMXSiBOFR3adawbCQ3sI9pb1jTxEjADz1CNcB0TtpOAKD/wdRl9UWcr/XySQ
         f+lJ9HALMq05zN2fWZv0fPO9QV4pp5MXsQdAvb4+nRzzXxJ1rZC0/DVPlb+B7MvaPE0J
         JqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258809; x=1790863609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JcTZ3ffRCO1EwcSB6GSlnipqVfq4JrFIZdul9BjBkvw=;
        b=aSnmXC/lm9SqbNw5vhuzQO8uq4i/qBXTHHRBLK3p+tazJQX/h0JIWLuUHtp8C7z8CV
         a22s3Q/LivOMJPC4z+zMwNTdE8Ma3WMFQKpW6cpMHFm5AP6riHHyYp3CRZ2SFkXe3XNb
         A17MByt7rhdXIVW/84W1tb/gK3DGO/bzfcQRx3qIIMBfZ0YED5dU+k5szJRLsSqQVQ/l
         79ky2+pVMHGHqXkVthTr4C9iG63Vd56h0DogruKo1BnhbcBhITgxUJ4XzAMBj+69VQiN
         dtIITPhI3Z329nmx3zRyNSkOaygGQz+dd79WljIBtp4qZuDWYubOuSmKqtnSAgjVuuqX
         rWLw==
X-Forwarded-Encrypted: i=1; AKwUvBzVsy8fwG5iFUBVyAxcCrkKOevO/dCi9lcqzy6nzAzfzAIysgzOBMcJJfJDNzA1YxZCzSu0tirNkP6qq2w=@vger.kernel.org
X-Gm-Message-State: AFuF++nEB/BidiOH2FIPqyQZc5SmE8vmOoGNJYvdl7Yf/JEbKUwPENL0
	hNn/oAEj0fOBauuIAbXCMD3EQUjJz4VOEvp0G1MyFCP3TKm5JRe8CuhtZ8fPrm0ux8Ifv7nkaWJ
	7oLOBtHCQOEqaaAGo2akaY1HuFG8fp40=
X-Gm-Gg: AYBFou1rkv0jfAtcov86ocIuu52EX7O/5FiLZfBumtSSjs1ghLmqdA7EkKzrqneHmQs
	jGM6e+H/Czj2ciXINOOgbns6CSxBTBIJHnsTdtvK21qUA7wlhr+LCTNmhAtHbH9r66zRyd0seBA
	5i9bCDSyGHB4KcZwv4R8cSNpoTipfWjnWjZCBp5Uvv3YlfEMAlxpWqX0D4Aw16ig+1wX4pTfggj
	s/rMHl8MC4RLiLYjBm/1x6qDhIVkMuYb7Wnyv57MF53t+pkg1290NaWsqn9M6yAT5L5P7qPmc7c
	PpRf1/nx2LmwdII9FV+7UBxuvE0gMFwdJzvaLzhZjRKJK57PgmqNraEID4zT44qesuJVJIEFlVj
	UUAThLfW+vFh2
X-Received: by 2002:a17:90b:3c06:b0:39d:f130:ba54 with SMTP id
 98e67ed59e1d1-3a09837f56dmr4405287a91.0.1790258809042; Thu, 24 Sep 2026
 07:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <CACu1E7GndBnSj75ZVqic9NxdSakZJL3ZJOuz7D+RbVWA4DUqTQ@mail.gmail.com> <692ff69a-330e-40db-bffc-a53987fa4bce@oss.qualcomm.com>
In-Reply-To: <692ff69a-330e-40db-bffc-a53987fa4bce@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 24 Sep 2026 10:06:37 -0400
X-Gm-Features: AclHuK_K3H4oMYks1o-_9RZ45Z4Udp7YxXFegQ_4Y9VAlkof6K_6cES08nQszX4
Message-ID: <CACu1E7FuCVhu_0gKmVVeBL=e4=zghvXJT=mZVfg8UjUzRrv3Yw@mail.gmail.com>
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

On Thu, Sep 24, 2026 at 9:41=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
>
>
> On 9/24/2026 12:54 AM, Connor Abbott wrote:
> > On Wed, Sep 23, 2026 at 6:26=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qua=
lcomm.com> wrote:
> >>
> >> Adreno 850 is the next generation of A8x GPU present in Hawi SoC. It s=
hares
> >> the ADRENO_8XX_GEN2 family and slice architecture with A840, but has m=
any
> >> architectural improvements. There is a new block Matrix core (MALU) wh=
ich
> >> helps to accelerate certain compute workloads. Also, there is a new Bx=
 rail
> >> that powes a part of the GPU IP. GMU is now powered by a dedicated GDS=
C
> >> powered by MxG rail.
> >
> > If there is a dedicated rail for GMU, then
> > VK_KHR_calibrated_timestamps is likely broken, assuming that the GMU
> > AO counter is on this rail. The AO offset logic in kgsl probably needs
> > to be ported here. Has this been tested?
>
> Not sure how GMU core's power domain affect the AO timer. Could you pleas=
e point
> me to the AO offset related change in KGSL? I will check.

Previously the GMU AO counter was part of CX, which is kept on by
other things in the system, so it continues to tick even if the GPU is
suspended. However kgsl does not rely on that, and recalibrates the
GMU AO timer whenever booting the GMU [1], which we currently don't
do. I don't know if the timer is still part of CX, but if not, then
this part of kgsl could become load-bearing in a way it wasn't before.
It seems possible that it isn't part of CX anymore, given your
description that GMU and other things have been moved to new
GPU-specific power domains.

Connor

[1] https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/graph=
ics-kernel/-/blob/gfx-kernel.lnx.16.0.r14-rel/adreno_gen8.c?ref_type=3Dhead=
s#L917

>
> -Akhil.
> >
> > Connor
> >
> >>
> >> Maili GPU (Adreno 845) is very similar to A850, except that it doesn't
> >> have the MALU block.
> >>
> >> We will post the Mesa support and linux-firmware support soon. MALU su=
pport
> >> will be brought in separately along with its support in Mesa.
> >>
> >> As there is no display support available for Hawi/Maili, validated off=
screen
> >> testcases that render basic triangles, glmark2-offscreen etc.
> >>
> >> The driver/dt-binding patches are for Rob to pickup and the DT patches
> >> are for Bjorn.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> >> To: Rob Clark <robin.clark@oss.qualcomm.com>
> >> To: Sean Paul <sean@poorly.run>
> >> To: Konrad Dybcio <konradybcio@kernel.org>
> >> To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> To: Dmitry Baryshkov <lumag@kernel.org>
> >> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> >> To: Jessica Zhang <jesszhan0024@gmail.com>
> >> To: Marijn Suijten <marijn.suijten@somainline.org>
> >> To: David Airlie <airlied@gmail.com>
> >> To: Simona Vetter <simona@ffwll.ch>
> >> To: Jordan Crouse <jordan@cosmicpenguin.net>
> >> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> To: Maxime Ripard <mripard@kernel.org>
> >> To: Thomas Zimmermann <tzimmermann@suse.de>
> >> To: Rob Herring <robh@kernel.org>
> >> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> >> To: Conor Dooley <conor+dt@kernel.org>
> >> To: Bjorn Andersson <andersson@kernel.org>
> >> Cc: linux-arm-msm@vger.kernel.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: freedreno@lists.freedesktop.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: devicetree@vger.kernel.org
> >>
> >> ---
> >> Akhil P Oommen (11):
> >>       drm/msm/a6xx: Honor perfmode_bw threshold on A8x
> >>       drm/msm/a6xx: Fix secondary rail vote in ARC votes
> >>       drm/msm/a6xx: Fix RPMH dependency votes
> >>       drm/msm/a6xx: Factor out RPMh arc-vote helpers
> >>       drm/msm/a6xx: Add BX rail support to GMU dependency votes
> >>       drm/msm/a6xx: Clamp MX dependency vote
> >>       drm/msm/a8xx: Add Adreno 850 support
> >>       drm/msm/a6xx: Send THINMEM config to GMU for A850
> >>       dt-bindings: display/msm: Document A850 GPU and GMU
> >>       arm64: dts: qcom: hawi: Add GPU support
> >>       arm64: dts: qcom: hawi-mtp: Enable GPU
> >>
> >> Bhaskar Reddy Valluru (4):
> >>       drm/msm/a8xx: Add Adreno 845 support
> >>       dt-bindings: display/msm: Document A845 GPU and GMU
> >>       arm64: dts: qcom: maili: Add GPU support
> >>       arm64: dts: qcom: maili-mtp: Enable GPU
> >>
> >>  .../devicetree/bindings/display/msm/gmu.yaml       |  90 ++++-
> >>  .../devicetree/bindings/display/msm/gpu.yaml       |   4 +
> >>  arch/arm64/boot/dts/qcom/hawi-mtp.dts              |   8 +
> >>  arch/arm64/boot/dts/qcom/hawi.dtsi                 | 336 ++++++++++++=
++++
> >>  arch/arm64/boot/dts/qcom/maili-mtp.dts             |   8 +
> >>  arch/arm64/boot/dts/qcom/maili.dtsi                | 309 ++++++++++++=
++
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 446 ++++++++++++=
+++++++++
> >>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 231 +++++++----
> >>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   1 +
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +
> >>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  25 ++
> >>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   1 +
> >>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  16 +-
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  21 +
> >>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   8 +
> >>  15 files changed, 1407 insertions(+), 99 deletions(-)
> >> ---
> >> base-commit: 1e9b8055458b92f9ebab6f39d97ade5265a0b012
> >> change-id: 20260811-hawi-gpu-05b4ecfc3c4c
> >> prerequisite-message-id: 20260923-hawi-dt-post-v1-0-e41473b6298b@oss.q=
ualcomm.com
> >> prerequisite-patch-id: 239c169e15da44519b2dad09ecd92f0052757929
> >> prerequisite-patch-id: 6c586be864944bb1eed773e8c211b898bb1289fe
> >> prerequisite-patch-id: f3d8748ccdb6760563f3e07f701a18388a9408ed
> >> prerequisite-patch-id: b1639353868bed10fd3cbfcd01cfb88b7e737ead
> >> prerequisite-message-id: 20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qual=
comm.com
> >> prerequisite-patch-id: 36f12c16bf9cb0411d8be2f396407c724162189d
> >> prerequisite-patch-id: 28ede1ab83d4b5b56423ebb09bae74b6599b3bac
> >> prerequisite-patch-id: 6b3e28c55c07bfcdca8bfa9219fa0c6c763c6f6e
> >> prerequisite-patch-id: a2007fdaaeaf2981860c54ae5514f5a6f06c6bb3
> >> prerequisite-patch-id: af8aa3c630647336bdaeffa9c88de3650f1e49e4
> >>
> >> Best regards,
> >> --
> >> Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>
>
