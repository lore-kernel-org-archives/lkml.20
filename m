Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA4F30C165
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 02:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788660866; cv=none; b=qLrNhJTjvopiz6uLH8Wy78dpQUs6Gb0XVxp8KdFJFVPvaibg4eeV8zcdjyIGA33sAgPDCyo4faG4uJcF5f0o5vvzoV289+dHqaTiEMYJ2fqNdw7puYpagsWBrRsteGSM169v/EVtK87iB5+rXU8mHYm5cJ/18cBwqhTrCs2ytrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788660866; c=relaxed/simple;
	bh=9gQjVJRbTgwxlXfOTVQkrA5H4QMMlR1N+2aHi/j0oN8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=swrIzMaGmhOvTaJKErBn9oF2iy8iPjvrJ3plItPY9MZyPfSYw33xALBFrPvCCSbXaUsLPJnvMcOWUDBPXcBoMgmIfVB8vrF2FPhlzzJ8ZMnbBIV+Tsz3y6C0WWlBUxHJEMAav9+BN+QQN+kcLgEWSzgbFtyHyupiVjUwHRWtIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eA+88O7z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eA+88O7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5703D1F00A3A;
	Sun,  6 Sep 2026 02:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788660852;
	bh=iBVmMByjyHp6VlIwj9J/ij88d3KquToqgtFFGZp/q6Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eA+88O7zn4YveFaFuN8ewh0xVk7At7ZsZWYf+LFI80cY/PwDOukQU2+XNFVJfyXJ6
	 eeT90iJxuHy/c6Cn/oZYAz2fRQeNxNOB3F+mYTs8sqAvDw0//7Q7Kz+3N9OEXU2oWI
	 12f+qQW1/ZR+4KM5z+cvXoOb/Fa4h+nPARH/O9b0=
Date: Sat, 5 Sep 2026 19:14:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Li Zhe" <lizhe.67@bytedance.com>
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <hpa@zytor.com>, <x86@kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/lib: make clean_cache_range() zero-size safe
Message-Id: <20260905191411.9d29b6733b31491555565ff7@linux-foundation.org>
In-Reply-To: <1e72a5a1-2534-4016-a311-9c66ddd05941@bytedance.com>
References: <20260903071125.1946-1-lizhe.67@bytedance.com>
	<20260903092906.764a9098663aaae3e4e8fa48@linux-foundation.org>
	<1e72a5a1-2534-4016-a311-9c66ddd05941@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Sep 2026 15:54:08 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:

> On 9/4/26 12:29 AM, Andrew Morton wrote:
> > On Thu,  3 Sep 2026 15:11:25 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:
> >
> >> clean_cache_range() writes back each cache line in the range
> >> [addr, addr + size). A zero-size range is empty and should not perform
> >> any cache maintenance operation.
> >>
> >> As pointed out by Sashiko [1], clean_cache_range(addr, 0) currently can
> >> still execute one CLWB when addr is not cache-line aligned. With size 0,
> >> vend is equal to addr. However, the loop starts from the
> >> cacheline-aligned address containing addr. If addr is not cacheline
> >> aligned, that rounded-down start is below vend, so the loop can execute
> >> one CLWB even though the requested range is empty.
> >>
> >> That gives zero-size callers observable side effects. For example,
> >> arch_wb_cache_pmem(addr, 0) should not write back any cache line, and
> >> memcpy_flushcache(dst, src, 0) should preserve the usual zero-length
> >> copy semantics. If the rounded-down line is not mapped, the stray CLWB
> >> can also fault.
> >>
> >> Return immediately from clean_cache_range() for size 0.
> > Thanks.  Sashiko might have found a few similar issues in there:
> > 	https://sashiko.dev/#/patchset/20260903071125.1946-1-lizhe.67@bytedance.com
> Thanks for pointing this out.
> 
> I had a quick look. These comments appear to point at related
> pre-existing corner cases in cache flush helpers, and one of them also
> touches the DRM cache flushing helper. They are independent from the
> specific clean_cache_range() issue fixed by this patch.

Yup.

> Would it make sense to keep this patch focused on clean_cache_range() for
> now, 

I think so.  You're under no obligation to fix any Sashiko bugs!  But I
do like to point these things out because you might consider them
relevant to the patch under discussion.  

> and handle any additional cases separately if maintainers think they
> should be fixed as well?

That's up to the x86 team.
