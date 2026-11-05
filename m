Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793909248;
	b=Fv16aNmUfT/2LhWyNpte48Q3vL4tVYHIN54ts+RyasPDdlZu1axUuQZHoLYil3juutcA
	 wqw+Z2ToTSTZ5wxE/mfODCwi6fV/IJxF6qKvEOc+UL7kz9y4ItSbLPIb3uEBP7MzgyrfQ
	 5n/KGQw22aNrtH8kOCI7X/2QZWuHOsnULHfamJdBL8djgECjLplbA/OFXJyHbfiL84crY
	 qjxumsNgDgMz5oiAWrnuClHDtQv0uqgNkK0iOc+MEbELhralCPZ801Q0YDgEZDG9aDcpv
	 piZ/IvjleVG0Bs/Y45qDg4JcIvg6phuSrPUM/vTfmjepwU/3QqtAXLtwh8xRfIiOb3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909248;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=rlBVJT4GPajviox7GVvnaU/1fuJu0H3trSYA5DJJsWk=;
	b=4973ctJASvveNd82/jORKnDXuC/QowzQpnBv48cas3428y5bcT/e6GjjKjxTaUZU9+VF
	 PQYCcXFsQQUrv7NgrdnBMcMfjGQe007FRmxQGe/bLq0DqWzbZeKhO3QAA6pJcHTcZDsFt
	 ImLXzDLoGL0tITB3vIUNYUdJ5ZXIBEXC57C0fnpYcEEAViJsruWjjoN9+NdfC2afKyQtC
	 9DT2mBWYUDK8fKKeLSupxsUGNUVRJ6NYUJBFSpqwmVtD2XJ8e5a6J5PevxIwANuWKHghN
	 jDfmjTj4pj8s0cQKpf9YuqBO+AE+HhkFX4eGoX+wKQ9s3USOx6KKzlurwZs2Q9VFCYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XoYrWIet;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ee3ze1zY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22A0606EE8C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D22A0606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XoYrWIet;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ee3ze1zY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793909246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rlBVJT4GPajviox7GVvnaU/1fuJu0H3trSYA5DJJsWk=;
	b=XoYrWIetAiNx5SoNtKwVPFeR5BPdmBKMVGCJ9nP+V1pi8YgTUYlE1spbvigz5YtWKAZuxi
	RSVhM8PTwAcSEQ4u26BYWX+ipjJcE2B6CHTrAU10TzGpQgYTj0tdd/y3REVNoGi24TIUjw
	rNb1YsdSub8Ttg/93ejPYINGZPoNzYw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-WuJJ20yNPKijwVf1R6TaKQ-1; Thu, 05 Nov 2026 15:07:25 -0500
