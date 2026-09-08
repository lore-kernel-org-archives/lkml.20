Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D0E5448AE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880305; cv=none; b=jiVpFlYjf3px/9kf2Wae08uw05g1/5p9XvKHSNgcdkHepzsOnxzvX8lEbCmLfhGSG2IP6uspJJ5yNZQdgr/MOQcyM05qWjcKeeDrWR+dFNKO3xCzjFoDDW+H1oYGtnSH+01xQ/sYzcpnbCR3hCXWZp6dEt8vtDcygLPWzqHh/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880305; c=relaxed/simple;
	bh=uuja1vVNWU3YM4olfcuklLtJEcAxgdsY7Q1h6t+kxDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZffWGwJvlo8yya10VvQnM6LjkAsBlja6NPpr30EZanAyxVMeeV5aihV+bqcngk3scM3k/29qDbgKVO8G2rJxrWhaqprwWcrAW3KEh0ryakIqxl+eU3bSwWaMOIGgDXl512tyRaRGIVLRnRBzf1wHS0f2PYRfwKcLrljKVgHqWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA52D1F00A3D;
	Tue,  8 Sep 2026 15:11:34 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id DA927198003A;
	Tue,  8 Sep 2026 11:11:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 08 Sep 2026 11:11:33 -0400
X-ME-Sender: <xms:oCWgagh4aHsO6u7t2u3Z_YvEM60CJrgUBmozhiF4kvTFPycJj-5xFA>
    <xme:oCWgasFW9wV-IcUYtjm_rKX26n9JE29DSwGN9G0vCnUlS6865aVSqndnb0fMoQUgi
    1gh3LFLxbk_rdTbx7zHCzg49WHA9WouF8I6f4YYpURcY_BJmBdTJOcb>
X-ME-Received: <xmr:oCWgamJ6SQ01zFU0Of5eOkZjXcbyRrTqOaYPLfixsHa-sO1icr0h9Oq9GYE>
X-ME-Proxy-Cause: dmFkZTFEY+hQ++eX1WT0d18QISpjnqopgTIkTc197fr/D4AEUM/kc9KqJeyRYSclrYcP1c
    XykK6bKruHR9a9Af6TdSDfsRwaG0kuuiFTdbIQxK0fk3sJWTHJ1nfw8FEUmTzotknj71xz
    ml+JfT9VDf5Irx3HsqSaHqWmzJSSZjIFodSXvbmHW47PYVrsUSdZxAvW8G8hgFc6dAjgGg
    hIuIT7YGTr8AEqqpO7ulwGdMeSUijanAbRo6eMC5Bb0mGAR86bsnPNFSQegPUIUlnM/FpD
    e1MjPa5kV1P/j+qJjlVxnW9QC60gKJfVmkd2WdkLUiylOJgEzLMW8q4uD/mz/iHHpkhndB
    jVoCasw6n+i19NcTmffKruiYHFFGxO7BUshWmkaCEauGDcDT/pryOKe1Zpb0k+/Y4IUWkH
    +beQM2VK3jxsTiFNqtNqH2YWM54ba+/2bpMdY49kOnXmSNq0dLrnrEQaBxUHB4cIBWiHME
    BsaZ6nsqj8xCIpJxeb4X9LHkvL26HZ+ByhV9E69oIZI5JfGkfLlnlPeOAnCg04myM8fHxj
    wF3xfm7DMCFtBsYtW8dsY9cFodxGu04Qy+xgVenNqxkXcoWM4O51Vd0PCxdJQHxZKEqiQh
    sRUc3M5+Wk9lX6MOdSyAbf/sTVgkXs5q2uLri8/ywmVmnPvyXBWLBY7BZinw
X-ME-Proxy: <xmx:oCWgakto3SBFar95hYSOzul25V52NIPP-SbuLnmQ7rSIZwgSXXrBhg>
    <xmx:oCWgaj72pYqqq9G35VDgbDP9kAxgZke8Y8zE1HYsRwQ3uy6ikEscuw>
    <xmx:oCWgatdtQvYLHekvBqoTli4ly07oqKY6YUkQ_f77MqIzfkVnYT_uxw>
    <xmx:oCWgamXfErQi-Yh06aq9Za9jNt22yiY9a_7SrrUgwdZKWVdvLCwnTg>
    <xmx:oCWgag0MTv_wptp5_TdlkeQLQ0tLZ8-bc6Xu8tHNpHoOzPizMDSNWjtq>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 11:11:27 -0400 (EDT)
Date: Tue, 8 Sep 2026 16:11:26 +0100
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
Subject: Re: [PATCH v4 04/17] mm/huge_memory: split the routine for splitting
 anon and file folio
Message-ID: <aqAlfoQyKa1mztCU@thinkstation>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-4-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-swap-thp-cleanup-v4-4-b532a3f20e71@tencent.com>

On Tue, Sep 08, 2026 at 02:12:08AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> No functional change intended. Before adding more logic, split
> __folio_freeze_and_split_unmapped() into an anon and a file variant so
> each path can evolve independently. The two paths shared little beyond
> the folio freeze call, the LRU locking, and the unfreeze skeleton, but
> differed in all other per-folio bookkeeping and routines.
> 
> While splitting, some cleanups become easy to apply, and helped drop a
> few now-redundant checks.
> 
> The zone_device_private_split_cb() calls are only kept in the anon
> variant, as device private folios can only back anonymous memory, and
> add a VM_WARN_ON_ONCE_FOLIO() at the entry of the file variant.
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
