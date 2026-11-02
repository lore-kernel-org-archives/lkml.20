Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793612839;
	b=KrIZaDZ5muFF+ki6AAFthOgHRbvVF8uOC92G5QCeqp6BF61CIf21Z/DXOXpx32fm9/QU
	 ulW9BMwLzIn7/BNs7WjJy9t1OMHklAXF0yjw+UDkx5RAvvOMMv2Uw7KEBT/OIHRjXa/9E
	 CuPbIOoZacpX3onQXYKxKgNLgB5fSyeaOhJ8GbEP6YSAktcds80+FakFIzs+ASpwAnDLM
	 zL084VG8s76jRv/Ak/nyew5etllx0xbvyz+t2GMWEA8EKXXsiCC3Q+A2UCerWR0PtEHef
	 XhixD4arRNfogD8KL86VY4cFTd5c+JZxkbenB5/ijVM9weZtG6CKvV5kC+4M0nM44eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=OIisd8STYt04AoWykShpx5GEMDUc3yZT54lWYvDNDAU=;
	b=i5U3pf01wkIutbDUKtfDZsa6J7L6971kt4nFEoUGxuMtYyDEy6OI73bJCKlwb5jyzi26
	 bVDIOgwqVusBv1v1MTiQgue5s3OcxKxTIhm1VCxXmJYOjpeDM1tHR4sHOEULcd7ZYjAGa
	 cDQFvfOCkRJjOvJlohDfkKrrVzwacqusm+fAvJwt4csnxoWgns11anVT9ACAGBGSujCLr
	 Dsjch6dwJcWZbnXBW3bpNANrofrBWt8SNpk8JUQSDI3R5HinrSBapkDdAydinFZeS450D
	 o4PrTrZaCk4YlCp2qiePOKgZEhZnB5mSMGB1ExnE/IE9i7HqAxVP0flIdFE8Ey2h80w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=cSGNuTn1;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160F3606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 160F3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=cSGNuTn1
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29Aurw923777
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 01:47:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=OIisd8STYt04AoWykShpx5GEMDUc3yZT54lWY
	vDNDAU=; b=cSGNuTn1vtxd3/KBJVATRlzaQN6/oJ2kAZiiwxMONYPaC2LoEOenq
	rRsT4iyAubqcsqfzexrMZAJBoviyClccUYZH+DOD8ByWpv4c8T53f90jbaZuhqI/
	Yu1yz7ROW4ttnJlagtNqzEgVXtHK88nCiJ6suIe7B7QoFkyAMt2MX0dbKcuRfx1t
	Ow0rFGcLH85xjdSf7PTPSMKk2QOd9fAbYOATFpw9VatOd4SOOu2EUUX+IPK0J+1n
	fSec19CFqNiSjpgT9e3gLzP2sXheg619GLaLtAKkQozT3K5MGmDF0+eZFegNFX8F
	DsHdtoxjg3xgxOEhmCxRohaQDBi0I2KzQ==
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hne108fcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:47:18 -0800 (PST)
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a615ab0c06so2684155a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793612836; cv=none;
        d=google.com; s=arc-20260327;
        b=kbKem9rDRS8khA0U2f3p+noGxehh1I+9GdsYLcnRTTMM4jHwpw9KbAU4mfuQ1iUBkV
         Wc9KMHfBqPVhyebr4z/BZ4Po3WAQVCigaUYlnwPs301yZRhfqbkvrOtKzEzU+eG8lzQQ
         QdR0hhyZNxAKMErKErCA9j8j9H/6ZenA6aEd6sm35cf7u1OfBQYXpvMaJiyQwzjOC5w9
         A6RgWL7OX96jAMgjsAsCrGn7fxVMVOo+DPZ8BygaaPxSL925mzLzmkt7rdzifGdefC8H
         5pigzS9hZRMZtkkoTlhS4dmSw6XhJMI3jNBF2nCx51Zuai5axZfHsCZ320UB06a6SupA
         xQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=kZFBqubIT/3DwescEkGovUV5S5nOjNIYh8rKkcY3QR0=;
        fh=PBiMwKRaVO83wUz/tGtLMNhw9MT5YSyOmzVhjchKXBA=;
        b=SgmwEht1o7hHjkQ51iMVzu3E5YRbX9YeMFalXAIxbiiy8A6uHWRBzBadU1TGiy5Oxj
         Uz3wa890SZfTAJV1CD+FrzBARKJk+L8c9EFuVAhD/0QSuPBXZ4RQTkIeNXu8R2qCyLsC
         30SeVAGdBMJpz8sM3CsWy8GrYE6ozo74adYP6Vap2pM8kxqDp4g+OgxXjuQWuLa2R90T
         n8RecJrqg/vma3jnFr3OtEwpV7mRkLOzL2at3x4gTV3cOO+CTTv4e8MJHNKSKql96oVW
         TSx/OVKiOzSfUWX7xiVvmPs/+ZH19FpCvAxuVddBAkF0hmUhr43Y0psrffAcJHwFAdqW
         oWtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612836; x=1794217636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZFBqubIT/3DwescEkGovUV5S5nOjNIYh8rKkcY3QR0=;
        b=NDVG9fC15d7skj+QnGF00CKzp10Ci1/iDMFJSTQjV38veYggXuJrXxdOwD8cBLrqhY
         OXxX4YLhY17V3zwryFPjSetXN9iodoKM5cB41j9z+DTqc1fgYvdHJZaUOY065WTc90yS
         12LvL/YAHYbNyR27tCx4OBYTnAMCvlMEyjDeExE7Futx+/YsX5vl3v358Eji1lwZr+a4
         IduDJvt0VlKxFXPzGFeYib/KOzX/6GHCf3RVzyGCj4Omhv4k2wuZ6lI9cNEqSG1K+MU/
         imM2DA6zPU+PUxKi7wrDMbTY22CteSq+lfoY3q9z0fNjnbd2DnVr1FRs5D2BVlvUNggr
         peJA==
