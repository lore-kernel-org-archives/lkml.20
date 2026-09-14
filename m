Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1D242125B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378903; cv=pass; b=ja38yEfCgnC6qGA0b6k6Tcp+vZd9joue6N+2+rYap3AuQycPUyQVYPUWcSx3/QDI/8OwkL/IC0AbLBPhucTuqaI6UCasxiOTUwOGc0NAQhg1qB7Zv00tut0K/5d2dMevAlcl0SHsy3NfP/LO4D122vAckHQUbInO0I84t0kGkz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378903; c=relaxed/simple;
	bh=Amv0O2ZVFIhO6P9TKsi5IioWaP8uHyzC59cvABkPWss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJdCOGzm875NoZnKqcGplLc481FJZy6/cQyN0vikEMs2JbOrDynwFHZLtYYw0UTNHZeurV6FqY7yI6afsklY0GFsAoVll0K3jwMxe9IO0ShwSy3yagvpRQ/9Zm+NF5XAhQ2cTzC3zH4Q5JapM/ty07Hvtu//a9T38nUjYswBusA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffL7WgZP; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffL7WgZP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4838dbf1bbeso242362f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789378900; cv=none;
        d=google.com; s=arc-20260327;
        b=px0wgxLLFxjoayei9kHawPlLgGM2BRRmL+6nnS56ksSun7xss6sDcjnmE74Xviy7mf
         Cy6EgLaslF5C1oXtTJgzCbV17wPZ7tjN1uKpYBYo06nb4gPvMCNZO6DqGTPJp5pSDId7
         TRlBBIOmJdipyeMf+IdXbwKMrnydmEDErIPT7Xe4QE7gDbewJ48uS5DBSNi0J45BMXKO
         bDxRXf/hWim6UaacTuSAsBDHZBEUjTXEcA7KOEze+UG6NQEBDySK0DQdpz9bMSbM4eS4
         sSl6WY3QwrQ3ba36MBPQ5zZRPwz8ylPb8QPmrdmBgx/DIySSHnG+hYjbhNdql6A1COm5
         ZNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KMYmx9cUErjeIaCXfHgs0vRZ6WLkZxUlDvkgfSvClCE=;
        fh=tRVv6mtafxJ/0SCfZ0zWYJrQNt2JdU7WOngwdXNU/O0=;
        b=JFHOa4GAB7RVzSrQ+SCrInpDYP/VvpitT2+KnOUacwD1K8e0x7wiBAvUT1faXRnu1L
         fGElEeC8QYjWRg+YKwLWpk3S3QQ6a2cjEocJrkIffy1c06Vo7eSMX1GqCHnIYjtvaWXt
         DAyOn1zx+TZJNHXaavc4DynuWm5Q8XCruy87JWCWDP0cpNI4KjLf7A25UCBncZ3LKL3P
         kIDa5y9zuPwRtBLSqfffF7NV/cWct87QFcYv9taEgvYbhM5LnBrebyTYkjNqxWNH7fih
         jGEN3/zoZvQ9bApgRJ6QcBjOJ5oFfetxlNvzumAiyT9nUsg3k1M9aTPc2hwN/UNYh6am
         uRHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378900; x=1789983700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KMYmx9cUErjeIaCXfHgs0vRZ6WLkZxUlDvkgfSvClCE=;
        b=ffL7WgZPXHD2MhYE6wo15urRpObf9dQf6k79QNTiq7cRuaD3t9l7197GKIKkqugTc7
         bVGOocu/rOgc60K/h1gcAHyEhZokyCwZvwwajpSyX0/6KOS6OGnliOyWp4PC4Es6HhKG
         6bRkeTgT3y7jbULqAWYzw9GrrKytRS9pTckZjMxxHww/nLZz12L29+GmtGP9WbJaQJyz
         SMxQawbibCkuq5rVtHIq4R8+mANPoKZtezGpicHBWIx9vb3wl74GV4LEvmt/Ilq3u+K4
         71C22ahUi29TuIL4gKH/ckM3R4HFo+peof7qFxOds0LxRAw92YgzD3lKRNzgpoBjvdqR
         6SOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378900; x=1789983700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KMYmx9cUErjeIaCXfHgs0vRZ6WLkZxUlDvkgfSvClCE=;
        b=cqp2TDQIv8si7JZxF59BoxTlYgka7du9VT75jreRZrXi0eMecRiLMQonna1L/Mm8MG
         33Kn+IhwcfLTi7aA739n4OAo0ecQ5VSSsaJ5/kR51gmer1WVX94+wIOCRDzrylSWIKdP
         HiIH0Hldt1Ioi8G/Nro6zW+p7lHu5g95DHFooOYTquWHkftqNcLFNuc/OgnZYsX8hmb/
         bcsjI5hHt2+Gmj2yoTA1oeC8nEjHjK4GNJbMQEbSH2EwdHzkWCcR4Qlc8lFzPckoWr0G
         fwUOSHZ6nae7vg2f/fzUZOm/TdRQKgCGCiL8W7yPFqc9OKwFaS923r6cxzrQpHM5UweS
         DODQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZmV2iRAFhREicAIPb3SbYQUiCHlAhW28p8OPp5UeSWpwZ6utaBLx7TjA6ZjrsRQtnRpycRt9bKq8790U=@vger.kernel.org
