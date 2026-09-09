Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17938572699
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964292; cv=pass; b=kyIWS/jhnKdKf9ChUqQdfysW4N8gQdIUjyLT67SSmOY8qeUuRLpEAgfk2kogsI0z/ViiEP/2ioOLH8JpqaKv6z5egl4qimt8TdC3RtK0bNq5UhAT4ll15iHxujlSy/x4uW8Q/4KnvfAIFN17gkZjycu64LShkzJh1uDUdve9jD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964292; c=relaxed/simple;
	bh=W1bDY8dmAAGuBvMUwbXF656/dw2XQjRmtQx8A8S8bY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/cwFgza3lkUROdB95HzHumUBtSHWaNYgIry8M71edCkUsETfUCzAw3zSV4xjK50sZVWo/oopQfCTCAUj+DbOtkVmuWvWbilQj2qpTiGdRZl5LthQ01kCTdGC6vFEh3FpEn4YibULzJ1UBEQVpPbOvNrDpfD0G6PhwDa5c9cYk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RH2yCPBy; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RH2yCPBy"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab17a1e3so240514a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788964290; cv=none;
        d=google.com; s=arc-20260327;
        b=BPRgq1jhyaG6BXhoWFOfvsVlhzqwdmBRK36iXeoLZd9NVLextwlSzNbnnZL7hJ0RS2
         q77f1Jsam88EMmIoAov1AeyE2GMpKAXnH5tvy7XkNe7ikV6KDiEorIgCXoJXb7syeaNJ
         Myn7o8Zm5vIAsL6hgtLJhh/LAceg0OfUGihRMRFyVj2Bq58FKbUIjfyYEGvSDJjBDb/1
         qYD8o2O+Agg5nZCcORmlYGv4ntBtuy2PXHjQpFJUmPFKEwCFZCeDv5gKrQ05bZ9jc+G6
         NuwKkkREX5t2PYmK094t1MESDk1uRK/2SdNIyTO+w17ei4BM0ef/Dx0wVBSOQ71fFOCX
         OyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r6d1bbraxxEbRqi2dCUG5O4sMDZatQ/k1ITQSbR2TYM=;
        fh=uYZW8fqLfjjB6y2ADvsWRgcvH10Usw5IZU0CdYE79+k=;
        b=YhbTbdHt+lsJaiJMKpFT4gpfbxGH9qch74Et23etlcobP5piTPDug6/Fi71SOCHdog
         YjYgYDrawprhMvs9dmy2ISOV7TJa69IGaBmG2jphinibxr5h/bsjvweEblbC1ncKz2II
         YNeTmdHrSBLFCBs1ZUYF1BLaQfYmnski6F+PHOQrCivzi9MvPTVXCDlOqNp4Kh8PX85r
         ixibKMc9rgC752h4VpjvV8p+Gk1p5TCC5N//Ee3WKxP4SRSPSBPqv1Lau75wzmjA4srJ
         SrjBzdjiOkUFO1MVYBoSajA3jeE4jYajOe6L6f9DLT6wvjA2O7xwofrD9nyrtgQatg7Q
         hKIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788964290; x=1789569090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r6d1bbraxxEbRqi2dCUG5O4sMDZatQ/k1ITQSbR2TYM=;
        b=RH2yCPBy4/Td1F3X39b/wFW9WPeFfiRNSj45A+otM5IOBxMnezcKKiEIPF0KzsdtKz
         0But9RXC2OTPvI1bBpWnC1D5M+xohP90x1saEpTb1NpT55EzQAjuE2OsAeqleivAz98f
         1lSMsnLNxpgL/peaR/gnqMEvAFTthcltFkiUvrv5zwWPVt/jyh41j4wGCBjVUp4NVsr5
         ZrFj9syYhuSk5iSHR6mjpnHewxbHRRyos+HGM0Ce0G+MAFSqAfw/wPAEsg7dJdbM+ga7
         Z7LDyXPCq/QoAu1r6g7F8/bIv1zXOwSXRUxo4fkN+vghMYJQnxa4LqRalyC5u/2hU7Xj
         jt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964290; x=1789569090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6d1bbraxxEbRqi2dCUG5O4sMDZatQ/k1ITQSbR2TYM=;
        b=SqoGzCEtZdg+eDZ/MEj+wj9Lavp3q+51iuiQ/l994d4XoK2T6BZkdLw9/T1shKKxSX
         IMIUMW4/xbifvclnRLnM0F1f9h6abkxMOwOCaHUL4XMFt320O1PFjlqfoKDHH7rL4fa5
         xCXUeLLIyN/0eEOAofSnTCW0t6Ay7+S+EUZEdC3gIbUmIrYjHJl6GTgHC32EVU9bB2oT
         oNV3ZBwT+sbeYyg4NNKoyJOlActqaTgALDwRG9agArtOoT6sqTWRrCXi7bn05XdEDbqD
         UbLTeM+AEB34UKd9M7+OPzKYSMioJ4rfVf00XziXWSvQ2oGCPGZ3MMtenq03yAuIV3vu
         BveA==
