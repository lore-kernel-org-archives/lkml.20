Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DB944F547
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790034969; cv=pass; b=HVHs7cgfy4sWmcQ/WJ9XGKJqet0RYbxx+ZPKtlVJq7jymFU7da8GtWS51XzZK6gaSxNNnv+jJHiJ5Q0zX87mYJm+tRD7Or7U+qD0pEkEYU3tfzHOgoV8rvHScuedKZzxr6tNBWW7aBJboIWOx1Pb6NsSw6zsK1/PfSwSLY9Ul2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790034969; c=relaxed/simple;
	bh=0FOwiB23N7sp8J9FkDTI6fUIIDALNkmeuPe/FB4M7xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoNF/H74sn1nX4GbmmQszJa0NZf/upnycNckVNgnep0TlI5ig3PTWMTU9XooXTgxM1QUVOvFYX4mmxFd/Upf32cG5lLMH7XA19+zixpRbRTwJG6FvXx2m/Ekoi4se3P4Uqjc2xfDUE1s2Ua6cMcgPB+QSQt6AL8xw9ArzNV8k9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZpjTzS1; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZpjTzS1"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c1b8d7b5so2750383e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790034966; cv=none;
        d=google.com; s=arc-20260327;
        b=ZouO21vIFx/pvuy/na8Y0oBGrN8iHZJgFf3KxrFcd508ph0ZixBN6l96SwnJKpBTWq
         /BgUkrG2KpQYS9N8ObAa3UoTFVAKy7/9NU/+YW4O8pZhRGmbYGjf0BUw3+9VNDs30vyq
         HKBP3LRIrjFZG0aBwi7qn3gmBn/hfkagmVlD1mJKVTUCfka4Ks+iPwecWRyV2/vL6FVt
         bNkLfHAtnRW7JP70kZklNQWQvpRtOBkBT1xJ85YxRFfRtQQh9zMohQkga1cgNMfkzrPd
         PTHUBdE3QW3kE8nQ6aSGy7fG3jxQQqUDtBJruFPpdU05v1P8EQIFB4jrjGQV3uNNgZx4
         SM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4tuiiEeHxGLov+71dX9YW1/sj+iI64d799g+prJq00=;
        fh=HG6aDDszYpuGhEwDOTApqmhZ14YhjpTjEM/lpUM1q84=;
        b=OsmedXY+PaEh6LuNkW90/9LZs1GELtK6JY9o1ZVKsg7WZdkzat96Rmj5rXDiG8G252
         v12TN2U43r/EjAMxrtOsSXChqey5YAcsucrnjzK5XaVNtNmboL+K/3tco86o+wi2lX5T
         FDDUeEiusTLaIxT23prZZiMtmP+3XqHa4QpOqofFxVbDqtKsjRU2z+ylwqNj85VcL9Ga
         OdzAy0MGKubjrxY0aSC2iuBx3s2qxovocP8yqaHaebwvdPyr8IQuWBklCuLKc4t6acGq
         kxRZxjKdGP9Dxr6REC5lIa+5Ha4Y4/QNwLq3wfBv2szFui6k/ehRBb9xHLdqJfwDJbqR
         2mVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790034966; x=1790639766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4tuiiEeHxGLov+71dX9YW1/sj+iI64d799g+prJq00=;
        b=qZpjTzS1XveFoWCRA+3C/s2pOUT42WqYOk51/f3nbJV7xZsfVzq+csQr9CMA+CepFE
         9DvGExJokeHOlKGJtJ5AVhjBCuBIZTy8mVtv68WlfUdTcLTgfSnqnE1KeZW6Y7m7lFp2
         iGTAKE96CWYYEeNfSy9VR87BSDdhzuF1xmYI1DvVMRrl2iw5pyomMUqaO68PrWL1Jur8
         kjcWvvaKsZFCA3maxELie15AxrxPdXfLrs+Pi3Z53XbGhaHajTfL4Oqx/fap5CAjBa7o
         3pH4n7rBtwOqNrSpbIAYw+kuS/5m/cWQHkP0goY4VubQYd1gIHPEkb4DfmfAEluukTcF
         SSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790034966; x=1790639766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4tuiiEeHxGLov+71dX9YW1/sj+iI64d799g+prJq00=;
        b=nR/LA3po07JbxjmVU2aS75A7h7+DE7U1qXmmq2s3MClaCv343PRqO+a0z3ssXru/hH
         xDyt3w5J7acGq4uZ7S7DFnSGhxhjn0J46q4OrGv6XX/Wj6HP32LqNcXHP0/Suvwy4ytR
         QyJ5zb3FuoybKUhs+x0n/kajX5Aeqagvgua/c1kTryBVr7gHgWCRWgOIQUAZisU8AycQ
         VHFgTUJDhuQ75Bd8QhFQLIAakRe+38eLgiSoWdvlvYxvUft21OZBFkQkKEx6tb4KRoXM
         zJ1oyY3rqSdMRfYaCjCPtYd/t99PE9YhwC1eeysERSZ9uIXrn8yGLSb3CFitbjJ5Md//
         R8Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwZhtZrg/Zxf3eHlGddv3p4MQWIiD+6DVKWPt1jjl2qX+Wun9m3Z9B0bHlQHoxk0ylu8CDcRVHsibOFhBw=@vger.kernel.org
