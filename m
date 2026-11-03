Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717212;
	b=2nKeet25pvO+Pxvds56beU5VDtXewm9ptd/LWlDHx2O79W6CqMWRW5mLZ1TMRL96Ehlp
	 3N/O3RMH/Et9AoxDRvVbXImjmFskHDqIVR+wcfBiBvbiZIHj/0N4mczoCzwSirvPfTTas
	 hQvanBM1Aus/QSvlVfU7dngYNNCAL234MhLSEJrC557ZURDGrDHJwOJAoNjtmzRZNxjSz
	 kvNhwva0CvR4PXylWNAGAGlyx+2Ln5UZZdcU2jg0ZLPrllxDACqXhp8lZxjuxNEVGJTPi
	 Pw30b1qVuG1hKJS7dmr+df8Vplo9qZ3CPORyOErnmXgOZYef7RxvB/1jBDmYwSt7eDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m4ubhwdD7xWNz1fIp4dSNo/j/2+5i9zC1GJT/QlqxwA=;
	b=VyARneV1N+GFPZT6ZyVu0ibDoMWu2jym0oB92k0WnOAazVC67yUVfmghLuMMpQV2XmDs
	 Sd8XF6A5F5aTZkpHO4eqPquxsLW5ZJIzHpKac/+JXRlozVANe0BDqJi4MgFuSYA30nnC1
	 +P4hZbvdY6FL48NFBAY7rK6log36JU7vGwKgrx9N5nXxJ7eWawwqZuC7gNTUVw2BsO07P
	 uhlb8hzgKyhW9tYNSHl0UG5wFBoQ1OfeNI/s9i1D2rDe72ILRfgCGZHKPsV8JxnVtQIK5
	 UtKpRkepIDt1IJKnA1qQE9shJazg6KL/7IeZme6St0rfUwRTctaMmh6aF/uzUVji7qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbwMCgGj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C094606D804
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C094606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbwMCgGj
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso660079566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:46:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717211; cv=none;
        d=google.com; s=arc-20260327;
        b=nRAZhiDCbb6/RJPiVCbuKmntAPBK5rex8VaqRncHHlEMszU3cTztM0Ql6O1Sg2Wft1
         BYdCSWz0dkvigdDMcVaPPEM6MVwoGoJANYWtB4Ekl2Cnpa/yrFPPz3vE5Yp34k2V1bBD
         t8BiSJik5zko+V9oW0quqqkN0Jw7Xsfp5fekDcdSOG7AgTpT356TkzKWQu3bLzGKdfdb
         KLc/k2ki9dH4wJKMXJLCjvRUWuBEBRVFfXazHNbBRQYdo7MclD0Yh1fzwPYjVfHU25zx
         AYIe6oVNRzbLKPNyfFUosGnFvj1biplodBoy0k9zkI32uqj1cO+6Z7AU4L3CHpxmnFQA
         W6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m4ubhwdD7xWNz1fIp4dSNo/j/2+5i9zC1GJT/QlqxwA=;
        fh=0joDrA9TTPI/cAdbvgHY/cHGOdaOGTR2wP2qrGVqh7g=;
        b=JiEsKmj2+fsrZQm8VWd219zZcLo1RgyiNcoe3TlOOcn22ZEZxsUG1FL9j9YDlgee18
         QgRN/AuNEHO+MjmFesSHk/OO1d7SugOLzmNj/CWhhGXHfwHqc6W87QC4FdNJHAZSjAsZ
         w94Bdg/v8413r9nRBiuZfSrOMwlavzr7z3Y/bLFaoc2Nf2dlEzzgIrpSSYve4fOWxTHi
         SBCuvjhzu3ozFoCw4Ou3JqBd0Q3DPv1z+eVyFZEMfssoVLFFkAPWmSc6e3aSDIGWVALO
         a/dgAp0NhSR2wPVk02NeggW+bwoB8CKUJ4aH8XccOUdz+5TcTRQyUu9TVUerH4lWedp4
         d75w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717211; x=1794322011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m4ubhwdD7xWNz1fIp4dSNo/j/2+5i9zC1GJT/QlqxwA=;
        b=YbwMCgGjapu2U4cW1LFSOzILIQ0bSem0oNun3PccpxdXy+Yp+l6dhte7Ey/vMaRasv
         mVCO5ZvXD+lirtIbu8AZKZDQWMWGre7XuicW2XukzMqcwRpWuHLWeib913i5htOazuvi
         zegXmhzyR9p6r9sL7PocqZX1FLzZlgRVDBjn/GvzVNnuon/fhKVuJ2MVF3sZvmpjzGvL
         o34ur4RGVmC5fGWdgDIAHxLYGYZoMSlbD6+ptfoVla9YKX+loStLyPGsoe+0FmT/9r3l
         2rDUfS9GmVdLWZttUWzZBfO1l2Er+tumP46uZi2ywLaQJcbLikbfrzHH8FHw7JPMWAOM
         Vz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717211; x=1794322011;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4ubhwdD7xWNz1fIp4dSNo/j/2+5i9zC1GJT/QlqxwA=;
        b=Zd2xXl990SOvrubhFrnJykgZpBX6+sQtEWGWdn94M24VWbZav0UAUoovfIZuuhLwwI
         t6tsoIrlDgslwk4UhpD6sHrxgoCkYPLBNX0xMxJNAJkSZSEyewV4/nhB11+etXuyiHNS
         +/qdcA3dz/3gsSs7+1NEQoArEYzyYsXHJP6VuDdKrYooDDXAxqEdmT5SzeCZZ1jpQnTP
         Afj+yYrGK58rks7/cLBCg9hGm+9w5pgdmffYZ43BjAMF/aW7F+faBARwwIbzAwOPYQid
         XGpSSF6xcbV1VU3N1gYEPYBMh6QA0tdRA9D0qfjKLs8Y5By/GyECWv1U1Dc0mPA5nzMn
         ooAw==
