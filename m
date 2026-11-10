Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794324526;
	b=nCxfTZZfVh0GaZYG2tzJoSRua91Yh6fwno82q4qrzcupKz48ihSu1OKWU1HwTOt/X0fm
	 BVuIkRH6I0Yl6NiveJGWZkXQ283ejgij9zFL7J6N5M8fwGBKwveqKV8l6lESmONlY5Btz
	 gpDTTgW7/FBeRHHDSySqjTSIRB2ZozcRHpsEOeCZruMKAhVc+YV7SITgwgqCcoLeVxiil
	 vG40qSmMWIqm3m8yllgBSCSush8H2J2oEVHp0+UUTAeCjJ+vf2lQDFM6apj7gSYK3IU5L
	 VSM6SX77MSDI+WbcFLlogQxroFzXm0NNzx7k4TDbWTSOj34nyy8RRsTXWPhb7VztZgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N/pL52fuDy805O1oezgAmGq/06s1o7MBJVwaW8uXKM0=;
	b=RHagvWwJ6LDdwWsXSf5DVULxHD1Mw2Z+sGslYV61asAeGa/YS1oP4FJgMOd10G+mRHQ5
	 llnlMvQXX3diRKV8pTUuuIbp6zrhVRLPtc0YCKE0X+98y5+KOkX8qP8XtoogwnZoqdoLI
	 RSTWpkiY+kZkfXYOF145LjThSWn3VVfrRzb4uFfx2PNwE9RjpQcN5e7gI4xJPkRPOTzUD
	 KAjjCrcGGWxJ3autESRq7mSH4IHi7Pjt8oke4SVkNShf7WOq1G2eRZvSLwXJq0hN+xPGj
	 e/kvfWqnMHau80OtMnO6ASGegs2ZF5ERZWMH1bFD8RcKIYXBlz3+xVijUdCZ44JY8jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dt4XSpXK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815160A260C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B815160A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dt4XSpXK
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso3816805a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:28:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794324524; cv=none;
        d=google.com; s=arc-20260327;
        b=GGBVzyOFsnnouW5lJhlvAdO/8wGKny3vKqvQ4OXlN2ijNEYUitixFBXyWoj7B+rPYZ
         je1JwapXVfnJc4FufC7kZGByh6S9OBNS/WEYLCQwGLoOeTN8pVdkiy5JnlQcvI9PAhuw
         akZnHjNyo2yn7ZXdevJe/Apm2ebOMa2OhfYb5F7+prkFm843YGQhSHUHKJcSsDpoSU07
         1lbaai0GkTQRlrWeReZVTaVxdwBVgY+smJjzf2d5HmSo3BNpgNz9xCFFlxwAc8L2MoPx
         TN8ew31doJj7swjGU8KiuRepxuMJgkW0tcli+mb9IQaQOcEvwDnwadZhu+otV309t6VM
         noJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/pL52fuDy805O1oezgAmGq/06s1o7MBJVwaW8uXKM0=;
        fh=UqevUgER9vmAVY2xXuPpFWD28hmnEoMuV/vKa96NxHo=;
        b=oYMgdkms0zPX8eUejJwtlYelWkZbCm0usVj10u3GvuUnJ2+ZcrYn36VEVkYZN4xZxL
         KQDAlJYs3McXiJqYhtJ2sBN49rCY2t9SMMRSbcnTYc6ILsZ+TWRxB8w5XHOJA9Ji64/f
         CiYTMA6H4fmsgq/BvwXZGm8Eie4S/8R39d4TOLZWtL5ebZ68OC57AvxHxXux0jJ89jW/
         Oys0RiXABDYH7K5ScjeCOvykdyVbk4qXfjIek3gWU7w+m4bx6IdHeDExv2rCnhxHgo0Y
         Etv+mEXaDVsmnorJ7n5Znb65uhkhlL3pLzcJe3doheENMalME2nCL/2PloI8+roJ+Olm
         ZKZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794324524; x=1794929324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/pL52fuDy805O1oezgAmGq/06s1o7MBJVwaW8uXKM0=;
        b=dt4XSpXKWEC/lAY8Ij1wOS2+4YRasGVBXJlQicjWv1F3MuF7qz8m85ymapZS/ZE89T
         GUqu0sQFEdRi4ssDsjt3QAm6UnBH6S8gsHQHT5KqpjGRPL7srRrIrD/D3fZjf6ixSj1m
         ojvIQS6znvNR4BQU+3pDKM25w56hsCYVZ0BUppFlAivu1mHyJVSwUfcJhgFu7ShY2SZ6
         5l+mNoptQWPgHT5NA8HIQGlRoRsG2uG81D+t/xt6c4VUxqgHyOxnuF2Hybzv/v4wot/s
         /kqHpZdeCxUIxcTrQjSiCzHMJGzpNhAaH9CpaKtVDeO7EaeMCMYQOlYUcZE4MgY6EPNm
         gSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324524; x=1794929324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/pL52fuDy805O1oezgAmGq/06s1o7MBJVwaW8uXKM0=;
        b=EZbdDqvWo69Pr6CFZLDhCIa6q99qPTy9kBMVUyVE7Nd/jG4ZFB4VNJrh8D5v+CPaj0
         /VJCbftaT+gXUX3bsbWGTSseGTU0jhbpgkKXhH7L886IdnCnrdZEJvEdZXbQFcajXqrD
         BT1EIGuXcFfkKk+Gl9URzwHvRpOcDO+6+gDtJzd6S1GGTyxjZDo1bpjS0F/ey69WfDAB
         iMgxsNZ40c/wF2EUbCKVUpGko09L+i8Sso+gVsdTAr2K70Va7tFklehBY8TXfDSw/RKs
         WZJXcHXKL8qy9SUvdbNxNo2tRhwS3uFQYcdU1AKZs02WrX+dr3MvAxzxNIHoD+KFpENk
         eQng==
