Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673E4DDB35;
	Thu, 15 Oct 2026 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081515; cv=none; b=tHnE275FQt/KKuwUNDnBsbSIeGlipxTbRCVL/b6niLMyRNbW4yiCpB9d014YROoTcWdZsDNdqHHMG8YzkVv2kzgPXMi2rTAHdz9qxZbybvgWZHze2+LRdnH14hhUsLshr2UaJdauNIVUaCL829ylaW/CzMWSy25zJ3H9aqh9cLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081515; c=relaxed/simple;
	bh=NJRLI3ehmSEpgTBEls8bsaM5nLIbgZNPc2143Iy49vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ct0RiLivf0lWTw862h6wFJR331faguyfUbmA2/9gROvmXfXJ8bUJtZmP+GdS4x5erpR1Z1KvTVoZ8gBWbQ9OwyZXrEsQYZwEphL/fa2sAA9esumTrQt7zPKL94JtJWLu1DfI7ghR/2HyJgGSY/e6FUbxw+rmyRDrWmuCFuSWWK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sg2OSTVN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sg2OSTVN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA831F000C4;
	Thu, 15 Oct 2026 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792081502;
	bh=YmDX9bQ+H2eYCS0s9rsjukTcn3P4o2IORKpy2mY2a5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sg2OSTVN9N+cfwkBXHnBSUyCX6m3t+q3mGjXbWXCN73V+4di6lKBWq3iudwFsXM/0
	 dmVOw2kT97WWWxXO7/p84cx1pmX+1yA4zpgdbGoWbpkPM6Acn8u1r/eByBlTyccU99
	 dcahZGM4RwAbjl1k1vpPdDZ2vWOrFlX0o/Dcyxk0XoT31ER7eKEdbNIuSDsHeWd7ax
	 r655PI3EGwDLUA1W3JtIt2/OmpWj2ZWweWLYhadOB57vVcucSNMKtQGtVsIJlomK/C
	 zFnZjhXjI9YiFklzcvdMiEVL1BJZJCIJlZ4KeiaTJGvn21e3tf3BCQ78bJBtsIGdsH
	 fqwGNhY4S2weA==
Date: Thu, 15 Oct 2026 09:25:02 -0700
From: Kees Cook <kees@kernel.org>
To: cve@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-cve-announce@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: CVE-2026-89603: entry: Fix seccomp bypass after ptrace with TSYNC
Message-ID: <20261015162119.1a1e0d-kees@kernel.org>
References: <2026091133-CVE-2026-89603-dad5@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026091133-CVE-2026-89603-dad5@gregkh>

On Fri, Sep 11, 2026 at 09:44:52PM +0200, Greg Kroah-Hartman wrote:
> This race condition could allow an unprivileged process to execute
> a prohibited system call (e.g., execve) that the newly installed filter
> was intended to block, especially since the tracer might have modified
> the system call number during the ptrace stop.

I'm disputing this one: please reject CVE-2026-89603. The fix is a fine
consistency change, but the flaw gave neither the tracer nor the tracee
anything they didn't already have.

The missed check only affects a thread's first filter. Once a thread has
any filter, seccomp_run_filters() loads the current filter list when it
runs, so a filter synced during the ptrace stop applies anyway. So the
thread entered the syscall with no filter at all, and stopped under a
tracer that controlled it. That tracer could already have made it run
any syscall before the filter existed, or simply refused its seccomp()
call. No syscall gets past a filter that was in place when the syscall
started.

The same window exists without ptrace: TSYNC can land just after
syscall entry reads the work flags, and the syscall in flight runs
unfiltered. TSYNC has never applied to a syscall a thread has already
entered, only to its next one.

Sorry I missed this when the CVE originally went out! Thank you to
Oleg for calling this to my attention on the original patch's thread:
https://lore.kernel.org/all/as9Jqi5BvSZWfxj8@redhat.com/ :)

-Kees

-- 
Kees Cook
