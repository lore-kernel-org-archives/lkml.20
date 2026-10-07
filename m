Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837683D903B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791406203; cv=none; b=Zr5f2t9VKkpf67Ht131iRy7FjHAFMuMriN07F6VoYOp0UZR5StpWy5rBSEyrTNCp2AcFlGfX8cUA0b3+uXt6+rCnfqQyBGNXzUsyy2HgX/jjAz8CZajh93ZR7xUq8AGUqwypM7bc1QzbniwQAT8E3aCBJk15cIibb7yVNNatGHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791406203; c=relaxed/simple;
	bh=tfHm66Gdvigp4+Dpx1G99dFShms5gdFpsR8mrMbrbxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elZxVFBjNoBRc1NFDP7erlrrnJOyhS978r1CdxfQ7CqqP3E+QFp3x67ILL4NSle2elLIxli4G8uG3eEyFLbDHZJi9n2XWpq4ZRvt/OUmElyl1SyfdE7YHyCozGvmgaedOQu+xC+m/0WuYUey0wWxvSFZEVbsFHuJQCbIs48CfFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPw1231d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPw1231d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0D91F00893;
	Wed,  7 Oct 2026 20:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791406202;
	bh=dQaAiC92VC3y4wHmfhWBjbCmKU1NnxGhX4yNLwuEUR8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=fPw1231d+UpFoeYm2b5Abf2aTEqy7dNmBj3fZ1Yzi1R7iWt6sAikyRRDNmzePDvP8
	 SkfifuD/0xLJB1dXMpvKHRTEpScSIbH7GwzgZ0mxL9QA3RrLMDMbCZ601t1fA5XzLT
	 l2UsbZylLQzwxahMBVmihsHTBxg6tQBCuCPn7DZILKCVYQ1OtAqi9fcd6jViqeoHPy
	 eSyRTykGDtJYatuPFIdv/VNaAZ+8L8/b6H7ADJTbkpiao9ErxlgWR0P5sozBUB0Tfw
	 Sg930yP9pdkalD2U3OuExX/uBYBDrrzIr1At/IYYIvPtMA1Oz98DQpRdsNWjenA4lD
	 QViTEm0QeWIOA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 149F6CE0D79; Wed,  7 Oct 2026 13:50:02 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:50:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Provide two-byte cmpxchg() emulation
Message-ID: <fd9032cc-c47f-40f9-9a20-727d4238cbc6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
 <CC142478-7313-4A97-A876-897E97042D88@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CC142478-7313-4A97-A876-897E97042D88@mainlining.org>

On Wed, Oct 07, 2026 at 09:44:02PM +0100, Bradley Morgan wrote:
> On 7 October 2026 21:36:01 BST, "Paul E. McKenney" <paulmck@kernel.org>
> wrote:
> >Hello!
> 
> [OFF-LIST]

Well, off of most lists, anyway!  Been there, done that!  ;-)

> I mean, I did what you wanted, hmm?

You did just fine.

							Thanx, Paul

> >This series provides emulation of two-byte cmpxchg().  Note that this
> >does not (yet) allow free use of atomic operations on two-byte operands
> >in core code because there are still a few supported systems that do not
> >have two-byte store instructions.  However, this emulation does permit use
> >of wide range of two-byte atomic operations, so is worth putting forward.
> >
> >This series is being reposted on request in order to ease testing efforts.
> >
> >The individual patches are as follows:
> >
> >1.	Add two-byte cmpxchg emulation function, courtesy of Bradley
> >	Morgan.
> >
> >2.	sh: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.
> >
> >3.	ARC: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.
> >
> >4.	csky: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.
> >
> >5.	xtensa: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.
> >
> >#1 and #2 have the acks required to go into the upcoming v7.4 merge
> >window.
> >
> >						Thanx, Paul
> >
> >------------------------------------------------------------------------
> >
> > arch/arc/include/asm/cmpxchg.h    |    3 +++
> > arch/csky/include/asm/cmpxchg.h   |    9 +++++++++
> > arch/sh/include/asm/cmpxchg.h     |    2 ++
> > arch/xtensa/include/asm/cmpxchg.h |    1 +
> > include/linux/cmpxchg-emu.h       |    4 +++-
> > lib/cmpxchg-emu.c                 |   38
> > ++++++++++++++++++++++++++++++++++----
> > 6 files changed, 52 insertions(+), 5 deletions(-)
> 
> --- Thanks!
> "I'm not a very positive person" - Linus torvalds
