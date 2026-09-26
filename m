Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7574126461F;
	Sat, 26 Sep 2026 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437722; cv=none; b=MZ0WWqR2mshI8U3uYEGbA5fj9Mvg4+9py78AVE/JJHOMc5vwZVdrtuNOrWOZ1uwX1ljj3X3XCbKAt1mOVwXbGfZ04nydtFXv3qbA1D9ukk+rnmVQ3Xebm76s9HYFEou3jvJw3k2ziUPXo7ScKbkMlai9nPtnoSS4L5vzH+Gybl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437722; c=relaxed/simple;
	bh=Bk3HMj9IOlHwr7NsnBPlDn82Ts6/Ig/XsfvezMiH11k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlTEDzaimjt8Z+VoEQo2S2RXGuusLlUBX/YcVXQjqHzRUR+n93f++TQazYM3nGFqrGvYEYvCLR52S646WOA5Ef1oXH7RNvpAWwufzWJvCMMR3jHgGiKJ/Hd8HUhjfGHHo+E+O90b8Hnv/kleLqJFxHPsPwPhKeAodCi92H/G6AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zcz44pku; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zcz44pku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4391F00898;
	Sat, 26 Sep 2026 15:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790437721;
	bh=NO5KE8XzJGJdNIyHIG5MjEiZ66tdDgra9yJn2wRxRUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zcz44pkuXNG+/UbWdoGSJFKuUxCGcuYAudrZ1WIlZ9o9pz5SmwqqN1K5b9+ZGhFuP
	 d7XgVp5BYo2QrNRRUw/O3gXN9EIV52HSd/5ZwRYecMAa6irjpSc5uVrppaNy0lx9n0
	 lQVXcGDr5mQdGTbRtTd/HiRp2YjUgibgVuIO7QcdpFNC0PPYWz8J9IDlNyVgdBpUUm
	 13XFPsu16pm1GM+NMJ+Y1t0GhAinLDhAETq68WmjUT2Z8A4sRZNmAL9LK/WRJN87A7
	 4BfuWBwdZvNZtNm+IsRwKZworvyWqIhM9AsNvedfQVqeT6+CiYm8HWH1cYLPReOQx/
	 xySA37QIaDG/A==
Date: Sat, 26 Sep 2026 11:48:39 -0400
From: Sasha Levin <sashal@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
Message-ID: <arfpV7IXRAHREMzO@laps>
References: <20260924134945.3095661-1-sashal@kernel.org>
 <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>

On Sat, Sep 26, 2026 at 01:12:33PM +0200, Antheas Kapenekakis wrote:
>1) Agents already read the readme. The canonical way to force load the

They didn't in my tests. Without AGENTS.md, neither agent opened README before
committing, and one of them added my Signed-off-by. Could you share how you
tested this?

>readme at least for claude is @README, not just README. Even so, the

With the symlink, README's content is loaded directly, so no @ import is
needed, and neither agent went on to read README's other pointers.

>readme is not tuned for agents and results in context bloat. You say
>that README is small, so it is ok. But it is not, it prompts the agent
>to read a lot of other useless readmes. [...]

It didn't in my tests either. With AGENTS.md pointing at README, one agent read
only coding-assistants.rst, and the other read that plus generated-content.rst,
which coding-assistants.rst references. Neither opened any of README's other
pointers.

> [...] Another issue is that you say
>that it is only read once, but that has not always been true and
>perhaps is still not true. The Claude harness used to append the

Every model call resends the whole context, so that applies to any AGENTS.md,
including a hand-written one. Either way, most of it is served from the prompt
cache.

>agents.md file before every message. Unsure if it still does, I do not
>use Claude. agent.md files should be specifically designed for agents
>and handwritten. Moreover, they usually need to be tuned for the model
>generation in general, if not the provider and model specifically.
>Which brings us to 2.

The rules README points to (DCO, Assisted-by, patch format) are the same for
every model. Personal and model-specific tuning belongs in a personal file.
Your sample shows why the shared part should come from the tree: it asks the
agent to add your Signed-off-by, which coding-assistants.rst says an agent must
never do.

>2) You are suggesting starting to track agents.md on mainline. This
>will make it so you dirty the tree of anyone that uses a custom
>agents.md when they switch to mainline for a submission which is a
>major annoyance. It'd be better to gitignore {agents,claude}.md on
>mainline. This would allow anyone that wants to commit theirs
>downstream to do so, while allowing them to copy their agents.md for
>mainline submissions.

Agents already have personal/override files to handle this.

We also already track .clang-format, .editorconfig and .rustfmt.toml on the
same terms. Ignoring AGENTS.md would leave users who don't write their own with
nothing, and a template has the same problem unless someone actually copies it.

-- 
Thanks,
Sasha
