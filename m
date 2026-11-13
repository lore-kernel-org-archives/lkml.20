Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576289;
	b=RE85rc1JOGoBPilR2/8OlRiBbb1PfXgQytZHO//CONuJ0WSr30UtcY6ig6I9DsXgfbo+
	 Km6/6CernQDHY1vEoSmNa07cYO8voRxIc6jf2u2c/W0YcMHC38JnZu88G+xuKRhIg1+zz
	 tK95E9UuG8G34GIAiB/IbjxNtNh6zV1jnYBiBCWDvcwrhA+XxWVuzERk1pMSe3DYs08Y+
	 0/2aIpDNmBfW3WkkMskFIi4EUXy+OYr8mySV3n2M1tcSiCY+cvFztr1uP343B2vOyHgEn
	 OVdCn9qnu9UQQGu11X/0BlnbRKi44A+MNOo3pbvbWfmQHu8nCQYgGmQab8SDpHZBCkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576289;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=u9a3QqEM0vSfXTrUaogBVZSa5WWTyqFNUXuzV873bjU=;
	b=TaK5/ygG1YOKcHHRUoNgbLKaszyaQ4ciELan48AG5LLWyroTMRFMfmnyiv4Rt6E5+zwo
	 P46Ph6t7UdSt0GEM8Uk9p5SQg5Sp3Otzrrpyt7lmyb3SO+wOYdLweaWNgIhD5KUtC4lcA
	 iqNILk06hhvC9qP0MVLJUiM2ghrsJKMmTt4IEQHesYGeF5lEL5Y4cEsHXnh+gHmHYyzQd
	 oC33gb7qXVnZhQdlfFG8acnYnoJ3KNOiC2VRASyp84zM8DAAm4U8USwp/isgXqIOy9VjW
	 JztIxp+3x//VNim1dh4qSMCxCnHhAmtNkwr9VILEGk1r/SrxMYVMMGeJOqA/1ywrz6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgpSEFyf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8DD606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgpSEFyf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650B31F000C4;
	Fri, 13 Nov 2026 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576288;
	bh=u9a3QqEM0vSfXTrUaogBVZSa5WWTyqFNUXuzV873bjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YgpSEFyf4mKL+1E2nFyvbEiXeqrlz/27QZWcR3UBnuxXRIQIBE+AwqKsbc6D3U1JH
	 xzIjyGRDalxYrnf8yNQGOBAeBxlOPNS/1vBDDoSwPPYSeqdi0scpZ/HjkOpEbjYDtA
	 KR6CqjgLjpMd8kmG/TQ3HB3kk6VJD06/G4OawD7XvkiiSThn4hc0x0UCZ8LbS+JyMQ
	 897s2nZJ2d51B80OG5Rxf1lMjcbEFwIX4JhDf4+OuQONOstvXIAFM7YeuSAD3G2S5J
	 meUplC099/Bhe4nYGlHvgol2fmj/cr4JADJ9wn+vXnOjyd/wOYnEN5B6BY0QSDA79C
	 vywl5lVzUeUXg==
Date: Fri, 13 Nov 2026 13:24:43 +0000
From: Will Deacon <will@kernel.org>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, mark.rutland@arm.com,
	oleg@redhat.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avcPmzjYGc-uHMkU@willie-the-truck>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <at-czRUYRPRxi9dy@arm.com>
 <aus2Aq12Z-PKvoW7@willie-the-truck>
 <56ed8952-fb5a-4f88-90c9-6fe5476237cc@bytedance.com>
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
In-Reply-To: <56ed8952-fb5a-4f88-90c9-6fe5476237cc@bytedance.com>

On Thu, Nov 05, 2026 at 12:15:24PM +0800, Zhao Gongyi wrote:
> Hi Will,
> 
> On 11/4/26 9:41 PM, Will Deacon wrote:
> > I can't quite get my head around what it means to set NT_ARM_SYSTEM_CALL
> > in this context. Suddenly, in_syscall() will return true, which has
> > implications for things like signal handling that seem bizarre if we're
> > not actually in a syscall. Should we be avoiding this situation to start
> > with?
> > 
> 
> I ran an additional arm64 KVM test with SIGUSR1 and SIGUSR2 queued at a
> group-stop. After the tracer set NT_ARM_SYSTEM_CALL to __NR_getpid, the
> second signal-handling pass saw syscallno=172 (the control saw -1),
> although the task had not entered a syscall. I did not observe an
> incorrect restart: x0 held the first signal number (10) by that point.
> 
> system_call_set() assigns syscallno before calling
> update_syscall_orig_x0_after_ptrace(), so retaining the early return
> will not prevent that state. I can investigate separately whether the
> regset write should be rejected at such a stop.

Thanks. We probably need to be careful about tightening this up, but if
the current semantics are just that "things go wrong" in some way, then
I think it might be worth it.

Will
