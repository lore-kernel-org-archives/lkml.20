Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB946471422
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547694; cv=pass; b=VRiVKJclN4H+kNNOCbV/PyLDoTHaf3X+lZfSQaK1YZUlQ+vOyqj+8HNxxC0We1aiAB6RCEWQsdp7wkCcmh7FR9OKVz4VmnvmG37cN/3hMBWdAjdfDh6OBVt3Jkb2Z933OjxQPlWAAtK+mie091uDX6wfoe2Y2HWu4joxxAO8RyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547694; c=relaxed/simple;
	bh=iRhytWQvblSun1y5CflnWMVbcsOp9T6spJkGMvIPzkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUp8RPheNaw5DqAzylHM/GGbL+jPQrOihmNiaTSk7TcP6ZS6urH5LC2Qc1QxXv+H2vK1genV1iQ0Nbr2eEymlL3WR7Zoupo+A2kvul2LvSNn3KW6ERdlDoCuUL+OpFBIPYXfvcHyOxBmXRJdQLkO+NQkkiIuBoaM0dyzrbt/jcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdDjxpaP; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdDjxpaP"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e82ea30faso1059255e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:34:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789547691; cv=none;
        d=google.com; s=arc-20260327;
        b=Ge1NhIHvDsrfYCnd0/vbwQwOXl/VlfZxFtir3dcM3jUcxuzEX+G93OK3myEOhMJOm1
         R5GnCQjmPfu0TffPA2aIlIEv8VkS6g+hPsoATDGKgc7twwgz0MWymrD8tKSKCHKaPyWH
         vTSmh8gxOy0EI+Rh/IgmiT8tvqXJvZYLax6TBglkeXeelWZ642o4o5I4z9UG/67Vf6lC
         q94Oskm1qUdTbble22GejL0cGLWYAAdjWdcV+CDBDaKXPxw98t4S9mQAx0k+LtG8YhwX
         Z1tl0KwKw0HW4v350Vxtau4zoDoPOqRcEDaKllOGaHXpuq6ZYX0mSD2X2yahCYK/fbAl
         pfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kxdCwKQjhFr24rYMozxK3imzxUOsehIR6WhMmOJ/bP0=;
        fh=OOkV01c8odX/prrOquAWeu+8s35PQxiWgNlDQ8GjVbw=;
        b=NCRcFX3s4dn7SXXi85NsiXDBT76EdW+eflTj0GhrymA7A36D6bipNA3HHKkUoyw3eU
         /6xTqiwky4Y4Lprb3VtiP2IgKgB5vaHxc8G0JWBatYnEESL4cXQms4PRB7SDK86IWpSa
         +RZVUM0PR2bHmrybPlRKjAjNSIaVyMvrC9wRj+BMDTb00FfXcKoEYloKGZmbfl/lbO9v
         R/M5ReYyporD9MAuQeIsrHzDtCR7u4s0XKlFyP+YxxgRkjF0Bkaptbs/asXy9QO3CSys
         NgSvk+FhR3NZnMsB2WRqAptxnadC/sR50uhNp+CZivj0AzuqOuKMtNhgmXXq50fdIvOS
         F7Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789547691; x=1790152491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxdCwKQjhFr24rYMozxK3imzxUOsehIR6WhMmOJ/bP0=;
        b=CdDjxpaPyOLvTzYUicl4VqD3cOkJXcDYhum2sCJou6ecilCrJW9ZLU4cPLj3BIQj1U
         0EDAJ+QWpfJzt14bzm4/I7Pw/lG8bs1AaXHC3C62j9n1Iy+wbNSC7SZV3IUxAMuBCalX
         cjyYBX2bE4RFu+s80akcmbxaoY2Fd3EVIKBfjGvuhROgg5srCkwCvGMzDx+Eu6/+22Gt
         iJ7aXRLUHjfsILC0UNjO9Ji9TtOdfiRDjq6N6iqwHlICQPTvAqB5GntIIwtMDCCqklru
         0MVdLb4Rxf4DgHogzAPZ2793i477NaPj3CnS55zaUrxd2CW10+CnJ5IDN/2VKReO1Ogv
         CS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547691; x=1790152491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxdCwKQjhFr24rYMozxK3imzxUOsehIR6WhMmOJ/bP0=;
        b=lQFnRJ5SOXEE1QUEdksfNRuimAWpNVCrPpg8sz6k5PqNbxOglPtXreQhv1FEDwHDnn
         UxdzNXug1Y/GcGggGLT//sP/C9pZMWu4L1vrbfwmKXt7GLOYTcqvfr9Lbiq+j1o6T4KZ
         iY7dUFUv54Ho9xJ9nh0iuyc3Wr4ufwfw3QVABGrnmyjweI9Sb3I8YngpEVYzVcv+DtdP
         SNj8qhVtq3trPc3LGD/N0U93/GpORV4btoOdCUwzkn07651V5Bh3uyQ/5P5STYTdXstd
         FHy4dXrDI8ujcAQn5rR3SBv1fO9gQgFsn16ZlDoZ+TFuREn4xY/36YJ7s3aB3puCUJ/5
         iEGg==
