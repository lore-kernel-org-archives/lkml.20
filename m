Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3C439B94C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894575; cv=none; b=uHnX9+hO8jn8bsPAi0JcbXS6bSue6Fv4TsqqoLgf6mmU7ZTfrg/Y9ftfW0TsdXgRYaSDY2Ob2tlj/UO7In3g12Y0FHAV/O3IZ8qvtE6KRKO12Xvxw49p+MDNx5T+1YX1LuUbEqUA3vjFSwI6hv1+c5iDypRs9WhS7RRpGfRNtNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894575; c=relaxed/simple;
	bh=xY5rlTRLQecofjuv7OQJJ75nFgS6la9aoXS7+HsYChM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HK2vgzwOmpGF9SNU47J+zi7eWMkQ4jx5ttqdlGVyRarSlu09n+qNW8sRwFrHQX1ERAw+iA9C8MlVj+cDRoWXpH1medGi8Lm0mgPaea6POqtgSHHt0+T+DK4wPlj8ilI/RvNQu1/iCRCW/9Wo2TOuzh5VAbs8PiN440Z1Y4DZkIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=H2AL5RTj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="H2AL5RTj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4346A1F000E9;
	Fri, 28 Aug 2026 05:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787894573;
	bh=C5khobLmqtjgjuOflj6ImLhvXgr7WDfp3IPwlBxU+EA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=H2AL5RTjeaU1UGTpU2IxtXECuNad5hjA0WDx9Xhe/P6rqCiHdgmNce0375QgW3XmY
	 VfJaaiAUrZoXhx89CXUQYijFf3EIRwZxRDxgsrosd7Wwpkmsws08C0pZD8o1+p1RdF
	 s1kmLFOaNFl/kYW26LyfCuTjAK5WTgOw+FAXpPs4=
Date: Thu, 27 Aug 2026 22:22:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Longlong Xia <xialonglong2025@163.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
 mike.kravetz@oracle.com, mhocko@suse.com, linmiaohe@huawei.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, xialonglong@kylinos.cn
Subject: Re: [PATCH v2 1/2] mm/hugetlb: do not dissolve gigantic pages
 without runtime support
Message-Id: <20260827222252.13fc8852f4bc7d6a5bab6178@linux-foundation.org>
In-Reply-To: <20260823044118.1097121-2-xialonglong2025@163.com>
References: <20260823044118.1097121-1-xialonglong2025@163.com>
	<20260823044118.1097121-2-xialonglong2025@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Aug 2026 12:40:51 +0800 Longlong Xia <xialonglong2025@163.com> wrote:

> From: Longlong Xia <xialonglong@kylinos.cn>
> 
> dissolve_free_hugetlb_folio() doesn't check
> hstate_is_gigantic_no_runtime(h) though remove_hugetlb_folio()/
> update_and_free_hugetlb_folio() silently bail for such folios, so it
> frees a still-listed folio and, on vmemmap restore failure, the
> add_hugetlb_folio() rollback corrupts the free list.
> 
> Fixes: 6eb4e88a6d27 ("hugetlb: create remove_hugetlb_page() to separate functionality")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>

This doesn't carry an explicit cc:stable, as you mentioned in the cover
letter.  And that's OK - people often omit it.  Perhaps because the
-stable people backport every dang thing which has a Fixes:.  They've
been asked not to do that for MM.

Also, the changelogging doesn't provide reasons for backporting the
fix.  Please review Documentation/process/stable-kernel-rules.rst.  The
key thing is to include a description of the userspace-visible runtime
effects of the bug.

A reproducer, a Reported-by:, a Closes:, etc.  *something* to explain
to people why they should make this change to their kernel.

From the v1 review discussion it appears that this fix was inspired by
a Sashiko report?  Changelogging this detail would be helpful.


I asked Gemini to create a reproducer for this
(https://share.gemini.google/be2PvvOLw6kx) and it's very involved. 
Makes me suspect that nobody has hit this in real life?


Muchun's ack wasn't carried over from the v1 patch?


Thanks, I'll apply the patches (hoping for additional review) but at
this stage I'm not really sure *why* I"m applying them!


btw, there wasn't anything in the [0/N] cover letter which was usable
in a cover letter.  But that's OK - I'll split the series apart anyway
Because [1/1] is cc:stable so it will take a different path into
mainline, with different timing.


hm, anyway, that was lengthy.  Please send along a few additional words
telling people why we feel this should be backported?


