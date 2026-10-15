Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E3C190462;
	Thu, 15 Oct 2026 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075676; cv=none; b=iiBUO8dZXxK+YSWkD+ffQXgo71m2Gru9GHzW9P7xvVViAlHcel1XG3RKRVrtoSJnpAlIjy2PccCU/H6w7UBwhbx7mer1cyX6u8j1rLJFKjY3UhQntrZAX3rmbryTaM3ZiRCgm3aoc3PiIMtjOY4GpcC86UQjMTx/8ewW1ZlHFTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075676; c=relaxed/simple;
	bh=psP42b3gg59UEfsBhN7AVylPxFLSXueJsN3kBr0NMao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXHynYcrAjEQHOD1Hs1DG/Ar9gznmfbOral+TM3UEzqPAOav76Qx7YQJBHB/RiMpO3x4C5GKxvkoQzJrIkOFWhi1NOyxYpxs+fT+ZS0e/gcXXDnhdltn10Q3gN1Zg9GJ3XwiZj+v2TTJGikPi+5ApITGNgnqeaxzkM5UJsgvgyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpciEu71; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpciEu71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7A61F000C4;
	Thu, 15 Oct 2026 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792075675;
	bh=5sh6oP4dN56hobMWGK8LFlp1gejYylIrtB6f+e4J4L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mpciEu71dRhsQX5FHiw5RMyNJ8ckg9sI/FJkW2yWWxrn/Hrk40QrIv5SieuCl2cEj
	 aHL8tu59+4qcu7Xp4RSbpIJkAnCI8S88cncUv6QjXuVueaANOnWv8vhGGfKaso714r
	 HHBBlLQEvVM1qArk5yZXpQG0ZGoi19sm7Ysq1inbuWcEZvX53Qft3WxAhnl0hWXJty
	 gNAAoj5aaVb7sa93rk3XS01GH0H3X8+c/O2FlQGBGxZtH5rEILH07RKwjdXug04uOc
	 PsHo3JW0uIuLARI0VFM1UR4YulJLPbHszzKimnQWVLr42fQl2FpA1J6qNn453AS1CS
	 SjEkb4QbXn2Zw==
Date: Thu, 15 Oct 2026 10:47:53 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rdunlap@infradead.org,
	skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes
 attribution
Message-ID: <atDnmZ_AGg6PnyRW@laps>
References: <cover.1791499378.git.sashal@kernel.org>
 <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps>
 <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps>
 <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
 <87jynjrrqo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jynjrrqo.fsf@trenco.lwn.net>

On Thu, Oct 15, 2026 at 07:57:35AM -0600, Jonathan Corbet wrote:
>Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:
>
>> On Thu, Oct 15, 2026 at 3:42 PM Sasha Levin <sashal@kernel.org> wrote:
>>>
>>> Sorry, what I meant to say is that the spec seems to require markdown as it's
>>> preferred format. We can experiment with other options, but then the risk is
>>> that we'll break some tools.
>>
>> Ah, got it, thanks! Yeah, at the very least the `SKILL.md` main file
>> should most likely be all Markdown inside (and of course the
>> filename).
>>
>> Now, if we go with `agents/` instead of `Documentation/`, then I would
>> personally prefer Markdown for the other files in the same folder like
>> the `guide.rst`, but that is just my bias, and it has a small
>> disadvantage: if we happen to move things between `Doc/` and
>> `agents/`, then it is a bit painful to reformat.
>
>For all that we hear about how smart these tools are, are they really
>incapable of dealing with two only slightly different markup formats?  I
>would really hate to bring in a separate format for this stuff...

Tools like codex or claude handle different markup formats well and do the
right thing here.

My concern is more around folks who use "simpler" tools, smaller open source
models, and are on a token budget. I'm not sure how they'll handle cases where
we don't follow the spec.

I'll send the v3 later today, which does a better job at having very little
information in the SKILL.md files themselves, and just points to our existing
documentation. Would it make sense to keep it in the agents/ dir rather than
mixing it with Documentation?

-- 
Thanks,
Sasha
