Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703C638C2A7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850472; cv=pass; b=CM/o4lfxHaMRBsyhWDJebWTNiHvrXGj7g+HYqeQ6pI+oKSBaXPE9tR86wiXVEIsEVq74zhh2IMXHYgziKmOF02Zyf4GRx3LEtO0nbf2M6vZf4fADYH63+9Z+2uFZwVbytGisr/SkqtDDaw184W6bY1m8WoWNabseCJ/JIckUl1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850472; c=relaxed/simple;
	bh=ZvO95aYTeLNto1ToAwhvP9IKtjwpw8L8vjGiZcBnmKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oga0nHPgxwz6upMnwkhEBG2//mRFpe3VbSGyWneZ4JzJ2dqPHD8l88YlW7LRsvoBmYELeDwdOJ5vsY046tWjbAGv+kVlwu7htORgpI00a3ciNf2YKjvhDTmgE/Q3HW7J1JtAIZub89w1Exw9dI0cWLju6jtx+IZFhJAPvSFzIn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBwbO2is; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBwbO2is"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2529b3139fso10309366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787850470; cv=none;
        d=google.com; s=arc-20260327;
        b=QYokHfxPXWXU77QJQ8IwtQ0gQZf3IDpAV8dnjpsBcmVXp+BMuehns/8Vh+xWajG8SB
         du7Mg5HwvzIqIzfEVzEIc9yIL8Rok2XUypmTiviIrIqUClK1TsojsK61FjHUpR983XvV
         NALkJc0cW48enGOQzie4VHvqt+C1hSffuSiRlS6QhYTWEztKGx27iaKceFnNs/EfvXDG
         b69Z/sC0JxHE6oD/XG8khrCrFvXC5UN6dX1qR8pTg5UkuY1lnU6d/vVlpuvxR1XnsMXu
         N/IL6mcOBBA0fAQZCv2UHAECl3UuvnUu8BsAieY6fGzEdeO8N4arPAgKgjkJ2Bw5RvKC
         zFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X1Wah6nl+6SXRnAC3yP5MjJt6U0qsEQsAHa2pGjMsI8=;
        fh=pZu75vRxB1R6GWlU0zzcW4sdVhrFRwL9Z2ULQd9Pn7E=;
        b=nTmHOixGDKO2+3ghg6/gR8LGMePibKX9H5a+yF4wrDwtUu1l+v3cKSsvtIwXWfrrwS
         ImZNLVET057r6XXIvqKIM3L0oJiubYj63cg1JQs8C8yF5Li5lHJs2L4X2K2NVgHPNjPi
         eWcVTtw27/bXHyw3ey1ZukmTGHvdj/vOm3hx0Zx/wmA69AADgN492QeHaZVXu2pDCGdx
         Fb5KH1IZtlKaX4TnOFts/Nvn/DhDEEf0hty4NvRe6wcy3WTxTGyZxCs6Qh573qytAHTM
         TdYlPqB9GONc0gqrzDoLZdTlRl/fCAuQgfHTluELUdw0z3IqNQZSzsfF4Nfmz+muq7Ty
         r35Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787850470; x=1788455270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X1Wah6nl+6SXRnAC3yP5MjJt6U0qsEQsAHa2pGjMsI8=;
        b=nBwbO2isVWI0llooVq8v/7k/0DH9xWf+Bw2n/mzLsrugfbJ+SkCnP+eyvajSJTmS6+
         3NWNvju1sionFzmRyx7uQjTidpw/07HZpRQ1Cln7dkw7uZ4iPV4jmOve8zlAw8MEwv9O
         oDdr4k7wOAh6jczVPabhFCzpOpMIJh1gvsBR7ylBRUi+szCt7yaC1bLn2CmByedIZP6K
         21Ue6RllwzxWR/ct+0DZpcc7qA9sWXLeMQqDLhqJI4KO4xp4UA9Iu/dRG7TxB+VDUqdu
         YVz6kVKNpBLMD2EUYepgh6gERwhMuUoGKoQH0Rg486DD0alhs7kzwGEHw8LFwAc7/OPp
         NNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850470; x=1788455270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1Wah6nl+6SXRnAC3yP5MjJt6U0qsEQsAHa2pGjMsI8=;
        b=kl0mdEZNNADT7lNi8GaneE7NVW13uKDmZE9gaamzsEuGPAxej9edOGrPBsxag+4Cj4
         w1qOYvZxRP2NEJh25JqauL9D+zqR+iMCQumibJeAqeIYhlrtLQys3ZfyHJMDFwhohj2Q
         hkDcZs8q8d09alb6/xhcGsLBUa1ks8+mMCyRza6nnRLQ4Zdf2fLys5NS2hALh5AsDSYo
         t/LeLY0DNyYXcxeJeI2RQRGW3tBvNEkszOBhaQL7JVHDAYjvZmWI2sXByvZhqZ2qXlkI
         UqRvF90GIJz7kP+aexOdxlxUp53VWNcnyTHT1kgOfa1/IOy7JClwokZruMvrLf1yrJUT
         Wlaw==
