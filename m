Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794482405;
	b=lr56Qq7v+6JrocpQXLYSDgZlMRngXaLbJTkQvbxVigmrfnHp8tgs4abWWt+zlCIrDA3k
	 SS455CQy9twrXqqeWqRzpsoPAbxp7wFaXZ5h02S5yfOc2bdyBuO5nF6FdaqNuuHvxvfEL
	 8Rp+LPIh/AlVK3tXlK3Zez0HBb8CES0rbkHJYWG5HV3yqSzdIusVSVZa1aSFPZa9K/4QV
	 2Pjsh3QbeaKdpyz/+pRTDBgSWbMIzWWPHYfla74EnfokuNMgoxCH8L2pRsyAkvBpLpBOI
	 18qtVOOXRkdDV9WBHoJDPZoP4Tw7miy0mXGg/HTmhtL8lkUM8YY7MvZ+D9QjNvPmr2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VTglXy+2krUMdtb0w6gPQkgMvJl6AypaaGv2IAF/L+Q=;
	b=A+77hiPV5HU4u23Bey+TgIFC0FsOULtrEaZ8PuXDsbZtH/TjJowbvn4B3pLlwt/99Jtq
	 2aNDw+t9W+pgcXn+/t5+BtRL/86Vmb0qufrOiKuzJU/tm7/jrsVrJ8v7Cj1ShKYnCupJe
	 y792Wu3fKW73u6EYfyZjOkxoi+k5C5iEYqK9jZYDlGgxjJwytVXV0IfnWgGIQokmoZ/q3
	 mm4QwDQ4l2Lijl40S4AUC4+xUJHwHpkXfxRaX3l2ajEeYsYJaq5u+MmndvSk57q7OrBSy
	 +/XlL69PUJxDODGNK7Nu6BmAwQCMteZmwBbMHew5S5LtfzuV+8Y33eDCmD42vez8hpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Og6lJkpC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016CD606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 016CD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Og6lJkpC
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1188840a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794482403; cv=none;
        d=google.com; s=arc-20260327;
        b=hgZiXgj4sgDMIrcPOetaQI0SOEw3YQs6QGVhtfT28TAn4KzvE57G+lUHNtWI/6b9F/
         GC/5UhU577EIwRx656tmegPVpbez4pVbGjQHIg9QlKikKXcNJMpE8kfBM8aao7tOfj2A
         zdhYhR6z+pfXhgqdvh2nnRNqPBpAUFzBy7FjyZplQKRk/8ekUQmyRsKf42PcZIj5a97d
         abtyNO9YuQqABvfmytfGveS1Vq/S6iu2EukQAgomeL40sinnW2aBDOG6293XVPu4Cbdk
         6Dpy8omVMH2KXljMb5go/1BD0aJFfuMo9H0xhLwF1UI0KJ+y6IoZs9vz3XoAoxWVnyZF
         A/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VTglXy+2krUMdtb0w6gPQkgMvJl6AypaaGv2IAF/L+Q=;
        fh=HSVRUqKJBqtHKJCKeoelCMouemKNJ1F0AzUnJpvHSHw=;
        b=DRFK9oi9Zmr5ro/zwSHHVhXSyN9NsXIss3UMwJus55cUV6ugWCruZBBtq7ibMrBSJz
         /MnG7gk+qQ6qluswga8ENMVeobpWEtHQmYeyuDFBEy0gA3MhQ9j/Enu6CCT5E4bGaJ0v
         k/zqCS4K870nGw1Ht9kjUcgnEVO87vIR58Bq89cU0/lUwESoGdl7Jg8seUz+CVTZAjXH
         I/Mi00xkr1XjG52+7cy7ZNYythgBXb6qwn64TBdbK4I99hDHZrrV0LXyeV2JekUz/hSR
         UTwhKYI3ncA1jUWZGxp5lERGlTBeoOpovUv8TDXhjS9dOVw8rElX2a0s9K3QRjXrDnl0
         i/2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794482403; x=1795087203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VTglXy+2krUMdtb0w6gPQkgMvJl6AypaaGv2IAF/L+Q=;
        b=Og6lJkpCZGCCzHQTeJDBK6mCfPw/+14zn7hZpdGDsCRyNlI0noaa65X8fQV7eRtck1
         ngkY58NbKFequQki+Zyazn6wM9DinrOu54k5jj7Hf/jwuCFIkWIxI/phPPsJkoyomLwG
         Ujh65QQxC0tnTo8DYW3Biv9Zpny6ZrZsPVsJHCyEhYH3xckawZpu3el8ZJTLJHznnvSc
         kp+5W4TnTa5zkyDDyvNQTdwntvXGSpOF80bNlepXmIHvg2rH+U7trMQRzqhkACD8ERK0
         6YekgRSfib99zFP4X55Yfnl6RrtgT0OgKgGE43YbUbH+N397W0abwzw3oLI/398Hbj1B
         eaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482403; x=1795087203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTglXy+2krUMdtb0w6gPQkgMvJl6AypaaGv2IAF/L+Q=;
        b=GiYK7e4mv6UCYXlD0ZVvWblDshslqe1NRVDs4NZWIkzeM34ZZ3d+attqVtXQgigR03
         7wkiExvGKEV6NYSGoWawhmS90UQnW+7IpGxzjADq04ywtWlXf0WSxyu/V9pQR+2wO+wQ
         l1Ugx7GDaVvOhA2RfesZIQsXWvkvZrMw85WS5hh6zcq9C9+t9ZX9uOvWj6lPQW35CZRH
         NDZwWIkTXMj1tEiOkxAsDQN/xqhHy9ZP4tpXakz4WRGupe1sdoeLvnb7r/mYp0iNs6Ur
         aX9f3EsiYKnQuw+IMRK/zs1beTXfMKtRD70iGVXzbjhyT649u9lFwmYI1xjNvOQaHKGs
         gSuw==
