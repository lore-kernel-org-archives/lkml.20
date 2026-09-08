Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04EB72630
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880184; cv=pass; b=pCgVzSwo+nzc4iVDJFffl3OppvIyBhE1xHph57Z1aXIPU/a80R3ivaIWj3lfkbYkHk+Ff0uBbAmZbX26IhI0NCbw0w5m8zoimTAgV1utr96CNIhCPVNDYiPhZ5eNElzqE4vbQnRSWN61WVfG7+bTan1jCP1PxVP8sOlv7HFAE34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880184; c=relaxed/simple;
	bh=6Zy0C1EjFJfOWizXIiG9XHODZBpgtje3VHdrwvLXvv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldj95wcrbVUJT+EiWEZKX2cka3oADrOG6srBb1TijZ5YQG4lGrQfUlA845tUdYBf77EDuIHuRD0ERa8GnGRa8zF0cI55mA+j7nsumHaIinkw0XQNmUe7m7Z0msQfQjMGsaiZB8icssZsIP+xHJMkz/wvU/TBZlV1DRfoMIRreRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbKq/nUG; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbKq/nUG"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd281so816504a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788880169; cv=none;
        d=google.com; s=arc-20260327;
        b=SjzWwvm5mBXCO9fbxyXdkGmj4J52p1tY+XYhs55bj70uYUd2Q8yCM6+kNOhvVFmVZ1
         Oz7V5bSZddV1ApW+WesYXtHwxO7u89sWjuitt007uV9bt9Xu3g1zmCPUxxIot5N/USMs
         AYoNdJQp2Nnz/S8zulZCrQM7UmH1BXRYw7zn4CAIg+rfG7gTA76TKsBvRtPH4+qRBbKV
         SgMq18BvrOuqu01xVlz48SEm0H5mUcHGSR3URYK8qR6vx+9Sq51BQHQrzE0zRcj7nHFb
         k3JTIym18UiieoeZc9TSJkBLYRqzU7cghOT5/fLATW+ehbw/ARjhwem7kGvlYZAG6R6S
         X4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7VyQi/ZkPUG+zy3skQVlnP5ix8MZF/MBT4Cn4vahwwM=;
        fh=ESWbEh5FJRDlib7tA9KJYcqbK+R2g17zsSqwosRvCa0=;
        b=jOGshWodiM6WE4+JIeCOHC/KWONMflGluTKuPXSZfH+DX+4OBS5iVMfCUI28yFLydi
         JaKXBWlIcJW5LvJxGeTPS+YjDOMCK4zFFTNMjxFqIOoUy2jMecbaTafHyKVkj87ZT0JE
         vZC1GlVAPZpfgXL4yz4pAsgK+ioxjPTe1E+4G5BAalmJBBbQBD0+LGzjtjpWgPxdkrnU
         7BUe4+d9zU1gbSTa3RRg6TSIPFihGpnFuHOQ5wE8iKywgvvmIm+StYqoaYUrxVtkFdhV
         SJ9g0ePWnloaYdL/qVFodlF5ZKoFiSrwsx63QptBW2qoVBS+ySuF8LTd1rGAmVvWN50R
         l4tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788880169; x=1789484969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7VyQi/ZkPUG+zy3skQVlnP5ix8MZF/MBT4Cn4vahwwM=;
        b=jbKq/nUGFTR8IN4wfWzXKd7fFAV4KoAeigcOy/bvCyp12i1CCuss2leAP7ljzelHg6
         pl9rjGAdECWXq3BwZj6u8pZux0qlQvBy1167e5JvGcXc8O4afvZibcLcngD0qY38DhtN
         7rM8gHBH1MlLkbg/FtKIjSDiOsGmTutjwiYfUFNXKU9p8luk2oaat/nNh34I8fvMeJzI
         ieRLHOh0nPEfTaWDs2Cq7XupyXl/m38/MOWPCxgNDAJUUKp66IPtnzYwCczQwtHVKcWK
         TfIIKQbOU+d9frF14p+r4L5Hwc/m/oqZfSgBE2rgTUQWErOQs1rbRCFF+9Qo6VbJfZdi
         xDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880169; x=1789484969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VyQi/ZkPUG+zy3skQVlnP5ix8MZF/MBT4Cn4vahwwM=;
        b=hpuAqoMj+l6PIEc0lchP90mkLeam/Wc7fRZCNSlqsyWgB28IT+I0ESiGa1Cu4nzyHA
         iVPN1kzdlAh5Rg4IN9g8xp4xXrbBgunucvdXBKVhwJxKEDz2Ff3TLdI0GOqxEezNr7Yd
         1kApnTODiexQL1Q6Ye4xOmW2RPodoHMYeRkpOGnrFR3p62HhIdAntipCZamnzanC08Ql
         BfeXzOLMFXfFyhr6TOlfBDkhW0O1oQ0LtgPghuYAk9/slYZAa7jwEZ9hxV7r339hYmHP
         t61VYfHieRjBEdZDSr231U5sHrq9XnqWMHLVsRots+3zitCUnlA1MEPHTzB6ZPd9nK8p
         R96g==
X-Forwarded-Encrypted: i=1; AKwUvBwOpxWvdTzMxBwDH2A0w7fnlan581D2utzvkRtKBlB3caFS4NDlBj94oh0AcB9tB/FS+CJnz82KqrCg1oM=@vger.kernel.org
X-Gm-Message-State: AFuF++mhF7HVrTl4FLwpW008fQ8fUCRAivntYfxncAP/qNQ25woW00cK
	/CSHuUkPl66gfK0PeKfwSj6byDHuT4Y/bCxMVCA1Cxrs8ZYmQbNAGZprkC2HGmImvwv83ThAYV3
	bAuyAF3sAB/ThXYRDfVSu3YAMhT5+Fgo=
