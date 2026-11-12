Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516265;
	b=LfShc6fX7nH6QpUJOKVw+yHZy1w1QTXilE9dgkcamfn8/y4W1tdndGdjQp3ZO1U1B1eL
	 JGYPb9rhANBCtlR+RJl6TaZY/dB8LLirh94o46tMhaNUBQc6J4LDAQ14os0ndP6OWhiuc
	 9e5OBhklEEbGWKzv6gHG7Thcd0qQexpcD81Oow1YETdkh8OO7zlsJyzRTEiSk9TX65Fam
	 whIsknvOz6j5Vd7J8smTwKg9koffKwg1ZkjVbXznu3c7i6egms2J+Z0r/0mGKHH0YhtpY
	 /h1IM3UTyB642g6bNs03mglOTU/l4KVkdDsSdBU8gPVCLub7X4+GO1PcLx6X8mEacKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=1x6aqmAQRrynAIsDlQ7a6VDqmeWzlsEVjpZnIZpydcQ=;
	b=1K65F6/qAx7MQKEz+PGgS+qoDs0XzKZfW4M9yAopFz8Q3UmTK9KgVw3LTwZ1MInLQ5UP
	 W9c+QtaWMumBOW3gDizH0+pY0UnSuOiWr3a9Gk1gfp/La9l7mDj7EUZyEVDoG3pf5iAOX
	 bso65BrgY39E7p5lc07gTj96uDMxaHTvAmqAikpYLknirlRueSsHEFRHGHhbOhgio8kCX
	 VbjX/57YEgXcSqqFyiMRjhxw+wULjtu/L6r/j1ljjW/dOjKQazfukcJqMvzRnUYuTGach
	 cMUQVZOzj6fVdEGyJshpEHYrhzpmKfmN1zc58/03t7rv5YDTRzp7VHnj82zuoGH+KtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BBpdXZel;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A879606A8A4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A879606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BBpdXZel
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67be5d0e9cbso150600d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794516263; x=1795121063; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1x6aqmAQRrynAIsDlQ7a6VDqmeWzlsEVjpZnIZpydcQ=;
        b=BBpdXZel5kBePXjqDY0dAG2uVor93zVHv83A9d2dtD22Fvvh7VbD802BQqMtV+zPhX
         0nThnfnv7QDqRt+LaVCOO8CDqrq4QYTZ2ypKNKkph3Wh5xEjsUbH4zezhpEb8CKaVu+5
         pIzSzyg5EwUEp5K9iAQ4IYODZYgYiuQ9JkbLGWRxm3uI3MfMfVZyhHXPo/v0FAuQAQ3V
         e8uico/h6SQx+I2lbc/JDoc80a5Zf7gRlq1uv8Om1IaiuWLlGSg/se8AXn0RGmE7Z3rn
         rAoON2hOFrLUjmyBwMkQ0fyunO11YE+r4XVjvRHq4yZr0L9V5OC68+Mfr1Sz2LfSk7WY
         3bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516263; x=1795121063;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1x6aqmAQRrynAIsDlQ7a6VDqmeWzlsEVjpZnIZpydcQ=;
        b=q+XZjiG+eEaFLi/kRrKBPrKDWQxOnDuGCIe9/QwHP09P7kDMKAdJx29fM4keuFzHth
         PvsUoJNUQKxaLTzHjOxUqFte1MzLDzEZaWCZbPW9YV50aHgXp7SjjHmWHSGNGwTKKLlw
         ohk/nHmihtYIf9fEZDTLXvFzK39lfsy8CKX9SuwLxSRJXefnOjnsFp4ok+tc6I5+Jze8
         wL15Usv0UT5vKTnm9q5NYbZc0jS3JjGoP7/vIHVIvh3Uh9+ToKU81BrqOAWbuZgFLE8a
         rWLHdO5L5ORz3BGonIaVDYZ6cJNTirINKpdqRuLduB2QKkagpIdsSGv5i1F1hLqEh5So
         hkFQ==
X-Forwarded-Encrypted: i=1; AL+hErGEiXuX8eTjR77kTzrsGiZh2AQhnre4Agxg4JfRLk3h5oe3viOacrSzjpentKHWqSKidgw40oJPEMD1nWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zbqLnWOSvFrJPVXcs5IkYwpx17g9HlDeCDFVfNwVce0wHZ6jD
	5xiha7K7PGWoX01VGxRWwUafZ6JlB3mfIBsh+4JcDw3IeYK5wiadezIDYXBW1gzPPr0=
