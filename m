Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2231E858
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359625; cv=pass; b=d4gSMzcLAZYutzvfxBYKnlLZzoOJxAAOUI46dRnwIEVjsIeyuFFA1iekHCprNIqu6zU7Dme6sl6Xzl/w2g/6MQ1n9lGfGI8jsZsPoZ7dy90uCrJOZi5bOL3xslAb6AHAuUbzV6DufZohmEMiLmfTgl00yBFBExRSZZcvJMZRI2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359625; c=relaxed/simple;
	bh=gXGQ1PRnced6t6nD7RpTlC1VJv+UpeMU37rVlCwhA/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1+m8mACPkgGGpYVonExxtPW8Mzk1KQ8/5X1j0RHOtAc/MsqoGAQTX4htKKVpTPfpe3L5Sbci4E4iQfYZJbuFZxasQRiMqA1uIyK/ILa/uNU5p4+owWlJv537BRakRv2fFwtHEAJ+FxhtQDP4slj0IgUJRmbmtiTE0/c54U3QM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwNNtAdu; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwNNtAdu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49954b88fffso8502985e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788359622; cv=none;
        d=google.com; s=arc-20260327;
        b=MAZCUgLWVu0v0KvfxhDusLanjaY7+xdZOw5Sm1WqjkHrNm/RRfGi60Qk9gTBGHc6+1
         SCib4Tu3d86X+wCuDsvc4k5qKWOpyyHfzSQUPNKq/mSWiFHfANI2ujmtKGMpca5S4zz0
         XfbwtryiBaCcXOIZ6nztZkhGLBgnRyttXMae9CRtB7kRETNnqbShEz8xXsksQKENmOav
         hlhGAwED8SWgA4fu4RMcHUPV5MIZR1nA7Q1tDkyf+i+sm5GqmT6R3p2XzkRIqHomUPSV
         TQKmZkyd62Ua0qfym/edFOXTMUdklH9FbO/rZkm7Zw2PVdHstbU2gR7gMJKUWXcmI812
         RZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gqyxGctT5FdtxpqEQF1rjk19nIvIrXbfFFAKolYzW0I=;
        fh=s7jNEtQfLDx14obw+50UnPl25UXFrLJCqQwQP9o1rco=;
        b=WTzFbpcxX/ui+4GBL8V3nozBcrlC5QdpXTH9emt/myCEAS1lI2kPTRhu+Aw5ejUgDh
         VAnWb9O3Zi5JATHXzDUbEKErF+QO0m7rwWyF1J5yDOW1VX6wT0rOAYK5yOku9UB+6ChJ
         Q+FHtOLzwsilZLJukcKilICHr5WxhDNiADoB5JbYgy2LcjCCIPb4iwFlhpHQ2FZhE8We
         WkZ+u7Zq/Gv839x61+DwpYhz4Eey0zJqyuSLJ8RUNhDulYwQ6SghA28SHPkAJGEUKuKJ
         wsHL499IYZnRUXgPOPxUkw/PpAlxUXrS9mn13ofkN5vxeUQgfM+4uKUJTdSKlmv3g2vi
         1uDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359622; x=1788964422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gqyxGctT5FdtxpqEQF1rjk19nIvIrXbfFFAKolYzW0I=;
        b=kwNNtAdu2dO777SeUI041pgin0PiZo9trVtmoZFslEbEzBc8tfX+55o86T91DXqN94
         Rri91fU0CjiaR8lodQykzEEkT9w/HQHHd4eMezLwrOy+rewvpL+ti7sv8oaB7Xs3ztqD
         1DdEd7lKc43zd4tfvbXkuPohEXDEEG760SuDnwe+Nw/APZUdehGtlQTDkagFR8VEutqU
         UZFDEH2QOYZKd5HPBwx5onR4tZQKmppZRq8UkplEg5PUTqXxLeDZM/KG+OZkDvw5aJLl
         oJyfH717DbGNjnETZ7+vUnO+9Mfp5PmoQFD37Q+QbKXReJaULRO10Gvtzv0FP33iQmoP
         POhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359622; x=1788964422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqyxGctT5FdtxpqEQF1rjk19nIvIrXbfFFAKolYzW0I=;
        b=M8PyS3SrNMuLx3k4sa4Aqm5Zza/G7QR0EPB+gxmD9pLBWCuoLbG+Vi5Zi3U4VHn/5a
         f4BsckLAmQMVI3IWqWAwHd6l0y7YqBzhLXQku7bX2RFmUSr1qsMbcu+330FWGPAu9dI3
         PqIOYAFg4OeaMv+Psy2lyoDiScUmUQb5brTyfHgt0YGBeLmROYYdyfNO+00mYSThg9nv
         RGjVlokhJmTtp+wZt09cd6fpf9diz3fwxcqbVbGG4U62fnsIs1sNDAcoHPXoY4A+6HnC
         gyvPTpzXPAaL7wQyvmcaMTacJwPfjo99upvIQDp+j5lDZRzzP+ZOI1tjnsUUqotcjbT3
         0/XQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2N81XzWbr+IEgy5KgFCdi3lashnrw1KfYy/rNv6LY2+cveYI0SFjq8hc1/nz5OSsQa1ik4AKkFWTHiRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kMtvxdaFSTLIHqc7YikMsE/0D8DbNkXLxNClME5mOqyPeXB8tJ
	B8Q/GgOeEpzJM97E33cX4GtJQrBgKc8eXYvS08R0Kz4ZBmBZspu5tHVc5Cgn7zCOvmDvTEzVZcV
	PB0+neLGV5tCx6GWh9hsZ5NEn8l1UHYA=
