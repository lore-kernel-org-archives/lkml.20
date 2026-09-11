Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE4D355803
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151597; cv=pass; b=W0ADEsA27vUuQsiSN+t4qXyJjCJr0SShYE6Ml97UxJdHvxoH6Lci2ek1enfPmZ4lMN8kjaJyl+3ucp0+Eby/A6/xjoMCpCQHcgBCRDmZuLUd2NFwvMONj3b96TJ/dCBNxV7wpgISMVRwKbaC46TkyJe4LBfWsyCMj1DJUPUlsAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151597; c=relaxed/simple;
	bh=BSqo+Pm7bAdch3Iq4rVn9TzBeUZ0xQ4rk5GEyIAS2rQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKQFcuwFH9xr+Us8suaazj3ylQJ0XgzrFwz1bxQobHp3lAST160TYwQUDFgg4JwKVMt4Nk8iWtFb/NLeqNXz7iqC20FSF5pkeI7u+YuUTTcQCwj74atylRaTp0+LnJt/G0/IWHfHgOTDwAu7qNITLqjcAUGpTqlYwPPIzny/19M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jrPn8K3i; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jrPn8K3i"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c2so35079766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789151594; cv=none;
        d=google.com; s=arc-20260327;
        b=PI9a3U/NJuMnv3sflRhNbomHMwN1YDVbIp/mQufWkYpU5EaYOGU0+FrlEfHr2UTQXz
         GK5/N3a90tWanHlM/fevRiW1FddPx8hiUxkNG2LBUH0wt4rhRLYzYUqr2NPCDI3m7StO
         MGPrUGq7chxiEh77rM+Rg/icxQDF/NO6+1WUdlZ/PIUHvUtB3wykoIxkxAB9qdnXKV0W
         hagA162an6c+iL4GeS3l6IXHPapLZYQ54+vLa2d05+pWhm1ZeSJZ3ihaUxYSEGH+IsX0
         gZWC3ToLL93mvrLj1yWAqLLipcmpUvkIsdBCNQbcQ3VaptfzNONtacSClPlyZHgBj3w8
         RvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qs3HgQRmWYZBaxjbc+wsq8KdyLLiiWdlbvxt2Yh0zD8=;
        fh=Ap72Hs0Tz+mJSowkrELdHPAa+VEQ/mWA46Kzl/zjPOM=;
        b=FVCffcpfFX6zx3tVkRfNhRXIs6ZZhSewy0nJXjkIq6t4rSfb1vl+/VSta/aDfhIVAD
         /4NqrK/nN3Ia1RbJ+c0o7LP8Zzvggkki19oPg963F/bHH9j32/X0RUvaQIcExdrvpsUk
         YarupFA/hhwFXZ1zpQJ4HLkDz2saEKbyTt9mzK2FfH4y+P8Tt/aQFyS8lEW8HggVCEJk
         7/guVONEwUt4duUeKAv7HPB9qD6v9kVpKNRX5zxoLcaWM4/fLt5DKjqrpjQ6U/mJ3Yt3
         M7Gh3d877OOOfpepsknsNxVxE/0h+kEB5ux4/9aLk3M8lBkBjxoCJVShq6dMEajfCQ23
         5jEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789151594; x=1789756394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qs3HgQRmWYZBaxjbc+wsq8KdyLLiiWdlbvxt2Yh0zD8=;
        b=jrPn8K3iINtytQLPinbUpwdr8ufpP8KaYA2AUbd3FMOGJYjBMN77UG6TdHJGTsUETO
         F77YbXW3OgR6jfkAefGbtjgIaDJh0XgdyZhoTK1IUjGTaQG5/CK5sFQqRaMks8i4grKH
         L1KeZ+818R3bQCOZdtW/d8TzsCGHRM54CyvHsUWK3HQ9+d4Q8p995Ue4UFtCjF9lFajY
         DXT/1nJsQQ26xMGS+O0hmJLpsDJKVjT7RLKjzyT4a7x5B6/UNjLlk7+eJqSLRKMTPEw3
         IglhUmy++jVslRn+W4zg7oPtW7yVfpiH1WryXcvLc07nEw2eU31b4utHnTgHEEWOu8Es
         wD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151594; x=1789756394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qs3HgQRmWYZBaxjbc+wsq8KdyLLiiWdlbvxt2Yh0zD8=;
        b=DP2pl2EOE4n2+/1u28X9mSJTUZtActFUMwkVmGR3x1np2JwwreYgdeyn4pGvq/qO85
         8GzVa/DQ5Mz3QFJHAYetOMJnT4aNb9wINUN2GqBvHaIsmAS9OoEEjV2ESYfBuytRFkiu
         na7X1/09ubf+QEJ1OqSzgmiz3V+bRKykpp7vOORhnKWf+90PexC79O/Cf3zN8nUYjqEX
         2Z3S9ekjoPi5z7kYdZzTLI58K2mtCxLnxTgh7vzWm78dH/fYurATATN+DjmIZgjnWF9J
         ECxW7ErI27JOFiUQNB01z8XaKCoVvZMxDJ/jS/olf3gh1RK7bV7JSeq4aI7EnwBHWHyC
         3k5w==
