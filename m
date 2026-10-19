Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792442257;
	b=McMyHWAcRW8S0kS++LltyebLbssWoqlm2xDpQUwpWyrrpyYjdfATN6/wTxFCv/V3hYxs
	 aweHO7/ASNabHO14OWt8XkYZPEG3FdrsUxMs6LFJn6gSk0fWEZkdR1/9iKC1K89psbOKu
	 jy4jEVD7SA9y+g5nZWm0k+IyHqZKP354B7Xcf4vMtvqooTr4xZYZkyS2oQcZ2G3Zn5LSU
	 +4WT1q1z/Nfw990ned12SmPTpPGN5ovACu4a36lRb33CeN4Fz89SYn1ESWrje24i+6QKb
	 a+nB/uWNMqS66GtFJdfq1GMUSKg1d4aXoQuilmKB0kH1Pn/YY21nfyqIJJounekvFsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PO9p69nb6+vsNmUFhgfonclxpqAf2KqjRDuFhGInggw=;
	b=Y7kpcmHtro6H8y7UbbfwrP9lhEW0omKDJbTo4kSFpfcXfpUM0zD0bd0yj3kzbT2vYk46
	 jbF8vjIw2T4fqnNjU2RqVOi+5aokkhCRBY5e1RNZZccyHeEMJ39TQKltHsFaMjqC2NgOQ
	 kile/PUoF8xaANEib8wuK0JqFKDNUstmG6q0ZGEkqfrk9EsIG/tz2ojjyiHce5RZx/DME
	 ndkG3KXWLEbLexDMbgjG9bYGfFarpEM5qFYxVGqrFSvflc3+2W4eUge/Rnmbi3R/Q6YIQ
	 Ntx0cBuBnFzvWh67HF09AAjRfXw3v+1WmYU5rcPNzGu82SgAXaFngs/OVQv9yj4wIGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="UnAQs+Z/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B575606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B575606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UnAQs+Z/
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab43af5e97so785807b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792442256; cv=none;
        d=google.com; s=arc-20260327;
        b=frwIzXi8o+35UoYi1bojdxxUUzFeQ7jPIc5QidzhIFrx122foz+FcNgSfxbG9TWkGJ
         e9lwLuYDB50xwH3NvuRdNUjxlSftmAJuT16dYW6Sq0B4l9IRJHQMfgiKkMBWYRrID6pb
         qPj/QUyEDCgV7R4EbrlsyQwED+bWHau+f59n+3UXhfuIWh8r9HPu2Mc0YcrHZvXyWUY/
         ZsXxHzyRPNfh95LJWsMtgN2oUQDYdte58YCksr5HHYr35WO3EBHoM2GAmtjEAwq/QXJu
         jfI6qj+qIz84a5a4eHbGJ5RIXdNWi3RBNbLra9I2tdmQpQh/kKEpmn3clcJANy3eEQTM
         zHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PO9p69nb6+vsNmUFhgfonclxpqAf2KqjRDuFhGInggw=;
        fh=DAPryi0Dapw5NEvRsnvfq0frvY6n693A8Ek+L0osX0o=;
        b=CXAwfODBTSwLIQO4LEvlV8sVyk5e26z0MqQismQoOSGhmYALQaos6AuC/iwyDwKyMX
         ACp1J16/5ai93UCvHzjOjPOjNMi1Zf/c2HO7na21hst3VA+oojORXZVVvyNCXiybxWFx
         KfzKcDLA3pFhcG6Rr2vIwsZDJdRYWQZBnzFAC8U8E3YPEAcn3lrPmuXWKbcBdVt95unU
         1YYfHhb+4Q08bOIv/0rzU2JOlXH12nATq4MWP7N3ye/hrGX6XIFjfpGFQ8L0S95xgESC
         JAXRGbIT+dMZdMDNuVDo70ORYjfibHMIy3g5ICm1tTYoblvH+xkHx4BGB0WygyuzAR3Z
         dYFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792442256; x=1793047056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PO9p69nb6+vsNmUFhgfonclxpqAf2KqjRDuFhGInggw=;
        b=UnAQs+Z/rCSGX025saSqvENYaj5VmR5HpjCKVhhee/ym5jLqePz7qzcOqi9rdGJryn
         C8iJzsaZhjl00kwf3Jx5mBWyW+FXPH8PFomM2wBgrp/Kh5OQ4IUd+pY0oF/EF4B1jnFU
         mTeCYNw/bynGRtw/fi+sbRxYUSL937Bcdh2HyX2o9vRywolga7I5du2JtPHjkrF40Mm3
         8HqrYU4noZTaO6yxYa98Pn4Lxp+ghXGoryANp2UJpYinkLJnBZCbqGVz9zZPDKccdRVw
         g6xLzyqOHQKrXzpga99neiw5neTu6fvDU42IsIP/uTuNYYBvCFkHMkh1n+vt7ZTZH5T4
         c+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792442256; x=1793047056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO9p69nb6+vsNmUFhgfonclxpqAf2KqjRDuFhGInggw=;
        b=X0GOzTyhKMDF57QGEQVAk5Wwvz+GxBIOcxmq/JH/spU8MbPcCMumoFGs6iF5+Tkh0D
         iCccvB8ibLuQ/1v9r985r3UgPZIoImpq71BKkydatAh8he/ArkwcygRV8onFw7KlSFlO
         W0XI6vV/0t+sCmlkUN5c+lG902ObzifSPAYboy/2FKw8lapYCBwTyiQTN37BnkfCYXUf
         kF4PG4C9HTxkPw4hzbc5rStJOoiYAEIroiBoEV5SkAUtfxhtKfe8TDalpNU42IwtNg6a
         XBVhXbm+N4m+2d/U/zWHalR35Y+oZM5HFljvfY0bg0EvLCObCJkKqPZjQLQDhcen5N8p
         Hwuw==
