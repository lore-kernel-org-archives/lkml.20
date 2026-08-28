Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448E1449B12
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919823; cv=pass; b=hs9ZzIr1t7TikDQDibPTxNOb1ADsuSbTfRKx22C1oYe5SQCo/sO2Z3UPy8Z7A8sWaMidtgEJH5M4ohukFRXMs6X0WHIJ+4kiJqkTr9YOvhpcFECLKQ1cwuMGqZw6ZTyXjCOWyguTWxJ63T/qyVJvgLbFyShUYlUcvz/plSMsY10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919823; c=relaxed/simple;
	bh=jbnCdqbye1/+ycr398CqTnWMoDekXdOMK8Sg2cdpShU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHduR3GrCA0FRJoxfqnMgl9o0knHYxIx9LWPGxNcURU+52akl8FrzmaS6yGdipRtnHYjk6Sd77GCtycADM7kLmWU4DrAolRUGtNQA4b2cWIgm0dnAakgadW/b1cBIR3zMKguXQ5RzJCLN4HzdGe4lx/CnPjmag4/Tj+gk5KO3Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3nOvNpX; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3nOvNpX"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so3782834a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787919803; cv=none;
        d=google.com; s=arc-20260327;
        b=Pp0V2DQ4G1sHO/YqcVEvyehAn33rXwib9B3npbzAjg606EtJMkjuvD3bA9WLgXHS8e
         t7ZeZYCI4AqM8HaaXc04/S5wunyjsP40OiaJs0vyhfa1CfDeo+X2KtoM6Io3tLdMNBLQ
         vACPgcXFUppuhZBxMhujPAbr1SAc9pc+mtJmi7pIObfjde4H1WepChEZ7Ssw4FZaSTjK
         aF0Fwrfe8MMu1tyn0043KtQXdK5qDw/lSVnyDo+553Qme3pLRv8GTZfYVQjAD+a/yy2c
         qiFKSYk2vP/B/GBwr7gKP4CC+LfF2SEB1TuKTxnk707gSvoRCDyrao/Dw21GZq2qqj4q
         WPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PLuOPVgzMrabh8iP2CrClpX8J/e3bzGLeeBKYH4Ndlo=;
        fh=V4OMuYm+ChN7n0p+yET5frAtcjb4ooOK5gOCwC39QFg=;
        b=kv9HeiClJwAdUQW8jBBDY3gs/wFF0DvAoAVv9hv7LDUQ12NbF5y+bKd6hAzOlUzlgm
         W23XjNSFqgkHLBNioMIxSB7Akm07mUZhxcIIblC8f30Y2OPNF3h/N9Q5FdAxbYahtrGI
         AcfeS3Hf5At0/03reuiol0FKAByQfh4cJ8hQzrTQI0C6e7eNzhD6RkxjEcAUwL2POoe3
         kbeUFcjdw6MCnDmzTGCfFgKG+rrEXFKugF/UCYwxH9SyPRofCmnrLICGYR/BnqxTuIDH
         mZ8b9Y4ytFkPel31xQB2eCyLK4XrGdVO9QhTs6iLy5zn/2XKJqDpqiZppPW/ge5NsnZy
         P+wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787919803; x=1788524603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PLuOPVgzMrabh8iP2CrClpX8J/e3bzGLeeBKYH4Ndlo=;
        b=i3nOvNpXTDGvAAOwDRKcyOYW8Tn8hLWQt3LFjBmH2mX3MeFr1HGuLRaq21EZPvRF8g
         xtM3fK7wwFT4ao3PW/5BQ9r3YiQaQaT86Q+FG8RDmJFkzstl3IyimkR19cgiWsEYA7IV
         3JVtLJdy0hR/x72cc3uWw1OB87UxpyzBr0ivodgvflF9OllZ8CRb3UAFdKgML8QYIZmS
         MMBxUFtON8gFJDx3mTNQjbDV41NnRrgJHscWZKhwF0YGjsAm66vBv1mLrn6/lgfxSpp3
         tRtfEZKk5O/CbqjGpe04bMVUikR0f/ffIj1VQx0op9C8x13VSlMyDETtWu2y70ZF/pCo
         CWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919803; x=1788524603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLuOPVgzMrabh8iP2CrClpX8J/e3bzGLeeBKYH4Ndlo=;
        b=gf2oiBB0mfjeXnzqgB2HZmaMOoU+8mFgC7NNBMZXA0TYlTv3BHUzY8ZolpjueNFNsr
         MXZuzqA5XZTwmThNRckkaNYVmAVzQ1jmA3PxAFkH9Dz1XogCnaCFOk5C7YZylRNSGnvb
         TswrRXHj3p53rFa44qP4j7JJ8EG6YKELELgwjdQrmVc52zHKYmDvFSHZcLy04fU2Yp0/
         U41Y2wtqbc8GHqrS7ZcyoJIhWVeVw2zVoNYlE1SrcmY7YDz9rC5M6GSY+aJih1fqZ19t
         bJVwVAMl4QZDQYDSguCBH8YGIfqA4cGMBCSwokJgKMuDK+VAJ490QJT8wUYGjf92pOY3
         39XQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyZtRKJzMh4ctV8g7Bg0gELeJyP7ES3NTKqVb/jDvipssmlUV5z0wam7cTiTMxrukHAAjzZepuKcDqrHw=@vger.kernel.org
