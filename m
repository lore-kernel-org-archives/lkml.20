Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DE13DEAC4;
	Sun, 27 Sep 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517963; cv=none; b=FP9dA6KES7vKO09/8xquK4T1qowvLvBOARTu6sMANO7LpWNMayhQyug5ls3i1AksZU/paoxHYylmSWRkOoVEVigTaLy8ADZG+H3zLCCWosv6lGm4yiif5O06Jm6qRj0ZPieuu2ftD/FY1PSvMqfwN//SsBaSAGE1DE0k1IcpkEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517963; c=relaxed/simple;
	bh=FzoPRIQ2bsgwhyZ6+iLyjv38pc8wdBTIp/IPwRQi0j0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNKsUGK7f3wa/vy0SRSkvj5o5jlET4d2gFhaMMCTj6hQ0Zh7mm6WNvoMX/2+ysekUywXYnYfU8zcjYD30Gw+4aBdWUx2z57b2indqyFGT4zfo5D2EGx8xYmzEp7JteTDaG2UIZN9RCeCOlZjHcl81K9JAiE3zJ797s9QPgEJX2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnK4Jz6d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnK4Jz6d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E321F000FF;
	Sun, 27 Sep 2026 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790517962;
	bh=NGmRCTwRhwtPsEvY/v+B8O9tn8Kg3UF9HZ4VG5lIE2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BnK4Jz6dzwmcKtatVXPj4n3BERjgnJAdi5Vu5F1BhxZZFwqYFSPTI8LK7arY7acpr
	 nBgBIJW4swgWksr00I211gawvhr7iCvyvnjmHwDVaQ7tJIXx83HxIIhP/SIhQo1fiX
	 NJkkqfv4BlWCarO2i2Ky4DQI8MnwxczrDjZ5jOio/4JtFyLiBfbfQHfqOhXqJ2iTzx
	 7cgNv3UnPfd/XatrVj84mzIZX7tVU1BzzURpl5UQUvAlUSJC3xLcSW2F/hdPbuEU+9
	 8n0qwbhLOv0VlAxDyjqRYoyyGfAS9mLqq8PxdAQ67rhQlxC61PlRSj4maBb+8y+UPn
	 7J0bPx8+CD1KA==
Date: Sun, 27 Sep 2026 10:06:00 -0400
From: Sasha Levin <sashal@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
Message-ID: <arkiyMt2NIydrPhE@laps>
References: <20260924134945.3095661-1-sashal@kernel.org>
 <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
 <arfpV7IXRAHREMzO@laps>
 <CAGwozwHY7FsYQZaNf22S-nWGPkc4qekk3H=Hno5a0d0iWVtSJw@mail.gmail.com>
 <arhtsrVb82vr6U-p@laps>
 <CAGwozwE5pJaW14ePjeUQ_w=i1W-Kg=QQOzLY_33qV0W-Urmgjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGwozwE5pJaW14ePjeUQ_w=i1W-Kg=QQOzLY_33qV0W-Urmgjw@mail.gmail.com>

On Sun, Sep 27, 2026 at 04:42:06AM +0200, Antheas Kapenekakis wrote:
>I do not have a problem with coding-assistants.rst staying as it is
>now. But it does not make for a good agents.md file. And neither does
>the readme.

What makes one good? In my tests this one did its job: both agents
followed the kernel's rules, for about 1.3k to 2.4k tokens. If you have
a case where it makes an agent do worse, I'd like to see it.

>I think there might be a misunderstanding with what an agents.md file
>is meant to do. It is meant to be a small file that lists a few
>notable things agents should know about a project.

The spec at agents.md doesn't say that. It has no required fields or
length, and says anything you'd tell a new teammate belongs there.
OpenAI's own AGENTS.md in the Codex repo is 320 lines, about four times
the size of README.

>Why should the kernel make an exception here and say no, this is the
>agents.md file you get

It's a default for people who haven't written their own, the same as
.clang-format, .cocciconfig, or .pylintrc. Anyone with their own file can still
use that instead, and the spec says "explicit user chat prompts override
everything".

>what is the point of creating a
>shared agents.md file? Is it to help experienced kernel developers?

Yes, and everyone else too. README is an index, so it helps the agent
figure out where to find things, whether that's an experienced
developer working in a subsystem or someone asking how some part of the
kernel works.

It also covers the patches maintainers get from people who never write
their own. In my tests, two current agents without AGENTS.md got the
basics wrong: one added my Signed-off-by itself, the other added no
attribution. With it, both got it right.

>Because omitting sign-offs is not helpful, they will need to add one
>even if they do not understand what it is

If someone adds their sign-off without understanding what it certifies,
that's on them. We can't have agents add it for them just because some
people would ignore its meaning anyway.

If you think a hand-written AGENTS.md would do better, feel free to
write one and propose it. For now, this one seems to be working just
fine.

-- 
Thanks,
Sasha
