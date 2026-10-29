Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793311739;
	b=lr7WGsIgb1HG9+C38JCqeD6SAIPJ0NOPIfrvId9DVQnAKlV/kZ7UHMz9jh4NLfJQjFSD
	 bFn2XTBBAmVkvQ88U4pGc01vGLECYkrTXljMRMwI8YWHE9lAHD3Ui2JoHLaCQ86cgkaP8
	 cZOCWnTjsNSNxLDqKPhn5ikEwIBRvglMGVMIkjGDMaCq8EmmjIUcpLL2UKMVBF4lOQkHl
	 9qaAFxDeEJDgw0o1UBX4nq4L7PHSampqoGdBIB+6CtOuTTN1p0Ea4pDGfkj1xrqW2U7os
	 4z8Pz831ol5z4B+xfL7pTy1p7HuwtIPL2HP0Kdxc7c9/QSDtA/NjgaZIfaAh6+WGAUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BNBRkMvcPM5q+NH92pjwUamOJbPLuAm/rYF5XAa5e1c=;
	b=SLp7W/P8uiRbmreHnHxpCctBzj4HmEqwMFSWbvHyxr3VaVs8QdFGYBVIkBaJUiD1FpeL
	 3XNJtqHMkBWSVu0Sa946KqAuM3vLrmcjbj+26whmmSlOFIR+Hhe84GHIrOL3D8lh6pvTE
	 BPspZwcWS1O9kWqXMBomidbrNBncDQx1uewhYv0Y/ihi0tyG7Sx4CKrawrLHAX8ccs8Z0
	 U8kOgs5tcXW8ImRzodSwEzN/1XZJnLUEPFI9UTvDYV59fc1CWWt9oz3yWU7WamAHIf8pO
	 XivYYWzXhIyumAZo+4HwoErTmXa7bReCck6xTh18aZxz+ApwQYj45qvRvnzuncFzGhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IO8tJ5lx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6606D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6606D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IO8tJ5lx
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bb5afa736so24088eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793311738; cv=none;
        d=google.com; s=arc-20260327;
        b=pw6zrnjpZLljubqVQBzCFW8C+gCGkv+tkwO4PqysI1GyuK9zeFXnxsXmpCAAdlFstI
         Bk/WJCuc1SSqrdM9vGkNXN+mmbT05r0O4O8OQnxwegq9/5c6TIHC71c5WIhq+8SrmLPS
         OrhyGmCOsi+GHuqJFm24k1NBv/6ywW2BDN1MI66T6bwLko0HxBfcz9nNV1zWW+dKQhGA
         J2RyrH4f0eTJj+Ad4ixkfAajNN87nghOxuXR9sqyuLpcva08W1QO0Sz5xZ+gD8P7cwVE
         G+KsqPkcvFrZYwGpmpFfibUOjCtOYgqbpCpYBYv+uDegfrWVbBTO9pjPgVJArrmcRhio
         RpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BNBRkMvcPM5q+NH92pjwUamOJbPLuAm/rYF5XAa5e1c=;
        fh=8y+05wL9cHj0MtiK3Bb9DnJ22UAh6yFAcwvKfcidzrc=;
        b=AEDGDhhzlCG7rfypMvVFqYDqDJLqhjrl9jPV6qgF4Tuyi0rRhRAzeibU4eR56IyNrJ
         j9JtskdWlIdplmpBLpHH5J/PNQ787J5X0hh3XICbcQvUl+np+Yp0mf9q4dr8blyRvavY
         2vZ4EgKLYTDI06NcPtxKl7u4lH4JbheMvHPglApQ7cvceYKl/N6T6v2q3bkE6U/PaXE9
         XF3+s1fmaTtK5HgaUrJ3/dhXiwgFg5LMQDylqUsre4Fj3l/bV/g+Tv0nZysKVxYCw7AI
         dwjqKmKFrE3O3z8QkN9z+19PBFhjhFAU5XSyGRcUEW3SEUw5OcqzWZEBWIYmHpRplR+s
         TfxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311738; x=1793916538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BNBRkMvcPM5q+NH92pjwUamOJbPLuAm/rYF5XAa5e1c=;
        b=IO8tJ5lxB70rtIbO8uqzbf0HgTt2rHzzsGrh4yuPST3h8+Y930eFpXhmYktJ0HfdEF
         DDFLOav01Xh/FyxELAyoXoIuPH++7401hIvdbB9OilUiSJIVICslrtO3Mi54zarHgo1a
         3LAkB/bo9X9s6xjbh7EcngQjYsuxDgEieoYI4n5OKSW5AGSs3S83cft8qXnE/zdTqhi6
         OuASCwvb4nKFa3dV4QBDVi9Qa/RQ2EtkKYgPg8dkJUOC/K+A3dfrX8XK8ZUWPBxjohPz
         zYWKW/ckGaAthBAq0nYGI5+1Xj+uzjPvTJpexo2jgDMeI8RfMI+pBHEBSPSvPADpVIng
         O1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311738; x=1793916538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNBRkMvcPM5q+NH92pjwUamOJbPLuAm/rYF5XAa5e1c=;
        b=eMfnZMmg6fo62hbB8VEK4pwww6heZUDycnPDTtdEVkjXtHH3U0dA0lfk8C5a0SCBFk
         dOF9f8Wan5JfMP9gZ2epziPjrjryBdw368kq7zs2Lq9GJGF54+MrkOumWif+OQ/1tGQ9
         TEFagY85usW6//Hg2EDVDpwuSVg93Oz7pch39mOoFiq8kwv5dJdROeQnOy5SFrTSY+7P
         aC/T/NDVnEPn/k2B8GphQ+7Ru8ookHnPqq88rBmofDRujGyS80Mp8zQfGn8IvqtbheNY
         kT/PD+zsB1MkVFXHy5HZ/Tm8NLH5AB0AI/pFd0bn6fLZdCzPpbRwiPkozfuilqO+i76l
         ywxg==
