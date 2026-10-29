Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793271809;
	b=glaNcmB/7oqo7oRbSbNtOy/l61DXJdgWu6qoaNFmfur/Aj/YyQZWWVDjrZ12NXgk230s
	 28fe17YUQO6KoQw/TYCmr7HKbTzZ8t0+RTllpdjdYBJmG1H4uyMmTs9YwUi7yqtjQpOiA
	 HF2GwKKBLTCHiRsuk4CcYhsSHxLD87sTYnDt7tNlXUAkNffOo7kt7n2ZRtNpDMqZ2aJMJ
	 mAgHBj6qYEmW/7hES/obdJikDeDX9C4Ld+AslV/spo6+B9ZWscGJnU89CVFzYI/qS0lTm
	 YPKDgeo9fAMxGlyQSeyo3Gq+uH4wOPM0czwhBuxcXz9ykZ5gDbKgE7ncSIe0ox/klvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+oFxDAll8dGtyrd+E10y47gRwGYiWN3UeaM2jcZ9GXw=;
	b=aqN9xk6zJdmEid116mzdwlCYLBqqqLbdmkW9VRGWrQNCXKk6pxF62SK+8M/dMSk8e5Mc
	 TAJFWw7M9MCcH+5KbgZyL3LvqsH6hzRdvTSzB2Uxr3IHr+o2Io4Xt5/VffS5hs9qMWpGj
	 ZHCPRlCEo7oKgY2RrMwb+r9bS+zt398z2UysGRs5STqjM2jsq89jqew2UGq4ZfVHSKrjx
	 hAoiMEbOlcLD9W9udx4tNLs7X5CZoZ7ZxxpzGEHcmEmSkst9sYYVwdf3fyeKWa/aGePgg
	 anbBIWj68Dlqps8Cac3HM5+7U7Gbfm33v2v9G/r6rMkUQEtzP3bsc55zPeLliMiTo7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAmXfFyx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73856606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73856606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAmXfFyx
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b486e1d02eso2720339a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793271807; cv=none;
        d=google.com; s=arc-20260327;
        b=MK+l1PuNsqwKF+mJBvve6g/zErGxeGenmmv0N4psvk8wkQeoyWUSS9Pr7gmkTshY/r
         2VY91OrVcBnlwIPDNS8AzCTv3F9VSZ0YmEgxc3L9/SyT5T4f/yKUVx7Bj1Nt+oEvsmQG
         VQJ2tTxpin1TnAHTVIhcqHVpvG9n9IfVgMxGs6l0UrbVF9VyH17c6GpMG//M1htGnb8m
         0/BS/pZtFXeps0X6WHP7YptlCrtK5GfAH2xlM9o71A8NheLf0mYVuMWNDge+6C2GBx4h
         vtJ8HzutlP+9xIDn7Xz4v8iifJRmVi2ZXBXZF9XBO0RFwIPDldilGAanmgdRL+HCSpis
         OC+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+oFxDAll8dGtyrd+E10y47gRwGYiWN3UeaM2jcZ9GXw=;
        fh=ixlcz+QFucqbMaOH712FGZquBvD6lbC8qRkefWXJGeg=;
        b=lKPJrn6XQplwwIr/4obmlMw/IQUZfRPmULwzfKSbvJk122Qp8+trYFHU3Q9Qsm1+CC
         qECRvKACZvi83qfxdzxnQkSUwJSAJdBIqJGX3t4Pscawbyg5r2fWdkr9V3qdVij5DFdu
         lSBXHC7M7X8ESjEJ6bBC4tH/MMiJ63HyoDHfPYg707WC+fGRl1dD61+9brWIBZWPvyYu
         9vt5hTYlF+aHQfUuPcR8NSWpJK6zKoyxcsSrvkWO2b2pcbla2Zz27Gk8JtXzE5OtVISS
         HYjvOk4uCQUgUttTNHqpxowB5g/xSNELq1msc6+zg1i2p22ik83W24lf7RX3Jb1jHVTN
         IgBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271807; x=1793876607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+oFxDAll8dGtyrd+E10y47gRwGYiWN3UeaM2jcZ9GXw=;
        b=XAmXfFyxR37ur5ieYkpUjtc0G8B7XfPmNN/QJVLMm40nz0G3ycyjyEIPX5tjlf59il
         CMGtoROgxaFWYpUVFtqBpQDXWF1CsXLq+YWIoYLDA0ssMCFszt51ULbe/IWEYIFWg+Jo
         wePXQyzQIx1rz/BHtW0ZJjKH28dy6w1RgznDWiXhbKjdwaVbeVDt2iYCTqZzqf5IKows
         udP5s/lqTK7Zj/ZnB2Eozd+J+NE4iBmFlcY7jskXteh+vNhjd9YO5jz3M5dvrhRH4TUk
         aGo418N0Lq/giIhsVKwF6I+PbWa84+LNxtGwB5VavIQgheX3c9hpH2FaguMfjlY1Nx+k
         q8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271807; x=1793876607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+oFxDAll8dGtyrd+E10y47gRwGYiWN3UeaM2jcZ9GXw=;
        b=s9n6RqV7PYgeshwYo2/jGHzyekLvGLQAu8m4y7aTE24Z/U1vj9II5o4P9T6vChOl2T
         3SpGZr76uUPL8f7Ueude+t7TC9hcFIee6HYjX9A5wbqoBk3fvmjJYyBGKIAwkvC6Uh7w
         jbTlzxnVHIYVobhsAVuba5jFmcnrS4mpJtsqkT+0nq/85Di5PMiYmTH3zWiiJG7gtKky
         buibt4glI9Q3BZjtIfLprXfDriWOjiRomOh04J//jUazacHJfd2rEv0H/8gPdM7XnIa/
         RKGSmedkdydATOd+aTgHr35YRF9T8m1/eCxVq634awtxhadneZKzfDiXjNQg20I4IMoB
         JlIw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ/BGImz8Sbt/HC3fxRPCOQ9LcYEP7f1ntjHdRRjKk1bfGFpobWAZ9mczPCqaiGe1iKWkAWXhAqre2L3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4q+ZCV0UjFzyNJPkfIqLi64dRnK/VADtcr9B1fiszysu63GNQ
	xkUnRgiIKmgPiDP7ZTuxgmih1i3p5Zb2m4vrj9ceE4JRqRp1QNb3rec6PwXfYRlyYk/cT7ynFkP
	4MWG6LC7bx8yS4D+NPb8TlHrTtS0K8/4=
