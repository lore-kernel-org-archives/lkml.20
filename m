Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793308878;
	b=4Yh0nbN7W4d5dYD4LNxMqfyioU/vWIIngCS7T5QbekybdQO8dvcVU7zmgFQ52UJlOwt2
	 IpTIAkwvJ7ILMwwtlhqdkAg1uRRsUiq+ZjNdztZIrXk1bQ0teVMTlR0vIhCC4AQDZ3ebE
	 hqcaEZlW9if/JsNwNtd17HQwIO9geumt3DQdZt3dLqj2jbHERFWn5lIOj8Ead4RKLRAMn
	 1OtcIBZXNWUlpo+VecuajnIM6uZx4Ikmmvauvsy77Ndem4KbrPGNTkFmlfDdhKAbro3me
	 JCudiwhzMIgwxbE9rXoyXDPfAjf3jWthGiUJAjj4xa2mznmeGnnb//65Pkpfjq0vKqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9+8ns+yvE4djttd03VIoOUqKqYBAUVZpRS1Gm6Ry0jA=;
	b=DisvfMWAi9lhUT7lJHP91J8elk7kw+CCm0h+RXkJ+lhVzcoNjiioZQ/csu0RuONcAhRk
	 5DWv7vTvBmiuiTDpucbyQmkWh4eA5XZr/TWaPmm1WXqQAr3gxyIVju+kl4t6EEpno98SQ
	 qi17xrNTRwAG1NtqWRjlATMJkqckx/tO/QCE7eIuwsIbzk6pxdWi7jE3pZUQ6teIR8OlS
	 oqZEmUIdpSGkmbHh/Dux2cMm6r2l+++9WUWY26xeBj4qzrLw3Fl9iI8mHr1JDGMyvzugs
	 5bZ/OfkWzFEGh8g4HAIwAPWFfX6PV4Dq/mBb84LB4x4DKy3nAPidxNxa4bv4fVkQkVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b187zlaV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FBB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FBB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b187zlaV
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so58275e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793308876; cv=none;
        d=google.com; s=arc-20260327;
        b=Q2xfb9mymyttc7gS3IleP7SumB4OJvgLOC2Q1D/jiVHTZgOYYBe5EvMkQTNyccsnJJ
         EeVGEJKjppNK9tsAAmL/NFS0QwbqKJmZLosUdhimAR29340heqxHkZqvmoHQHijRaomR
         Nsu6iIYSoFw5zMIkVI/JwpC3HjGamuMg/pg7ok4UkGT59YGLLJAAEcwHpSjK9Kn/MvjN
         HXkHYC/eV24aNbEpDabCtmmGodNmmQGnPpKAXc3xWAEi4rz3yF7p3gSQbSvy2Z96q9Ts
         ztrH8d4xF5zGEeIUgog8wgQcY2jtFMbk9xKyy4u+6RmdBy0K7xXezgmabiPBy577DbW2
         yqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9+8ns+yvE4djttd03VIoOUqKqYBAUVZpRS1Gm6Ry0jA=;
        fh=ZY8HNMdEmZjsDhQFItCRJYKCRLOiY7wgHuXenqGm2YM=;
        b=o+n/EfXB8HZPdyTOOzy1D3us3KxqW11MqjaOiKFY0BSJ612o8IpgbzX9fpd3/ugkXH
         ihaWGnzMNBrAe49T8a9RRktq9jp9TmxoIt4Hl7NgPgHkyC2qgbOsvqO1Q1ggegx/YCGC
         HBKgf+6ty/EwJOI3xxEO9FREqVJE238/LKMCOnk149iC8urKrHRErsS5ZiQAo8uJiM9T
         DEgMbtazrdyghJ6RdEBjYaGclJOwyU/W57Ju3XCSMZvM1RCmLq9S1iNsX2t+A1vB5F7j
         VmX4Gz04LT/2NAaX/jYG+0hZHU4MvRhmhHjqLUJyK61DHSbLjiiWwxkTd2SvVCPsY9lX
         TDRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793308876; x=1793913676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9+8ns+yvE4djttd03VIoOUqKqYBAUVZpRS1Gm6Ry0jA=;
        b=b187zlaVHnz5lzU40qztJ6pRtgry5HkMLZIj05AbLmiUPaDNznWYKFk20cs739b5mO
         sKBdIdaG+F1j9SokDMS63l/DAQnIUNS/LG+RVmHF+ycrEj8fSzzMPaCj6FfLiBPwcg20
         KLF/714jYYxoLl0Ot4y3yQLq4W52oW+g0YUwvF/NpgswQ1xazDgrqQwvCUlCTmvQwmwy
         sTG1DEOWw5gJuqjqt3/DYeSJx9n1MJi+LhDqUufo8t9K9/kAccYEWLwpVUkHpAnS0l20
         /hOphx2OLVPwByqB5ltoD3uf4kEqxU3W9EkXm3bDpgWTiH3oLYrNXuQthFcSXq4IDCNu
         mHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308876; x=1793913676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+8ns+yvE4djttd03VIoOUqKqYBAUVZpRS1Gm6Ry0jA=;
        b=Za1TPS+Lrv8LMDo3msZ4od+0x95qihtpYMz3yLACEbVPQEgRo+XA8eMU2ZE9mIYsjs
         xuxAuyn0GelviLvO2aeeh8io6IAiJYHWRVqjL4XhmMlgTb3r8oO8WJaEF/3PeWPBS/fF
         vRJLEWEUGYbOqd+/olVnc2FuJqlVv3t0E04bVPHT5wKUgmVlIqip1mREU6wxTKzidcZz
         fMpznZPAZp3jKUPelvvR+YyTWOILRzz8MZFWUjiNbZWGKyKrsKurwwai8UyVXEuh6HiP
         9DbiTQ5XdbaN1Q1dnguHuoBbg4R7PXjF/JIHbiT1MCtoodpipwUnu3VNtvP4EaMhBnEE
         5asA==
