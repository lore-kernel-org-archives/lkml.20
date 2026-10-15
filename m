Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411E0572688
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088043; cv=none; b=FQSYAM71IpOoBExnSHHLdiQLf5512g9tak6diJ4+RDfS/Cc/QjDBF90MYbUgSYLcP6u2tUoArbB7gJwyNShrcpL71rOf++m3HucJlu7jCZYrcTzuyHLUwtSII0pc/tGEo5LQ2sJjPaF+BGL/ZnvtW02iWVmvL91gT/tr2bNj4a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088043; c=relaxed/simple;
	bh=4EFQJqg0yMuhYAmVAOubglzurSt2Ec8Wt/DHPpPLNKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qq2x3P1N9gijQDnkHJPUIoCUChbmmfMUOZBP/UdME2IV7NJ2GeKYx6MQOxyrE5ipi+GUviMKJaR2+Z6RBetPLikhiMRGub5QoWTtBkzq5KiluRYJi/Wct6lleltTv/SHtmDWymKvQhXEDHFADcA2jOgeaINPZU0Bjju4+pppBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhFWtCqs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhFWtCqs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805E71F000C4;
	Thu, 15 Oct 2026 18:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792088036;
	bh=4EFQJqg0yMuhYAmVAOubglzurSt2Ec8Wt/DHPpPLNKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IhFWtCqsP4BQwMpnuESmHYQeVEpjJzGMm0A93eHV4/8xM4qoz8Kunm/NKm64riKfv
	 5q07b2mCfcxv5TsYp9WsEU65TQw88rh8YGpK9fnUI4WYQHOXL95eGdc3aM4KZGlNui
	 7BuV/x/8bAE6Iv7fAD8ioavZ037v93OinWq/fjxs08kEzahdXXIyNbIwmNFvFXTDgj
	 VyQ6GR1du0RcNNPQ4jEyVaa9Wo/G/PmEm3QH6Vmd7+xlaUgmSFy9+hkXK2NQcm3OX0
	 jtNDKEouCgyLzUkgxQkfzeCxDkRhdWQ7hJIDLr9Z0IJwTqgqcWz3x/un+sPvRC2kwc
	 jpm+j/61LMuoA==
Date: Thu, 15 Oct 2026 19:13:50 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <liam@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Jann Horn <jannh@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: prevent VMA generation reuse from skipping readers
Message-ID: <atEXg_B9_Hy9CEbN@gremlin>
References: <20261015143735.1630957-1-4ncienth@gmail.com>
 <atD8jesRoc38xF0J@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atD8jesRoc38xF0J@gremlin>

-schlopper.

On Thu, Oct 15, 2026 at 05:28:00PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Oct 15, 2026 at 11:37:35PM +0900, <schlopper> wrote:
> > Both values are 32-bit. After 2^31 complete mmap write-lock acquisitions,
> > an old VMA stamp can alias the live odd generation. vma_start_write() then
> > returns without waiting for an existing reader.
>
> This is really unclear, I guess, as before, a member of the core team (likely
> me) will assess this to see if there's anything actually valid here.

OK I've assessed it, it's at least theoretically possible (Liam, wisely, raised
this before and we all, unwisely, dismissed it so, humble pie time :)

I am working on a patch. It's not necessary to add a new field to VMAs.

Will send out in a little bit.

--
Cheers, Lorenzo
