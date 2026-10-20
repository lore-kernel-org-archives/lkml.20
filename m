Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792519940;
	b=xw18lpRM9NVZtXzJ7a/9wioydZ4E81ZvuANz4KOuAZV1B2oLVrLn3F8JPQeQhu4ymvzG
	 lV5nLZg7CuYQ6RXR8DXcDOAgNfdGvWsuPOIcnCOjqPe32Kk0VgDa5/CiDCvDuZk9j9pjM
	 z1navMf/O7s287n8rUtlxdXS6MCrh7IlSHdI7Wf8+7YtW9TsoNWD//n/H2+DNgQfxgx8l
	 +BcP4oce+adw8Si78hTc5O2rKwK4d0Lx3fiVfOUp7S5qdPMHq0cn/sus340R7jRK7ZECg
	 OFAsP9sZMtWvH/PLSABxf4XIy91OiOsaxfvTcX56rP1kgcQiTRrovB8j/laXh+Ae0gA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wDh+Gx4zWL1eoJPPpMyzufEKMmJDNsByR9q1z2w2fIw=;
	b=gsxKEYcUVo8vrq+YY3lWQa6nlaJ/R2pLSg0ub0R12vsrVctFpvrKSNAlK8KGzr2oYTpp
	 e1FeuzxWNyxhqpcoYUWMZWpTwbCPueq93GdWmOXrlORWI3G0fWCIdXgfmSIuPajj9Lilu
	 dNI5UnpBkLBtkqRxkr/DWBy+ElYdhtgTWC5jAwFuev2P5Y+wG2YL3IytHgt6eM50A69Xg
	 UK93sQh0AJBs/HwN7BN3C1gxT0Zgn10tA6y5nudJPzojDeq1rduPeIP6g1z7kmLJmPvUE
	 4OHiGs/DaXySUbBWJd2Ja/IUm5G+RoeYY/2aOh+/+9I0OKyhMk2Wr5otmKQkHMjnJxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UpH+zirE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38EC60A2603
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D38EC60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UpH+zirE
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4301e334ceso176959866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792519938; cv=none;
        d=google.com; s=arc-20260327;
        b=OUC/C1v3dwv4N+jzik34F6SCp+c8iyi9hmQmy7YVbZ60AMnRoRAhgpAB2Zit7KZTAE
         TQBcxUdTA+GoLLT813vIzWIKzWV8DcgBjkrt8ut+2LhzLvkrKFRyQoBGgxjK2T5131vm
         7TWoVTJ3BNSJPIBU76YUUQcd7xW+1f3zz1RWDnRIw2xHyvEQR9SxZ041+0/i2YKgNonN
         Jb4sLLOsMXsAwja5tReJ2ugAGMV44FF3iYfioLJfj6i0Ek2QLMqnawLmjp8bLWFPtkLG
         on6PdpmWFIR4ZL+KcYYRNrlIgfRfDQFrw4Ek/3Z4Jq5g0qVxoizJrM4k/heUN7SqGfl3
         sw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wDh+Gx4zWL1eoJPPpMyzufEKMmJDNsByR9q1z2w2fIw=;
        fh=c9Vx0/2TgcQs4PI2YRZzIat3fDAjbcXEF3UisMnZCss=;
        b=knbXFaB+0psgYhIWKuXqJNE/lygsHM+99FcTD1P7vxU4Lzo2fm+aOnYFkiRB1vGIVl
         YQqUw5vGMPqXfCZsgvcb5XLPFeDxIx5CUo7UzCzz6k/NKJHZh0NaTucX1EJupXfGVbWe
         0N5UzUnrV4kFPzsG0vPMt0ykzMbjCdR04tisIvbhX3X1EakskbqsabHkUP70xPYMrVXL
         ulejeKyjpqmHwKRxEVz/zjMIq/4HA59hq2SJSyZjSpo6P+AlVYSNL2aUzcxxSQ6qBhCc
         /8Mo1cksYTiO1w7fn3JksQ2RSZk23PAvF9rOauPE7PLKpqSJMFGwoM++ml/KrgwBMFfA
         OoLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519938; x=1793124738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wDh+Gx4zWL1eoJPPpMyzufEKMmJDNsByR9q1z2w2fIw=;
        b=UpH+zirEvonSA7u9pglQrkIGhbJbNs9Q5vqht0HW18Yevzx7nETyMDlVqQ1dKPeQyh
         vdWGpp2pZe5LZnTHXa+2oDrubBfwIA+tagkYpH7DMw6WiLei89Def/zV9rK7E0kG+b8l
         8A0N/0CP7mqr0SG47aCnTN39K7hL+eLUQ3aVG6o+KfvxOWHp7J7BkHliV4o2WThQ+1fF
         JFIJYZeYF4yAD7QztreFoEei+mc2aOQ2mUkjTTQu8X8LCI2cbraQJDZO/wXUUPSHkDrx
         KQnWp+xtwTRsJVym/B3LE4FTHJXxjmPj1u0T0NL+Cbt4Ln5PAcIpBLI60h6H4t1rChU8
         9hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519938; x=1793124738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wDh+Gx4zWL1eoJPPpMyzufEKMmJDNsByR9q1z2w2fIw=;
        b=0YBnqooERiwvQEvAgVDc28izHtq5/bY4R6OoFWSYSFCJYwGxkl+yNtlga8MLKO15vg
         JacsVxRu7LmnPXuu6BRGVEug2A9aXPIhixngbpm2QknW5ZvqKP8jdRiQPuFeIBYJYTfE
         2fGgVXZ9DnKtCxk2Mz8aH/hf8YOMXdmJScpYlvL3QW+IRk7KU2wwYKG+bAOGqJthMnp8
         k8Ohwh39eQoqyfZF0NtphvFAdMXLmWACRCm57fR0aZbm8bT+ptvwSnvoh8+F0rQKwUPS
         fcod1uc/Ze511L25rUVTvEyDe5Q6XJdd69GWUAiLydfZ0oOtGasXR9H40oVZ/292Ml1R
         icoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk7F6972UjidJigYsaaZZA5Mn3SISABWoOP14+/MGO13Mk3ihkfXfoNs/bp5uEH1HJZ3dF3bdAvPVf7tY=@vger.kernel.org