X-Forwarded-Encrypted: i=1; AKwUvBzV8Fz6kgEVJN6rcCQSBmDiN131ygI0D4PpchKQNHqHqMFXrgxgB1l/n5H+GCeJtHnaRzPQg8I8Y4MhYJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+U6M+WqXneqPRzZvY10z92wzrgadLjE2gIT/CiVH+ne0LIo0V
	tSHzmBOhJ9fwKkIuDFVjh+WmbvJMQZfiw7au5NoYkZnlrz7cg7wRx26hNAwSJEtIFZKk9m6omQa
	0sXtXLG74PsCwOT5KzFXawcu3mrJBH+8=
X-Gm-Gg: AYBFou2pziejDmrk9KO1mKysFp9yo9H89OD4Aq8pKCJ5jelK9VDmqEMEsuAmpcbz9EP
	aaLKZd+VaSbL4kge0KDsAskaQKswhoBNyVPrd+FJnUcMie52Jdjodp3Cu6ePmPGAzkFpYfBN0AF
	pAqT8nWjHDaR/Bh8LCKmXghFABpyqnJPBkbKM/hcc04Lxo6EH4z09KjUSflS6lAo5L9tQ1hzKzo
	dz+0bTMu+7H7GnkaGBDgZNZq9ddhcwhm6S0er8nTshf1enF84ZV2ffsdcDcJWTGH4F8CJhazIsy
	cZb7xyvZnY+1eraxG6qBHm6GjtMPWYER6vs4dh+Dg1aD6Tv+mok7viCckaiKAeG0qnRPi74KDVr
	8p/zWi40lIRXdh+9O/1cdxRowfBbhEO3dg1Qcfg9CoKXS4tbBo6utqF3tCnSypn1Ak/kG0d0GWj
	IFJvO08zusgVhvG/jLisEn0yyFCgjEIWGHG7oSalL3sqdT76MNiUDfzPip+xrSRbR2GFW/oVk3L
	Q==
X-Received: by 2002:a05:600c:8b46:b0:4a0:4a8:d444 with SMTP id
 5b1f17b1804b1-4ac18c73238mr4750555e9.33.1793308875581; Thu, 29 Oct 2026
 14:21:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-swap-fixes-v1-0-73f73a59f2fc@tencent.com> <20261030-swap-fixes-v1-3-73f73a59f2fc@tencent.com>
In-Reply-To: <20261030-swap-fixes-v1-3-73f73a59f2fc@tencent.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 29 Oct 2026 14:21:02 -0700
X-Gm-Features: AclHuK94IG0mhXQQjpw3RIi-A5xAWBQBwS6QINbigt5Lm9tPUmEat0F26KqQrPE
Message-ID: <CAKEwX=MJcyr1GjKNQ81x+fUS07T=THXGivjebt=W0ayjjZ3fgQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mm, swap: fix large swap-in across swap file extents
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Usama Arif <usamaarif642@gmail.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Mani Tofigh <mt4022@columbia.edu>, linux-kernel@vger.kernel.org, 
	Chris Mason <mason@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:32=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Chris Mason <mason@kernel.org>