X-Gm-Gg: AYBFou3NnQFlITPW+7G6+/YzfZC1zfnCFTPBuaFUvW2fsi4tLUhKDeHdvNtWJ/1xqgf
	fNFifY1C6SLY8KhhEkOexKiF3FYsN6/BE81yZK/CciyOQ8YUK1KBId8s9L5FDPgBuPPSYZwgnL+
	oZARErL4FFCOgYT8/+RUtN/fNdmMUvnVzvMwB6aUthLLBZPWbVa6cDOgAqhT7iPPZUFuyJf51x4
	P97ujKGqOUsbouAdCTufKE2oBYVon81e4bmpIXs3F/Mh4SOh5vrL68qFSbBtnm7poTvOXIwHd+x
	XyotCV03geBw2dUDYZTpz8DCO9YAKvsNY5r5g47wZ7JJhqfj3re+bCQ7cBMXbYkHz46fYZE3YpX
	o0XTCMQ4WR50MZo/uhjITg7otZ6ReO89P+kmTnlR/YrSkRGCmW2pOifWC9d5t+C4ov91mGA==
X-Received: by 2002:a05:6402:34a:b0:6b4:1037:2bb1 with SMTP id
 4fb4d7f45d1cf-6b49cbe7cedmr2797089a12.22.1793271806191; Thu, 29 Oct 2026
 04:03:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028154008.67451-1-dennylin0707@gmail.com>
In-Reply-To: <20261028154008.67451-1-dennylin0707@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 29 Oct 2026 12:03:13 +0100
X-Gm-Features: AclHuK_jPOxWwcTntrGiyWxXQmQ4_F2fFzrd1WHf0WA2kaDI5_4JgryUKHV6fdI
Message-ID: <CAOQ4uxgDmhddqpFawaK874cfWCp4jVDnE67eqXyDA9eumpMEpg@mail.gmail.com>
Subject: Re: [PATCH] ovl: restrict casefold consistency checks to directories
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: miklos@szeredi.hu, andrealmeid@igalia.com, linux-unionfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:40=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> ovl_lookup_single() compares every positive child's casefold flag with
> that of the overlay. On casefolded ext4, regular files do not inherit
> the casefold flag from their parent directory. Looking up an existing
> regular file on a casefolded overlay therefore fails with EREMOTE.
> Symlinks, FIFOs and whiteouts are rejected by the same check.
>
> Restrict the child consistency check to directories, along with the
> corresponding assertion in ovl_get_inode(). This allows nondirectory
> objects to be looked up without rejecting them or warning about their
> flags, while directories with inconsistent casefold settings are still
> rejected.
>
> Fixes: 16754d61dc69 ("ovl: Support mounting case-insensitive enabled laye=
rs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  fs/overlayfs/inode.c | 2 +-
>  fs/overlayfs/namei.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
> index 63906b3dafcb..4428c50c3185 100644
> --- a/fs/overlayfs/inode.c
> +++ b/fs/overlayfs/inode.c
> @@ -1278,7 +1278,7 @@ struct inode *ovl_get_inode(struct super_block *sb,
>         }
>         ovl_fill_inode(inode, realinode->i_mode, realinode->i_rdev);
>         ovl_inode_init(inode, oip, ino, fsid);
> -       WARN_ON_ONCE(!!IS_CASEFOLDED(inode) !=3D ofs->casefold);
> +       WARN_ON_ONCE(is_dir && !!IS_CASEFOLDED(inode) !=3D ofs->casefold)=
;
>
>         if (upperdentry && ovl_is_impuredir(sb, upperdentry))
>                 ovl_set_flag(OVL_IMPURE, inode);
> diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
> index ca899fdfaafd..023966d89f74 100644
> --- a/fs/overlayfs/namei.c
> +++ b/fs/overlayfs/namei.c
> @@ -266,7 +266,7 @@ static int ovl_lookup_single(struct dentry *base, str=
uct ovl_lookup_data *d,
>                 goto out_err;
>         }
>
> -       if (ofs->casefold !=3D ovl_dentry_casefolded(this)) {
> +       if (d_is_dir(this) && ofs->casefold !=3D ovl_dentry_casefolded(th=
is)) {
>                 warn =3D "child wrong casefold";
>                 err =3D -EREMOTE;
>                 goto out_warn;
> --
> 2.43.0
>

Applied to ovl-fixes.

Hungyu,

Thank you for the overlayfs patches.

I see that you are sending patches to several subsystem, so I assume that y=
ou
do not have any specific interest in overlayfs casefold issues particularly=
?

I am asking because I got some patches for overlayfs casefold which I do no=
t
prioritize because I do not know how widely the feature is really in use.

If you are interested in reviewing or testing said patches, let me know
and I will send them to you.

Thanks,
Amir.
