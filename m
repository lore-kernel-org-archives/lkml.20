Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793606123;
	b=w7JVVisMkO5mCtJ/gu+8uMFH5E7uQ2TAfaK77/3UpcC1DJY+47n9eFqsdu7sFO9U8uaW
	 hD67BGH8YvBsI2UPYWAqzDK+Vvlwp8YVVwNbjwbFWdRoyMNEFJxoRVVIvWSZzUs50LkZH
	 8Je+X3nxkPOVz3erX4QRf7lf9bW7GbAwFVyB6KYDb+cuQJX8KdjkAR9CXi3obJNfGww/3
	 F8ZkynRK2ZsWwNDg+oWyiQxAROD8RHoRCxKnaW57Onmgxked7OQFea3mtJGjpQtLGokrC
	 zHmllpShhgzbPx58CQrg9iPPYA8+pg/ktQCKPN3EEg0IGXww8ptQ9F5uCd4AdtAavvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version;
	bh=VVESOeH8KV93dptPiWjIINeuJuLkSH8q0hNNGTbvaJs=;
	b=nKD5srSE2fFajwWqKEDq1VO5xn6WT3Q/XQ8I8j492rGzBMKg6q+AEr9dOlUrRsVkTvsU
	 Yn/TB40+62UsXIOJIJOdzI7OMVCZ22CPqkAACh/KQIn6MDo+MVfUOPE/pSlRBnCF4X1QV
	 ZP+dfb6ufAiqzPFOgOXCxXNsvXtBRvn8rzbEslwFSjStHN/mxQdHt12RlpuOaVuFq5FBk
	 rlu3ZPuFWdFnuuOz5FqUUY1TKkyOjW9ELrkxpqXLHeAACa25mS2W6QPcNr4ib+Uz19RoR
	 zlBR7ZdiGMYNRGq6R77DaivByBaqxVobeFpN8jukX3CzwsSx9MeXtZPhZ5cem0VMVxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=E5NMNEos;
	arc=fail smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66528606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66528606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=E5NMNEos
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A24BD0j508217
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 23:55:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=VVESOeH8KV93dptPiWjIINeuJuLkSH8q0hNNG
	TbvaJs=; b=E5NMNEoscTnD/bxw+Q2JSm3eB/Ick4L9TQL/86Q2iZ1BDTJUL4CrQ
	2wBOAqIzJbO9ZkJxE+sA7DTGoaytiW5h4ww8XdGT0aAyluMmQ7HJT3m5aw+s5aDd
	HKguWIR6i8YzwRjYzTB0FvX8dQIJK+9Y/8qOJZlIJ/xnFz4xzLG5pUXWm1Ih31/L
	ZiqIyb//6yTvSYs9VLmuQFgJ3cLPlNUNsajxCKQ671OnaBstC+jo88o2fJREAYLh
	d1oPUUxy44eMDFLt7A6Qga7fkOq9i/XVkCiK97Ew8rXph7u2RGfBTdQhK69Autqq
	h3OLRQTYs3i2TDG8XCjnPdQpUt8FVoXUQ==
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	by m0089730.ppops.net (PPS) with ESMTPS id 4hnbtp01np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:55:20 -0800 (PST)
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b3dc91781fso2269316a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:55:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793606119; cv=none;
        d=google.com; s=arc-20260327;
        b=R5Ez0nfNgbcXA2crcB90skb81YQN55KfdglvPlmYL94jMUsWRAH9s1sf98ZRXnoo8Q
         k+vmfASVRSuA6CXfSqwGsa27OisF37fNp3YTdu/uteZ7xpULekeqnIBj73mVg3HdUOs3
         fKKU67KfN61AjuSRhAsSW0nE1aRgtksbeuwO5u5p0PO6tK9hUqWM5C8cbh1togIGJ7xi
         /is61++bH8KCnAHcLfJwCFAK0zRGY2YNsXvlfa6WPYLVuBrrbGYnkDCABeio2v3mqBKw
         UOlEplE/4dE5As/s8paeLRRTb2IzrbEKrglbvbwWl0oAgju9QDoTAIDf3BiF72dZ39UR
         9C5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=tJb4lf6fiPg2LPN5JU8WD73ddi6jNhw7+gXQyIOaxMs=;
        fh=RnhwwjO2G0ZsvS3PNX6H3/nHz+iAmR0cl+85oCVOrG0=;
        b=jy4sObvpT9+ZKLv/hB6wVzkhxqlLYJgtLVz4LW7/uL+EHN1leHb9WlsEzdKFkJcq8F
         I3OBMZ2t7NC6E+JVMECj1vpQer0Ml3ekc5BjvfRMTUG942NgKPHXB8WIZbQ0afGnJpME
         HyCCcUj/yrg/b4Hogb2oA1/+nZ2F2T7K86W/Yznog3g3gXcUOic+Cq2tL4IRWY09HW8y
         FVqWMds2qJ9lnBT2iWmhXfTDp+A8FOYe9CHHvQDkpjD75QeaTsEKL8Qoaj3Ttl9ixFaL
         dppotPEFKu/Q9VZ8veCoKZgJDlgrxV5kesX6HyjVSuOIINMvOKubaipkkn/zYMSGj72w
         z+sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606119; x=1794210919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJb4lf6fiPg2LPN5JU8WD73ddi6jNhw7+gXQyIOaxMs=;
        b=r1C/qyDy2MyZQL5DOY9L3ydd4/Yze9xJUm5C4481yGo7y8wIkZSdykhZdg+6CsCFBi
         dPi2v3/3CiDQVxIF1LCKHQ6nFxQfKiUST2F/vmQwMTRdOBZln8bAQE4cbvfwVWTJQIKs
         BvCKrlDwXKrXdWdcXXKrcedywlT1FI/dCf1oQ6ty3lplYPoaNrX4bwjPscIzCgpu7Sxm
         b09iobQ1A3kFq5a8lkgOXiq5o/ZZpcE1FNkstjMFpCS7tObY/A1vNzoSi+NcZpuODd5k
         gM1bipTuJzKqAf1OncyEBtfs/emjGhM0CRIlxptogdn+LlQcTW6PlvOyKlqThkn/ZAXC
         i5Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwGAJT6A8nH6I9DGO1xSXvsJCitGdIN1pZp1ePu6xAkSKmXrM4gJDirk0Tfm18KEPLaO1HGbb5CNjOzo3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aCi96Jp/666ro2/m0S7hjFTy4QJY/p5i9TrknXinx4vHu8+BT
	qmWtqXdtQhIXnVQAX+d90a0fhVsJnx0l9YpioANzhi/Q7RgHUlEf9PZl9ZHFdb9wTbI4/zCHGzd
	be0SlqCOkFfn86PQJqO+OZKZanrHVTDbj83V990hX7fTwtn+kXG0Yx01WlE1sTQgNVszIUbq8vP
	5GoWumjycnZwFM7gdvPyAzkAzVZ1IZASPe6Ne+D50=
