Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF412222AC;
	Fri, 16 Oct 2026 06:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132228; cv=none; b=RdrQckfiH9DHlumstR6vHprSuN5TPDqcb/0PtAga6DmdoD39i6zIwikvYy9yUos74/aDlgtkzfl7DnWLWla0yRkUm43dPTEUfuL3VMeneOW3IrvXWi9vB8wb89EyEZLhRL9LlPp9Ou2xQ25i5hub3aRQU4meIBQa4c376Bav0GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132228; c=relaxed/simple;
	bh=mdVtYsa5pjYJJt+mMTMlUZ4lczKc1ykgO5KVKuLw870=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZGcEYlTfG+2Ncd9tu8fIsCi3Xww8Gcw1tYNmgpdYqjJ1fISYvKcut4KAoxyGizl+Nd+DBIVADWfll7D84wyoVYjRVeSvAogf4EOg9q6L2ZEIZMkGphZ7D2gclPDtMHWrVRAAZRFhdFvA2F/vjGgmX5ZEpIpHEjus+L4YXcxbmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqiRg07A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqiRg07A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C6B1F000C4;
	Fri, 16 Oct 2026 06:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792132227;
	bh=aOutpvUO1skhtxBDdAGixu5GIwSj1eVe3ICCxPK6lQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UqiRg07AEkpFwAN9Nxv40yMItfm26AADMyNKtHZAlnuYniaJajcCTK8ErMCobY8nW
	 rZpMb1OTwvJ7U39VQt8ym4lRIdUGJuJIbDvTnlpz40XRfGNkrRorASJpJqR5T0ny0A
	 ICM4psW6cNcoQXV81lS/wpNKFwQsSaWXBBGCkEBOvhoEzBhS8NkiEGXxxrw3g22xwo
	 qtu91mAYOvbsSL23pM9IUwrzxr0S6nmK+5TXWMqmMqdiTg7rtvloFnqcb0hB0rDQ1N
	 IKTpxAPUPhJnescMWogCIqC40HH9y67UiHKRWNNI4TEW3CXeYqR5mfbXRvBeJ33dgP
	 qYzUDGsrA9ogw==
Date: Fri, 16 Oct 2026 08:30:21 +0200
From: Greg Kroah-Hartman <gregkh@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>, cve@kernel.org,
	linux-kernel@vger.kernel.org, linux-cve-announce@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: CVE-2026-89603: entry: Fix seccomp bypass after ptrace with TSYNC
Message-ID: <2026101611-deputize-life-301e@gregkh>
References: <2026091133-CVE-2026-89603-dad5@gregkh>
 <20261015162119.1a1e0d-kees@kernel.org>
 <atEAhWWDDOo4kWSR@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atEAhWWDDOo4kWSR@redhat.com>

On Thu, Oct 15, 2026 at 06:34:13PM +0200, Oleg Nesterov wrote:
> On 10/15, Kees Cook wrote:
> >
> > On Fri, Sep 11, 2026 at 09:44:52PM +0200, Greg Kroah-Hartman wrote:
> > > This race condition could allow an unprivileged process to execute
> > > a prohibited system call (e.g., execve) that the newly installed filter
> > > was intended to block, especially since the tracer might have modified
> > > the system call number during the ptrace stop.
> >
> > I'm disputing this one: please reject CVE-2026-89603. The fix is a fine
> > consistency change, but the flaw gave neither the tracer nor the tracee
> > anything they didn't already have.
> 
> Thanks Kees!
> 
> I fully agree with both points. The patch is fine, but it doesn't fix
> any security problem.

Now rejected, thanks for the review and letting us know!

greg k-h
