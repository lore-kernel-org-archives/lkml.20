Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792651992;
	b=ctm/GQBUQSXAAtpEo49X49xJxLe+Biv2QU56dsfcAdNYidgCuBwfV5WxQW384KEbledR
	 eBv3AoNCszuUmjOTR3hTASkVPSPd9PTi/A81xMa5bHGkjAqbmfuQthqt5vCMHO1WbQrqZ
	 Yexb+ojs0JVIMHci7VfZk2BzNRyZgVeb+X6zZQmV3s2lpqsEkbCoGH/XdM+36QHrtEkyy
	 0ykwcOYMjAsBnnypqSuCHjB30JqQxNajNGRZEQSZE0KEM7idNQcAEJJ/boRXhyv8DoEEs
	 /vYm0jaFoSjSGMsg3drFiHWS4PojiwhJElg8eBX+cCh9xuSXMwr6kf5MopSlBIN0tCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rg3MYkiixfpOGWKpQ3X74Jm8FS7vqinp1afZZUlph/Y=;
	b=aACmyjMs3qrngSpkoxPDDPS9bQZMeBDxxouiS3zt15rwrzA9vyRlXCOaRYZ8YjJZkhVc
	 bC5O/LBKH/mtODz61Fl3hcmnseVTuVLallftagCZ/0XWqcbVbD4EPZHT1MjLCZe2A6OOu
	 aDNnJbDYzTI40UHz8JnaPJNf/wLQZg5BHTQRlHvAZIxb305Pl3ABmWSehMRdQgmZ1O4EH
	 4nXQffGzCPSW9AQkd+qAt73x340v/A14IPtoBtoxCjpn1d79FbHRxclqoz3lBPFZ9y/W4
	 ltGZ9YraQJVpxiMdkqP0lmV+uIyVbnopKIJ/LgnkUFOA8cKa2bAfAgz7tdbNUF1QUKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UASPXeKT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8217F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8217F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UASPXeKT
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2acc1e170cso214093866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792651989; cv=none;
        d=google.com; s=arc-20260327;
        b=h+pqhhUWgyhcJonJtS3uud74141UIL9jzsuTpf1GKCi35Ys+S4UsoUua6vO6mRR/O+
         iIob0RAtz5wRDePxbXIyVKZSN+/Xb2CXNyoo2XDSsh/+wkDermJxFWxURfnev3mEVoUR
         inNU0z79dFAEwOjPhLa5tq67UYbVyTYgNYhiezQfrTPAUPsf6K5wA6pDPldclJowiMcp
         1zaOb0ji4QQuKnt87hQHBvmYpJQgMsaPfni/NODHeszjXuaz3MVFJu9BW+odyOQXlgLm
         /l/rDm7yWu4nYHpmWEV0WFIGRZCu4WOiNACZPD7sW3TI1XT/8gjrbNi+dr8QYmpEKjZa
         Mh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rg3MYkiixfpOGWKpQ3X74Jm8FS7vqinp1afZZUlph/Y=;
        fh=tyHOm4tibJmRM1G89kBgeOr/Hksen11+vO+2HTtmkis=;
        b=QNWGDKq2SYMU4t2/AWShXAJydQCCJmpL0MKpR/knEBBtZKplFFtmNuW9/I0tO+jW4R
         17/HyGSTO0HkueMbHs6hR88k2f9QOFbTgsvJzL48WBj8CP6XkWOXakb68SdXX/B1Rzp/
         G/ku72Z3s4Wm2FYTBJED5b7YC6NFDT5KzuiORP9nnjrdqWkCBmlb3zZ3YRynY7SOCJY+
         /2bWqXt45vsA6RzFejuaD9FnLVneVzVcMDMMza8JTain9Ypnufim2G5CHOfFouOrNnbd
         ZSkKLKopdCluWyTzR+NA61Gwkv/D7M5SyERQvAv1agPvS+hrf62ZFLsi18+SoIM0n/XI
         y3ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651989; x=1793256789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rg3MYkiixfpOGWKpQ3X74Jm8FS7vqinp1afZZUlph/Y=;
        b=UASPXeKTAHaKwh8vbwoCb/VP+qE0e0U+GD6HxVbCrAk7FwuV+0cbhRwR2DbD8/Qnuq
         jh+AVCTR1VepsqN50RlZ4ixYRGFq+hph0bslye8bPQSntnR//lSPcGGIvXj6KNRFygCt
         hsZCSAGnJ2aSJcCi++AIXqcNN3/S3slWciZgiBQJF93Q4NetY1Mj7+kD4u9mxSl4YM2n
         5Qc9TCicOf+DFPRVErJO66r5A+5JLHeUECasDJytIQA7vD+aisQTkH5DvJKb4AdBE7VS
         +XGiovP0nPUKgRz6O1d++2NDRZnlysGRTjdWlyFPbZfAUzEnCkgQr3CAHbEn8DVgrTXr
         xM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651989; x=1793256789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rg3MYkiixfpOGWKpQ3X74Jm8FS7vqinp1afZZUlph/Y=;
        b=YMyyaer/kFVjizwOfR4/ExtF4/7Zi+rFotphmn+xBdwpBBD67FqSzyawZLMoIuOZ5Z
         3gU0k8cLSdFTQcnQUJgoTEISQPCaOeb4UEGQ5RY4soP16W3aCapwdmfYIVY2/Xk1s0Bw
         Z+tqhjVvJh0GUWvJrgq2yV5Oob3czOnAegrrj0ZWdZPEvFMqV9osTJgMahD3BYagLgrm
         l/LQ4j//4/mbaNJSQkzaPVRGvFzqY/gDXBD6BlTKgogFdecuh+W5GSlc2VasG6sV5gYY
         wCM92Pv1Lm/8C7OXYTd9GoSEnW+DI1k8jRmL+BSRnv5W52VIgcywRQbgGOLmjYApiwQL
         5w5w==
