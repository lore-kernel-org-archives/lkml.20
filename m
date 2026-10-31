Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793426108;
	b=wuOvZfdv74JSCaFIvnFga7VN05EZP0UAG8ijTBgfcIY0h4IlNesRJWcmFtgkjkF2Fwhf
	 3H0N8/b1lksMqTMtlNb+DhZrgUFJbUG/Fm+NNdApAnaANaPZ3xAbcJ4aAJc5Q3ONyVI8s
	 xzNBQdmXmYp+t3UAYRRdWHH5dgJvWDjF919+dZyyTa4W34P2BQVtIU7YEXU2PyYIAB5Ti
	 LUya8CYA8gOlTnx9Sd+3OsfIvMAxRDDhidUmlKggq2BvTwo+/DB4f295yw8GW/Wq6f/qL
	 WsRKBDEf/+m6t8Pe1DP67uCGJoXvKbmZieYxV9kJtIUuIkXH89Ya+pSipZYi9xxWSpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793426108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mCgjURrKo6HedSLNTmVowrdbKxaGNL1I2PpeVk6fWxc=;
	b=1SqxCY+DG8sSd6v4Fm0n5oidYMy76P8olYNBucSjEz8gaLgFNsfRO6woMCXzEqRZQuIl
	 MJo+pKYE8BXyS/UESrIKOyfdUp5m/eZtpIw8MsM96a/kKnLufO3WwcxMqVZdeR/oC1W0n
	 oIHS1M1e9wZ+Bwe3UM8+Ag82mAPaP89rk9fWGxkrJpKwwD7ntGNJ/VgC5IgQV44PojG80
	 7hA+o+ou+1xhypqfufsU36Rjn783kvU3Kcz72eoIsfRF/GH3fsZVc8foM8JxV1plKbUaJ
	 +xNpaWVJE91c2iFeUn01vF1J6xpzDjVnfbaebb2nI48WNzwMoFPURNwVPAXWlePEv8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xV7PJY0o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4D9606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA4D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xV7PJY0o
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b4e814214aso1151344a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793426106; cv=none;
        d=google.com; s=arc-20260327;
        b=GlJOC1yD0mqqkKtthQaMkCHjOa4DvVMpJqvJ3RiTg5RgH+5oXHO3A4d7Wd4xKvgjab
         S7UDZJ0LvMEydEAs2XhS9a7pgHDaKXl8TyIcj9bRQEP4DHGCrGtYdAjSuk7e0U7TuL/s
         9SEAVKD/pkd2DuAMO8/nz4QAtWSgoAjdxhSBNPhtSSJwcTxoLlDhwvHlJCNDOeW6gENp
         nO4EuXN4P7hIL9AytmnZW3KPUhMOO7p8IjcZt8SbLHH7MVTdnVCOyMZthiwuZDN8k58J
         zIRd/pw2EmfnFzXZzD/7vLQr2dljbvJVKHoyhxX12Zw/FnclEzxi7qwa0JVvHTYsz7cM
         Y8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCgjURrKo6HedSLNTmVowrdbKxaGNL1I2PpeVk6fWxc=;
        fh=/2ELrNbRZfmU/QrbQ1EkPt7kNgnKD3wT4A1XLdV+7i0=;
        b=G4qFM7hPgbcMCqqxsBP6xMYvCINZ4fUc7ue5mfqazkyKPr9o6S3dtxwPXPBd9k3oFe
         tdt2imIgkNsqgv1TNwIHGsYNee0wVjNhxxONRbnH+Vb2D83ZRWNenVU5hGuwdRuBx9vt
         LV4+iPm6wjnZrXM6fcd6JxGzA4VQSczgnOL9gcQTOdx0f2zk2oUva6KGRnyiiZI1m/cl
         vlS4m1Xk+t3GqeU4kBh4cVh4jfIFaG8/YOGCMuBSGHNqiqdoQjux/uqGHpT8Km/ebdMn
         +qoHBlMS/YwlGeQFKvjbZqckGQEKk7lWjIIUWMNzy4yAzEzjTckHtahj+QSs3PqTaXhd
         CRvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793426106; x=1794030906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCgjURrKo6HedSLNTmVowrdbKxaGNL1I2PpeVk6fWxc=;
        b=xV7PJY0oSGo3+Jmw5WWOaPc0jhDEJMKkRV+2fYmDaQsyVjcNO2rT+mEUN8CPQGwZ+H
         SLvGGuMp5UAfvdn+TSsSNDMpC3NmqwB27qotDk8PQa+gO/e7Ho0aAkfftj2Pr4xi18Bw
         JX2i1FOODLAERxdXq4lYYCkEsIJKkSluqSNtB73P6ppguZRZ9aDrmFcz34t6VjlN2b9N
         8iuYGEdmx5wx1ud7ElRWy4zsm5l1riG9HFw3df7bGHTAbltFEhxj/K1Aj19iKRLb01p1
         /TvVbnnhJjmBC7gckFQrrelkB8mV4VAyPEA2V64ci+1wZs+/7a4pW7AEutEKtBOm/MwF
         FHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793426106; x=1794030906;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCgjURrKo6HedSLNTmVowrdbKxaGNL1I2PpeVk6fWxc=;
        b=1X0nOzZZ0Aj48hO/woHBuQB/f5YyqIzHPf75hxGFv2cPvOxe0FVQphZfzPQbcndoKG
         rZkIPkRMbEU3hIYVF/BDwegjhOM//RxwOVZk17wPz83dcfzhJU0Bn82g9uLIIu0cQryZ
         +shM+bRC2xDQFVCH/cqfmVG/WzuHEYIy0rwPAS6mcava5jM2e0BwiQHJQB2HqC7RH20B
         vX3m8KRUzQRkxP9hl3CF9/3SiRp7uFd+yjAGgd5vFrS/2LgxVbrK88mIh/0OAfnbz+DT
         epym2slrWt2DyZGK1tgxVx2yFwPLZBLpzu9BYcN7exUk9GSY2uEoxJIXcQIgQf279qTR
         XRuA==
