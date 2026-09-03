Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66669C2EA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402882; cv=none; b=sdES60q7ClaDj/w+WY8SuAjMnU+Sr2aikTIMukTJm7MbqEENJHqtsDfrbGdHWhldxbZwCeZr9UfWNEqFz8zYJcnrDSuhMQIdMh5+VkiWQ3unDF311WMdFsfLTghkZARRMA1SZ63h31t9Yc3Sqt2CPCvh5zGM8nmzXdsTbZNLU1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402882; c=relaxed/simple;
	bh=sWSLxruTK9WmZri21uyuwlacuTgh2JWpQ5alvCVv6tU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=t0P4xsSfuh3/bPWMoiysVqV0mC+oQW5BJboHPvzyNhsbN+ECLCA/L70YSepSyZVrl63nxruEIiG3KTu58r+RWVSnh4VrsmDjtOqVO+wwvlUascdeFIVDOshgkJ1KFOfKCwo6x50efViIdXhJQoTcQhD+zZLQI2L5l5b7Y4GsTIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=i+e75T3Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="i+e75T3Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E512F1F000E9;
	Thu,  3 Sep 2026 02:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788402879;
	bh=R+fWXehxaYYCzvlRSEIRP+NK5n3Ol710P9XjHwbzJIk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=i+e75T3QIFabgdq4302+e/kAAWTtzWgtO+55pSIvME9tAcEFC9IdLKuwSXWkr3ev2
	 mKtF8FGkjcZ9gFMt02ZfCXsxE1v+7eSbDFWoAI7EGYwYkkXR0L8ovgyp8ulCCWd52Q
	 uGw5lCOdCAr40/87QDQuNJc6zE5LfRktXgWm0f1M=
Date: Wed, 2 Sep 2026 19:34:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, Matthew
 Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory
 Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Mel Gorman <mel@csn.ul.ie>, Andi Kleen
 <ak@linux.intel.com>, Muchun Song <muchun.song@linux.dev>, Jun'ichi Nomura
 <j-nomura@ce.jp.nec.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: Re: [PATCH] migrate: Skip hwpoisoned hugetlb folios during
 migration
Message-Id: <20260902193438.232552868db3af5d54ae3fa1@linux-foundation.org>
In-Reply-To: <20260701105544.97059-1-kaitao.cheng@linux.dev>
References: <20260701105544.97059-1-kaitao.cheng@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  1 Jul 2026 18:55:44 +0800 Kaitao Cheng <kaitao.cheng@linux.dev> wrote:

> Date: Wed,  1 Jul 2026 18:55:44 +0800

Well.

> Hugetlb migration does not check whether the source folio contains
> hwpoisoned memory before trying to move it.  After the folio is unmapped,
> the move path can reach hugetlbfs_migrate_folio() and then
> migrate_huge_page_move_mapping(), which copies the source folio into the
> new folio.
> 
> That copy uses folio_mc_copy(), so architectures with recoverable
> machine-check copy support can fail the copy with -EHWPOISON.  However,
> there is no reason to attempt the move once the source folio is already
> known to contain poisoned memory.  Architectures without such copy_mc
> support also fall back to a normal copy, which can consume the poison.
> 
> Check folio_contain_hwpoisoned_page() after locking the source hugetlb
> folio and fail the migration with -EHWPOISON before unmapping or copying
> it.  This covers both a hwpoisoned hugetlb head folio and large folios
> that only have the has_hwpoisoned summary flag set.

As always: please provide a description of the userspace-visible
runtime effects of the bug.

Even better if you can present a reproducer.

> Fixes: 290408d4a250 ("hugetlb: hugepage migration core")

Oct, 2010.  So I'm assuming this isn't super-urgent.

otoh, now it's out there and known about, perhaps Bad Guys can find a
way of triggering this, so the urgency becomes higher.


Anyway, please consider the Sashiko report
(https://sashiko.dev/#/patchset/20260701105544.97059-1-kaitao.cheng@linux.dev)
then update the changelog with the above info.  Decide whether we
should cc:stable (and describe why) then resend?

Thanks.
