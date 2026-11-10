Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794323939;
	b=g0FTANhbndEPvbEv9bPBKcrN18NEarNMxkbDr/B4d776aN1dbVN8jZk6oBPlx3wu4PvS
	 H6x8b6mxLtFWrD+gplaju74o8qzXH8mqwoWqzD6Yro+PL3YRH9X3aKzxOKCqs99o9gEa6
	 Asjg6zLZOocL+J24dlEFfWW7ohmQNGE2fKdt1/WUAHhOD8aZAxHSNsjIummdsXOQwhNyf
	 TdN3NJSA6Y26/tNH1MVr/wHYqJRYxCplba/CxFLtAFJqfe2tOKvYPcavqGjXGgWw9D3kX
	 +Pe45anH8JbDVVeVZezSENTckI0v2njh1qb+9IcfqCnW+DZR9QxQmws0Eyjug20/UzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8b5Lf6ftuHfcfsHEGu+mKO1MgoMJIgVznAg6v4ATrxI=;
	b=ucop/vl3OxOX9S2t5Cdn2WYgkTXIGbYd6z7C4hMi0JKW033xAvlOQJCBvadq8ouGj7nz
	 lRrpV6CWUWSb7QVqk4jqrP3TLow+6tY7+3nsd/5yVctVybnKnsHWkNVgYaNuLjAfMKilk
	 jlgl0zYJ4EUzKNU+YULMx9w5LM5JPCvdSz95f4SjdU1euGCprJee1wyvKSBrGr+A9TqVD
	 fpfYXkdm83Q2F6+FXlL0l/XjffXpvI9Pqo3TQ812mWr27vFQjte8eYwXEpAPFOu8WY5as
	 HhlCHSUrz3cG7Jm2YKEBuz/VElEDQOUl28YkcfKhETOuyoVPbOxu9CgA2OAs6qTkUUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DkFnpnrn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380F606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3380F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DkFnpnrn
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so10503a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:18:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794323937; cv=none;
        d=google.com; s=arc-20260327;
        b=SzbWzETEebEpIEati0FEhXt5hP9MUa8N9OTnkVXSonwStVik/v4LlLPAZy4AxEg9gp
         kyTUX5WmSpqEuKa80vyc4IWmPrtOBs0MY+LJ4TxrKR3PrK55JEja0pvWNVNaWcEfYG0x
         pWnhwmdN01Se4GJPMYbCiGAyrRbd7cG5JIY6eSpB0hb9HTl7HDmTEMw/Vqm6D5RTwXuM
         2+oVPGC3EvyvIrqkNSu/VKOR6Z1dfLjdpPTtBtNaEBocpkh3ZaiHVWFvZ24zjy3u+hFa
         lBoPDtfI9NL6XAPAwVVmHaQTi91Cc4zhJ7jKGGqh0zL/J95p11q2Mw2hazWGbv6qRsCL
         X6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8b5Lf6ftuHfcfsHEGu+mKO1MgoMJIgVznAg6v4ATrxI=;
        fh=tgRdbYRYxfqMtN8TOtpDQfK7AnsYlE0PD7YEIsgJUmI=;
        b=A57nsYS0cdm+ARgZ2iFYyN7QXwbC+pUE2biqCSfqM4xB0BWTPB4apBwru6/fW7hm6i
         sdlcGayNvK+ftwO7i0VjrtON/Qx9j8eMrstyuugfHPejZuKLEaSO8jGwRLHPZwmv8x2o
         miU64Jq8tUOOjtX2Ua++MHO/nlZHNNHZg5uKUs45zi+6DoeHZ8jYFP7hf4Q5Vsxo5U7C
         SpTqxTn3nNgQepbfdT/kEOA+l1BB3a+V6WQ/S7YNj+nbMNC9pqFFM3oyt5OpWh9JF437
         GFhnxqMzchMeDmKO284zGqZbO5gvzKx511HPSiH05I2q8qxq8H9Hxv2gT+Y4/7eP60Lo
         cP+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794323937; x=1794928737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8b5Lf6ftuHfcfsHEGu+mKO1MgoMJIgVznAg6v4ATrxI=;
        b=DkFnpnrn5TC82izVUP0czbyz0fTQu7loOv+7RMhOUfxqgVQyQK8xRT48c5cGZJrO0W
         GxjtB73kgdM2ZJHvY2AlgdypJVdLsnATQv1z1UEYLQv/gshzrDOnDIu/KztkeyhPTs4e
         DlnxDrte2uNzhZ21rwlxzaGexFaV31ZjTbokugr8bxKlyJiGC34Yk+yHCCYlHj7/e/aB
         6KHuiLltdVN4V9oc02S4cw8+CGuy1jl4oyncgzmbkYl8PrWIhofQuGOULf2QioHkL1Vb
         cULrTVeBbG1Rg9bXiHPqhZ4nFcPVPYTiY+stj8DtglpnFTNgBy2WVnWwIxf9wtDIBdD2
         +z3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323937; x=1794928737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8b5Lf6ftuHfcfsHEGu+mKO1MgoMJIgVznAg6v4ATrxI=;
        b=NMuMBtZXtz84kyFCvGEkHa0Slnia7GHbNxW3jLJX1kuFPwqQMZy78wf5KIteF9S6cx
         F8CsfQKpCBkBn5lRzqWyxs711JenjWkv8AHF0CUGW4s+i+0AsrwFyZp/lbf3O2f9Qj30
         TxCkKFTFnUe4NX/d6VXN6ax/V59ppuFwsoaUFJK3uZpbcY94mhfhoEFtkLOHoCnwGjTO
         FuIjA2UNZpRTg4f3Dtd2jLTgHnjX8Yfrz7kT5YNkBSwQUEpjdR/crseHYVWbPCj7Zbjp
         R+4q0HNSIzxCXoUI5LPuE92PWVMckwNUS4hQJNidYeNpG+WefCGwYFnqCIWBwl8R+7G2
         tCng==
