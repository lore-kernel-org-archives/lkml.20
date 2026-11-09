Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794214861;
	b=vw/0ys5Z16hZSsDN55vhlb/ymCmPonq91502evG4rQXzifx6Dt06FgWvfrcbsFg3QbVu
	 qqGdUL3RTf+hB9NyxBcT6ca/7TPjic/iYvRk/T5oO7dCVKPzgGqmsfZNWCrbQWfeHCcyw
	 pUn2lKBmuD95sSP3k04Q3nKojpvy69evOGVrhJZcLeZvXo3//Keuwu5bw7Xnbd45unXpl
	 yvYWqP6auImfjdqKKZBvTaq0tSwm6i4xHXNp+/NRVc3aXUKJhuG3GaBO7HM9q0ICuv7ak
	 O4nADX/HOwIw4X8e20PgZ8dEz7HllJQnVxvYKM2F9uvnY65gR7DyDhfnsHJsk4qY9Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214861;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=aGKPnMP7yr4BMoPOEmIDmmSXGXNWsODfdfYLctRx5Ao=;
	b=ykiT8+1Rzc/WPHWxDhtn4bg7Yu11hkhfKJ30NfvLnmwth/6eHAF8vK1/3DH4Fgxqk/hB
	 4UQ3kosi2fIE+CYCxxfZ91dBBfXJA0/PLL3swJFUywWlvJQpjkozKVUYrJ8hTCXnbZiEa
	 uGr/wl+YRLO/hUhpOBXT9EYCQyU6/sClm1SZNuq/xpfuySIUx3obPtYQj7DUQhk1IlZUI
	 c2iaeDf1PPVgEQ9mlJrQhBWwUv8wmJbIlSIJEh9WvvE2OIEw9ZnoMWgWaQgmPufcZgvPt
	 flETcMvHPDW7gRuH2z2EedAVr1FEqmmcTm1sb/NoD2FFnpeNC1/ldhS07jMt2Z5HS+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=HsbYA4dj;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B848606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B848606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=HsbYA4dj
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969PHJ3948250
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 01:00:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=aGKPnMP7yr4BMoPOEmIDmmSXGXNWsODfdfYLc
	tRx5Ao=; b=HsbYA4djDQfVaQls/x0VgtOBrgMu7I0Hc1iZI5ylUZHer7XCof170
	B8lvJvAkOy65ES31k5GEiaMUoNRmz0Y1tvSBgPTqxXSPK15KlpG5u67DTDttmFXp
	Hz4vgwnVyBlcwDxrA2qTCXlm1MIevHw09ufTTCiRb796oaX1QyxrepgfvwBJJfmd
	RtmzSoL0ASBQnG9s/kjTaS+llLhwh4hl2n1HvGjREF/q/aWRvBx4EvPYcmrItMNi
	ZKnrq4G0pxs3WSrgmDca4fU2lIzYfq0myQIyltlhBq69pcK1wVSVPZNlNJ3WfoNy
	rWplG9A31LMsm/Yi/0c6jM8gXYzL6poZA==
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ht2j4yta7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:00:59 -0800 (PST)
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b70b9f6e0aso870665a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794214858; cv=none;
        d=google.com; s=arc-20260327;
        b=SpSuRa4EX+01HR6uWXoq9HsENQVoE8C5r33KJrLsn1JjhKT50ax36mE2TvlMCGPM/q
         +a5ejVhyjoPJFDhFKCcqeb7fa89axp5KONfvD34DTl8boRlBpUGxoPXQjxRDghlmlKVf
         H3pEJO/Ylv+b24cGyfnFLwtV6gWF9zOCdYZ6x0JGjFazGzbcFaC+DLvJyM8BO/FGIiu8
         agqs6S58shocwUwblf7HbYV9jS+J3znL+wcu+nQhcqlGlrEZ2AZM4mKE6b6jI318qX9n
         4L3O32cl8tohhNXfGdFbt+MqJjaAwOLIWzyPN/S1nzFjmeqhxvfhVLvrpAb/rFVlVJ8F
         sXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=L+Abc+o3UsjAvdE8ThoMmoPSZoSa5JS86C+NXnhGLvc=;
        fh=MuXkm56LYAwv/jnMeBxufFOA3OrThEuM01ZISScDGoY=;
        b=RI2Gq4R5jn09f7uUc4FKKAxa3kv3ZAJz+3+1Ib70B0ynRFdo7C/Q+G3PixmqY4Uv/i
         +lgh0kEgL4iaFVLgqxOIm11kOlppVSseQDBlTi/6sAu1UM+XI3vpmJWFbqzVaDKxCa9O
         uSLndXk0OOvq2Q82TEHQwNF/c03jdMc9lFqlt5xwh/B2DRmfNufrMDzY59Dgq7v7mZ20
         10dAmrP8xHtyOVllJolNFchTPs0TO22qijbF4jJvsFDy6RC5EWLAyz8q2v9dT9wGXFmm
         2y8pc6p6FqOiAyyy3Nm7NEN7dHupVwu9A8s+3TGr9fFyIO0NNAR/Vj+fAUNi0l4KaM0a
         sIsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214858; x=1794819658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+Abc+o3UsjAvdE8ThoMmoPSZoSa5JS86C+NXnhGLvc=;
        b=DJR6A+ofuyp6UoJrw+HMg9fWKIp2Lw6XhyZofJw+rxXa3dU8/WNr/7f0UDJzk62V+0
         DqUOR79jkl7YlzBbNThQcXt+Q2CVYtepzbhBCpP+95Z21zRPdJ1RcfV1Jk4w3g/v2z5j
         FDV/GibmnwJ8URG66JQmI0MEUj+gLtMNUfdZuMtTanR6UmHkAXFhj2kdK9cUdONlNPhH
         QIfmoEpD0dVuVjB9cu8DDR5vwMVW36xC7Od1Rgb2swx/aX35FopcsH7BplW/pmtorzBe
         r++MIH8MA1jhT/v/MObA//zGSlXhz28QK7xEt895sjdNpfnTxDIEMDEPGUNzki7iSbdr
         bkOw==
