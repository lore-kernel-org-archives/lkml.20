Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A5941DEF7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378170; cv=pass; b=lf/5E2afkzbiImMqn3hjCaQ8CKZ2+dwPdjVh6SJhRH9IdknTKl0Aqp7Fmk480ET0ZmWZPV/4g8F6ofsDR+MaVKxFJv1miUqX05JSTnlJKHbR2bsGbpNuv7Jc1nzEt1pGWRGJ6L1EaD1rwlK67d+neZm/THe+YF2GiCpuFckLdW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378170; c=relaxed/simple;
	bh=NU1dpS4TUm1I27X1n+bW1b5d70aTJuUzLdbWKavJmAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ox45MOAWRzG+j6SSGjoF3TPFp4IXp7xIMCZB1MdMIo+Hh0JPoZUKQtXsw6O+NxIcP+3IBW87em2P5gG0gpg9Rou9bxQzuUxiMltqmnsEqQtBENB0/bzQGkOklTjepJcje9wsoIRBGYPQXB/CC22POC6mt1FQLUaMcoSKuoTRn5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4jh4rTX; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4jh4rTX"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843178b1c8so247287f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789378167; cv=none;
        d=google.com; s=arc-20260327;
        b=S5bna1Zlcb9L5TfztZZ/3lOJcdLEHtofQ27LhxGwlTJtyuvan3yMwPmrhiFNl44Zrz
         aCJVYcp1nWPNbYZiqn2kdio6sUPzjQE2ZbiR9i+Ndohkfd7YmHrPbGAYjuk+9mlWzjUs
         LO1VixfEZJ6jYJdD/Ml3DKgz9QtlS8DuXBk+dTp2ThGaEcoy2tomIv2BhR3e2KedVv92
         Gyg3X8WqHEBq3/sHgy/7hIQbjDadFy39PduEpy8fwucw3e9UESHMNtfeM1iHY3gx1pmm
         tA9u4V0Nuqyd9TO5ONgrjHHjnAybE1/c17fn6fkW0lnvNY2acn2u9q5EyfWiXJrOYCED
         vR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NwCoRysRjmgkYc8XKCXoUjQ9awyjkZJjQbM5wLecwTU=;
        fh=jMS5G4cNLZsXlCAJlXC5EapkBZ7ZPamMbBVAwmRAP4A=;
        b=qGUElHL0wI7dD3PqgMfbXvODMTOeGB1VlTpdCipI0Y0V5ZpHmuyZ3m56RuFznPrYnR
         RfGVucUILd23vcf8wEhkwhPQIcIV/4BCmbm9q6z4UYqZ3aXY8N7Mjok9PJSKRGDnPH5/
         MnA2jSCmqTfz4BHxhcA6hhEUkk7K+y/wEtuZmUtBt+3px55fa+jW7DsrTFLqCyyldIU5
         udx/Eees14VJwLtmtdsmQFhYDl3DGoA27+S/NenAKLuAWkOkSrGQGARtVz/KfhRIWCGP
         Zo15O3n83ELRFh/mFTmU/uDzQ8bWj++G1LndNSqDH4R3YxInCNlNkSLWIHO/UCQoLs7W
         H+bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378167; x=1789982967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NwCoRysRjmgkYc8XKCXoUjQ9awyjkZJjQbM5wLecwTU=;
        b=W4jh4rTXV6Nh+aExR19ShAn6C4KjWZjI5w2XhIIZStV4C0X5juasSSnm1pc0hI7WWm
         W2UM4BOgMT44/PN3VhcuFR3ogCrPglTogIkgqU2HPhklRD7x9UvopjIM2zAKBObWdi4R
         NEVIFudjOwcg2+hRNJbKRw4zPF4sVp6Z45BOHW4OHaok8uXzaa3lJpVUIzPLfFjTwXno
         dtM69SHRQjEF6zLPwyDAsx0fybsCsXz+0yIdYUo2o2c8nOwFCF7tvegODZrJZMzYIifU
         BLHihgEMu7mSLfSV6zjJj2/S6fKVRSKyzTh80nufGEQADS2a2WhW6k1ajMb/8CIEnKoH
         IDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378167; x=1789982967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NwCoRysRjmgkYc8XKCXoUjQ9awyjkZJjQbM5wLecwTU=;
        b=Tm1mF4c/0KnsZRB42O6z0nsh1IpN8p48SvCpzJKwEveLT6InsvYDwL4j7CYHtf7iBJ
         Fg9E0rc5fx0bhXsDI+9s/rDbsKZHT1La67VB+KOTWdd5kmgWy4Mvuhy4eGZh9BKwl7S4
         K0/7pLcuXtspVuOvUD4xnfb5C6dAraTYRoNsYjokeIKcvjwHC66GLJCZnyJ3QRhpoXzJ
         MUx/b75Ih1eyfP00LywAm+LjcHLLxdC6SAHC9ENIY5iehXrxeYGOnF4EvVRxo1cZrUrH
         sGu3trYvhb3KoS58h3RhNs3+SfG0rHsqecGx7gh0MK9SHauBa4Y2AT0GhQtwPVDAPldt
         u9IA==
