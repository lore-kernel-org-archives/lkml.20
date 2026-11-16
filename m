Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824742;
	b=bGpwNM51Ge2kh9QVi7CXykdGQ2KqzyV/x3W7rDr0hGmVNsJ7wVvX5XaLG7Y8hmhmOeR3
	 ET2mYbNzdLXvITYEHI8V7nOZNJuZcNU7Tjvns1rJR0MdMQM89igvrmlrbSOZJ3HLXEQHC
	 WnNZmmV8mpaDtCdSuB8ASAnERuZYPtSMfpflyMQS6jbO0g9gQvq84gUVRi0sQiBS16aoR
	 fRdd5wbQaSXj5csfYIG+FBwLpS/Wy1bmOsz+w7kjTQIyYPEWKDyfLJ8USAMEvsq6Z8N2/
	 YnOIF1U0hmgWnCzp1yNkU0KdAxLdRpu2le2J0MLrfFQF4AlQ1dVPpFfhCeAENZChN+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3GcZLw9WZbtrok71apo+O/eYnzOL1rHeQ56wrw50NMY=;
	b=MviCvURKaVIZ5npKitZNEhSPU49H8yVxXMV0AfZY56O3smu7FkiexQgJ8kxmTvjkrceX
	 6xlmX2Kh6UkiKsmqh0euMmsGZh5m5C9+ztVqgyPPrwk5w7FlACsK5eHHu8+YBLf5JzA+F
	 UENffyuxeT1vx6Gld0siLPI4Wo9KJKZn9IiFEBh5jqVxgTkkKWMRJpJNZWbchI/cvH+MN
	 NZ9IapDMCGN2IjZQiJTGOKeacSJ+81QptkdBlQLufTiK8OfZf3yuI8Cn25PrFfvLULhnt
	 MJIoosnhI34zlIkpb52DGL8I6pZm07Dzz4qPgRyHzpLmR7PWAz9XXwdbJFeQAFYRc4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoxpA8a5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE18606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE18606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoxpA8a5
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so4283641a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:25:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794824741; cv=none;
        d=google.com; s=arc-20260327;
        b=Rp8CF2BzRWYHUJTK9i6IEozqqEvPmI232uzSeET46dwdOhqRTNr2Tk6xHxtCCxa8cX
         FZPSC8YdGG28T6GMhVJRwQkK85xWbaw0HGSZb+OzZDjVLCQtvulmkU+qiqFlOHn3mud2
         DfuvATBdKzS8PHmU/SUXinSftlJMVhu37AZGUvyH4vwch7a/hQmu23VXqnxLHqbvKWEg
         TdMNN9lqf5YH+K6Fui4GJlmEjrEIYX19XLHYmXPImEWAmN1CkqdD9hfA+iQo0kwkg6+O
         Dn5/EgbNXhL/vhqzXulXxiFSYdOdbHZwoa0SQivJdZ48g299z8LdVaD03P/Ai+jaUMec
         Jaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3GcZLw9WZbtrok71apo+O/eYnzOL1rHeQ56wrw50NMY=;
        fh=D4KqIB6CafuTX/K6l2moTnY6l88ECqIUmyCTgGv3/kY=;
        b=cmA2iKb/2E7MBdb197S3X9ik3yTKa7u0ltVUF7Th4bzMEZDI9l3F7wr/oU4gVhpro4
         bKh8kVJ7xP2nABVaNMdglrh6pFODkV6BJy6ej0q78EX4eJg8ZuYuqwdWFGs7Xm6YO7Vz
         Aou7MfazcQL4JATeTmYJFfhDsqI/MasmzDGWDOisvbE8g9o5RaRjd6R59AkfXGem9TGY
         OCeCtqQLSXu8Q4zLj0PwkzmbRJAmGshO1MH7AYHQpQG7xt+E7SwdKNBMxiDWm38W3cBw
         BPrYfhs2irr50aWrdoR+veM95myQMyGzrft11rAAUz8/YcqJQs57NaoTi7Oh9CiG7yvp
         HzQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824741; x=1795429541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3GcZLw9WZbtrok71apo+O/eYnzOL1rHeQ56wrw50NMY=;
        b=FoxpA8a5gWZOiOu4kERAMuUcjyr54gqPoKqiCFVaESBeI/u9TZiW1xZ/8iGXSeL3Ru
         wggr7cd49XGc3Nzx9fjFQIzsVPlWqwNb/33jZlPsYOLZl9dBJczNhPUF9HTIZ3+Sq2DL
         HgpJEHIaYVeehKTXuwao+M7tue+uYok+bSoKtMvnZ5q2JhxF1YJGNEIyjjhAMWVM/k2r
         A7liHN/ZMi28w7H+f9Am4XfgAPAwWkrkdyk0qm/IIwAEOLKwHVBWyQ0GoCjPXrJsVgVn
         jcUnTibHbnEUKqt0uWhMgZLL/kfLxFZVkPj5NQhU8tT0FPGJSUD4UjZqKzOqU/uj6cub
         Zl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824741; x=1795429541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GcZLw9WZbtrok71apo+O/eYnzOL1rHeQ56wrw50NMY=;
        b=YqwrCr93hIhk7uebSDaP5GN+pn8XJGZKgjvXbO04ziBFxEWFaUmhw8W1t9cqVTSt4G
         G01NY9Jn8eVoUscMpJ7Lgdc8RZOH/aD8O3faSD4fYOp2PWK+kvWCe9krT8Na/br/cAaY
         JN6SBB2VAFvrSJ+QWfD/+PEWf6E5STcy8iUCD8jK4s/yTMinKW/pxeC6gfWo6QlCPIwt
         Qvp0EqR7DWTHiWPPKV+pRv5kfRrGaEPOBZ1Lj+IH7aDQA1AxIwOzlBBCpWNPruIRSb35
         9MI3+vG23+7rsTpZo04zhdyan5T3Dl3EAV/pOZW4beRf2uGIUQ6dRAGNc8Bo3s8c1E6p
         g68w==