X-Gm-Message-State: AFuF++npOuy9DTflDig69nJhgkTLKxWbJpTT/E3uIrK35DkxzZUZy0Wq
	GyWE3PwOD7rNTlkV8NU4bQ3quwck3425SSdodCF1Tp7XUjuDx2GZ0C1anVnp++RcJpnaKjTmIQ/
	TpwwS1G2S9z8W79ySrKjSIoI00a6Ul6w=
X-Gm-Gg: AYBFou1NEZ0O8jrP7ZN2DXX9egUyh+HH6b0I6iBa/aFDNvws7MEOZ+pDimmrDr6/uhO
	OaQOeDYuHMN6Rjwluq3H1E4scuFXcgkqsgYpeyqBLhx9b85oAgxIy1t9lOssoLFWPAwS5Hfk5qs
	hmZsYT2WgrvAOMuB17Rj3BmQByK39+svxD0ubG5M8LGaaA8a6gL7rMcU/pvGYcUHZIDzznxPpWX
	GT7wv0mvS6kF/6sioeEEOUUSEk6TeEnYxIVKu4+//VGWIUevYMJ10z1l8aV76CMJ4x73DIN1zTJ
	QnOWkvOPfCBmtGTtqyAeTawB2bNs4IlouI0KF08J0TGIVyCW1jrwZyYIgSYwtLzuN14=
X-Received: by 2002:a05:6512:3a85:b0:5b8:bc5e:d0ff with SMTP id
 2adb3069b0e04-5b8c195b308mr3897310e87.41.1790034965594; Mon, 21 Sep 2026
 16:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKFNMonYVUbzjYm343Aw-=xjUk78x4EdUwGBfNRwE6zfmRVhvA@mail.gmail.com>
 <20260921152144.3983736-1-qwe.aldo@gmail.com> <20260921152144.3983736-2-qwe.aldo@gmail.com>