X-Forwarded-Encrypted: i=1; AKwUvBxZXyx1PTsN0chL0cGyPcjpKnQ+1IvDSJTJsgM86ciuIW/3lImfm+64alVAyLFlkYtNJUrfdNZSjgOhsOw=@vger.kernel.org
X-Gm-Message-State: AFuF++lIpn3+lZMFzjyiD+Tx4u8iDN/XbtKh2xdMyVopzfBtW1cLaQM5
	zVtPC3awAm81zpo2/J9T9tvHHbpJSyjMyaUJEReBeLrDO/59apzbimNyvjIunwOmXiktFq3MJnu
	YPDfJRIO+pqZ2dvdPHtid47ct27RFZrw=
X-Gm-Gg: AYBFou3VGlQKLjNGSrDR6qZSi8JdP9UdaZ8qnLwXZ4C5bf2TddsrTgUJqISPmo0exGw
	xO8bsB/cwHV4rUbK3lfRta/hXyPcKzNDqujVbqJQmeoxqxGTWPHp+NuAId8uogEV8/Msu6QDWk0
	w08v/VOUJZqUBoTSD7sMKt8wJc5uBv764JtfX/9YAnF3JrPLaX4KzVU0eInkgD2dXn0s7gsVFD7
	HJap5oBw6c6S+lKSIPSJ70ljRomTwdKooFHD/njXLdjvJDuAsFe6lp3jkgEaZIxZFP7fPnY8d0d
	h/c4pc0u4FH0SiQ8s6KBEbQKsS6yzb86PmcU6mIWnmqJlxDVcwA3u+zaYSCEdgtZMJxaA3nIOU/
	Pgl51zsZXUF4=
X-Received: by 2002:a17:90b:2dc5:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-39b9a99459fmr10318254a91.3.1788964289978; Wed, 09 Sep 2026
 07:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
 <47f0399d-bb31-48bc-b69d-4abd445727b4@oss.qualcomm.com> <5bd35343-1bd9-43c6-90f9-d57d67e6d416@linaro.org>
 <CACu1E7Fs-=sKJ07Pcb_7BCTFaXLCMVGEu=yQ6+hfG3Vjc2Y_RQ@mail.gmail.com> <6763c530-ffb6-4480-9a56-2594bfe8a010@linaro.org>
In-Reply-To: <6763c530-ffb6-4480-9a56-2594bfe8a010@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 9 Sep 2026 10:31:18 -0400
X-Gm-Features: AcwNN1W6JfBlDjrb1_5nbhBQz72mGClexEs4modSAjAw6CNXol8sRbktxQsrmMU
Message-ID: <CACu1E7GZa8QwWLk0qiCYiYzJN-2HorU93bYkkFChzR2gnExmGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Use CX AO Counter register for
 timestamp on a750 GPUs
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:29=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 9/9/26 15:24, Connor Abbott wrote:
> > On Wed, Sep 9, 2026 at 5:32=E2=80=AFAM Neil Armstrong <neil.armstrong@l=
inaro.org> wrote:
> >>
> >> On 9/9/26 11:06, Konrad Dybcio wrote:
> >>> On 9/8/26 3:24 PM, Neil Armstrong wrote:
> >>>> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTE=
R
> >>>> register on A6xx and other A7xx GPUs, use it when running a A750 GPU=
.
> >>>>
> >>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++++++++---
> >>>>    1 file changed, 9 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm=
/msm/adreno/a6xx_gpu.c
> >>>> index f9de9329dee3..081e79ea4652 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> @@ -23,9 +23,15 @@ static u64 a6xx_gmu_get_timestamp(struct msm_gpu =
*gpu)
> >>>>       u64 count_hi, count_lo, temp;
> >>>>
> >>>>       do {
> >>>> -            count_hi =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWA=
YS_ON_COUNTER_H);
> >>>> -            count_lo =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWA=
YS_ON_COUNTER_L);
> >>>> -            temp =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_O=
N_COUNTER_H);
> >>>> +            if (adreno_is_a750_family(adreno_gpu)) {
> >>>> +                    count_hi =3D gmu_read(&a6xx_gpu->gmu, REG_A7XX_=
GMU_CX_AO_COUNTER_H);
> >>>> +                    count_lo =3D gmu_read(&a6xx_gpu->gmu, REG_A7XX_=
GMU_CX_AO_COUNTER_L);
> >>>> +                    temp =3D gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_=
CX_AO_COUNTER_H);
> >>>
> >>> KGSL apparently *writes* the system time to these registers, is that
> >>> an idiosyncrasy regarding how the vendor userland drivers then use
> >>> this counter?
> >>
> >> This is a GMU counter, no sure why & how KGSL or freedreno would write=
 anything to it...
> >
> > It is writeable. This is part of implementing
> > VK_KHR_calibrated_timestamps. The idea is that when the GPU suspends
> > and resumes, we keep track of how many ticks it would've taken and
> > then pretend to advance the counter by writing the CX counter (after
> > powering on CX but before powering on GX which initializes the normal
> > GMU counter).
> >
> > Note that VK_KHR_calibrated_timestamps worked initially on turnip but
> > the tests started failing with v6.19. I haven't bisected yet but my
> > guess is CX was never actually collapsing for whatever reason and we
> > made it collapse hence breaking the tests. So we probably do need
> > this.
>
> OK thanks for the detail! Today it's only used for perfetto, but still
> on A750 a different register is used for this purpose.
>
> Neil

Well technically no, today this function is also used by
VK_KHR_calibrated_timestamps on turnip and today it's broken because
of a kernel regression...

Connor

>
> >
> > Connor
> >
> >>
> >>>
> >>> Konrad
> >>>
> >>> P.S. looks like a8xx also has this counter
> >>>
> >>
>