X-Forwarded-Encrypted: i=1; AKwUvByE2nD17Uc8BaxpKO/x3djM9+2ujUfE7RyZHEJ8+eZ6KZIm6Ca5HysOC4UoGD3AntRH5d0kBqROG3qsH+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z1TC9HI73RYiOffU+7BTUAUD+GmGJ6UgIJSL8cYrBx47XyOrf
	lWQeGbYatMSfWejva5mMwGvhIYmJHuslbV4Tra75IT+iE05JkGeDmXXWyHR9S2kN5YAk0rh8Pyu
	HL+8nP/Yv4k+GO4f0Tl1HLFETOdp2fVzEvoIyvImmgb2MR8SAOpPrZeZsVdULcnmtqJyfjdL1je
	DOh9JtL9vHKNOSH//DA5A9BsjPV1YNWeDnQ3jPF0s=
X-Gm-Gg: AYBFou35cFTf04IuegdAkAMcAM85EAzM2Z/KHxnIYCX9H7iLZ/qBFP5XFoQQGHPc/HS
	Mk8try1dnGrqupht8SlKhxDyv8DXbDC1/wg3udi7SymX4xj1N61mSCxc3ePklD/lSm/M85yMEm1
	MFYsHnHLEOeRjBg9xwZjuYj1hk5SHDs1RKuQpfzjHfZw8dLLW/RfCnFSbRFu9g+VPogc4GVWltZ
	aHKGD35iATg+vUohg==
X-Received: by 2002:a05:6402:223a:b0:6b1:827c:af27 with SMTP id 4fb4d7f45d1cf-6b4d42901d5mr4309434a12.14.1793612831719;
        Mon, 02 Nov 2026 01:47:11 -0800 (PST)
X-Received: by 2002:a05:6402:223a:b0:6b1:827c:af27 with SMTP id
 4fb4d7f45d1cf-6b4d42901d5mr4309412a12.14.1793612831129; Mon, 02 Nov 2026
 01:47:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022145615.2184343-1-alex@ghiti.fr> <20261022145615.2184343-2-alex@ghiti.fr>
 <CAKEwX=NWVVXXU76H3V0DWsH=VDbPmGUHZXeaN1_vkz8kwJCxbw@mail.gmail.com>
