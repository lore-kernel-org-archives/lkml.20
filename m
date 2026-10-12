Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90840471249
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805499; cv=none; b=rfuZ+EezvriWFkDEdGlN+XbgtLebUEQQeNC7ozoyfiwfNcV77EQ58mVs1S0vUmxmTGW0/tu4g80vqWn/q/+NEBrz5q7b4nj9JiK/axNdBi7CVjoYe+I7M0lg4/jmkG5MiebyVzkDigW9/Mf+0J1Re9ek2zDiWyS7/cLDTbCtRhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805499; c=relaxed/simple;
	bh=MJF15hdzoshC2XO/X1+Djxx41tAvhVDkOW7BkufFnhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nl2zLd6Yf/sduj7PCJI09lTeMoxL00jPcxNIqQGCFqaUBPRzCOzLJkK2/M174cGN/8dic6f+AcMibhgLVpwrbVgWa9/tUbCfKdJHlyA6h8PWAcWbS4Eklg7mOPzDuEHuUNBK7Mwaav4VL5lw83iwcwgVAkyG6wOzg/tiZKGpD24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=Mis9rF25; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="Mis9rF25"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 69CBhbXJ266419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 12 Oct 2026 13:43:37 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 69CBhbXJ266419
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1791805418;
	bh=pB40mqfqJVnrOjih4vzreHDbbNCWB9anzRndgxLYqM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mis9rF25pZtsufSRCWCXxpLH+5P3h+KaEJXfwd/CCwEjUQZOzk3HREGNvXRjy8IIa
	 5/4B9B+prpExc6jR1QAshYRfYCh0SCbtWfS0C4dUbd0tvlPiQyaEJJdoXRiDIMBmhy
	 IzZ80/aFtF7SUV/QGzO7v832mxPgcErSVqsH2HMs=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 69CBha8Q040600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 12 Oct 2026 13:43:36 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 69CBhUjG2765366
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 13:43:34 +0200
Date: Mon, 12 Oct 2026 13:43:30 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: David Laight <david.laight.linux@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, Rik van Riel <riel@surriel.com>,
        ljs@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, david@kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
        luizcap@redhat.com, pbonzini@redhat.com,
        Tal Zussman <tz2294@columbia.edu>,
        Matt Fleming <matt@readmodwrite.com>,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
References: <ar9yRqq6cBxHDWKA@gremlin>
 <ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>
 <asAE3kLFDUx5v0Nw@gremlin>
 <asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
 <bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
 <20261005132113.43548696@pumpkin>
 <asP5xK4axiUk7jun@pcnci.linuxbox.cz>
 <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
 <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
 <20261009090042.39ba9c06@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009090042.39ba9c06@pumpkin>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O

Some more news.

In the meantime, we’ve had the same crash on another of our own
cluster nodes. This time it was booted with tlbi=ipi, so that
didn’t help either, exactly as Borislav said.

(Just a side note: it seems quite hard to check which TLB
invalidation mechanism is in use. There is no message in dmesg,
and invlpgb is deliberately not displayed in the /proc/cpuinfo flags,
so apart from measuring with perf, I simply have to trust that
the kernel parameter does what it should for my kernel release.)

So if I understand it correctly, we can now completely rule out
an AMD firmware bug, right?

Since I didn’t have anything else to try, and we started having
crashes on our own cluster nodes, where I can be a bit bolder,
I built 7.3-rc6, deployed it on two problematic AMD nodes, and
started a migration torture loop.

Over the weekend, there were ~70 migrations of ~160 VMs between
those two nodes without a single issue.

Today I upgraded both boxes to rc7 and started the migrations again.

I can’t be sure yet, but it really seems the problems are gone in 7.3.

The question is: what now? (I still think bisecting would be unreliable.)

For those interested, I’ve tidied up the shared files a little and
added some more content to https://storage.linuxbox.cz/index.php/s/6rcp8oWCGzAqPEY:

6.18.55-lb9.01 – 6.18.55 patched source, patches and binaries
yyyymmdd-xxxxx – collected crash data for various occurrences
kernel-6.18.x-problems.xlsx – problems overview

Maybe it will be of some help.

BR

nik