X-Forwarded-Encrypted: i=1; AL+hErH5k2VCA6Z+vJT9+FL64DGzBQY9IQWzFetWIl4zXPVCEhMNoUwl7yrZ8epoVGfmpr/nuAGkroS3gG/8Aq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z968v11zEiKdDH9irecLl6nx+fgglWC/ScI6JnraFgH4xwj89J0
	+fCUTo5hlMHZTvMxJprhbN67b52AWwSbHFszLfH/8HhfWN19n6nKYdLDCXcHqJwO4sSc2mT+JDj
	Wu0uQdhPV+UgslyaZ1CTmdFwgesPqv4U=
X-Gm-Gg: AYBFou3Ljk7fmZzqBp6SDdrutiHpPRUz7Njxhq8xXErpPpuC9J0jrzvZP+ykbX/u7PP
	nHJbgmkI9lOy2IzUttKlISlWEJ+vCXoZRb6TJ2nFOHGi0CAcSTZkyYTBGWJY9332xiAod7MVUx1
	xrnYxfs3Mbp5gQn0dQLmFKciXh68l7Jee/eKuZMzzG6DjtEuDEA46X+axFbrI9XFheO9ja+AQW6
	kz78s2hVaH4nibogsNu8e6Zry2+yp2h5nnNmGQb0KZBmzHTiCjDtLdcYjjNVydNmf8EMnGvMZgM
	hrz8n7Ah24EUYy47JG6zkQnIpfxjtCE6CCdpfMPBjxMt+iqa+m+D0NCwXVaCISuxgs1Wai4sJa1
	DHeQs6oxXS/bBYzqKsvsYvvagOX8Y1FCt7BsXsqk0a8QDoxY9neJDZYCLv+e1AnJoojj5siE=
X-Received: by 2002:a05:6402:44d4:b0:6b5:79f4:8d52 with SMTP id
 4fb4d7f45d1cf-6b7c0bdfec5mr5191329a12.20.1794824740409; Mon, 16 Nov 2026
 02:25:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com> <20261115210952.2140036-2-graypanda.inzag@gmail.com>
