Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DC542AD83;
	Fri, 16 Oct 2026 18:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174179; cv=none; b=VE8f2wobBmUKZjTnVBbUr6ck7Ws2qBeg4r6i99Ds/YAT1co0OPeR1wiUtcoivoVxl8qz/1u/cgREAXDmwoKD3FyU2he6dQHeX01VAcT36pmuby8Q0Qo5EsXVkfj820D7nGGrHQC4iOnkibqwnGeYu6B3SruZMu7E8u/JdMKvOmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174179; c=relaxed/simple;
	bh=BwBb/iQhmwyFpIsWc1e0cRY+3DwDXxopYk9N0BxGy3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCaQp7h/8w5w9lK1RB62bQKgZ/1ru1kkmPRhXi/G3jt3lk4gm5Us80l0dO2TSKoCztwNRwHU+KwGsaPJPubhIBDzFkVEaZEpKorg9j4wy9Fr1ZSde6//xfaOW50TM3FF7X9R/NGou/EXArBZUfk9Myx/O1s/Qrr96r/u9UFyIHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfVvNugc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfVvNugc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6106D1F000C5;
	Fri, 16 Oct 2026 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792174178;
	bh=FUVAWKj9r4KOI5/GXEr1JrbHLpB7Le69t/ZWzFOTel4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mfVvNugcanwAcvAPHuTMfi6nQB0ozDdJD76KvDBfaJXBfirSxjqdwmLNsn0dppORr
	 nAb1A2OM/lRNOvFrgyHryb+nmihODqKfDwiKOS+kMgEa85BlehTG5Wz3hVV5zlnUcP
	 YfuatYv0ay5YyMAg10PVdgNOHnheM8bkp2NSsBVBTXEPgQX6RVOR9u8ueXioO9BcO6
	 b+ZKwawezMRG67ja5XilRay/xMpiMEbMaDRcxba1rUBVk3kLRbGWxPoTtESf4ci+YN
	 UMVLOw+7OtgeQ3CIoZtleAs5cdmfbxiAhL7nVefRtZAcaagRbGh2T+42ttlizdT8HQ
	 Z43OyfZq5zOTA==
Date: Fri, 16 Oct 2026 14:09:37 -0400
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
Message-ID: <atJoYRBujlGx0xTV@laps>
References: <20261016152828.3765695-1-sashal@kernel.org>
 <20261016152828.3765695-7-sashal@kernel.org>
 <957f530-7954-3e2c-9975-d369af37270@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <957f530-7954-3e2c-9975-d369af37270@inria.fr>

On Fri, Oct 16, 2026 at 02:00:15PM -0400, Julia Lawall wrote:
>
>
>On Fri, 16 Oct 2026, Sasha Levin wrote:
>
>> A bug fixed in one place often exists elsewhere, in copied code, sibling
>> drivers, or other users of the same interface, and reviewers routinely
>> ask whether that was checked. Left alone, agents tend to audit the whole
>> tree by reading it. Add a skill that states the defect as a rule,
>> searches for it through shared interfaces, copied code, the introducing
>> series and earlier fixes, and verifies each candidate before reporting
>> it.
>>
>> When Coccinelle is available, the skill searches with a semantic patch:
>> it looks for an existing one under scripts/coccinelle/, checks that the
>> rule marks the fixed site in the code before the fix, runs it over the
>> whole tree with coccicheck, and checks which code spatch could not
>> parse. These steps live in references/coccinelle.md, which the agent
>> reads only when it uses Coccinelle.
>
>Could I get some feedback from this?  I would be interested to know about
>code that it can't parse.  Maybe AI could write a semantic patch and try
>it?

Right, this is exactly what the skill currently says:

+2. Otherwise, write a semantic patch outside the repository. Match only what
+   the defect needs, not names or statements specific to the fixed site. Mark
[...]

I'd expect the agent to have information in the transcript about this, or are
you looking for something different?

-- 
Thanks,
Sasha
