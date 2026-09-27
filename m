Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC722AF00;
	Sun, 27 Sep 2026 01:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471606; cv=none; b=PS9C3YB4gje1izVLpy9jov5WZDFuTZQUZg8p1829L93MIrS3PrIB7nxExyAxF0JhwrlDFz3HwlgvTleGCHjA53ZzxJDGAAV3RlJpgUDb/Zesu1Q7D6GXU3foODhW0hflR6vq3yGdSLLCwP5b3EgFhJim/kHhzKvkmeo1+sxdJ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471606; c=relaxed/simple;
	bh=LhbT1u6bt5c64FMxcf1q/vAN2f64Gv1HxhFxf6T9SuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Igu6I/tsSZsWjzWHDQVonQ/O8ntBnMMsSA5GrXKoG/DinFdsU5fj/SZJSfy7ZJO8q6xMNoAgOywuhZyQLkfF5hc3wRnxJsP+VzBvOAp1ALEUvXXPdoTmhIWcNVFo1wjm3rh1wKd1zZapwYtm9+UpVphr5tjxD78naQE3cIBuVmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2V/wHGl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2V/wHGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215D71F000FF;
	Sun, 27 Sep 2026 01:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790471604;
	bh=sz0mKDv766sz3dqn6sz5UmjEeYOx+tbMFYwvUYW26t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g2V/wHGlVQGw4PkED6b3jTzCgfnEwtumIhmnwTYeSfpALaz6FlD7e4AvkenmwXbpH
	 jkA6k2/12/b8K9V2OgFhuWlSbD07HWPcPXBUOoWT4rNXzgeikYOEmGvUO91VA17hNK
	 LSl1lSfncHZHhIfMiaIKClJlJ2vYF0a4owg4lO5gH90r+WBg+Q5tUDNc+VjmylX9O/
	 L8h3udTSIckmVbaIAyrgpLTe3iDmnQCPgmdd6C9FRSEINoi6xzQwA2v02kjf9x+zGs
	 dIdsKOc8ghTInUzI0HRNvBal74FocSrf6U7nzJ0W1pxfvrWKosU2ERDLKwMKth4pxC
	 xXo4GZjiNZzYg==
Date: Sat, 26 Sep 2026 21:13:22 -0400
From: Sasha Levin <sashal@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
Message-ID: <arhtsrVb82vr6U-p@laps>
References: <20260924134945.3095661-1-sashal@kernel.org>
 <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
 <arfpV7IXRAHREMzO@laps>
 <CAGwozwHY7FsYQZaNf22S-nWGPkc4qekk3H=Hno5a0d0iWVtSJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGwozwHY7FsYQZaNf22S-nWGPkc4qekk3H=Hno5a0d0iWVtSJw@mail.gmail.com>

On Sat, Sep 26, 2026 at 07:54:27PM +0200, Antheas Kapenekakis wrote:
>> It didn't in my tests either. With AGENTS.md pointing at README, one agent read
>> only coding-assistants.rst, and the other read that plus generated-content.rst,
>> which coding-assistants.rst references. Neither opened any of README's other
>> pointers.
>
>They usually read it when they need to. I find it is 60% of the time.
>Of course, this does not compensate for behavior that should always
>apply. Sol 6 also has the annoying habit of modifying readmes
>randomly.

Agreed, and the rules in coding-assistants.rst are the part that should
always apply.

>> >agents.md file before every message. Unsure if it still does, I do not
>> >use Claude. agent.md files should be specifically designed for agents
>> >and handwritten. Moreover, they usually need to be tuned for the model
>> >generation in general, if not the provider and model specifically.
>> >Which brings us to 2.
>>
>> The rules README points to (DCO, Assisted-by, patch format) are the same for
>> every model. Personal and model-specific tuning belongs in a personal file.
>> Your sample shows why the shared part should come from the tree: it asks the
>> agent to add your Signed-off-by, which coding-assistants.rst says an agent must
>> never do.
>
>You are correct. Agents are tools. All of their outputs are the
>responsibility of their users. They cannot apply DCO.
>
>For me, I make sure to review copyright and test my kernel patches
>before sending them or pushing them to a remote. So my agent should
>add my sb and the assisted tag otherwise the patches need unnecessary
>cleanup. This is my personal preference. The mainline branch should
>not poison my agent's context or provide conflicting instructions.

Your issue is with coding-assistants.rst, which says agents must not add
Signed-off-by. AGENTS.md only makes agents see it.

[ ... ]

>But as far as I know personal snippets are meant to be additive. I do
>not think there is a widespread override for agents.md for the default
>one. Codex seems to have one but there is only one google result on
>it.

Codex reads AGENTS.override.md in place of AGENTS.md. Claude Code doesn't load
AGENTS.md at all when a CLAUDE.md exists, and Gemini reads GEMINI.md unless
configured otherwise.

The agents are designed exactly for this model: the upstream project has it's
own AGENT.md which is relevant for the upstream side of things. Downstream is
able to modify it as needed, either by carrying an out of tree patch, an
override file, or whatever else works for downstream.

>A large generic readme that offshoots to 30 other readmes is not an
>appropriate agents.md file.
>Documentation/process/coding-assistants.rst would be a better start
>for a symlink but even that is not particularly lean and would likely
>degrade modern agents. It still contains offshoots to 4 different

Changes to coding-assistants.rst itself are fair game as separate patches. This
one only gets agents to load what we already ask them to follow. There's no
substance here - we're just making dumb machines behave better.

>readmes, and the "Procedure for finding and fixing bugs" would degrade
>most modern models. They are already RL'd to do what they are asked,
>and conflicting instructions could lead them to e.g., commit when not
>asked to. For example consider:

[ snip ]

I get that you have concerns with those docs, so feel free to propose patches
for these.

I do not thing we need a seperate machine-only readable set of docs. If these
"agents" can't do better parsing those docs, then we shouldn't bend over and
write them their own versions. I'm okay with doing better at pointing to those
docs ("RTFM!"), but I don't think that a fork of the docs is sensible.

If you disagree, feel free to propose changes to coding-assistants.rst, as this
is really a doc that gets read mostly by machines.

-- 
Thanks,
Sasha
