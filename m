Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F1B53FD42
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602861; cv=pass; b=EFVed4L4/CiuhJZTjT1LJV0/posguSvk8o2+EKZFP//2nD6Sf2A9aFRzSpa8D4vLQuFy4cyGjFYTL2Fdl8oBpwrnSZPf95TqWeC9GaeU9Nn8SWu6N3OoBwZLPYvPBAxs06umQnUX8s5PlRCouloqoN2VeF9sphPCLx/gE65fPLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602861; c=relaxed/simple;
	bh=i6kD4pUvhxsEv9VEtymn5ts2J9oVTEC0DXwuogAj5bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y5+OZelqOJ86JVSDgiWGIr1b5wvv+hvR+aX/NnZKfw5yQs3NKBZDtCEzVgv/8PFxiywYpG9zZw6IOJb5MogyuuNJTDIE2Vxhx6qlIlaGjQ9ZR95kmtJOyOMnew6N/9da+pwvGDDK8TMzX5hnTiK7ca/RjiSDEwUa7XaYDBwXrX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SiSRZ2Xv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PmuEnsGR; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SiSRZ2Xv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PmuEnsGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789602852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzPhM0cpITyXs1Muz62V+gilV41wWL46LsD2m7YxMD4=;
	b=SiSRZ2XvwCeZ65RNUkzsy/cbnPU+WssScjF2VcU6My3yZq/haviRme/ps6URfnm0TYxc8z
	ie4zbD+FZw6D+mLnK8Hw7rPnze3i6B7iaFJlW/iFs5kWFd8aV6hfzQnHp00xOnr6ERgO6Y
	mBkb9Q1TCx33zFh/xlokJxUkjL+rLEM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-k0ZKU8tPM5iEFN7EaU7eyA-1; Wed, 16 Sep 2026 19:54:11 -0400
X-MC-Unique: k0ZKU8tPM5iEFN7EaU7eyA-1
X-Mimecast-MFC-AGG-ID: k0ZKU8tPM5iEFN7EaU7eyA_1789602851
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5328dae1305so7099871cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602851; cv=none;
        d=google.com; s=arc-20260327;
        b=gF34juhAsBvtKbeSKI74zJf5YY5BhnCBqOloLx2Ps4yBhX3YBKfWaf1hbvmVGjKuYv
         jxJt0kjQYUxbbSra/SMJifWEu9kScxNtOXhFEL7ME72Ni5qDzVR65iQCXRyd0AZ9nF07
         bUatIUvmzxPtAeLKvLdr+jvfJLzzERmcQYcV/99AdTVkfcd8rRKqAmV+3VIhVjf2Qg3h
         yL+mL8cceyqgyoI2F9LAzDIVxI+2UzSWsz6wxMfGMiy0fqiMeP4Sy5n3Y6qf8QTcA0rB
         po+Mbl1IX7NvKIpcqqhCOQHNN1iu4b/MBQuS1lQp4p5JYXrDMEhHR3BGUgDjZC1MAJSP
         1NCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hzPhM0cpITyXs1Muz62V+gilV41wWL46LsD2m7YxMD4=;
        fh=+edes7OCZON1ez/wAgQWf92qMDQ3Ia7kw1etRJIAXnE=;
        b=KYl/YbPH3207zknws/rTvxCAHcL9hc8WolJtLim0SATJmIeZtwXwArWk2jHXUgrXez
         B6LO1LMhTJiSIBTUSagRCO265E73LdK+/MNUeqWoZKWB7K4ebmpIHbVmDdhmJoKfk8YZ
         empikw5ywJCwCJsfRs68oF4/wF9BNXjzgvoMkBf/xeljPG7pky1mcWuswTTjm8TOefGH
         gsCbUcZ88IrE8NYkI/UzrpKS+iTg3B7mZNXcWLs/ZH+YZzmI0zDsdUywvZndYZss6D+B
         zlagsyygRMEc/71WvzTMQiZlsqjsM8JODaX0P1r8xmQJfi3n7pGHYm2s9ql9u8hPJ44h
         zQUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789602851; x=1790207651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hzPhM0cpITyXs1Muz62V+gilV41wWL46LsD2m7YxMD4=;
        b=PmuEnsGR3212kV/I6MWNQMf4yTblSHuiN925+U1MMOmpgEDeO/lSDLy4TmFL68KsPv
         R4tnWzAhEWshEfWYLN7XqWTjCSR6QdjoHpxj1M4L+7c8wPdTegT7MFBfVK4elGvvt1Yn
         HccdET3rP56iIkW5YrAyY5dZA9GooULe+Gl+1pSVlPAhWgKB5v5KwLTIlIRBcoIIPRXa
         mVh+xQA86TsHcrn77xILgPo/4CJkA8dPUhQ7anEq8VEPssnxp7IhrN9kbuG/U/iBF53N
         KjkIbmSYSiv/XeOAx9XGr29RWQOc13cleaXbWGxFn27nN1XsZLrhvBRBU9RGAwyQbJE3
         SQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602851; x=1790207651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzPhM0cpITyXs1Muz62V+gilV41wWL46LsD2m7YxMD4=;
        b=qJVQYyZ6RxZxN1T+Hs4SUB0ct1VTC7BT0ofMdzT7Rlbe50SdqbJhBz7rYfFSfT/SXS
         pj2bBVm88lV+jDqWgVjvfkPbkcXceCIXLT3C+9aft51HIEg/7WQdpHcIkMcqawqdp/oU
         Qh5YyURV5M7BY31LwU62zzEQlYgcFHuIdVd9ey+MGVsXzut5NwCW2349UFd4lrSYdes9
         SnEHSqNaMWfG/+3DsO2RF75+iuAYjvp1Av689hBFZoyNeZukoxEHk3QypcgoJJWK0JL3
         Z3Bd+ej5b9XxG2mHEMwlhohRpeRHrUoOIbX+rE3ABRHC2KM26WR7T1AWfdcHB10HdL+z
         K+1A==
