Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA1347D933
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841605; cv=none; b=pK4O+IxLljNcPywRCekc8x8+PLXw/66jZedoubWsoSLisfQInO7H2hdDcqgXcSthtaj2MX0Xp+zP/Y0FntkrTV2uzGv0zt/R3SnY/AQhv5av/dNfitPUX9c1ncPJOvfS1Y0YcliQ33JeH6WdYfesEtkjIicJAG7l9QKuVFuZj6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841605; c=relaxed/simple;
	bh=Hq+2FwWEE0FB5KvW125Qj5PDIcZkwGMPhhIaBNJ4VdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J20dDC7dwgyqdo4NQg64ov9seoi3hcKCnJeeW4gsbV35AQymyIDgsvuUGAcDR0pS3QoPiRQVpjkpnSkAGOF7SHbjVFamAY7XpqebNwJL0/ESyPhvWvFZrAj1Ip32H0iNrlyb/Bjbl2qMMZUAxfXOcvTuiHZN5A5brOFTZls54lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=GAhk04v6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KTS04DAs; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="GAhk04v6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KTS04DAs"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id C50DF13801F6;
	Thu, 27 Aug 2026 10:39:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 27 Aug 2026 10:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787841595; x=
	1787848795; bh=PmXkOSNZs2elL5e5I6wwGuMLGDRA1m2bAQwoveOqBhw=; b=G
	Ahk04v63CrJ+SpgTWN8iz9av2sjcR//zMT3jK/NDZHSOuDYMvCR0b2sepjLqvUzw
	fnQth03UC04xWxJujqh8z3XVHFPZWhLwwUjx/T3FPIpDzRGJ+Z2pAItoVw4yksuv
	wUXUhrQiRL4rDXCM45goaKPk1mBCa4J3TSqtZEz3pnpNdQv7rU7pnxkm8BsMj49A
	xeou26pq2Rg15jPT87VZSYEZQAS0v62BxMAW4X3b30jgFWa1Ykc8IRcmIdjvvYA2
	IotjCnvbPG2liHub0ZapYnzSXC/ap+KA44t3RsDDSXnX/CK9EbSaHkwOMaDoqiSM
	3z3Sk1otLOttxz56rsp3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787841595; x=1787848795; bh=PmXkOSNZs2elL5e5I6wwGuMLGDRA1m2bAQw
	oveOqBhw=; b=KTS04DAstGVOk7vSlS9GUDI1PsSHY82XPyiwoorQOX8HsMKNHpo
	vj3jZd7MUyEW0MG1WDUppwArln6yOl/gaLcm7NBYLfrqn2WxS6WQcJZMGSYd+M9a
	u1JrF0FAPUeKv8VD4f8KYhTLUgJEmNXKotJLDwEzYuH5TioyQSzZKtQuPSRS94yj
	HlhkdZ+s72dCLGKpqdTVQThBXXTr5yFq8NV0Pb2NAHPxRQvZnstjdjiGND2zsDlZ
	PnugVhMnx+2IrNVaR9oGrFMabbrFkPUkFUnQ9Zbc9KicbePdqxcXnb5UlA1qfVA9
	EjW/0ru/hAN4BMQDPtCtzhrjl+vosu55xMw==
X-ME-Sender: <xms:O0yQaiuLhgMleZvVqlXPLISzn6TnW0T671KLKhWz0VpNKGLCJhADrQ>
    <xme:O0yQal70Zklq6RVKRcgyI_S-1asWjsxC5Y2rOvfJtApJSkEF24QpOSN4bwupN_bUH
    fX4lxu3nfRNoY6F-I5CxolXF-YPeapRXmRV6KDwWXi1jiCZ_uzIh9E>
X-ME-Received: <xmr:O0yQak4Hd4qqvzdHH2Q4kxNVFNSL_usMApD7EmZJgylWFs0gUfj8fJKK2fs>
X-ME-Proxy-Cause: dmFkZTF53zJdy8C9ak+D2cJrj9KahptHyXqMO+7qTBjWqPFv4Pk/c/sJRfNdF85mEo/adX
    gGLoIYNq0S7yi3kS/l8ebpfkIgIKK1SdvU42cGRonv8sruTt4LMkmMo9+g0mnFIvmDPg4k
    eWP945j6fe3VbMi/dpWFcRHzNTbkUueKwitYhnihwltzPwSBy3IfkPr+C5Vx9/XgWQms98
    F6kE6342UWsZ/hJLg3KLvXXUmv+6iUyFSx1vfUTqQIf1blpoqyvQlGHS+Qoha5LJ2FkDge
    FWPMgiunYlU7+4rekz8ukbbSSaaEgh63pu4dRQ7Qt16Qf4dEoOvUCw26V6rhx4XnHAS+qS
    59jDmXQlOUr3YRknaLDFKcN5BKb3Ro7SMh3XsfdyVLsXbp2f9SHY0vpmslJBgOeJIHPAj4
    P11vo7kSiXcfUGg9dZqm2CnVZPD0QXNFeayfa50kny+dIx+4Dvaf2Iah5kW1NdAH8SkJvF
    plxNdWIbDGt2myJbvrrIke5o514syaFtJLOHU+p5Sfp54ezDNyg3AEHwfgr4QomdE8K3vU
    Z4bc5sKZmv7FdmMWfDt2GLdkiiZfFsB2KeSswgORo4sCkVlERr/NEVo/ZYOPB0WsnUucf2
    q1uzR/4OncAzkvO+Mf/+IDWgOGI84TiVT1iznqMRBoJUhWBsGELiknuXR4FA
X-ME-Proxy: <xmx:O0yQagzlYPdZQjm_uAXsaVpHvcN-cc0xZDlHkq3vv8BSdwagkO6WIA>
    <xmx:O0yQamVq_hIP5Z2AH8z9NTmCskelEkMVBoSWJUkS9CbVgY3skQ_eeQ>
    <xmx:O0yQai3Apx8aDt7R-XsmmXBS-OX0HJ17BxVzwL_KMl9zprRcbD3w7A>
    <xmx:O0yQajT0v9pSthDabJj2fmW_p4iPn0Z2-qute18xQxbg-vjX_k_kIA>
    <xmx:O0yQaoHkz18vF1ghtpUQJieRimNGA2ZSr1KLUY5g_RHiYwqn6ouAedMl>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 10:39:54 -0400 (EDT)
Date: Thu, 27 Aug 2026 15:39:53 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v3 03/18] mm/huge_memory: invert folio_ref_freeze() check
 to reduce indentation
Message-ID: <apBL1icEHMt7QcT_@thinkstation>
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-3-9b43f5163238@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-swap-thp-cleanup-v3-3-9b43f5163238@tencent.com>

On Fri, Aug 21, 2026 at 02:55:16AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Invert the folio_ref_freeze() success check in
> __folio_freeze_and_split_unmapped() to return early on failure, which
> removes one level of indentation from the entire success path.
> 
> This is a pure refactoring with no functional change.  It prepares the
> function to be split into separate helpers for anonymous and
> file-backed folios in a later patch.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Zi already pointed out that it interacts with my change:

https://lore.kernel.org/all/20260826162101.1314941-3-kirill@shutemov.name

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
