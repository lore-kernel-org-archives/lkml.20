Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227363;
	b=Z/lMf4sBPkdAPlghVqHub0LGUyvbqBZD5JTRnebDXMTmbH3u5uvoMgI0vDz2L2csNnDE
	 5+W/hzu9FHy8mm+dbfuArvqS0D5ifeXzPn5qOBd8c71iRaWcNS1WBEj6bSIgUcQYOSDnl
	 9U74LtQQSBPRsHz7dBFkcDgJ932tP1LvSiMdYavmUQMYiqtSBPDzxPnV05RkYwSvL5uel
	 rqsQ2ZflgGizjVV/hFgz4Ze/UpIYiinvOMyc+vwdv96kK1TiQQqUYvc9a3N1f7xKRy/Jz
	 Cniobl7C71OxWdXr2xPBITBSeUPotujJ/OSIn5lf3pUBiaTFcLHno/ZtgP/1nrkNeWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227363;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=a8E3/iR/a7duyeOibRsBSGVysFs99fc4KMcpjzN9cYk=;
	b=pE23+4Nwj+afqFixKuysnKalu4udDww0Ayq05K5hj9vpPTtmBANcyUtHaqwSAIBchE26
	 ILie8L7WnA4XIS0A04eu+L9VrQ8OmRnmju2Vl7jWt+SKzGH9pPnYU0pOQCAelERNi/xk9
	 kCbYr3nL4vymIoC3fHfQF2/jFOYVdeDQ0Vp6cAOYiktLVz+yB2vSgnNKTsmYwZJZa1v24
	 kaFxk9QYJOK/4CsEp7j1h37AawlRf4Nd386LFphzV6sMtTcgoNVIm2LIKzD0fAw/zpmt5
	 NK8uLnsBtRt2RpFU47SOCT5ErvQQbQSk5s6iMCfcEE+cSxBh32vyDx/+duaBYadV84g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=O4tfkQ6A;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAB9606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BAB9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=O4tfkQ6A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a8E3/iR/a7duyeOibRsBSGVysFs99fc4KMcpjzN9cYk=; b=O4tfkQ6AbDAzvKyE5zaAjBHE6n
	jTJOZEc5PTA7g0izZDHyZ4TgazCd42btIlSVcCRjSsw7v6qOS1c7jxbmpZX/TF3GzJZwz+jwAt61q
	qzlkeO7IHtMybsm6Ut5RgUPR2z8n/wQjTG4+evvl5CyIBaCY+AXr6xFnqNMVKrCZJcK9v0RN9eCoB
	a8z9jhqb/w7OLBuXXscrYQ9yeqExpaqmeYQy8c96E3JsSh1oWRJSaVbOjocXJqJczDxZ/Q/p6NmUf
	4a5moEyEQOqv23e3ldCeGGQ/Mb8EaiCVwU91/c389n37CE4/JkG5AZr7sz5pKbulPmmK6pS49D5mu
	X6JrMfaw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOUn-0000000EJ1J-3fw0;
	Mon, 09 Nov 2026 12:29:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 68D7A300910; Mon, 09 Nov 2026 13:29:08 +0100 (CET)
Date: Mon, 9 Nov 2026 13:29:08 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: =?iso-8859-1?Q?Lu=EDs?= Mendes <luis.p.mendes@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, x86@kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-um@lists.infradead.org
Subject: Re: Some observations regarding the ongoing x86-32 CPU configuration
 cleanups
Message-ID: <20261109122908.GU2668804@noisy.programming.kicks-ass.net>
References: <CAEzXK1pdhEyOgQ4owkeRmyEP6Pyfhk=OsMHdzU4xwNMCmCsd6g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEzXK1pdhEyOgQ4owkeRmyEP6Pyfhk=OsMHdzU4xwNMCmCsd6g@mail.gmail.com>

On Mon, Nov 09, 2026 at 10:34:54AM +0000, Luís Mendes wrote:
> Hi everyone,
> 
> First of all i would like to say that i both admire and appreciate all
> your hard work with this lovely OS. I do understand that maintaining
> some systems can cause additional burden on maintenance, but there are
> some aspects that i would like you to reconsider.
> 
> I am writing because I  believe that some aspects have not been taking
> into consideration regarding the removal of the 80486 32-bit support
> from the kernel, namely:
> - There is this active Linux distribution:https://tinycorelinnux.net/
> and the Damn Smal Linux DSL (https://damnsmalllinux.org).
> - There are also these CPUs: https://www.vortex86.com/products/Vortex86EX
> - There may be only a few vintage 486 systems still working, but there
> are also other new x86 CPUs systems, especially in FPGAs like the
> https://github.com/MiSTer-devel/ao486_MiSTer which is a 486SX core
> that operates at 90MHz and can use up to 256MB RAM memory. There are
> plans to update this CPU IP core to become a full 486DX core, by
> adding a FPU unit to it and would turn this into a usable Desktop
> system with tineycorelinux. There is a considerable retro-computing
> community that utilizes the AO486 core on the MiSTer FPGA platform.
> There is even a Voodoo 3dfx accelerator card:
> https://github.com/victor-fisyuk/voodoo-fpga-public.
> 
> Overall i just want to inform you that some new x86 32-bit systems are
> still being sold brand new and can be utilized with Linux. I would
> like that you consider this with regard to how much 80486 support
> should be removed from Linux.
> 
> Personally i do have plans to extend the AO486 core to have the FPU
> and would like to be able to run a modern Linux on it. It would have
> entertainment and educational applications. With tinycoreinux it can
> have a usable desktop.

I don't realistically see 486 support coming back -- the thing doesn't
even have TSC. Getting rid of all the horrible (and completely untested)
code for no-tsc alone was worth deleting 486 support for.

The other option is you actually implementing RDTSC, CPUID (and possibly
CMPXCHG8B) on your FPGA.  I'm sure that's actually a *LOT* simpler than
doing i487 support.

Just add whatever instructions are required to get the bare minimal
32bit build working.
