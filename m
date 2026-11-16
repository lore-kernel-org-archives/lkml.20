Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858454;
	b=dc5UOIj0sFna64HxDV1cddjAVyJsTCbeod9yZX1PARIOCSdeytniDXqEAWm2/QWQO90S
	 Ot1o+0qVvO4LURkuGw+PQ3o1ssQDwEGSxOxd1oJeqqEME+dXv/nM1/2X3jmD8syxsaKGj
	 /kSPgGDsvy0bD7ZGnoTpSVeUxFuAwHdM5Ucuc6AuESSz0R2kyUUTPzgKI4f9idO1so1tb
	 ym0nYhdAWdKwu7OIzB/h24rVeFOmN7qJp835IX6pMMfwplYdVbDmWZC61uSd17IKuI/lh
	 IBL59vWrZhEj4PMzJmcUZFdtJZX1CsV2N6nxuh/qYQNb5puV7I9/k5+E9qRWvpVfxUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858454;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=1g/BF5TJJhvaU4YJja6VMHOh6votx4hOGHoYlvjfNB0=;
	b=aGTFJk7ZgZzUMTfUhbc+lcInCwoCtIEqs61WwwmVXQvwqJKK808dok9Z8sFlJQgqNJC5
	 l4js+QcGq5M7c1DJgcYI9p8fzR1vrBPjR09ZJPTfvZ/QfemXt4sPIB6FGFWJv1od2Rz+0
	 dae44CZoTZ9w7tC+vVC2xgcVmP1ZuncV9S4ueoDOjjQlUNCo0v6jrz+6rqqCwbCMir5u5
	 X0s0AYJw85nPVWEDVIVkbzn1rlTp7+zXKC3I5925CI3xzMlYhMFPOXq0lUE3rFguwR77o
	 IIOS54AEQhVQun8pOHV2f86KUIY2RqRSXeCKb6PSl/drRnBKZIQWFF5sSYXeeeXjojQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=Z98Y7qQk;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3F7606A31C;
	Mon, 16 Nov 2026 19:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D3F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=Z98Y7qQk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794858444; bh=1g/BF5TJJhvaU4YJja6VMHOh6votx4hOGHoYlvjfNB0=;
	h=From:Message-ID:From;
	b=Z98Y7qQkCe8UZit+UFWh8Gqcsi7fZzMHm88UFcjyHvKKefQcrC4PKb75SmKlLnPaN
	 Ptw0E6OyJBwgwcbmZvU8/tRUkX9ggp5Kc3DgVyrGzDVBCZDSfsgWgOZDRTQpGIXVxD
	 BGLxRYJKV/+pkJE8FQmymWJ71wsZTuyQ0zwwsszA=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id C498CC094A;
	Mon, 16 Nov 2026 20:47:24 +0100 (CET)
Date: Mon, 16 Nov 2026 20:47:24 +0100
From: Willy Tarreau <w@1wt.eu>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <avtdzFOgMXRLgIq9@1wt.eu>
References: <20261116191436.188098-1-sashal@kernel.org>
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
In-Reply-To: <20261116191436.188098-1-sashal@kernel.org>

Hi Sasha,

On Mon, Nov 16, 2026 at 02:14:36PM -0500, Sasha Levin wrote:
> "Describe your changes" already asks for the user-visible impact of a
> change, but changelogs for fixes still tend to say what the code does,
> why that's wrong and what the patch changes, and stop there. Whoever
> has to decide if the fix needs backporting is left to work out what
> the bug does to a running system.
> 
> Say what that means for a bug fix: describe the worst a user can see
> and what it takes to trigger it, say so if the bug was never seen to
> happen, and say so if it has no visible effect at all. Give the
> paragraph a label so people can be pointed at it.
> 
> Coding assistants are told to commit a fix with a message that
> describes the problem and the solution. Add the user-visible impact to
> that list and point them at the section.
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Link: https://lore.kernel.org/r/20261111171055.527b4bf3da705367bc78a64c@linux-foundation.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/process/coding-assistants.rst  |  6 ++++--
>  Documentation/process/submitting-patches.rst | 11 +++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
> index 509dbf23a099b..ef01ce8d0ff91 100644
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -63,8 +63,10 @@ these steps:
>     re-running a complete analysis; drop any fix that doesn't work and try
>     another one. The fix must not add build warnings and must pass the
>     checkpatch.pl checks (see submitting-patches.rst).
> -6. Commit the working fix with a detailed message describing the problem, the
> -   solution and a Fixes tag. Do not add a Signed-off-by tag.
> +6. Commit the working fix with a detailed message describing the problem, its
> +   user-visible impact (see "Describe your changes" in
> +   Documentation/process/submitting-patches.rst), the solution and a Fixes
> +   tag. Do not add a Signed-off-by tag.
>  7. Identify the maintainers and lists using scripts/get_maintainer.pl.
>     Documentation/process/security-bugs.rst shows how to do that.
>  8. Indicate what could not be done. If the fix could not be built or tested, or
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 9cd19a71e96ec..52cccb08ce896 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -51,6 +51,8 @@ motivated you to do this work.  Convince the reviewer that there is a
>  problem worth fixing and that it makes sense for them to read past the
>  first paragraph.
>  
> +.. _user_visible_impact:
> +
>  Describe user-visible impact.  Straight up crashes and lockups are
>  pretty convincing, but not all bugs are that blatant.  Even if the
>  problem was spotted during code review, describe the impact you think
> @@ -61,6 +63,15 @@ from upstream, so include anything that could help route your change
>  downstream: provoking circumstances, excerpts from dmesg, crash
>  descriptions, performance regressions, latency spikes, lockups, etc.
>  
> +For a bug fix, this means saying what the bug does to a running system:
> +the worst that a user can see, and what it takes to trigger it.  An
> +account of what the code does wrong is not a substitute, as it leaves
> +every reader to work the consequences out again.  If the bug was found
> +by review or by a tool and has never been seen to happen, say so.  If
> +it has no effect that a user could notice, say that too.  Maintainers
> +and the people looking after stable trees decide from this whether the
> +fix needs to be backported.
> +

Look good.

Reviewed-by: Willy Tarreau <w@1wt.eu>

I think we can go even further by distinguishing the absolute worst
that can happen from the most likely. When you ask an LLM analyzing
code about a worst case, it doesn't care much about the real world
and will often explain that if the user enable CONFIG_xxx and write
foo under /proc/something and has force-loaded some outdated modules
and has plugged a device emulator into their USB port, then the bug
could indeed get worse. For backports you also want to know whether
innocent users are affected or not.

>  Quantify optimizations and trade-offs.  If you claim improvements in
>  performance, memory consumption, stack footprint, or binary size,
>  include numbers that back them up.  But also describe non-obvious
> 
> base-commit: 2138148bf44fd84d3e0a863f0e8cb3627cdcc606
> -- 
> 2.53.0

Cheers,
Willy
