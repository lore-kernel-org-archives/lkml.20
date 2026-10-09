Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6E5547065
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526900; cv=fail; b=Y0bwcNGPKEVAdK7GAZ7AItLnYGcvJKiw3MoAXmYDsKN2liKbHQTZomoZUop+t+52y9J3Y4CmGOR4qkaU4otryO65zr2KnMdIyKiwyCeLVUJBBjDUhdUcC215ifFJ3BeRdM17nZzfpdzAG08L75wWfXLlitsTwfKwvQdZbmQIH4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526900; c=relaxed/simple;
	bh=jp4Yr9Jexy6E9oa4b3cUGJZjlEMB6XY2u2WokueIZcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLD8D74n+BQmd7Cc8NNNjSF2FEtwYiJe6S3+jR8iFX5ugvPonqThrj5cXLD+hVECu7cS3lnGkVeUru0DN1ihWvYsRteUJNa1lDxrLGqCIHCl8tiEDfKR5S3b2+iPDyNJbMwvbwvyNQEawauMckqqE6Y/kwPKnihKGKux+eTeHPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=iaT8XOEs; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="iaT8XOEs"
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993JEqb3953428
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 23:21:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=CaABAWmrmfeC0SrN4QFEmF0a1FSyEnSSctRb+
	pjY1mg=; b=iaT8XOEs5nMBNyXYmG7LMLJhle2r5WJ9AJxCeC+0pCdr5z/DHCnVV
	GvGxBoStC6gW0hn1pOaJnfbzHQQuq/WobCVvFztxjzIax21ca2fNOJbaqPaZQfP8
	YjI3iPRdvXfpeLlsTU9PWgVOeYqhQjCnnMoGpM74ZQGRklH7Ck7Reiv/d+uyrQdO
	eSgLtlBOyfjv7V7pV9DZP8Sdm1BM6YpO2ClRepr65nKJuPaTAWUM3TACGD1+fQW2
	MzqL9587tuHLplXrbQs4JxyKDvHlEswBCIUN0Rxiwo33ssPXQsiyoGwsgEcTklNB
	gmDH2YLsbCLWMTGssbALvhnzh2si9v+iQ==
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4h6pr49kd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:21:37 -0700 (PDT)
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2e385c2586so695232966b.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791526896; cv=none;
        d=google.com; s=arc-20260327;
        b=EDR6mi7Qcdjsk4eHjB1qmX8dP1t9BJli6OmoO17MeoZby5F+QVeAZ/wC4uTe/8Qj2k
         1J/LRrj+GHPh4RfGIVLTfb4/mlaxamE3i+fq5gpkcMbAI8dD44uf9z2vKNR4F1BkYqDr
         RisLnuWVbEXfaVvt/08vUgUKEPNCT5KY+/wLcOLjrXAWED/47gFNRzHQmTF0uB6nCwx8
         nIRXg3DeTgjKkOzAneKmUyAR3ttfalmQUSzo/euQOJodG3hoxacKbJ7hRj+25EXkb6nX
         uj//NnPmPHl190lXLG3AQA5tnzwKfx6FXm+WbmcuhCzCU2Nfe7WnkdzYPd8PDsm/aSSv
         8YIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=JsKDox/DOR17cT5dHGriseWRFApPYTjGYYWCVV6YZrs=;
        fh=SoGHtOl3UXTBGWrDjZcLQGuYauSbPwGoRrJn5C9ryBo=;
        b=ZwjVa0vYXHvBOiEmlVQbJlk4+BIdfV6MlKxebqCRhy2+WO+pyiNs3SI/F5rQAXh2tR
         5cFTQdS+yhcbV4VwlEEX0umqNHlV6cLQKr8AxYAYLFJzDwhRuOvXfrVgTEQOQkAbu8uH
         8ZXEW9Ctm5/lWRXXRXkk3o/WVOwBoKR0s0V/vPI/GgUT4mxq5cH8hmtTVbWQo048sPk/
         k5WYk3wpb1Nx44pqiQyY0III+XQTnouuKxNU5PsuKOCsf5t9dJVKt302bambkmh/vhY4
         Nlxzh4UuXDvee2DTrH51ReeTvDuCkhNz9nU3VeKU7hY1d/PbV3h10HSyZdqlKeF7bCM3
         A9vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526896; x=1792131696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsKDox/DOR17cT5dHGriseWRFApPYTjGYYWCVV6YZrs=;
        b=M36oMRj0NPjOSHW59YPaUoRQvXHqd4gECD9QseDAXGkJhHBUhy7u6sYSYnsAccMU5k
         41RBRXYPRvRVkcqdUXCmnUxQWSCdQP9yWJftAakK5hGARExHiYcR9f3dmUE5feocZ6lu
         DTzPOia86p+zE7U89iF7j1uyTigkMJcLoUdVwE28Re4aNH7RtDLGNTN4PB91jy0QLvKL
         7JQ/MC1OxDtU0PyTO3cF4P1gnboXXSHk2l6fC0rlHoQLeYuTlsyV4wq42FVw/J/SdhTX
         AmUurtixuJ/ZbChYDD4lEoPCkgkjJYYZlBNSmcFI0n1jFYZyqBJMdiq+seYKeJod2wbW
         QLAg==
