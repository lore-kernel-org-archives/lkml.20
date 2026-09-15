Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62F947DF87
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469855; cv=fail; b=cyHq76Vef+g14Vn4Zqfxe/Rin6r4Ifn3qy7AMG8HDpiOkE2/7hrsWwp/iSSnUQsf0acOhpH+IwtMCy20cMXZWDJdtttJ9S1+8l59foUd+rNj3rIcB/Y7FpA6mDXQIVyBVZ5xnIkRkd+8zBjIP5sMST3NVFsdclbjTJz/9vNVWd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469855; c=relaxed/simple;
	bh=tpy8i7l/BA7Rm+USTOaha+ng3e4tlLe5bSjJmLh7cxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+aXth/YjOVL0KQiI17W8XTCpdNVx3Tl5Rru3Hl1W7kEdJ318lV3Pj8sW0ODTpiAiElP7O05pd2yHPxNH9n8aTlRFz5cNWhMcyrgR7Zm1jDdILda0NgtDDMg+cwAx6nQUTzN4CB17024rLOfUGmhEaC4np+6Q5CZVqSHPoYZ1x4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=IXaVTCXT; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="IXaVTCXT"
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FAVl50207767
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:57:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=8fwGVw1TonoALoLn/YIvVihwPl3cu9x2/fqzQ
	L6Ga4w=; b=IXaVTCXTNefIpGsfMsoPMnrW3uIAuc+dMeUFFmuE2r+q3fMJpbqrn
	p9rpVGS64edQMzMoCQv2sX5EBCFexQl8hWl4C9+pAkfuxdn2+BasPlPtnj6rfAXd
	n+ZUt//4x5He3fui3JYVvqYuL9K4NFRcWv3Nw9//wJA5yvP+SizcTg4Sr2UT7sVi
	mfdpIBpPI/dZXAqdh259VL+RdGEl8/Wjn9UZ8DY6uKhPMWX1/CnG1WIP0USvs9JC
	SxkGQNonVmQjY8wL80DzCkLgr5rU1ODsgpafn0CqJI7slzj861oS4/EbLp9IlWuJ
	f/B9kSg0OEM1JvwomDCTlVOleOWKYWVxQ==
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4gpybc1s2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:57:32 -0700 (PDT)
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2947907e49so36932766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789469851; cv=none;
        d=google.com; s=arc-20260327;
        b=OwWk/qy3xHZmjp/usiCvP/ZVZJB7eF1OBF+PpyTFrDJy8p9RgUPVnUf5aTd6qUIPGn
         UydGS5GVkEmpc1FFP3uHbhl1UerP2TnZX4ktOaLFhxGwYyJeAacd+5ZgfkjJab7buBZR
         bisZBsmSDUr9NbOXVo35GNAI3iT9NTibkzjKy2HPqjIx+5MvM2pJOFOJERG4da0rU1sS
         WGWrT5OWcAwdZ1i7zp7LQg+BgGpUy1AeubcGRrqOmJ6/N6lxMVYk4xjPtByW41JJ9O+/
         pMoihDOluVBxVFosGC+gaGX0j0ln5sa3fzuDPw3QKRFmPSwf/C/HtBs7frEewL8pYDt7
         EL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=KQ3JU1tpv7p4RGZxv0vqijCnUKi340SMsq6EFsNMVHk=;
        fh=BOvAXuf4mWxAsZ+0mtnZkqgrl+libVe7R1HoQGDrwXM=;
        b=Mw6vblrDJoYr2SrSa9GekHIoPKfhB2xPMC7BpI7o/gyVn1BxRReHiJsba7L+JMCd/T
         x+uMp0hrpvG/A+a+i+rVWXYYce6lkEcB2KlmFtM6z646D6l06ELwj0q8+Sz+7u9+dU0W
         UZqg1yhGyWfcrCOAZMQa5e2pKuGEAqURX1CCu2zsqh6xaatI8ZGP0oS54ehzKtrIM4vj
         pYmxUQOO5kUX8KoeAR4nFptj/K6nJO6vlSEUsZUu7LVSyf3edUtvI5SEcoROYOXDzOWC
         u7W+3C4STYzNenMOiTdW0wdbhCPYLi3IWmjaKFxdZwbcTjCQAmzMCw/Vsn3Ml3SYeGVC
         aVKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469851; x=1790074651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQ3JU1tpv7p4RGZxv0vqijCnUKi340SMsq6EFsNMVHk=;
        b=sc+d942bKZjaXJ47a5sBTsmJ6rhrvE3PAnCruWCbAj8jrpTXw5dRgdT3uotjfqqcw3
         hNjlMuNcejriny/yvOoSZhf9XLT6IYGtKHHAzjWbvaW361PxRiGe5Wzi5hdTxEp3Q87U
         hji5BCPG2KxsYtVGddxi5hA9ic7105/ScwblPzd9Y8bQE6vwjOHYxT2y30YwYpjYtX2i
         Yw8g3F5oJG70m7nVpTTLnr7gfgvqWvg5f8cXmMyHLHPRFROHubHwL4KnpQQDgdaJZZIP
         mR/gOzpxZ7ZBgkJG+cfShzFdc3jJS8FnIjhfM2HO35hNf/IQihknrskd4BtwXvQWGrgy
         GQ9w==
