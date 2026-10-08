Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5894F0529
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483874; cv=none; b=Aul36Q22S5bgRzKCe7rJW2Wyh+mXKO7j0aQiWg2bxCuyrqWv4zU6ytqydu6ML9v3BJPNk7nOAZutcBUiaaBx5yIWF2tW0Q5YVVNT1MoHJ49vBHSQSUsJu9FIU4H69ypTrCHaPsbGHZ3+TvPQcRi+VAiDWf+FUv8kAyXLXBwosVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483874; c=relaxed/simple;
	bh=Zw1eT3dzocKOcZpzU8R/f8QZZnuHnfZGs8I6ZHQijIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRQxGDZJuOCBfYtTbh/tJJxx9R2hiie3ZLmaNr1+VxDeQ0b0NgPlBJSCKs2wKEppO04omj2mBRozdnKRZWvkQKcpwu5Gby4AJCNXuKFkxtWBkTbyTa9KQP5l7+2ojx0AX4vdLWpIG7FHyzd5nFsk6iGFxaJMHUwfqYwIOAXjFgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=c+8EvEU1; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="c+8EvEU1"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8D6C140E0481;
	Thu,  8 Oct 2026 18:24:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sNt0bsNe_ZJp; Thu,  8 Oct 2026 18:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791483857; bh=ArtIe0J/YtHNeMIRmnR0Ro+s/jjV/sVKo94Bg+mHdOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+8EvEU16YMPCeKQ5i/icXx+OWIj8TWokrJ8eVHCV6XOUBlfACj8OFY3JBO9mshE9
	 Yfsfs5t62zYmyTZJDIlwEm9OSjw04jQ6qivErFAHOhYSEpB/Kuzx6kACGa6wC/uoJk
	 1AjWyeRSPyiX+kpdmYC7xPhga4NIIOOZ0SmMA4zqT/ouVQbMA1gHvShwasx1UT0f+M
	 IrwsT2t5robKk71D4fkCYVUo+wSrfnz53+Grf6qAUkzFpnVAKTzSu43AlrMBNfLZlc
	 TMBBwupTqB1vGLUJqRmVdsP3X24OPxjwoGZ315q1MNNzYVazWO/h5+ZxOnOUd611eL
	 sTqq8hCpKWioAsUBJXyvNOh6SYPGhqgOAId+sXFW1dmMooVyqjcUykiM601ermDrMG
	 O5aDKek9U5xL/uo9LJv6I8Plu0h7Yzf161HIfaUoATjtpIA6RPoxnmHLgCYE6LhUAq
	 dn388REozKlRwmPhygPxvnIg5H0cbaPEX+6cr9w8OFrf81tlnlynAeuD1CYwohFkUU
	 XNkTIZB7doKd6lhK6DFVgNSHNmpSmBeMHofhQH15ItNDiijgTgjdE3/ULYidRt+HL5
	 7K9banhdUSv2r5zuc0kDqA16n+FzFzalHiKTq/juzAZfAWsizeYg5ymheA2CCC1uwt
	 PvhDM9ERmaye6SWnI5Radwwk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 364F540E00E5;
	Thu,  8 Oct 2026 18:24:01 +0000 (UTC)
Date: Thu, 8 Oct 2026 11:23:56 -0700
From: Borislav Petkov <bp@alien8.de>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Cc: David Laight <david.laight.linux@gmail.com>,
	Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	david@kernel.org, Mike Rapoport <rppt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
	luizcap@redhat.com, pbonzini@redhat.com,
	Tal Zussman <tz2294@columbia.edu>,
	Matt Fleming <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
References: <ar1Xl7PE2rcoT9h3@pcnci.linuxbox.cz>
 <ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
 <ar9yRqq6cBxHDWKA@gremlin>
 <ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>
 <asAE3kLFDUx5v0Nw@gremlin>
 <asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
 <bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
 <20261005132113.43548696@pumpkin>
 <asP5xK4axiUk7jun@pcnci.linuxbox.cz>
 <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aseMsMGpGPT/G548@pcnci.linuxbox.cz>

