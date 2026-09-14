Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF343EF0AA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373012; cv=pass; b=M9fMu+VIxfoqKP1f3Rz06huV/A0UCwYjBlL1g/82x7oO1KYZBtBNPuYXykrNi+qE/QlZ+oA/qaKla+H7oLd3aRBosbs8kQwt9wzfY8JPpMh/m7eCqaqJS6nKvho9vYeaSS0AYvGVVsCeOEfJ8GX0Tkhh8fI5NPbnRQepN0jXNQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373012; c=relaxed/simple;
	bh=lE5djnqwDdnYD3kyiF01bzZKkBlViBvTgqGhOY56T/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3USt2TOXthKIXZVHBH5OWyY4OVZ5eJ7uYowB98DOe0hz4LmlpihAtdi6hA4MzCPfIheNVm/IB94ap9bccKaBpADx2oWQ50YbV1XDwm3oPFyoEjouR7lAIs7dOToigj4dKki9WmPZsv1zI+Q8OdhNJ6860LiVb50v7oHrHGlSAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipXjOY+A; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipXjOY+A"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe5so212721666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789373009; cv=none;
        d=google.com; s=arc-20260327;
        b=o8p3NXd65/G0ZPoJj2Ck5SPAvOsXgUftkPCjD6smwO91/oiXsjcRVB1L4oN/LDdDXM
         99W2j98B79fuJ6mpmqlyMyJ+sd0895pzsZCN43n7cPAqSoMYnu6E7NsQ3/zsyjGDRIUF
         u8VA0Zur2tXuSv8hEOK4rRMDuL0RhuA1hy3zZrUJ9uH8NhVlI3VSTNUqCMttBeuWg444
         fM7q8lnzWJRl1RYJnr2zd2fCaVwsJerTrS7NYpy71SCe+cJzELtKQqEXBgPeVqPFE8aB
         IFA6btvDLLsk1Hs5dyDllTpiGFVIuPsTY0iMLQQoXVFNJTZO9y+MfdVQz3Xlghg2FCY2
         IzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PgULmz9i2Qwcri2yHYDZqepvUuzd3K1cSL90kcD0hpk=;
        fh=F+bbOKV+9nhXFEaZX5YEp6d0hMowtSZJwO7bxFuX70o=;
        b=PVYWAacPkWI4snw0atZJBirFOzJzEEUWlHSjnaKP3r49GUH2IgUZxkKM1jB3wrAuHX
         43S4pfrXxkLljywnmtHsbcbVdTnG3BGHp4nre9Cf/86rPj3Kz0Ii6Ix3GwNSkXf6JfQ7
         YUocSQjY65aI87Lo9pMiG545AE7XeuBcqyia+VUQcScPo4f/edcAFqkpvL8rK8zLNl0H
         gvKXWu3aKiMGFVJlh2HCCJomM1DIf7FlROZeahlM1nBSyVZd3Bv2j5VwArHvEVONbgBN
         EBOD8ar1Leah4eImAOmLrDksSuRi0E4MFwtx4sfzsXh83pEevj++SFVHF7B2axDnDCGN
         ff4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373009; x=1789977809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PgULmz9i2Qwcri2yHYDZqepvUuzd3K1cSL90kcD0hpk=;
        b=ipXjOY+A9Il9/bs9Uq7G1WSo8HcSkRjpw+PbqzE4ejP0acHuq+w3T2M76ixZ7e2Cpf
         crsQpKxTv5ThZuIC/mvyJijzJ6etcaELS1mT1Rb+A57nX4niPwiVQU0BRAnP5p75537+
         A9gnb1UFm5GCq1DyrhYH/AFZHLwLQqjUdP8VpzDKLKC0WGJgQuBzBrvwUUx++Nhlj5Up
         DbEhxrIuHy2egqK4CT4a1AW0rcgzUitE9A466b0Vq+AXZ/kQp+kUv5tOfLh0o74XCvhD
         Yum7VMkn1CuPRJlGFhvg0UzcQpLMxT2mgFCDdu9MjVtv24v1hJGUNALibAuqGXkma3S0
         xvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373009; x=1789977809;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgULmz9i2Qwcri2yHYDZqepvUuzd3K1cSL90kcD0hpk=;
        b=EoK/Lmx6frnHsi89WwEMwj7tx97vhP/PcsmlMinAuGBIut3NsEnfbx8xX3JCvaEXzR
         EIstVm3rmvEF5lSDH7ETv4M8GjfxzGjxZLDB+Gjm1ULs641cDQJBiozKBmMZVcg1Zlcy
         ueHDDCiH8PN+AifHchcOlZopmEcpsDK7rt6zdUDJH0A22AWQH/OkwwilNXbyNbaK93sS
         noazpUsXK3/7Jl33sJqHAqsw27qDDcOZflqINAWIp6FiolLORvfIMushGyuu9GfJ7XNV
         Li4LKmztgR0k7j/Fep3P5JIveCPXts9eOjK8MTklBV6sdi5duRgxc3Ure6dgzX2dYnLK
         e0Eg==