X-Forwarded-Encrypted: i=1; AKwUvBzmJN+7pD9tvA/XyUHRrbiPvZrSkFYf0Gzhzhn0nTzT2hsxLCYlmd3FGZakEl1P6GqdteuxuF7DdpeGOiY=@vger.kernel.org
X-Gm-Message-State: AFuF++l50Q760tk1GfEyrBn5QWrOKdnhJa3vqYhuauXimbm85hauaZC6
	q0sYdBZi/pIvh5Vc4ztODBP6FiT1SXjJJR7xvwiy1dgPCYof64CpPjk37xpaRNYQj0nLRGtBHNw
	zMB5ToGW2CCKtXGTEP6+Q1l8mteXLRNFeFZ4ETHiG
X-Gm-Gg: AYBFou2HCPKeYNCglzZ493+EborFSYdyl5NzVxlHVycPhzwnGe2qplsRjrzXxkIdfOW
	v0FvC2cLWJ5ULHTH4RsSy9H3bjN6pKlWESZZWy0ck8vPBZi1QvwKjoOUz8obb7zUGRYLQYlFFaQ
	YMASS2DhOqLXkTF31rzfSpSnscJXnj/U1ds5eRgsSB01Wo9qiBzFUqi1xxpvVTgTJOgHFVslkmD
	IPVIrhv+48lc/xEELup72iNFNAxSoQ0mh71vcViJGf/XsJFwZcCxOpJXpBAmzDjznnq0BepN6LI
	NvvxIEuZ87CoG1Ibzs4Z5qJqQeiqBnTQjT3eIOjyBkCppelYEoP8fnndylSii9Vego61ThQniwj
	ZLsFjnSfIGIQ=
X-Received: by 2002:a17:907:971a:b0:c29:5215:b2d8 with SMTP id
 a640c23a62f3a-c2966694db6mr463210766b.14.1789151593253; Fri, 11 Sep 2026
 11:33:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821050507.2161607-1-shakeel.butt@linux.dev> <20260821050507.2161607-5-shakeel.butt@linux.dev>
In-Reply-To: <20260821050507.2161607-5-shakeel.butt@linux.dev>
From: Sandeep Dhavale <dhavale@google.com>
Date: Fri, 11 Sep 2026 11:33:01 -0700
X-Gm-Features: AcwNN1WDzPUOCqS2ppOsu4mgfPCVT-uVPGILIV5eYTskg-Q1j9_MFgnEnGQqwnI
Message-ID: <CAB=BE-QMyzKT-o=gbhdp3g8JSqQgRiTFzxTX9vEBmCttABrmdw@mail.gmail.com>
Subject: Re: [PATCH 4/4] kernfs: Remove kernfs_rwsem from dentry revalidation
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
	Christian Brauner <christian@brauner.io>, Meta kernel team <kernel-team@meta.com>, driver-core@lists.linux.dev, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shakeel and Christian,

