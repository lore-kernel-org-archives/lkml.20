Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B44A206F;
	Thu, 15 Oct 2026 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071772; cv=none; b=E6Asa/PpEWelLcaV/ASsAe79y7m+SAkY85nO1OeAe8gYCQlkMGo8QoAI8x58FUQgfqIpIHmfaTInTOCnU6u+7E4iDs+naEu4+2OrZVaxAOgAy3SDvpEvKNoT1qqgBwp0uKdUUv78RkeVn8chxNW5oShClD2EX2JwzTNheYYExLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071772; c=relaxed/simple;
	bh=VZ+l5G45BBruLk6RgKTwQU8ClO+R8fk0wEsZtmKSkIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWuc3MKBQ+qTaB5KBeZSHBjpdunfV09gyrYGvynmaGmsLKRSIqqGzoJOzDxUgYxusBBvik1E/92h7cyIAZCS7LkmeICgR1a59bYcDPZM4aybKJHsW9UAKVqGLjxRHKVK1VZ700Q3AiV/vvqMyjL7vj6cag/MBhIxNi4egPP7Y+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZ5ghlLA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZ5ghlLA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A701F000C4;
	Thu, 15 Oct 2026 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071770;
	bh=NfxAf4gdiKXdVnrSuFQzOIQUQtoXjVgW8jdsWGVYkeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZZ5ghlLAHMU7U+pKM0hqw7cMvJGlnUm9qASMDdzORNg3mSCS/Gx5HrTM4Loo6uGCj
	 Q/aE5/OcJQmSjrIVlZFAbymLW34rtsknVl6yISjRQERIM7YN8we7g6EvsqgzC21wIU
	 4N6pHhf62Sp3qs41kkgHfV6zN61dhIGZQV1rq1pfY6FqDHdRvZCOP4wVdkkPiBjQVh
	 njp4KlbrzhWHi8bOTJqfYpUQ90/tDDNJV9T5V6+AcUYxK5GXun4DtQbyI4JKoc7ReO
	 4kNiMgzHYdXWtQASeucvAzYPD5eZ3KqoL/bG+XttjiFme8DpyA3tK+0BrjoGNkM40O
	 99YZUba1NnbTg==
Date: Thu, 15 Oct 2026 09:42:49 -0400
From: Sasha Levin <sashal@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, corbet@lwn.net,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rdunlap@infradead.org,
	skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes
 attribution
Message-ID: <atDYWe9L0tv90Xjk@laps>
References: <cover.1791499378.git.sashal@kernel.org>
 <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps>
 <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>

On Wed, Oct 14, 2026 at 11:37:56PM +0200, Miguel Ojeda wrote:
>On Wed, Oct 14, 2026 at 7:58 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> I'm following the specs[1] for these skills, and my testing showed it works
>> fine with a few of the more common tools.
>
>What I mean is that they don't get automatically picked up by default,
>e.g. Claude Code and Codex don't seem to.
>
>The website you link (in another subpage, not the spec one) mentions
>`.agents`, but not `agents` without the period.
>
>So what I wanted is just to confirm that, at least between those two
>options, there was no inherent advantage (or disadvantage, depending
>on how one sees it -- I am not sure if it is actually a good idea for
>all use cases to have them automatically be picked up...).
>
>> We can open the markup language discussion, but I'm concerned that doing that
>> will break some tools logic around importing these at skills.
>
>Hmm... Not sure what you mean.

Sorry, what I meant to say is that the spec seems to require markdown as it's
preferred format. We can experiment with other options, but then the risk is
that we'll break some tools.

-- 
Thanks,
Sasha