X-Forwarded-Encrypted: i=1; AKwUvBwUhnPg5Nme1utzDzK9snsDKO25b+KNtZ7OML3a4idi8EfdtYMTG5lyHISY0Q99L9hE8Uu+8qzddgjiUEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJy3Pp5yuF/B0430pejMSw9gTmkqf4ZpSnq9pPHEwASgQlbO8mb
	6kOTmAi18FB7/N6p1itYVXz+aUzyD+gc222FYwMHpXCuWOLwTwVEzGwOuwl0u9UKGJUUcezg/46
	yvDRmhiEcINnFm+5P6FhvUVFnImQgafgmx4CrqSLZC3bb6lAVAhk5oa5MvcKRPZb99VB/ccl2rO
	xWzRYABWg0/8gCHtT8IWBHVzc6VZ4k416aCnWhliE=
X-Gm-Gg: AYBFou3yh64RPKcKoc0SrAJmRGjW6P/bw8Vq/0NLTbJU7vqKTeczFu+lm+oSlB6oA8A
	6YZXitnyXv+zW3VqC/qKYTn/44bRx9adw/OJf5lLOENjZe91XxkrIW1rhBnF9vMErLXFvZnpRj2
	iN93hDaGWxMMqOY2ReSTOxmUc8+JN02k9e3SsgHVAX9XaJyRFetAwKEktkmwiB5uhEwo7cIgFUN
	Qpu4ixTEUdU9HWCuA==
X-Received: by 2002:a17:907:d8b:b0:c21:180c:d82d with SMTP id a640c23a62f3a-c31aa006731mr90680866b.20.1791526896262;
        Thu, 08 Oct 2026 23:21:36 -0700 (PDT)
X-Received: by 2002:a17:907:d8b:b0:c21:180c:d82d with SMTP id
 a640c23a62f3a-c31aa006731mr90678166b.20.1791526895838; Thu, 08 Oct 2026
 23:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <CAO9r8zMHKmAQT8WBAd+kkQEjETVvyHhfbESzKHpXXPQJUB9nVw@mail.gmail.com>
In-Reply-To: <CAO9r8zMHKmAQT8WBAd+kkQEjETVvyHhfbESzKHpXXPQJUB9nVw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Fri, 9 Oct 2026 08:21:23 +0200
X-Gm-Features: AclHuK_ofVrPNacPxpsIYVVCE3Ue6MuHcG8aof-vcNnWTyl8bOgx_1bILK5lleA
Message-ID: <CAEmasaUijhEyxTL=ODsjA4ik1ZuE4y0kh700NKGta5LDH8nqUA@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Yosry Ahmed <yosry@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Kairui Song <kasong@tencent.com>,
        akpm@linux-foundation.org, hannes@cmpxchg.org, nphamcs@gmail.com,
        shikemeng@huaweicloud.com, baoquan.he@linux.dev, youngjun.park@lge.com,
        chengming.zhou@linux.dev, david@kernel.org, ljs@kernel.org,
        liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, ryncsn@gmail.com,
        chrisl@kernel.org, baohua@kernel.org, usama.arif@linux.dev,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 3bobdRXhulT-UqyeiBg4YpOdUFyD2sD4
X-Proofpoint-GUID: 3bobdRXhulT-UqyeiBg4YpOdUFyD2sD4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfXyG3dgo1mc+V9
 9rjv+Y47RCqDIJCnyYteSP+FPOJ7j2zUUhCQPp7WcpZ76fPodd+UMMUd9UFpT8Ycc1xrMG3w+q6
 W8ORXzmQxUE5PW8ANFSDJzYR6+a4tUo=
