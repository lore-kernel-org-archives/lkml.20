Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794754132;
	b=zcT9xINbdnywYj4fpz1QfPTTzNyA4DhuUOiYXt0XtWw9sAxRJTiHTOizcFWHiU2/56M4
	 PAMVP/cEfoHr6B+bSAMF3ZZtub59BosCiTIi7vggunoS3tdNdZcE0e81D4D7A7pN9NvhH
	 hiUP3QRGRUoKACZts8fVt5jstBFEOS50/8TG3QiKZ5kwDc7e7PEg4iElRExrEVssOf8hk
	 RUA30Tm/gmWEE2+X5qcIcUW3PY6Uu77zsuPGOMPKXAaaLishQzhcAWyqctMS5ZAvC+ZPJ
	 rIYeZ94dAj9RnkWUdKC+w01qG3zpNUTF3gz1N/Jwx9oC+xohwmAeZJLlPuNzo3xmLkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C4gZYNSTU3nUDa0BlNRCYypUaVksPX6JgKJOOi2udkU=;
	b=tlmrDSQ2IlvFA5IyZEtyHj/6EpBbnHrA/xqLu5CBxOzAG8F0b+jJvIQkepljTBb+77k0
	 mqjQVOfqFm3X+E6wOEVDHneSpqOp7buTxfTxyR3HhP5cZ9Z84piicDlOhvfBu4KXWQFzy
	 srk9mVt2f7tDofyuJaxxA5kIHqb321H2eIu+ZysF+Bs+1hMU13ELlp0ed8OEzh2admEsi
	 Fcv+GbQj8bqvvY/U2POwfVxwDXf/jv37teDDxFZXQH5N08cbPeTBooKgLP3uOs/WNTXgc
	 U1+0NVctNCycgumdUe9crf86P4x4bjzlGHpkNqUnCNX/VBNU0CzINnxm1r+6xleCyzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w5g/XQ3c";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C0E606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C0E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w5g/XQ3c
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so4030271a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:48:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794754131; cv=none;
        d=google.com; s=arc-20260327;
        b=idjwpkxHn9jrxAJxUnxR2Rt8h27ib7K2lPFhnvucJF4t47ln9N1K35J/S0aWwFwDq+
         sl3vkvO/Wsz9BFbbcfgkZA0sGrZfvR0kB5xfKu0rYpjySnyE1EQZ3y9yb9S9b9FrMeHj
         WWsVyubomyFRXFdXiJS7/ReA35FDKA6utIDhxx8MsWn/yxQRrteayk+u8gVtr0RXohcg
         oFOYdAGAfnaHYN/vIizAxzJDs9+cAaoux0IwjXuGMZNMYefY7kjeRL/NdUfaLbzg8IJX
         Qx53j5ByvptYODWOTLwBfPaspaTxBtMYEaQ/zMEBlCUa6XeSgiRIUpkGn6RUn8EsL5ZB
         aQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C4gZYNSTU3nUDa0BlNRCYypUaVksPX6JgKJOOi2udkU=;
        fh=rxXD9Rzmf1DLr5XzOmMEszFNDfwxT514PIMIWmO+be4=;
        b=N1WltNeq84I6SpUBx3ZOU0FqcFPjHXzwq0jPkKQht8vVGZfQvAT9MCjny0ucu/ORFx
         SYzcpUYKzENHCv3x+1kAlH1U6lJl9RRmsiGwsz8/300LxIEcd2Yp1cCfS4FkJ8RIaS6e
         PRZWU3rJLvDHFhsbO9a89nGcbNjbHSgVcIyaGrhs+TGifcVVS1avOUNukBqfWS11RCWg
         U5Frno8MVOf9C2Qg09CvGL2c/cDmM7X/z2eAxX8la3P9FnKvBe7LKvbES7W4id2q6l6j
         CWCbDeOuM/5qLsq6zOrXmkY/1ylVbsX3LlGp0ab1MJtp+pjkrIO+dg57djf8i1Piu0Br
         ovZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794754131; x=1795358931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C4gZYNSTU3nUDa0BlNRCYypUaVksPX6JgKJOOi2udkU=;
        b=w5g/XQ3c9k+Vmzjr8H8faYY5EnV44gyfCeTqkUEnB7IDVxBorehzGxTmotRUcFMd2k
         yEd9UzOdm44dKGOB9vhvuqA14zDF0izirGlMHcIkPmvfAWV6oC7EWoZSr/n7pMgjOayy
         4XbbykfX2tOLXKQEY71fD4ubWMAf5smyh0PUCbn4ouKSDid+wdpti8tnvMNzC9U0omm7
         PfP/4oysMFjcZt/QSyQgeX6xWgKvlNh0WDaR4PRzqjFkBPghAucojPZwp0HxO1dsPk5w
         0TrSxGukXHJtQczzx+u36Zh+VEpUmtRmnvhCaIPp54UmNZzIkin7PEC6+n43usjPmyxQ
         Zqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794754131; x=1795358931;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4gZYNSTU3nUDa0BlNRCYypUaVksPX6JgKJOOi2udkU=;
        b=BM8sqSGxPV8IbxT9X3WzTD7jdH7xApZEXAyLcGFLenBlWuCKn3y4JPl0nJpJgacJcX
         roH7JFTGo/rTJBm/BfHEzqMGXwHCSbv6iZILAw2qY3UMRM5CGdVXs/D6K/Xr0l5QUyqr
         ZQpehtxMCNXohYIvNrmMZRIWH5Ze7+Avr+1DBPvfLloLPaIw0TDCzYATipiukvM0PA7g
         w2GkkurkK0t1tIlki4RiqizFapQgdMGnFVR/r7S4F0hcCSw9oig3rMno2aVd6FIApQbI
         67P/xXYFKGrPo5ojNkn2viriZkPhn6Y3FsqtenSpjbYE6BqMMVfQFbnQK+bV0m8tytqw
         naGA==
