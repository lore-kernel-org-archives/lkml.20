Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794198475;
	b=SiruST+RQNvgsU9TA45TAVE1EzuBIkXgQGCqoGH3Wat0R9D1/5twvb6O4Hu40EJKjyIj
	 FMiYVIbBd04ApJy8naGsqA8MiGweAB6FFzGVw9FNIEX+3Ov2npiZIkPctOSZVS1jU+uZL
	 dRbN9+NMfc2qdrwaiK2EbJkyh3LdlYoBrfhgJyi4Y71Thld8Dn5bEe4clRdftU/veVp8t
	 zts52jKgayaCYTX4QX1j1lByJaPlRx+1fLauYO4zOg+7/VMRWImLaRrMvSBn81/XWhaFp
	 TrFvsrsvRGtMt8ZbweTWrT97Yo9D/Su7u940mFhL8rkU5isTN+XKR9GKg8Ct6nw+0VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x/V8s8uaYeKYuAXh83eqMNrq3SnymKmItW+yIrZGRcc=;
	b=rfcK3mDcOnyjIPi1UyCqWAY196XsPGciFY8xI9ENyhyl8Tv5LciFgp8shdT7Hf0Shra6
	 uY3fECdN06Tw/D7C1QPDHdIOaLPbcc4VPJsIl575wgUQKF3M1LI0qxk4NFZdrZOdjaf5l
	 UjwbI2sMSt/ObsJigO1/w5lh5A0CF5tAvKq6QLaeIQZczKioe3t8/z+C/AcEp7i9cj790
	 mnGwASPueAeq8SXU6iEN1JTZjXrE18SUMknpHb82qS1xPyL0r17ScbsbzRBZjCBUT2p98
	 VmEOm07n1Hygp6lb2HGISq5pKTuKW6AZwCYhENOX3nrRGk4hMoqYlAl6Xx25Wgb1z2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkqgNvt2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA88606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA88606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkqgNvt2
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-930c0f9c1b1so39179385a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794198474; cv=none;
        d=google.com; s=arc-20260327;
        b=WqIl+jdaN5o53TvVl2zS2fxx3dwQgl7HoKPwRfUlxOytGnIpxkWkzGgG9jTOf1uYZw
         8oCFmOZ1Vwjxt46VGVh6XZC6dVYZwvEdTmPAM82venQuu6+eKwnU82YUNkLv0/u50V8x
         iTUmG4ZfMwR4egpoE8E9cPkRAZGg2Bp0bzIu0vAgYp3QBV0oXIF1T+F043xBjH3mlsSO
         KO6Nx5o+nh0WNclx2oBcQ8vLQr8UZ1ox8smP2aHivbJGmHDBSv7uSOx6qRq4XmfSAXsl
         VR1PBZZXnwuZ3y/vPN6VI5C6kfZghi0U1B2kHxfF/CZlEy5E5kJfePkzAwbmwxoMival
         LMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x/V8s8uaYeKYuAXh83eqMNrq3SnymKmItW+yIrZGRcc=;
        fh=JuhAEny53PM1FNSbTMQjkopHek1CNxCP3u6c6PmpDoU=;
        b=oZghDj89LdnxkntUwSVNANxCVD0MN9r3sxpd3miiR4DG+lV5ztnYuLDhDp0kezNNJy
         ab/nQFp7eVjeuISpi1CMWAkYEHTN6U71tDOc3B7uPsax/OVMP5/dUsZD1pe2aUU2KoMJ
         y8zHqYm+nXKyMQFduekvp3duciIEYxGDP1ctlaIKSEhE7Vq8x2gNUhvIXi6v+AV5mAVj
         MvbKQaPWhkAAPRdHqhrBEtyTnkRpkEEEuzCL/Mv2uNHwaZmUDwXheVX4YOAAR8AD/E+0
         yw5IwmYwE25UpD2LRXyODKE8tFPsUYjrgoDGHBD1x48nERh0TJ276LasYK1xinILOHOD
         5D/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794198474; x=1794803274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x/V8s8uaYeKYuAXh83eqMNrq3SnymKmItW+yIrZGRcc=;
        b=RkqgNvt2aX7OfJXT/QKpxPcOjit4CrFOnNxyEaSgfbmBgpQFAYyYFFqd5CU99j+ZWt
         tdpo3LqDWtDNgGzmM0zxcZt06p511zfTCm2t4R1as5e8Cfov2FHb7vqBNoDVhAGGSE2d
         3CclQifyIFjEzaAELqBTsZIjWlw98viK9HXz1WSzGYeQfMZURuUHStmWb3BAEZYClNcl
         +/+Z4LDZfqISHA8BploMFAWgWTWRcyBFwRsRuUC8SGnS3yxXSw+kJn3GFZzfJDUm7CQj
         /1H7BpUwkTC52BpEnrrKs7xD/xOVFueY6YaNH71kD9Prh0UEEBN/+PZyvvXaTp9mMaxp
         AA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794198474; x=1794803274;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/V8s8uaYeKYuAXh83eqMNrq3SnymKmItW+yIrZGRcc=;
        b=gvtr+/+hVcKFvgStC+RDtApPdcky6iCB2c8TLD0V4Igu4dtSAq9OdkamZFHYmusqAa
         B7/qyfQPYk8FTljznDKle3ubjAoADB0TQj/gglBV+1sESR3Onpph8mRPbdO9zZg2xdjL
         lEwI/QroNVB41HscjOXCtPCJvF8jaFveqDUV5lvK5sAZtzaUX4N63CsIgXSXpGXtIT8K
         RRLkgI5PFpLEFQE1jqoqS4vC+W/ICItbQMkmhSYNq9DCPAOYnXwY6CtJmvoYKn90A/QS
         HtBIzmrN5KRXApf675y9KiDypJvd962CfaxbAiWtlGOPvGVBQbYqu4aHxke7waLLJylI
         th9A==
