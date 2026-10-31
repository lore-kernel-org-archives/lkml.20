Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793426113;
	b=dj8wfhFOkJ4o09v5BGeV/i5e9wQZ7hsuv2yaKAFo/p17lwZ2Y669kkHzsSQsBdEHfR4N
	 te5uuIo39vqmVcJ5U35CgTzjioFs/ZTGLlkHu5vaj7NEnDXkybg3RIJfm6uXQUBXpXFvw
	 ZDXdbouwe/5SP4xUe1CC3mFrvqxFyVoltdlkSTgwvTksLusIttG70y0u4kAntVcKorbix
	 wzuLyCndhxAR3itBXjD7O3mPzzMSpXRyfDu/v87lKsfwTnNhiNwpvNrVrA49zNIaM4nhT
	 tYBkgghOfJ3YNPfMCLtI47dTydCO3yr7/gzubpW2cTJ6M8gtmF+iEre8iDpM10Zx3qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793426113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mK4CIiWiVxpLggdWj3AZATJbmi8Y5VPf+YWX8QjFhvA=;
	b=I4wyqBJggJFglj+gsJoO9Us7nmlfnb5uAAJtE9zjH/FEaTw/oApof9Yk65jMGfzj89Tx
	 Nuej1aXlPVaht9oi50cKe2qd9t9hrlMwtGTfIAckmSvBp2srYzjZeF8HWjSNnWH+cYsv5
	 L7/iUVmdrTJd3SRTxpp8l0F6Xuv2Ua2zi9nxfF9PoZHOnAKStCKfCe+CGvBmZ3NSHj1ox
	 M2bcgQ9CmBFqBwswG73mH+620YhRQcI0sxyYro7iKWs5lR8i3MINNafZ9YzwLSDs2aikD
	 /HqyUz9txJxbLIiyYv0hS3VQzz9l2jq4ugHdH1mxqSpz6kAqEcsdNXUBEfDDDMbhVJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="urPdt/Du";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54A606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE54A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urPdt/Du
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so2018744a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793426111; cv=none;
        d=google.com; s=arc-20260327;
        b=RoxQVFlwKc1Rxl94QSR1FGPuDltDLEHcbiZfLfVDbdBrWtZGHAsUwK3eBCcZURSn/+
         ZbuB0L9Hr7YEprS/iFjcDh9/yAM0FwPWDIVIwjoirySxamJYwQSPI8+j68Qc2BouhFSy
         qa3CFlrnIFXXHiuBMK1f/2yivtChSub7Q7LYUIHyCpk7TcfWs46y7mZAQECfJ0fF/0h7
         ZIxcM/0vD5nGDqZVyOeMUB6FxCeWCZzrB2nKUdEQw22ftnF1fcpQsaNECPYSb3zbkya3
         /LI6HclKQdZa8dtIdfh/RnZI7MPFb0kspXMoGbi9sG++KYeqjW2m5W3ceP3oshUg0vpF
         x+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mK4CIiWiVxpLggdWj3AZATJbmi8Y5VPf+YWX8QjFhvA=;
        fh=o3yb8WoMWjB2Tm5d2eRWgeF0fotfLkg3V6UcgZijxxo=;
        b=bnAnfKb01pLgkJjJBu5BKMZgowqPayCwhh2ysOWXqyTKGbMEsEb5JMw43yc/bkwEsG
         E5uiPDKk8/GHFWkS+/NtjwB5GOdjfT9IUEGtySydmwLvGcT1156+gyZLvTpN5+nRJ8Rj
         9t5TkiZUlAieHONgVvrjLTE9KB6pjDKXEi9ZvxXf9FMkMQ10JJryxip+LPFVFqduulDG
         ZE8XdPyIcnYVnlMQESfaoGj7zqtp8vH160r+TqROBB4M8KYe7oJl0y0Clhu11GHCMt8w
         pBzmjwYOnYQ9bhPy9oue4n5jDHZBhUXlAMIHfbOPun5kdWhec6xQwu48N2duvbv/prZU
         PFEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793426111; x=1794030911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mK4CIiWiVxpLggdWj3AZATJbmi8Y5VPf+YWX8QjFhvA=;
        b=urPdt/Dus+RyVnLBTI2XTdiS8d8qF+cOZSfn28ZBE6GgJz7liH+foI4aJGnODLZa2H
         nnNTg11oajI9SCp4RhYWinsF/zPDh+QLTbZK5hivQmKaVh9qOfRJktGJusAnGtXvlC8z
         wr5A53tEr60a3Z7FNqcIExahUTUBL+b61F+4Fs4NTaRDCNX4x0cIPXq71eUppbXQYNmp
         v15buepgFFssGmImCXbFzYCxqDuf1OjBbKwvGpcteK/1ujDKRRsCD4CbWzw27QxPzv+/
         FvsjYjK/r+jCxldtNCSfS4oTcq68HfYu7jaG6FVXhE6LHDDe9VsdSyKin054+/AYWQ31
         qldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793426111; x=1794030911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mK4CIiWiVxpLggdWj3AZATJbmi8Y5VPf+YWX8QjFhvA=;
        b=Y66caPMBI///WW4vgJNhLVySQW3wfKmOZGcRzxCCIVaxOTlmWIxxTXSYMyb0pPouXy
         lRgA4xVUsy7Gw9QerCb1HWFICgIWGYOqdGlhWSnrFfsD3msofFETdjeBMWAQ78ZDrC14
         GiTMePDqk1YkSZr2eAW3vGbt+qFzROAg378vxgnu7oaJQdCTjfHm9F13ilpqKWLuKDfj
         BVs0E1oXW6esNbiHWhLKNFla9n85356Ov2KVDhoKQvD9dfDNwuuOWAVLc1Xy7bdagA15
         rfU+DaQzj871utBK2fl+ZfxIjCAcL7OJg0aD58KH5yvuA+Z4GEqBwHqQ2IaYcB6dWN4R
         gr8A==