X-MC-Unique: WuJJ20yNPKijwVf1R6TaKQ-1
X-Mimecast-MFC-AGG-ID: WuJJ20yNPKijwVf1R6TaKQ_1793909244
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b18c67095dso34409407b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:07:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793909244; cv=none;
        d=google.com; s=arc-20260327;
        b=Z/NIbsG+TQUUtLhqI/cI+QiE50Ry9EejHhGH3vCwX1vIAE676R7FltFIjxXfq62zDL
         J7H4/nXgwF6esy+1yzlhqiiJV+S0b0MF5HHNh7GtJFYqqzjvsTkyRPVfvaI2f0rnVH+j
         NeSeka6Uob+36/Heh4mFT0Fdqia8hQbgcfBToYswVWRraLiqfMTGK/87ZPhJA3VhpFDK
         3vV7T2LBRwZnukeOgabuA4ZQKBAwICLH+yN4E1xes9JDJcqsAMkFkbesf9GJjqpOr7Yb
         JXZigvDNfjeRUNbmBE432eeFrWKcb3TO5eGz6BSR/zuS/TntVEnXOPrdLovpy60FtT03
         zqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rlBVJT4GPajviox7GVvnaU/1fuJu0H3trSYA5DJJsWk=;
        fh=DvxFaw2Hz+Zx8jEBsR+p9wlaQsHr3A8P8mhG9iIB5Tc=;
        b=l2fUESMMNzFVBWBmL+uJnO3TfDEYHI7LAGmzrWxIqnVOc1wR4Zj71XvNXdgsxRT0fz
         gdh585UoYjNF9zZixJ4TdQSyUNm+gR/3Suq7phqcr+iH2UEvLZxm7/wWq9b4J9W50ELR
         ZYMtU0pw+1fI3ViotMf4zUhgbEr2IAk2XQSTLQzIZF3Cn4VeW/JOv02L4u4mgAasUBAK
         xRCqZxobSU0CVClmQFjZl4ZuhKS5rKoT5f5iIqZm8l26VHVvFkvr1mNhETr0mPL8bGFp
         vS17AREUhyeP7icdJmDiVd9k8wXv9prpBb2IxgBKaki47Y997/ee8S3PbZfNmwjHvetA
         EcSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793909244; x=1794514044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlBVJT4GPajviox7GVvnaU/1fuJu0H3trSYA5DJJsWk=;
        b=Ee3ze1zYdT0eV/aiucR0vbiqgKfgzYyAowuWNKuIGfUqBuqooBsNxQq/X+ck/Y1B29
         /6gqlJPnos9NJtjx5Q5JC0WyJ5SsweOM/brXpxG67W//Q8+3q2xe8x5sBBf9NJKhPxo1
         9rBByQxaX5wn76ttWW3e35yJflZnZ0NegN1wEoqxg4ul+xbZcIpBbLJoU1uelwSweP62
         xvrQxMWvzVSZj/iweB5+94NQoLUmUkpTzVKPKKggd1Rwm5TWD2O9h9Qnv7mFhXjLJOO3
         AYV86KM9cZ/kRCKS5NavQzV0OxmY5i+MwMl1Kl3IC1NkWg9/3QRI0WR8JUix2h5w5iPQ
         QxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909244; x=1794514044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlBVJT4GPajviox7GVvnaU/1fuJu0H3trSYA5DJJsWk=;
        b=2tdMU6s1pvcz5LNu/nuw5qzZ7flpnARO+ZmIJ4YPQZL+UfvbXUBq2e9gkQYmS+M2tR
         INAFJt2800M1i+C+LI9AzqWPPVK96TriY0LkzM7rAPqy0HLQkuyI/nE0VFPOemCWKb2q
         D+0KtB7VePh5ya/Cy8xb4yqzwQQyvqaJH5tJLFPfAziCJ7u6YU66+2md0TJk3rb1NIbw
         dsC6RBe0pF3V4ppveeR9CLeCer4T0aD9lXVzgN4iA63t5PVTtINAnwUGJa3l3D+dmNS0
         jLiAkCRoghTuAU5ubjAL4/egAAGyDPcHajjy8xhG/3POVetKQXNpp+tGkwOX1L0du1/4
         tCzQ==
X-Forwarded-Encrypted: i=1; AL+hErFL0+6yR7MPOkZQDCCniQPu1+HihLGRI0vQk17KjWZMXTEOxBFUc5rjR1oQw/YJwwmXIwp3Kp+U+9xHxXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OWzPoGSgRu6Kfhyi//nbxh/2jHheMYFjdLP1J+llypkL5DiYl
	AjzqNrcQEs5foH/OeKkjtqxnoxOn8kGkpS350B2z3W/QFV/mfFDnln3e258kGYSMzPTD9YBhqMx
	td7YVwSy2ino6bYGTwAfKF+CB8q0cdGf057Jsze5nXVwDRZZLRd/51a1bRqoLx28deEjXFu4DmD
	YFMm2Y5huXtlsDvwm5XqKILjkazA798D0t6jxNOpeK