X-Forwarded-Encrypted: i=1; AL+hErHOQwWaSEg0CEj92/vZeh8iJtHnjT6B75GSq75aTNjfAbQk3vP0BPxuHPxasPRhfVHw0JNp/oxqQeeuF+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Lw5idTJQZwplEb8ShxGwrlZrRrmfB4nMC9Dvis5rf8KtXggO6
	m7nX5YohgjIvlsyrLoPuxirGqz47rkDwemhoBloem0c49VIr5tOkuKPgyN2Z40xORRFgiV8py9b
	qYxvF035b1VbsREJChAE6fsvAzRdy6LQXsmZ7m4sc
X-Gm-Gg: AYBFou2P66X1Y6r4gH/80STV9I+4oSzPQvI6RTEIodBnWetB3ZrwLLsFySKSO56rmqo
	DitvwwQ+6yG5fN0dsL5qFaLJNXDxHSLqn4aiQwkA8//60k3Dysu5tA6Ep6BSsA4O8j8+xN8yio8
	ONTBVv3uagHjaM5UTzKT0AfyGOG8EAe1wT/PyKzRis0NIAZWcc+Zq07lk3r3vl7zCkD0LbG9E0I
	st4zael3IqR72b6Z4wf8LSHxn4c0cAK1cg4kFpra6weFA05LH0Z5lS2wh24V425kgy3rSNS9ovD
	5ZwwcYIXM0BfKLwaOHIg4BEI4E//t2Fd05poV5vRi5xjDy8igMIfCS8aS1OLM/SGy2GxKXT3caE
	S45DkwUlpNoc0qgxCGeXM32azHNbpwLJTbyZHnJD1nZ6kXNHnL6wooAqdOBg3hjowiJoLE35NMx
	CQ+adpPIbKBsM6zp4ZxFtMzRDqPyYVYsyRfLjd0g4Mo+Pp5fmr
X-Received: by 2002:a05:6402:a2c8:20b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b75a7c6522mr69526a12.16.1794323936977; Tue, 10 Nov 2026
 07:18:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org>
