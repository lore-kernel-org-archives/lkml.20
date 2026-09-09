Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FD343DA5E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942108; cv=none; b=Ld7wpWDhzPynZQeCunUNiasPScpgpeZLQGqD1VrMxN4yX2JMkIHlGgZx9Egb8A3r1f+k2ZaO7O3XWDHKA0xPbX/BOp6Pg7s8uZLg3ckRhznNknXn0QAWVF2nxpl9NdW4iCK+N2zY8n/xE/VJVmKDoV/KDksrXiCoWXaSJrCx730=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942108; c=relaxed/simple;
	bh=pUPIEhXsUshsMPXBlfZNX+1yfjIFskWV+uAustfdmvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKwsBd/NKskYFnab+lXdy1rQwHiEskDGLJXrN4N0dwY8XhOf+DKD7D4Ir9TXmjzxOHYGhb/P5QMRBcFrgkMWt2c36DuM/ySepICMvQWXxhHaqplxkM1LekXVeeuNLB1gyp2Uk5Wf+UcMMTUSHo8vSbZuvfrpVbIIeauYJkR16i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUxda2k5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUxda2k5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1F81F00A3A;
	Wed,  9 Sep 2026 08:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942107;
	bh=SfF3JxURKislvoLHd+K5OwNU/uCTCtJ/cDbpcrBRrVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YUxda2k5yK0EQw4Kn8AJCjy5AAnimWHccbWA0ZND5dXIbJVPHM66G6LA6lvVbcqIV
	 A8IosLI6Ng2ppFoWGlGA7Vuu+9TA9BEwP0mPitePuRwaCeLD6WsVXZ2AzoY1PG42iI
	 CG4vzwAbv0ICbdcBfdiIW6K+OwZsnq6HnXOY6ZEiVQTsC5hqda7vuFz+bYEDzFtk77
	 NR/Vws6rxpgITTzZvVdPz7IBTtNt0g7EAO5x4bvvTKmcqjBQJVz6iIy6sAZ7bR+E0U
	 hDqAOuedkNrbFBZY43Cgy7cBulHmRUm8LYvjBQbpNEaDV9Bh5c1B39Ha1R9WCBSxLG
	 D2ZPS8y4a/FVw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 84E2D198004A;
	Wed,  9 Sep 2026 04:21:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 09 Sep 2026 04:21:43 -0400
X-ME-Sender: <xms:ExehahkXr1Iw9g_tHjiorO4Znnm8yMiZ7ANUckjjMXMypOwWRm-tVw>
    <xme:Exehav5WnoPYSEt0HF_k3ogH88sPOcj5hC2cNsnY4V66yIgXQpEj6B9TlTpfCeqS3
    ygP_ursH0XGSQH1JqN5AWFy8G7zqVaM5RHVjgMSk9ws1yxVNHkUoauw>
X-ME-Received: <xmr:Exehalti17Vj1kmXfJIM-qS4neBz_b8zdOPTCPugdPEKRfBDQlOLrpg5MRI>
X-ME-Proxy-Cause: dmFkZTEcTcHQ4MngkuVgRvgCf1pYu4WzUNsiawxGcilgXUqmQ1oG+l7QhW/s6HICWDIeEa
    PQfaB0zQ7ywHUBXBRzm3D/YBMjJRsDBA5TdAGDbETxCjzg0l5Xbtt12D1dHBki6qcPpAk+
    baB+GykBIXQo70A1drmvwTt8T6Einn/s6xy52G7NYFE7zenfgyWUCypXrC7Qliajo/L3bl
    zt+6zCRDD2YjDcJgxWmAhFN0P4D8A/0/SGnOOpqq/8cKPStit04/XdTFWg6ydCGu3CWx+e
    fHQV/89X7tINX+yQGiZkTrDYgZ7RNTM9zMHBzXwSVdQWovc7d+SIs/o6QZScLrTze9fAty
    1qsGQWzHzSFWL+VUKPSQJDshh4xREQy2Jyb/6YiRF5LgK/4A+eWOgy717B+F3lmcOo5IOH
    S+MOxLtEZT7nhivp6HJPmdbsoVfFG1paS0y91FxHWGAeP2oqzaz+HZUy4CCi2w0TKxRrV3
    aemW2ZYGoBGySi2b8Zu3hutBeDmx5K0d8UEnZBLg/RazNGXEc0h70/gTMPgb5qmf/Y0zw9
    MAHulkaHrhD5f5JUuuhyrX2+/+RybBV9jyrM4qHPYWYhbD9EveTRIHCAVVSBOy6bweX1v9
    qeFK06YbVb9rmxQ1EehxUv1yzlS8t7jC1/n27vszQzUnCqhw0f0/WRlijIGw
X-ME-Proxy: <xmx:ExehalDjPivQmTSI230Hn_z3uWT8IT0XdbiBhprg8dSQVWNZU8y1MQ>
    <xmx:Exehal_VSUm4Z8x9uydycDUY7Q7Wv2uMq-CLTaKb7jvlLZx0MmtxAw>
    <xmx:ExehauQU7KzKa-LT1AtNfzPa74H36wJKMnvIjY3G21OzvGQzDH82ZQ>
    <xmx:Exehau6tYCz-C8nUtki10g5CS1bWqmVt9O1m_lCAT-oBKCTNkVah9w>
    <xmx:ExehamISSlTCcxEQxbYmBOtugQelPpVerJ-_UytzrT0GabshIhZnWfTN>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 04:21:38 -0400 (EDT)
Date: Wed, 9 Sep 2026 09:21:37 +0100
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
Subject: Re: [PATCH v4 13/17] mm/huge_memory: move memcg switch into the file
 split helper
Message-ID: <aqEW5zTARWWFf4L-@thinkstation>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-13-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-swap-thp-cleanup-v4-13-b532a3f20e71@tencent.com>

On Tue, Sep 08, 2026 at 02:12:17AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The xarray node allocations in __folio_freeze_split_file() need
> to be charged to the folio's memcg, so move the memcg switch from
> __folio_split() into the helper.
> 
> The anon split helper and the after-split folio freeing perform no
> chargeable allocations, so no memcg handling is left in __folio_split().
> Rename its out_no_memcg label to out.
> 
> Acked-by: Zi Yan <ziy@nvidia.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
