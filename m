Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713B4A99B0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551605; cv=pass; b=gwvvjSQAjyryzvuqEHM3GcKJhXXVu02HX+ovSBETZglGTW8edl89SP+ibFJAAfQW+1Bseg7Kcm97i7lMXPZfftNbUSd2ul1M3CJmk73S5prOcqGP1FzqML+zeNbtDItXNivXEPxcQEJx/tgHJUuYtLCKmkJjIuz+sE/akDl44DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551605; c=relaxed/simple;
	bh=OAc/hO8nkcFCNdskiQuZDde7+ByFdpMj4nnrjeABvqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJ08kxp8UQyPFhFz2r6k29cg2gj8Ngq9CH9oz6hKccM1K/D6v5H3mmmBFqPQ2M800dKH5Niu7lXRFLWECIanXk7FGdrlEHqhnYLN56Xx/HA0YAmJkOcp0/QDU8eXbzlUEEK1UUcCa1SUSEQLrN0KGdXE0GjCPFc0dfjXTKs8IBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vc+5Vp7f; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vc+5Vp7f"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48435bcf9d9so13999f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789551590; cv=none;
        d=google.com; s=arc-20260327;
        b=ECdErOjxWXEhrZtVFDOOkdtq1U07LRZel8l8m1vWdhwVHVrm1Xw0Gnkg8nbzHr64Lr
         bY0p3WFG7rUYF9YrMbGnvbpEZIeVifpVqlzHjiWlB9n3t/g2el/CWojz1i8u4mu74q+a
         QS6uIEEcusVg74nOs2IwQBYRns98tyElRAkTQ0EN8BGVmIp2N0LNUDIOIAg5Pm+/fEiG
         s1tqXmHMa2yjTxaEIVimfW0aTgF0cIgR6H9vz5hmw74iSRohwSu7oukgOfMcVqaLNWyz
         MrXOjA5UDs/gHikqqanELJjFsW3LRq58Zsx5VAiuAih3bwXkTSsC0LJHakBgef7pe8iO
         7Nsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tiZr4mDIW2235eDwCZLZEM9gFMuzY/DQRHjvqEsJaL4=;
        fh=xJqkqKkRIowWZtwW0jE4QQrF7TJLDR+yTAvbpAD1A24=;
        b=IBO7nWZx2G+RvyqXiNzIfrUl7J7dLbfis/tTYCFSZY2UuSga1Gog7CjDi8SQjSN8ob
         YDjZglo+i728LGplL+laHk0UlP7D0uIxvBy2vLVEgrCPaz6lw1e/NkiDp2cgvN2TvXOa
         Md2rXPsZK5U+8uXI77v1xnD1KtFpYiyBMuXUajqSo5InfcO8RgJt+ZW64/CObhw/fHDh
         F6Z4qX8csyKVz4XMTCDkBk8RpxS36iIv5JJOvbG3ii/o8TBdN5hbK6wdeEt6zaUh3jdl
         uw2idZ66QNPWvSTwFDOXQUdAl+G+2WD+7hOyFRedI8yDXuHH/NeUtMxW5yktc2Jeeh3R
         pzAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789551590; x=1790156390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tiZr4mDIW2235eDwCZLZEM9gFMuzY/DQRHjvqEsJaL4=;
        b=Vc+5Vp7fHcjw3QmF7sWvIYGhx+WQanp/Vhh2FjVSXq1Cnl6AMi3IW7GoO0egrE5+bS
         YGlQap6/ay9wMpozkaw5ATtRXzR5CvSSNQw9mevdthYEt6lzX+VC2bPa2PmKJCLHXT6r
         X4XOYhWLN+dRyNEFXsDwKXfEniAX7BxlmMKacwWIC9M8qPO3ii8JIfVu+OBl/N013B+9
         Pw9Yq00p3cD9CrTTbmtH/ImgvFcmfJJTiknL70h6uRRyqRoHxgbbANALT+BuWMGetBC5
         xtJB+S9HKWxptKVMjcpO/Tm3HpOJtjKFjZO7vkWOuVuZmsgH/e5xjmr4oNRxhZIl2TLc
         FemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551590; x=1790156390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tiZr4mDIW2235eDwCZLZEM9gFMuzY/DQRHjvqEsJaL4=;
        b=1DHwu0LIizK+OxCJxVqQEES6O67fMXrv764fHLMV6bS2P4GQGPg4DO5KyLQvwCufni
         4UIhvZnFyHe++pJ9fcbKiFP7QSsh/pLkZ38xIuPt9zSgwZmZ2cL4mCzJTpvsexMYFbnk
         qIB+fKYiiRblnHpHGMI5SwQVeOaN4p4+H6StWyu0PhK8XkeAoZ/XvrSeqqsQxSd6gI8d
         RgZt67jAuoIFv+poAsC/xsT/QAFHRpAaRLyZ+hDFSIwb3JfNH4niIJoflv1YwxMEIjdg
         ij9c/bOxs7mXJw9Rcpp0HMp6KDSRxXn54FybDHsMvm0+dk0DUIIE3Y2V0Fwg9dsSJvly
         D8sA==