X-Gm-Gg: AR+sD100qjdYTtp6WPq6FLORqONyt1Me74iKxwo7gQZ5IPW4TFq/Fe5poPjvphNopyB
	g2usZ2ZZFD0uU4Xohraf8QMor9B5Q+74Pjgo0GR+o/76f6Nv0L7cjkqzpVq+N5J42kdIZmv1WS1
	c3E697Q4kEyD48DC1eJbqNXOXiBVzYfr8uF6/2gQD3oiJKk4FsKF9pMH23/DxLt2kYq52lmIjoI
	5kUw3bfq2gZmGaqZ+8JDe1ZgZakH35kXQcXHy5vM3giwDWqnZksO+U1+o6VN7Wo5A3YMKoWuIMk
	z7euSmq59xh+wFVlC9kaaK/QGJ6dUDsXZMrT1npqxo9zyZ59V2f0g/lgCJmL7jIynevSV3RdlIm
	75g==
X-Received: by 2002:a05:600c:621b:b0:499:dbae:86be with SMTP id
 5b1f17b1804b1-49ce58352ccmr109404795e9.14.1788359621781; Wed, 02 Sep 2026
 07:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
In-Reply-To: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 2 Sep 2026 10:33:30 -0400
X-Gm-Features: AcwNN1UFWiuIst1_M2Ly-qV46cbouLxe69zvYrfE_S4pNwJojMnhxWhVG9iKlpo
Message-ID: <CAKEwX=NNzX=sXdqPATrWw7cw7sdG-vOO5LqjH=JnV1YiZLO5MA@mail.gmail.com>
Subject: Re: [PATCH 00/16] xswap: extendable swap device backed by zswap
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 5:45=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> w=
rote:

Ah I think I used the wrong msg-id in my other response:

https://lore.kernel.org/all/CAKEwX=3DOW6M5n8u3L_oigD3Ffn_BcB2L7p=3DROfmJCxM=
KQFH7tXg@mail.gmail.com/

My bad. I'll recap my comments here for your convenience.

>
> xswap is an extendable swap device with no backing storage. Swapped-out
> pages live only in zswap, so the device wastes no disk space and its
> size is independent of any physical device.
>
> xswap decouples PTE swap entries from physical backing storage. The
> cluster_info array is backed by a sparse vmalloc (VM_SPARSE) area that is
> grown and shrunk on demand:
>
> - Grow: when cluster allocation runs out of free clusters and the device
>   is below its ceiling, more physical pages are mapped into the VM_SPARSE
>   area and their clusters are added to the free list.
>
> - Shrink: when contiguous free clusters accumulate at the tail of the
>   mapped range (tracked in O(1) via nr_free_tail), they are unmapped and
>   the backing pages freed.  Shrink is deferred to a workqueue to avoid
>   lock recursion.
>
> A per-device ceiling (nr_clusters) bounds growth and is adjustable at
> runtime via debugfs.
>
> Interface:
>
>   /sys/kernel/mm/xswap/create           write "<percent> [<prio>]" to
>                                         create a device; percent is a
>                                         percent of RAM (0 for the default=
),
>                                         prio is an optional swap priority
>                                         (default DEF_SWAP_PRIO)
>   /sys/kernel/mm/xswap/destroy          write a swap type to tear down
>                                         a device
>   /sys/kernel/debug/xswap/type<N>_cluster_limit
>                                         read/write the per-device
>                                         cluster ceiling
>
> Since xswap has no backing, swapped-out pages are stored compressed in
> zswap: physical writeout is skipped, and zswap writeback is disabled when
> every swapfile in the system is an xswap device.  xswap requires zswap, s=
o
> device creation is refused when zswap is unavailable.
>
> Naming:
> =3D=3D=3D=3D=3D=3D
> I'm going with "xswap" (the "x" for extendable/extension) rather than "vs=
wap".
> Chris suggested this name, and this aligns with the "VFS-like swap layers=
"
> direction Chris Li described in the first swap abstraction LPC talk
> (co-hosted with Yosry) the swap ops and the xswap extension interfaces in
> this series are moving toward exactly that. I don't have a strong prefere=
nce
> between xswap and vswap, so if reviewers object to the name, please comme=
nt.
>
> Note:
> =3D=3D=3D=3D=3D
> This patchset only build the base. On top of this, the subsequent core co=
de
> implementation of xswap writeback, rmap etc can be done more easily. E.g,=
 we
