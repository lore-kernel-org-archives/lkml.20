Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741E24A2E32
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730513; cv=pass; b=CZLtdqEXmr4fzEzQYUE3kGxd4EhtVpvrVqZPtJExhRBI9Rpp0Jw3Xe0c63zAI4nQXubvVLW1nP8AvLuU2vadi0Pemz86Ku59ZoXiQQR/m4yDybfuqQ+UkeGG1/UnhLlnS8TJ6ZHiqHmQKdZX2c+x/2ZC1lG5fOZ+mbYFuKquwRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730513; c=relaxed/simple;
	bh=aVMqaa1wsxyksuPf1y+Bw1vC6h0emVwblD0wpVtgVmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxAdmwqrTROm9F5+GKwDZ5uq4RiEx5LhKVy8/1Dmk6hAWA8IJlOn0cPSTd+rRJ0qdXLSH3ebxff4pzHUWGOuI23sF8MPuUUGxgP5vwAsoDpQDVwTdpKYZTXMitgjEZeDiLUAvbYXWtHXJUivCQ17mdDWqgkvo+PDmgLuuCGf/Rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBKRCrjx; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBKRCrjx"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f55efe7so89470766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789730510; cv=none;
        d=google.com; s=arc-20260327;
        b=BXuD84aM2kSqpWMPMSWIv57eSCIm4OIaQ9qe2aTBhPQt0O3EkuW9jW4Uh23RPEEJhu
         7cLeAcTeV65mp9TUmgwls7vkcG2BSmZv29WEIW/kyKZqKqkvvLuQjnUA7fSHfEL+g+MV
         aWX1JCN3tUPx7qT9J3llsZO/lqZbeAvEY3+as/pHPmaJ+8ktNSYwka1+6PzbJ4IkU6GP
         XfeqGy/lSjCB3jOQPl292/ZoFvC/uYhoWKZyULWnO9OaD12uKDIjhCs2ibfnSSoZH7oJ
         CF68zMqAMv/jl7u3Ee7awH2OzR9DWK1h0/AL3WjjUSVufT9yWH4QCHdzDY3s29IaMP96
         n1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jKSq4TKqZvc86XYqBfmx7W3nhvu3FPRAbz93R+Fzbrg=;
        fh=BKQ5Xl0Tvi7T5UjsXcihH8nLykC/COpUmIZ0dB2Mqhw=;
        b=sbQOUJWffm9NpwS/L/vT2YvZhRxWk0CxQ6gIPmzZP7E3Yueo4jG631aUgPY7zjGJMR
         5cdWjN1BC3nFFJLF4vMOcicMorD0ZprqpGuJimsGk1ZiioMhDkI1TF6Z73mzz2WcyFNy
         qY9dMTgn7Jfb1dowBsoLLTQysqvdvmdJ3K+2fU/dv4P+DzNdYhb9wUqynGOOfg33ae7S
         eh1LMSlz4ax+74+M4UJopkcqGqKEU0Yud03x9Xe7ZsZR1dTN/4eIJu0JbA6tMV8UBEUj
         u4350f1rGFdFoqLRsd5ymX2/w/iyeFMBaeAXKRMxiPXlK9fyKI4vcC5GMnjaOoWZCWCu
         otbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789730510; x=1790335310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jKSq4TKqZvc86XYqBfmx7W3nhvu3FPRAbz93R+Fzbrg=;
        b=sBKRCrjxphuu6rvDkdGXRr2FBkE+GULT8h4O6BfIN+s51O8uggpfNH8PGdcZZhLb6p
         hGDbetO3GoE5wsJiWQu/xESn/eN733bgQ4rHMPHcdRqsxSNON/A+yk4pGyPalbtM4hTl
         ACmlTLL5bmm9U61yizdmM5x3sFTzNwlBVkeeAS4q4t06fM+ecrLh+oc7DhFxRC93QM2E
         mr5bFdUL2Lcnsovo9mP3PUYsTQpmWxVHOUKbK8MKS1dEdngQNG00CONbx71ADsU1QCg/
         ttMjGhceBmK4cqU+uLwGZCJnUsBuAtvk8UZnduYV1K9WllV3DTtDTAlDNU8+XboMbB+Z
         c34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730510; x=1790335310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jKSq4TKqZvc86XYqBfmx7W3nhvu3FPRAbz93R+Fzbrg=;
        b=qWeouWaAwbYuliD6cKYLrJcdDhLenXpu4uiFTKvYQd3ji6Pq9zljTzvk5kabDjMZKt
         hBJMBwIGEFs9ObliTYpxQowRSm/h0N4jgLJIVVamDx51q9JsbpNEYWEAAijtx9L9zVKQ
         N9IEGvSBeVKxQTGq6XnXbXA+5tmq1S7mEVXt24HeXEVO9/Cgn7yGUaFdy+MVPJjTaURx
         BRPVli9xZT9a6oTHGlJwbTMDlsgjKDOD7SWQJViw7+Lw8NVSlJ0H+iyVTRSCLu2zWlZS
         P0cILJ7Sz6JB9cIhxSUr9keMaE2/tpF3VlwbZ+tG54DxdkkXm7XCQXBahwXnyMp2rAoW
         FhVA==