In-Reply-To: <20261115210952.2140036-2-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 11:25:28 +0100
X-Gm-Features: AclHuK_tvQFpSUcAQinoG9gfJrRW-rTLlA06tTqM7lEBJqVuldEYzXKf_TrLdL0
Message-ID: <CAOQ4uxhZS1w24GXWphu-PNPbGxVJUDwOfqHdRZcb05+_HVv=aA@mail.gmail.com>
Subject: Re: [PATCH 1/3] fuse: reject embedded NULs in readdir entry names
To: Junyoung Jang <graypanda.inzag@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:10=E2=80=AFPM Junyoung Jang
<graypanda.inzag@gmail.com> wrote:
>
> parse_dirfile() and parse_dirplusfile() reject '/' in dirent->name, but
> do not check for embedded NUL bytes.
>
> Unlike plain getdents() buffers covered by verify_dirent_name() in
> fs/readdir.c, FUSE READDIRPLUS passes dirent->namelen directly to
> QSTR_INIT() in fuse_direntplus_link() and instantiates or aliases live
> dentries via d_splice_alias(). A dirent name containing an embedded NUL
> produces a dentry whose d_name.len extends past the NUL terminator,
> which allows callers such as inotify to copy uninitialized kernel slab
> memory past the NUL byte to userspace.
>
> Reject dirent names containing NUL alongside '/' in the FUSE readdir
> parsers.

My concern is that there are innocent buggy servers that pass NUL
maybe even because of length including the terminating NUL.

It would be more considerate to make this check in fuse_direntplus_link()
rather than to fail the readdir.

See precedent in:
78d04af4995a1 NFS: nfs_prime_dcache must validate the filename

Also, verify_dirent_name() never checks for embedded NUL, so all the
other filesystems can get away with this without failing readdir.

Thanks,
Amir.

>
> Fixes: 0b05b18381ee ("fuse: implement NFS-like readdirplus support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
> ---
>  fs/fuse/readdir.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
> index 1f6cf565477f..e8b47c2a9103 100644
> --- a/fs/fuse/readdir.c
> +++ b/fs/fuse/readdir.c
> @@ -126,6 +126,12 @@ static bool fuse_emit(struct file *file, struct dir_=
context *ctx,
>                         dirent->type | FILLDIR_FLAG_NOINTR);
>  }
>
> +static bool fuse_invalid_dirent_name(const struct fuse_dirent *dirent)
> +{
> +       return memchr(dirent->name, '/', dirent->namelen) ||
> +              memchr(dirent->name, '\0', dirent->namelen);
> +}
> +
>  static int parse_dirfile(char *buf, size_t nbytes, struct file *file,
>                          struct dir_context *ctx)
>  {
> @@ -136,7 +142,7 @@ static int parse_dirfile(char *buf, size_t nbytes, st=
ruct file *file,
>                         return -EIO;
>                 if (reclen > nbytes)
>                         break;
> -               if (memchr(dirent->name, '/', dirent->namelen) !=3D NULL)
> +               if (fuse_invalid_dirent_name(dirent))
>                         return -EIO;
>
>                 if (!fuse_emit(file, ctx, dirent))
> @@ -307,7 +313,7 @@ static int parse_dirplusfile(char *buf, size_t nbytes=
, struct file *file,
>                         return -EIO;
>                 if (reclen > nbytes)
>                         break;
> -               if (memchr(dirent->name, '/', dirent->namelen) !=3D NULL)
> +               if (fuse_invalid_dirent_name(dirent))
>                         return -EIO;
>
>                 if (!over) {
> @@ -461,7 +467,7 @@ static enum fuse_parse_result fuse_parse_cache(struct=
 fuse_file *ff,
>                         return FOUND_ERR;
>                 if (WARN_ON(reclen > nbytes))
>                         return FOUND_ERR;
> -               if (WARN_ON(memchr(dirent->name, '/', dirent->namelen) !=
=3D NULL))
> +               if (WARN_ON(fuse_invalid_dirent_name(dirent)))
>                         return FOUND_ERR;
>
>                 if (ff->readdir.pos =3D=3D ctx->pos) {
> --
> 2.43.0
