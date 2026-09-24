Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055C0348C7D;
	Thu, 24 Sep 2026 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264700; cv=none; b=Q+5s4Mmp9Rv+J+3b4G69cuweNHKz44IRqeBVcXWgN1qKyT+41yIA7JRC2ImGxYuRsEiKiREs03DEEdEdLGZYepwP/HVhVI/s5WOFN/HBHlaDY5dIanbxJC+qLO/B9Xl9CAXjQNllQax/wRzTvyNYQpTfMvg9656XaNyj7MJU9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264700; c=relaxed/simple;
	bh=/h6FDCqEvu2VcdIuCvaYqPR84F3tAsFoiRPMwYVYuD8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=T2c55uaJ3qezAMCtSrq4hNTLqNTvuy/ee42I9b0F8vopScB996SmcxPjubLyc29C6s6JLmUHbDxDcZ9uzHwlzkFynuWB6qROxhIQFp6GYuWygJE5KDgFIhk0x72Alz0WFX+4uJrort1IIC9lX/XluH3XiKJidBwABI5u71kbXko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=PLOicbZc; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=f05ZGD3L; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="PLOicbZc";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="f05ZGD3L"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790264690; bh=YebRGxiOOFdyOaA1jNvEHuU
	n5lpo0MnD1Vo5lFRxTwk=; b=PLOicbZcRRZLFULfhrnocmrz+Ns8EE+lwePeB+YtE6knaTCjZi
	f13trMXBWP+metR6HkrMnC4YfyT4Oi37DkgE4NWztMvvZTQAwrrx0ZoSSLdcPYR8G5Equis0zfD
	ySIQADorhzttM/rKJCQYOlt+u2gCHCLohrIUeSo9yDLfrE9fmVxoo2p9UkvTAcxhkc7O7RZL/13
	5D00akbfcJOgAMIkLTSYg1hLemyeeSUG7GpT7zgdVI3sfDD/c1BViUzoTnXVKiuaIm34u2aPyaA
	Dc0r5KvkvTVVGHUcUzOJ5TKYFpX3YmEMTA3jhYp4liwseX51FbmdzvnAz6/hTKsfeKg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790264690; bh=YebRGxiOOFdyOaA1jNvEHuU
	n5lpo0MnD1Vo5lFRxTwk=; b=f05ZGD3LEsFLDi+b5ZR+E643VUsXO6LjGwWcujHxs74btemuQi
	TFDb1DJbTzTU+0AMx07RqY+sZOEIf+zKleBQ==;
Date: Thu, 24 Sep 2026 16:44:52 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Sasha Levin <sashal@kernel.org>
CC: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
In-Reply-To: <arU_r7Sl3gnTX6nG@laps>
References: <20260924134945.3095661-1-sashal@kernel.org> <C1ABA2A9-E1BD-4A89-B5BC-59C06D807D0D@mainlining.org> <arU_r7Sl3gnTX6nG@laps>
Message-ID: <F6362B07-0832-495D-BF92-6FAF06DC5E04@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 24 September 2026 16:20:15 BST, Sasha Levin <sashal@kernel.org> wrote:
>On Thu, Sep 24, 2026 at 04:08:08PM +0100, Bradley Morgan wrote:
>> On 24 September 2026 14:49:45 BST, Sasha Levin <sashal@kernel.org>
>wrote:
>>> Most coding agents have standardized on AGENTS.md as the file they load
>>> automatically from the root of a repository. README already tells AI
>>> tools to read and follow Documentation/process/coding-assistants.rst,
>>> but that only helps if the agent decides to read README before acting,
>>> which in practice it often doesn't.
>>> 
>>> Add a top-level AGENTS.md symlink to README, so agents load it on their
>>> own and follow its pointer to the AI guidelines. This keeps a single
>>> entry point for every reader, and avoids adding a separate copy of the
>>> policy that could drift from the RST.
>>> 
>>> As an example, two different agents were asked to "create a new commit
>>> renaming the release (in the Makefile) to AI Test".
>>> 
>>> Without AGENTS.md, the first agent added a Signed-off-by for the user
>on
>>> its own. It should never have done that: only the human submitter can
>>> certify the Developer Certificate of Origin, after reviewing the
>change.
>>> It also used its own attribution tag instead of Assisted-by:
>>> 
>>>> Makefile: rename release to AI Test
>>>> 
>>>> Co-Authored-By: <model name> <noreply@...>
>>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>> 
>>> The second agent added no attribution at all:
>>> 
>>>> Rename release to AI Test
>>> 
>>> With AGENTS.md in place, neither agent added a Signed-off-by, and both
>>> used the Assisted-by tag. README itself mentions neither tag, so both
>>> agents followed its pointer to coding-assistants.rst:
>>> 
>>>> Makefile: rename release to "AI Test"
>>>> 
>>>> Change the release name from "Baby Opossum Posse" to "AI Test".
>>>> 
>>>> Assisted-by: LLM
>>> 
>>>> Makefile: rename release to AI Test
>>>> 
>>>> Assisted-by: LLM
>>> 
>>> Both agents also followed the kernel's general guidelines more closely.
>>> The second agent's subject gained the "subsystem: summary phrase" form
>>> that submitting-patches.rst asks for, instead of a bare "Rename release
>>> to AI Test", and the first agent added a body describing the change.
>>> 
>>> Assisted-by: LLM
>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> 
>> NAK, we could add to memories that to read soandso file before every
>> patch, and then it wouldn't increase tokens then?
>
>Could you help me understand what you meant here? I'm aware some agents
>use a
>notion of "memories", but I don't think they standardized on it in any
>way, nor
>how we could incorporate them here?
>

They use MEMORY.md sometimes.


>And as far as I'm aware, nothing is free here - those "memories" still use
>tokens.

Not as much.



>
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