X-Forwarded-Encrypted: i=1; AKwUvBw1X1Jh9VTlL4bGd5tXcDNzXHEUzSMdkQ8lxrdYOD9x/tup+g6GCB5maZY4/+5moWmGirtDqlIeHxV7Hqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTTGrmItH+6qcgPuOpsp9hKY8Agks4TmwDYMTa9TVjenGnTZ+L
	gLNPe8yBC3ttwa5tSxJTloQiVSUV6Mec/yrCtKw7QSUU/ECw6q+tFGbsYws7+DyuxM6YBGH9f2d
	RDNWZXJOL6a25+MJXhxAf9FYQ4yE3mAY=
X-Gm-Gg: AYBFou2JHV2h8RuA3qp1ycLZ4q9V+iZy4SeVfwtKizbHIlQpmwu4z0aOzcaCP7fzvDj
	LcDNHlEPKLOxzxgG+v7x827uY2YjkS6kX7sEsYS882J/55sl2ldkUjcS507MqeAgBHbUW01vve6
	y4+vczmsP49/9rVrMZYYNrSnhAxDkZIrv09xUuVAXwn+q1RZUKrU/Xi8cCh7fpSXp3VDSrkwRqD
	yyTCbGkrwWqHF9SSZri2AvN8bQ848uLpvNLNFOYy5xu/A9OIK1GqSFxp/2j42IAykR69ysidJRe
	j37NHj2pTmjsRx03bEFBoUzxRnRh38AWBcO9jhbC1lki79MAvJC5KhAF0MGwGsjtrNOlQZQL+Ks
	ecOILLeAcuchp3T0Q9r8oiT1pyPTCvihdVwcfgybOS5xgx7Scwfe14Stj3Ge6OVtg129Rv9s=
X-Received: by 2002:a17:907:3e8a:b0:c37:8c7c:a840 with SMTP id
 a640c23a62f3a-c467966c0c2mr359451866b.18.1792651989383; Wed, 21 Oct 2026
 23:53:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019160615.2348500-1-nphamcs@gmail.com> <CAMgjq7AEg6XEUJPaM3mMBQAeS_KiDv8_za4w-R2WaZ=ZGenvuw@mail.gmail.com>
 <CAKEwX=O=PL3DEaEDe=F-=zhQ=VW3_UtcqesdX9fH_cr6orb2wQ@mail.gmail.com>
In-Reply-To: <CAKEwX=O=PL3DEaEDe=F-=zhQ=VW3_UtcqesdX9fH_cr6orb2wQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 22 Oct 2026 14:52:32 +0800
X-Gm-Features: AclHuK_1506PMfDGxQQ_jKcqLOauYM9YVlFaV9ZgB9uWuZJ7dc_z3c4TC8n9H3w
Message-ID: <CAMgjq7BSzYTbrzbA4vGqMbvegoHnDtJ0vA9PcwCet-m6Ow3ouA@mail.gmail.com>
Subject: Re: [PATCH] mm, swap: revalidate populated clusters before scanning
To: Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, linux-mm <linux-mm@kvack.org>, 
	LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nhat Pham <nphamcs@gmail.com> =E4=BA=8E 2026=E5=B9=B410=E6=9C=8821=E6=97=A5=
