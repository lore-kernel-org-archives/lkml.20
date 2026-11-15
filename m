Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794750978;
	b=ZPAojafUMH+OgySbdTN3QMzRVPbmQuC92vbYhAzQkerxy5JWQpDuhudKS4gIu8F2z8KL
	 inyVdDsfxzD29KaJzjQ573J/n+TM7A8iXY8vhkqyAQzVxFc4umpz6jU7F8wmbdxyGtVZu
	 BAGJSri86+vUAkXXJzws0pRfvUQUv1c/42kMwA7WKCfxqVGkUxtf6Sp2rSlINznCCeaic
	 39+Hh7rvKAQ3lBH1Kgq80qs2RCmiv9LDYuoGKDZbxKKIH5gZAvzKvo6QqinPedLDLi3BF
	 oR5R80NZuWMoWFIGq8vhrnEmxma5uErrfoN9JYyFE3M7+A3w7zcVflKCI2KyaQWO+Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Od9Em/x+NvN3lfqg2Ym8QEdwQwbppSrGHelf46kRO+Y=;
	b=y28iDsjeMoa6mR2xxMJ4DQkl9huXoM2DzsFFeqj43i+kitYKuYjT1SkNF/fhXEvHXwE3
	 CqdjvSl0mjGU7bNWgzkjrAvIdk7PPlI47flUPt8vDsCGhtN/8klafJKu1C5JmlMRHnZ+A
	 3f8m1smcm1eo5EHL1eBzlw7TsYUg9V+qtVRBYJB8UINDYHQTNrINtfgT+dgGGpHWYqdSL
	 h1N14NSELHpLEDYMdC1AkQXBN20yJEGzwyxhJ5iVyuDv31hjqGy2hnBmRqsg4CBjIV8Mi
	 MedTn10FOk8Gtsmw/KcGTafJykOLgFCeQn3gJ8kblkHJAYulVxdTHoluEu+5nLGfGLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="olp3/QAQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB82606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB82606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=olp3/QAQ
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b360828905so24118317b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:56:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794750977; cv=none;
        d=google.com; s=arc-20260327;
        b=l4l8ThDzzReR7S5MYBEtfxqgt5GmZ/LTsPw6JlB1465Zd7tGut+2Yzx0NjwB8Y9l/L
         yonNf3F4ndHuHh5KfzV/BCaRMAGxfDrJjPKXuOTTHo7QsJKcR5Eel2BM+tNMa1YpJl7r
         2zAzchtY0t2lN8i+ungm5y9W75b40k9UoxrnCuib0RsErrZV5ZSgep+i0IAho3pWFSuM
         DVk+dL+7qXEB0x2SyA2AYRQvyS96Y+VXooP3YBM4IcfMEvcavJHvMkVD/MHoqqwHaeCZ
         PS12qqWdYiqHeyZOlJZviNPtJWpsq8fWDQ2L0B/DUoTifXSV5tp0qNzJ0hEm+VLpyCHV
         3Jxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Od9Em/x+NvN3lfqg2Ym8QEdwQwbppSrGHelf46kRO+Y=;
        fh=baGhchcXT3W8VeB8TXIAGvpkT/gK2Ub8fgTzsfZa6Mo=;
        b=aQ1W9RV/4xlgNj1Y3FyDKl3jafbdlN7ADMTiJpHTrGEqdrw2MFYjQ8hLUhA/91UIYs
         MbVleL/a1Nmfvp1FWLF9yitg+NF/OjuWCh7jjA2H2wLqsvIycwM8+IPc7KnXRbS1P7b6
         zSTKkxE8Q9zrp+VGiObxDcNbIlRAw6r3gevndxfFn6+vmtOohQCalgzH+J3uk/dHLiro
         2pCgOqv2dnktqKXtirhXpd05Rly3acK3edNs+N2QEshG3ujbIE6hXYxv7qlSnUk33eRs
         FocpaQDo9z87J3V9yJYAyzUFmeIM/i04OUeK2aXgTIGqcT+pXmextEXQTywYGmc97PCU
         x9bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750977; x=1795355777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Od9Em/x+NvN3lfqg2Ym8QEdwQwbppSrGHelf46kRO+Y=;
        b=olp3/QAQK0CS6leP3cB809sdCzHs5KOOjUiQmaJGXQQOswzntMPELzMdGgqdNXNY5f
         yg5wQL6ljx9EY66fnW0GG3dOsKT6DMq2uN+qwyfNgqGezj15SaJ7xzfys60jmdn0SG7S
         0j/9e5qCe/usazoSQHRrUmrvBGnHAljoFjt6FVfht2pd0bzeFv48Zg/F+UD3X1iowc3L
         mp7k4abvqpagvfZnHc5pj68i2wlertqubazpMIJC8VNa/fHnXFULti8OI/xXa7yk4SIy
         6RlobMvF2uhPvvUetv0ofGSx9qtg2tXlOW82z0wzDz3IQe6WQtRc8FLhPSEXFdB4vyMq
         pwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750977; x=1795355777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Od9Em/x+NvN3lfqg2Ym8QEdwQwbppSrGHelf46kRO+Y=;
        b=CnKbUD6AP/6KyHsIoKUzbInbaWixbJZCugek/CNG99pAcv53wPI7mlTjdclQWB/SGl
         yenalzVYU//q8yY71yDvPqB9WgggpUTmvlWdYPFqlQE7YdfMaK6TS4lN/Ek58IPnpj0P
         u56F957c04e2DIsJzbGLbQItZej+hKWdyOldrS+nl//rvsapJSF5CLQRDf6ciRMZFWM9
         jAIXyeXC/MUzt30l8lRXExl5+C2rOb08GdVHPBAGkVMUClu6Fin6J/tu2Rh/K0Znr3Dd
         pORf09MnlAh8n2na1D4p80K+hdh2IxP9JvQGZ/DtJXse+zg0teSmkf9793Ur9+IdKnt+
         51qA==
