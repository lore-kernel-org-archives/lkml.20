Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C469B367B67
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194519; cv=none; b=ZjIqkbEsgWolWSoYiPdL6srqRNu7NDquF2ySIt68T+W5f7zHAQtlycRU+geL7vweJOaC90tSnQlvbmaZd5zmRV/ng2CuNq2CHj0z/EbsopvGe8vZNSoxhBznigjZxDDZCAsEQSkkC1VHrDP7Ur0y5gNkyQUMvEm+/ODq9vw2dwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194519; c=relaxed/simple;
	bh=LULiVBaw6hSvVUVgaozvc7c+6Gf7WHEv6ODyp56BOXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8hriZeLeeikTAYCJXCbNezsw+mlXuO783RDKD/ymwY5ZguIsmgMQB8vN7Rc4TD5/v1Do2WP5gd+lB1IAWUFR84IovxtGxNrcqxUvdf0Ag0XIUHH0kzaqkOqNsnG5VLEkU7QSJIhKl72x18pGSluktqgcksWVi/DNzGEEbxQnXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgSk6AmL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgSk6AmL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d94c868ea5so2449295ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788194517; x=1788799317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jgcy4vhcuOFybIiqsdMpVsUmfvN2Slyg4glzbZ+onWU=;
        b=QgSk6AmLwvkjDyK3Tpu2hbZCtk82I4HiBdblmyWoMsFs9Y7kdKDKkzqTudqBs3wlU9
         17l77BrU9i0Kp0x4034f7YStG1ghWfwYo7p/t6LgdW87iFzgvsP1SAHAgEjdJ7Rk5uv7
         DY38nZhj+4uXWxVm8Hg+m7eSTSvWxXBtbpxuE/6YtHLjF59H5a9+rE3NM3Dfyrpt4Vj+
         WA7OJfsayuDeJxblCLQzwZmoVQ8dOns+uH6RBzMXMADOWHJcbW3yQ4kkqKw7TnK4qOhL
         OP+lrETP9tvRhwin33GJyUXp1NyJ7dg0yjvZtp45Se5Kf2vKkSCa/tiP1xrhTfkr5Uop
         FaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194517; x=1788799317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jgcy4vhcuOFybIiqsdMpVsUmfvN2Slyg4glzbZ+onWU=;
        b=EnPNMkpqpuUZp9cU0oX+lZpEE0DKjvIbsw6trs0237APX9WWSLfGCOtaonHEnjtY8C
         fe1kCkH4UieGXkA6Z+J0MGv3gQZvg+mJDEyBXgG2RlP5sMAB0LcYez0Iz1PhlvE0Z81y
         W4kUF1LvWLB7s09s2HV3AtTXiVTDlVSezr9Nd3Jjq5y+zsaWpeqRBZUMEydT7SKl9k61
         53ztrzBnedU56lvrzZakYnCYKoX4wHa9M6akhOxDdKowY8lrut8GdJFucZiCl2lLAjmZ
         AqFr6udpkC4SvHP+XeW8xKkIe/3XTmVXY5GTfut9TpF1Oue8NyHw14XamuOkMw00I3ed
         6h9w==
X-Forwarded-Encrypted: i=1; AKwUvBzPwUJselMhKYwR70eTtrYR1J9XSKeZc4p81BdBjidakzY4AA7TdiTBLrai6/WtRgM3t4coqt/sajaorow=@vger.kernel.org
X-Gm-Message-State: AFuF++n5NE27UQzytRPAI3Kcx0dWdxhcK1BF/z2Ukw0aV+sSKWmyBcCw
	wQDqpBZpdZu91WRKRaoNK9XxMUBP33kvUwX0t100OWlWOP4lcS50UMTH
