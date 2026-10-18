Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6D93A1A3F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320415; cv=pass; b=Ur4lRoIhwKuMc0WhIP0lkBW/Hxr+786xbH64SPidpkzFBCX4ZcHq5BooR2b/yXOWcK1DGIm35sXui7gjkDKCPYsFRUe8cmsOQJiaGKACrWo+dr1zybFbRv+MCgKZJWUaINzT8pK3v/k1p9xBdIKacKeBs422l1LcAB1OyMPrfHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320415; c=relaxed/simple;
	bh=gDi2qRGYpC7t6XP62v74x0cJ1kTHHev/noEVAaVFzkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTOiqHN/gmTEOICsxFUv9mCj7/eYJFchzXiP5YqzWuWLs9ZX7M9QocYxe7Q+gad5xKE2lWQbYqQWzloO59y7IqVKwmubJKPY5JLdthbOKRgJXuQUGVePii7X7DZPZ+QugAz8PJ2un+/nx7cpThZrRUTQ7MSaQVJMxacOiqGe6L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e797fYdG; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e797fYdG"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0a921ee46so8717417b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792320412; cv=none;
        d=google.com; s=arc-20260327;
        b=ZklPeTD1iijR1si54un6T5n371MRUVEeg/DZcIa4y+Pk5z0f2PSJh01AKolzzCzaBx
         rPDme4aTaIcstlqcRuV/7LutujfLuNXrGvZKouwE7Ikq0Wx9EQMMG8u8QHLvfkbWvlvT
         inqkM8NcuSd9JOKYATA+a9zLdRYG0lzU0ckVrY9qpOh7tZE64fD7iUvBHBwsc7RdwRfW
         QtI8Dx6KIYXBGFtjyCKoMIFfzbv5rIsMaVceKMVu6JricDi2jiqLSllwbtu5SNpS2i0e
         I8IMYu6erEo5c6FZmowphkkT0Ql19EF5mwzzw+xD+lgbn2xJ3JCu7Vgm/5CW577QT8q/
         8m2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XI7h8DWXev27voeXONd2ATroV/uyMF7sTdDda9tNaYs=;
        fh=UMPyU9Vp1mEtkx8VuXgaj8r86fAvHmye4Ys0Og4nM7c=;
        b=RuZXp81GzizTbST/PEKtB07J6vjJ6rjLSYzsNjnSecP1LJwpvhi1R3ADaKl0PVnSx0
         Z3LqWhHbIcMFtSiv7srDCR+dXFYxVppSnypoBIrhPzSap+NYd4w0Z+pRazpWiveq6dUJ
         +q08lxd89VDIoUij9vGCGhT0juwQevH8P1nJZKsUO5TKF1W6EkBPSajcTlmqVQvAqj0U
         Z9K4Y21AzCEdD5X45NGMaPK6xFDtqbkuZNzWp1Pq0n6+LNDeMqa5dmXBHRzQhQYBc4QA
         L+i4IvVWcBSDkbFgThGbAsRtdgagWrhwv7us8bKWrv5r+WbMJtjUxqGkbgUFnJjl7tyi
         8yEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320412; x=1792925212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XI7h8DWXev27voeXONd2ATroV/uyMF7sTdDda9tNaYs=;
        b=e797fYdGR1ldrAZiQOoXeXz+TqTIN8jzYfdbt6CBE7+dpgxUYBnWhzVoHTWMyvSkVK
         53/gbsEiiDVMzN611zcrxh/PuW4R/RZX18eN04Kv3TB5K7Hoy5Wn5PTICOEHv8lTOVnp
         mGWYMp7BIzrNghsx2viuqztzWxf5P/XomUYaxhnz34Xf+Y7tfv7oIxSanZrg7U8I0KAU
         8+hZKnLOLjnB+c03zLJs+s5sLcVtE00Z4fLovcecqM7K4jdW/FKepfvczVKUysNx6S1y
         WFhoLCFKzLatlIyPdGbCRfsNQ3sdGUIBjXL60vv968uMSvQ9v+p7P+2oNpvq2ztPu+CS
         GqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320412; x=1792925212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XI7h8DWXev27voeXONd2ATroV/uyMF7sTdDda9tNaYs=;
        b=h5YXAuMZ+t+UylynZg+REt3Thu3v7waYg0Q+lrqIa2YJVl+c6Sr3wN3kkUv2iQM0y4
         xeRXrZuXjJeoyD1RvT1xpeZ3yxWjImeWfaXS7mYJh+uUojCIS8EP3405IeZ5vvTWMlQU
         O0v3GtEhr4f/oZUHXWJ9+Wd2uK5tkyzm9yEjWLX1fsyQ9sFg9dHi8+1EX76OHFq8lwbB
         f33YLqhAPsiJoyAo9+5VyX9/sF2f2OitahHkZrUL6DrfvqnhPiSz45/sqYDBzhi3S6MS
         6D/oGAuS3yIPL6a93U88PDK07/FqvNYBuZXsiavbcRTIvsg+VJzA/qXp6XEzM2N+LkK7
         hJvw==
