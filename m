Received: from flow-a6-smtp.messagingengine.com (flow-a6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7A2329C6D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842702; cv=none; b=jgTajMUXGWpftj0a4q0rA3AD+V8lt7Dc3yleiNo2hGl1Sy9q4ZqiaKLi7fJPES657ui8PnX/ux8Aet+gtJVS6kJBahNeLVLPiHMR7tIC2YWDX8ZHxBpi8kutZYqn/vOeVdnXzH+QvJ6pcxwDVNsmBuI5Sj5qsTYWrFyGmRsoeJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842702; c=relaxed/simple;
	bh=EQdUQDKTOMLx2miNRmh0eKRty6cnq2Y4C34CJPZAgTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBbBpcYLYPHi8ElhbPqymbFGf4HOL8/8zIP88UpO4ovcbgjH5/I3zmXzoTT5UVThxiBI8PU55PMdWM9hDZ7H5xwCUDbw3foOUfFBjHy1uIZ93MGctEP1DfAVx/tAtzwBcUPIKmfxiWczPCxy16sFBlTQHmwmq7/oiGtSRt3azYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=kwRWFxPC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HRh8b7GR; arc=none smtp.client-ip=103.168.172.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="kwRWFxPC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HRh8b7GR"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 7BF531380214;
	Thu, 27 Aug 2026 10:58:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 27 Aug 2026 10:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787842700; x=
	1787849900; bh=CZZ93FItI8JMFjwX7flkmn3kmtJ4ez+8sQ/nTIMgQBQ=; b=k
	wRWFxPChA/+9q+HXIqhe4ILwZV2YnpovrcH33nZrbiiMbQv1Fb+Vnsi/lA2l5bSA
	xGihqJFSM+OwSgMYJVfjxXYCrksDRFTu5rOsa0XTxp567gZ23vBrGn51zfXyTGTc
	LFBbkqCw0uaAQAkdY/KjMbfFBQqzNJw4IfOvhvWV+rPv5e+uWb7xOEURMNFWR3Ac
	MPn9RkUTT6q7Oim6HiVL5x08Edh6IFC/IKsi8H0SP/rlRkc+GhJ0vP9dOaN8fVGU
	MTz9FzosWpNr8iPWDVXbmhod78y68G/YIZXM5s2H8uKfZc83l0qruPm5fhiope58
	OMRGp7Kdkkq2E2BQNreKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787842700; x=1787849900; bh=CZZ93FItI8JMFjwX7flkmn3kmtJ4ez+8sQ/
	nTIMgQBQ=; b=HRh8b7GRH1oVgBmOfpccKrPL4lzHiPSwPGvF15i6Zk/kFma2Rj0
	1KYJBxiBW1zwVpIKsjfKiQmFaYmTe4eCk5G6YxZYQDmZ1IWj/4aoD8V5sLRFw9VO
	V2J875dwPmZ9NB5qmpcFeQFd7WjvDCj+hyvIkNXJH9qCKA4LS3+jdCyiPc0yfmOt
	9uxsNpe2sjsyR5BW031SMj8xs2PSZ9LHjJrOTiXfIFYZCJ8Nk1y+m20vdi5WYVjJ
	8fArNzR5ibVBACypZmPUJBnEtLv5GyyJCSLdya1h5nCrmluvqaHw5D7Jg4q+2o2i
	L7zRfxvncrbbXu/b3Th2M+LipExr4E7lnNQ==
X-ME-Sender: <xms:i1CQagHyJ0lwB2kqPyRyW2BYpU9wl7uTP81o2juYRSsER3KImi2aBg>
    <xme:i1CQanwBzFJFmYZ_x3r8WuA3n_V5vrQVA3yfopp7LpzTo0R05lSA4jHifIenK8fHt
    LnazRcIDtxmPDNTGokkbnRGzktQHp5LlPlOKT0qErxtQukkkp8RzBI>
X-ME-Received: <xmr:i1CQahSR7m8G-qZG30T61Iv8QvfBPRX5puQ6op5WJnXhOif80VIqToSjikI>
X-ME-Proxy-Cause: dmFkZTE2YGGlRLn8o8CpHCnnIZ36wcEkXQe2Zjt8vFyB0bm/6DdRWdjZgbt61ucV3J13VS
    VBz7jEGs3zGW3cd925nfXGhllcdmwWbs8OS7LzZPwF9aCj7PiYtuU2lbI3gWb2EEkcuO36
    iBb2WiHb0wSh/94oaiLLIOYIrhAHpNzqYHK5aAs02VkOKvVSNBLejFtl8+O0/TudfepxNA
    hla3yKqiRsIxTgZ9VU+t0AfjLb3BTnimv8pVLf6zyDT1EwCn540egbr7DcqcQ8wAzCLyCI
    S4wSXwx9Sr39euN967/gs3pN7QBLtYZMoBkD0zKPKKzvBx8Ue3bz9HZmsFLc31PX0PD0IX
    iI1A1/Y6oRDRCc1/W7I3g8DCnrfc5ZKjvCDzBoVr9yr8vHTChO/+chuA3eGn457/5B/JGi
    KJ8tXmHSiqEbDrMEY75S50FZ2uWuzu7mSQuEJhea7I4OJdFWQmuuGSQb574XLRvq0KkW6p
    MjBuX2Tq2UABEWaiZLUB/uXwHbxCCmTZprHWVdM5Bq3sRhp3ap6/hXM+VLfCf3KHH6jWVb
    0ZL0yj+LgtaLv0I7aRd9DNn59Oi0Kag7HySLWszn4fNXbuxluVTZLb7E3d2ZXuRTZS6G9g
    tJOA3TYqfUhC9XalRHOJZpRgNpXEplDVeJla67NoyYSqftq1bKSWBfBHskvA
X-ME-Proxy: <xmx:i1CQalpylsfbtaEyTdhXSZn_ds3otriGSfgqgu6f56nlfdkdrxFg7Q>
    <xmx:i1CQapuop743oa6li2OV9TsENEu-IKFvBgfc7gn_Z7ulkkJm_qgiPQ>
    <xmx:i1CQaivBY3IlTxWkhzT5KRi0jfnDxpQh-V_1agwEo2cgnfFy4TGR_Q>
    <xmx:i1CQalqU2CupyrkpQvw8sQ0Z_yR9SFiZig1ox4inh-Z_50AuQeZPog>
    <xmx:jFCQaj-27eYq4kc0_VDKfCjwNfh9YXV3D2BjOisJWW6D1UoQRcnxI6A5>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 10:58:18 -0400 (EDT)
Date: Thu, 27 Aug 2026 15:58:17 +0100
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
Subject: Re: [PATCH v3 04/18] mm/huge_memory: split the routine for splitting
 anon and file folio
Message-ID: <apBPFRdRdJqODHzQ@thinkstation>
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-4-9b43f5163238@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-swap-thp-cleanup-v3-4-9b43f5163238@tencent.com>

On Fri, Aug 21, 2026 at 02:55:17AM +0800, Kairui Song via B4 Relay wrote:
> @@ -4064,7 +4095,6 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
>  		folio_put_refs(new_folio, nr_pages);
>  	}
>  
> -	zone_device_private_split_cb(folio, NULL);
>  	/*
>  	 * Unfreeze @folio only after all page cache entries, which
>  	 * used to point to it, have been updated with new folios.

This gave me a pause.

I don't know much about the zone device private thing and I had to dig
to check if such folios are always anon. They are. But it is not obvious
to me why this limitation could not be lifted tomorrow. Nothing in "not
directly addressable by the CPU" implies anon-only.

I would appreciate some explanation in the commit message and maybe
VM_WARN_ON_ONCE_FOLIO(folio_is_device_private(folio), folio) in the file
path to flag surprises.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
