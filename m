Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794758114;
	b=FEQQPp+0rXDrNRuyi93PQfsF32ZaMAZqnxq7z/amSfOwtUHn8VTWgaJSd7OgO0npvX/p
	 ATBkHHbBgrY6fOG/QiJ5+GRRZcYx3LPOrk92gLIOxlnhd2tMXegDfxWQ7dnP+v9gH742E
	 9/t95QhskMQC/7IAqU3uhb2S8xe2cZlBvFUPgEAWbiLndv8GNyLHl5yHi5N1zBnngi1hu
	 A3GzCEWbrnE+nLW9eMTza6FbAiSGn8h/ZOQZMLi5H7pPbdBwnOT+ppU7Z5Xi/SbWP4fIl
	 an5hjsWmxfq9f8II0bDfcG3WK5kuqk3Ww1isfcDiSxQkifhqtWP8JLdOJNQjo2YxDpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6r4bfHjcklFA+xL6mNcTzXy0f2CbgrpwkPGUf2FnCNI=;
	b=3z/IT6xr3M6WrT6WPb4UD8zNpV12YiqpsgnvY7u0jKF+4AIjN29AkCMkvvNv4WxZ7i7I
	 5O3d2G/eKKsbWDjWA1PM1qC4y/iHzG1CrVcm9tzQO9k/f0U/2mc3C0FvwpUcG9Jb6wnyw
	 3Tllo8xayIaXCFX2ktQBv3pIwaYmtEiaJvOEV3H0eAEhD9AdPCB3cls4wDDRJU/4qwg/D
	 s5eRoaYN5YJY3byjj3vKDHdo6U60brKGDiaglxIrCl5Mjnb6PX+hRzy8ebXtnQ7ruZ7DJ
	 Zs3TUihNrZnaPtrIQq/O1djyVWc8QQKR3VxVAU3+bM5Q6gv9z2FowqdjAyPoTDFBFDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDdOqKap;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6766606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6766606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDdOqKap
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b904d10882so1007178b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:55:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794758113; cv=none;
        d=google.com; s=arc-20260327;
        b=QqNf/LxK38kz2pnQgZeufBJIhw2R3bpML8beN8h4w2sfId9UZBACZkEHLkiWzA2Ko9
         VkKGOMgFLmrYx2m2WfJA54verIqosqLQAGArZ++Eu90YRcLaKb9YBoMvmkun5uJsQiAJ
         MO8Tb5cKXYFk/uVssfiRIxcE5UsPyAh9/wjhWSSTPwcWCZmgTAQNwuGRcXaORJknLNve
         W+C3glyTx6JMwb4iZqvQpTkSssZp0fvWGou42zQMc7uarapKbeGz3VQoRv/RvJFNbxnL
         PAd8pT/F0vSW2fxP53F04o0XGxIVIgVasgy2JceDM5eqan3YklfDwwl40ADNCzQ05KbI
         TPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6r4bfHjcklFA+xL6mNcTzXy0f2CbgrpwkPGUf2FnCNI=;
        fh=pVMKl36x/gHaalKQJoYixT82BksBGP+/y4B9zgKBaFc=;
        b=bcK2Que0SN2rxOgp0LWSpHlolMsB+J53FKEla9VO/JRBopDmbepUucJaRCO5l3PCN1
         2AwxAvy2ew7wp+iAIYUsMbKI+oMC5piernciGNoEU90EtARk+JSyEdQmYo8JAQIli8aF
         NKwUzTtPizZWEKuz+l7+NSvQ+m90eGFCrEB2D9jm4j3zc9WI+MARC/gWmheR4liJJW7Y
         v722bDxxu7j78j/V5CswzNnLKscj7ieYjFFsg5FijXaxcWL1M/LWHgypwDjxEJlKGJ2W
         tk5GbvTPaS/gGCDyewF5tRvzEBJp6agBPoiHHw/SMffy2wWmYbwIVBVvUl33ozjahV/9
         iYrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794758113; x=1795362913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6r4bfHjcklFA+xL6mNcTzXy0f2CbgrpwkPGUf2FnCNI=;
        b=cDdOqKap+jejk6/pFU7nOIRHXSVsIpaeSQV+M6N5wEQyEvAEMiNrqWs/+yuZ0VvtrR
         q+3FBGOBVL/Ngrj/b9axHnVHpVGb3iU+j4V4Lxq22y7OiCf+YO76zxoB6wXa9xq65Nwl
         UwgHWSjZbYFAhv/eqBAuolQxoFHxoporot9jS/07CIAfFbRo1wbQOHBgkIop49XEAE2M
         q5ZpGJBXw+GzW9j2e8eofz/yhA0oBW3Lc7uKU1S+F+FEpvEK1CqT7k7m/FDsUfshQ4sf
         iEzkz+cL4dTgoiAP6SpnMtPgp8qAXnAhsYYCT9ekkvPMiLfRPySYvUbNEIu1Dc2GAGw0
         DUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794758113; x=1795362913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6r4bfHjcklFA+xL6mNcTzXy0f2CbgrpwkPGUf2FnCNI=;
        b=Ybv8yUOwkBi020mBRgBCxUhyb+Lee+7Ompcg2C9nsghp5GjTCLWz3l8A7e7/pgHWZC
         US3vHECd/RC4bfiEgDigwGUuh5brWqCq5moDW7RrK0dPTT3L8gkWXND1g44W/5JvA48M
         M/Bhl1qFLi5pRu5HcfYjBaldNeCSp8yTHZ4BRrP3tgB5/fMZVSuJjdZdo/lvJrwIt+vt
         5HrS+i9E0B3QxmcWw662SGGLIVmikyUXC2U1z9HlC2bGmBLVP8VkJSG6Wm0gwmHJ8jDe
         obF/O+jYgNnxtXfb83U4T6T6qa0vuk+24GeQ0iCyD9lZYEd1r1Zs0JvGxzGxNvmTkOay
         ESPg==