X-Authority-Analysis: v=2.4 cv=NoVE4MdJ c=1 sm=1 tr=0 ts=6ac887f1 cx=c_pps
 a=D+UBI74RbQA8i2EYnbuvxw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=kkcUborcUVj0H7zxAXTl:22
 a=OGjWj8McAAAA:8 a=VwQbUJbxAAAA:8 a=EsdWce9n9fk95wY-pwkA:9 a=QEXdDO2ut3YA:10
 a=PsfoTyiJ_72bb7xyA04f:22 a=UYjydHh6ynBBc6_pBLvz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX/E0WlvpucDQP
 Bqjp1+kPpP3BPGhXkgltFp/GcdXQTvUE2fPQtuX+3CaNWXcboPWvtLHuWCQ48zU0fwXs0ty/6Bt
 gvzlGyJHCIqW14MnIkKEqB9j/90lO4MgtOnlC5AULVg7itrlWbyNh1+U6pgebTMqZJkPSGDZdkh
 D7x2OXQTqDQE7ZBA3U4YHs4NsRsWXgxXoNXmnXrz7ZHT54uzoe9B+LjkMHmXnJMtgtgtI7vrG78
 POquu/e3BMbKVoxYwoaVvtfJK6V8ohDCifu4/SfR7FAEpJhnOiY8ncPvwYJ78f2it3fIorqAvDi
 vBN0baQB8vDh2HBSsc6ob05Nzb4B+m1EQW+mMDN3uexnLOLKH+Tx8aWI+YbHzZoNAghsKL7a8Un
 3TxLyYOOdedy5i3Y4qKisQVR6dd+0QEe2X1sr+lOsoYoJsb8UHr/VDnFjms89DFgmWuDXy9ScPM
 ZbWsOdxvy6YNRqa0lZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01

Hi Yosry,

On Wed, Oct 7, 2026 at 11:37=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> >
> On Wed, Oct 7, 2026 at 8:39=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wr=
ote:
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
>
> No objection here, I am just thinking about Kairui's LPC presentation
> about how compressed swap can (in theory at least) still benefit from
> readahead: https://urldefense.com/v3/__https://lpc.events/event/20/contri=
butions/2421/attachments/2116/4689/Better*20Anon*20(Swap)*20Readahead*20(2)=
.pdf__;JSUlJQ!!Bt8RZUm9aw!4SSWs97-L1JNciWpQqvSw5xpIAUSZorWG4UrxCy7RYlUbAY1n=
jEfPPH-OBH8Ny1fqOOB7TpHMM2-$ .
>
> Seems like a big portion of the fault cost is still outside of
> decompression and can benefit from readahead, but that isn't the case
> today. I assume any future improvements to readahead and re-enabling
> for zram would also cover zswap?
>

I'll follow Kairui's work and ensure zswap stays aligned with zram.

Thanks,

Alex


