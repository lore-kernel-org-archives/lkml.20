Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792940163;
	b=UVvlOfXXnm5gCUatjsei3y7YEWl1LFmplzPSenJhJI94fsgWAqcVsYXf1yxARKsl9pRa
	 3RY3rL5EC2FJP2m9nUDFqNuDWIBh5efNm1YM6iGqMsyzp1YXu1n3CbeIBq2WYxMQzQhxA
	 VQhag6b3dKfsHYatrv7nquhKzMI9mEk+Gdx+xMXEi8rxktAtP9m40W45MqdSGDSvZCZHZ
	 6OZEJ5Spe4uXejJhw5Jocu4wnH3G9kyRMYvPsYKQsH/w+SrQCTQrkeesJuVqQq6DEX/fj
	 fpScBTxIFeTyzRX/gPs6Sj1DtFbHuqHuYvUJ/aX9v3xR1IYI0kkp3wTXN8JCvt7MFEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=edJydXO8eM7QbcwRvjK6Scc5idFapwpqQSUYWRShZ90=;
	b=d0wj8j4HPj8yY8OHxDZv2fIMwZp9o9tX2yUDh4bUKGxSoBUdENGEXS2gWA6BLiq3k1mw
	 KRAOqQrhKL3dCQkoyWHx9LAqNeHLssb/v98YTQtd0doG3vkfCZ9ZQed+jMQ5z3RKwpS4W
	 NiaQdhfTb0Jwcp8cjOmzqunZD5rzpp4fudVkNu4WwynRIBny7W79BagRwFIUui0La+Gsu
	 cUyQnOHZ0bpIe5sOj8X8Hp7ehqWKBGky7etog39J3gVqGr2W7agOq6bKc1WBfltYJF1Xv
	 bed+KtWRnYpX65PQqa5g0rapJmHbgzSRSil0MhCL+JLFrZSKmTHNb39y5BECmdsHtOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=njUscctr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588A0606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588A0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=njUscctr
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so250811cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792940161; cv=none;
        d=google.com; s=arc-20260327;
        b=ahZqF8AXtA37D189F6MKwTyIFixYaonSak0cqFkfY84RvavBuJgeSf/h0sElcrWLc0
         Afi9pVzL/GytzESH4xuxCezczp1UM6xdRRP08ImHm+T2JrvXm96KUZdqfHGs1uHK7h9Q
         QxUDGSYq01rVKL9FFqa6u8YC2gcC+NwzGJPFeWBcquQVK36uSVPdKmmN7U5615jXzaZP
         3SGraLckLe6AXyEfjuTuhDrlBwKi0tLi/KU/L1uWvOXr2eVMdRTkwOic2rOYNshamKoh
         v22Tpzj9YoCP9nSZuBkTEYmKR0j+Aj8lf51GXIFIudCyTGovnaNnJukxcpgpkVig8jRd
         5iLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=edJydXO8eM7QbcwRvjK6Scc5idFapwpqQSUYWRShZ90=;
        fh=kKfZcKC/bcfopY9t87/Cr37YCgQxKIgWfUVI56xylS8=;
        b=qtaSN4wf+QcHQnOUBTxirtcjvD35ySg92ogtsGzAAVQCVLpDJjjB3EMsksWKS4AStS
         UMtb34DDQxsxYbHDUomAbr+MW3oopLgPoMG7jLqERn6JF4vG9PGsQUpCdbWMEWYMNhc3
         zBNirybwhil1svkF84JFIEBU7fWPKscdKxqvz9xjulkzZj0uKampbZJ6Nk84ZazsEboT
         tF9qi+KRwXCobQtg70NI0Pl8XMyakngi2rCihQCh16LlOG92X6K47xlGB13513xQ3dVh
         ejexrCn++LVehCDP6sR+bI6kaPyF07QtWJ03ka+kFf0tyCvE3TqT+9POHNQpsS1nxj5Z
         UX2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792940161; x=1793544961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=edJydXO8eM7QbcwRvjK6Scc5idFapwpqQSUYWRShZ90=;
        b=njUscctrhC83Mal9QP8A9ajHDyDeTmzxArDx1ofoyb4XrmC/PnAktTXlx8nezve17k
         dso2zG68vVOgLyLqACkpg9ua2K/yH7dZdm3D+COtv0KmcvDcPyfH8o3ASnhShSjmFmQQ
         EmypgsRLy0bGPviRmHMEUAPkY3uHCLjXIUUjO/YihX9bepaQd5fY8DRFeGOoShw3+7iR
         A7NfMU1zWnTD+NGmxE8TGmE9JhLBNG4V16R62KZWVewMw/XuTR5ZDDjcyKS/OnGt1G9k
         3rm/cw12u1pouZyRNjYjIkbZmWebhVOJmQ02ydYIX/kEJRWPiCJFcsfh5Ci+mbAWtmpG
         Vksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940161; x=1793544961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edJydXO8eM7QbcwRvjK6Scc5idFapwpqQSUYWRShZ90=;
        b=RhuVS9/xOdVX6RF1N7os52JRjpcqzVJjQARTSvGXxTl8OwXODGx/avv/wDqrfxJN2Y
         WIApRJUeUNx0y4SLItX9liZo7OpYHOv6XMg4EuRM55aQx95xoNPzmpi67MZ00KZUMK9G
         RwRPTcd84dvLhzzLRSeCEuhfSJtySvLhKSlH5noiuz0ht2NMzFzDm4VJrepemFOU96eH
         m2qV8Sz7sZKnorTBi7ud6BDRtxuPQeQHramQOcirx3Cx+ZinNbnZaTSJZeXh4TFlM1rv
         fbP+ty4QTUCAQggKjVWvRNZXpIvjeEDZgE64Iff7Zv/pZj7JLQQILEO8oIgVPjJA9bsI
         3PYg==