X-Forwarded-Encrypted: i=1; AKwUvBwZCvIxXUaInCyJRyozGlRW3vVVNDVqijsvEmB+tW9CUCP1jNkYZZVxSgcWp9jEh/R/fp12/nE08NYqtrM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsOfW8TdC2PZZzhvmnMlIHX+9h7PKqAQ7MAbLkfU9LRgrOFTZa
	L08g5OcLEo5d/QNt6iIgJi/YdYrr7GXO2EnBbHidbLebrCSRb3DM54J8Xx0/bGq51emOVRkWynQ
	TbOxgqU8PEB7SJbh2OYe3VseeNWSfIgU=
X-Gm-Gg: AYBFou16zxlrmqeyESpz4BHF5BGBS/UdK8zQwE+DVLcTk19EcRlz4ZCuMgWHz/+923r
	IW7ur7h8vdbaZPJWgIDw+XnbS/TSTcGUOKUjIvmSwe+pFmkh7dWH5mmVss5neIxwBSa3CwT/5qx
	sK6AoIpDJtYCVJXX75rGpltWiWHmA4Q1JjpRV5vU/qbV2kiElOk7tqBj7NXGH6IuLEx40TDpDW1
	RoQYMeWyaCKmdcXPF9v/ozp55qJkOKgaqgwadZA9upW6ibNaba2otXdGEMBkWaZZ3nJDErpQLMS
	cBV419aOj7/5k9oO67WKCHV+wrrjO4DlvjtKpaBBAt6/+bhqSXDHncT+Yq40XzpEir4yFrB9QNX
	bFpGjxYdtIfky05vaQtPXqtKprDnxuMVjJgMfiERrH5gcAwt/VpxD4fUdzilkiMWh1CgbzcA=
X-Received: by 2002:a17:907:2d25:b0:c41:1e13:8896 with SMTP id
 a640c23a62f3a-c4ca7a7586fmr378054666b.28.1793426106050; Fri, 30 Oct 2026
 22:55:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-swapin-large-unmapped-v1-1-41e4ae378e6c@columbia.edu>
