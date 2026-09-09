Received: from calculus.sigma-star.at (calculus.sigma-star.at [188.245.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A81E32692C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.196.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933435; cv=none; b=hVo/Z6xPRZEU7HjEiSQHqFS1W02H+8plbqZGIp0praoo+ezJPZVRisN4+/d4nUgu4A8ZKHr8IjC2vDB8bC812FBE8wtJ/GYSWEDRzIMNWF0xHS1GHywgOiI0WX0YBiIn62ISykgqy4IG2Iial83Wr0IS8vnBWCT+ihFkGLYaQsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933435; c=relaxed/simple;
	bh=KBpCU5mUECoICF7/mD3T59GCthW5BE7Atyh/Us1Kb6c=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=qm8HHi0oW71zbpFcS5BRZdECAPNzko/xNJKzEytNoDvAe40/yFc4nfVPh4qJ3KYWx54dNWFxFDLIgvtCRgkmJnbE3CZdTn+Ad72Kyldx8PfuJCzC4mkKGJTL2wC+aht4KXWrswd1VNjjdllsg4iIJlH1YYuxF6V2woG4hsR5t9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b=lNv2D6Y4; dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b=Op7jwH+G; arc=none smtp.client-ip=188.245.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b="lNv2D6Y4";
	dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b="Op7jwH+G"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788933426; bh=zooWrDic3EPT3oe8Inni1HE
	n8KnOqLyrt6oR8Ewuy1k=; b=lNv2D6Y48BIlqBOWJJFrJKDK/Dm1DSi78dfiVS4csylvMbyNYl
	Y24/ltardYaoeBJBi0iAJG3uwl+8Xc+5tEBA==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788933426; bh=zooWrDic3EPT3oe8Inni1HE
	n8KnOqLyrt6oR8Ewuy1k=; b=Op7jwH+GMdefyjSBvPqcvl+jjtcQ4hg8gOd1cu6C3fOTj+YeAX
	ixSg39MgmQzZ0ondU2VNUco506B5X07AlDEhEbiMuskroG9D/J6sIL9iuOP2CltFk0aVO0VE2/u
	MuqTVxUJsKOSAJSvcUwIAD+mfKSG8aDX3+zIsCQwag0gJPUw/2lg6uJdwZzj3tYJa+zRv7EC3WG
	drxlN+n8LE0AE/rqpcsoQbFv5JPpsh/s0oV5FTj/iSASnn4mQwJPIZzcgqA1DjwmeXN/dFpE7Ap
	U/QJ7+Ec0P96j0yvB8JSWbwRtNS9hkdvxMVi7Tp5mYY34B/kHTz5zCJCMSbYhfR1JeA==;
From: "Richard Weinberger" <richard@nod.at>
To: <sashiko-reviews@lists.linux.dev>, 
	"Lucas Jeffrey" <luquijeffrey@gmail.com>, <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
Subject: =?us-ascii?Q?AW:_[PATCH]_jffs:_initialize_inocache_to_NULL_when?=
	=?us-ascii?Q?_initializing_a_jffs2=5Finode=5Finfo?=
Message-ID: <mttoruf5.55d3678c-d0ad-4a15-98a0-5ea7ec0d7e8d@nod.at>
In-Reply-To: <20260909025407.7494D1F00A3A@smtp.kernel.org>
References: <20260909023955.1642244-1-luquijeffrey@gmail.com>
	<20260909025407.7494D1F00A3A@smtp.kernel.org>
Date: Wed, 9 Sep 2026 05:57:06 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Lucas,

Am Wed, Sep 9, 2026, 04:54 schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issue=
(s) to consider:
>=20
> Pre-existing issues:
> - [Critical] Double free of `f->target` on early VFS failure paths due to =
uninitialized slab memory.
> --
>=20
> commit 9fd2012cfec1b8d15df193fea97deabda99aa5e5
> Author: Lucas Jeffrey <luquijeffrey@gmail.com>
>=20
> jffs: initialize inocache to NULL when initializing a jffs2_inode_info
>=20
> When a jffs2_inode_info is allocated via new_inode(), due to memory reuse =
it
> can retain stale values from its previous use.
>=20
> If the new jffs2_inode_info object allocated retains an old reference to a
> freed inocache, the function jffs2_new_inode may crash if either
> jffs2_init_acl_pre or jffs2_do_new_inode returns an error value because
> when calling iput() with the inode it will eventually attempt to free agai=
n
> the inocache.
>=20
> Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D3a8099322b09d8d073d1
> Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
>=20
> > diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> > index 86ab014a349c5..40f17218a276b 100644
> > --- a/fs/jffs2/os-linux.h
> > +++ b/fs/jffs2/os-linux.h
> > @@ -52,6 +52,7 @@ static inline void jffs2_init_inode_info(struct jffs2_=
inode_info *f)
> >  {
> >  	f->highest_version =3D 0;
> >  	f->fragtree =3D RB_ROOT;
> > +	f->inocache =3D NULL;
> >  	f->metadata =3D NULL;
> >  	f->dents =3D NULL;
> >  	f->target =3D NULL;
>=20
> [Severity: Critical]
> This isn't a bug introduced by this patch, but doesn't f->target suffer fr=
om
> a similar issue due to uninitialized slab memory on early VFS failure path=
s?
>=20
> When the VFS allocates a new inode via jffs2_alloc_inode() in
> fs/jffs2/super.c, the object is returned from the SLAB cache without
> __GFP_ZERO. It retains stale values from its previous lifecycle, including
> a dangling pointer in f->target, because jffs2_free_inode() frees f->targe=
t
> but does not nullify it.
>=20
> JFFS2 defers initializing f->target =3D NULL to jffs2_init_inode_info(), w=
hich
> is called after VFS initialization completes. If the VFS fails early (e.g.=
,
> inode_init_always() fails due to an LSM memory allocation, or iget_locked(=
)
> in fs/inode.c encounters a hash collision race and drops the newly allocat=
ed
> inode), the VFS destroys the inode via jffs2_free_inode() before JFFS2 eve=
r
> initializes it.
>=20
> This causes a double free when kfree(f->target) executes again on the
> dangling pointer:
>=20
> fs/jffs2/super.c:jffs2_free_inode() {
> 	...
> 	kfree(f->target);
> 	kmem_cache_free(jffs2_inode_cachep, f);
> }
>=20
> Userspace can reliably trigger the iget_locked() hash collision race by
> performing concurrent lookups (e.g., stat() or open()) on the same
> non-resident inode:
>=20
> fs/inode.c:iget_locked() {
> 	...
> 	if (unlikely(test_bit(__I_NEW, &inode->i_state))) {
> 		/* Uhhuh, somebody else created the same inode under us... */
> 		spin_unlock(&inode_hash_lock);
> 		destroy_inode(inode);
> 	...
> }
>=20
> Would it be safer to zero these fields in jffs2_alloc_inode() or ensure
> jffs2_free_inode() nullifies them before returning the object to the slab
> cache?

I think this is a legit bug pointed out by Sashiko.
Do you want to double check and (if needed) fix it?

Thanks,
//richard