X-Forwarded-Encrypted: i=1; AKwUvBxrmQIFUgz11pxlq3QV4CP3BtONPVapoEe8hWHfB+l+adjVmgdQvU7RsJ9IgArq9w/IOcyXG7NolKDQPiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kQcytMHf8Wigk8uAWV0VJX9v4qo6m09mvzy45aPtVG8/vMGPc2
	Z0fxKXFKb+YlJLd2qHWqsbV6GedguDu5XJT8PoW7Y1csJQpYZRRv1ANPrbNWgUOTaxhix2bQ5v0
	6svMrijD4pSUl7MXz73BTh6Yndc9QpIs7Gxvn4FslugsPHk1pW+Yd1PeuHDHSJ6Oi2XqL6xiKxL
	dOibxTXANYczRTY/9SeA8lEd9BE69kFTUmqFY6SN0=
X-Gm-Gg: AYBFou0bItoLRtz14fpdzpAcHNPfkNbz88tN2lZ+Y5tc48tvDBVcYnbVGmOLDYue53J
	UtyY502DD5OCsqjp9QxKQND4vkQP2C4U4dVOGN8CplFVzT9S1zkORo8U9WQ8TQAQqi5EpkLOK36
	H8fPQ7yWC8dAscfwoxBsvvsMscvmgYwtHob2Nje/5klfkIL9TKic6Pr+ydyKnWtghO+F5LHPkIE
	xiIm4eLScCT6Z3Oyw==
X-Received: by 2002:a17:907:806:b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c29b86b7570mr748695666b.11.1789469851368;
        Tue, 15 Sep 2026 03:57:31 -0700 (PDT)
X-Received: by 2002:a17:907:806:b0:c25:2d27:5652 with SMTP id
 a640c23a62f3a-c29b86b7570mr748692766b.11.1789469850926; Tue, 15 Sep 2026
 03:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911092012.92399-1-alex@ghiti.fr> <20260911092012.92399-2-alex@ghiti.fr>
 <CAMgjq7DwWYNrmqsvEGYkSepwnFLcqHpiyRJJRyKLCBnByvS+=w@mail.gmail.com>
In-Reply-To: <CAMgjq7DwWYNrmqsvEGYkSepwnFLcqHpiyRJJRyKLCBnByvS+=w@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Tue, 15 Sep 2026 12:57:19 +0200
X-Gm-Features: AcwNN1WlGhEQrRjARMumL4P6ekuYjXvAxEpudCJxXapjPxLelI-nisb4v3_r2zs
Message-ID: <CAEmasaWtFRk+gd-TJnvP+pigzvanES_fy8Zd3awJk9z7Y_9Mhw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] mm: swap: move LRU insertion out of the swap cache allocator
To: Kairui Song <ryncsn@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Kunwu Chan <kunwu.chan@gmail.com>,
        Usama Arif <usama.arif@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1OCBTYWx0ZWRfX0roS65X7ozEe
 r7Tkg9FQvXfyBEb4oX5Qxm+GbonYNmpjKK3CT3uvdb0yCv3oCPz8iZlW5xT64GfsDX49LSkTRHl
 yFSKu2m79gGXfPnOpdf0vA5QhbFgFgM=
