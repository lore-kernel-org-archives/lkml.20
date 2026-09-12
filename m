Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0732B377A9F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789231965; cv=pass; b=t2cO4jJG2/+3BGz/6Xz8uTUTGgHUnbz+bLAOWI2Rn5DycPMOHZCVbaKRpAaqIeeY641bbIm+IcuI44SCz62mv0ILq2xibzwfxbXeUmMAcCEftVRP13Se2ecZnzQM3l1hiLu49duPQBAEk1Qa7gKGsuVpZMZhSiWAV1WaP77Twmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789231965; c=relaxed/simple;
	bh=Mn3bV2YTV3fY3wgcVkjvDuSV16K+mD+3WN4ZrWA9Sio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jpsgbq7OCS4XsuLHPQbMuK4jjmVAvtb1QTckDeFazyR083+VTxihCMnq0qr7cXjUS3W0YBqIlzWKyKRDlnKHyQDjjbWkDEF47CbleDaRlnSsB7OKBYF1ZP/Zb6QV5yvtQc5teeu864qbS0STtBJK153RFp1xukdArkMROs8o76U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmG0vUHZ; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmG0vUHZ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c29667ed561so245258566b.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789231962; cv=none;
        d=google.com; s=arc-20260327;
        b=LTzrTNr9kEGL9eMKvvy20c0arQd9SMinRe/yvwgeWlbvtGfNNLk6ptQu0oggeaSQtm
         esJKHradelgEHcGPAntXfjRFMSoW+iEveWcd1yUbufuKnxSkVkptqUA0Sit51qu0abm2
         8P7gIaazN5VJo1+2gjyi5D6jF+HYyFX9Z+4fKvrs6rkr1PvyWSfVFjaeM+SO/KrAlT9W
         umn09zyu2tb7YjR2upLkZw2W7wB8UE2sOdhrfTV/ncuxdbSDRl7qlNnDsJqbHIz1Jy3N
         ZNSHK642r8oDSyL8NlJ4DK78C0pHl0DeypW292RclWP+nmNbVMwxX47uKQJERfR8PbAr
         xY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WYjmIdJ8LduD7wlvhhTNqhhpsCJcLpX0vY1PJ++UAE8=;
        fh=ShVs3VPSDCcQrQIcKPJpNLrTKnYTqYDtYmYT9+Ig3jY=;
        b=OEOxkfElvEHpkaql327DpFQPOYMFDYU9uAKexadWShWKxsoqH47BQSFF8ZyJTWCJjE
         nv9oiecEnfYbIpmQG1elLil6twC/wCYu5oSmoSEhPGd0gp5y2+Cuf4mVN5TMzSPQm0cx
         U/t+ulO1t3eq7F7b+kr1crPhlRO5wwhHaIryA9TxaH8xxQuRtHw8sKui6PhOSRTszqoF
         SW8T1+DfJqiLeJqgbqt3NwZctfPVHJzkJZ6U2CEp+IreYUV2xXJsAaQFBuVTsJJKG80P
         iom3j0ry1YjFf4w+rfPrUzi9QG8XrWE1AUCgMwPx+Vv3XB7YwOqmt0GePF0GiNdaZfXQ
         ppxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789231962; x=1789836762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WYjmIdJ8LduD7wlvhhTNqhhpsCJcLpX0vY1PJ++UAE8=;
        b=EmG0vUHZvJfJpze8V/5BkRsKaw65yDjBt+jX5Iq2HmvrH5zUU68EYRFX77M1iZoDhj
         5bUrg8J9dkDuOdjANk2PTGfoPPID364czNO+AtbT3oDD1ADY/VjrOehPrc1YogSVbxCC
         h5qyE6kJLFR78EkTkek5wU2Slo7w6A9J39NpXlCpgGCYNDBs4iKujM0Kb4G1CyiweTQj
         0+9URfOSECOYH2UxyVyI5UHb9UgnNPBzD904r0vbLpoCBQvtzTOfNs7pyMLQZN5sM2+1
         0/H3vm25RwUGJutcDRuwWgdYrToivjholjuY2uZAagxXTgjSJcTZsIO4W9W+buWBB5k9
         oCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789231962; x=1789836762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYjmIdJ8LduD7wlvhhTNqhhpsCJcLpX0vY1PJ++UAE8=;
        b=Rc1T45aw6XeDz4qCOUH6cUOoKDjEaf0eZli+/ep3C8Gd/dNGbcrbFvba5uB2xA88Ri
         uY9RDq5s0Dtm3aw7AyaemJuuhYN+2ZEMRIubR8bL1AlnBgbbc7S26Ium1UhguXTUHZEV
         +rAHACAwfWpEgjVS0jExrchYfdJz7i0pOaTXYvFgCpKrNeLLOZQxVphMKbMbTp8q2+QY
         b/PJkXCS5hkx+Rb/qf1IzY5m1rpwStfdbd7HdsW5eAcYe5T5QsjScmfn/Bo6xa0nIUH3
         F03QflnUeIRdF+K9HS2f6pkrB+CIlfgAqnL5Q9iPHmkmekuavs8l3HIgSQe98lkbMGsU
         b/gg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ+P0MrMKTuzcnqOmm23D13j+dj5MGENxB/a5l9OPv6lOuHmT16PXl0IyoeVJP/8Nh044CbW3V9ZJjph8=@vger.kernel.org
X-Gm-Message-State: AFuF++m69TDkIaoLDLIEZ0NQLDnFhNm58zR/xY1+Uk+ky+SPs7ik7FAT
	2qYjj6g/hTcdHzAOI5NbLo205CoR+8uzkIS/uj2UeYVf7Q+F8wMHrAUTuFwhUpfdgvkWiWPBDe8
	9SKnbE/urf5ze4LTaS6ssx3s9pYtemQ8=