X-Forwarded-Encrypted: i=1; AKwUvByp9jMMmCx8DZErM9UoO4KTuy4wEAzBUhhCqF+ToP2hIOZ8vDvuRuOgbZiRlmZH8cZ1eitL5/vWNuwKjNg=@vger.kernel.org
X-Gm-Message-State: AFuF++mGLFo4xUsPfOLqNowMeo4O89Xu9AccffguBT5exI5V++H6fB4w
	ErasSsjX4oFqP8c2erp9sq4OlwDWDdUuSih9yPPbJ7OxA84080pGh0ei22LdbhzHEW3MKn9xxew
	lMPsEVqCQ70eU9Npkq8nTv2UB5HlZUAB4Zd6OB4SIE65e2qVpbtPnoPnWhGTpN7OT5OTgZyhLFz
	n7PUfaZPQkjZnKEr98cBe6UqlYv02BFyJQpjw+WKin
X-Gm-Gg: AYBFou1ee0b0nE1kXufHTPDLEqssX/lGLYdffj97XFaG4FQDK+SazCflHT4duYhmT6z
	a2PhoQfTmr8gd+Xe1Kfz1G0N9YTkupj5oG+WYx40gu+v4dJFIR9GI3BBKmgY7RndLTvAhnX8V2T
	gu5ZfWbkFrpCpehdICB5alO3sXjGXUfV8cn/+B5D7AocclPbFybliOIc3gC7BS6gYVKvkvJj+nV
	OaoYXMV8i6WES/f
X-Received: by 2002:a05:622a:5c07:b0:531:4a1:fecf with SMTP id d75a77b69052e-5327f205baemr75469171cf.5.1789602850719;
        Wed, 16 Sep 2026 16:54:10 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:531:4a1:fecf with SMTP id
 d75a77b69052e-5327f205baemr75468981cf.5.1789602850383; Wed, 16 Sep 2026
 16:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916223358.507351-1-lyude@redhat.com>
In-Reply-To: <20260916223358.507351-1-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Thu, 17 Sep 2026 09:53:58 +1000
X-Gm-Features: AcwNN1Vpx5SyQyvxSmIp5NIx5rhO2o5NzGsoeUHN5bDWmRFbcrc4SeABQVS8KHw
Message-ID: <CAMwc25oJvW8gRjZ5J3+w2xSNyfjTT1X-MAiYPSPmq_-SB+=goQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] drm/nouveau/gsp/r570: Follow OpenRM's runtime PM
 process more closely
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Timur Tabi <ttabi@nvidia.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	Mel Henning <mhenning@darkrefraction.com>, Hongling Zeng <zenghongling@kylinos.cn>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 8:34=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> While we have runtime PM working a lot more reliably then in the past
> with R570, we're still doing things a lot differently then OpenRM. For
> instance, we don't save/restore comptag backing stores, and we don't ask
> GSP whether it's OK to enter GcOff.
>
> This series fixes this, and gets our runtime PM process to look a lot
> closer to OpenRM's by implementing some missing pieces and workarounds.
>
> Tested on my daily-driver desktop with an AD102, a ThinkPad P17 Gen1
> with a GA103GLM, a Dell Precision 7780 with an AD103, and my test
> machine with a GB206.

I've replied with a couple of minor fixes but with those applied.

Reviewed-by: Dave Airlie <airlied@redhat.com>

The rules for devices are 0080 ctrls on device.object and 2080 ctrls
on device.subdevice.

Dave.

>
> Patch series based on drm-misc/drm-misc-next. Branch with patches here:
>
>         https://gitlab.freedesktop.org/lyudess/linux/-/commits/nouveau/rp=
m-openrm-sync
>
> Previous version:
>
>         https://patchwork.freedesktop.org/series/173901/
>
> Lyude Paul (5):
>   drm/nouveau/gsp/r535: Add support for INTERNAL_GCX_ENTRY_PREREQUISITE
>   drm/nouveau/gsp/r535: Add support for MEMSYS_GET_STATIC_CONFIG
>   drm/nouveau/gsp/r570: Add comp mode workaround from issue #3172217
>   drm/nouveau/gsp/r570: Start saving comptag backing stores
>   drm/nouveau/gsp/r570: Enable Gcoff in fbsr again
>
>  drivers/gpu/drm/nouveau/include/nvif/cl0080.h | 10 +++
>  drivers/gpu/drm/nouveau/include/nvif/device.h |  1 +
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  6 ++
>  drivers/gpu/drm/nouveau/nouveau_drm.c         | 13 ++++
>  drivers/gpu/drm/nouveau/nvif/device.c         | 13 ++++
>  .../gpu/drm/nouveau/nvkm/engine/device/user.c | 35 +++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    | 10 +++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
>  .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 17 ++++
>  .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 52 +++++++++++++
>  .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 77 ++++++++++++++++++-
>  .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c | 36 +++++++++
>  .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       | 29 +++++++
>  .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        |  7 ++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  3 +
>  15 files changed, 308 insertions(+), 2 deletions(-)
>
>
> base-commit: 5589ef09f93b85b6f506e279a502d4cf1654f232
> --
> 2.55.0
>