X-Gm-Message-State: AFuF++kfBt4mUBYE8dSS5bPzer+QADZvVESOSRZVykmu9XoTq39gQIwU
	g6W0R//nrvs4WOMTVtGIO56FJlbZY9Kq2t37fVUKZihVyXHHep5jaEP+KnmAtu49TrjYHxIaBh1
	PA/zrpSA+f9hqB3ARJSye/xrJpTly+4A=
X-Gm-Gg: AR+sD10lgg7SWRJg3xwVlsU7uTQQXbZOdCjjnjfRu5p8R77v1om9jMF0mcLVBukAq1e
	xUPw9aGAxMy2BdkpCjWzgtAqcuuI1hXb3cLC5OVfiDjpRgz6FHZaKrr/hWPzqvfk9MnE317H7Z3
	bsK97Wk9s3j8jn/N0Enz6Ikm9p64tgZY3SreyWIr/yb0SxcouCHmz2yoNRl+cqxxdVJeb3+KP2+
	Vq6R1VVPfWrb/GVZneidsNY8v9xyUYw1V4OzRgm+p44eZXihq/cJZzoT0lOPV99CowvF9Tuz5g+
	DKhYb5R7R4aGrKv1/gyTcjrai2n8j+lDejfRxGyje0rrCZ+znruJvm/i
X-Received: by 2002:a17:907:1b0e:b0:c1c:2218:f317 with SMTP id
 a640c23a62f3a-c2535eab9b1mr1082654866b.2.1787919803004; Fri, 28 Aug 2026
 05:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827170718.497-1-aa9736195201@gmail.com>
In-Reply-To: <20260827170718.497-1-aa9736195201@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 28 Aug 2026 14:23:11 +0200
X-Gm-Features: AcwNN1Xe-iVgNN_CSVbFy3js4YMDBqwZBjkmZg_1221I6kuu3xfgQZkLpUKwgHI
Message-ID: <CAOQ4uxjxDV0U9yrDA_StN968P_6cpjRAN2mBCx1c_RYd7BF4Og@mail.gmail.com>
Subject: Re: [PATCH] ovl: implement ->get_unmapped_area()
To: Yuan-Hao Hsu <aa9736195201@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Jann Horn <jannh@google.com>, David Hildenbrand <david@kernel.org>, Linux MM <linux-mm@kvack.org>, 
	Matthew Wilcox <willy@infradead.org>, Christian Brauner <brauner@kernel.org>, 
	"zhangyi (F)" <yi.zhang@huawei.com>, tujinjiang@huawe.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 7:07=E2=80=AFPM Yuan-Hao Hsu <aa9736195201@gmail.co=