X-Forwarded-Encrypted: i=1; AKwUvBxZ3WiLmFF9B4ZIA6z1Okb/BjadNxB9ia/BeW21ihActkLySSx0vJZpMgLgbGAkow8eOVwdyouFHgoY0Ho=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QdbnMcUzb8BjdwwEblt+gA5yccmEqrxRBajXn4tWddwky9ejv
	XhuvW4vrt2u66t/cXjUAbTb85ZqiIzwRCBaWxHRfDmViphBG1IUfmwuW2/IU3s724AD2BBSxMQv
	K8MbliXvX90lF45Gw20J2RPCUsaIm8fIdUUhP
X-Gm-Gg: AYBFou36tYDFl+2cgkYdPgtfYnAuGt5JkPbJ5ric/PfuLuK3fVGFQeipIIDfq7mmQdJ
	vfil/oFNfZSuzY/0cD/8frpOWVDXDXv69adolsYPxsaT0LYm2DeA26W/9WqgXww/j0QQGRBVL7V
	g2n5CeASppjdRJOGSNOhOISsHZCHBompH0SCZzDO45XKndmWk2UJgmmJtv2Usd/kweW+Whmq8s1
	rhbnz15/fPrcRLqd3+7ARSyoqdmt1geTVCX2pGi31y87KSdweiyTU4hlX19TOiAljxWoL2r15S4
	QVZCHd/5Z6OKlD+li4RZbOeOfmohJFU3/RtF8UNocJtPwExcLKr+vAnesgrCjblDtJLtnvXbWvk
	DwbLmyFfTXeF21KG0kYSA7BN1vqgmaB85HVLz/qv/BJ8p3Nm+L8utic5l64zWnl1aCMuV7w==
X-Received: by 2002:a17:907:1c89:b0:c46:8b51:c17c with SMTP id
 a640c23a62f3a-c4ca7a4e4b9mr1032689066b.17.1793717210181; Tue, 03 Nov 2026
 06:46:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <P58Wrer--F-9@tuta.io> <20261030-welpen-anbinden-nullen-b2432cee1d10@brauner>
 <CAOQ4uxjm=cGPnug18VuhKqiMvkWwLPNLO_TE3KxO8iLZG+veYQ@mail.gmail.com>
 <P5Qu3co--N-9@tuta.io> <CAOQ4uxh67+vs0mr-Lxmwz9-N+F8m29WUNz+8qFLLDpOVYB7=vg@mail.gmail.com>
 <P5WV0VL--F-9@tuta.io>
In-Reply-To: <P5WV0VL--F-9@tuta.io>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Nov 2026 15:46:38 +0100
X-Gm-Features: AclHuK-AkbE76i1M2E19O6SFPWAt7p_ENORS0HKIxbE5f-oUtF7Cy50LrWBo2WE
Message-ID: <CAOQ4uxjYX+A_xRBmfj40hmAcuQXwW4JPUmhJ9bx5ymSr0QoDnw@mail.gmail.com>
Subject: Re: [PATCH v3] fs: let backing files inherit FMODE_NONOTIFY from the
 user file
