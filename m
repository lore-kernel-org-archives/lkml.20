Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498680;
	b=jfxp2KkoE72nfNn1NkPz5RJSVCO6mW4ZMfzROTXLP4fp18wtH4ltS2p/3L+YrtlQ/6iy
	 ZMSorAG0S/YCO7YPKRHvHmVlzi8rRiwsdGBKqJ/By8PkIryH6cTdZJvMRGqkgub+s5Vfy
	 Fn0XKe4NMBkeZUrwWUNlXeFBbuByl3LTbHNTvct0grGnsXbhVy+xON9b30j3Gew5nbQeY
	 g+uDDrG3UaGJuMN5wVeJJoil6k/GPHcxuS7g/sHCjRq0ZJkBWSq+t4ymLwvYtQsyBeg5F
	 f7UJbqsqeh/4b2CXHEGowmzrRzi59t2DTgj+bNj89/FBbi15UHk+HWyRjC6+906qQTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SHdxAN7HZz6R7h3iP2OmBErMKSektM89NlydJ5odNjM=;
	b=0V6boqZ2RQJMDSdrg8sJHoHwMoj/k6zu0EKXHKNENHaKsMLeJBBt1fJhVy1/BS94zQep
	 BSUgND7PX1p3Ukk8sMV/cyCVJnmTQ2/j6sE+b4KPYKiGn9euNEGefELrtY6VRxLj6f3BR
	 iF+an8DVlskgz4lm9PBe4umC6GbRJILiXoJLQ/puabTPz6MPnAcP8VEpjhi2BdDii8OcV
	 Gl6f/n59y9vCjryRAUp03F9hIbazIblSeVESA30ez85XdEGUKYckMWBNw1Q9MldxHXNUc
	 HlBh71cRDlAqL8Ug2H8l3P02rRoShI++9UwYoCwXvzvlQqsA5g5EdLq3jyxiBoGHWgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iL2Z/9wQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF46606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF46606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iL2Z/9wQ
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b2f59de176so3429487b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794498679; cv=none;
        d=google.com; s=arc-20260327;
        b=mcLAesdBBe4Lvs5Shdtp7W2OCLCPl2dXh/5yJFnD1pvpkffN3/AkciKMAOut5w8YxQ
         QXgcVmyd7GRnmVNDhF1a3N7RkwdkFnplXEI1aJyC/yQSXKdbUl/zt1gJpy41ATlrPypH
         6K91QrcrNIpMjMoVlZ/CtGzxXtd8SU/WwE3UpRhjYvKqWzZnlUYYqsg889WfDLEF5x11
         YwfRkqdB58BgZAJ6RxhTSQOI/fiQ05nyzVR/kqXmSXImGBPG/AUuBhLim7DqdU4H2ZtE
         3W7MpSGOd4jw25jH/MK40oNUPKNsZhDaOGyDl40V0yWXxKxrGefowD1JckDjjtgUU38Q
         sriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHdxAN7HZz6R7h3iP2OmBErMKSektM89NlydJ5odNjM=;
        fh=wBGE+pZlBkcAIc/AYoOQh4Vek4BfNxMhHAZyiPv5SNQ=;
        b=nJ66h6G7se8OpxUm5sxZx3LmFvWnKkKtmE5X7l43KTyIUMJUJUxx2FlE3bn24brmoA
         F3rs3HSvHt5akBYASYnoquPoyXxzJKndau4aaF0NJ+Upbo80HRtEoD+8YYcK7YG7000O
         c32zhg0UJe2X4s637IpYUHxUp3GlNCwYN9M3oSdhQPgrs+0S1UyLbHwxmtTkiKmh8Buy
         a/5kuJVcuDgw7Ri7/erB1GnibO0+oVnmDUsg+bMyt9F8l36z347PAQf7iPiyA/41Ar7V
         PZN8BQX2wSAFQhtBzXEfmDzVmdgrd1yb78jVgczRH1xfyTAUC0EGkELvh3Xa2sGB++uA
         PyKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498679; x=1795103479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SHdxAN7HZz6R7h3iP2OmBErMKSektM89NlydJ5odNjM=;
        b=iL2Z/9wQo+bSDRES11m2R++cFdAV1GIjPGscvPW1Cc6YY9IZ51igiHBFqF4/bmYYvu
         oG57X2WJ6sXghtOSe//7D8WqT1sB9TLmI9MF/PnsN5mu+9FhV9J0VUjRoH0tNl4LeuH+
         uAVRTfLYgNLj2pzniJKgxysz+8/ZABaVNmvkCEgCM6EwAuQYjbT6tRGInIUQ8rqyJ4uP
         way5GROHSSUnA48sbb54C9we6DFsppAiyLgnCeavU3bwI5ZBGiy0VQpvzQIKcRL9JxPt
         aFxqAMLiKAqYei83HQ5P1dIdL2dgyays1XJli+F9yIXHAQaWb7NqNSIrpXmXEOg62rRx
         Bsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498679; x=1795103479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHdxAN7HZz6R7h3iP2OmBErMKSektM89NlydJ5odNjM=;
        b=1hTF3HvWh3+dC0ijsu17yggxJO6EBqzYSMPKKr4c8gCzF4iZwzxPFRNwIXyBY3dDKw
         RexhUOFJqe//KvZw+g4GlnGV1Y26LVUI5lD7In6CB6uSMiz+wWnKbow1GUXuDoiyH7ZH
         paYf2a8K9T61OMK0dU/Lih+RvoypATL+THQ39P3iwd0g2LK0OIpXLtlHT/K29V3I6fyZ
         1fZStoARiwHYNFT0s11FdHETkISpzOW9E0TRVr87ZJ54PjwK01hhQw2J+5fSBcsttk8g
         6hWI2g4vCJhuipp8PmcEZImXG7nmBRkXtfsKxLIhNrzTsDVZUeJ3LVqFcEXllfglU4yQ
         Xwqw==
