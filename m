Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E27518125
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027872; cv=pass; b=ZmpbSRmIs6teaH0eCcqbD1afGKSZnQp1edTFlFdfAkNejJbHWJN1PNFYPOyNes/dUU08ETOlMzjfYT1cmtRdssPsTE1BEnlZu3Y7/IR5AutHBwcoTn5kDniDyA54dpMQ5epjF4Lb2pUzBLUXXodKP4+tONdt+Jm64XHuTLxugY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027872; c=relaxed/simple;
	bh=z/GhqHnrayzMkq4XP/AAv5bpwGxws0vq/kqMqhVEtNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OI8lAgMSsY9vm/ndLuIZUthxK34r8hQb8bfkrC2KeJxIsV4xS2e/PcGrhIlbFC6Ah2XiDex2zcdgK7X4i8h8AbRvlZK1AW/b7iclaKl4xIKluU0nCpJezRt0onFUIoP42nRj7CvGCzSdKg2595s1mZhss2SFPBE2/F3XcAF5s6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsagRWjH; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsagRWjH"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-399026951a2so607693a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:57:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790027868; cv=none;
        d=google.com; s=arc-20260327;
        b=pc4NlvOyzjnNKZ+pSw86wqKWxKMW5g7AyaQPp6lD4GJvZ6XdVZDkftVQbAUhM24UgY
         iKwssXT6LgAczoRydPUrocwUgYrurVRTHFGYmd249KOQurroEtbpkLULNYeTzztK7N2q
         V8U1WFT0LR2DSu9HO0WLI2T9G+6z9+u9hbX+2Z/O6dvgdkLIJo3pATzdbXFjpTX/7da0
         4KMV87Dr7n7oemvD5snx2uo/kqffCPrHH9SV+tbTL/NERulH9nxSlt9Lq18tbexm4S65
         ZhuU63U6izudQImbmT8S8zHwALiVSHnxCsp71OCeM29rjEjL5b840HuqlfI3jDeLhJmu
         JixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RwYh6OjRPIh/KNj842KS6LrZRkmlRh26aRS3vty9X+g=;
        fh=Qg/8GcP1CrfrYWZJcvMStfbPc0VPj98OAl9fo3xWQ6A=;
        b=fbjOtAcrELo6XB2WFXzrK5c7P8w5x2tvuT3fbp3r/Oz07UpjzEbFzrFrKova+Ah8vg
         se3lQuLpSg66XY3NWildx8PbBoG2OjiL0txTdXl40WdtYZvdvjhkKi+SjvBYfe1CV/lp
         j1eZBTZVSfXwhfAuK8mBXOND7sen1jyEYGAnU1WQAIE9RDVEyjka4FkizwiG2Nwdgvve
         lZ44Ht/BdO0v2p3VeglNUViuAsCzphukcGuqGyNX5Ox4obRdEry3BzIjLAOJhLkiHSrH
         YO/dzPxUAR2ARZXwsKBVsDwj05m13XAWA7vcI34AS/ZBhWZi3R3/Jy8eq+wFStboxOpG
         7mBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790027868; x=1790632668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RwYh6OjRPIh/KNj842KS6LrZRkmlRh26aRS3vty9X+g=;
        b=RsagRWjH7XnJjLU/v5Zhta2QaJUJE3zowStUVKirz6SixA7y1I+ffgktVJ29JP8aza
         JSeF5+dNLFnAknn5vHBDZkX3+0zIVPxW7AMfDc8HK1yTIRDf4SkAYwkX+fxI0ht8zq3A
         8r470CQR/ZbMsHCbjkzigSZoZaCMkXudc4Q94lK1I9z9b366+arMvH1bdAwWAgs28Zp4
         iRDiCfJPo6yq96yrxxM+EEvGcmqwjj5G9SDCYrI8al5HDpA4GNqm1dwxinMZwMxTvksE
         wS0tVNcmJzwltzjf6Gv0eq+vxsiWawWTWfMt3FMAKAg5r5ATxr84hOTciY72SFcyzBGd
         5WVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027868; x=1790632668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwYh6OjRPIh/KNj842KS6LrZRkmlRh26aRS3vty9X+g=;
        b=qgOruzsPV3UvZ6HcRKyUCuNPjkLRZqf5jbX1Az8VJR0cSg950q8A9oRCdyx3DaQkLr
         dvLBExw/73krNtN6otuvVEFP38pKc7xp3VAPdd4KEaN4wy6QFb2QdqQIYz+2X4YsxQHI
         RmJAB7yBk569rhIiP3kVrokwAXyfAU4/S9uDh7P9CooyLes4mwL0PVBlQIdecM3fHG93
         lK24iRky8f0wkWVrFo3Vr1rfp8kuUgV5+KOOXniWB1936dNCcl9G+F1nxZyOYB0gx95o
         ROw/4q4w/uQMZG61A1bn7yEDUQ0W327kTm3Y6MhdtLudYo9ELVBV8RZGZCX5UdvrrCj9
         JRVw==