X-Gm-Gg: AYBFou3PaK49LeyN24deMRD1/Z0eNW60WqKSc4kjjC8nA/XnSblb338/h9Cj73c7Yol
	tECsPxG4PAlEqaEBP8lsQDF4RdaaU/AKncu71YqRk2F5eAJyVpFYT7bI84jneTzvxJWzSHVcQvW
	REnqw/J/3t/mWMgIbegk47WuX/qI+lOqemrkUFRllCT1zQL8qiXmLu3Dmy21NFnEiI5N6EhThN2
	rBdKHW2h6Kve9TNzw==
X-Received: by 2002:a05:6402:1345:b0:6b4:bf13:b4a3 with SMTP id 4fb4d7f45d1cf-6b4d61ccc7amr4438939a12.43.1793606119531;
        Sun, 01 Nov 2026 23:55:19 -0800 (PST)
X-Received: by 2002:a05:6402:1345:b0:6b4:bf13:b4a3 with SMTP id
 4fb4d7f45d1cf-6b4d61ccc7amr4438916a12.43.1793606119115; Sun, 01 Nov 2026
 23:55:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <20261023211629.16227-1-baohua@kernel.org>
In-Reply-To: <20261023211629.16227-1-baohua@kernel.org>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Mon, 2 Nov 2026 08:55:08 +0100
X-Gm-Features: AclHuK_8krTVTi2LRMKaoOYCwc66AEL2XvylCPgWSL1llLe72wlEvVkXyXpTj5c
Message-ID: <CAEmasaVgBV+tYg7xDV96qBQ1oEVgUL3F_BnCLJW3LRjZ7ai+Yg@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: alex@ghiti.fr, akpm@linux-foundation.org, baoquan.he@linux.dev,
        chengming.zhou@linux.dev, chrisl@kernel.org, david@kernel.org,
        hannes@cmpxchg.org, kasong@tencent.com, liam@infradead.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org,
        mhocko@suse.com, nphamcs@gmail.com, rppt@kernel.org, ryncsn@gmail.com,
        shikemeng@huaweicloud.com, surenb@google.com, usama.arif@linux.dev,
        vbabka@kernel.org, yosry@kernel.org, youngjun.park@lge.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfX3+xrNs9+jgnT
 6HP+M8Lq7F2tcRCd9Nxkx56IS4GvExm2R3GtzfqT2TINZ1UV/Dyl/j6ngxG7AjSenFdqQahF1xp
 6N7ZrWN3n3+hVOjzIsjXvlyL7aVItbM=
