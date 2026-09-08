Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B8B5328AE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906268; cv=pass; b=RLtBR3oWkdv9BJZUL5Y4gTaBqeIXP+quOOB2ceRRi3n4InhkRQxH2ITxRPflrgEyw5pRYh1u3w706Hrg2kfjOa8xoC5CCDgeGzgkTIRmVZu7EsPcC4M2e283yMyZc+RLEj6S82duVARChXposKB1kmnuPsF0NXUEtXe0a+4Amho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906268; c=relaxed/simple;
	bh=s5uaxEY1oEGlpLSc8BasHuuvEs5Hx2/Cs6PiacTKyEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mu2tB0SEEEpID2genL5YavXHIWY++WiR1vOGLmTqtNU9V1spVSCxlYuRStPxx8MTLyQ6ettpHaBfudl4B9WZegEtFdJN2llu6EjViyBABzN0GuCOLVipWPQOZa8W4P+mIBFORTsGHAjPtKHQj+Ubc29/wGQiI0Kpbf/5ocx4bkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUpChgIn; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUpChgIn"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-399026951a2so734030a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788906266; cv=none;
        d=google.com; s=arc-20260327;
        b=pNwZ3kAezYDSpaF4A9SYIpRFmNCtLwaIgf4cAs+WvnssSvTpyGHxxjNobS+rAy1+PA
         1brI++6uJhTb/dSQXJzl/Ukc1TAL0riek925pYufD8Y4PUZaSPT/ponBRMNoRs7naYHm
         eI/vHOKpMtVfiBFFDnvLFtLODNvV2a28jk+mNC25lP0b7cCf5e4ygtm1YmhWs/c2uRlL
         qXVTI7ZYbtibqoODr6IQA8TVUOgx5hrVAp5O7h5JoOEggIBn4zhJXo1Xb6NDkBz/nuVE
         Wv0dGL5+ul9gfUFLRxxNnRkyOuWbuw6pG79MB+ITzRuMFvrHS+79s6v/WXqUa/Myr2iQ
         fVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U8EkFagfl9uinl9KRuv/CDvRS8wFSFBw+B4s084qWz4=;
        fh=a6yrv0rkdYfKrnSQjed9k2eR+zqNHCNio2ciWbwDdW8=;
        b=aHBAqX5dGSeDVKnPzP5kjvTzUaa0tXIYZ/AS8xe6CQv1UGuJGcEmNj+p8hEDUokhOM
         vyT3tSSbHtnmsOPAzH9slaMy/2U3BwInoHu2U9nVoCGWK+xbY5uFi02zQys43Rb5RjjT
         PZaec9TzYVDH38o2D8aF2+6NnRJio/U6rJ21i5Pq5MxUNZdgUixueFsI1alp9h44OMu0
         1EM9akgxJ0XR/BF9Uzp+YSOjdnxhrXLsHUr/DUzUoLjCWGpcrI1tgOEBHy18068vYBmo
         hk2TSKOjHG+UYMqR7wS3BH+SMT/qK49fTyeKO3PRRWTNpPId692ChQpwPlObTrs3IIwq
         ItXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788906266; x=1789511066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8EkFagfl9uinl9KRuv/CDvRS8wFSFBw+B4s084qWz4=;
        b=MUpChgIne/ZIhclBOZzYfNnD42GEGynsw52npE/nxW8kHHUqqmXJZTLUdVrAJnxZUa
         NwYq6zfe/DQxfQ9Bu3iZS9s+9RDJR09Dth9qBcfmp6LWXIk8YphKeeeMdwRyjwTuorzt
         ATvQkuH6KWG8B6lqPWYhCa513aM/tJ6yXBIkW30qho53FabRFwljGJuEvB5gxReCOg4c
         7IzgniNkpoW9cVo50ZOqWTsO3q1NArsxyuIb4Ag6tMnd55O4iQg8pqIFKD1C1HJp9wVQ
         wsY/saKT0EILuND7mumm3E2O4lV7rYTlkGuOkQ9xdSHa9mLuiMWaHQwetERii9kHAvxd
         PIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788906266; x=1789511066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8EkFagfl9uinl9KRuv/CDvRS8wFSFBw+B4s084qWz4=;
        b=DgQqsA+uHrSv5FZz5co0Z3bSacVsTT7z0mEvCHW9ZL5rvxbCUWZVzjCqevljm3IobJ
         bHz2CE5L0SX+IWNrEf5hQeg6IArmTZ++5ZlMY2eSFDY40CfG8ZweW+n2bxHPg1oBIDMH
         JrtWRU/uLQ/rlFoVNTWqIhuHQYFhF/ifyqMb83ZVW1vxg8l9YJDyd9PGwDWsnHAaDkDF
         Qb6GO0nmQawb3DJQiWBJpDKjNd8v8HXFkKtS8dKBIMi3D8quVOSfpIHG5kdryxbF5hxC
         SKjBx5IOoF1OAnKOih5Nwvxo2FGcAt5bMxujV7Z9EPh1mJAm8GZYHuBUumpzw+GpTkVv
         7ZMg==