X-Forwarded-Encrypted: i=1; AKwUvBzGOT3MKkdSKH6FBfxc1FiCDf/ILhcSiSgTekhhPfoAlvz+z8B/25qh4phv+xLbGujQYlcVDnD9zNdDBDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nJQPaeLo7H5Ur5YNZx8o+WFI0aM6jOxfRRMvuzcFibK39RZhsF
	ki3HGKX7EDqKqAqNNBakPmYtol+C/4xTXflyOXiESHhUz4NRKBHOvIOl/gmDZTsqdKtV7/0Y3GF
	tuaPp2kFXzfjQu1GQsH0QH12CFZXhgqs=
X-Gm-Gg: AYBFou0z9ZO0Q4yEKwL1xMq78BRewII7X/Mx1PNDLyrXnml5Fm8eCy90e0ZWgn0NTXa
	4PDr8rTPSdp+M1VxePOoiS0EJWWzK3UbOw9/4zGZjvF9CiUuDxd9YAAoAJgCyHMZ05zkAfx94Oo
	KjnF7FxjVy3/bNPGOUfGKYnaglXJBBXe4ZyZi6hVTIP3oKJWPliWldPdLUBNev8LUkcTBgW2UV1
	/5G7yE5Wwvj+sv2XQCbdo/kKQPe7VCFalusUZGgnOfW8TsKQi373+CiaT7OqDVRCRIRcylVsVnu
	LNcXM2zIkiwOJ/5pYfgNq+GTv2iO4PX7gvvQa2yQHK6eVyB/OUfliWcA
X-Received: by 2002:a17:907:1c9f:b0:c26:1691:b372 with SMTP id
 a640c23a62f3a-c2a15827daamr244550266b.43.1789730509415; Fri, 18 Sep 2026
 04:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aoQcvGw4UmkMKmUz@infradead.org> <cover.1789653814.git.matthias.goergens@gmail.com>
 <94348cc10b4f6f7f8e2a58ee385d5349560c0c9f.1789653814.git.matthias.goergens@gmail.com>
In-Reply-To: <94348cc10b4f6f7f8e2a58ee385d5349560c0c9f.1789653814.git.matthias.goergens@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 18 Sep 2026 13:21:36 +0200
X-Gm-Features: AcwNN1WISOAGs7TzKIvEPdxvXu7ggns3XShx5T4J7IVF6r9rO5DgbshMygSR5DM
Message-ID: <CAOQ4uxh17vkv3f8KMMUX7VAOA1W24dP-2JQ_wftMmEBthbvfFw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] vfs: add FILE_DEDUPE_RANGE_REPORT_PROGRESS flag to FIDEDUPERANGE
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, linux-kernel@vger.kernel.org, hch@infradead.org, 
	djwong@kernel.org, david@fromorbit.com, ansgar.loesser@kom.tu-darmstadt.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:37=E2=80=AFPM Matthias Goergens