X-Forwarded-Encrypted: i=1; AL+hErExjEIX6WgojNgdl5M/qg3oebvpPoP1M+/a94jRk7YsgopLVMm8ciwDEfSUU/sO0iFVZM2NJ30OSxvbLNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c/On9BWJXDi/sxO0V+SseTwUoRP8laC59CrPi4w6Zjjhj3F9/
	vb3yFmm2C+W3x5aqAQAxcZXP/0HGGQGMFkemZ1U+q/qJrurjFUV2Xq9ad5DkhbnFs6hkx+nnmHd
	klog17KFpv3csedennUfCy/98MQ+Mx7s=
X-Gm-Gg: AYBFou3lR/luTWGV43yZwzrxlhqsN5fzMpaX+CTRv71O9cbjH83wv7ysLoDzbG7EczW
	7BlvL8sSo38figXLx/fSXpUy1YTtwNB5bPZCF4Zx1dSaWhfUu/G5mJNRLGyhONQQ0hl8tcHXk4W
	Ex3W4gwbz/I6y0WZIbTrgjDcBztnIjJsyD0d+mBUZyRJLD+RpjY1WCTjGSkHvrjxQRsW2cH+q98
	QLJd94aI56HokWqtVBF8A5VeT5JqMHHfVVqrhI8ZOFrj7S5zbr3rtlkWubLvGtWGnbrU6p9yAlk
	5k2YkX1GPM5z/7g6ULmY07RORicnV3Mzm18tCmC6xS4jWK74XsMzOba+semS/ug9Aex8328DYDR
	ZozXJ1BGm2+wvfxHPglitCXrlY+c4pKQYZEsSY4NDmK04Y+EapGEyZ6j6cvR12/kR5CTa4A==
X-Received: by 2002:aa7:d0c5:0:b0:6b1:b9e9:6cfe with SMTP id
 4fb4d7f45d1cf-6b75721642amr1700577a12.14.1794324524002; Tue, 10 Nov 2026
 07:28:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-ovl-impure-stale-v1-1-1a4c2039e89d@samsung.com>
In-Reply-To: <20261110-ovl-impure-stale-v1-1-1a4c2039e89d@samsung.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 10 Nov 2026 16:28:32 +0100
X-Gm-Features: AclHuK_ARv3jHUu-hk69apU85BgeSLTjG62PZe0bEwlU6YBkA1bnmg3heLSI8k4
Message-ID: <CAOQ4uxgxYZqE=rv5ZYrbyB0cYi_qS-bv_4UCbDwGJoMGg1iNhQ@mail.gmail.com>
Subject: Re: [PATCH] ovl: skip stale entries in impure dir iteration
To: daejun7.park@samsung.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, Hungyu Lin <dennylin0707@gmail.com>, 
	linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:03=E2=80=AFAM Daejun Park via B4 Relay