X-Forwarded-Encrypted: i=1; AL+hErEZei8P3aVD4ZID7TrmvfIlf3Tv/SY8gNhyM+RipzpKbaNRlUG/jkMX1WopMM2wVQmdgP6NGxk4gyz37Jg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cq38/FDjMoIkvUx9R3XNIfsCxv414NmZmwwpcpv8X25Oo/LRl
	YF1unSuISGO96KMdR/OL2qSE+tAzN+ItZKKX5X7G41GP5chkw7MBjUO15Zlln4N73mefTX+nVlV
	ED71IRY8JteD/QOXW7zv+Lx3zDoznWAU=
X-Gm-Gg: AYBFou0wy+MRuAnfemR2Zu06u332Icr9GlgicCgLmbtu5FgrEJaCmWkDBATY8NEoueT
	hGh7QR3fbkGlZwdThlwuA/Idl5c1ADKfgmczw6z2e7XpyFTTIVTMfYcQQnuHfQZDD5daBcLz33B
	LxyxTerFZ+AKnl+gyab2K3C0iE7vUiS6vIa3oH+EpDJZ67fL3raMtNgnkforOoRlX7biZ8XFFBe
	wjgjEFLNTrvrl//cLmCkfKX/3XmtNbWTxD7HXtNPFed+sRYbT/nxkZvhetYA3H2eMaTuCngzDvk
	axAhxnreuxUp0D9dQhdg4POzEKPyM1cDluU5g0MwmiPb/l7HPdjrrcbeInkJ/Y4jvIiFxlYOLpo
	z8KPzst7AQDKjuPK0IUXhhR+rm0igYK2kLF6SuvwVId6BU3ZGS0X2+v8BX7MEghRvy5UoH+3Ip6
	Ic+WfX75PRyiJXMadhUpbpnRID2/WzzgNhKKJ0h3w+DgZBMXk=
X-Received: by 2002:a05:620a:3190:b0:939:7683:33d5 with SMTP id
 af79cd13be357-9478485d5femr443802185a.19.1794198473590; Sun, 08 Nov 2026
 20:27:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <auxqWxUfRVvxnk_n@pedro-suse.tail5790ac.ts.net> <44740e38-77ae-457e-97db-d6e0a0149dc2@linux.alibaba.com>
 <4a64ea17-6ac2-406e-a432-b82c481a4f84@kernel.org> <a069e3ca-6bbc-481e-acec-5ef21855b9ec@linux.alibaba.com>
