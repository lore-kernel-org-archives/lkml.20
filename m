Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C5408028
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670650; cv=none; b=AowlEnU+ns56nhw/0qaeYm2sE4FrHbEIFKkB/+oZ2BWg+TSs9bna215bIl/BG1JaSL82LF5zhTOmG4g3kGVxU+RyTNGQDiJpb5wDMqbgJRAsyhVoqVrZFMjPjqQzv74+55MpBxWkQKhYvntR2IjEWVuFr/eHCcG+LxtmDykvB8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670650; c=relaxed/simple;
	bh=Z8P8FwF3+RKeBLaiyl684Z30aGtxPN2PvQaGUVK2dzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnHZgo2kL+tm0ojQyLkaIQc0pnsCd9ZliTCXS/1h6jeocU9+hN3O4hRfWpVRpf6K8kpx96lhJ+DgUe0bbtsRaopP/Xk/8XHn7bi3+mU3md4RKGvfqclOi1anCETWCI8Z9lynXKrBr9iRkRdWxL01XwfNKSnzNYz0s94kO4Lc/Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBrREesW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBrREesW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so2200397f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790670647; x=1791275447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9l3xBeUfZcvuHoQo1mSle+mTZ9sk+73Aje40erUwh40=;
        b=LBrREesWG8QZPwduJV//Z534g1S/YK40F8+wxPchipoh+oJpPacJAevpuWs34KmsEl
         YcjydGMeoPbylY/1Yr36A5eJKG8bMLQIIoTLVAxYEKQBog6x97UPPtFovDIs7s8AqaXX
         u3z2r9Yv9jxCTEvxGncRj5fEnYDJlvY5xdrAC9Gp7uMh/Bs7YqxGd1Nd44phWMz9VzSO
         eViJERDlrewgoOoFEex1HeXx1DHPOJfA/g3q7iRvkajjuB8fWKHD/uQgPxXkEtrPHle5
         K5cddrMDKSm5C2q3hIrUf24FPq7ykaGZ2CJD/GkCE8DhgkFelcAzJfUVf64bhAyQRNtj
         0wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670647; x=1791275447;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9l3xBeUfZcvuHoQo1mSle+mTZ9sk+73Aje40erUwh40=;
        b=PF+IDNSNZ+pRyPZhnfsQbbsmHHXSxWN8pEAWCMYOVNPIr8ArP+jplTEc+PFLaWeDHp
         PjGMdR2exqErCS/J1jEPVhoYtcbDGH5sGbNfao5lDZ4Vv1LijKbWlhc+oubeT3MgAuFY
         xXd+s86Mr/dG5w/Q5PxfC8cGOmwClejka2N9HSuVWypZ4bOEkLZJqQDiXJp8nOhpzBXk
         plzc7CJioj+noIczhzo9L/63ZcVBW7vOeMMRaPIw5yrTAECtE+wc4GglFlfTR2tRZoEU
         mhmOX+2TSZUOLqhQOw2/rk8wp3F1lJuAdBqOxH7qx/zdJ2x2RC0GgM3LCyMlfhoL24R1
         8SqA==
X-Forwarded-Encrypted: i=1; AKwUvBxnlM4QvaiK3lgUSjNA+eHRtted0bMsH8R8+L58NDd8Od/M55mAt2RlScQEFJeHVaBlhLVAsk+iIjwb7mk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYL/2MUxGWX/U2dsYz6Rv6wnFGBUSGI1W9F8MDzKvVuvB02cxt
	75laRoWeE1rmLsN2IdoDz1NFOV004yUGnb329JtfOVDJSyTPtgb5lfW6
X-Gm-Gg: AYBFou0tbIO3LCI6QGVIJkzIMz0o4ehUslyBiRZfBT0iHLMEPKNvJhd+XHuQUYRenfE
	lYetPbnfnyRnDxrjaU/VTnmLSlU2cJWkMm2srXn44p9qGAsDbU1bp0XltEI7FOhGWRGpnIHN0iu
	2NtDuqH+GUbftVUHzUaHf6WOSQQFHFI+3FxklB2Ht0ofNXmLAG2IvOYfN1Wjb1FDkqjCSL2KPLi
	dDElhaxH7byFiNGbIRP9INqa+9QJkDFPNB9+y9GDmEcg0BiEfbz+uq/nUtYl0+pf9vZnjGihZrR
	dSF1kEhsxjIsVuBwI3IKo3FIVtjKJa3tvvE/7Vm7xTXNCobtd12NYxsS7AVNmcD2oAR/7D5nUs8
	Vqns/R6fL183ZSg+fKEba85eMbCwwJ6NcenrIv5zz4RoQ6pp/yWr4quagKOIeP71Hf+YVFBtGzT
	H5deMnv2y8R+iIFT2eb111tYqDvNZvrhg5U3KanLdI5orW8RovPQYpPkznq6Y=
