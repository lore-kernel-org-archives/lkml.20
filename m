Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0092411A17
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452949; cv=none; b=p5kkANRQmx7cwn1rqCIOAr8oSw/Rwepq4vDXNWf8bJx6mXTZWmlhu97e/rT0PxPRzndMRFYWFPVhcP9RHwVqKnLrHYvKH7K3NwpjZPZHvmGpaS230YQab0yK1trGEL/mvdIMMdA7CaETcON/d708ULgR8xQ8+zHcRGS629OAhaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452949; c=relaxed/simple;
	bh=ryewtaB3ZQ1O9LfKG9HVv+CfbGxy2YsaEQTB4c3SJMc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Jl/2LcGoQk9dLUR/Od71FQIrJ/WgyRZ4G1DA+9T1rR93JXe01DCwqm1UThLlqvrFwQD+UHZaYkiq3E3RMzaxkpNCKOt2q50CfHyFmZ6AL3LFGR12ocDm3cKpREBl5ycf5pW1429yAfODN2rEuQIW3e/A1Os2sVUp3HGQJq8SVnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=y32YbdDC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="y32YbdDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD271F000E9;
	Thu,  3 Sep 2026 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788452947;
	bh=6CvKxdoblGIw43m+Ryct2pYRcYmUIm6PbshnEkrci/U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=y32YbdDCJErwGhEL4N91iGn4/cKOLZitqoiNGI0LL8W+yN3AHqjxcehJ06KO6RZmN
	 UeuVA+ns+sKzV4yO91RmPZ+FSt/LMTDtUwTaqKEl0Mjb4EC9DRaIPickRc0MURVEA1
	 nDXbPC/61QvZtWvaB7qdeE42HIfyZdipD+XRNNDM=
Date: Thu, 3 Sep 2026 09:29:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Li Zhe" <lizhe.67@bytedance.com>
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <hpa@zytor.com>, <x86@kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/lib: make clean_cache_range() zero-size safe
Message-Id: <20260903092906.764a9098663aaae3e4e8fa48@linux-foundation.org>
In-Reply-To: <20260903071125.1946-1-lizhe.67@bytedance.com>
References: <20260903071125.1946-1-lizhe.67@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Sep 2026 15:11:25 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:

> clean_cache_range() writes back each cache line in the range
> [addr, addr + size). A zero-size range is empty and should not perform
> any cache maintenance operation.
> 
> As pointed out by Sashiko [1], clean_cache_range(addr, 0) currently can
> still execute one CLWB when addr is not cache-line aligned. With size 0,
> vend is equal to addr. However, the loop starts from the
> cacheline-aligned address containing addr. If addr is not cacheline
> aligned, that rounded-down start is below vend, so the loop can execute
> one CLWB even though the requested range is empty.
> 
> That gives zero-size callers observable side effects. For example,
> arch_wb_cache_pmem(addr, 0) should not write back any cache line, and
> memcpy_flushcache(dst, src, 0) should preserve the usual zero-length
> copy semantics. If the rounded-down line is not mapped, the stray CLWB
> can also fault.
> 
> Return immediately from clean_cache_range() for size 0.

Thanks.  Sashiko might have found a few similar issues in there:
	https://sashiko.dev/#/patchset/20260903071125.1946-1-lizhe.67@bytedance.com
