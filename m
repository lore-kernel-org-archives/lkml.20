Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC69501F4E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794868; cv=none; b=I2f+RfRZiPDTozv3rR7l/+io5W/UnR/pMCcp/tuFCvjPVN0UjNZWTW2YCNs/+JM5IBoh4l/7QaGTNiKYXEE/J5CmXoZuYARW6LfUxjYMT0rYK7jr3tX5HXtBttxoDsiq/QmHYgo/BqIdjj+aDtYgCHDFsrW+W/TcviQWGKuIIJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794868; c=relaxed/simple;
	bh=6hrOBQSxvF0DAR349U8/vdSM9iBMmaVDEOirsjTaU5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMY5ujRfSKr8qEKOaBcZpBI5msClRaqX5LpBdS+NRzc0tLWUE/wCbvjyTdjQrgiAWi+uYPsX0V+mU5atdMnxt3GwE37ikgOdG/c6lZEYfxMcfmVwNMCz2qPpw0sFjF/2OHDeGP8iEKUn4lkfPhfqwCkyYleXTydXSJAXBZbJNsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2/6D9dV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2/6D9dV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC32D1F00A3A;
	Mon,  7 Sep 2026 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788794866;
	bh=6hrOBQSxvF0DAR349U8/vdSM9iBMmaVDEOirsjTaU5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n2/6D9dV588UugjGE35JL2jNmMYrvZmp13XEWqyHCwlOKBQ4CXbXIKOvMXbmo1DOr
	 QRTOBE2kf7W68XVe2AVyMtYDcqumD274NYRJTsEip23dIa36HSQZZIWDJAhPoYAknR
	 REUXmzealeYx8AdNQqDG8KapN8yi5yZCXX7vgc8T0U4CMlpIRt7/KjeAZdhruboHeG
	 pao8D/xBiH12p+W5OD2Pat8xC9WhfGOnCNAyhCl5PoXyUmKf6lHQTCYF3LflW1nVzc
	 OklKrV38XlcWfgi4g/V4V54aZF7Xu5SYEfyHhcenHBJQTFQOVkYItsMdKIJs8d+Ngv
	 Oq0fGodncyrMQ==
Date: Mon, 7 Sep 2026 16:27:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Pedro Falcato <pfalcato@suse.de>, "Liam R. Howlett" <liam@infradead.org>, 
	David Hildenbrand <david@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Mike Kaplinskiy <mike@recall.ai>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Subject: Re: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
 MADV_WILLNEED
Message-ID: <ap7Xz0clF7sOaAGK@gremlin>
References: <20260904-madv-will-need-map-private-v1-1-6b83cc99fcff@kernel.org>
 <apriM1q4GzAgP7JQ@pedro-suse.tail5790ac.ts.net>
 <aprjOxDy3JCPb2oa@gremlin>
 <20260905171757.ba8b0f8f0f18ebd04418bfeb@linux-foundation.org>
 <ap6u6Ana3MvvIIUe@gremlin>
 <55ce7bee-c0e0-4051-8bc4-26cf3aa3f7e9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55ce7bee-c0e0-4051-8bc4-26cf3aa3f7e9@kernel.org>

On Mon, Sep 07, 2026 at 05:09:34PM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/7/26 14:32, Lorenzo Stoakes (ARM) wrote:
> > On Sat, Sep 05, 2026 at 05:17:57PM -0700, Andrew Morton wrote:
> >> On Fri, 4 Sep 2026 17:01:37 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> >>
> >> > Andrew - could you swap the patch out in-place with below? Thanks!
> >> >
> >>
> >> np.
> >>
> >> > Currently MADV_WILLNEED treats file-backed and pure anonymous mappings
> >> > entirely separately - using POSIX_FADV_WILLNEED (equivalent of a readahead)
> >> > for the former and a tree walk and swap in to swap cache for the latter.
> >> >
> >> > MAP_PRIVATE-file backed mappings straddle the two and currently get treated
> >> > as if they were purely file-backed, meaning any swapped out private pages
> >> > remain swapped out.
> >> >
> >> > Resolve the issue by explicitly checking for CoW'd MAP_PRIVATE-file backed
> >> > mappings and performing both walks in this case.
> >> >
> >> > Since the logic checks for vma->anon_vma this means un-CoW'd
> >> > MAP_PRIVATE-file backed mappings retain only the single file walk.
> >> >
> >> > Reported-by: Mike Kaplinskiy <mike@recall.ai>
> >> > Closes: https://lore.kernel.org/all/CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com/
> >> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >>
> >> The failure mode looks pretty obscure, so I'm thinking that no backport
> >> is needed.
> >
> > Well it's not even really a failure mode so much as a 'known limitation' :)
> > So yeah agreed.
>
> Yeah, as we know madvise() just an advice after all, the kernel is free to
> ignore it :)
>
> (MADV_DONTNEED and friends enter the chat)

Haha yeah, another brilliant footgun invented by the proud folks at kernel mm,
catch us next time with some prctl's and BPF APIs! ;)

>
> > --
> > Cheers, Lorenzo
>

--
Cheers, Lorenzo
