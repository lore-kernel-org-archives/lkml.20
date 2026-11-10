Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273500;
	b=d1tcuFpV4D028glXIhNvJbCqeyUodHNl3b9NxDjeL3oRUFaCcsQhnlGpTOqPRMfu5Wab
	 3A8o+1KM57XlQ2CR9hcZsR2YSw3QHDnxbTLQvlH6gwQOFwIj2H5DQF0YZhxrOIp5eXDlC
	 8WFOpUBKXp6/H4SG0i+UrkpK2Qyu2gFkTVDVFUl1Rnw2vTus1VzWQaRLIH+7jk8EzZCCS
	 Uh6AmIm4Ib6kaupxy4efj5UExl1oaefwmdYdY1ZDON1IzifZMOpUYPKvjFbrznHV/eEdP
	 wS9GbxsxrmOdpBrsBpqHA5iyxzuQzBi5q9ACP6+QKbAYEtITccDc1hZk26hFZrtW1zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273500;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4W9ISFbtgCFMCYArZUe7DDHrDlGmnATZOpaOt8j7+uk=;
	b=0ZI8tT8f6gOu+F/KsF65ZFWqEKzjAf43oa5aUTM6mxGRURhYKg0bMYGc+E6/KAJCPfS6
	 8ZIbGfgRTKqsvcCt+SGzkKFQxehKGF5t9o6zHQk+Gh0XxaXtK9I01H907n7Y/5PrkKtmf
	 DhGlP44SXyYc6LFgkRCfqhVxnkU9DxPNHJuSXRaRz3hsR52G9+10FgJQA7WuOUA7MwDcC
	 8JaJfMAj4YnRVVuMMvfY8i7l0f8MzJ76DzsVRKSf9Tyzcp1MZCC8VjLLJyhbx14YN+rUN
	 TvQanlOv33uwyQep9CXZCsEcwrt40gQ967SIednW9cFoyad9m3wEAtTXYshDYxOeMjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zl0pp8oC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A72606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zl0pp8oC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A911F0089F;
	Tue, 10 Nov 2026 01:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794273499;
	bh=4W9ISFbtgCFMCYArZUe7DDHrDlGmnATZOpaOt8j7+uk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Zl0pp8oCON9HQRs0goyjbzHxLac/2D1pMfxoHCkaiXYzaDrzrabkp6QBCnuZ8pjR0
	 P+hbm4VYScOJj4YSeLIMGILB3MFlqaJp1Cb2s9dbNJiuO1szo1ootxNgv5PSrSWWOJ
	 zhhq1qlZbZmj1Fjmi7zSIUZAbioozGpfTtYQINOwnJTfZz0ZyRNKUy5DENWhF9Eq9Z
	 W+m/SSt0BS/M6jtf+uA3FEnsaMuW/PyEMrXh49NQmDN+SViaBBug2XrToFl5lug1Ai
	 rlIj09vaOgQCufQXZclwCo5f4rIRoOY2mwkXNE66IugIQh+mPhnXHmnPXwhtVLqJ9f
	 xH+HOvbCLG7BQ==
From: SJ Park <sj@kernel.org>
To: Shivank Garg <shivankg@amd.com>
Cc: SJ Park <sj@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: remove unused clear_flush_young_ptes_notify()
Date: Mon,  9 Nov 2026 17:18:11 -0800
Message-ID: <20261110011812.106413-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-clear-flush-young-notify-v1-1-b37fbafa2686@amd.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 9 Nov 2026 18:41:55 +0000 Shivank Garg <shivankg@amd.com> wrote:

> clear_flush_young_ptes_notify()'s last user was removed in
> commit f3c493d2f42b ("mm/rmap: handle device-exclusive entries in
> folio_referenced_one()"), which open-codes clear_flush_young_ptes()
> and mmu_notifier_clear_flush_young() in folio_referenced_one().
> 
> Remove both the CONFIG_MMU_NOTIFIER definition and the
> !CONFIG_MMU_NOTIFIER alias.

Looks good to me.

> 
> Signed-off-by: Shivank Garg <shivankg@amd.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