X-Forwarded-Encrypted: i=1; AKwUvBxoOOjYi8R2ifY8SHjM4EofzeKvGUWmx1drIEDivVn3QHya6v0itGSSyJukegeFUAPxMMNYeM1G03TFfcQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaVxUcygvDsB6OMi8Nu4ynOPFedu8VMpV4zwzBXbmEmPsM6BA+
	5iIWY2RFzlvvmb6APojFV3zo4AjHbXFh8fJDGX14lU42VtZeQDfkMYTxD0DEdYA1UJIsh8w/N0f
	w5JP9DwSnxjQ2E8SkubL67EUHjyWirio=
X-Gm-Gg: AYBFou31175wCeGoSVcBq8gJ/G4Siy7zL06zm9Q0lHrKJRmix6Le5UxVLIVgycNKxvq
	MgMMrt/YnoEnMCWhWcQ4vlCRYa2kZ5P2Vam/uUahJPM1k5Knggqv0V+w05tzAWSVinkowa3tSH6
	f7m4dDBFG3IKpIgNUgzzmJNgFYjEsys4wMsgpu+EeZiORXQWlYSGx7gIffytrn9kyLUl8sx7l0B
	8Cz15eKua/gGeRXYujLrrt0tt4htWexCjSxlMl0muAxyCp5N89E/y7QAeU0TmIOBZgPdVZDUmmy
	E6/yU1fYIFi9sCjCyogS4G5gmq5xk+eioryQxU7J4m13Ms3XotiNmFq2YMZjFo1lfmHYqqa7BZz
	b1QqhecxZy9Kq4b4GG2djz9/XAI5HDwGV5uG7+Kxee1241JZpLr2Y9kUsaa0QrgkElcHkSA==
X-Received: by 2002:a17:906:2846:b0:c4c:bff4:200c with SMTP id
 a640c23a62f3a-c4cbff42ce4mr14178866b.32.1793426111172; Fri, 30 Oct 2026
 22:55:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-swapin-large-unmapped-v1-1-41e4ae378e6c@columbia.edu> <20261030155419.b10056c8fb37bc784b0d2778@linux-foundation.org>
