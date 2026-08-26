Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897143A5E84
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775756; cv=pass; b=LXBvN4djf8WQUPn03NiOCXxCEYczDnXUox+LHqlREiLQtqPe2ZaKaeTRNB05oCRGdiJ8xMCxpiYrCoL80vyCVGPKb3hP6oQFccCXdNez7ey6IIKM/EgP87jOmvy24J8nV44yqy0AoVXTEhvF1OkPm9oHUlVkTvyt0QU1LX2W9aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775756; c=relaxed/simple;
	bh=eoDxACxsQ7e+7/4hNLaLkRP+RI6tVuHMVfeUfFORWNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3pNjnlz8E2L7AMCstZ4hBzsfWalm9NzzgQ+4uwcbTADsl7T5bW8W3bdKpG05JCKmCAST7qEzK0bYDEq4zGMOz1MozEQYBfbKI6rREUbl7H/4Xspzv3EIheWf7HmMM+y55ooAcX93M9SXQf0FhDSrI7qNgaK7hGMmrCtMea/OeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiKCrSEE; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiKCrSEE"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b457a0b4e5so1273279e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787775748; cv=none;
        d=google.com; s=arc-20260327;
        b=RnCQKRcNoZrO1D9crAyoOIxZCqqfhBbdo60IrBXPandi5NJzb8NW5M99i76eHm96I1
         4T0/ae4QBD2HrL4KoGTbmiWmHHjN6U/MSHzDbtny5upWNOIeMNd0VrO3V0Fh7pU9VwK2
         m6+6v/sDmb+nG3PctvWCdIat3mFUcyVOYq7rPVfcZOz0h1hxbtri8Y+z2DydnWyOVvvU
         Hh8ggyNks4TUG5grsAPg96ge7Z453fKRMVcVjly/igy/Nd9QXvifO0GYC+I91075mFzI
         GBW3Aq/IfvAXlA7C0UHXNFKJHeUmAI0M2jIa2pdZh6fbdNgZ04wM4m+M8AHuONszj2ye
         i5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w4/vH+9VtMc+T4vjuoOnBbAdoLIvpI4GSP3wtW044/s=;
        fh=rYjJ4i9T/cWtAKnWu2wCWEgbzB5vgtG0KF/y9ccBC/A=;
        b=W1OEnB5VkowPxSwdU5irw0zhkeiiv67OHESnP+Xok1D6WY4YfpJ2jIZVvQaJwl1LdJ
         1C3V6BZP/vdYP9+O1F9HJ169KuCGANFPCe1RuGAfviUM4O6zuBa4m4U9wfrs6WpqkUN2
         +f3W3UZ9xqCspbQZelU6d7hXrmZuNAGdg4BkRdOQlW5DqK495lcVhh1Yq0KAsjVtP1lN
         K65F49FvkERerno2kDtDFGznryuDeYshLzAehWVAqn9PwDFc7vw3pE3Bv9b/ICmFDFcF
         zRyjS1cNuqA7j2ziwZ/eGiZldq3oM9xna4MayUTFFUcsqCA3oCAlu9QUIyXF7047ZhEN
         S4rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787775748; x=1788380548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w4/vH+9VtMc+T4vjuoOnBbAdoLIvpI4GSP3wtW044/s=;
        b=iiKCrSEEmAoX+gBkBOPog43FjWfeKQyDuoOGGguqWqbUyRMUYuoccaqZ8NH4On4gK/
         kG2xHNypvvcmFDLeqxNA58tmUgYIWvK470dHr/hE9R+V6l0lQC+AwSu3HWSQ5BhcD43A
         Toz5Zn9bVUjwVMePk6FBpWhcCa0T0vl+tB8IyEC/FFQEHqPiiOFI2jKxNaolq0S11ivI
         D9DuC2g+JXTLMJz56H6tYKuUtPG2frqcv62uf6V2IAk/xpQuF4LWB3Lg9HLQngeWsffA
         qqdxruHtWsbngL6/iDqonGl+IrXIs1N5J/UOwnPbYDfi0Fw9x4dqGmEKRH7CDLASt4Lw
         WT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775748; x=1788380548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4/vH+9VtMc+T4vjuoOnBbAdoLIvpI4GSP3wtW044/s=;
        b=tTS3l3q2PChO9xUNdEzIpmvByNe3VMdLnlaJQcfAPiHQ86f04ioizU98j/YZn3wquO
         MW4sUDOT4T97JlHphQcnVWHU1q6MW7jf+Oxxm4daBrh43D+WpQYIFY8evKHzydjuM0ka
         5ki2ctEqzMVGPtiPlPquZFpcC+Pctg5XUnNvw9wmarvxP0+m/Rijkcpjf2i6bNUZehY5
         /Gyf2r5tZdA/bNbXSZryPcQNhlqZp6Y1JSXblNAVYlM1oVIxxJXOyrUrV+Xk4JURWAUQ
         eEdL+6C4OiXC7Rq4ikmfQOTnFRWW47VLCzcM9C37Mb4Q2VqZ0rVhwQNar5L///+gWwFT
         STGg==
X-Forwarded-Encrypted: i=1; AHgh+RrLZyJBhSKK8PUWEgILCrsB636zv8kigOsmEpTomISs9xND8S8id61eaelh1gfpHaITFgYX+75k7zG3VDo=@vger.kernel.org
X-Gm-Message-State: AFuF++nMMhVzbuoJ3pdwcIpEl6YUzihrdkUMa+CjT53UbTgWZw0ILrY5
	nwnhK8R/dF7pIl8YqZ8/1awigmlIWKLQ3EVe773TanXNB3X0znD2jDb04QwfmvicN9M2LN4lZ9L
	XL4bVt1mrnNzO3LQ4er38bqRrIl2l6hs=
X-Gm-Gg: AR+sD12ZIeSIoNrswVe/yXibKHic8X0VM9QVjMRTrpQ+C572b/iYcUNuQai+L07Q+q2
	L794ICO+A4NtWNJ4/LJGxjptQAP8SyPEAdtDQOQ8GW981yO7GzOYiAJkTVSmojNVENelaEJ3VyO
	8FX3nsHiNEIl5xkW5ru/DEaN9swJ42M1XCjAdXMbqf/glbqRQKDd0QxzzpshcNi/vFnHq+PCA8D
	Eu7JAEjVmCj5yrlZRwPa+k+W3FN0yZ7CUBUHi9Mg/aFIbIBQpqDneX6bO2pKUfYRlRNjl8a+DOS
	xTY+PfEPXAyEhvLgeSz9Wk4vbyUlMFS5f3xq/ZmpOMydcSjXwNbyhd9lsui1L1p6T5lefe1L7gm
	PfJkCshh3BHUbzHndve+46GqdUAUjizM2kw==
X-Received: by 2002:a05:6512:239d:b0:5b4:af74:71b3 with SMTP id
 2adb3069b0e04-5b4af74731fmr1075246e87.10.1787775747326; Wed, 26 Aug 2026
 13:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825130126.2078627-1-chao@kernel.org> <20260825130126.2078627-6-chao@kernel.org>