In-Reply-To: <20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 10 Nov 2026 07:18:43 -0800
X-Gm-Features: AclHuK8YW4Gf8WqWPGeqjXKM_89-mP3P5tHV5hwbUgMRRbIQM_0XkyFdQ0hmOzQ
Message-ID: <CAJuCfpH46gm3WknMGQdv7TYfnVRN2Xkw8v=J8RVPOBZRJrpEDA@mail.gmail.com>
Subject: Re: [PATCH] mm/vma: predicate vma_assert_stabilised() on CONFIG_DEBUG_VM
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Lance Yang <lance.yang@linux.dev>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Seunghyun An <san55@wisc.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 7:10=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> I introduced commit 17fd82c3abe0 ("mm/vma: add and use
> vma_assert_stabilised()") with the intent of picking up programmatic bugs
> when debugging mm code, but kept the general practice of asserting even
> when CONFIG_DEBUG_VM is not set in line with existing code.
>
> However, it turns out doing so can cause performance regressions,
> especially when asserted in vma_has_anon_rmap() which is referenced in a
> number of hotpaths.
>
> Since the intent was always a debug-only assertion, explicitly check for
> CONFIG_DEBUG_VM and do not assert if it isn't set.
>
> Really all of the assert paths need to be predicated on this, but start
> with this one only, out of caution.
>
> Additionally, since a detached VMA is trivially stabilised (nothing to
> stabilise against), check for this case at the outset, and update
> vma_has_anon_rmap() to not explicitly need to check for this.
>
> This also, importantly, avoids reading any VMA fields if CONFIG_DEBUG_VM =
is
> not set.
>
> Target the commit which introduced vma_has_anon_rmap() for the fix, as th=
is
> is where the issue started manifesting in practice.
>
> Fixes: 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence =
KCSAN")
> Reported-by: Seunghyun An <san55@wisc.edu>
> Closes: https://lore.kernel.org/linux-mm/20261110000002.1834454-1-san55@w=
isc.edu/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
> Note that vma_is_anon_rmap() was introduced in 7.4, so no need for a cc: =
stable,
> just needs to be sent to Linus as a hotfix. Thanks!
> ---
>  include/linux/mmap_lock.h | 19 ++++++++++++++-----
>  mm/vma.h                  |  3 +--
>  2 files changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 9ccbbcbd7aca..9c3a9c6525c1 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -408,6 +408,11 @@ static inline void vma_assert_locked(const struct vm=
_area_struct *vma)
>         vma_assert_write_locked(vma);
>  }
>
> +static inline bool vma_is_attached(const struct vm_area_struct *vma)
> +{
> +       return refcount_read(&vma->vm_refcnt);
> +}
> +
>  /**
>   * vma_assert_stabilised() - assert that this VMA cannot be changed from
>   * underneath us either by having a VMA or mmap lock held.
> @@ -418,9 +423,18 @@ static inline void vma_assert_locked(const struct vm=
_area_struct *vma)
>   *
>   * With lockdep disabled we may sometimes race with other threads acquir=
ing the
>   * mmap read lock simultaneous with our VMA read lock.
> + *
> + * Assert only if CONFIG_DEBUG_VM is set.
>   */
>  static inline void vma_assert_stabilised(const struct vm_area_struct *vm=
a)
>  {
> +       if (!IS_ENABLED(CONFIG_DEBUG_VM))
> +               return;
> +
> +       /* Detached VMAs are trivially stabilised. */
> +       if (!vma_is_attached(vma))
> +               return;
> +
>         /*
>          * If another thread owns an mmap lock, it may go away at any tim=
e, and
>          * thus is no guarantee of stability.
> @@ -454,11 +468,6 @@ static inline void vma_assert_stabilised(const struc=
t vm_area_struct *vma)
>         vma_assert_locked(vma);
>  }
>
> -static inline bool vma_is_attached(const struct vm_area_struct *vma)
> -{
> -       return refcount_read(&vma->vm_refcnt);
> -}
> -
>  /*
>   * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached()=
, these
>   * assertions should be made either under mmap_write_lock or when the ob=
ject
> diff --git a/mm/vma.h b/mm/vma.h
> index 3fc3b47a954b..05300badd70b 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -278,8 +278,7 @@ static inline pgoff_t vmg_end_pgoff(const struct vma_=
merge_struct *vmg)
>   */
>  static inline bool vma_has_anon_rmap(const struct vm_area_struct *vma)
>  {
> -       if (vma_is_attached(vma))
> -               vma_assert_stabilised(vma);
> +       vma_assert_stabilised(vma);
>         /* KCSAN gets confused about the optimistic check. Silence it. */
>         return data_race(vma->anon_vma);
>  }
>
> ---
> base-commit: 93d7a816a2df3e907e2719bd12b0073f1285fc5c
> change-id: 20261110-vma-fixup-debug-asserts-2d327fe27f8c
>
> Cheers,
> --
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
