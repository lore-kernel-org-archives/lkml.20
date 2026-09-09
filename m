Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF19492E3F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922450; cv=none; b=WrXZc1ThU6I8fyqWpTWhCHXoujSq1xRTjK4hQWsao1Fbiof4x4OI/NLKmwv/CvNwa58sFoFABGYy9s0qBTIPBZbFveB65MzoiMoiLNrca9emGF14I6ghrh40q1KF3FHilOvBg3Z//vHqqvC0lfWVavYD+mUhPNVUnflTwJY0t1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922450; c=relaxed/simple;
	bh=Lyqvi5je2iU3gZlY6KWtUOxG6dM3vimx17UiR95W4MU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=igs+4/0IXxTctA3XkGV2gXUHCq0zoxDumz9na4HKBcfWFX53UYzlG1niBzkbyDHpZwXhrNla8Jou09f1ooHv69Sv0Hb7VvEECODaO0IMoX6mHkhzfSDroOYosw69ukzh5r+VUhIdgBqVqiTY2kMpjoSABweu5uytZjD9d+RHUno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqkFk8IM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqkFk8IM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7494D1F00A3A;
	Wed,  9 Sep 2026 02:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788922447;
	bh=1uHlsHpRFiAQnk+tqR8TyIQ88QyOmzn6VrzQzZrizjo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EqkFk8IMYEaHXaXSufWPc8wDEE5LYC9IU0voM2JBGAbPM0YF+pVSyB4JSMhNJlame
	 FKf0vweuQlwUCq7nAjpNz+4l35z7lDDro90JDYtqOyuDHb01ZuIUMPGLDvvYegRISe
	 xb9VWoOmyx8wi9D1bK3iXLz/DYry8kTZL6H/MT2AD/RJyb5NdTlG1elKsIWVi6td1m
	 UazfdME7TMzv4He2FFZCUn/L9TcWRwpoxEW1Gf1jn7We3yyF+LzbjSE7PIfFt1E4cw
	 VTC6pS4yHweWP2GmR7A47qcwo+Jhgkg4TFFi8Loa1LFzcK1QB33ieRjzXRsh8upZaI
	 iA7YIOWqAi4NA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] jffs: initialize inocache to NULL when initializing a
 jffs2_inode_info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lucas Jeffrey" <luquijeffrey@gmail.com>, dwmw2@infradead.org
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
In-Reply-To: <20260909023955.1642244-1-luquijeffrey@gmail.com>
References: <20260909023955.1642244-1-luquijeffrey@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 02:54:07 +0000
Message-Id: <20260909025407.7494D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Double free of `f->target` on early VFS failure paths due to u=
ninitialized slab memory.
--

commit 9fd2012cfec1b8d15df193fea97deabda99aa5e5
Author: Lucas Jeffrey <luquijeffrey@gmail.com>

jffs: initialize inocache to NULL when initializing a jffs2_inode_info

When a jffs2_inode_info is allocated via new_inode(), due to memory reuse it
can retain stale values from its previous use.

If the new jffs2_inode_info object allocated retains an old reference to a
freed inocache, the function jffs2_new_inode may crash if either
jffs2_init_acl_pre or jffs2_do_new_inode returns an error value because
when calling iput() with the inode it will eventually attempt to free again
the inocache.

Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3D3a8099322b09d8d073d1
Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>

> diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> index 86ab014a349c5..40f17218a276b 100644
> --- a/fs/jffs2/os-linux.h
> +++ b/fs/jffs2/os-linux.h
> @@ -52,6 +52,7 @@ static inline void jffs2_init_inode_info(struct jffs2_i=
node_info *f)
>  {
>  	f->highest_version =3D 0;
>  	f->fragtree =3D RB_ROOT;
> +	f->inocache =3D NULL;
>  	f->metadata =3D NULL;
>  	f->dents =3D NULL;
>  	f->target =3D NULL;

[Severity: Critical]
This isn't a bug introduced by this patch, but doesn't f->target suffer from
a similar issue due to uninitialized slab memory on early VFS failure paths?

When the VFS allocates a new inode via jffs2_alloc_inode() in
fs/jffs2/super.c, the object is returned from the SLAB cache without
__GFP_ZERO. It retains stale values from its previous lifecycle, including
a dangling pointer in f->target, because jffs2_free_inode() frees f->target
but does not nullify it.

JFFS2 defers initializing f->target =3D NULL to jffs2_init_inode_info(), wh=
ich
is called after VFS initialization completes. If the VFS fails early (e.g.,
inode_init_always() fails due to an LSM memory allocation, or iget_locked()
in fs/inode.c encounters a hash collision race and drops the newly allocated
inode), the VFS destroys the inode via jffs2_free_inode() before JFFS2 ever
initializes it.

This causes a double free when kfree(f->target) executes again on the
dangling pointer:

fs/jffs2/super.c:jffs2_free_inode() {
	...
	kfree(f->target);
	kmem_cache_free(jffs2_inode_cachep, f);
}

Userspace can reliably trigger the iget_locked() hash collision race by
performing concurrent lookups (e.g., stat() or open()) on the same
non-resident inode:

fs/inode.c:iget_locked() {
	...
	if (unlikely(test_bit(__I_NEW, &inode->i_state))) {
		/* Uhhuh, somebody else created the same inode under us... */
		spin_unlock(&inode_hash_lock);
		destroy_inode(inode);
	...
}

Would it be safer to zero these fields in jffs2_alloc_inode() or ensure
jffs2_free_inode() nullifies them before returning the object to the slab
cache?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909023955.1642=
244-1-luquijeffrey@gmail.com?part=3D1