X-Gm-Gg: AYBFou3ECFhWDdIlLdT7h/w5RM+0WeZT3sZ9e29SjKqqXGP5K4gz53IrZUtMZxbZVfO
	K/NxlyfD+ceAEufLgwyQZHgU04m0+gYWXNJhAb63G6KiKUmJgYMZPl1Nl7bGvODW+Cqpqlp4PKQ
	j6Gvc1AOcIwN8aNumUkoqN/qLaVX428Q54Z5xaMBbg+aTQJ237i0Ur58X94lg6nvD1PxXeetq8X
	uOGMXdnGkXZu1g8hwnU+FvX0sYb7stFV2ipIOtuw38dgg==
X-Received: by 2002:a05:690c:c513:b0:8b1:368b:392f with SMTP id 00721157ae682-8b3419be4e8mr580267b3.49.1793909243409;
        Thu, 05 Nov 2026 12:07:23 -0800 (PST)
X-Received: by 2002:a05:690c:c513:b0:8b1:368b:392f with SMTP id
 00721157ae682-8b3419be4e8mr579957b3.49.1793909242884; Thu, 05 Nov 2026
 12:07:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103023804.8074-1-wuyiqing@cmss.chinamobile.com> <auo_CehOVzTMq6kc@dread>
In-Reply-To: <auo_CehOVzTMq6kc@dread>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 5 Nov 2026 21:07:11 +0100
X-Gm-Features: AclHuK_7bPPStvyJ7t0t9o12YGqSYrx1SyDLCxIY-DGoYpyY0de9k9HjzorVUGE
Message-ID: <CAHc6FU6aE1hdi4zsOgu6LUGJx6CE__PMwOfTY8KMccASRzzRaw@mail.gmail.com>
Subject: Re: [PATCH] iomap: allow writeback from kswapd again
To: Dave Chinner <dgc@kernel.org>
Cc: Yiqing Wu <wuyiqing@cmss.chinamobile.com>, Christian Brauner <brauner@kernel.org>, 
	gfs2@lists.linux.dev, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+5e659793378ad9e06387@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:17=E2=80=AFPM Dave Chinner <dgc@kernel.org> wrote:
> On Tue, Nov 03, 2026 at 10:38:04AM +0800, Yiqing Wu wrote:
> > Commit ff59f71f1c95 ("iomap: simplify writepages reclaim guard") remove=
d
> > the PF_KSWAPD exemption from the iomap_writepages() guard on the
> > assumption that kswapd can no longer reach filesystem writeback now
> > that pageout() returns PAGE_ACTIVATE for non-shmem, non-anon folios.
> > That assumption only covers the folio reclaim path.  kswapd can still
> > reach filesystem writeback through the inode shrinkers, and syzbot
> > reports exactly that on GFS2:
> >
> >   WARNING: (current->flags & PF_MEMALLOC) in iomap_writepages
> >   kswapd -> balance_pgdat -> shrink_node -> shrink_slab
> >   -> super_cache_scan -> prune_icache_sb -> evict
> >   -> gfs2_evict_inode -> evict_linked_inode -> gfs2_log_flush
> >   -> gfs2_ordered_write -> filemap_fdatawrite -> do_writepages
> >   -> gfs2_writepages -> iomap_writepages
>
> Oh, that's awful. Nothing should be calling into iomap_writepages
> from reclaim context.
>
> i.e. Doing data writeback from the inode cache shrinker is extremely
> suboptimal for many reasons, so I'd consider this a gfs2 bug, not an
> iomap issue. It's even worse when data writeback is being driven by
> an inode cache shrinker. I'm surprised that lockdep hasn't thrown a
> hissy-fit over this (i.e. inode locks taken in writeback appearing
> both above and below reclaim.
>
> This is the patch series that Jan Kara came up with to deal with
> these issues in inode eviction:
>
> https://lore.kernel.org/linux-fsdevel/20261009133253.20102-1-jack@suse.cz=
/
>
> This allows filesystems to defer inode eviction that might block
> (e.g. due to transaction reservations, journal commits, metadata
> read requirements, data writeback requirements, etc) to a context
> where the work is allowed to block and isn't running under memory
> reclaim context or restrictions.
>
> That patchset is needed for ext4, XFS alreayd does this, and it
> would seem that gfs2 needs it for glock reclaim....

Yes, Jan's deferred inode reclaim patch queue (plus a tiny gfs2 patch
on top) should take care of that.