X-Forwarded-Encrypted: i=1; AKwUvBzsBafptiFavuV9yfnezv9w585iRLrfl5Bt8S6RJCcTgAfMhInWcWIDSrMZyuogXTGgfQlDUylcDrjOzIM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0kVTcYN7/2JvoaYGOugwQGg552eRrEq10ftySJ1l307s1T0CQ
	evMEGFRYRAhKTQUxzacKfqOUtklbwvE4cGL1iS480pCdvG67SfoRnE0zwJcB9PpMxfeOrh0337b
	D728iKY4uYmWmYOx9Syxk3IFx+UaKPw0QwuLsHklU
X-Gm-Gg: AYBFou1Qy6kf4jGLDcCa01+vIpMEi38p8T42xnj4YHJWzAeTEK84bj9nukdqKsXgvrK
	vtPxoJYJ/f69CP/485/KOVfuQbo2Pr7eKE+mGQEVSkLi6MEJMDN8EuAKrrBmGanNdFjaEB31GwU
	zhVvus+wUnpBMOA0Kpzzpwjr0rouDnh1lk1Z2pNye9PmzIxYPSpuYYlOi3ND6VCAKjNPKesL0SJ
	dlGAXZAl8kSf+Ip3pDT32y0pfcSDsXz7foWY8JriwN7JcBqAkan20UYzt5JVH8uMfkrR+n8fiHe
	6YcneG+iW/tFb5RMEsjwpkHLa0/ooj1kv5JTNhuSR2ew3O4/B7YxXGHLzHCjmczXfPg40nA8SnL
	Ll0F5JE2+u54ZSYV8sIKpXFU8B0G7jPPZawU=
X-Received: by 2002:a05:622a:1f12:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-5383b47236amr21034181cf.3.1792940160515; Sun, 25 Oct 2026
 07:56:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-per_vma_maps-v1-1-c4eec45b9387@kernel.org>
