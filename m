Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC44486436;
	Thu, 24 Sep 2026 16:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269037; cv=none; b=BsKd8ZG6a9Ol4qsmp7o/KfOWAxtipgozRX8JgCQQ/4O0Ro6e4FpaUKtfG/i7Rb9PBPk1nNjERNC0H4Aj1XNlS5W69zHLfbwMbOdm8NNDQ/T890dNhSdlQITmdI/9h8cs+vwtiGTBbofmf9eWSXwONEEBx8M2OqzeL/y0uhB5avQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269037; c=relaxed/simple;
	bh=bEBfQ+YMFW6+5aZbYKNv7yBRexfQ2EA/XyM7kGczzhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSd89uQ68rV/R8Hnx47vVA341E/TNMmSxvgFtSfZOPu6gAeVkysbX9tR/bVwFtyNY7eBc6ogHyuLVRxBFvnPFXRQd6YfyGNabGDbCR7u1qId1baDkD2YsXWOopdi84GjStP1EgZ3GqtvDdhuexPNcs0/NLQsCZvI3aAj5/pIvWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6YqljgF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6YqljgF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59511F000FF;
	Thu, 24 Sep 2026 16:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790269035;
	bh=t6RYgPyPHvnf3E0ok0hvTM3TfYuCfS4aedTPXF8X8wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F6YqljgFdAaDX8Cu3/Jf6a0CN9twAjKd4TYcdNwmsitu/hi7eayUFW8oHsuY8Xtdz
	 La9a7Z4+M59u9Qd4vL/ErtFOUSPyMWkTH4nvHn/w5f+lgmrVqwormSYGfEh83OoeCR
	 YTEzVvUi3U2S+EcZmYEMwClsovrJof+2DfF7rHxttbUONQVGOr+B/5z+lomdZjjwZg
	 8UrM3DXsn2tz42RB7E+440uEeP/UETB4lsVWGRMDJbO5HYaQhNtAmEq7vOBa742v75
	 2Lro8Rg1cZB3YVWzmmApQXyqm4HTr5GM/ZGXv+ehwsd6z85QO14+5QDXpIbspfq1yB
	 RSLsUcYI2+dCw==
Date: Thu, 24 Sep 2026 12:57:13 -0400
From: Sasha Levin <sashal@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rdunlap@infradead.org, skhan@linuxfoundation.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
Message-ID: <arVWaQM9pWNdU6EG@laps>
References: <20260924134945.3095661-1-sashal@kernel.org>
 <C1ABA2A9-E1BD-4A89-B5BC-59C06D807D0D@mainlining.org>
 <arU_r7Sl3gnTX6nG@laps>
 <F6362B07-0832-495D-BF92-6FAF06DC5E04@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <F6362B07-0832-495D-BF92-6FAF06DC5E04@mainlining.org>

On Thu, Sep 24, 2026 at 04:44:52PM +0100, Bradley Morgan wrote:
>On 24 September 2026 16:20:15 BST, Sasha Levin <sashal@kernel.org> wrote:
>>On Thu, Sep 24, 2026 at 04:08:08PM +0100, Bradley Morgan wrote:
>>> On 24 September 2026 14:49:45 BST, Sasha Levin <sashal@kernel.org>
>>wrote:
>>>> Most coding agents have standardized on AGENTS.md as the file they load
>>>> automatically from the root of a repository. README already tells AI
>>>> tools to read and follow Documentation/process/coding-assistants.rst,
>>>> but that only helps if the agent decides to read README before acting,
>>>> which in practice it often doesn't.
>>>>
>>>> Add a top-level AGENTS.md symlink to README, so agents load it on their
>>>> own and follow its pointer to the AI guidelines. This keeps a single
>>>> entry point for every reader, and avoids adding a separate copy of the
>>>> policy that could drift from the RST.
>>>>
>>>> As an example, two different agents were asked to "create a new commit
>>>> renaming the release (in the Makefile) to AI Test".
>>>>
>>>> Without AGENTS.md, the first agent added a Signed-off-by for the user
>>on
>>>> its own. It should never have done that: only the human submitter can
>>>> certify the Developer Certificate of Origin, after reviewing the
>>change.
>>>> It also used its own attribution tag instead of Assisted-by:
>>>>
>>>>> Makefile: rename release to AI Test
>>>>>
>>>>> Co-Authored-By: <model name> <noreply@...>
>>>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>>>
>>>> The second agent added no attribution at all:
>>>>
>>>>> Rename release to AI Test
>>>>
>>>> With AGENTS.md in place, neither agent added a Signed-off-by, and both
>>>> used the Assisted-by tag. README itself mentions neither tag, so both
>>>> agents followed its pointer to coding-assistants.rst:
>>>>
>>>>> Makefile: rename release to "AI Test"
>>>>>
>>>>> Change the release name from "Baby Opossum Posse" to "AI Test".
>>>>>
>>>>> Assisted-by: LLM
>>>>
>>>>> Makefile: rename release to AI Test
>>>>>
>>>>> Assisted-by: LLM
>>>>
>>>> Both agents also followed the kernel's general guidelines more closely.
>>>> The second agent's subject gained the "subsystem: summary phrase" form
>>>> that submitting-patches.rst asks for, instead of a bare "Rename release
>>>> to AI Test", and the first agent added a body describing the change.
>>>>
>>>> Assisted-by: LLM
>>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>>
>>> NAK, we could add to memories that to read soandso file before every
>>> patch, and then it wouldn't increase tokens then?
>>
>>Could you help me understand what you meant here? I'm aware some agents
>>use a
>>notion of "memories", but I don't think they standardized on it in any
>>way, nor
>>how we could incorporate them here?
>>
>
>They use MEMORY.md sometimes.

There's no common MEMORY.md. Claude Code keeps one per checkout under
~/.claude, Codex keeps a single one for all projects that it builds from past
sessions when its memories feature is enabled, and Gemini saves memories into
~/.gemini/GEMINI.md. All of these live in the user's home directory, so there's
nothing we can ship in the tree. AGENTS.md is the in-tree file most agents
read.

-- 
Thanks,
Sasha
