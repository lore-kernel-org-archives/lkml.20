Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576113;
	b=WDIMxShVu/4n8/7UlKdug9cSgQ506WheiJFNAXBx3/yDD2fxp6858Rdk2p0Xrm74PzSR
	 IiL8GXWartEycG5ooA0aHFQYyjobb41+L9IAade9lNUcpKQ5l3+4dhhg0dqy8fBnYQKzB
	 Whn9F+Cg87pCt7FZHj+pfCVdiKUEqQxz2PlO5cYvi4eSW0165Q84GduYk+4H0ynbh1HSs
	 hOmcNi90FE5XlVST1mp8xhBtxtCLGxsUlmE2ZDHbouQsV5hVMCSN4hZyzMCxuyrtppKij
	 8hTAqw0m5IF+ApSUE0ECF9Ds8zH8Bfm69AVvy6Umvqrj9KIEInPf1MI+O/WMcAmYdWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576113;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pZ6gA3Y+UTcqk8KmHhY+CJP8JY6AZLSla8IhLC9FqDU=;
	b=wfr/JQ2u1aW5fYpa7z0PqOQq2ZsEACl9xWXWNVgjxDFUyaQy0SzOAmSBzu3nNdwlwBcz
	 eJJCch8Kz3g8Dmlp80OOAYvkvHLrmspVc07XVZjCnIi/roN78Zxo83xIGRkNM0IPVcPAG
	 pLe/iPUzZ5znrZd6ZIowOiUbxpSi/AOFpNm1U95gUpvZN2pa3csIPlI70LmnDyaDqHVdm
	 7FHR9saSQAhEzkU9+NQgzMRCz87R59ppfM/Lh5wb5PE6vQurE0vZ8TOdc46d35dlqlgTy
	 WeiR1BjgOIaMva2Sy/jg4MSQO4ZQvNKkZ3fua3+n6zW0xgd+q9lPdakiDK/hpPv5InQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SFihnx7j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAFA606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SFihnx7j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2151D1F000C4;
	Fri, 13 Nov 2026 13:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576112;
	bh=pZ6gA3Y+UTcqk8KmHhY+CJP8JY6AZLSla8IhLC9FqDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SFihnx7jSrjWjs5js7rSDIK1hTYPBwFLTzOLa2x8uJBOUEXFZKNqZSUGqLlfOZpbs
	 KeBJpg9QkbCD9SV+HIeNaO4A29AsXDxtE3t3vdjhGOpOixBzqnKdBT52Y5s6m/SOfF
	 K26M2Tko74C4tsFWFuuTjuXwawROhZJS9o2cQCs7LaXNhJl63K9+Cs9vcK9Uh81TSV
	 mPvgVRBfqq3n8Qrbpy2L9bL6bikAV4qO0uAmtoCZv9dZMu/69nZFcPZz31iUFMD/9O
	 xIsBleFBF/f/9ahjN76NUF+rdVjHYW9NuS2YBuPaNjHUHIKGCEPen5likWLQMMiDEa
	 PmJHoL7Vr6FKg==
Date: Fri, 13 Nov 2026 13:21:47 +0000
From: Will Deacon <will@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, catalin.marinas@arm.com,
	mark.rutland@arm.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avcO66Wk6V7oJ4xj@willie-the-truck>
References: <20261105113051.97810-1-zhaogongyi@bytedance.com>
 <avDGjYYR6Tj1sVgP@redhat.com>
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
In-Reply-To: <avDGjYYR6Tj1sVgP@redhat.com>

On Sun, Nov 08, 2026 at 07:59:25PM +0100, Oleg Nesterov wrote:
> On 11/05, Zhao Gongyi wrote:
> >
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -573,8 +573,8 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> >  	if (regs->syscallno == NO_SYSCALL)
> >  		return;
> >
> > -	/* We should only be called when target is in a ptrace stop */
> > -	if (WARN_ON_ONCE(!info))
> > +	/* Non-seized group-stops do not provide siginfo (see do_jobctl_trap()). */
> > +	if (!info)
> >  		return;
> 
> First of all, FWIW
> 
> Acked-by: Oleg Nesterov <oleg@redhat.com>
> 
> This change is "obviously good" and doesn't change the current behaviour.
> 
> 
> 
> ----------------------------------------------------------------------------
> But can't resist... The old comment was obviously wrong, the new one doesn't
> look clear to me. It correctly explains why info can be NULL, but not why we
> should not update orig_x0 in this case. May be it should just say that exit-stop
> always comes with info != NULL?
> 
> Nevermind, I leave this to you, Catalin, and Will.

Yes, I think it makes more sense to talk about the exit-stop, as that
is what this code cares about. Something like:

"For exit-stops, info is always non-NULL, but that's not true for other
 stops such as non-seized group-stops. In those cases, just return early
 as there's no need to update orig_x0 anyway."

With that (or something like it):

Acked-by: Will Deacon <will@kernel.org>

Thanks,

Will
