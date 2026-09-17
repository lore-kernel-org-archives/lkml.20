Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F42277818
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789624481; cv=pass; b=h7nWNOdOAhgHnZ/WnihPxiidgqh9OM32UXN3GsdJY6b23IMqW6pl/pcdez6XTlykzb55l8myIWYeLz7kOI/yUBvSbIrQst4bw54iUQazg3/fx/tFrPlD6WawlPY4iyu1JnXdnLJ0e1yZCvH6pbVkjpkpk1nUJdvERqXr6PLIG/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789624481; c=relaxed/simple;
	bh=aZ9SeR3phIMgV3BYgxn90OwcFOc2AJJCVlqwZ4QWULk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNCQhol3htdkUdlrHm3BqzRK/z7BPN097Em0wu9UN88yEUlEwG+RglFAgqVzkQCRqnhcmsUw/bl6b1SpiFns5GsdfzdNoH6PFJBk/3s+hWLCLOs7Xx9EtSZteXs3s03m3GO+iuzDdGnt+7XzH/+upU7MGv8Yxl6VYiVHFbG2waE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExkrfvVL; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExkrfvVL"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af2eeso3894451fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789624478; cv=none;
        d=google.com; s=arc-20260327;
        b=MtykqRtFedhhW94oJ8kwFqWK+Czm7CDTw4iqyBV+VVcy0HkX3iCkL/VTi3wcsxRhMq
         i13B+tWGGKlMiIMUAi0vZ73jxylQHEtNgUNHBKYgYDAeI9BsEVLbatO7o054DT4cX6HW
         /iT5UV7ECHX6Bjz/X5UU48d6rH0ASBM7c9O8pJSwaLXKcmHWpPzTVMFUdZawJrujUtdn
         +gA32kVey+L98cJcQdZ0ayHya3660RTMybnnWknRZERB3JQ/DTKseG9K5s86F7YeEer0
         TqSdUaU3WsPC0SSZY87MQOP6Lx6Y50ioaztNXnZ+KOqTEi4sMUkLPNi/dZiM3iwh4kil
         q5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Loxv+QhHSvLuHlVpy8FfAmdK0Orcs+Qj7V2Brl/51zo=;
        fh=J6T5uLQIx0MjkepPY5DTnM9+IO5gNPKj7d/GF3ZsG0o=;
        b=oziIDoe7tmx9ho2FhvbmLUcYeEG37VHxJlKkmNnru91hotBWWj/2TpCs0jVn2nlqR1
         OsEijCyteixgeLl0Fa7IQLqRMehAWII0dwPglaPLG3ojLsa65RbdSbTW/lw7+Thpf82g
         VB7ddw1KB+tC0e8miJKSaum2EtyJLcASU7SpJL0tlZbcEI4L+UdVSoHa+mYUc/Xo6k7M
         XxeEawsfSTO7I/6WevRSE3y/Dtcd1hr88HOvbVVG6yPMi3BM02Us9CFfw40g6f6kq0hR
         fE8UbQQjSRHe2v4d6oxJRXrCqwIwBLZGiG3p67r3+AB2Eu4T9lzZuoe8EvgeV0LK31SU
         mOKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789624478; x=1790229278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Loxv+QhHSvLuHlVpy8FfAmdK0Orcs+Qj7V2Brl/51zo=;
        b=ExkrfvVLESVYhTjGFLig3lY2GMnIZlD571sRoFKYfHAIy6Q+hQi0a6qO8mjjACFS8Y
         4JuD8qtpd+5YrxuZKkBe6T+CW0wfwm+x61PCvMfdEBZ7QTY6oaIfN2ExYZkqFMV6gP1x
         Squhkouh7NZy5qolYnpdIUHx91yQqxvoGDUXNd6UCwJuA0VjY88JDepxn6l2SqO8grzN
         vUbOB0SaBqfEEitOBp4z88fjdxm9d2yclhAJYvhIm2rwE0Z1u/Vw2lgwM3a1h+ZszpaF
         BjuWm6tc37PdLzXIBgguuwfVgQPlaSubiKProbRQveNOZ8TwvP1sBhxSAg3LUZkSpcrb
         H1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789624478; x=1790229278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Loxv+QhHSvLuHlVpy8FfAmdK0Orcs+Qj7V2Brl/51zo=;
        b=exc0tdTPDrfFgNdrAC3yAlwGwzhqLULHKpJ+4x2nuu6CWFrafXmo/ep8GI08jWz0d+
         PPYypXU8INfgaydaQD2as5gAFLtqWOPYA0pOHJmta7Jhb24U5CY+x0KAZ3Mq7u4VdxxD
         qrdTFfovsCY5DGp4UNd8yDiBiwsDslqto5qtV7nhztMiY/duFBJ+Ncqr5gt8bJVye2Df
         JectpUSvxKgTLHGLiabmwrjoZczbC4t+OsccspMEIvSUBA2cZo7BL9Hrh/lAd/YnMLoF
         Q/+Renk2diA/DbEwI8yTs6Ogo9OrDnuPessq9RZBA60hqugbjaCWSP35yHRYfAItYnwt
         /iyA==