X-Forwarded-Encrypted: i=1; AL+hErEBpwtsiBE6qAgJ3zzCNKGwdURvdlmF92+/jnsrity+gaqgXZEnyfl7JcWVmgSDW1pwLuVTthm/RUSj1tE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e5x448QV9phShH4BIF6Txnb2qmm+pRSFhZH5kaPve1EgkJW/b
	vqGT6JDOvI5IIygSsMlpp6MDP4HWNainPdWNUg+eD/cwZ60m/SUOga1JVLtX2C99AXfx6NRdcFu
	3/9G15AlFBLDgUgFIm/vn3xXHCF3YtSM=
X-Gm-Gg: AYBFou08lHLsVwM8mesWuOcoN/LQ6ADmQVF/oetA10lm6KWkA9dMt9ZGj5WoryNHH0u
	IKgMttQkN0JvD8YxyCUZf3B1QEIgJV10S9dBMx27ypD0slBRK5TBsZXHTwF6lwyry38/2mjnX+O
	w6ct4g1tXD1Y18Rf+I03j0fQVmDwa8fhnNHEjKrZUPqBjfhCL4sp3nid9kzxVev161mn8y2hcgW
	kpNV0Tf0xA8vcXMI3TfMFL1basAh3kLnffzNd+JQIqxn23/ealm1wbhdlUZTL7XXyWnwM83c1nX
	9yx1SvcDE81GJUXh+kj9rT6/qmo9HfIydoLGuDHUlrE0PAL1+BkZ4516pZ+OTsF7xxiyI8XgglB
	9rqfGw9vV0hKZ7VPVexJYHD2kR07yo4BCYOd/yoqFNY8+YRPfdYtumGjdwxsnoOYYb+KvoQ==
X-Received: by 2002:a05:6a00:1c9c:b0:88d:20ff:15c9 with SMTP id
 d2e1a72fcca58-8beb56cd0aemr7806058b3a.17.1794758113164; Sun, 15 Nov 2026
 07:55:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114200803.23129-1-baohua@kernel.org> <20261114200803.23129-11-baohua@kernel.org>
In-Reply-To: <20261114200803.23129-11-baohua@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 15 Nov 2026 23:54:34 +0800
X-Gm-Features: AclHuK_2vmb8QBja-DLz_lsLG3UAD61vNyhqGxF5EBjdDG7VZfVQVvq6uaqHJDg
Message-ID: <CAMgjq7C_cH75JrYs8=P5LbxnDjDD6bqeqsCidOPa=r8Z+42sCQ@mail.gmail.com>
Subject: Re: [PATCH v9 10/16] mm/mglru: Run aging when pages are rare outside
 the youngest gen
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kunwu.chan@gmail.com, liam@infradead.org, 
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, liuxiang.277@bytedance.com, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, 
	ridong.chen@linux.dev, rppt@kernel.org, shakeel.butt@linux.dev, 
	surenb@google.com, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com, zhuhui@kylinos.cn, 
	sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 4:09=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> From: Gaofei Lyu <lyugaofei@xiaomi.com>