X-Gm-Gg: AYBFou2jn4+u7fdmtJ+aCbvXYmkEPdyCTqAZiLCIl/PT6jN/cQ1HvbDxNrfsdcUdle3
	CBZwUJy4uh+A/wfjvGbVMAIOuH6PCcCFTFxOACcys04UL3Xhl4eay7ZJAQgeg5IkMLTNEJDLl9F
	QZPgJhk74s8lkpJGvGJbqoeNGbPx+FFGxFoM5zXHK1SS4taQ58bKBNPw0VwqRPyirCGiXchH8wn
	CNaSEodnpkLelF7va/LVAHEc0OXV6eMw1SrBBiVNuRlH8SvjBcjM4CDmCy1Cxw5ruCI3sfwvqHr
	in69YMr++0A7oyodCfdlOV8SK0dF+zTKp8I5PrQzviV0WUS45+s4hHOq
X-Received: by 2002:a17:907:6e8e:b0:c29:57c4:cb92 with SMTP id
 a640c23a62f3a-c29661bfe7dmr492375566b.0.1789231961918; Sat, 12 Sep 2026
 09:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911194201.1334086-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20260911194201.1334086-2-Jeremy.Jean@oss.cyber.gouv.fr>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 12 Sep 2026 18:52:30 +0200
X-Gm-Features: AcwNN1X2hsG0LWaEdwwmkhExP2hV4_8kmcR6MDl78nbl3JF3NiU0DSwRS2ESr0U
Message-ID: <CAOQ4uxjF4xEFRMqb+Owex8Jx_QzeHyJd5LyN5H_SGvo23kMBHQ@mail.gmail.com>
Subject: Re: [PATCH] ovl: disable index and nfs_export with different lower idmaps
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 9:43=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> Overlay file handles identify a backing filesystem, but not the lower
> mount used to decode it. If lower layers share a superblock and use
> different idmaps, a file handle can decode through the wrong layer and
> initialize the overlay inode with the wrong owner.
>
> Disable index and nfs_export when this layout is found. Both features
> rely on persistent lower file handles, which cannot distinguish
> same-superblock layers with different idmaps. Without them, OverlayFS
> uses normal path lookup and keeps the layer chosen during lookup.
>
> Fixes: bc70682a497c ("ovl: support idmapped layers")
> Assisted-by: Codex:gpt-5
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>

Hi Jeremy,

Nice catch.
Do you have a reproducer which shows privilege escalation?
Please add test cases to selftests/filesystems/overlayfs/idmapped_mounts.c.

> ---
>  fs/overlayfs/super.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index bd0a3f9039d2..00e1b9fccb4f 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -944,6 +944,22 @@ static bool ovl_lower_uuid_ok(struct ovl_fs *ofs, co=
nst uuid_t *uuid)
>         return true;
>  }
>
> +static bool ovl_lower_mnt_idmap_mismatch(struct ovl_fs *ofs,
> +                                        const struct path *path)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 1; i < ofs->numlayer; i++) {
> +               struct vfsmount *mnt =3D ofs->layers[i].mnt;
> +
> +               if (mnt->mnt_sb =3D=3D path->mnt->mnt_sb &&
> +                   mnt_idmap(mnt) !=3D mnt_idmap(path->mnt))
> +                       return true;
> +       }

I don't like introducing this potential quadratic search on all ovl mounts.
I prefer to store a lower_idmap field per ovl_sb, which is set to the idmap
of the first lower layer which is found to have this ovl_sb and then
ovl_lower_mnt_idmap_mismatch() only needs to match it.

> +
> +       return false;
> +}
> +
>  /* Get a unique fsid for the layer */
>  static int ovl_get_fsid(struct ovl_fs *ofs, const struct path *path)
>  {
> @@ -956,8 +972,16 @@ static int ovl_get_fsid(struct ovl_fs *ofs, const st=
ruct path *path)
>         bool warn =3D false;
>
>         for (i =3D 0; i < ofs->numfs; i++) {
> -               if (ofs->fs[i].sb =3D=3D sb)
> +               if (ofs->fs[i].sb =3D=3D sb) {
> +                       if ((ofs->config.index || ofs->config.nfs_export)=
 &&
> +                           ovl_lower_mnt_idmap_mismatch(ofs, path)) {
> +                               ofs->config.index =3D false;
> +                               ofs->config.nfs_export =3D false;
> +                               pr_warn("different idmaps in same lower f=
s '%pd2', falling back to index=3Doff,nfs_export=3Doff.\n",
> +                                       path->dentry);
> +                       }

I *think* there is no justification to disabling index, only nfs_export.
It matters because some distros enable index by default and not
breaking hardlinks on copy up is not a "feature" it is a correctness issue.

While as you write "both features rely on persistent lower file handles"
I cannot think of any case where index=3Don alone uses decode of
file handles from the wrong layer leads to bypass permission checks on
lower inode -

The index to lower inode is created only on copy up of a lower inode
that has hardlinks.
This copy up is performed on an overlayfs dentry that was composed by
ovl_lookup() through the correct lower layers.
Copy-up reads uid/gid through the lower dentry's layer idmap and writes the=
m
onto the upper/index inode through the upper layer idmap.
After that, overlay ownership comes from the upper, not from lower inode.

It's probably worth adding some test cases to the idmapped_mounts
selftest to cover copy up.

If the same lower inode is visible from different lower layers
with different idmaps I do not consider that overlayfs job to deal with.
Whichever lower inode is copied up first is the metadata that will be copie=
d
to upper inode and to the overlayfs in-core inode.

TBH, I'm not even sure if there is a legit case for overlayfs mount
of lower layers with same sb and mismatching mntid, but there could be.

CC Christian for his thoughts.

Thanks,
Amir.