X-Forwarded-Encrypted: i=1; AL+hErGLOfEqn1XJLPA4TRyO4W52k70Sc6I+r/o530JJWA5bWCI7BHU+NLxm5Z8IThwiTlQIEoOY/KfSdvh6C1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+948BsoQ7mfHPyZyDmVvZUwDzDEbbLH9+8RmSP37Piwpg1WiRD
	Fii5m4i6yRN7zI3agp03lPGUhOd7Pi6eSg28xAMUlI9I31aQ60jIw54zcEy4od3Kxj5VxKGP0pD
	aaDu5Y8Y3WIm9qI7dIauvVsHP+Pt+jY7hWUcz43QwBZbypssS2qS6wpLhzxZeWraKnc1Z8HNsoG
	/sP0duTJClJAiV1VXzeXwWUXHJD+v8QdwH1T5eb0w=
X-Gm-Gg: AYBFou1nxeQQuMuS0raBx0U/akf5OJ1DPk3/ZfvunwYStjSyaqDo9aX/6M+K1nqWxSn
	tBK1BrLXU7nvshlgsrlbU69LLrLdl9It2hsHjJ56ZRPrafmjwBjeyPp5pU126W53MTVhC9pWt8F
	95MthP+aEXZcz8VZkTmi5vnWCBZZCPzYFXg3Z+L9/igdssnlt8DXQE9Twccrei7tblAuse1tP4J
	RW1FGmjq+l6icrysQ==
X-Received: by 2002:a05:6402:320e:b0:6b5:709e:2196 with SMTP id 4fb4d7f45d1cf-6b722486914mr2174275a12.40.1794214857437;
        Mon, 09 Nov 2026 01:00:57 -0800 (PST)
X-Received: by 2002:a05:6402:320e:b0:6b5:709e:2196 with SMTP id
 4fb4d7f45d1cf-6b722486914mr2174199a12.40.1794214856391; Mon, 09 Nov 2026
 01:00:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105155032.240457-1-alex@ghiti.fr> <20261105155032.240457-2-alex@ghiti.fr>
 <CAMgjq7DpCCiEK00Es7yU_i_wyf7NU4fFN7QFO_RptF9tGvPZWA@mail.gmail.com>
In-Reply-To: <CAMgjq7DpCCiEK00Es7yU_i_wyf7NU4fFN7QFO_RptF9tGvPZWA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Mon, 9 Nov 2026 10:00:45 +0100
X-Gm-Features: AclHuK_jQ5Xq2E9pu5IVX9Cm3rlVC84GARMy3jy9SYO_JH8gL8OAfLfsG_Qj0G0
Message-ID: <CAEmasaWMKsBSQ_LrewZc3f6a2u15WARAk25AKWjS4oFy8yciCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm, swap: only prefer nonfull clusters on
 synchronous devices
To: Kairui Song <ryncsn@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
        Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
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
X-Authority-Analysis: v=2.4 cv=NZpzRGD4 c=1 sm=1 tr=0 ts=6af18bcb cx=c_pps
 a=Tczdrg5if7+wQeIJmxD/XA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=GvQkQWPkAAAA:8 a=odIapWaoRman3Og44HQA:9
 a=QEXdDO2ut3YA:10 a=1oAhN8tkTtOBK6_UvoHx:22
