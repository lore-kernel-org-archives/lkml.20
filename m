Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FA12E5B2A;
	Fri, 16 Oct 2026 00:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792111110; cv=none; b=PaURvSxhIpjuOBDLdueW3pmXqKp64CGlnQSbR1hX1Ejr3ptHPyZyybjX0818QxQZTIVGBjfOPSphRJcNF3zuylK32dgFQboDocahkIzshlAx/D0XkeFsDfr5WnLCmb5PmJ/Z4FWOtX3csTANGbSg4LpecFb8jRGaU9+feXnIgD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792111110; c=relaxed/simple;
	bh=NgcR8jGYw8Ii1hwCDbbFCJgZmg5BJd9Tvj+Gqt+ug/Q=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dQmKiQAHL1qZf9lEmPBWPvzmnITgVAxXuOamcxj321aSU7hhHimi/CY6I6RwociJrpGAY7po8g629CSGvCb1UMvuslOL7wZ+02pm6WkxN+xRhZqMqnSoGYIHkj8pEQGCI4BnLKUPcmyWWOf/pcoaTfIUEHK4/dTzm/fJVG2mJtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZurLXw1a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZurLXw1a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58E81F000C4;
	Fri, 16 Oct 2026 00:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792111107;
	bh=5TB8q3jOLCWfi6nq3LQFTYj1ETHvnif/9oaoAQuSXpY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZurLXw1a+hxon7EKEidO2yueKgWEk5blqWjqaamtLSRCsBIzY8FHyhEzvzkEUTA7B
	 tBlA3od06X0fsQSI0Wcp2Y+7VfqBs2+xpZQVUi0mJyBXIfLW2sIC8wENlGkLLwMQPL
	 agL+iUAd4qWd+NsX+vwGLfXAVs7Rr+vSDGtOq+zw=
Date: Thu, 15 Oct 2026 17:38:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Brendan Jackman
 <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, David
 Laight <david.laight.linux@gmail.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: stop recalculating min_free_kbytes once set by
 userspace
Message-Id: <20261015173826.e7ffb7333fb84f5be927ae88@linux-foundation.org>
In-Reply-To: <26103c38-7b22-4176-8bc3-63e4b8fc6bbb@nvidia.com>
References: <20261014140859.1006967-1-noren@nvidia.com>
	<20261014144823.8c89da26c547fa95936a2fe5@linux-foundation.org>
	<26103c38-7b22-4176-8bc3-63e4b8fc6bbb@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 19:16:40 +0300 Nimrod Oren <noren@nvidia.com> wrote:

> On 15/10/2026 0:48, Andrew Morton wrote:
> > On Wed, 14 Oct 2026 17:08:59 +0300 Nimrod Oren <noren@nvidia.com> wrote:
> > 
> >> min_free_kbytes is recalculated on memory hotplug and on THP sysfs
> >> writes. The new value comes from calculate_min_free_kbytes() or, while
> >> THP is enabled, from set_recommended_min_free_kbytes(). A value written
> >> to the vm.min_free_kbytes sysctl is replaced whenever the new value is
> >> higher, so a lower value does not stick. This matters most when THP is
> >> enabled on configurations with large pageblocks, where the new value
> >> can be excessive [1].
> >>
> >> Stop recalculating min_free_kbytes once a value has been written to the
> >> sysctl. Systems where the sysctl is never written keep the current
> >> behavior.
> > 
> > This problem lies somewhere in the range of "minor annoyance" to
> > "catastrophically horrible", but it isn't clear where in that range it
> > falls.
> > 
> > So can we please can we have a paragraph which explains the real-world
> > userspace-visible runtime effects of this problem?
> 
> Sure. Can we add the following after the first paragraph?
> 
>   For example, with default arm64 pageblock sizes, the THP
>   recommendation can reach 5.5 GiB per eligible zone with 64 KiB
>   pages vs 22 MiB with 4 KiB pages. This keeps a significant amount
>   of memory free, reducing what applications can use and triggering
>   reclaim much earlier. Users can lower vm.min_free_kbytes to avoid
>   this, but the lower value only sticks until the next recalculation.
> 

Thanks.

Do you (and others) feel that we should backport this?  Or is it just
not applicable to real-world users of older kernels?

If we expect there to be non-zero users of 64k-page kernels on older
versions then I think "yes, our users will benefit from this".

