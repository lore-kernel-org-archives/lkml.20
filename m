Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929247;
	b=xPoURmGhB9ijEfO700UzkJYd0E3CmPRcZhX64TLVkA8Am8ShujZSSfK3SoCgyzVCj6+X
	 zafCMjS5BCQQJp/ZOaPKPwmQ+y91v1Wx06PLQvxkJMT2lDjN/NYXz8gsfr5E+NcLVjtEB
	 nfQAG8sFEaHNRt9nms1Z9bhqegIoMU075NV9cjtMzzCzngYx8KbmwydOg208xM/A7lRDS
	 nm/kOR6xyaokL6lta2w+vceaYcmZrRl8vrhwcrfpPO2r/MvTGWBfOv0guE3VaMyXB1Gbb
	 NucYmMfU6LwZw83NV6olh4fFjajBJAKZr4uUDs0H5nQ2eXDb6V7U3+te3eT43yeZRZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929247;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xhU7b8nEYAUU09t7Gx9JBQApNKzYqONYSaGtzLUQ/ek=;
	b=Q3MioOyPbLzumocSrW8Xbc7WpWDmsYNMIvG+62PYEds+7e0chJ9snmesAXFGRQ76xUZA
	 6Cx4318eqZ7MZiyXmfxsQtnrE8bo10ZsKvH4o9Wq7+Yc0EN80IEVX6WlITONIatOB/NnZ
	 OLMd6O7R9QjaYNS2j7mMyDAznljYgb5vXmhtf6lH73Jl52jZHGhhE8X2kugHhRO8AYn9O
	 0q3IuMbNF8flbxdyX+DTkQHhkSExPj79O9vbuD057l4ZpgGUtYdWc+l9/reL7qIVqDeya
	 1LHUh/i9+zAxtFXOxE2KvsC/dlObe0wDBgBcLkGtcFTLIsve1CS74+qzkWlzrc9SMAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lSvk5GA9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F56606A33A;
	Tue, 17 Nov 2026 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lSvk5GA9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366E71F000C6;
	Tue, 17 Nov 2026 15:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794929246;
	bh=xhU7b8nEYAUU09t7Gx9JBQApNKzYqONYSaGtzLUQ/ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lSvk5GA9tyr0CWEbOPO8i8vC5k1dZG0DmPdxbGlCMNPCSpN+6ExRp+LFcMJ1nqRkx
	 0bVVVUm/2ioWKqeoFzizyoVE1nb1bcM3dhdo6l0kqV77D0yjpwfL2o/5ko/5aIotU7
	 vdAsHel5LGpnj9aBGHgb23/MTDzgRNLpROzvtvJLC5Yu6kXPPDTZlcEEgMFhaZNqkM
	 mXMQFp47uBotGhuX06Ar4eya23HQQHbpBFpp+3/GzBF4wAFPjk0AEmGn1a+zJzFYct
	 rbzZJ+HXUH28VR4XT6E1Y/78RC47Y3Dqmj+WQeM41Bdnz+01VQAoKd/ieJ3WaiSfUI
	 TK8PF+enxb51Q==
Date: Tue, 17 Nov 2026 17:27:21 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <20261117152721.GC162713@unreal>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <avxtxScVa9KvUH_K@laps>
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
In-Reply-To: <avxtxScVa9KvUH_K@laps>

On Tue, Nov 17, 2026 at 10:07:49AM -0500, Sasha Levin wrote:
> On Tue, Nov 17, 2026 at 11:27:23AM +0200, Leon Romanovsky wrote:
> > On Mon, Nov 16, 2026 at 03:05:15PM -0500, Sasha Levin wrote:
> > > "Describe your changes" already asks for the user-visible impact of a
> > > change, but changelogs for fixes still tend to say what the code does,
> > > why that's wrong and what the patch changes, and stop there. Whoever
> > > has to decide if the fix needs backporting is left to work out what
> > > the bug does to a running system.
> > > 
> > > Say what that means for a bug fix, in two parts. For users who aren't
> > > looking for the bug: what a normal workload is likely to run into, and
> > > separately the worst case and what it takes to get there. For someone
> > > triggering it on purpose: whether an unprivileged user could do it and
> > > what that would take, since a race that no real workload loses can
> > > still be won by a program written to win it. Give the paragraph a
> > > label so people can be pointed at it.
> > > 
> > > Coding assistants are told to commit a fix with a message that
> > > describes the problem and the solution. Add the user-visible impact to
> > > that list and point them at the section.
> > > 
> > > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > > Link: https://lore.kernel.org/r/20261111171055.527b4bf3da705367bc78a64c@linux-foundation.org
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > Acked-by: Andrew Morton <akpm@linux-foundation.org>
> > > Reviewed-by: Willy Tarreau <w@1wt.eu>
> > > ---
> > > Changes since v1:
> > > - Split the bug-fix paragraph into users who aren't looking for the bug
> > >   and someone triggering it on purpose (Andrew, Willy).
> > > 
> > > v1: https://lore.kernel.org/r/20261116191436.188098-1-sashal@kernel.org
> > > 
> > >  Documentation/process/coding-assistants.rst  |  6 +++--
> > >  Documentation/process/submitting-patches.rst | 23 ++++++++++++++++++++
> > >  2 files changed, 27 insertions(+), 2 deletions(-)
> > 
> > Sasha,
> > 
> > Since you're already making changes in that area, could you add a sentence
> > asking reporters to provide the full dmesg stack trace?
> 
> In this doc, we already ask them not to [1] :)

This is really bad. You assumed they would trim the logs correctly, and I,
as the recipient was expected to trust that they were accurate. They are not.

They trim everything, which makes these logs useless to me. As I said, they
include AI-generated reports, cases with reproductions that are impossible
with upstream code, and reports for completely out-of-tree code. Everything
like that was visible in original dump stack and it is lost now.

> 
> > Many AI-generated patches reduce it to one or two lines, which gives no
> > indication of whether the report is genuine or fabricated. Early in the AI
> > era, I saw some completely fabricated stack traces.
> 
> Is it still an issue?

I don't know about faked, but useless yes, especially in the cases where
in-kernel API is involved.

> We could add something explicit in coding-assistants.rst,
> like:
> 
>   Evidence
>   ========
> 
>   Every claim an AI assistant makes about the kernel's behavior at runtime,
>   including backtraces, log excerpts, test results and measurements, **MUST** be
>   backed by an observation from a real run.

It won't help, they already overcome it by saying "Found by static
analysis tool ...".

Thanks

> 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n760
> 
> -- 
> Thanks,
> Sasha