I see that Jan wanted to send a v4 of this patch queue. Are there any
remaining serious problems?

> > Under memory pressure kswapd evicts GFS2 inodes whose glock is still
> > dirty, and gfs2_evict_inode() -> gfs2_log_flush() ->
> > gfs2_ordered_write() then writes back the ordered data of every inode
> > on sd_log_ordered.  This is long-standing, intentional behaviour: in
> > the default data=3Dordered mode GFS2 must flush dirty data before the
> > log commit that writes the metadata.
>
> It's also long standing, known broken behaviour w.r.t. shrinkers
> running in memory reclaim contexts.
>
> So, why doesn't this warning happen through the direct reclaim path?
> i.e.  what makes only kswapd trigger this?
>
> I see nothing that prevents direct reclaim doing inode eviction
> from triggering this same path through gfs2_evict_inode(). IOWs,
> direct reclaim should also be triggering the warning in
> iomap_writepages(), hence it is not clear to me why re-adding the
> kswapd guard is anything other than a band-aid over the broken code
> in gfs2....

It's also happening under direct reclaim. Here is an attempt at a fix
from before I was aware of Jan's patch queue that describes such a
scenario:

https://lore.kernel.org/gfs2/20260921211712.1563575-1-agruenba@redhat.com/

> > Writeback from kswapd has been
> > explicitly allowed since 2010, when the guard was still in XFS:
> > commit d4f7a5cbd544 ("xfs: allow writeback from kswapd"), because
> > the kswapd stack usage is low and it cannot deadlock on the
> > filesystem.
>
> No, that was a regression fix for turning off all writeback from
> reclaim in XFS as a 'what problems does stopping mm reclaim
> writeback actually cause' experiment. That was the first steps we
> took down the path to get rid of the problematic random dirty page
> writeback issues that memory reclaim had.
>
> IOWs, we didn't want to allow it, but we had to tolerate it because
> the MM behaviour was unfixable at the time. Now that the
> pageout()->.writepage() path for dirty filebacked page writeback is
> gone from the mm, we no longer have to tolerate this behaviour
> and so the guard got removed. It only took 15 years to get to this
> point....
>
> tl;dr: Writeback through iomap in memory reclaim context is -a bug-.
>
> > Beyond the noisy warning the new guard is actively harmful: it returns
> > -EIO on every hit (WARN_ON_ONCE only limits the report), while
> > gfs2_ordered_write() ignores the filemap_fdatawrite() return value, so
> > the log commit proceeds with metadata even though the ordered data was
> > never written, breaking the data-before-metadata ordering guarantee of
> > data=3Dordered mode.
>
> This is definitely a gfs2 bug - writeback can fail for -many-
> reasons, so ignoring IO submission failures when data integrity is
> required is a definitely filesystem bug.
>
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index d6e2f1ded5ca..324da0f5cb29 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -2082,7 +2082,7 @@ iomap_writepages(struct iomap_writepage_ctx *wpc)
> >        * Writeback from reclaim context should never happen except in t=
he case
> >        * of a VM regression so warn about it and refuse to write the da=
ta.
> >        */
> > -     if (WARN_ON_ONCE((current->flags & PF_MEMALLOC)))
> > +     if (WARN_ON_ONCE((current->flags & PF_MEMALLOC) && !current_is_ks=
wapd()))
> >               return -EIO;
>
> AFAICT, direct reclaim will still trigger this warning and the bad
> gfs2 behaviour, so I'm struggling to see this as anything other than
> shooting the messenger...
>
> Cheers,
>
> Dave.
> --
> Dave Chinner
> dgc@kernel.org

Thanks,
Andreas

