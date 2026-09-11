Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F43A3A1688
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149637; cv=pass; b=DB9fXBDDxgQizQrPtB4LWMZSpMNNCMgwzGgPi7MYA5fDELUUShdXO8KDxU3VoLWLq/cYNp3AfiLvG0U/gfppJWdvglnqoA3HJYu33eAAvy+p4sCjpETtVXPO9XAtprLnxftWfVQME/s3ZBX0HtJEf1XRY7Nr296YkVCxaLN+0AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149637; c=relaxed/simple;
	bh=XPrNd7JyeUHIvRKhE8LuG4w+JcPIcSoNHByzv54a/UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkzOWi/kv7RianCNR6ZrCNjFiXn82JNF/mHU4q9ZOKurYAQpr6Ur0odFCu9FlWtTGw23pHrsf0Px6EOARbt3T3UjjzzZelNJHN8DlFEE337c+8TOuYBFduzjjdJ+zIdXwNBndwPl0GR28Ae8WLxt+YDOiDCcegABgfMGnVHKVh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eo8xDES3; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eo8xDES3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c297931c2a0so76470366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789149634; cv=none;
        d=google.com; s=arc-20260327;
        b=REkagg1H7PUFC2ofPJltN/L4+Km5I+7hFHnFhR/G35338+VjyM46C8QIeh8sYBYvg9
         uK0JFI6lEHDbNIfTCWajz+EZSlIQlzvWE7BBrB/17amjtjqCRUZBkjdpDWisswbJuKgg
         NQLRaV4hPjMHVpQjvz2drMZP5FA1xL/Tv4/NpCUBvj+94lvqT3PKjw745pN9taEdKs3M
         jbml45TAGdtCs/oo+ilJVrJ5c1YyeuQcZcR81lIrdCmLpYCrdgszPdd0S/xWIwRvmNfY
         YsTKITjVU7/CSpGmOa5qFJhsOfkxICEsOcGzbjctqCDsGW/i5g7Y0BQdC9z51tbBA81h
         ONAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AJ2KxZSd+Mcocl51gZtVU6R6qPkmJfHm5SmZlXDUPTg=;
        fh=AhqTcxxTgsCNPMkgUFRd6ahrAdK+VOnLPOfHnRpvrWM=;
        b=I4f7t8pUG6/LSsD6QOubIXU85+/ilbX2+i+OJH2McVYQ4F3maNQVh1XX23EdXqUKlr
         h96AHsYyLMXgt/TDr7bI31U0aEwmb48UlATac92/CZgZLEpukB/heXejVS48WEm+SjoY
         us8reWaJjsQ7MX2nmDEZSVDojqwT8uF9Cp7aVd8T9MV71a3F2QFxOeoGILf0FWxa5gfB
         w8D5VGoJJneGXQLTWlvfHd/RVYYL9xieeMI8PZrDKHyUOp6K3EPNJIe8kABjfNFMRkc3
         VYdaj14EO+4zMDo6TWlABZxMQdvAZdgK048pxUSLZxq7qGTEHPXe24+m1TI72DyeVonp
         S5YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789149634; x=1789754434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJ2KxZSd+Mcocl51gZtVU6R6qPkmJfHm5SmZlXDUPTg=;
        b=Eo8xDES3/yFUEbLqLtIak49IbWs3RN2vQ0LkiKaCAuYCi/aGhJSampschNvmay7fpz
         Cci8udxSG8gIWxFOIhSPF9yDDE/n2uXcMACE5do2sugoKBHrqK6r0kydRG+E0EeJy0HW
         L4sihrLO6E0SwKBAxH+GbJkf45m0m35iTyCnTnYXAMrFeZsV/ew07iYrLZKdo6dDHQs8
         EU4/2RmC2NzC1ki310yrgmwNZmgqGOrn7HsGsmy2b6SEQ+xsvTVEPL9gheDoUlRSvWkw
         hcYgyYsO8bsjTOUzvaEkMZxl4uoysp1dnO4//+cCMeFkkjueOGeSGCxxKd7PqMT/xuO8
         7RQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149634; x=1789754434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJ2KxZSd+Mcocl51gZtVU6R6qPkmJfHm5SmZlXDUPTg=;
        b=BgbYATaRgraGYcyCb5P76r883fDey+I+JpmhlxW90+uRi0S2N8qNKYydb6+6rd3z+U
         WTDwn/Wv+brOm6DBzU632Ja2TGb/zV6Mau6gMBzrhb6KF03tLDn8Vo5ekrZ/rJMlId4M
         C9KlHa5bD8RZ2MT1Pr6mQKXiiL0AYHbM1eqgmPEn7ObPnnz8+BN8tvqJeCGxCo2DDWz+
         L/nokgSElNQiXyURaU4HmqB729umnTOBH/qHVzbaxo/c8zAjB1FGtCiQi94o2QcIbJRn
         MKQ5MYQ4jO3e+oglPdEf9739NyxmGOUwedQbuteh9B062lBn5DfpJ8cpGEjMIOfoU56w
         hsrw==
