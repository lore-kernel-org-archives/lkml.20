Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6B5363C72
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942450; cv=none; b=Ivi3/pYU6xQfxAGS4S9k0CZFgXK+PvVKvQdNCo8K+LgkjUBcNVYfEt5Cw797602+9w7pR0PvVAJaS8Fz/bS6hgrrJQqqZ/sitU5BI6cB3FJrOr5qYIOu4gjF6WFkgHqMoGJmVk4f9hLCxf4msXYMZLti4ZU1RUFk7mCOYhgVH54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942450; c=relaxed/simple;
	bh=8y+R7oJ7PofLnmGKeSrfdn3MPiY8bYyvY+qrd54s5C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pc8hljZzDoW21LAqNxtJPvjgn91++5GNuNQKc6cwKCY7QfT97OlOi62M3xSyXqNWRMolsEVYKSGY+2p+qz4nDHZjoyBgGxYe7LeEOTaDbwMr710o+ZiOo0aCVFVANxmLi49HSzUj93/aHvOQ3N+MJixyjep8HZ5Qxr4DefhrbTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxpQ70vV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxpQ70vV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757061F00A3E;
	Wed,  9 Sep 2026 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942448;
	bh=/0Rzyh7HeitS+Cl2oZ/+e3jq2LIt/O3Me5tIP5ut5HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DxpQ70vVfyWUmA+ZrDRsQIn34dRm5mR60+YwqLQSAkYCb76TYFdtGo2AprxlchWm9
	 lk4KRk2DR8oBxN6xpX4QSdFGHEgFl4xMUzb8ceB7yEPStNQMRNWWo8YGlAP8rO+bD9
	 3zIWMRb9fqQyFtxqls8igAEJYrUCSd16z2VeqEFaAP5xn28G8spfK8O768e3TAYEMH
	 E3EV07hrkoRZjbJ5fOHmoN3c621XPnsIx+L3i4Spj7ykysUnY1P74iLw9xTuq/yRnj
	 HjKN4L5oGHL/ldrg2sBsvPGOyYmwpVisuJ7sHFhkX387VbCXPb5nTgT30imyOnrC6w
	 wNRXvUS/SSPrg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id BBCF1198004A;
	Wed,  9 Sep 2026 04:27:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 09 Sep 2026 04:27:26 -0400
X-ME-Sender: <xms:aRihavEBcfVbhPHnpy4Dx5gxxb9BHr8UgqEX6IBNl3-L2IRg7YIuOQ>
    <xme:aRihavZkTdis2uNdY7hB8oUXr1G6KGAPuqqU8VFXH0-I1mQGRiQAaim2TnZaMwI6E
    0KplmyMLvRO457kSmdXm3ZjPg2cVOfShBNKBl_LQw_3kb5HSwQXGhiD>
X-ME-Received: <xmr:aRihavMkjftinPWAAr8-QJGp7kK73JXVTHOl17W9Mx6GT2gxyoWrj1OD6oA>
X-ME-Proxy-Cause: dmFkZTEddfZnEYmTf1C6cpbNKU4/ggsY7/87Lkko5CAZ9fe5ECTgAw7eKmfXAKGYX0kEiR
    vYXB/QXOu/xyNcJdmpPk3Mvy0n+fQO3A4k8A6sl8IhYiKMAXteKY2F252zlOOHu2+HKOxS
    N43N0Mw0CkGKM24YIScpJdp6nF5meX8cQPQpaut+nI/VfBoLK/FflQQHbgulX3B2hyRnAB
    Q8qQMNdPe4V7ayqGRX06Py82LMVtnNIv/qq0IdKRpVXfLLGvmyrodBLdSLZMXRxM4+sqxs
    GRoDLRGrAsa7rTDrQ0XWWuYHe6hXTgkkjQSX1gKp3fn+SZRxBjOHTCF0xMBFA9k/QCrtBL
    vFfNxsVduRmuPhia8db/nRWhmXFC7QdOLTKWHjFQmfEQRNTAYE+45dzC7YVMGP2X2lzCix
    n96NYDiW6j6okWm5jLOQRtmIKv+NyQgthtdtpxGkn//Ye/quFll2dv8vy2FKKRRzkvUwvm
    0yOgRG1hQDMXypzkciaXhw/oQsPjuAVWowbAwx/vxNjNBretfrYJp8dXsDp53L7h9VoX6g
    C3Fegjd8jHDhz84KKaZ3pY51edZsAWpZHGjZq5R/+mVgDouT4mioEHe7zSh3hxmBrlCOYm
    0pnNo38t14MtYUizzHhPFE/ThLbZhrkHoK2Cu++zd0AXCLWjDiaI2gRrTrYA
X-ME-Proxy: <xmx:aRihaghOl1qkE8Kj9haobPriHF5cEtZw-ISAMzZXsJIw-MD1XIt3xg>
    <xmx:aRihareVcNNnW4zLSsEvKjpTwU-0TCY-y7HCMG_4zz6ekAYIlZiZ9g>
    <xmx:aRihalwKW_E0GT1H7mJpLZvyiDAfQ17j5LegguMpYPsxgecpuEysRg>
    <xmx:aRihagYCyVpyhFPKtFIRB1tEtt3Amo88WaF9nM8BAvog2aoP31clDg>
    <xmx:aRihappwYyjA2iBYnWlpWYvMhOHzTs26WQRi4ukgwa1BtETf0V5xWbEI>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 04:27:20 -0400 (EDT)
Date: Wed, 9 Sep 2026 09:27:19 +0100
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
Subject: Re: [PATCH v4 15/17] mm/huge_memory: clean up after-split folio
 freeing in __folio_split
Message-ID: <aqEXnraNt7Rw9db3@thinkstation>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-15-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-swap-thp-cleanup-v4-15-b532a3f20e71@tencent.com>

On Tue, Sep 08, 2026 at 02:12:19AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Replace free_folio_and_swap_cache() with an explicit folio_free_swap()
> and folio_put() in the after-split loop.  free_folio_and_swap_cache()
> unlocks the folio, then free_swap_cache() must trylock it again and
> re-check folio_mapped() before freeing the swap cache entries; if the
> trylock loses a race, the entries are left behind even though the folio
> reference is dropped.  The sub folios are still locked and unmapped
> here,

Are they mapped? remap_page() is above the point in function. It worth
rewording.

Code looks okay.

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