X-Forwarded-Encrypted: i=1; AKwUvBxqrHx+7x26jc1JcALgzCz1DWoVN9TLfswXd8nq4n1SbVWRnDzSNyio0j/CDSBcXC61MHQ46rrc5u5C8yM=@vger.kernel.org
X-Gm-Message-State: AFuF++kvZ939QpW4MQV9ttmidNFqHr6kVqNN2EVRpDS6IwkMNMT9Gyn4
	Df+n0S7Ap0Qndw5fQlsnv9YL+r+zvmdlWo9oJ1ulwtjSwavIpf+5DVkCtX8/Y2OWAmOJi8apdfA
	AUZJkvuTB+Wp7h7FLCSEW1ChgMnc0Zfl4bvTf
X-Gm-Gg: AYBFou3fZcT2U2mgZ57mkebMBluoZ8yyjLZz7aEIy99HSNkX2LqdoZtzHIwWuCE3fgJ
	oGqsDO2ZIIpMZp5MIA9VQl9WK9nsEqhaD7N/umjOm2MReYm0VqZZGwffD9e5Dg04GI8xEWC/5D/
	af/fh9zkFQim0DAUe39T82pBJByW1/2YWG11A36scSSxO6ampSsOTUdjUvnaH1YoZjw4FCul7Il
	2M/wRoAeUJf8w2C2JVGHjrr6pVaRKOFFdppHabz0GTgSsgF2lm+zMUopgVf67KHlflPCOk2ooLz
	a1jAxmGJffsmh6TCywCcSfEEcLrJ8/OS0DCDe7SddNiyseWOSkPVxq5g
X-Received: by 2002:a05:6000:26c8:b0:486:f3be:2a69 with SMTP id
 ffacd0b85a97d-48702b5ac36mr1759290f8f.3.1789378166509; Mon, 14 Sep 2026
 02:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911232405.1815804-1-chao@kernel.org> <20260911232405.1815804-13-chao@kernel.org>
In-Reply-To: <20260911232405.1815804-13-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 14 Sep 2026 17:29:15 +0800
X-Gm-Features: AcwNN1XZSezrqxzMSh7wGOk44PcQ6ee43D72sizJQMIKky8XnPByYgEe4In5Wa4
Message-ID: <CAHJ8P3JQVP+bJ3Vb+f=07bWcRVQk7mHYkiMsih_ir4Wm4d-3Jw@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 12/12] f2fs: cache: show per-cache usage in debugfs
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
> This patch exposes per-cache memory usage (entry struct memory vs.
> cached block buffer memory) for meta, node, and compress caches under
> the memory section in debugfs:
>   - meta entry: xxx KB, meta cache: xxx KB
>   - node entry: xxx KB, node cache: xxx KB
>   - compress entry: xxx KB, compress cache: xxx KB
>
> Signed-off-by: Chao Yu <chao@kernel.org>
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
thanks=EF=BC=81
> ---
>  fs/f2fs/cache.h |  1 +
>  fs/f2fs/debug.c | 49 ++++++++++++++++++++++++++++++++++++++++---------
>  fs/f2fs/f2fs.h  |  2 ++
>  3 files changed, 43 insertions(+), 9 deletions(-)
>
> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> index d2dd77ca2bc1..42e7c49cef47 100644
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
