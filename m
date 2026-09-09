Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0776450418
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942156; cv=none; b=TBL+/WHL4MOD8Vf+el+KTpjHv97dEkgLdnAvLv+h3/y8/tQzC9AUeIk37lWjsoCc6zaOaIPYk9mNNbzF/mUrQI/aHoPCKtnFICRv30vxjvAvgndWH1DQuGj5I1rn68ARFPK7rXKJqAdVDhkKoQsrmDQpWwQ3dtB+w0D/JurKBnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942156; c=relaxed/simple;
	bh=Cr6eVAATsxrw4wYMvxXf+NjT1UFhX6p49Uef0PS5xUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJHewLA7+LJxav8z+fzg7lB1ciKbID+gMNODUNIV4Ax2stnn5TJZvCaoMfNli2jHfsKh5l/apKH7x2lvqygFYZoInqUUB1Ws49U5bXx4bLGP7q25hfbPHCmUCFnpE+jpa8cOb5eG+vBt2iSfbWkXVlQfBwDDP6d7qUR18oTR8W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQjuY8oY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQjuY8oY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E1A1F00A3E;
	Wed,  9 Sep 2026 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942154;
	bh=+6oCYgINkfsNJqPA2oM85Ca7xOFugQPqnIa/px/TGX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hQjuY8oYInGcV1So6iO9Q3CIQU6clKHndvvPv1jffB1dzdjrLhvxwkPz6AcFHAUUl
	 0KZ2JpJY4Ql04joXa65X9qpz20YYZOtvngPZgz/u26iltKDjTHZWPVmuV3H4mjJWUY
	 8l/fPctVVEmtawEeiB/10fZKf16frLsdWBnOvedocIOwPU9Yfb+E+/KBhcVdnzHaCZ
	 0j40glHANcRIZ6fwybjWbuxTAi2KTzKJs5Uvi7rYdKtRiRqDwtRZR422+KCtMvhqWC
	 FiJRoux0N7xfnHhyg50JtT+6uPQJeWpL/sW9mLw+7vaN9Gnw/dDkb26LVDPD+D9erL
	 8P7Mz0zkce9Bg==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.ams.internal (Postfix) with ESMTP id 248EE198004A;
	Wed,  9 Sep 2026 04:22:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 09 Sep 2026 04:22:31 -0400
X-ME-Sender: <xms:QhehaqC75siJ3my3rZDgROu8Yj7Fi8oN0INnIdTJgvrljY9WgW3h7A>
    <xme:QhehalXHa4GWm-0J2No7Dg4lWiH-5nq5lDSWHpulYyXBlH4tem6kz5hJsDQNxPwlR
    DvgwEpSHb-V8-XzV7bmw1QEk_dmvSn9R9sdFxffEhREshb356SY>
X-ME-Received: <xmr:QhehasJ9ng4r0OuXk_BakMPnnoPJqNNynaU2eKbiY_RL5XADNiEQ8lj9_3I>
X-ME-Proxy-Cause: dmFkZTEcTcHQ4MngkuVgRvgCf1pYu4WzUNsiawxGcilgXUqmQ1oG+l7QhW/s6HICWDIeEa
    PQfaB0zQ7ywHUBXBRzm3D/YBMjJRsDBA5TdAGDbETxCjzg0l5Xbtt12D1dHBki6qcPpAk+
    baB+GykBIXQo70A1drmvwTt8T6Einn/s6xy52G7NYFE7zenfgyWUCypXrC7Qliajo/L3bl
    zt+6zCRDD2YjDcJgxWmAhFN0P4D8A/0/SGnOOpqq/8cKPStit04/XdTFWg6ydCGu3CWx+e
    fHQV/89X7tINX+yQGiZkTrDYgZ7RNTM9zMHBzXwSVdQWovc7d+SIs/o6QZScLrTze9fADw
    R6WKeZ0s2YlrYyiUdLUH8rl+JH+DRd+ekFoZICNygZRtLCgshhNFyuRQe0jUlTeRME92MH
    jQjX4y0rJTHlpOSccrkkx+LKsoiz6GddG2Dgb6q9kR9ZXwWE2KOeZ7RDCYISAGtf9YAd7D
    BF4jJgSi6lJq4v4mDOSYNby7aovUqMDoDBFNTEH45c7HoJq8rkiCBH845zkL1Q69Hwedmw
    zYmWP52u5qnQp0mVmHOS2gk2rklU74savcw6OZ5AztuGT1dK9/hSO7bh4ROHDjQP3/n7r7
    cIUltSZBLTFtkadyfYKtmVew8LSWraooY++LqMArKWWV2XBW7u3z1JnP0ttw
X-ME-Proxy: <xmx:QhehaukD2Tp5l5dwOAvEQlis4BEGDdGT8gfqBlwbWggf6VQ22xv0cA>
    <xmx:Qhehaqbh6r14faa_etAg9k7HngOcTq-49i9HNDSj4h9kc7gF2NfabQ>
    <xmx:QhehaogorFOge6wZlg-yCI1OZH99aUQDbzeigCR59-WHl3BPE6HmYA>
    <xmx:QhehavShi3E3GgnLvs5tWxXTa_pJBn1wMKymklTv6BenQr88D-IOzg>
    <xmx:QhehapMkrk8SF8xwjQvIQysJ6FDoQa5-NufIQVn11HV3XUBYaZnSs_FW>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 04:22:25 -0400 (EDT)
Date: Wed, 9 Sep 2026 09:22:24 +0100
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
Subject: Re: [PATCH v4 14/17] mm/huge_memory: drop the unused do_lru argument
 of the file split helper
Message-ID: <aqEXLroENEmS9ii2@thinkstation>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-14-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-swap-thp-cleanup-v4-14-b532a3f20e71@tencent.com>

On Tue, Sep 08, 2026 at 02:12:18AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The only caller of __folio_freeze_split_file() always passes do_lru as
> true, so the argument and the branches gated on it are dead code.
> Drop it.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
