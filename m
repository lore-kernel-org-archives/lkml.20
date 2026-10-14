Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41D8566C68;
	Wed, 14 Oct 2026 17:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000689; cv=none; b=OcWws3d95zOkMj23hc6qdaCRWifP8p+PBPu08EFVKgm+rUTOqWFvdnHdLM0TxJ/avkmdUuQPQXOnAExAFh2ClRZiCer1MWVTKg11oPx2cftkdnSu2yiuk0GAC741gCP7euOgUQ2aetQFcG7voPLtDYFV1HTia+NlSQ1LEUvNXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000689; c=relaxed/simple;
	bh=9rZMfRk2Zh2qIgahJs60U3u63uMH3oEJdMyw7+4CptQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4nV9t0zTwnKeAll1h8gu2skGmd6N4HbHw25wOPwu46ztaX+LSDFvuNSM4R5DeB+KhDzgQDzNbddb8xtSRD0xkN42OpqX2BL3nMxnUvN8GjdPtmLPbBKk8OEyxcWOMeLkAV3CUrydl4nJw6SOXvLB7V3Zu/RDASxQ7YXJwEPpdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wp82V4B7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wp82V4B7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32ED31F000C8;
	Wed, 14 Oct 2026 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792000688;
	bh=RHsnIZVps9mT2Gb9vWIS7TDQyCosnt0gyBzwZyAcj3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wp82V4B7rTqJ9ZbNEwRcGn5csZJ535XheIQ7ROM++V3qDl4KeP4sT9nkpaRGX3W7l
	 RgUoLLntDxbAHdDtmENVfXqm5O41wb0lltVEY8xpBnUvfV6pqA39Ch/uEeNiuQLdKR
	 7qGWIaf3BW+N9VFSznqcCz2KWYpxGpJUXtxiYRiZ4kCMSbsIc4X22Z57nGBYCA7ZW0
	 t0cK305mdLgHbSncFykxJJRIC3ap7657FaSUIppJag7u6uTYrlB1cfrEch3a9paWaW
	 bacfouokARvVJHqyzzz7NGFK06LscbTeIw9yIqUhck/DTCiQOk3ww4EcCqQB2evzOF
	 s9vc9cZyOTDpg==
Date: Wed, 14 Oct 2026 13:58:07 -0400
From: Sasha Levin <sashal@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: broonie@kernel.org, corbet@lwn.net, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rdunlap@infradead.org, skhan@linuxfoundation.org, tytso@mit.edu,
	workflows@vger.kernel.org
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes
 attribution
Message-ID: <as_Cr4FhzyAh-kC4@laps>
References: <cover.1791499378.git.sashal@kernel.org>
 <20261014174838.114990-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261014174838.114990-1-ojeda@kernel.org>

On Wed, Oct 14, 2026 at 07:48:38PM +0200, Miguel Ojeda wrote:
>On Thu, 08 Oct 2026 18:54:51 -0400 Sasha Levin <sashal@kernel.org> wrote:
>>
>> I'm not sure whether this belongs under Documentation/ or in a separate
>> agents/ directory at the root. I'm open to changing the location.
>
>Either way, we still need local setup to use these skills in at least a couple
>popular tools, right?
>
>One discussion point could be which markup language to use. If we were to do it
>in `agents/`, I guess Markdown could be a possibility. But reStructuredText and
>having it in `Documentation/` would allow to have it rendered and to "link"
>things more easily, which could potentially be useful for certain skills.
>
>Anyway, I tested it with a simple case invoking it explicitly, and it seems to
>work, including one where it was not an actual bug (it complained about it :).

I'm following the specs[1] for these skills, and my testing showed it works
fine with a few of the more common tools.

We can open the markup language discussion, but I'm concerned that doing that
will break some tools logic around importing these at skills.

This was one of the reasons I sent the first version as agents/ rather than
something under Documentation/ - this really feels like coding in English vs
writing docs for humans :)


[1] https://agentskills.io/specification

-- 
Thanks,
Sasha