X-Forwarded-Encrypted: i=1; AL+hErFIzvMdO6R6L7MytqQl7B0GO2hTf3vfq9x1fZUoDMUtrbSkvSeLTwkDavRFQCoZYPLU+79f4A0CJw3PZhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j6T/E7afQQmm45OSzYSvbJgJthoTpZIO57e1kfLxFPaQkJ8D9
	U6o7kSgwpIEpWbGlNnEvV7dibs3O4wVIAwGNyVNB8hsqLMwiOChI2O88xrSKdrwyD9H587lG3In
	j661RVuWOsYYjccu5sjpTx5PI9qTuk1I=
X-Gm-Gg: AYBFou3vUSJMjHZFLl53Vn8zSoLcMdO30B76X5VVzjNC6kKFf8Alf/DWagJIFvFtIrd
	Wqps3/ctayZWyQQE8BUe9rCva7NmioK0rP0Bw/xQPM4RwTENLQyu8bCh4cQq1d8lqLp2xJL3EHU
	ZRNYzXmoBWlv7Klg+Xq0Me87bRIHtX3ntQOeYNe6ygMZ2bx5QVGua57GSeTDYWNWdwNfTuSTtvZ
	Gc0uYi/CjA7ox3wEaT1/JnVt/W60HrJ+dICQ0roJW8JltnvMIZnRm5QOw0nv4BTTXjdffGMa82W
	HgQDrDlS5GNIg4Q43ShVyfdMumwhTLRMBmvxQ8kVBeeowuXpre+yqLBjmNOMGn556p/YjCVxBOU
	3CY/SM7oWfo9ELIuXWV5JjrB+DN+6e6AtmoZlqDeAUBh+uzgrfmLy4h2iadqvJLxP/BS2Rfk+o4
	CuR/WeOgV3NxsrYKU4z4a5kMrQQcOvCqbNFcKxVtuAvsaK50T9UNBrNQ0uYqYFUzYgLknB+JgWD
	3M0djIbHFI=
X-Received: by 2002:a05:690c:fd1:b0:8b4:d44a:c4ce with SMTP id
 00721157ae682-8b4d45a0d5fmr4815567b3.82.1794750976988; Sun, 15 Nov 2026
 05:56:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006072656.11800-1-kartikey406@gmail.com>
In-Reply-To: <20261006072656.11800-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 15 Nov 2026 19:26:05 +0530
X-Gm-Features: AclHuK-Yt46GrzPhwpGMPSuMD6fF22jMcJaWn37C59LDY2uaAzVUsljw2O-cD68
Message-ID: <CADhLXY4Ys58zoXuSEuhii0aj3mVsAAhdQKQNs+Epuf03633Cew@mail.gmail.com>
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
