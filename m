Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916BE214813
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969250; cv=none; b=Xn2o4KY+PPIX/9aH78oZoW935R+GTXU5aIXIxJBw3WaqWdxJkccjo5xodMPO0SOfmT9ebrvXYZDJnhlvI9X50F7a9oYaQ8LN4O+qaoQwKtenZWS98PiGJ8fye9g/dsoU+tx/nBXQppGi8VnUZ8GDgTlIP9oVetyHTAMfwl+Becs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969250; c=relaxed/simple;
	bh=3SrAKRxVKoiz36qd1iw66PRVuCuWO6FT5+hCHo27x28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEgMY5negZQHj+V6IRGYoxVDajBP3P+RvMM3lTakBlVCsHQBK+pA1OU7igCCQb8q9+55bFvbzMUnrIcsCj6HwVTMtH/oZ1D851/zIE67eQW37oK5h2Sc3quI2sQngmSNnOEXJLuuWOvhUm+DpWkp7XPqHhMAJUuF+B3xMa8EvZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YS9o4Pq0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YS9o4Pq0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B331F000FF;
	Fri,  2 Oct 2026 19:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790969249;
	bh=TMLh6+kpgnlTMAS7jCwws3JUzVdAB4NK/Gtu/GGQ6go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YS9o4Pq0335A+yCQuWG4Lsen37G2h6e9pTCh0mfvusPgL8a7VR36qoCuginbtio3S
	 HmQ+RNY3qpa/vWmy8XPS9kUoHeiTZk1bdQL7B8dMncshh2Zpl3PnBC3of1w0o94MLj
	 EMDI7pkpMgD7vUdXf8fJC1wKdXfJQ3XiAG80jFufIig//Nr5T45ZWU7us57UQtrEPu
	 gN+Z7BdZP7Jw0DQ8B6myqbY4djgb5wOoU6h5Q/Ktl4LnpralyNfQPXdtdHsXBLSR4X
	 YbomdDFA/lHVPoxqw6zZOBeWE2HGC1lzV1Kld0Dm554XWEl6fw+kmq8Wpx2FgbcUWZ
	 A80dN6DE1rs7g==
Date: Fri, 2 Oct 2026 20:27:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, Mike Rapoport <rppt@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Pedro Falcato <pfalcato@suse.de>, 
	Kiryl Shutsemau <kas@kernel.org>, luizcap@redhat.com, pbonzini@redhat.com, 
	Borislav Petkov <bp@alien8.de>, Tal Zussman <tz2294@columbia.edu>, 
	Rik van Riel <riel@surriel.com>, Matt Fleming <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <asAE3kLFDUx5v0Nw@gremlin>
References: <arZHp8hjYFXE8Rkt@gremlin>
 <arde/t0zQNEkWqi5@pcnci.linuxbox.cz>
 <areOeRwZOez0eHm7@gremlin>
 <arotyz5g6LozSjb1@pcnci.linuxbox.cz>
 <arwNebjYXyGqrp32@pcnci.linuxbox.cz>
 <arzRBv9ceJsxJppI@gremlin>
 <ar1Xl7PE2rcoT9h3@pcnci.linuxbox.cz>
 <ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
 <ar9yRqq6cBxHDWKA@gremlin>
 <ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>

On Fri, Oct 02, 2026 at 04:55:39PM +0200, Nikola Ciprich wrote:

> > The fact you've seen this on a Milan machine (EPYC 7343) is new information
> > so that could be useful for the report, so if you can reproduce _without
> > the fix_ first that'd be very useful to know!
>
> well, not so good news here.. I tried the reproducer on multiple
> lab machines and also on one drained production box on which we've
> experienced one crash and wasn't able to get a single hit so far.
> Here's the list of machines:
>
> hostname   	 CPU	   	RAM    kernel		microcode
> pocstdv1b	EPYC 9124	384G	6.18.31lb9.01	0x0a101158
> labtest		EPYC 9274F	64G	6.18.20lb9.01	0x0a101158
> lbxovav6d	EPYC 9124	1.5TB	6.18.31lb9.01	0x0a101158
> prfjazv1g	EPYC 7343	1TB	6.18.53lb9.02	0x0a0011de
> nrbphav4a	EPYC 7343	1TB	6.18.15lb9.01	0x0a0011de
>
> I'll leave it running for few hours, and report back. If I'm able to reproduce,
> I'll try recommended workarounds and report as well.

Thanks for trying that!

Yeah, it might have been tuned to the zen arch rather than milan so that could
be making it less effective unfortunately.

> (and lots of more addresses, truncated)
>
> crash> vtop 0xffff986002783a50
> VIRTUAL           PHYSICAL
> ffff986002783a50  582783a50
>
> PGD DIRECTORY: ffffffffa0836000
> PAGE DIRECTORY: 143a7801067
>    PUD: 143a7801c00 => 80000005800001e3
>   PAGE: 580000000  (1GB)
>
>       PTE         PHYSICAL   FLAGS
> 80000005800001e3  580000000  (PRESENT|RW|ACCESSED|DIRTY|PSE|GLOBAL|NX)
>
>       PAGE         PHYSICAL      MAPPING       INDEX CNT FLAGS
> fffff2715609e0c0  582783000 ffff996e5a8932d9 7f6a1589e  1 2ffff800020938 uptodate,dirty,lru,active,owner_2,swapbacked
>
> crash> search -p -m 0xfff0000000000fff 582783a50
> 3c600964f0: 8000000582783067
> 11e238a54f0: 582783e67
>
> should you need anything else, please let me know

Thanks! The LLM has informed me that it got that wrong but it was interesting
data (...!) which suggests guest memory page tables might have somehow ended up
there.

Could you try:

    crash> p d_hash_shift
    crash> eval (0x5560450b >> D) * 8 + 0xffffb18900a00000
                                          D = the d_hash_shift value
    crash> eval (B & 0xfffffffffffff000)
                                          B = the hex result above
    crash> vtop B
    crash> rd -64 P 512
                                          P = the hex result of the second eval
    crash> search -p -m 0xfff0000000000fff PHYS
                                          PHYS = the PHYSICAL column from vtop

  And for the pages the physical search found:

    crash> kmem 0x1ae234000
    crash> kmem 0x24f0e2000
    crash> kmem 0x103360000
    crash> rd -p 0x1ae234000 512

Thanks!

--
Cheers, Lorenzo