On Thu, Oct 08, 2026 at 02:29:36PM +0200, Nikola Ciprich wrote:
> [11402.940943] BUG: unable to handle page fault for address: ffffffff0c93001c
> [11402.942273] #PF: supervisor read access in kernel mode
> [11402.943629] #PF: error_code(0x0000) - not-present page
> [11402.945025] PGD 6d6f83a067 P4D 6d6f83b067 PUD 0
> [11402.946469] Oops: Oops: 0000 [#1] SMP NOPTI
> [11402.947950] CPU: 23 UID: 0 PID: 704950 Comm: servercare-moni Kdump: loaded Tainted: G            E       6.18.55lb9.01 #1 PREEMPT(voluntary)
> [11402.951254] Tainted: [E]=UNSIGNED_MODULE
> [11402.952913] Hardware name: ASUSTeK COMPUTER INC. RS720A-E12-RS12/K14PP-D24 Series, BIOS 1201 08/25/2023
> [11402.956569] RIP: 0010:__d_lookup_rcu+0x4d/0xe0
> [11402.958452] Code: 48 8d 04 c2 f6 07 02 0f 85 a0 00 00 00 48 8b 10 48 89 d0 48 83 e0 fe 48 83 fa 01 77 0d e9 80 00 00 00 48 8b 00 48 85 c0 74 78 <44> 8b 58 fc 48 39 78 10 75 ee 48 83 78 08

What is that kernel?

6.18.55lb9.01

The other machine has a 6.18.20lb9.03-something one.

How can I look at the vmlinux you're running and the sources?

rIP points to:

[11402.958452] Code: 48 8d 04 c2 f6 07 02 0f 85 a0 00 00 00 48 8b 10 48 89 d0 48 83 e0 fe 48 83 fa 01 77 0d e9 80 00 00 00 48 8b 00 48 85 c0 74 78 <44> 8b 58 fc 48 39 78 10 75 ee 48 83 78 08
All code
========
   0:   48 8d 04 c2             lea    (%rdx,%rax,8),%rax
   4:   f6 07 02                testb  $0x2,(%rdi)
   7:   0f 85 a0 00 00 00       jne    0xad
   d:   48 8b 10                mov    (%rax),%rdx
  10:   48 89 d0                mov    %rdx,%rax
  13:   48 83 e0 fe             and    $0xfffffffffffffffe,%rax
  17:   48 83 fa 01             cmp    $0x1,%rdx
  1b:   77 0d                   ja     0x2a
  1d:   e9 80 00 00 00          jmp    0xa2
  22:   48 8b 00                mov    (%rax),%rax
  25:   48 85 c0                test   %rax,%rax
  28:   74 78                   je     0xa2
  2a:*  44 8b 58 fc             mov    -0x4(%rax),%r11d         <-- trapping instruction
  2e:   48 39 78 10             cmp    %rdi,0x10(%rax)
  32:   75 ee                   jne    0x22
  34:   48                      rex.W
  35:   83                      .byte 0x83
  36:   78 08                   js     0x40

I need to be able to pinpoint it back to the source.

I asked the last time:

"Just to rule out any other issues which got fixed in the meantime, can you try
mainline Linux and see if you can reproduce your observation with it?

If so, you could share your crash core along with debug kernels yadda yadda so
that I can poke at it.

And before you do, make sure you have the latest BIOS and microcode installed on
that machine.

Also, where can I find full dmesg and /proc/cpuinfo from those machines which
trigger this?"

But still nothing.

Imagine this issue has been fixed upstream but you don't have the fix in your
kernels and we're basically chasing the same thing again...

Sorry, but I have lost my debugging crystal ball which can help me guess what
the machine does. :\

> so we now know this didn't fixed it. however I didn't have tlbi=ipi set, so I'll
> now try this.

That won't help either but if you wanna try it.

> any ideas on this new info?

Yes, see above.

Bottomline is: without sufficient debugging data and up-to-date hardware,
there's not a lot I can do.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