> only need add one field in struct swap_cluster_info to let xs_table point=
 to
> physical swap entry, or zswap entry etc. On top of this patchset, no need=
 to
> stir core data structure too much or introduce extra data structure.

It's functionally equivalent. I think it looks cleaner to separate
vswap-only bits into a vswap-only struct (technically saving 1 word
for the cluster that doesnt need it too).

That aside, how would writeback, rmap be simpler? The complexity comes
from the operations around it, not the actual vtable/xs_table
operations itself.


>
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -57,6 +57,9 @@ struct swap_cluster_info {
>         u8 order;
>         atomic_long_t __rcu *table;     /* Swap table entries, see mm/swa=
p_table.h */
>         unsigned int *extend_table;     /* For large swap count, protecte=
d by ci->lock */
> +#ifdef CONFIG_XSWAP
> +       unsigned long *xs_table;
> +#endif
>
> Testing (taken on qemu kvm guest with 8G memory):
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. enable zswap and create/destroy xswap device
> ~# echo 0 > /sys/kernel/mm/xswap/create
> -bash: echo: write error: Operation not supported
> ~# echo 1 > /sys/module/zswap/parameters/enabled
> ~# echo 0 > /sys/kernel/mm/xswap/create
> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap0 xswap 2.3G   0B   -1
> ~# echo 0 > /sys/kernel/mm/xswap/destroy
> ~# swapon
>
> 2. create xswap device and tune the zswap size
>
> ~# echo "50 10" > /sys/kernel/mm/xswap/create
> ~# echo 0 > /sys/kernel/mm/xswap/create
> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap0 xswap 3.9G   0B   10
> xswap1 xswap 2.3G   0B   -1
>
> ~# cat /sys/kernel/debug/xswap/type0_cluster_limit
> 1990
> ~# cat /sys/kernel/debug/xswap/type1_cluster_limit
> 1194
> ~# echo 2048 > /sys/kernel/debug/xswap/type0_cluster_limit
> ~# echo 2048 > /sys/kernel/debug/xswap/type1_cluster_limit
> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap0 xswap   4G   0B   10
> xswap1 xswap   4G   0B   -1
>
> 3. under heavy memory pressure tune swap size or destroy xswap device
>
> ~# stress-ng --vm 1 --vm-bytes 8G --vm-keep --timeout 120s &
>
> ~# echo 1024 > /sys/kernel/debug/xswap/type0_cluster_limit
> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap0 xswap   2G 2.6G   10
> xswap1 xswap   4G 182M   -1
> ~# echo 1024 > /sys/kernel/debug/xswap/type1_cluster_limit
> ~# swapon
> NAME   TYPE  SIZE   USED PRIO
> xswap0 xswap   2G   1.4G   10
> xswap1 xswap   2G 315.4M   -1
>
> ~# echo 0 > /sys/kernel/mm/xswap/destroy
> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap1 xswap   2G 1.1G   -1
>
> I tried create/destroy and grow/shrink xswap device under heavy
> memory pressure, all passed.

We have something that has performance benchmarks, including on a
real, production workload:

https://lore.kernel.org/all/20260825153238.2695446-1-nphamcs@gmail.com/

And somehow, we decide to implement a different data structures,
without concrete numbers to show that it is more efficient than xarray
(only intuitions)?

At the risk of sounding like a broken record - I have to ask: why
don't we land use case first, optimize later? Especially since, we
have data showing that performance is fairly close (better in some
aspects in fact), AND users who do not want to risk it still have the
old code and can do A/B testing before they decide to switch?

A lot of the complexity in this patch series comes from the fact that
you don't get a lot of what xarray gives you out of the box. Which is
fine for an optimization, but I don't see any A/B data to compare?
Doesn't that sound like pre-mature optimization?