X-Forwarded-Encrypted: i=1; AL+hErHUSdtK04XmAbcWZLBU/e8g96rJhxrXuhJPqmA9uMbrEDCH5wui1KX+XpiY3rIGNaN9hnrKg39A+4mmNiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T7p7VfbGCnzzUqJ/QhN6Asj+R7WUWxNEmHcMqqNY/WvOYIqMc
	8nFrrMLJ8tvUsRDKwKuYTwQ07CRmu+o4nL3ZexuAZEu4tGhng4k4/WTnwXfcI78hQ/gHLzKyCtw
	r6h6cQoJQTqfr5nGo/uI9Ti5P72IBuAk=
X-Gm-Gg: AYBFou1Ulkfe0tywzUTDMNowfCIA06vYSTfYIHkYJjcbuEYTqfCJkc6/CX5vlPOhyQ4
	jP4EOHmEsg782Znx7D2YmQLS2yikZVVX2KpZ74A+F4Ojru/BNSbqWr8x+qlwtn1O6NUIvUuVtOr
	Q2LAXYcA3pPt2Ccwrjp2f2W8kDooMurKwy7EXZir7PBVaBJLfVmSh8LTitk8bepQ9TuYz7bzXOE
	AY6S7sdiHfX0JsSXr6TKS59bKuLTOJqZ6U2H2kmqg++rQBUBuLHJQ34y4BXweyUepdEsKrreHUY
	wV1AhooVHdrUz3IfFvcEgGqOeiAWFG7QKqhpDS0W6nXbBxU2yYTH5hKCIQPE592jHur5RBk2X0B
	t/LkfN/5MqTGmQqm6Ec/yGwhsJy/7ehsdf+0QpcE5VPySz/05eX3o6C+lLjVS+hLq7ZEzBg==
X-Received: by 2002:a05:6402:22ca:b0:6b4:21f6:ff48 with SMTP id
 4fb4d7f45d1cf-6b7773418b6mr3084143a12.3.1794482403134; Thu, 12 Nov 2026
 03:20:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-ovl-link-impure-v1-1-7804905610a9@samsung.com>
In-Reply-To: <20261112-ovl-link-impure-v1-1-7804905610a9@samsung.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 12 Nov 2026 12:19:51 +0100
X-Gm-Features: AclHuK8j8C1jDU01PIIaLNz3c4Dysks-pyFxlkXuClWCxYjHTCcGRwGH-vgdal4
Message-ID: <CAOQ4uxgZfKXGDn=MaMZTXh2nUu=LZ5Zu0JDoJQhXfVcSA69bSw@mail.gmail.com>
Subject: Re: [PATCH] ovl: bump the impure dir version when linking a file with origin
To: daejun7.park@samsung.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:58=E2=80=AFAM Daejun Park via B4 Relay
<devnull+daejun7.park.samsung.com@kernel.org> wrote:
>
> From: Daejun Park <daejun7.park@samsung.com>
>
> Linking a file with copy up origin into a non-merge impure dir does
> not bump the dir version. readdir then reuses the impure dir cache
> built before the link. It reports the upper inode number as d_ino of
> the new link, not st_ino.
>
> Pass whether the linked file has an origin to ovl_dir_modified(), as
> rename and unlink do.
>
> Fixes: 4edb83bb1041 ("ovl: constant d_ino for non-merge dirs")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-98f207b6-3936-48e9-a40f-88f20be4d=
b7b
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>

Applied.

