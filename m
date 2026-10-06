Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2072F0680
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268311; cv=pass; b=PBkaWBN8MJFG46lMMFmFnKMQk/LSbR2KweTWn13aPeXvb6cirST8kPXJYAAQfYhsxqa1phxpS/6X6Qo4iIV3REnhlDybBPJAv0ENaF+ScMckewZ6My3nbC16+Kw6kOIQ98yLFNPPPgib2CF8YwU1Dw00gauo0DnCxaBbDki3rT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268311; c=relaxed/simple;
	bh=+SmgQsUe1v0xQf8oZhSIGd87bFGAkcSEGRXbQfh1wgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnCFoGHMedSOExRWlYz2qA02IgGYN7Bad28GKl/bvsXQ8SYJZLkqMLj3WYf4IfdQ/UL7fZ+O86+0WAThf/RJcw6IaV9K7hIugxTvMpM6m0541TdleNO2RVtA2xN7YEXAhgR8jsKe22JUpsdlDXW4MzNZrpXMxFqB2anwiIH6AVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NhEKmfoM; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NhEKmfoM"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so161441cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791268309; cv=none;
        d=google.com; s=arc-20260327;
        b=F2+oZTnJ0BIDTX6lD30TaUCFcPB0IjSDVpg7bsug60qGQWlLGFvk4fUgfAAPF4aUHB
         dY62HL1QOx+QZYYcIc66/hl2Usp3QcN5Fp/f/wmmp0bbrAAFvJgDphl5bnwSsc8Msb99
         N0zK3wyCkvSGtU7K+ttkCDla0ImLDMrurNNGm7OWQqKCPFJZeMQwFQ6U5L1zft5qaWmY
         esoImqzXcP7PtUwL2qvV6DXDz4noRBfv0P4QIEA43gIedKSSZ/93v0Yb+2XsRrlpnUaq
         mO548rLKdAiN88pxCD6S3z3JgRxMfU2opVphrqAfqAKR5TJmiQPXS/GoC/bd1QEDaPC6
         CszA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/qMNv6LWR2p5Dhoh0FprqlZAOF+nV46g7vnoxCUDTw=;
        fh=5H9GMrIAUVTZqUff8cisn2rkroMiIQflAtoJ60olZms=;
        b=hlrdZ8B1sRo/C3g8hkAOWzU8aTXa75N6JQ96n6OWyEmOKt5hhiK2/qd/w/5Xd2g1iy
         xRVlMaoVeFqYRa7YmJux0rp8L7+ZT2lsb3estc7eisCHbu6oJ7klCQESaHBSxy3qGubs
         7LDqvX0CgbJmqw0yuV2TD8zzYasOIBDpVGAUQciMgTnX3kH7Td1/SCCeIshsuXcu9oRK
         owpuVq9lnQKIGWWLvRWYyTiJv2rtQr9+Q2M6uDMy3E3rD61s1e3VAeu1h88tfPFYb6L1
         foEOZ4zFm2lFaRt4sMBpXTTmNlLtNUOf5wrPuMGMTEYKYGhLofjz6VIrLAVHYRPUENps
         wxIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791268309; x=1791873109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T/qMNv6LWR2p5Dhoh0FprqlZAOF+nV46g7vnoxCUDTw=;
        b=NhEKmfoM1aRhp1hpFYXbfTuV94q9SvdKWohjFKijggTRWXs2d+sa+NCWg/tHNUjwQF
         MFT9l1cF7+jwQd0SsaMPR0EMy8yBrH7pVBjo9O5eVCkAJaG7erTAoBFZA+DP3Qj/gcdh
         RLNKuB6hDXTtjeCryIuMlFinT5Y8xZgjqdLRqGFjfNlqwKIAQTnqni8Cld2J3kv/quUc
         F1lFYPLAAJnCgSZggw/mlo8u4mNbkKzzcUN9Odifu/ojE06BfNWWY1sifz/TXwOhgyRT
         O2fElUIiO9Qm9mX+XB1fSq1OakQN6RHRWhGIi5dtnJmWivfueG82DGhRZU13fy48x8Rg
         6aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268309; x=1791873109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/qMNv6LWR2p5Dhoh0FprqlZAOF+nV46g7vnoxCUDTw=;
        b=WRDBK72Dv3WK6yW0P0eJOajr8VzyOu0w8xBmcL3rZhvjI0HjUEuyunPZ2ZtndNPq0z
         pC+M/UsiCEru7C4EOUdFp2G1vvow+z60Cmu+1zTT4padwQrpfT771UB7KT3bszFTdqE6
         LgEUMfxBFDWHQMyPtvKzsNGFgk3z9fmcAmzj40H/hI1H3dsfll1iO3QDMlH+iIxatvEs
         JJBOMx4c2TLiOfoP7eZA/7IE7qNiCWfQDZ75qmEJWVw9oMu9t0D/a2wqaAkkBy0nkUJ1
         XbZWuWUu5wtNdgf2F4Dy9VM+YvElJzQ9wjffuwe37ImVXxCOBghzqd3v5Itjufk/AJQT
         Y4Sw==