X-Gm-Message-State: AFq9FYITOfSrv5opeCNGO19vQpYnsP10SqCEScF7hR/JJIPKVWSiobUs
	ND+UMA1mBqBJ5F5ut+uw3n0+J/eSjsYNxIqqd4FWfgrlyA8+hW5Erb8aYQcjAu3zfY50dIbtd8r
	YchPU6tkTAkbzB8PXegpe7k6WHBPb5fc=
X-Gm-Gg: AYBFou3Vz/C2/2sXeI6PZRsi0+uWhw2zboyQZSpc8cdQU4AOJvzKlZGaZmqdM/MFPTW
	Nlx4caN63GQipKxqtLP2Fq/K0FIJCNjEmd1SL98KtKUKdmr0Eoi5d9XglDBL4R7Dxsy7zmAcPDR
	7vsP+u7QfWqhhmHl64xN2snQHZyjEVmSPt7KnERTN2ybxP61iGR8gWEFbQvCvWzXFtHj7sIVeKc
	yk4+jrD3TviBHK2l912fojMMiE/aLRl0KOLd0Ftu9FL0gyHc6kEb2oaHAUfhNcUGOB87hJJ+5YE
	D+rbAJkj+vKs3neJu/HpyZfQesAktMLmTnAoF+9SbKZ+M+10oe5n7tBozc1A9s8jX0KCHh3LXcT
	Uyo+PzISL9kws
X-Received: by 2002:a17:907:9483:b0:c46:7645:86c with SMTP id
 a640c23a62f3a-c4676450bc8mr47938466b.47.1792519937953; Tue, 20 Oct 2026
 11:12:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANGjgdkFAK_EF-z64cyJttAOS2gqcJuM9jOAXAXOeio6h3wg=g@mail.gmail.com>