X-Forwarded-Encrypted: i=1; AKwUvBwfOUm6z7kxctMvqOmevrAwz7K6PIki1xyVaHGjqtsOEkgGoRRDiQunq5lydZ5c0ZEuUuHHmR3pj9vbMf0=@vger.kernel.org
X-Gm-Message-State: AFuF++meWBy8CAavSzUFuFhxF4JdpGVv0Yejc08+0E6xC50xR9CgNaG2
	FX4tteUihUWAUVQBgFWtLGrokJRNAW0qoTeAFYDlQcA3Es+s4cn1T7MCgLWd401t0TCDbwAChcl
	laMGdDSAo9QX0grUlF1tppbhVMluiZA43s5H/
X-Gm-Gg: AYBFou38yhtSTFrJfjiSgt9G1tYUawUASPgqtFX5v3nTy1Sqn0vhpdHi7Ys/sFFs+wA
	+BNR6LUAK13ZYod5WsKyoYvUfYEyKnC9Ib1O0PX/HPDIUydOQbmwom81NHb9LRNYq85bSGeDSzh
	4zgV1Ep9xxCXWv3AOl5omPHPUTh/aefR4rtOrueoaq9tlbBt935hiu8aV0N/wZt//or53VIuTPj
	Rwjy/zTNUoJxibZlCQHY7kchk6vpVltva4keQME7n8nDhfrn+7HjnbeSnm0X6U+aPiMXsVbyWfr
	S3HtT9IlZIV/SXJqxRY8R64PU1hPfBPVxONlqJkwWXPt50CBi51U046h
X-Received: by 2002:a5d:588b:0:b0:487:34c:273a with SMTP id
 ffacd0b85a97d-4870d27d7edmr2151151f8f.4.1789551589672; Wed, 16 Sep 2026
 02:39:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916015440.2232938-1-chao@kernel.org> <20260916015440.2232938-13-chao@kernel.org>
