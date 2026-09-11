Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3137349EC77
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142936; cv=pass; b=XBHu/1IrUxli59ki9mt6OGafN78f5q31zv0dM1Rz+L6w46mlblfTr9uq/9/nrGwdcIu3HqvOiioBCmeZQWGt/cV03SKP1Xc/t6vHAMwX76eYk9q3I2Ch1zkIG05XjoOCoHEelDMsOZkfDhEJe/ifFVRzPxr77dWrGAJnKqy8W9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142936; c=relaxed/simple;
	bh=Dr0ZPgnRW2wb/vXzR1YjQxeIUs27SLUiW9W3kIXeWRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ry+Oez74EOO07As8HUPOQIWdPoQo0JnPWJvDIKK/S5bscQ1fIdLkrFs8kkovUJVNZHYbh+kVdvsz/ETAbq4O4KxwS3bjLB0ByIY8VYhAePxC/NmwUhm7V9c/w4e+jkPPSK8joHWE+SwoxJ+R8Jqt5DAXyxnX3rYKtNIpXjtxWX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCZ9sfy3; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCZ9sfy3"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b4afc8465eso1605170e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789142930; cv=none;
        d=google.com; s=arc-20260327;
        b=SxmhLdRwnAM3M4WyZzCNb7OxWq4WyulMLqMto45kgZ12Y5iCzppwOnmQDI6IBSoMaj
         RVfthwapdzIVwIzZpvUQQEILdjeNkaX1JDbNFP+X3ha5tTWstvqkWmcCt27SA8ZWiI4j
         OynXyXQVLLj8S1rVC6noJHao+3vL3S1O/5W5VxYJF7nFP/6MVsU0dIZPPDKnORfhfHXr
         tlsJlwd2fLoVY/n39zupaWFeeiLeHLRKm2BzOWwcwsMeWm82lJ1nsvniZUCCH52u+EJG
         e5HvcpiED7296hBLfxVJUlKLkAqN3hU1ddlgpw+WTjjDXLaToM6woUKCUauS7tgkpHHd
         5rSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=snwxagCQ4mrcEcTHwmB0+aYoYDwFIfdB7PhzX2AVWJg=;
        fh=6fFW6PIUgQg9qVhMsYG78PflG3gB/yoaF38O+PNOAXY=;
        b=LEXsTfVN5jL6lJVoOsIMPjLKIWfdGaySUHM53Yb4bzJNctNqkNdOq6ikFvPaN7AiPF
         KHoBi4HISsOUlA03xalRA3a08ZzGzoTqnLlLs37BIEdnz2vIvF/gzcuu3pWBSqqDak53
         Qqvql+VOjWtVWrDbr8SjcBmOJEBaRw6muoIKvOfXmp8Fv7ZhfVdsd11eEHQ6kXydEvBt
         QZkYcgIkf9AHihtGcECGPtFK3UupNpafTltFoWQKgkLfOWXXNkIRcEtU7+5SZocYD0IK
         EvMeU4ZtMXfIWN8Bmeasq2tf/v/0C3LCn4VI7jGIUvXeISG359P+CRPdF1MzUZLk9cB2
         j49w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789142930; x=1789747730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=snwxagCQ4mrcEcTHwmB0+aYoYDwFIfdB7PhzX2AVWJg=;
        b=tCZ9sfy3caWxE6hLHcE9hlyFZyIyVVsPtNbpP3IsIU7bXJi0s7Ifkd+GmPBdf2sDHt
         p72tnOY1M82gPjYn3v9U+Jqj+WPyqFeVpCQHrN815PKnsYBN9X/19+GAXCNpp0t3j9fy
         dPzMtUXJ3JSC6oWqhywoeBIh6nza5xMbJYJ24BwSU9BSOdCkUh6XvIPXm1C95SYAxNh0
         Lbn5V0Mk2r9sj2TIj+M59sJtlgKa74K0rS+ReFC8Ao/GVkD4sWfvMxChlqjcmm8Q/MSD
         jMn8AQTTTVc4JDkoTcSvZ42RxqczJzxOu0JeIsqpEtJeKx2gEar6VVLywl1fYXrYwxaF
         1z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142930; x=1789747730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snwxagCQ4mrcEcTHwmB0+aYoYDwFIfdB7PhzX2AVWJg=;
        b=T7yqUZEdZrkFwXypjaQhT/TmJLMwkW+A/RQeHn0qAr4JC0E93/386u2HKXUzIORgSX
         gNZeFFNzWR71bIyf1FiFdV0rWz7UBfnx8GVLPO1H1arzeft8qCpHnzhsqpcci6YXqQNh
         U1gdaD7icy2e0YEAZTa6aaJDeZe05GuQLAnpyqpwnKuanVn6fB5gR43OdDw1wYLBfSio
         G+AQq7jQGf5KLmoEo38HTLIboT4ZF7LSFqX04OQTujAlZKkl023Y5YrAwfRMuV8xX3tz
         Sg1L6RxkepJX2TqARAMiLNFtm8MoemHrv6sW1oaQMZUBtVhXtdnURzqhJJug1/X33Nqg
         4RMA==