In-Reply-To: <CAKEwX=NWVVXXU76H3V0DWsH=VDbPmGUHZXeaN1_vkz8kwJCxbw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Mon, 2 Nov 2026 10:46:59 +0100
X-Gm-Features: AclHuK-ko45jzQMTgG1sK5WUixbYj1ZnPkcnclUm_aBbtUmll1u_bLeL7VlXfck
Message-ID: <CAEmasaUBKwmTv4oj1V1yR+5FLMvEi+-oqzqH753N1xdm5-aP1w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] mm/swap: allocate contiguous swap slots for a
 reclaim batch
To: Nhat Pham <nphamcs@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
        Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
        Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Youngjun Park <youngjun.park@lge.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
        Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
        Lorenzo Stoakes <ljs@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FueQbGrq c=1 sm=1 tr=0 ts=6ae85c26 cx=c_pps
 a=Tczdrg5if7+wQeIJmxD/XA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=pGLkceISAAAA:8 a=Byi6NZyOV6eMvFsYz34A:9 a=QEXdDO2ut3YA:10
 a=1oAhN8tkTtOBK6_UvoHx:22
X-Proofpoint-ORIG-GUID: 020Yn8f4np7NxQGEg1UsQpWC-Qw2B9qL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX0xGgMka/Bnoa
 4xisdJjeODZz+D46Ch6ObfSk5vbV1ihXAqsQCdjaNL9TYoMGAXXSP1tTYW/ETJvQvMw0VolHhsH
 rnDnAXHJKA8MiTkWp6tZZSDktHoPToc=
X-Proofpoint-GUID: 020Yn8f4np7NxQGEg1UsQpWC-Qw2B9qL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX6KI10By1x374
 YrOBU4W6r+MYo0J1LlhuvZkrsZatPVZsjNrVDGDWfkYW/b/KAHRXUqG1Y2wnPFJ0ucqHgoqiEdq
 yiJQxi5H/mEkRHIvDKmRGq4Qu3TbOro0F2ylJuQ5QL8CCljCIHgeDCQSGiOxL9nOtjsjqjMKKHn
 dtC6fPrWE2k2oqcdvK0vhGVe2Y8UeHJRwEOrZAa0LIUrGSZHPQWUEcUkjhZx3AhjYwRT2VeoVV8
 IsmyJyqVNSsD/Gdi6vbWNnslk113OJHBN7MgbvQ1bB66cJYSfGZKct1lMBgCPfgaWI4N2qb4UO6
 vR2EhIhAIw3afT3hCcvrOJCLAUyEsamqhPtagw+OOh8VxmEo4daL4kv0a6BTZpc6xpSs0ZruBMM
 IBm7XyjuxGRbcm8oHgeQLlo9xaUhiO/3J7dmiTYHHP4HPIm/zvYON7BFI525pE1L6jfHvJdF3NN
 TJuX0Zhe+ibZ7hZG33w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01

Hi Nhat,

On Fri, Oct 23, 2026 at 6:05=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote:
>
> >
> On Thu, Oct 22, 2026 at 7:57=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
> >
> > Reclaim allocates swap slots one folio at a time and only then batches
> > the writes, merging folios whose slots happen to be contiguous. Order-0
> > allocations scan the nonfull clusters before taking a free cluster, so
> > once frees have left holes in otherwise full clusters, a batch of LRU-
> > adjacent folios is scattered over those holes and written with many
> > small requests. Since swap slots are freed on exclusive write faults,
> > this happens with any workload that rewrites swapped out memory.
> >
> > Before swapping out a batch, record how many pages of each small order
> > need a slot, and make those allocations follow contiguous free slots,
> > SWAP_CLUSTER_MAX at a time: in a nonfull cluster if one has them,
> > otherwise in a free cluster. When neither has them, the rest of the
> > batch fills the holes as before. Nothing is reserved.
> >
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>
> Thanks for looking into this! There are still workloads that benefit
> more from disk swapping than compression swapping... We should make
> the swap subsystem work for them.
>
> I haven't read the code too closely, as it's an RFC meant to show the
> general idea. So I'll just make some comments and ask some questions
> about the idea:
>
> >  static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
> >                                          struct swap_cluster_info *ci,
> >                                          struct folio *folio,
> > @@ -1042,6 +1079,59 @@ static unsigned int alloc_swap_scan_list(struct =
swap_info_struct *si,
> >         return found;
> >  }
> >
> > +/* Larger folios already make large enough write requests on their own=
 */