X-Forwarded-Encrypted: i=1; AKwUvBwlTuI6JnmGbMpRqvStB3Ygoj1fqDBOsqRY6pCO4/nJVxdOVxoctuowo1Y0fqLZ3ogGmCYdUJCqx4++ZZg=@vger.kernel.org
X-Gm-Message-State: AFuF++l9S+Z0uLeZyXJy+STPZKT0VKcZftweKZPM2d36sx1aB24l1B9/
	dHkavWNqzzkllFCw4uk4A1Udoaq2qYfui8RuG9xMO4BQROdVQPCagnnHKpDjkkMBrdSypTuB77R
	kQWHoKtuMY9uD4T6mz+wLNaAa9C3OwQE=
X-Gm-Gg: AYBFou3Nd21Xk2NGZn4c3Tx8f0KTTJFIfdW6kHtthEGOc/+bau8w79/5yVBupvF3OFy
	Ptvab1SY7U20e1H1UQdKBFxa4dDU909wIiIi89xFspaStXJT8O9QOOO97iUzmQa86zXhwhUa3jX
	6/jS16nN/Mrg5G/pTWtTMm1aYFOVnRrAchdDYizOKSI/Fu1oWGH5Yj2UPqb4JTM6XAKbMXjAkmB
	C2TtBQI7MXWP0bMGi4qp4VYIA2ZJGGsFiQPfjcPsUp6cg/XdLZ8cSlJpegMZNY47J9Pa0poFp++
	mgQ0flh6xsg7FYqNunYSQNhHg2SI9N0xR67P1svbWH2qGeNi/mE95IKoB3eHaZzqkL904Htolxk
	KeNTX13zd9NHPMJTRJi85FgZ9gSHwVtyRVTz71RrQaQ==
X-Received: by 2002:a17:90b:50c6:b0:39d:e1f2:3400 with SMTP id
 98e67ed59e1d1-39e599ff59cmr21734363a91.5.1790027868375; Mon, 21 Sep 2026
 14:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919165511.3687822-1-lgs201920130244@gmail.com> <b483d12d-f34a-4740-929b-28423d9c9b17@amd.com>
In-Reply-To: <b483d12d-f34a-4740-929b-28423d9c9b17@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Sep 2026 17:57:35 -0400
X-Gm-Features: AcwNN1UohLrK7gSjDi2UGC9O6aoP5YtKGJPc1vCQfKTwGIeZ-NrCeJY0S5T4r_c
Message-ID: <CADnq5_MSwTURavbU8ryixhPdsUfgBf64brJpALhkCeLq12BhXg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix IP instance memory leak on kobject add failure
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Guangshuo Li <lgs201920130244@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hawking Zhang <Hawking.Zhang@amd.com>, Likun Gao <Likun.Gao@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>, 
	Tim Huang <tim.huang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Mon, Sep 21, 2026 at 1:16=E2=80=AFAM Lazar, Lijo <lijo.lazar@amd.com> wr=
ote:
>
>
>
> On 19-Sep-26 10:25 PM, Guangshuo Li wrote:
> > amdgpu_discovery_sysfs_ips() allocates ip_hw_instance with
> > kzalloc_flex() and initializes its embedded kobject before calling
> > kobject_add().
> >
> > If kobject_add() fails, the return value is ignored and execution
> > continues without dropping the initial kobject reference. The failed
> > kobject is not retained in the kset list, so the normal sysfs teardown
> > path cannot find it. As a result, ip_hw_instance_release() is never
> > called and the ip_hw_instance allocation is leaked.
> >
> > Call kobject_put() when kobject_add() fails so the initial reference is
> > dropped and ip_hw_instance_release() can free the allocation. Keep the
> > existing best-effort sysfs behavior by continuing with the remaining IP
> > entries after the failed registration.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: a6c40b178092 ("drm/amdgpu: Show IP discovery in sysfs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_discovery.c
> > index a404d8aa13ee..4b1ad1c0a10b 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> > @@ -1314,6 +1314,8 @@ static int amdgpu_discovery_sysfs_ips(struct amdg=
pu_device *adev,
> >                       ip_hw_instance->kobj.kset =3D &ip_hw_id->hw_id_ks=
et;
> >                       res =3D kobject_add(&ip_hw_instance->kobj, NULL,
> >                                         "%d", ip_hw_instance->num_insta=
nce);
> > +                     if (res)
> > +                             kobject_put(&ip_hw_instance->kobj);
>
> Adding a message that this instance got skipped also will help.
>
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
>
> Thanks,
> Lijo
>
> >   next_ip:
> >                       if (reg_base_64)
> >                               ip_offset +=3D struct_size(ip, base_addre=
ss_64,
>