In-Reply-To: <20260921152144.3983736-2-qwe.aldo@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Tue, 22 Sep 2026 08:55:49 +0900
X-Gm-Features: AcwNN1UaR9uTQB0NxH5f0PhUk1VxxJS_liJ56SQxmvj-lEI1rWaSdPXfCqtP6lY
Message-ID: <CAKFNMokXBG6C2gHfM+PnhjhJK7BbT84Oou3Gnr+4StR6XTb1Aw@mail.gmail.com>
Subject: Re: [PATCH v4] nilfs2: fix checkpoint root lifetime on sysfs errors
To: dubeyko@comp.asu.ru
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>, linux-nilfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 12:22=E2=80=AFAM Aldo Ariel Panzardo wrote:
>
> nilfs_find_or_create_root() links a new checkpoint root into the
> checkpoint tree and drops ns_cptree_lock before creating the root's
> sysfs group.  If nilfs_sysfs_create_snapshot_group() then fails, the
> root is freed while it is still reachable from ns_cptree, so a
> concurrent nilfs_lookup_root() can dereference freed memory.
>
> nilfs_sysfs_create_snapshot_group() allocates memory and creates sysfs
> nodes and may sleep, so it cannot run under the ns_cptree_lock spinlock.
> Reorder the creation path so that the sysfs group is set up before the
> root is published: initialize the root, create its sysfs group outside
> the lock, and only then take ns_cptree_lock to link it into the tree.
> On sysfs failure the root was never visible and is freed directly; in
> the unlikely case a root with the same checkpoint number is already
> present, the sysfs group of the new root is removed before it is freed.
> Concurrent insertions are already serialized by ns_snapshot_mount_mutex,
> so only the race against nilfs_lookup_root() needs to be closed.
>
> Because kobject_put() does not guarantee that the embedded kobject's
> release callback has run by the time it returns
> (CONFIG_DEBUG_KOBJECT_RELEASE defers it), the container must not be
> freed until the release completes.  Keep that wait_for_completion() of
> snapshot_kobj_unregister inside the sysfs helpers, so both the creation
> error path and nilfs_sysfs_delete_snapshot_group() wait for the release
> before their callers free the root.
>
> Fixes: dd70edbde262 ("nilfs2: integrate sysfs support into driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> ---
> Changes in v4:
>   - Keep ns_cptree_lock as a spinlock instead of converting it to a
>     mutex, and create the sysfs group before taking the lock, as
>     suggested by Ryusuke Konishi. Concurrent insertions are already
>     serialized by ns_snapshot_mount_mutex; only the race against
>     nilfs_lookup_root() needs to be closed.
>   - Move the wait_for_completion() of snapshot_kobj_unregister into the
>     sysfs helpers (create error path and delete), so the checkpoint
>     tree functions no longer manage the kobject completion state, as
>     suggested by Ryusuke Konishi.
>
> Changes in v3:
>   - Move wait_for_completion() out of the locked section in
>     nilfs_put_root() (the mutex-based v2/v3 approach; dropped in v4).
>
> Changes in v2:
>   - Serialize the sysfs registration against the tree instead of adding
>     a second lock, as suggested by Viacheslav Dubeyko.

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Looks good to me.

Viacheslav, could you please apply this v4 patch directly?
(Please keep the 'Cc: stable' tag this time, since this fixes a
Use-After-Free bug.)

One note regarding this change: if a sysfs directory corresponding to
the checkpoint already exists, nilfs_sysfs_create_snapshot_group()
will not only return an error, but kobject_init_and_add() will also
output an
error message.

However, nilfs_find_or_create_root() checks for an existing entry at
the beginning using nilfs_lookup_root(), and
nilfs_attach_checkpoint(), which calls this function, is always
invoked exclusively =E2=80=94 either under 'ns_snapshot_mount_mutex' or dur=
ing
the serialized initial mount path.
Therefore, this side effect is avoided.

Thanks,
Ryusuke Konishi

>
>  fs/nilfs2/sysfs.c     |  5 ++++-
>  fs/nilfs2/the_nilfs.c | 34 +++++++++++++++++++++-------------
>  2 files changed, 25 insertions(+), 14 deletions(-)
>
> diff --git a/fs/nilfs2/sysfs.c b/fs/nilfs2/sysfs.c
> index bc52afbfc5c7..5bb74a45ad1e 100644
> --- a/fs/nilfs2/sysfs.c
> +++ b/fs/nilfs2/sysfs.c
> @@ -195,8 +195,10 @@ int nilfs_sysfs_create_snapshot_group(struct nilfs_r=
oot *root)
>                                             "%llu", root->cno);
>         }
>
> -       if (err)
> +       if (err) {
>                 kobject_put(&root->snapshot_kobj);
> +               wait_for_completion(&root->snapshot_kobj_unregister);
> +       }
>
>         return err;
>  }
> @@ -204,6 +206,7 @@ int nilfs_sysfs_create_snapshot_group(struct nilfs_ro=
ot *root)
>  void nilfs_sysfs_delete_snapshot_group(struct nilfs_root *root)
>  {
>         kobject_put(&root->snapshot_kobj);
> +       wait_for_completion(&root->snapshot_kobj_unregister);
>  }
>
>  /***********************************************************************=
*
> diff --git a/fs/nilfs2/the_nilfs.c b/fs/nilfs2/the_nilfs.c
> index ecd71c190885..1d5d2293c9c7 100644
> --- a/fs/nilfs2/the_nilfs.c
> +++ b/fs/nilfs2/the_nilfs.c
> @@ -869,6 +869,26 @@ nilfs_find_or_create_root(struct the_nilfs *nilfs, _=
_u64 cno)
>         if (!new)
>                 return NULL;
>
> +       new->cno =3D cno;
> +       new->ifile =3D NULL;
> +       new->nilfs =3D nilfs;
> +       refcount_set(&new->count, 1);
> +       atomic64_set(&new->inodes_count, 0);
> +       atomic64_set(&new->blocks_count, 0);
> +
> +       /*
> +        * Register the sysfs group before publishing the root in the
> +        * checkpoint tree.  nilfs_sysfs_create_snapshot_group() can slee=
p,
> +        * so it must run outside ns_cptree_lock; creating it first also
> +        * ensures a concurrent nilfs_lookup_root() can never observe a r=
oot
> +        * whose sysfs registration later fails and gets freed.
> +        */
> +       err =3D nilfs_sysfs_create_snapshot_group(new);
> +       if (err) {
> +               kfree(new);
> +               return NULL;
> +       }
> +
>         spin_lock(&nilfs->ns_cptree_lock);
>
>         p =3D &nilfs->ns_cptree.rb_node;
> @@ -885,29 +905,17 @@ nilfs_find_or_create_root(struct the_nilfs *nilfs, =
__u64 cno)
>                 } else {
>                         refcount_inc(&root->count);
>                         spin_unlock(&nilfs->ns_cptree_lock);
> +                       nilfs_sysfs_delete_snapshot_group(new);
>                         kfree(new);
>                         return root;
>                 }
>         }
>
> -       new->cno =3D cno;
> -       new->ifile =3D NULL;
> -       new->nilfs =3D nilfs;
> -       refcount_set(&new->count, 1);
> -       atomic64_set(&new->inodes_count, 0);
> -       atomic64_set(&new->blocks_count, 0);
> -
>         rb_link_node(&new->rb_node, parent, p);
>         rb_insert_color(&new->rb_node, &nilfs->ns_cptree);
>
>         spin_unlock(&nilfs->ns_cptree_lock);
>
> -       err =3D nilfs_sysfs_create_snapshot_group(new);
> -       if (err) {
> -               kfree(new);
> -               new =3D NULL;
> -       }
> -
>         return new;
>  }
>
> --
> 2.43.0
>
