Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4364A0F19;
	Thu, 24 Sep 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263089; cv=none; b=CVC94Nksi4f2jpM1Wi+lKHlVig0+rWdO1wFwMihKkyYIQ/bvcX2U1/9x6WiQRrXsh2AMpN2Lwb9LfasvAln8W2BQySGm8sT8fDykCrTGMpkQbzS6EhfVkkr2HX7dSHFjYGk1pHO/UKt7KB3DFjRgZuABheqYm7qwsttm12CjGRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263089; c=relaxed/simple;
	bh=dlAuDdeH7HY9CoVQifyjSIftEOhfWFw06TmkRKM+SZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsZJQbLqOy//B1kSjFQhMGK74LGlM00ZWy3yQRFdI90Gd6roh4/nbNLBEOawVJF4GRHCgG5z1jtJLewU7Ka6TzsrEIKFm9620j0VblaF+kD5qpH7KDzbs72KkQlnCbth+O+UOE8aLyVK53NS+8jPQz3BrrW6tHv+pnYh62QumoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arTnCgIO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arTnCgIO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A1C1F000FF;
	Thu, 24 Sep 2026 15:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263088;
	bh=xOBRz2hFpaMmKkpFTvDfTKM7BARA0aC8rFrP1uaft04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=arTnCgIO2VD1i3B8n6cfS7QwCEWxUv5gZE4Khm37czx0G3PEpFJG7MZDYQZKX/BCw
	 TTXA7IG6g9ZpewReBsqBAJm0rYql2JBxzifl7USVqWaJS7o9blkrAXYmjJaI247ngT
	 93OM1V1n20WnAimpPFGVznQ1h4413ZLuhAVasp5z1vArUQqqENTNs2tEgJIHsCiYby
	 /HZ48MxYuCL4wvRhTAzL7BkkN74i3MoqZ9IUOhQlutK5mWWoi2YN4mNU4NOXytoLbX
	 4UcjeTqVD+79sLmE8ycUBiH2OFzRPvgD2RiGbg79vO1WNYQLHgWNy6lElRr6qkfv8x
	 0lYkJE4Ni/5Fg==
Date: Thu, 24 Sep 2026 11:18:06 -0400
From: Sasha Levin <sashal@kernel.org>
To: Theodore Tso <tytso@mit.edu>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
Message-ID: <arU_LkBIPFqxPsOZ@laps>
References: <20260924134945.3095661-1-sashal@kernel.org>
 <arUzB37qmq1WREh_@mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <arUzB37qmq1WREh_@mit.edu>

On Thu, Sep 24, 2026 at 10:31:07AM -0400, Theodore Tso wrote:
>On Thu, Sep 24, 2026 at 09:49:45AM -0500, Sasha Levin wrote:
>> Most coding agents have standardized on AGENTS.md as the file they load
>> automatically from the root of a repository. README already tells AI
>> tools to read and follow Documentation/process/coding-assistants.rst,
>> but that only helps if the agent decides to read README before acting,
>> which in practice it often doesn't.
>>
>> Add a top-level AGENTS.md symlink to README, so agents load it on their
>> own and follow its pointer to the AI guidelines. This keeps a single
>> entry point for every reader, and avoids adding a separate copy of the
>> policy that could drift from the RST.
>
>There's a lot of stuff in README that isn't going to be useful for to
>an AI agent.  This will resullt in an increased amount of token
>consumption, that could impact people's token budgets.  Prehaps it

I tried doing the math here: README is 1,265 tokens with OpenAI's o200k
tokenizer and 2,403 with Claude's.

Measuring the common CLI agents, the first request is about 14k to 15k tokens
before it reads anything, and the one line Makefile change that I used as an
example took between 88k and 118k input tokens per session.

>would be a bit more efficient if we explicitly ask the agent to read
>and follow certain process files, including coding-assistants.rst; if
>they are preparing a patch, to consult submitting-patches.rst, etc?

This is sort of already what README is, no? it's just an index pointing to our
documentation without much actual content otherwise.

I suppose there are parts there that are completely irrelevant to someone using
an AI agent, but those seem to be quite minimal. Is it worth the overhead of
maintaining yet another doc index?

-- 
Thanks,
Sasha