X-Forwarded-Encrypted: i=1; AKwUvBwCuLU4uX6nOUDo8AaXEI0BF6GBJQVV+gChubYpriCXumq/PR2axdY87aKgtm8FNZqd1Bew/6aTjvXwrQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++lxhJZfCEKWl3iKySf6LAI41h31H0sbIKZ7lcMAFnZuq1AaD5CC
	6t4uIxa+7l3IaXF8dM5bgUFHtOmqzp2L9eWicsBqiL2w17Wpbk3QBBQSu6OvhvObSkXw85agk3O
	Npk1tGcY6tX6i18C6Euaw3SUhgmHxYbg=
X-Gm-Gg: AYBFou2M4kK8CK4KeYmQDoatp/ybeVZTBZ8p7TYWkZ1yDAiwvgdin9ARfC0BrHFTkhY
	GNow34sBuKDt+YlNOduGHp5iJNf3C3hE+eiLshuE7jMeS6olkd57p0DC37mTxr3oP3d+F2/bk+4
	6fXc3o3AQ/zmGmupcTt2SDFmX44DNE3a51wYc3gdxwJfUfm5fhY8W49yWWc9xAHoIEhVQAL2wr+
	MxmuB8Wc3N4ccI0mRXDzYBufzEXOEjbBwxZWPi50pPaakvmTgQLsPnRH1Q9IwqeYBWlb5TLvcVF
	iEdMxhFF+49tTyhNy+p1oy9vgK/cMS6US6ffAR+/2bnr/kakcrzjJt9ok/r1It22RJY=
X-Received: by 2002:a05:651c:1502:b0:3a3:7681:6d58 with SMTP id
 38308e7fff4ca-3a5dc9f3bcemr9547401fa.16.1789624477503; Wed, 16 Sep 2026
 22:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902112121.2125383-1-r772577952@gmail.com>
In-Reply-To: <20260902112121.2125383-1-r772577952@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Thu, 17 Sep 2026 14:54:20 +0900
X-Gm-Features: AcwNN1WD2-Nx19sNxSzkTzJTuC6ajr8ZESmiVDKvdEkAcL3pR5ww_y0VMIQv66k
Message-ID: <CAKFNMomt1ORpeCrVyNEzJNB6aRv-1v2bdCxqB_d6YZk3XFwX4Q@mail.gmail.com>
Subject: Re: [PATCH v2] nilfs2: force clear dirty state when restoring from
 the shadow map