>
> Run aging when the total number of pages outside the youngest
> generation across both types falls below 1/MAX_NR_GENS of the number
> of pages in the youngest generation. For extreme swappiness values
> such as 1 and 200, also consider the balance of the corresponding
> type.
>
> This improves reclaim efficiency, especially at extreme swappiness
> values, while reducing system time.
>
> To avoid the overhead of aging, we only allow imbalance-based aging
> when the reclaim priority is low enough that we might reclaim the
> youngest generation.
>
> Signed-off-by: Gaofei Lyu <lyugaofei@xiaomi.com>
> Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 0fef966b0a14..1450542d709c 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -2743,6 +2743,8 @@ static bool should_clear_pmd_young(void)
>  #define get_memcg_gen(seq)     ((seq) % MEMCG_NR_GENS)
>  #define get_memcg_bin(bin)     ((bin) % MEMCG_NR_BINS)
>
> +#define AGING_PRIORITY (DEF_PRIORITY / 2)
> +
>  static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc=
)
>  {
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
> @@ -4780,7 +4782,7 @@ static int scan_folios(unsigned long nr_to_scan, st=
ruct lruvec *lruvec,
>          */
>         if (sc->priority =3D=3D DEF_PRIORITY)
>                 seq =3D lrugen->max_seq - MIN_NR_GENS;
> -       else if (sc->priority > DEF_PRIORITY / 2)
> +       else if (sc->priority > AGING_PRIORITY)
>                 seq =3D lrugen->max_seq - 1;
>         else
>                 seq =3D lrugen->max_seq;
> @@ -5073,6 +5075,40 @@ static int evict_folios(unsigned long nr_to_scan, =
struct lruvec *lruvec,
>         return scanned;
>  }
>
> +static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_contro=
l *sc,
> +               int swappiness)
> +{
> +       unsigned long youngest[ANON_AND_FILE] =3D {0}, old[ANON_AND_FILE]=
 =3D {0};
> +       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> +       DEFINE_MAX_SEQ(lruvec);
> +       DEFINE_MIN_SEQ(lruvec);
> +       int type;
> +
> +       if (sc->priority > AGING_PRIORITY)
> +               return false;
> +
> +       /*
> +        * Round up or down corner swappiness, to balance the heavy biase=
d
> +        * type better
> +        */
> +       if (swappiness =3D=3D MIN_SWAPPINESS + 1)
> +               swappiness =3D MIN_SWAPPINESS;
> +       else if (swappiness =3D=3D MAX_SWAPPINESS)
> +               swappiness =3D MAX_SWAPPINESS + 1;
> +
> +       for_each_evictable_type(type, swappiness) {
> +               unsigned long seq;
> +
> +               youngest[type] =3D lruvec_gen_size(lrugen, type, max_seq)=
;
> +               for (seq =3D min_seq[type]; seq < max_seq; seq++)
> +                       old[type] +=3D lruvec_gen_size(lrugen, type, seq)=
;
> +       }

A little nit: with the rounding above, I think we don't need youngest
/ old as an array, just an accumulative value seems enough now? But
feel free to ignore this so we can avoid more update noise in this
series.

> +
> +       /* the vast majority of pages sit in the youngest gen */
> +       return youngest[LRU_GEN_ANON] + youngest[LRU_GEN_FILE] >
> +              (old[LRU_GEN_ANON] + old[LRU_GEN_FILE]) * MAX_NR_GENS;
> +}
> +
>  static bool should_run_aging(struct lruvec *lruvec, unsigned long max_se=
q,
>                              struct scan_control *sc, int swappiness)
>  {
> @@ -5087,7 +5123,11 @@ static bool should_run_aging(struct lruvec *lruvec=
, unsigned long max_seq,
>                 return false;
>
>         /* better to run aging even though eviction is still possible */
> -       return evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS =3D=
=3D max_seq;
> +       if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS =3D=3D m=
ax_seq)
> +               return true;
> +
> +       /* run aging when folios outside the youngest gen are rare */
> +       return lru_gen_imbalanced(lruvec, sc, swappiness);
>  }
>
>  static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_cont=
rol *sc,
> --
> 2.39.3 (Apple Git-146)

Reviewed-by: Kairui Song <kasong@tencent.com>
