Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197591;
	b=w/hNlsXnYa6UgzTnliXddFBGOOl/14gfwW9VlajDUVsG7+Z69a8sY6ygFWJI+RyI25EQ
	 Avvqkk1F4xkrvx80qza5mlXiXnjkh47BpMsaGwLjDE4CAzmB6Wyd47X/E3/yYznc0D0V5
	 SvtI5SlFVGtIfQn1ph2c5ENRNZoiayRLiB49wOmIrDE4hTPkiytnCT/9Ah6/SSJIy+bBd
	 oRq0aCyFHSvZYhb5CZb9x2yFe92+RCFi8hpZzf3zyBn8cdplqCAjpF42+wMJFoTCIgXdy
	 D1hy6pwLUzh/qIA4XqQJYL/Of/s2I5lFHokiovvkxb122Myd3+ObqlZqsB+ZVouUI6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197591;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9EXCITnxb/Hh/s8HXGXRm/fK1vcahBNSaSzfJJTcN8I=;
	b=EPOk1uO14ODuSzJriymubxFF7/2T9dMY6vSu6YSk/pjLq6vNi9VZQACvQcqgdgjuuqFq
	 zO7HrhCysmbFdAB7FE2dushKNRI6iazK1ibD0JYpbwJaXpAMLUoLJGx8zcabctGqnuaeZ
	 kJyaC8ekbP24ItTVv2smbxzfPcCr3NfRHO7WnGsY03M7YjG4Q7cqBeyLSqscknRz6XQ8k
	 XNo1SkwxdYx7NJATrmvnM8H++TT0bTAXfQVu/PlU1Ml3lDKuTgssDJqjG6aiu7Oa73utA
	 vBRvu3cJ0O5J3NGRMKRF4kzRyOi6E8RPWEZuYgxCDNbljpvP6vNbqqqdRSs9ol2PFMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b="cK8A3/jL";
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD5D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD5D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cK8A3/jL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9EXCITnxb/Hh/s8HXGXRm/fK1vcahBNSaSzfJJTcN8I=; b=cK8A3/jLhXwkvjfvmNUvKPyuni
	s+LHm0ELZc/M9RK+dIItLWp0R1J+al9Pxc6J4+OcYwedfHQmVztuAr3QuXmdODCimJKG0Brxa5Ikj
	RRiozvNjYqWCsyq0qUt5zeKjh1LhzsYRXj36G1WsrYWRWJczCvUJqRvuCwRmbX8OmLZS5Q6xxUCHG
	rjtU62TUydmBVgrI2qRyi+wcQKREr6AYII3miv67txlCHJKuNmw649MU57TKmSqGi8/EkMQX24+Fp
	9zdv+p9kU6hNc8V/99Mr1gOmnaMGgSuuzoMzrO5YZX68wQBhLRXQ2VvwLv8T9YaixlxF0YWU3iEAG
	FyBqKSkQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4bj-0000000G3ev-0jhK;
	Wed, 28 Oct 2026 14:26:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0D32330030F; Wed, 28 Oct 2026 15:26:26 +0100 (CET)
Date: Wed, 28 Oct 2026 15:26:25 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, steve.wahl@hpe.com,
	justin.ernst@hpe.com, kyle.meyer@hpe.com, dimitri.sivanich@hpe.com,
	russ.anderson@hpe.com, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org
Subject: Re: [PATCH] x86: Drop KGDB support
Message-ID: <20261028142625.GU2668564@noisy.programming.kicks-ass.net>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
 <28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>

On Wed, Oct 28, 2026 at 07:15:46AM -0700, H. Peter Anvin wrote:
> On October 28, 2026 5:21:24 AM PDT, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> >KGDB does some horrible things, and with everybody having access to
> >virtualization these days, there is really no reason to use it over
> >Qemu's gdb-server.
> >
> >Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

<snips a gazillion lines>

> Is that really true? What if the debugging depends on specific hardware?

Use device pass-through, emulate it, or printk() debug it.

Using KGDB can cause a ton of problems, it more or less stays stuck in
NMI context, which can terminally screw up the timekeeping code, it can
also cause the watchdogs to fire and there's endless annoyance with code
patching and breakpoints.

People have been trying to 'fix' the breakpoint code to be less broken
in the face of KGBD, but its all terrible and really not worth it. By
fat the sanest option is to just delete KGDB as proposed here.

Also, when was the last time you used KGDB? I think I've tried it once,
some 20 years ago, and haven't bothered since -- it was *that* good :-)