X-Forwarded-Encrypted: i=1; AKwUvBwPZUVsrGKI7CxFVpeF8quCPH9JSyb2Tq25SmB+9IMjHiTM4MG6FuK60Vbq6BSo3eXICp+6tseiRpexqUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcqMX/hc4CvdpI3zwpw1sc6lL2zhoe7IKrPozD2eMlsxU9F4zf
	eVe1KNTsI9BIFy46YI8pp/4LkiAoEP5Ogezb+dlE32sFCGTGnZJasXif5z2Psdy/KPoxMtRoTng
	47gDF0Bhvzw2hY0bLyGfY9c9sL+5jY/c=
X-Gm-Gg: AYBFou3v8durMgIJjQhKqK4bGiNg8IEFvXp4n7l62oG12bE2xf+RY4SjjriNiBLdMup
	kQbPzerhcu9L6ZJ3+5KWOoDxD221SBRn0riQxXjMokz8NRN2zvcu4+Kzkq7Hw7aLaesj+AEm8O8
	nfbNyXQs/m5JUwwwDGGjGTOGGpvLysiD8+Y6r3A+X89KPSvPz36hRc7DOHncAV/Ap9AQcJvtrpn
	2i9Kr3dIrBqn+n9xQDu5Rt1MlViSzbCWmUrZtlWNCChUXl7eONT6pnIsHf1zommYmpmQRUd1Xmb
	1b2Kh9ftyMZvDkS7b4xecP4GOaCJ6oGWfqY0ZthOBBejZNPgulz4WHQSFJsvHSRod77nLcTVnxr
	5ZrNetttG2Y7d+SYHJnJvqSYmjSzjyW7glOLNf3x4n2XP
X-Received: by 2002:a05:690c:e641:b0:8b0:dca9:8fc8 with SMTP id
 00721157ae682-8b0f222d419mr8476137b3.92.1792320412001; Sun, 18 Oct 2026
 03:46:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006072656.11800-1-kartikey406@gmail.com>
In-Reply-To: <20261006072656.11800-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 18 Oct 2026 16:16:39 +0530
X-Gm-Features: AclHuK-RAZT7Na--g9ccWjyoz_p1DtsGnYagg9xEOmW9962sA3EnYu_JqstF8jU
Message-ID: <CADhLXY7pg6i6jvF5oeNB5YUAkoQTrrPJVAGiXBZBg-sXc1qzDA@mail.gmail.com>
Subject: Re: [PATCH] jfs: fix slab-out-of-bounds write in jfs_readdir() with
 multibyte names
To: shaggy@kernel.org, rppt@kernel.org
Cc: yun.zhou@windriver.com, arnd@arndb.de, brauner@kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 12:57=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> syzbot reported a KASAN slab-out-of-bounds write in utf32_to_utf8(),
> reached via jfs_strfromUCS_le() from jfs_readdir() while handling
> getdents64() on a crafted JFS image.
>
> jfs_readdir() converts on-disk UTF-16 directory entry names into
> dirent_buf, a PAGE_SIZE buffer. Before converting an entry, it checks
> that the name fits by assuming one output byte per UTF-16 unit:
>
>     jfs_dirent + d->namlen + 1 > dirent_buf + PAGE_SIZE
>
> With iocharset=3Dutf8 a single UTF-16 unit can expand to up to three
> bytes, so a name can be approved for space it does not have.
>
> jfs_strfromUCS_le() makes this worse: it has no destination size and
> always passes NLS_MAX_CHARSET_SIZE as the output bound to uni2char(),
> so the converter believes it has room regardless of how much of the
> buffer is actually left. The conversion then writes past the end of
> dirent_buf, and the trailing NUL can land one byte out of bounds too.
>
> Fix this in two places:
>
>  - In jfs_readdir(), reserve the worst case of NLS_MAX_CHARSET_SIZE
>    bytes per UTF-16 unit when checking whether an entry fits.
>
>  - Give jfs_strfromUCS_le() a destination size (tolen) and pass the
>    real remaining space to uni2char() instead of the constant, keeping
>    one byte for the terminating NUL. Clamp the length in the
>    non-codepage path in the same way. Callers pass the distance to the
>    end of dirent_buf.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Da2748ba908c108e7e525
> Tested-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com
> Assisted-by: LLM
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  fs/jfs/jfs_dtree.c   |  8 +++++---
>  fs/jfs/jfs_unicode.c | 15 ++++++++++++---
>  fs/jfs/jfs_unicode.h |  2 +-
>  3 files changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
> index 8ce6e4458cc2..5ccc90e3c068 100644
> --- a/fs/jfs/jfs_dtree.c
> +++ b/fs/jfs/jfs_dtree.c
> @@ -2738,6 +2738,7 @@ int jfs_readdir(struct file *file, struct dir_conte=
xt *ctx)
>         int jfs_dirents;
>         int overflow, fix_page, page_fixed =3D 0;
>         static int unique_pos =3D 2;      /* If we can't fix broken index=
 */