On Fri, Oct 09, 2026 at 09:00:42AM +0100, David Laight wrote:
> On Thu, 8 Oct 2026 11:23:56 -0700
> Borislav Petkov <bp@alien8.de> wrote:
> 
> > On Thu, Oct 08, 2026 at 02:29:36PM +0200, Nikola Ciprich wrote:
> > > [11402.940943] BUG: unable to handle page fault for address: ffffffff0c93001c
> > > [11402.942273] #PF: supervisor read access in kernel mode
> > > [11402.943629] #PF: error_code(0x0000) - not-present page
> > > [11402.945025] PGD 6d6f83a067 P4D 6d6f83b067 PUD 0
> > > [11402.946469] Oops: Oops: 0000 [#1] SMP NOPTI
> > > [11402.947950] CPU: 23 UID: 0 PID: 704950 Comm: servercare-moni Kdump: loaded Tainted: G            E       6.18.55lb9.01 #1 PREEMPT(voluntary)
> > > [11402.951254] Tainted: [E]=UNSIGNED_MODULE
> > > [11402.952913] Hardware name: ASUSTeK COMPUTER INC. RS720A-E12-RS12/K14PP-D24 Series, BIOS 1201 08/25/2023
> > > [11402.956569] RIP: 0010:__d_lookup_rcu+0x4d/0xe0
> > > [11402.958452] Code: 48 8d 04 c2 f6 07 02 0f 85 a0 00 00 00 48 8b 10 48 89 d0 48 83 e0 fe 48 83 fa 01 77 0d e9 80 00 00 00 48 8b 00 48 85 c0 74 78 <44> 8b 58 fc 48 39 78 10 75 ee 48 83 78 08  
> > 
> > What is that kernel?
> > 
> > 6.18.55lb9.01
> > 
> > The other machine has a 6.18.20lb9.03-something one.
> > 
> > How can I look at the vmlinux you're running and the sources?
> > 
> > rIP points to:
> > 
> > [11402.958452] Code: 48 8d 04 c2 f6 07 02 0f 85 a0 00 00 00 48 8b 10 48 89 d0 48 83 e0 fe 48 83 fa 01 77 0d e9 80 00 00 00 48 8b 00 48 85 c0 74 78 <44> 8b 58 fc 48 39 78 10 75 ee 48 83 78 08
> > All code
> > ========
> >    0:   48 8d 04 c2             lea    (%rdx,%rax,8),%rax
> >    4:   f6 07 02                testb  $0x2,(%rdi)
> >    7:   0f 85 a0 00 00 00       jne    0xad
> >    d:   48 8b 10                mov    (%rax),%rdx
> >   10:   48 89 d0                mov    %rdx,%rax
> >   13:   48 83 e0 fe             and    $0xfffffffffffffffe,%rax
> >   17:   48 83 fa 01             cmp    $0x1,%rdx
> >   1b:   77 0d                   ja     0x2a
> >   1d:   e9 80 00 00 00          jmp    0xa2
> 
> That looks like the same hlist loop top as in the other failure.
> IIRC the fault has the error address in both %rax and %rdx which
> means the invalid value cane from the top of the hash list, not
> from following the linked list.
> 
> >   22:   48 8b 00                mov    (%rax),%rax
> >   25:   48 85 c0                test   %rax,%rax
> >   28:   74 78                   je     0xa2
> >   2a:*  44 8b 58 fc             mov    -0x4(%rax),%r11d         <-- trapping instruction
> >   2e:   48 39 78 10             cmp    %rdi,0x10(%rax)
> 
> That is the hash compare instruction (that fails in the other function).
> Not sure why it reads offset -4 first though - the compiler will have
> reordered it from after a condition (just to slow the code down!).
> I'd guess there is a container_of() lurking.
> 
> David
> 
> >   32:   75 ee                   jne    0x22
> >   34:   48                      rex.W
> >   35:   83                      .byte 0x83
> >   36:   78 08                   js     0x40
> > 
> > I need to be able to pinpoint it back to the source.
> > 
> > I asked the last time:
> > 
> > "Just to rule out any other issues which got fixed in the meantime, can you try
> > mainline Linux and see if you can reproduce your observation with it?
> > 
> > If so, you could share your crash core along with debug kernels yadda yadda so
> > that I can poke at it.
> > 
> > And before you do, make sure you have the latest BIOS and microcode installed on
> > that machine.
> > 
> > Also, where can I find full dmesg and /proc/cpuinfo from those machines which
> > trigger this?"
> > 
> > But still nothing.
> > 
> > Imagine this issue has been fixed upstream but you don't have the fix in your
> > kernels and we're basically chasing the same thing again...
> > 
> > Sorry, but I have lost my debugging crystal ball which can help me guess what
> > the machine does. :\
> > 
> > > so we now know this didn't fixed it. however I didn't have tlbi=ipi set, so I'll
> > > now try this.  
> > 
> > That won't help either but if you wanna try it.
> > 
> > > any ideas on this new info?  
> > 
> > Yes, see above.
> > 
> > Bottomline is: without sufficient debugging data and up-to-date hardware,
> > there's not a lot I can do.
> > 
> > Thx.
> > 
> 

-- 
Ing. Nikola CIPRICH
technický ředitel

+420 591 166 214
+420 777 093 799
nikola.ciprich@linuxbox.cz

www.linuxbox.cz