In-Reply-To: <20260825130126.2078627-6-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 26 Aug 2026 13:22:13 -0700
X-Gm-Features: AcwNN1VWTb9H1vAHy-PmQ_M8UDMCpyx8SNU2YN1ckPWP-1NZcT3NIAYD98eSJWM
Message-ID: <CACOAw_xP6eTBE-p2EaHr=C4TggxViYs+axz+8sW6dPw81qbWNg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 05/12] f2fs: cache: use meta cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 6:04=E2=80=AFAM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> This patch migrates F2FS meta block caching from the fake VFS inode
> page cache (sbi->meta_inode) to meta cache (sbi->meta_blocks).
>
> It converts CP, SIT, NAT, SSA, recovery, and GC metadata I/O paths to
> operate on struct f2fs_cached_block instead of folio, and removes
> sbi->meta_inode.
>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/cache.c         |   2 +
>  fs/f2fs/checkpoint.c    | 390 ++++++++++++++++++----------------------
>  fs/f2fs/compress.c      |   4 +-
>  fs/f2fs/data.c          |  29 ++-
>  fs/f2fs/debug.c         |  12 +-
>  fs/f2fs/f2fs.h          |  81 +++------
>  fs/f2fs/file.c          |   4 +-
>  fs/f2fs/gc.c            | 134 +++++++-------
>  fs/f2fs/inline.c        |   9 +-
>  fs/f2fs/inode.c         |   9 +-
>  fs/f2fs/node.c          | 125 +++++++------
>  fs/f2fs/node.h          |   4 +-
>  fs/f2fs/recovery.c      | 198 ++++++++++----------
>  fs/f2fs/segment.c       | 201 +++++++++++----------
>  fs/f2fs/segment.h       |  31 +++-
>  fs/f2fs/super.c         |  31 +---
>  include/linux/f2fs_fs.h |   1 -
>  17 files changed, 602 insertions(+), 663 deletions(-)
>
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index dcfea6c2e1bb..16c6dab2e498 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -635,6 +635,8 @@ static int f2fs_cache_writeback_kthread(void *data)
>                         break;
>                 if (f2fs_cp_error(sbi))
>                         continue;
> +
> +               f2fs_write_meta_caches(sbi);
>         }
>         return 0;
>  }
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 4b59f30ef45d..f27c2ba4eaa7 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -17,6 +17,7 @@
>  #include <linux/delayacct.h>
>  #include <linux/ioprio.h>
>  #include <linux/math64.h>
> +#include <linux/freezer.h>
>
>  #include "f2fs.h"
>  #include "node.h"
> @@ -236,27 +237,27 @@ struct kmem_cache *f2fs_inode_entry_slab;
>  /*
>   * We guarantee no failure on the returned page.
>   */
> -struct folio *f2fs_grab_meta_folio(struct f2fs_sb_info *sbi, pgoff_t ind=
ex)
> +struct f2fs_cached_block *f2fs_grab_meta_cache(struct f2fs_sb_info *sbi,
> +                                                       pgoff_t index)
>  {
> -       struct address_space *mapping =3D META_MAPPING(sbi);
> -       struct folio *folio;
> +       struct f2fs_cached_block *entry;
>  repeat:
> -       folio =3D f2fs_grab_cache_folio(mapping, index, false);
> -       if (IS_ERR(folio)) {
> +       entry =3D f2fs_grab_cache(META_CACHE(sbi), index,
> +                                       F2FS_CACHE_LOCK_CREATE);
> +       if (IS_ERR(entry)) {
>                 cond_resched();
>                 goto repeat;
>         }
> -       f2fs_folio_wait_writeback(folio, META, true, true);
> -       if (!folio_test_uptodate(folio))
> -               folio_mark_uptodate(folio);
> -       return folio;
> +       f2fs_cache_wait_writeback(entry);
> +       if (!f2fs_cache_test_uptodate(entry))
> +               f2fs_cache_set_uptodate(entry);
> +       return entry;
>  }
>
> -static struct folio *__get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t =
index,
> -                                                       bool is_meta)
> +static struct f2fs_cached_block *__get_meta_cache(struct f2fs_sb_info *s=
bi,
> +                                       pgoff_t index, bool is_meta)
>  {
> -       struct address_space *mapping =3D META_MAPPING(sbi);
> -       struct folio *folio;
> +       struct f2fs_cached_block *entry;
>         struct f2fs_io_info fio =3D {
>                 .sbi =3D sbi,
>                 .type =3D META,
> @@ -266,70 +267,75 @@ static struct folio *__get_meta_folio(struct f2fs_s=
b_info *sbi, pgoff_t index,
>                 .new_blkaddr =3D index,
>                 .encrypted_page =3D NULL,
>                 .is_por =3D !is_meta ? 1 : 0,
> +               .is_cache =3D 1,
>         };
>         int err;
>
>         if (unlikely(!is_meta))
>                 fio.op_flags &=3D ~REQ_META;
>  repeat:
> -       folio =3D f2fs_grab_cache_folio(mapping, index, false);
> -       if (IS_ERR(folio)) {
> +       entry =3D f2fs_grab_cache(META_CACHE(sbi), index,
> +                                       F2FS_CACHE_LOCK_CREATE);
> +       if (IS_ERR(entry)) {
>                 cond_resched();
>                 goto repeat;
>         }
> -       if (folio_test_uptodate(folio))
> +       if (f2fs_cache_test_uptodate(entry))
>                 goto out;
>
> -       fio.folio =3D folio;
> +       fio.cache_entry =3D entry;
>
> -       err =3D f2fs_submit_page_bio(&fio);
> +       err =3D f2fs_submit_cache_read(&fio);
>         if (err) {
> -               f2fs_folio_put(folio, true);
> +               f2fs_put_cache(entry, true);
>                 return ERR_PTR(err);
>         }
>
>         f2fs_update_iostat(sbi, NULL, FS_META_READ_IO, F2FS_BLKSIZE);
>
> -       folio_lock(folio);
> -       if (unlikely(!is_meta_folio(folio))) {
> -               f2fs_folio_put(folio, true);
> +       f2fs_lock_cache(entry);
> +       if (unlikely(!f2fs_is_meta_cache(entry))) {
> +               f2fs_put_cache(entry, true);
>                 goto repeat;
>         }
>
> -       if (unlikely(!folio_test_uptodate(folio))) {
> -               f2fs_handle_page_eio(sbi, folio, META);
> -               f2fs_folio_put(folio, true);
> +       if (unlikely(!f2fs_cache_test_uptodate(entry))) {
> +               f2fs_handle_page_eio(sbi, entry->index, META);
> +               f2fs_put_cache(entry, true);
>                 return ERR_PTR(-EIO);
>         }
>  out:
> -       return folio;
> +       return entry;
>  }
>
> -struct folio *f2fs_get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t inde=
x)
> +struct f2fs_cached_block *f2fs_get_meta_cache(struct f2fs_sb_info *sbi,
> +                                                       pgoff_t index)
>  {
> -       return __get_meta_folio(sbi, index, true);
> +       return __get_meta_cache(sbi, index, true);
>  }
>
> -struct folio *f2fs_get_meta_folio_retry(struct f2fs_sb_info *sbi, pgoff_=
t index)
> +struct f2fs_cached_block *f2fs_get_meta_cache_retry(struct f2fs_sb_info =
*sbi,
> +                                                       pgoff_t index)
>  {
> -       struct folio *folio;
> +       struct f2fs_cached_block *entry;
>         int count =3D 0;
>
>  retry:
> -       folio =3D __get_meta_folio(sbi, index, true);
> -       if (IS_ERR(folio)) {
> -               if (PTR_ERR(folio) =3D=3D -EIO &&
> +       entry =3D __get_meta_cache(sbi, index, true);
> +       if (IS_ERR(entry)) {
> +               if (PTR_ERR(entry) =3D=3D -EIO &&
>                                 ++count <=3D DEFAULT_RETRY_IO_COUNT)
>                         goto retry;
>                 f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_META_PAGE=
);
>         }
> -       return folio;
> +       return entry;
>  }
>
>  /* for POR only */
> -struct folio *f2fs_get_tmp_folio(struct f2fs_sb_info *sbi, pgoff_t index=
)
> +struct f2fs_cached_block *f2fs_get_tmp_cache(struct f2fs_sb_info *sbi,
> +                                                       pgoff_t index)
>  {
> -       return __get_meta_folio(sbi, index, false);
> +       return __get_meta_cache(sbi, index, false);
>  }
>
>  static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
> @@ -447,9 +453,10 @@ bool f2fs_is_valid_blkaddr_raw(struct f2fs_sb_info *=
sbi,
>  /*
>   * Readahead CP/NAT/SIT/SSA/POR pages
>   */
> -int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpa=
ges,
> -                                                       int type, bool sy=
nc)
> +int f2fs_ra_meta_caches(struct f2fs_sb_info *sbi, block_t start,
> +                               int nrpages, int type, bool sync)
>  {
> +       struct f2fs_cached_block_list *cache =3D META_CACHE(sbi);
>         block_t blkno =3D start;
>         struct f2fs_io_info fio =3D {
>                 .sbi =3D sbi,
> @@ -459,6 +466,7 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, bloc=
k_t start, int nrpages,
>                 .encrypted_page =3D NULL,
>                 .in_list =3D 0,
>                 .is_por =3D (type =3D=3D META_POR) ? 1 : 0,
> +               .is_cache =3D 1,
>         };
>         struct blk_plug plug;
>         int err;
> @@ -468,7 +476,7 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, bloc=
k_t start, int nrpages,
>
>         blk_start_plug(&plug);
>         for (; nrpages-- > 0; blkno++) {
> -               struct folio *folio;
> +               struct f2fs_cached_block *entry;
>
>                 if (!f2fs_is_valid_blkaddr(sbi, blkno, type))
>                         goto out;
> @@ -495,62 +503,58 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, bl=
ock_t start, int nrpages,
>                         fio.new_blkaddr =3D blkno;
>                         break;
>                 default:
> -                       BUG();
> +                       f2fs_bug_on(sbi, 1);
>                 }
>
> -               folio =3D f2fs_grab_cache_folio(META_MAPPING(sbi),
> -                                               fio.new_blkaddr, false);
> -               if (IS_ERR(folio))
> +               entry =3D f2fs_grab_cache(cache, fio.new_blkaddr,
> +                                               F2FS_CACHE_LOCK_CREATE);
> +               if (IS_ERR(entry))
>                         continue;
> -               if (folio_test_uptodate(folio)) {
> -                       f2fs_folio_put(folio, true);
> +               if (f2fs_cache_test_uptodate(entry)) {
> +                       f2fs_put_cache(entry, true);
>                         continue;
>                 }
>
> -               fio.folio =3D folio;
> -               err =3D f2fs_submit_page_bio(&fio);
> -               f2fs_folio_put(folio, err ? true : false);
> +               fio.cache_entry =3D entry;
> +               err =3D f2fs_submit_cache_read(&fio);
> +               f2fs_put_cache(entry, err ? true : false);
>
>                 if (!err)
>                         f2fs_update_iostat(sbi, NULL, FS_META_READ_IO,
> -                                                       F2FS_BLKSIZE);
> +                                                       sbi->blocksize);
>         }
>  out:
>         blk_finish_plug(&plug);
>         return blkno - start;
>  }
>
> -void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
> -                                                       unsigned int ra_b=
locks)
> +void f2fs_ra_meta_caches_cond(struct f2fs_sb_info *sbi, pgoff_t index,
> +                                               unsigned int ra_blocks)
>  {
> -       struct folio *folio;
> +       struct f2fs_cached_block *entry;
>         bool readahead =3D false;
>
>         if (ra_blocks =3D=3D RECOVERY_MIN_RA_BLOCKS)
>                 return;
>
> -       folio =3D filemap_get_folio(META_MAPPING(sbi), index);
> -       if (IS_ERR(folio) || !folio_test_uptodate(folio))
> +       entry =3D f2fs_find_cache(META_CACHE(sbi), index);
> +       if (IS_ERR(entry) || !f2fs_cache_test_uptodate(entry))
>                 readahead =3D true;
> -       f2fs_folio_put(folio, false);
> +       f2fs_put_cache(entry, false);
>
>         if (readahead)
> -               f2fs_ra_meta_pages(sbi, index, ra_blocks, META_POR, true)=
;
> +               f2fs_ra_meta_caches(sbi, index, ra_blocks, META_POR, true=
);
>  }
>
> -static bool __f2fs_write_meta_folio(struct folio *folio,
> -                               struct writeback_control *wbc,
> +static bool __f2fs_write_meta_cache(struct f2fs_cached_block *entry,
>                                 enum iostat_type io_type)
>  {
> -       struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> -
> -       trace_f2fs_writepage(folio, META);
> +       struct f2fs_sb_info *sbi =3D entry->cache->sbi;
>
>         if (unlikely(f2fs_cp_error(sbi))) {
>                 if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
> -                       folio_clear_uptodate(folio);
> -                       dec_page_count(sbi, F2FS_DIRTY_META);
> -                       folio_unlock(folio);
> +                       f2fs_force_clear_cache_dirty(entry);
> +                       f2fs_unlock_cache(entry);
>                         return true;
>                 }
>                 goto redirty_out;
> @@ -558,10 +562,10 @@ static bool __f2fs_write_meta_folio(struct folio *f=
olio,
>         if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>                 goto redirty_out;
>
> -       f2fs_do_write_meta_page(sbi, folio, io_type);
> +       f2fs_do_write_meta_cache(sbi, entry, io_type);
>         dec_page_count(sbi, F2FS_DIRTY_META);
>
> -       folio_unlock(folio);
> +       f2fs_unlock_cache(entry);
>
>         if (unlikely(f2fs_cp_error(sbi)))
>                 f2fs_submit_merged_write(sbi, META);
> @@ -569,101 +573,89 @@ static bool __f2fs_write_meta_folio(struct folio *=
folio,
>         return true;
>
>  redirty_out:
> -       folio_redirty_for_writepage(wbc, folio);
> +       f2fs_cache_set_dirty(entry);
>         return false;
>  }
>
> -static int f2fs_write_meta_pages(struct address_space *mapping,
> -                               struct writeback_control *wbc)
> +void f2fs_write_meta_caches(struct f2fs_sb_info *sbi)
>  {
> -       struct f2fs_sb_info *sbi =3D F2FS_M_SB(mapping);
>         struct f2fs_lock_context lc;
> -       long diff, written;
> +       long nr_to_write =3D LONG_MAX;
>
>         if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> -               goto skip_write;
> +               return;
>
> -       /* collect a number of dirty meta pages and write together */
> -       if (wbc->sync_mode !=3D WB_SYNC_ALL &&
> -                       get_pages(sbi, F2FS_DIRTY_META) <
> -                                       nr_pages_to_skip(sbi, META))
> -               goto skip_write;
> +       /* collect a number of dirty meta caches and write together */
> +       if (get_pages(sbi, F2FS_DIRTY_META) <
> +                       nr_pages_to_skip(sbi, META))
> +               return;
>
> -       /* if locked failed, cp will flush dirty pages instead */
> +       /* if locked failed, cp will flush dirty caches instead */
>         if (!f2fs_down_write_trylock_trace(&sbi->cp_global_sem, &lc))
> -               goto skip_write;
> +               return;
>
> -       trace_f2fs_writepages(mapping->host, wbc, META);
> -       diff =3D nr_pages_to_write(sbi, META, wbc);
> -       written =3D f2fs_sync_meta_pages(sbi, wbc->nr_to_write, FS_META_I=
O);
> +       nr_to_write =3D adjust_flush_cache_number(sbi, META);
> +       f2fs_sync_meta_caches(sbi, nr_to_write, false, FS_META_IO);
>         f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
> -       wbc->nr_to_write =3D max((long)0, wbc->nr_to_write - written - di=
ff);
> -       return 0;
> -
> -skip_write:
> -       wbc->pages_skipped +=3D get_pages(sbi, F2FS_DIRTY_META);
> -       trace_f2fs_writepages(mapping->host, wbc, META);
> -       return 0;
>  }
>
> -long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, long nr_to_write,
> -                               enum iostat_type io_type)
> +long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
> +                               bool sync, enum iostat_type io_type)
>  {
> -       struct address_space *mapping =3D META_MAPPING(sbi);
>         pgoff_t index =3D 0, prev =3D ULONG_MAX;
> -       struct folio_batch fbatch;
> +       struct f2fs_cached_block *entries[F2FS_ONSTACK_CACHES];
>         long nwritten =3D 0;
> -       int nr_folios;
> -       struct writeback_control wbc =3D {};
> +       int nr;
>         struct blk_plug plug;
> -
> -       folio_batch_init(&fbatch);
> +       bool background =3D nr_to_write !=3D LONG_MAX;
>
>         blk_start_plug(&plug);
>
> -       while ((nr_folios =3D filemap_get_folios_tag(mapping, &index,
> -                                       (pgoff_t)-1,
> -                                       PAGECACHE_TAG_DIRTY, &fbatch))) {
> +       while ((nr =3D f2fs_cache_gang_lookup_tag(META_CACHE(sbi), entrie=
s,
> +                       &index, F2FS_ONSTACK_CACHES, F2FS_CACHE_TAG_DIRTY=
))) {
>                 int i;
>
> -               for (i =3D 0; i < nr_folios; i++) {
> -                       struct folio *folio =3D fbatch.folios[i];
> +               for (i =3D 0; i < nr; i++) {
> +                       struct f2fs_cached_block *entry =3D entries[i];
> +
> +                       if (background && unlikely(freezing(current))) {
> +                               f2fs_cache_gang_release(entries, nr);
> +                               goto stop;
> +                       }
>
> -                       if (nr_to_write !=3D LONG_MAX && i !=3D 0 &&
> -                                       folio->index !=3D prev +
> -                                       folio_nr_pages(fbatch.folios[i-1]=
)) {
> -                               folio_batch_release(&fbatch);
> +                       if (background && i !=3D 0 &&
> +                                       entry->index !=3D prev + 1) {
> +                               f2fs_cache_gang_release(entries, nr);
>                                 goto stop;
>                         }
>
> -                       folio_lock(folio);
> +                       f2fs_lock_cache(entry);
>
> -                       if (unlikely(!is_meta_folio(folio))) {
> +                       if (unlikely(!f2fs_is_meta_cache(entry))) {
>  continue_unlock:
> -                               folio_unlock(folio);
> +                               f2fs_unlock_cache(entry);
>                                 continue;
>                         }
> -                       if (!folio_test_dirty(folio)) {
> +                       if (!f2fs_cache_test_dirty(entry)) {
>                                 /* someone wrote it for us */
>                                 goto continue_unlock;
>                         }
>
> -                       f2fs_folio_wait_writeback(folio, META, true, true=
);
> +                       f2fs_cache_wait_writeback(entry);
>
> -                       if (!folio_clear_dirty_for_io(folio))
> +                       if (!f2fs_clear_cache_dirty(entry))
>                                 goto continue_unlock;
>
> -                       if (!__f2fs_write_meta_folio(folio, &wbc,
> -                                               io_type)) {
> -                               folio_unlock(folio);
> +                       if (!__f2fs_write_meta_cache(entry, io_type)) {
> +                               f2fs_unlock_cache(entry);
>                                 break;
>                         }
> -                       nwritten +=3D folio_nr_pages(folio);
> -                       prev =3D folio->index;
> +                       nwritten++;
> +                       prev =3D entry->index;
>                         if (unlikely(nwritten >=3D nr_to_write))
>                                 break;
>                 }
> -               folio_batch_release(&fbatch);
> +               f2fs_cache_gang_release(entries, nr);
>                 cond_resched();
>         }
>  stop:
> @@ -675,29 +667,6 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, =
long nr_to_write,
>         return nwritten;
>  }
>
> -static bool f2fs_dirty_meta_folio(struct address_space *mapping,
> -               struct folio *folio)
> -{
> -       trace_f2fs_set_page_dirty(folio, META);
> -
> -       if (!folio_test_uptodate(folio))
> -               folio_mark_uptodate(folio);
> -       if (filemap_dirty_folio(mapping, folio)) {
> -               inc_page_count(F2FS_M_SB(mapping), F2FS_DIRTY_META);
> -               folio_set_f2fs_reference(folio);
> -               return true;
> -       }
> -       return false;
> -}
> -
> -const struct address_space_operations f2fs_meta_aops =3D {
> -       .writepages     =3D f2fs_write_meta_pages,
> -       .dirty_folio    =3D f2fs_dirty_meta_folio,
> -       .invalidate_folio =3D f2fs_invalidate_folio,
> -       .release_folio  =3D f2fs_release_folio,
> -       .migrate_folio  =3D filemap_migrate_folio,
> -};
> -
>  static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
>                                                 unsigned int devidx, int =
type)
>  {
> @@ -1037,20 +1006,20 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_inf=
o *sbi)
>         start_blk =3D __start_cp_addr(sbi) + 1 + __cp_payload(sbi);
>         orphan_blocks =3D __start_sum_addr(sbi) - 1 - __cp_payload(sbi);
>
> -       f2fs_ra_meta_pages(sbi, start_blk, orphan_blocks, META_CP, true);
> +       f2fs_ra_meta_caches(sbi, start_blk, orphan_blocks, META_CP, true)=
;
>
>         for (i =3D 0; i < orphan_blocks; i++) {
> -               struct folio *folio;
> +               struct f2fs_cached_block *entry;
>                 struct f2fs_orphan_block *orphan_blk;
>                 unsigned int entry_count;
>
> -               folio =3D f2fs_get_meta_folio(sbi, start_blk + i);
> -               if (IS_ERR(folio)) {
> -                       err =3D PTR_ERR(folio);
> +               entry =3D f2fs_get_meta_cache(sbi, start_blk + i);
> +               if (IS_ERR(entry)) {
> +                       err =3D PTR_ERR(entry);
>                         goto out;
>                 }
>
> -               orphan_blk =3D folio_address(folio);
> +               orphan_blk =3D cache_address(entry);
>                 entry_count =3D le32_to_cpu(orphan_blk->entry_count);
>                 if (entry_count > F2FS_ORPHANS_PER_BLOCK) {
>                         f2fs_err(sbi, "invalid orphan inode entry count %=
u",
> @@ -1058,7 +1027,7 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info =
*sbi)
>                         set_sbi_flag(sbi, SBI_NEED_FSCK);
>                         f2fs_handle_error(sbi, ERROR_INCONSISTENT_ORPHAN)=
;
>                         err =3D -EFSCORRUPTED;
> -                       f2fs_folio_put(folio, true);
> +                       f2fs_put_cache(entry, true);
>                         goto out;
>                 }
>
> @@ -1067,11 +1036,11 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_inf=
o *sbi)
>
>                         err =3D recover_orphan_inode(sbi, ino);
>                         if (err) {
> -                               f2fs_folio_put(folio, true);
> +                               f2fs_put_cache(entry, true);
>                                 goto out;
>                         }
>                 }
> -               f2fs_folio_put(folio, true);
> +               f2fs_put_cache(entry, true);
>         }
>         /* clear Orphan Flag */
>         clear_ckpt_flags(sbi, CP_ORPHAN_PRESENT_FLAG);
> @@ -1088,9 +1057,9 @@ static void write_orphan_inodes(struct f2fs_sb_info=
 *sbi, block_t start_blk)
>         unsigned int nentries =3D 0;
>         unsigned short index =3D 1;
>         unsigned short orphan_blocks;
> -       struct folio *folio =3D NULL;
>         struct ino_entry *orphan =3D NULL;
>         struct inode_management *im =3D &sbi->im[ORPHAN_INO];
> +       struct f2fs_cached_block *entry =3D NULL;
>
>         orphan_blocks =3D GET_ORPHAN_BLOCKS(im->ino_num);
>
> @@ -1103,9 +1072,9 @@ static void write_orphan_inodes(struct f2fs_sb_info=
 *sbi, block_t start_blk)
>
>         /* loop for each orphan inode entry and write them in journal blo=
ck */
>         list_for_each_entry(orphan, head, list) {
> -               if (!folio) {
> -                       folio =3D f2fs_grab_meta_folio(sbi, start_blk++);
> -                       orphan_blk =3D folio_address(folio);
> +               if (!entry) {
> +                       entry =3D f2fs_grab_meta_cache(sbi, start_blk++);
> +                       orphan_blk =3D (struct f2fs_orphan_block *)cache_=
address(entry);
>                         memset(orphan_blk, 0, sizeof(*orphan_blk));
>                 }
>
> @@ -1120,20 +1089,20 @@ static void write_orphan_inodes(struct f2fs_sb_in=
fo *sbi, block_t start_blk)
>                         orphan_blk->blk_addr =3D cpu_to_le16(index);
>                         orphan_blk->blk_count =3D cpu_to_le16(orphan_bloc=
ks);
>                         orphan_blk->entry_count =3D cpu_to_le32(nentries)=
;
> -                       folio_mark_dirty(folio);
> -                       f2fs_folio_put(folio, true);
> +                       f2fs_mark_cache_dirty(entry);
> +                       f2fs_put_cache(entry, true);
>                         index++;
>                         nentries =3D 0;
> -                       folio =3D NULL;
> +                       entry =3D NULL;
>                 }
>         }
>
> -       if (folio) {
> +       if (entry) {
>                 orphan_blk->blk_addr =3D cpu_to_le16(index);
>                 orphan_blk->blk_count =3D cpu_to_le16(orphan_blocks);
>                 orphan_blk->entry_count =3D cpu_to_le32(nentries);
> -               folio_mark_dirty(folio);
> -               f2fs_folio_put(folio, true);
> +               f2fs_mark_cache_dirty(entry);
> +               f2fs_put_cache(entry, true);
>         }
>  }
>
> @@ -1152,29 +1121,29 @@ static __u32 f2fs_checkpoint_chksum(struct f2fs_c=
heckpoint *ckpt)
>  }
>
>  static int get_checkpoint_version(struct f2fs_sb_info *sbi, block_t cp_a=
ddr,
> -               struct f2fs_checkpoint **cp_block, struct folio **cp_foli=
o,
> +               struct f2fs_checkpoint **cp_block, struct f2fs_cached_blo=
ck **cp_entry,
>                 unsigned long long *version)
>  {
>         size_t crc_offset =3D 0;
>         __u32 crc;
>
> -       *cp_folio =3D f2fs_get_meta_folio(sbi, cp_addr);
> -       if (IS_ERR(*cp_folio))
> -               return PTR_ERR(*cp_folio);
> +       *cp_entry =3D f2fs_get_meta_cache(sbi, cp_addr);
> +       if (IS_ERR(*cp_entry))
> +               return PTR_ERR(*cp_entry);
>
> -       *cp_block =3D folio_address(*cp_folio);
> +       *cp_block =3D (struct f2fs_checkpoint *)cache_address(*cp_entry);
>
>         crc_offset =3D le32_to_cpu((*cp_block)->checksum_offset);
>         if (crc_offset < CP_MIN_CHKSUM_OFFSET ||
>                         crc_offset > CP_CHKSUM_OFFSET) {
> -               f2fs_folio_put(*cp_folio, true);
> +               f2fs_put_cache(*cp_entry, true);
>                 f2fs_warn(sbi, "invalid crc_offset: %zu", crc_offset);
>                 return -EINVAL;
>         }
>
>         crc =3D f2fs_checkpoint_chksum(*cp_block);
>         if (crc !=3D cur_cp_crc(*cp_block)) {
> -               f2fs_folio_put(*cp_folio, true);
> +               f2fs_put_cache(*cp_entry, true);
>                 f2fs_warn(sbi, "invalid crc value");
>                 return -EINVAL;
>         }
> @@ -1183,17 +1152,17 @@ static int get_checkpoint_version(struct f2fs_sb_=
info *sbi, block_t cp_addr,
>         return 0;
>  }
>
> -static struct folio *validate_checkpoint(struct f2fs_sb_info *sbi,
> +static struct f2fs_cached_block *validate_checkpoint(struct f2fs_sb_info=
 *sbi,
>                                 block_t cp_addr, unsigned long long *vers=
ion)
>  {
> -       struct folio *cp_folio_1 =3D NULL, *cp_folio_2 =3D NULL;
> +       struct f2fs_cached_block *cp_entry_1 =3D NULL, *cp_entry_2 =3D NU=
LL;
>         struct f2fs_checkpoint *cp_block =3D NULL;
>         unsigned long long cur_version =3D 0, pre_version =3D 0;
>         unsigned int cp_blocks;
>         int err;
>
>         err =3D get_checkpoint_version(sbi, cp_addr, &cp_block,
> -                                       &cp_folio_1, version);
> +                                       &cp_entry_1, version);
>         if (err)
>                 return NULL;
>
> @@ -1208,19 +1177,20 @@ static struct folio *validate_checkpoint(struct f=
2fs_sb_info *sbi,
>
>         cp_addr +=3D cp_blocks - 1;
>         err =3D get_checkpoint_version(sbi, cp_addr, &cp_block,
> -                                       &cp_folio_2, version);
> +                                       &cp_entry_2, version);
>         if (err)
>                 goto invalid_cp;
>         cur_version =3D *version;
>
>         if (cur_version =3D=3D pre_version) {
>                 *version =3D cur_version;
> -               f2fs_folio_put(cp_folio_2, true);
> -               return cp_folio_1;
> +               f2fs_put_cache(cp_entry_2, true);
> +               return cp_entry_1;
>         }
> -       f2fs_folio_put(cp_folio_2, true);
> +       f2fs_put_cache(cp_entry_2, true);
>  invalid_cp:
> -       f2fs_folio_put(cp_folio_1, true);
> +       if (cp_entry_1)
> +               f2fs_put_cache(cp_entry_1, true);
>         return NULL;
>  }
>
> @@ -1228,7 +1198,7 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *=
sbi)
>  {
>         struct f2fs_checkpoint *cp_block;
>         struct f2fs_super_block *fsb =3D sbi->raw_super;
> -       struct folio *cp1, *cp2, *cur_folio;
> +       struct f2fs_cached_block *cp1 =3D NULL, *cp2 =3D NULL, *cur_entry=
;
>         unsigned long blk_size =3D sbi->blocksize;
>         unsigned long long cp1_version =3D 0, cp2_version =3D 0;
>         unsigned long long cp_start_blk_no;
> @@ -1255,22 +1225,22 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info=
 *sbi)
>
>         if (cp1 && cp2) {
>                 if (ver_after(cp2_version, cp1_version))
> -                       cur_folio =3D cp2;
> +                       cur_entry =3D cp2;
>                 else
> -                       cur_folio =3D cp1;
> +                       cur_entry =3D cp1;
>         } else if (cp1) {
> -               cur_folio =3D cp1;
> +               cur_entry =3D cp1;
>         } else if (cp2) {
> -               cur_folio =3D cp2;
> +               cur_entry =3D cp2;
>         } else {
>                 err =3D -EFSCORRUPTED;
>                 goto fail_no_cp;
>         }
>
> -       cp_block =3D folio_address(cur_folio);
> +       cp_block =3D (struct f2fs_checkpoint *)cache_address(cur_entry);
>         memcpy(sbi->ckpt, cp_block, blk_size);
>
> -       if (cur_folio =3D=3D cp1)
> +       if (cur_entry =3D=3D cp1)
>                 sbi->cur_cp_pack =3D 1;
>         else
>                 sbi->cur_cp_pack =3D 2;
> @@ -1285,30 +1255,31 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info=
 *sbi)
>                 goto done;
>
>         cp_blk_no =3D le32_to_cpu(fsb->cp_blkaddr);
> -       if (cur_folio =3D=3D cp2)
> +       if (cur_entry =3D=3D cp2)
>                 cp_blk_no +=3D BIT(le32_to_cpu(fsb->log_blocks_per_seg));
>
>         for (i =3D 1; i < cp_blks; i++) {
> +               struct f2fs_cached_block *cur_entry_payload;
>                 void *sit_bitmap_ptr;
>                 unsigned char *ckpt =3D (unsigned char *)sbi->ckpt;
>
> -               cur_folio =3D f2fs_get_meta_folio(sbi, cp_blk_no + i);
> -               if (IS_ERR(cur_folio)) {
> -                       err =3D PTR_ERR(cur_folio);
> +               cur_entry_payload =3D f2fs_get_meta_cache(sbi, cp_blk_no =
+ i);
> +               if (IS_ERR(cur_entry_payload)) {
> +                       err =3D PTR_ERR(cur_entry_payload);
>                         goto free_fail_no_cp;
>                 }
> -               sit_bitmap_ptr =3D folio_address(cur_folio);
> +               sit_bitmap_ptr =3D cache_address(cur_entry_payload);
>                 memcpy(ckpt + i * blk_size, sit_bitmap_ptr, blk_size);
> -               f2fs_folio_put(cur_folio, true);
> +               f2fs_put_cache(cur_entry_payload, true);
>         }
>  done:
> -       f2fs_folio_put(cp1, true);
> -       f2fs_folio_put(cp2, true);
> +       f2fs_put_cache(cp1, true);
> +       f2fs_put_cache(cp2, true);
>         return 0;
>
>  free_fail_no_cp:
> -       f2fs_folio_put(cp1, true);
> -       f2fs_folio_put(cp2, true);
> +       f2fs_put_cache(cp1, true);
> +       f2fs_put_cache(cp2, true);
>  fail_no_cp:
>         kvfree(sbi->ckpt);
>         return err;
> @@ -1621,7 +1592,7 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sb=
i, int type)
>                         break;
>
>                 if (type =3D=3D F2FS_DIRTY_META)
> -                       f2fs_sync_meta_pages(sbi, LONG_MAX, FS_CP_META_IO=
);
> +                       f2fs_sync_meta_caches(sbi, LONG_MAX, true, FS_MET=
A_IO);
>                 else if (type =3D=3D F2FS_WB_CP_DATA)
>                         f2fs_submit_merged_write(sbi, DATA);
>
> @@ -1700,31 +1671,24 @@ static void update_ckpt_flags(struct f2fs_sb_info=
 *sbi, struct cp_control *cpc)
>  static void commit_checkpoint(struct f2fs_sb_info *sbi,
>         void *src, block_t blk_addr)
>  {
> -       struct writeback_control wbc =3D {};
> -
> -       /*
> -        * filemap_get_folios_tag and folio_lock again will take
> -        * some extra time. Therefore, f2fs_update_meta_pages and
> -        * f2fs_sync_meta_pages are combined in this function.
> -        */
> -       struct folio *folio =3D f2fs_grab_meta_folio(sbi, blk_addr);
> +       struct f2fs_cached_block *entry =3D f2fs_grab_meta_cache(sbi, blk=
_addr);
>
> -       memcpy(folio_address(folio), src, PAGE_SIZE);
> +       memcpy(cache_address(entry), src, F2FS_BLKSIZE);
>
> -       folio_mark_dirty(folio);
> -       if (unlikely(!folio_clear_dirty_for_io(folio)))
> +       f2fs_mark_cache_dirty(entry);
> +       if (unlikely(!f2fs_clear_cache_dirty(entry)))
>                 f2fs_bug_on(sbi, 1);
>
>         /* writeout cp pack 2 page */
> -       if (unlikely(!__f2fs_write_meta_folio(folio, &wbc, FS_CP_META_IO)=
)) {
> +       if (unlikely(!__f2fs_write_meta_cache(entry, FS_CP_META_IO))) {
>                 if (f2fs_cp_error(sbi)) {
> -                       f2fs_folio_put(folio, true);
> +                       f2fs_put_cache(entry, true);
>                         return;
>                 }
>                 f2fs_bug_on(sbi, true);
>         }
>
> -       f2fs_folio_put(folio, false);
> +       f2fs_put_cache(entry, false);
>
>         /* submit checkpoint (with barrier if NOBARRIER is not set) */
>         f2fs_submit_merged_write(sbi, META_FLUSH);
> @@ -1793,7 +1757,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, =
struct cp_control *cpc)
>         int err;
>
>         /* Flush all the NAT/SIT pages */
> -       f2fs_sync_meta_pages(sbi, LONG_MAX, FS_CP_META_IO);
> +       f2fs_sync_meta_caches(sbi, LONG_MAX, true, FS_CP_META_IO);
>
>         stat_cp_time(cpc, CP_TIME_SYNC_META);
>
> @@ -1892,7 +1856,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, =
struct cp_control *cpc)
>         }
>
>         /* Here, we have one bio having CP pack except cp pack 2 page */
> -       f2fs_sync_meta_pages(sbi, LONG_MAX, FS_CP_META_IO);
> +       f2fs_sync_meta_caches(sbi, LONG_MAX, true, FS_CP_META_IO);
>         stat_cp_time(cpc, CP_TIME_SYNC_CP_META);
>
>         /* Wait for all dirty meta pages to be submitted for IO */
> @@ -1919,10 +1883,10 @@ static int do_checkpoint(struct f2fs_sb_info *sbi=
, struct cp_control *cpc)
>          * used for migration of encrypted, verity or compressed inode's =
blocks.
>          */
>         if (f2fs_sb_has_encrypt(sbi) || f2fs_sb_has_verity(sbi) ||
> -               f2fs_sb_has_compression(sbi))
> -               f2fs_bug_on(sbi,
> -                       invalidate_inode_pages2_range(META_MAPPING(sbi),
> -                               MAIN_BLKADDR(sbi), MAX_BLKADDR(sbi) - 1))=
;
> +               f2fs_sb_has_compression(sbi)) {
> +               f2fs_truncate_meta_caches(sbi, MAIN_BLKADDR(sbi),
> +                               MAX_BLKADDR(sbi) - MAIN_BLKADDR(sbi));
> +       }
>
>         f2fs_release_ino_entry(sbi, false);
>
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 91855d91bbdd..bb749f6257a1 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1150,7 +1150,7 @@ static int prepare_compress_overwrite(struct compre=
ss_ctx *cc,
>                 f2fs_compress_ctx_add_page(cc, folio);
>
>                 if (!folio_test_uptodate(folio)) {
> -                       f2fs_handle_page_eio(sbi, folio, DATA);
> +                       f2fs_handle_page_eio(sbi, folio->index, DATA);
>  release_and_retry:
>                         f2fs_put_rpages(cc);
>                         f2fs_unlock_rpages(cc, i + 1);
> @@ -1359,7 +1359,7 @@ static int f2fs_write_compressed_pages(struct compr=
ess_ctx *cc,
>                 fio.old_blkaddr =3D data_blkaddr(dn.inode, dn.node_folio,
>                                                 dn.ofs_in_node + i + 1);
>
> -               /* wait for GCed page writeback via META_MAPPING */
> +               /* wait for GCed page writeback via generic cache */
>                 f2fs_wait_on_block_writeback(inode, fio.old_blkaddr);
>
>                 if (fio.encrypted) {
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 2c91382ffc3c..0dd558398189 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -65,8 +65,7 @@ bool f2fs_is_cp_guaranteed(const struct folio *folio)
>
>         inode =3D mapping->host;
>
> -       if (inode->i_ino =3D=3D F2FS_META_INO(sbi) ||
> -                       inode->i_ino =3D=3D F2FS_NODE_INO(sbi) ||
> +       if (inode->i_ino =3D=3D F2FS_NODE_INO(sbi) ||
>                         S_ISDIR(inode->i_mode))
>                 return true;
>
> @@ -84,9 +83,6 @@ static enum count_type __read_io_type(struct folio *fol=
io)
>                 struct inode *inode =3D mapping->host;
>                 struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>
> -               if (inode->i_ino =3D=3D F2FS_META_INO(sbi))
> -                       return F2FS_RD_META;
> -
>                 if (inode->i_ino =3D=3D F2FS_NODE_INO(sbi))
>                         return F2FS_RD_NODE;
>         }
> @@ -1451,7 +1447,7 @@ static void f2fs_submit_page_read(struct inode *ino=
de, struct fsverity_info *vi,
>         bio =3D f2fs_grab_read_bio(inode, vi, blkaddr, 1, op_flags, folio=
->index,
>                                  for_write);
>
> -       /* wait for GCed page writeback via META_MAPPING */
> +       /* wait for GCed page writeback via generic cache */
>         f2fs_wait_on_block_writeback(inode, blkaddr);
>
>         if (!bio_add_folio(bio, folio, PAGE_SIZE, 0))
> @@ -3109,7 +3105,7 @@ static void f2fs_readahead(struct readahead_control=
 *rac)
>  int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
>  {
>         struct inode *inode =3D fio_inode(fio);
> -       struct folio *mfolio;
> +       struct f2fs_cached_block *entry;
>         struct page *page;
>
>         if (!f2fs_encrypted_file(inode))
> @@ -3125,12 +3121,13 @@ int f2fs_encrypt_one_page(struct f2fs_io_info *fi=
o)
>         if (IS_ERR(fio->encrypted_page))
>                 return PTR_ERR(fio->encrypted_page);
>
> -       mfolio =3D filemap_lock_folio(META_MAPPING(fio->sbi), fio->old_bl=
kaddr);
> -       if (!IS_ERR(mfolio)) {
> -               if (folio_test_uptodate(mfolio))
> -                       memcpy(folio_address(mfolio),
> -                               page_address(fio->encrypted_page), PAGE_S=
IZE);
> -               f2fs_folio_put(mfolio, true);
> +       entry =3D f2fs_find_cache(META_CACHE(fio->sbi), fio->old_blkaddr)=
;
> +       if (!IS_ERR(entry)) {
> +               f2fs_lock_cache(entry);
> +               if (f2fs_cache_test_uptodate(entry))
> +                       memcpy(cache_address(entry), page_address(fio->en=
crypted_page),
> +                                               F2FS_BLKSIZE);
> +               f2fs_put_cache(entry, true);
>         }
>         return 0;
>  }
> @@ -3296,7 +3293,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fi=
o)
>                 goto out_writepage;
>         }
>
> -       /* wait for GCed page writeback via META_MAPPING */
> +       /* wait for GCed page writeback via generic cache */
>         if (fio->meta_gc)
>                 f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
>
> @@ -4379,9 +4376,7 @@ void f2fs_invalidate_folio(struct folio *folio, siz=
e_t offset, size_t length)
>                 return;
>
>         if (folio_test_dirty(folio)) {
> -               if (inode->i_ino =3D=3D F2FS_META_INO(sbi)) {
> -                       dec_page_count(sbi, F2FS_DIRTY_META);
> -               } else if (inode->i_ino =3D=3D F2FS_NODE_INO(sbi)) {
> +               if (inode->i_ino =3D=3D F2FS_NODE_INO(sbi)) {
>                         dec_page_count(sbi, F2FS_DIRTY_NODES);
>                 } else {
>                         inode_dec_dirty_pages(inode);
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index ff379aff4472..14059a50739c 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -224,8 +224,7 @@ static void update_general_status(struct f2fs_sb_info=
 *sbi)
>         si->dirty_count =3D dirty_segments(sbi);
>         if (sbi->node_inode)
>                 si->node_pages =3D NODE_MAPPING(sbi)->nrpages;
> -       if (sbi->meta_inode)
> -               si->meta_pages =3D META_MAPPING(sbi)->nrpages;
> +       si->meta_caches =3D META_CACHE(sbi)->num_entries;
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>         if (sbi->compress_inode) {
>                 si->compress_pages =3D COMPRESS_MAPPING(sbi)->nrpages;
> @@ -388,11 +387,8 @@ static void update_mem_info(struct f2fs_sb_info *sbi=
)
>
>                 si->page_mem +=3D (unsigned long long)npages << PAGE_SHIF=
T;
>         }
> -       if (sbi->meta_inode) {
> -               unsigned long npages =3D META_MAPPING(sbi)->nrpages;
> -
> -               si->page_mem +=3D (unsigned long long)npages << PAGE_SHIF=
T;
> -       }
> +       si->page_mem +=3D (unsigned long long)META_CACHE(sbi)->num_entrie=
s << PAGE_SHIFT;
> +       si->cache_mem +=3D META_CACHE(sbi)->num_entries * sizeof(struct f=
2fs_cached_block);
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>         if (sbi->compress_inode) {
>                 unsigned long npages =3D COMPRESS_MAPPING(sbi)->nrpages;
> @@ -708,7 +704,7 @@ static int stat_show(struct seq_file *s, void *v)
>                 seq_printf(s, "  - quota data: %4d in quota files:%4d\n",
>                            si->ndirty_qdata, si->nquota_files);
>                 seq_printf(s, "  - meta: %4d in %4d\n",
> -                          si->ndirty_meta, si->meta_pages);
> +                          si->ndirty_meta, si->meta_caches);
>                 seq_printf(s, "  - imeta: %4d\n",
>                            si->ndirty_imeta);
>                 seq_printf(s, "  - fsync mark: %4lld\n",
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9fe9fadbb810..5115c0c0b47d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1830,7 +1830,6 @@ struct f2fs_sb_info {
>         struct f2fs_checkpoint *ckpt;           /* raw checkpoint pointer=
 */
>         int cur_cp_pack;                        /* remain current cp pack=
 */
>         spinlock_t cp_lock;                     /* for flag in ckpt */
> -       struct inode *meta_inode;               /* cache meta blocks */
>         struct f2fs_rwsem cp_global_sem;        /* checkpoint procedure l=
ock */
>         struct f2fs_rwsem cp_rwsem;             /* blocking FS operations=
 */
>         struct f2fs_rwsem node_write;           /* locking node writes */
> @@ -1875,7 +1874,6 @@ struct f2fs_sb_info {
>         unsigned int blocksize;                 /* block size */
>         unsigned int root_ino_num;              /* root inode number*/
>         unsigned int node_ino_num;              /* node inode number*/
> -       unsigned int meta_ino_num;              /* meta inode number*/
>         unsigned int log_blocks_per_seg;        /* log2 blocks per segmen=
t */
>         unsigned int blocks_per_seg;            /* blocks per segment */
>         unsigned int segs_per_sec;              /* segments per section *=
/
> @@ -2322,9 +2320,9 @@ static inline struct dirty_seglist_info *DIRTY_I(st=
ruct f2fs_sb_info *sbi)
>         return (struct dirty_seglist_info *)(SM_I(sbi)->dirty_info);
>  }
>
> -static inline struct address_space *META_MAPPING(struct f2fs_sb_info *sb=
i)
> +static inline bool f2fs_is_meta_cache(struct f2fs_cached_block *entry)
>  {
> -       return sbi->meta_inode->i_mapping;
> +       return entry->cache && entry->cache =3D=3D META_CACHE(entry->cach=
e->sbi);
>  }
>
>  static inline struct address_space *NODE_MAPPING(struct f2fs_sb_info *sb=
i)
> @@ -2332,11 +2330,6 @@ static inline struct address_space *NODE_MAPPING(s=
truct f2fs_sb_info *sbi)
>         return sbi->node_inode->i_mapping;
>  }
>
> -static inline bool is_meta_folio(struct folio *folio)
> -{
> -       return folio->mapping =3D=3D META_MAPPING(F2FS_F_SB(folio));
> -}
> -
>  static inline bool is_node_folio(struct folio *folio)
>  {
>         return folio->mapping =3D=3D NODE_MAPPING(F2FS_F_SB(folio));
> @@ -4061,9 +4054,9 @@ bool f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t=
 *nid);
>  void f2fs_alloc_nid_done(struct f2fs_sb_info *sbi, nid_t nid);
>  void f2fs_alloc_nid_failed(struct f2fs_sb_info *sbi, nid_t nid);
>  int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink);
> -int f2fs_recover_inline_xattr(struct inode *inode, struct folio *folio);
> -int f2fs_recover_xattr_data(struct inode *inode, struct folio *folio);
> -int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct folio *foli=
o);
> +int f2fs_recover_inline_xattr(struct inode *inode, struct f2fs_cached_bl=
ock *entry);
> +int f2fs_recover_xattr_data(struct inode *inode, struct f2fs_cached_bloc=
k *entry);
> +int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct f2fs_cached=
_block *entry);
>  int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
>                         unsigned int segno, struct f2fs_summary_block *su=
m);
>  int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *=
cpc);
> @@ -4113,11 +4106,13 @@ int f2fs_allocate_new_segments(struct f2fs_sb_inf=
o *sbi);
>  int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
>  bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
>                                         struct cp_control *cpc);
> -struct folio *f2fs_get_sum_folio(struct f2fs_sb_info *sbi, unsigned int =
segno);
> +struct f2fs_cached_block *f2fs_get_sum_cache(struct f2fs_sb_info *sbi,
> +               unsigned int segno);
>  void f2fs_update_meta_page(struct f2fs_sb_info *sbi, void *src,
>                                         block_t blk_addr);
> -void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct folio *fol=
io,
> -                                               enum iostat_type io_type)=
;
> +void f2fs_do_write_meta_cache(struct f2fs_sb_info *sbi,
> +                       struct f2fs_cached_block *entry,
> +                       enum iostat_type io_type);
>  void f2fs_do_write_node_page(unsigned int nid, struct f2fs_io_info *fio)=
;
>  void f2fs_outplace_write_data(struct dnode_of_data *dn,
>                         struct f2fs_io_info *fio);
> @@ -4140,8 +4135,6 @@ void f2fs_update_device_state(struct f2fs_sb_info *=
sbi, nid_t ino,
>                                         block_t blkaddr, unsigned int blk=
cnt);
>  void f2fs_folio_wait_writeback(struct folio *folio, enum page_type type,
>                 bool ordered, bool locked);
> -#define f2fs_wait_on_page_writeback(page, type, ordered, locked)       \
> -               f2fs_folio_wait_writeback(page_folio(page), type, ordered=
, locked)
>  void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
>  void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blk=
addr,
>                                                                 block_t l=
en);
> @@ -4207,20 +4200,21 @@ void f2fs_unlock_op(struct f2fs_sb_info *sbi, str=
uct f2fs_lock_context *lc);
>  void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
>                                                         unsigned char rea=
son);
>  void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi);
> -struct folio *f2fs_grab_meta_folio(struct f2fs_sb_info *sbi, pgoff_t ind=
ex);
> -struct folio *f2fs_get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t inde=
x);
> -struct folio *f2fs_get_meta_folio_retry(struct f2fs_sb_info *sbi, pgoff_=
t index);
> -struct folio *f2fs_get_tmp_folio(struct f2fs_sb_info *sbi, pgoff_t index=
);
> +struct f2fs_cached_block *f2fs_grab_meta_cache(struct f2fs_sb_info *sbi,=
 pgoff_t index);
> +struct f2fs_cached_block *f2fs_get_meta_cache(struct f2fs_sb_info *sbi, =
pgoff_t index);
> +struct f2fs_cached_block *f2fs_get_meta_cache_retry(struct f2fs_sb_info =
*sbi, pgoff_t index);
> +struct f2fs_cached_block *f2fs_get_tmp_cache(struct f2fs_sb_info *sbi, p=
goff_t index);
>  bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>                                         block_t blkaddr, int type);
>  bool f2fs_is_valid_blkaddr_raw(struct f2fs_sb_info *sbi,
>                                         block_t blkaddr, int type);
> -int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpa=
ges,
> +int f2fs_ra_meta_caches(struct f2fs_sb_info *sbi, block_t start, int nrp=
ages,
>                         int type, bool sync);
> -void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
> +void f2fs_ra_meta_caches_cond(struct f2fs_sb_info *sbi, pgoff_t index,
>                                                         unsigned int ra_b=
locks);
> -long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, long nr_to_write,
> -                       enum iostat_type io_type);
> +void f2fs_write_meta_caches(struct f2fs_sb_info *sbi);
> +long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
> +                               bool sync, enum iostat_type io_type);
>  void f2fs_add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino, int type);
>  void f2fs_remove_ino_entry(struct f2fs_sb_info *sbi, nid_t ino, int type=
);
>  void f2fs_release_ino_entry(struct f2fs_sb_info *sbi, bool all);
> @@ -4407,7 +4401,7 @@ struct f2fs_stat_info {
>         unsigned int bimodal, avg_vblocks;
>         int util_free, util_valid, util_invalid;
>         int rsvd_segs, overp_segs;
> -       int dirty_count, node_pages, meta_pages, compress_pages;
> +       int dirty_count, node_pages, meta_caches, compress_pages;
>         int compress_page_hit;
>         int prefree_count, free_segs, free_secs;
>         int cp_call_count[MAX_CALL_TYPE], cp_count;
> @@ -4609,7 +4603,6 @@ extern const struct file_operations f2fs_file_opera=
tions;
>  extern const struct inode_operations f2fs_file_inode_operations;
>  extern const struct address_space_operations f2fs_dblock_aops;
>  extern const struct address_space_operations f2fs_node_aops;
> -extern const struct address_space_operations f2fs_meta_aops;
>  extern const struct inode_operations f2fs_dir_inode_operations;
>  extern const struct inode_operations f2fs_symlink_inode_operations;
>  extern const struct inode_operations f2fs_encrypted_symlink_inode_operat=
ions;
> @@ -4630,7 +4623,7 @@ int f2fs_convert_inline_folio(struct dnode_of_data =
*dn, struct folio *folio);
>  int f2fs_convert_inline_inode(struct inode *inode);
>  int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry=
);
>  int f2fs_write_inline_data(struct inode *inode, struct folio *folio);
> -int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio);
> +int f2fs_recover_inline_data(struct inode *inode, struct f2fs_cached_blo=
ck *entry);
>  struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
>                 const struct f2fs_filename *fname, struct folio **res_fol=
io,
>                 bool use_hash);
> @@ -5190,10 +5183,8 @@ static inline void f2fs_schedule_timeout_killable(=
long timeout, bool io)
>  }
>
>  static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi,
> -                               struct folio *folio, enum page_type type)
> +                               pgoff_t ofs, enum page_type type)
>  {
> -       pgoff_t ofs =3D folio->index;
> -
>         if (unlikely(f2fs_cp_error(sbi)))
>                 return;
>
> @@ -5228,36 +5219,10 @@ static inline bool f2fs_is_readonly(struct f2fs_s=
b_info *sbi)
>         return f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb);
>  }
>
> -static inline void f2fs_truncate_meta_inode_pages(struct f2fs_sb_info *s=
bi,
> -                                       block_t blkaddr, unsigned int cnt=
)
> -{
> -       bool need_submit =3D false;
> -       int i =3D 0;
> -
> -       do {
> -               struct folio *folio;
> -
> -               folio =3D filemap_get_folio(META_MAPPING(sbi), blkaddr + =
i);
> -               if (!IS_ERR(folio)) {
> -                       if (folio_test_writeback(folio))
> -                               need_submit =3D true;
> -                       f2fs_folio_put(folio, false);
> -               }
> -       } while (++i < cnt && !need_submit);
> -
> -       if (need_submit)
> -               f2fs_submit_merged_write_cond(sbi, sbi->meta_inode,
> -                                                       NULL, 0, DATA);
> -
> -       truncate_inode_pages_range(META_MAPPING(sbi),
> -                       F2FS_BLK_TO_BYTES((loff_t)blkaddr),
> -                       F2FS_BLK_END_BYTES((loff_t)(blkaddr + cnt - 1)));
> -}
> -
>  static inline void f2fs_invalidate_internal_cache(struct f2fs_sb_info *s=
bi,
>                                                 block_t blkaddr, unsigned=
 int len)
>  {
> -       f2fs_truncate_meta_inode_pages(sbi, blkaddr, len);
> +       f2fs_truncate_meta_caches(sbi, blkaddr, len);
>         f2fs_invalidate_compress_pages_range(sbi, blkaddr, len);
>  }
>
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index d440231b8cb9..dffdf0ed0216 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -214,7 +214,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_faul=
t *vmf)
>
>         f2fs_folio_wait_writeback(folio, DATA, false, true);
>
> -       /* wait for GCed page writeback via META_MAPPING */
> +       /* wait for GCed page writeback via generic cache */
>         f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
>
>         /*
> @@ -2564,7 +2564,7 @@ int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsi=
gned int flag,
>                 f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN)=
;
>                 break;
>         case F2FS_GOING_DOWN_METAFLUSH:
> -               f2fs_sync_meta_pages(sbi, LONG_MAX, FS_META_IO);
> +               f2fs_sync_meta_caches(sbi, LONG_MAX, true, FS_META_IO);
>                 f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN)=
;
>                 break;
>         case F2FS_GOING_DOWN_NEED_FSCK:
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 0c17038fcfd7..cd4a785d0cac 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1066,7 +1066,7 @@ static int gc_node_segment(struct f2fs_sb_info *sbi=
,
>                         continue;
>
>                 if (phase =3D=3D 0) {
> -                       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(nid), 1,
> +                       f2fs_ra_meta_caches(sbi, NAT_BLOCK_OFFSET(nid), 1=
,
>                                                         META_NAT, true);
>                         continue;
>                 }
> @@ -1217,7 +1217,8 @@ static int ra_data_block(struct inode *inode, pgoff=
_t index)
>         struct address_space *mapping =3D inode->i_mapping;
>         struct inode *atomic_inode =3D NULL;
>         struct dnode_of_data dn;
> -       struct folio *folio, *efolio;
> +       struct folio *folio;
> +       struct f2fs_cached_block *entry;
>         struct f2fs_io_info fio =3D {
>                 .sbi =3D sbi,
>                 .ino =3D inode->i_ino,
> @@ -1227,6 +1228,7 @@ static int ra_data_block(struct inode *inode, pgoff=
_t index)
>                 .op_flags =3D 0,
>                 .encrypted_page =3D NULL,
>                 .in_list =3D 0,
> +               .is_cache =3D 1,
>         };
>         int err =3D 0;
>
> @@ -1285,22 +1287,21 @@ static int ra_data_block(struct inode *inode, pgo=
ff_t index)
>
>         f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
>
> -       efolio =3D f2fs_filemap_get_folio(META_MAPPING(sbi), dn.data_blka=
ddr,
> -                                       FGP_LOCK | FGP_CREAT, GFP_NOFS);
> -       if (IS_ERR(efolio)) {
> -               err =3D PTR_ERR(efolio);
> +       entry =3D f2fs_grab_cache(META_CACHE(sbi), dn.data_blkaddr,
> +                                               F2FS_CACHE_LOCK_CREATE);
> +       if (IS_ERR(entry)) {
> +               err =3D PTR_ERR(entry);
>                 goto put_folio;
>         }
>
> -       fio.encrypted_page =3D &efolio->page;
> -
> -       if (folio_test_uptodate(efolio))
> -               goto put_encrypted_page;
> +       if (f2fs_cache_test_uptodate(entry))
> +               goto put_cache;
>
> -       err =3D f2fs_submit_page_bio(&fio);
> +       fio.cache_entry =3D entry;
> +       err =3D f2fs_submit_cache_read(&fio);
>         if (err)
> -               goto put_encrypted_page;
> -       f2fs_put_page(fio.encrypted_page, false);
> +               goto put_cache;
> +       f2fs_put_cache(entry, false);
>         f2fs_folio_put(folio, true);
>
>         f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
> @@ -1309,8 +1310,8 @@ static int ra_data_block(struct inode *inode, pgoff=
_t index)
>         if (atomic_inode)
>                 iput(atomic_inode);
>         return 0;
> -put_encrypted_page:
> -       f2fs_put_page(fio.encrypted_page, true);
> +put_cache:
> +       f2fs_put_cache(entry, true);
>  put_folio:
>         f2fs_folio_put(folio, true);
>  out_iput:
> @@ -1320,7 +1321,7 @@ static int ra_data_block(struct inode *inode, pgoff=
_t index)
>  }
>
>  /*
> - * Move data block via META_MAPPING while keeping locked data page.
> + * Move data block via meta cache while keeping locked data page.
>   * This can be used to move blocks, aka LBAs, directly on disk.
>   */
>  static int move_data_block(struct inode *inode, block_t bidx,
> @@ -1337,11 +1338,13 @@ static int move_data_block(struct inode *inode, b=
lock_t bidx,
>                 .op_flags =3D 0,
>                 .encrypted_page =3D NULL,
>                 .in_list =3D 0,
> +               .is_cache =3D 1,
>         };
>         struct dnode_of_data dn;
>         struct f2fs_summary sum;
>         struct node_info ni;
> -       struct folio *folio, *mfolio, *efolio;
> +       struct folio *folio;
> +       struct f2fs_cached_block *sentry, *tentry;
>         block_t newaddr;
>         int err =3D 0;
>         bool lfs_mode =3D f2fs_lfs_mode(fio.sbi);
> @@ -1406,20 +1409,20 @@ static int move_data_block(struct inode *inode, b=
lock_t bidx,
>         if (lfs_mode)
>                 f2fs_down_write(&fio.sbi->io_order_lock);
>
> -       mfolio =3D f2fs_grab_cache_folio(META_MAPPING(fio.sbi),
> -                                       fio.old_blkaddr, false);
> -       if (IS_ERR(mfolio)) {
> -               err =3D PTR_ERR(mfolio);
> +       sentry =3D f2fs_grab_cache(META_CACHE(fio.sbi), fio.old_blkaddr,
> +                                               F2FS_CACHE_LOCK_CREATE);
> +       if (IS_ERR(sentry)) {
> +               err =3D PTR_ERR(sentry);
>                 goto up_out;
>         }
>
> -       fio.encrypted_page =3D folio_file_page(mfolio, fio.old_blkaddr);
> +       fio.cache_entry =3D sentry;
>
> -       /* read source block in mfolio */
> -       if (!folio_test_uptodate(mfolio)) {
> -               err =3D f2fs_submit_page_bio(&fio);
> +       /* read source block in cache */
> +       if (!f2fs_cache_test_uptodate(sentry)) {
> +               err =3D f2fs_submit_cache_read(&fio);
>                 if (err) {
> -                       f2fs_folio_put(mfolio, true);
> +                       f2fs_put_cache(sentry, true);
>                         goto up_out;
>                 }
>
> @@ -1428,11 +1431,11 @@ static int move_data_block(struct inode *inode, b=
lock_t bidx,
>                 f2fs_update_iostat(fio.sbi, NULL, FS_GDATA_READ_IO,
>                                                         F2FS_BLKSIZE);
>
> -               folio_lock(mfolio);
> -               if (unlikely(!is_meta_folio(mfolio) ||
> -                            !folio_test_uptodate(mfolio))) {
> +               f2fs_lock_cache(sentry);
> +               if (unlikely(!f2fs_is_meta_cache(sentry) ||
> +                               !f2fs_cache_test_uptodate(sentry))) {
>                         err =3D -EIO;
> -                       f2fs_folio_put(mfolio, true);
> +                       f2fs_put_cache(sentry, true);
>                         goto up_out;
>                 }
>         }
> @@ -1443,46 +1446,45 @@ static int move_data_block(struct inode *inode, b=
lock_t bidx,
>         err =3D f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, =
&newaddr,
>                                 &sum, type, NULL);
>         if (err) {
> -               f2fs_folio_put(mfolio, true);
> +               f2fs_put_cache(sentry, true);
>                 /* filesystem should shutdown, no need to recovery block =
*/
>                 goto up_out;
>         }
>
> -       efolio =3D f2fs_filemap_get_folio(META_MAPPING(fio.sbi), newaddr,
> -                                       FGP_LOCK | FGP_CREAT, GFP_NOFS);
> -       if (IS_ERR(efolio)) {
> -               err =3D PTR_ERR(efolio);
> -               f2fs_folio_put(mfolio, true);
> +       tentry =3D f2fs_grab_cache(META_CACHE(fio.sbi), newaddr,
> +                                       F2FS_CACHE_LOCK_CREATE);
> +       if (IS_ERR(tentry)) {
> +               err =3D PTR_ERR(tentry);
> +               f2fs_put_cache(sentry, true);
>                 goto recover_block;
>         }
>
> -       fio.encrypted_page =3D &efolio->page;
> +       fio.cache_entry =3D tentry;
>
>         /* write target block */
> -       f2fs_wait_on_page_writeback(fio.encrypted_page, DATA, true, true)=
;
> -       memcpy(page_address(fio.encrypted_page),
> -                               folio_address(mfolio), PAGE_SIZE);
> -       f2fs_folio_put(mfolio, true);
> +       f2fs_cache_wait_writeback_cond(tentry, DATA);
> +       memcpy(cache_address(tentry), cache_address(sentry), PAGE_SIZE);

Use sbi->blocksize or F2FS_BLKSIZE instead?

Thanks,

> +       f2fs_put_cache(sentry, true);
>
>         f2fs_invalidate_internal_cache(fio.sbi, fio.old_blkaddr, 1);
>
> -       set_page_dirty(fio.encrypted_page);
> -       if (clear_page_dirty_for_io(fio.encrypted_page))
> +       f2fs_mark_cache_dirty(tentry);
> +       if (f2fs_clear_cache_dirty(tentry))
>                 dec_page_count(fio.sbi, F2FS_DIRTY_META);
>
> -       set_page_writeback(fio.encrypted_page);
> +       f2fs_start_cache_writeback(tentry);
>
>         fio.op =3D REQ_OP_WRITE;
>         fio.op_flags =3D REQ_SYNC;
>         fio.new_blkaddr =3D newaddr;
> -       f2fs_submit_page_write(&fio);
> +       f2fs_submit_cache_write(&fio);
>
>         f2fs_update_iostat(fio.sbi, NULL, FS_GC_DATA_IO, F2FS_BLKSIZE);
>
>         f2fs_update_data_blkaddr(&dn, newaddr);
>         set_inode_flag(inode, FI_APPEND_WRITE);
>
> -       f2fs_put_page(fio.encrypted_page, true);
> +       f2fs_put_cache(tentry, true);
>  recover_block:
>         if (err)
>                 f2fs_do_replace_block(fio.sbi, &sum, newaddr, fio.old_blk=
addr,
> @@ -1614,7 +1616,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi=
, struct f2fs_summary *sum,
>                         continue;
>
>                 if (phase =3D=3D 0) {
> -                       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(nid), 1,
> +                       f2fs_ra_meta_caches(sbi, NAT_BLOCK_OFFSET(nid), 1=
,
>                                                         META_NAT, true);
>                         continue;
>                 }
> @@ -1818,28 +1820,31 @@ static int do_garbage_collect(struct f2fs_sb_info=
 *sbi,
>         sum_blk_cnt =3D DIV_ROUND_UP(end_segno - segno, sbi->sums_per_blo=
ck);
>         /* readahead multi ssa blocks those have contiguous address */
>         if (__is_large_section(sbi))
> -               f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
> +               f2fs_ra_meta_caches(sbi, GET_SUM_BLOCK(sbi, segno),
>                                         sum_blk_cnt, META_SSA, true);
>
>         /* reference all summary page */
>         while (segno < end_segno) {
> -               struct folio *sum_folio =3D f2fs_get_sum_folio(sbi, segno=
);
> +               struct f2fs_cached_block *sum_entry =3D
> +                               f2fs_get_sum_cache(sbi, segno);
>
>                 segno +=3D sbi->sums_per_block;
> -               if (IS_ERR(sum_folio)) {
> -                       int err =3D PTR_ERR(sum_folio);
> +               if (IS_ERR(sum_entry)) {
> +                       int err =3D PTR_ERR(sum_entry);
>
>                         end_segno =3D segno - sbi->sums_per_block;
>                         segno =3D rounddown(start_segno, sbi->sums_per_bl=
ock);
>                         while (segno < end_segno) {
> -                               sum_folio =3D filemap_get_folio(META_MAPP=
ING(sbi),
> +                               sum_entry =3D f2fs_find_meta_cache(sbi,
>                                                 GET_SUM_BLOCK(sbi, segno)=
);
> -                               folio_put_refs(sum_folio, 2);
> +                               f2fs_put_cache(sum_entry, false);
> +                               f2fs_put_cache(sum_entry, false);
>                                 segno +=3D sbi->sums_per_block;
>                         }
>                         return err;
>                 }
> -               folio_unlock(sum_folio);
> +               f2fs_unlock_cache(sum_entry);
> +
>         }
>
>         blk_start_plug(&plug);
> @@ -1847,11 +1852,16 @@ static int do_garbage_collect(struct f2fs_sb_info=
 *sbi,
>         segno =3D start_segno;
>         while (segno < end_segno) {
>                 unsigned int cur_segno;
> +               unsigned int block_end_segno;
>
>                 /* find segment summary of victim */
> -               struct folio *sum_folio =3D filemap_get_folio(META_MAPPIN=
G(sbi),
> +               struct f2fs_cached_block *sum_entry =3D
> +                               f2fs_find_meta_cache(sbi,
>                                         GET_SUM_BLOCK(sbi, segno));
> -               unsigned int block_end_segno =3D rounddown(segno, sbi->su=
ms_per_block)
> +
> +               f2fs_bug_on(sbi, IS_ERR(sum_entry));
> +
> +               block_end_segno =3D rounddown(segno, sbi->sums_per_block)
>                                         + sbi->sums_per_block;
>
>                 if (block_end_segno > end_segno)
> @@ -1864,8 +1874,8 @@ static int do_garbage_collect(struct f2fs_sb_info *=
sbi,
>                         goto next_block;
>                 }
>
> -               if (!folio_test_uptodate(sum_folio) ||
> -                   unlikely(f2fs_cp_error(sbi)))
> +               if (!f2fs_cache_test_uptodate(sum_entry) ||
> +                       unlikely(f2fs_cp_error(sbi)))
>                         goto next_block;
>
>                 for (cur_segno =3D segno; cur_segno < block_end_segno;
> @@ -1884,7 +1894,7 @@ static int do_garbage_collect(struct f2fs_sb_info *=
sbi,
>                                 data_type =3D (type =3D=3D SUM_TYPE_DATA)=
 ? DATA : NODE;
>                         }
>
> -                       sum =3D SUM_BLK_PAGE_ADDR(sbi, sum_folio, cur_seg=
no);
> +                       sum =3D SUM_BLK_ENTRY_ADDR(sbi, sum_entry, cur_se=
gno);
>                         if (type !=3D GET_SUM_TYPE(sum_footer(sbi, sum)))=
 {
>                                 f2fs_err(sbi, "Inconsistent segment (%u) =
type "
>                                                 "[%d, %d] in SIT and SSA"=
,
> @@ -1926,12 +1936,14 @@ static int do_garbage_collect(struct f2fs_sb_info=
 *sbi,
>                                         cur_segno + 1 : NULL_SEGNO;
>
>                         if (unlikely(freezing(current))) {
> -                               folio_put_refs(sum_folio, 2);
> +                               f2fs_put_cache(sum_entry, false);
> +                               f2fs_put_cache(sum_entry, false);
>                                 goto stop;
>                         }
>                 }
>  next_block:
> -               folio_put_refs(sum_folio, 2);
> +               f2fs_put_cache(sum_entry, false);
> +               f2fs_put_cache(sum_entry, false);
>                 segno =3D block_end_segno;
>         }
>
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index aec06fb4fd76..2156fb1fc57d 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -294,7 +294,7 @@ int f2fs_write_inline_data(struct inode *inode, struc=
t folio *folio)
>         return 0;
>  }
>
> -int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio)
> +int f2fs_recover_inline_data(struct inode *inode, struct f2fs_cached_blo=
ck *entry)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>         struct f2fs_inode *ri =3D NULL;
> @@ -308,12 +308,13 @@ int f2fs_recover_inline_data(struct inode *inode, s=
truct folio *nfolio)
>          *    x       o  -> remove data blocks, and then recover inline_d=
ata
>          *    x       x  -> recover data blocks
>          */
> -       if (IS_INODE(nfolio))
> -               ri =3D F2FS_INODE(nfolio);
> +       if (IS_INODE(cache_folio(entry)))
> +               ri =3D &CACHED_NODE(entry)->i;
>
>         if (f2fs_has_inline_data(inode) &&
>                         ri && (ri->i_inline & F2FS_INLINE_DATA)) {
>                 struct folio *ifolio;
> +
>  process_inline:
>                 ifolio =3D f2fs_get_inode_folio(sbi, inode->i_ino);
>                 if (IS_ERR(ifolio))
> @@ -321,7 +322,7 @@ int f2fs_recover_inline_data(struct inode *inode, str=
uct folio *nfolio)
>
>                 f2fs_folio_wait_writeback(ifolio, NODE, true, true);
>
> -               src_addr =3D inline_data_addr(inode, nfolio);
> +               src_addr =3D inline_data_addr(inode, cache_folio(entry));
>                 dst_addr =3D inline_data_addr(inode, ifolio);
>                 memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
>
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 96cc0e777567..9f9296bdb138 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -577,7 +577,7 @@ static int do_read_inode(struct inode *inode)
>
>  static bool is_meta_ino(struct f2fs_sb_info *sbi, unsigned int ino)
>  {
> -       if (ino =3D=3D F2FS_NODE_INO(sbi) || ino =3D=3D F2FS_META_INO(sbi=
))
> +       if (ino =3D=3D F2FS_NODE_INO(sbi))
>                 return true;
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>         if (test_opt(sbi, COMPRESS_CACHE) && ino =3D=3D F2FS_COMPRESS_INO=
(sbi))
> @@ -624,9 +624,6 @@ struct inode *f2fs_iget(struct super_block *sb, unsig=
ned long ino)
>         if (ino =3D=3D F2FS_NODE_INO(sbi)) {
>                 inode->i_mapping->a_ops =3D &f2fs_node_aops;
>                 mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
> -       } else if (ino =3D=3D F2FS_META_INO(sbi)) {
> -               inode->i_mapping->a_ops =3D &f2fs_meta_aops;
> -               mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
>         } else if (ino =3D=3D F2FS_COMPRESS_INO(sbi)) {
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>                 inode->i_mapping->a_ops =3D &f2fs_compress_aops;
> @@ -824,8 +821,7 @@ int f2fs_write_inode(struct inode *inode, struct writ=
eback_control *wbc)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>
> -       if (inode->i_ino =3D=3D F2FS_NODE_INO(sbi) ||
> -                       inode->i_ino =3D=3D F2FS_META_INO(sbi))
> +       if (inode->i_ino =3D=3D F2FS_NODE_INO(sbi))
>                 return 0;
>
>         /*
> @@ -919,7 +915,6 @@ static bool f2fs_pre_evict_inode(struct inode *inode)
>                 f2fs_invalidate_compress_pages(sbi, inode->i_ino);
>
>         if (inode->i_ino =3D=3D F2FS_NODE_INO(sbi) ||
> -           inode->i_ino =3D=3D F2FS_META_INO(sbi) ||
>             inode->i_ino =3D=3D F2FS_COMPRESS_INO(sbi))
>                 return true;
>
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 86c2e67e43b6..8952d3322330 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -140,38 +140,36 @@ static void clear_node_folio_dirty(struct folio *fo=
lio)
>         folio_clear_uptodate(folio);
>  }
>
> -static struct folio *get_current_nat_folio(struct f2fs_sb_info *sbi, nid=
_t nid)
> +static struct f2fs_cached_block *get_current_nat_cache(struct f2fs_sb_in=
fo *sbi,
> +               nid_t nid)
>  {
> -       return f2fs_get_meta_folio_retry(sbi, current_nat_addr(sbi, nid))=
;
> +       return f2fs_get_meta_cache_retry(sbi, current_nat_addr(sbi, nid))=
;
>  }
>
> -static struct folio *get_next_nat_folio(struct f2fs_sb_info *sbi, nid_t =
nid)
> +static struct f2fs_cached_block *get_next_nat_cache(struct f2fs_sb_info =
*sbi,
> +               nid_t nid)
>  {
> -       struct folio *src_folio;
> -       struct folio *dst_folio;
> +       struct f2fs_cached_block *src_entry;
> +       struct f2fs_cached_block *dst_entry;
>         pgoff_t dst_off;
> -       void *src_addr;
> -       void *dst_addr;
>         struct f2fs_nm_info *nm_i =3D NM_I(sbi);
>
>         dst_off =3D next_nat_addr(sbi, current_nat_addr(sbi, nid));
>
>         /* get current nat block page with lock */
> -       src_folio =3D get_current_nat_folio(sbi, nid);
> -       if (IS_ERR(src_folio))
> -               return src_folio;
> -       dst_folio =3D f2fs_grab_meta_folio(sbi, dst_off);
> -       f2fs_bug_on(sbi, folio_test_dirty(src_folio));
> -
> -       src_addr =3D folio_address(src_folio);
> -       dst_addr =3D folio_address(dst_folio);
> -       memcpy(dst_addr, src_addr, PAGE_SIZE);
> -       folio_mark_dirty(dst_folio);
> -       f2fs_folio_put(src_folio, true);
> +       src_entry =3D get_current_nat_cache(sbi, nid);
> +       if (IS_ERR(src_entry))
> +               return src_entry;
> +       dst_entry =3D f2fs_grab_meta_cache(sbi, dst_off);
> +       f2fs_bug_on(sbi, f2fs_cache_test_dirty(src_entry));
> +
> +       memcpy(cache_address(dst_entry), cache_address(src_entry), sbi->b=
locksize);
> +       f2fs_mark_cache_dirty(dst_entry);
> +       f2fs_put_cache(src_entry, true);
>
>         set_to_next_nat(nm_i, nid);
>
> -       return dst_folio;
> +       return dst_entry;
>  }
>
>  static struct nat_entry *__alloc_nat_entry(struct f2fs_sb_info *sbi,
> @@ -580,7 +578,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_=
t nid,
>         struct f2fs_journal *journal =3D curseg->journal;
>         nid_t start_nid =3D START_NID(nid);
>         struct f2fs_nat_block *nat_blk;
> -       struct folio *folio =3D NULL;
> +       struct f2fs_cached_block *entry =3D NULL;
>         struct f2fs_nat_entry ne;
>         struct nat_entry *e;
>         pgoff_t index;
> @@ -635,14 +633,14 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, ni=
d_t nid,
>         index =3D current_nat_addr(sbi, nid);
>         f2fs_up_read_trace(&nm_i->nat_tree_lock, &lc);
>
> -       folio =3D f2fs_get_meta_folio(sbi, index);
> -       if (IS_ERR(folio))
> -               return PTR_ERR(folio);
> +       entry =3D f2fs_get_meta_cache(sbi, index);
> +       if (IS_ERR(entry))
> +               return PTR_ERR(entry);
>
> -       nat_blk =3D folio_address(folio);
> +       nat_blk =3D cache_address(entry);
>         ne =3D nat_blk->entries[nid - start_nid];
>         node_info_from_raw_nat(ni, &ne);
> -       f2fs_folio_put(folio, true);
> +       f2fs_put_cache(entry, true);
>  sanity_check:
>         if (__is_valid_data_blkaddr(ni->blk_addr) &&
>                 !f2fs_is_valid_blkaddr(sbi, ni->blk_addr,
> @@ -1628,7 +1626,7 @@ static struct folio *__get_node_folio(struct f2fs_s=
b_info *sbi, pgoff_t nid,
>  out_put_err:
>         /* ENOENT comes from read_node_folio which is not an error. */
>         if (err !=3D -ENOENT)
> -               f2fs_handle_page_eio(sbi, folio, NODE);
> +               f2fs_handle_page_eio(sbi, folio->index, NODE);
>         f2fs_folio_put(folio, true);
>         return ERR_PTR(err);
>  }
> @@ -2610,6 +2608,7 @@ static int __f2fs_build_free_nids(struct f2fs_sb_in=
fo *sbi,
>                                                 bool sync, bool mount)
>  {
>         struct f2fs_nm_info *nm_i =3D NM_I(sbi);
> +       struct f2fs_cached_block *entry =3D NULL;
>         int i =3D 0, ret;
>         nid_t nid =3D nm_i->next_scan_nid;
>         struct f2fs_lock_context lc;
> @@ -2636,7 +2635,7 @@ static int __f2fs_build_free_nids(struct f2fs_sb_in=
fo *sbi,
>         }
>
>         /* readahead nat pages to be scanned */
> -       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(nid), FREE_NID_PAGES,
> +       f2fs_ra_meta_caches(sbi, NAT_BLOCK_OFFSET(nid), FREE_NID_PAGES,
>                                                         META_NAT, true);
>
>         f2fs_down_read_trace(&nm_i->nat_tree_lock, &lc);
> @@ -2644,14 +2643,14 @@ static int __f2fs_build_free_nids(struct f2fs_sb_=
info *sbi,
>         while (1) {
>                 if (!test_bit_le(NAT_BLOCK_OFFSET(nid),
>                                                 nm_i->nat_block_bitmap)) =
{
> -                       struct folio *folio =3D get_current_nat_folio(sbi=
, nid);
> +                       entry =3D get_current_nat_cache(sbi, nid);
>
> -                       if (IS_ERR(folio)) {
> -                               ret =3D PTR_ERR(folio);
> +                       if (IS_ERR(entry)) {
> +                               ret =3D PTR_ERR(entry);
>                         } else {
> -                               ret =3D scan_nat_page(sbi, folio_address(=
folio),
> +                               ret =3D scan_nat_page(sbi, cache_address(=
entry),
>                                                 nid);
> -                               f2fs_folio_put(folio, true);
> +                               f2fs_put_cache(entry, true);
>                         }
>
>                         if (ret) {
> @@ -2684,7 +2683,7 @@ static int __f2fs_build_free_nids(struct f2fs_sb_in=
fo *sbi,
>
>         f2fs_up_read_trace(&nm_i->nat_tree_lock, &lc);
>
> -       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(nm_i->next_scan_nid),
> +       f2fs_ra_meta_caches(sbi, NAT_BLOCK_OFFSET(nm_i->next_scan_nid),
>                                         nm_i->ra_nid_pages, META_NAT, fal=
se);
>
>         return 0;
> @@ -2839,7 +2838,7 @@ int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi,=
 int nr_shrink)
>         return nr - nr_shrink;
>  }
>
> -int f2fs_recover_inline_xattr(struct inode *inode, struct folio *folio)
> +int f2fs_recover_inline_xattr(struct inode *inode, struct f2fs_cached_bl=
ock *entry)
>  {
>         void *src_addr, *dst_addr;
>         size_t inline_size;
> @@ -2850,7 +2849,7 @@ int f2fs_recover_inline_xattr(struct inode *inode, =
struct folio *folio)
>         if (IS_ERR(ifolio))
>                 return PTR_ERR(ifolio);
>
> -       ri =3D F2FS_INODE(folio);
> +       ri =3D &CACHED_NODE(entry)->i;
>         if (ri->i_inline & F2FS_INLINE_XATTR) {
>                 if (!f2fs_has_inline_xattr(inode)) {
>                         set_inode_flag(inode, FI_INLINE_XATTR);
> @@ -2865,7 +2864,7 @@ int f2fs_recover_inline_xattr(struct inode *inode, =
struct folio *folio)
>         }
>
>         dst_addr =3D inline_xattr_addr(inode, ifolio);
> -       src_addr =3D inline_xattr_addr(inode, folio);
> +       src_addr =3D inline_xattr_addr(inode, cache_folio(entry));
>         inline_size =3D inline_xattr_size(inode);
>
>         f2fs_folio_wait_writeback(ifolio, NODE, true, true);
> @@ -2876,7 +2875,7 @@ int f2fs_recover_inline_xattr(struct inode *inode, =
struct folio *folio)
>         return 0;
>  }
>
> -int f2fs_recover_xattr_data(struct inode *inode, struct folio *folio)
> +int f2fs_recover_xattr_data(struct inode *inode, struct f2fs_cached_bloc=
k *entry)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>         nid_t prev_xnid =3D F2FS_I(inode)->i_xattr_nid;
> @@ -2914,8 +2913,8 @@ int f2fs_recover_xattr_data(struct inode *inode, st=
ruct folio *folio)
>         f2fs_update_inode_page(inode);
>
>         /* 3: update and set xattr node page dirty */
> -       if (folio) {
> -               memcpy(F2FS_NODE(xfolio), F2FS_NODE(folio),
> +       if (entry) {
> +               memcpy(F2FS_NODE(xfolio), CACHED_NODE(entry),
>                                 VALID_XATTR_BLOCK_SIZE);
>                 folio_mark_dirty(xfolio);
>         }
> @@ -2924,10 +2923,10 @@ int f2fs_recover_xattr_data(struct inode *inode, =
struct folio *folio)
>         return 0;
>  }
>
> -int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct folio *foli=
o)
> +int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct f2fs_cached=
_block *entry)
>  {
>         struct f2fs_inode *src, *dst;
> -       nid_t ino =3D ino_of_node(folio);
> +       nid_t ino =3D ino_of_node(cache_folio(entry));
>         struct node_info old_ni, new_ni;
>         struct folio *ifolio;
>         int err;
> @@ -2953,7 +2952,7 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sb=
i, struct folio *folio)
>         fill_node_footer(ifolio, ino, ino, 0, true);
>         set_cold_node(ifolio, false);
>
> -       src =3D F2FS_INODE(folio);
> +       src =3D &CACHED_NODE(entry)->i;
>         dst =3D F2FS_INODE(ifolio);
>
>         memcpy(dst, src, offsetof(struct f2fs_inode, i_ext));
> @@ -3012,24 +3011,24 @@ int f2fs_restore_node_summary(struct f2fs_sb_info=
 *sbi,
>                 nrpages =3D bio_max_segs(last_offset - i);
>
>                 /* readahead node pages */
> -               f2fs_ra_meta_pages(sbi, addr, nrpages, META_POR, true);
> +               f2fs_ra_meta_caches(sbi, addr, nrpages, META_POR, true);
>
>                 for (idx =3D addr; idx < addr + nrpages; idx++) {
> -                       struct folio *folio =3D f2fs_get_tmp_folio(sbi, i=
dx);
> +                       struct f2fs_cached_block *entry =3D
> +                               f2fs_get_tmp_cache(sbi, idx);
>
> -                       if (IS_ERR(folio))
> -                               return PTR_ERR(folio);
> +                       if (IS_ERR(entry))
> +                               return PTR_ERR(entry);
>
> -                       rn =3D F2FS_NODE(folio);
> +                       rn =3D CACHED_NODE(entry);
>                         sum_entry->nid =3D rn->footer.nid;
>                         sum_entry->version =3D 0;
>                         sum_entry->ofs_in_node =3D 0;
>                         sum_entry++;
> -                       f2fs_folio_put(folio, true);
> +                       f2fs_put_cache(entry, true);
>                 }
>
> -               invalidate_mapping_pages(META_MAPPING(sbi), addr,
> -                                                       addr + nrpages);
> +               f2fs_truncate_meta_caches(sbi, addr, nrpages);
>         }
>         return 0;
>  }
> @@ -3139,7 +3138,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_inf=
o *sbi,
>         bool to_journal =3D true;
>         struct f2fs_nat_block *nat_blk;
>         struct nat_entry *ne, *cur;
> -       struct folio *folio =3D NULL;
> +       struct f2fs_cached_block *entry =3D NULL;
>
>         /*
>          * there are two steps to flush nat entries:
> @@ -3153,11 +3152,11 @@ static int __flush_nat_entry_set(struct f2fs_sb_i=
nfo *sbi,
>         if (to_journal) {
>                 down_write(&curseg->journal_rwsem);
>         } else {
> -               folio =3D get_next_nat_folio(sbi, start_nid);
> -               if (IS_ERR(folio))
> -                       return PTR_ERR(folio);
> +               entry =3D get_next_nat_cache(sbi, start_nid);
> +               if (IS_ERR(entry))
> +                       return PTR_ERR(entry);
>
> -               nat_blk =3D folio_address(folio);
> +               nat_blk =3D cache_address(entry);
>                 f2fs_bug_on(sbi, !nat_blk);
>         }
>
> @@ -3194,7 +3193,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_inf=
o *sbi,
>                 up_write(&curseg->journal_rwsem);
>         } else {
>                 __update_nat_bits(sbi, start_nid, nat_blk);
> -               f2fs_folio_put(folio, true);
> +               f2fs_put_cache(entry, true);
>         }
>
>         /* Allow dirty nats by node block allocation in write_begin */
> @@ -3266,7 +3265,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi=
, struct cp_control *cpc)
>                         __has_cursum_space(sbi, journal,
>                                         entry_count, NAT_JOURNAL))
>                         continue;
> -               f2fs_ra_meta_pages(sbi, set->set, 1, META_NAT, true);
> +               f2fs_ra_meta_caches(sbi, set->set, 1, META_NAT, true);
>         }
>         /* flush dirty nats in nat entry set */
>         list_for_each_entry_safe(set, tmp, &sets, set_list) {
> @@ -3302,15 +3301,15 @@ static int __get_nat_bitmaps(struct f2fs_sb_info =
*sbi)
>         nat_bits_addr =3D __start_cp_addr(sbi) + BLKS_PER_SEG(sbi) -
>                                                 nm_i->nat_bits_blocks;
>         for (i =3D 0; i < nm_i->nat_bits_blocks; i++) {
> -               struct folio *folio;
> +               struct f2fs_cached_block *entry;
>
> -               folio =3D f2fs_get_meta_folio(sbi, nat_bits_addr++);
> -               if (IS_ERR(folio))
> -                       return PTR_ERR(folio);
> +               entry =3D f2fs_get_meta_cache(sbi, nat_bits_addr++);
> +               if (IS_ERR(entry))
> +                       return PTR_ERR(entry);
>
>                 memcpy(nm_i->nat_bits + F2FS_BLK_TO_BYTES(i),
> -                                       folio_address(folio), F2FS_BLKSIZ=
E);
> -               f2fs_folio_put(folio, true);
> +                                       cache_address(entry), F2FS_BLKSIZ=
E);
> +               f2fs_put_cache(entry, true);
>         }
>
>         cp_ver |=3D (cur_cp_crc(ckpt) << 32);
> diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
> index 5e114f352099..de8dcd5d4392 100644
> --- a/fs/f2fs/node.h
> +++ b/fs/f2fs/node.h
> @@ -311,9 +311,9 @@ static inline void fill_node_footer_blkaddr(struct fo=
lio *folio, block_t blkaddr
>         rn->footer.next_blkaddr =3D cpu_to_le32(blkaddr);
>  }
>
> -static inline bool is_recoverable_dnode(const struct folio *folio)
> +static inline bool is_recoverable_dnode(struct f2fs_sb_info *sbi, const =
struct folio *folio)
>  {
> -       struct f2fs_checkpoint *ckpt =3D F2FS_CKPT(F2FS_F_SB(folio));
> +       struct f2fs_checkpoint *ckpt =3D F2FS_CKPT(sbi);
>         __u64 cp_ver =3D cur_cp_version(ckpt);
>
>         /* Don't care crc part, if fsck.f2fs sets it. */
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index aaa5227739c8..5cb56b4c1879 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -182,33 +182,33 @@ static const char *recover_printable_name(struct in=
ode *inode,
>         return raw->i_name;
>  }
>
> -static int recover_dentry(struct inode *inode, struct folio *ifolio,
> +static int recover_dentry(struct inode *inode, struct f2fs_cached_block =
*entry,
>                                                 struct list_head *dir_lis=
t)
>  {
> -       struct f2fs_inode *raw_inode =3D F2FS_INODE(ifolio);
> +       struct f2fs_inode *raw_inode =3D &CACHED_NODE(entry)->i;
>         nid_t pino =3D le32_to_cpu(raw_inode->i_pino);
>         struct f2fs_dir_entry *de;
>         struct f2fs_filename fname;
>         struct qstr usr_fname;
>         struct folio *folio;
>         struct inode *dir, *einode;
> -       struct fsync_inode_entry *entry;
> +       struct fsync_inode_entry *fsync_entry;
>         int err =3D 0;
>         const char *name;
>         int name_len;
>
> -       entry =3D get_fsync_inode(dir_list, pino);
> -       if (!entry) {
> -               entry =3D add_fsync_inode(F2FS_I_SB(inode), dir_list,
> +       fsync_entry =3D get_fsync_inode(dir_list, pino);
> +       if (!fsync_entry) {
> +               fsync_entry =3D add_fsync_inode(F2FS_I_SB(inode), dir_lis=
t,
>                                                         pino, false);
> -               if (IS_ERR(entry)) {
> -                       dir =3D ERR_CAST(entry);
> -                       err =3D PTR_ERR(entry);
> +               if (IS_ERR(fsync_entry)) {
> +                       dir =3D ERR_CAST(fsync_entry);
> +                       err =3D PTR_ERR(fsync_entry);
>                         goto out;
>                 }
>         }
>
> -       dir =3D entry->inode;
> +       dir =3D fsync_entry->inode;
>         err =3D init_recovered_filename(dir, inode, raw_inode, &fname, &u=
sr_fname);
>         if (err)
>                 goto out;
> @@ -256,14 +256,14 @@ static int recover_dentry(struct inode *inode, stru=
ct folio *ifolio,
>  out:
>         name =3D recover_printable_name(inode, raw_inode, &name_len);
>         f2fs_notice(F2FS_I_SB(inode), "%s: ino =3D %x, name =3D %.*s, dir=
 =3D %llu, err =3D %d",
> -                   __func__, ino_of_node(ifolio), name_len, name,
> +                   __func__, ino_of_node(cache_folio(entry)), name_len, =
name,
>                     IS_ERR(dir) ? 0 : dir->i_ino, err);
>         return err;
>  }
>
> -static int recover_quota_data(struct inode *inode, struct folio *folio)
> +static int recover_quota_data(struct inode *inode, struct f2fs_cached_bl=
ock *entry)
>  {
> -       struct f2fs_inode *raw =3D F2FS_INODE(folio);
> +       struct f2fs_inode *raw =3D &CACHED_NODE(entry)->i;
>         struct iattr attr;
>         uid_t i_uid =3D le32_to_cpu(raw->i_uid);
>         gid_t i_gid =3D le32_to_cpu(raw->i_gid);
> @@ -300,9 +300,9 @@ static void recover_inline_flags(struct inode *inode,=
 struct f2fs_inode *ri)
>                 clear_inode_flag(inode, FI_DATA_EXIST);
>  }
>
> -static int recover_inode(struct inode *inode, struct folio *folio)
> +static int recover_inode(struct inode *inode, struct f2fs_cached_block *=
entry)
>  {
> -       struct f2fs_inode *raw =3D F2FS_INODE(folio);
> +       struct f2fs_inode *raw =3D &CACHED_NODE(entry)->i;
>         struct f2fs_inode_info *fi =3D F2FS_I(inode);
>         const char *name;
>         int name_len;
> @@ -310,7 +310,7 @@ static int recover_inode(struct inode *inode, struct =
folio *folio)
>
>         inode->i_mode =3D le16_to_cpu(raw->i_mode);
>
> -       err =3D recover_quota_data(inode, folio);
> +       err =3D recover_quota_data(inode, entry);
>         if (err)
>                 return err;
>
> @@ -357,7 +357,7 @@ static int recover_inode(struct inode *inode, struct =
folio *folio)
>         name =3D recover_printable_name(inode, raw, &name_len);
>
>         f2fs_notice(F2FS_I_SB(inode), "%s: ino =3D %x, name =3D %.*s, inl=
ine =3D %x",
> -                   __func__, ino_of_node(folio), name_len, name,
> +                   __func__, ino_of_node(cache_folio(entry)), name_len, =
name,
>                     raw->i_inline);
>         return 0;
>  }
> @@ -386,30 +386,30 @@ static int sanity_check_node_chain(struct f2fs_sb_i=
nfo *sbi, block_t blkaddr,
>                 return 0;
>
>         for (i =3D 0; i < 2; i++) {
> -               struct folio *folio;
> +               struct f2fs_cached_block *entry;
>
>                 if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR))=
 {
>                         *is_detecting =3D false;
>                         return 0;
>                 }
>
> -               folio =3D f2fs_get_tmp_folio(sbi, *blkaddr_fast);
> -               if (IS_ERR(folio))
> -                       return PTR_ERR(folio);
> +               entry =3D f2fs_get_tmp_cache(sbi, *blkaddr_fast);
> +               if (IS_ERR(entry))
> +                       return PTR_ERR(entry);
>
> -               if (!is_recoverable_dnode(folio)) {
> -                       f2fs_folio_put(folio, true);
> +               if (!is_recoverable_dnode(sbi, cache_folio(entry))) {
> +                       f2fs_put_cache(entry, true);
>                         *is_detecting =3D false;
>                         return 0;
>                 }
>
>                 ra_blocks =3D adjust_por_ra_blocks(sbi, ra_blocks, *blkad=
dr_fast,
> -                                       next_blkaddr_of_node(folio));
> +                                       next_blkaddr_of_node(cache_folio(=
entry)));
>
> -               *blkaddr_fast =3D next_blkaddr_of_node(folio);
> -               f2fs_folio_put(folio, true);
> +               *blkaddr_fast =3D next_blkaddr_of_node(cache_folio(entry)=
);
> +               f2fs_put_cache(entry, true);
>
> -               f2fs_ra_meta_pages_cond(sbi, *blkaddr_fast, ra_blocks);
> +               f2fs_ra_meta_caches_cond(sbi, *blkaddr_fast, ra_blocks);
>         }
>
>         if (*blkaddr_fast =3D=3D blkaddr) {
> @@ -434,45 +434,47 @@ static int find_fsync_dnodes(struct f2fs_sb_info *s=
bi, struct list_head *head,
>         blkaddr_fast =3D blkaddr;
>
>         while (1) {
> -               struct fsync_inode_entry *entry;
> -               struct folio *folio;
> +               struct fsync_inode_entry *fsync_entry;
> +               struct f2fs_cached_block *entry;
> +               struct f2fs_node *rn;
>
>                 if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
>                         return 0;
>
> -               folio =3D f2fs_get_tmp_folio(sbi, blkaddr);
> -               if (IS_ERR(folio)) {
> -                       err =3D PTR_ERR(folio);
> +               entry =3D f2fs_get_tmp_cache(sbi, blkaddr);
> +               if (IS_ERR(entry)) {
> +                       err =3D PTR_ERR(entry);
>                         break;
>                 }
> +               rn =3D CACHED_NODE(entry);
>
> -               if (!is_recoverable_dnode(folio)) {
> -                       f2fs_folio_put(folio, true);
> +               if (!is_recoverable_dnode(sbi, cache_folio(entry))) {
> +                       f2fs_put_cache(entry, true);
>                         break;
>                 }
>
> -               if (!is_fsync_dnode(folio))
> +               if (!is_fsync_dnode(cache_folio(entry)))
>                         goto next;
>
> -               entry =3D get_fsync_inode(head, ino_of_node(folio));
> -               if (!entry) {
> +               fsync_entry =3D get_fsync_inode(head, ino_of_node(cache_f=
olio(entry)));
> +               if (!fsync_entry) {
>                         bool quota_inode =3D false;
>
>                         if (!check_only &&
> -                                       IS_INODE(folio) &&
> -                                       is_dent_dnode(folio)) {
> -                               err =3D f2fs_recover_inode_page(sbi, foli=
o);
> +                                       IS_INODE(cache_folio(entry)) &&
> +                                       is_dent_dnode(cache_folio(entry))=
) {
> +                               err =3D f2fs_recover_inode_page(sbi, entr=
y);
>                                 if (err) {
> -                                       f2fs_folio_put(folio, true);
> +                                       f2fs_put_cache(entry, true);
>                                         break;
>                                 }
>                                 quota_inode =3D true;
>                         }
>
> -                       entry =3D add_fsync_inode(sbi, head, ino_of_node(=
folio),
> +                       fsync_entry =3D add_fsync_inode(sbi, head, ino_of=
_node(cache_folio(entry)),
>                                                                 quota_ino=
de);
> -                       if (IS_ERR(entry)) {
> -                               err =3D PTR_ERR(entry);
> +                       if (IS_ERR(fsync_entry)) {
> +                               err =3D PTR_ERR(fsync_entry);
>                                 /*
>                                  * CP | dnode(F) | inode(DF)
>                                  * For this case, we should not give up n=
ow.
> @@ -482,18 +484,18 @@ static int find_fsync_dnodes(struct f2fs_sb_info *s=
bi, struct list_head *head,
>                                                 *new_inode =3D true;
>                                         goto next;
>                                 }
> -                               f2fs_folio_put(folio, true);
> +                               f2fs_put_cache(entry, true);
>                                 break;
>                         }
>                 }
> -               entry->blkaddr =3D blkaddr;
> +               fsync_entry->blkaddr =3D blkaddr;
>
> -               if (IS_INODE(folio) && is_dent_dnode(folio))
> -                       entry->last_dentry =3D blkaddr;
> +               if (IS_INODE(cache_folio(entry)) && is_dent_dnode(cache_f=
olio(entry)))
> +                       fsync_entry->last_dentry =3D blkaddr;
>  next:
>                 /* check next segment */
> -               blkaddr =3D next_blkaddr_of_node(folio);
> -               f2fs_folio_put(folio, true);
> +               blkaddr =3D next_blkaddr_of_node(cache_folio(entry));
> +               f2fs_put_cache(entry, true);
>
>                 err =3D sanity_check_node_chain(sbi, blkaddr, &blkaddr_fa=
st,
>                                 &is_detecting);
> @@ -519,7 +521,8 @@ static int check_index_in_prev_nodes(struct f2fs_sb_i=
nfo *sbi,
>         unsigned short blkoff =3D GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
>         struct f2fs_summary_block *sum_node;
>         struct f2fs_summary sum;
> -       struct folio *sum_folio, *node_folio;
> +       struct f2fs_cached_block *entry =3D NULL;
> +       struct folio *node_folio;
>         struct dnode_of_data tdn =3D *dn;
>         nid_t ino, nid;
>         struct inode *inode;
> @@ -541,12 +544,12 @@ static int check_index_in_prev_nodes(struct f2fs_sb=
_info *sbi,
>                 }
>         }
>
> -       sum_folio =3D f2fs_get_sum_folio(sbi, segno);
> -       if (IS_ERR(sum_folio))
> -               return PTR_ERR(sum_folio);
> -       sum_node =3D SUM_BLK_PAGE_ADDR(sbi, sum_folio, segno);
> +       entry =3D f2fs_get_sum_cache(sbi, segno);
> +       if (IS_ERR(entry))
> +               return PTR_ERR(entry);
> +       sum_node =3D SUM_BLK_ENTRY_ADDR(sbi, entry, segno);
>         sum =3D sum_entries(sum_node)[blkoff];
> -       f2fs_folio_put(sum_folio, true);
> +       f2fs_put_cache(entry, true);
>  got_it:
>         /* Use the locked dnode page and inode */
>         nid =3D le32_to_cpu(sum.nid);
> @@ -645,7 +648,7 @@ static int f2fs_reserve_new_block_retry(struct dnode_=
of_data *dn)
>  }
>
>  static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode=
,
> -                                       struct folio *folio)
> +                                       struct f2fs_cached_block *entry)
>  {
>         struct dnode_of_data dn;
>         struct node_info ni;
> @@ -653,19 +656,19 @@ static int do_recover_data(struct f2fs_sb_info *sbi=
, struct inode *inode,
>         int err =3D 0, recovered =3D 0;
>
>         /* step 1: recover xattr */
> -       if (IS_INODE(folio)) {
> -               err =3D f2fs_recover_inline_xattr(inode, folio);
> +       if (IS_INODE(cache_folio(entry))) {
> +               err =3D f2fs_recover_inline_xattr(inode, entry);
>                 if (err)
>                         goto out;
> -       } else if (f2fs_has_xattr_block(ofs_of_node(folio))) {
> -               err =3D f2fs_recover_xattr_data(inode, folio);
> +       } else if (f2fs_has_xattr_block(ofs_of_node(cache_folio(entry))))=
 {
> +               err =3D f2fs_recover_xattr_data(inode, entry);
>                 if (!err)
>                         recovered++;
>                 goto out;
>         }
>
>         /* step 2: recover inline data */
> -       err =3D f2fs_recover_inline_data(inode, folio);
> +       err =3D f2fs_recover_inline_data(inode, entry);
>         if (err) {
>                 if (err =3D=3D 1)
>                         err =3D 0;
> @@ -673,8 +676,8 @@ static int do_recover_data(struct f2fs_sb_info *sbi, =
struct inode *inode,
>         }
>
>         /* step 3: recover data indices */
> -       start =3D f2fs_start_bidx_of_node(ofs_of_node(folio), inode);
> -       end =3D start + ADDRS_PER_PAGE(folio, inode);
> +       start =3D f2fs_start_bidx_of_node(ofs_of_node(cache_folio(entry))=
, inode);
> +       end =3D start + addrs_per_page(inode, IS_INODE(cache_folio(entry)=
));
>
>         set_new_dnode(&dn, inode, NULL, NULL, 0);
>  retry_dn:
> @@ -693,12 +696,12 @@ static int do_recover_data(struct f2fs_sb_info *sbi=
, struct inode *inode,
>         if (err)
>                 goto err;
>
> -       f2fs_bug_on(sbi, ni.ino !=3D ino_of_node(folio));
> +       f2fs_bug_on(sbi, ni.ino !=3D ino_of_node(cache_folio(entry)));
>
> -       if (ofs_of_node(dn.node_folio) !=3D ofs_of_node(folio)) {
> +       if (ofs_of_node(dn.node_folio) !=3D ofs_of_node(cache_folio(entry=
))) {
>                 f2fs_warn(sbi, "Inconsistent ofs_of_node, ino:%llu, ofs:%=
u, %u",
>                           inode->i_ino, ofs_of_node(dn.node_folio),
> -                         ofs_of_node(folio));
> +                         ofs_of_node(cache_folio(entry)));
>                 err =3D -EFSCORRUPTED;
>                 f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
>                 fserror_report_file_metadata(dn.inode, err, GFP_NOFS);
> @@ -709,7 +712,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, =
struct inode *inode,
>                 block_t src, dest;
>
>                 src =3D f2fs_data_blkaddr(&dn);
> -               dest =3D data_blkaddr(dn.inode, folio, dn.ofs_in_node);
> +               dest =3D data_blkaddr(dn.inode, cache_folio(entry), dn.of=
s_in_node);
>
>                 if (__is_valid_data_blkaddr(src) &&
>                         !f2fs_is_valid_blkaddr(sbi, src, META_POR)) {
> @@ -784,16 +787,16 @@ static int do_recover_data(struct f2fs_sb_info *sbi=
, struct inode *inode,
>                 }
>         }
>
> -       copy_node_footer(dn.node_folio, folio);
> +       copy_node_footer(dn.node_folio, cache_folio(entry));
>         fill_node_footer(dn.node_folio, dn.nid, ni.ino,
> -                                       ofs_of_node(folio), false);
> +                                       ofs_of_node(cache_folio(entry)), =
false);
>         folio_mark_dirty(dn.node_folio);
>  err:
>         f2fs_put_dnode(&dn);
>  out:
>         f2fs_notice(sbi, "recover_data: ino =3D %llx, nid =3D %x (i_size:=
 %s), "
>                     "range (%u, %u), recovered =3D %d, err =3D %d",
> -                   inode->i_ino, nid_of_node(folio),
> +                   inode->i_ino, nid_of_node(cache_folio(entry)),
>                     file_keep_isize(inode) ? "keep" : "recover",
>                     start, end, recovered, err);
>         return err;
> @@ -820,26 +823,26 @@ static int recover_data(struct f2fs_sb_info *sbi, s=
truct list_head *inode_list,
>         blkaddr =3D NEXT_FREE_BLKADDR(sbi, curseg);
>
>         while (1) {
> -               struct fsync_inode_entry *entry;
> -               struct folio *folio;
> +               struct fsync_inode_entry *fsync_entry;
> +               struct f2fs_cached_block *entry;
>
>                 if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
>                         break;
>
> -               folio =3D f2fs_get_tmp_folio(sbi, blkaddr);
> -               if (IS_ERR(folio)) {
> -                       err =3D PTR_ERR(folio);
> +               entry =3D f2fs_get_tmp_cache(sbi, blkaddr);
> +               if (IS_ERR(entry)) {
> +                       err =3D PTR_ERR(entry);
>                         break;
>                 }
>
> -               if (!is_recoverable_dnode(folio)) {
> -                       f2fs_folio_put(folio, true);
> +               if (!is_recoverable_dnode(sbi, cache_folio(entry))) {
> +                       f2fs_put_cache(entry, true);
>                         break;
>                 }
>                 recoverable_dnode++;
>
> -               entry =3D get_fsync_inode(inode_list, ino_of_node(folio))=
;
> -               if (!entry)
> +               fsync_entry =3D get_fsync_inode(inode_list, ino_of_node(c=
ache_folio(entry)));
> +               if (!fsync_entry)
>                         goto next;
>                 fsynced_dnode++;
>                 /*
> @@ -847,40 +850,40 @@ static int recover_data(struct f2fs_sb_info *sbi, s=
truct list_head *inode_list,
>                  * In this case, we can lose the latest inode(x).
>                  * So, call recover_inode for the inode update.
>                  */
> -               if (IS_INODE(folio)) {
> -                       err =3D recover_inode(entry->inode, folio);
> +               if (IS_INODE(cache_folio(entry))) {
> +                       err =3D recover_inode(fsync_entry->inode, entry);
>                         if (err) {
> -                               f2fs_folio_put(folio, true);
> +                               f2fs_put_cache(entry, true);
>                                 break;
>                         }
>                         recovered_inode++;
>                 }
> -               if (entry->last_dentry =3D=3D blkaddr) {
> -                       err =3D recover_dentry(entry->inode, folio, dir_l=
ist);
> +               if (fsync_entry->last_dentry =3D=3D blkaddr) {
> +                       err =3D recover_dentry(fsync_entry->inode, entry,=
 dir_list);
>                         if (err) {
> -                               f2fs_folio_put(folio, true);
> +                               f2fs_put_cache(entry, true);
>                                 break;
>                         }
>                         recovered_dentry++;
>                 }
> -               err =3D do_recover_data(sbi, entry->inode, folio);
> +               err =3D do_recover_data(sbi, fsync_entry->inode, entry);
>                 if (err) {
> -                       f2fs_folio_put(folio, true);
> +                       f2fs_put_cache(entry, true);
>                         break;
>                 }
>                 recovered_dnode++;
>
> -               if (entry->blkaddr =3D=3D blkaddr)
> -                       list_move_tail(&entry->list, tmp_inode_list);
> +               if (fsync_entry->blkaddr =3D=3D blkaddr)
> +                       list_move_tail(&fsync_entry->list, tmp_inode_list=
);
>  next:
>                 ra_blocks =3D adjust_por_ra_blocks(sbi, ra_blocks, blkadd=
r,
> -                                       next_blkaddr_of_node(folio));
> +                                       next_blkaddr_of_node(cache_folio(=
entry)));
>
>                 /* check next segment */
> -               blkaddr =3D next_blkaddr_of_node(folio);
> -               f2fs_folio_put(folio, true);
> +               blkaddr =3D next_blkaddr_of_node(cache_folio(entry));
> +               f2fs_put_cache(entry, true);
>
> -               f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
> +               f2fs_ra_meta_caches_cond(sbi, blkaddr, ra_blocks);
>                 total_dnode++;
>         }
>         if (!err)
> @@ -937,12 +940,11 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sb=
i, bool check_only)
>         destroy_fsync_dnodes(&tmp_inode_list, err);
>
>         /* truncate meta pages to be used by the recovery */
> -       truncate_inode_pages_range(META_MAPPING(sbi),
> -                       (loff_t)MAIN_BLKADDR(sbi) << PAGE_SHIFT, -1);
> -
> +       f2fs_truncate_meta_caches(sbi, MAIN_BLKADDR(sbi),
> +                               MAX_BLKADDR(sbi) - MAIN_BLKADDR(sbi));
>         if (err) {
>                 truncate_inode_pages_final(NODE_MAPPING(sbi));
> -               truncate_inode_pages_final(META_MAPPING(sbi));
> +               f2fs_truncate_meta_caches(sbi, 0, ULONG_MAX);
>         }
>
>         /*
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index ed6f2947210b..e6fe3dfa8fa6 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2774,63 +2774,62 @@ int f2fs_npages_for_summary_flush(struct f2fs_sb_=
info *sbi, bool for_ra)
>         return 3;
>  }
>
> -/*
> - * Caller should put this summary folio
> - */
> -struct folio *f2fs_get_sum_folio(struct f2fs_sb_info *sbi, unsigned int =
segno)
> +
> +struct f2fs_cached_block *f2fs_get_sum_cache(struct f2fs_sb_info *sbi,
> +               unsigned int segno)
>  {
>         if (unlikely(f2fs_cp_error(sbi)))
>                 return ERR_PTR(-EIO);
> -       return f2fs_get_meta_folio_retry(sbi, GET_SUM_BLOCK(sbi, segno));
> +       return f2fs_get_meta_cache_retry(sbi, GET_SUM_BLOCK(sbi, segno));
>  }
>
>  void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
>                                         void *src, block_t blk_addr)
>  {
> -       struct folio *folio;
> +       struct f2fs_cached_block *entry;
>
>         if (!f2fs_sb_has_packed_ssa(sbi))
> -               folio =3D f2fs_grab_meta_folio(sbi, blk_addr);
> +               entry =3D f2fs_grab_meta_cache(sbi, blk_addr);
>         else
> -               folio =3D f2fs_get_meta_folio_retry(sbi, blk_addr);
> +               entry =3D f2fs_get_meta_cache_retry(sbi, blk_addr);
>
> -       if (IS_ERR(folio))
> +       if (IS_ERR(entry))
>                 return;
>
> -       memcpy(folio_address(folio), src, PAGE_SIZE);
> -       folio_mark_dirty(folio);
> -       f2fs_folio_put(folio, true);
> +       memcpy(cache_address(entry), src, sbi->blocksize);
> +       f2fs_mark_cache_dirty(entry);
> +       f2fs_put_cache(entry, true);
>  }
>
>  static void write_sum_page(struct f2fs_sb_info *sbi,
>                 struct f2fs_summary_block *sum_blk, unsigned int segno)
>  {
> -       struct folio *folio;
> +       struct f2fs_cached_block *entry;
>
>         if (!f2fs_sb_has_packed_ssa(sbi))
>                 return f2fs_update_meta_page(sbi, (void *)sum_blk,
>                                 GET_SUM_BLOCK(sbi, segno));
>
> -       folio =3D f2fs_get_sum_folio(sbi, segno);
> -       if (IS_ERR(folio))
> +       entry =3D f2fs_get_sum_cache(sbi, segno);
> +       if (IS_ERR(entry))
>                 return;
>
> -       memcpy(SUM_BLK_PAGE_ADDR(sbi, folio, segno), sum_blk,
> +       memcpy(SUM_BLK_ENTRY_ADDR(sbi, entry, segno), sum_blk,
>                         sbi->sum_blocksize);
> -       folio_mark_dirty(folio);
> -       f2fs_folio_put(folio, true);
> +       f2fs_mark_cache_dirty(entry);
> +       f2fs_put_cache(entry, true);
>  }
>
>  static void write_current_sum_page(struct f2fs_sb_info *sbi,
>                                                 int type, block_t blk_add=
r)
>  {
>         struct curseg_info *curseg =3D CURSEG_I(sbi, type);
> -       struct folio *folio =3D f2fs_grab_meta_folio(sbi, blk_addr);
> +       struct f2fs_cached_block *entry =3D f2fs_grab_meta_cache(sbi, blk=
_addr);
>         struct f2fs_summary_block *src =3D curseg->sum_blk;
>         struct f2fs_summary_block *dst;
>
> -       dst =3D folio_address(folio);
> -       memset(dst, 0, PAGE_SIZE);
> +       dst =3D cache_address(entry);
> +       memset(dst, 0, sbi->blocksize);
>
>         mutex_lock(&curseg->curseg_mutex);
>
> @@ -2843,8 +2842,8 @@ static void write_current_sum_page(struct f2fs_sb_i=
nfo *sbi,
>
>         mutex_unlock(&curseg->curseg_mutex);
>
> -       folio_mark_dirty(folio);
> -       f2fs_folio_put(folio, true);
> +       f2fs_mark_cache_dirty(entry);
> +       f2fs_put_cache(entry, true);
>  }
>
>  static int is_next_segment_free(struct f2fs_sb_info *sbi,
> @@ -3160,7 +3159,7 @@ static int change_curseg(struct f2fs_sb_info *sbi, =
int type)
>         struct curseg_info *curseg =3D CURSEG_I(sbi, type);
>         unsigned int new_segno =3D curseg->next_segno;
>         struct f2fs_summary_block *sum_node;
> -       struct folio *sum_folio;
> +       struct f2fs_cached_block *entry =3D NULL;
>
>         if (curseg->inited)
>                 write_sum_page(sbi, curseg->sum_blk, curseg->segno);
> @@ -3176,15 +3175,15 @@ static int change_curseg(struct f2fs_sb_info *sbi=
, int type)
>         curseg->alloc_type =3D SSR;
>         curseg->next_blkoff =3D __next_free_blkoff(sbi, curseg->segno, 0)=
;
>
> -       sum_folio =3D f2fs_get_sum_folio(sbi, new_segno);
> -       if (IS_ERR(sum_folio)) {
> +       entry =3D f2fs_get_sum_cache(sbi, new_segno);
> +       if (IS_ERR(entry)) {
>                 /* GC won't be able to use stale summary pages by cp_erro=
r */
>                 memset(curseg->sum_blk, 0, sbi->sum_entry_size);
> -               return PTR_ERR(sum_folio);
> +               return PTR_ERR(entry);
>         }
> -       sum_node =3D SUM_BLK_PAGE_ADDR(sbi, sum_folio, new_segno);
> +       sum_node =3D SUM_BLK_ENTRY_ADDR(sbi, entry, new_segno);
>         memcpy(curseg->sum_blk, sum_node, sbi->sum_entry_size);
> -       f2fs_folio_put(sum_folio, true);
> +       f2fs_put_cache(entry, true);
>         return 0;
>  }
>
> @@ -4128,8 +4127,9 @@ static void do_write_page(struct f2fs_summary *sum,=
 struct f2fs_io_info *fio)
>                 f2fs_up_read(&fio->sbi->io_order_lock);
>  }
>
> -void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct folio *fol=
io,
> -                                       enum iostat_type io_type)
> +void f2fs_do_write_meta_cache(struct f2fs_sb_info *sbi,
> +                       struct f2fs_cached_block *entry,
> +                       enum iostat_type io_type)
>  {
>         struct f2fs_io_info fio =3D {
>                 .sbi =3D sbi,
> @@ -4137,20 +4137,21 @@ void f2fs_do_write_meta_page(struct f2fs_sb_info =
*sbi, struct folio *folio,
>                 .temp =3D HOT,
>                 .op =3D REQ_OP_WRITE,
>                 .op_flags =3D REQ_SYNC | REQ_META | REQ_PRIO,
> -               .old_blkaddr =3D folio->index,
> -               .new_blkaddr =3D folio->index,
> -               .folio =3D folio,
> +               .old_blkaddr =3D entry->index,
> +               .new_blkaddr =3D entry->index,
>                 .encrypted_page =3D NULL,
>                 .in_list =3D 0,
> +               .cache_entry =3D entry,
> +               .is_cache =3D 1,
>         };
>
> -       if (unlikely(folio->index >=3D MAIN_BLKADDR(sbi)))
> +       if (unlikely(entry->index >=3D MAIN_BLKADDR(sbi)))
>                 fio.op_flags &=3D ~REQ_META;
>
> -       folio_start_writeback(folio);
> -       f2fs_submit_page_write(&fio);
> +       f2fs_start_cache_writeback(entry);
> +       f2fs_submit_cache_write(&fio);
>
> -       stat_inc_meta_count(sbi, folio->index);
> +       stat_inc_meta_count(sbi, entry->index);
>         f2fs_update_iostat(sbi, NULL, io_type, F2FS_BLKSIZE);
>  }
>
> @@ -4207,7 +4208,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fi=
o)
>         }
>
>         if (fio->meta_gc)
> -               f2fs_truncate_meta_inode_pages(sbi, fio->new_blkaddr, 1);
> +               f2fs_truncate_meta_caches(sbi, fio->new_blkaddr, 1);
>
>         stat_inc_inplace_blocks(fio->sbi);
>
> @@ -4373,7 +4374,7 @@ void f2fs_folio_wait_writeback(struct folio *folio,=
 enum page_type type,
>  void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> -       struct folio *cfolio;
> +       struct f2fs_cached_block *entry;
>
>         if (!f2fs_meta_inode_gc_required(inode))
>                 return;
> @@ -4381,11 +4382,12 @@ void f2fs_wait_on_block_writeback(struct inode *i=
node, block_t blkaddr)
>         if (!__is_valid_data_blkaddr(blkaddr))
>                 return;
>
> -       cfolio =3D filemap_lock_folio(META_MAPPING(sbi), blkaddr);
> -       if (!IS_ERR(cfolio)) {
> -               f2fs_folio_wait_writeback(cfolio, DATA, true, true);
> -               f2fs_folio_put(cfolio, true);
> -       }
> +       entry =3D f2fs_find_cache(META_CACHE(sbi), blkaddr);
> +       if (IS_ERR(entry))
> +               return;
> +       f2fs_lock_cache(entry);
> +       f2fs_cache_wait_writeback_cond(entry, DATA);
> +       f2fs_put_cache(entry, true);
>  }
>
>  void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blk=
addr,
> @@ -4400,7 +4402,7 @@ void f2fs_wait_on_block_writeback_range(struct inod=
e *inode, block_t blkaddr,
>         for (i =3D 0; i < len; i++)
>                 f2fs_wait_on_block_writeback(inode, blkaddr + i);
>
> -       f2fs_truncate_meta_inode_pages(sbi, blkaddr, len);
> +       f2fs_truncate_meta_caches(sbi, blkaddr, len);
>  }
>
>  static int read_compacted_summaries(struct f2fs_sb_info *sbi)
> @@ -4408,16 +4410,16 @@ static int read_compacted_summaries(struct f2fs_s=
b_info *sbi)
>         struct f2fs_checkpoint *ckpt =3D F2FS_CKPT(sbi);
>         struct curseg_info *seg_i;
>         unsigned char *kaddr;
> -       struct folio *folio;
> +       struct f2fs_cached_block *entry;
>         block_t start;
>         int i, j, offset;
>
>         start =3D start_sum_block(sbi);
>
> -       folio =3D f2fs_get_meta_folio(sbi, start++);
> -       if (IS_ERR(folio))
> -               return PTR_ERR(folio);
> -       kaddr =3D folio_address(folio);
> +       entry =3D f2fs_get_meta_cache(sbi, start++);
> +       if (IS_ERR(entry))
> +               return PTR_ERR(entry);
> +       kaddr =3D cache_address(entry);
>
>         /* Step 1: restore nat cache */
>         seg_i =3D CURSEG_I(sbi, CURSEG_HOT_DATA);
> @@ -4454,16 +4456,16 @@ static int read_compacted_summaries(struct f2fs_s=
b_info *sbi)
>                                                 SUM_FOOTER_SIZE)
>                                 continue;
>
> -                       f2fs_folio_put(folio, true);
> +                       f2fs_put_cache(entry, true);
>
> -                       folio =3D f2fs_get_meta_folio(sbi, start++);
> -                       if (IS_ERR(folio))
> -                               return PTR_ERR(folio);
> -                       kaddr =3D folio_address(folio);
> +                       entry =3D f2fs_get_meta_cache(sbi, start++);
> +                       if (IS_ERR(entry))
> +                               return PTR_ERR(entry);
> +                       kaddr =3D cache_address(entry);
>                         offset =3D 0;
>                 }
>         }
> -       f2fs_folio_put(folio, true);
> +       f2fs_put_cache(entry, true);
>         return 0;
>  }
>
> @@ -4472,7 +4474,7 @@ static int read_normal_summaries(struct f2fs_sb_inf=
o *sbi, int type)
>         struct f2fs_checkpoint *ckpt =3D F2FS_CKPT(sbi);
>         struct f2fs_summary_block *sum;
>         struct curseg_info *curseg;
> -       struct folio *new;
> +       struct f2fs_cached_block *entry;
>         unsigned short blk_off;
>         unsigned int segno =3D 0;
>         block_t blk_addr =3D 0;
> @@ -4499,10 +4501,10 @@ static int read_normal_summaries(struct f2fs_sb_i=
nfo *sbi, int type)
>                         blk_addr =3D GET_SUM_BLOCK(sbi, segno);
>         }
>
> -       new =3D f2fs_get_meta_folio(sbi, blk_addr);
> -       if (IS_ERR(new))
> -               return PTR_ERR(new);
> -       sum =3D folio_address(new);
> +       entry =3D f2fs_get_meta_cache(sbi, blk_addr);
> +       if (IS_ERR(entry))
> +               return PTR_ERR(entry);
> +       sum =3D cache_address(entry);
>
>         if (IS_NODESEG(type)) {
>                 if (__exist_node_summaries(sbi)) {
> @@ -4539,7 +4541,7 @@ static int read_normal_summaries(struct f2fs_sb_inf=
o *sbi, int type)
>         curseg->next_blkoff =3D blk_off;
>         mutex_unlock(&curseg->curseg_mutex);
>  out:
> -       f2fs_folio_put(new, true);
> +       f2fs_put_cache(entry, true);
>         return err;
>  }
>
> @@ -4554,8 +4556,8 @@ static int restore_curseg_summaries(struct f2fs_sb_=
info *sbi)
>                 int npages =3D f2fs_npages_for_summary_flush(sbi, true);
>
>                 if (npages >=3D 2)
> -                       f2fs_ra_meta_pages(sbi, start_sum_block(sbi), npa=
ges,
> -                                                       META_CP, true);
> +                       f2fs_ra_meta_caches(sbi, start_sum_block(sbi),
> +                                       npages, META_CP, true);
>
>                 /* restore for compacted data summary */
>                 err =3D read_compacted_summaries(sbi);
> @@ -4565,7 +4567,7 @@ static int restore_curseg_summaries(struct f2fs_sb_=
info *sbi)
>         }
>
>         if (__exist_node_summaries(sbi))
> -               f2fs_ra_meta_pages(sbi,
> +               f2fs_ra_meta_caches(sbi,
>                                 sum_blk_addr(sbi, NR_CURSEG_PERSIST_TYPE,=
 type),
>                                 NR_CURSEG_PERSIST_TYPE - type, META_CP, t=
rue);
>
> @@ -4588,16 +4590,16 @@ static int restore_curseg_summaries(struct f2fs_s=
b_info *sbi)
>
>  static void write_compacted_summaries(struct f2fs_sb_info *sbi, block_t =
blkaddr)
>  {
> -       struct folio *folio;
> +       struct f2fs_cached_block *entry =3D NULL;
>         unsigned char *kaddr;
>         struct f2fs_summary *summary;
>         struct curseg_info *seg_i;
>         int written_size =3D 0;
>         int i, j;
>
> -       folio =3D f2fs_grab_meta_folio(sbi, blkaddr++);
> -       kaddr =3D folio_address(folio);
> -       memset(kaddr, 0, PAGE_SIZE);
> +       entry =3D f2fs_grab_meta_cache(sbi, blkaddr++);
> +       kaddr =3D cache_address(entry);
> +       memset(kaddr, 0, sbi->blocksize);
>
>         /* Step 1: write nat cache */
>         seg_i =3D CURSEG_I(sbi, CURSEG_HOT_DATA);
> @@ -4613,10 +4615,10 @@ static void write_compacted_summaries(struct f2fs=
_sb_info *sbi, block_t blkaddr)
>         for (i =3D CURSEG_HOT_DATA; i <=3D CURSEG_COLD_DATA; i++) {
>                 seg_i =3D CURSEG_I(sbi, i);
>                 for (j =3D 0; j < f2fs_curseg_valid_blocks(sbi, i); j++) =
{
> -                       if (!folio) {
> -                               folio =3D f2fs_grab_meta_folio(sbi, blkad=
dr++);
> -                               kaddr =3D folio_address(folio);
> -                               memset(kaddr, 0, PAGE_SIZE);
> +                       if (!entry) {
> +                               entry =3D f2fs_grab_meta_cache(sbi, blkad=
dr++);
> +                               kaddr =3D cache_address(entry);
> +                               memset(kaddr, 0, sbi->blocksize);
>                                 written_size =3D 0;
>                         }
>                         summary =3D (struct f2fs_summary *)(kaddr + writt=
en_size);
> @@ -4627,14 +4629,14 @@ static void write_compacted_summaries(struct f2fs=
_sb_info *sbi, block_t blkaddr)
>                                                         SUM_FOOTER_SIZE)
>                                 continue;
>
> -                       folio_mark_dirty(folio);
> -                       f2fs_folio_put(folio, true);
> -                       folio =3D NULL;
> +                       f2fs_mark_cache_dirty(entry);
> +                       f2fs_put_cache(entry, true);
> +                       entry =3D NULL;
>                 }
>         }
> -       if (folio) {
> -               folio_mark_dirty(folio);
> -               f2fs_folio_put(folio, true);
> +       if (entry) {
> +               f2fs_mark_cache_dirty(entry);
> +               f2fs_put_cache(entry, true);
>         }
>  }
>
> @@ -4688,29 +4690,29 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_sb_=
info *sbi,
>         return -1;
>  }
>
> -static struct folio *get_current_sit_folio(struct f2fs_sb_info *sbi,
> +static struct f2fs_cached_block *get_current_sit_cache(struct f2fs_sb_in=
fo *sbi,
>                                         unsigned int segno)
>  {
> -       return f2fs_get_meta_folio(sbi, current_sit_addr(sbi, segno));
> +       return f2fs_get_meta_cache(sbi, current_sit_addr(sbi, segno));
>  }
>
> -static struct folio *get_next_sit_folio(struct f2fs_sb_info *sbi,
> +static struct f2fs_cached_block *get_next_sit_cache(struct f2fs_sb_info =
*sbi,
>                                         unsigned int start)
>  {
>         struct sit_info *sit_i =3D SIT_I(sbi);
> -       struct folio *folio;
> +       struct f2fs_cached_block *entry;
>         pgoff_t src_off, dst_off;
>
>         src_off =3D current_sit_addr(sbi, start);
>         dst_off =3D next_sit_addr(sbi, src_off);
>
> -       folio =3D f2fs_grab_meta_folio(sbi, dst_off);
> -       seg_info_to_sit_folio(sbi, folio, start);
> +       entry =3D f2fs_grab_meta_cache(sbi, dst_off);
> +       seg_info_to_sit_block(sbi, entry, start);
>
> -       folio_mark_dirty(folio);
> +       f2fs_mark_cache_dirty(entry);
>         set_to_next_sit(sit_i, start);
>
> -       return folio;
> +       return entry;
>  }
>
>  static struct sit_entry_set *grab_sit_entry_set(void)
> @@ -4840,8 +4842,9 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sb=
i, struct cp_control *cpc)
>          * #2, flush sit entries to sit page.
>          */
>         list_for_each_entry_safe(ses, tmp, head, set_list) {
> -               struct folio *folio =3D NULL;
> +               struct f2fs_cached_block *entry =3D NULL;
>                 struct f2fs_sit_block *raw_sit =3D NULL;
> +
>                 unsigned int start_segno =3D ses->start_segno;
>                 unsigned int end =3D min(start_segno + SIT_ENTRY_PER_BLOC=
K,
>                                                 (unsigned long)MAIN_SEGS(=
sbi));
> @@ -4855,8 +4858,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sb=
i, struct cp_control *cpc)
>                 if (to_journal) {
>                         down_write(&curseg->journal_rwsem);
>                 } else {
> -                       folio =3D get_next_sit_folio(sbi, start_segno);
> -                       raw_sit =3D folio_address(folio);
> +                       entry =3D get_next_sit_cache(sbi, start_segno);
> +                       raw_sit =3D cache_address(entry);
>                 }
>
>                 /* flush dirty sit entries in region of current sit set *=
/
> @@ -4901,7 +4904,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sb=
i, struct cp_control *cpc)
>                 if (to_journal)
>                         up_write(&curseg->journal_rwsem);
>                 else
> -                       f2fs_folio_put(folio, true);
> +                       f2fs_put_cache(entry, true);
>
>                 f2fs_bug_on(sbi, ses->entry_cnt);
>                 release_sit_entry_set(ses);
> @@ -5092,7 +5095,7 @@ static int build_sit_entries(struct f2fs_sb_info *s=
bi)
>         block_t sit_valid_blocks[2] =3D {0, 0};
>
>         do {
> -               readed =3D f2fs_ra_meta_pages(sbi, start_blk, BIO_MAX_VEC=
S,
> +               readed =3D f2fs_ra_meta_caches(sbi, start_blk, BIO_MAX_VE=
CS,
>                                                         META_SIT, true);
>
>                 start =3D start_blk * sit_i->sents_per_block;
> @@ -5100,15 +5103,15 @@ static int build_sit_entries(struct f2fs_sb_info =
*sbi)
>
>                 for (; start < end && start < MAIN_SEGS(sbi); start++) {
>                         struct f2fs_sit_block *sit_blk;
> -                       struct folio *folio;
> +                       struct f2fs_cached_block *entry;
>
>                         se =3D &sit_i->sentries[start];
> -                       folio =3D get_current_sit_folio(sbi, start);
> -                       if (IS_ERR(folio))
> -                               return PTR_ERR(folio);
> -                       sit_blk =3D folio_address(folio);
> +                       entry =3D get_current_sit_cache(sbi, start);
> +                       if (IS_ERR(entry))
> +                               return PTR_ERR(entry);
> +                       sit_blk =3D cache_address(entry);
>                         sit =3D sit_blk->entries[SIT_ENTRY_OFFSET(sit_i, =
start)];
> -                       f2fs_folio_put(folio, true);
> +                       f2fs_put_cache(entry, true);
>
>                         err =3D check_block_count(sbi, start, &sit);
>                         if (err)
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 1dd8a2fa929d..22de6767fc64 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -96,6 +96,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb=
_info *sbi,
>  #define GET_SUM_BLKOFF(sbi, segno) (segno % (sbi)->sums_per_block)
>  #define SUM_BLK_PAGE_ADDR(sbi, folio, segno)   \
>         (folio_address(folio) + GET_SUM_BLKOFF(sbi, segno) * (sbi)->sum_b=
locksize)
> +#define SUM_BLK_ENTRY_ADDR(sbi, entry, segno)  \
> +       (cache_address(entry) + GET_SUM_BLKOFF(sbi, segno) * (sbi)->sum_b=
locksize)
>
>  #define GET_SUM_TYPE(footer) ((footer)->entry_type)
>  #define SET_SUM_TYPE(footer, type) ((footer)->entry_type =3D (type))
> @@ -418,8 +420,8 @@ static inline void __seg_info_to_raw_sit(struct seg_e=
ntry *se,
>         rs->mtime =3D cpu_to_le64(se->mtime);
>  }
>
> -static inline void seg_info_to_sit_folio(struct f2fs_sb_info *sbi,
> -                               struct folio *folio, unsigned int start)
> +static inline void seg_info_to_sit_block(struct f2fs_sb_info *sbi,
> +                       struct f2fs_cached_block *entry, unsigned int sta=
rt)
>  {
>         struct f2fs_sit_block *raw_sit;
>         struct seg_entry *se;
> @@ -428,8 +430,8 @@ static inline void seg_info_to_sit_folio(struct f2fs_=
sb_info *sbi,
>                                         (unsigned long)MAIN_SEGS(sbi));
>         int i;
>
> -       raw_sit =3D folio_address(folio);
> -       memset(raw_sit, 0, PAGE_SIZE);
> +       raw_sit =3D cache_address(entry);
> +       memset(raw_sit, 0, sbi->blocksize);
>         for (i =3D 0; i < end - start; i++) {
>                 rs =3D &raw_sit->entries[i];
>                 se =3D get_seg_entry(sbi, start + i);
> @@ -992,6 +994,27 @@ static inline int nr_pages_to_skip(struct f2fs_sb_in=
fo *sbi, int type)
>                 return 0;
>  }
>
> +/*
> + * When writing cache asynchronously, align nr_to_write to BIO_MAX_VECS.
> + */
> +static inline long adjust_flush_cache_number(struct f2fs_sb_info *sbi, i=
nt type)
> +{
> +       long nr_to_write;
> +
> +       switch (type) {
> +       case META:
> +               nr_to_write =3D BIO_MAX_VECS;
> +               break;
> +       case NODE:
> +               nr_to_write =3D BIO_MAX_VECS << 1;
> +               break;
> +       default:
> +               f2fs_bug_on(sbi, 1);
> +               return 0;
> +       }
> +       return nr_to_write;
> +}
> +
>  /*
>   * When writing pages, it'd better align nr_to_write for segment size.
>   */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 9bb19f4c5fd2..36f73ff3343c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1861,8 +1861,7 @@ static int f2fs_drop_inode(struct inode *inode)
>          * drop useless meta/node dirty pages.
>          */
>         if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> -               if (inode->i_ino =3D=3D F2FS_NODE_INO(sbi) ||
> -                       inode->i_ino =3D=3D F2FS_META_INO(sbi)) {
> +               if (inode->i_ino =3D=3D F2FS_NODE_INO(sbi)) {
>                         trace_f2fs_drop_inode(inode, 1);
>                         return 1;
>                 }
> @@ -1964,8 +1963,7 @@ static void f2fs_dirty_inode(struct inode *inode, i=
nt flags)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>
> -       if (inode->i_ino =3D=3D F2FS_NODE_INO(sbi) ||
> -                       inode->i_ino =3D=3D F2FS_META_INO(sbi))
> +       if (inode->i_ino =3D=3D F2FS_NODE_INO(sbi))
>                 return;
>
>         if (is_inode_flag_set(inode, FI_AUTO_RECOVER))
> @@ -2061,9 +2059,10 @@ static void f2fs_put_super(struct super_block *sb)
>
>         f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
>
> -       if (err || f2fs_cp_error(sbi)) {
> +       if (err || f2fs_cp_error(sbi) ||
> +               unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
>                 truncate_inode_pages_final(NODE_MAPPING(sbi));
> -               truncate_inode_pages_final(META_MAPPING(sbi));
> +               f2fs_truncate_meta_caches(sbi, 0, ULONG_MAX);
>         }
>
>         f2fs_bug_on(sbi, sbi->fsync_node_num);
> @@ -2073,9 +2072,6 @@ static void f2fs_put_super(struct super_block *sb)
>         iput(sbi->node_inode);
>         sbi->node_inode =3D NULL;
>
> -       iput(sbi->meta_inode);
> -       sbi->meta_inode =3D NULL;
> -
>         f2fs_destroy_cache(META_CACHE(sbi));
>
>         /* Should check the page counts after dropping all node/meta page=
s */
> @@ -4411,7 +4407,6 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>         sbi->allocate_section_policy =3D ALLOCATE_FORWARD_NOHINT;
>         F2FS_ROOT_INO(sbi) =3D le32_to_cpu(raw_super->root_ino);
>         F2FS_NODE_INO(sbi) =3D le32_to_cpu(raw_super->node_ino);
> -       F2FS_META_INO(sbi) =3D le32_to_cpu(raw_super->meta_ino);
>         sbi->cur_victim_sec =3D NULL_SECNO;
>         sbi->gc_mode =3D GC_NORMAL;
>         sbi->next_victim_seg[BG_GC] =3D NULL_SEGNO;
> @@ -5252,18 +5247,10 @@ static int f2fs_fill_super(struct super_block *sb=
, struct fs_context *fc)
>         if (err)
>                 goto free_page_array_cache;
>
> -       /* get an inode for meta space */
> -       sbi->meta_inode =3D f2fs_iget(sb, F2FS_META_INO(sbi));
> -       if (IS_ERR(sbi->meta_inode)) {
> -               f2fs_err(sbi, "Failed to read F2FS meta data inode");
> -               err =3D PTR_ERR(sbi->meta_inode);
> -               goto free_meta_cache;
> -       }
> -
>         err =3D f2fs_get_valid_checkpoint(sbi);
>         if (err) {
>                 f2fs_err(sbi, "Failed to get valid F2FS checkpoint");
> -               goto free_meta_inode;
> +               goto free_meta_cache;
>         }
>
>         if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_QUOTA_NEED_FSCK_FLAG))
> @@ -5565,7 +5552,7 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>          * followed by f2fs_write_checkpoint() through f2fs_write_node_pa=
ges(), which
>          * falls into an infinite loop in f2fs_sync_meta_pages().
>          */
> -       truncate_inode_pages_final(META_MAPPING(sbi));
> +       f2fs_truncate_meta_caches(sbi, 0, ULONG_MAX);
>         /* evict some inodes being cached by GC */
>         evict_inodes(sb);
>         f2fs_unregister_sysfs(sbi);
> @@ -5595,10 +5582,6 @@ static int f2fs_fill_super(struct super_block *sb,=
 struct fs_context *fc)
>  free_devices:
>         destroy_device_list(sbi);
>         kvfree(sbi->ckpt);
> -free_meta_inode:
> -       make_bad_inode(sbi->meta_inode);
> -       iput(sbi->meta_inode);
> -       sbi->meta_inode =3D NULL;
>  free_meta_cache:
>         f2fs_destroy_cache(META_CACHE(sbi));
>  free_page_array_cache:
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index bb2b6cd5d507..0c027d00a1ea 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -35,7 +35,6 @@
>
>  #define F2FS_ROOT_INO(sbi)     ((sbi)->root_ino_num)
>  #define F2FS_NODE_INO(sbi)     ((sbi)->node_ino_num)
> -#define F2FS_META_INO(sbi)     ((sbi)->meta_ino_num)
>  #define F2FS_COMPRESS_INO(sbi) (NM_I(sbi)->max_nid)
>
>  #define F2FS_MAX_QUOTAS                3
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
