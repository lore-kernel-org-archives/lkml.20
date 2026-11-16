Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799726;
	b=gogRLqScJa62qdlErMVHYfVMlk4QWVLyGECEZWjawOdS2JwwrvoNg2iBb4rBRAIhkOV0
	 MxhsE5rRyCMEvcgAhjWP/ZC3fa6IUlq4PpuSC8k4qSDfOAIrFuizX8F8ICLEZiHjrKNHE
	 AZF+VTolmgD0upapFjpJU6MSruGMtC9RaxWaFAeCNpz4O8SjODIiYSLw8Ig/Ij2rxkE73
	 k3jJVbk3U6siEfgeBLyDH5snCdYbH0YcZMIOOYtOIGIXOWNLdiJwQ7NZVt0hXQt8JrdsE
	 DCrqdK+888Js/yjTIRoEGk4mowvqj576V7AlqZ7/O583Vpl7KAwpoSlEpnEKPj6Vzag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s5U00VX/qcVSmjL3I17CsWerlchOit9RVm28tV2i6Zg=;
	b=WTBCpZbeXhGZkNvok1ToyuLnmQ6RBTfmJOTWaugjQPrXYr5gWZC4uHTDMqlCLl4BrccO
	 FCcxCt63dl+1+ac5Y+Cco3Kfm6YuhlKlb5HWVQIJ/6bBnjJQH3pTK3blyWo1oU3gu7V3X
	 ZEK85AB+Z7m6OK62SCBqP75V2h2OYCAE/O8aKgD7Qz5nGq63gHaeWHAJ+VmIWFkZfHMov
	 UvQduRI5JkG8hufm2Db0PG0ZA/KTsRYRl0xFw7qvbqSYyrIr2sFuqU1Rg1NWBBSkrhTG4
	 vML7s3fT1FA+6PYxS3XkbBDuGl5RjancZ6/EUNhTxLcqNY571wmFttxxH4LsMxy7xsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYtwf9nh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D2606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E42D2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYtwf9nh
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c45551fa84eso576989466b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:28:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794799722; cv=none;
        d=google.com; s=arc-20260327;
        b=f2HXjcOv4XjZEHxShfDFwON2yQ491fKOwF9igymu2Y9kNHhsBiPQDyqKXTxS7IR3d8
         iGosdAvaR41VYFFA0xI6ItoBMiynhOMqbfkVVjf7QDf7t8bLH25OOrHK0MgVMF3gBmlh
         9BORhUxtFTYk4WssiKiWbS2guNWNfJuCjlQxmUbh1r5LsbUVHpwfrAF485UMmx2Qh1Ue
         q89ITmFNgyYhelECV2yW+9FXIxCbs0CTSYV0JMijrOxWsOJRV7G1jPip1OZOhU9sslT9
         jQW82n+3AT7ajeFuRL+Pq8Jl+/nHLDrClrxML2nEMC7EFDr11bGSnQQA/H2bSk9zegQk
         P4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5U00VX/qcVSmjL3I17CsWerlchOit9RVm28tV2i6Zg=;
        fh=jsJ5puW1zp+PDtaUpINGrJTQ/2aZtpl7cNEe6uhIWzA=;
        b=Pl8Tq4xMLNZdfacCRAlThlRWVMKv5UPZefaUUi6SgxVWIxvwTVI7jq9H3prTafaDv/
         dGCGbc/4KjAHCYdOubZp9TfmMbQ30p8FkGGpubczjA5UOKdMUlCFUUoPd0jIrNHFSQ5s
         cphq4T+lsUaSu7Nr7euFPeC+a4IZHaftOixl5vHILaac4Ku/XrxGmuT0OydMZAUM0GOn
         wVk3xBuU5tfvBkq2jx+xXcByRVJxrst3MUz4+DMNIztI80Uja3wBLGukPMpm8PlEM8XT
         wa/JOeqY1i1sig4mSgnKk1S05dfqYV9N0zNtEmgAGgKB1BvsYhlVaJo5F6DJzoccQ2IQ
         Ci7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794799722; x=1795404522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5U00VX/qcVSmjL3I17CsWerlchOit9RVm28tV2i6Zg=;
        b=bYtwf9nh6NUqC7JvBMMdM6hKGB0Jg8Z8LhD2f7PfqGHu6noOIuxzDNcCZZFEXkR4Ct
         P8Cu3wnK+ogMbpCIRbsteju6oRPetJPCv+sExxGFNETkFE5l3gOZcfkRunbR/L+8glSF
         542FEtManQbYCcFwY3kfSEWtC/Ca81tHoieoAb3VjtbU/dgn47RcRqpeZiCdT42P7r06
         SCSx1EMKQCkPUycWMd4lecGp19tGa5WkeU5JJtYs4oubZsWyYqYD9wdgkBZRYvkXC53n
         rvvK6yRlViG4c20NK/HURmqWS8R2Hl5xB8UmD/n5pYuEK1b6KG3Nx9mufV3JLzcNRNkQ
         hQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794799722; x=1795404522;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5U00VX/qcVSmjL3I17CsWerlchOit9RVm28tV2i6Zg=;
        b=SUNQSdFEKfHIyI21O2hIJbh2apciYppF+4eATGopg9sMxBwgm6JEBqpyRGVGAnF3aN
         Q+4gh6dx//P/RoJkYRNyaxpo5B9kKnDWtm5uat1vyG5hVxRZjBoM9o4qpDe2etj6/JJN
         JbuHBUTXMi2DXjWdDxqvjkXCJmzvQXw8VU44Q54QBPX0efa+umYieJQePwN/K4JsOg3i
         oLGeeMSX53KYjpcLRPQBtnCQXiWO/BcOMXqDTzFjmWPsZjofn+KQKTsRxtPmjvhagvhH
         ZS5rf3Jl3ihVIthdtXJOW7Az6etFibXXD3iCNGVy/igvvw5LSIWRCgJhh/RPjfqlHkxy
         1r4w==