X-Received: by 2002:a05:6000:616:b0:487:27f6:a4d9 with SMTP id ffacd0b85a97d-488716b041dmr31201008f8f.41.1790670642082;
        Tue, 29 Sep 2026 01:30:42 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af508b13fsm1987719f8f.27.2026.09.29.01.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:30:41 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:30:39 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Park Tae-sun <ts930@dgu.ac.kr>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mlock: fix zero-length request normalization and
 integer overflows
Message-ID: <artu7tGV5yiwErx8@gmail.com>
References: <179066531783.50175.13377521828379196177@dgu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179066531783.50175.13377521828379196177@dgu.ac.kr>

On Tue, Sep 29, 2026 at 02:56:34PM +0900, Park Tae-sun wrote:
> mlock() and munlock() currently normalize the requested address range
> using:
>
>     len = PAGE_ALIGN(len + offset_in_page(start));
>     start &= PAGE_MASK;
>
> This performs multiple arithmetic operations on user-provided values
> without validating intermediate overflows.
>
> First, a zero-length request with an unaligned address is incorrectly
> converted into a non-zero page range. Because
> PAGE_ALIGN(offset_in_page(start)) rounds any non-zero offset up to a
> full page, a request such as mlock(0x1005, 0) falsely locks an entire
> 4KB page (or fails with ENOMEM if unmapped), and munlock(0x1005, 0)
> silently unlocks memory that should remain locked. Conversely, an
> aligned mlock(0x1000, 0) is a no-op. Zero-length behavior should be a
> consistent no-op regardless of address alignment.

I think can_do_mlock() runs before the early return, so mlock(addr, 0)
still returns EPERM in the RLIMIT_MEMLOCK=0 case without CAP_IPC_LOCK,
while munlock(addr, 0) returns 0. should the zero length check move above
it?

moving it up also changes the aligned case, mlock(0x1000, 0) goes from
EPERM to 0 for such a task, so that is a uapi change and the changelog
should say so.

> Second, a sufficiently large length wraps around to zero during page
> alignment (e.g., len = ULONG_MAX). Because PAGE_ALIGN(x) is defined as:
>
>     (((x) + PAGE_SIZE - 1) & PAGE_MASK)
>
> when len is close to ULONG_MAX, adding (PAGE_SIZE - 1) wraps around:
> on a 64-bit system with 4KB pages, ULONG_MAX + 4095 wraps to 4094, and
> masking with PAGE_MASK clears the lower 12 bits, producing 0.
> When len becomes 0, the subsequent check in apply_vma_lock_flags():
>
>     end = start + len;
>     if (end == start)
>         return 0;
>
> evaluates to true and immediately returns 0 (success) without locking or
> unlocking the requested memory range. Similar wrap-around issues have
> previously been addressed in mincore() and madvise() by checking for
> zero length after PAGE_ALIGN().

I could not find that check in mincore. as far as I can see it avoids
PAGE_ALIGN rather than looking at the result for zero. madvise's
check_input_range() in mm/madvise.c looks like the one that does what you
describe, and there a zero length is a no op. am I reading that wrong?

> Finally, address addition overflow (start + len < start) is currently
> detected only inside apply_vma_lock_flags(), after mmap_write_lock has
> already been acquired and memlock rlimits checked, improperly returning
> -ENOMEM instead of -EINVAL. Per POSIX.1-2024 and man 2 mlock, arithmetic
> overflow of the requested range represents an invalid argument and must
> fail with -EINVAL before modifying VMAs or acquiring locks. Note that
> apply_vma_lock_flags() already contains:
>
>     if (end < start)
>         return -EINVAL;
>
> but this was obscured because rlimit accounting preceded it.

I think the errno also depends on the capability today, ENOMEM without
CAP_IPC_LOCK and EINVAL with it, so maybe the changelog should say that.

I also wonder if the wrap around part should be its own patch. the
silent success goes back to at least 2.6.12, so there is no commit to
point a Fixes tag at, but it looks like a bug, and the zero length
change is a separate behavior change that should not ride along with
it. a Cc stable would be reasonable for that part. if there is a POSIX
reference saying zero length is a valid no op it would help, or a
statement that POSIX leaves it unspecified, since EINVAL would be the
other defensible answer.

a test would help for that, len 0 with aligned and unaligned start,
ULONG_MAX, and a start plus len overflow, with and without CAP_IPC_LOCK,
without it the errno matrix can regress quietly.

the rest of the helper looked fine to me.

> Introduce a common check_mlock_range() helper to:
> 1. Return 0 immediately for zero-length requests without taking mmap_lock.
> 2. Validate intermediate and final arithmetic additions using
>    check_add_overflow().
> 3. Reject lengths that wrap to zero under PAGE_ALIGN() with -EINVAL.
> 4. Detect start + len address overflow before taking mmap_write_lock.

--
cheers,
jose a. p-a