X-Forwarded-Encrypted: i=1; AKwUvBz+bN3v8Q0el6Mq7N/rgOzI+lwWMIHHyfou2PLHyguuaNXXwNTjV/fsBMrqUGIm9DUSiWcqQaUjZu+5cD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcY/lSwyIXoMJ5PJYC0+onU2iP+XgwVmETMcpjPj8gcgepUvPT
	FWJkLqc0ZHIFuPDTaWUTXrcz/SWzsodcbSNBPkoSMgoinVaJqueqJR0JYWpeXqoDpAs+tHv2KDX
	H2o/Abg57WfNy0T7jewtCk6wKH/ELSQQ=
X-Gm-Gg: AYBFou13/OUftSHcmBHsn2Aa8p5IHlTCxre0RmjGBChbrabtQfbZ/6pCpztw3Iupwk9
	JZeKyc1Z8xRKK6PcmfBpqVAIWk7UsQDObhT8F8p8YionPOxemX9WWtD+/ERzgV48N7giZaJ3EAZ
	hJyZHP9QzC0fRORNDDY8Kf7D3/ucb2/GGqEGaMksNaf8A/zWuoM8EDu+nlyzzjXUovIlPImWt1c
	aKhABPYUwlrl+ieHrHEM1dUW/bGss4o0Uk53e+3mx8lZXwKr2vdh7aCXcHFedd0D8Ka+TRsUk/j
	MFxPOnwi8vmbZ0v0MqWMUzddQXQxU/5iTpk3MRbUyGau10gyVrOiRB+gacP5wd55314yA37Ag2C
	VzxigNI7PIANIXG3zPVv+oJ7oWNMu5z6OLY05ZrX/Oy7t9xAqH55+ArAfd+zrkTqYR7/CZIKvPa
	BI3SqehgyWFHFfyktpf1AohNQ=
X-Received: by 2002:a05:690c:fce:b0:8b0:e13c:2857 with SMTP id
 00721157ae682-8b1200efc87mr992317b3.13.1792442255969; Mon, 19 Oct 2026
 13:37:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017050928.128582-1-sidchintamaneni@gmail.com> <CAGsJ_4whqGRQ4JY5rLLJZU=f8u5T75qHkJYQFDoqZSx5c6EBHQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4whqGRQ4JY5rLLJZU=f8u5T75qHkJYQFDoqZSx5c6EBHQ@mail.gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Mon, 19 Oct 2026 13:37:23 -0700
