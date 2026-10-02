Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68029DB8F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975545; cv=none; b=htfbtt+w3RDIGIKLl7sJrMc/Gk7z+4jV3WZdzJfl5uq0ZAVYPFz5pcMrhoKp3rffl2fgeqNWaXDtMzlrcUTCngS4yXO6CavjE4FI6jIVj41ytz+5sgO8cMkxHuXhupOj1229Yavr2YRE6YYkmo7a9QDOamBNeiTABGHk3QM5Irs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975545; c=relaxed/simple;
	bh=k96rB79eY8vqx6DuRawQImDdcetb0an3htaZTvg2/Jw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=O8rx/wzvHV721JLg3D7KmjpRPiTyOgM5QUCUIKKJsny/kLry4cYXQu9UzU63Mobz/WxOEh2gopmOQusMSFE/XOiCEADWdQJfU9kagFURSIjeFVH3pbM5ZrMcwCyZHkfFUrIlR/qcIRyNGlyomoOc2cDK3HYPmpba4f3mdReKsEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SiGtHpkH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SiGtHpkH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE2D1F000FF;
	Fri,  2 Oct 2026 21:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790975543;
	bh=KfOsj4PG9vn7kCp0tnEzIbTFJwFY5C5SxFBi3uA9k6M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SiGtHpkH+22ld52BOAx4ticTi7fKCwsjNbskfeIqfkGPOqjZy1shyKWKd2PEMJkaI
	 ds6Cuu7bkYzhKxC97BFKp+ufrESAyd8aoU+b6DGkt0/zRLVjOZ7y+2Cnj1WOjOLJY0
	 1m/N2Z3e5tTKDk0Ag4jtpUQxp0/0r0hZ7k7gB4+M=
Date: Fri, 2 Oct 2026 14:12:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dima Koziuk <dmytrokoziuk68@gmail.com>
Cc: glider@google.com, elver@google.com, dvyukov@google.com,
 urezki@gmail.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: kmsan: fix iounmap metadata teardown
Message-Id: <20261002141223.1ab39d5cd2d65b02dce8ab85@linux-foundation.org>
In-Reply-To: <20261002200508.546-1-dmytrokoziuk68@gmail.com>
References: <20261002200508.546-1-dmytrokoziuk68@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 Oct 2026 23:05:07 +0300 Dima Koziuk <dmytrokoziuk68@gmail.com> wrote:

> kmsan_vmalloc_to_page_or_null() rejects addresses outside the regular
> vmalloc and module ranges, including the shadow and origin addresses
> passed by its callers. As a result, iounmap does not free the metadata
> backing pages. Also, the first iteration of the teardown loop
> unmaps the entire metadata range, preventing subsequent iterations from
> finding their pages even if the address lookup is fixed.
> 
> Factor the page-table walk out of vmalloc_to_page() into
> __vmalloc_to_page(), keeping the address check in the public wrapper.
> Use the unchecked helper in kmsan_vmalloc_to_page_or_null() and check
> for NULL before converting the returned page to a PFN. Mark
> __vmalloc_to_page() as __always_inline to avoid an additional function
> call in vmalloc_to_page().
> 
> Move metadata teardown into kmsan_iounmap_pages(). Free the backing
> blocks while their mappings are still available, then unmap each
> metadata range once and flush its TLB entries.

Thanks, I'll queue these for test and further review.

Could people please offer opinions on whether we should backport
one/both into -stable kernels?