In-Reply-To: <CANGjgdkFAK_EF-z64cyJttAOS2gqcJuM9jOAXAXOeio6h3wg=g@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 21 Oct 2026 02:11:40 +0800
X-Gm-Features: AclHuK-a56hhk3GNOqdGt_ccV_P4wvltV_luq0BHFJPtqBbWLhDlh9fkskaTQ9k
Message-ID: <CAMgjq7BoOTKxZEdcwnHAkuAZLzifaAD6YpoDAZXZsUx8oyN+vw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: preserve physical order in swap fallback splitting
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Barry Song <baohua@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 2:39=E2=80=AFAM Chengfeng Lin <lin2530632123@gmail.=
com> wrote:
>
> When swap allocation falls back to splitting an anonymous PMD-sized
> folio, the new children are appended in ascending physical order.
> shrink_folio_list() consumes its list from the tail, so it processes
> those children in descending order after the original head. On the
> tested NVMe/IOMMU path, this prevents much of the DMA mapping coalescing.
>
> Keep this ordering change local to the swap-allocation fallback. Collect
> the new children on a temporary list and reverse their insertion into
> the reclaim list after a successful split. Leave the original head and
> existing reclaim entries in place. On failure, append any children in
> their original order and return the original error. Other split callers
> are unchanged.
>
> Assisted-by: LLM
> Signed-off-by: Chengfeng Lin <lin2530632123@gmail.com>
> ---
> Hi,
>
> This prototype reduced PAGEOUT plus cached-refault worker CPU time by 14.=
84%
> with one worker and 13.14% with two workers in a synthetic 8 MiB test
> starting from anonymous THPs. Is this reclaim fallback a reasonable place
> to preserve physical page order, or would you prefer addressing it in
> the split or block/DMA mapping code?
>
> The patch and both measured kernels use mm-stable 2967f3ccdb5f
> (7.3-rc5). The machine is an Intel Core i7-12700KF with 32 GiB RAM,
> an ext4 swap file on NVMe, and translated IOMMU DMA mappings. The test
> uses full preemption, the performance governor, turbo off and zswap off.
> Workers run on CPU 2, or CPUs 2 and 4; the total size stays at 8 MiB.
>
> Each cycle fills and collapses the memory, calls MADV_PAGEOUT, waits
> 20 ms and checks swap-cache readiness, then touches one byte per base pag=
e.
> Each invocation repeats this four times. The primary metric adds the
> workers' CPU time in PAGEOUT and these cached refaults, then averages it
> over the four 8 MiB cycles. Setup, waiting, full data checks and cleanup
> are outside this metric. It measures CPU cost, not concurrent throughput
> or storage-read latency. The extra traversal of the split children runs
> inside PAGEOUT, so its CPU cost is included.
>
>                        Baseline A   Prototype   Baseline B
>   Initial THP, 1 worker   3804.69 us   3243.69 us   3812.94 us
>   Initial THP, 2 workers  3978.96 us   3445.82 us   3955.02 us
>
> Each point has two warmups and nine measured invocations per condition.
> Relative to the two baseline points combined, the savings are 565.13 us
> and 521.17 us per 8 MiB. Baseline return drift is +0.22% and -0.60%.
> The two base-page controls showed no clear change. All 108 measured
> invocations, including controls, are retained. This is one A/B/A boot
> sequence, not evidence of the same gain in an application.
>
> Separate non-timing checks confirmed the changed page order. Both
> kernels submitted 65 BIOs per 8 MiB. Within the observed PAGEOUT caller,
> the same 8,384,512 bytes required 2,047 IOVA links on the baseline and
> 64 with the prototype; these counts exclude work outside that caller.
> The checks covered data, page state and cleanup on both kernels.
> Failure/partial-output handling was source-reviewed and checked with a
> local list model, not exercised by kernel fault injection.
>
> The reproducer and patch are attached. Configurations, measurements and
> review notes are available at [1]. The numbers above are from this
> MM-tree pair, not reused from older kernels.
> Codex assisted with the workload, prototype, tests, analysis and message.
>
> [1] https://github.com/lcf0399/linux-regression-evidence/tree/a233ed8edb1=
e91a6a0ea0d326668bb1f52384489/mm/mm-swap-fallback-folio-order
>
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -1153,6 +1153,37 @@
>                         SWAP_OPS_F_REQUIRE_NOFS))
>                 return true;
>         return false;
> +}
> +
> +/*
> + * Keep this ordering local to the swap-allocation fallback.  Reclaim ta=
kes
> + * folios from the tail, so reverse only the newly split children to pro=
cess
> + * physically adjacent pages in ascending order after the original head.
> + */
> +static int split_folio_for_swap(struct folio *folio, struct list_head *l=
ist)
> +{
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +       if (folio_test_anon(folio) && !folio_test_swapcache(folio) &&
> +           folio_order(folio) =3D=3D HPAGE_PMD_ORDER) {
> +               LIST_HEAD(split_folios);
> +               struct folio *child;
> +               int ret;
> +
> +               ret =3D split_folio_to_list(folio, &split_folios);
> +               if (ret) {
> +                       /* A failed split may still have produced some
> children. */
> +                       list_splice_tail_init(&split_folios, list);
> +                       return ret;
> +               }
> +
> +               while (!list_empty(&split_folios)) {
> +                       child =3D list_last_entry(&split_folios, struct
> folio, lru);
> +                       list_move_tail(&child->lru, list);
> +               }
> +               return 0;
> +       }
> +#endif
> +       return split_folio_to_list(folio, list);
>  }
>
>  /*
> @@ -1391,7 +1422,7 @@
>                                 if (ret !=3D -E2BIG)
>                                         goto activate_locked;
>                                 /* Fallback to swap normal pages */
> -                               if (split_folio_to_list(folio, folio_list=
))
> +                               if (split_folio_for_swap(folio, folio_lis=
t))
>                                         goto activate_locked;
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>                                 if (nr_pages >=3D HPAGE_PMD_NR) {


Thanks... But I'm really not sure if this will cause any real issue,
the LRU gets shuffled easily in reality anyway, and synthetic tests
for adding a chunk of code for a limited particular case don't seem
worth it.

I had a similar idea for THP splitting in general for a while, but as
a cleanup (to reduce LOC for mm/) and not to make things more complex.