X-Proofpoint-GUID: 2OKfkyMvf9zWls594U8ugfcVRj_R_DbA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfX0E832DU7d+xV
 GzSTIYquBI6T0kdINbH9IDWko5TOEX309YNTAa80LTb44d5SA05+9mRv43ydks57PZiySzX70ZU
 f7Zzy+TQGHEkiLJ7i45hjEQdJS3GWx22mn4GASQ/OSu6aB0ceQWwsswLZMNGxqg9TyJw1lp/M8/
 gtO9ZFrlbzwOl+T6ts6F6FHpd9iwnvdyBjkG3SSbGFOKloPlfI0v1whV7vfoJNINFtsX1tdfF+V
 1U5uUybrV8dXL4fKqKXQDqV9mFhwV7Ed1PZMhsbhCGyALyB2g0AMNj48QdPYTBBX7IvCcEWR87j
 dmEGbiQkzc1EvW2ixn0+0IHks0pEM3T6+qZVLlQFMURadzIT3Jov916j7WtPZR+IJwPMxp4kmga
 14Wz09PmRQj1iCmZo6Aon6Y173PUiUo1xESBMHwB0+kYEa49voaqFAg7QwaIVuvmXFhxXEbIxIb
 aSjqT2g/6/uiTQprFdg==
X-Proofpoint-ORIG-GUID: 2OKfkyMvf9zWls594U8ugfcVRj_R_DbA
X-Authority-Analysis: v=2.4 cv=OqzaWC/t c=1 sm=1 tr=0 ts=6ae841e8 cx=c_pps
 a=9KvDgq78n9V61H3VJbnhTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=VwQbUJbxAAAA:8 a=JvHM3WmaZCj6HjDewG8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01

Hi Barry,

I'm back from holidays, sorry for the late answer.