> +       char *buf_end;
>
>         if (ctx->pos =3D=3D DIREND)
>                 return 0;
> @@ -2892,6 +2893,7 @@ int jfs_readdir(struct file *file, struct dir_conte=
xt *ctx)
>                 return -ENOMEM;
>         }
>
> +       buf_end =3D (char *)dirent_buf + PAGE_SIZE;
>         while (1) {
>                 jfs_dirent =3D dirent_buf;
>                 jfs_dirents =3D 0;
> @@ -2910,7 +2912,7 @@ int jfs_readdir(struct file *file, struct dir_conte=
xt *ctx)
>
>                         d =3D (struct ldtentry *) & p->slot[stbl[i]];
>
> -                       if (((long) jfs_dirent + d->namlen + 1) >
> +                       if (((long) jfs_dirent + (long)d->namlen * NLS_MA=
X_CHARSET_SIZE + 1) >
>                             ((long)dirent_buf + PAGE_SIZE)) {
>                                 /* DBCS codepages could overrun dirent_bu=
f */
>                                 index =3D i;
> @@ -2961,7 +2963,7 @@ int jfs_readdir(struct file *file, struct dir_conte=
xt *ctx)
>                         }
>
>                         /* copy the name of head/only segment */
> -                       outlen =3D jfs_strfromUCS_le(name_ptr, d->name, l=
en,
> +                       outlen =3D jfs_strfromUCS_le(name_ptr, buf_end - =
name_ptr, d->name, len,
>                                                    codepage);
>                         jfs_dirent->name_len =3D outlen;
>
> @@ -2981,7 +2983,7 @@ int jfs_readdir(struct file *file, struct dir_conte=
xt *ctx)
>                                         goto skip_one;
>                                 }
>                                 len =3D min(d_namleft, DTSLOTDATALEN);
> -                               outlen =3D jfs_strfromUCS_le(name_ptr, t-=
>name,
> +                               outlen =3D jfs_strfromUCS_le(name_ptr, bu=
f_end - name_ptr, t->name,
>                                                            len, codepage)=
;
>                                 jfs_dirent->name_len +=3D outlen;
>
> diff --git a/fs/jfs/jfs_unicode.c b/fs/jfs/jfs_unicode.c
> index 0c1e9027245a..bcff7e0031b2 100644
> --- a/fs/jfs/jfs_unicode.c
> +++ b/fs/jfs/jfs_unicode.c
> @@ -16,27 +16,36 @@
>   * FUNCTION:   Convert little-endian unicode string to character string
>   *
>   */
> -int jfs_strfromUCS_le(char *to, const __le16 * from,
> +int jfs_strfromUCS_le(char *to, int tolen, const __le16 *from,
>                       int len, struct nls_table *codepage)
>  {
> -       int i;
> +       int i, room;
>         int outlen =3D 0;
>         static int warn_again =3D 5;      /* Only warn up to 5 times tota=
l */
>         int warn =3D !!warn_again;        /* once per string */
>
> +       if (tolen <=3D 0)
> +               return 0;
> +
>         if (codepage) {
>                 for (i =3D 0; (i < len) && from[i]; i++) {
>                         int charlen;
> +                       room =3D tolen - outlen - 1;
> +                       if (room <=3D 0)
> +                               break;
>                         charlen =3D
>                             codepage->uni2char(le16_to_cpu(from[i]),
>                                                &to[outlen],
> -                                              NLS_MAX_CHARSET_SIZE);
> +                                              room);
>                         if (charlen > 0)
>                                 outlen +=3D charlen;
>                         else
>                                 to[outlen++] =3D '?';
>                 }
>         } else {
> +               if (len > tolen - 1)
> +                       len =3D tolen - 1;
> +
>                 for (i =3D 0; (i < len) && from[i]; i++) {
>                         if (unlikely(le16_to_cpu(from[i]) & 0xff00)) {
>                                 to[i] =3D '?';
> diff --git a/fs/jfs/jfs_unicode.h b/fs/jfs/jfs_unicode.h
> index b6a78d4aef1b..ea03dd5a0e0c 100644
> --- a/fs/jfs/jfs_unicode.h
> +++ b/fs/jfs/jfs_unicode.h
> @@ -12,7 +12,7 @@
>  #include "jfs_types.h"
>
>  extern int get_UCSname(struct component_name *, struct dentry *);
> -extern int jfs_strfromUCS_le(char *, const __le16 *, int, struct nls_tab=
le *);
> +extern int jfs_strfromUCS_le(char *, int, const __le16 *, int, struct nl=
s_table *);
>
>  #define free_UCSname(COMP) kfree((COMP)->name)
>
> --
> 2.43.0
>

Gentle Reminder. Please let me know the status of this patch

Thanks

Deepanshu
