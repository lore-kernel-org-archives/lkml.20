Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195575;
	b=UD2U+bPwxGnN4jNC6RU0RAle1MslQLRsW4MbbwDelz6JpqRKiqKJH+84wRecv/rUfjUO
	 pVce2Ef2PHOFJC9AxLTeHSlzZtA7i7bWe4MRZSQmuveLXdWoQhP6opXlmdvxV7pmjw+R6
	 S7R8pzQ0ecorXJaEPUyuxxbdRpfU2iqBkcoqk5xWVhGiw/Qix/FGNIR6WCFKUNcNxpMRy
	 1ETYBj7icuKXwmO6xsKsW+H/p0pSA9R1p8HjdexwkRGO5bmEJAKpteXeirdHFElOnC60M
	 PY/EPo1zzOU0K+h+CMSsVW2bcqGNLid7bCsmbnx+PTY5SkYKswaGAi3um9B7pD7RicQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195575;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=D65eelUSAOzxQGdlEG05TCgLIsjy5dkMQoIhp8kiIqk=;
	b=vX8VEUPOt033RndTcfR0/+LzN+Zxq5VwxD2/VimmulPVYs3zlmmZ4aqEXXZ/ZV+20SZx
	 EQbWBu4/0Lx32HjLe6s6djwpLG0J5yhlZ1xzBwQnPQFjwFyZ0Gchn7gcOTKSCAZxRr7Rv
	 HKNUOI5nMUnBNKOMbUqeou4ZK/fZI28uxbVBijjysP4yDtwt9cf6ihiHgm/FzmR2ULk9e
	 n28QrPx5HmL+CWmPn5/v4Tu4NSoUJ5aps2fScvzuxl8IDDGnrmTWaR8i/E63/LH0ih9Ic
	 pqcgSdXe32uTwjnSVncLlJNyeqQQh+S8dn5a/8Mes0y+QcaWofTItyWbRvwPXcbIGSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cJTGOecW;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5211606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5211606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cJTGOecW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=D65eelUSAOzxQGdlEG05TCgLIsjy5dkMQoIhp8kiIqk=; b=cJTGOecW7HVb0ytUxRRpIsl1PY
	rqK7PtTNjjNmSgcSJ3ReLtOS/NqVh+6z6G0+TVoLhEh6JMlAC3kdbOK9lgDAF9Br4268JV+VgEFdM
	4mKSh3ChD7sJ+q6QnPQza64ciyPmj4M5+b3ldNhpQdVi/TUHE60H9u80O48F0edngMjtkpHgQuIT7
	56tBD8ctUr+TGUoxHwv8F3wxLtve9dlwXXvJqxBaDRxpW3hDI/PmYF7IW3Rq3UuMJgZMmtnRD1GcC
	Cl9NtJfjS7njTjhblQUFkLomQLh4H2TFZR6RVj9wr/0U/GX0AsFDug+vW+45Qovye19+5FLKgH8GH
	IVQJLAEQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM45E-00000003rxd-2CZc;
	Wed, 28 Oct 2026 13:52:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BF1AC30030F; Wed, 28 Oct 2026 14:52:51 +0100 (CET)
Date: Wed, 28 Oct 2026 14:52:51 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Chuck Wolber <chuck@wolber.net>,
	Frederic Weisbecker <frederic@kernel.org>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [RFC PATCH 05/20] context_tracking: Always inline the empty
 stubs called from noinstr code
Message-ID: <20261028135251.GS2668564@noisy.programming.kicks-ass.net>
References: <20261028120034.871983-1-sashal@kernel.org>
 <20261028120034.871983-6-sashal@kernel.org>
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
In-Reply-To: <20261028120034.871983-6-sashal@kernel.org>

On Wed, Oct 28, 2026 at 07:59:29AM -0400, Sasha Levin wrote:
> The !CONFIG_CONTEXT_TRACKING_USER versions of user_enter_irqoff() and
> user_exit_irqoff(), and the !CONFIG_CONTEXT_TRACKING_IDLE versions of
> ct_idle_enter() and ct_idle_exit(), are plain static inline functions,
> while their real counterparts are __always_inline (user_*_irqoff()) or
> noinstr (ct_idle_*()) functions. They are called from noinstr code, so
> when they aren't inlined that's a call leaving the noinstr section. This
> happens with code coverage instrumentation, which makes the compiler
> refuse to inline an instrumented function into a noinstr one:
> 
>   vmlinux.o: warning: objtool: do_syscall_64+0x81: call to user_exit_irqoff() leaves .noinstr.text section
> 
> Make the stubs __always_inline as well.

Ah yes, nothing beats adding instrumentation to empty functions :-)
