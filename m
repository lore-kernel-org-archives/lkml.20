Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4042437FF6A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787958644; cv=none; b=MZsfyy6BlvWSRMhZGBmNHhQbX8rUOYZmusCQCSlmaWERz7+pX8tPWSojZ5DWeSyDsJM/tJxoXcVbLH1b+IY104DdoNVcjCeQcHQVfykYP8WIGlRwnrbu8N/59CloozjnryyHJ8yRuYoXtQz8DRv5bbneWuqCpJIH+ZuBcg69rYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787958644; c=relaxed/simple;
	bh=Q5UT2K7Kcq/1q/VTn/AC9hcU+6jQNW5C4bjyD2X1n90=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iRjacSopjnMgNWzxWdzxBFvwQtLKsCGMKwFy312wE8eiCXKkD3XPOIx1P6kxYp803qcgo4YaC3Eq9r9J4L+O8Mn3uISW/o0HauhfuaTM6CxjC/MobI3Ka1JelSgppP5OokEZT+YEkdEZ3AjC8oNOHueCzd5Vxd/sfe1ohzz+i8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RE1aXB3P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RE1aXB3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA6A1F000E9;
	Fri, 28 Aug 2026 23:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787958642;
	bh=tQJbZfDKCd5vA5KNE4CASZSK9AFL5yPJCvibCadYbiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RE1aXB3PvH2MlSAawRZuYTTM0y5weCaUQiTHs3XvyUXIur027Q8UcO40pfITH9Gc3
	 5ta/aF5q35hGrZUChJmhJN+v9bVZxGYP8NK/2ppGNPvExKc8B9YXD9DxHxE9d3CpIH
	 nKhafDpa72aIXM45SwFEdSXE+7NH+7Fsnyxg8Cl4=
Date: Fri, 28 Aug 2026 16:10:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Longlong Xia <xialonglong2025@163.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
 mike.kravetz@oracle.com, yuzhao@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Longlong Xia <xialonglong@kylinos.cn>
Subject: Re: [PATCH 0/2] mm/hugetlb: fix surplus accounting and availability
 checks during demotion
Message-Id: <20260828161042.de43f4751296883eeca633a6@linux-foundation.org>
In-Reply-To: <20260823034307.1072415-1-xialonglong2025@163.com>
References: <20260823034307.1072415-1-xialonglong2025@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Aug 2026 11:43:05 +0800 Longlong Xia <xialonglong2025@163.com> wrote:

> This series fixes two problems in the hugetlb demote path.
> 
> Patch 1 fixes surplus accounting in the source hstate.
> demote_pool_huge_page() removes every source folio as a persistent
> folio, but a free folio may instead account for one of the source
> hstate's surplus pages (for example after a vmemmap restoration
> failure). Removing such a folio without adjusting surplus_huge_pages
> makes the persistent count underflow, and later subtracting it from
> max_huge_pages can underflow that counter as well.
> 
> Patch 2 fixes an availability overcount in the sysfs demote path. The
> sysfs trigger checks whether any page is available but then passes the
> entire request to demote_pool_huge_page(), which can remove free huge
> pages that back existing reservations. With two free pages and one
> reservation, a request for two pages removes both and leaves the
> reservation without a backing page.

Thanks.  Have you created and tested reproducers for these?  Gemini was
trivially able to do this for me.

If so, it would be helpful to includes the details in the
changelogging.