X-Forwarded-Encrypted: i=1; AL+hErF9wAB8G8GmZmmj02wTczxcJnjpIpCws/317vk0sKUJUxmYPWnz8tPPG8sqCb0NC03/lcCPhq0n3fl+HlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JCPqsQtNDiUMSPxeDeWq9IlWZWgbnXCmA8MJtmXlXOB2d4lww
	tQp19i05AxBjyqWPR7XHdxwvLvEHiiaz2I85Yb/dJNLyjYg6+ajQKaklnRCjrxyYIlrE37Ma8S3
	fdMDv4gbKgp72urqUg4OwcYzgD+JRofM=
X-Gm-Gg: AYBFou3UDlqLNlT8G0S5UgXQ3qv06wlb8EfWr4B6QVZLo2V4bzqQopmiffOzQnoS5Un
	yfcBw/aXQbSRLl77T3TVB6pp+RvnUHQVExCr0U1GNRklcKYZ4AoiAaF3sgKp+02NYYk+Ooy2JG9
	m7WD9KQwVM6orgXRZeejcje9ClYse09rxaycIcsP5PjTXryOcvdyRVR1wJhJfyjQFnbqiLdD3yL
	KS2aytP1IqNgiGDo/oO5P0AOB9OFrRCU8/ZjD1zT8oRNUtLb7PDOLutjFYSF9oBDA8hCPNqUsXY
	8/Tpq3OTT0tftmWrZUoEWP7Xzbx4dYGpBR+tV9E3VtuXD9H11ZTUAKkI0Pic0g/Bpf232VRLi6W
	jGLJbd8G7lGr1bCaDlbnssMIyzN+5NnE9yMXvfsRr6z3dm85I3+XFZmFDIVCe5HuM08iYgA==
X-Received: by 2002:a05:6a00:4f90:b0:8a0:4493:50b3 with SMTP id
 d2e1a72fcca58-8beb1fd9e3cmr15135b3a.2.1794498679329; Thu, 12 Nov 2026
 07:51:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112075827.255602-1-hui.zhu@linux.dev> <avVx_1BEP7fIzGDK@KASONG-MC4>
 <avV0IbvSx4iuv0tF@tiehlicka> <7718d4d0-58bf-4281-8256-fa726f753159@linux.dev>
