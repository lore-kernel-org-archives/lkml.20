Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C213E5908D7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655074; cv=none; b=D5n55UhLh5s0gxhI5WfvoIbD15DC+2g5j4tmRDpuXjobIMFpaM0GfXdR7GtAdtPFe6GeNuumWZnwCe2RZT17F6hXnIdoxcjsxLGwYcvyk7ebrGWLFmsX5fg5+SSlu01drCoBB0q+cGdLPkhmbQoz0EpXtWHLfJhY3NL8RfxQvwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655074; c=relaxed/simple;
	bh=8jktS7JYfypCcDIAdFDJF7TJB11M1e1igwwZQesJgAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8K2Oh8H5EKdfsC4Ze7QO3MqpkEU/PRK76hT+5dyXA2SDxBbyhPMWgiBaQeB1kfVOjLBKqCntZlNJ89Ap10jr0fLhbXtbx2kf1KbzMxYBCQEDeqktWVcp7xQ1QK8xTiga2dCwf75kg+bqMtOP6waQIcbHSWCS7El8GL7jetPcV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHIQSD+h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHIQSD+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D830B1F00898;
	Thu, 17 Sep 2026 14:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789655072;
	bh=6jvbgmg7xBtScoD3A0f2vhmMoi9r4XqdACuqMBZf3Ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AHIQSD+h1jIAoULc5w1mw2MyZqWiLrZtHAKmAcoKDntOnOeV0+yqpesaoOoMR7eVi
	 IpMHSZCG+c+ok3HLCcdLj4pWkmSj5+lcRf494LfPj5Th6eCASKd0UJEZJNd1OG6w9Z
	 B9rzrsy5CWHQANyIY7pgE6rwi7SuFoG/71O9vpD5E6RaCfRAduztW8rodtLhcSf6Cl
	 q5zPbZL+OamuWhIv4/BuI6c86ck139ABhqwv9BHZfszpLen41pzoFP8ghmtYnDpTvh
	 aY9g6XKoMfWhlVwpJASX933yAbx49rH8e5fKGxeRFXHeyOZnCEGCZDjKouhgRM7QGm
	 vy3lzx1yBVMvQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6F5261980058;
	Thu, 17 Sep 2026 10:24:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 17 Sep 2026 10:24:30 -0400
X-ME-Sender: <xms:G_iram7feomC7yHwoinUmV_EtURuOT0zCp1oq-VywvzhfxAriT5yoQ>
    <xme:G_iravx0WGzz525s18ZiaN_-9RCEPwRrPcGsb5-Pqd0s90r6kz8_b3jjIBEhiQg_J
    OteLnfpvNC1KosPmBSxjs8qlEwdV6HmaRVjtL7LfqqL2MNDtuZ6TQNQ>
X-ME-Received: <xmr:G_iraiw-7FGHmDWJxUNTC9kcBQNFuNMNLeA-qWZRyrZ9IaPP3rYnTd03ZyY>
X-ME-Proxy-Cause: dmFkZTFiJne9d7ut4379TdaEhOYJEfhNk6de6RP62W62P6FcjK5SF6md/cm+0pDsJ25MrT
    /q6b15+QdXJ4Q1HGGR/b3YzO/kHRjEJgJEiAF+bLeugjD8pgFSavNNW5zgHiVI/booYvZf
    kqEKROzApTaL7eavowumjxtah55MGiGQyJ0/sMX7tH7eTbOYHPwAAaPYo6WH8oB7SLZdNv
    s8uL89t5P21QtKRiN+SY57IOX8vl4IdH8LZbaBXCWmf80ijDQCW/BPea8fNAamtw/cwwt7
    DvTEPOpwvT3NLW8y1fDd58r+ope38dheM434OKaEhZ27no1CzKhT/lnNIik1REnIdS/Qnx
    mi8Z25zrHV6+kn79/GCdIQnPr6oqUUU67MmaMLSYY7Z4GH7aWCZkGwpB/+1CA4NVjY6omy
    CYFOfJgyetf9iqIM7ckIEs8i7/rc8+uid6ArZcOZAIsIcr6QbiGTwp1ceBl/3GvbPM3lZg
    Fw7oCJ/gsWpzA3/CGZ6QM5Qz+m3JAIU//z2KpUpI4YfwRLYNdHnc6Tfp54d652QoQtVwYN
    +GzoXKTcu55PdT3fa7PR8bYTLWlixiEOYX5J8DqT9Ae76+kAd+YLBBkZgcfi0EyL9YTdVG
    ST5pzni+bfMhUA8V+D2XS6NHTccps8iMVuAs0gRAptXOgIZvxUbVVn9keTnQ
X-ME-Proxy: <xmx:G_iravW3soFWJBvmG4AbpX0rIC0cOvK6wD7ei3yKMjZXYvRACs4Ssw>
    <xmx:G_iranRGwgxnIUqS_DVePtf7AhH_7oEw7inC343PgTqXMCytVCSnQA>
    <xmx:G_iramN9zte4BK_h9dAAH_-WqYZoVXN0xLZWha1S8k6UHPzWX6Dung>
    <xmx:G_iraswQJ_c-x_GaCZD00s3uuePekcUo5PCaf9FRyGLseDdTP07Iqg>
    <xmx:HPiraooHDiMj3vUXgdjlUgDQvalcmd_5bMD4uWYPym_kQj2ncEaytHCU>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Sep 2026 10:24:27 -0400 (EDT)
Date: Thu, 17 Sep 2026 15:24:26 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mm/huge_memory: simplify pgtable deposit detection
Message-ID: <aqv1gZso6EwHEcoI@thinkstation>
References: <20260917054015.23553-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917054015.23553-1-lance.yang@linux.dev>

On Thu, Sep 17, 2026 at 01:40:15PM +0800, Lance Yang wrote:
> Whether a PMD has a deposited PTE page table only depends on whether the
> architecture requires deposits or the VMA is anonymous.
> 
> Implement this rule directly in vma_has_deposited_pgtable(), avoiding
> mistaking a non-anonymous raw PFN PMD for one with a deposit and attempting
> to withdraw a page table that was never deposited.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
