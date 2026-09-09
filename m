Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7C93451BA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922912; cv=none; b=iVJZAJCGaNNiyPVdlMYKTBpVfSZfiwzAN/O7Pav0gRkJ8zwHaBSjHd/+i5xWe9r6KaGP5WH5jyfoSNljfNPSWjODtqiMgso+9tGGfQ/z3YTEpGzEXGknPFx4dJjtTpWbIfY7xHwuXSS8Ltvz4Z2e3grwXyZpdCBrIiLI4gwKJRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922912; c=relaxed/simple;
	bh=jmOiF0hgXJYAU6qN65+aw2LIDPX8sY3Bru4YWGYJeTU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FEdUvHnN29381D2v+DyLsyNhStgnCzndGnbPjgYIDBmq/KA4/aPP4UB8wO3cBp8a4M5E+5yGomS8CvA58ldQWU2sRc0lVRas4F/M8ljHi+bSWJga/UWHJ+b0t1ea9NeGTzwtxIs7AZ/9a21rFtOgOa+dTVtdzZP+L1fT+zwtZEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q1IpD1Hx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q1IpD1Hx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E891D1F00A3A;
	Wed,  9 Sep 2026 03:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788922908;
	bh=Kc06zxE/Bjqp5n3wC4pieXl66HJVnzVmQPMZqAd6sS8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Q1IpD1HxMw6HNPSAEysP9kNZ+6P6fpWei2RjGshOOiRNVy0durQ619h/83xP7uT0f
	 y5Z4d9tUiT1AxCg3mSUKN1YGDe4h+d52PaXc2i2QcPKhMP1ZO3+l6VFkL6h7VxUlbe
	 Wge+J/xfedVUBsFbG7Dw1P5BnvT50abCH2uGC2RU=
Date: Tue, 8 Sep 2026 20:01:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Zi Yan" <ziy@nvidia.com>
Cc: "SJ Park" <sj@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 "David Hildenbrand" <david@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH] mm/memory: fix hugetlb_zap_begin() call in
 zap_vma_range_batched()
Message-Id: <20260908200147.2c2765fc8403a7db8296d041@linux-foundation.org>
In-Reply-To: <DL9I2ENHO8WT.2THUK1IVTIS8D@nvidia.com>
References: <20260904000028.149656-1-sj@kernel.org>
	<20260903173540.e8f660dcaf083946417cba3e@linux-foundation.org>
	<DL9I2ENHO8WT.2THUK1IVTIS8D@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 07 Sep 2026 20:14:45 -0400 "Zi Yan" <ziy@nvidia.com> wrote:

> > ---
> >
> >  include/linux/hugetlb.h |    8 +++++---
> >  mm/hugetlb.c            |   16 ++++++++++++++--
> >  mm/memory.c             |    4 ++--
> >  3 files changed, 21 insertions(+), 7 deletions(-)
> >
> 
> hugetlb-madvise got stuck because of this. Reverting the patch fixed the
> issue.

oops, thanks, that patch isn't supposed to be in mm.git.