<matthias.goergens@gmail.com> wrote:
>
> Deduplication tools such as duperemove, bees and rmlint find matching
> ranges in two files, call FIDEDUPERANGE on each match and advance their
> file offsets by the bytes_deduped the kernel returns. They rely on that
> value to know where to continue.
>
> The kernel does not give them a value they can act on.
> vfs_dedupe_file_range() passes REMAP_FILE_CAN_SHORTEN, so
> generic_remap_checks() rounds a request whose length is not block
> aligned down to a block multiple unless it ends at both files' EOF, but
> the ioctl then reports the length it asked for (the request, capped at 1
> GiB per call) in bytes_deduped, not the shortened one. The caller cannot
> tell that the tail of its request was left alone. Measured with rmlint
> 2.10.3 on btrfs with 4 KiB blocks: rmlint --dedupe on a 100000-byte file
> against a 250000-byte file with the same prefix issues one call and is
> told bytes_deduped=3D100000 with status SAME, while FIEMAP shows 24 share=
d
> blocks, 98304 bytes. rmlint's loop ends because bytes_deduped equals the
> file size, so it reports the pair fully deduplicated with 1696 bytes not
> shared. duperemove (process_dedupes()) and bees advance the same way,
> and jdupes advances by its own requested length without reading the
> field, so all of them skip such a tail without noticing.
>
> Add a flag that a caller sets to get a value it can act on. With
> FILE_DEDUPE_RANGE_REPORT_PROGRESS set in file_dedupe_range.flags,
> bytes_deduped in each destination's info is the length the filesystem
> reports as deduplicated when status is FILE_DEDUPE_RANGE_SAME, and 0
> when status is FILE_DEDUPE_RANGE_DIFFERS or an error. A caller advances
> by it as it advances today, and must treat 0 as "stop or subdivide"
> rather than retry unchanged. One cause of a SAME result of 0 is a
> request shorter than a block that does not end at both files' EOF,
> which the generic range preparation shortens to nothing before any
> remapping. On DIFFERS the kernel has no usable progress or mismatch
> offset to report, so it reports 0 and leaves subdividing the range to
> the caller, as rmlint already does.
>
> The default cannot change. Reporting the shortened length by default
> was done once, in commit 4a57a8400075 ("vf/remap: return the amount of
> bytes actually deduplicated"), and reverted the next day because
> generic/517 expected the old value and the effect on deployed callers
> was unknown. That effect is now known: duperemove re-queues a request
> while its status is 0 and has no check for bytes_deduped =3D=3D 0, so a 0
> with status SAME on a sub-block request would make it re-issue the
> same request forever.
>
> Without the flag nothing changes. Unknown flag bits are rejected. The
> flags field is an anonymous union with the old reserved2 name, so
> existing source that spells .reserved2 keeps compiling and the layout

I don't why you think that old programs compile should not break with
new headers. I don't think this is a promise from Linux UAPI.

> is unchanged. Kernels since 4.5, when the VFS took over the ioctl,
> reject a non-zero field with -EINVAL, so a new caller cannot get the
> old semantics by accident and can fall back to a call without the
> flag.
>
> Suggested-by: Darrick J. Wong <djwong@kernel.org>
> Link: https://lore.kernel.org/linux-fsdevel/20260805071414.3414870-1-matt=
hias.goergens@gmail.com/
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> See the cover letter for the changes since v3. Note for C++ callers: a
> positional initialiser of struct file_dedupe_range now needs braces
> around the union member under -Wmissing-braces; designated initialisers
> with either .reserved2 or .flags are unaffected.

I think you created a problem yourself and then solved it.
The union is not needed.

>
>  fs/remap_range.c        | 4 +++-
>  include/uapi/linux/fs.h | 8 +++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/fs/remap_range.c b/fs/remap_range.c
> index 26afbbbfb10c2..63f1b6f90c161 100644
> --- a/fs/remap_range.c
> +++ b/fs/remap_range.c
> @@ -503,7 +503,7 @@ int vfs_dedupe_file_range(struct file *file, struct f=
ile_dedupe_range *same)
>         if (!(file->f_mode & FMODE_READ))
>                 return -EINVAL;
>
> -       if (same->reserved1 || same->reserved2)
> +       if (same->reserved1 || (same->flags & ~FILE_DEDUPE_RANGE_REPORT_P=
ROGRESS))
>                 return -EINVAL;
>
>         off =3D same->src_offset;
> @@ -555,6 +555,8 @@ int vfs_dedupe_file_range(struct file *file, struct f=
ile_dedupe_range *same)
>                         info->status =3D FILE_DEDUPE_RANGE_DIFFERS;
>                 else if (deduped < 0)
>                         info->status =3D deduped;
> +               else if (same->flags & FILE_DEDUPE_RANGE_REPORT_PROGRESS)
> +                       info->bytes_deduped =3D deduped;
>                 else
>                         info->bytes_deduped =3D len;
>
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 34c6f219462a5..4e40855e1ef8e 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -178,13 +178,19 @@ struct file_dedupe_range_info {
>         __u32 reserved;         /* must be zero */
>  };
>
> +/* flags for struct file_dedupe_range */
> +#define FILE_DEDUPE_RANGE_REPORT_PROGRESS (1U << 0)
> +

This thought has crossed my mind - perhaps should be dismissed.

These are vfs internal flags to the filesystem dedupe/remap method:

#define REMAP_FILE_DEDUP                (1 << 0)
#define REMAP_FILE_CAN_SHORTEN          (1 << 1)

The above is a dedupe ioctl UAPI flag, which is not needed to be passed
to the filesystem (right?), so it's fine that they live in two
different namespaces.

In the future, it could be that a dedupe UAPI flag will need to be propagat=
ed
into the filesystem. Maybe even a flag that would be common to clone and
dedupe.

For now, using bit 1 for both internal and uapi is fine and I don't see
a reason to change that, just a point to consider for the future.


>  /* from struct btrfs_ioctl_file_extent_same_args */
>  struct file_dedupe_range {
>         __u64 src_offset;       /* in - start of extent in source */
>         __u64 src_length;       /* in - length of extent */
>         __u16 dest_count;       /* in - total elements in info array */
>         __u16 reserved1;        /* must be zero */
> -       __u32 reserved2;        /* must be zero */
> +       union {
> +               __u32 reserved2;        /* must be zero (older callers) *=
/
> +               __u32 flags;            /* in - FILE_DEDUPE_RANGE_* flags=
 */
> +       };
>         struct file_dedupe_range_info info[];
>  };

Please drop the union.
The text referring to "older callers" in this context is not useful.
It is quite obvious that the old kernel will not accept new flags in a
properly written UAPI.

Thanks,
Amir.