>
> A page fault can give an unprivileged process blocks of other users'
> files instead of its own swapped-out data. This affects systems with a
> swap file on a synchronous block device, such as brd or zram. For an
> anonymous mapping it also takes a huge page size below the PMD size
> (mTHP), such as 64 KiB, that is enabled for anonymous memory.
>
> A swap area is divided into slots of one page each. A swap file is a
> regular file, so adjacent swap slots can lie in two extents, far apart
> on disk. A folio is read from swap with a single bio that starts at the
> sector of the folio's first slot. So all slots of a large folio must be
> contiguous on disk.
>
> The swap allocator knows this: it only hands out a run of slots for a
> large folio if the swap area is a block device (SWP_BLKDEV).
>
> The swap-in path does not. On a synchronous device (SWP_SYNCHRONOUS_IO),
> one that always completes I/O in the submitter's context, do_swap_page()
> can read several swapped-out pages as one large folio (a large swap-in).
> thp_swapin_suitable_orders() makes that decision, and looks only at the
> swap offsets (the slot numbers) in the page table.
>
> Pages that were swapped out one at a time can end up in consecutive,
> aligned slots, and are then read as one large folio. If the extent of
> the first slot ends inside that folio, the rest of the folio is filled
> from the blocks that follow the extent on disk. These blocks can belong
> to other files.
>
> Reproduced with a fragmented swap file on brd and 64 KiB folios enabled.
> After single pages were swapped out, a fault returned blocks of a
> root-owned file with mode 0600.
>
> Fix this by allowing a large swap-in only when SWP_BLKDEV is set.
>
> Known gaps:
> - A swap file on zram, brd, pmem or btt is now read one page at a time,
>   even where its slots lie in one extent. Its swpin counters in
>   /sys/kernel/mm/transparent_hugepage/hugepages-*/stats stay at 0.


I guess we can check for this right? Look for the swap extent of the
first offset, then get extent's size (swap_extent->nr_pages).

Not sure if these users use swap file here though.

> - With the posted "mm, swap: enable THP swapin for xswap entries"
>   applied as well, the large swap-in that it adds never happens. That
>   patch gives its swap device SWP_SYNCHRONOUS_IO but not SWP_BLKDEV, so
>   the new check would have to let that device pass.

Mentioning unmerged patches in changelog? ;)

>
> Fixes: 242d12c98174 ("mm: support large folios swap-in for sync io device=
s")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Chris Mason <mason@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/memory.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index b65b56fe9714..944f57153c89 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4863,7 +4863,8 @@ static inline unsigned long thp_swap_suitable_order=
s(pgoff_t swp_offset,
>         return orders;
>  }
>
> -static unsigned long thp_swapin_suitable_orders(struct vm_fault *vmf)
> +static unsigned long thp_swapin_suitable_orders(struct swap_info_struct =
*si,
> +                                               struct vm_fault *vmf)
>  {
>         struct vm_area_struct *vma =3D vmf->vma;
>         unsigned long orders;
> @@ -4888,6 +4889,14 @@ static unsigned long thp_swapin_suitable_orders(st=
ruct vm_fault *vmf)
>         if (!zswap_never_enabled())
>                 return 0;
>
> +       /*
> +        * Neighbouring slots of a swap file can lie in two extents, and =
a folio
> +        * is read with one bio. The flag is set in swapon() and stays, s=
o the
> +        * race is benign.
> +        */
> +       if (!data_race(si->flags & SWP_BLKDEV))
> +               return 0;
> +
>         entry =3D softleaf_from_pte(vmf->orig_pte);
>         /*
>          * Get a list of all the (large) orders below PMD_ORDER that are =
enabled
> @@ -4924,7 +4933,8 @@ static unsigned long thp_swapin_suitable_orders(str=
uct vm_fault *vmf)
>         return orders;
>  }
>  #else /* !CONFIG_TRANSPARENT_HUGEPAGE */
> -static unsigned long thp_swapin_suitable_orders(struct vm_fault *vmf)
> +static unsigned long thp_swapin_suitable_orders(struct swap_info_struct =
*si,
> +                                               struct vm_fault *vmf)

Nice, I think Sashiko is complaining about it on one of my vswap
patches lol, and I was wondering how on earth is correct in non-vswap
case.

Fix LGTM:

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
