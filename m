Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08794EB87F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674062; cv=none; b=k8rRbL4j2xp+BLqmFQxJ0Iete8VN/yz0g5jAHz6bMFI3Rx2Db+zbl3Ig5IaV0cFs2onqC5vt/kiy9S9G9H5TohWYCLVq6hpGrU+ArAIAH+dsGeNMrOGtLQSNJ6shumzqNNtKYTmNXyj1y/B7VLMLVkWAHoheHE19fz/m59XDR98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674062; c=relaxed/simple;
	bh=j93BxfAGWJRlRwDQGHbijnMULy8q1YBGFG/QeFztJlE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=nIJzROLBXqgvK/82CvpyUr8vSNMC5e0JCRygyV30shHyjwCLEXKnrmfsePzhJwN6rxytrrEnc3x1R6v0xnSIu2VopENKY+cISK4y79Qkvswj91ZsfpQIoq1ro/gHyYMbodDOiFSEnLffw7YRQ6vKEDTZq0e07Or/JM83ftvOjJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=y6U+hzZo; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="y6U+hzZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1790674049; bh=AWUWyJ+l2DRWxplVbMpUfprXcHiO+Hhgpwu0TEAt2Ps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=y6U+hzZowv/kQXd8zIXhFmREZFa55LBeSbfxK/Vg04f/Ev012G48P0Ze/zNpg7uKQ
	 QdjFB3fLmQVjG9IdWaKkfK0N6S87t15yL4rpsr34RMei3oR0e3boYb4vpxVhfxDqzT
	 p/NWNhvB5PkXfl2jnSjwUAdtJoRJlZneJnxthsVc=
Received: from lzk-B860M-AORUS-PRO-WIFI7 ([2409:8a28:a83:5ba1:514f:5353:e14b:594e])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 6D804811; Tue, 29 Sep 2026 17:27:24 +0800
X-QQ-mid: xmsmtpt1790674044t61f9qe0i
Message-ID: <tencent_FC17069F1AD34F4E65F6C8DB7AD5ACEA4408@qq.com>
X-QQ-XMAILINFO: NG+oLgkBIWry3Wz4maLN7rRkyN41slc9JvtS1xFpKIhL57k1NV4x7PDHWi8WdX
	 o99f03YS8qokgloaivFfemf3brjidrYniLNj7+KxYFNhw0/N9KVKX8GkuqHRb+re6xXkmIU5x27C
	 X5jkJo5iGDhaezZ0jkbJNVDNXP3oTQD9fmVAd3LqwdV8IBezdHn/pcY/aMY7cFbHd/BvXhXapkPW
	 UCEl/eIN0mAekh9Jfjn6t6x8et5fXKjVQ1TUOvztXip3ThfvBaiHrKKmnf1P09JG+iCxq252eLGM
	 vS3J1QxzZffF1CHsBz5gLpW7mN30Zc1rrCXWf3/kLo1tKZweSS7KsGkJkh/6xoqL8AGjeKZsu7zV
	 HBsOsp1tzyturg0vdJgFV1SZzHbjlsrz3edV6zJkhyCLHihNLSXmdEPMGRx/dtBPRtoAGH5VtHyQ
	 kTLtKoEJoYQoOk337rRVtGGObqJhxKRZw6WaI9xmIy6YZmc+8BFo+h9evPVAjNLVUnRC7n5qqr1h
	 tvzD+yDaETQVdVKaZvIRwrTrt5wnzxPbeWr+X1k2mXNv9VPyKFT4JHIfuZEd/+m5h4MlldUkxIFu
	 SB3izGdEElpPErImYCgB7E6l6G25RIrtipqueulmDzPA6IHriiKKkJBDRnAhVK78rV8VokJ2u/Oz
	 Exv0sGBIFoY0WoiBjU+WV3rgOWAbb1tqv2VhFNmDUQSR2SYz92mLMUP0tciXX758vUZtSesCsxXo
	 ChFFeZ1sFeDKcKKjZsoWFEXlecDNu9KKy5DnvmyMOWxPOAm6xmJjydotxUEihoWKMrkWGiCOJI5Z
	 Bk4hUE+kQ7PfVJYW6mjIqxL0QIRLMJEz7Fg126fbGnxjLXLdzV7ejO0UhmkCXmEXLpZ7mZWZk1LE
	 7T5OM32oytXF69Bu4fMDG2raTMAH8X/jkhxZc5hiItqSCM8bT4Il9qrOXbmWL06Ieufz+3KGzYrI
	 GauRTZL+NZAC24JEPKWGdARnDtHgNr721bzXcb6ZX7D/JAadiueABo1sWIUyRJv+MF6HvTHVDzk+
	 dcUOYyCHvydM3x5qkRxJr+4F3oXORLCpQOU0NvPs8yEhetcP6osu1AXWc8krMaYxWdqez/HaTMgL
	 laPnN9SD7iTiPEADADvS1cEkTWJXJ664WN6fJbJhkP7tMO4Qtoc6oM+/hd1W7mFGGL8NmCudsyFD
	 6HgFlNyPgZkduHYUWYQJYYu6fiULY9iCMKizI=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Zongkun Lei <leizongkun@qq.com>
To: David Hildenbrand <david@kernel.org>
Cc: Zongkun Lei <leizongkun@qq.com>,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Kairui Song <kasong@tencent.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Hugh Dickins <hughd@google.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Zi Yan <ziy@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] mm: swap support for hugetlb folios
Date: Tue, 29 Sep 2026 17:26:30 +0800
X-OQ-MSGID: <20260929092720.544090-1-leizongkun@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d8646877-4975-4b2d-9255-9285414d65cb@kernel.org>
References: <tencent_501F9D3CED07B66BAA97D5352FB63EE1A709@qq.com> <d8646877-4975-4b2d-9255-9285414d65cb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 10:02:11 +0200, David Hildenbrand wrote:
> Hugetlb is effectively in a feature freeze. There is no interest in
> maintaining even more of the special hugetlb sauce, sorry. :/

Understood -- thank you for the direct answer.

My mistake was misreading the subsystem's direction.  I had read the
earlier list discussions and concluded that the red line was touching
hugetlb's reservation semantics, so I designed the whole series to
keep them intact -- user-driven only, no LRU, no reclaim hooks.  I
see now that the actual position is a feature freeze: not "new
features are welcome if reservations stay sacred", but no new
features at all.

Going forward I will stick to work that reduces hugetlb's divergence
from generic code rather than adding to it, and I will float ideas
on the list before putting serious effort into anything big.

Thanks,
Zongkun