In-Reply-To: <20261030155419.b10056c8fb37bc784b0d2778@linux-foundation.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 31 Oct 2026 13:54:34 +0800
X-Gm-Features: AclHuK_Tt59KRB7QsGGZXIHAqauNkBZQGJskNrhNJaJ3MGaw4y8I0GPZZ0wnfjU
Message-ID: <CAMgjq7AUvsHVKkHmLzL-KKf+MBed6e4TeVP7jcGMLM22xO+=5g@mail.gmail.com>
Subject: Re: [PATCH] mm/swapfile: drop a large unmapped swap-in folio in unuse_pte()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mani Tofigh <mt4022@columbia.edu>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 6:54=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 30 Oct 2026 15:11:56 -0400 Mani Tofigh <mt4022@columbia.edu> wrot=
e:
>
> > Since commit f1879e8a0c60 ("mm, swap: never bypass the swap cache even
> > for SWP_SYNCHRONOUS_IO"), a fault can read a swapped-out mTHP range int=
o
> > one large folio in the swap cache.  The folio only becomes anon once
> > do_swap_page() maps all of it, so if the faulting PTE changes in the
> > meantime the folio stays in the swap cache while not being mapped or
> > anon:
> >
> >   Task A (fault)                       Task B
> >   do_swap_page()
> >     /* swaps in large folio F */
> >                                        madvise(MADV_DONTNEED)
> >                                          /* zaps the faulting PTE */
> >     /* PTE changed (F not mapped) */
> >
> > swapoff then maps it, which marks all of its pages as mapped and
> > exclusive, and the next fault on one of the other PTEs crashes in
> > do_swap_page():
> >
> >   [    6.424485] kernel BUG at mm/memory.c:5195!
> >
> > ...
> >
> > do_swap_page() already drops such a folio from the swap cache when it
> > can't map all of it.  Do the same in unuse_pte() so that swapoff swaps
> > the entries in again.  With the fix, nothing is reported.
> >
> > This bug was identified and confirmed with the help of a deterministic
> > hypervisor currently under development.  The C reproducer below however
> > hits it within a second.
> >
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -2518,6 +2518,18 @@ static int unuse_pte(struct vm_area_struct *vma,=
 pmd_t *pmd,
> >       if (!folio_matches_swap_entry(folio, entry))
> >               return 0;
> >
> > +     /*
> > +      * A large folio that is not anon yet was swapped in by a page fa=
ult
> > +      * that did not map it (yet). It can only be mapped as a whole, b=
y
> > +      * do_swap_page(). Drop it from the swap cache and swap in small
> > +      * folios instead.
> > +      */
> > +     if (unlikely(folio_test_large(folio) && !folio_test_anon(folio)))=
 {
> > +             if (!WARN_ON_ONCE(folio_test_dirty(folio)))
> > +                     swap_cache_del_folio(folio);
> > +             return 0;
> > +     }
>
> Let's not WARN here.  If it hits and someone reports it, what do we
> tell them?  "uh, that's working as designed, no action needed".

I think we better keep it, a dirty folio in the swap cache must not be
dropped directly or it can lose data: the copy on the swap device is stale,
so a later swapin of a shared entry reads that stale copy back. If it
triggers it means somewhere forgot to write back a dirty folio properly.

We may generalize this check into the swap cache helper though,
something like:

WARN_ON_ONCE(folio_swapped(folio) && folio_test_dirty(folio));

There are some special users so it's kept out side.

> Also, won't this change cause try_to_unuse() to keep spinning away until
> someone kills it?  Might be better to return -EBUSY and fail the
> swapoff?

It seems fine? The folio is removed from the swap cache, so the next pass
will go on. But you're right about the dirty and WARN case, it spins, so
maybe:

   if (unlikely(folio_test_large(folio) && !folio_test_anon(folio))) {
      if (WARN_ON_ONCE(folio_test_dirty(folio)))
         return -EBUSY;
      swap_cache_del_folio(folio);
      return 0;
   }

We won't run into this unless there are some other bugs I think.