X-Forwarded-Encrypted: i=1; AKwUvByeRbNFOl0P/gxIT1JG0Mq/FjJXMyTKox5IgdkIYNd+bP9e+1QUSC8WaUQNiPXWeSzR/cqIc0svXGJWS1k=@vger.kernel.org
X-Gm-Message-State: AFuF++lhE6e/N/b9awwdBDbxJiOywq1JU9+6vQUWqGaLo1aDrOp3wNVf
	u+C5oF1mtIeItv2jNfVEyEo8wGQmVXZ/0I0DYuaNpYQdV26ZkKiSCWO+zRlM9KSUyfq91S/N6JM
	li06EvtzNBNZaFK4RNK6jZFpJ7TemvSSEyiLreEk=
X-Gm-Gg: AYBFou2qNcMLq/mi9QaXpw5RIVJf8oEv0LwAoPqLO7hlZxWqjvGNnxN77fBRuOwJ7Tm
	1PWxTdkBY0wdSuiUmLmtKoadJT35q6fauUCfHO0Wwh8UY5GlzMBrUAcWtF2iGxvJ48w7pp7mChs
	LNn9E2Vo7Qjvep9fu5uxFsChRS7MACSTTF1JJD9BiVI3QK7Hq+SUdyt3JMROHPKFnBimqL6wflO
	C8yI8Z3baFiK7UVR5sjIvlaP4xMOe8qR9yJEXTaO80MkWiT089r9aZp2oeclwJKJAlI57MF9rZq
	LJuFcwsADyxxjbMuNc5S2uLWrNpae4k2pzJ0fKQMi/x5Cm0Xv48M3ot/9BNyf4EQ+z6/QGN/W00
	p1/bG+Utrxqe8
X-Received: by 2002:a17:907:73cd:b0:c25:5ad1:41e0 with SMTP id
 a640c23a62f3a-c29666bc9b0mr237997666b.23.1789149633705; Fri, 11 Sep 2026
 11:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-12-b532a3f20e71@tencent.com> <aqAvPuHUVXvkJmV4@thinkstation>
In-Reply-To: <aqAvPuHUVXvkJmV4@thinkstation>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 12 Sep 2026 01:59:57 +0800
X-Gm-Features: AcwNN1WXk_UL8RTLRmRjyTyr8SKaQwJ5F_yhnwe2m4m_bksXY7rRnUbRO35DoXA
Message-ID: <CAMgjq7BrdipNh9NFRz6Q=a_xidfa2=F013pGU2x9J881k0dm1w@mail.gmail.com>
Subject: Re: [PATCH v4 12/17] mm/huge_memory: move anon_vma handling into the
 anon split helper
To: Kiryl Shutsemau <kas@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 11:56=E2=80=AFPM Kiryl Shutsemau <kas@kernel.org> wr=
ote:
>
> On Tue, Sep 08, 2026 at 02:12:16AM +0800, Kairui Song via B4 Relay wrote:
> > +     /*
> > +      * Unmap/remap needs the anon_vma. The caller does not necessaril=
y
> > +      * hold an mmap_lock that would prevent the anon_vma from
> > +      * disappearing, so we first take a reference and lock it.
> > +      *
> > +      * An unmapped folio needs none of this: folio_get_anon_vma() and
> > +      * folio_lock_anon_vma_read() both bail out on !folio_mapped()
> > +      * before taking the lock, and folio_ref_freeze() below still
> > +      * rejects a folio that picked up a reference meanwhile. Note
> > +      * a swapped-out THP counts as unmapped here as swap PTEs do
> > +      * not contribute mapcount, and they are splittable.
> > +      */
> >       if (folio_mapped(folio)) {
> > -             need_remap =3D true;
> > +             anon_vma =3D folio_get_anon_vma(folio);
> > +             if (!anon_vma)
> > +                     return -EBUSY;
> > +             anon_vma_lock_write(anon_vma);
> >               ret =3D unmap_folio(folio);
> >               if (ret)
> > -                     return ret;
> > +                     goto out_unlock;
> >       }
>
> Hm. Nothing serializes folio_mapped() here. I believe it is fine, but the
> reasoning deserves a comment, since it is what the whole change rests on.
> Something along the lines of:
>
>        * folio_mapped() is not stable here, but it can only change in
>        * one direction while the folio is locked. The mapcount can drop
>        * to zero at any time, zap_pte_range() takes no folio lock. It
>        * cannot go up: swapin, migration and uffd move all lock the folio
>        * before mapping it, and fork only copies PTEs that already exist.
>        *
>        * So if we see the folio mapped, the worst case is an empty rmap
>        * walk. If we see it unmapped, it stays unmapped. Anything else
>        * needs a reference first and folio_ref_freeze() below catches it.

Thanks for the review and suggestion!

Sure, let me update the comment, Zi also asked about comment update.