<devnull+daejun7.park.samsung.com@kernel.org> wrote:
>
> From: Daejun Park <daejun7.park@samsung.com>
>
> ext4 returns the entry that did not fit in the previous getdents buffer
> first in the next call, even after it was unlinked. The rebuilt impure
> cache no longer has it. ovl_fill_real() then reports its upper inode
> number. overlay/077 hits this.
>
> Remember the entry that did not fit and look it up before the next
> call. Skip it if it is gone, as commit 9011c2791e63 ("ovl: skip stale
> entries in merge dir cache iteration") does for merge dirs.
>
> Fixes: 4edb83bb1041 ("ovl: constant d_ino for non-merge dirs")
> Reported-by: Hungyu Lin <dennylin0707@gmail.com>
> Closes: https://lore.kernel.org/linux-unionfs/CAGEkeHcg06kHshHQ=3D9U6Yrs_=
wm8W9H28o9bcC2Qh3fw3tANbWA@mail.gmail.com/
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> ---
> With the fstests change "overlay/077: check a stale entry in an impure
> dir on any hash seed", overlay/077 fails on 3 of 3 random ext4 hash
> seeds before and passes after, also with index=3Don,nfs_export=3Don. The
> test checks both a removed and a recreated next entry. overlay/quick on
> xfs passes.
>
> Not covered: names on the same hash collision chain as the entry that
> did not fit also come from the cached tree. A removed entry with origin
> there is still listed with its upper inode number, as before this patch.
> ---
>  fs/overlayfs/readdir.c | 120 +++++++++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 117 insertions(+), 3 deletions(-)

Daejun,

I am sorry, but this is way too complex to deal with a problem which
is not important enough IMO.

POSIX does not define the exact behavior of readdir of a directory
being changed in this way and I don't think that the current behavior
of ext or overlayfs+ext4 is a gross violation of POSIX or that it could
break applications.

I would be happy to be proven otherwise.

If anything should be fixed then it would be ext4 and not overlayfs
which just relays the stale entry that it gets from ext4.

The only thing to deal with is the spurious overlay/077 failures.
I will address this issue in the test patch review.

Thanks,
Amir.


>
> diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
> index 4cd4af097e5c..0ebc4fe477b7 100644
> --- a/fs/overlayfs/readdir.c
> +++ b/fs/overlayfs/readdir.c
> @@ -58,10 +58,25 @@ struct ovl_readdir_data {
>         bool in_xwhiteouts_dir;
>  };
>
> +/*
> + * An impure dir entry with origin that the caller of the previous getde=
nts
> + * did not take. The real dir may return it first in the next call, even
> + * after it was removed or replaced.
> + */
> +struct ovl_dir_next {
> +       u64 version;            /* dir version when it was refused */
> +       u64 real_ino;
> +       u64 ino;                /* d_ino to report */
> +       bool gone;              /* removed since, skip it */
> +       int len;
> +       char name[];
> +};
> +
>  struct ovl_dir_file {
>         bool is_real;
>         bool is_upper;
>         struct ovl_dir_cache *cache;
> +       struct ovl_dir_next *next;
>         struct list_head *cursor;
>         struct file *realfile;
>         struct file *upperfile;
> @@ -413,6 +428,8 @@ static void ovl_dir_reset(struct file *file)
>                 od->cache =3D NULL;
>                 od->cursor =3D NULL;
>         }
> +       kfree(od->next);
> +       od->next =3D NULL;
>         is_real =3D ovl_dir_is_real(inode);
>         if (od->is_real !=3D is_real) {
>                 /* is_real can only become false when dir is copied up */
> @@ -767,6 +784,10 @@ static struct ovl_dir_cache *ovl_cache_get_impure(st=
ruct file *file)
>  struct ovl_readdir_translate {
>         struct dir_context *orig_ctx;
>         struct ovl_dir_cache *cache;
> +       struct ovl_dir_next *next;              /* refused before */
> +       struct ovl_cache_entry *refused;        /* refused in this call *=
/
> +       u64 refused_ino;                        /* its d_ino from the rea=
l dir */
> +       bool next_refused;
>         struct dir_context ctx;
>         u64 parent_ino;
>         int fsid;
> @@ -781,13 +802,24 @@ static bool ovl_fill_real(struct dir_context *ctx, =
const char *name,
>         struct ovl_readdir_translate *rdt =3D
>                 container_of(ctx, struct ovl_readdir_translate, ctx);
>         struct dir_context *orig_ctx =3D rdt->orig_ctx;
> +       struct ovl_dir_next *next =3D rdt->next;
> +       struct ovl_cache_entry *p =3D NULL;
> +       u64 real_ino =3D ino;
> +       bool is_next =3D false;
>         bool res;
>
> -       if (rdt->parent_ino && name_is_dotdot(name, namelen)) {
> +       if (next && next->real_ino =3D=3D ino && next->len =3D=3D namelen=
 &&
> +           !memcmp(next->name, name, namelen)) {
> +               /* Looked up before this call if the dir changed */
> +               if (next->gone) {
> +                       rdt->next =3D NULL;
> +                       return true;
> +               }
> +               ino =3D next->ino;
> +               is_next =3D true;
> +       } else if (rdt->parent_ino && name_is_dotdot(name, namelen)) {
>                 ino =3D rdt->parent_ino;
>         } else if (rdt->cache) {
> -               struct ovl_cache_entry *p;
> -
>                 p =3D ovl_cache_entry_find(&rdt->cache->root, name, namel=
en);
>                 if (p)
>                         ino =3D p->ino;
> @@ -798,10 +830,63 @@ static bool ovl_fill_real(struct dir_context *ctx, =
const char *name,
>
>         res =3D orig_ctx->actor(orig_ctx, name, namelen, offset, ino, d_t=
ype);
>         ctx->count =3D orig_ctx->count;
> +       if (!res) {
> +               if (is_next) {
> +                       rdt->next_refused =3D true;
> +               } else {
> +                       rdt->refused =3D p;
> +                       rdt->refused_ino =3D real_ino;
> +               }
> +       }
>
>         return res;
>  }
>
> +/*
> + * The dir changed since the previous call refused this entry. Look the =
name
> + * up as ovl_cache_update() does, and report what stat() would return no=
w.
> + */
> +static int ovl_dir_next_update(const struct path *path,
> +                              struct ovl_dir_next *next)
> +{
> +       struct path statpath =3D *path;
> +       struct dentry *this;
> +       struct kstat stat;
> +       int err =3D 0;
> +
> +       this =3D lookup_one(mnt_idmap(path->mnt), &QSTR_LEN(next->name, n=
ext->len),
> +                         path->dentry);
> +       if (IS_ERR(this))
> +               return PTR_ERR(this);
> +       if (!this->d_inode) {
> +               next->gone =3D true;
> +       } else {
> +               statpath.dentry =3D this;
> +               err =3D vfs_getattr(&statpath, &stat, STATX_INO, 0);
> +               if (!err)
> +                       next->ino =3D stat.ino;
> +       }
> +       dput(this);
> +       return err;
> +}
> +
> +static struct ovl_dir_next *ovl_dir_next_new(struct ovl_cache_entry *p,
> +                                            u64 real_ino, u64 version)
> +{
> +       struct ovl_dir_next *next;
> +
> +       next =3D kmalloc_flex(*next, name, p->len);
> +       if (!next)
> +               return NULL;
> +       next->version =3D version;
> +       next->real_ino =3D real_ino;
> +       next->ino =3D p->ino;
> +       next->gone =3D false;
> +       next->len =3D p->len;
> +       memcpy(next->name, p->name, p->len);
> +       return next;
> +}
> +
>  static bool ovl_is_impure_dir(struct file *file)
>  {
>         struct ovl_dir_file *od =3D file->private_data;
> @@ -863,9 +948,32 @@ static int ovl_iterate_real(struct file *file, struc=
t dir_context *ctx)
>                         return PTR_ERR(rdt.cache);
>         }
>
> +       /* Even if no longer impure: od->next was its last origin entry *=
/
> +       if (od->next) {
> +               u64 version =3D ovl_inode_version_get(d_inode(dir));
> +
> +               if (od->next->version !=3D version) {
> +                       err =3D ovl_dir_next_update(&file->f_path, od->ne=
xt);
> +                       if (err)
> +                               return err;
> +                       od->next->version =3D version;
> +               }
> +               rdt.next =3D od->next;
> +       }
> +
>         err =3D iterate_dir(od->realfile, &rdt.ctx);
>         ctx->pos =3D rdt.ctx.pos;
>
> +       if (!rdt.next_refused) {
> +               u64 version =3D ovl_inode_version_get(d_inode(dir));
> +
> +               kfree(od->next);
> +               od->next =3D NULL;
> +               if (rdt.refused)
> +                       od->next =3D ovl_dir_next_new(rdt.refused,
> +                                                   rdt.refused_ino, vers=
ion);
> +       }
> +
>         return err;
>  }
>
> @@ -908,6 +1016,7 @@ static int ovl_iterate_merged(struct file *file, str=
uct dir_context *ctx)
>
>  static bool ovl_need_adjust_d_ino(struct file *file)
>  {
> +       struct ovl_dir_file *od =3D file->private_data;
>         struct dentry *dentry =3D file->f_path.dentry;
>         struct ovl_fs *ofs =3D OVL_FS(dentry->d_sb);
>         struct dentry *parent;
> @@ -925,6 +1034,10 @@ static bool ovl_need_adjust_d_ino(struct file *file=
)
>         if (ovl_is_impure_dir(file))
>                 return true;
>
> +       /* An entry the previous call refused may still need adjusting */
> +       if (od->next)
> +               return true;
> +
>         /* If parent is merge, then need to adjust d_ino for '..' */
>         parent =3D dget_parent(dentry);
>         type =3D ovl_path_type(parent);
> @@ -1073,6 +1186,7 @@ static int ovl_dir_release(struct inode *inode, str=
uct file *file)
>                 ovl_cache_put(od, inode);
>                 inode_unlock(inode);
>         }
> +       kfree(od->next);
>         fput(od->realfile);
>         if (od->upperfile)
>                 fput(od->upperfile);
>
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261110-ovl-impure-stale-af33421a0977
>
> Best regards,
> --
> Daejun Park <daejun7.park@samsung.com>
>
>