X-Gm-Gg: AYBFou0zoKhiAJe6oEa83kQWFM4+UoSkSyfEt66oxtyJUaZN7bARws9i2aq5XEHJch5
	1UwUHb6CQpp82Q6dNcFFzEBk+yjGD/3zAk4zujkVMnfHhTxMinz188gSeGmxtaHKLJUi9T8gFgI
	EsWJ64UPuAB11YrmeXFnduWQh4ehpbAmkZ3DmzWdr1Wf3QF/3vbgT6XOVkUODIq3mABD2WVN6cA
	SDRrVT7/tMiS9vRAxt0nI+Mpyh8h294isIxHgStNx1hPQzaGLOQj36tVch8X+KxWZ10AuE8XeDs
	PyDsestIlj1kCyGuiwSwOTb2E82NBYAx00hC8kQ30CY8d+XXGgyZmvHe6J/60X/aX951eNKeZGX
	A5cTRlk05ckRCMdx8sxs0+tGAHB83+nwC1tjCs1W3MJLY/GQwIgAi5mvpgRIR0G/WcjwqTJ9HfE
	FS8dnGq4sukoHy4VrO9v/NTsTDdpsLbXghMwb9tk0jeQ4sZv1geos+NwN7IeHIAUEy1BCS/g==
X-Received: by 2002:a17:903:458b:b0:2d9:51bd:534f with SMTP id d9443c01a7336-2d951bd58e9mr1320725ad.10.1788194516382;
        Mon, 31 Aug 2026 09:41:56 -0700 (PDT)
Received: from gmail.com ([185.220.238.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988a1d6sm39974305ad.55.2026.08.31.09.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:41:55 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	akpm@linux-foundation.org,
	david@kernel.org,
	riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/rmap: remove stale hugetlb check in try_to_unmap_one
Date: Tue,  1 Sep 2026 00:41:42 +0800
Message-ID: <20260831164143.2517715-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <apWlLTa3oZq1wwvR@lucifer>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 17:00:56 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> On Mon, Aug 31, 2026 at 11:59:12PM +0800, Kunwu Chan wrote:
> > On Mon, 31 Aug 2026 08:28:47 +0000 Dev Jain <dev.jain@arm.com> wrote:
> >
> > > Post commit d4ec5572825a ("mm/rmap: add try_to_unmap_poisoned_hugetlb_one")
> > > try_to_unmap_one() cannot be called with a hugetlb folio. Therefore remove
> > > the folio_test_hugetlb() check.
> >
> > Yes, the d4ec5572825 change shows that try_to_unmap() dispatches
> > hugetlb folios to try_to_unmap_poisoned_hugetlb_one(),
> > so try_to_unmap_one() cannot be called with a hugetlb folio.
> >
> >
> > It would be better to add:
> > Fixes: d4ec5572825 ("mm/rmap: add try_to_unmap_poisoned_hugetlb_one")
> 
> Nope, let's not thanks.
> 
> This isn't a bug.
> 

Got it, thanks for pointing that out. 
I mistakenly treated the stale code as a bug.

Thanks,
KunWu

> >
> > Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> >
> > Thanks,
> > KunWu
> >
> > >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > > Rebase soup - my huge_ptep_get() fixes landed after the refactoring.
> > >
> > > This patch applies on Linux 7.3-rc1.
> > >
> > >  mm/rmap.c | 7 ++-----
> > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/mm/rmap.c b/mm/rmap.c
> > > index d1819fd699380..606c8ecf31302 100644
> > > --- a/mm/rmap.c
> > > +++ b/mm/rmap.c
> > > @@ -2299,11 +2299,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> > >  		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
> > >
> > >  		address = pvmw.address;
> > > -		if (folio_test_hugetlb(folio)) {
> > > -			pteval = huge_ptep_get(mm, address, pvmw.pte);
> > > -		} else {
> > > -			pteval = ptep_get(pvmw.pte);
> > > -		}
> > > +		pteval = ptep_get(pvmw.pte);
> > > +
> > >  		if (likely(pte_present(pteval))) {
> > >  			pfn = pte_pfn(pteval);
> > >  		} else {
> > > --
> > > 2.43.0
> > >
> > >
> >
> 
> --
> Cheers, Lorenzo
> 

