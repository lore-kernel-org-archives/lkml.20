Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAB2538D73
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880440; cv=none; b=IjeuDBN6o7FLRBEoF2W6aQcTh1ABPjSHCwXtzw/mvMJblORfEUfMMaizacjzmWYFXmCj16EeGXYSfLKtbH8nd99S4G78Lkk5dmg4I2gBZVlO35ji0GXEHpjmDyD3rzcGFp3XXn9j0IcuNVZmkFVqCdq/BSvhp2DW3VkdbPEUHPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880440; c=relaxed/simple;
	bh=LunjGKO7O7mBvE2kK/igMuhkYj3CTTqLwKlw4eujefg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/w1/K5W7SNnqwTGSNAiHqPfldR4WtltNkqanpkfjjSFKXogdakNJ+y/eDKNZ2NUUDMMIXlJvtHvvj1o6IBaixHnd8wOPH8NRCz+omgiAmr97rG6u3zQVoRdurkz/2bBgx5BTRfKltBA/vsP9SZchyTdWjgf4COySn6F67MLfHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33981F00A3E;
	Tue,  8 Sep 2026 15:13:42 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 148E5198003A;
	Tue,  8 Sep 2026 11:13:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 08 Sep 2026 11:13:40 -0400
X-ME-Sender: <xms:HyagamyqoJnb88x48ecjkqXIGmM6yEPbqcGAYIx6iVL5eDsaFQ3LXg>
    <xme:HyagajG8MXmdDl842GDAgIOTSD2UmzbGyztgBLHHurHcZuZAVYUq6Q8bQZKacXeb-
    eOA9dEa4-_4bWGajdhDWV1wzzrppGYA3mJ0NsJmpPMvxMpO20tiBw0o>
X-ME-Received: <xmr:Hyagam5nteqcoy7k3LNYIAwEhcE8zbEcVBK266qlXyk6xispleaxc2_Ic0I>
X-ME-Proxy-Cause: dmFkZTESaxOuzeIzUb7pYu/ajwm5NhNWJYdY2isfBcty34gtQ6Pwe+s4eEC1fJrhTAlDdO
    FjHnzt6qt8+lAGUIIoPiYqmucaikse38hNpvmfclkQ80xpW1bz1B30mB0R/gPss+tUZhCD
    dhlSJbVDLxGJlVWEFFoHyV57MZKVealYI5QxIkjMaKYg9eaVh6DWitRUuM5e0wRcG0OHeG
    zj34sza7Zd3kMEhvxdadwjuKuw8pk1EJDD/ELYCgoQxtsBMhKj7FU0km8PGhMhBTCGdNen
    Yj8GNb/r0sex81mZbbJKFkA/4KEG++Z2tEyS42TvV65pyKzDLV5wGiwZtsazgv+shkl0Ez
    vD1666cLVIAatJJTiVDaGSSplaVseKmtZxnqOWv+WihLIXEAddihbrJoOQw8MWuXcIkms1
    vwgmqr4l7mJwVBNt4D3VrLoZftcH7pD5Vxb9ZbUrzN06dTd9rc2RtjQZlWWYwVD1qntiSX
    WpxgwU/E9i3kZNx2brxAFOwvYigokqVdWF624PLRY7W8YlsMhGaBNo6zRrdWXwPI1rA0wi
    fAHQQe875AGKOTamckeSDNCBjTIE99/cwvgvqKHrjsCA3y96T5D8kSc0hREhJYaFzKxcPS
    ftzg4B7ziesyDeXJRLDKkDSPxL36vszm6QxrTgnHI/lsRtTz0gp4GsJy672Q
X-ME-Proxy: <xmx:HyagaiUKGxmPD6t5weSMBzxOf6-h11xtoqJ321MFpRui5xu7zQW3pQ>
    <xmx:HyagajJx8XhYdV-4vcrM4l5NrRks7bXuSu3SekOy98rBAuy5kdbQ2g>
    <xmx:HyagaiQPf5dRCXNmY0V2nmS699ezPx_74Wcfwc19n51-2IAgK8lNVA>
    <xmx:HyagamD6V60CMTJcpSLgMb0mBXzAOHC3_qHoVoLsY6vXfRX4PIDprg>
    <xmx:Hyagao_SsIhbBnUnFa4Tg9b8SRmV-MvY5AWx9WynStj1LITq2diUMZrp>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 11:13:34 -0400 (EDT)
Date: Tue, 8 Sep 2026 16:13:33 +0100
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
Subject: Re: [PATCH v4 08/17] mm/huge_memory: move unmap and remap into the
 split helpers
Message-ID: <aqAmD9C1Y31F6ByT@thinkstation>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-8-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-swap-thp-cleanup-v4-8-b532a3f20e71@tencent.com>

On Tue, Sep 08, 2026 at 02:12:12AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> To prepare for further cleanup, move the unmap/remap handling from
> __folio_split() into the split helpers.  Only anon folios need to
> be remapped, so remap_page() is now only called for anon splits and
> the anon check in remap_page() is redundant and can be removed.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