In-Reply-To: <20260916015440.2232938-13-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 16 Sep 2026 17:39:13 +0800
X-Gm-Features: AcwNN1XjLomLNHi1sjdEgp7tzvLGK8vYWI82s1dbicRilUheZz_OIf6YGFRTljk
Message-ID: <CAHJ8P3JVrAPRVeNRXgy0ecX_jKerWNtVUDEOfcyFR0H_HJjhHg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v8 12/12] f2fs: cache: show per-cache usage in debugfs
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
> This patch exposes per-cache memory usage (entry struct memory vs.
> cached block buffer memory) for meta, node, and compress caches under
> the memory section in debugfs:
>   - meta entry: xxx KB, meta cache: xxx KB
>   - node entry: xxx KB, node cache: xxx KB
>   - compress entry: xxx KB, compress cache: xxx KB
>
> Signed-off-by: Chao Yu <chao@kernel.org>
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
thanks!
> ---
>  fs/f2fs/cache.h |  1 +
>  fs/f2fs/debug.c | 49 ++++++++++++++++++++++++++++++++++++++++---------
>  fs/f2fs/f2fs.h  |  2 ++
>  3 files changed, 43 insertions(+), 9 deletions(-)
>
> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> index a8c24f5282fa..d7983ee70337 100644
> --- a/fs/f2fs/cache.h
> +++ b/fs/f2fs/cache.h
> @@ -38,6 +38,7 @@ enum f2fs_cache_type {
>         F2FS_META_CACHE,
>         F2FS_NODE_CACHE,
>         F2FS_COMPRESS_CACHE,
> +       NR_CACHE_TYPES,
>  };
>
>  /* Main cache control structure (per sb_info) */
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 4ed5c271dba3..8c0cffde2457 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -380,17 +380,36 @@ static void update_mem_info(struct f2fs_sb_info *sb=
i)
>                 si->cache_mem +=3D si->ext_mem[i];
>         }
>
> -       si->page_mem =3D 0;
> -       si->page_mem +=3D (unsigned long long)META_CACHE(sbi)->num_entrie=
s << PAGE_SHIFT;
> -       si->cache_mem +=3D META_CACHE(sbi)->num_entries * sizeof(struct f=
2fs_cached_block);
> -       si->page_mem +=3D (unsigned long long)NODE_CACHE(sbi)->num_entrie=
s << PAGE_SHIFT;
> -       si->cache_mem +=3D NODE_CACHE(sbi)->num_entries * sizeof(struct f=
2fs_cached_block);
> +       si->cache_entry_mem[F2FS_META_CACHE] =3D
> +               (unsigned long long)META_CACHE(sbi)->num_entries *
> +               sizeof(struct f2fs_cached_block);
> +       si->cache_data_mem[F2FS_META_CACHE] =3D
> +               (unsigned long long)META_CACHE(sbi)->num_entries * sbi->b=
locksize;
> +
> +       si->cache_entry_mem[F2FS_NODE_CACHE] =3D
> +               (unsigned long long)NODE_CACHE(sbi)->num_entries *
> +               sizeof(struct f2fs_cached_block);
> +       si->cache_data_mem[F2FS_NODE_CACHE] =3D
> +               (unsigned long long)NODE_CACHE(sbi)->num_entries * sbi->b=
locksize;
> +
> +       si->cache_mem +=3D si->cache_entry_mem[F2FS_META_CACHE] +
> +                        si->cache_entry_mem[F2FS_NODE_CACHE];
> +       si->page_mem =3D si->cache_data_mem[F2FS_META_CACHE] +
> +                       si->cache_data_mem[F2FS_NODE_CACHE];
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>         if (test_opt(sbi, COMPRESS_CACHE)) {
> -               unsigned long npages =3D COMPRESS_CACHE(sbi)->num_entries=
;
> -
> -               si->page_mem +=3D (unsigned long long)npages << PAGE_SHIF=
T;
> -               si->cache_mem +=3D npages * sizeof(struct f2fs_cached_blo=
ck);
> +               si->cache_entry_mem[F2FS_COMPRESS_CACHE] =3D
> +                       (unsigned long long)COMPRESS_CACHE(sbi)->num_entr=
ies *
> +                       sizeof(struct f2fs_cached_block);
> +               si->cache_data_mem[F2FS_COMPRESS_CACHE] =3D
> +                       (unsigned long long)COMPRESS_CACHE(sbi)->num_entr=
ies *
> +                       sbi->blocksize;
> +
> +               si->cache_mem +=3D si->cache_entry_mem[F2FS_COMPRESS_CACH=
E];
> +               si->page_mem +=3D si->cache_data_mem[F2FS_COMPRESS_CACHE]=
;
> +       } else {
> +               si->cache_entry_mem[F2FS_COMPRESS_CACHE] =3D 0;
> +               si->cache_data_mem[F2FS_COMPRESS_CACHE] =3D 0;
>         }
>  #endif
>  }
> @@ -749,6 +768,18 @@ static int stat_show(struct seq_file *s, void *v)
>                                 si->ext_mem[EX_READ] >> 10);
>                 seq_printf(s, "  - block age extent cache: %llu KB\n",
>                                 si->ext_mem[EX_BLOCK_AGE] >> 10);
> +               seq_printf(s, "  - meta entry: %llu KB, meta cache: %llu =
KB\n",
> +                               si->cache_entry_mem[F2FS_META_CACHE] >> 1=
0,
> +                               si->cache_data_mem[F2FS_META_CACHE] >> 10=
);
> +               seq_printf(s, "  - node entry: %llu KB, node cache: %llu =
KB\n",
> +                               si->cache_entry_mem[F2FS_NODE_CACHE] >> 1=
0,
> +                               si->cache_data_mem[F2FS_NODE_CACHE] >> 10=
);
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +               if (test_opt(sbi, COMPRESS_CACHE))
> +                       seq_printf(s, "  - compress entry: %llu KB, compr=
ess cache: %llu KB\n",
> +                                       si->cache_entry_mem[F2FS_COMPRESS=
_CACHE] >> 10,
> +                                       si->cache_data_mem[F2FS_COMPRESS_=
CACHE] >> 10);
> +#endif
>                 seq_printf(s, "  - paged : %llu KB\n",
>                                 si->page_mem >> 10);
>         }
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 69690b061236..34878d99a2f0 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4525,6 +4525,8 @@ struct f2fs_stat_info {
>         unsigned int block_count[2];
>         unsigned int inplace_count;
>         unsigned long long base_mem, cache_mem, page_mem;
> +       unsigned long long cache_entry_mem[NR_CACHE_TYPES];
> +       unsigned long long cache_data_mem[NR_CACHE_TYPES];
>         struct f2fs_dev_stats *dev_stats;
>  };
>
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