> >
> > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > ---
> > Changes in v3:
> > - Go back to the RFC's single patch: readahead windows that mix zswap
> >   and disk entries will be dealt with later, the priority is to merge t=
he
> >   zswap readahead bypass
> > - Move the check into a swap helper, swap_entry_synchronous(), instead
> >   of open-coding it in do_swap_page() (David)
> > - Bail out early when zswap was never enabled or the tree is empty, so
> >   disk-only systems pay a static branch (Kairui, Nhat)
> > - Reuse zswap_is_present() rather than adding zswap_present_test()
> >   (Yosry)
> > - Rebase on mm-new
> >
> > Changes in v2:
> > - Keep readahead, but overlap the decompression of zswap neighbours with
> >   the disk I/O of the window, and bypass it when the target needs no
> >   disk I/O (Yosry, Nhat, Barry)
> >
> > v2: https://lore.kernel.org/all/20260722163536.773166-1-alex@ghiti.fr/
> > RFC: https://lore.kernel.org/all/20260624075700.751467-1-alex@ghiti.fr/
> >
> >  include/linux/zswap.h |  6 ++++++
> >  mm/memory.c           |  4 ++--
> >  mm/swap.h             | 25 +++++++++++++++++++++++++
> >  mm/zswap.c            |  5 ++++-
> >  4 files changed, 37 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/zswap.h b/include/linux/zswap.h
> > index df6cafbe95dc..94746fb71bb6 100644
> > --- a/include/linux/zswap.h
> > +++ b/include/linux/zswap.h
> > @@ -35,6 +35,7 @@ void zswap_lruvec_state_init(struct lruvec *lruvec);
> >  void zswap_folio_swapin(struct folio *folio);
> >  bool zswap_is_enabled(void);
> >  bool zswap_never_enabled(void);
> > +bool zswap_is_present(swp_entry_t entry, unsigned int nr);
> >  #else
> >
> >  struct zswap_lruvec_state {};
> > @@ -73,6 +74,11 @@ static inline bool zswap_never_enabled(void)
> >         return true;
> >  }
> >
> > +static inline bool zswap_is_present(swp_entry_t entry, unsigned int nr)
> > +{
> > +       return false;
> > +}
> > +
> >  #endif
> >
> >  #endif /* _LINUX_ZSWAP_H */
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 330cde31bf8b..396bc71a265f 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -5030,8 +5030,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >         if (folio)
> >                 swap_update_readahead(folio, vma, vmf->address);
> >         if (!folio) {
> > -               /* Swapin bypasses readahead for SWP_SYNCHRONOUS_IO dev=
ices */
> > -               if (data_race(si->flags & SWP_SYNCHRONOUS_IO))
> > +               /* Swapin bypasses readahead for SWP_SYNCHRONOUS_IO dev=
ices and zswap */
> > +               if (swap_entry_synchronous(si, entry))
> >                         folio =3D swapin_sync(entry, GFP_HIGHUSER_MOVAB=
LE,
> >                                             thp_swapin_suitable_orders(=
vmf) | BIT(0),
> >                                             vmf, NULL, 0);
> > diff --git a/mm/swap.h b/mm/swap.h
> > index d5bf21f517dc..b8181bd056ee 100644
> > --- a/mm/swap.h
> > +++ b/mm/swap.h
> > @@ -94,6 +94,7 @@ static inline int mem_cgroup_swappiness(const struct =
mem_cgroup *memcg)
> >
> >  #ifdef CONFIG_SWAP
> >  #include <linux/swapops.h> /* for swp_offset */
> > +#include <linux/zswap.h> /* for zswap_is_present */
> >  #include <linux/blk_types.h> /* for bio_end_io_t */
> >
> >  static inline unsigned int swp_cluster_offset(swp_entry_t entry)
> > @@ -336,6 +337,24 @@ struct folio *swapin_sync(swp_entry_t entry, gfp_t=
 flag, unsigned long orders,
> >  void swap_update_readahead(struct folio *folio, struct vm_area_struct =
*vma,
> >                            unsigned long addr);
> >
> > +/**
> > + * swap_entry_synchronous - check if @entry is read synchronously
> > + * @si: the swap device of @entry
> > + * @entry: the swap entry
> > + *
> > + * SWP_SYNCHRONOUS_IO devices and zswap complete a read in the faulting
> > + * context, so swap readahead has no asynchronous I/O to overlap.
> > + *
> > + * Context: The caller must hold a reference on @si. The answer is a h=
int: the
> > + * entry can be written back from zswap or freed concurrently.
> > + */
> > +static inline bool swap_entry_synchronous(struct swap_info_struct *si,
> > +                                         swp_entry_t entry)
> > +{
> > +       return data_race(si->flags & SWP_SYNCHRONOUS_IO) ||
> > +              zswap_is_present(entry, 1);
> > +}
> > +
> >  #else /* CONFIG_SWAP */
> >
> >  static inline struct swap_cluster_info *swap_cluster_get_and_lock(
> > @@ -423,6 +442,12 @@ static inline void swap_update_readahead(struct fo=
lio *folio,
> >  {
> >  }
> >
> > +static inline bool swap_entry_synchronous(struct swap_info_struct *si,
> > +                                         swp_entry_t entry)
> > +{
> > +       return false;
> > +}
> > +
> >  static inline int swap_writeout(struct swap_io_ctx *ctx, struct folio =
*folio)
> >  {
> >         return 0;
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index eb3494491410..1dcf77d5edae 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -1605,12 +1605,15 @@ bool zswap_store(struct folio *folio)
> >   * change under it.
> >   * Return: true if at least one slot in the range is in zswap.
> >   */
> > -static bool zswap_is_present(swp_entry_t entry, unsigned int nr)
> > +bool zswap_is_present(swp_entry_t entry, unsigned int nr)
> >  {
> >         pgoff_t offset =3D swp_offset(entry);
> >         struct xarray *tree =3D swap_zswap_tree(entry);
> >         unsigned long index =3D offset;
> >
> > +       if (zswap_never_enabled() || xa_empty(tree))
> > +               return false;
> > +
> >         /*
> >          * A pinned range is at most SWAPFILE_CLUSTER slots and is alig=
ned to
> >          * its own size, so one tree covers all of it and a single look=
up is
> > --
> > 2.53.0-Meta
> >
> >
>