X-Gm-Gg: AYBFou2h2sndfnjuH/V84v5SdJo0jOwuJWrMrMYVy8Wad85W86s0Oyqq4nt/YRwlkQR
	+RmXyoquOr1f5QmWgdjx6NBz0LkpK3Xb8SraxIqxS+e5rpE8oZaj+Q/Ti37F1tHxfjS7qM5CiIy
	LnSbWx/kezGUE4LpwKoKpgDMvQLwsRbTxOecK27+PS3qH9R6aShBQUQAhurc+Gte++TUs2tCoK2
	QoMiinsHOAXtpd1PjHrKNSoepXwZCNW/JjErR5/s2NNqd/+ZMTt/tHNQOvZ0KpUuJ0MPV+GPkHw
	vEzYovKhu13shhsntyXcg9gZ7A9J7kRN3qmkeDtSLgqteQYLINdLHiWjxKq2vj9w8nKzHWVRoiF
	w
X-Received: by 2002:a17:90b:3ccf:b0:39b:34ef:3b24 with SMTP id
 98e67ed59e1d1-39b3d5aaa70mr21302626a91.1.1788880169185; Tue, 08 Sep 2026
 08:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
 <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
 <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll> <CACSVV03ShOw8D8d-5gDPYdzH3_Hp7EMz2CdfA3x08pCKAtw57g@mail.gmail.com>
In-Reply-To: <CACSVV03ShOw8D8d-5gDPYdzH3_Hp7EMz2CdfA3x08pCKAtw57g@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 8 Sep 2026 11:09:17 -0400
X-Gm-Features: AcwNN1UlPD6ctgDPf5NWumSwcQmlkV-egtOEnEpVqtiYB2PLdBiSmUTMS3asYaU
Message-ID: <CACu1E7H9KsUU=dV+iwQPOOX62+V8S5xstFf2LXhzeE7oSb3V4A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:51=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Tue, Sep 8, 2026 at 4:41=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Sep 07, 2026 at 04:20:43PM -0700, Rob Clark wrote:
> > > On Thu, Aug 27, 2026 at 9:07=E2=80=AFPM Connor Abbott <cwabbott0@gmai=
l.com> wrote:
> > > >
> > > > On Thu, Aug 27, 2026 at 7:13=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU =
power
> > > > > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts =
from
> > > > > zero whenever the GPU is powered up again and the timestamp repor=
ted to
> > > > > userspace jumps backwards. On an a702 six reads three seconds apa=
rt all
> > > > > land in the 500..1200 tick range, stepping backwards twice, and o=
n an
> > > > > a530 the OpenCL device timer conformance test fails because
> > > > > clGetDeviceAndHostTimer() returns an end time below the start tim=
e.
> > > > >
> > > > > Save the counter in the suspend path of the affected generations,=
 while
> > > > > the GPU is still powered, and add the accumulated ticks to the va=
lue
> > > > > reported to userspace.
> > > >
> > > > This is useless because the entire point of clGetDeviceAndHostTimer=
()
> > > > (and the similar thing in Vulkan) is to match what the GPU itself
> > > > returns, and now you've broken that by adding an offset.
> > >
> > > Just to clarify, the timestamp needs to match what UMD reads directly
> > > from hw in various different ways (timestamp queries, shader_clock,
> > > etc)..
> > >
> > > If we can _restore_ the value (ie. write the hw reg) on resume, that
> > > would be ok.. but it doesn't look possible.
> >
> > Yes, a quick check shows that all relevant registers are write-ignore.
> >
> > > Otherwise I guess we need
> > > some scheme where an offset value is stored in memory somewhere, and
> > > some coordination with userspace to add the offset in various
> > > different paths.  But the kernel shouldn't be adding the offset to
> > > what it returns to userspace itself.
> >
> > Ack, thanks for the explanation. I tried to match what kgsl was doing.
> > It reads the GPU timers directly from the GPU, but for the CPU timers i=
t
> > reads the value from KGSL driver which accumulates the offset.
> >
> > If I understand you correctly, we need to export the offset to the
> > userspace via some extra page (like vdso) and let Mesa read it. Correct=
?
>
> Yeah, it doesn't look like there is an existing GPU_READONLY && !APRIV
> BO we could re-use, so I think we need to create a new global (TTBR1)
> "vdso" BO which is read-only to the GPU but otherwise accessible to
> IB1+, along w/ MSM_PARAM_VDSO for UMD to query the address of this BO.
> (And update msm_mapping test in igt to validate that it is read-only.)
>
> (I'm not married to the name "vdso" but not creative enough this
> morning to think of something better)
>
> I'm a bit curious if kgsl handles this differently.. maybe there is
> something I'm missing.  But somehow timestamps need to agree between
> what is read on the GPU and what is read on CPU.
>
> BR,
> -R

I think the kgsl timestamp offset stuff was only added for the new
A750+ CX GMU counter which is not read-only. We do need to port that
over to drm/msm. If the offset is applied for older GPUs, it's
probably another case of kgsl not bothering to keep support for older
GPUs in newer branches.

Connor

>
>
> > --
> > With best wishes
> > Dmitry