X-Proofpoint-ORIG-GUID: OJn99k7NkGe1ApvuMFhfhiQHqMhZ7BiS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1OCBTYWx0ZWRfX6QQEIToSY6kc
 BlEGBurJC31xhWAZ75ixIM4YBsaACO4SsSjQaUWibh9+V3fYZ1txeqBMOXch7+G6EUzDPo6hyou
 SUO6tFzRyV5LTCeoP4rQ0GYcivdXpBGA9FQ3+auCsAJ9+eolP3Ft6AkJRA5m9bTSdCtons3CTrq
 njLq8tpp1nPQdVErr/kW7NmTpV6HM5phdLDwqlWmo9UlsfPyNMg5ZemdOR+yHPKsMqxB+IdIG9R
 POcFRnugpYraupSyd6sGW2NY9USH3Dmwatgt7e6jY6MWGXbu47UOxwgAEANDOytYQ9iEAz0eGIX
 i4VIshLuO9m4SgYmvtJZlFCakpiOYuiOPkwgRAqrRHciLl7cGmXF2sZHBZZiG3hyY8PI5+hyxNp
 Dxa4TKGdMX6L3ogvy4MTtMdilAMFEq2gHpaQHJzcRILeRuKzJpKaOEoUgpxev6oY2P4hWooQz3h
 HocExz8BbZ8SSUzKkhg==
X-Proofpoint-GUID: OJn99k7NkGe1ApvuMFhfhiQHqMhZ7BiS
X-Authority-Analysis: v=2.4 cv=FtyQbGrq c=1 sm=1 tr=0 ts=6aa9249c cx=c_pps
 a=edIAN7ErZTGbxav20d8A7Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=pGLkceISAAAA:8 a=GvQkQWPkAAAA:8 a=8Ky0kgImgTugmDi359EA:9 a=QEXdDO2ut3YA:10
 a=nIuFr-8touD1a-RngYHT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01

Hi Kairui,

On Mon, Sep 14, 2026 at 10:03=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> >
> On Fri, Sep 11, 2026 at 5:47=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
> >
> > This is a preparatory patch.
> >
> > __swap_cache_alloc_folio() adds the new folio to the LRU itself, which
>
> I think you mean:
> "swap_cache_alloc_folio() adds the new folio to the LRU itself"
>
> __swap_cache_alloc_folio is the new name you introduced in this patch.

Oh yes, my sed was too broad :)

>
> > leaves its callers no way to act on the folio before it becomes visible
> > to reclaim.  Two users need exactly that:
> >
> >  - moving the refault evaluation out of the swap cache folio allocation
> >    requires it to happen before folio_add_lru(): that consumes PG_active
> >    to file the folio on the inactive or the active list, and under MGLRU
> >    it also reads PG_workingset to pick the generation.  Setting either
> >    flag afterwards does not move the folio;
> >
> >  - zswap writeback dropbehind needs the buffer folio to stay off the LRU
> >    entirely, as the per-CPU LRU batch would hold a reference on it and
> >    keep remove_mapping() from freeing it once writeback completes.
> >
> > Defer the LRU insertion to the callers of __swap_cache_alloc_folio():
>
> And you defer the LRU insertion and and rename the helper.

I'll reword this, thanks

>
> > each of them adds the folio right after the allocation, so there is no
> > functional change intended.
> >
> > Suggested-by: Kairui Song <kasong@tencent.com>
> > Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> > Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> > Acked-by: Usama Arif <usama.arif@linux.dev>
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > ---
> >  mm/swap.h       |  6 +++---
> >  mm/swap_state.c | 20 ++++++++++++--------
> >  mm/swapfile.c   |  2 +-
> >  mm/zswap.c      |  5 +++--
> >  4 files changed, 19 insertions(+), 14 deletions(-)
>
> Everything else looks good.
>
> Reviewed-by: Kairui Song <kasong@tencent.com>
>

Great, thanks Kairui!

Alex