X-Gm-Gg: AYBFou0Wr2M322mK1gwqa87cw/sNBiXBMff/byfDy6EBNGm4fCazivqx3OvHlyNUEU8
	/uljl1giXtxqrKf1DqoKIkX5qKNrVczP+r+IVra2FW1QzOdY7cwqKVP1/Z7UlqiFoE75gJi4M79
	E5qplMrUd01Mq7TLejv6uijR8R/j4Pgaq2ml/XHliK6q06sVIAj/vZL6kUIZCdqXDNFQz+1ICRF
	ewYljmu/HFh1Ozr5g3awl1r9e3CQa8kZ5ghB9y00kD0dy0cJ6sUx1cOQeMAA9j65UnL2KMAqfUg
	V6ny7TznsCpIphmSQU29xf9VZ1ilIiuhsxuVa4XJ550EOZZkaVNFVDG6r/IRwXKr5ubMebPjca1
	XQZjYIbWttsWt4N0zREjCJfnSW2uPSGzpis51l92WI8zK5AcIXt46xUw9WoN2pNHt1cwGqy7zjS
	GffU8cEk0L4fdeQynY8g68eG8ZuKRu1602hZXkVttOrv09aBbB6mS0pSDDUFIodAgXvZCaZU8Rh
	+3pLZfKQHn0lz5BWmkaslYcrATZc2FIEvQWuzGp4mB51RR7fvNmHUr+4+NumFBZ9DcPEv6blfKu
	AS3m4LZHfsMQyl3I0WKH8GR87vBsOdLL9hgTz8D4S6ViEgKfFuvhXCx6SPC8/llZnHdbLugW1M7
	KYBsgg3ptgqVTGMsKYbvOcWP9kT4SIa9QUoSG0PWgZV8TZRR3m9m2W9gPOvCdbh7o0VQLitI=
X-Received: by 2002:a05:690e:43cc:20b0:67c:33d9:791d with SMTP id 956f58d0204a3-67d89639442mr211820d50.48.1794516262929;
        Thu, 12 Nov 2026 12:44:22 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:3a31:6c95:5610:70f6])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9da90bsm4665597b3.37.2026.11.12.12.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:44:21 -0800 (PST)
Message-ID: <0205ef88738917a6d307b4e334e2dd1b0851317b.camel@dubeyko.com>
Subject: Re: [PATCH 2/2] hfsplus: do not end readdir at i_size after an
 unlink
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li
	 <frank.li@vivo.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 12 Nov 2026 12:44:20 -0800
In-Reply-To: <20261112111745.4094283-3-hengyul@cs.unc.edu>
References: <20261112111745.4094283-1-hengyul@cs.unc.edu>
	 <20261112111745.4094283-3-hengyul@cs.unc.edu>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
 NFdvziOa4FgUBC4X71upsZIoZJeii2V/Jtc3B4g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-12 at 06:17 -0500, Hengyu Liang wrote:
> Commit 4b0496432844 ("hfsplus: rework hfsplus_readdir() logic")
> stopped
> moving the position of open directories back when an entry is
> deleted.
>=20
> However, hfsplus_readdir() still ends when ctx->pos reaches i_size,
> and
> i_size drops on every delete. As of now, a program that reads a
> directory and deletes what it read sees the directory end early and
> leaves files behind.
>=20
> The issue can be reproduced with BusyBox rm on a new hfsplus volume:
>=20
> =C2=A0=C2=A0=C2=A0 mkdir /mnt/d
> =C2=A0=C2=A0=C2=A0 (cd /mnt/d && for i in $(seq 1500); do : > f$i; done)
> =C2=A0=C2=A0=C2=A0 rm -r /mnt/d

Frankly speaking, I don't quite follow what is the issue of the fix. Do
you mean that we create and delete folder in one thread and execute the
readdir in another one? Or do you mean that application has several
threads and one thread do readdir but another one delete file by file?
How this deletion is executed? I mean which files are deleted?

Even if we delete files in folder then i_size is dropping gradually. If
we traversing the folder's content and ctx->pos >=3D inode->i_size, then
it sounds that we already showed the existing content. Do you mean that
if we deleted the range that we already processed, then we miss the
rest of undeleted items?