X-Forwarded-Encrypted: i=1; AKwUvBxIWgKI4ro3EgbaqRLraYgszsKrSWyvwcpklshgjrurM+dQsfdqHUwHkQW123Ux0x5nFIumX9sDKOp+Hqg=@vger.kernel.org
X-Gm-Message-State: AFuF++nd9OLUzKhl6czB5W0FeLrhy54T0SToI9mjPzV+cWVfayFQoItI
	uUtqi+Tc1KyO+fR8kIKt2fQ7ZnPG3w7pG1PKD0xa/2iMuXY2iJgkdbagFzXn1UbaMFWDwRVVJGv
	zQwXH928gFBfGztyfRR1MHj1ovOz6KG4l4edUCLs=
X-Gm-Gg: AYBFou10kmDeragSHnG4FXPg+7ZnzYaingETSSiP3d+c+cGgiio6hJ/Ia+qqpDXcmFb
	lg3QdCfFsFYPxKEKQ9QNrgz2BHKGUMXmAVJQ5w7afqY4ZO4j+R6QQ7N0YwoGiF4oEhqCXiYsLyH
	F4EKepB0AbdzENer+3Ge7Ol3gaerT7hvj35Q60FcHzY1f6Jqno1Xg5r+B2ZB4gSFv+NVr8fB9lX
	k4Sg7c0B6JfwfeqCaUZJ9PUcAoBwh95hY5o4kRBnNRD6E81EmJdgneSiIusktdhbVe3JCLWIa/p
	l4Af1fdxdTAwEh/fKdev6rIbmoj0eyrEno7fDq+9ugv3eQbcpJ3bd9JIZzhq/5RVgBhsKjR1UB+
	Whqtbzl04
X-Received: by 2002:a05:6512:4008:b0:5b7:6393:ebf3 with SMTP id
 2adb3069b0e04-5b8a03304e8mr1270246e87.33.1789142929866; Fri, 11 Sep 2026
 09:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909205028.13799-1-bub4z0r@gmail.com> <067e5ddc2268ae4678745a900108e93d0c6eeb74.camel@linux.intel.com>
 <853fb020-592b-4f85-a9b5-a522aca6a29e@amd.com>
In-Reply-To: <853fb020-592b-4f85-a9b5-a522aca6a29e@amd.com>
From: Samuel Ainsworth <skainsworth@gmail.com>
Date: Fri, 11 Sep 2026 12:08:13 -0400
X-Gm-Features: AcwNN1W1VB8g78HD46FVELsdSdTjEr91Xqvo_dSAH54nzFz00UIvmNhPOfVbY1o
Message-ID: <CAHYiNPaHFYSKt6pZWpCvxui=UA8DfH=3iMqYXnziZ43_Ua-nTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix swapped-out resources never leaving their
 bulk_move range
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Vadim Nikitushkin <bub4z0r@gmail.com>, ray.huang@amd.com, matthew.auld@intel.com, 
	matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	alexander.deucher@amd.com, bernardomagri21@gmail.com, 
	Natalie Vock <natalie.vock@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I left a comment on the commit in GitLab