X-Gm-Message-State: AFuF++n+qPd8u4IWI9LGxkoti3m2ztwsxeSSVULDpCg1IjpI1x2xSxyi
	231emtxxhW9Wm5biSdCuA4zPjmEA0FLoKZkUKgJ4adHVL4zeBSmOal2JyJImlYrxWNHkIob3p+g
	N0hT+qUsrzjkRV+SSX0dxtWXsDxih9rw=
X-Gm-Gg: AYBFou0rzK8vaqpQewomc4qlvhoHKzbjPKBYsE8uG9lryydNNluEqF5+6Yann0wrt+P
	rDBqTP3C0m7+QMFjo+n+SA6nZIm1gZA7XGpDOonF14bMiY9m3ITDEwQfP+6y+XxUCczchI64s9L
	Ss6Nue7lj7uhkGZOK0OgHT7vHiF3kwSRjmEeEmrh1lVPIdDboSeWYsZh73aJxcT1wM1SFkuD4Sb
	ujvXw4rgZ7SqHCT1YKzsEIk7vft2cOuo+d8zN3M7PoS0sLWgNjq/tYMIG9ggZq2C4IXOIu5LvQ7
	egiq5NpKwiG/nGmkwsJ74K09mAPjbWQ71T04QvEngS78WFmH2j4JBvD/
X-Received: by 2002:a05:600c:4683:b0:49b:9241:7ff0 with SMTP id
 5b1f17b1804b1-49e7a5ed9a7mr17182215e9.0.1789378899459; Mon, 14 Sep 2026
 02:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911232405.1815804-1-chao@kernel.org> <20260911232405.1815804-12-chao@kernel.org>