>=20
> Before commit 4b0496432844 ("hfsplus: rework hfsplus_readdir()
> logic"),
> the directory is removed. After that commit, the result is:
>=20
> =C2=A0=C2=A0=C2=A0 rm: can't remove '/mnt/d': Directory not empty
>=20
> and 304 files are left.
>=20
> This patch will end a walk that continues from the saved key where
> the
> records of the directory end, and keep the i_size check for a walk
> that
> starts from a position.
>=20
> Fixes: 4b0496432844 ("hfsplus: rework hfsplus_readdir() logic")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
> ---
> Application impact (Ubuntu 26.04 user space): a folder with 1500
> files
> on an HFS+ volume is moved to the trash, then the trash is emptied
> with
> "gio trash --empty" (the call behind "Empty Trash" in GNOME Files,
> done
> by gvfsd-trash 1.60). On v7.1, all files are removed. On v7.2, the
> trash
> looks empty, but 478 files stay in .Trash-0/expunged and their space
> is
> not freed.
>=20
> =C2=A0fs/hfsplus/dir.c | 27 +++++++++++++++++++--------
> =C2=A01 file changed, 19 insertions(+), 8 deletions(-)
>=20
> diff --git a/fs/hfsplus/dir.c b/fs/hfsplus/dir.c
> index b3a1193a491f..81fe8a3e07c9 100644
> --- a/fs/hfsplus/dir.c
> +++ b/fs/hfsplus/dir.c
> @@ -135,10 +135,16 @@ static int hfsplus_readdir(struct file *file,
> struct dir_context *ctx)
> =C2=A0	char *strbuf;
> =C2=A0	hfsplus_cat_entry entry;
> =C2=A0	struct hfs_find_data fd;
> -	struct hfsplus_readdir_data *rd;
> +	struct hfsplus_readdir_data *rd =3D file->private_data;
> +	/*
> +	 * i_size follows the valence and drops on unlink, so it
> says nothing
> +	 * about a walk that continues from a saved key. That walk
> ends where
> +	 * the records of this directory end.
> +	 */

I really dislike the comment in the variable declaration section.

> +	bool resume =3D rd && rd->pos =3D=3D file->f_pos;

Is it possible that rd is NULL here?

I don't really follow how the resume variable can help at all.
Probably, I am missing the case. Could you please explain the issue at
first?

Thanks,
Slava.

> =C2=A0	u16 type;
> =C2=A0
> -	if (file->f_pos >=3D inode->i_size)
> +	if (!resume && file->f_pos >=3D inode->i_size)
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	err =3D hfs_find_init(HFSPLUS_SB(sb)->cat_tree, &fd);
> @@ -183,10 +189,9 @@ static int hfsplus_readdir(struct file *file,
> struct dir_context *ctx)
> =C2=A0			goto out;
> =C2=A0		ctx->pos =3D 2;
> =C2=A0	}
> -	if (ctx->pos >=3D inode->i_size)
> +	if (!resume && ctx->pos >=3D inode->i_size)
> =C2=A0		goto out;
> -	rd =3D file->private_data;
> -	if (rd && rd->pos =3D=3D ctx->pos) {
> +	if (resume) {
> =C2=A0		memcpy(fd.search_key, &rd->key, sizeof(struct
> hfsplus_cat_key));
> =C2=A0		err =3D hfs_brec_find(&fd, hfs_find_rec_by_key);
> =C2=A0		if (err =3D=3D -ENOENT)
> @@ -195,9 +200,11 @@ static int hfsplus_readdir(struct file *file,
> struct dir_context *ctx)
> =C2=A0		err =3D hfs_brec_goto(&fd, ctx->pos - 1);
> =C2=A0	}
> =C2=A0	if (err)
> -		goto out;
> +		goto end_walk;
> =C2=A0	for (;;) {
> =C2=A0		if (be32_to_cpu(fd.key->cat.parent) !=3D inode->i_ino)
> {
> +			if (resume)
> +				goto out;
> =C2=A0			pr_err("walked past end of dir\n");
> =C2=A0			err =3D -EIO;
> =C2=A0			goto out;
> @@ -263,11 +270,11 @@ static int hfsplus_readdir(struct file *file,
> struct dir_context *ctx)
> =C2=A0		}
> =C2=A0next:
> =C2=A0		ctx->pos++;
> -		if (ctx->pos >=3D inode->i_size)
> +		if (!resume && ctx->pos >=3D inode->i_size)
> =C2=A0			goto out;
> =C2=A0		err =3D hfs_brec_goto(&fd, 1);
> =C2=A0		if (err)
> -			goto out;
> +			goto end_walk;
> =C2=A0	}
> =C2=A0	if (!rd) {
> =C2=A0		rd =3D kmalloc_obj(struct hfsplus_readdir_data);
> @@ -279,6 +286,10 @@ static int hfsplus_readdir(struct file *file,
> struct dir_context *ctx)
> =C2=A0	}
> =C2=A0	rd->pos =3D ctx->pos;
> =C2=A0	memcpy(&rd->key, fd.key, sizeof(struct hfsplus_cat_key));
> +end_walk:
> +	/* This directory can hold the last records of the catalog.
> */
> +	if (resume && err =3D=3D -ENOENT)
> +		err =3D 0;
> =C2=A0out:
> =C2=A0	kfree(strbuf);
> =C2=A0	hfs_find_exit(&fd);