X-Gm-Features: AclHuK9gI4T4O854Y6L1TXMVucW7npKKDzemjhJTunU2ylrUfYVjiEaTh7rHj_8
Message-ID: <CAE5sdEgR3C30xMayXJkWOECQTfADHgNE8Qf9=wjB5eGimjwLYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: multi-gen LRU: fix NULL lruvec->pgdat deref
 with memcg disabled on cmdline
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, stable@vger.kernel.org, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 18 Oct 2026 at 14:05, Barry Song <baohua@kernel.org> wrote:
>
> On Sat, Oct 17, 2026 at 1:09=E2=80=AFPM Siddharth Chintamaneni
> <sidchintamaneni@gmail.com> wrote:
> >
> > When CONFIG_MEMCG=3Dy, lruvec_pgdat() returns lruvec->pgdat, which for =
the
> > per-node pgdat->__lruvec is left NULL by lruvec_init() and only filled =
in
> > lazily by mem_cgroup_lruvec(). Normally that happens early, e.g. on the
> > first folio_add_lru().
> >
> > With cgroup_disable=3Dmemory, lru_gen_shrink_node() passes &pgdat->__lr=
uvec
> > directly to shrink_one(). If direct reclaim runs before anything has
> > called mem_cgroup_lruvec() for the node, which can happen during early
> > boot under memory pressure (e.g. a kdump kernel), get_swappiness() ends
> > up dereferencing a NULL pgdat:
> >
> >   Unable to handle kernel NULL pointer dereference at virtual address 0=
000000000005040
> >   pc : get_swappiness+0x68/0xb0
> >   lr : try_to_shrink_lruvec+0x54/0x2c0
> >   Call trace:
> >    get_swappiness+0x68/0xb0 (P)
> >    try_to_shrink_lruvec+0x54/0x2c0
> >    shrink_one+0x8c/0x240
> >    shrink_node+0xc6c/0xe08
> >    do_try_to_free_pages+0xdc/0x570
> >    try_to_free_pages+0x124/0x278
> >    __alloc_frozen_pages_noprof+0x6e8/0xf78
> >    alloc_pages_mpol+0xc4/0x1c0
> >    alloc_frozen_pages_noprof+0x54/0xe8
> >    alloc_pages_noprof+0x1c/0x40
> >    atomic_pool_expand+0x98/0x300
> >    __dma_atomic_pool_init+0x58/0xd8
> >    dma_atomic_pool_init+0x154/0x170
> >    do_one_initcall+0x64/0x350
> >    kernel_init_freeable+0x214/0x430
> >    kernel_init+0x2c/0x208
> >    ret_from_fork+0x10/0x20
> >
> > The classic LRU path and MGLRU before per-node lru_gen_folio lists
> > obtained the lruvec through mem_cgroup_lruvec(), which sets
> > lruvec->pgdat.
> >
> > The above was hit on an arm64 kdump kernel (6.18-based) booted with
> > cgroup_disable=3Dmemory nr_cpus=3D4. It also reproduces on mainline on =
an
> > arm64 VM with CONFIG_ARM64_64K_PAGES=3Dy, CONFIG_MEMCG=3Dy,
> > CONFIG_LRU_GEN_ENABLED=3Dy and:
> >
> >   mem=3D160M nr_cpus=3D4 coherent_pool=3D512M cgroup_disable=3Dmemory
> >
> > These options only serve to force direct reclaim early in boot; with
> > 160M the boot eventually ends in OOM regardless. On mainline the first
> > LRU reclaim happens while unpacking the initramfs, and faults the same
> > way:
> >
> >   Unable to handle kernel NULL pointer dereference at virtual address 0=
000000000005040
> >   pc : get_swappiness+0xd4/0x150
> >   Call trace:
> >    get_swappiness+0xd4/0x150 (P)
> >    try_to_shrink_lruvec+0x44/0x2b8
> >    shrink_one+0x80/0x1a0
> >    shrink_node+0xd98/0xea8
> >    do_try_to_free_pages+0xf4/0x4b0
> >    try_to_free_pages+0x110/0x360
> >    __alloc_frozen_pages_noprof+0x8b0/0x1718
> >    ...
> >    __filemap_get_folio_mpol+0x2ac/0x548
> >    simple_write_begin+0x44/0xf8
> >    page_symlink+0x178/0x198
> >    ...
> >    do_populate_rootfs+0x13c/0x200
> >
>
> So this happens before any folios are added to the LRU and before
> the userspace init process starts?
>

Yes!

> > Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
> > Cc: stable@vger.kernel.org # 6.3+
> > Assisted-by: LLM
> > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> > ---
> >  mm/vmscan.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index f11491ee9ed5..0c57e4f1eb15 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -5253,7 +5253,7 @@ static void lru_gen_shrink_node(struct pglist_dat=
a *pgdat, struct scan_control *
> >                 sc->nr_reclaimed =3D 0;
> >
> >         if (mem_cgroup_disabled())
> > -               shrink_one(&pgdat->__lruvec, sc);
> > +               shrink_one(mem_cgroup_lruvec(NULL, pgdat), sc);
>
> What's a bit weird is that even if we fix this here, with an empty
> lruvec, we still won't be able to reclaim a single page. But it's
> hard to see where we could break out early, right?
>

I am not really sure about simple bailout logic. Please let me know if
anyone have any thoughts.

> >         else
> >                 shrink_many(pgdat, sc);
>
> Best Regards
> Barry
