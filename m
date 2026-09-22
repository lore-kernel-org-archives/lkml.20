Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C3252189D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111019; cv=pass; b=FICK7PcASD1EpnBa7ARzQoZ4hplwD0xeOEka1h8Te0zoC5osMW9vCRsfUXKM4KFJklfK7uCgkI4Ny0+tAa/WzKSj8FebJgq/8R08mf+bFbmlyF58747ynJ4SmfJs2nH4eVs6v7ryokudl0cA6H9At/lMwUf9ervbKunXWlxqAn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111019; c=relaxed/simple;
	bh=5IbK02aVWuNGcjMJMx4N0CYmrJh7zKKaC7qacI8cBYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7GXJoyDKA7ASMD55CKfw3VAAqEJZ1CPoz1YgKfj8xZfC+eYUsUGQUpJi9vCGFO3TRCk6L5lrs4A9KP1D01i+IXhG2w1nclJwkqv8F3lPH97cu3MMpKjqh/Tg9784zctezPvrkVPjIgyTFnIkQneFrXTaPVHm3Xx4QYK9HqMy2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVIaBtMm; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVIaBtMm"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4be07e7c54dso240648b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790111001; cv=none;
        d=google.com; s=arc-20260327;
        b=K8vP5pn+5d3T20Y9NDUecAimQ3JxqTm6FeZ4IbxTBVTPdhzkoLYuzHjaMh2ih84TJK
         igbP92uy9dLt+x+H0xWBKPq2MPAxmWzsu3HaV/1J++gmNE9oHl90m1y1n9DsCFR527nw
         iEz0xdMISDXxtiwKZ+oOJlLfKZljhktkYfKuwbh1kCzH+KhiMe1KVEyQF0Kvj1drj0NI
         MI+3/MtjqhOO0Mc6IUUkluRmY5owERAdCgrBZ753J1hQOHtH6353eFUXLluSBmhdZhvs
         SmMPYyZ0ijnWjysPyd5GIHkv8CnkFOnL9F65ASTumNQKsDsYPaIx86XU6K+Gjijk8yus
         rnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LcKMyE1/7kAEM6RrLqfWaO/Qpmd5bxvlGWaVkcDKx5Q=;
        fh=Cagi2OhUumNeLPpBoBoRWRStEotOo/fIp0HY+VXJmvQ=;
        b=Q5ZHO1AOVD5duHfgwtZWWUbZQ/qSxvovwJ7IU0hh5FOswMDj+FJs7Uidp8S+HrZLgK
         YMgwvwJVcWbC01N4ZOObmsU7O9x75Yg1peQyGWgtyoxQnYnDIqw/1pK/tEYfnizTr9A0
         hp87CxPFXg+EV2ZAYyFbZSevTXHyFhatdUhI7Wu80D870fG9dNL/QDIyXoZtQZ6Z98rO
         /ftT2ZstZh9cxRPvBCvOPImDwuvG67bDS/dsgwa1t1eq2uq2usJxgAq7AuQ843lkMerm
         F71EJQf+7PsTyRJ7E7ncJnlIia6dHyPCjDBwhDxjtCLUu/fzR79aaY1QRyBFCNDMxJtk
         D5Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111001; x=1790715801; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcKMyE1/7kAEM6RrLqfWaO/Qpmd5bxvlGWaVkcDKx5Q=;
        b=AVIaBtMmqq3hZguc9Yzp+VOZYwfB8vxU7+p1wIp8xtF1FeuOm6mZWTPDhH0a0LKOev
         LOhP6zv/o0a/Q7bUkqL8Bt+q8TxOsTJ1QZ2ApVEEqvf2S0SYCXz4uG3KCNFFa9awqCvR
         /2v2yy15bNpYvEIxwga5UnyCnphJ//r7wWTw3j20dKeNodAo+c3aPHIyZy/Qopi6ayJj
         +hetf9Cr8zL7md2s5+iPxRmO8So0Gj+UV+uXpvxPQmSTc0sjCaWqD9VIAsWbgavwmgd4
         IncGfz4cua2ev4Xagi/eU5BaaqsKFVU8rfAI1OAZqSTGU/BAFWOWuo99Y42yczpfjA18
         UYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111001; x=1790715801;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LcKMyE1/7kAEM6RrLqfWaO/Qpmd5bxvlGWaVkcDKx5Q=;
        b=INxEozBNBdCDioJ4i6t7nP6iPcXOULiIOjIGtJF5Cy49Enx+fQrDxhbwwkahStzMlB
         rzI+mOx39IP1k2x9YKJXLGExX/ztfki0jJOqy0IWG0FJUD9rYrvSqWeiiQ6TRIPA9tfh
         K0JDWcBBHgXbX1Tux3bSqlrvXh1PywMzB7ZWptp0/z7D+HMc7+nRJf+B0VOK7zH9zR91
         SHdrlY27xD/P7mLcCmolniBJWvDkmLeSoj/IgjS/MzzDj9CDyyr8Sud18ktYGaGXBcJE
         054qWbvsPhC36OYbKoJiLCSZdxqWgSb8z/8ghF6PUATZU9lRSBqj9LYkyGLCcPZEQofp
         xwsw==