In-Reply-To: <a069e3ca-6bbc-481e-acec-5ef21855b9ec@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 9 Nov 2026 12:27:39 +0800
X-Gm-Features: AclHuK_sNTtrjAjIrpAQh7idqCIEWYHWxlYsqsc4o9-_q-3EsWqOtHAcPFa_q7M
Message-ID: <CAGsJ_4wGQ68vEhCS=6CAAr9K4O3Q2fazjpP8QSK2Zs3r6R4Wfg@mail.gmail.com>
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio sizes
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Pedro Falcato <pfalcato@suse.de>, akpm@linux-foundation.org, 
	ljs@kernel.org, riel@surriel.com, liam@infradead.org, vbabka@kernel.org, 
	harry@kernel.org, jannh@google.com, lance.yang@linux.dev, qi.zheng@linux.dev, 
	ayushr@modal.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 11:42=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 11/8/26 3:58 AM, David Hildenbrand (Arm) wrote:
> > On 11/6/26 03:12, Baolin Wang wrote:
> >>
> >>
> >> On 11/5/26 7:37 PM, Pedro Falcato wrote:
> >>> On Thu, Nov 05, 2026 at 10:56:28AM +0800, Baolin Wang wrote:
> >>>> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing=
 mapped
> >>>> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can a=
lso race
> >>>> with concurrent page table reclamation via zap_empty_pte_table().
> >>>>
> >>>> page_vma_mapped_walk() is used by many functions including try_to_un=
map(),
> >>>> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migra=
tion_ptes(),
> >>>> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_=
to_unmap()
> >>>> and try_to_migrate(), the other callers do not perform post-walk acc=
ounting
> >>>> checks, so the race has no observable impact on them.
> >>>>
> >>>> For migration, the race can cause unnecessary retries. For reclaim v=
ia
> >>>> try_to_unmap(), the race can cause failure to reclaim a folio that i=
s in
> >>>> fact already unmapped (as shown below), which may lead to unexpected=
 OOM
> >>>> or increased refaults.
> >>>
> >>> This is very handwavy. Do you have numbers? Does this actually make s=
ense?
> >>
> >> This is hard to measure in practice. But in theory, if we can't reclai=
m
> >> cold large folios that are actually unmapped due to the racy checks, i=
t
> >> could cause cold/hot inversion (e.g., in MGLRU) and increase refaults.
> >> In extreme cases, failing to reclaim unmapped large folios could even
> >> cause OOM.
> >
> > Yeah, but the question is if it really matters in practice.
> >
> > I agree that page_mapped_in_vma() should sync properly, but the current=
 impact
> > might not be as severe.
>
> Yes, what I meant is the theoretical impact. In practice, this race is
> not easy to trigger with no real reports so far, or the impact is tolerab=
le.
>
> But I still think the fix is needed, as it matches the purpose of the
> TTU_SYNC flag.

I assume the impact comes from LRU over-protecting folios
that remain mapped after try_to_unmap().
                        try_to_unmap(folio, flags);
                        if (folio_mapped(folio)) {
                                stat->nr_unmap_fail +=3D nr_pages;
                                if (!was_swapbacked &&
                                    folio_test_swapbacked(folio))
                                        stat->nr_lazyfree_fail +=3D nr_page=
s;
                                goto activate_locked;
                        }

folios are activated -  over protected in LRU.

The racy window should be quite small in theory, so the
impact might not be that severe. There is no evidence
that it could lead to OOM.

For large folios, the impact could be greater because
we are over-protecting more memory, potentially
increasing with the folio order. For small folios, we
are only over-protecting a single 4KB page.

So perhaps the current TTU_SYNC flag for large folios
is reasonable. Baolin's patch to respect the flag,
which currently applies to large folios, also seems
reasonable, as long as we don't extend it to small
folios and introduce regressions, possibly in
map_pte()?

I'm also wondering whether we should downgrade
ACTIVATE to KEEP, which would allow racy folios to be
reclaimed sooner.

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 071a6eaef1a1..726266e49533 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1353,7 +1353,7 @@ static unsigned int shrink_folio_list(struct
list_head *folio_list,
                                if (!was_swapbacked &&
                                    folio_test_swapbacked(folio))
                                        stat->nr_lazyfree_fail +=3D nr_page=
s;
-                               goto activate_locked;
+                               goto keep_locked;
                        }
                }

Maybe it's just a silly idea, or perhaps over-engineering :-)

Thanks,
Barry
