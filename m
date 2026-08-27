Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA6447D927
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852880; cv=pass; b=fQCHXJ+bZSA5KVOLeEM9GtecHWjn/ZA/uVoo1N8wUEcewSF9ASaBvJJMBRVkYKrp/tlDIUZXTIGbfHCo7QYoBSmFsASX6yGQi3tQrc5+mLnijNkBA8FO2zSVpsufl2gXf8+QPGA/voktGnuQ1G8xNJw6L706bMR0h3RzaKOOq1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852880; c=relaxed/simple;
	bh=riLAjledG2dLYml4GJ1EWGHb/rCZlY4ZdASlv+w0YiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoQpUl+IWUdTY1LsIpKbMUG/sA/wRbRoNYDWaErAbXt5f3CDJfrftEvI0POvxKpJXsFEVtPHJxr81PJyvNDWTI9yW8+OOMCX6Uc+D0lQnAaHCCNRT2dBvBaf9PEb43kNgHAI7ALDxlszyr0/zSdmpvBEZu4s7WRQi8S8ymTM0LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwc4phwt; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwc4phwt"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso89380a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787852877; cv=none;
        d=google.com; s=arc-20260327;
        b=UzY24qX533Heo0ZIdw32mLDHoxWHI9P/SzalYWAYsqNrxqOE1dmnimU5YQkzenVpWr
         09g0fmpMTmx9lL8szAljklJaQwQ8uXWQoHy433iB5GhPpZeR5QMH9IpUtCiHlZcLJaX8
         cdG+NEBzS5JcqdGKultlw/GNPWeBeIOEpYj2kUSSVbwLe3wbuKUggP6kOXkC4uD/r0iH
         PcvHj4nyytjD4Uhf9x0yVrhBhJOqPKauGxe3qbJljPiVMCHlQMZHAb2pDlhnKYOCbifP
         USAMUObyyivi/m+helsTwwNKS8+xF+Vovw7vn29XKF/qY/jrcUGPuL9P+TiBPr8N+EJE
         loxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p+49vqR2fh26OMS9DxmmmkkFrygreA7GbCzJCw/ytWM=;
        fh=yryL5q6wQ3Fsuw71jZWCInBVqwkwgaKKTKHMak34IAw=;
        b=HV66JDfEWDhoBMZoDclT7Xwa6T1PDMIg2wajw0JLo1YjRvPfqirdiFOEo+Cirrtv9B
         IUjfhxHeGEapt+4lMuKwZ/j9aoz0jnA0a+e/7LcUF0SM7HQ6mqMqDzfsWhwR19UG7pqf
         qGFWDl5aTfznN/z+3fByxuliV5+63Ryc2Vf0h69RI442SGNVLeNB/3qvQq9aP2+OoumB
         cU9s0RJanKqWL30HR2/bxsDYLChdKU/Q8kNEF8QVOZk93W8Vou/J3pSXx9l7b7cN/Zcl
         5I+8G1bNF5NXmzClAluupt0ZQg4dmYCD3v7mNdcr+XpwE0aui34bprRaHWEHeXaWwnk0
         8sgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787852877; x=1788457677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p+49vqR2fh26OMS9DxmmmkkFrygreA7GbCzJCw/ytWM=;
        b=hwc4phwt7FAsB5O3mFxED/KVBzvzYWq3Y7mL7ZPNsohafCXBiF7dKe8jJ5mviYUww6
         Xifdjpnk2zVHUPVV4konNKfJsHyMH+ocryO/frQY761wUk7wNFaN/OoiYMyoCA82SUOm
         mDwHLlZwYcb1ItF6FwUoBcLaqwMPlXoSAgtFzegi9l0WdA2iTdRSZ5Na3PDaxPl6BRvs
         64ygfYN2zkFWwiLzvj5UnOvgFzGZmfYcpxOUjlsIVGAgzeLd+by+IqIUFyfKMzmMkeIe
         GNvTMJF1W1JVOVxfcULFg/bSA9WPmzfhrdeugswOPXy/LT6viyiB4a1jrxK4MOGFs69i
         ZGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852877; x=1788457677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+49vqR2fh26OMS9DxmmmkkFrygreA7GbCzJCw/ytWM=;
        b=lJUCo5sc7oGnxawCaUGb+qoNsxiwoD6eLirdx5PxuHgrDf9bf8k26/WRHIZrk+ULqp
         cSEjK6KFcUvQbxv2IiALjzm8UDP5Gzx58e7gSKHZOJ6OpGbHMOHhgkAmWJGZ4vkQWx0M
         C6CH3yPOCfCJH9bPmc+pi7zjmgFwLIV3HPuIxA90+g4N4fzHnOs56vetWsZmruwBRWaY
         jMW+mYdev6PflKKMikX1K2it/IqOVvidF7RyDv9Zt+nsLTaFf3ZtVqLin3W5DIAAKG6Q
         M/ud4Gr6nXcuWbTLWevucGW0abJrNyz695cwRoLBw5i46Nfm+SBH5SLNDXb3qdVz7jyo
         wOMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVYPJ4k0lIwsZAsXx5okv6EO8HPD/dzjr8GwzEiZQd5nSHLUpGOug0Nkwko7vXWxC5AeFv5N/WEubNTtQ=@vger.kernel.org