X-Forwarded-Encrypted: i=1; AKwUvBz3vJSYRVDSOG0ibxXNsiuI2iSQ+FIFrvGa72t0UM0iUWBCULW7VTffwlxafiqp6kcn4f2lRex4PZ5yB/8=@vger.kernel.org
X-Gm-Message-State: AFuF++kpflUJD4Gqs3bNxeX/Ld2yRD+fdKU0w9BZx6jTulK9crPYY3On
	MQZ14KwFni3UrgQa8f5effP5wdp7Jyf6GM0WXZEIZBi9vxSZtitHOPoRVpQEP/TMHC17ba5eAmv
	zSGd5teXoihEu9I9ImcP0exDnSxlokZ4=
X-Gm-Gg: AYBFou0cW5eWQF+TT17O6E98HoC6fvD3o1RxGaFfmzdWorkFbV+96IZeuU6EqVNd/J5
	8QXFjvRuYoOrwdBtq+DHoyNUO8z5g7OuIlTljp1h7waLMHMw+KCnxa0BYsc84kxiNRFAnqYJoML
	nKsPIZ/0mB2vYdWJ1Y+JB5zyP99tJXScNXcru3Irv4y5EF7cUolmnKJDYN+z/YSNmCpL8aMPkyM
	n1WfzPzXg1joEuXN1k/yhUU5ew/nrZoveS3toQAR6vThKKF7QqGyFr6N9LYQglm94qbsdHhssne
	n04R67fOigjT3fQevAnQqXmnMsY2x1ywDa+i5SeXXXeAXoecTpt5hQqdkLMnRp6or3AWsxeatYU
	k
X-Received: by 2002:a17:90b:4b41:b0:398:bad2:c0f with SMTP id
 98e67ed59e1d1-39b3d8310d0mr23157347a91.5.1788906266333; Tue, 08 Sep 2026
 15:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
 <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
 <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll>
 <CACSVV03ShOw8D8d-5gDPYdzH3_Hp7EMz2CdfA3x08pCKAtw57g@mail.gmail.com>
 <CACu1E7H9KsUU=dV+iwQPOOX62+V8S5xstFf2LXhzeE7oSb3V4A@mail.gmail.com>
 <xq2q6jazk2a5atfthzwktn7qhrinxg4duhdxg22qrutgdycbwb@47nosxhcqloz> <6s7mwjzglv5slukj73glmshe4gwfyh6cvimxyeyn6l4r46lkpv@74mpfroj23xi>
In-Reply-To: <6s7mwjzglv5slukj73glmshe4gwfyh6cvimxyeyn6l4r46lkpv@74mpfroj23xi>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 8 Sep 2026 18:24:14 -0400
X-Gm-Features: AcwNN1UV5foMtL6xVJAa6TgZb3_vfx9LKjXxP4r4sT9_mlJ6kDTMt-VInvhka9I
Message-ID: <CACu1E7G8K+7ACJfArtVOGMDVbO+A3GEmghHBurXXCsDvdteJ+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 11:49=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Sep 08, 2026 at 06:26:22PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Sep 08, 2026 at 11:09:17AM -0400, Connor Abbott wrote:
> > > On Tue, Sep 8, 2026 at 10:51=E2=80=AFAM Rob Clark <rob.clark@oss.qual=
comm.com> wrote:
> > > >
> > > > On Tue, Sep 8, 2026 at 4:41=E2=80=AFAM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Mon, Sep 07, 2026 at 04:20:43PM -0700, Rob Clark wrote:
> > > > > > On Thu, Aug 27, 2026 at 9:07=E2=80=AFPM Connor Abbott <cwabbott=
0@gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, Aug 27, 2026 at 7:13=E2=80=AFPM Dmitry Baryshkov
> > > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > >
> > > > > > > > The always-on counter behind MSM_PARAM_TIMESTAMP sits in th=
e GPU power
> > > > > > > > domain on a4xx, a5xx and the GMU-less a6xx parts, so it res=
tarts from
> > > > > > > > zero whenever the GPU is powered up again and the timestamp=
 reported to