Thanks for taking care of this!
Amir.

> ---
> Tested on ext4 and xfs with default overlay options: the new fstests
> test overlay/013 fails without this patch and passes with it. So does
> a script that puts a whiteout in a non-merge upper dir before mount
> and links over it (ovl_create_over_whiteout()). Apart from
> overlay/013, only 079, 085 and 088 fail in overlay/auto on ovl-fixes,
> with and without this patch.

FYI:

https://lore.kernel.org/linux-unionfs/20261111132836.3495981-1-giuseppe@scr=
ivano.org/

> ---
>  fs/overlayfs/dir.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
> index e0a164e22d67..8fec18dc5fc7 100644
> --- a/fs/overlayfs/dir.c
> +++ b/fs/overlayfs/dir.c
> @@ -368,7 +368,7 @@ static bool ovl_type_origin(struct dentry *dentry)
>  }
>
>  static int ovl_create_upper(struct dentry *dentry, struct inode *inode,
> -                           struct ovl_cattr *attr)
> +                           struct ovl_cattr *attr, bool origin)
>  {
>         struct ovl_fs *ofs =3D OVL_FS(dentry->d_sb);
>         struct dentry *upperdir =3D ovl_dentry_upper(dentry->d_parent);
> @@ -393,7 +393,7 @@ static int ovl_create_upper(struct dentry *dentry, st=
ruct inode *inode,
>                 ovl_set_opaque(dentry, newdentry);
>         }
>
> -       ovl_dir_modified(dentry->d_parent, false);
> +       ovl_dir_modified(dentry->d_parent, origin);
>         err =3D ovl_instantiate(dentry, inode, newdentry, !!attr->hardlin=
k, NULL);
>         if (err)
>                 goto out_cleanup;
> @@ -491,7 +491,7 @@ static int ovl_set_upper_acl(struct ovl_fs *ofs, stru=
ct dentry *upperdentry,
>  }
>
>  static int ovl_create_over_whiteout(struct dentry *dentry, struct inode =
*inode,
> -                                   struct ovl_cattr *cattr)
> +                                   struct ovl_cattr *cattr, bool origin)
>  {
>         struct ovl_fs *ofs =3D OVL_FS(dentry->d_sb);
>         struct dentry *workdir =3D ovl_workdir(dentry);
> @@ -582,7 +582,7 @@ static int ovl_create_over_whiteout(struct dentry *de=
ntry, struct inode *inode,
>                 if (err)
>                         goto out_cleanup_unlocked;
>         }
> -       ovl_dir_modified(dentry->d_parent, false);
> +       ovl_dir_modified(dentry->d_parent, origin);
>         err =3D ovl_instantiate(dentry, inode, newdentry, hardlink, NULL)=
;
>         if (err) {
>                 ovl_cleanup(ofs, upperdir, newdentry);
> @@ -647,12 +647,12 @@ DEFINE_CLASS(ovl_override_creator_creds,
>
>  static int ovl_create_handle_whiteouts(struct dentry *dentry,
>                                        struct inode *inode,
> -                                      struct ovl_cattr *attr)
> +                                      struct ovl_cattr *attr, bool origi=
n)
>  {
>         if (!ovl_dentry_is_whiteout(dentry))
> -               return ovl_create_upper(dentry, inode, attr);
> +               return ovl_create_upper(dentry, inode, attr, origin);
>
> -       return ovl_create_over_whiteout(dentry, inode, attr);
> +       return ovl_create_over_whiteout(dentry, inode, attr, origin);
>  }
>
>  static int ovl_create_or_link(struct dentry *dentry, struct inode *inode=
,
> @@ -687,12 +687,14 @@ static int ovl_create_or_link(struct dentry *dentry=
, struct inode *inode,
>                  */
>
>                 if (attr->hardlink)
> -                       return ovl_create_handle_whiteouts(dentry, inode,=
 attr);
> +                       return ovl_create_handle_whiteouts(dentry, inode,=
 attr,
> +                                                          origin);
>
>                 scoped_class(ovl_override_creator_creds, cred, original_c=
reds, dentry, inode, attr->mode) {
>                         if (IS_ERR(cred))
>                                 return PTR_ERR(cred);
> -                       return ovl_create_handle_whiteouts(dentry, inode,=
 attr);
> +                       return ovl_create_handle_whiteouts(dentry, inode,=
 attr,
> +                                                          origin);
>                 }
>         }
>         return err;
>
> ---
> base-commit: 0d5e729c515f4ae4eacc179dbcf350d9b499a161
> change-id: 20261112-ovl-link-impure-8624810156d8
>
> Best regards,
> --
> Daejun Park <daejun7.park@samsung.com>
>
>
