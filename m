Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0848DB3C;
	Fri, 16 Oct 2026 18:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175570; cv=none; b=IXow4Yrs98aRfdbdZEPALRpRAOwWfo3LNZ3Dwr+jaGesxo5YcHeH9ZDnK12xHXTkEdV6CNodrHcjDH7DvIsH+z1tmTz67jxI1EUGjMUgrxWkY0ddzJpVNmI0xoN5ng4TwmInF83a8JfJzv/0GOHvoKqe9uf0IN8BNI9LWNwhS6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175570; c=relaxed/simple;
	bh=iLdHaCJaJMHiAk0Y5Ly2t7E6YQl5MOHS9LiUyUcbNGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBI622lhYCJmzN6GaXOSMTnx3SbYXYMf8WOBYPK/VtBENdNhG/JSwZwNjZNIQk1qWBZB2JAUGmafvNNAHXy/XWhRDPkIxcGZcwh9TWM0X1MWj7prRcD0AaA5MYR91dbE9aU37ZCv6eLBqlf3jLPKSIHHuOnRySRjz00lea3UTgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNJ0/qnJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNJ0/qnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290B91F000C4;
	Fri, 16 Oct 2026 18:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792175569;
	bh=6LwKkw6JiWADx4dQHSfDhrnjy7tzT9p4DGXX9QqDqcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TNJ0/qnJinxwUTjCfdhmJTg2qMdG4PHqFScoLdKMqetSuFA2ghuejQdDhn7Smz++B
	 8ilxkfbgdNbynhzFwu8uV3hNIhmGvOD48o/e7EpnBGPfUe/6L2fH8JLtknGvsm5fQC
	 R9bYl9KCPxYJKT3FjHF+wKgDrhV73bWviVMw2Ggwwb5+Vy0A61ZMPGuir04KYUL5BW
	 Opp7QAN29gs5p5bto+knPyLJ6egy6W7/Pp4z8wfZvap8mkpb/LlwfW3xQF+fbZqZjm
	 5FCICqPoxXXAXRYfcgeS9790k6AaQUE6ab6Az8hESpqDBIirY+PC5UKwYWy0U8wdys
	 12IMEgv9ERfpQ==
Date: Fri, 16 Oct 2026 14:32:47 -0400
From: Sasha Levin <sashal@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dan Carpenter <error27@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v3 6/7] agents: add a skill to find other instances of a
 fixed bug
Message-ID: <atJtzzPVbe9p11zI@laps>
References: <20261016152828.3765695-1-sashal@kernel.org>
 <20261016152828.3765695-7-sashal@kernel.org>
 <957f530-7954-3e2c-9975-d369af37270@inria.fr>
 <atJoYRBujlGx0xTV@laps>
 <50531bd9-f3ea-2d45-7b3a-a96a446a8fcc@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <50531bd9-f3ea-2d45-7b3a-a96a446a8fcc@inria.fr>

On Fri, Oct 16, 2026 at 02:17:25PM -0400, Julia Lawall wrote:
>
>
>On Fri, 16 Oct 2026, Sasha Levin wrote:
>
>> On Fri, Oct 16, 2026 at 02:00:15PM -0400, Julia Lawall wrote:
>> >
>> >
>> > On Fri, 16 Oct 2026, Sasha Levin wrote:
>> >
>> > > A bug fixed in one place often exists elsewhere, in copied code, sibling
>> > > drivers, or other users of the same interface, and reviewers routinely
>> > > ask whether that was checked. Left alone, agents tend to audit the whole
>> > > tree by reading it. Add a skill that states the defect as a rule,
>> > > searches for it through shared interfaces, copied code, the introducing
>> > > series and earlier fixes, and verifies each candidate before reporting
>> > > it.
>> > >
>> > > When Coccinelle is available, the skill searches with a semantic patch:
>> > > it looks for an existing one under scripts/coccinelle/, checks that the
>> > > rule marks the fixed site in the code before the fix, runs it over the
>> > > whole tree with coccicheck, and checks which code spatch could not
>> > > parse. These steps live in references/coccinelle.md, which the agent
>> > > reads only when it uses Coccinelle.
>> >
>> > Could I get some feedback from this?  I would be interested to know about
>> > code that it can't parse.  Maybe AI could write a semantic patch and try
>> > it?
>>
>> Right, this is exactly what the skill currently says:
>>
>> +2. Otherwise, write a semantic patch outside the repository. Match only what
>> +   the defect needs, not names or statements specific to the fixed site. Mark
>> [...]
>>
>> I'd expect the agent to have information in the transcript about this, or are
>> you looking for something different?
>
>I just want to know how to find it, or ideally if it could be reported to
>me (or to the Coccinelle mailing list).

I can add an instruction to the prompt that any issues discovered and fixed
this way should also include the semantic patch?

-- 
Thanks,
Sasha