X-Forwarded-Encrypted: i=1; AKwUvBxPDSazvjigxlBHVjF7piF+8drTga4PSh3zigO7QZ1ZTwYWRRSzeM+FmNK0CHFGSvnhfCpG9CXwKO/Pv0U=@vger.kernel.org
X-Gm-Message-State: AFuF++kGrlkczKLwuG9CUcgfBWF20sTez/a92bErOrnNlHwdTuHR3NGz
	PVorqaKHmr2yhFYs7mhohTNb/N2MvLRtC/fidmqaYw+x5nyXzlyd4GrQYe7fKS37+heNqLOP/SF
	+zj0GLIGhAYdeZga5lNBvVorRn+/XG4E=
X-Gm-Gg: AYBFou2mfwZYbOJHpBPXyxjh3DUuOzKuxYmEGaSi6jKDJ4cf6xmn3ec4D2TxTrxICMI
	tC82IYmnpYLR5g/r+X+HnZotTGOCVD2w0C54b1XFh/iHSZDEdnclDTHdLPGtv1DsktH2zK/C2TI
	tVNXkgdZrpKKkixdwLbGFddckoLDSG1B10EcH9rKAtV6FbFCxpRdV/S5gV5tMbBvSyU2JpMKx9o
	xX0uHJc5hXycJIHXeb6oNx26OeL+UNHxLPETKnYOiIZr6i8Ncb41JV3Oc2mzvUbiDhoowzIEV17
	KCFDfPio9Li7agMfjnmemGKJn/pfBmI9eTcTNxClO01qayGqdRrEnPEG4cwdecpM2Qv+DujU90I
	nfnCIaXr+oA==
X-Received: by 2002:a05:6808:c106:b0:4ca:9850:4dd8 with SMTP id
 5614622812f47-4d436d8e804mr3181835b6e.10.1790111001332; Tue, 22 Sep 2026
 14:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920155002.1030454-1-devnexen@gmail.com> <fe49c311-582b-4ee2-8d17-42a758351570@linux.alibaba.com>
In-Reply-To: <fe49c311-582b-4ee2-8d17-42a758351570@linux.alibaba.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 22 Sep 2026 22:03:10 +0100
X-Gm-Features: AcwNN1XIGHxWY5dID-_5rqbKWq1Z-2duakHAem6OMx1JH4ihQ024QoNlPXf6f4w
Message-ID: <CA+XhMqy_0UPL5HfPYhPHeJ-ZngG4DRzme_a32sLSYd2VGSjo3g@mail.gmail.com>
Subject: Re: [PATCH] mm/shmem: don't release a swapin-error marker as a swap entry
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	kasong@tencent.com, bhe@redhat.com, chrisl@kernel.org, baohua@kernel.org, 
	nphamcs@gmail.com, shikemeng@huaweicloud.com, hughd@google.com, 
	syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 03:45, Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 9/20/26 11:50 PM, David Carlier wrote:
> > A failed shmem swapin frees the swap slot and leaves a PTE_MARKER_POISONED
> > entry in the page cache. On truncate or eviction shmem_free_swap() passes
> > that marker to swap_put_entries_direct(), which warns because it is not a
> > swap entry. There is nothing left to release either way.
> >
> > Skip the release for non-swap entries, as every other caller already does.
> >
> > Reported-by: syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=23b25ba3c6bf971f9c57
> > Fixes: ac2d3268284b ("mm/swapfile.c: remove the unneeded checking")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> >   mm/shmem.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index b572c60f2af8..94f2c59c8cfc 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -1184,6 +1184,7 @@ static long shmem_free_swap(struct address_space *mapping,
> >                           pgoff_t index, pgoff_t end, void *radswap)
> >   {
> >       XA_STATE(xas, &mapping->i_pages, index);
> > +     const softleaf_t swp = radix_to_swp_entry(radswap);
> >       unsigned int nr_pages = 0;
> >       pgoff_t base;
> >       void *entry;
> > @@ -1200,8 +1201,9 @@ static long shmem_free_swap(struct address_space *mapping,
> >       }
> >       xas_unlock_irq(&xas);
> >
> > -     if (nr_pages)
> > -             swap_put_entries_direct(radix_to_swp_entry(radswap), nr_pages);
> > +     /* A swapin-error marker holds no swap slot, so just drop it. */
> > +     if (nr_pages && softleaf_is_swap(swp))
> > +             swap_put_entries_direct(swp, nr_pages);
> >
> >       return nr_pages;
> >   }
>
> Makes sense to me.
>
> But another issue caught my eye. Since we already call
> shmem_recalc_inode() to decrement 'info->swapped' when handling poisoned
> entries in shmem_set_folio_swapin_error(), shmem_free_swap() still
> returning 'nr_pages' for poisoned entries would cause a second call to
> shmem_recalc_inode(inode, 0, -nr_swaps_freed), thus triggerring
> WARN_ON(i_blocks) in shmem_evict_inode().
>
> I'm not sure if you've observed this warning. IIUC, shmem_free_swap()
> should return 0 for poisoned entries.

Hi Baolin,

Thanks for the review.

I think returning nr_pages is needed. shmem_set_folio_swapin_error()
decrements both alloced and swapped, so shmem_recalc_inode() sees
nothing freed and the block stays accounted. The second decrement in
shmem_undo_range() is what finally releases it. Returning 0 there
would leave i_blocks non-zero at evict time.

Cheers