X-Forwarded-Encrypted: i=1; AL+hErEUXw7x93fvhD0pnmcKXwco/I9mvX1vBFnGr2ml9Ri5w089b/q/qK4ebDez3wwjrVo5ovYqOR9nFilHGD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aqd4a4ux6GIyhdlMf+x+TKXmt510y7Lr4kHr5hWTVR7r7GpnH
	SjQoosFRsdtMZla2Kh3bPHWtTwmBEDV0gFcMnjm/WIeGlhcYPCpvCLZW2cvZhruzn8vZgoWo6sy
	VsPg7mb4hwZBOKraSosZJScYPFCUGWR4=
X-Gm-Gg: AYBFou0LojORAM8tQKThJJyYzJM8zW1e7T+3NEPa8d+RQ8/K3+g5yhJM7UX1xbjG+GG
	CTSJ4mAxy011cqBwu8h4cs4KZvxFjAf8Ty91s2w6O8sXoQiJCsle1oZwhrUz7Sdan+3MZVb4pCv
	WwXrp/bFjKoJiZmujrikqQsOfC9DgHRI7aszdSRTufVJNbvvxNDfiN2LUGuutMaidgPV77DHiQm
	rwsv2cglCALcq91kmy5S9Hg4KPgBCPHEj9/0edG30C3rGu4KpasKONCx+BpJubIwWKmexUhBygr
	eYjAtVdoQkUNT59Wg+0F0dz6YUZqFVEQIDlqfKpVdneA6x7BHJ9bcBz2iezpeXqedIw15ZqKRdv
	5IZf8VIPj1KZO8Gban8j1DhC9BCxAZjs5I3HCk6BKCteCegT3oaLDdXnxGU4KzHLo9KK/CQ==
X-Received: by 2002:a05:6402:1944:b0:6b6:edd7:790c with SMTP id
 4fb4d7f45d1cf-6b7c0d2c969mr5932123a12.45.1794754130672; Sun, 15 Nov 2026
 06:48:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-work-ovl-d_real-v1-0-ca155efbcb2e@kernel.org> <20261115-work-ovl-d_real-v1-11-ca155efbcb2e@kernel.org>
In-Reply-To: <20261115-work-ovl-d_real-v1-11-ca155efbcb2e@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Nov 2026 15:48:39 +0100
X-Gm-Features: AclHuK_loWLpZnEsR5-ArAPNE_f3U8cZmm7GbEpqPveHBdFtxvcWfTtvtccYOKk
Message-ID: <CAOQ4uxgiwKsadtv1Me3ZkSsTawjNey3wDDWVAnx6U0+Oe+uoQg@mail.gmail.com>
Subject: Re: [PATCH 11/13] fs: remove d_real_inode()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Chris Down <chris@chrisdown.name>, 
	Miklos Szeredi <mszeredi@redhat.com>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:02=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> All callers have been converted to d_real_data_inode() or
> d_real_metadata_inode(). Remove d_real_inode() so that any user we
> missed, or one that gets added in another tree, fails to build instead
> of passing an ERR_PTR() from d_real() to d_inode().
>
> Add a porting.rst entry.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  Documentation/filesystems/porting.rst | 10 ++++++++++
>  include/linux/dcache.h                | 13 -------------
>  2 files changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesy=
stems/porting.rst
> index c38f5df755bb5..28a24b702f2a6 100644
> --- a/Documentation/filesystems/porting.rst
> +++ b/Documentation/filesystems/porting.rst
> @@ -1422,3 +1422,13 @@ helpers take a const struct mnt_idmap *. mnt_idmap=
() and file_mnt_idmap()
>  return one. The idmapping is immutable so nothing should have modified i=
t
>  anyway. References are taken and dropped via mnt_idmap_get() and
>  mnt_idmap_put() as before, both accept a const pointer.
> +
> +---
> +
> +**mandatory**
> +
> +d_real_inode() is gone. d_real() can fail for D_REAL_DATA now and return=
s an
> +ERR_PTR() then, e.g., when overlayfs can't look up the data of a metacop=
y file
> +in a data-only layer. Use d_real_data_inode(), which returns the inode h=
osting
> +the data or an ERR_PTR(), and handle the error. Use d_real_metadata_inod=
e() for
> +the inode hosting the metadata. That one never fails.
> diff --git a/include/linux/dcache.h b/include/linux/dcache.h
> index 5b3b34d271bd0..2b15179e9baf9 100644
> --- a/include/linux/dcache.h
> +++ b/include/linux/dcache.h
> @@ -654,19 +654,6 @@ static inline struct dentry *d_real(struct dentry *d=
entry, enum d_real_type type
>                 return dentry;
>  }
>
> -/**
> - * d_real_inode - Return the real inode hosting the data
> - * @dentry: The dentry to query
> - *
> - * If dentry is on a union/overlay, then return the underlying, real ino=
de.
> - * Otherwise return d_inode().
> - */
> -static inline struct inode *d_real_inode(const struct dentry *dentry)
> -{
> -       /* This usage of d_real() results in const dentry */
> -       return d_inode(d_real((struct dentry *) dentry, D_REAL_DATA));
> -}
> -
>  /**
>   * d_real_data_inode - Return the real inode hosting the data
>   * @dentry: The dentry to query
>
> --
> 2.53.0
>
