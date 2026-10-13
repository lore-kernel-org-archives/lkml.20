Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BDE4E9C01;
	Tue, 13 Oct 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890552; cv=none; b=jQZD2ajkSmqiBA7j5D12UQK+enBgI8nsg7AAhk8uk9UVsQMmdddUyZL1DvoYHp0431YzMz2mOpT2zvtFJaiFDENgkOYTdaHmxAusfxkA4PT6wLzdLzvDSbPP3F7l+709Q229mpl+GBgR2jtO+wyYSh15pGcbWoV/jcnYU8Gpn2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890552; c=relaxed/simple;
	bh=rTzLobFkKRhb0EQhaTAdW1sbefIOPkJEg8AW/hzSXdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irQ+T31U0xE+j4vXWqSYJMO71H2/u3RfXKhJ9sdHHTEapd3fhUOD/h9CVMlkeUjtNP5a0sSAVmuLUNh4yXEF1q0l49hv5pYvHN6ohRX9VMJL6KbkNK6ALwlK4gIr41vs+Wcw2nlY/v8gAEaiRddU6uh4izD41ulRZv7N1OZsFME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzgzbCJz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzgzbCJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A2B1F00893;
	Tue, 13 Oct 2026 11:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791890550;
	bh=dqWLr8hWHzHxfXEH+8y12BdB5Lve6iNvFc9F3ftV3Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RzgzbCJz4/ml4m8iE4F4UBUwErk+HU4meO7OUmNMEdNajfgNNb3i/fjbbK6kcDEdS
	 Tm1qgEgTGQdwedxMkVvUaVauSwtUj0Rmj76dN0LxM0YtMtN1oQQeL0Z+jWchBuAWm5
	 vORnITwx8wCw3gQywtdCJGUQgWh8qOyCRXp/JidEhfm68WS3nf7zEtGNBvuPfqwkEU
	 tvHk9hhmhT1xaAviUsAqWgMy0MgxieQgWBCJVrZz4I3aeikLHffA/h3vp9tkeFCUmc
	 yBJeiD06ILt5rG/k2QVu0QpSVyavCLN1xZ4wp7hc24ZF7lvSUEinf9GC1IsJIhvJ54
	 W4soTmnK01ZKg==
Date: Tue, 13 Oct 2026 07:22:29 -0400
From: Sasha Levin <sashal@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
Message-ID: <as4UdYVO2JbSx9gn@laps>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <87zewiy1sd.fsf@trenco.lwn.net>
 <202610122047.A9E381A@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <202610122047.A9E381A@keescook>

On Mon, Oct 12, 2026 at 08:48:48PM -0700, Kees Cook wrote:
>On Mon, Oct 12, 2026 at 04:47:14PM -0600, Jonathan Corbet wrote:
>> Sasha Levin <sashal@kernel.org> writes:
>>
>> > At the Maintainers Summit, Ted asked whether the stable trees have a way
>> > to deal with incorrect Fixes tags. Hannes estimated that 15-20% of them
>> > are wrong, often because the author ran git blame and took the first
>> > commit that touched the line [1]. We use LLM workflows to find the
>> > commit that actually introduced a bug, and others asked us to share
>> > them.
>> >
>> > This series adds them as agent skills under agents/skills/, together
>> > with a skill for writing commit messages:
>>
>> Time to argue for a more fuchsia shade of mauve without actually getting
>> into the substance of what you're doing...:)
>>
>> I wonder about the top-level agents/ directory.  If we regard this
>> material as documentation, perhaps the "skills" should go there too?  As
>> readable text, they might just help to improve human skills as well,
>> assuming we think we still need those.  Under Documentation, they could
>> be built into the rendered docs and made more widely available.
>>
>> Otherwise, if this is primarily a development tool, perhaps under tools/
>> makes sense?
>>
>> I lack strong opinions here, but figured I would ask the question.
>
>I was expecting this to appear under Documentation/. The agents are
>designed to read human text, so let's make it at least passingly
>sensible for humans to read too. :)

What sucks here is that these prompts aren't very human readable. They are
overly verbose, they assume being able to remember a whole bunch of small
instructions, and target specific issues that we're observing with these
agents.

I get why Documentation/ makes sense (it's not code per-se), but I could also
argue similarily for tools/ :)

Either way, I don't really think it matters to me, and will happily move it to
Documentation/agents/ unless someone else chimes in with a reason NOT to...

-- 
Thanks,
Sasha
