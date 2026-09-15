Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF91386453
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511744; cv=none; b=DIm8yWRdyRa0CFTCkAFG0MmD+kThlOrLf55uL9yFS/GMQyXHAur5zSDfZV5sloAjNbTMhzbkw1OrWRSFP/ojRq28/Rs2fXIcxFp39Rdf7XR2UWes6RwCtYr3s8r9vkgIf/Pw4ITDsaeJGYkPTS+eHfVYDNAd17mfTcwv1kk4B5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511744; c=relaxed/simple;
	bh=RhTnPDaCLd+U+z7ApKM0YP7sn1aaMXZYDn+8iLwc6eQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Awa+1j4j3ODmY/o2hDbgRk31VeDlDI0CM9Ys9RfUjS42m7rR6AOR6ZLuNBLxKHE7mIrjcIvG1oSWgfK0Zi15ImvxCkdUVtaJcYKH+Rg5IFp930C57oWGOnvnyzveKSr1cHlGGNpBQCldP79/p3c5SYnEQGoemaVpfWKJZ+zjJ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=r7LHLzbd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="r7LHLzbd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080761F000FF;
	Tue, 15 Sep 2026 22:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789511743;
	bh=RhTnPDaCLd+U+z7ApKM0YP7sn1aaMXZYDn+8iLwc6eQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=r7LHLzbd0Mx3R5rOXvWP+PpUysVwGELhq01tND4SbqiwRuh/Mcy1MSIKsa7U7icZS
	 UUFaeKBMV0dkcXN8kqoIr3ZGSP8zIrdffHc0AXlo67wZ3OYRQm30Cpvlh5iUHBMuzz
	 hrr4PrWEKFpePZ2nISNQaVbut+HzuB+G2w1VIGOM=
Date: Tue, 15 Sep 2026 15:35:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dima Koziuk <dmytrokoziuk68@gmail.com>
Cc: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: kmsan: fix iounmap metadata teardown
Message-Id: <20260915153542.3b9afbd00f7e6cea87a3350b@linux-foundation.org>
In-Reply-To: <20260915160207.2952-1-dmytrokoziuk68@gmail.com>
References: <20260915160207.2952-1-dmytrokoziuk68@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 19:02:06 +0300 Dima Koziuk <dmytrokoziuk68@gmail.com> wrote:

> While studying the code, I noticed that kmsan_iounmap_page_range() calls
> __vunmap_range_noflush(v_shadow, vmalloc_shadow(end)) inside its per-page
> loop, and does the same for origin. The first iteration therefore unmaps
> the entire metadata range, removing the PTEs for later pages before the
> loop can recover their backing pages.

Thanks.

AI review might have a found a couple of issues - please check?

https://sashiko.dev/#/patchset/20260915160207.2952-1-dmytrokoziuk68@gmail.com
