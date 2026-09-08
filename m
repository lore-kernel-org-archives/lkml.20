Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA755292C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880847; cv=none; b=qXL7tXtgpxPNwbZ32fnmG1odZJjgOoNvlpk11h7WUt05H8zwYVjgYxrkqWpVtjl3bq5wDK6L0OsF09NYCi08eMXp1uu9YgRx/lQzBce2trtd+6BfeywHwsdZfcnGZTZMbbqXzGE6W0NYojX2h5U/FkeJ1U/i2XqXrppsdsJppjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880847; c=relaxed/simple;
	bh=KUUnt+jZnvg2R8DoPjb9nhfE+lf8rDK6Iw+SiqfTeEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ut+WqlH27T9rm+xrcqVW06szFnR9I/esjhf7JSsz9kRgq9hwbmeLr7lyyXx91XDzN8w60aEvD+l+YJdKXWRx3fWF7j0P36f8AElE9S1hxg9RMuZbwho/GMhLDXtfxf02rcp7+szR3UsyfM2d8mtP1M0B6eZxGR099mwfN2tXUD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXLezJjO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXLezJjO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFA91F00A3A;
	Tue,  8 Sep 2026 15:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788880835;
	bh=N9GvPvkVH3GDsSf88CO+swazKNMR30SF4MGfbbOxMsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fXLezJjOJZU2xOqaYilaey23hYGIg30QgBtFuUaHaP7rsIS9jTOQrC7xfGoyOYW2q
	 JDCfHViLuQSaYWnpNaa3VXnriaYTghhEmXlvfLiRIQpHFXHXM4BvsfUnLYON86H6/k
	 gNjDNmA5x2GfF3HurReH5TsX+VR8m5CFTH3LvU85WWfPut6+Mc+FkcF4vozlOV0Iyu
	 KmyF42nbnWEXvuhBSVrEIRbTfRg0+BTjLm0In4a8DH4oiQB8d1nOvsdrpBs3vUvfkU
	 Mzo3rgHyIMGmMgm50ycFzwhRlHbqSP9grEZ5yH+Vueb0rRqaPfWSHLxW1RUe1oUXb6
	 XfV3LH83L/MWg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 1DCD7198003A;
	Tue,  8 Sep 2026 11:20:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 08 Sep 2026 11:20:32 -0400
X-ME-Sender: <xms:uyegauxEEq-mne6_XVEOHQbgLXut_W967BtOls1pPJELKluGLma1Vg>
    <xme:uyegatVriC0Inyjjkxo4cvMO-pFVMof3RvZGXNY_Qfq5mqLgg-Z7iqUXfntBS5gY-
    BLsCDvNpCMrUJ-1UKvWmWlWrlagaYimWsNjZX1X0t8CkW1PpnT6-Ram>
X-ME-Received: <xmr:uyegauZrbwVW3dmj-XKNLRpkBwt668-SxqbPjoLn1ZbimgtNoA1DF_isq3s>
X-ME-Proxy-Cause: dmFkZTElbzIz+CfUVvzCuvF1pU8/u78Ji6LGJRtMTGPjQOKbznP2ORd8FuwUSaZKzrvUt9
    yZMYsil1uc/6jaD1bfzKeYKBJWZrme8oP22eTYcOGSdVZx7Aj0reqoh4grxRrpUNNK5VE/
    E71KQ66nC6B8eLozDhntnTWlIjOW4JG0cZt4DHeu5SvqbRZ/l/w48i4B/Afjmf6bmXeBtr
    z/X2dLovtapsaXGceUPw1fKwfRMr1WtS9KFTneXL2TeMr0kHg9giArdCsujpkyhilayw1L
    owjKVpVtYtB37YB0WzYJJL/sg/vVq3dAc4g7nJJ0fiVhJk2S4e9u/Hvq6YOb/X48ZK7bX4
    38v/CQuxP+hdhQBicshC0KO9n1LUDSKUhohpctYYBt3dZUFgwiOaszPe6d5LUBViFplI6U
    SzvUhiFxm8iSsF9bxvjprH6HLs9cskh1C2256A9edtwdUxoUzXnmYEyomhSV/7DYykFKXA
    rk/mGs0+ItGnb/RRrWi/YvuIAJGtWZIo7HkTwiz8H2G4YziOgoFfd0pLjGihNXHqq5gH0N
    TYjbo4MiSJEo/agStiyifBlfy/b5Ap7aKaDQwJ7UUFwPbhwLfeM58epJn8zoIK/n+hRXBX
    v+Sgf1iYJF6ulyJFMuBCpjGmi3mhIxrdiiP4FTmroJvwJyUC8QVrIgJJQJrg
X-ME-Proxy: <xmx:uyegan_Vsf3U4OQcfy9MMjFz-weNyJy4uZ6lxiDA1S_xgN1_tIeIMg>
    <xmx:uyegamItJS88MCop4rsksYAuBlRCpXxftt_ewD70Vw_dFXGQ0OyvKA>
    <xmx:uyegaitAJ1nHj5SjPxgCAoNvDgHdBLO7RCMQe6WJYblNmAtAh-ZqiQ>
    <xmx:uyegainl5yEV6Mp5zVrBjRWG6sM9CpBqwhPnFu_6md0M1JOG6ktyDg>
    <xmx:uyegaoGY3255JDybxHeTA0CgbpinxvUZAe4a9zTlKcpztoavoG6iYCSg>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 11:20:26 -0400 (EDT)
Date: Tue, 8 Sep 2026 16:20:25 +0100
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
Subject: Re: [PATCH v4 10/17] mm/huge_memory: move the racy refcount check
 into unmap_folio()
Message-ID: <aqAnXgXPFcP76y9o@thinkstation>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-10-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-swap-thp-cleanup-v4-10-b532a3f20e71@tencent.com>

On Tue, Sep 08, 2026 at 02:12:14AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The check only exists to avoid the expensive PMD-splitting unmap of a
> folio that cannot be split anyway.  Move it from __folio_split() into
> unmap_folio(), right before the PMD split, so both the anon and file
> split helpers get the early check without repeating it.
> 
> unmap_folio() now returns -EAGAIN if the check fails and the split
> helpers propagate the error.  folio_split_unmapped() drops its own
> copy of the check: it works on already unmapped folios and the
> definitive folio_ref_freeze() in __folio_freeze_split_anon() still
> catches unexpected references.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