X-Forwarded-Encrypted: i=1; AKwUvBwF4i5rcDjLO+BK2YrSE9/+w9QRXXWV4Pi6UH2nv4E9iubZA7uct5JaeN+CIUDz8YaiuEqd8Ajxn8qdQdk=@vger.kernel.org
X-Gm-Message-State: AFuF++myO7V9fjwUdJxCSiVV9XSz3ogtpRc7VZM/nPuFGcygaEYd7PBa
	CWvLrYY6yqJA2kJ1oj5napJHkyLS0Y8vOqh+NMFN0yt/InACHg2NJe2zrwV4vU57z8ZbRC2Ndvo
	eH11h0v6+OFIU4uRDZBaM+FGGvSF0BBQ=
X-Gm-Gg: AYBFou0CdsSVSR/T4rl9fqvAJyja6sNl/SMq8AJjGbHMhf7oSd8BKCqem+VUE1aQiav
	yYYKu6BDO9MCYFHSVp1Wmhr/L+Z2hNkr1JR6uhXtlS/1ZmO/1gTLBiozekMIpS/aMS0lv4p6Kh3
	maFlsrsxy2p6GEA5BS/FAY425AWpWRHieNSIWpvwPeouOjufvl0b4crXhIITQnAjJzS+tpp0fmR
	z6FSVm7OuKcgtIbgHeI+ioF+MEmt8MnSGHsGmsTtpwOCnRFFIdBFNlsEkS2g0rJWBQhLm6aR9fU
	SSBYHGfS5FyC6z73pVw4TNDgVT60hGQbXSVci5SCqh1E2AJIxsdUcOwlHe00QAWsm5g=
X-Received: by 2002:a05:6000:41f4:b0:487:ae2:4d0e with SMTP id
 ffacd0b85a97d-4870d2a46bfmr1946490f8f.5.1789547690812; Wed, 16 Sep 2026
 01:34:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916015440.2232938-1-chao@kernel.org> <20260916015440.2232938-12-chao@kernel.org>
In-Reply-To: <20260916015440.2232938-12-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 16 Sep 2026 16:34:14 +0800
X-Gm-Features: AcwNN1WUb2Oa2X_pDKeO-ABWDOZmdY9kADjwmdENNs0cfl8VmA1ikKzIjCwxY5s
Message-ID: <CAHJ8P3+MS_py=0ofRpL_c1J7EHLL-Hdqr1+AXTgCkJb-1p7DzQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v8 11/12] f2fs: cache: introduce tracepoints
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=91=A8=E4=B8=89 09:57=E5=86=
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
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
thanks!
> ---
>  fs/f2fs/cache.c             |  3 ++
>  fs/f2fs/checkpoint.c        |  6 ++++
>  fs/f2fs/node.c              |  4 +++
>  fs/f2fs/segment.c           |  3 ++
>  include/trace/events/f2fs.h | 71 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 87 insertions(+)
>
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index 27624b6799a9..3f345e5d5186 100644
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
> index fe7e8bab644b..406bd3b1c77f 100644
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
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index fe5e4c4eff23..aa485a09ea6c 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2110,6 +2110,8 @@ int f2fs_writeback_node_caches(struct f2fs_sb_info =
*sbi, long nr_to_write,
>         int ret =3D 0;
>         int nr, done =3D 0;
>
> +       trace_f2fs_write_caches(sbi, nr_to_write, 0, NODE);
> +
>  next_step:
>         index =3D 0;
>
> @@ -2217,6 +2219,8 @@ int f2fs_writeback_node_caches(struct f2fs_sb_info =
*sbi, long nr_to_write,
>         if (nwritten)
>                 f2fs_submit_merged_write(sbi, NODE);
>
> +       trace_f2fs_write_caches(sbi, nr_to_write, nwritten, NODE);
> +
>         if (unlikely(f2fs_cp_error(sbi)))
>                 return -EIO;
>         return ret;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 87e24d0306e8..15cffbb5b407 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4226,6 +4226,9 @@ void f2fs_do_write_node_cache(unsigned int nid, str=
uct f2fs_io_info *fio)
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