X-Forwarded-Encrypted: i=1; AKwUvBxBT3pNRj0nF9NgIQw93LHijkEqkmK2OOVLIfXqW5bR2rg3++t4VxFKS+HQZ1bgSg4QYAY0sbeILqBB2zU=@vger.kernel.org
X-Gm-Message-State: AFuF++nYZvts8qRAaQrYkuN2MuUPfWrZDsX5ahJYhIZmKiAmXh6o5Tc/
	PcAQKVo3CfcIeK4KRaiGpEiMQTtv3d65BwKl8/IsLNkzCktFQOdRWoIfx0E3aTjc9BsokVj+eI/
	nSfBskrTMY+KtHjgVjfl9fzkc6kH6XU8=
X-Gm-Gg: AYBFou01vJMhG6yfCA7Uv/5J0/2QiXmufK8vbdmc0/SHiTZFsr01UVV0GP8DPaLMEhG
	raHA0Q9IGQ81rcdYCJY5TGsqCWgyuJ+dvQnZzG2MX/9DCAR2c8RDh69guDRYNQAjxh9HuzDCD9c
	CbpANS4d8FRoOlTQl/vha17btp5J9h3F8WmgkkOCbj9PSb2gGfNfGcJGHvAUCiVIJtEt1kGFS/F
	Tjr+l1RGOVLtn404XZd1amFNMVTQ6vjiihTjVxbaJzew0xyhKKjLJM7WEhqThSkDxIh7FJl8MGS
	gL1katzAnD+DRPjf66s7mEXb8Xdu8BwJx41y8n8/wccT7Aai8EB1A1n5gcFLknbgm/hrnuKW7j7
	uwv/dh13F228S1GHZomuWXRyG
X-Received: by 2002:a17:907:1c09:b0:c29:61b9:7b3b with SMTP id
 a640c23a62f3a-c29b8798ddcmr75929166b.49.1789373008506; Mon, 14 Sep 2026
 01:03:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911092012.92399-1-alex@ghiti.fr> <20260911092012.92399-2-alex@ghiti.fr>
In-Reply-To: <20260911092012.92399-2-alex@ghiti.fr>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 14 Sep 2026 16:02:52 +0800
X-Gm-Features: AcwNN1XvVdcGmFCu1YfSgAuFunR0wpVdzybQilaaiJVxZ7W1LpJIzbod2cFjOcs
Message-ID: <CAMgjq7DwWYNrmqsvEGYkSepwnFLcqHpiyRJJRyKLCBnByvS+=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] mm: swap: move LRU insertion out of the swap cache allocator
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Kunwu Chan <kunwu.chan@gmail.com>, Usama Arif <usama.arif@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 5:47=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> This is a preparatory patch.
>
> __swap_cache_alloc_folio() adds the new folio to the LRU itself, which

I think you mean:
"swap_cache_alloc_folio() adds the new folio to the LRU itself"

__swap_cache_alloc_folio is the new name you introduced in this patch.

> leaves its callers no way to act on the folio before it becomes visible
> to reclaim.  Two users need exactly that:
>
>  - moving the refault evaluation out of the swap cache folio allocation
>    requires it to happen before folio_add_lru(): that consumes PG_active
>    to file the folio on the inactive or the active list, and under MGLRU
>    it also reads PG_workingset to pick the generation.  Setting either
>    flag afterwards does not move the folio;
>
>  - zswap writeback dropbehind needs the buffer folio to stay off the LRU
>    entirely, as the per-CPU LRU batch would hold a reference on it and
>    keep remove_mapping() from freeing it once writeback completes.
>
> Defer the LRU insertion to the callers of __swap_cache_alloc_folio():

And you defer the LRU insertion and and rename the helper.

> each of them adds the folio right after the allocation, so there is no
> functional change intended.
>
> Suggested-by: Kairui Song <kasong@tencent.com>
> Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  mm/swap.h       |  6 +++---
>  mm/swap_state.c | 20 ++++++++++++--------
>  mm/swapfile.c   |  2 +-
>  mm/zswap.c      |  5 +++--
>  4 files changed, 19 insertions(+), 14 deletions(-)

Everything else looks good.

Reviewed-by: Kairui Song <kasong@tencent.com>