m> wrote:
>
> ovl_mmap() passes realfile to the underlying filesystem, so the VMA it
> returns is backed by realfile, not by the overlayfs file.
>
> Address selection is not delegated.  __get_unmapped_area() looks at the
> overlayfs file's f_op, ovl_file_operations does not implement
> ->get_unmapped_area(), and the mapping lands wherever
> mm_get_unmapped_area() puts it.  ext4, xfs and btrfs all point
> ->get_unmapped_area() at thp_get_unmapped_area(); none of that is reached=
.
>
> vaddr - file_offset is then not a multiple of PMD_SIZE,
> thp_vma_suitable_order() rejects the VMA, and the PMD-sized folios the
> underlying filesystem already has in the page cache are never mapped by
> a PMD.
>
> Delegate to the file ovl_mmap() will use.  Calling thp_get_unmapped_area(=
)
> here instead would force alignment on filesystems that deliberately do
> not implement ->get_unmapped_area(), which commit 34d7cf637c43 ("mm:
> don't try THP alignment for FS without get_unmapped_area") avoided.
> fs/proc delegates the same way in pde_get_unmapped_area().
>
> Reading a 1025M ext4 file through mmap(NULL, ...), 97% of its page cache
> in PMD-sized folios, 15 runs:
>
>                      PMD congruent  minor faults  page tables
>   ext4, directly             15/15           764          68K
>   overlayfs, before            0/5         16186        2056K
>   overlayfs, after           15/15           764          68K
>
> Fault counts had 0 stddev.  Median read time 17.4ms -> 4.80ms, against
> 4.92ms for the same file on ext4.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
>
> ---
>  fs/overlayfs/file.c |   26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
> index f3d97eb146e8..0d985025f4c8 100644
> --- a/fs/overlayfs/file.c
> +++ b/fs/overlayfs/file.c
> @@ -13,6 +13,7 @@
>  #include <linux/security.h>
>  #include <linux/fs.h>
>  #include <linux/backing-file.h>
> +#include <linux/sched/mm.h>
>  #include "overlayfs.h"
>
>  static char ovl_whatisit(struct inode *inode, struct inode *realinode)
> @@ -465,6 +466,30 @@ static int ovl_fsync(struct file *file, loff_t start=
, loff_t end, int datasync)
>                 return vfs_fsync_range(upperfile, start, end, datasync);
>  }
>
> +static unsigned long ovl_get_unmapped_area(struct file *file,
> +                                          unsigned long addr, unsigned l=
ong len,
> +                                          unsigned long pgoff, unsigned =
long flags)
> +{
> +       struct ovl_file *of =3D file->private_data;
> +       struct file *realfile =3D of->realfile;
> +
> +       /*
> +        * ovl_mmap() hands realfile to the underlying filesystem, so the=
 vma
> +        * ends up backed by realfile.  Let that filesystem pick the addr=
ess
> +        * too, or one that needs a specific alignment - to allow PMD map=
pings,
> +        * for example - never gets asked for one.
> +        */
> +       if (realfile->f_op->get_unmapped_area)
> +               return realfile->f_op->get_unmapped_area(realfile, addr, =
len,
> +                                                        pgoff, flags);
> +
> +#ifdef CONFIG_MMU
> +       return mm_get_unmapped_area(file, addr, len, pgoff, flags);
> +#endif

That looks quite ugly.
Can't we have a noop inline helper for mm_get_unmapped_area()
fo nommu?

> +
> +       return addr;
> +}
> +
>  static int ovl_mmap(struct file *file, struct vm_area_struct *vma)
>  {
>         struct ovl_file *of =3D file->private_data;
> @@ -654,6 +679,7 @@ const struct file_operations ovl_file_operations =3D =
{
>         .write_iter     =3D ovl_write_iter,
>         .fsync          =3D ovl_fsync,
>         .mmap           =3D ovl_mmap,
> +       .get_unmapped_area =3D ovl_get_unmapped_area,
>         .fallocate      =3D ovl_fallocate,
>         .fadvise        =3D ovl_fadvise,
>         .flush          =3D ovl_flush,
>
> base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8

Since mmap is going through backing_file_mmap() probably a good idea to
pass this method through a backing_file helper as well.

But more importantly, adding MM people to this patch review, mainly the one=
s
that participated in the discussion over patch to fix similar issues
in 2024 [1].
Most of the concerns in that patch seem to have been addressed (?)

Thanks,
Amir.

[1] https://lore.kernel.org/linux-unionfs/20241205143038.3260233-1-tujinjia=
ng@huawei.com/