X-Gm-Message-State: AFuF++meoHFyAPtiSHClHOGLT9RmgaVLwRi8T2C7/8EudqycgjG21fAA
	FgQgqgAtJHS+ZyALoa1/HevikuAQlcDCZPe3wslkuEVfjv5B3NhLE+B8VbrL5iZa3OvjbbkySZ7
	jmD9BX3A1yRdaBPLhN87U1yCsrCevX+Y=
X-Gm-Gg: AR+sD10F6JJex4/QUcgYJvAalF9WdXaStQxNI5/imtthOKq3O2vSzA/r7QurYDviVym
	MANcepOOkm1RqUQjNQz12lNpFy2UJbeKUnC4o5C4+aRopgrTvB3E0yrGOyOL0evKidQ+BYe3sqw
	gRvVBO/U54T1/d88ed5nZ3/6VN//qNfkLHqPEND7XpnO8q8vyEO14dh5ChrKijyUrHpViDDj7Ci
	gdoPMJqs/YuPXz0UqG/ADPDUHie+MJpt4Lp834knCp1m+KASi9KZqmNAUcHKjJ+FkulmoJAapzg
	5klyimpFhN4Eug57ZFkgmAdaZ0HeOKkZFfZgkbW0GeBshQzm6cJ6+Cqju0q+YHbqfXgZtKIpQEs
	w
X-Received: by 2002:a17:907:1b07:b0:c20:21be:ea75 with SMTP id
 a640c23a62f3a-c2556fe4518mr31900666b.8.1787852876603; Thu, 27 Aug 2026
 10:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-14-9b43f5163238@tencent.com> <9adcaf53-3a40-4d97-9365-b9af97891894@kernel.org>
In-Reply-To: <9adcaf53-3a40-4d97-9365-b9af97891894@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 28 Aug 2026 01:47:19 +0800
X-Gm-Features: AcwNN1UolfPbwWi91Y1xRcWs4KUR666VdDfIVutcZFkSNdsg3NHjJdQfhrMLT00
Message-ID: <CAMgjq7BShyGaT0rvZqbHP7r6_A7BJwnJLsVyo9cvj1ZVt2e=cg@mail.gmail.com>
Subject: Re: [PATCH v3 14/18] mm/huge_memory: clean up after-split folio
 freeing in __folio_split
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

On Fri, Aug 28, 2026 at 12:48=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/20/26 20:55, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Replace free_folio_and_swap_cache() with an explicit folio_free_swap()
> > and folio_put() in the after-split loop.  free_folio_and_swap_cache()
> > unlocks the folio, then free_swap_cache() must trylock it again and
> > re-check folio_mapped() before freeing the swap cache entries; if the
> > trylock loses a race, the entries are left behind even though the folio
> > reference is dropped.  The sub folios are still locked and unmapped
> > here, so just directly call folio_free_swap() directly under the lock,
> > unlock and drop the reference.  This makes the swap cache freeing
> > deterministic and the reference drop explicit.
> >
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/huge_memory.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 84c6e4bbaa88..113a33cddace 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -4337,14 +4337,16 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
> >               if (new_folio =3D=3D page_folio(lock_at))
> >                       continue;
> >
> > -             folio_unlock(new_folio);
> >               /*
> >                * Subpages whose mapping has been zapped may be freed
> >                * earlier, but freeing them requires taking the
> > -              * lru_lock, so we defer put_page() on tail pages until
> > +              * lru_lock, so we defer folio_put() on tail pages until
> >                * after the split completes.
> >                */
> > -             free_folio_and_swap_cache(new_folio);
> > +             if (is_swapcache && !folio_mapped(new_folio))
> > +                     folio_free_swap(new_folio);
>
> But this is effectively duplicating code that belongs into swap code.
>
> Should we instead have a helper next to free_folio_and_swap_cache that co=
nsumes
> an already locked folio?

I think the only duplication here is the is_swapcache and folio_mapped
check? folio_free_swap is a common swap helper. And putting the
folio_unlock and folio_put in the swap side looks odd to me, since the
folio is locked here and refs get here through the function's
convention. Pairing these unlock and put closer to the convention
doesn't seem too bad IMO.
