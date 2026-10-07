Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A20A287247
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405844; cv=none; b=H2VfIhGGaDw50xJPKmTcQexCgWrTCAooeFF7/nr9s2ZL4AzEGLD1G5GEMJr19Fl0lhT6fhf7Rgrx4OxHOtTrjHg6Dflv1VxSxx3BmYgmQGyQ2RQuzAZjCggEw2eNw5eVJdiMX+4oxiOT7Q58HhQ1Q3DbFQUndFxKkQHJLiZVwyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405844; c=relaxed/simple;
	bh=k/6F8VWtaYd3ONMV/HOFJfYR+7fgNAMaQfodmsIER/s=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gTwHmxpXsDGexFDi/CytnSW3Z6Ph5AKcneMJpVdlK7yEuGdnk7kfGMZ0ukhZeOwdrCvDpiP6BD9VVqjxDLQdkd6VMgWPIDUiELouQ5klbfMTEdMks5gV0RAjGtRlDn7BUtbzQUQdZQAIQfkNC+XP+4DJOktu3uemJoqeEj0SRjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=B3Llc5M0; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Tv/pGKH4; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="B3Llc5M0";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Tv/pGKH4"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791405840; bh=nOxNy+S0BCXDyFMzZlGl4vT
	zKOD/oPFalmyCF+kRqN8=; b=B3Llc5M0I3dsjbki1swCD7hgPKdKgv8JC1ke+pDsGVl0/Jd/cr
	x8sQGzb2P5ljI4GKq4F6v3Pqpa1J5KJLzW3vlb6xb1kynrrhOPkbJafbl746YRnrYRE8sQMjBHY
	NH+KOWFQaO9XrtJqsUo1F/obEs68526sH/vTGzQKXaAD+tGAB0zWrJfsGfet4VrbvFCAkxxNlNL
	9f5FhaFvvgrNxFnrjJuBVq0DzzOYK4kQyutAmuBTCOAOyOaW8wyfJRBXwAAQLMzzfER+ftL7OEp
	MJ3kPjSZxZRe4eR0OKjjMFNgAx5EOc9xGJ2tr+h28MMHZuODyH4HVppNsQMQlU/7kbg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791405840; bh=nOxNy+S0BCXDyFMzZlGl4vT
	zKOD/oPFalmyCF+kRqN8=; b=Tv/pGKH4loe5vpW10DerYK2FtTYG5xJtPB4wsOtu6WEuJMfXKE
	i0oBIN/Tq4f4D5vlIgPFAWg7p2agA9yVnaAA==;
Date: Wed, 07 Oct 2026 21:44:02 +0100
From: Bradley Morgan <brads@mainlining.org>
To: paulmck@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Provide two-byte cmpxchg() emulation
In-Reply-To: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
References: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
Message-ID: <CC142478-7313-4A97-A876-897E97042D88@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 7 October 2026 21:36:01 BST, "Paul E. McKenney" <paulmck@kernel.org>
wrote:
>Hello!

[OFF-LIST]

I mean, I did what you wanted, hmm?

>
>This series provides emulation of two-byte cmpxchg().  Note that this
>does not (yet) allow free use of atomic operations on two-byte operands
>in core code because there are still a few supported systems that do not
>have two-byte store instructions.  However, this emulation does permit use
>of wide range of two-byte atomic operations, so is worth putting forward.
>
>This series is being reposted on request in order to ease testing efforts.
>
>The individual patches are as follows:
>
>1.	Add two-byte cmpxchg emulation function, courtesy of Bradley
>	Morgan.
>
>2.	sh: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.
>
>3.	ARC: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.
>
>4.	csky: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.
>
>5.	xtensa: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.
>
>#1 and #2 have the acks required to go into the upcoming v7.4 merge
>window.
>
>						Thanx, Paul
>
>------------------------------------------------------------------------
>
> arch/arc/include/asm/cmpxchg.h    |    3 +++
> arch/csky/include/asm/cmpxchg.h   |    9 +++++++++
> arch/sh/include/asm/cmpxchg.h     |    2 ++
> arch/xtensa/include/asm/cmpxchg.h |    1 +
> include/linux/cmpxchg-emu.h       |    4 +++-
> lib/cmpxchg-emu.c                 |   38
> ++++++++++++++++++++++++++++++++++----
> 6 files changed, 52 insertions(+), 5 deletions(-)

--- Thanks!
"I'm not a very positive person" - Linus torvalds
