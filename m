Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055862F0C7E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789200013; cv=pass; b=Ov7Tesnr2O9615C+fb2xp5UyTCxTNWqNEMIYhzfm5L6YatzuZ4zBb+ci+fZRts7vEt0IseUsPGQI2wXpGBOWPl6LL4X6jMdIPpwHlxoc66vZ+ozBz5DhfLk3dyDAtxMF3Z+Y7KNG8ZD/ALKNOPBemUzpJeqE4xgo2FkgzP+4xmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789200013; c=relaxed/simple;
	bh=lNG0pLZ+wo+cSF8I520AmAHE0RgBsp7COmnBBEQPkd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S63QiDZkfjxqdjJETU00u8JOZre7ZyqLP9GXPGEi6aiJ2SYsmcl/Q8qajpsZ1diOUS79ySWrheF7cyqcC24rRdulGUJa37VDM0oUKBRPHM1Lt4dAAxYn9iO6Yz4ez9TVL1TN7Rmpdj6rVHfogEcdWR+HdsqIylMEX8FvXxygCDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFH/0HFw; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFH/0HFw"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab20a33so259621d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789200011; cv=none;
        d=google.com; s=arc-20260327;
        b=X+DIMfb68AO5KvxvEfbQP8M40KSmgvejDhr3dOr8VIDZgSXEqrGlMbSlHIjhEcl6Cc
         ZEwkNal4vhmPzqLcxH/A+PhAtxLei7a4blnh3bJ9vtrBzLs5Gat/BgK937mE3rBHCTiZ
         a+4tjcM4ikmjjxqH5nabhKdBEMRp28f5cWwxaFqcSAGVmZiIN9AjlZrHmCY9DuA1EPGo
         Yy9ZPLZNDhkJEeV2R5cO/tc74b1Yq3/OX7izGCHuqDdNBfCsWdyKMccYTasGJ4vstyaN
         4E7KlxrTzHo9L6T6TkPPxl9KuW3oVpWnoWnySjm1u5GkiBQJ3Vcn/QFy5BMAKeeNKfA+
         KpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oTqbRJVt84EGCV9WE0vPswWimELlakVhJJBstpXzZFg=;
        fh=D/ZYvtPSoRzQuUymkTg1EnR+1YfPqesHoJyJPHS6T3k=;
        b=bvK3a+LMaL6Tuvm0jVNE4E6Tiz4+UJXE/kyfsj/Kwbs+85XF8TpS3xDlEOjx4D4GDU
         Jty4EFrDklkgU7fEmhME7tvfSxEox+sWUw6hIjqWf6DRBQrFFtccdHQ+yK06iCmRYfZN
         BZhJ46RE3LHPy0pXNmk2mI2g8Jzj+IXNzjTQZ83yck2CSR1VUlOf6vWRCEpDDDsDHQpP
         dhF/aMk3IpgwVirHvrx3XnLJvO6MA353nxWdOcJQz6q0LneArXbZH30wbaoRgw/EwJT2
         FMe2zX5H/3IvK3vQIufjKUOdrrW1+Am0KWY07FQfOIEM+pim+LDFHLZohsMMlStIaD/J
         oa4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789200011; x=1789804811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oTqbRJVt84EGCV9WE0vPswWimELlakVhJJBstpXzZFg=;
        b=ZFH/0HFw+8i/ggrjOtRoe4k2kiYd4pbjMxLqz/NTY8ENSbatfpAJ3Dj45ZNINTfNs2
         /Tta4FzQjPgKGncm4thb+J263GHpLpmiJbCstM2oC85n8HpJVl1UrIPPr5hHDWaqsXpS
         SWcD3aSm06rw5CgqAA7y+xk42M4ZXm/G6HQaTUExMLOrCp1X9bz6rozgzHbXQORrEQUM
         sYr2jvfAMonQn6Ofzy4ay9dXH/esRs6im854FsacGHqGnaroSqIZzywzjWnR4ROp+/EW
         6cOH6iEfAJ62QTZXZ+DLqeG1Y7S0uytoiFzEwrVCOgFh/xjHMJjpCOEtd/tdVWCsfnpv
         Atng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789200011; x=1789804811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTqbRJVt84EGCV9WE0vPswWimELlakVhJJBstpXzZFg=;
        b=Nb/Yy9IXmSamu6JWR6kRT1KHsIZzXsYqk+2VkxSAGhKdqnjnT8saXKHt8gOXUi9Mur
         kVLLwhCIs5d7p0z0p4zg24jQJv6WGSx7upW4lYvIVa4RRqIluL+oYpWZZcfagk9KjElZ
         S8Z5UV9OEqdNT5dyxPr3/ZY7AdCyfIg2yHfI1CTQwDa9fDpUHYeUSwFbfCRDVoWMtO45
         LxC7tdjc86DIaXBBioCTqkMXryeMDgqJXKe9xbeauv5z3UHzm2Ka3do8v88YUQpTemsv
         VphJDvBPbTFqXGxzDYVfCg2TQf4ianaXiuO+VCG3rzDfE1WDzQwRPotu8EPb2onhLXxO
         ezEA==