X-Forwarded-Encrypted: i=1; AKwUvBx+j3XCRJSKPhy+8qkxjuOK8jJXl4gMxVBP73DOVAHfJZofssk+kJOzGz15MCHeai9g5xVzEz3q6tD5kAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYILgFJrjaPS7G5xSCDYcdWlKC5s6AES7P5z2knvL4nIRN4FJkr3
	oYAqVywaIaCT8kWKVcfXLKzU1JfqseTDKRfLP5EyfH2m+OafUhsvETZt/dDeqDKBdsRhHm8M/bx
	n3CJB/F/6znNV9lv/6jW3Ip9SX8st2iU=
X-Gm-Gg: AYBFou0Pu4GOG4N3Avp/5UKjaURRx58hVeITCRknQIJcjGG8mOjxxnjmktxn3M36ncF
	Di16n5qwn7uYkRcjcabOeYVQCTeW7Z0W2fXsK6fJmLqrLgQIqOEZs+tcgs9XKJcaoaSfIKzvJiF
	cwqcoClhfg827eS2Sbj8/X2BUltYUpfLzbvjGDog80ST50Q+Hv5xRVzz4+IYXzsCQL9UsA8Z7Hf
	0Kmnt73P9taQ6/OhFISqwEGMBdKYkupaUTBJNhSG3XhGGCHRfphrFXdD2/nYl88IjAjW4vsD0rI
	dN77ZbCiX8eXjN55msvJLnsOKoPxwEi1Kij4+5GxdE4FMH8uRO7rW9ilEoHqv9eP1u61KOwZ81o
	YojTSomOpqmrzOPOl7RPMjdPhKmvK9NpZ5iklsISg9MPVjVrPtL/mopQf8OcODHlb6J4XREpno3
	4cHVJiifdvc/C3bV+epmZTJeM=
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id
 a92af1059eb24-1ac5b7dcb2bmr780931c88.2.1793311738368; Thu, 29 Oct 2026
 15:08:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027133727.748652-2-phasta@kernel.org> <54e6cd9f-57ca-402f-93b6-27fe2b15b29c@amd.com>
In-Reply-To: <54e6cd9f-57ca-402f-93b6-27fe2b15b29c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2026 18:08:46 -0400
X-Gm-Features: AclHuK-38z0ojG634j8HTvYSqjvHDIGJv5-1HW3Xm4xmKYyn6vnp08A2upfv47I
Message-ID: <CADnq5_M6s1TFgHgfiPeLS0bQ0iq+iJWzPKPbacyPvBGibUs_HA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: amdgpu_fence: remove ops->release()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jesse Zhang <jesse.zhang@amd.com>, 
	=?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
	Kexin Sun <kexinsun@smail.nju.edu.cn>, 
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  thanks!

On Tue, Oct 27, 2026 at 4:16=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 10/27/26 14:37, Philipp Stanner wrote:
> > amdgpu's fence implements the deprecated fence_ops->release() callback
> > which prevents the driver from ever unloading robustly.
> >
> > amdgpu's implementation merely uses a call_rcu() that performs a kfree(=
)
> > on the fence - this functionality is already centrally implemented by
> > the dma_fence backend.
> >
> > The dma_fence backend invokes a kfree_rcu() on the dma_fence, which is
> > fine since this is always the first member of a struct amdgpu_fence.
> > Thus, amdgpu's implementation is redundant.
> >
> > Remove fence_ops->release().
> >
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>
> I have exactly the same patch in my pipeline as well.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> > Just saw that this should be unnecessary? Don't have a setup for amdgpu
> > testing right now, so please take a close look, just compile-tested.
> >
> > P.
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 29 -----------------------
> >  1 file changed, 29 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_fence.c
> > index 3043ad041bb4..3f8b2571d74a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > @@ -892,39 +892,10 @@ static bool amdgpu_fence_enable_signaling(struct =
dma_fence *f)
> >       return true;
> >  }
> >
> > -/**
> > - * amdgpu_fence_free - free up the fence memory
> > - *
> > - * @rcu: RCU callback head
> > - *
> > - * Free up the fence memory after the RCU grace period.
> > - */
> > -static void amdgpu_fence_free(struct rcu_head *rcu)
> > -{
> > -     struct dma_fence *f =3D container_of(rcu, struct dma_fence, rcu);
> > -
> > -     /* free fence_slab if it's separated fence*/
> > -     kfree(to_amdgpu_fence(f));
> > -}
> > -
> > -/**
> > - * amdgpu_fence_release - callback that fence can be freed
> > - *
> > - * @f: fence
> > - *
> > - * This function is called when the reference count becomes zero.
> > - * It just RCU schedules freeing up the fence.
> > - */
> > -static void amdgpu_fence_release(struct dma_fence *f)
> > -{
> > -     call_rcu(&f->rcu, amdgpu_fence_free);
> > -}
> > -
> >  static const struct dma_fence_ops amdgpu_fence_ops =3D {
> >       .get_driver_name =3D amdgpu_fence_get_driver_name,
> >       .get_timeline_name =3D amdgpu_fence_get_timeline_name,
> >       .enable_signaling =3D amdgpu_fence_enable_signaling,
> > -     .release =3D amdgpu_fence_release,
> >  };
> >
> >  /*
> >
> > base-commit: 731ba09867520c047c7de53f92e384808e0b638e
>