X-Forwarded-Encrypted: i=1; AHgh+RrXi1vSj1pJWDhpWWwpjAV2buo7sK4xK0tXv2KFlKVOXeDoZDSB88yaKEpUO95rbBf/iuFvvHA6zBJXLkY=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ8ADUojivfkGqmPrQIZroPUAfxt1BhArpb4M0vmdwtes0ONUy
	MiIcCkzaMRq5ls/oEkmyw68e/p8KrNBjrq4R1D2z4KsBY4L46ekGYrivvjDoOzkOwSjNGQKiwtw
	w/AXwB9g7sg3rqIoU5ARCHMmfQYt6DPc=
X-Gm-Gg: AR+sD11mQ4vS9Tk6clQHZco//T6zmtl1Zh2UKnM7NqDpvAQddJlPxMvkPOHQQRAy/He
	cSbfaioXiJhOSiC5sRFv/avEunnGZ57drGwILNuIMFas2L2JSROk678MvRyMR8yb2tPb0KKM+su
	4ZMQ8irdcn+jF+AB/rXtsKMQ1fIRYMua72ANbqulbDnBmwllMBf7wjh8uYw1kiXjQ9XhoA+4YDH
	ZlbmoA5NYIZzs06FCqn74mqQhstVyogPKe7wVqPFXLgzCxX0349nP4HrcNlAviyWTYHJR1q8rM9
	+VJ/Ta3cD4oZVNSYS/ML0AWDNoIONi4ZOWYmqUjy7dBIA0Cmi6nFfr4TvzmAhb+zg2YsqoUvA5K
	w
X-Received: by 2002:a17:907:9612:b0:c16:4e5:944a with SMTP id
 a640c23a62f3a-c25574341c1mr5180266b.21.1787850469508; Thu, 27 Aug 2026
 10:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-2-9b43f5163238@tencent.com> <50bb70bc-d442-43df-ab4f-a158c8b05ac7@kernel.org>
In-Reply-To: <50bb70bc-d442-43df-ab4f-a158c8b05ac7@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 28 Aug 2026 01:07:12 +0800
X-Gm-Features: AcwNN1VW04jGDYJxUtXMKMvDJ1L6CFo4aT-tplWH99K5U7NNuODw0RlF0OYIkHQ
Message-ID: <CAMgjq7DNdaBdQ5Y3ctg6kfydt6cKHWtO4hitx-MO2YDu4Q-Obw@mail.gmail.com>
Subject: Re: [PATCH v3 02/18] mm/huge_memory: fix rejection of swap cache
 folios with a mapping
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 12:00=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/20/26 20:55, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > A folio in the swap cache cannot be split if it has a mapping (shmem).
> > The split code does a defensive check for this in
> > __folio_freeze_and_split_unmapped, after the folio ref has been frozen
> > and the NR_SHMEM_THPS/NR_FILE_THPS counters have been decremented. It
> > rejects the split and returns -EINVAL without unfreezing the folio or
> > restoring the counters. That error path is buggy: if it is ever taken,
> > it leaves the folio frozen and stuck, skews the counters, and fires
> > the VM_WARN_ON_ONCE_FOLIO for a state that is actually legitimate.
> >
> > Check for this case up front in folio_check_splittable and return
> > -EBUSY before any state is modified, so the split routine always backs
> > out cleanly.
> >
> > Also fix a bracket style issue that checkpatch.pl keeps complaining
> > about.
> >
> > Fixes: 00527733d0dc ("mm/huge_memory: add two new (not yet used) functi=
ons for folio_split()")
> > Fixes: 714b056c8321 ("mm/huge_memory: convert VM_BUG* to VM_WARN* in __=
folio_split")
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/huge_memory.c | 27 ++++++++++++++++-----------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index ced400f72d43..a6759a14e057 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -3878,6 +3878,9 @@ static int __split_unmapped_folio(struct folio *f=
olio, int new_order,
> >  int folio_check_splittable(struct folio *folio, unsigned int new_order=
,
> >                          enum split_type split_type)
> >  {
> > +     bool is_anon =3D folio_test_anon(folio);
> > +     bool is_swapcache =3D folio_test_swapcache(folio);
>
> Both const please.

Thanks for the review, got it, will update and try to use const more.

>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
