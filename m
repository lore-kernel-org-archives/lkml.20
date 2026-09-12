Received: from calculus.sigma-star.at (calculus.sigma-star.at [188.245.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D293176EE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.196.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196284; cv=none; b=UG6EQCToGIz+su67y6G+bjVWaLdfJxWZYpEZaS5C69Ec3El/DAbVVUWVfWdkFT7jFuZbIUGzv9PupSb3PzPpQufFgz+9dcdAXeYNnscltj8P7ggpsBP7mGq/amcxnstZXKoClfjA9P8wGw1TjplKRcvheJxHkNgxDfGruSSEwBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196284; c=relaxed/simple;
	bh=YqF6948mrzb/8cVOwHRgt0vfii6osOjLl0iOUfxhbM4=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=WnPRNRjgimw7st0dSAid3GuGS/CU5dDecvFZQIZ6XMFhBIHpqo4BBnOdhXBG2IWQ5QXvpVHk2xUCSGsuSNK3V2loyYcp1wz93PSjWWEzNtVKN3Mk2tc6nq1UNOuDNuS2ZuZhMqA+FlAYdsTbFZbBdcetyEitJwa1w9pRRnTPapQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b=4TdRhezk; dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b=4yLgpQZl; arc=none smtp.client-ip=188.245.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b="4TdRhezk";
	dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b="4yLgpQZl"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789196248; bh=leruooDUceeBS55cyQM9N7+
	EUJjnPs5o4axCcQft5jo=; b=4TdRhezkcMKKa9mJdgGnTeZldT4/P82jTGqvyKCdgrx2pWLOOa
	5t1fnrvmuy5dcj3OEP8o+6Vi0ZqyK0fV6IDQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789196248; bh=leruooDUceeBS55cyQM9N7+
	EUJjnPs5o4axCcQft5jo=; b=4yLgpQZlO5FxeJVmkgxlqD2JZ4pfaVIDXIEcdawVeO+trgM55W
	ION6tFPWe2QoFApgzGIYhReQD6lTdUmlupg1qZN3oJZWI1OLVkbJNGlXQUuFhAxGFglHwd+ZsO4
	5PRn1hTuqZNr8GvBadNPbcyTMHGfpDyqhWP/oRDTUg4b05GCv3DjEgf+A0rQi9l6IsYdSi81+/j
	+9cxMGN+IK041PWxxh17hKz/1lypmzNmVjsgckGg93MoXXpPOhvQ+BPvWatDKhkSazyHvJ6zuvH
	AIcUajHmiF+uZZkRD7jKaseYmgW+XYDSwCL5hM4BpicDV5mVbqxAb1lBUzL1Fgc1HSw==;
From: "Richard Weinberger" <richard@nod.at>
To: "Deepanshu Kartikey" <kartikey406@gmail.com>, <dwmw2@infradead.org>
Cc: <kees@kernel.org>, <viro@zeniv.linux.org.uk>, 
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com>
Subject: AW: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
Message-ID: <mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at>
In-Reply-To: <CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
References: <20260823152648.23136-1-kartikey406@gmail.com>
	<CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
Date: Sat, 12 Sep 2026 06:57:28 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Am Sat, Sep 12, 2026, 03:08 schrieb Deepanshu Kartikey <kartikey406@gmail.co=
m>:

> On Sun, Aug 23, 2026 at 8:57=E2=80=AFPM Deepanshu Kartikey
> <kartikey406@gmail.com> wrote:
> >
> > jffs2_alloc_inode() does not initialize f->target before returning
> > the new inode. It is normally cleared later by
> > jffs2_init_inode_info(), called from jffs2_iget(), but that runs
> > only after alloc_inode() has already returned successfully.
> >
> > If inode_init_always() fails in between, alloc_inode() calls
> > ->free_inode() directly on the half-initialized inode.
> > jffs2_free_inode() then does kfree(f->target) on whatever stale
> > value was left in the reused slab object, which can be a pointer
> > that was already freed, causing a double-free.
> >
> > Initialize f->target to NULL in jffs2_alloc_inode() to close this
> > window, and clear it in jffs2_free_inode() after freeing it so a
> > reused or re-freed object can never carry a dangling pointer.
> >
> > Fixes: 4fdcfab5b553 ("jffs2: fix use-after-free on symlink traversal")
> > Reported-by: syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D675e84fdf3dde67b4946
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
> >  fs/jffs2/super.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> > index 81396a092ba8..30d753d4c263 100644
> > --- a/fs/jffs2/super.c
> > +++ b/fs/jffs2/super.c
> > @@ -42,6 +42,7 @@ static struct inode *jffs2_alloc_inode(struct super_bl=
ock *sb)
> >         f =3D alloc_inode_sb(sb, jffs2_inode_cachep, GFP_KERNEL);
> >         if (!f)
> >                 return NULL;
> > +       f->target =3D NULL;
> >         return &f->vfs_inode;
> >  }
> >
> > @@ -50,6 +51,7 @@ static void jffs2_free_inode(struct inode *inode)
> >         struct jffs2_inode_info *f =3D JFFS2_INODE_INFO(inode);
> >
> >         kfree(f->target);
> > +       f->target =3D NULL;
> >         kmem_cache_free(jffs2_inode_cachep, f);
> >  }
> >
> > --
> > 2.34.1
> >
>=20
> Gentle Reminder. Please let me know the status of this patch.

We got lot's of identical fixes this issue.
I had no time yet to sort out who was the first.
This is maybe the first report with fix suggestions, but the reporter
vanished:
https://lore.kernel.org/linux-mtd/CAFLxGvyZO_EDo-YM_EybZG3u7aNUoNiThhvbhQCrO=
PD7mPV6GA@mail.gmail.com/

Thanks,
//richard