X-Forwarded-Encrypted: i=1; AL+hErHFEeyqLngB2v6D4HdRMdq+ySjeK4graiRtcupKwFJ6DdXWotKlwgqncKrtbYgy7yzj8dbwu0UCiK2ccv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ro3jIoNhfvHc1m26Bhd2FwhiEknp7Tw4F+FjAkjg7tUdvI/KH
	570ykcNTQCBOllWnrfDOK1Pj0TFCki13eYwFycvHAZqQ4kquIZq7psyDdQg6PBy3klq3Xn3k1LP
	wPpMPfBdIR1hswJ14+3cf9VpmI0/kp9o=
X-Gm-Gg: AYBFou398YgGva1CGsNY/+g9/HZM/E8sRAT5W4GS6usm2Af8p2PrQFsgymr3UqmMadF
	rIFvdRvqkNgPKWaz54BF87L9159XOICn705MZZjMxkw2HW3OFyreBMhWmakB+N341otHp3FEOng
	mX19mcW6vsOxj4lTMSX4xRZ9iwBCO2a5NqYSZaZcWxrQjV0+A4iLNqNfadkxfF0+ggkWSstlsUw
	gsd5VmAT/yjCLFrb52+BFGvQ9yUIa0qYtAPi50dF+4LVAvY8GqWIs7EJz87+21Yaj1c4nf+k4CL
	ElZSRs18FO/N3hKV7SdKrRN2usDgjGE3qyZYjuUbBuhahEYWwhKhF18GlHDYvoSmId8i6CGqPM2
	fuhq8BUj8JdzEB/+TgOrPAy6JHVMlb9oUmzgW8M6P6H+AeLOupi4+Hp7AUPlddP507UvZ/g==
X-Received: by 2002:a17:907:2d89:b0:c46:8063:220c with SMTP id
 a640c23a62f3a-c5096398047mr695900066b.11.1794799722075; Sun, 15 Nov 2026
 19:28:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113020132.274013-1-hui.zhu@linux.dev> <a72af87a-0f10-4717-9d50-2d3480c32caf@linux.alibaba.com>
 <1c6137c0-297a-4993-b386-6e8a1824d8dc@linux.dev> <920ed3c0-42ee-4268-b8ac-45981645ae4b@linux.alibaba.com>