In-Reply-To: <7718d4d0-58bf-4281-8256-fa726f753159@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 12 Nov 2026 23:50:41 +0800
X-Gm-Features: AclHuK-DauIlr6X0qTL4R9gghp2Up-lZkVCGGgcBB0M_Z_UKEKTL-VonoqZxN1c
Message-ID: <CAMgjq7CUMuNSdCXZ7_kDdo9+0BFvPNHuO=mq=ct_Q5YUyyckvQ@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: check need_resched() in fill/drain_evictable()
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:01=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> Hi Michal and Kairui,
>
> 2026/11/12 16:09, Michal Hocko:
> > On Thu 12-11-26 16:03:54, Kairui Song wrote:
> >> On Thu, Nov 12, 2026 at 03:58:27PM +0800, Hui Zhu wrote:
> >>> From: Hui Zhu <zhuhui@kylinos.cn>
> >>>
> >>> lru_gen_change_state() migrates folios in batches of up to
> >>> MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
> >>> keeps local interrupts off for up to about a millisecond, and CPUs
> >>> contending for the same lru_lock spin with interrupts disabled for
> >>> that long.
> >>>
> >>> The caller already reschedules between batches, but a batch itself
> >>> only ends after 4096 folios.  Stop it early when a resched is
> >>> pending; the caller restarts the migration where it left off.  A
> >>> remote resched_curr() sets TIF_NEED_RESCHED directly in the target's
> >>> thread_info, so the flag can still be set with interrupts off.
> >>>
> >>> This follows walk_pud_range(), which already pairs need_resched()
> >>> with a MAX_LRU_BATCH cap, and commit 6e9be217a3ce ("mm/mglru: use a
> >>> smaller batch for reclaim").
> >>>
> >>> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> >>> ---
> >>>   mm/vmscan.c | 6 ++++--
> >>>   1 file changed, 4 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/mm/vmscan.c b/mm/vmscan.c
> >>> index 6a1af9b92349..47f2cb25eb46 100644
> >>> --- a/mm/vmscan.c
> >>> +++ b/mm/vmscan.c
> >>> @@ -5533,7 +5533,8 @@ static bool fill_evictable(struct lruvec *lruve=
c)
> >>>                     success =3D lru_gen_add_folio(lruvec, folio, !act=
ive);
> >>>                     VM_WARN_ON_ONCE(!success);
> >>>
> >>> -                   if (!--remaining)
> >>> +                   /* stop early to shorten the irq-off section */
> >>> +                   if (!--remaining || need_resched())
> >> Hi Hui,
> >>
> >> I've been thinking about a different design, what if we just
> >> delete the `--remaining` check completely, and check
> >> spin_is_contended on the lruvec and need_resched()?
> >>
> >> In the optimal case we don't need to keep lock/unlock the lruvec
> >> at all so this is faster. And it still avoids lock contention or
> >> blocked schedule, and it might be even more responsive as we are
> >> release the lock earlier on contention.
> I like the spin_is_contended() idea and will add it.  This file
> already uses it (lru_gen_look_around() bails out if the PTL is
> contended), and security/keys/gc.c uses exactly this combination in a
> long list walk under a spinlock.
> > Wouldn't this result in too much lock bouncing in the end? Would it mak=
e
> > sense to reduce the batch instead?
> >
> This worry is fair.  Under sustained contention each yield costs an
> unlock, a requeue and a restart (microseconds), while one folio move
> costs a few hundred nanoseconds, so the migration could slow down by
> tens of times, with cgroup_lock and cpus_read_lock held for all of it.
> Requiring a minimum of work per hold bounds this: only honor
> spin_is_contended() after MIN_LRU_BATCH folios in the current hold.
> Each hold then moves at least ~64 folios (~15us), and a waiter still
> waits only ~15us instead of the ~1ms of a full MAX_LRU_BATCH batch.
>
> I'd still keep the batch cap itself as a backstop, though.  Both
> triggers are event driven: with interrupts off the local tick cannot
> set TIF_NEED_RESCHED, so it takes a remote wakeup targeting this CPU,
> and spin_is_contended() takes somebody grabbing this lru_lock.  On a
> quiet system neither may ever fire, and one batch becomes the whole
> lruvec: 100GB of 4K folios is ~25M of them, i.e. seconds of irq-off
> inside a single rcu_read_lock() section, enough for an RCU stall. And
> toggling MGLRU on a quiet machine is a common case.
>
> Reducing the batch alone would also work and is simpler, but it pays
> the unlock/relock round trip even when nobody is waiting, and on a
> loaded machine the unconditional cond_resched() every small batch
> stretches the whole switch more than yielding only when somebody
> actually wants the lock or the CPU.
>
> So how about all three combined, like jbd2_log_do_checkpoint() does
> (batch cap || need_resched() || spin_needbreak()):
>
>      if (!--remaining || need_resched() ||
>          (moved >=3D MIN_LRU_BATCH && spin_is_contended(&lruvec->lru_lock=
)))
>          return false;

Do we really need the `moved` counter? Other than that it looks good
to me. Thanks!