X-Forwarded-Encrypted: i=1; AKwUvBxGJgc18ZWVZj9NIYUNwia4T9EleQRTgdtEN6Q8ToVZaYZPCxnPu1Wqo/i0sqJ6qSjFkczIT9ko2S05oNs=@vger.kernel.org
X-Gm-Message-State: AFuF++kAdfgOUzoosqCY5v+59XSeTiwnzDoSGuGaR8+pen9JRBh3Lqj+
	MAOjo382sKCO4qgxQPz0lUw4q3mDkgw+7cR8RJbtPfxyNGKCv+5L5TB/v9BXeoVwRKocKAPDzoQ
	Fidm6n77i4UZcmdFh4LGo/Livzb9RoWA=
X-Gm-Gg: AYBFou2kMROsTWv6NuGdLyJlWpwXb8kQ2ZLpgUYt6G5TvzPWRpSAQkmDPvblCjybvIG
	ua5ZHpwXW3cR1bCaGfYzbCeY6T2gKle5BjjXHea/APh5OljAGglveBWRnB5ShFYVg0P8Qo2ukHt
	VWhXgcYpQ5NHuuX1wGzlpED9oDDCchL0LLIEQkx6d1mEogK+AMpzCD/bQFvk4v3JfZkURyD3jiR
	C6BWcLvJNuI0jkywFnxKBXabzCJ7fLm5W0Z0jy1Lops4Kgj3ZmmigNhT3kuug7CbKUAGdlqXv3b
	+fCg7EgnWkBaR3kEhkCKwO/6YSR/1fbMZYgtN+Tq1lPXHhbJzcsT5AEEzp4+oipmkz0kIm+1fuk
	Liwu6bHej41IFrlwTDk/6Zi3zmQXqY74Ea38Kmxc8Pe2c4g==
X-Received: by 2002:a05:690e:134c:b0:671:2114:2bf6 with SMTP id
 956f58d0204a3-67135aa5837mr325455d50.48.1789200010722; Sat, 12 Sep 2026
 01:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823152648.23136-1-kartikey406@gmail.com> <CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
 <mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at>
In-Reply-To: <mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 12 Sep 2026 13:29:59 +0530
X-Gm-Features: AcwNN1VuzI_b1oLLTOSxq0zOitpCnoW1EI2NKFmM2KiR-zUQ1n_nMB6an1I_pcE
Message-ID: <CADhLXY44kq1XamTjXgrfcLc-_HnK3T2b9TVPxjzB4kc0fKdEqQ@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
To: Richard Weinberger <richard@nod.at>
Cc: dwmw2@infradead.org, kees@kernel.org, viro@zeniv.linux.org.uk, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 12:28=E2=80=AFPM Richard Weinberger <richard@nod.at=
> wrote:
>
> Am Sat, Sep 12, 2026, 03:08 schrieb Deepanshu Kartikey <kartikey406@gmail=
.com>:
>
> > On Sun, Aug 23, 2026 at 8:57=E2=80=AFPM Deepanshu Kartikey
> > <kartikey406@gmail.com> wrote:
> > >
> > > jffs2_alloc_inode() does not initialize f->target before returning
> > > the new inode. It is normally cleared later by
> > > jffs2_init_inode_info(), called from jffs2_iget(), but that runs
> > > only after alloc_inode() has already returned successfully.
> > >
> > > If inode_init_always() fails in between, alloc_inode() calls
> > > ->free_inode() directly on the half-initialized inode.
> > > jffs2_free_inode() then does kfree(f->target) on whatever stale
> > > value was left in the reused slab object, which can be a pointer
> > > that was already freed, causing a double-free.
> > >
> > > Initialize f->target to NULL in jffs2_alloc_inode() to close this
> > > window, and clear it in jffs2_free_inode() after freeing it so a
> > > reused or re-freed object can never carry a dangling pointer.
> > >
> > > Fixes: 4fdcfab5b553 ("jffs2: fix use-after-free on symlink traversal"=
)
> > > Reported-by: syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=3D675e84fdf3dde67b494=
6
> > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > ---
> > >  fs/jffs2/super.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> > > index 81396a092ba8..30d753d4c263 100644
> > > --- a/fs/jffs2/super.c
> > > +++ b/fs/jffs2/super.c
> > > @@ -42,6 +42,7 @@ static struct inode *jffs2_alloc_inode(struct super=
_block *sb)
> > >         f =3D alloc_inode_sb(sb, jffs2_inode_cachep, GFP_KERNEL);
> > >         if (!f)
> > >                 return NULL;
> > > +       f->target =3D NULL;
> > >         return &f->vfs_inode;
> > >  }
> > >
> > > @@ -50,6 +51,7 @@ static void jffs2_free_inode(struct inode *inode)
> > >         struct jffs2_inode_info *f =3D JFFS2_INODE_INFO(inode);
> > >
> > >         kfree(f->target);
> > > +       f->target =3D NULL;
> > >         kmem_cache_free(jffs2_inode_cachep, f);
> > >  }
> > >
> > > --
> > > 2.34.1
> > >
> >
> > Gentle Reminder. Please let me know the status of this patch.
>
> We got lot's of identical fixes this issue.
> I had no time yet to sort out who was the first.
> This is maybe the first report with fix suggestions, but the reporter
> vanished:
> https://lore.kernel.org/linux-mtd/CAFLxGvyZO_EDo-YM_EybZG3u7aNUoNiThhvbhQ=
CrOPD7mPV6GA@mail.gmail.com/
>
> Thanks,
> //richard
>

I feel the patch you are pointing at fixes a different kind of issue ?