To: Edvard Conrad <edvard@tuta.io>
Cc: Christian Brauner <brauner@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:01=E2=80=AFPM Edvard Conrad <edvard@tuta.io> wrote=
:
>
> On Mon, Nov 2, 2026 at 1:34 PM Amir Goldstein <amir73il@gmail.com> wrote:
> > Good catch!
> > Please test the attached v2 patch and post the new test cases.
>
> v2 fixes the merged directory. An impure directory still deadlocks the
> same way: ovl_iterate_real() reads it through ovl_cache_get_impure() and
> ovl_dir_read_impure(), which v2 leaves without the user file, so
> ovl_dir_read() opens the upper directory with plain ovl_path_open():
>
>   fanotify_handle_event
>   fsnotify
>   fsnotify_open_perm_and_set_mode
>   do_dentry_open
>   vfs_open
>   dentry_open
>   ovl_iterate_real
>   ovl_iterate
>   iterate_dir
>   __x64_sys_getdents64
>
> That takes an upper-only directory that a lower file was renamed into,
> on layers that share a filesystem, so ovl_need_adjust_d_ino() sends it
> to ovl_iterate_real(). Passing the file down the same way v2 does for
> the merged case fixes it for me, on top of v2:
>
> diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
> --- a/fs/overlayfs/readdir.c
> +++ b/fs/overlayfs/readdir.c
> @@ -670,7 +670,7 @@ static bool ovl_fill_plain(struct dir_context *ctx, c=
onst char *name,
>  }
>
>  static int ovl_dir_read_impure(const struct path *path,  struct list_hea=
d *list,
> -                              struct rb_root *root)
> +                              struct rb_root *root, const struct file *u=
ser_file)
>  {
>         int err;
>         struct path realpath;
> @@ -678,6 +678,7 @@ static int ovl_dir_read_impure(const struct path *pat=
h,  struct list_head *list,
>         struct ovl_readdir_data rdd =3D {
>                 .ctx.actor =3D ovl_fill_plain,
>                 .ctx.count =3D INT_MAX,
> +               .user_file =3D user_file,
>                 .list =3D list,
>                 .root =3D root,
>         };
> @@ -714,9 +715,10 @@ static int ovl_dir_read_impure(const struct path *pa=
th,  struct list_head *list,
>         return 0;
>  }
>
> -static struct ovl_dir_cache *ovl_cache_get_impure(const struct path *pat=
h)
> +static struct ovl_dir_cache *ovl_cache_get_impure(struct file *file)
>  {
>         int res;
> +       const struct path *path =3D &file->f_path;
>         struct dentry *dentry =3D path->dentry;
>         struct inode *inode =3D d_inode(dentry);
>         struct ovl_fs *ofs =3D OVL_FS(dentry->d_sb);
> @@ -735,7 +737,7 @@ static struct ovl_dir_cache *ovl_cache_get_impure(con=
st struct path *path)
>                 return ERR_PTR(-ENOMEM);
>
>         cache->is_refcounted =3D false;
> -       res =3D ovl_dir_read_impure(path, &cache->entries, &cache->root);
> +       res =3D ovl_dir_read_impure(path, &cache->entries, &cache->root, =
file);
>         if (res) {
>                 ovl_cache_free(&cache->entries);
>                 kfree(cache);
> @@ -856,7 +858,7 @@ static int ovl_iterate_real(struct file *file, struct=
 dir_context *ctx)
>         dput(parent);
>
>         if (ovl_is_impure_dir(file)) {
> -               rdt.cache =3D ovl_cache_get_impure(&file->f_path);
> +               rdt.cache =3D ovl_cache_get_impure(file);
>                 if (IS_ERR(rdt.cache))
>                         return PTR_ERR(rdt.cache);
>         }
>

Right, I was being sloppy.
Thanks for the fixes.
I added Co-developed-by to attribute your contributions to this fix.

> Results in a VM on 6b4b543fa18, each kernel run once and with -i 2,
> with the backing filesystem marked:
>
>                                 file  dir   merged dir  impure dir
>                                             listed      listed
>   + c3d355f427ce                PASS  FAIL  FAIL        FAIL
>   + your v1                     PASS  PASS  FAIL        FAIL
>   + your v2                     PASS  PASS  PASS        FAIL
>   + v2 and the diff above       PASS  PASS  PASS        PASS
>
> The new cases are posted on top of the directory cases:
>   https://lore.kernel.org/ltp/P5WKBbq--F-9@tuta.io/

Thanks again!
Amir.
