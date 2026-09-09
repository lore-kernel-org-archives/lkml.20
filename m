Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36845477E34
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942673; cv=none; b=cgI2JgH/avLN4PT4teP8riK2s2tFu/1QF8gRrc2xLvtLPBxyJ+njEzwS2a+SjNXmUTW5wBcjhiqQdIPhLbVuZiWRfbpEzsgGUsfawJMyls7XgVB+Hq72gVdBHGULkJxK8NNp6RmY3mZpL702FWJmkVR59qG9ZB3jJnaXCDOZKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942673; c=relaxed/simple;
	bh=S2bONS7dzsqO2rivXn2XsqIpma3PRgODKmo0GBxCgeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0jIueAlbJKMX6HWtDscbS0xetPDclyDrwJx1C01a6J7pttivgjWDwlm1ppJXvxIZ3iX538e4MjeJcGlJLhAtu7G7riN2UYhRRSaOdF4n8axMAF4ag15m58/qIwSWU8haLcPHrE4P5RwD5RGE7XIepssVMyULsB3/TcVNs95b08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbBlkFSP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbBlkFSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549821F01571;
	Wed,  9 Sep 2026 08:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942670;
	bh=49b79tXZ1ojnOBAvllMdWWZAZmvMuellAdm87qct6mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HbBlkFSPXX8ZkcG7PK3x1GAM4ddIqY2+DpFF0WeBKZOc7IFdqE4c8hZYEh7viZxIz
	 dXq4pIFwVcVTociG30lvW7yFPPmcDCmsf7vA6lYCTy2EudobZ1L2jbvLAOj7xbZS0c
	 Xpt73Ab/9dy4KPDxC/G3iFLgBZJFPFtHCoFyd8PtG/vLbrP4GoWmYYkBZpCM20z3+T
	 Ao+75AFzy5m39NtdhO2ah6TUPcs7r9vus4Rc0B9YCwLCDEsKv3CHLOTw7O9oufyuLV
	 0JtVdguP4spGb3YLulJVQMM9rvbTD9y3ZRJIymC9slt5aaf+8VXAulywrpHCllUsJF
	 QoetwI7KhKyKw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6BAEC198004A;
	Wed,  9 Sep 2026 04:31:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 09 Sep 2026 04:31:06 -0400
X-ME-Sender: <xms:RRmhajLo2v2YFUXYtRvA0EJOlfM7ANT-p9PwTOsBBBWUcJScxOWdYw>
    <xme:RRmhan_tBSDvxxngx3WIEcVCdhn99398lxYom_n-00fmSho4OhXFQC3MyUQYFMypu
    eadl7EhckQh8-Ny3keImGGAcD9mB-vrnZrGPET_111xoeg_9t7BGhjd>
X-ME-Received: <xmr:RRmhaqR5Qq_NWV-x2FAyIVNc4SW9Nl0sSLoLZfkVzYuoFbDxVjnVM04rOGo>
X-ME-Proxy-Cause: dmFkZTELTlhkwM0l2R+5g/fxcwFlNyvdctxCrOr40Ut1USJWCs2K1PvKMMexdwKir4zss/
    yqEmTxidW3Pd1h5Q7tq5KIJixyQaQNHBOGsDvKp12L1QF2hGcsRKUXGxjiFAfB6VgS+EvT
    jAXLkiQ97wco/XOrWqDxCPn87uNjzVV6DHh0kKPPYrvPOLITT0CSx5lhwJzVHbpSojPi7D
    ZfIqQfbl59h9lG+jkdlshuUFh4XrLfbDTmpDqR9sxWMbAGRZAcdW6OWQv5bDHxlREtVgi6
    +4jk0+KsyqERUGW6jWU2PIyljNd6vZkpy3FIOdT1djFwfZpocijMiIo73BKDKmv+7SYHXn
    8dzDpj1favalkqenN0D4sC6w3rZV8uhdM/PlJYIm2ncZoZ4N5nIivXHDIhv1zsVEgvTd21
    w/piBQ48F7x130E/RfW1skPteyxPvdn9/2iCJ3Z+FGJhjjaoPDVYmiS+wyDLcCPHFAqKAs
    4bKfvkMrWr2C6WE6DfoKvRnx81x8Mxx1MfCdHcSl1TkockztyseNfN2Kx9TXRCsgJDG3gN
    k8v4ZWt8GS+SWkQlzmeQuKGO7W8A5i0jQTKfzdUVrsqV/7z8cTilBoJIsG1UMcrXgiglkp
    HMhmqBKvGw3EzsT1ivksTlI39xJcRTjdnHAp6DYJzd6wQrjbWw9RN7r16F3g
X-ME-Proxy: <xmx:RRmhaiNPUCXqPoWQ9CnfgNWwx84w68OnQ96KP-dFtONse_OHrHcT7A>
    <xmx:RRmhalgFxGW3dFuukqIZQu2eciI9sSoA_XBkcRLLdMpQhn0o-ppCeA>
    <xmx:RRmhalJHSiVQHIUfzqvRGyAExaVFuwdrc3SmOPx_eyvaeZyjUZH28A>
    <xmx:RRmhavY5wE_UaR3xY58GJcRLxWs9iaB1OUkoA-J70fbxNU9FVGDazw>
    <xmx:Rhmham2pfAoNPNA-G6mqGL8hWgZxpg16_DuTuH_SolAczFKAAjKatiMb>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 04:31:01 -0400 (EDT)
Date: Wed, 9 Sep 2026 09:31:00 +0100
From: Kiryl Shutsemau <kas@kernel.org>
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
	Yeoreum Yun <yeoreum.yun@arm.com>, Shivam Kalra <shivamkalra98@zohomail.in>, 
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v4 16/17] mm/huge_memory: count only swap cache refs in
 anon folio split
Message-ID: <aqEYs-oUx4CE2Yja@thinkstation>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-16-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-swap-thp-cleanup-v4-16-b532a3f20e71@tencent.com>

On Tue, Sep 08, 2026 at 02:12:20AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Only __folio_freeze_split_anon() sees anon folios and swap cache folios
> now. The file split helper only handles page cache folios, which hold
> exactly folio_nr_pages() references.
> 
> Rename folio_cache_ref_count() to folio_swapcache_ref_count() and drop
> the anon check so the helper counts what its name says. The file split
> helper now uses folio_nr_pages() directly.
> 
> No feature change.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