X-Forwarded-Encrypted: i=1; AKwUvBxBX2liT9QzL1u+0zUP88h7GRm6x0Mk+mu0m5YycdyKCpUPIOPdbOcTQrFv1DeSww9mXWSyEFclutyGErk=@vger.kernel.org
X-Gm-Message-State: AFuF++mCgMUkbSBdPRBTNA10hXyNOKMiOfiJk/Lr7j5kEgmzhN12Cfiv
	Sldsdyb/R+xzHTT+jzw2vo491i20Logt6nSlEZEWUfkCRVwQgFlzPZet/E7KZHngYcSjlL6nlXT
	ysBZpq+3RYfRCaoIwNoXFrMVvOPWU9KT5RFQquoa5
X-Gm-Gg: AYBFou2at1cX+v7EiCl1awLnGyXNphvmR726P0bx3uCcjcXEjz4GrCUSvJK/i7fnBVT
	LdkPRJBEmKtN9SUP+B/W4ZmRj3Ukp13N6BaEafr03pQZnD2zDLXxCU9YRWnoWQDlO5zWNJQ+HZn
	z3cVXouUdZ1HHbkPH4Z0mimyBQ/dT1fRGytHnU5fplM3GZ7bgxXGLecgeLlMJKhQsovuaV/Vu3p
	FBeAmW8X3DGJ5dRu6BRk7JiiCUG8Cc93/xQtO56iSH9qpyTfKl+uoXfNw6YjR13jrDJLrjt27Pf
	mqOOdqzI6FZYhOqsAxl/yKFt6+rZ8W84YlK2bcTdZYBgQKOjZzcQAX4Rp1gGmnSh3iQQRvsiuED
	yFmhH/t26EtSCBNXSsl35CWJytPq0Ch1St5E1p1bxHlNszkj63pe6+J4UxmYg3bTJVI5uS04HyF
	bdz1Ep1spXrLJ4dTYdt9b+2sUwgcM=
X-Received: by 2002:a05:622a:60c:b0:531:34b9:2532 with SMTP id
 d75a77b69052e-53540678576mr9157571cf.4.1791268308385; Mon, 05 Oct 2026
 23:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005122036.718976-1-senozhatsky@chromium.org> <20261005122036.718976-8-senozhatsky@chromium.org>
In-Reply-To: <20261005122036.718976-8-senozhatsky@chromium.org>
From: Brian Geffon <bgeffon@google.com>
Date: Tue, 6 Oct 2026 15:31:11 +0900
X-Gm-Features: AclHuK8GDz4mlY-X1mZLOSHDZHkzlHRRhdhy6_5gaDfAVaftmiXzawHiqYiSonY
Message-ID: <CADyq12wsysqxEy_7wms1TyHVXOvpmS88WoO2_N3_Cgnr9vF9Zw@mail.gmail.com>
Subject: Re: [PATCH 07/10] zram: zstd: do not use kvzalloc() for zstd allocations
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 9:21=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> When a dictionary is configured, zstd allocates all of its memory (C/D
> dictionaries, compression and decompression contexts and compression
> workspaces) via zstd_custom_alloc().  zstd_custom_alloc() uses
> kvzalloc(), which falls back to vmalloc() only when kmalloc() fails,
> and kmalloc() rounds such sizes up to a power-of-two number of pages.
>
> For example, on x86_64 with a 110K dictionary, switching from
> kvzalloc() to __vmalloc() reduces allocations from:
> - CDict (level 3):            512 KB -> 400 KB
> - CDict (levels 12+):        2048 KB -> 1552 KB
> - DCtx (per-CPU):             128 KB -> 96 KB
> - CCtx workspace (level 3):   128 KB -> 84 KB (per-CPU)
> - CCtx workspace (level 14+): 1024 KB -> 764 KB (per-CPU)
>
> Use __vmalloc() for allocations larger than PAGE_SIZE (and kzalloc()
> for smaller ones), which is also how zram allocates zstd workspaces
> when no dictionary is configured.  zstd_custom_free() already uses
> kvfree(), which handles both.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Acked-by: Brian Geffon <bgeffon@google.com>

> ---
>  drivers/block/zram/backend_zstd.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backe=
nd_zstd.c
> index b367049f131d..7a8b5ff186f2 100644
> --- a/drivers/block/zram/backend_zstd.c
> +++ b/drivers/block/zram/backend_zstd.c
> @@ -26,10 +26,17 @@ struct zstd_params {
>  /*
>   * For C/D dictionaries we need to provide zstd with zstd_custom_mem,
>   * which zstd uses internally to allocate/free memory when needed.
> + *
> + * zstd allocations (C/D dictionaries and contexts) are large and
> + * long-lived.  Don't use kvzalloc() for them: when enough physically
> + * contiguous memory is available it serves them from kmalloc(), which
> + * rounds them up to a power-of-two number of pages.
>   */
>  static void *zstd_custom_alloc(void *opaque, size_t size)
>  {
> -       return kvzalloc(size, GFP_NOIO | __GFP_NOWARN);
> +       if (size <=3D PAGE_SIZE)
> +               return kzalloc(size, GFP_NOIO | __GFP_NOWARN);
> +       return __vmalloc(size, GFP_NOIO | __GFP_NOWARN | __GFP_ZERO);
>  }
>
>  static void zstd_custom_free(void *opaque, void *address)
> --
> 2.56.0.rc1.315.gc6ed9934b7-goog
>