In-Reply-To: <20261025-per_vma_maps-v1-1-c4eec45b9387@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 25 Oct 2026 07:55:48 -0700
X-Gm-Features: AclHuK8uFqepEAvLNHa3DmgUKJrQNAsjl4cEFXBDYXl8QDdPza9TmJXOwbUbspw
Message-ID: <CAJuCfpEk6H-wJvNqxSXTwj2NCjEMEzYr6MyHjRNRZjPC2AV2wA@mail.gmail.com>
Subject: Re: [PATCH] fs/proc/task_mmu: fix missed VMAs when reading
 /proc/PID/maps and friends
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Shakeel Butt <shakeel.butt@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 3:43=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> Reading /proc/PID/maps under per-VMA locks can skip continuously mapped
> address ranges during concurrent VMA splits or merges. This violates the
> guarantee in Documentation/filesystems/proc.rst:
>
>   "If there is something at a given vaddr during the entirety of the
>    life of the smaps/maps walk, there will be some output for it."
>
> lock_next_vma() reuses a tree iterator across calls under RCU. The iterat=
or
> remembers the range of its last entry. When its node is replaced,
> mas_next_slot() walks the tree again at the last index of that range, the=
n
> advances past the entry containing that index. If VMA boundaries changed,
> this can skip a range that has not been reported:
>
>  - A lookup finds [A, C), then mprotect() splits it into [A, B) and [B, C=
)
>    before vma_start_read() locks the first VMA. The reader reports [A, B)=
,
>    but the iterator still covers [A, C). The next call starts from B yet
>    advances past C, omitting [B, C).
>
>  - The reader reports [A, B) and unlocks it. A concurrent mprotect() then
>    merges it with [B, C). On the next call, the iterator resumes at B - 1=
,
>    which now belongs to [A, C), and advances past C. Again, [B, C) is los=
t.
>
> Checking the mmap_lock sequence only within the next call misses writers
> that completed before that call began. Also, a NULL result is currently
> accepted without validation, so a race can terminate the walk early.
>
> Even a fresh lookup can skip a mapping. Suppose it finds a gap before
> [B, C). A writer inserts an adjacent VMA at the end of that gap, then
> merges it into [B, C), replacing the node. The lookup resumes at the old
> gap's last index, now inside the merged VMA, and steps past it. The
> original [B, C) remains mapped throughout. Repeating the forward lookup
> is insufficient: another merge can make it skip the same mapping again,
> returning the same later VMA or NULL.
>
> The fresh-lookup race also affects /proc/PID/smaps, numa_maps and
> smaps_rollup. Resetting the iterator after gathering each VMA's statistic=
s
> does not prevent a merge during the next lookup. Fixing lock_next_vma()
> also prevents omitted entries and incomplete rollup statistics.
>
> Keep a saved sequence in the proc maps locking context and validate it
> before each lookup with mmap_lock_speculate_retry(). If it is even (no
> pending writer) and still matches, reuse both the iterator and the saved
> sequence. Otherwise, restart at from_addr and sample the current sequence
> before looking up the VMA. Only refresh the sample when resetting the
> iterator, so a writer between validation and the lookup cannot go
> undetected.
>
> The smp_rmb() in mmap_lock_speculate_retry() orders the previous lookup
> before rereading the sequence. It pairs with smp_wmb() in
> do_raw_write_seqcount_begin(), which separates the sequence increment in
> mmap_write_lock() from subsequent tree updates.
>
> Validate detected gaps (from_addr < vma->vm_start) and NULL from
> vma_next() against the sequence. If there were concurrent writes, use
> mas_walk() to check if the writer could have interfered with the range
> of interest. If the range is not empty, something interfered concurrently
> so we retry under mmap_lock. Checking for empty ranges avoids taking the
> mmap_lock just because an unrelated writer changed the sequence.
>
> Original fix generated by an LLM and sent by Josef Bacik in private.
>
> Fixes: 5631da56c9a8 ("fs/proc/task_mmu: read proc/pid/maps under per-vma =
lock")
> Fixes: ea3085dd7a4e ("fs/proc/task_mmu: read proc/pid/{smaps|numa_maps} u=
nder per-vma lock")
> Fixes: 0e985559d72a ("proc/task_mmu: read proc/pid/smaps_rollup under per=
-vma lock")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks for the report and the fix! Let me take a closer look. I took
extra care to ensure we do not skip any VMA but maybe I missed
something here.

> ---
> I neither understood nor liked the original LLM generated fix that was
> provided to me, and I (and codex) think it was incomplete. So I tried to
> come up with a better fix that avoids additional fallbacks to the mmap_lo=
ck
> while trying to keep it simple.
>
> I won't claim that I am now an expert on the code, or that this is the
> most elegant fix. It is quite complicated what we built ... too
> complicated. So if this goes into the wrong direction I'll be happy
> if someone else wants to take over ;)
>
> I reproduced the races with /proc/PID/maps, and with this patch they are
> resolved. I did not manage to reproduce the races with the new
> smaps/smaps_rollup, but the races are slightly different and harder to
> trigger.
>
> There is the issue with seqcount overflows that Lorenzo is tackling. It
> probably interacts here as well? Likely, but that's an independent issue
> to resolve.
> ---
>  fs/proc/internal.h        |  1 +
>  fs/proc/task_mmu.c        |  6 +++--
>  include/linux/mmap_lock.h |  5 ++--
>  mm/mmap_lock.c            | 58 +++++++++++++++++++++++++++++++++++------=
------
>  4 files changed, 51 insertions(+), 19 deletions(-)
>
> diff --git a/fs/proc/internal.h b/fs/proc/internal.h
> index df873df9afc56..f3e846b574d79 100644
> --- a/fs/proc/internal.h
> +++ b/fs/proc/internal.h
> @@ -386,6 +386,7 @@ struct mem_size_stats;
>  struct proc_maps_locking_ctx {
>         struct mm_struct *mm;
>         bool mmap_locked;
> +       unsigned int mm_wr_seq;
>         struct vm_area_struct *locked_vma;
>  };
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index ee9fc2fd2b2fe..dc3adcffb6d9c 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -148,6 +148,7 @@ static void reset_lock_ctx(struct proc_maps_locking_c=
tx *lock_ctx)
>  {
>         lock_ctx->locked_vma =3D NULL;
>         lock_ctx->mmap_locked =3D false;
> +       lock_ctx->mm_wr_seq =3D UINT_MAX;
>  }
>
>  static struct vm_area_struct *get_next_vma(struct proc_maps_private *pri=
v,
> @@ -160,7 +161,8 @@ static struct vm_area_struct *get_next_vma(struct pro=
c_maps_private *priv,
>                 return vma_next(&priv->iter);
>
>         unlock_ctx_vma(lock_ctx);
> -       vma =3D lock_next_vma(lock_ctx->mm, &priv->iter, last_pos);
> +       vma =3D lock_next_vma(lock_ctx->mm, &priv->iter, last_pos,
> +                           &lock_ctx->mm_wr_seq);
>         if (!IS_ERR_OR_NULL(vma))
>                 lock_ctx->locked_vma =3D vma;
>
> @@ -523,7 +525,7 @@ static struct vm_area_struct *query_vma_find_by_addr(=
struct proc_maps_locking_ct
>         unlock_ctx_vma(lock_ctx);
>         rcu_read_lock();
>         vma_iter_init(&vmi, mm, addr);
> -       vma =3D lock_next_vma(mm, &vmi, addr);
> +       vma =3D lock_next_vma(mm, &vmi, addr, &lock_ctx->mm_wr_seq);
>         rcu_read_unlock();
>
>         if (!vma)
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 28e3696ce9ff3..e33d15ce6a876 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -511,12 +511,13 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm=
_struct *mm,
>   * Locks next vma pointed by the iterator. Confirms the locked vma has n=
ot
>   * been modified and will retry under mmap_lock protection if modificati=
on
>   * was detected. Should be called from read RCU section.
> + * *last_seq must initially be odd and is kept across calls.
>   * Returns either a valid locked VMA, NULL if no more VMAs or -EINTR if =
the
>   * process was interrupted.
>   */
>  struct vm_area_struct *lock_next_vma(struct mm_struct *mm,
> -                                    struct vma_iterator *iter,
> -                                    unsigned long address);
> +               struct vma_iterator *vmi, unsigned long from_addr,
> +               unsigned int *last_seq);
>
>  static inline void vma_assert_can_modify(struct vm_area_struct *vma)
>  {
> diff --git a/mm/mmap_lock.c b/mm/mmap_lock.c
> index 2f94ee0fdee2a..0f3a4e0c5520d 100644
> --- a/mm/mmap_lock.c
> +++ b/mm/mmap_lock.c
> @@ -400,21 +400,50 @@ static struct vm_area_struct *lock_next_vma_under_m=
map_lock(struct mm_struct *mm
>         return vma;
>  }
>
> +static bool vma_range_is_empty(struct mm_struct *mm, unsigned long start=
,
> +               unsigned long last)
> +{
> +       MA_STATE(mas, &mm->mm_mt, start, start);
> +
> +       return !mas_walk(&mas) && mas.last >=3D last;
> +}
> +
>  struct vm_area_struct *lock_next_vma(struct mm_struct *mm,
> -                                    struct vma_iterator *vmi,
> -                                    unsigned long from_addr)
> +               struct vma_iterator *vmi, unsigned long from_addr,
> +               unsigned int *last_seq)
>  {
>         struct vm_area_struct *vma;
> -       unsigned int mm_wr_seq;
>         bool mmap_unlocked;
>
>         RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "no rcu read lock held");
>  retry:
> -       /* Start mmap_lock speculation in case we need to verify the vma =
later */
> -       mmap_unlocked =3D mmap_lock_speculate_try_begin(mm, &mm_wr_seq);
> +       /*
> +        * Restart by address if a writer could have changed the cached r=
ange.
> +        * The retry check's smp_rmb() orders the previous lookup before =
reading
> +        * the sequence and pairs with smp_wmb() in do_raw_write_seqcount=
_begin().
> +        *
> +        * The vma_range_is_empty() checks below avoid unnecessary mmap_l=
ock
> +        * fallbacks.
> +        */
> +       mmap_unlocked =3D !(*last_seq & 1);
> +       if (!mmap_unlocked || mmap_lock_speculate_retry(mm, *last_seq)) {
> +               vma_iter_set(vmi, from_addr);
> +               mmap_unlocked =3D mmap_lock_speculate_try_begin(mm, last_=
seq);
> +       }
> +
>         vma =3D vma_next(vmi);
> -       if (!vma)
> -               return NULL;
> +       if (!vma) {
> +               /*
> +                * There is no reason to fallback if there really isn't a=
nything
> +                * in the remaining range.
> +                */
> +               if ((mmap_unlocked && !mmap_lock_speculate_retry(mm, *las=
t_seq)) ||
> +                   vma_range_is_empty(mm, from_addr, ULONG_MAX))
> +                       return NULL;
> +
> +               rcu_read_unlock();
> +               goto fallback;
> +       }
>
>         vma =3D vma_start_read(mm, vma);
>         if (IS_ERR_OR_NULL(vma)) {
> @@ -442,15 +471,14 @@ struct vm_area_struct *lock_next_vma(struct mm_stru=
ct *mm,
>          * it was not shrunk after we found it and another vma has not be=
en
>          * installed ahead of it. Otherwise we might observe a gap that s=
hould
>          * not be there.
> +        *
> +        * If speculation fails, avoid taking the mmap_lock when a direct=
 lookup
> +        * confirms that the gap is empty.
>          */
> -       if (from_addr < vma->vm_start) {
> -               /* Verify only if the address space might have changed si=
nce vma lookup. */
> -               if (!mmap_unlocked || mmap_lock_speculate_retry(mm, mm_wr=
_seq)) {
> -                       vma_iter_set(vmi, from_addr);
> -                       if (vma !=3D vma_next(vmi))
> -                               goto fallback_unlock;
> -               }
> -       }
> +       if (from_addr < vma->vm_start &&
> +           (!mmap_unlocked || mmap_lock_speculate_retry(mm, *last_seq)) =
&&
> +           !vma_range_is_empty(mm, from_addr, vma->vm_start - 1))
> +               goto fallback_unlock;
>
>         return vma;
>
>
> ---
>
> base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
>
> change-id: 20261025-per_vma_maps-ceab0eb860d5
>
> --
>
> Cheers,
>
> David
>
