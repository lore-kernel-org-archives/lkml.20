Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B261632DD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791936621; cv=none; b=DBC6n/VnrVhszVAtuHigQFHx0PIwYPAhmjw9fUOSNBF4BgsJupOy/deoIw+IYutK/3MeO5+1hquooP3A3+m2v+lD63TVGJSlkrjxhNcvTuulXs0HlL+S2bI6UFJ2Cr1/x8MH5i1ip4Iqg8KhToa+oQqyfXm27DeIduJtRwEpIxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791936621; c=relaxed/simple;
	bh=LlBlzJw6I/fqV8kyE2w27pOcQxtvQEN14pch6ytVYOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4SLBJJfgGFewlOzI1g/q3N0ZhIadJ64Cl2D/wPFrQIOmTshVRyN8TjP0ctoCAdmRWsqbm7v1xZYW62dfqCgu6p+OD1dlljEcNyhv2/9VEEUK1EyM/ZrOMCXXcFihxCOTC8Xeg24bccY+jvW6rxKs1lLnLBaGOz5F4GXkfadoEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZP4EfKUW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZP4EfKUW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4671F000FF;
	Wed, 14 Oct 2026 00:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791936618;
	bh=z+tM5slpbKPsasUGwVhQ3lezL7cs5zFWMkBfCs77HNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZP4EfKUWSo+CgEYy4ewm1ypXx/l+9znvTg4BHHGn7q8r8Q7V/I2gBPqDGTmQarC7s
	 ErbW6C+m49aS0vmqB6hMwXDg70DwO3OfXF+ksuDjtR4HV81JziGJZtdvF04yCWz5LV
	 96FaBumLAn7UznlS1p62J/Cz4MqFjhZy+17amrta8Cm2B0/qIsEk94MInYyTqOQUEJ
	 4AxNaTWH6kTOkasF7ct1l9rkDYVV9Wdsy0KoVLgt7QgUdGUHe5MAFeKuHIAAgpp4hw
	 V8fH5Ls/YK8CM2NOe7RrCpVS9/ZqObSSZJcOed6JzgpSWekmwu810j34YTZn6FNN4a
	 nDM4pDvr5B4FA==
Date: Wed, 14 Oct 2026 01:10:16 +0100
From: Harry Yoo <harry@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, 
	Kiryl Shutsemau <kirill@shutemov.name>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux-MM <linux-mm@kvack.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>
Subject: Re: Improve page refcount scalability
Message-ID: <as690Xcu7FxIDYjf@thinkpad>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>

On Tue, Oct 13, 2026 at 11:43:14AM -0700, Linus Torvalds wrote:
> Comments?

There should be a limitation on how much memory can be submitted to RCU
by the page cache, otherwise will be a corner case where we have too
much unreclaimable memory waiting for the RCU subsystem to free them.

There's a similar feature, dirty throttling: when a process dirties
memory in page cache much faster than the storage can handle IO,
the kernel throttles it, otherwise it'll allow generating unbounded
amount of unreclaimable memory.

For the same reason, when a process tries to create RCU-delay-freed
pages much faster than RCU can free memory, the kernel needs to limit
that.

-- 
Cheers,e
Harry / Hyeonggon