In-Reply-To: <20260911232405.1815804-12-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 14 Sep 2026 17:41:28 +0800
X-Gm-Features: AcwNN1XYear6qe-5tq7JdqOsaIABAXUE8sCCl1aON30AqOqbke4uU-YpKCbt57w
Message-ID: <CAHJ8P3J0azH2EgsDQXOYgtfZLqjkwh15o+crG3SxOYLQGPd4Ww@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 11/12] f2fs: cache: introduce tracepoints
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8812=E6=97=A5=E5=91=A8=E5=85=AD 07:28=E5=86=
=99=E9=81=93=EF=BC=9A
>
> From: Chao Yu <chao@kernel.org>
>
> This patch introduces ftrace tracepoints to observe and profile metadata
> cache operations:
> - trace_f2fs_cache_set_dirty to trace marking a cached block dirty
> - trace_f2fs_write_cache to trace single block writeback submission
> - trace_f2fs_write_caches to tracesbatch writeback and sync sessions
>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/cache.c             |  3 ++
>  fs/f2fs/checkpoint.c        |  6 ++++
>  fs/f2fs/segment.c           |  3 ++
>  include/trace/events/f2fs.h | 71 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 83 insertions(+)
>
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index dcab0f321730..33da3f243783 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -15,6 +15,7 @@
>  #include "f2fs.h"
>  #include "cache.h"
>  #include "node.h"
> +#include <trace/events/f2fs.h>
>  #include "segment.h"
>
>  void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
> @@ -73,6 +74,8 @@ bool f2fs_mark_cache_dirty(struct f2fs_cached_block *en=
try)
>                 enum count_type type =3D IS_META_CACHE(cache) ?
>                                 F2FS_DIRTY_META : F2FS_DIRTY_NODES;
>
> +               trace_f2fs_cache_set_dirty(entry,
> +                               IS_META_CACHE(cache) ? META : NODE);
>                 f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_NONE,
>                                                 F2FS_CACHE_TAG_DIRTY);
>                 inc_page_count(cache->sbi, type);
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 40a96eb9179c..2542b1a29989 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -550,6 +550,8 @@ static bool __f2fs_write_meta_cache(struct f2fs_cache=
d_block *entry,
>  {
>         struct f2fs_sb_info *sbi =3D entry->cache->sbi;
>
> +       trace_f2fs_write_cache(entry, META);
> +
>         if (unlikely(f2fs_cp_error(sbi))) {
>                 if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
>                         f2fs_cache_clear_uptodate(entry);
> @@ -611,6 +613,8 @@ long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, =
long nr_to_write,
>         struct blk_plug plug;
>         bool background =3D nr_to_write !=3D LONG_MAX;
>
> +       trace_f2fs_write_caches(sbi, nr_to_write, 0, META);
> +
>         blk_start_plug(&plug);
>
>         while ((nr =3D f2fs_cache_gang_lookup_tag(META_CACHE(sbi), entrie=
s,
> @@ -666,6 +670,8 @@ long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, =
long nr_to_write,
>
>         blk_finish_plug(&plug);
>
> +       trace_f2fs_write_caches(sbi, nr_to_write, nwritten, META);
> +
>         return nwritten;
>  }
>
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 87e24d0306e8..15cffbb5b407 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4226,6 +4226,9 @@ void f2fs_do_write_node_cache(unsigned int nid, str=
uct f2fs_io_info *fio)
Hi Chao,
Do we also need to add tracepoints in f2fs_writeback_node_caches??
thanks!
>  {
>         struct f2fs_summary sum;
>
> +       if (fio->is_cache)
> +               trace_f2fs_write_cache(fio->cache_entry, NODE);
> +
>         set_summary(&sum, nid, 0, 0);
>         do_write_block(&sum, fio);
>
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index d53be932df01..df4cd346ae72 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -1430,6 +1430,50 @@ DEFINE_EVENT(f2fs__folio, f2fs_set_page_dirty,
>         TP_ARGS(folio, type)
>  );
>
> +DECLARE_EVENT_CLASS(f2fs__cached_block,
> +
> +       TP_PROTO(struct f2fs_cached_block *block, int type),
> +
> +       TP_ARGS(block, type),
> +
> +       TP_STRUCT__entry(
> +               __field(dev_t,  dev)
> +               __field(pgoff_t, index)
> +               __field(int,    type)
> +               __field(int,    dirty)
> +               __field(int,    uptodate)
> +       ),
> +
> +       TP_fast_assign(
> +               __entry->dev    =3D block->cache->sbi->sb->s_dev;
> +               __entry->index  =3D block->index;
> +               __entry->type   =3D type;
> +               __entry->dirty  =3D f2fs_cache_test_dirty(block);
> +               __entry->uptodate =3D f2fs_cache_test_uptodate(block);
> +       ),
> +
> +       TP_printk("dev =3D (%d,%d), %s, index =3D %lu, dirty =3D %d, upto=
date =3D %d",
> +               show_dev(__entry->dev),
> +               show_block_type(__entry->type),
> +               (unsigned long)__entry->index,
> +               __entry->dirty,
> +               __entry->uptodate)
> +);
> +
> +DEFINE_EVENT(f2fs__cached_block, f2fs_write_cache,
> +
> +       TP_PROTO(struct f2fs_cached_block *block, int type),
> +
> +       TP_ARGS(block, type)
> +);
> +
> +DEFINE_EVENT(f2fs__cached_block, f2fs_cache_set_dirty,
> +
> +       TP_PROTO(struct f2fs_cached_block *block, int type),
> +
> +       TP_ARGS(block, type)
> +);
> +
>  TRACE_EVENT(f2fs_replace_atomic_write_block,
>
>         TP_PROTO(struct inode *inode, struct inode *cow_inode, pgoff_t in=
dex,
> @@ -1574,6 +1618,33 @@ TRACE_EVENT(f2fs_writepages,
>                 __entry->for_sync)
>  );
>
> +TRACE_EVENT(f2fs_write_caches,
> +
> +       TP_PROTO(struct f2fs_sb_info *sbi, long nr_to_write, long nwritte=
n, int type),
> +
> +       TP_ARGS(sbi, nr_to_write, nwritten, type),
> +
> +       TP_STRUCT__entry(
> +               __field(dev_t,  dev)
> +               __field(long,   nr_to_write)
> +               __field(long,   nwritten)
> +               __field(int,    type)
> +       ),
> +
> +       TP_fast_assign(
> +               __entry->dev            =3D sbi->sb->s_dev;
> +               __entry->nr_to_write    =3D nr_to_write;
> +               __entry->nwritten       =3D nwritten;
> +               __entry->type           =3D type;
> +       ),
> +
> +       TP_printk("dev =3D (%d,%d), %s, nr_to_write =3D %ld, nwritten =3D=
 %ld",
> +               show_dev(__entry->dev),
> +               show_block_type(__entry->type),
> +               __entry->nr_to_write,
> +               __entry->nwritten)
> +);
> +
>  TRACE_EVENT(f2fs_readpages,
>
>         TP_PROTO(struct inode *inode, pgoff_t start, unsigned int nrpage)=
,
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