> > +#define SWAP_BATCH_MAX_ORDER   (ilog2(SWAP_CLUSTER_MAX) - 1)
>
> Ah so we don't invoke this heuristics for folio larger than certain
> orders? Makes sense.

Yes, large folio get their own allocation scheme, here the idea is to
"pack" small folios, I'll add that to the changelog.

>
> > +
> > +static inline unsigned int swap_batch_contig(unsigned int left)
> > +{
> > +       return min_t(unsigned int, left, SWAP_CLUSTER_MAX);
> > +}
> > +
> > +/*
> > + * Like alloc_swap_scan_list(), but only allocate at the start of @nr_=
contig
> > + * free slots. Order 0 clusters without them move to the frag list unt=
il a
> > + * slot is freed, larger orders stay nonfull as the folio may still fi=
t.
> > + */
> > +static unsigned int alloc_swap_scan_list_contig(struct swap_info_struc=
t *si,
> > +                                               struct list_head *list,
> > +                                               struct folio *folio,
> > +                                               unsigned int nr_contig)
> > +{
> > +       unsigned int found =3D SWAP_ENTRY_INVALID, order =3D folio_orde=
r(folio);
> > +       struct swap_cluster_info *ci;
> > +       unsigned long start, offset;
> > +       LIST_HEAD(skipped);
> > +
> > +       while ((ci =3D isolate_lock_cluster(si, list))) {
> > +               start =3D cluster_offset(si, ci);
> > +               offset =3D SWAP_ENTRY_INVALID;
> > +               if (SWAPFILE_CLUSTER - ci->count >=3D nr_contig)
> > +                       offset =3D cluster_find_free_contig(ci, start,
> > +                                                         start + SWAPF=
ILE_CLUSTER,
> > +                                                         1 << order, n=
r_contig);
> > +               if (offset =3D=3D SWAP_ENTRY_INVALID) {
> > +                       if (order)
> > +                               move_cluster(si, ci, &skipped,
> > +                                            CLUSTER_FLAG_NONFULL);
> > +                       else
> > +                               relocate_cluster(si, ci);
> > +                       swap_cluster_unlock(ci);
> > +                       continue;
> > +               }
> > +               found =3D alloc_swap_scan_cluster(si, ci, folio, offset=
);
> > +               if (found)
> > +                       break;
> > +       }
> > +
> > +       if (!list_empty(&skipped)) {
> > +               spin_lock(&si->lock);
> > +               list_splice_tail(&skipped, list);
> > +               spin_unlock(&si->lock);
> > +       }
> > +
> > +       return found;
> > +}
> > +
> >  static void swap_reclaim_full_clusters(struct swap_info_struct *si, bo=
ol force)
> >  {
> >         long to_scan =3D 1;
> > @@ -1109,6 +1199,7 @@ static unsigned long cluster_alloc_swap_entry(str=
uct swap_info_struct *si,
> >         struct swap_cluster_info *ci;
> >         unsigned int order =3D likely(folio) ? folio_order(folio) : 0;
> >         unsigned int offset =3D SWAP_ENTRY_INVALID, found =3D SWAP_ENTR=
Y_INVALID;
> > +       unsigned int left;
> >
> >         /*
> >          * Swapfile is not block device so unable
> > @@ -1129,7 +1220,14 @@ static unsigned long cluster_alloc_swap_entry(st=
ruct swap_info_struct *si,
> >                 if (cluster_is_usable(ci, order)) {
> >                         if (cluster_is_empty(ci))
> >                                 offset =3D cluster_offset(si, ci);
> > -                       found =3D alloc_swap_scan_cluster(si, ci, folio=
, offset);
> > +                       /* The batch's contiguous slots are used up */
> > +                       if (likely(folio) &&
> > +                           this_cpu_read(percpu_swap_cluster.batch_lef=
t[order]) &&
> > +                           !cluster_slots_free(ci, offset, 1 << order))
> > +                               swap_cluster_unlock(ci);
> > +                       else
> > +                               found =3D alloc_swap_scan_cluster(si, c=
i, folio,
> > +                                                               offset);
> >                 } else {
> >                         swap_cluster_unlock(ci);
> >                 }
> > @@ -1148,6 +1246,21 @@ static unsigned long cluster_alloc_swap_entry(st=
ruct swap_info_struct *si,
> >                         goto done;
> >         }
> >
> > +       /* Keep a reclaim batch on contiguous free slots, not in small =
holes */
> > +       left =3D likely(folio) ?
> > +              this_cpu_read(percpu_swap_cluster.batch_left[order]) : 0;
> > +       if (left && order < PMD_ORDER) {
> > +               found =3D alloc_swap_scan_list_contig(si, &si->nonfull_=
clusters[order],
> > +                                                   folio, swap_batch_c=
ontig(left));
> > +               if (found)
> > +                       goto done;
> > +               found =3D alloc_swap_scan_list(si, &si->free_clusters, =
folio, false);
> > +               if (found)
> > +                       goto done;
> > +               /* No contiguous slots left, allocate the rest of the b=
atch as usual */
> > +               this_cpu_write(percpu_swap_cluster.batch_left[order], 0=
);
> > +       }
> > +
> >         if (order < PMD_ORDER) {
> >                 found =3D alloc_swap_scan_list(si, &si->nonfull_cluster=
s[order], folio, true);
>
> So we prefer non-full clusters with contiguous slots, over free
> clusters, over other nonfull clusters.
>
> I think this part makes sense to me FWIW. We do skip fast path and go
> for slow paths more often, so do make sure we're not paying with too
> much lock contention, especially as the swapfile fils or get more
> fragmented (which this patch series does nudge us towards). But FWIW,
> we pretty much go back to the old behavior the moment we fail to find
> contiguity for the first time in the batch, so I think we'll be
> fine...?

I'll check the lock contention, thanks.

>
> >                 if (found)
> > @@ -1390,7 +1503,15 @@ static bool swap_alloc_fast(struct folio *folio)
> >         if (cluster_is_usable(ci, order)) {
> >                 if (cluster_is_empty(ci))
> >                         offset =3D cluster_offset(si, ci);
> > -               alloc_swap_scan_cluster(si, ci, folio, offset);
> > +               /* The batch's contiguous slots are used up */
> > +               if (this_cpu_read(percpu_swap_cluster.batch_left[order]=
) &&
> > +                   !cluster_slots_free(ci, offset, 1 << order)) {
> > +                       swap_cluster_unlock(ci);
> > +                       this_cpu_write(percpu_swap_cluster.offset[order=
],
> > +                                      SWAP_ENTRY_INVALID);
> > +               } else {
> > +                       alloc_swap_scan_cluster(si, ci, folio, offset);
> > +               }
> >         } else {
> >                 swap_cluster_unlock(ci);
> >         }
> > @@ -1729,6 +1850,86 @@ static int swap_dup_entries_cluster(struct swap_=
info_struct *si,
> >         return err;
> >  }
> >
> > +static void swap_alloc_prepare(unsigned int order, unsigned int nr)
> > +{
> > +       unsigned int nr_contig =3D swap_batch_contig(nr);
> > +       struct swap_cluster_info *ci;
> > +       struct swap_info_struct *si;
> > +       unsigned long offset;
> > +       bool keep =3D false;
> > +
> > +       local_lock(&percpu_swap_cluster.lock);
> > +       if (nr <=3D (1 << order)) {
> > +               this_cpu_write(percpu_swap_cluster.batch_left[order], 0=
);
> > +               goto out;
> > +       }
> > +       this_cpu_write(percpu_swap_cluster.batch_left[order], nr);
> > +
> > +       /* Keep the cursor if enough free slots follow it */
> > +       si =3D this_cpu_read(percpu_swap_cluster.si[order]);
> > +       offset =3D this_cpu_read(percpu_swap_cluster.offset[order]);
> > +       if (si && offset && get_swap_device_info(si)) {
> > +               ci =3D swap_cluster_lock(si, offset);
> > +               if (cluster_is_usable(ci, order)) {
> > +                       if (cluster_is_empty(ci))
> > +                               offset =3D cluster_offset(si, ci);
> > +                       keep =3D offset % SWAPFILE_CLUSTER + nr_contig =
<=3D
> > +                              SWAPFILE_CLUSTER &&
> > +                              cluster_find_free_contig(ci, offset,
> > +                                                       offset + nr_con=
tig,
> > +                                                       1 << order,
> > +                                                       nr_contig) =3D=
=3D offset;
> > +               }
> > +               swap_cluster_unlock(ci);
> > +               put_swap_device(si);
> > +       }
> > +       if (!keep)
> > +               this_cpu_write(percpu_swap_cluster.offset[order],
> > +                              SWAP_ENTRY_INVALID);
> > +out:
> > +       local_unlock(&percpu_swap_cluster.lock);
> > +}
> > +
> > +/**
> > + * folio_alloc_swap_prepare - prepare swap allocation for a reclaim ba=
tch
> > + * @folios: list of folios reclaim is about to swap out
> > + *
> > + * Record how many pages of each small order the batch will swap out, =
so
> > + * that their slots are allocated contiguously. Nothing is reserved.
> > + */
> > +void folio_alloc_swap_prepare(struct list_head *folios)
> > +{
> > +       unsigned int max_order =3D min(SWAP_BATCH_MAX_ORDER, SWAP_NR_OR=
DERS - 1);
> > +       unsigned int nr[SWAP_BATCH_MAX_ORDER + 1] =3D {};
> > +       struct folio *folio;
> > +       unsigned int order;
> > +
> > +       if (!total_swap_pages)
> > +               return;
> > +
> > +       list_for_each_entry(folio, folios, lru) {
> > +               if (!folio_test_swapbacked(folio) || folio_test_swapcac=
he(folio))
> > +                       continue;
> > +               order =3D folio_order(folio);
> > +               if (order <=3D max_order)
> > +                       nr[order] +=3D 1 << order;
> > +       }
> > +
> > +       for (order =3D 0; order <=3D max_order; order++)
> > +               swap_alloc_prepare(order, nr[order]);
> > +}
> > +
> > +/**
> > + * folio_alloc_swap_split - account for a large folio split by reclaim
> > + * @nr_pages: number of order-0 folios the split produced
> > + */
> > +void folio_alloc_swap_split(unsigned int nr_pages)
> > +{
> > +       local_lock(&percpu_swap_cluster.lock);
> > +       this_cpu_add(percpu_swap_cluster.batch_left[0], nr_pages);
> > +       local_unlock(&percpu_swap_cluster.lock);
> > +}
> > +
> >  /**
> >   * folio_alloc_swap - allocate swap space for a folio
> >   * @folio: folio we want to move to swap
> > @@ -1771,6 +1972,12 @@ int folio_alloc_swap(struct folio *folio)
> >         local_lock(&percpu_swap_cluster.lock);
> >         if (!swap_alloc_fast(folio))
> >                 swap_alloc_slow(folio);
> > +       if (folio_test_swapcache(folio)) {
> > +               unsigned int left =3D this_cpu_read(percpu_swap_cluster=
.batch_left[order]);
> > +
> > +               this_cpu_write(percpu_swap_cluster.batch_left[order],
> > +                              left > size ? left - size : 0);
> > +       }
> >         local_unlock(&percpu_swap_cluster.lock);
> >
> >         if (!order && unlikely(!folio_test_swapcache(folio))) {
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index ea2d4c8d1890..86245036872c 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -1175,6 +1175,8 @@ static unsigned int shrink_folio_list(struct list=
_head *folio_list,
> >         memset(stat, 0, sizeof(*stat));
> >         cond_resched();
> >         do_demote_pass =3D can_demote(pgdat->node_id, sc, memcg);
> > +       if (sc->gfp_mask & __GFP_IO)
> > +               folio_alloc_swap_prepare(folio_list);
> >
>
> Some general questions:
>
> 1. How many pages in folio_list typically do get reclaimed? There can
> be quite a few with references, which we rotate/promote, when we scan,
> right? Would constantly overshooting the estimate create problem down
> the line?
>

I need to trace some live hosts, I'll get back with numbers.

> (This is one of the few places where indirection (vswap) would have
> helped - we can collect a batch of pages after unmapping, then pass
> them to the phys swap allocator (after checking zswappability, etc.).
> Maybe we can solve it better after it's landed, and accept an
> imperfect solution for now?)
>
> 2. Should we skip this heuristics for cgroups that enables zswap (and
> maybe zram)? Contiguity matters less there... unless it help at
> writeback time? Hard to say without experimentation - maybe you can do
> the same check you did for your zswap writeback batching patch series?
>

I was wondering the same, I'll check how it impacts zswap + writeback.

Thanks!

Alex