X-Proofpoint-ORIG-GUID: s_4_gkKPOcRkOaz7WN0ckr2zhKq5waad
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX5HM0EN3PKxyo
 lek7sFOl2WmZlrL/dnYx40NJ1CJ0F6eqNaBdePoEnOZ6As4Bkb/K8lsFzmZTTtLoAKBvSGf0JrI
 Kk080TSK9aEWo4NsOhKlqfof3g6gXBg=
X-Proofpoint-GUID: s_4_gkKPOcRkOaz7WN0ckr2zhKq5waad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX3ii6kofeAHpi
 B7BdzWS7w0p2FOgibDBGQdWMHd684pmM6mQzO6iPeOkiWrlXdfO8ohgwmRUx1hlfZq27jeqIm8U
 qulcM85axJiJjkqs1QkzpfW/JHW+E582pKaTjq519167Vb1Q/eGKsiZ/V+rJyNK2AsUEKLs3TrJ
 dOobNs2i4tYo+dgyNFH1JNnGPLfKlgYlJ9L3wdrLIwB6DnUEyed1497nUUpa5no/nZrOWa/gdOU
 9e9OoHuwdh143bXwWZdrODCRK9SsDOdNLpi17Qk09V5HGFVVF3NNYVAbyuDb2tSZpdWtjmVMhox
 LAA23haj5SSrUtoq3E6yd/Vo1CjeZqmQ7vNoGdcdHkki1Tn64OodVOPqR1W5/oLwBuL4RZ+6r7H
 28CxMvl20uflAqDaEcylE2dFy+ZOjY748SMnmAHJvM1avnRH/UV5isQbxWfNGHIbsTJSjqaYVrx
 47ZLNtLEmr+5q734HLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01

Hi Kairui,

On Sat, Nov 7, 2026 at 11:59=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> >
> On Fri, Nov 6, 2026 at 12:05=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
> >
> > Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters") made
> > allocations fill the nonfull clusters of their order before taking a
> > free one, on every device without discard. Since commit 3cedb745d354
> > ("mm: clarify the folio_free_swap() for do_swap_page()"), an exclusive
> > write fault frees the swap slot, so a workload that rewrites swapped out
> > memory leaves holes in full clusters, which then go back on the nonfull
> > list. Reclaim allocates slots one folio at a time, so a batch of folios
> > gets scattered over those holes, its writes can't be merged and it is
> > written with many small requests.
> >
> > So partially revert commit 9a42aed48421 ("mm, swap: prefer nonfull over
> > free clusters") and prefer free clusters again, except on synchronous
> > devices like zram: they don't merge I/O, so the contiguity of the slots
> > doesn't matter to them, and filling the holes first keeps the free
> > clusters for large folios.
> >
> > Fixes: 9a42aed48421 ("mm, swap: prefer nonfull over free clusters")
>
> Do we need Cc stable? I guess no because 3cedb745d354 is new?

I think it should go to stable since it was merged in 7.3, I'm adding
the tag below (if it works that way in mm):

Cc: stable@vger.kernel.org

>
> > Suggested-by: Kairui Song <kasong@tencent.com>
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > ---
> >  mm/swapfile.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index 189f04d8838f..1c1b5d0b724a 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -973,6 +973,17 @@ static bool __swap_cluster_alloc_entries(struct sw=
ap_info_struct *si,
> >         return true;
> >  }
> >
> > +/*
> > + * Prefer a new cluster over a nonfull one if the device needs discard=
, to
> > + * spread out the writes, or if it is not synchronous, to keep the slo=
ts
> > + * of a swapout batch contiguous so that its writes can be merged.
> > + */
> > +static bool swap_prefer_free_cluster(struct swap_info_struct *si)
> > +{
> > +       return (si->flags & SWP_PAGE_DISCARD) ||
> > +              !(si->flags & SWP_SYNCHRONOUS_IO);
> > +}
>
> I actually wonder if we just want !si->flags & SWP_SYNCHRONOUS_IO
> here, but still reasonable to keep the two checks here.
>
> > +
> >  /* Try use a new cluster for current CPU and allocate from it. */
> >  static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *s=
i,
> >                                             struct swap_cluster_info *c=
i,
> > @@ -1143,11 +1154,7 @@ static unsigned long cluster_alloc_swap_entry(st=
ruct swap_info_struct *si,
> >         }
> >
> >  new_cluster:
> > -       /*
> > -        * If the device need discard, prefer new cluster over nonfull
> > -        * to spread out the writes.
> > -        */
> > -       if (si->flags & SWP_PAGE_DISCARD) {
> > +       if (swap_prefer_free_cluster(si)) {
>
> That's a pretty nice helper, thanks!
>
> The patch itself looks good to me.
>
> Acked-by: Kairui Song <kasong@tencent.com>

Thanks,

Alex

>