=E5=91=A8=E4=B8=89 04:19=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Oct 20, 2026 at 10:58=E2=80=AFAM Kairui Song <ryncsn@gmail.com> w=
rote:
> >
> > On Tue, Oct 20, 2026 at 1:41=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> w=
rote:
> > >
> > > swap_cluster_populate() can publish a cluster's table with the cluste=
r
> > > lock dropped. A cached allocator can use and empty it before the
> > > populating allocator reacquires the lock. The resumed scan can then
> > > dereference a NULL table.
> > >
> > > For example, CPU1 can retain a cached cluster offset on an SSD with
> > > per-page discard disabled:
> > >
> > >     CPU0                          CPU1
> > >     ----                          ----
> > >     swap_cluster_populate()
> > >       swap_cluster_alloc_table() fails
> > >       spin_unlock(&ci->lock)
> > >       local_unlock(&percpu_swap_cluster.lock)
> > >       swap_cluster_alloc_table()
> > >         rcu_assign_pointer(ci->table, table)
> >
> > Nice catch!
> >
> > I think the real problem is that it turns out calling
> > swap_cluster_alloc_table() without holding ci lock is bad idea... I
> > think this patch still leaves some other call site too?
>
> Do we have another callsite? There's a callsite in setup code, but I
> assume that's safe...?
>
> But at this point, who knows any more. The caching only stores a
> swapfile struct, and an offset. I wonder if there is a potential race
> between swapoff-then-re-swapon and cached allocation? That'd be pretty
> wild.
>
>
> >
> > We may instead add a "bool locked" to swap_cluster_alloc_table, and
> > let it lock the ci first before it does any assign (not the alloc) if
> > the allocation context is not locked. That is, keep the
> > sleep-allocated tables private until swap_cluster_populate()
> > reacquires local/global/ci, then install them under ci->lock,
> > something like pre-cdd77f84d966, always assign it atomically.
>
> Hmm so a bitlock?
>
> Lemme think about it a bit.

Ah, no, not that complex, just something like:

--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -449,9 +449,13 @@ static void swap_cluster_free_table(struct
swap_cluster_info *ci)
        swap_cluster_free_count_table(table);
 }

-static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gf=
p)
+static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gf=
p,
+               bool locked)
 {
        struct swap_table *table =3D NULL;
+       struct swap_memcg_table *memcg_table =3D NULL;
+       unsigned long *zeromap =3D NULL;
+
        struct folio *folio;

        /* The cluster must be empty and not on any list during allocation.=
 */
@@ -472,8 +476,8 @@ static int swap_cluster_alloc_table(struct
swap_cluster_info *ci, gfp_t gfp)
 #ifdef CONFIG_MEMCG
        if (!mem_cgroup_disabled()) {
                VM_WARN_ON_ONCE(ci->memcg_table);
-               ci->memcg_table =3D kzalloc_obj(*ci->memcg_table, gfp);
-               if (!ci->memcg_table) {
+               memcg_table =3D kzalloc_obj(*ci->memcg_table, gfp);
+               if (!memcg_table) {
                        swap_cluster_free_count_table(table);
                        return -ENOMEM;
                }
@@ -484,8 +488,8 @@ static int swap_cluster_alloc_table(struct
swap_cluster_info *ci, gfp_t gfp)
        VM_WARN_ON_ONCE(ci->zero_bitmap);
        ci->zero_bitmap =3D bitmap_zalloc(SWAPFILE_CLUSTER, gfp);
        if (!ci->zero_bitmap) {
-               swap_cluster_free_table(ci);
                swap_cluster_free_count_table(table);
+               kfree(memcg_table);
                return -ENOMEM;
        }
 #endif
@@ -494,6 +498,20 @@ static int swap_cluster_alloc_table(struct
swap_cluster_info *ci, gfp_t gfp)
         * Make tables visible to cluster_is_usable() after everything is
         * ready.
         */
+       if (!locked) {
+               / * Lock it here before assign, not after the asssign
and return */
...

This should fix all potential issues I think?