In-Reply-To: <920ed3c0-42ee-4268-b8ac-45981645ae4b@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 16 Nov 2026 11:28:05 +0800
X-Gm-Features: AclHuK9VrfjiTVFQsnwuS3MN9c8lYgnoiUB65bCJr7GRkF4PaqhwmwlukZVpQrk
Message-ID: <CAMgjq7BYb9XmQWrZn2+omY3B47-OckL4XvO_rCyf6D+qzCdzqw@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: yield the lru_lock earlier in fill/drain_evictable()
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:19=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
> On 11/13/26 11:08 AM, Hui Zhu wrote:
> >
> > 2026/11/13 10:50, Baolin Wang :
> >>
> >>
> >> On 11/13/26 10:01 AM, Hui Zhu wrote:
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
> >>> pending, or when the lock has waiters and the current hold has moved
> >>> at least MIN_LRU_BATCH folios; the caller restarts where it left off.
> >>> TIF_NEED_RESCHED can still be set with interrupts off: a remote
> >>> resched_curr() sets it directly in the target's thread_info. The
> >>> minimum batch avoids lock bouncing under sustained contention, while
> >>> a waiter now waits ~15us instead of ~1ms.
> >>>
> >>> This follows lru_gen_look_around() in this file, security/keys/gc.c
> >>> and jbd2_log_do_checkpoint(), and commit 6e9be217a3ce ("mm/mglru:
> >>> use a smaller batch for reclaim").
> >>>
> >>> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> >>> ---
> >>> Changlog:
> >>> v2:
> >>> Also yield on lock contention after a minimum batch (Kairui Song).
> >>>
> >>>   mm/vmscan.c | 10 ++++++++--
> >>>   1 file changed, 8 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/mm/vmscan.c b/mm/vmscan.c
> >>> index 6a1af9b92349..c1231925159f 100644
> >>> --- a/mm/vmscan.c
> >>> +++ b/mm/vmscan.c
> >>> @@ -5533,7 +5533,10 @@ static bool fill_evictable(struct lruvec *lruv=
ec)
> >>>               success =3D lru_gen_add_folio(lruvec, folio, !active);
> >>>               VM_WARN_ON_ONCE(!success);
> >>>   -            if (!--remaining)
> >>> +            /* stop early to shorten the irq-off section */
> >>> +            if (!--remaining || need_resched() ||
> >>> +                (MAX_LRU_BATCH - remaining >=3D MIN_LRU_BATCH &&
> >>> +                 spin_is_contended(&lruvec->lru_lock)))
> >>>                   return false;
> >>
> >> IIUC, Kairui's point[1] is to just drop the 'MAX_LRU_BATCH - remaining
> >> >=3D MIN_LRU_BATCH' condition, no?
> >>
> >> if (!--remaining || need_resched() || spin_is_contended(&lruvec-
> >> >lru_lock))

Right that's my point, we can keep the checking simpler.

> >>
> >> [1] https://lore.kernel.org/all/
> >> CAMgjq7CUMuNSdCXZ7_kDdo9+0BFvPNHuO=3Dmq=3Dct_Q5YUyyckvQ@mail.gmail.com=
/
> >
> > Not quite.  [1] was about the extra `moved` counter in the version
> > discussed on the v1 thread; Kairui was fine with the rest.  Since
> > `remaining` counts down from MAX_LRU_BATCH and one call is exactly one
> > lock hold, `MAX_LRU_BATCH - remaining` is the number of folios moved
> > in the current hold, so the condition is just `moved >=3D MIN_LRU_BATCH=
`
> > without the extra variable.
>
> If so, why not just set:
>
> int remaining =3D MIN_LRU_BATCH;

...

> fill_evictable()/drain_evictable() are really cold paths, I really don't
> see any practical impact from this. At least we (Alibaba) won't be
> dynamically switching MGLRU state in practice.

I'm not sure about this either, but if we want to reduce the lock
holding time for the cold patch, setting the batch directly to
MIN_LRU_BATCH seems cleaner. However, combining this with the newly
added checks, I'm unsure if we've become too aggressive, potentially
causing the switching process to take too long.