> > > > > > > > userspace jumps backwards. On an a702 six reads three secon=
ds apart all
> > > > > > > > land in the 500..1200 tick range, stepping backwards twice,=
 and on an
> > > > > > > > a530 the OpenCL device timer conformance test fails because
> > > > > > > > clGetDeviceAndHostTimer() returns an end time below the sta=
rt time.
> > > > > > > >
> > > > > > > > Save the counter in the suspend path of the affected genera=
tions, while
> > > > > > > > the GPU is still powered, and add the accumulated ticks to =
the value
> > > > > > > > reported to userspace.
> > > > > > >
> > > > > > > This is useless because the entire point of clGetDeviceAndHos=
tTimer()
> > > > > > > (and the similar thing in Vulkan) is to match what the GPU it=
self
> > > > > > > returns, and now you've broken that by adding an offset.
> > > > > >
> > > > > > Just to clarify, the timestamp needs to match what UMD reads di=
rectly
> > > > > > from hw in various different ways (timestamp queries, shader_cl=
ock,
> > > > > > etc)..
> > > > > >
> > > > > > If we can _restore_ the value (ie. write the hw reg) on resume,=
 that
> > > > > > would be ok.. but it doesn't look possible.
> > > > >
> > > > > Yes, a quick check shows that all relevant registers are write-ig=
nore.
> > > > >
> > > > > > Otherwise I guess we need
> > > > > > some scheme where an offset value is stored in memory somewhere=
, and
> > > > > > some coordination with userspace to add the offset in various
> > > > > > different paths.  But the kernel shouldn't be adding the offset=
 to
> > > > > > what it returns to userspace itself.
> > > > >
> > > > > Ack, thanks for the explanation. I tried to match what kgsl was d=
oing.
> > > > > It reads the GPU timers directly from the GPU, but for the CPU ti=
mers it
> > > > > reads the value from KGSL driver which accumulates the offset.
> > > > >
> > > > > If I understand you correctly, we need to export the offset to th=
e
> > > > > userspace via some extra page (like vdso) and let Mesa read it. C=
orrect?
> > > >
> > > > Yeah, it doesn't look like there is an existing GPU_READONLY && !AP=
RIV
> > > > BO we could re-use, so I think we need to create a new global (TTBR=
1)
> > > > "vdso" BO which is read-only to the GPU but otherwise accessible to
> > > > IB1+, along w/ MSM_PARAM_VDSO for UMD to query the address of this =
BO.
> > > > (And update msm_mapping test in igt to validate that it is read-onl=
y.)
> > > >
> > > > (I'm not married to the name "vdso" but not creative enough this
> > > > morning to think of something better)
> > > >
> > > > I'm a bit curious if kgsl handles this differently.. maybe there is
> > > > something I'm missing.  But somehow timestamps need to agree betwee=
n
> > > > what is read on the GPU and what is read on CPU.
> > > >
> > > > BR,
> > > > -R
> > >
> > > I think the kgsl timestamp offset stuff was only added for the new
> > > A750+ CX GMU counter which is not read-only. We do need to port that
> > > over to drm/msm. If the offset is applied for older GPUs, it's
> > > probably another case of kgsl not bothering to keep support for older
> > > GPUs in newer branches.
> >
> > I've been looking at the kgsl drivers from msm-3.18 / 4.4 as those
> > kernels targeted MSM8996/98.
>
> If I understand correctly, for those GPUs glGetInteger64v(GL_TIMESTAMP)
> reads the ALWAYSON perf counter through IOCTL_KGSL_PERFCOUNTER_READ. The
> perfcounters are all saved on suspend and summed towards the current
> value read from HW.
>
> --
> With best wishes
> Dmitry

I think GL_TIMESTAMP just wasn't ever exposed. The equivalent GLES
extension GL_EXT_disjoint_timer_query was written by Qualcomm, and it
explicitly allows zeroing on suspend/resume. IIUC it also doesn't use
the perfcounter, it probably submits a dummy job and reads
kgsl_cmdbatch_profiling_buffer::gpu_ticks_queued.

Connor