In-Reply-To: <20261030-swapin-large-unmapped-v1-1-41e4ae378e6c@columbia.edu>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 31 Oct 2026 13:54:29 +0800
X-Gm-Features: AclHuK-xDhrqISf5wq7z_z32la-j7uMJ_BSTSk-mqM8zIBPegNWP5UzqHeqNVC0
Message-ID: <CAMgjq7CwaE1Fmdz1Edm60HVyqSWWpFrUo0n5GZFdJoCZUbhKbA@mail.gmail.com>
Subject: Re: [PATCH] mm/swapfile: drop a large unmapped swap-in folio in unuse_pte()
To: mt4022@columbia.edu
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 3:12=E2=80=AFAM Mani Tofigh via B4 Relay
<devnull+mt4022.columbia.edu@kernel.org> wrote:
>
> From: Mani Tofigh <mt4022@columbia.edu>
>
> Since commit f1879e8a0c60 ("mm, swap: never bypass the swap cache even
> for SWP_SYNCHRONOUS_IO"), a fault can read a swapped-out mTHP range into
> one large folio in the swap cache.  The folio only becomes anon once
> do_swap_page() maps all of it, so if the faulting PTE changes in the
> meantime the folio stays in the swap cache while not being mapped or
> anon:
>
>   Task A (fault)                       Task B
>   do_swap_page()
>     /* swaps in large folio F */
>                                        madvise(MADV_DONTNEED)
>                                          /* zaps the faulting PTE */
>     /* PTE changed (F not mapped) */
>
> swapoff then maps it, which marks all of its pages as mapped and
> exclusive, and the next fault on one of the other PTEs crashes in
> do_swap_page():
>
>   [    6.424485] kernel BUG at mm/memory.c:5195!

So what's being triggered here is this right?
BUG_ON(folio_test_anon(folio) && PageAnonExclusive(page));

That check is a bit overkill to be a BUG I think, and we have been trying
to remove unnecessary kernel panics. Before f1879e8a0c60 we can occasionall=
y
see large folios got stuck in swap cache and partially mapped (e.g. failed
writeback, see activate_locked: in vmscan.c, much less likely but still
occurs from time to time), but the ones still referenced by swap PTEs don't
have PAE set so we are good.

Now the problem here is unuse_pte() calls folio_add_new_anon_rmap()
while only one sub PTE is mapped.  So yeah, that's a problem.
Still it doesn't have to panic the kernel though.

>   [    6.424503] Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
>   [    6.427654] CPU: 0 UID: 0 PID: 67 Comm: swapmthp Tainted: G        W=
            7.3.0-17087-gd865f2677c44 #1 PREEMPT
>   [    6.432665] RIP: 0010:do_swap_page+0x24eb/0x2fa0
>   [    6.451035] Call Trace:
>   [    6.451567]  <TASK>
>   [    6.453841]  __handle_mm_fault+0x13b5/0x3b40
>   [    6.458525]  handle_mm_fault+0x16f/0x480
>   [    6.461143]  do_user_addr_fault+0x312/0xa30
>   [    6.462044]  exc_page_fault+0x66/0xc0
>   [    6.462846]  asm_exc_page_fault+0x26/0x30
>   [    6.476708]  </TASK>
>
> do_swap_page() already drops such a folio from the swap cache when it
> can't map all of it.  Do the same in unuse_pte() so that swapoff swaps
> the entries in again.  With the fix, nothing is reported.
>
> This bug was identified and confirmed with the help of a deterministic
> hypervisor currently under development.  The C reproducer below however
> hits it within a second.

Great working catching this!

>
> Fixes: f1879e8a0c60 ("mm, swap: never bypass the swap cache even for SWP_=
SYNCHRONOUS_IO")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
> ---
> This conflicts in context with patch 41/47 of David's v2 series [1],
> which changes the line right below in unuse_pte() for KSM folios.  I
> can rebase on top of it once it's applied if needed.
>
> [1] https://lore.kernel.org/all/20261029-fixes_core-v2-41-a64ce7f83abb@ke=
rnel.org/
>
> Reproducer: https://github.com/manitofigh/files/blob/main/linux-repros/sw=
apmthp.c
> ---
>  mm/swapfile.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 189f04d8838f..b0b75ff16835 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2518,6 +2518,18 @@ static int unuse_pte(struct vm_area_struct *vma, p=
md_t *pmd,
>         if (!folio_matches_swap_entry(folio, entry))
>                 return 0;
>
> +       /*
> +        * A large folio that is not anon yet was swapped in by a page fa=
ult
> +        * that did not map it (yet). It can only be mapped as a whole, b=
y
> +        * do_swap_page(). Drop it from the swap cache and swap in small
> +        * folios instead.
> +        */
> +       if (unlikely(folio_test_large(folio) && !folio_test_anon(folio)))=
 {
> +               if (!WARN_ON_ONCE(folio_test_dirty(folio)))
> +                       swap_cache_del_folio(folio);
> +               return 0;
> +       }

Force dropping a large folio for any swapoff doesn't seems very
reasonable.. We really should reuse the common large swapin code between
unuse_pte and the ordinary fault processing code, and there has been quite
some patches just for unuse_pte just because its out of sync with
do_swap_page.

But, having this fix first and backport for stable looks good to me, clean
up and improvement can come later and I'm trying to properly split the
folios when the PTE backing it is partially gone during swapin, that seems
much more reasonable.

Introducing a helper to avoid code duplication from this fix is also a
good idea.