To: slava@dubeyko.com
Cc: Jiaming Zhang <r772577952@gmail.com>, linux-nilfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:21=E2=80=AFPM Jiaming Zhang wrote:
>
> When garbage collection fails, nilfs2 rolls the DAT metadata file's page
> cache back to a shadow copy taken before GC started.
> nilfs_clear_dirty_pages() drops the dirty state of the folios in the DAT
> cache, then nilfs_copy_back_pages() overwrites them with the saved
> contents and warns if one is still dirty:
>
>         /* overwrite existing folio in the destination cache */
>         WARN_ON(folio_test_dirty(dfolio));
>
> nilfs_clear_dirty_pages() used to clear the dirty state unconditionally,
> which is safe here because the rollback runs with the log writer
> stopped, so nothing else can dirty the cache while it runs.  The same
> helper is also used when writeback finds dirty folios after the
> filesystem has degraded to read-only, where it does run concurrently
> with the log writer, so commit ca76bb226bf4 ("nilfs2: do not force clear
> folio if buffer is referenced") made nilfs_clear_folio_dirty() skip a
> folio if any of its buffer heads is busy.  The rollback caller shares
> that helper, so its clearing step can now return with a folio still
> dirty.
>
> A DAT folio can hold a busy buffer head without anyone modifying the
> folio: nilfs_mdt_read_block() submits read-ahead for the blocks
> following the one it was asked for and waits only for the first, so the
> read-ahead buffers are still locked when it returns.  With a block size
> smaller than the page size, a locked read-ahead buffer can share a folio
> with a block that GC dirtied and keep the whole folio dirty past the
> clearing step.
>
> Add a force flag to nilfs_clear_dirty_pages() and
> nilfs_clear_folio_dirty() that skips the busy buffer check, and set it
> in the two calls from nilfs_mdt_restore_from_shadow_map().  The
> read-only fallback callers keep passing false, so that commit still
> protects them and the WARN_ON() is left alone.
>
> Fixes: ca76bb226bf4 ("nilfs2: do not force clear folio if buffer is refer=
enced")
> Closes: https://lore.kernel.org/lkml/CANypQFZSYrtcshnUzOPiqatyLd-M8_OReOe=
wQoAi_V5yY0dTtg@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Suggested-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
> Assisted-by: Claude Code:claude-opus-5
> Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
> ---
> Changes in v2:
> - Keep the WARN_ON() in nilfs_copy_back_pages() untouched.
> - Add a bool force argument to nilfs_clear_dirty_pages() and
>   nilfs_clear_folio_dirty(), and set it to true in the two calls from
>   nilfs_mdt_restore_from_shadow_map().
>
> v1: https://lore.kernel.org/lkml/20260901134430.1292467-1-r772577952@gmai=
l.com/

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Viacheslav, could you please apply this directly to your tree?

Both the patch contents and the test results were exactly as expected.

Thanks,
Ryusuke Konishi

>
>  fs/nilfs2/inode.c |  2 +-
>  fs/nilfs2/mdt.c   |  6 +++---
>  fs/nilfs2/page.c  | 50 +++++++++++++++++++++++++++--------------------
>  fs/nilfs2/page.h  |  4 ++--
>  4 files changed, 35 insertions(+), 27 deletions(-)
>
> diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
> index 34e6096069ad..64437aed8390 100644
> --- a/fs/nilfs2/inode.c
> +++ b/fs/nilfs2/inode.c
> @@ -163,7 +163,7 @@ static int nilfs_writepages(struct address_space *map=
ping,
>         int err =3D 0;
>
>         if (sb_rdonly(inode->i_sb)) {
> -               nilfs_clear_dirty_pages(mapping);
> +               nilfs_clear_dirty_pages(mapping, false);
>                 return -EROFS;
>         }
>
> diff --git a/fs/nilfs2/mdt.c b/fs/nilfs2/mdt.c
> index 2a435349fd21..b50c88b65183 100644
> --- a/fs/nilfs2/mdt.c
> +++ b/fs/nilfs2/mdt.c
> @@ -405,7 +405,7 @@ static int nilfs_mdt_write_folio(struct folio *folio,
>                  * have dirty folios that try to be flushed in background=
.
>                  * So, here we simply discard this dirty folio.
>                  */
> -               nilfs_clear_folio_dirty(folio);
> +               nilfs_clear_folio_dirty(folio, false);
>                 folio_unlock(folio);
>                 return -EROFS;
>         }
> @@ -648,10 +648,10 @@ void nilfs_mdt_restore_from_shadow_map(struct inode=
 *inode)
>         if (mi->mi_palloc_cache)
>                 nilfs_palloc_clear_cache(inode);
>
> -       nilfs_clear_dirty_pages(inode->i_mapping);
> +       nilfs_clear_dirty_pages(inode->i_mapping, true);
>         nilfs_copy_back_pages(inode->i_mapping, shadow->inode->i_mapping)=
;
>
> -       nilfs_clear_dirty_pages(ii->i_assoc_inode->i_mapping);
> +       nilfs_clear_dirty_pages(ii->i_assoc_inode->i_mapping, true);
>         nilfs_copy_back_pages(ii->i_assoc_inode->i_mapping,
>                               NILFS_I(shadow->inode)->i_assoc_inode->i_ma=
pping);
>
> diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
> index cf4f1c6798f5..857926da9f21 100644
> --- a/fs/nilfs2/page.c
> +++ b/fs/nilfs2/page.c
> @@ -369,8 +369,9 @@ void nilfs_copy_back_pages(struct address_space *dmap=
,
>  /**
>   * nilfs_clear_dirty_pages - discard dirty pages in address space
>   * @mapping: address space with dirty pages for discarding
> + * @force: whether to clear the dirty state regardless of busy buffer he=
ads
>   */
> -void nilfs_clear_dirty_pages(struct address_space *mapping)
> +void nilfs_clear_dirty_pages(struct address_space *mapping, bool force)
>  {
>         struct folio_batch fbatch;
>         unsigned int i;
> @@ -391,7 +392,7 @@ void nilfs_clear_dirty_pages(struct address_space *ma=
pping)
>                          * was acquired.  Skip processing in that case.
>                          */
>                         if (likely(folio->mapping =3D=3D mapping))
> -                               nilfs_clear_folio_dirty(folio);
> +                               nilfs_clear_folio_dirty(folio, force);
>
>                         folio_unlock(folio);
>                 }
> @@ -403,13 +404,16 @@ void nilfs_clear_dirty_pages(struct address_space *=
mapping)
>  /**
>   * nilfs_clear_folio_dirty - discard dirty folio
>   * @folio: dirty folio that will be discarded
> + * @force: whether to clear the states regardless of busy buffer heads
>   *
>   * nilfs_clear_folio_dirty() clears working states including dirty state=
 for
> - * the folio and its buffers.  If the folio has buffers, clear only if i=
t is
> - * confirmed that none of the buffer heads are busy (none have valid
> - * references and none are locked).
> + * the folio and its buffers.  If the folio has buffers and force is fal=
se,
> + * clear only if it is confirmed that none of the buffer heads are busy =
(none
> + * have valid references and none are locked).  If force is true, the st=
ates
> + * are cleared unconditionally, the caller should guarantee that the fol=
io is
> + * not being modified concurrently.
>   */
> -void nilfs_clear_folio_dirty(struct folio *folio)
> +void nilfs_clear_folio_dirty(struct folio *folio, bool force)
>  {
>         struct buffer_head *bh, *head;
>
> @@ -422,24 +426,28 @@ void nilfs_clear_folio_dirty(struct folio *folio)
>                          BIT(BH_Async_Write) | BIT(BH_NILFS_Volatile) |
>                          BIT(BH_NILFS_Checked) | BIT(BH_NILFS_Redirected)=
 |
>                          BIT(BH_Delay));
> -               bool busy, invalidated =3D false;
> +
> +               if (!force) {
> +                       bool busy, invalidated =3D false;
>
>  recheck_buffers:
> -               busy =3D false;
> -               bh =3D head;
> -               do {
> -                       if (atomic_read(&bh->b_count) | buffer_locked(bh)=
) {
> -                               busy =3D true;
> -                               break;
> +                       busy =3D false;
> +                       bh =3D head;
> +                       do {
> +                               if (atomic_read(&bh->b_count) |
> +                                   buffer_locked(bh)) {
> +                                       busy =3D true;
> +                                       break;
> +                               }
> +                       } while (bh =3D bh->b_this_page, bh !=3D head);
> +
> +                       if (busy) {
> +                               if (invalidated)
> +                                       return;
> +                               invalidate_bh_lrus();
> +                               invalidated =3D true;
> +                               goto recheck_buffers;
>                         }
> -               } while (bh =3D bh->b_this_page, bh !=3D head);
> -
> -               if (busy) {
> -                       if (invalidated)
> -                               return;
> -                       invalidate_bh_lrus();
> -                       invalidated =3D true;
> -                       goto recheck_buffers;
>                 }
>
>                 bh =3D head;
> diff --git a/fs/nilfs2/page.h b/fs/nilfs2/page.h
> index 136cd1c143c9..c3ba3468af5c 100644
> --- a/fs/nilfs2/page.h
> +++ b/fs/nilfs2/page.h
> @@ -41,8 +41,8 @@ void nilfs_folio_bug(struct folio *);
>
>  int nilfs_copy_dirty_pages(struct address_space *, struct address_space =
*);
>  void nilfs_copy_back_pages(struct address_space *, struct address_space =
*);
> -void nilfs_clear_folio_dirty(struct folio *folio);
> -void nilfs_clear_dirty_pages(struct address_space *mapping);
> +void nilfs_clear_folio_dirty(struct folio *folio, bool force);
> +void nilfs_clear_dirty_pages(struct address_space *mapping, bool force);
>  unsigned int nilfs_page_count_clean_buffers(struct folio *folio,
>                 unsigned int from, unsigned int to);
>  unsigned long nilfs_find_uncommitted_extent(struct inode *inode,
> --
> 2.43.0
>