On Fri, Oct 23, 2026 at 11:16=E2=80=AFPM Barry Song (Xiaomi) <baohua@kernel=
.org> wrote:
>
> >
> On Wed, Oct 7, 2026 at 11:39=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
> >
> > Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchronous
> > device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readahea=
d.
> >
> > zswap is the same kind of in-memory, synchronous backend as zram, not a
> > swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> > swapin_readahead().
> >
> > Here are the results from bypassing readahead for zswap too: it was
> > measured with a kernel build (make -j16) in a memcg, zswap=3Dzstd, shri=
nker
> > off, on Sapphire Rapids and 3 iterations.
> >
> >   768M memcg (sustained swap thrash):
> >     metric                 mm-new    + bypass    delta
> >     build time (s)          405.0       341.7    -15.6%
> >     zswap-in (GB)            79.5        53.0     -33%
> >     zswap-out (GB)          144.8       115.6     -20%
> >     swap readahead (pages)  6.79M       0.45M     -93%
> >     swap_ra hit (%)          72.1        89.9     +18pp
> >
> >   1G memcg (light pressure, build not memory-bound):
> >     metric                 mm-new    + bypass    delta
> >     build time (s)          177.7       176.0    ~same (no regression)
> >     zswap-in (GB)            10.2         7.5     -26%
> >     zswap-out (GB)           27.7        25.1      -9%
> >     swap readahead (pages)  1.07M       0.08M     -93%
> >     swap_ra hit (%)          68.6        87.2     +19pp
> >
> > Similar gains were observed on an AMD EPYC 7D13 host.
> >
> > The gain is from no longer prefetching pages that are pointless for an
> > in-memory backend: readahead inflates anon residency and thrashes the
> > page cache (file pages get evicted and re-read), lengthens each fault by
> > synchronously (de)compressing a cluster of neighbours, and adds
> > compression traffic when those extra pages are reclaimed.
> >
> > Bypassing swap readahead for zswap therefore makes sense.
> >
> > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > ---
>
> Hi Alexandre,
>
> One thing on my mind is that for synchronous devices, we always free
> the swapcache during swap-in, thus releasing the compressed copy and
> metadata as well. We could do something similar when a zswap entry
> is found.
>
> I wonder if we should do that as well. I don't have time to
> investigate this further myself, but I wonder if you'd be interested
> in looking into it.
>
>     mm: free swapcache on zswap hits in do_swap_page()
>
>     We already do this for zram and other synchronous devices. The same
>     should apply to zswap hits. Freeing the swapcache will allow the
>     compressed copy and metadata to be released earlier.
>
>     Suggested-by: Barry Song (Xiaomi) <baohua@kernel.org>
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 55b5a84d1016..d22c779fda93 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4711,17 +4711,18 @@ static inline bool should_try_to_free_swap(struct=
 swap_info_struct *si,
>                                            struct folio *folio,
>                                            struct vm_area_struct *vma,
>                                            bool exclusive,
> -                                          unsigned int fault_flags)
> +                                          unsigned int fault_flags,
> +                                          bool sync_swap)
>  {
>         if (!folio_test_swapcache(folio))
>                 return false;
>         /*
> -        * Always try to free swap cache for SWP_SYNCHRONOUS_IO devices. =
Swap
> +        * Always try to free swap cache for synchronize swap entries. Sw=
ap
>          * cache can help save some IO or memory overhead, but these devi=
ces
>          * are fast, and meanwhile, swap cache pinning the slot deferring=
 the
>          * release of metadata or fragmentation is a more critical issue.
>          */
> -       if (data_race(si->flags & SWP_SYNCHRONOUS_IO))
> +       if (sync_swap)
>                 return true;
>         if (mem_cgroup_swap_full(folio) || (vma->vm_flags & VM_LOCKED) ||
>             folio_test_mlocked(folio))
> @@ -4977,6 +4978,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>         rmap_t rmap_flags =3D RMAP_NONE;
>         bool exclusive =3D false;
>         bool rwp_restore =3D false;
> +       bool sync_swap =3D false;
>         softleaf_t entry;
>         pte_t pte;
>         vm_fault_t ret =3D 0;
> @@ -5059,7 +5061,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>                 swap_update_readahead(folio, vma, vmf->address);
>         if (!folio) {
>                 /* Swapin bypasses readahead for SWP_SYNCHRONOUS_IO devic=
es and zswap */
> -               if (swap_entry_synchronous(si, entry))
> +               sync_swap =3D swap_entry_synchronous(si, entry);
> +               if (sync_swap)
>                         folio =3D swapin_sync(entry, GFP_HIGHUSER_MOVABLE,
>                                             thp_swapin_suitable_orders(vm=
f) | BIT(0),
>                                             vmf, NULL, 0);
> @@ -5325,7 +5328,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>          * Do it after mapping, so raced page faults will likely see the =
folio
>          * in swap cache and wait on the folio lock.
>          */
> -       if (should_try_to_free_swap(si, folio, vma, exclusive, vmf->flags=
))
> +       if (should_try_to_free_swap(si, folio, vma, exclusive, vmf->flags=
, sync_swap))
>                 folio_free_swap(folio);
>
>         folio_unlock(folio);
>

zswap already gets rid of the compressed data but indeed keeps the
metadata on swapin, we discussed that with Nhat 2 weeks ago :)

I have a different patch for that: zswap marks a swapped-in entry as
dirty (so it gets swapped-out again) so I was thinking we could use
this property to free swapcache metadata in that case. I'm pasting the
diff here so you can tell me what you think. Anyway, to answer your
question, yes I'm taking this over but before I send that upstream, I
need to test/benchmark this approach. It relates to
https://lore.kernel.org/linux-mm/20261022145615.2184343-1-alex@ghiti.fr/
where poking holes in the swap table currently results in inefficient
IO grouping.

diff --git a/mm/internal.h b/mm/internal.h
index 2112576a70a2..0c4598326d2f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -626,10 +626,13 @@ static inline bool
should_try_to_free_swap(struct swap_info_struct *si,
                return true;

        /*
-        * Free the swapcache only if we are the exclusive user and
-        * this is a write fault.
+        * Free the swapcache only if we are the exclusive user and this is=
 a
+        * write fault, or the folio is dirty: its copy in the swap slot is
+        * stale then (zswap loads are exclusive and dirty the folio), so t=
he
+        * slot only holds swap space.
         */
-       return (fault_flags & FAULT_FLAG_WRITE) && exclusive;
+       return exclusive && ((fault_flags & FAULT_FLAG_WRITE) ||
+                            folio_test_dirty(folio));
 }

 void folio_rotate_reclaimable(struct folio *folio);


Thanks for your suggestion!

Alex