On Thu, Aug 20, 2026 at 10:05=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.d=
ev> wrote:
>
> kernfs_dop_revalidate() takes kernfs_rwsem for read once per path compone=
nt
> of every walk into a kernfs mount. Linux rwsems do not permit reader lock
> stealing once a writer is queued, so a single writer parks the whole
> incoming reader stream in uninterruptible sleep, stalling cgroup-polling
> daemons for minutes.
>
> Nothing the callback reads requires the semaphore. kn->active is an
> atomic_t that kernfs_find_and_get_node_by_id() already tests through
> __kernfs_active(); kn->__parent and kn->name are RCU pointers whose old
> values are freed only after a grace period; kn->ns is now compared rather
> than dereferenced; parent->dir.rev was annotated earlier in this series.
>
> What the semaphore does provide is a coherent snapshot, and that is not
> needed. ->d_revalidate() answers a question about a single instant, and t=
he
> answer is already stale when it returns: a rename landing just after
> up_read() gives the same outcome as one observed mid-read. A lockless
> reader can only return "valid" for the (parent, name, namespace) triple
> identifying the dentry it was handed, and that triple was true when the
> dentry was instantiated, so it reports a genuine past state exactly as th=
e
> locked version did. Removal is backstopped by kernfs_get_active() failing
> in the subsequent open().
>
> Take an RCU read lock instead. kernfs_parent() and kernfs_rcu_name() work
> unchanged: the condition in their rcu_dereference_check() is an alternati=
ve
> to holding the RCU read lock, not an extra requirement. The negative dent=
ry
> path needs nothing, as @dir pins the parent. The namespace check can use
> @parent directly once the preceding check establishes it equals
> kernfs_parent(kn), so the kn_parent local and its NULL test go away.
>
> kernfs_ns_enabled() reads @parent->flags, which KERNFS_ACTIVATED and
> KERNFS_REMOVING update as a plain read-modify-write under kernfs_rwsem.
> Those bits are not read here and KERNFS_NS cannot change once the directo=
ry
> has children, so mark the read data_race() rather than READ_ONCE(), which
> would not silence KCSAN against the unmarked writers anyway.
>
> kernfs_iop_permission() still forces every walk out of RCU-walk before
> children are revalidated, so lifting the LOOKUP_RCU bail here would have =
no
> observable effect; it is left to the series fixing that path.
>
> Readers walking cgroupfs and sysfs against concurrent cgroup and netdev
> churn: kernfs_rwsem read acquisitions drop from 48,593,360 to 1,280,280,
> and kernfs_dop_revalidate() no longer appears among its contention sites.
>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> ---
>  fs/kernfs/dir.c | 49 ++++++++++++++++++++-----------------------------
>  1 file changed, 20 insertions(+), 29 deletions(-)
>
> diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> index 27949b0e027c..cd7a8ff8b6b2 100644
> --- a/fs/kernfs/dir.c
> +++ b/fs/kernfs/dir.c
> @@ -1171,9 +1171,8 @@ struct kernfs_node *kernfs_create_empty_dir(struct =
kernfs_node *parent,
>  static int kernfs_dop_revalidate(struct inode *dir, const struct qstr *n=
ame,
>                                  struct dentry *dentry, unsigned int flag=
s)
>  {
> -       struct kernfs_node *kn, *kn_parent;
>         struct kernfs_node *parent =3D dir->i_private;
> -       struct kernfs_root *root;
> +       struct kernfs_node *kn;
>         const char *kn_name;
>
>         if (flags & LOOKUP_RCU)
> @@ -1191,49 +1190,41 @@ static int kernfs_dop_revalidate(struct inode *di=
r, const struct qstr *name,
>                  * changes and the lookup re-done so that a new positive
>                  * dentry can be properly created.
>                  */
> -               root =3D kernfs_root(parent);
> -               down_read(&root->kernfs_rwsem);
> -               if (kernfs_dir_changed(parent, dentry)) {
> -                       up_read(&root->kernfs_rwsem);
> -                       return 0;
> -               }
> -               up_read(&root->kernfs_rwsem);
> -
> -               /* The kernfs parent node hasn't changed, leave the
> -                * dentry negative and return success.
> -                */
> -               return 1;
> +               return !kernfs_dir_changed(parent, dentry);
>         }
>
>         kn =3D kernfs_dentry_node(dentry);
> -       root =3D kernfs_root(kn);
> -       down_read(&root->kernfs_rwsem);
> +
> +       guard(rcu)();
>
>         /* The kernfs node has been deactivated */
> -       if (!kernfs_active(kn))
> -               goto out_bad;
> +       if (!__kernfs_active(kn))
> +               return 0;
>

I have couple of reports on android kernel based on 6.12 with callstack

[   41.137176][ T5373] pc : kernfs_dop_revalidate+0x28/0x108
[   41.137180][ T5373] lr : path_openat+0x7ec/0x1b04
[   41.137183][ T5373] sp : ffffffc0b02fbba0
[   41.137184][ T5373] x29: ffffffc0b02fbba0 x28: ffffffc0b02fbda4
x27: ffffff8917f90000
[   41.137187][ T5373] x26: 0000000000000030 x25: ffffff8918985860
x24: 0000000000028000
[   41.137189][ T5373] x23: ffffff8918985040 x22: 0000000000000040
x21: 0000000000000000
[   41.137192][ T5373] x20: ffffff8918985040 x19: ffffff894321d000
x18: ffffffdc3adec8c0
[   41.137194][ T5373] x17: 000000004495e485 x16: 000000004495e485
x15: ffffffffff000000
[   41.137197][ T5373] x14: 7d6770f3f4cee991 x13: 0000000000737365
x12: 0000000000737365
[   41.137199][ T5373] x11: ffffff8918985088 x10: 0000000000000018 x9
: 0000000100000000
[   41.137202][ T5373] x8 : ffffff89dc6c3d30 x7 : 705f636f6c6c6100 x6
: 0080808080808080
[   41.137204][ T5373] x5 : ffffffc0b02fbad0 x4 : 0000000000000000 x3
: 0000000000000000
[   41.137207][ T5373] x2 : 0000000000000000 x1 : 0000000000000100 x0
: ffffff8918985040
[   41.137210][ T5373] Call trace:
[   41.137211][ T5373]  kernfs_dop_revalidate+0x28/0x108
[   41.137213][ T5373]  path_openat+0x7ec/0x1b04
[   41.137215][ T5373]  do_filp_open+0xac/0x130
[   41.137216][ T5373]  do_sys_openat2+0x140/0x21c
[   41.137219][ T5373]  __arm64_sys_openat+0x70/0x9c
[   41.137222][ T5373]  invoke_syscall+0x58/0xf0
[   41.137224][ T5373]  do_el0_svc+0x64/0xe0
[   41.137226][ T5373]  el0_svc+0x4c/0xdc
[   41.137228][ T5373]  el0t_64_sync_handler+0x20/0xf4
[   41.137230][ T5373]  el0t_64_sync+0x1bc/0x1c0

After investigation it seems there is race where
kernfs_dop_revalidate() crashed dereferencing kn->__parent in
kernfs_root(kn) at offset 0x8).
Although your patch eliminates kernfs_root(kn), the underlying race
where kn =3D=3D NULL still exists in this patch and will now crash in
__kernfs_active(kn) at offset 0x4.

Scenario seems to be during lockless VFS path lookup (lookup_fast()),
cached dentries are revalidated without holding dentry locks:

  1. lookup_fast() finds a cached positive dentry where dentry->d_inode !=
=3D NULL.
  2. In kernfs_dop_revalidate(), d_really_is_negative(dentry)
evaluates to false, so it skips the negative dentry branch.
  3. Concurrently, slab memory reclaim under memory pressure evicts
unused dentries:
    shrink_node() -> shrink_slab() -> super_cache_scan()
      -> prune_dcache_sb() -> shrink_dentry_list()
        -> dentry_unlink_inode()
             -> __d_clear_type_and_inode(dentry)
                  -> dentry->d_inode =3D NULL;

  4. kernfs_dop_revalidate() now runs:
    kn =3D kernfs_dentry_node(dentry);
  kernfs_dentry_node() tests if (d_really_is_negative(dentry)) return NULL;=
.
  Because dentry->d_inode was cleared to NULL by
dentry_unlink_inode(), kernfs_dentry_node(dentry) returns NULL

While crafting fix for 6.12, I found this series reworking
kernfs_dop_revalidate().
Just to be clear, your series is not introducing the problem.

But perhaps we can improve this with a check like below?

  -    /* The kernfs node has been deactivated */
  -    if (!__kernfs_active(kn))
  +    /* The kernfs node is unlinked or deactivated */
  +    if (!kn || !__kernfs_active(kn))
             return 0;

Let me know your thoughts or if you want a separate patch

Thanks,
Sandeep.