(https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3db7d7d583419f7b1f=
2e141e36418802dbb25cf8#note_3658149)
but it occurred to me that it may be closer to convention to reply
here. In short, AFAIU the commit description describes fixing this by
checking `ttm_tt_swapout()` inside `ttm_bo_swapout_cb()` but the
actual diff is modifying `ttm_resource_try_charge()` checking inside
`ttm_bo_alloc_at_place()`.

Perhaps I'm missing something?

Sam

On Thu, Sep 10, 2026 at 3:46=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/10/26 09:14, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2026-09-09 at 23:50 +0300, Vadim Nikitushkin wrote:
> >> ttm_tt_swapout() returns the number of pages swapped out on success
> >> and
> >> a negative error code on failure; for a populated ttm it never
> >> returns
> >> zero. Commit b2ed01e7ad3d ("drm/ttm: Fix ttm_bo_swapout() infinite
> >> LRU
> >> walk on swapout failure") moved the bulk_move bookkeeping in
> >> ttm_bo_swapout_cb() under "if (!ret)", so the
> >> ttm_resource_del_bulk_move_unevictable() /
> >> ttm_resource_move_to_lru_tail()
> >> pair is now skipped on every successful swapout. The equivalent
> >> change
> >> for the shrinker in commit 1d59f36e95f7 ("drm/ttm: Fix
> >> ttm_bo_shrink()
> >> infinite LRU walk on backup failure") tests "lret > 0", which is what
> >> was intended here as well.
> >>
> >> Before b2ed01e7ad3d the resource was taken off the bulk_move before
> >> the
> >> swapout; since then a swapped-out resource stays inside its BO's
> >> bulk_move range (and on the manager LRU) although it is unevictable.
> >> When it is later freed or the BO leaves the bulk_move
> >> (ttm_resource_free(), ttm_bo_set_bulk_move() via amdgpu_vm_bo_del()),
> >> ttm_resource_del_bulk_move() skips it because of its
> >> !ttm_resource_unevictable() guard, so a range endpoint in pos->first
> >> /
> >> pos->last is left pointing at freed memory. The next
> >> ttm_lru_bulk_move_tail() or ttm_resource_add_bulk_move() on that
> >> cursor
> >> is a use-after-free, seen as the resv WARN in
> >> ttm_lru_bulk_move_add(),
> >> "list_del corruption" in ttm_resource_move_to_lru_tail() or a NULL
> >> dereference in ttm_resource_manager_next() -- minutes to hours after
> >> a
> >> hibernation, or at process exit / reboot following one. Samuel
> >> Ainsworth's analysis of drm/amd issue 5387 (see Link) identified the
> >> dangling cursor; the missing removal at swapout time is the reason it
> >> dangles.
> >>
> >> Testing the condition for success restores the removal. On an AMD
> >> Phoenix APU (ASUS UM3406GA, gfx1103) running suspend-then-hibernate
> >> on
> >> a 7.0.y stable kernel carrying the backport (Ubuntu 7.0.0-31) the bug
> >> crashed 5 of 18 hibernation cycles; a function profile of one
> >> hibernation showed 336 ttm_tt_swapout() calls and zero
> >> ttm_resource_del_bulk_move_unevictable() calls. With this change the
> >> removal happens for every swapped-out resource and 12 further cycles
> >> were clean.
> >>
> >> Fixes: b2ed01e7ad3d ("drm/ttm: Fix ttm_bo_swapout() infinite LRU walk
> >> on swapout failure")
> >> Cc: stable@vger.kernel.org # v7.1+
> >> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5387
> >> Link:
> >> https://lore.kernel.org/dri-devel/CAHYiNPa6aVacJoLOje-qZ1GyYx-9p0tN4Nu=
P8D_eSL+UJeevXw@mail.gmail.com/
> >> Signed-off-by: Vadim Nikitushkin <bub4z0r@gmail.com>
> >
> > Nice catch.
>
> Agreed, that is a really good one. We had tons of people staring at the c=
ode without seeing that.
>
> >
> > This also explains why https://patchwork.freedesktop.org/series/170311/
> > appeared to fix the issue. But that series actually kept the resource
> > on the bulk sublist until someone bumped the LRU or removed it.
> >
> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> If nobody comes up with some last second objections I'm going to push tha=
t to drm-misc-fixes ASAP.
>
> Thanks,
> Christian.
>
> >
> >> ---
> >>  drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> >> b/drivers/gpu/drm/ttm/ttm_bo.c
> >> index ef56c18..9b85b5f 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> >> @@ -1434,7 +1434,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk,
> >> struct ttm_buffer_object *bo)
> >>
> >>      if (ttm_tt_is_populated(tt)) {
> >>              ret =3D ttm_tt_swapout(bdev, tt, swapout_walk-
> >>> gfp_flags);
> >> -            if (!ret) {
> >> +            if (ret > 0) {
> >>                      spin_lock(&bdev->lru_lock);
> >>                      ttm_resource_del_bulk_move_unevictable(bo-
> >>> resource, bo);
> >>                      ttm_resource_move_to_lru_tail(bo->resource);
>
